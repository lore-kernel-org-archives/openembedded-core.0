Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 57FA372F8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875761"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:49 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:38 +0200
Message-Id: <77479665cbd63ef1a7bf30b7b019a19067ad1021.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 21/39] rootfs_rpm.bbclass: migrate image creation to dnf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2017 14:48:57 -0000

To properly look at this patch, you probably need a side-by-side diff viewing tool.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |   21 +-
 meta/lib/oe/package_manager.py  | 1189 +++++++--------------------------------
 meta/lib/oe/rootfs.py           |   18 +-
 meta/lib/oe/sdk.py              |    7 +-
 4 files changed, 233 insertions(+), 1002 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index b8ff4cb7b6a..65881a60a7b 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -2,20 +2,23 @@
 # Creates a root filesystem out of rpm packages
 #
 
-ROOTFS_PKGMANAGE = "rpm smartpm"
+ROOTFS_PKGMANAGE = "rpm dnf"
 ROOTFS_PKGMANAGE_BOOTSTRAP = "run-postinsts"
 
-# Add 100Meg of extra space for Smart
-IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "smartpm", " + 102400", "" ,d)}"
+# dnf is using our custom distutils, and so will fail without these
+export STAGING_INCDIR
+export STAGING_LIBDIR
 
-# Smart is python based, so be sure python-native is available to us.
+# Add 100Meg of extra space for dnf
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "dnf", " + 102400", "" ,d)}"
+
+# Dnf is python based, so be sure python-native is available to us.
 EXTRANATIVEPATH += "python-native"
 
 # opkg is needed for update-alternatives
 RPMROOTFSDEPENDS = "rpm-native:do_populate_sysroot \
-    rpmresolve-native:do_populate_sysroot \
-    python-smartpm-native:do_populate_sysroot \
-    createrepo-native:do_populate_sysroot \
+    dnf-native:do_populate_sysroot \
+    createrepo-c-native:do_populate_sysroot \
     opkg-native:do_populate_sysroot"
 
 do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
@@ -35,7 +38,3 @@ python () {
         d.setVar('RPM_POSTPROCESS_COMMANDS', '')
 
 }
-# Smart is python based, so be sure python-native is available to us.
-EXTRANATIVEPATH += "python-native"
-
-rpmlibdir = "/var/lib/rpm"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 725997ce334..49d7fca2314 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -102,109 +102,14 @@ class Indexer(object, metaclass=ABCMeta):
 
 
 class RpmIndexer(Indexer):
-    def get_ml_prefix_and_os_list(self, arch_var=None, os_var=None):
-        package_archs = collections.OrderedDict()
-        target_os = collections.OrderedDict()
-
-        if arch_var is not None and os_var is not None:
-            package_archs['default'] = self.d.getVar(arch_var).split()
-            package_archs['default'].reverse()
-            target_os['default'] = self.d.getVar(os_var).strip()
-        else:
-            package_archs['default'] = self.d.getVar("PACKAGE_ARCHS").split()
-            # arch order is reversed.  This ensures the -best- match is
-            # listed first!
-            package_archs['default'].reverse()
-            target_os['default'] = self.d.getVar("TARGET_OS").strip()
-            multilibs = self.d.getVar('MULTILIBS') or ""
-            for ext in multilibs.split():
-                eext = ext.split(':')
-                if len(eext) > 1 and eext[0] == 'multilib':
-                    localdata = bb.data.createCopy(self.d)
-                    default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
-                    default_tune = localdata.getVar(default_tune_key, False)
-                    if default_tune is None:
-                        default_tune_key = "DEFAULTTUNE_ML_" + eext[1]
-                        default_tune = localdata.getVar(default_tune_key, False)
-                    if default_tune:
-                        localdata.setVar("DEFAULTTUNE", default_tune)
-                        package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS').split()
-                        package_archs[eext[1]].reverse()
-                        target_os[eext[1]] = localdata.getVar("TARGET_OS").strip()
-
-        ml_prefix_list = collections.OrderedDict()
-        for mlib in package_archs:
-            if mlib == 'default':
-                ml_prefix_list[mlib] = package_archs[mlib]
-            else:
-                ml_prefix_list[mlib] = list()
-                for arch in package_archs[mlib]:
-                    if arch in ['all', 'noarch', 'any']:
-                        ml_prefix_list[mlib].append(arch)
-                    else:
-                        ml_prefix_list[mlib].append(mlib + "_" + arch)
-
-        return (ml_prefix_list, target_os)
-
     def write_index(self):
-        sdk_pkg_archs = (self.d.getVar('SDK_PACKAGE_ARCHS') or "").replace('-', '_').split()
-        all_mlb_pkg_archs = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").replace('-', '_').split()
-
-        mlb_prefix_list = self.get_ml_prefix_and_os_list()[0]
-
-        archs = set()
-        for item in mlb_prefix_list:
-            archs = archs.union(set(i.replace('-', '_') for i in mlb_prefix_list[item]))
-
-        if len(archs) == 0:
-            archs = archs.union(set(all_mlb_pkg_archs))
-
-        archs = archs.union(set(sdk_pkg_archs))
-
-        rpm_createrepo = bb.utils.which(os.environ['PATH'], "createrepo")
-        if not rpm_createrepo:
-            bb.error("Cannot rebuild index as createrepo was not found in %s" % os.environ['PATH'])
-            return
-
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
-        else:
-            signer = None
-        index_cmds = []
-        repomd_files = []
-        rpm_dirs_found = False
-        for arch in archs:
-            dbpath = os.path.join(self.d.getVar('WORKDIR'), 'rpmdb', arch)
-            if os.path.exists(dbpath):
-                bb.utils.remove(dbpath, True)
-            arch_dir = os.path.join(self.deploy_dir, arch)
-            if not os.path.isdir(arch_dir):
-                continue
-
-            index_cmds.append("%s --dbpath %s --update -q %s" % \
-                             (rpm_createrepo, dbpath, arch_dir))
-            repomd_files.append(os.path.join(arch_dir, 'repodata', 'repomd.xml'))
-
-            rpm_dirs_found = True
-
-        if not rpm_dirs_found:
-            bb.note("There are no packages in %s" % self.deploy_dir)
-            return
+            raise NotImplementedError('Package feed signing not yet implementd for rpm')
 
-        # Create repodata
-        result = oe.utils.multiprocess_exec(index_cmds, create_index)
+        createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
+        result = create_index("%s --update -q %s" % (createrepo_c, self.deploy_dir))
         if result:
-            bb.fatal('%s' % ('\n'.join(result)))
-        # Sign repomd
-        if signer:
-            for repomd in repomd_files:
-                feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
-                is_ascii_sig = (feed_sig_type.upper() != "BIN")
-                signer.detach_sign(repomd,
-                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
-                                   armor=is_ascii_sig)
-
+            bb.fatal(result)
 
 class OpkgIndexer(Indexer):
     def write_index(self):
@@ -347,117 +252,9 @@ class PkgsList(object, metaclass=ABCMeta):
     def list_pkgs(self):
         pass
 
-
 class RpmPkgsList(PkgsList):
