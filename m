Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.4725.1592910812116824214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 04:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=NPTftos7;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=209893; q=dns/txt; s=axis-central1;
  t=1592910812; x=1624446812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=beBT7Lmskqu4t4JURLMcmhYf3+uOlUEGq8H24Hp0nG0=;
  b=NPTftos7FVMI11piou5XEkJ/YUxA81FwhYaIaIbZzpKed7Zq7sFM5JeS
   FJxGmQQVEg3tD+QTwCe0gu37Zeeky1rkJSEJVgukMZFgIT7T3JQKn+qmV
   JAdfHdbUXwZemXNDVPPlS2Q6Xj81HRyzWe8fO6Y0laTxRDkkhN4e+o94s
   h2tYl6EmIoe7yhQ2aWCmd24rlm77DAc84DW1BvFK/z3zhPBchYVaSRcgB
   9SGbFPBW6ooRzwGmjq2NZerhpQqs/0ctzRxg7z0dmv0ZBXgAXFbnHj7td
   +qxtX7vU0zv7nUOAfj3uIM0r83rcFgdSYXaugUPjmjVu44VnBUJddxEil
   w==;
IronPort-SDR: DuStbUZ6r5+SmcN6YhQXqoBz82sAs+Q0uDkYXxRSXOm4RTwuHaZnjpgpNu/4m7B6RXFLrVLvkC
 kWH6ibMDJs0r+epxxIhy4mtCQ9vYINeQs+nxLF1DNpPqfXV+v59l9RVsLlfi62adXA9LHp2Dia
 oGfaAdu1MVptw/fr98mEkK8ubvH+KklGTUBg9yShTbzHN1xjPpX15WHiNka9sb9nDry4wXbZcE
 leQ4TsdesanzlPdoGm84okXZV++QzWajFYGfjpo3xVjokqAuudZ2k+/fXxqVSzDWrctTsHs8YO
 DW8=
X-IronPort-AV: E=Sophos;i="5.75,271,1589234400"; 
   d="scan'208";a="9815769"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH 2/2] lib/oe: Split package manager code to multiple files
Date: Tue, 23 Jun 2020 13:13:28 +0200
Message-ID: <20200623111328.5838-3-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623111328.5838-1-fredrigu@axis.com>
References: <20200623111328.5838-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Today OE-Core has support for three package managers, even if there
are many more package managers that could be interesting to use.
Adding a new package manager to OE-Core would increase the test matrix
significantly. In order to let users use their favorite package manager
without need for it to have support from upstream, this patch refactors
the package manager code so that it's easy to add a new package
manager in another layer.

This patch is mostly moving code and duplicating some code (because of
the hard coupling between deb and ipk).

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/classes/populate_sdk_base.bbclass        |   11 +-
 meta/lib/oe/manifest.py                       |  149 +-
 meta/lib/oe/package_manager.py                | 1402 +----------------
 meta/lib/oe/package_managers/deb/manifest.py  |   31 +
 .../package_managers/deb/package_manager.py   |  719 +++++++++
 meta/lib/oe/package_managers/deb/rootfs.py    |  213 +++
 meta/lib/oe/package_managers/deb/sdk.py       |   97 ++
 .../ipk/.package_manager.py.swo               |  Bin 0 -> 45056 bytes
 meta/lib/oe/package_managers/ipk/manifest.py  |   79 +
 .../package_managers/ipk/package_manager.py   |  588 +++++++
 meta/lib/oe/package_managers/ipk/rootfs.py    |  395 +++++
 meta/lib/oe/package_managers/ipk/sdk.py       |  104 ++
 meta/lib/oe/package_managers/rpm/manifest.py  |   62 +
 .../package_managers/rpm/package_manager.py   |  423 +++++
 meta/lib/oe/package_managers/rpm/rootfs.py    |  154 ++
 meta/lib/oe/package_managers/rpm/sdk.py       |  104 ++
 meta/lib/oe/rootfs.py                         |  631 +-------
 meta/lib/oe/sdk.py                            |  311 +---
 meta/lib/oeqa/utils/package_manager.py        |   29 +-
 meta/recipes-core/meta/package-index.bb       |    2 +-
 20 files changed, 3014 insertions(+), 2490 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/deb/manifest.py
 create mode 100644 meta/lib/oe/package_managers/deb/package_manager.py
 create mode 100644 meta/lib/oe/package_managers/deb/rootfs.py
 create mode 100644 meta/lib/oe/package_managers/deb/sdk.py
 create mode 100644 meta/lib/oe/package_managers/ipk/.package_manager.py.swo
 create mode 100644 meta/lib/oe/package_managers/ipk/manifest.py
 create mode 100644 meta/lib/oe/package_managers/ipk/package_manager.py
 create mode 100644 meta/lib/oe/package_managers/ipk/rootfs.py
 create mode 100644 meta/lib/oe/package_managers/ipk/sdk.py
 create mode 100644 meta/lib/oe/package_managers/rpm/manifest.py
 create mode 100644 meta/lib/oe/package_managers/rpm/package_manager.py
 create mode 100644 meta/lib/oe/package_managers/rpm/rootfs.py
 create mode 100644 meta/lib/oe/package_managers/rpm/sdk.py

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 990505e89b..d31cda4714 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -330,9 +330,18 @@ do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
 do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
                                     ${TOOLCHAIN_SHAR_EXT_TMPL}:True"
 
+def get_package_write_tasks(d):
+    package_managers = d.getVar('PACKAGE_CLASSES').split()
+    tasks = ''
+    for package_manager in package_managers:
+        package_manager = package_manager.replace('package_', '')
+        tasks += ' do_package_write_' + package_manager
+    return tasks
+
 do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_package_write_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('SDK_RDEPENDS').split()])}"
