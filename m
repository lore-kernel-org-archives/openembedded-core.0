Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.7474.1593080529844279544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=K2EVEJ0a;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=19035; q=dns/txt; s=axis-central1;
  t=1593080531; x=1624616531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/vY11n4RP9YOxJ9wAoIZVv7R1lqb5XcjRVtZ/6uTT6A=;
  b=K2EVEJ0aMlzNDwtUXDlEs5ih3DKyu7HN+SqWopNPZrRCtKdHgGKQcLl4
   VzJIDddxamiAcfzxkiuaWzVJCiP9g5/ymc1vIpI+hQJNnQx/RgxuSiELF
   q+EOZ7cFuhv3ng4q8vokSMKM1322O3tQXx0UGTVaLbDdcuqBFwZCCJi/F
   XuUYJanNqrCmwGp3Q6Mq7+QLpTSV5n7tSY8F+ikW+SFez+JOPy/qcoQZ5
   rtRtgGhaBElZbBe7/Cpm3Gb85us2inP5cvRa/2SZOJVwL4OKFfDEo4WqW
   +sHIGWAykQgazwIopYjROy2y03V0VXtAHn/to+uo39OTatmdRCX/4u9mN
   w==;
IronPort-SDR: ntTLN2VwJvRozXPHFR26xGDaVtpLKF0oZ47je8WViqHi6P7LDD5FPcT79p1ycUDc8mgYJf0X4H
 swnLRoniWFq7TTtQZHl5dWjjFClxpTHXq8TBRX9DutnfOgE61+P6KeuBRw4nL2OZP/AKK84AMP
 hGgy/To2CbHI3EzHxVCDlhgOLRmdjJG7U7Ii+LDXbPBYAbmAjWn3I1VRQuMlahvyyqVOekVSTV
 ZgUY65PtJZQZfBGJ/VAuU8CgkEdytIE3vsJXeiOY/iI3F4OlTYUi1y7z/vmRv7k1B11NF3uVNN
 to0=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185334"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 12/26] rootfs.py: Move DpkgRootfs
Date: Thu, 25 Jun 2020 12:21:31 +0200
Message-ID: <20200625102145.7139-13-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the rootfs only used by the dpkg package manager live in the dpkg
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/deb/rootfs.py | 473 +++++++++++++++++++++
 meta/lib/oe/rootfs.py                      |  93 +---
 2 files changed, 475 insertions(+), 91 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/deb/rootfs.py

diff --git a/meta/lib/oe/package_managers/deb/rootfs.py b/meta/lib/oe/package_managers/deb/rootfs.py
new file mode 100644
index 0000000000..321f9c1fa7
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/rootfs.py
@@ -0,0 +1,473 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.rootfs import *
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
+class DpkgRootfs(DpkgOpkgRootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = '^E:'
+        self.log_check_expected_regexes = \
+        [
+            "^E: Unmet dependencies."
+        ]
+
+        bb.utils.remove(self.image_rootfs, True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        import importlib
+        self.manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, manifest_dir)
+        self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
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
+
+
+class OpkgRootfs(DpkgOpkgRootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = '(exit 1|Collected errors)'
+
+        import importlib
+        self.manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, manifest_dir)
+        self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
+
+        self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
+        if self._remove_old_rootfs():
+            bb.utils.remove(self.image_rootfs, True)
+            self.pm = OpkgPM(d,
+                             self.image_rootfs,
+                             self.opkg_conf,
+                             self.pkg_archs)
+        else:
+            self.pm = OpkgPM(d,
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
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 234be4a066..89de41325d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -462,97 +462,6 @@ class DpkgOpkgRootfs(Rootfs):
 
             num += 1
 
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
-        import importlib
-        self.manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, manifest_dir)
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
 class OpkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
         super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
@@ -821,6 +730,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
 def get_class_for_type(imgtype):
     from oe.package_managers.rpm.rootfs import RpmRootfs
+    from oe.package_managers.deb.rootfs import DpkgRootfs
     return {"rpm": RpmRootfs,
             "ipk": OpkgRootfs,
             "deb": DpkgRootfs}[imgtype]
@@ -835,6 +745,7 @@ def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None)
 
     img_type = d.getVar('IMAGE_PKGTYPE')
     from oe.package_managers.rpm.rootfs import RpmRootfs
+    from oe.package_managers.deb.rootfs import DpkgRootfs
     if img_type == "rpm":
         RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
     elif img_type == "ipk":
-- 
2.20.1