-    def __init__(self, d, rootfs_dir, arch_var=None, os_var=None):
-        super(RpmPkgsList, self).__init__(d, rootfs_dir)
-
-        self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
-
-        self.ml_prefix_list, self.ml_os_list = \
-            RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
-
-        # Determine rpm version
-        try:
-            output = subprocess.check_output([self.rpm_cmd, "--version"], stderr=subprocess.STDOUT).decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Getting rpm version failed. Command '%s' "
-                     "returned %d:\n%s" % (self.rpm_cmd, e.returncode, e.output.decode("utf-8")))
-
-    '''
-    Translate the RPM/Smart format names to the OE multilib format names
-    '''
-    def _pkg_translate_smart_to_oe(self, pkg, arch):
-        new_pkg = pkg
-        new_arch = arch
-        fixed_arch = arch.replace('_', '-')
-        found = 0
-        for mlib in self.ml_prefix_list:
-            for cmp_arch in self.ml_prefix_list[mlib]:
-                fixed_cmp_arch = cmp_arch.replace('_', '-')
-                if fixed_arch == fixed_cmp_arch:
-                    if mlib == 'default':
-                        new_pkg = pkg
-                        new_arch = cmp_arch
-                    else:
-                        new_pkg = mlib + '-' + pkg
-                        # We need to strip off the ${mlib}_ prefix on the arch
-                        new_arch = cmp_arch.replace(mlib + '_', '')
-
-                    # Workaround for bug 3565. Simply look to see if we
-                    # know of a package with that name, if not try again!
-                    filename = os.path.join(self.d.getVar('PKGDATA_DIR'),
-                                            'runtime-reverse',
-                                            new_pkg)
-                    if os.path.exists(filename):
-                        found = 1
-                        break
-
-            if found == 1 and fixed_arch == fixed_cmp_arch:
-                break
-        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
-        return new_pkg, new_arch
-
-    def _list_pkg_deps(self):
-        cmd = [bb.utils.which(os.getenv('PATH'), "rpmresolve"),
-               "-t", self.image_rpmlib]
-
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the package dependencies. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-
-        return output
-
     def list_pkgs(self):
-        cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
-        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
-        cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'])
-
-        try:
-            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-
-        output = dict()
-        deps = dict()
-        dependencies = self._list_pkg_deps()
-
-        # Populate deps dictionary for better manipulation
-        for line in dependencies.splitlines():
-            try:
-                pkg, dep = line.split("|")
-                if not pkg in deps:
-                    deps[pkg] = list()
-                if not dep in deps[pkg]:
-                    deps[pkg].append(dep)
-            except:
-                # Ignore any other lines they're debug or errors
-                pass
-
-        for line in tmp_output.split('\n'):
-            if len(line.strip()) == 0:
-                continue
-            pkg = line.split()[0]
-            arch = line.split()[1]
-            ver = line.split()[2]
-            dep = deps.get(pkg, [])
-
-            # Skip GPG keys
-            if pkg == 'gpg-pubkey':
-                continue
-
-            pkgorigin = line.split()[3]
-            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
-
-            output[new_pkg] = {"arch":new_arch, "ver":ver,
-                        "filename":pkgorigin, "deps":dep}
-
-        return output
-
+        return RpmPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR')).list_installed()
 
 class OpkgPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, config_file):