-do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
+do_populate_sdk[recrdeptask] += "do_packagedata "
+do_populate_sdk[recrdeptask] += "${@get_package_write_tasks(d)}"
 do_populate_sdk[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask populate_sdk
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index f7c88f9a09..a8d14244c0 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -188,155 +188,10 @@ class Manifest(object, metaclass=ABCMeta):
 
         return installed_pkgs
 
-
-class RpmManifest(Manifest):
-    """
-    Returns a dictionary object with mip and mlp packages.
-    """
-    def _split_multilib(self, pkg_list):
-        pkgs = dict()
-
-        for pkg in pkg_list.split():
-            pkg_type = self.PKG_TYPE_MUST_INSTALL
-
-            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
-
-            for ml_variant in ml_variants:
-                if pkg.startswith(ml_variant + '-'):
-                    pkg_type = self.PKG_TYPE_MULTILIB
-
-            if not pkg_type in pkgs:
-                pkgs[pkg_type] = pkg
-            else:
-                pkgs[pkg_type] += " " + pkg
-
-        return pkgs
-
-    def create_initial(self):
-        pkgs = dict()
-
-        with open(self.initial_manifest, "w+") as manifest:
-            manifest.write(self.initial_manifest_file_header)
-
-            for var in self.var_maps[self.manifest_type]:
-                if var in self.vars_to_split:
-                    split_pkgs = self._split_multilib(self.d.getVar(var))
-                    if split_pkgs is not None:
-                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
-                else:
-                    pkg_list = self.d.getVar(var)
-                    if pkg_list is not None:
-                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
-
-            for pkg_type in pkgs:
-                for pkg in pkgs[pkg_type].split():
-                    manifest.write("%s,%s\n" % (pkg_type, pkg))
-
-    def create_final(self):
-        pass
-
-    def create_full(self, pm):
-        pass
-
-
-class OpkgManifest(Manifest):
-    """
-    Returns a dictionary object with mip and mlp packages.
-    """
-    def _split_multilib(self, pkg_list):
-        pkgs = dict()
-
-        for pkg in pkg_list.split():
-            pkg_type = self.PKG_TYPE_MUST_INSTALL
-
-            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
-
-            for ml_variant in ml_variants:
-                if pkg.startswith(ml_variant + '-'):
-                    pkg_type = self.PKG_TYPE_MULTILIB
-
-            if not pkg_type in pkgs:
-                pkgs[pkg_type] = pkg
-            else:
-                pkgs[pkg_type] += " " + pkg
-
-        return pkgs
-
-    def create_initial(self):
-        pkgs = dict()
-
-        with open(self.initial_manifest, "w+") as manifest:
-            manifest.write(self.initial_manifest_file_header)
-
-            for var in self.var_maps[self.manifest_type]:
-                if var in self.vars_to_split:
-                    split_pkgs = self._split_multilib(self.d.getVar(var))
-                    if split_pkgs is not None:
-                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
-                else:
-                    pkg_list = self.d.getVar(var)
-                    if pkg_list is not None:
-                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
-
-            for pkg_type in sorted(pkgs):
-                for pkg in sorted(pkgs[pkg_type].split()):
-                    manifest.write("%s,%s\n" % (pkg_type, pkg))
-
-    def create_final(self):
-        pass
-
-    def create_full(self, pm):
-        if not os.path.exists(self.initial_manifest):
-            self.create_initial()
-
-        initial_manifest = self.parse_initial_manifest()
-        pkgs_to_install = list()
-        for pkg_type in initial_manifest:
-            pkgs_to_install += initial_manifest[pkg_type]
-        if len(pkgs_to_install) == 0:
-            return
-
-        output = pm.dummy_install(pkgs_to_install)
-
-        with open(self.full_manifest, 'w+') as manifest:
-            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
-            for line in set(output.split('\n')):
-                m = pkg_re.match(line)
-                if m:
-                    manifest.write(m.group(1) + '\n')
-
-        return
-
-
-class DpkgManifest(Manifest):
-    def create_initial(self):
-        with open(self.initial_manifest, "w+") as manifest:
-            manifest.write(self.initial_manifest_file_header)
-
-            for var in self.var_maps[self.manifest_type]:
-                pkg_list = self.d.getVar(var)
-
-                if pkg_list is None:
-                    continue
-
-                for pkg in pkg_list.split():
-                    manifest.write("%s,%s\n" %
-                                   (self.var_maps[self.manifest_type][var], pkg))
-
-    def create_final(self):
-        pass
-
-    def create_full(self, pm):
-        pass
-
-
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
-    manifest_map = {'rpm': RpmManifest,
-                    'ipk': OpkgManifest,
-                    'deb': DpkgManifest}
-
-    manifest = manifest_map[d.getVar('IMAGE_PKGTYPE')](d, manifest_dir, manifest_type)
+    import importlib
+    manifest = importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.manifest').PkgManifest(d, manifest_dir, manifest_type)
 
     if final_manifest:
         manifest.create_final()
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c055d2b0f7..d857db66a8 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -27,67 +27,6 @@ def create_index(arg):
     if result:
         bb.note(result)
 
-def opkg_query(cmd_output):
-    """
-    This method parse the output from the package managerand return
-    a dictionary with the information of the packages. This is used
-    when the packages are in deb or ipk format.
-    """
-    verregex = re.compile(r' \([=<>]* [^ )]*\)')
-    output = dict()
-    pkg = ""
-    arch = ""
-    ver = ""
-    filename = ""
-    dep = []
-    prov = []
-    pkgarch = ""
-    for line in cmd_output.splitlines()+['']:
-        line = line.rstrip()
-        if ':' in line:
-            if line.startswith("Package: "):
-                pkg = line.split(": ")[1]
-            elif line.startswith("Architecture: "):
-                arch = line.split(": ")[1]
-            elif line.startswith("Version: "):
-                ver = line.split(": ")[1]
-            elif line.startswith("File: ") or line.startswith("Filename:"):
-                filename = line.split(": ")[1]
-                if "/" in filename:
-                    filename = os.path.basename(filename)
-            elif line.startswith("Depends: "):
-                depends = verregex.sub('', line.split(": ")[1])
-                for depend in depends.split(", "):
-                    dep.append(depend)
-            elif line.startswith("Recommends: "):
-                recommends = verregex.sub('', line.split(": ")[1])
-                for recommend in recommends.split(", "):
-                    dep.append("%s [REC]" % recommend)
-            elif line.startswith("PackageArch: "):
-                pkgarch = line.split(": ")[1]
-            elif line.startswith("Provides: "):
-                provides = verregex.sub('', line.split(": ")[1])
-                for provide in provides.split(", "):
-                    prov.append(provide)
-
-        # When there is a blank line save the package information
-        elif not line:
-            # IPK doesn't include the filename
-            if not filename:
-                filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
-            if pkg:
-                output[pkg] = {"arch":arch, "ver":ver,
-                        "filename":filename, "deps": dep, "pkgarch":pkgarch, "provs": prov}
-            pkg = ""
-            arch = ""
-            ver = ""
-            filename = ""
-            dep = []
-            prov = []
-            pkgarch = ""
-
-    return output
-
 def failed_postinsts_abort(pkgs, log_path):
     bb.fatal("""Postinstall scriptlets of %s have failed. If the intention is to defer them to first boot,
 then please place them into pkg_postinst_ontarget_${PN} ().
@@ -149,171 +88,6 @@ class Indexer(object, metaclass=ABCMeta):
     def write_index(self):
         pass
 
-
-class RpmIndexer(Indexer):
-    def write_index(self):
-        self.do_write_index(self.deploy_dir)
-
-    def do_write_index(self, deploy_dir):
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
-        else:
-            signer = None
-
-        createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
-        result = create_index("%s --update -q %s" % (createrepo_c, deploy_dir))
-        if result:
-            bb.fatal(result)
-
-        # Sign repomd
-        if signer:
-            sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
-            is_ascii_sig = (sig_type.upper() != "BIN")
-            signer.detach_sign(os.path.join(deploy_dir, 'repodata', 'repomd.xml'),
-                               self.d.getVar('PACKAGE_FEED_GPG_NAME'),
-                               self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
-                               armor=is_ascii_sig)
-
-class RpmSubdirIndexer(RpmIndexer):
-    def write_index(self):
-        bb.note("Generating package index for %s" %(self.deploy_dir))
-        self.do_write_index(self.deploy_dir)
-        for entry in os.walk(self.deploy_dir):
-            if os.path.samefile(self.deploy_dir, entry[0]):
-                for dir in entry[1]:
-                    if dir != 'repodata':
-                        dir_path = oe.path.join(self.deploy_dir, dir)
-                        bb.note("Generating package index for %s" %(dir_path))
-                        self.do_write_index(dir_path)
-
-class OpkgIndexer(Indexer):
-    def write_index(self):
-        arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
-                     "SDK_PACKAGE_ARCHS",
-                     ]
-
-        opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
-        else:
-            signer = None
-
-        if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
-            open(os.path.join(self.deploy_dir, "Packages"), "w").close()
-
-        index_cmds = set()
-        index_sign_files = set()
-        for arch_var in arch_vars:
-            archs = self.d.getVar(arch_var)
-            if archs is None:
-                continue
-
-            for arch in archs.split():
-                pkgs_dir = os.path.join(self.deploy_dir, arch)
-                pkgs_file = os.path.join(pkgs_dir, "Packages")
-
-                if not os.path.isdir(pkgs_dir):
-                    continue
-
-                if not os.path.exists(pkgs_file):
-                    open(pkgs_file, "w").close()
-
-                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
-
-                index_sign_files.add(pkgs_file)
-
-        if len(index_cmds) == 0:
-            bb.note("There are no packages in %s!" % self.deploy_dir)
-            return
-
-        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
-
-        if signer:
-            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
-            is_ascii_sig = (feed_sig_type.upper() != "BIN")
-            for f in index_sign_files:
-                signer.detach_sign(f,
-                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
-                                   armor=is_ascii_sig)
-
-
-class DpkgIndexer(Indexer):
-    def _create_configs(self):
-        bb.utils.mkdirhier(self.apt_conf_dir)
-        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "lists", "partial"))
-        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "apt.conf.d"))
-        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "preferences.d"))
-
-        with open(os.path.join(self.apt_conf_dir, "preferences"),
-                "w") as prefs_file:
-            pass
-        with open(os.path.join(self.apt_conf_dir, "sources.list"),
-                "w+") as sources_file:
-            pass
-
-        with open(self.apt_conf_file, "w") as apt_conf:
-            with open(os.path.join(self.d.expand("${STAGING_ETCDIR_NATIVE}"),
-                "apt", "apt.conf.sample")) as apt_conf_sample:
-                for line in apt_conf_sample.read().split("\n"):
-                    line = re.sub(r"#ROOTFS#", "/dev/null", line)
-                    line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
-                    apt_conf.write(line + "\n")
-
-    def write_index(self):
-        self.apt_conf_dir = os.path.join(self.d.expand("${APTCONF_TARGET}"),
-                "apt-ftparchive")
-        self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
-        self._create_configs()
-
-        os.environ['APT_CONFIG'] = self.apt_conf_file
-
-        pkg_archs = self.d.getVar('PACKAGE_ARCHS')
-        if pkg_archs is not None:
-            arch_list = pkg_archs.split()
-        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS')
-        if sdk_pkg_archs is not None:
-            for a in sdk_pkg_archs.split():
-                if a not in pkg_archs:
-                    arch_list.append(a)
-
-        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
-        arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
-
-        apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
-        gzip = bb.utils.which(os.getenv('PATH'), "gzip")
-
-        index_cmds = []
-        deb_dirs_found = False
-        for arch in arch_list:
-            arch_dir = os.path.join(self.deploy_dir, arch)
-            if not os.path.isdir(arch_dir):
-                continue
-
-            cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
-
-            cmd += "%s -fcn Packages > Packages.gz;" % gzip
-
-            with open(os.path.join(arch_dir, "Release"), "w+") as release:
-                release.write("Label: %s\n" % arch)
-
-            cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
-
-            index_cmds.append(cmd)
-
-            deb_dirs_found = True
-
-        if not deb_dirs_found:
-            bb.note("There are no packages in %s" % self.deploy_dir)
-            return
-
-        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            raise NotImplementedError('Package feed signing not implementd for dpkg')
-
-
-
 class PkgsList(object, metaclass=ABCMeta):
     def __init__(self, d, rootfs_dir):
         self.d = d
@@ -323,55 +97,6 @@ class PkgsList(object, metaclass=ABCMeta):
     def list_pkgs(self):
         pass
 
-class RpmPkgsList(PkgsList):
-    def list_pkgs(self):
-        return RpmPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
-
-class OpkgPkgsList(PkgsList):
-    def __init__(self, d, rootfs_dir, config_file):
-        super(OpkgPkgsList, self).__init__(d, rootfs_dir)
-
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
-
-    def list_pkgs(self, format=None):
-        cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
-
-        # opkg returns success even when it printed some
-        # "Collected errors:" report to stderr. Mixing stderr into
-        # stdout then leads to random failures later on when
-        # parsing the output. To avoid this we need to collect both
-        # output streams separately and check for empty stderr.
-        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
-        cmd_output, cmd_stderr = p.communicate()
-        cmd_output = cmd_output.decode("utf-8")
-        cmd_stderr = cmd_stderr.decode("utf-8")
-        if p.returncode or cmd_stderr:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
-
-        return opkg_query(cmd_output)
-
-
-class DpkgPkgsList(PkgsList):
-
-    def list_pkgs(self):
-        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
-               "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
-               "-W"]
-
-        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\nProvides: ${Provides}\n\n")
-
-        try:
-            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-
-        return opkg_query(cmd_output)
-
-
 class PackageManager(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -737,1127 +462,8 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
                     else:
                         raise
 
-class RpmPM(PackageManager):
-    def __init__(self,
-                 d,
-                 target_rootfs,
-                 target_vendor,
-                 task_name='target',
-                 arch_var=None,
-                 os_var=None,
-                 rpm_repo_workdir="oe-rootfs-repo",
-                 filterbydependencies=True,
-                 needfeed=True):
-        super(RpmPM, self).__init__(d, target_rootfs)
-        self.target_vendor = target_vendor
-        self.task_name = task_name
-        if arch_var == None:
-            self.archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
-        else:
-            self.archs = self.d.getVar(arch_var).replace("-","_")
-        if task_name == "host":
-            self.primary_arch = self.d.getVar('SDK_ARCH')
-        else:
-            self.primary_arch = self.d.getVar('MACHINE_ARCH')
-
-        if needfeed:
-            self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), rpm_repo_workdir)
-            create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
-
-        self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
-        if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
-            bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
-        self.packaging_data_dirs = ['etc/rpm', 'etc/rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
-        self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
-                                               self.task_name)
-        if not os.path.exists(self.d.expand('${T}/saved')):
-            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
-
-    def _configure_dnf(self):
-        # libsolv handles 'noarch' internally, we don't need to specify it explicitly
-        archs = [i for i in reversed(self.archs.split()) if i not in ["any", "all", "noarch"]]
-        # This prevents accidental matching against libsolv's built-in policies
-        if len(archs) <= 1:
-            archs = archs + ["bogusarch"]
-        # This architecture needs to be upfront so that packages using it are properly prioritized
-        archs = ["sdk_provides_dummy_target"] + archs
-        confdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
-        bb.utils.mkdirhier(confdir)
-        open(confdir + "arch", 'w').write(":".join(archs))
-        distro_codename = self.d.getVar('DISTRO_CODENAME')
-        open(confdir + "releasever", 'w').write(distro_codename if distro_codename is not None else '')
-
-        open(oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"), 'w').write("")
-
-
-    def _configure_rpm(self):
-        # We need to configure rpm to use our primary package architecture as the installation architecture,
-        # and to make it compatible with other package architectures that we use.
-        # Otherwise it will refuse to proceed with packages installation.
-        platformconfdir = "%s/%s" %(self.target_rootfs, "etc/rpm/")
-        rpmrcconfdir = "%s/%s" %(self.target_rootfs, "etc/")
-        bb.utils.mkdirhier(platformconfdir)
-        open(platformconfdir + "platform", 'w').write("%s-pc-linux" % self.primary_arch)
-        with open(rpmrcconfdir + "rpmrc", 'w') as f:
-            f.write("arch_compat: %s: %s\n" % (self.primary_arch, self.archs if len(self.archs) > 0 else self.primary_arch))
-            f.write("buildarch_compat: %s: noarch\n" % self.primary_arch)
-
-        open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
-        if self.d.getVar('RPM_PREFER_ELF_ARCH'):
-            open(platformconfdir + "macros", 'a').write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
-
-        if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
-            signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
-            pubkey_path = oe.path.join(self.d.getVar('B'), 'rpm-key')
-            signer.export_pubkey(pubkey_path, self.d.getVar('RPM_GPG_NAME'))
-            rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmkeys")
-            cmd = [rpm_bin, '--root=%s' % self.target_rootfs, '--import', pubkey_path]
-            try:
-                subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            except subprocess.CalledProcessError as e:
-                bb.fatal("Importing GPG key failed. Command '%s' "
-                        "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-
-    def create_configs(self):
-        self._configure_dnf()
-        self._configure_rpm()
-
-    def write_index(self):
-        lockfilename = self.d.getVar('DEPLOY_DIR_RPM') + "/rpm.lock"
-        lf = bb.utils.lockfile(lockfilename, False)
-        RpmIndexer(self.d, self.rpm_repo_dir).write_index()
-        bb.utils.unlockfile(lf)
-
-    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
-        from urllib.parse import urlparse
-
-        if feed_uris == "":
-            return
-
-        gpg_opts = ''
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            gpg_opts += 'repo_gpgcheck=1\n'
-            gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
-
-        if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
-            gpg_opts += 'gpgcheck=0\n'
-
-        bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
-        remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-        for uri in remote_uris:
-            repo_base = "oe-remote-repo" + "-".join(urlparse(uri).path.split("/"))
-            if feed_archs is not None:
-                for arch in feed_archs.split():
-                    repo_uri = uri + "/" + arch
-                    repo_id   = "oe-remote-repo"  + "-".join(urlparse(repo_uri).path.split("/"))
-                    repo_name = "OE Remote Repo:" + " ".join(urlparse(repo_uri).path.split("/"))
-                    open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'a').write(
-                             "[%s]\nname=%s\nbaseurl=%s\n%s\n" % (repo_id, repo_name, repo_uri, gpg_opts))
-            else:
-                repo_name = "OE Remote Repo:" + " ".join(urlparse(uri).path.split("/"))
-                repo_uri = uri
-                open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'w').write(
-                             "[%s]\nname=%s\nbaseurl=%s\n%s" % (repo_base, repo_name, repo_uri, gpg_opts))
-
-    def _prepare_pkg_transaction(self):
-        os.environ['D'] = self.target_rootfs
-        os.environ['OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
-        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
-
-
-    def install(self, pkgs, attempt_only = False):
-        if len(pkgs) == 0:
-            return
-        self._prepare_pkg_transaction()
-
-        bad_recommendations = self.d.getVar('BAD_RECOMMENDATIONS')
-        package_exclude = self.d.getVar('PACKAGE_EXCLUDE')
-        exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exclude.split() if package_exclude else [])
-
-        output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
-                         (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
-                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == "1" else []) +
-                         (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
-                         ["install"] +
-                         pkgs)
-
-        failed_scriptlets_pkgnames = collections.OrderedDict()
-        for line in output.splitlines():
-            if line.startswith("Error in POSTIN scriptlet in rpm package"):
-                failed_scriptlets_pkgnames[line.split()[-1]] = True
-
-        if len(failed_scriptlets_pkgnames) > 0:
-            failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-
-    def remove(self, pkgs, with_dependencies = True):
-        if not pkgs:
-            return
-
-        self._prepare_pkg_transaction()
-
-        if with_dependencies:
-            self._invoke_dnf(["remove"] + pkgs)
-        else:
-            cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-            args = ["-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
-
-            try:
-                bb.note("Running %s" % ' '.join([cmd] + args + pkgs))
-                output = subprocess.check_output([cmd] + args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
-                bb.note(output)
-            except subprocess.CalledProcessError as e:
-                bb.fatal("Could not invoke rpm. Command "
-                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args + pkgs), e.returncode, e.output.decode("utf-8")))
-
-    def upgrade(self):
-        self._prepare_pkg_transaction()
-        self._invoke_dnf(["upgrade"])
-
-    def autoremove(self):
-        self._prepare_pkg_transaction()
-        self._invoke_dnf(["autoremove"])
-
-    def remove_packaging_data(self):
-        self._invoke_dnf(["clean", "all"])
-        for dir in self.packaging_data_dirs:
-            bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)
-
-    def backup_packaging_data(self):
-        # Save the packaging dirs for increment rpm image generation
-        if os.path.exists(self.saved_packaging_data):
-            bb.utils.remove(self.saved_packaging_data, True)
-        for i in self.packaging_data_dirs:
-            source_dir = oe.path.join(self.target_rootfs, i)
-            target_dir = oe.path.join(self.saved_packaging_data, i)
-            if os.path.isdir(source_dir):
-                shutil.copytree(source_dir, target_dir, symlinks=True)
-            elif os.path.isfile(source_dir):
-                shutil.copy2(source_dir, target_dir)
-
-    def recovery_packaging_data(self):
-        # Move the rpmlib back
-        if os.path.exists(self.saved_packaging_data):
-            for i in self.packaging_data_dirs:
-                target_dir = oe.path.join(self.target_rootfs, i)
-                if os.path.exists(target_dir):
-                    bb.utils.remove(target_dir, True)
-                source_dir = oe.path.join(self.saved_packaging_data, i)
-                if os.path.isdir(source_dir):
-                    shutil.copytree(source_dir, target_dir, symlinks=True)
-                elif os.path.isfile(source_dir):
-                    shutil.copy2(source_dir, target_dir)
-
-    def list_installed(self):
-        output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
-                                  print_output = False)
-        packages = {}
-        current_package = None
-        current_deps = None
-        current_state = "initial"
-        for line in output.splitlines():
-            if line.startswith("Package:"):
-                package_info = line.split(" ")[1:]
-                current_package = package_info[0]
-                package_arch = package_info[1]
-                package_version = package_info[2]
-                package_rpm = package_info[3]
-                packages[current_package] = {"arch":package_arch, "ver":package_version, "filename":package_rpm}
-                current_deps = []
-            elif line.startswith("Dependencies:"):
-                current_state = "dependencies"
-            elif line.startswith("Recommendations"):
-                current_state = "recommendations"
-            elif line.startswith("DependenciesEndHere:"):
-                current_state = "initial"
-                packages[current_package]["deps"] = current_deps
-            elif len(line) > 0:
-                if current_state == "dependencies":
-                    current_deps.append(line)
-                elif current_state == "recommendations":
-                    current_deps.append("%s [REC]" % line)
-
-        return packages
-
-    def update(self):
-        self._invoke_dnf(["makecache", "--refresh"])
-
-    def _invoke_dnf(self, dnf_args, fatal = True, print_output = True ):
-        os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
-
-        dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = ["-v", "--rpmverbosity=info", "-y",
-                             "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
-                             "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
-                             "--installroot=%s" % (self.target_rootfs),
-                             "--setopt=logdir=%s" % (self.d.getVar('T'))
-                            ]
-        if hasattr(self, "rpm_repo_dir"):
-            standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))
-        cmd = [dnf_cmd] + standard_dnf_args + dnf_args
-        bb.note('Running %s' % ' '.join(cmd))
-        try:
-            output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
-            if print_output:
-                bb.debug(1, output)
-            return output
-        except subprocess.CalledProcessError as e:
-            if print_output:
-                (bb.note, bb.fatal)[fatal]("Could not invoke dnf. Command "
-                     "'%s' returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-            else:
-                (bb.note, bb.fatal)[fatal]("Could not invoke dnf. Command "
-                     "'%s' returned %d:" % (' '.join(cmd), e.returncode))
-            return e.output.decode("utf-8")
-
-    def dump_install_solution(self, pkgs):
-        open(self.solution_manifest, 'w').write(" ".join(pkgs))
-        return pkgs
-
-    def load_old_install_solution(self):
-        if not os.path.exists(self.solution_manifest):
-            return []
-        with open(self.solution_manifest, 'r') as fd:
-            return fd.read().split()
-
-    def _script_num_prefix(self, path):
-        files = os.listdir(path)
-        numbers = set()
-        numbers.add(99)
-        for f in files:
-            numbers.add(int(f.split("-")[0]))
-        return max(numbers) + 1
-
-    def save_rpmpostinst(self, pkg):
-        bb.note("Saving postinstall script of %s" % (pkg))
-        cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        args = ["-q", "--root=%s" % self.target_rootfs, "--queryformat", "%{postin}", pkg]
-
-        try:
-            output = subprocess.check_output([cmd] + args,stderr=subprocess.STDOUT).decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Could not invoke rpm. Command "
-                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args), e.returncode, e.output.decode("utf-8")))
-
-        # may need to prepend #!/bin/sh to output
-
-        target_path = oe.path.join(self.target_rootfs, self.d.expand('${sysconfdir}/rpm-postinsts/'))
-        bb.utils.mkdirhier(target_path)
-        num = self._script_num_prefix(target_path)
-        saved_script_name = oe.path.join(target_path, "%d-%s" % (num, pkg))
-        open(saved_script_name, 'w').write(output)
-        os.chmod(saved_script_name, 0o755)
-
-    def _handle_intercept_failure(self, registered_pkgs):
-        rpm_postinsts_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
-        bb.utils.mkdirhier(rpm_postinsts_dir)
-
-        # Save the package postinstalls in /etc/rpm-postinsts
-        for pkg in registered_pkgs.split():
-            self.save_rpmpostinst(pkg)
-
-    def extract(self, pkg):
-        output = self._invoke_dnf(["repoquery", "--queryformat", "%{location}", pkg])
-        pkg_name = output.splitlines()[-1]
-        if not pkg_name.endswith(".rpm"):
-            bb.fatal("dnf could not find package %s in repository: %s" %(pkg, output))
-        pkg_path = oe.path.join(self.rpm_repo_dir, pkg_name)
-
-        cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
-        rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
-
-        if not os.path.isfile(pkg_path):
-            bb.fatal("Unable to extract package for '%s'."
-                     "File %s doesn't exists" % (pkg, pkg_path))
-
-        tmp_dir = tempfile.mkdtemp()
-        current_dir = os.getcwd()
-        os.chdir(tmp_dir)
-
-        try:
-            cmd = "%s %s | %s -idmv" % (rpm2cpio_cmd, pkg_path, cpio_cmd)
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output.decode("utf-8")))
-        except OSError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s at %s" % (pkg_path, cmd, e.errno, e.strerror, e.filename))
-
-        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
-        os.chdir(current_dir)
-
-        return tmp_dir
-
-
-class OpkgDpkgPM(PackageManager):
-    def __init__(self, d, target_rootfs):
-        """
-        This is an abstract class. Do not instantiate this directly.
-        """
-        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
-
-    def package_info(self, pkg, cmd):
-        """
-        Returns a dictionary with the package info.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-        return opkg_query(output)
-
-    def extract(self, pkg, pkg_info):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
-        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
-        pkg_path = pkg_info[pkg]["filepath"]
-
-        if not os.path.isfile(pkg_path):
-            bb.fatal("Unable to extract package for '%s'."
-                     "File %s doesn't exists" % (pkg, pkg_path))
-
-        tmp_dir = tempfile.mkdtemp()
-        current_dir = os.getcwd()
-        os.chdir(tmp_dir)
-        data_tar = 'data.tar.xz'
-
-        try:
-            cmd = [ar_cmd, 'x', pkg_path]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            cmd = [tar_cmd, 'xf', data_tar]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-        except OSError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
-
-        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
-        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
-        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
-        os.chdir(current_dir)
-
-        return tmp_dir
-
-    def _handle_intercept_failure(self, registered_pkgs):
-        self.mark_packages("unpacked", registered_pkgs.split())
-
-class OpkgPM(OpkgDpkgPM):
-    def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
-        super(OpkgPM, self).__init__(d, target_rootfs)
-
-        self.config_file = config_file
-        self.pkg_archs = archs
-        self.task_name = task_name
-
-        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
-        self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
-
-        if prepare_index:
-            create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
-
-        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
-        if opkg_lib_dir[0] == "/":
-            opkg_lib_dir = opkg_lib_dir[1:]
-
-        self.opkg_dir = os.path.join(target_rootfs, opkg_lib_dir, "opkg")
-
-        bb.utils.mkdirhier(self.opkg_dir)
-
-        self.saved_opkg_dir = self.d.expand('${T}/saved/%s' % self.task_name)
-        if not os.path.exists(self.d.expand('${T}/saved')):
-            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
-
-        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
-        if self.from_feeds:
-            self._create_custom_config()
-        else:
-            self._create_config()
-
-        self.indexer = OpkgIndexer(self.d, self.deploy_dir)
-
-    def mark_packages(self, status_tag, packages=None):
-        """
-        This function will change a package's status in /var/lib/opkg/status file.
-        If 'packages' is None then the new_status will be applied to all
-        packages
-        """
-        status_file = os.path.join(self.opkg_dir, "status")
-
-        with open(status_file, "r") as sf:
-            with open(status_file + ".tmp", "w+") as tmp_sf:
-                if packages is None:
-                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
-                                        r"Package: \1\n\2Status: \3%s" % status_tag,
-                                        sf.read()))
-                else:
-                    if type(packages).__name__ != "list":
-                        raise TypeError("'packages' should be a list object")
-
-                    status = sf.read()
-                    for pkg in packages:
-                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
-                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
-                                        status)
-
-                    tmp_sf.write(status)
-
-        os.rename(status_file + ".tmp", status_file)
-
-    def _create_custom_config(self):
-        bb.note("Building from feeds activated!")
-
-        with open(self.config_file, "w+") as config_file:
-            priority = 1
-            for arch in self.pkg_archs.split():
-                config_file.write("arch %s %d\n" % (arch, priority))
-                priority += 5
-
-            for line in (self.d.getVar('IPK_FEED_URIS') or "").split():
-                feed_match = re.match(r"^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
-
-                if feed_match is not None:
-                    feed_name = feed_match.group(1)
-                    feed_uri = feed_match.group(2)
-
-                    bb.note("Add %s feed with URL %s" % (feed_name, feed_uri))
-
-                    config_file.write("src/gz %s %s\n" % (feed_name, feed_uri))
-
-            """
-            Allow to use package deploy directory contents as quick devel-testing
-            feed. This creates individual feed configs for each arch subdir of those
-            specified as compatible for the current machine.
-            NOTE: Development-helper feature, NOT a full-fledged feed.
-            """
-            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
-                for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
-                                                 self.d.getVar("sysconfdir"),
-                                                 "opkg",
-                                                 "local-%s-feed.conf" % arch)
-
-                    with open(cfg_file_name, "w+") as cfg_file:
-                        cfg_file.write("src/gz local-%s %s/%s" %
-                                       (arch,
-                                        self.d.getVar('FEED_DEPLOYDIR_BASE_URI'),
-                                        arch))
-
-                        if self.d.getVar('OPKGLIBDIR') != '/var/lib':
-                            # There is no command line option for this anymore, we need to add
-                            # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
-                            # the default value of "/var/lib" as defined in opkg:
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
-                            cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
-                            cfg_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
-                            cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
-
-
-    def _create_config(self):
-        with open(self.config_file, "w+") as config_file:
-            priority = 1
-            for arch in self.pkg_archs.split():
-                config_file.write("arch %s %d\n" % (arch, priority))
-                priority += 5
-
-            config_file.write("src oe file:%s\n" % self.deploy_dir)
-
-            for arch in self.pkg_archs.split():
-                pkgs_dir = os.path.join(self.deploy_dir, arch)
-                if os.path.isdir(pkgs_dir):
-                    config_file.write("src oe-%s file:%s\n" %
-                                      (arch, pkgs_dir))
-
-            if self.d.getVar('OPKGLIBDIR') != '/var/lib':
-                # There is no command line option for this anymore, we need to add
-                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
-                # the default value of "/var/lib" as defined in opkg:
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
-                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
-                config_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
-                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
-
-    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
-        if feed_uris == "":
-            return
-
-        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
-                                  % self.target_rootfs)
-
-        os.makedirs('%s/etc/opkg' % self.target_rootfs, exist_ok=True)
-
-        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-        archs = self.pkg_archs.split() if feed_archs is None else feed_archs.split()
-
-        with open(rootfs_config, "w+") as config_file:
-            uri_iterator = 0
-            for uri in feed_uris:
-                if archs:
-                    for arch in archs:
-                        if (feed_archs is None) and (not os.path.exists(oe.path.join(self.deploy_dir, arch))):
-                            continue
-                        bb.note('Adding opkg feed url-%s-%d (%s)' %
-                            (arch, uri_iterator, uri))
-                        config_file.write("src/gz uri-%s-%d %s/%s\n" %
-                                          (arch, uri_iterator, uri, arch))
-                else:
-                    bb.note('Adding opkg feed url-%d (%s)' %
-                        (uri_iterator, uri))
-                    config_file.write("src/gz uri-%d %s\n" %
-                                      (uri_iterator, uri))
-
-                uri_iterator += 1
-
-    def update(self):
-        self.deploy_dir_lock()
-
-        cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
-
-        try:
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            self.deploy_dir_unlock()
-            bb.fatal("Unable to update the package index files. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-        self.deploy_dir_unlock()
-
-    def install(self, pkgs, attempt_only=False):
-        if not pkgs:
-            return
-
-        cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
-        for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
-            cmd += " --add-exclude %s" % exclude
-        for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
-            cmd += " --add-ignore-recommends %s" % bad_recommendation
-        cmd += " install "
-        cmd += " ".join(pkgs)
-
-        os.environ['D'] = self.target_rootfs
-        os.environ['OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
-        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
-
-        try:
-            bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
-            bb.note(output)
-            failed_pkgs = []
-            for line in output.split('\n'):
-                if line.endswith("configuration required on target."):
-                    bb.warn(line)
-                    failed_pkgs.append(line.split(".")[0])
-            if failed_pkgs:
-                failed_postinsts_abort(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-        except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
-                                              "Command '%s' returned %d:\n%s" %
-                                              (cmd, e.returncode, e.output.decode("utf-8")))
-
-    def remove(self, pkgs, with_dependencies=True):
-        if not pkgs:
-            return
-
-        if with_dependencies:
-            cmd = "%s %s --force-remove --force-removal-of-dependent-packages remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
-        else:
-            cmd = "%s %s --force-depends remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
-
-        try:
-            bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
-            bb.note(output)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to remove packages. Command '%s' "
-                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
-
-    def write_index(self):
-        self.deploy_dir_lock()
-
-        result = self.indexer.write_index()
-
-        self.deploy_dir_unlock()
-
-        if result is not None:
-            bb.fatal(result)
-
-    def remove_packaging_data(self):
-        bb.utils.remove(self.opkg_dir, True)
-        # create the directory back, it's needed by PM lock
-        bb.utils.mkdirhier(self.opkg_dir)
-
-    def remove_lists(self):
-        if not self.from_feeds:
-            bb.utils.remove(os.path.join(self.opkg_dir, "lists"), True)
-
-    def list_installed(self):
-        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
-
-    def dummy_install(self, pkgs):
-        """
-        The following function dummy installs pkgs and returns the log of output.
-        """
-        if len(pkgs) == 0:
-            return
-
-        # Create an temp dir as opkg root for dummy installation
-        temp_rootfs = self.d.expand('${T}/opkg')
-        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
-        if opkg_lib_dir[0] == "/":
-            opkg_lib_dir = opkg_lib_dir[1:]
-        temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
-        bb.utils.mkdirhier(temp_opkg_dir)
-
-        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
-        opkg_args += self.d.getVar("OPKG_ARGS")
-
-        cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
-        try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to update. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-        # Dummy installation
-        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
-                                                opkg_args,
-                                                ' '.join(pkgs))
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to dummy install packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-        bb.utils.remove(temp_rootfs, True)
-
-        return output
-
-    def backup_packaging_data(self):
-        # Save the opkglib for increment ipk image generation
-        if os.path.exists(self.saved_opkg_dir):
-            bb.utils.remove(self.saved_opkg_dir, True)
-        shutil.copytree(self.opkg_dir,
-                        self.saved_opkg_dir,
-                        symlinks=True)
-
-    def recover_packaging_data(self):
-        # Move the opkglib back
-        if os.path.exists(self.saved_opkg_dir):
-            if os.path.exists(self.opkg_dir):
-                bb.utils.remove(self.opkg_dir, True)
-
-            bb.note('Recover packaging data')
-            shutil.copytree(self.saved_opkg_dir,
-                            self.opkg_dir,
-                            symlinks=True)
-
-    def package_info(self, pkg):
-        """
-        Returns a dictionary with the package info.
-        """
-        cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
-        pkg_info = super(OpkgPM, self).package_info(pkg, cmd)
-
-        pkg_arch = pkg_info[pkg]["arch"]
-        pkg_filename = pkg_info[pkg]["filename"]
-        pkg_info[pkg]["filepath"] = \
-                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
-
-        return pkg_info
-
-    def extract(self, pkg):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-        """
-        pkg_info = self.package_info(pkg)
-        if not pkg_info:
-            bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
-
-        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
-
-        return tmp_dir
-
-class DpkgPM(OpkgDpkgPM):
-    def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
-        super(DpkgPM, self).__init__(d, target_rootfs)
-        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), deb_repo_workdir)
-
-        create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
-
-        if apt_conf_dir is None:
-            self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
-        else:
-            self.apt_conf_dir = apt_conf_dir
-        self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
-        self.apt_get_cmd = bb.utils.which(os.getenv('PATH'), "apt-get")
-        self.apt_cache_cmd = bb.utils.which(os.getenv('PATH'), "apt-cache")
-
-        self.apt_args = d.getVar("APT_ARGS")
-
-        self.all_arch_list = archs.split()
-        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
-        self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
-
-        self._create_configs(archs, base_archs)
-
-        self.indexer = DpkgIndexer(self.d, self.deploy_dir)
-
-    def mark_packages(self, status_tag, packages=None):
-        """
-        This function will change a package's status in /var/lib/dpkg/status file.
-        If 'packages' is None then the new_status will be applied to all
-        packages
-        """
-        status_file = self.target_rootfs + "/var/lib/dpkg/status"
-
-        with open(status_file, "r") as sf:
-            with open(status_file + ".tmp", "w+") as tmp_sf:
-                if packages is None:
-                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
-                                        r"Package: \1\n\2Status: \3%s" % status_tag,
-                                        sf.read()))
-                else:
-                    if type(packages).__name__ != "list":
-                        raise TypeError("'packages' should be a list object")
-
-                    status = sf.read()
-                    for pkg in packages:
-                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
-                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
-                                        status)
-
-                    tmp_sf.write(status)
-
-        os.rename(status_file + ".tmp", status_file)
-
-    def run_pre_post_installs(self, package_name=None):
-        """
-        Run the pre/post installs for package "package_name". If package_name is
-        None, then run all pre/post install scriptlets.
-        """
-        info_dir = self.target_rootfs + "/var/lib/dpkg/info"
-        ControlScript = collections.namedtuple("ControlScript", ["suffix", "name", "argument"])
-        control_scripts = [
-                ControlScript(".preinst", "Preinstall", "install"),
-                ControlScript(".postinst", "Postinstall", "configure")]
-        status_file = self.target_rootfs + "/var/lib/dpkg/status"
-        installed_pkgs = []
-
-        with open(status_file, "r") as status:
-            for line in status.read().split('\n'):
-                m = re.match(r"^Package: (.*)", line)
-                if m is not None:
-                    installed_pkgs.append(m.group(1))
-
-        if package_name is not None and not package_name in installed_pkgs:
-            return
-
-        os.environ['D'] = self.target_rootfs
-        os.environ['OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
-        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
-
-        for pkg_name in installed_pkgs:
-            for control_script in control_scripts:
-                p_full = os.path.join(info_dir, pkg_name + control_script.suffix)
-                if os.path.exists(p_full):
-                    try:
-                        bb.note("Executing %s for package: %s ..." %
-                                 (control_script.name.lower(), pkg_name))
-                        output = subprocess.check_output([p_full, control_script.argument],
-                                stderr=subprocess.STDOUT).decode("utf-8")
-                        bb.note(output)
-                    except subprocess.CalledProcessError as e:
-                        bb.warn("%s for package %s failed with %d:\n%s" %
-                                (control_script.name, pkg_name, e.returncode,
-                                    e.output.decode("utf-8")))
-                        failed_postinsts_abort([pkg_name], self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-
-    def update(self):
-        os.environ['APT_CONFIG'] = self.apt_conf_file
-
-        self.deploy_dir_lock()
-
-        cmd = "%s update" % self.apt_get_cmd
-
-        try:
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to update the package index files. Command '%s' "
-                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
-
-        self.deploy_dir_unlock()
-
-    def install(self, pkgs, attempt_only=False):
-        if attempt_only and len(pkgs) == 0:
-            return
-
-        os.environ['APT_CONFIG'] = self.apt_conf_file
-
-        cmd = "%s %s install --force-yes --allow-unauthenticated --no-remove %s" % \
-              (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
-
-        try:
-            bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
-                                              "Command '%s' returned %d:\n%s" %
-                                              (cmd, e.returncode, e.output.decode("utf-8")))
-
-        # rename *.dpkg-new files/dirs
-        for root, dirs, files in os.walk(self.target_rootfs):
-            for dir in dirs:
-                new_dir = re.sub(r"\.dpkg-new", "", dir)
-                if dir != new_dir:
-                    os.rename(os.path.join(root, dir),
-                              os.path.join(root, new_dir))
-
-            for file in files:
-                new_file = re.sub(r"\.dpkg-new", "", file)
-                if file != new_file:
-                    os.rename(os.path.join(root, file),
-                              os.path.join(root, new_file))
-
-
-    def remove(self, pkgs, with_dependencies=True):
-        if not pkgs:
-            return
-
-        if with_dependencies:
-            os.environ['APT_CONFIG'] = self.apt_conf_file
-            cmd = "%s purge %s" % (self.apt_get_cmd, ' '.join(pkgs))
-        else:
-            cmd = "%s --admindir=%s/var/lib/dpkg --instdir=%s" \
-                  " -P --force-depends %s" % \
-                  (bb.utils.which(os.getenv('PATH'), "dpkg"),
-                   self.target_rootfs, self.target_rootfs, ' '.join(pkgs))
-
-        try:
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to remove packages. Command '%s' "
-                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
-
-    def write_index(self):
-        self.deploy_dir_lock()
-
-        result = self.indexer.write_index()
-
-        self.deploy_dir_unlock()
-
-        if result is not None:
-            bb.fatal(result)
-
-    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
-        if feed_uris == "":
-            return
-
-        sources_conf = os.path.join("%s/etc/apt/sources.list"
-                                    % self.target_rootfs)
-        arch_list = []
-
-        if feed_archs is None:
-            for arch in self.all_arch_list:
-                if not os.path.exists(os.path.join(self.deploy_dir, arch)):
-                    continue
-                arch_list.append(arch)
-        else:
-            arch_list = feed_archs.split()
-
-        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-
-        with open(sources_conf, "w+") as sources_file:
-            for uri in feed_uris:
-                if arch_list:
-                    for arch in arch_list:
-                        bb.note('Adding dpkg channel at (%s)' % uri)
-                        sources_file.write("deb %s/%s ./\n" %
-                                           (uri, arch))
-                else:
-                    bb.note('Adding dpkg channel at (%s)' % uri)
-                    sources_file.write("deb %s ./\n" % uri)
-
-    def _create_configs(self, archs, base_archs):
-        base_archs = re.sub(r"_", r"-", base_archs)
-
-        if os.path.exists(self.apt_conf_dir):
-            bb.utils.remove(self.apt_conf_dir, True)
-
-        bb.utils.mkdirhier(self.apt_conf_dir)
-        bb.utils.mkdirhier(self.apt_conf_dir + "/lists/partial/")
-        bb.utils.mkdirhier(self.apt_conf_dir + "/apt.conf.d/")
-        bb.utils.mkdirhier(self.apt_conf_dir + "/preferences.d/")
-
-        arch_list = []
-        for arch in self.all_arch_list:
-            if not os.path.exists(os.path.join(self.deploy_dir, arch)):
-                continue
-            arch_list.append(arch)
-
-        with open(os.path.join(self.apt_conf_dir, "preferences"), "w+") as prefs_file:
-            priority = 801
-            for arch in arch_list:
-                prefs_file.write(
-                    "Package: *\n"
-                    "Pin: release l=%s\n"
-                    "Pin-Priority: %d\n\n" % (arch, priority))
-
-                priority += 5
-
-            pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE') or ""
-            for pkg in pkg_exclude.split():
-                prefs_file.write(
-                    "Package: %s\n"
-                    "Pin: release *\n"
-                    "Pin-Priority: -1\n\n" % pkg)
-
-        arch_list.reverse()
-
-        with open(os.path.join(self.apt_conf_dir, "sources.list"), "w+") as sources_file:
-            for arch in arch_list:
-                sources_file.write("deb file:%s/ ./\n" %
-                                   os.path.join(self.deploy_dir, arch))
-
-        base_arch_list = base_archs.split()
-        multilib_variants = self.d.getVar("MULTILIB_VARIANTS");
-        for variant in multilib_variants.split():
-            localdata = bb.data.createCopy(self.d)
-            variant_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, False)
-            orig_arch = localdata.getVar("DPKG_ARCH")
-            localdata.setVar("DEFAULTTUNE", variant_tune)
-            variant_arch = localdata.getVar("DPKG_ARCH")
-            if variant_arch not in base_arch_list:
-                base_arch_list.append(variant_arch)
-
-        with open(self.apt_conf_file, "w+") as apt_conf:
-            with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
-                for line in apt_conf_sample.read().split("\n"):
-                    match_arch = re.match(r"  Architecture \".*\";$", line)
-                    architectures = ""
-                    if match_arch:
-                        for base_arch in base_arch_list:
-                            architectures += "\"%s\";" % base_arch
-                        apt_conf.write("  Architectures {%s};\n" % architectures);
-                        apt_conf.write("  Architecture \"%s\";\n" % base_archs)
-                    else:
-                        line = re.sub(r"#ROOTFS#", self.target_rootfs, line)
-                        line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
-                        apt_conf.write(line + "\n")
-
-        target_dpkg_dir = "%s/var/lib/dpkg" % self.target_rootfs
-        bb.utils.mkdirhier(os.path.join(target_dpkg_dir, "info"))
-
-        bb.utils.mkdirhier(os.path.join(target_dpkg_dir, "updates"))
-
-        if not os.path.exists(os.path.join(target_dpkg_dir, "status")):
-            open(os.path.join(target_dpkg_dir, "status"), "w+").close()
-        if not os.path.exists(os.path.join(target_dpkg_dir, "available")):
-            open(os.path.join(target_dpkg_dir, "available"), "w+").close()
-
-    def remove_packaging_data(self):
-        bb.utils.remove(self.target_rootfs + self.d.getVar('opkglibdir'), True)
-        bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
-
-    def fix_broken_dependencies(self):
-        os.environ['APT_CONFIG'] = self.apt_conf_file
-
-        cmd = "%s %s -f install" % (self.apt_get_cmd, self.apt_args)
-
-        try:
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot fix broken dependencies. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-    def list_installed(self):
-        return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
-
-    def package_info(self, pkg):
-        """
-        Returns a dictionary with the package info.
-        """
-        cmd = "%s show %s" % (self.apt_cache_cmd, pkg)
-        pkg_info = super(DpkgPM, self).package_info(pkg, cmd)
-
-        pkg_arch = pkg_info[pkg]["pkgarch"]
-        pkg_filename = pkg_info[pkg]["filename"]
-        pkg_info[pkg]["filepath"] = \
-                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
-
-        return pkg_info
-
-    def extract(self, pkg):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-        """
-        pkg_info = self.package_info(pkg)
-        if not pkg_info:
-            bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
-
-        tmp_dir = super(DpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
-
-        return tmp_dir
-
 def generate_index_files(d):
-    classes = d.getVar('PACKAGE_CLASSES').replace("package_", "").split()
-
-    indexer_map = {
-        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
-        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
-        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
-    }
-
-    result = None
-
-    for pkg_class in classes:
-        if not pkg_class in indexer_map:
-            continue
-
-        if os.path.exists(indexer_map[pkg_class][1]):
-            result = indexer_map[pkg_class][0](d, indexer_map[pkg_class][1]).write_index()
-
-            if result is not None:
-                bb.fatal(result)
+    import importlib
+    img_type = d.getVar('IMAGE_PKGTYPE')
+    cls = importlib.import_module('oe.package_managers.' + img_type + '.package_manager')
+    return cls.PkgIndexer(d, "").write_index()
diff --git a/meta/lib/oe/package_managers/deb/manifest.py b/meta/lib/oe/package_managers/deb/manifest.py
new file mode 100644
index 0000000000..077db13f1c
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/manifest.py
@@ -0,0 +1,31 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+import os
+import re
+import bb
+from oe.manifest import *
+
+class PkgManifest(Manifest):
+    def create_initial(self):
+        with open(self.initial_manifest, "w+") as manifest:
+            manifest.write(self.initial_manifest_file_header)
+
+            for var in self.var_maps[self.manifest_type]:
+                pkg_list = self.d.getVar(var)
+
+                if pkg_list is None:
+                    continue
+
+                for pkg in pkg_list.split():
+                    manifest.write("%s,%s\n" %
+                                   (self.var_maps[self.manifest_type][var], pkg))
+
+    def create_final(self):
+        pass
+
+    def create_full(self, pm):
+        pass
+
diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
new file mode 100644
index 0000000000..5e16c04a80
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/package_manager.py
@@ -0,0 +1,719 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+import os
+import glob
+import subprocess
+import shutil
+import re
+import collections
+import bb
+import tempfile
+import oe.utils
+import oe.path
+import string
+from oe.gpg_sign import get_signer
+import hashlib
+import fnmatch
+from oe.package_manager import *
+
+# this can be used by all PM backends to create the index files in parallel
+def create_index(arg):
+    index_cmd = arg
+
+    bb.note("Executing '%s' ..." % index_cmd)
+    result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+    if result:
+        bb.note(result)
+
+def opkg_query(cmd_output):
+    """
+    This method parse the output from the package managerand return
+    a dictionary with the information of the packages. This is used
+    when the packages are in deb or ipk format.
+    """
+    verregex = re.compile(r' \([=<>]* [^ )]*\)')
+    output = dict()
+    pkg = ""
+    arch = ""
+    ver = ""
+    filename = ""
+    dep = []
+    prov = []
+    pkgarch = ""
+    for line in cmd_output.splitlines()+['']:
+        line = line.rstrip()
+        if ':' in line:
+            if line.startswith("Package: "):
+                pkg = line.split(": ")[1]
+            elif line.startswith("Architecture: "):
+                arch = line.split(": ")[1]
+            elif line.startswith("Version: "):
+                ver = line.split(": ")[1]
+            elif line.startswith("File: ") or line.startswith("Filename:"):
+                filename = line.split(": ")[1]
+                if "/" in filename:
+                    filename = os.path.basename(filename)
+            elif line.startswith("Depends: "):
+                depends = verregex.sub('', line.split(": ")[1])
+                for depend in depends.split(", "):
+                    dep.append(depend)
+            elif line.startswith("Recommends: "):
+                recommends = verregex.sub('', line.split(": ")[1])
+                for recommend in recommends.split(", "):
+                    dep.append("%s [REC]" % recommend)
+            elif line.startswith("PackageArch: "):
+                pkgarch = line.split(": ")[1]
+            elif line.startswith("Provides: "):
+                provides = verregex.sub('', line.split(": ")[1])
+                for provide in provides.split(", "):
+                    prov.append(provide)
+
+        # When there is a blank line save the package information
+        elif not line:
+            # IPK doesn't include the filename
+            if not filename:
+                filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
+            if pkg:
+                output[pkg] = {"arch":arch, "ver":ver,
+                        "filename":filename, "deps": dep, "pkgarch":pkgarch, "provs": prov}
+            pkg = ""
+            arch = ""
+            ver = ""
+            filename = ""
+            dep = []
+            prov = []
+            pkgarch = ""
+
+    return output
+
+
+def failed_postinsts_abort(pkgs, log_path):
+    bb.fatal("""Postinstall scriptlets of %s have failed. If the intention is to defer them to first boot,
+then please place them into pkg_postinst_ontarget_${PN} ().
+Deferring to first boot via 'exit 1' is no longer supported.
+Details of the failure are in %s.""" %(pkgs, log_path))
+
+def generate_locale_archive(d, rootfs, target_arch, localedir):
+    # Pretty sure we don't need this for locale archive generation but
+    # keeping it to be safe...
+    locale_arch_options = { \
+        "arc": ["--uint32-align=4", "--little-endian"],
+        "arceb": ["--uint32-align=4", "--big-endian"],
+        "arm": ["--uint32-align=4", "--little-endian"],
+        "armeb": ["--uint32-align=4", "--big-endian"],
+        "aarch64": ["--uint32-align=4", "--little-endian"],
+        "aarch64_be": ["--uint32-align=4", "--big-endian"],
+        "sh4": ["--uint32-align=4", "--big-endian"],
+        "powerpc": ["--uint32-align=4", "--big-endian"],
+        "powerpc64": ["--uint32-align=4", "--big-endian"],
+        "powerpc64le": ["--uint32-align=4", "--little-endian"],
+        "mips": ["--uint32-align=4", "--big-endian"],
+        "mipsisa32r6": ["--uint32-align=4", "--big-endian"],
+        "mips64": ["--uint32-align=4", "--big-endian"],
+        "mipsisa64r6": ["--uint32-align=4", "--big-endian"],
+        "mipsel": ["--uint32-align=4", "--little-endian"],
+        "mipsisa32r6el": ["--uint32-align=4", "--little-endian"],
+        "mips64el": ["--uint32-align=4", "--little-endian"],
+        "mipsisa64r6el": ["--uint32-align=4", "--little-endian"],
+        "riscv64": ["--uint32-align=4", "--little-endian"],
+        "riscv32": ["--uint32-align=4", "--little-endian"],
+        "i586": ["--uint32-align=4", "--little-endian"],
+        "i686": ["--uint32-align=4", "--little-endian"],
+        "x86_64": ["--uint32-align=4", "--little-endian"]
+    }
+    if target_arch in locale_arch_options:
+        arch_options = locale_arch_options[target_arch]
+    else:
+        bb.error("locale_arch_options not found for target_arch=" + target_arch)
+        bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
+
+    # Need to set this so cross-localedef knows where the archive is
+    env = dict(os.environ)
+    env["LOCALEARCHIVE"] = oe.path.join(localedir, "locale-archive")
+
+    for name in sorted(os.listdir(localedir)):
+        path = os.path.join(localedir, name)
+        if os.path.isdir(path):
+            cmd = ["cross-localedef", "--verbose"]
+            cmd += arch_options
+            cmd += ["--add-to-archive", path]
+            subprocess.check_output(cmd, env=env, stderr=subprocess.STDOUT)
+
+class PkgIndexer(Indexer):
+    def _create_configs(self):
+        bb.utils.mkdirhier(self.apt_conf_dir)
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "lists", "partial"))
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "apt.conf.d"))
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "preferences.d"))
+
+        with open(os.path.join(self.apt_conf_dir, "preferences"),
+                "w") as prefs_file:
+            pass
+        with open(os.path.join(self.apt_conf_dir, "sources.list"),
+                "w+") as sources_file:
+            pass
+
+        with open(self.apt_conf_file, "w") as apt_conf:
+            with open(os.path.join(self.d.expand("${STAGING_ETCDIR_NATIVE}"),
+                "apt", "apt.conf.sample")) as apt_conf_sample:
+                for line in apt_conf_sample.read().split("\n"):
+                    line = re.sub(r"#ROOTFS#", "/dev/null", line)
+                    line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
+                    apt_conf.write(line + "\n")
+
+    def write_index(self):
+        if self.deploy_dir == "":
+            self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB')
+        self.apt_conf_dir = os.path.join(self.d.expand("${APTCONF_TARGET}"),
+                "apt-ftparchive")
+        self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
+        self._create_configs()
+
+        os.environ['APT_CONFIG'] = self.apt_conf_file
+
+        pkg_archs = self.d.getVar('PACKAGE_ARCHS')
+        if pkg_archs is not None:
+            arch_list = pkg_archs.split()
+        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS')
+        if sdk_pkg_archs is not None:
+            for a in sdk_pkg_archs.split():
+                if a not in pkg_archs:
+                    arch_list.append(a)
+
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
+        arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
+
+        apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
+        gzip = bb.utils.which(os.getenv('PATH'), "gzip")
+
+        index_cmds = []
+        deb_dirs_found = False
+        for arch in arch_list:
+            arch_dir = os.path.join(self.deploy_dir, arch)
+            if not os.path.isdir(arch_dir):
+                continue
+
+            cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
+
+            cmd += "%s -fcn Packages > Packages.gz;" % gzip
+
+            with open(os.path.join(arch_dir, "Release"), "w+") as release:
+                release.write("Label: %s\n" % arch)
+
+            cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
+
+            index_cmds.append(cmd)
+
+            deb_dirs_found = True
+
+        if not deb_dirs_found:
+            bb.note("There are no packages in %s" % self.deploy_dir)
+            return
+
+        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            raise NotImplementedError('Package feed signing not implementd for dpkg')
+
+
+class PkgPkgsList(PkgsList):
+
+    def list_pkgs(self):
+        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
+               "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
+               "-W"]
+
+        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\nProvides: ${Provides}\n\n")
+
+        try:
+            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
+        return opkg_query(cmd_output)
+
+
+def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies):
+    """
+    Go through our do_package_write_X dependencies and hardlink the packages we depend
+    upon into the repo directory. This prevents us seeing other packages that may
+    have been built that we don't depend upon and also packages for architectures we don't
+    support.
+    """
+    import errno
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    mytaskname = d.getVar("BB_RUNTASK")
+    pn = d.getVar("PN")
+    seendirs = set()
+    multilibs = {}
+
+    bb.utils.remove(subrepo_dir, recurse=True)
+    bb.utils.mkdirhier(subrepo_dir)
+
+    # Detect bitbake -b usage
+    nodeps = d.getVar("BB_LIMITEDDEPS") or False
+    if nodeps or not filterbydependencies:
+        oe.path.symlink(deploydir, subrepo_dir, True)
+        return
+
+    start = None
+    for dep in taskdepdata:
+        data = taskdepdata[dep]
+        if data[1] == mytaskname and data[0] == pn:
+            start = dep
+            break
+    if start is None:
+        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
+    pkgdeps = set()
+    start = [start]
+    seen = set(start)
+    # Support direct dependencies (do_rootfs -> do_package_write_X)
+    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs -> do_package_write_X)
+    while start:
+        next = []
+        for dep2 in start:
+            for dep in taskdepdata[dep2][3]:
+                if taskdepdata[dep][0] != pn:
+                    if "do_" + taskname in dep:
+                        pkgdeps.add(dep)
+                elif dep not in seen:
+                    next.append(dep)
+                    seen.add(dep)
+        start = next
+
+    for dep in pkgdeps:
+        c = taskdepdata[dep][0]
+        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
+        if not manifest:
+            bb.fatal("No manifest generated from: %s in %s" % (c, taskdepdata[dep][2]))
+        if not os.path.exists(manifest):
+            continue
+        with open(manifest, "r") as f:
+            for l in f:
+                l = l.strip()
+                deploydir = os.path.normpath(deploydir)
+                if bb.data.inherits_class('packagefeed-stability', d):
+                    dest = l.replace(deploydir + "-prediff", "")
+                else:
+                    dest = l.replace(deploydir, "")
+                dest = subrepo_dir + dest
+                if l.endswith("/"):
+                    if dest not in seendirs:
+                        bb.utils.mkdirhier(dest)
+                        seendirs.add(dest)
+                    continue
+                # Try to hardlink the file, copy if that fails
+                destdir = os.path.dirname(dest)
+                if destdir not in seendirs:
+                    bb.utils.mkdirhier(destdir)
+                    seendirs.add(destdir)
+                try:
+                    os.link(l, dest)
+                except OSError as err:
+                    if err.errno == errno.EXDEV:
+                        bb.utils.copyfile(l, dest)
+                    else:
+                        raise
+
+class OpkgPkgPM(PackageManager):
+    def __init__(self, d, target_rootfs):
+        """
+        This is an abstract class. Do not instantiate this directly.
+        """
+        super(OpkgPkgPM, self).__init__(d, target_rootfs)
+
+    def package_info(self, pkg, cmd):
+        """
+        Returns a dictionary with the package info.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to list available packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+        return opkg_query(output)
+
+    def extract(self, pkg, pkg_info):
+        """
+        Returns the path to a tmpdir where resides the contents of a package.
+
+        Deleting the tmpdir is responsability of the caller.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
+        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
+        pkg_path = pkg_info[pkg]["filepath"]
+
+        if not os.path.isfile(pkg_path):
+            bb.fatal("Unable to extract package for '%s'."
+                     "File %s doesn't exists" % (pkg, pkg_path))
+
+        tmp_dir = tempfile.mkdtemp()
+        current_dir = os.getcwd()
+        os.chdir(tmp_dir)
+        data_tar = 'data.tar.xz'
+
+        try:
+            cmd = [ar_cmd, 'x', pkg_path]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            cmd = [tar_cmd, 'xf', data_tar]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+        except OSError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
+
+        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
+        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
+        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        os.chdir(current_dir)
+
+        return tmp_dir
+
+    def _handle_intercept_failure(self, registered_pkgs):
+        self.mark_packages("unpacked", registered_pkgs.split())
+
+class PkgPM(OpkgPkgPM):
+    def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
+        super(PkgPM, self).__init__(d, target_rootfs)
+        if archs == "":
+            archs = d.getVar('DPKG_ARCH')
+        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), deb_repo_workdir)
+
+        create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
+
+        if apt_conf_dir is None:
+            self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
+        else:
+            self.apt_conf_dir = apt_conf_dir
+        self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
+        self.apt_get_cmd = bb.utils.which(os.getenv('PATH'), "apt-get")
+        self.apt_cache_cmd = bb.utils.which(os.getenv('PATH'), "apt-cache")
+
+        self.apt_args = d.getVar("APT_ARGS")
+
+        self.all_arch_list = archs.split()
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").split()
+        self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
+
+        self._create_configs(archs, base_archs)
+
+        self.indexer = PkgIndexer(self.d, self.deploy_dir)
+
+    def mark_packages(self, status_tag, packages=None):
+        """
+        This function will change a package's status in /var/lib/dpkg/status file.
+        If 'packages' is None then the new_status will be applied to all
+        packages
+        """
+        status_file = self.target_rootfs + "/var/lib/dpkg/status"
+
+        with open(status_file, "r") as sf:
+            with open(status_file + ".tmp", "w+") as tmp_sf:
+                if packages is None:
+                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
+                                        r"Package: \1\n\2Status: \3%s" % status_tag,
+                                        sf.read()))
+                else:
+                    if type(packages).__name__ != "list":
+                        raise TypeError("'packages' should be a list object")
+
+                    status = sf.read()
+                    for pkg in packages:
+                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
+                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
+                                        status)
+
+                    tmp_sf.write(status)
+
+        os.rename(status_file + ".tmp", status_file)
+
+    def run_pre_post_installs(self, package_name=None):
+        """
+        Run the pre/post installs for package "package_name". If package_name is
+        None, then run all pre/post install scriptlets.
+        """
+        info_dir = self.target_rootfs + "/var/lib/dpkg/info"
+        ControlScript = collections.namedtuple("ControlScript", ["suffix", "name", "argument"])
+        control_scripts = [
+                ControlScript(".preinst", "Preinstall", "install"),
+                ControlScript(".postinst", "Postinstall", "configure")]
+        status_file = self.target_rootfs + "/var/lib/dpkg/status"
+        installed_pkgs = []
+
+        with open(status_file, "r") as status:
+            for line in status.read().split('\n'):
+                m = re.match(r"^Package: (.*)", line)
+                if m is not None:
+                    installed_pkgs.append(m.group(1))
+
+        if package_name is not None and not package_name in installed_pkgs:
+            return
+
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
+
+        for pkg_name in installed_pkgs:
+            for control_script in control_scripts:
+                p_full = os.path.join(info_dir, pkg_name + control_script.suffix)
+                if os.path.exists(p_full):
+                    try:
+                        bb.note("Executing %s for package: %s ..." %
+                                 (control_script.name.lower(), pkg_name))
+                        output = subprocess.check_output([p_full, control_script.argument],
+                                stderr=subprocess.STDOUT).decode("utf-8")
+                        bb.note(output)
+                    except subprocess.CalledProcessError as e:
+                        bb.warn("%s for package %s failed with %d:\n%s" %
+                                (control_script.name, pkg_name, e.returncode,
+                                    e.output.decode("utf-8")))
+                        failed_postinsts_abort([pkg_name], self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
+
+    def update(self):
+        os.environ['APT_CONFIG'] = self.apt_conf_file
+
+        self.deploy_dir_lock()
+
+        cmd = "%s update" % self.apt_get_cmd
+
+        try:
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to update the package index files. Command '%s' "
+                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
+
+        self.deploy_dir_unlock()
+
+    def install(self, pkgs, attempt_only=False):
+        if attempt_only and len(pkgs) == 0:
+            return
+
+        os.environ['APT_CONFIG'] = self.apt_conf_file
+
+        cmd = "%s %s install --force-yes --allow-unauthenticated --no-remove %s" % \
+              (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
+
+        try:
+            bb.note("Installing the following packages: %s" % ' '.join(pkgs))
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
+                                              "Command '%s' returned %d:\n%s" %
+                                              (cmd, e.returncode, e.output.decode("utf-8")))
+
+        # rename *.dpkg-new files/dirs
+        for root, dirs, files in os.walk(self.target_rootfs):
+            for dir in dirs:
+                new_dir = re.sub(r"\.dpkg-new", "", dir)
+                if dir != new_dir:
+                    os.rename(os.path.join(root, dir),
+                              os.path.join(root, new_dir))
+
+            for file in files:
+                new_file = re.sub(r"\.dpkg-new", "", file)
+                if file != new_file:
+                    os.rename(os.path.join(root, file),
+                              os.path.join(root, new_file))
+
+
+    def remove(self, pkgs, with_dependencies=True):
+        if not pkgs:
+            return
+
+        if with_dependencies:
+            os.environ['APT_CONFIG'] = self.apt_conf_file
+            cmd = "%s purge %s" % (self.apt_get_cmd, ' '.join(pkgs))
+        else:
+            cmd = "%s --admindir=%s/var/lib/dpkg --instdir=%s" \
+                  " -P --force-depends %s" % \
+                  (bb.utils.which(os.getenv('PATH'), "dpkg"),
+                   self.target_rootfs, self.target_rootfs, ' '.join(pkgs))
+
+        try:
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to remove packages. Command '%s' "
+                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
+
+    def write_index(self):
+        self.deploy_dir_lock()
+
+        result = self.indexer.write_index()
+
+        self.deploy_dir_unlock()
+
+        if result is not None:
+            bb.fatal(result)
+
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        if feed_uris == "":
+            return
+
+        sources_conf = os.path.join("%s/etc/apt/sources.list"
+                                    % self.target_rootfs)
+        arch_list = []
+
+        if feed_archs is None:
+            for arch in self.all_arch_list:
+                if not os.path.exists(os.path.join(self.deploy_dir, arch)):
+                    continue
+                arch_list.append(arch)
+        else:
+            arch_list = feed_archs.split()
+
+        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
+
+        with open(sources_conf, "w+") as sources_file:
+            for uri in feed_uris:
+                if arch_list:
+                    for arch in arch_list:
+                        bb.note('Adding dpkg channel at (%s)' % uri)
+                        sources_file.write("deb %s/%s ./\n" %
+                                           (uri, arch))
+                else:
+                    bb.note('Adding dpkg channel at (%s)' % uri)
+                    sources_file.write("deb %s ./\n" % uri)
+
+    def _create_configs(self, archs, base_archs):
+        base_archs = re.sub(r"_", r"-", base_archs)
+
+        if os.path.exists(self.apt_conf_dir):
+            bb.utils.remove(self.apt_conf_dir, True)
+
+        bb.utils.mkdirhier(self.apt_conf_dir)
+        bb.utils.mkdirhier(self.apt_conf_dir + "/lists/partial/")
+        bb.utils.mkdirhier(self.apt_conf_dir + "/apt.conf.d/")
+        bb.utils.mkdirhier(self.apt_conf_dir + "/preferences.d/")
+
+        arch_list = []
+        for arch in self.all_arch_list:
+            if not os.path.exists(os.path.join(self.deploy_dir, arch)):
+                continue
+            arch_list.append(arch)
+
+        with open(os.path.join(self.apt_conf_dir, "preferences"), "w+") as prefs_file:
+            priority = 801
+            for arch in arch_list:
+                prefs_file.write(
+                    "Package: *\n"
+                    "Pin: release l=%s\n"
+                    "Pin-Priority: %d\n\n" % (arch, priority))
+
+                priority += 5
+
+            pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE') or ""
+            for pkg in pkg_exclude.split():
+                prefs_file.write(
+                    "Package: %s\n"
+                    "Pin: release *\n"
+                    "Pin-Priority: -1\n\n" % pkg)
+
+        arch_list.reverse()
+
+        with open(os.path.join(self.apt_conf_dir, "sources.list"), "w+") as sources_file:
+            for arch in arch_list:
+                sources_file.write("deb file:%s/ ./\n" %
+                                   os.path.join(self.deploy_dir, arch))
+
+        base_arch_list = base_archs.split()
+        multilib_variants = self.d.getVar("MULTILIB_VARIANTS");
+        for variant in multilib_variants.split():
+            localdata = bb.data.createCopy(self.d)
+            variant_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, False)
+            orig_arch = localdata.getVar("DPKG_ARCH")
+            localdata.setVar("DEFAULTTUNE", variant_tune)
+            variant_arch = localdata.getVar("DPKG_ARCH")
+            if variant_arch not in base_arch_list:
+                base_arch_list.append(variant_arch)
+
+        with open(self.apt_conf_file, "w+") as apt_conf:
+            with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
+                for line in apt_conf_sample.read().split("\n"):
+                    match_arch = re.match(r"  Architecture \".*\";$", line)
+                    architectures = ""
+                    if match_arch:
+                        for base_arch in base_arch_list:
+                            architectures += "\"%s\";" % base_arch
+                        apt_conf.write("  Architectures {%s};\n" % architectures);
+                        apt_conf.write("  Architecture \"%s\";\n" % base_archs)
+                    else:
+                        line = re.sub(r"#ROOTFS#", self.target_rootfs, line)
+                        line = re.sub(r"#APTCONF#", self.apt_conf_dir, line)
+                        apt_conf.write(line + "\n")
+
+        target_dpkg_dir = "%s/var/lib/dpkg" % self.target_rootfs
+        bb.utils.mkdirhier(os.path.join(target_dpkg_dir, "info"))
+
+        bb.utils.mkdirhier(os.path.join(target_dpkg_dir, "updates"))
+
+        if not os.path.exists(os.path.join(target_dpkg_dir, "status")):
+            open(os.path.join(target_dpkg_dir, "status"), "w+").close()
+        if not os.path.exists(os.path.join(target_dpkg_dir, "available")):
+            open(os.path.join(target_dpkg_dir, "available"), "w+").close()
+
+    def remove_packaging_data(self):
+        bb.utils.remove(self.target_rootfs + self.d.getVar('opkglibdir'), True)
+        bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
+
+    def fix_broken_dependencies(self):
+        os.environ['APT_CONFIG'] = self.apt_conf_file
+
+        cmd = "%s %s -f install" % (self.apt_get_cmd, self.apt_args)
+
+        try:
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot fix broken dependencies. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+    def list_installed(self):
+        return PkgPkgsList(self.d, self.target_rootfs).list_pkgs()
+
+    def package_info(self, pkg):
+        """
+        Returns a dictionary with the package info.
+        """
+        cmd = "%s show %s" % (self.apt_cache_cmd, pkg)
+        pkg_info = super(PkgPM, self).package_info(pkg, cmd)
+
+        pkg_arch = pkg_info[pkg]["pkgarch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_info[pkg]["filepath"] = \
+                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        return pkg_info
+
+    def extract(self, pkg):
+        """
+        Returns the path to a tmpdir where resides the contents of a package.
+
+        Deleting the tmpdir is responsability of the caller.
+        """
+        pkg_info = self.package_info(pkg)
+        if not pkg_info:
+            bb.fatal("Unable to get information for package '%s' while "
+                     "trying to extract the package."  % pkg)
+
+        tmp_dir = super(PkgPM, self).extract(pkg, pkg_info)
+        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
+
+        return tmp_dir
+
+
diff --git a/meta/lib/oe/package_managers/deb/rootfs.py b/meta/lib/oe/package_managers/deb/rootfs.py
new file mode 100644
index 0000000000..a6a61a2e93
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/rootfs.py
@@ -0,0 +1,213 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+from abc import ABCMeta, abstractmethod
+from oe.utils import execute_pre_post_process
+from oe.package_managers.deb.package_manager import *
+from oe.package_managers.deb.manifest import *
+from oe.rootfs import *
+import oe.path
+import filecmp
+import shutil
+import os
+import subprocess
+import re
+
+class DpkgOpkgRootfs(Rootfs):
+    def __init__(self, d, progress_reporter=None, logcatcher=None):
+        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+
+    def _get_pkgs_postinsts(self, status_file):
+        def _get_pkg_depends_list(pkg_depends):
+            pkg_depends_list = []
+            # filter version requirements like libc (>= 1.1)
+            for dep in pkg_depends.split(', '):
+                m_dep = re.match(r"^(.*) \(.*\)$", dep)
+                if m_dep:
+                    dep = m_dep.group(1)
+                pkg_depends_list.append(dep)
+
+            return pkg_depends_list
+
+        pkgs = {}
+        pkg_name = ""
+        pkg_status_match = False
+        pkg_depends = ""
+
+        with open(status_file) as status:
+            data = status.read()
+            status.close()
+            for line in data.split('\n'):
+                m_pkg = re.match(r"^Package: (.*)", line)
+                m_status = re.match(r"^Status:.*unpacked", line)
+                m_depends = re.match(r"^Depends: (.*)", line)
+
+                #Only one of m_pkg, m_status or m_depends is not None at time
+                #If m_pkg is not None, we started a new package
+                if m_pkg is not None:
+                    #Get Package name
+                    pkg_name = m_pkg.group(1)
+                    #Make sure we reset other variables
+                    pkg_status_match = False
+                    pkg_depends = ""
+                elif m_status is not None:
+                    #New status matched
+                    pkg_status_match = True
+                elif m_depends is not None:
+                    #New depends macthed
+                    pkg_depends = m_depends.group(1)
+                else:
+                    pass
+
+                #Now check if we can process package depends and postinst
+                if "" != pkg_name and pkg_status_match:
+                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
+                else:
+                    #Not enough information
+                    pass
+
+        # remove package dependencies not in postinsts
+        pkg_names = list(pkgs.keys())
+        for pkg_name in pkg_names:
+            deps = pkgs[pkg_name][:]
+
+            for d in deps:
+                if d not in pkg_names:
+                    pkgs[pkg_name].remove(d)
+
+        return pkgs
+
+    def _get_delayed_postinsts_common(self, status_file):
+        def _dep_resolve(graph, node, resolved, seen):
+            seen.append(node)
+
+            for edge in graph[node]:
+                if edge not in resolved:
+                    if edge in seen:
+                        raise RuntimeError("Packages %s and %s have " \
+                                "a circular dependency in postinsts scripts." \
+                                % (node, edge))
+                    _dep_resolve(graph, edge, resolved, seen)
+
+            resolved.append(node)
+
+        pkg_list = []
+
+        pkgs = None
+        if not self.d.getVar('PACKAGE_INSTALL').strip():
+            bb.note("Building empty image")
+        else:
+            pkgs = self._get_pkgs_postinsts(status_file)
+        if pkgs:
+            root = "__packagegroup_postinst__"
+            pkgs[root] = list(pkgs.keys())
+            _dep_resolve(pkgs, root, pkg_list, [])
+            pkg_list.remove(root)
+
+        if len(pkg_list) == 0:
+            return None
+
+        return pkg_list
+
+    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
+        if bb.utils.contains("IMAGE_FEATURES", "package-management",
+                         True, False, self.d):
+            return
+        num = 0
+        for p in self._get_delayed_postinsts():
+            bb.utils.mkdirhier(dst_postinst_dir)
+
+            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
+                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
+                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
+
+            num += 1
+
+class PkgRootfs(DpkgOpkgRootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = '^E:'
+        self.log_check_expected_regexes = \
+        [
+            "^E: Unmet dependencies."
+        ]
+
+        bb.utils.remove(self.image_rootfs, True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        self.manifest = PkgManifest(d, manifest_dir)
+        self.pm = PkgPM(d, d.getVar('IMAGE_ROOTFS'),
+                         d.getVar('PACKAGE_ARCHS'),
+                         d.getVar('DPKG_ARCH'))
+
+
+    def _create(self):
+        pkgs_to_install = self.manifest.parse_initial_manifest()
+        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS')
+        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS')
+
+        alt_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternatives")
+        bb.utils.mkdirhier(alt_dir)
+
+        # update PM index files
+        self.pm.write_index()
+
+        execute_pre_post_process(self.d, deb_pre_process_cmds)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+            # Don't support incremental, so skip that
+            self.progress_reporter.next_stage()
+
+        self.pm.update()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                self.pm.install(pkgs_to_install[pkg_type],
+                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                self.pm.fix_broken_dependencies()
+
+        if self.progress_reporter:
+            # Don't support attemptonly, so skip that
+            self.progress_reporter.next_stage()
+            self.progress_reporter.next_stage()
+
+        self.pm.install_complementary()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self._setup_dbg_rootfs(['/var/lib/dpkg'])
+
+        self.pm.fix_broken_dependencies()
+
+        self.pm.mark_packages("installed")
+
+        self.pm.run_pre_post_installs()
+
+        execute_pre_post_process(self.d, deb_post_process_cmds)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+    @staticmethod
+    def _depends_list():
+        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
+
+    def _get_delayed_postinsts(self):
+        status_file = self.image_rootfs + "/var/lib/dpkg/status"
+        return self._get_delayed_postinsts_common(status_file)
+
+    def _save_postinsts(self):
+        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts")
+        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/info")
+        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
+
+    def _log_check(self):
+        self._log_check_warn()
+        self._log_check_error()
+
+    def _cleanup(self):
+        pass
diff --git a/meta/lib/oe/package_managers/deb/sdk.py b/meta/lib/oe/package_managers/deb/sdk.py
new file mode 100644
index 0000000000..8b0ae217eb
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/sdk.py
@@ -0,0 +1,97 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+from oe.utils import execute_pre_post_process
+from oe.manifest import *
+from oe.package_manager import *
+import os
+import shutil
+import glob
+import traceback
+
+class Sdk(Sdk):
+    def __init__(self, d, manifest_dir=None):
+        super(DpkgSdk, self).__init__(d, manifest_dir)
+
+        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
+        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
+
+        self.target_manifest = DpkgManifest(d, self.manifest_dir,
+                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = DpkgManifest(d, self.manifest_dir,
+                                          Manifest.MANIFEST_TYPE_SDK_HOST)
+
+        deb_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            deb_repo_workdir = "oe-sdk-ext-repo"
+
+        self.target_pm = DpkgPM(d, self.sdk_target_sysroot,
+                                self.d.getVar("PACKAGE_ARCHS"),
+                                self.d.getVar("DPKG_ARCH"),
+                                self.target_conf_dir,
+                                deb_repo_workdir=deb_repo_workdir)
+
+        self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
+                              self.d.getVar("SDK_PACKAGE_ARCHS"),
+                              self.d.getVar("DEB_SDK_ARCH"),
+                              self.host_conf_dir,
+                              deb_repo_workdir=deb_repo_workdir)
+
+    def _copy_apt_dir_to(self, dst_dir):
+        staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE")
+
+        self.remove(dst_dir, True)
+
+        shutil.copytree(os.path.join(staging_etcdir_native, "apt"), dst_dir)
+
+    def _populate_sysroot(self, pm, manifest):
+        pkgs_to_install = manifest.parse_initial_manifest()
+
+        pm.write_index()
+        pm.update()
+
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                pm.install(pkgs_to_install[pkg_type],
+                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+
+    def _populate(self):
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
+
+        bb.note("Installing TARGET packages")
+        self._populate_sysroot(self.target_pm, self.target_manifest)
+
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
+
+        self.target_pm.run_intercepts(populate_sdk='target')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
+
+        self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc", "apt"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.target_pm.remove_packaging_data()
+
+        bb.note("Installing NATIVESDK packages")
+        self._populate_sysroot(self.host_pm, self.host_manifest)
+        self.install_locales(self.host_pm)
+
+        self.host_pm.run_intercepts(populate_sdk='host')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
+
+        self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_native_path,
+                                           "etc", "apt"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
+
+        native_dpkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
+                                             "var", "lib", "dpkg")
+        self.mkdirhier(native_dpkg_state_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "dpkg", "*")):
+            self.movefile(f, native_dpkg_state_dir)
+        self.remove(os.path.join(self.sdk_output, "var"), True)
+
diff --git a/meta/lib/oe/package_managers/ipk/.package_manager.py.swo b/meta/lib/oe/package_managers/ipk/.package_manager.py.swo
new file mode 100644
index 0000000000000000000000000000000000000000..e75431e2caaac37152ef454e776d8a9d53ead35e
GIT binary patch
literal 45056
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%0DEzUftl9XWb(PLbVFh%0HTPkkD
zI~U`USOrTZ)Gal?M3+)Ze?wxeXODkZAX^W2$xC5!w}n!-IKu?1rhMWFVU28Nb}(j&
zxTuUEQ3F+Ujr2YmN7W<L>!0iUHTAkEs)l-pGTuz-WbICcoFuySk3LBJqSW!{&x9i=
zoI}xdO_|!_!`X9g8bv!1jY;o2UG20+mtA|rarb9IEQ@MepzQnt$VGB`QWn{AAv-hz
zaqbWY%jyb0I#;xhm5oHtQ+A6{UhR`(0WH^q%9CHTZ(n8qk%fin!%It(i#MNjw>wDs
zbO<M{cpaB__TvPwzcMNw3}!^<%N+Q*GxbZUHmadpvEL6uLXf#iNCubmpJHAwzCC?-
zKV1<A7dEKKVIq2|Ca+`}MIUP2DGaxuf0(;)tW`*dHMA6lBl^iir=<V+<~J#vo%r%I
zn$;0rN^~DFXJxzGgc<IG=C|Z*>DqrexMAjK+VUGa9HMbLICJ=*+NGz1Ivl2(&dlMZ
z>4p8%^Ggymw$Mg9h?IY@^8f!^<k!oQdqw`A6j_vyod16h*aTBR&H#KO_%bs8m%tx@
zDtI!G^Zn(w|Mmen@9(R~{qF=X1ABq|&fnL8_4j`t-){pQunMjP;w$iZWd6^A{{`*@
zA?SeJ;3;4`_!%H)0G<Wc1KA7k9`HxtH^Hxh8^I0W`^fp<1MdNE2X6yia3i<^$a(*N
zL%r_=_AJ0>^8Fg1=%Gn5{6D0?kOD&r{K!(kF1xHA!!t)A23inh)`T&UuVO12o;j+#
zr18X-A1M0&^dok9o1-*`t6njBB_(1G&m2uV6>U)sJy6_F@~KwmCo_g}xHrG+eNkuK
zE)35cRcD@x$T&Q6G$(yZJ_w@2Ge@J}XVWy1ZF5GkH#~DxPx!+#M`P7%tW?!1Q`8jN
L8h73UYI6SphyiC9

literal 0
HcmV?d00001

diff --git a/meta/lib/oe/package_managers/ipk/manifest.py b/meta/lib/oe/package_managers/ipk/manifest.py
new file mode 100644
index 0000000000..0ef13cb371
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/manifest.py
@@ -0,0 +1,79 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+import os
+import re
+import bb
+from oe.manifest import *
+
+class PkgManifest(Manifest):
+    """
+    Returns a dictionary object with mip and mlp packages.
+    """
+    def _split_multilib(self, pkg_list):
+        pkgs = dict()
+
+        for pkg in pkg_list.split():
+            pkg_type = self.PKG_TYPE_MUST_INSTALL
+
+            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
+
+            for ml_variant in ml_variants:
+                if pkg.startswith(ml_variant + '-'):
+                    pkg_type = self.PKG_TYPE_MULTILIB
+
+            if not pkg_type in pkgs:
+                pkgs[pkg_type] = pkg
+            else:
+                pkgs[pkg_type] += " " + pkg
+
+        return pkgs
+
+    def create_initial(self):
+        pkgs = dict()
+
+        with open(self.initial_manifest, "w+") as manifest:
+            manifest.write(self.initial_manifest_file_header)
+
+            for var in self.var_maps[self.manifest_type]:
+                if var in self.vars_to_split:
+                    split_pkgs = self._split_multilib(self.d.getVar(var))
+                    if split_pkgs is not None:
+                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
+                else:
+                    pkg_list = self.d.getVar(var)
+                    if pkg_list is not None:
+                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
+
+            for pkg_type in sorted(pkgs):
+                for pkg in sorted(pkgs[pkg_type].split()):
+                    manifest.write("%s,%s\n" % (pkg_type, pkg))
+
+    def create_final(self):
+        pass
+
+    def create_full(self, pm):
+        if not os.path.exists(self.initial_manifest):
+            self.create_initial()
+
+        initial_manifest = self.parse_initial_manifest()
+        pkgs_to_install = list()
+        for pkg_type in initial_manifest:
+            pkgs_to_install += initial_manifest[pkg_type]
+        if len(pkgs_to_install) == 0:
+            return
+
+        output = pm.dummy_install(pkgs_to_install)
+
+        with open(self.full_manifest, 'w+') as manifest:
+            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
+            for line in set(output.split('\n')):
+                m = pkg_re.match(line)
+                if m:
+                    manifest.write(m.group(1) + '\n')
+
+        return
+
+
diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
new file mode 100644
index 0000000000..94895746ef
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/package_manager.py
@@ -0,0 +1,588 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+import os
+import glob
+import subprocess
+import shutil
+import re
+import collections
+import bb
+import tempfile
+import oe.utils
+import oe.path
+import string
+from oe.gpg_sign import get_signer
+import hashlib
+import fnmatch
+from oe.package_manager import *
+
+def opkg_query(cmd_output):
+    """
+    This method parse the output from the package managerand return
+    a dictionary with the information of the packages. This is used
+    when the packages are in deb or ipk format.
+    """
+    verregex = re.compile(r' \([=<>]* [^ )]*\)')
+    output = dict()
+    pkg = ""
+    arch = ""
+    ver = ""
+    filename = ""
+    dep = []
+    prov = []
+    pkgarch = ""
+    for line in cmd_output.splitlines()+['']:
+        line = line.rstrip()
+        if ':' in line:
+            if line.startswith("Package: "):
+                pkg = line.split(": ")[1]
+            elif line.startswith("Architecture: "):
+                arch = line.split(": ")[1]
+            elif line.startswith("Version: "):
+                ver = line.split(": ")[1]
+            elif line.startswith("File: ") or line.startswith("Filename:"):
+                filename = line.split(": ")[1]
+                if "/" in filename:
+                    filename = os.path.basename(filename)
+            elif line.startswith("Depends: "):
+                depends = verregex.sub('', line.split(": ")[1])
+                for depend in depends.split(", "):
+                    dep.append(depend)
+            elif line.startswith("Recommends: "):
+                recommends = verregex.sub('', line.split(": ")[1])
+                for recommend in recommends.split(", "):
+                    dep.append("%s [REC]" % recommend)
+            elif line.startswith("PackageArch: "):
+                pkgarch = line.split(": ")[1]
+            elif line.startswith("Provides: "):
+                provides = verregex.sub('', line.split(": ")[1])
+                for provide in provides.split(", "):
+                    prov.append(provide)
+
+        # When there is a blank line save the package information
+        elif not line:
+            # IPK doesn't include the filename
+            if not filename:
+                filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
+            if pkg:
+                output[pkg] = {"arch":arch, "ver":ver,
+                        "filename":filename, "deps": dep, "pkgarch":pkgarch, "provs": prov}
+            pkg = ""
+            arch = ""
+            ver = ""
+            filename = ""
+            dep = []
+            prov = []
+            pkgarch = ""
+
+    return output
+
+class PkgIndexer(Indexer):
+    def write_index(self):
+        if self.deploy_dir == "":
+            self.deploy_dir = self.d.getVar('DEPLOY_DIR_IPK')
+        arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
+                     "SDK_PACKAGE_ARCHS",
+                     ]
+
+        opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
+        else:
+            signer = None
+
+        if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
+            open(os.path.join(self.deploy_dir, "Packages"), "w").close()
+
+        index_cmds = set()
+        index_sign_files = set()
+        for arch_var in arch_vars:
+            archs = self.d.getVar(arch_var)
+            if archs is None:
+                continue
+
+            for arch in archs.split():
+                pkgs_dir = os.path.join(self.deploy_dir, arch)
+                pkgs_file = os.path.join(pkgs_dir, "Packages")
+
+                if not os.path.isdir(pkgs_dir):
+                    continue
+
+                if not os.path.exists(pkgs_file):
+                    open(pkgs_file, "w").close()
+
+                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
+                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+
+                index_sign_files.add(pkgs_file)
+
+        if len(index_cmds) == 0:
+            bb.note("There are no packages in %s!" % self.deploy_dir)
+            return
+
+        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
+
+        if signer:
+            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
+            is_ascii_sig = (feed_sig_type.upper() != "BIN")
+            for f in index_sign_files:
+                signer.detach_sign(f,
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
+                                   armor=is_ascii_sig)
+
+
+class PkgPkgsList(PkgsList):
+    def __init__(self, d, rootfs_dir, config_file = ""):
+        super(PkgPkgsList, self).__init__(d, rootfs_dir)
+        if config_file == "":
+            config_file = d.getVar('IPKGCONF_TARGET')
+
+        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
+        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
+        self.opkg_args += self.d.getVar("OPKG_ARGS")
+
+    def list_pkgs(self, format=None):
+        cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
+
+        # opkg returns success even when it printed some
+        # "Collected errors:" report to stderr. Mixing stderr into
+        # stdout then leads to random failures later on when
+        # parsing the output. To avoid this we need to collect both
+        # output streams separately and check for empty stderr.
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        cmd_output, cmd_stderr = p.communicate()
+        cmd_output = cmd_output.decode("utf-8")
+        cmd_stderr = cmd_stderr.decode("utf-8")
+        if p.returncode or cmd_stderr:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
+
+        return opkg_query(cmd_output)
+
+
+class OpkgDpkgPM(PackageManager):
+    def __init__(self, d, target_rootfs):
+        """
+        This is an abstract class. Do not instantiate this directly.
+        """
+        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
+
+    def package_info(self, pkg, cmd):
+        """
+        Returns a dictionary with the package info.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to list available packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+        return opkg_query(output)
+
+    def extract(self, pkg, pkg_info):
+        """
+        Returns the path to a tmpdir where resides the contents of a package.
+
+        Deleting the tmpdir is responsability of the caller.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
+        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
+        pkg_path = pkg_info[pkg]["filepath"]
+
+        if not os.path.isfile(pkg_path):
+            bb.fatal("Unable to extract package for '%s'."
+                     "File %s doesn't exists" % (pkg, pkg_path))
+
+        tmp_dir = tempfile.mkdtemp()
+        current_dir = os.getcwd()
+        os.chdir(tmp_dir)
+        data_tar = 'data.tar.xz'
+
+        try:
+            cmd = [ar_cmd, 'x', pkg_path]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            cmd = [tar_cmd, 'xf', data_tar]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+        except OSError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
+
+        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
+        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
+        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        os.chdir(current_dir)
+
+        return tmp_dir
+
+    def _handle_intercept_failure(self, registered_pkgs):
+        self.mark_packages("unpacked", registered_pkgs.split())
+
+class PkgPM(OpkgDpkgPM):
+    def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
+        super(PkgPM, self).__init__(d, target_rootfs)
+
+        if config_file == "":
+            config_file = d.getVar('IPKGCONF_TARGET')
+        if archs == "":
+            archs = d.getVar('ALL_MULTILIB_PACKAGE_ARCHS')
+        self.config_file = config_file
+        self.pkg_archs = archs
+        self.task_name = task_name
+
+        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
+        self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
+        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
+        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
+        self.opkg_args += self.d.getVar("OPKG_ARGS")
+
+        if prepare_index:
+            create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
+
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
+        if opkg_lib_dir[0] == "/":
+            opkg_lib_dir = opkg_lib_dir[1:]
+
+        self.opkg_dir = os.path.join(target_rootfs, opkg_lib_dir, "opkg")
+
+        bb.utils.mkdirhier(self.opkg_dir)
+
+        self.saved_opkg_dir = self.d.expand('${T}/saved/%s' % self.task_name)
+        if not os.path.exists(self.d.expand('${T}/saved')):
+            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
+
+        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
+        if self.from_feeds:
+            self._create_custom_config()
+        else:
+            self._create_config()
+
+        self.indexer = PkgIndexer(self.d, self.deploy_dir)
+
+    def mark_packages(self, status_tag, packages=None):
+        """
+        This function will change a package's status in /var/lib/opkg/status file.
+        If 'packages' is None then the new_status will be applied to all
+        packages
+        """
+        status_file = os.path.join(self.opkg_dir, "status")
+
+        with open(status_file, "r") as sf:
+            with open(status_file + ".tmp", "w+") as tmp_sf:
+                if packages is None:
+                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
+                                        r"Package: \1\n\2Status: \3%s" % status_tag,
+                                        sf.read()))
+                else:
+                    if type(packages).__name__ != "list":
+                        raise TypeError("'packages' should be a list object")
+
+                    status = sf.read()
+                    for pkg in packages:
+                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
+                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
+                                        status)
+
+                    tmp_sf.write(status)
+
+        os.rename(status_file + ".tmp", status_file)
+
+    def _create_custom_config(self):
+        bb.note("Building from feeds activated!")
+
+        with open(self.config_file, "w+") as config_file:
+            priority = 1
+            for arch in self.pkg_archs.split():
+                config_file.write("arch %s %d\n" % (arch, priority))
+                priority += 5
+
+            for line in (self.d.getVar('IPK_FEED_URIS') or "").split():
+                feed_match = re.match(r"^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
+
+                if feed_match is not None:
+                    feed_name = feed_match.group(1)
+                    feed_uri = feed_match.group(2)
+
+                    bb.note("Add %s feed with URL %s" % (feed_name, feed_uri))
+
+                    config_file.write("src/gz %s %s\n" % (feed_name, feed_uri))
+
+            """
+            Allow to use package deploy directory contents as quick devel-testing
+            feed. This creates individual feed configs for each arch subdir of those
+            specified as compatible for the current machine.
+            NOTE: Development-helper feature, NOT a full-fledged feed.
+            """
+            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
+                for arch in self.pkg_archs.split():
+                    cfg_file_name = os.path.join(self.target_rootfs,
+                                                 self.d.getVar("sysconfdir"),
+                                                 "opkg",
+                                                 "local-%s-feed.conf" % arch)
+
+                    with open(cfg_file_name, "w+") as cfg_file:
+                        cfg_file.write("src/gz local-%s %s/%s" %
+                                       (arch,
+                                        self.d.getVar('FEED_DEPLOYDIR_BASE_URI'),
+                                        arch))
+
+                        if self.d.getVar('OPKGLIBDIR') != '/var/lib':
+                            # There is no command line option for this anymore, we need to add
+                            # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                            # the default value of "/var/lib" as defined in opkg:
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
+                            cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                            cfg_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
+                            cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
+
+
+    def _create_config(self):
+        with open(self.config_file, "w+") as config_file:
+            priority = 1
+            for arch in self.pkg_archs.split():
+                config_file.write("arch %s %d\n" % (arch, priority))
+                priority += 5
+
+            config_file.write("src oe file:%s\n" % self.deploy_dir)
+
+            for arch in self.pkg_archs.split():
+                pkgs_dir = os.path.join(self.deploy_dir, arch)
+                if os.path.isdir(pkgs_dir):
+                    config_file.write("src oe-%s file:%s\n" %
+                                      (arch, pkgs_dir))
+
+            if self.d.getVar('OPKGLIBDIR') != '/var/lib':
+                # There is no command line option for this anymore, we need to add
+                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                # the default value of "/var/lib" as defined in opkg:
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
+                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                config_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
+                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
+
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        if feed_uris == "":
+            return
+
+        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
+                                  % self.target_rootfs)
+
+        os.makedirs('%s/etc/opkg' % self.target_rootfs, exist_ok=True)
+
+        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
+        archs = self.pkg_archs.split() if feed_archs is None else feed_archs.split()
+
+        with open(rootfs_config, "w+") as config_file:
+            uri_iterator = 0
+            for uri in feed_uris:
+                if archs:
+                    for arch in archs:
+                        if (feed_archs is None) and (not os.path.exists(oe.path.join(self.deploy_dir, arch))):
+                            continue
+                        bb.note('Adding opkg feed url-%s-%d (%s)' %
+                            (arch, uri_iterator, uri))
+                        config_file.write("src/gz uri-%s-%d %s/%s\n" %
+                                          (arch, uri_iterator, uri, arch))
+                else:
+                    bb.note('Adding opkg feed url-%d (%s)' %
+                        (uri_iterator, uri))
+                    config_file.write("src/gz uri-%d %s\n" %
+                                      (uri_iterator, uri))
+
+                uri_iterator += 1
+
+    def update(self):
+        self.deploy_dir_lock()
+
+        cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
+
+        try:
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            self.deploy_dir_unlock()
+            bb.fatal("Unable to update the package index files. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+        self.deploy_dir_unlock()
+
+    def install(self, pkgs, attempt_only=False):
+        if not pkgs:
+            return
+
+        cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
+        for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
+            cmd += " --add-exclude %s" % exclude
+        for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
+            cmd += " --add-ignore-recommends %s" % bad_recommendation
+        cmd += " install "
+        cmd += " ".join(pkgs)
+
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
+
+        try:
+            bb.note("Installing the following packages: %s" % ' '.join(pkgs))
+            bb.note(cmd)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
+            bb.note(output)
+            failed_pkgs = []
+            for line in output.split('\n'):
+                if line.endswith("configuration required on target."):
+                    bb.warn(line)
+                    failed_pkgs.append(line.split(".")[0])
+            if failed_pkgs:
+                failed_postinsts_abort(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
+        except subprocess.CalledProcessError as e:
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
+                                              "Command '%s' returned %d:\n%s" %
+                                              (cmd, e.returncode, e.output.decode("utf-8")))
+
+    def remove(self, pkgs, with_dependencies=True):
+        if not pkgs:
+            return
+
+        if with_dependencies:
+            cmd = "%s %s --force-remove --force-removal-of-dependent-packages remove %s" % \
+                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+        else:
+            cmd = "%s %s --force-depends remove %s" % \
+                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+
+        try:
+            bb.note(cmd)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
+            bb.note(output)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to remove packages. Command '%s' "
+                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
+
+    def write_index(self):
+        self.deploy_dir_lock()
+
+        result = self.indexer.write_index()
+
+        self.deploy_dir_unlock()
+
+        if result is not None:
+            bb.fatal(result)
+
+    def remove_packaging_data(self):
+        bb.utils.remove(self.opkg_dir, True)
+        # create the directory back, it's needed by PM lock
+        bb.utils.mkdirhier(self.opkg_dir)
+
+    def remove_lists(self):
+        if not self.from_feeds:
+            bb.utils.remove(os.path.join(self.opkg_dir, "lists"), True)
+
+    def list_installed(self):
+        return PkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
+
+    def dummy_install(self, pkgs):
+        """
+        The following function dummy installs pkgs and returns the log of output.
+        """
+        if len(pkgs) == 0:
+            return
+
+        # Create an temp dir as opkg root for dummy installation
+        temp_rootfs = self.d.expand('${T}/opkg')
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
+        if opkg_lib_dir[0] == "/":
+            opkg_lib_dir = opkg_lib_dir[1:]
+        temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
+        bb.utils.mkdirhier(temp_opkg_dir)
+
+        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
+        opkg_args += self.d.getVar("OPKG_ARGS")
+
+        cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
+        try:
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to update. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+        # Dummy installation
+        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
+                                                opkg_args,
+                                                ' '.join(pkgs))
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to dummy install packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+        bb.utils.remove(temp_rootfs, True)
+
+        return output
+
+    def backup_packaging_data(self):
+        # Save the opkglib for increment ipk image generation
+        if os.path.exists(self.saved_opkg_dir):
+            bb.utils.remove(self.saved_opkg_dir, True)
+        shutil.copytree(self.opkg_dir,
+                        self.saved_opkg_dir,
+                        symlinks=True)
+
+    def recover_packaging_data(self):
+        # Move the opkglib back
+        if os.path.exists(self.saved_opkg_dir):
+            if os.path.exists(self.opkg_dir):
+                bb.utils.remove(self.opkg_dir, True)
+
+            bb.note('Recover packaging data')
+            shutil.copytree(self.saved_opkg_dir,
+                            self.opkg_dir,
+                            symlinks=True)
+
+    def package_info(self, pkg):
+        """
+        Returns a dictionary with the package info.
+        """
+        cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
+        pkg_info = super(PkgPM, self).package_info(pkg, cmd)
+
+        pkg_arch = pkg_info[pkg]["arch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_info[pkg]["filepath"] = \
+                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        return pkg_info
+
+    def extract(self, pkg):
+        """
+        Returns the path to a tmpdir where resides the contents of a package.
+
+        Deleting the tmpdir is responsability of the caller.
+        """
+        pkg_info = self.package_info(pkg)
+        if not pkg_info:
+            bb.fatal("Unable to get information for package '%s' while "
+                     "trying to extract the package."  % pkg)
+
+        tmp_dir = super(PkgPM, self).extract(pkg, pkg_info)
+        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
+
+        return tmp_dir
diff --git a/meta/lib/oe/package_managers/ipk/rootfs.py b/meta/lib/oe/package_managers/ipk/rootfs.py
new file mode 100644
index 0000000000..a6e1a5cd4a
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/rootfs.py
@@ -0,0 +1,395 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+from abc import ABCMeta, abstractmethod
+from oe.utils import execute_pre_post_process
+from oe.package_manager import *
+from oe.manifest import *
+from oe.rootfs import *
+from oe.package_managers.ipk.package_manager import *
+import oe.path
+import filecmp
+import shutil
+import os
+import subprocess
+import re
+
+
+class DpkgOpkgRootfs(Rootfs):
+    def __init__(self, d, progress_reporter=None, logcatcher=None):
+        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+
+    def _get_pkgs_postinsts(self, status_file):
+        def _get_pkg_depends_list(pkg_depends):
+            pkg_depends_list = []
+            # filter version requirements like libc (>= 1.1)
+            for dep in pkg_depends.split(', '):
+                m_dep = re.match(r"^(.*) \(.*\)$", dep)
+                if m_dep:
+                    dep = m_dep.group(1)
+                pkg_depends_list.append(dep)
+
+            return pkg_depends_list
+
+        pkgs = {}
+        pkg_name = ""
+        pkg_status_match = False
+        pkg_depends = ""
+
+        with open(status_file) as status:
+            data = status.read()
+            status.close()
+            for line in data.split('\n'):
+                m_pkg = re.match(r"^Package: (.*)", line)
+                m_status = re.match(r"^Status:.*unpacked", line)
+                m_depends = re.match(r"^Depends: (.*)", line)
+
+                #Only one of m_pkg, m_status or m_depends is not None at time
+                #If m_pkg is not None, we started a new package
+                if m_pkg is not None:
+                    #Get Package name
+                    pkg_name = m_pkg.group(1)
+                    #Make sure we reset other variables
+                    pkg_status_match = False
+                    pkg_depends = ""
+                elif m_status is not None:
+                    #New status matched
+                    pkg_status_match = True
+                elif m_depends is not None:
+                    #New depends macthed
+                    pkg_depends = m_depends.group(1)
+                else:
+                    pass
+
+                #Now check if we can process package depends and postinst
+                if "" != pkg_name and pkg_status_match:
+                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
+                else:
+                    #Not enough information
+                    pass
+
+        # remove package dependencies not in postinsts
+        pkg_names = list(pkgs.keys())
+        for pkg_name in pkg_names:
+            deps = pkgs[pkg_name][:]
+
+            for d in deps:
+                if d not in pkg_names:
+                    pkgs[pkg_name].remove(d)
+
+        return pkgs
+
+    def _get_delayed_postinsts_common(self, status_file):
+        def _dep_resolve(graph, node, resolved, seen):
+            seen.append(node)
+
+            for edge in graph[node]:
+                if edge not in resolved:
+                    if edge in seen:
+                        raise RuntimeError("Packages %s and %s have " \
+                                "a circular dependency in postinsts scripts." \
+                                % (node, edge))
+                    _dep_resolve(graph, edge, resolved, seen)
+
+            resolved.append(node)
+
+        pkg_list = []
+
+        pkgs = None
+        if not self.d.getVar('PACKAGE_INSTALL').strip():
+            bb.note("Building empty image")
+        else:
+            pkgs = self._get_pkgs_postinsts(status_file)
+        if pkgs:
+            root = "__packagegroup_postinst__"
+            pkgs[root] = list(pkgs.keys())
+            _dep_resolve(pkgs, root, pkg_list, [])
+            pkg_list.remove(root)
+
+        if len(pkg_list) == 0:
+            return None
+
+        return pkg_list
+
+    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
+        if bb.utils.contains("IMAGE_FEATURES", "package-management",
+                         True, False, self.d):
+            return
+        num = 0
+        for p in self._get_delayed_postinsts():
+            bb.utils.mkdirhier(dst_postinst_dir)
+
+            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
+                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
+                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
+
+            num += 1
+
+class PkgRootfs(DpkgOpkgRootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = '(exit 1|Collected errors)'
+
+        import importlib
+        imgtype = d.getVar('IMAGE_PKGTYPE')
+        mod = importlib.import_module('oe.package_managers.' + imgtype + '.manifest')
+
+        self.manifest = mod.PkgManifest(d, manifest_dir)
+        self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
+
+        self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
+        if self._remove_old_rootfs():
+            bb.utils.remove(self.image_rootfs, True)
+            self.pm = PkgPM(d,
+                             self.image_rootfs,
+                             self.opkg_conf,
+                             self.pkg_archs)
+        else:
+            self.pm = PkgPM(d,
+                             self.image_rootfs,
+                             self.opkg_conf,
+                             self.pkg_archs)
+            self.pm.recover_packaging_data()
+
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+
+    def _prelink_file(self, root_dir, filename):
+        bb.note('prelink %s in %s' % (filename, root_dir))
+        prelink_cfg = oe.path.join(root_dir,
+                                   self.d.expand('${sysconfdir}/prelink.conf'))
+        if not os.path.exists(prelink_cfg):
+            shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),
+                        prelink_cfg)
+
+        cmd_prelink = self.d.expand('${STAGING_DIR_NATIVE}${sbindir_native}/prelink')
+        self._exec_shell_cmd([cmd_prelink,
+                              '--root',
+                              root_dir,
+                              '-amR',
+                              '-N',
+                              '-c',
+                              self.d.expand('${sysconfdir}/prelink.conf')])
+
+    '''
+    Compare two files with the same key twice to see if they are equal.
+    If they are not equal, it means they are duplicated and come from
+    different packages.
+    1st: Comapre them directly;
+    2nd: While incremental image creation is enabled, one of the
+         files could be probaly prelinked in the previous image
+         creation and the file has been changed, so we need to
+         prelink the other one and compare them.
+    '''
+    def _file_equal(self, key, f1, f2):
+
+        # Both of them are not prelinked
+        if filecmp.cmp(f1, f2):
+            return True
+
+        if bb.data.inherits_class('image-prelink', self.d):
+            if self.image_rootfs not in f1:
+                self._prelink_file(f1.replace(key, ''), f1)
+
+            if self.image_rootfs not in f2:
+                self._prelink_file(f2.replace(key, ''), f2)
+
+            # Both of them are prelinked
+            if filecmp.cmp(f1, f2):
+                return True
+
+        # Not equal
+        return False
+
+    """
+    This function was reused from the old implementation.
+    See commit: "image.bbclass: Added variables for multilib support." by
+    Lianhao Lu.
+    """
+    def _multilib_sanity_test(self, dirs):
+
+        allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP")
+        if allow_replace is None:
+            allow_replace = ""
+
+        allow_rep = re.compile(re.sub(r"\|$", r"", allow_replace))
+        error_prompt = "Multilib check error:"
+
+        files = {}
+        for dir in dirs:
+            for root, subfolders, subfiles in os.walk(dir):
+                for file in subfiles:
+                    item = os.path.join(root, file)
+                    key = str(os.path.join("/", os.path.relpath(item, dir)))
+
+                    valid = True
+                    if key in files:
+                        #check whether the file is allow to replace
+                        if allow_rep.match(key):
+                            valid = True
+                        else:
+                            if os.path.exists(files[key]) and \
+                               os.path.exists(item) and \
+                               not self._file_equal(key, files[key], item):
+                                valid = False
+                                bb.fatal("%s duplicate files %s %s is not the same\n" %
+                                         (error_prompt, item, files[key]))
+
+                    #pass the check, add to list
+                    if valid:
+                        files[key] = item
+
+    def _multilib_test_install(self, pkgs):
+        ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS")
+        bb.utils.mkdirhier(ml_temp)
+
+        dirs = [self.image_rootfs]
+
+        for variant in self.d.getVar("MULTILIB_VARIANTS").split():
+            ml_target_rootfs = os.path.join(ml_temp, variant)
+
+            bb.utils.remove(ml_target_rootfs, True)
+
+            ml_opkg_conf = os.path.join(ml_temp,
+                                        variant + "-" + os.path.basename(self.opkg_conf))
+
+            ml_pm = OpkgPM(self.d, ml_target_rootfs, ml_opkg_conf, self.pkg_archs, prepare_index=False)
+
+            ml_pm.update()
+            ml_pm.install(pkgs)
+
+            dirs.append(ml_target_rootfs)
+
+        self._multilib_sanity_test(dirs)
+
+    '''
+    While ipk incremental image generation is enabled, it will remove the
+    unneeded pkgs by comparing the old full manifest in previous existing
+    image and the new full manifest in the current image.
+    '''
+    def _remove_extra_packages(self, pkgs_initial_install):
+        if self.inc_opkg_image_gen == "1":
+            # Parse full manifest in previous existing image creation session
+            old_full_manifest = self.manifest.parse_full_manifest()
+
+            # Create full manifest for the current image session, the old one
+            # will be replaced by the new one.
+            self.manifest.create_full(self.pm)
+
+            # Parse full manifest in current image creation session
+            new_full_manifest = self.manifest.parse_full_manifest()
+
+            pkg_to_remove = list()
+            for pkg in old_full_manifest:
+                if pkg not in new_full_manifest:
+                    pkg_to_remove.append(pkg)
+
+            if pkg_to_remove != []:
+                bb.note('decremental removed: %s' % ' '.join(pkg_to_remove))
+                self.pm.remove(pkg_to_remove)
+
+    '''
+    Compare with previous existing image creation, if some conditions
+    triggered, the previous old image should be removed.
+    The conditions include any of 'PACKAGE_EXCLUDE, NO_RECOMMENDATIONS
+    and BAD_RECOMMENDATIONS' has been changed.
+    '''
+    def _remove_old_rootfs(self):
+        if self.inc_opkg_image_gen != "1":
+            return True
+
+        vars_list_file = self.d.expand('${T}/vars_list')
+
+        old_vars_list = ""
+        if os.path.exists(vars_list_file):
+            old_vars_list = open(vars_list_file, 'r+').read()
+
+        new_vars_list = '%s:%s:%s\n' % \
+                ((self.d.getVar('BAD_RECOMMENDATIONS') or '').strip(),
+                 (self.d.getVar('NO_RECOMMENDATIONS') or '').strip(),
+                 (self.d.getVar('PACKAGE_EXCLUDE') or '').strip())
+        open(vars_list_file, 'w+').write(new_vars_list)
+
+        if old_vars_list != new_vars_list:
+            return True
+
+        return False
+
+    def _create(self):
+        pkgs_to_install = self.manifest.parse_initial_manifest()
+        opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS')
+        opkg_post_process_cmds = self.d.getVar('OPKG_POSTPROCESS_COMMANDS')
+
+        # update PM index files
+        self.pm.write_index()
+
+        execute_pre_post_process(self.d, opkg_pre_process_cmds)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+            # Steps are a bit different in order, skip next
+            self.progress_reporter.next_stage()
+
+        self.pm.update()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        if self.inc_opkg_image_gen == "1":
+            self._remove_extra_packages(pkgs_to_install)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                # For multilib, we perform a sanity test before final install
+                # If sanity test fails, it will automatically do a bb.fatal()
+                # and the installation will stop
+                if pkg_type == Manifest.PKG_TYPE_MULTILIB:
+                    self._multilib_test_install(pkgs_to_install[pkg_type])
+
+                self.pm.install(pkgs_to_install[pkg_type],
+                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.install_complementary()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
+        opkg_dir = os.path.join(opkg_lib_dir, 'opkg')
+        self._setup_dbg_rootfs([opkg_dir])
+
+        execute_pre_post_process(self.d, opkg_post_process_cmds)
+
+        if self.inc_opkg_image_gen == "1":
+            self.pm.backup_packaging_data()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+    @staticmethod
+    def _depends_list():
+        return ['IPKGCONF_SDK', 'IPK_FEED_URIS', 'DEPLOY_DIR_IPK', 'IPKGCONF_TARGET', 'INC_IPK_IMAGE_GEN', 'OPKG_ARGS', 'OPKGLIBDIR', 'OPKG_PREPROCESS_COMMANDS', 'OPKG_POSTPROCESS_COMMANDS', 'OPKGLIBDIR']
+
+    def _get_delayed_postinsts(self):
+        status_file = os.path.join(self.image_rootfs,
+                                   self.d.getVar('OPKGLIBDIR').strip('/'),
+                                   "opkg", "status")
+        return self._get_delayed_postinsts_common(status_file)
+
+    def _save_postinsts(self):
+        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts")
+        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info")
+        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
+
+    def _log_check(self):
+        self._log_check_warn()
+        self._log_check_error()
+
+    def _cleanup(self):
+        self.pm.remove_lists()
diff --git a/meta/lib/oe/package_managers/ipk/sdk.py b/meta/lib/oe/package_managers/ipk/sdk.py
new file mode 100644
index 0000000000..0ab8957cc7
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/sdk.py
@@ -0,0 +1,104 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+from oe.utils import execute_pre_post_process
+from oe.manifest import *
+from oe.package_manager import *
+from oe.sdk import *
+from oe.package_managers.ipk.manifest import *
+from oe.package_managers.ipk.package_manager import *
+import os
+import shutil
+import glob
+import traceback
+
+class PkgSdk(Sdk):
+    def __init__(self, d, manifest_dir=None):
+        super(PkgSdk, self).__init__(d, manifest_dir)
+
+        self.target_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.host_conf = self.d.getVar("IPKGCONF_SDK")
+
+        img_type = d.getVar('IMAGE_PKGTYPE')
+        import importlib
+        cls = importlib.import_module('oe.package_managers.' + img_type + '.manifest')
+
+        self.target_manifest = cls.PkgManifest(d, self.manifest_dir,
+                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = cls.PkgManifest(d, self.manifest_dir,
+                                          Manifest.MANIFEST_TYPE_SDK_HOST)
+
+        ipk_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            ipk_repo_workdir = "oe-sdk-ext-repo"
+
+        self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
+                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), 
+                                ipk_repo_workdir=ipk_repo_workdir)
+
+        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
+                              self.d.getVar("SDK_PACKAGE_ARCHS"),
+                                ipk_repo_workdir=ipk_repo_workdir)
+
+    def _populate_sysroot(self, pm, manifest):
+        pkgs_to_install = manifest.parse_initial_manifest()
+
+        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") != "1":
+            pm.write_index()
+
+        pm.update()
+
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                pm.install(pkgs_to_install[pkg_type],
+                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+
+    def _populate(self):
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
+
+        bb.note("Installing TARGET packages")
+        self._populate_sysroot(self.target_pm, self.target_manifest)
+
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
+
+        self.target_pm.run_intercepts(populate_sdk='target')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.target_pm.remove_packaging_data()
+
+        bb.note("Installing NATIVESDK packages")
+        self._populate_sysroot(self.host_pm, self.host_manifest)
+        self.install_locales(self.host_pm)
+
+        self.host_pm.run_intercepts(populate_sdk='host')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
+
+        target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
+        host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
+
+        self.mkdirhier(target_sysconfdir)
+        shutil.copy(self.target_conf, target_sysconfdir)
+        os.chmod(os.path.join(target_sysconfdir,
+                              os.path.basename(self.target_conf)), 0o644)
+
+        self.mkdirhier(host_sysconfdir)
+        shutil.copy(self.host_conf, host_sysconfdir)
+        os.chmod(os.path.join(host_sysconfdir,
+                              os.path.basename(self.host_conf)), 0o644)
+
+        native_opkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
+                                             self.d.getVar('localstatedir_nativesdk').strip('/'),
+                                             "lib", "opkg")
+        self.mkdirhier(native_opkg_state_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "opkg", "*")):
+            self.movefile(f, native_opkg_state_dir)
+
+        self.remove(os.path.join(self.sdk_output, "var"), True)
diff --git a/meta/lib/oe/package_managers/rpm/manifest.py b/meta/lib/oe/package_managers/rpm/manifest.py
new file mode 100644
index 0000000000..c914c2e8dc
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/manifest.py
@@ -0,0 +1,62 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+import os
+import re
+import bb
+from oe.manifest import *
+
+class PkgManifest(Manifest):
+    """
+    Returns a dictionary object with mip and mlp packages.
+    """
+    def _split_multilib(self, pkg_list):
+        pkgs = dict()
+
+        for pkg in pkg_list.split():
+            pkg_type = self.PKG_TYPE_MUST_INSTALL
+
+            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
+
+            for ml_variant in ml_variants:
+                if pkg.startswith(ml_variant + '-'):
+                    pkg_type = self.PKG_TYPE_MULTILIB
+
+            if not pkg_type in pkgs:
+                pkgs[pkg_type] = pkg
+            else:
+                pkgs[pkg_type] += " " + pkg
+
+        return pkgs
+
+    def create_initial(self):
+        pkgs = dict()
+
+        with open(self.initial_manifest, "w+") as manifest:
+            manifest.write(self.initial_manifest_file_header)
+
+            for var in self.var_maps[self.manifest_type]:
+                if var in self.vars_to_split:
+                    split_pkgs = self._split_multilib(self.d.getVar(var))
+                    if split_pkgs is not None:
+                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
+                else:
+                    pkg_list = self.d.getVar(var)
+                    if pkg_list is not None:
+                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
+
+            for pkg_type in pkgs:
+                for pkg in pkgs[pkg_type].split():
+                    manifest.write("%s,%s\n" % (pkg_type, pkg))
+
+    def create_final(self):
+        pass
+
+    def create_full(self, pm):
+        pass
+
+
+if __name__ == "__main__":
+    pass
diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
new file mode 100644
index 0000000000..bcefa9088e
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/package_manager.py
@@ -0,0 +1,423 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+import os
+import glob
+import subprocess
+import shutil
+import re
+import collections
+import bb
+import tempfile
+import oe.utils
+import oe.path
+import string
+from oe.gpg_sign import get_signer
+import hashlib
+import fnmatch
+from oe.package_manager import *
+
+class RpmIndexer(Indexer):
+    def write_index(self):
+        self.do_write_index(self.deploy_dir)
+
+    def do_write_index(self, deploy_dir):
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
+        else:
+            signer = None
+
+        createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
+        result = create_index("%s --update -q %s" % (createrepo_c, deploy_dir))
+        if result:
+            bb.fatal(result)
+
+        # Sign repomd
+        if signer:
+            sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
+            is_ascii_sig = (sig_type.upper() != "BIN")
+            signer.detach_sign(os.path.join(deploy_dir, 'repodata', 'repomd.xml'),
+                               self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                               self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
+                               armor=is_ascii_sig)
+
+class PkgIndexer(RpmIndexer):
+    def write_index(self):
+        if self.deploy_dir == "":
+            self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM')
+        bb.note("Generating package index for %s" %(self.deploy_dir))
+        self.do_write_index(self.deploy_dir)
+        for entry in os.walk(self.deploy_dir):
+            if os.path.samefile(self.deploy_dir, entry[0]):
+                for dir in entry[1]:
+                    if dir != 'repodata':
+                        dir_path = oe.path.join(self.deploy_dir, dir)
+                        bb.note("Generating package index for %s" %(dir_path))
+                        self.do_write_index(dir_path)
+
+class PkgPkgsList(PkgsList):
+    def list_pkgs(self):
+        return PkgPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
+
+class PkgPM(PackageManager):
+    def __init__(self,
+                 d,
+                 target_rootfs,
+                 target_vendor,
+                 task_name='target',
+                 arch_var=None,
+                 os_var=None,
+                 rpm_repo_workdir="oe-rootfs-repo",
+                 filterbydependencies=True,
+                 needfeed=True):
+        super(PkgPM, self).__init__(d, target_rootfs)
+        if target_vendor == "":
+            target_vendor = d.getVar('TARGET_VENDOR')
+        self.target_vendor = target_vendor
+        self.task_name = task_name
+        if arch_var == None:
+            self.archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
+        else:
+            self.archs = self.d.getVar(arch_var).replace("-","_")
+        if task_name == "host":
+            self.primary_arch = self.d.getVar('SDK_ARCH')
+        else:
+            self.primary_arch = self.d.getVar('MACHINE_ARCH')
+
+        if needfeed:
+            self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), rpm_repo_workdir)
+            create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
+
+        self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
+        if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
+            bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
+        self.packaging_data_dirs = ['etc/rpm', 'etc/rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
+        self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
+                                               self.task_name)
+        if not os.path.exists(self.d.expand('${T}/saved')):
+            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
+        self.create_configs()
+
+    def _configure_dnf(self):
+        # libsolv handles 'noarch' internally, we don't need to specify it explicitly
+        archs = [i for i in reversed(self.archs.split()) if i not in ["any", "all", "noarch"]]
+        # This prevents accidental matching against libsolv's built-in policies
+        if len(archs) <= 1:
+            archs = archs + ["bogusarch"]
+        # This architecture needs to be upfront so that packages using it are properly prioritized
+        archs = ["sdk_provides_dummy_target"] + archs
+        confdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
+        bb.utils.mkdirhier(confdir)
+        open(confdir + "arch", 'w').write(":".join(archs))
+        distro_codename = self.d.getVar('DISTRO_CODENAME')
+        open(confdir + "releasever", 'w').write(distro_codename if distro_codename is not None else '')
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
+        with open(rpmrcconfdir + "rpmrc", 'w') as f:
+            f.write("arch_compat: %s: %s\n" % (self.primary_arch, self.archs if len(self.archs) > 0 else self.primary_arch))
+            f.write("buildarch_compat: %s: noarch\n" % self.primary_arch)
+
+        open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
+        if self.d.getVar('RPM_PREFER_ELF_ARCH'):
+            open(platformconfdir + "macros", 'a').write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
+
+        if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
+            signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
+            pubkey_path = oe.path.join(self.d.getVar('B'), 'rpm-key')
+            signer.export_pubkey(pubkey_path, self.d.getVar('RPM_GPG_NAME'))
+            rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmkeys")
+            cmd = [rpm_bin, '--root=%s' % self.target_rootfs, '--import', pubkey_path]
+            try:
+                subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Importing GPG key failed. Command '%s' "
+                        "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
+    def create_configs(self):
+        self._configure_dnf()
+        self._configure_rpm()
+
+    def write_index(self):
+        lockfilename = self.d.getVar('DEPLOY_DIR_RPM') + "/rpm.lock"
+        lf = bb.utils.lockfile(lockfilename, False)
+        RpmIndexer(self.d, self.rpm_repo_dir).write_index()
+        bb.utils.unlockfile(lf)
+
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        from urllib.parse import urlparse
+
+        if feed_uris == "":
+            return
+
+        gpg_opts = ''
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            gpg_opts += 'repo_gpgcheck=1\n'
+            gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
+
+        if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
+            gpg_opts += 'gpgcheck=0\n'
+
+        bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
+        remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
+        for uri in remote_uris:
+            repo_base = "oe-remote-repo" + "-".join(urlparse(uri).path.split("/"))
+            if feed_archs is not None:
+                for arch in feed_archs.split():
+                    repo_uri = uri + "/" + arch
+                    repo_id   = "oe-remote-repo"  + "-".join(urlparse(repo_uri).path.split("/"))
+                    repo_name = "OE Remote Repo:" + " ".join(urlparse(repo_uri).path.split("/"))
+                    open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'a').write(
+                             "[%s]\nname=%s\nbaseurl=%s\n%s\n" % (repo_id, repo_name, repo_uri, gpg_opts))
+            else:
+                repo_name = "OE Remote Repo:" + " ".join(urlparse(uri).path.split("/"))
+                repo_uri = uri
+                open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'w').write(
+                             "[%s]\nname=%s\nbaseurl=%s\n%s" % (repo_base, repo_name, repo_uri, gpg_opts))
+
+    def _prepare_pkg_transaction(self):
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
+
+
+    def install(self, pkgs, attempt_only = False):
+        if len(pkgs) == 0:
+            return
+        self._prepare_pkg_transaction()
+
+        bad_recommendations = self.d.getVar('BAD_RECOMMENDATIONS')
+        package_exclude = self.d.getVar('PACKAGE_EXCLUDE')
+        exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exclude.split() if package_exclude else [])
+
+        output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
+                         (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
+                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == "1" else []) +
+                         (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
+                         ["install"] +
+                         pkgs)
+
+        failed_scriptlets_pkgnames = collections.OrderedDict()
+        for line in output.splitlines():
+            if line.startswith("Error in POSTIN scriptlet in rpm package"):
+                failed_scriptlets_pkgnames[line.split()[-1]] = True
+
+        if len(failed_scriptlets_pkgnames) > 0:
+            failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
+
+    def remove(self, pkgs, with_dependencies = True):
+        if not pkgs:
+            return
+
+        self._prepare_pkg_transaction()
+
+        if with_dependencies:
+            self._invoke_dnf(["remove"] + pkgs)
+        else:
+            cmd = bb.utils.which(os.getenv('PATH'), "rpm")
+            args = ["-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
+
+            try:
+                bb.note("Running %s" % ' '.join([cmd] + args + pkgs))
+                output = subprocess.check_output([cmd] + args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
+                bb.note(output)
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Could not invoke rpm. Command "
+                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args + pkgs), e.returncode, e.output.decode("utf-8")))
+
+    def upgrade(self):
+        self._prepare_pkg_transaction()
+        self._invoke_dnf(["upgrade"])
+
+    def autoremove(self):
+        self._prepare_pkg_transaction()
+        self._invoke_dnf(["autoremove"])
+
+    def remove_packaging_data(self):
+        self._invoke_dnf(["clean", "all"])
+        for dir in self.packaging_data_dirs:
+            bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)
+
+    def backup_packaging_data(self):
+        # Save the packaging dirs for increment rpm image generation
+        if os.path.exists(self.saved_packaging_data):
+            bb.utils.remove(self.saved_packaging_data, True)
+        for i in self.packaging_data_dirs:
+            source_dir = oe.path.join(self.target_rootfs, i)
+            target_dir = oe.path.join(self.saved_packaging_data, i)
+            if os.path.isdir(source_dir):
+                shutil.copytree(source_dir, target_dir, symlinks=True)
+            elif os.path.isfile(source_dir):
+                shutil.copy2(source_dir, target_dir)
+
+    def recovery_packaging_data(self):
+        # Move the rpmlib back
+        if os.path.exists(self.saved_packaging_data):
+            for i in self.packaging_data_dirs:
+                target_dir = oe.path.join(self.target_rootfs, i)
+                if os.path.exists(target_dir):
+                    bb.utils.remove(target_dir, True)
+                source_dir = oe.path.join(self.saved_packaging_data, i)
+                if os.path.isdir(source_dir):
+                    shutil.copytree(source_dir, target_dir, symlinks=True)
+                elif os.path.isfile(source_dir):
+                    shutil.copy2(source_dir, target_dir)
+
+    def list_installed(self):
+        output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
+                                  print_output = False)
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
+                package_rpm = package_info[3]
+                packages[current_package] = {"arch":package_arch, "ver":package_version, "filename":package_rpm}
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
+
+    def update(self):
+        self._invoke_dnf(["makecache", "--refresh"])
+
+    def _invoke_dnf(self, dnf_args, fatal = True, print_output = True ):
+        os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
+
+        dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
+        standard_dnf_args = ["-v", "--rpmverbosity=info", "-y",
+                             "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
+                             "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
+                             "--installroot=%s" % (self.target_rootfs),
+                             "--setopt=logdir=%s" % (self.d.getVar('T'))
+                            ]
+        if hasattr(self, "rpm_repo_dir"):
+            standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))
+        cmd = [dnf_cmd] + standard_dnf_args + dnf_args
+        bb.note('Running %s' % ' '.join(cmd))
+        try:
+            output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
+            if print_output:
+                bb.debug(1, output)
+            return output
+        except subprocess.CalledProcessError as e:
+            if print_output:
+                (bb.note, bb.fatal)[fatal]("Could not invoke dnf. Command "
+                     "'%s' returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+            else:
+                (bb.note, bb.fatal)[fatal]("Could not invoke dnf. Command "
+                     "'%s' returned %d:" % (' '.join(cmd), e.returncode))
+            return e.output.decode("utf-8")
+
+    def dump_install_solution(self, pkgs):
+        open(self.solution_manifest, 'w').write(" ".join(pkgs))
+        return pkgs
+
+    def load_old_install_solution(self):
+        if not os.path.exists(self.solution_manifest):
+            return []
+        with open(self.solution_manifest, 'r') as fd:
+            return fd.read().split()
+
+    def _script_num_prefix(self, path):
+        files = os.listdir(path)
+        numbers = set()
+        numbers.add(99)
+        for f in files:
+            numbers.add(int(f.split("-")[0]))
+        return max(numbers) + 1
+
+    def save_rpmpostinst(self, pkg):
+        bb.note("Saving postinstall script of %s" % (pkg))
+        cmd = bb.utils.which(os.getenv('PATH'), "rpm")
+        args = ["-q", "--root=%s" % self.target_rootfs, "--queryformat", "%{postin}", pkg]
+
+        try:
+            output = subprocess.check_output([cmd] + args,stderr=subprocess.STDOUT).decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Could not invoke rpm. Command "
+                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args), e.returncode, e.output.decode("utf-8")))
+
+        # may need to prepend #!/bin/sh to output
+
+        target_path = oe.path.join(self.target_rootfs, self.d.expand('${sysconfdir}/rpm-postinsts/'))
+        bb.utils.mkdirhier(target_path)
+        num = self._script_num_prefix(target_path)
+        saved_script_name = oe.path.join(target_path, "%d-%s" % (num, pkg))
+        open(saved_script_name, 'w').write(output)
+        os.chmod(saved_script_name, 0o755)
+
+    def _handle_intercept_failure(self, registered_pkgs):
+        rpm_postinsts_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
+        bb.utils.mkdirhier(rpm_postinsts_dir)
+
+        # Save the package postinstalls in /etc/rpm-postinsts
+        for pkg in registered_pkgs.split():
+            self.save_rpmpostinst(pkg)
+
+    def extract(self, pkg):
+        output = self._invoke_dnf(["repoquery", "--queryformat", "%{location}", pkg])
+        pkg_name = output.splitlines()[-1]
+        if not pkg_name.endswith(".rpm"):
+            bb.fatal("dnf could not find package %s in repository: %s" %(pkg, output))
+        pkg_path = oe.path.join(self.rpm_repo_dir, pkg_name)
+
+        cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
+        rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
+
+        if not os.path.isfile(pkg_path):
+            bb.fatal("Unable to extract package for '%s'."
+                     "File %s doesn't exists" % (pkg, pkg_path))
+
+        tmp_dir = tempfile.mkdtemp()
+        current_dir = os.getcwd()
+        os.chdir(tmp_dir)
+
+        try:
+            cmd = "%s %s | %s -idmv" % (rpm2cpio_cmd, pkg_path, cpio_cmd)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output.decode("utf-8")))
+        except OSError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s at %s" % (pkg_path, cmd, e.errno, e.strerror, e.filename))
+
+        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
+        os.chdir(current_dir)
+
+        return tmp_dir
+
+
diff --git a/meta/lib/oe/package_managers/rpm/rootfs.py b/meta/lib/oe/package_managers/rpm/rootfs.py
new file mode 100644
index 0000000000..87b108208a
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/rootfs.py
@@ -0,0 +1,154 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+from abc import ABCMeta, abstractmethod
+from oe.utils import execute_pre_post_process
+from oe.package_managers.rpm.package_manager import *
+from oe.package_managers.rpm.manifest import *
+from oe.rootfs import *
+import oe.path
+import filecmp
+import shutil
+import os
+import subprocess
+import re
+
+class PkgRootfs(Rootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
+                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
+                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+        self.manifest = PkgManifest(d, manifest_dir)
+        print("VAR EEEE; + " + self.d.getVar('TARGET_VENDOR'))
+
+        self.pm = PkgPM(d,
+                        d.getVar('IMAGE_ROOTFS'),
+                        self.d.getVar('TARGET_VENDOR')
+                        )
+
+        self.inc_rpm_image_gen = self.d.getVar('INC_RPM_IMAGE_GEN')
+        if self.inc_rpm_image_gen != "1":
+            bb.utils.remove(self.image_rootfs, True)
+        else:
+            self.pm.recovery_packaging_data()
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+
+        self.pm.create_configs()
+
+    '''
+    While rpm incremental image generation is enabled, it will remove the
+    unneeded pkgs by comparing the new install solution manifest and the
+    old installed manifest.
+    '''
+    def _create_incremental(self, pkgs_initial_install):
+        if self.inc_rpm_image_gen == "1":
+
+            pkgs_to_install = list()
+            for pkg_type in pkgs_initial_install:
+                pkgs_to_install += pkgs_initial_install[pkg_type]
+
+            installed_manifest = self.pm.load_old_install_solution()
+            solution_manifest = self.pm.dump_install_solution(pkgs_to_install)
+
+            pkg_to_remove = list()
+            for pkg in installed_manifest:
+                if pkg not in solution_manifest:
+                    pkg_to_remove.append(pkg)
+
+            self.pm.update()
+
+            bb.note('incremental update -- upgrade packages in place ')
+            self.pm.upgrade()
+            if pkg_to_remove != []:
+                bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
+                self.pm.remove(pkg_to_remove)
+
+            self.pm.autoremove()
+
+    def _create(self):
+        pkgs_to_install = self.manifest.parse_initial_manifest()
+        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
+        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
+
+        # update PM index files
+        self.pm.write_index()
+
+        execute_pre_post_process(self.d, rpm_pre_process_cmds)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        if self.inc_rpm_image_gen == "1":
+            self._create_incremental(pkgs_to_install)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.update()
+
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                pkgs_attempt += pkgs_to_install[pkg_type]
+            else:
+                pkgs += pkgs_to_install[pkg_type]
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.install(pkgs)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.install(pkgs_attempt, True)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.install_complementary()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
+
+        execute_pre_post_process(self.d, rpm_post_process_cmds)
+
+        if self.inc_rpm_image_gen == "1":
+            self.pm.backup_packaging_data()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+
+    @staticmethod
+    def _depends_list():
+        return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
+                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_ELF_ARCH']
+
+    def _get_delayed_postinsts(self):
+        postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
+        if os.path.isdir(postinst_dir):
+            files = os.listdir(postinst_dir)
+            for f in files:
+                bb.note('Delayed package scriptlet: %s' % f)
+            return files
+
+        return None
+
+    def _save_postinsts(self):
+        # this is just a stub. For RPM, the failed postinstalls are
+        # already saved in /etc/rpm-postinsts
+        pass
+
+    def _log_check(self):
+        self._log_check_warn()
+        self._log_check_error()
+
+    def _cleanup(self):
+        if bb.utils.contains("IMAGE_FEATURES", "package-management", True, False, self.d):
+            self.pm._invoke_dnf(["clean", "all"])
+
diff --git a/meta/lib/oe/package_managers/rpm/sdk.py b/meta/lib/oe/package_managers/rpm/sdk.py
new file mode 100644
index 0000000000..6385d58868
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/sdk.py
@@ -0,0 +1,104 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from abc import ABCMeta, abstractmethod
+from oe.utils import execute_pre_post_process
+from oe.manifest import *
+from oe.package_manager import *
+from oe.sdk import *
+import os
+import shutil
+import glob
+import traceback
+
+class PkgSdk(Sdk):
+    def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
+        super(PkgSdk, self).__init__(d, manifest_dir)
+
+
+        import importlib
+        self.target_manifest = importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_HOST)
+
+        rpm_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            rpm_repo_workdir = "oe-sdk-ext-repo"
+
+        self.target_pm = importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.package_manager').PkgPM(d, self.sdk_target_sysroot, self.d.getVar('TARGET_VENDOR'), 'target', rpm_repo_workdir=rpm_repo_workdir)
+        self.host_pm = importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.package_manager').PkgPM(d, self.sdk_host_sysroot, self.d.getVar('SDK_VENDOR'), 'host', 'SDK_PACKAGE_ARCHS', 'SDK_OS', rpm_repo_workdir=rpm_repo_workdir)
+
+    def _populate_sysroot(self, pm, manifest):
+        pkgs_to_install = manifest.parse_initial_manifest()
+
+        pm.create_configs()
+        pm.write_index()
+        pm.update()
+
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                pkgs_attempt += pkgs_to_install[pkg_type]
+            else:
+                pkgs += pkgs_to_install[pkg_type]
+
+        pm.install(pkgs)
+
+        pm.install(pkgs_attempt, True)
+
+    def _populate(self):
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
+
+        bb.note("Installing TARGET packages")
+        self._populate_sysroot(self.target_pm, self.target_manifest)
+
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
+
+        self.target_pm.run_intercepts(populate_sdk='target')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.target_pm.remove_packaging_data()
+
+        bb.note("Installing NATIVESDK packages")
+        self._populate_sysroot(self.host_pm, self.host_manifest)
+        self.install_locales(self.host_pm)
+
+        self.host_pm.run_intercepts(populate_sdk='host')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
+
+        # Move host RPM library data
+        native_rpm_state_dir = os.path.join(self.sdk_output,
+                                            self.sdk_native_path,
+                                            self.d.getVar('localstatedir_nativesdk').strip('/'),
+                                            "lib",
+                                            "rpm"
+                                            )
+        self.mkdirhier(native_rpm_state_dir)
+        for f in glob.glob(os.path.join(self.sdk_output,
+                                        "var",
+                                        "lib",
+                                        "rpm",
+                                        "*")):
+            self.movefile(f, native_rpm_state_dir)
+
+        self.remove(os.path.join(self.sdk_output, "var"), True)
+
+        # Move host sysconfig data
+        native_sysconf_dir = os.path.join(self.sdk_output,
+                                          self.sdk_native_path,
+                                          self.d.getVar('sysconfdir',
+                                                        True).strip('/'),
+                                          )
+        self.mkdirhier(native_sysconf_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
+            self.movefile(f, native_sysconf_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
+            self.movefile(f, native_sysconf_dir)
+        self.remove(os.path.join(self.sdk_output, "etc"), True)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index cd65e62030..9c607ec66e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -352,615 +352,10 @@ class Rootfs(object, metaclass=ABCMeta):
             self._exec_shell_cmd(["makedevs", "-r",
                                   self.image_rootfs, "-D", devtable])
 
-
-class RpmRootfs(Rootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
-                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
-                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
-        self.manifest = RpmManifest(d, manifest_dir)
-
-        self.pm = RpmPM(d,
-                        d.getVar('IMAGE_ROOTFS'),
-                        self.d.getVar('TARGET_VENDOR')
-                        )
-
-        self.inc_rpm_image_gen = self.d.getVar('INC_RPM_IMAGE_GEN')
-        if self.inc_rpm_image_gen != "1":
-            bb.utils.remove(self.image_rootfs, True)
-        else:
-            self.pm.recovery_packaging_data()
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-
-        self.pm.create_configs()
-
-    '''
-    While rpm incremental image generation is enabled, it will remove the
-    unneeded pkgs by comparing the new install solution manifest and the
-    old installed manifest.
-    '''
-    def _create_incremental(self, pkgs_initial_install):
-        if self.inc_rpm_image_gen == "1":
-
-            pkgs_to_install = list()
-            for pkg_type in pkgs_initial_install:
-                pkgs_to_install += pkgs_initial_install[pkg_type]
-
-            installed_manifest = self.pm.load_old_install_solution()
-            solution_manifest = self.pm.dump_install_solution(pkgs_to_install)
-
-            pkg_to_remove = list()
-            for pkg in installed_manifest:
-                if pkg not in solution_manifest:
-                    pkg_to_remove.append(pkg)
-
-            self.pm.update()
-
-            bb.note('incremental update -- upgrade packages in place ')
-            self.pm.upgrade()
-            if pkg_to_remove != []:
-                bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
-                self.pm.remove(pkg_to_remove)
-
-            self.pm.autoremove()
-
-    def _create(self):
-        pkgs_to_install = self.manifest.parse_initial_manifest()
-        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
-        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
-
-        # update PM index files
-        self.pm.write_index()
-
-        execute_pre_post_process(self.d, rpm_pre_process_cmds)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        if self.inc_rpm_image_gen == "1":
-            self._create_incremental(pkgs_to_install)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.update()
-
-        pkgs = []
-        pkgs_attempt = []
-        for pkg_type in pkgs_to_install:
-            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
-                pkgs_attempt += pkgs_to_install[pkg_type]
-            else:
-                pkgs += pkgs_to_install[pkg_type]
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.install(pkgs)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.install(pkgs_attempt, True)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.install_complementary()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
-
-        execute_pre_post_process(self.d, rpm_post_process_cmds)
-
-        if self.inc_rpm_image_gen == "1":
-            self.pm.backup_packaging_data()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-
-    @staticmethod
-    def _depends_list():
-        return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
-                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_ELF_ARCH']
-
-    def _get_delayed_postinsts(self):
-        postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
-        if os.path.isdir(postinst_dir):
-            files = os.listdir(postinst_dir)
-            for f in files:
-                bb.note('Delayed package scriptlet: %s' % f)
-            return files
-
-        return None
-
-    def _save_postinsts(self):
-        # this is just a stub. For RPM, the failed postinstalls are
-        # already saved in /etc/rpm-postinsts
-        pass
-
-    def _log_check(self):
-        self._log_check_warn()
-        self._log_check_error()
-
-    def _cleanup(self):
-        if bb.utils.contains("IMAGE_FEATURES", "package-management", True, False, self.d):
-            self.pm._invoke_dnf(["clean", "all"])
-
-
-class DpkgOpkgRootfs(Rootfs):
-    def __init__(self, d, progress_reporter=None, logcatcher=None):
-        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
-
-    def _get_pkgs_postinsts(self, status_file):
-        def _get_pkg_depends_list(pkg_depends):
-            pkg_depends_list = []
-            # filter version requirements like libc (>= 1.1)
-            for dep in pkg_depends.split(', '):
-                m_dep = re.match(r"^(.*) \(.*\)$", dep)
-                if m_dep:
-                    dep = m_dep.group(1)
-                pkg_depends_list.append(dep)
-
-            return pkg_depends_list
-
-        pkgs = {}
-        pkg_name = ""
-        pkg_status_match = False
-        pkg_depends = ""
-
-        with open(status_file) as status:
-            data = status.read()
-            status.close()
-            for line in data.split('\n'):
-                m_pkg = re.match(r"^Package: (.*)", line)
-                m_status = re.match(r"^Status:.*unpacked", line)
-                m_depends = re.match(r"^Depends: (.*)", line)
-
-                #Only one of m_pkg, m_status or m_depends is not None at time
-                #If m_pkg is not None, we started a new package
-                if m_pkg is not None:
-                    #Get Package name
-                    pkg_name = m_pkg.group(1)
-                    #Make sure we reset other variables
-                    pkg_status_match = False
-                    pkg_depends = ""
-                elif m_status is not None:
-                    #New status matched
-                    pkg_status_match = True
-                elif m_depends is not None:
-                    #New depends macthed
-                    pkg_depends = m_depends.group(1)
-                else:
-                    pass
-
-                #Now check if we can process package depends and postinst
-                if "" != pkg_name and pkg_status_match:
-                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
-                else:
-                    #Not enough information
-                    pass
-
-        # remove package dependencies not in postinsts
-        pkg_names = list(pkgs.keys())
-        for pkg_name in pkg_names:
-            deps = pkgs[pkg_name][:]
-
-            for d in deps:
-                if d not in pkg_names:
-                    pkgs[pkg_name].remove(d)
-
-        return pkgs
-
-    def _get_delayed_postinsts_common(self, status_file):
-        def _dep_resolve(graph, node, resolved, seen):
-            seen.append(node)
-
-            for edge in graph[node]:
-                if edge not in resolved:
-                    if edge in seen:
-                        raise RuntimeError("Packages %s and %s have " \
-                                "a circular dependency in postinsts scripts." \
-                                % (node, edge))
-                    _dep_resolve(graph, edge, resolved, seen)
-
-            resolved.append(node)
-
-        pkg_list = []
-
-        pkgs = None
-        if not self.d.getVar('PACKAGE_INSTALL').strip():
-            bb.note("Building empty image")
-        else:
-            pkgs = self._get_pkgs_postinsts(status_file)
-        if pkgs:
-            root = "__packagegroup_postinst__"
-            pkgs[root] = list(pkgs.keys())
-            _dep_resolve(pkgs, root, pkg_list, [])
-            pkg_list.remove(root)
-
-        if len(pkg_list) == 0:
-            return None
-
-        return pkg_list
-
-    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
-        if bb.utils.contains("IMAGE_FEATURES", "package-management",
-                         True, False, self.d):
-            return
-        num = 0
-        for p in self._get_delayed_postinsts():
-            bb.utils.mkdirhier(dst_postinst_dir)
-
-            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
-                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
-                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
-
-            num += 1
-
-class DpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = '^E:'
-        self.log_check_expected_regexes = \
-        [
-            "^E: Unmet dependencies."
-        ]
-
-        bb.utils.remove(self.image_rootfs, True)
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-        self.manifest = DpkgManifest(d, manifest_dir)
-        self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
-                         d.getVar('PACKAGE_ARCHS'),
-                         d.getVar('DPKG_ARCH'))
-
-
-    def _create(self):
-        pkgs_to_install = self.manifest.parse_initial_manifest()
-        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS')
-        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS')
-
-        alt_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternatives")
-        bb.utils.mkdirhier(alt_dir)
-
-        # update PM index files
-        self.pm.write_index()
-
-        execute_pre_post_process(self.d, deb_pre_process_cmds)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-            # Don't support incremental, so skip that
-            self.progress_reporter.next_stage()
-
-        self.pm.update()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                self.pm.install(pkgs_to_install[pkg_type],
-                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
-                self.pm.fix_broken_dependencies()
-
-        if self.progress_reporter:
-            # Don't support attemptonly, so skip that
-            self.progress_reporter.next_stage()
-            self.progress_reporter.next_stage()
-
-        self.pm.install_complementary()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self._setup_dbg_rootfs(['/var/lib/dpkg'])
-
-        self.pm.fix_broken_dependencies()
-
-        self.pm.mark_packages("installed")
-
-        self.pm.run_pre_post_installs()
-
-        execute_pre_post_process(self.d, deb_post_process_cmds)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-    @staticmethod
-    def _depends_list():
-        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
-
-    def _get_delayed_postinsts(self):
-        status_file = self.image_rootfs + "/var/lib/dpkg/status"
-        return self._get_delayed_postinsts_common(status_file)
-
-    def _save_postinsts(self):
-        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts")
-        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/info")
-        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
-
-    def _log_check(self):
-        self._log_check_warn()
-        self._log_check_error()
-
-    def _cleanup(self):
-        pass
-
-
-class OpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = '(exit 1|Collected errors)'
-
-        self.manifest = OpkgManifest(d, manifest_dir)
-        self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
-        self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
-
-        self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
-        if self._remove_old_rootfs():
-            bb.utils.remove(self.image_rootfs, True)
-            self.pm = OpkgPM(d,
-                             self.image_rootfs,
-                             self.opkg_conf,
-                             self.pkg_archs)
-        else:
-            self.pm = OpkgPM(d,
-                             self.image_rootfs,
-                             self.opkg_conf,
-                             self.pkg_archs)
-            self.pm.recover_packaging_data()
-
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-
-    def _prelink_file(self, root_dir, filename):
-        bb.note('prelink %s in %s' % (filename, root_dir))
-        prelink_cfg = oe.path.join(root_dir,
-                                   self.d.expand('${sysconfdir}/prelink.conf'))
-        if not os.path.exists(prelink_cfg):
-            shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),
-                        prelink_cfg)
-
-        cmd_prelink = self.d.expand('${STAGING_DIR_NATIVE}${sbindir_native}/prelink')
-        self._exec_shell_cmd([cmd_prelink,
-                              '--root',
-                              root_dir,
-                              '-amR',
-                              '-N',
-                              '-c',
-                              self.d.expand('${sysconfdir}/prelink.conf')])
-
-    '''
-    Compare two files with the same key twice to see if they are equal.
-    If they are not equal, it means they are duplicated and come from
-    different packages.
-    1st: Comapre them directly;
-    2nd: While incremental image creation is enabled, one of the
-         files could be probaly prelinked in the previous image
-         creation and the file has been changed, so we need to
-         prelink the other one and compare them.
-    '''
-    def _file_equal(self, key, f1, f2):
-
-        # Both of them are not prelinked
-        if filecmp.cmp(f1, f2):
-            return True
-
-        if bb.data.inherits_class('image-prelink', self.d):
-            if self.image_rootfs not in f1:
-                self._prelink_file(f1.replace(key, ''), f1)
-
-            if self.image_rootfs not in f2:
-                self._prelink_file(f2.replace(key, ''), f2)
-
-            # Both of them are prelinked
-            if filecmp.cmp(f1, f2):
-                return True
-
-        # Not equal
-        return False
-
-    """
-    This function was reused from the old implementation.
-    See commit: "image.bbclass: Added variables for multilib support." by
-    Lianhao Lu.
-    """
-    def _multilib_sanity_test(self, dirs):
-
-        allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP")
-        if allow_replace is None:
-            allow_replace = ""
-
-        allow_rep = re.compile(re.sub(r"\|$", r"", allow_replace))
-        error_prompt = "Multilib check error:"
-
-        files = {}
-        for dir in dirs:
-            for root, subfolders, subfiles in os.walk(dir):
-                for file in subfiles:
-                    item = os.path.join(root, file)
-                    key = str(os.path.join("/", os.path.relpath(item, dir)))
-
-                    valid = True
-                    if key in files:
-                        #check whether the file is allow to replace
-                        if allow_rep.match(key):
-                            valid = True
-                        else:
-                            if os.path.exists(files[key]) and \
-                               os.path.exists(item) and \
-                               not self._file_equal(key, files[key], item):
-                                valid = False
-                                bb.fatal("%s duplicate files %s %s is not the same\n" %
-                                         (error_prompt, item, files[key]))
-
-                    #pass the check, add to list
-                    if valid:
-                        files[key] = item
-
-    def _multilib_test_install(self, pkgs):
-        ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS")
-        bb.utils.mkdirhier(ml_temp)
-
-        dirs = [self.image_rootfs]
-
-        for variant in self.d.getVar("MULTILIB_VARIANTS").split():
-            ml_target_rootfs = os.path.join(ml_temp, variant)
-
-            bb.utils.remove(ml_target_rootfs, True)
-
-            ml_opkg_conf = os.path.join(ml_temp,
-                                        variant + "-" + os.path.basename(self.opkg_conf))
-
-            ml_pm = OpkgPM(self.d, ml_target_rootfs, ml_opkg_conf, self.pkg_archs, prepare_index=False)
-
-            ml_pm.update()
-            ml_pm.install(pkgs)
-
-            dirs.append(ml_target_rootfs)
-
-        self._multilib_sanity_test(dirs)
-
-    '''
-    While ipk incremental image generation is enabled, it will remove the
-    unneeded pkgs by comparing the old full manifest in previous existing
-    image and the new full manifest in the current image.
-    '''
-    def _remove_extra_packages(self, pkgs_initial_install):
-        if self.inc_opkg_image_gen == "1":
-            # Parse full manifest in previous existing image creation session
-            old_full_manifest = self.manifest.parse_full_manifest()
-
-            # Create full manifest for the current image session, the old one
-            # will be replaced by the new one.
-            self.manifest.create_full(self.pm)
-
-            # Parse full manifest in current image creation session
-            new_full_manifest = self.manifest.parse_full_manifest()
-
-            pkg_to_remove = list()
-            for pkg in old_full_manifest:
-                if pkg not in new_full_manifest:
-                    pkg_to_remove.append(pkg)
-
-            if pkg_to_remove != []:
-                bb.note('decremental removed: %s' % ' '.join(pkg_to_remove))
-                self.pm.remove(pkg_to_remove)
-
-    '''
-    Compare with previous existing image creation, if some conditions
-    triggered, the previous old image should be removed.
-    The conditions include any of 'PACKAGE_EXCLUDE, NO_RECOMMENDATIONS
-    and BAD_RECOMMENDATIONS' has been changed.
-    '''
-    def _remove_old_rootfs(self):
-        if self.inc_opkg_image_gen != "1":
-            return True
-
-        vars_list_file = self.d.expand('${T}/vars_list')
-
-        old_vars_list = ""
-        if os.path.exists(vars_list_file):
-            old_vars_list = open(vars_list_file, 'r+').read()
-
-        new_vars_list = '%s:%s:%s\n' % \
-                ((self.d.getVar('BAD_RECOMMENDATIONS') or '').strip(),
-                 (self.d.getVar('NO_RECOMMENDATIONS') or '').strip(),
-                 (self.d.getVar('PACKAGE_EXCLUDE') or '').strip())
-        open(vars_list_file, 'w+').write(new_vars_list)
-
-        if old_vars_list != new_vars_list:
-            return True
-
-        return False
-
-    def _create(self):
-        pkgs_to_install = self.manifest.parse_initial_manifest()
-        opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS')
-        opkg_post_process_cmds = self.d.getVar('OPKG_POSTPROCESS_COMMANDS')
-
-        # update PM index files
-        self.pm.write_index()
-
-        execute_pre_post_process(self.d, opkg_pre_process_cmds)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-            # Steps are a bit different in order, skip next
-            self.progress_reporter.next_stage()
-
-        self.pm.update()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        if self.inc_opkg_image_gen == "1":
-            self._remove_extra_packages(pkgs_to_install)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                # For multilib, we perform a sanity test before final install
-                # If sanity test fails, it will automatically do a bb.fatal()
-                # and the installation will stop
-                if pkg_type == Manifest.PKG_TYPE_MULTILIB:
-                    self._multilib_test_install(pkgs_to_install[pkg_type])
-
-                self.pm.install(pkgs_to_install[pkg_type],
-                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.install_complementary()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
-        opkg_dir = os.path.join(opkg_lib_dir, 'opkg')
-        self._setup_dbg_rootfs([opkg_dir])
-
-        execute_pre_post_process(self.d, opkg_post_process_cmds)
-
-        if self.inc_opkg_image_gen == "1":
-            self.pm.backup_packaging_data()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-    @staticmethod
-    def _depends_list():
-        return ['IPKGCONF_SDK', 'IPK_FEED_URIS', 'DEPLOY_DIR_IPK', 'IPKGCONF_TARGET', 'INC_IPK_IMAGE_GEN', 'OPKG_ARGS', 'OPKGLIBDIR', 'OPKG_PREPROCESS_COMMANDS', 'OPKG_POSTPROCESS_COMMANDS', 'OPKGLIBDIR']
-
-    def _get_delayed_postinsts(self):
-        status_file = os.path.join(self.image_rootfs,
-                                   self.d.getVar('OPKGLIBDIR').strip('/'),
-                                   "opkg", "status")
-        return self._get_delayed_postinsts_common(status_file)
-
-    def _save_postinsts(self):
-        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts")
-        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info")
-        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
-
-    def _log_check(self):
-        self._log_check_warn()
-        self._log_check_error()
-
-    def _cleanup(self):
-        self.pm.remove_lists()
-
 def get_class_for_type(imgtype):
-    return {"rpm": RpmRootfs,
-            "ipk": OpkgRootfs,
-            "deb": DpkgRootfs}[imgtype]
+    import importlib
+    mod = importlib.import_module('oe.package_managers.' + imgtype + '.rootfs')
+    return mod.PkgRootfs
 
 def variable_depends(d, manifest_dir=None):
     img_type = d.getVar('IMAGE_PKGTYPE')
@@ -971,28 +366,20 @@ def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None)
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-    elif img_type == "ipk":
-        OpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-    elif img_type == "deb":
-        DpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-
+    cls = get_class_for_type(img_type)
+    cls(d, manifest_dir, progress_reporter, logcatcher).create()
     os.environ.clear()
     os.environ.update(env_bkp)
 
-
 def image_list_installed_packages(d, rootfs_dir=None):
     if not rootfs_dir:
         rootfs_dir = d.getVar('IMAGE_ROOTFS')
 
     img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        return RpmPkgsList(d, rootfs_dir).list_pkgs()
-    elif img_type == "ipk":
-        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET")).list_pkgs()
-    elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
+    import importlib
+    cls = importlib.import_module('oe.package_managers.' + img_type + '.package_manager')
+    return cls.PkgPkgsList(d, rootfs_dir).list_pkgs()
+
 
 if __name__ == "__main__":
     """
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d02a274812..fbd6059829 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -109,284 +109,6 @@ class Sdk(object, metaclass=ABCMeta):
             # No linguas so do nothing
             pass
 
-
-class RpmSdk(Sdk):
-    def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
-        super(RpmSdk, self).__init__(d, manifest_dir)
-
-        self.target_manifest = RpmManifest(d, self.manifest_dir,
-                                           Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = RpmManifest(d, self.manifest_dir,
-                                         Manifest.MANIFEST_TYPE_SDK_HOST)
-
-        rpm_repo_workdir = "oe-sdk-repo"
-        if "sdk_ext" in d.getVar("BB_RUNTASK"):
-            rpm_repo_workdir = "oe-sdk-ext-repo"
-
-        self.target_pm = RpmPM(d,
-                               self.sdk_target_sysroot,
-                               self.d.getVar('TARGET_VENDOR'),
-                               'target',
-                               rpm_repo_workdir=rpm_repo_workdir
-                               )
-
-        self.host_pm = RpmPM(d,
-                             self.sdk_host_sysroot,
-                             self.d.getVar('SDK_VENDOR'),
-                             'host',
-                             "SDK_PACKAGE_ARCHS",
-                             "SDK_OS",
-                             rpm_repo_workdir=rpm_repo_workdir
-                             )
-
-    def _populate_sysroot(self, pm, manifest):
-        pkgs_to_install = manifest.parse_initial_manifest()
-
-        pm.create_configs()
-        pm.write_index()
-        pm.update()
-
-        pkgs = []
-        pkgs_attempt = []
-        for pkg_type in pkgs_to_install:
-            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
-                pkgs_attempt += pkgs_to_install[pkg_type]
-            else:
-                pkgs += pkgs_to_install[pkg_type]
-
-        pm.install(pkgs)
-
-        pm.install(pkgs_attempt, True)
-
-    def _populate(self):
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
-
-        bb.note("Installing TARGET packages")
-        self._populate_sysroot(self.target_pm, self.target_manifest)
-
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
-
-        self.target_pm.run_intercepts(populate_sdk='target')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.target_pm.remove_packaging_data()
-
-        bb.note("Installing NATIVESDK packages")
-        self._populate_sysroot(self.host_pm, self.host_manifest)
-        self.install_locales(self.host_pm)
-
-        self.host_pm.run_intercepts(populate_sdk='host')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.host_pm.remove_packaging_data()
-
-        # Move host RPM library data
-        native_rpm_state_dir = os.path.join(self.sdk_output,
-                                            self.sdk_native_path,
-                                            self.d.getVar('localstatedir_nativesdk').strip('/'),
-                                            "lib",
-                                            "rpm"
-                                            )
-        self.mkdirhier(native_rpm_state_dir)
-        for f in glob.glob(os.path.join(self.sdk_output,
-                                        "var",
-                                        "lib",
-                                        "rpm",
-                                        "*")):
-            self.movefile(f, native_rpm_state_dir)
-
-        self.remove(os.path.join(self.sdk_output, "var"), True)
-
-        # Move host sysconfig data
-        native_sysconf_dir = os.path.join(self.sdk_output,
-                                          self.sdk_native_path,
-                                          self.d.getVar('sysconfdir',
-                                                        True).strip('/'),
-                                          )
-        self.mkdirhier(native_sysconf_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
-            self.movefile(f, native_sysconf_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
-            self.movefile(f, native_sysconf_dir)
-        self.remove(os.path.join(self.sdk_output, "etc"), True)
-
-
-class OpkgSdk(Sdk):
-    def __init__(self, d, manifest_dir=None):
-        super(OpkgSdk, self).__init__(d, manifest_dir)
-
-        self.target_conf = self.d.getVar("IPKGCONF_TARGET")
-        self.host_conf = self.d.getVar("IPKGCONF_SDK")
-
-        self.target_manifest = OpkgManifest(d, self.manifest_dir,
-                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = OpkgManifest(d, self.manifest_dir,
-                                          Manifest.MANIFEST_TYPE_SDK_HOST)
-
-        ipk_repo_workdir = "oe-sdk-repo"
-        if "sdk_ext" in d.getVar("BB_RUNTASK"):
-            ipk_repo_workdir = "oe-sdk-ext-repo"
-
-        self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
-                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), 
-                                ipk_repo_workdir=ipk_repo_workdir)
-
-        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
-                              self.d.getVar("SDK_PACKAGE_ARCHS"),
-                                ipk_repo_workdir=ipk_repo_workdir)
-
-    def _populate_sysroot(self, pm, manifest):
-        pkgs_to_install = manifest.parse_initial_manifest()
-
-        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") != "1":
-            pm.write_index()
-
-        pm.update()
-
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
-
-    def _populate(self):
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
-
-        bb.note("Installing TARGET packages")
-        self._populate_sysroot(self.target_pm, self.target_manifest)
-
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
-
-        self.target_pm.run_intercepts(populate_sdk='target')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.target_pm.remove_packaging_data()
-
-        bb.note("Installing NATIVESDK packages")
-        self._populate_sysroot(self.host_pm, self.host_manifest)
-        self.install_locales(self.host_pm)
-
-        self.host_pm.run_intercepts(populate_sdk='host')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.host_pm.remove_packaging_data()
-
-        target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
-        host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
-
-        self.mkdirhier(target_sysconfdir)
-        shutil.copy(self.target_conf, target_sysconfdir)
-        os.chmod(os.path.join(target_sysconfdir,
-                              os.path.basename(self.target_conf)), 0o644)
-
-        self.mkdirhier(host_sysconfdir)
-        shutil.copy(self.host_conf, host_sysconfdir)
-        os.chmod(os.path.join(host_sysconfdir,
-                              os.path.basename(self.host_conf)), 0o644)
-
-        native_opkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
-                                             self.d.getVar('localstatedir_nativesdk').strip('/'),
-                                             "lib", "opkg")
-        self.mkdirhier(native_opkg_state_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "opkg", "*")):
-            self.movefile(f, native_opkg_state_dir)
-
-        self.remove(os.path.join(self.sdk_output, "var"), True)
-
-
-class DpkgSdk(Sdk):
-    def __init__(self, d, manifest_dir=None):
-        super(DpkgSdk, self).__init__(d, manifest_dir)
-
-        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
-        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
-
-        self.target_manifest = DpkgManifest(d, self.manifest_dir,
-                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = DpkgManifest(d, self.manifest_dir,
-                                          Manifest.MANIFEST_TYPE_SDK_HOST)
-
-        deb_repo_workdir = "oe-sdk-repo"
-        if "sdk_ext" in d.getVar("BB_RUNTASK"):
-            deb_repo_workdir = "oe-sdk-ext-repo"
-
-        self.target_pm = DpkgPM(d, self.sdk_target_sysroot,
-                                self.d.getVar("PACKAGE_ARCHS"),
-                                self.d.getVar("DPKG_ARCH"),
-                                self.target_conf_dir,
-                                deb_repo_workdir=deb_repo_workdir)
-
-        self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
-                              self.d.getVar("SDK_PACKAGE_ARCHS"),
-                              self.d.getVar("DEB_SDK_ARCH"),
-                              self.host_conf_dir,
-                              deb_repo_workdir=deb_repo_workdir)
-
-    def _copy_apt_dir_to(self, dst_dir):
-        staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE")
-
-        self.remove(dst_dir, True)
-
-        shutil.copytree(os.path.join(staging_etcdir_native, "apt"), dst_dir)
-
-    def _populate_sysroot(self, pm, manifest):
-        pkgs_to_install = manifest.parse_initial_manifest()
-
-        pm.write_index()
-        pm.update()
-
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
-
-    def _populate(self):
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
-
-        bb.note("Installing TARGET packages")
-        self._populate_sysroot(self.target_pm, self.target_manifest)
-
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
-
-        self.target_pm.run_intercepts(populate_sdk='target')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
-
-        self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc", "apt"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.target_pm.remove_packaging_data()
-
-        bb.note("Installing NATIVESDK packages")
-        self._populate_sysroot(self.host_pm, self.host_manifest)
-        self.install_locales(self.host_pm)
-
-        self.host_pm.run_intercepts(populate_sdk='host')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
-
-        self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_native_path,
-                                           "etc", "apt"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.host_pm.remove_packaging_data()
-
-        native_dpkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
-                                             "var", "lib", "dpkg")
-        self.mkdirhier(native_dpkg_state_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "dpkg", "*")):
-            self.movefile(f, native_dpkg_state_dir)
-        self.remove(os.path.join(self.sdk_output, "var"), True)
-
-
-
 def sdk_list_installed_packages(d, target, rootfs_dir=None):
     if rootfs_dir is None:
         sdk_output = d.getVar('SDK_OUTPUT')
@@ -394,27 +116,24 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
-    img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
-        os_var = ["SDK_OS", None][target is True]
-        return RpmPkgsList(d, rootfs_dir).list_pkgs()
-    elif img_type == "ipk":
-        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
-        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
-    elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
-
+    import importlib
+    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.package_manager').PkgPkgsList(d, rootfs_dir).list_pkgs()
+#    img_type = d.getVar('IMAGE_PKGTYPE')
+#    if img_type == "rpm":
+#        arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
+#        os_var = ["SDK_OS", None][target is True]
+#        return RpmPkgsList(d, rootfs_dir).list_pkgs()
+#    elif img_type == "ipk":
+#        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
+#        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
+#    elif img_type == "deb":
+#        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
+#
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
-    img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        RpmSdk(d, manifest_dir).populate()
-    elif img_type == "ipk":
-        OpkgSdk(d, manifest_dir).populate()
-    elif img_type == "deb":
-        DpkgSdk(d, manifest_dir).populate()
+    import importlib
+    importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.sdk').PkgSdk(d, manifest_dir).populate()
 
     os.environ.clear()
     os.environ.update(env_bkp)
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 2d358f7172..8e31d148c7 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -12,33 +12,12 @@ def get_package_manager(d, root_path):
     """
     Returns an OE package manager that can install packages in root_path.
     """
-    from oe.package_manager import RpmPM, OpkgPM, DpkgPM
-
-    pkg_class = d.getVar("IMAGE_PKGTYPE")
-    if pkg_class == "rpm":
-        pm = RpmPM(d,
-                   root_path,
-                   d.getVar('TARGET_VENDOR'),
-                   filterbydependencies=False)
-        pm.create_configs()
-
-    elif pkg_class == "ipk":
-        pm = OpkgPM(d,
-                    root_path,
-                    d.getVar("IPKGCONF_TARGET"),
-                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"),
-                    filterbydependencies=False)
-
-    elif pkg_class == "deb":
-        pm = DpkgPM(d,
-                    root_path,
-                    d.getVar('PACKAGE_ARCHS'),
-                    d.getVar('DPKG_ARCH'),
-                    filterbydependencies=False)
-
+    img_type = d.getVar('IMAGE_PKGTYPE')
+    import importlib
+    cls = importlib.import_module('oe.package_managers.' + img_type + '.package_manager')
+    pm = cls.PkgPM(d, root_path, "", "", filterbydependencies=False)
     pm.write_index()
     pm.update()
-
     return pm
 
 def find_packages_to_extract(test_suite):
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 98c5bcb372..4b063f4298 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -19,7 +19,7 @@ do_package_index[nostamp] = "1"
 do_package_index[depends] += "${PACKAGEINDEXDEPS}"
 
 python do_package_index() {
-    from oe.rootfs import generate_index_files
+    from oe.package_manager import generate_index_files
     generate_index_files(d)
 }
 addtask do_package_index before do_build
-- 
2.20.1