@@ -553,6 +350,16 @@ class PackageManager(object, metaclass=ABCMeta):
         pass
 
     """
+    Returns the path to a tmpdir where resides the contents of a package.
+
+    Deleting the tmpdir is responsability of the caller.
+
+    """
+    @abstractmethod
+    def extract(self, pkg):
+        pass
+
+    """
     Add remote package feeds into repository manager configuration. The parameters
     for the feeds are set by feed_uris, feed_base_paths and feed_archs.
     See http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGE_FEED_URIS
@@ -661,821 +468,255 @@ class RpmPM(PackageManager):
         self.target_rootfs = target_rootfs
         self.target_vendor = target_vendor
         self.task_name = task_name
-        self.providename = providename
-        self.fullpkglist = list()
-        self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM')
-        self.etcrpm_dir = os.path.join(self.target_rootfs, "etc/rpm")
-        self.install_dir_name = "oe_install"
-        self.install_dir_path = os.path.join(self.target_rootfs, self.install_dir_name)
-        self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
-        # 0 = --log-level=warning, only warnings
-        # 1 = --log-level=info (includes information about executing scriptlets and their output), default
-        # 2 = --log-level=debug
-        # 3 = --log-level=debug plus dumps of scriplet content and command invocation
-        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "1")
-        self.smart_opt = ["--log-level=%s" %
-                         ("warning" if self.debug_level == 0 else
-                          "info" if self.debug_level == 1 else
-                          "debug"), "--data-dir=%s" %
-                          os.path.join(target_rootfs, 'var/lib/smart')]
-        self.scriptlet_wrapper = self.d.expand('${WORKDIR}/scriptlet_wrapper')
+        if arch_var == None:
+            self.archs = self.d.getVar('PACKAGE_ARCHS').replace("-","_")
+        else:
+            self.archs = self.d.getVar(arch_var).replace("-","_")
+        if task_name == "host":
+            self.primary_arch = self.d.getVar('SDK_ARCH')
+        else:
+            self.primary_arch = self.d.getVar('MACHINE_ARCH')
+
+        self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), "oe-rootfs-repo")
+        bb.utils.mkdirhier(self.rpm_repo_dir)
+        oe.path.symlink(self.d.getVar('DEPLOY_DIR_RPM'), oe.path.join(self.rpm_repo_dir, "rpm"), True)
+
+        self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
+        if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
+            bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
+        self.packaging_data_dirs = ['var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
-        self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
-        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
-
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
-        packageindex_dir = os.path.join(self.d.getVar('WORKDIR'), 'rpms')
-        self.indexer = RpmIndexer(self.d, packageindex_dir)
-        self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var)
-
-        self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
-
-    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
-        if feed_uris == "":
-            return
-
-        arch_list = []
-        if feed_archs is not None:
-            # User define feed architectures
-            arch_list = feed_archs.split()
-        else:
-            # List must be prefered to least preferred order
-            default_platform_extra = list()
-            platform_extra = list()
-            bbextendvariant = self.d.getVar('BBEXTENDVARIANT') or ""
-            for mlib in self.ml_os_list:
-                for arch in self.ml_prefix_list[mlib]:
-                    plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
-                    if mlib == bbextendvariant:
-                        if plt not in default_platform_extra:
-                            default_platform_extra.append(plt)
-                    else:
-                        if plt not in platform_extra:
-                            platform_extra.append(plt)
-            platform_extra = default_platform_extra + platform_extra
-
-            for canonical_arch in platform_extra:
-                arch = canonical_arch.split('-')[0]
-                if not os.path.exists(os.path.join(self.deploy_dir, arch)):
-                    continue
-                arch_list.append(arch)
+    def _configure_dnf(self):
+        # libsolv handles 'noarch' internally, we don't need to specify it explicitly
+        archs = [i for i in self.archs.split() if i not in ["any", "all", "noarch"]]
+        # This prevents accidental matching against libsolv's built-in policies
+        if len(archs) <= 1:
+            archs = archs + ["bogusarch"]
+        archconfdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
+        bb.utils.mkdirhier(archconfdir)
+        open(archconfdir + "arch", 'w').write(":".join(archs))
+
+        open(oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"), 'w').write("")
+
+
+    def _configure_rpm(self):
+        # We need to configure rpm to use our primary package architecture as the installation architecture,
+        # and to make it compatible with other package architectures that we use.
+        # Otherwise it will refuse to proceed with packages installation.
+        platformconfdir = "%s/%s" %(self.target_rootfs, "etc/rpm/")
+        rpmrcconfdir = "%s/%s" %(self.target_rootfs, "etc/")
+        bb.utils.mkdirhier(platformconfdir)
+        open(platformconfdir + "platform", 'w').write("%s-pc-linux" % self.primary_arch)
+        open(rpmrcconfdir + "rpmrc", 'w').write("arch_compat: %s: %s" % (self.primary_arch, self.archs if len(self.archs) > 0 else self.primary_arch))
 
-        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
+        if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
+            raise NotImplementedError("Signature verification with rpm not yet supported.")
 
-        uri_iterator = 0
-        channel_priority = 10 + 5 * len(feed_uris) * (len(arch_list) if arch_list else 1)
-
-        for uri in feed_uris:
-            if arch_list:
-                for arch in arch_list:
-                    bb.note('Adding Smart channel url%d%s (%s)' %
-                            (uri_iterator, arch, channel_priority))
-                    self._invoke_smart(['channel', '--add', 'url%d-%s' % (uri_iterator, arch),
-                        'type=rpm-md', 'baseurl=%s/%s' % (uri, arch), '-y'])
-                    self._invoke_smart(['channel', '--set', 'url%d-%s' % (uri_iterator, arch),
-                        'priority=%d' % channel_priority])
-                    channel_priority -= 5
-            else:
-                bb.note('Adding Smart channel url%d (%s)' %
-                        (uri_iterator, channel_priority))
-                self._invoke_smart(['channel', '--add', 'url%d' % uri_iterator,
-                    'type=rpm-md', 'baseurl=%s' % uri, '-y'])
-                self._invoke_smart(['channel', '--set', 'url%d' % uri_iterator, 
-                    'priority=%d' % channel_priority])
-                channel_priority -= 5
-
-            uri_iterator += 1
+        if self.d.getVar('RPM_PREFER_ELF_ARCH'):
+            raise NotImplementedError("RPM_PREFER_ELF_ARCH not yet checked/tested/implemented with rpm4/dnf.")
 
-    '''
-    Create configs for rpm and smart, and multilib is supported
-    '''
     def create_configs(self):
-        target_arch = self.d.getVar('TARGET_ARCH')
-        platform = '%s%s-%s' % (target_arch.replace('-', '_'),
-                                self.target_vendor,
-                                self.ml_os_list['default'])
-
-        # List must be prefered to least preferred order
-        default_platform_extra = list()
-        platform_extra = list()
-        bbextendvariant = self.d.getVar('BBEXTENDVARIANT') or ""
-        for mlib in self.ml_os_list:
-            for arch in self.ml_prefix_list[mlib]:
-                plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
-                if mlib == bbextendvariant:
-                    if plt not in default_platform_extra:
-                        default_platform_extra.append(plt)
-                else:
-                    if plt not in platform_extra:
-                        platform_extra.append(plt)
-        platform_extra = default_platform_extra + platform_extra
+        self._configure_dnf()
+        self._configure_rpm()
 
-        self._create_configs(platform, platform_extra)
-
-    #takes array args
-    def _invoke_smart(self, args):
-        cmd = [self.smart_cmd] + self.smart_opt + args
-        # bb.note(cmd)
-        try:
-            complementary_pkgs = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
-            # bb.note(complementary_pkgs)
-            return complementary_pkgs
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Could not invoke smart. Command "
-                     "'%s' returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+    def write_index(self):
+        lockfilename = self.d.getVar('DEPLOY_DIR_RPM') + "/rpm.lock"
+        lf = bb.utils.lockfile(lockfilename, False)
+        RpmIndexer(self.d, self.rpm_repo_dir).write_index()
+        bb.utils.unlockfile(lf)
 
-    def _search_pkg_name_in_feeds(self, pkg, feed_archs):
-        for arch in feed_archs:
-            arch = arch.replace('-', '_')
-            regex_match = re.compile(r"^%s-[^-]*-[^-]*@%s$" % \
-                (re.escape(pkg), re.escape(arch)))
-            for p in self.fullpkglist:
-                if regex_match.match(p) is not None:
-                    # First found is best match
-                    # bb.note('%s -> %s' % (pkg, pkg + '@' + arch))
-                    return pkg + '@' + arch
-
-        # Search provides if not found by pkgname.
-        bb.note('Not found %s by name, searching provides ...' % pkg)
-        cmd = [self.smart_cmd] + self.smart_opt + ["query", "--provides", pkg,
-                "--show-format=$name-$version"]
-        bb.note('cmd: %s' % ' '.join(cmd))
-        ps = subprocess.Popen(cmd, stdout=subprocess.PIPE)
-        try:
-            output = subprocess.check_output(["sed", "-ne", "s/ *Provides://p"],
-                stdin=ps.stdout, stderr=subprocess.STDOUT).decode("utf-8")
-            # Found a provider
-            if output:
-                bb.note('Found providers for %s: %s' % (pkg, output))
-                for p in output.split():
-                    for arch in feed_archs:
-                        arch = arch.replace('-', '_')
-                        if p.rstrip().endswith('@' + arch):
-                            return p
-        except subprocess.CalledProcessError as e:
-            bb.error("Failed running smart query on package %s." % pkg)
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        if feed_uris == "":
+            return
 
-        return ""
+        raise NotImplementedError("Adding remote dnf feeds not yet supported.")
 
-    '''
-    Translate the OE multilib format names to the RPM/Smart format names
-    It searched the RPM/Smart format names in probable multilib feeds first,
-    and then searched the default base feed.
-    '''
-    def _pkg_translate_oe_to_smart(self, pkgs, attempt_only=False):
-        new_pkgs = list()
-
-        for pkg in pkgs:
-            new_pkg = pkg
-            # Search new_pkg in probable multilibs first
-            for mlib in self.ml_prefix_list:
-                # Jump the default archs
-                if mlib == 'default':
-                    continue
-
-                subst = pkg.replace(mlib + '-', '')
-                # if the pkg in this multilib feed
-                if subst != pkg:
-                    feed_archs = self.ml_prefix_list[mlib]
-                    new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs)
-                    if not new_pkg:
-                        # Failed to translate, package not found!
-                        err_msg = '%s not found in the %s feeds (%s) in %s.' % \
-                                  (pkg, mlib, " ".join(feed_archs), self.d.getVar('DEPLOY_DIR_RPM'))
-                        if not attempt_only:
-                            bb.error(err_msg)
-                            bb.fatal("This is often caused by an empty package declared " \
-                                     "in a recipe's PACKAGES variable. (Empty packages are " \
-                                     "not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)")
-                        bb.warn(err_msg)
-                    else:
-                        new_pkgs.append(new_pkg)
-
-                    break
-
-            # Apparently not a multilib package...
-            if pkg == new_pkg:
-                # Search new_pkg in default archs
-                default_archs = self.ml_prefix_list['default']
-                new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs)
-                if not new_pkg:
-                    err_msg = '%s not found in the feeds (%s) in %s.' % \
-                                  (pkg, " ".join(default_archs), self.d.getVar('DEPLOY_DIR_RPM'))
-                    if not attempt_only:
-                        bb.error(err_msg)
-                        bb.fatal("This is often caused by an empty package declared " \
-                                 "in a recipe's PACKAGES variable. (Empty packages are " \
-                                 "not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)")
-                    bb.warn(err_msg)
-                else:
-                    new_pkgs.append(new_pkg)
-
-        return new_pkgs
-
-    def _create_configs(self, platform, platform_extra):
-        # Setup base system configuration
-        bb.note("configuring RPM platform settings")
-
-        # Configure internal RPM environment when using Smart
-        os.environ['RPM_ETCRPM'] = self.etcrpm_dir
-        bb.utils.mkdirhier(self.etcrpm_dir)
-
-        # Setup temporary directory -- install...
-        if os.path.exists(self.install_dir_path):
-            bb.utils.remove(self.install_dir_path, True)
-        bb.utils.mkdirhier(os.path.join(self.install_dir_path, 'tmp'))
-
-        channel_priority = 5
-        platform_dir = os.path.join(self.etcrpm_dir, "platform")
-        sdkos = self.d.getVar("SDK_OS")
-        with open(platform_dir, "w+") as platform_fd:
-            platform_fd.write(platform + '\n')
-            for pt in platform_extra:
-                channel_priority += 5
-                if sdkos:
-                    tmp = re.sub("-%s$" % sdkos, "-%s\n" % sdkos, pt)
-                tmp = re.sub("-linux.*$", "-linux.*\n", tmp)
-                platform_fd.write(tmp)
-
-        # Tell RPM that the "/" directory exist and is available
-        bb.note("configuring RPM system provides")
-        sysinfo_dir = os.path.join(self.etcrpm_dir, "sysinfo")
-        bb.utils.mkdirhier(sysinfo_dir)
-        with open(os.path.join(sysinfo_dir, "Dirnames"), "w+") as dirnames:
-            dirnames.write("/\n")
-
-        if self.providename:
-            providename_dir = os.path.join(sysinfo_dir, "Providename")
-            if not os.path.exists(providename_dir):
-                providename_content = '\n'.join(self.providename)
-                providename_content += '\n'
-                open(providename_dir, "w+").write(providename_content)
-
-        # Configure RPM... we enforce these settings!
-        bb.note("configuring RPM DB settings")
-        # After change the __db.* cache size, log file will not be
-        # generated automatically, that will raise some warnings,
-        # so touch a bare log for rpm write into it.
-        rpmlib_log = os.path.join(self.image_rpmlib, 'log', 'log.0000000001')
-        if not os.path.exists(rpmlib_log):
-            bb.utils.mkdirhier(os.path.join(self.image_rpmlib, 'log'))
-            open(rpmlib_log, 'w+').close()
-
-        DB_CONFIG_CONTENT = "# ================ Environment\n" \
-            "set_data_dir .\n" \
-            "set_create_dir .\n" \
-            "set_lg_dir ./log\n" \
-            "set_tmp_dir ./tmp\n" \
-            "set_flags db_log_autoremove on\n" \
-            "\n" \
-            "# -- thread_count must be >= 8\n" \
-            "set_thread_count 64\n" \
-            "\n" \
-            "# ================ Logging\n" \
-            "\n" \
-            "# ================ Memory Pool\n" \
-            "set_cachesize 0 1048576 0\n" \
-            "set_mp_mmapsize 268435456\n" \
-            "\n" \
-            "# ================ Locking\n" \
-            "set_lk_max_locks 16384\n" \
-            "set_lk_max_lockers 16384\n" \
-            "set_lk_max_objects 16384\n" \
-            "mutex_set_max 163840\n" \
-            "\n" \
-            "# ================ Replication\n"
-
-        db_config_dir = os.path.join(self.image_rpmlib, 'DB_CONFIG')
-        if not os.path.exists(db_config_dir):
-            open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
-
-        # Create database so that smart doesn't complain (lazy init)
-        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '-qa']
-        try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Create rpm database failed. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-        # Import GPG key to RPM database of the target system
-        if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
-            pubkey_path = self.d.getVar('RPM_GPG_PUBKEY')
-            cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '--import', pubkey_path]
-            try:
-                subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            except subprocess.CalledProcessError as e:
-                bb.fatal("Import GPG key failed. Command '%s' "
-                        "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-
-
-        # Configure smart
-        bb.note("configuring Smart settings")
-        bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
-                        True)
-        self._invoke_smart(['config', '--set', 'rpm-root=%s' % self.target_rootfs])
-        self._invoke_smart(['config', '--set', 'rpm-dbpath=/var/lib/rpm'])
-        self._invoke_smart(['config', '--set', 'rpm-extra-macros._var=%s' %
-                           self.d.getVar('localstatedir')])
-        cmd = ["config", "--set", "rpm-extra-macros._tmppath=/%s/tmp" % self.install_dir_name]
-
-        prefer_color = self.d.getVar('RPM_PREFER_ELF_ARCH')
-        if prefer_color:
-            if prefer_color not in ['0', '1', '2', '4']:
-                bb.fatal("Invalid RPM_PREFER_ELF_ARCH: %s, it should be one of:\n"
-                        "\t1: ELF32 wins\n"
-                        "\t2: ELF64 wins\n"
-                        "\t4: ELF64 N32 wins (mips64 or mips64el only)" %
-                        prefer_color)
-            if prefer_color == "4" and self.d.getVar("TUNE_ARCH") not in \
-                                    ['mips64', 'mips64el']:
-                bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips64 or mips64el "
-                         "only.")
-            self._invoke_smart(['config', '--set', 'rpm-extra-macros._prefer_color=%s'
-                        % prefer_color])
-
-        self._invoke_smart(cmd)
-        self._invoke_smart(['config', '--set', 'rpm-ignoresize=1'])
-
-        # Write common configuration for host and target usage
-        self._invoke_smart(['config', '--set', 'rpm-nolinktos=1'])
-        self._invoke_smart(['config', '--set', 'rpm-noparentdirs=1'])
-        check_signature = self.d.getVar('RPM_CHECK_SIGNATURES')
-        if check_signature and check_signature.strip() == "0":
-            self._invoke_smart(['config', '--set rpm-check-signatures=false'])
-        for i in self.d.getVar('BAD_RECOMMENDATIONS').split():
-            self._invoke_smart(['flag', '--set', 'ignore-recommends', i])
-
-        # Do the following configurations here, to avoid them being
-        # saved for field upgrade
-        if self.d.getVar('NO_RECOMMENDATIONS').strip() == "1":
-            self._invoke_smart(['config', '--set', 'ignore-all-recommends=1'])
-        pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE') or ""
-        for i in pkg_exclude.split():
-            self._invoke_smart(['flag', '--set', 'exclude-packages', i])
-
-        # Optional debugging
-        # self._invoke_smart(['config', '--set', 'rpm-log-level=debug'])
-        # cmd = ['config', '--set', 'rpm-log-file=/tmp/smart-debug-logfile']
-        # self._invoke_smart(cmd)
-        ch_already_added = []
-        for canonical_arch in platform_extra:
-            arch = canonical_arch.split('-')[0]
-            arch_channel = os.path.join(self.d.getVar('WORKDIR'), 'rpms', arch)
-            oe.path.remove(arch_channel)
-            deploy_arch_dir = os.path.join(self.deploy_dir, arch)
-            if not os.path.exists(deploy_arch_dir):
-                    continue
+    def _prepare_pkg_transaction(self):
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['INTERCEPT_DIR'] = oe.path.join(self.d.getVar('WORKDIR'),
+                                                   "intercept_scripts")
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
-            lockfilename = self.d.getVar('DEPLOY_DIR_RPM') + "/rpm.lock"
-            lf = bb.utils.lockfile(lockfilename, False)
-            oe.path.copyhardlinktree(deploy_arch_dir, arch_channel)
-            bb.utils.unlockfile(lf)
-
-            if not arch in ch_already_added:
-                bb.note('Adding Smart channel %s (%s)' %
-                        (arch, channel_priority))
-                self._invoke_smart(['channel', '--add', arch, 'type=rpm-md',
-                    'baseurl=%s' % arch_channel, '-y'])
-                self._invoke_smart(['channel', '--set', arch, 'priority=%d' %
-                                   channel_priority])
-                channel_priority -= 5
-
-                ch_already_added.append(arch)
-
-        bb.note('adding Smart RPM DB channel')
-        self._invoke_smart(['channel', '--add', 'rpmsys', 'type=rpm-sys', '-y'])
-
-        # Construct install scriptlet wrapper.
-        # Scripts need to be ordered when executed, this ensures numeric order.
-        # If we ever run into needing more the 899 scripts, we'll have to.
-        # change num to start with 1000.
-        #
-        scriptletcmd = "$2 $1/$3 $4\n"
-        scriptpath = "$1/$3"
-
-        # When self.debug_level >= 3, also dump the content of the
-        # executed scriptlets and how they get invoked.  We have to
-        # replace "exit 1" and "ERR" because printing those as-is
-        # would trigger a log analysis failure.
-        if self.debug_level >= 3:
-            dump_invocation = 'echo "Executing ${name} ${kind} with: ' + scriptletcmd + '"\n'
-            dump_script = 'cat ' + scriptpath + '| sed -e "s/exit 1/exxxit 1/g" -e "s/ERR/IRR/g"; echo\n'
-        else:
-            dump_invocation = 'echo "Executing ${name} ${kind}"\n'
-            dump_script = ''
-
-        SCRIPTLET_FORMAT = "#!/bin/bash\n" \
-            "\n" \
-            "export PATH=%s\n" \
-            "export D=%s\n" \
-            'export OFFLINE_ROOT="$D"\n' \
-            'export IPKG_OFFLINE_ROOT="$D"\n' \
-            'export OPKG_OFFLINE_ROOT="$D"\n' \
-            "export INTERCEPT_DIR=%s\n" \
-            "export NATIVE_ROOT=%s\n" \
-            "\n" \
-            "name=`head -1 " + scriptpath + " | cut -d\' \' -f 2`\n" \
-            "kind=`head -1 " + scriptpath + " | cut -d\' \' -f 4`\n" \
-            + dump_invocation \
-            + dump_script \
-            + scriptletcmd + \
-            "ret=$?\n" \
-            "echo Result of ${name} ${kind}: ${ret}\n" \
-            "if [ ${ret} -ne 0 ]; then\n" \
-            "  if [ $4 -eq 1 ]; then\n" \
-            "    mkdir -p $1/etc/rpm-postinsts\n" \
-            "    num=100\n" \
-            "    while [ -e $1/etc/rpm-postinsts/${num}-* ]; do num=$((num + 1)); done\n" \
-            '    echo "#!$2" > $1/etc/rpm-postinsts/${num}-${name}\n' \
-            '    echo "# Arg: $4" >> $1/etc/rpm-postinsts/${num}-${name}\n' \
-            "    cat " + scriptpath + " >> $1/etc/rpm-postinsts/${num}-${name}\n" \
-            "    chmod +x $1/etc/rpm-postinsts/${num}-${name}\n" \
-            '    echo "Info: deferring ${name} ${kind} install scriptlet to first boot"\n' \
-            "  else\n" \
-            '    echo "Error: ${name} ${kind} remove scriptlet failed"\n' \
-            "  fi\n" \
-            "fi\n"
-
-        intercept_dir = self.d.expand('${WORKDIR}/intercept_scripts')
-        native_root = self.d.getVar('STAGING_DIR_NATIVE')
-        scriptlet_content = SCRIPTLET_FORMAT % (os.environ['PATH'],
-                                                self.target_rootfs,
-                                                intercept_dir,
-                                                native_root)
-        open(self.scriptlet_wrapper, 'w+').write(scriptlet_content)
-
-        bb.note("configuring RPM cross-install scriptlet_wrapper")
-        os.chmod(self.scriptlet_wrapper, 0o755)
-        cmd = ['config', '--set', 'rpm-extra-macros._cross_scriptlet_wrapper=%s' %
-              self.scriptlet_wrapper]
-        self._invoke_smart(cmd)
-
-        # Debug to show smart config info
-        # bb.note(self._invoke_smart(['config', '--show']))
 
-    def update(self):
-        self._invoke_smart(['update', 'rpmsys'])
-
-    def get_rdepends_recursively(self, pkgs):
-        # pkgs will be changed during the loop, so use [:] to make a copy.
-        for pkg in pkgs[:]:
-            sub_data = oe.packagedata.read_subpkgdata(pkg, self.d)
-            sub_rdep = sub_data.get("RDEPENDS_" + pkg)
-            if not sub_rdep:
-                continue
-            done = list(bb.utils.explode_dep_versions2(sub_rdep).keys())
-            next = done
-            # Find all the rdepends on dependency chain
-            while next:
-                new = []
-                for sub_pkg in next:
-                    sub_data = oe.packagedata.read_subpkgdata(sub_pkg, self.d)
-                    sub_pkg_rdep = sub_data.get("RDEPENDS_" + sub_pkg)
-                    if not sub_pkg_rdep:
-                        continue
-                    for p in bb.utils.explode_dep_versions2(sub_pkg_rdep):
-                        # Already handled, skip it.
-                        if p in done or p in pkgs:
-                            continue
-                        # It's a new dep
-                        if oe.packagedata.has_subpkgdata(p, self.d):
-                            done.append(p)
-                            new.append(p)
-                next = new
-            pkgs.extend(done)
-        return pkgs
+    def install(self, pkgs, attempt_only = False):
+        if len(pkgs) == 0:
+            return
+        self._prepare_pkg_transaction()
+
+        bad_recommendations = self.d.getVar('BAD_RECOMMENDATIONS')
+        package_exclude = self.d.getVar('PACKAGE_EXCLUDE')
+        exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exlcude.split() if package_exclude else [])
+
+        output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
+                         (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
+                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == 1 else []) +
+                         ["--nogpgcheck", "install"] +
+                         pkgs)
+        failed_scriptlets_pkgnames = collections.OrderedDict()
+        for line in output.splitlines():
+            if line.startswith("Non-fatal POSTIN scriptlet failure in rpm package"):
+                failed_scriptlets_pkgnames[line.split()[-1]] = True
 
-    '''
-    Install pkgs with smart, the pkg name is oe format
-    '''
-    def install(self, pkgs, attempt_only=False):
+        for pkg in failed_scriptlets_pkgnames.keys():
+            self.save_rpmpostinst(pkg)
 
-        if not pkgs:
-            bb.note("There are no packages to install")
-            return
-        bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-        if not attempt_only:
-            # Pull in multilib requires since rpm may not pull in them
-            # correctly, for example,
-            # lib32-packagegroup-core-standalone-sdk-target requires
-            # lib32-libc6, but rpm may pull in libc6 rather than lib32-libc6
-            # since it doesn't know mlprefix (lib32-), bitbake knows it and
-            # can handle it well, find out the RDEPENDS on the chain will
-            # fix the problem. Both do_rootfs and do_populate_sdk have this
-            # issue.
-            # The attempt_only packages don't need this since they are
-            # based on the installed ones.
-            #
-            # Separate pkgs into two lists, one is multilib, the other one
-            # is non-multilib.
-            ml_pkgs = []
-            non_ml_pkgs = pkgs[:]
-            for pkg in pkgs:
-                for mlib in (self.d.getVar("MULTILIB_VARIANTS") or "").split():
-                    if pkg.startswith(mlib + '-'):
-                        ml_pkgs.append(pkg)
-                        non_ml_pkgs.remove(pkg)
-
-            if len(ml_pkgs) > 0 and len(non_ml_pkgs) > 0:
-                # Found both foo and lib-foo
-                ml_pkgs = self.get_rdepends_recursively(ml_pkgs)
-                non_ml_pkgs = self.get_rdepends_recursively(non_ml_pkgs)
-                # Longer list makes smart slower, so only keep the pkgs
-                # which have the same BPN, and smart can handle others
-                # correctly.
-                pkgs_new = []
-                for pkg in non_ml_pkgs:
-                    for mlib in (self.d.getVar("MULTILIB_VARIANTS") or "").split():
-                        mlib_pkg = mlib + "-" + pkg
-                        if mlib_pkg in ml_pkgs:
-                            pkgs_new.append(pkg)
-                            pkgs_new.append(mlib_pkg)
-                for pkg in pkgs:
-                    if pkg not in pkgs_new:
-                        pkgs_new.append(pkg)
-                pkgs = pkgs_new
-                new_depends = {}
-                deps = bb.utils.explode_dep_versions2(" ".join(pkgs))
-                for depend in deps:
-                    data = oe.packagedata.read_subpkgdata(depend, self.d)
-                    key = "PKG_%s" % depend
-                    if key in data:
-                        new_depend = data[key]
-                    else:
-                        new_depend = depend
-                    new_depends[new_depend] = deps[depend]
-                pkgs = bb.utils.join_deps(new_depends, commasep=True).split(', ')
-        pkgs = self._pkg_translate_oe_to_smart(pkgs, attempt_only)
-        if not pkgs:
-            bb.note("There are no packages to install")
+    def remove(self, pkgs, with_dependencies = True):
+        if len(pkgs) == 0:
             return
-        if not attempt_only:
-            bb.note('to be installed: %s' % ' '.join(pkgs))
-            cmd = [self.smart_cmd] + self.smart_opt + ["install", "-y"] + pkgs
-            bb.note(' '.join(cmd))
-        else:
-            bb.note('installing attempt only packages...')
-            bb.note('Attempting %s' % ' '.join(pkgs))
-            cmd = [self.smart_cmd] + self.smart_opt + ["install", "--attempt",
-                    "-y"] + pkgs
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
-            bb.note(output)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to install packages. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+        self._prepare_pkg_transaction()
 
-    '''
-    Remove pkgs with smart, the pkg name is smart/rpm format
-    '''
-    def remove(self, pkgs, with_dependencies=True):
-        bb.note('to be removed: ' + ' '.join(pkgs))
-
-        if not with_dependencies:
-            cmd = [self.rpm_cmd] + ["-e", "--nodeps", "--root=%s" %
-                    self.target_rootfs, "--dbpath=/var/lib/rpm",
-                    "--define='_cross_scriptlet_wrapper %s'" %
-                    self.scriptlet_wrapper,
-                    "--define='_tmppath /%s/tmp'" % self.install_dir_name] + pkgs
+        if with_dependencies:
+            self._invoke_dnf(["remove"] + pkgs)
         else:
-            # for pkg in pkgs:
-            #   bb.note('Debug: What required: %s' % pkg)
-            #   bb.note(self._invoke_smart(['query', pkg, '--show-requiredby']))
-            cmd = [self.smart_cmd] + self.smart_opt + ["remove", "-y"] + pkgs
-        try:
-            bb.note(' '.join(cmd))
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
-            bb.note(output)
-        except subprocess.CalledProcessError as e:
-            bb.note("Unable to remove packages. Command '%s' "
-                    "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+            cmd = bb.utils.which(os.getenv('PATH'), "rpm")
+            args = ["-e", "--nodeps", "--root=%s" %self.target_rootfs]
 
-    def upgrade(self):
-        bb.note('smart upgrade')
-        self._invoke_smart(['upgrade'])
+            try:
+                output = subprocess.check_output([cmd] + args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Could not invoke rpm. Command "
+                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args + pkgs), e.returncode, e.output.decode("utf-8")))
 
-    def write_index(self):
-        result = self.indexer.write_index()
+    def upgrade(self):
+        self._prepare_pkg_transaction()
+        self._invoke_dnf(["upgrade"])
 
-        if result is not None:
-            bb.fatal(result)
+    def autoremove(self):
+        self._prepare_pkg_transaction()
+        self._invoke_dnf(["autoremove"])
 
     def remove_packaging_data(self):
-        bb.utils.remove(self.image_rpmlib, True)
-        bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
-                        True)
-        bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/opkg'), True)
-
-        # remove temp directory
-        bb.utils.remove(self.install_dir_path, True)
+        self._invoke_dnf(["clean", "all"])
+        for dir in self.packaging_data_dirs:
+            bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)
 
     def backup_packaging_data(self):
-        # Save the rpmlib for increment rpm image generation
-        if os.path.exists(self.saved_rpmlib):
-            bb.utils.remove(self.saved_rpmlib, True)
-        shutil.copytree(self.image_rpmlib,
-                        self.saved_rpmlib,
-                        symlinks=True)
+        # Save the packaging dirs for increment rpm image generation
+        if os.path.exists(self.saved_packaging_data):
+            bb.utils.remove(self.saved_packaging_data, True)
+        for i in self.packaging_data_dirs:
+            source_dir = oe.path.join(self.target_rootfs, i)
+            target_dir = oe.path.join(self.saved_packaging_data, i)
+            shutil.copytree(source_dir, target_dir, symlinks=True)
 
     def recovery_packaging_data(self):
         # Move the rpmlib back
-        if os.path.exists(self.saved_rpmlib):
-            if os.path.exists(self.image_rpmlib):
-                bb.utils.remove(self.image_rpmlib, True)
-
-            bb.note('Recovery packaging data')
-            shutil.copytree(self.saved_rpmlib,
-                            self.image_rpmlib,
+        if os.path.exists(self.saved_packaging_data):
+            for i in self.packaging_data_dirs:
+                target_dir = oe.path.join(self.target_rootfs, i)
+                if os.path.exists(target_dir):
+                    bb.utils.remove(target_dir, True)
+                source_dir = oe.path.join(self.saved_packaging_data, i)
+                shutil.copytree(source_dir,
+                            target_dir,
                             symlinks=True)
 
     def list_installed(self):
-        return self.pkgs_list.list_pkgs()
-
-    '''
-    If incremental install, we need to determine what we've got,
-    what we need to add, and what to remove...
-    The dump_install_solution will dump and save the new install
-    solution.
-    '''
-    def dump_install_solution(self, pkgs):
-        bb.note('creating new install solution for incremental install')
-        if len(pkgs) == 0:
-            return
-
-        pkgs = self._pkg_translate_oe_to_smart(pkgs, False)
-        install_pkgs = list()
+        output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{sourcerpm}\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
+                                  bb_note = False)
+        packages = {}
+        current_package = None
+        current_deps = None
+        current_state = "initial"
+        for line in output.splitlines():
+            if line.startswith("Package:"):
+                package_info = line.split(" ")[1:]
+                current_package = package_info[0]
+                package_arch = package_info[1]
+                package_version = package_info[2]
+                package_srpm = package_info[3]
+                packages[current_package] = {"arch":package_arch, "ver":package_version, "filename":package_srpm}
+                current_deps = []
+            elif line.startswith("Dependencies:"):
+                current_state = "dependencies"
+            elif line.startswith("Recommendations"):
+                current_state = "recommendations"
+            elif line.startswith("DependenciesEndHere:"):
+                current_state = "initial"
+                packages[current_package]["deps"] = current_deps
+            elif len(line) > 0:
+                if current_state == "dependencies":
+                    current_deps.append(line)
+                elif current_state == "recommendations":
+                    current_deps.append("%s [REC]" % line)
+
+        return packages
 
-        cmd = [self.smart_cmd] + self.smart_opt + ['install', '-y', '--dump'] + pkgs
+    def update(self):
+        self._invoke_dnf(["makecache"])
+
+    def _invoke_dnf(self, dnf_args, bb_fatal = True, bb_note = True ):
+        os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
+
+        dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf-2")
+        standard_dnf_args = (["-v", "--rpmverbosity=debug"] if self.d.getVar('ROOTFS_RPM_DEBUG') else []) + ["-y",
+                             "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
+                             "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
+                             "--repofrompath=oe-repo,%s" % (self.rpm_repo_dir),
+                             "--installroot=%s" % (self.target_rootfs),
+                             "--setopt=logdir=%s" % (self.d.getVar('T'))
+                            ]
+        cmd = [dnf_cmd] + standard_dnf_args + dnf_args
         try:
-            # Disable rpmsys channel for the fake install
-            self._invoke_smart(['channel', '--disable', 'rpmsys'])
-
-            output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode('utf-8')
-            f = open(self.solution_manifest, 'w')
-            f.write(output)
-            f.close()
-            with open(self.solution_manifest, 'r') as manifest:
-                for pkg in manifest.read().split('\n'):
-                    if '@' in pkg:
-                        install_pkgs.append(pkg.strip())
+            output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
+            if bb_note:
+                bb.note(output)
+            return output
         except subprocess.CalledProcessError as e:
-            bb.note("Unable to dump install packages. Command '%s' "
-                    "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-        # Recovery rpmsys channel
-        self._invoke_smart(['channel', '--enable', 'rpmsys'])
-        return install_pkgs
+            (bb.note, bb.fatal)[bb_fatal]("Could not invoke dnf. Command "
+                     "'%s' returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
+    def dump_install_solution(self, pkgs):
+        open(self.solution_manifest, 'w').write(" ".join(pkgs))
+        return pkgs
 
-    '''
-    If incremental install, we need to determine what we've got,
-    what we need to add, and what to remove...
-    The load_old_install_solution will load the previous install
-    solution
-    '''
     def load_old_install_solution(self):
-        bb.note('load old install solution for incremental install')
-        installed_pkgs = list()
         if not os.path.exists(self.solution_manifest):
-            bb.note('old install solution not exist')
-            return installed_pkgs
-
-        with open(self.solution_manifest, 'r') as manifest:
-            for pkg in manifest.read().split('\n'):
-                if '@' in pkg:
-                    installed_pkgs.append(pkg.strip())
-
-        return installed_pkgs
-
-    '''
-    Dump all available packages in feeds, it should be invoked after the
-    newest rpm index was created
-    '''
-    def dump_all_available_pkgs(self):
-        available_manifest = self.d.expand('${T}/saved/available_pkgs.txt')
-        available_pkgs = list()
-        cmd = [self.smart_cmd] + self.smart_opt + ['query', '--output', available_manifest]
-        try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            with open(available_manifest, 'r') as manifest:
-                for pkg in manifest.read().split('\n'):
-                    if '@' in pkg:
-                        available_pkgs.append(pkg.strip())
-        except subprocess.CalledProcessError as e:
-            bb.note("Unable to list all available packages. Command '%s' "
-                    "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+            return []
 
-        self.fullpkglist = available_pkgs
+        return open(self.solution_manifest, 'r').read().split()
 
-        return
+    def _script_num_prefix(self, path):
+        files = os.listdir(path)
+        numbers = set()
+        numbers.add(99)
+        for f in files:
+            numbers.add(int(f.split("-")[0]))
+        return max(numbers) + 1
 
     def save_rpmpostinst(self, pkg):
-        mlibs = (self.d.getVar('MULTILIB_GLOBAL_VARIANTS', False) or "").split()
-
-        new_pkg = pkg
-        # Remove any multilib prefix from the package name
-        for mlib in mlibs:
-            if mlib in pkg:
-                new_pkg = pkg.replace(mlib + '-', '')
-                break
-
-        bb.note('  * postponing %s' % new_pkg)
-        saved_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/') + new_pkg
-
-        cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
-        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
-        cmd += ' | sed -n -e "/^postinstall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}"'
-        cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
-        cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
-
-        try:
-            bb.note(cmd)
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip().decode("utf-8")
-            bb.note(output)
-            os.chmod(saved_dir, 0o755)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Invoke save_rpmpostinst failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-    '''Write common configuration for target usage'''
-    def rpm_setup_smart_target_config(self):
-        bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
-                        True)
-
-        self._invoke_smart(['config', '--set', 'rpm-nolinktos=1'])
-        self._invoke_smart(['config', '--set', 'rpm-noparentdirs=1'])
-        for i in self.d.getVar('BAD_RECOMMENDATIONS').split():
-            self._invoke_smart(['flag', '--set', 'ignore-recommends', i])
-        self._invoke_smart(['channel', '--add', 'rpmsys', 'type=rpm-sys', '-y'])
-
-    '''
-    The rpm db lock files were produced after invoking rpm to query on
-    build system, and they caused the rpm on target didn't work, so we
-    need to unlock the rpm db by removing the lock files.
-    '''
-    def unlock_rpm_db(self):
-        # Remove rpm db lock files
-        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
-        for f in rpm_db_locks:
-            bb.utils.remove(f, True)
+        bb.note("Saving postinstall script of %s" % (pkg))
+        cmd = bb.utils.which(os.getenv('PATH'), "rpm")
+        args = ["-q", "--root=%s" % self.target_rootfs, "--queryformat", "%{postin}", pkg]
 
-    """
-    Returns a dictionary with the package info.
-    """
-    def package_info(self, pkg):
-        cmd = [self.smart_cmd] + self.smart_opt + ['info', '--urls', pkg]
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+            output = subprocess.check_output([cmd] + args,stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+            bb.fatal("Could not invoke rpm. Command "
+                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args), e.returncode, e.output.decode("utf-8")))
 
-        # Set default values to avoid UnboundLocalError
-        arch = ""
-        ver = ""
-        filename = ""
+        # may need to prepend #!/bin/sh to output
 
-        #Parse output
-        for line in output.splitlines():
-            line = line.rstrip()
-            if line.startswith("Name:"):
-                pkg = line.split(": ")[1]
-            elif line.startswith("Version:"):
-                tmp_str = line.split(": ")[1]
-                ver, arch = tmp_str.split("@")
-                break
-
-        # Get filename
-        index = re.search("^URLs", output, re.MULTILINE)
-        tmp_str = output[index.end():]
-        for line in tmp_str.splitlines():
-            if "/" in line:
-                line = line.lstrip()
-                filename = line.split(" ")[0]
-                break
-
-        # To have the same data type than other package_info methods
-        filepath = os.path.join(self.deploy_dir, arch, filename)
-        pkg_dict = {}
-        pkg_dict[pkg] = {"arch":arch, "ver":ver, "filename":filename,
-                         "filepath": filepath}
-
-        return pkg_dict
-
-    """
-    Returns the path to a tmpdir where resides the contents of a package.
-
-    Deleting the tmpdir is responsability of the caller.
+        target_path = oe.path.join(self.target_rootfs, self.d.expand('${sysconfdir}/rpm-postinsts/'))
+        bb.utils.mkdirhier(target_path)
+        num = self._script_num_prefix(target_path)
+        saved_script_name = oe.path.join(target_path, "%d-%s" % (num, pkg))
+        open(saved_script_name, 'w').write(output)
+        os.chmod(saved_script_name, 0o755)
 
-    """
     def extract(self, pkg):
-        pkg_info = self.package_info(pkg)
-        if not pkg_info:
-            bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
-
-        pkg_path = pkg_info[pkg]["filepath"]
+        output = self._invoke_dnf(["repoquery", "--queryformat", "%{location}", pkg])
+        pkg_name = output.splitlines()[-1]
+        if not pkg_name.endswith(".rpm"):
+            bb.fatal("dnf could not find package %s in repository: %s" %(pkg, output))
+        pkg_path = oe.path.join(self.rpm_repo_dir, pkg_name)
 
         cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
         rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
@@ -1725,7 +966,7 @@ class OpkgPM(OpkgDpkgPM):
             for uri in feed_uris:
                 if archs:
                     for arch in archs:
-                        if (feed_archs is None) and (not os.path.exists(os.path.join(self.deploy_dir, arch))):
+                        if (feed_archs is None) and (not os.path.exists(oe.path.join(self.deploy_dir, arch))):
                             continue
                         bb.note('Adding opkg feed url-%s-%d (%s)' %
                             (arch, uri_iterator, uri))
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c8ab421fe21..9e00cc96d36 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -435,6 +435,8 @@ class RpmRootfs(Rootfs):
                 bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
                 self.pm.remove(pkg_to_remove)
 
+            self.pm.autoremove()
+
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
         rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
@@ -448,8 +450,6 @@ class RpmRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self.pm.dump_all_available_pkgs()
-
         if self.inc_rpm_image_gen == "1":
             self._create_incremental(pkgs_to_install)
 
@@ -484,15 +484,13 @@ class RpmRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
+        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
         if self.inc_rpm_image_gen == "1":
             self.pm.backup_packaging_data()
 
-        self.pm.rpm_setup_smart_target_config()
-
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
@@ -530,15 +528,7 @@ class RpmRootfs(Rootfs):
             self.pm.save_rpmpostinst(pkg)
 
     def _cleanup(self):
-        # during the execution of postprocess commands, rpm is called several
-        # times to get the files installed, dependencies, etc. This creates the
-        # __db.00* (Berkeley DB files that hold locks, rpm specific environment
-        # settings, etc.), that should not get into the final rootfs
-        self.pm.unlock_rpm_db()
-        if os.path.isdir(self.pm.install_dir_path + "/tmp") and not os.listdir(self.pm.install_dir_path + "/tmp"):
-           bb.utils.remove(self.pm.install_dir_path + "/tmp", True)
-        if os.path.isdir(self.pm.install_dir_path) and not os.listdir(self.pm.install_dir_path):
-           bb.utils.remove(self.pm.install_dir_path, True)
+        pass
 
 class DpkgOpkgRootfs(Rootfs):
     def __init__(self, d, progress_reporter=None, logcatcher=None):
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index fef02d0777e..deb823b6ec1 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -130,7 +130,6 @@ class RpmSdk(Sdk):
 
         pm.create_configs()
         pm.write_index()
-        pm.dump_all_available_pkgs()
         pm.update()
 
         pkgs = []
@@ -188,7 +187,9 @@ class RpmSdk(Sdk):
                                                         True).strip('/'),
                                           )
         self.mkdirhier(native_sysconf_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "etc", "*")):
+        for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
+            self.movefile(f, native_sysconf_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
             self.movefile(f, native_sysconf_dir)
         self.remove(os.path.join(self.sdk_output, "etc"), True)
 
@@ -350,7 +351,7 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
     if img_type == "rpm":
         arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
         os_var = ["SDK_OS", None][target is True]
-        return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list_pkgs()
+        return RpmPkgsList(d, rootfs_dir).list_pkgs()
     elif img_type == "ipk":
         conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
         return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
-- 
2.11.0


