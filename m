Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F20ED71DDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:59 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546713"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:06:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:52 +0200
Message-Id: <e1b1c67d691fd317bf6c11d570ef5d261029f38b.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/36] package.bbclass: add support for pkg_postinst_ontarget()
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
X-List-Received-Date: Mon, 13 Feb 2017 15:06:00 -0000

All commands that cannot be executed during cross-install and can only be run on target
should go into this function. They will only be executed on first boot (if package was
cross-installed) or immediately during package installation on target.

The previous approach was to check if we are cross-installing before executing these commands,
and if so, exit the script with an error. This was not optimal for two reasons:

1) Code is hard to read; it is not obvious that 'exit 1' means 'defer what follows to first boot'.
2) Worse, this hides actual errors in the scriptlets; there is no difference between scriptlet
failing because it's intended to be run on target and scriptlet failing because there's a bug or
a regression somewhere.

Plain pkg_postinst() works as before: it is run during cross-install, if it fails, it's deferred to first boot
(but from now on, the deferral produces a deprecation warning).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-test/postinst/postinst_1.0.bb          | 99 ++++++++--------------
 meta/classes/package.bbclass                       | 20 +++++
 meta/lib/oe/rootfs.py                              | 39 +++++----
 scripts/postinst-intercepts/delay_to_first_boot    |  2 +
 4 files changed, 82 insertions(+), 78 deletions(-)
 create mode 100644 scripts/postinst-intercepts/delay_to_first_boot

diff --git a/meta-selftest/recipes-test/postinst/postinst_1.0.bb b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
index 6d497342779..1c2d46c3d28 100644
--- a/meta-selftest/recipes-test/postinst/postinst_1.0.bb
+++ b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
@@ -23,88 +23,68 @@ RDEPENDS_${PN}-delayed-t = "${PN}-delayed-p"
 
 # Main recipe post-install
 pkg_postinst_${PN}-at-rootfs () {
-    tfile="/etc/postinsta-test"
-    touch "$D"/this-was-created-at-rootfstime
-    if test "x$D" != "x" then
-        # Need to run on first boot
-        exit 1
-    else
-        echo "lets write postinst" > $tfile
+    if test "x$D" != "x" ; then
+        touch "$D"/this-was-created-at-rootfstime
     fi
 }
 
+pkg_postinst_ontarget_${PN}-at-rootfs () {
+    tfile="/etc/postinsta-test"
+    echo "lets write postinst" > $tfile
+}
+
 # Dependency recipes post-installs
-pkg_postinst_${PN}-delayed-a () {
+pkg_postinst_ontarget_${PN}-delayed-a () {
     efile="/etc/postinst-test"
     tfile="/etc/postinsta-test"
     rdeps="postinst"
 
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
+    touch /etc/this-was-created-at-first-boot
+    if test -e $efile ; then
+      echo 'success' > $tfile
     else
-      touch /etc/this-was-created-at-first-boot
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
-        exit 1
-      fi
-   fi
+      echo 'fail to install $rdeps first!' >&2
+      exit 1
+    fi
 }
 
-pkg_postinst_${PN}-delayed-b () {
+pkg_postinst_ontarget_${PN}-delayed-b () {
     efile="/etc/postinsta-test"
     tfile="/etc/postinstb-test"
     rdeps="postinsta"
 
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
+    if test -e $efile ; then
+      echo 'success' > $tfile
     else
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
-        exit 1
-      fi
-   fi
+      echo 'fail to install $rdeps first!' >&2
+      exit 1
+    fi
 }
 
-pkg_postinst_${PN}-delayed-d () {
+pkg_postinst_ontarget_${PN}-delayed-d () {
     efile="/etc/postinstb-test"
     tfile="/etc/postinstd-test"
     rdeps="postinstb"
 
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
+    if test -e $efile ; then
+      echo 'success' > $tfile
     else
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
-        exit 1
-      fi
-   fi
+      echo 'fail to install $rdeps first!' >&2
+      exit 1
+    fi
 }
 
-pkg_postinst_${PN}-delayed-p () {
+pkg_postinst_ontarget_${PN}-delayed-p () {
     efile="/etc/postinstd-test"
     tfile="/etc/postinstp-test"
     rdeps="postinstd"
 
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
+    if test -e $efile ; then
+      echo 'success' > $tfile
     else
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
-        exit 1
-      fi
-   fi
+      echo 'fail to install $rdeps first!' >&2
+      exit 1
+    fi
 }
 
 pkg_postinst_${PN}-delayed-t () {
@@ -112,15 +92,10 @@ pkg_postinst_${PN}-delayed-t () {
     tfile="/etc/postinstt-test"
     rdeps="postinstp"
 
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
+    if test -e $efile ; then
+        echo 'success' > $tfile
     else
-      if test -e $efile ; then
-          echo 'success' > $tfile
-      else
-          echo 'fail to install $rdeps first!' >&2
-          exit 1
-      fi
-   fi
+        echo 'fail to install $rdeps first!' >&2
+        exit 1
+    fi
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 17029451e36..169c8d98b1d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1289,6 +1289,25 @@ python emit_pkgdata() {
     from glob import glob
     import json
 
+    def process_postinst_on_target(pkg, mlprefix):
+        defer_fragment = """
+if [ -n "$D" ]; then
+    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot %s mlprefix=%s
+    exit 0
+fi
+""" % (pkg, mlprefix)
+
+        postinst = d.getVar('pkg_postinst_%s' % pkg)
+        postinst_ontarget = d.getVar('pkg_postinst_ontarget_%s' % pkg)
+
+        if postinst_ontarget:
+            bb.debug(1, 'adding deferred pkg_postinst_ontarget() to pkg_postinst() for %s' % pkg)
+            if not postinst:
+                postinst = '#!/bin/sh\n'
+            postinst += defer_fragment
+            postinst += postinst_ontarget
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+
     def write_if_exists(f, pkg, var):
         def encode(str):
             import codecs
@@ -1383,6 +1402,7 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'PKG')
         write_if_exists(sf, pkg, 'ALLOW_EMPTY')
         write_if_exists(sf, pkg, 'FILES')
+        process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
         write_if_exists(sf, pkg, 'pkg_postinst')
         write_if_exists(sf, pkg, 'pkg_postrm')
         write_if_exists(sf, pkg, 'pkg_preinst')
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c8ab421fe21..abcc852ba45 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -290,6 +290,24 @@ class Rootfs(object, metaclass=ABCMeta):
             # Remove the package manager data files
             self.pm.remove_packaging_data()
 
+    def _postpone_to_first_boot(self, postinst_intercept_hook):
+        with open(postinst_intercept_hook) as intercept:
+            registered_pkgs = None
+            for line in intercept.read().split("\n"):
+                m = re.match("^##PKGS:(.*)", line)
+                if m is not None:
+                    registered_pkgs = m.group(1).strip()
+                    break
+
+            if registered_pkgs is not None:
+                bb.warn("The postinstalls for the following packages "
+                        "will be postponed for first boot: %s" %
+                        registered_pkgs)
+
+                # call the backend dependent handler
+                self._handle_intercept_failure(registered_pkgs)
+
+
     def _run_intercepts(self):
         intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
                                       "intercept_scripts")
@@ -303,6 +321,10 @@ class Rootfs(object, metaclass=ABCMeta):
             if script == "postinst_intercept" or not os.access(script_full, os.X_OK):
                 continue
 
+            if script == "delay_to_first_boot":
+                self._postpone_to_first_boot(script_full)
+                continue
+
             bb.note("> Executing %s intercept ..." % script)
 
             try:
@@ -310,22 +332,7 @@ class Rootfs(object, metaclass=ABCMeta):
             except subprocess.CalledProcessError as e:
                 bb.warn("The postinstall intercept hook '%s' failed (exit code: %d)! See log for details! (Output: %s)" %
                         (script, e.returncode, e.output))
-
-                with open(script_full) as intercept:
-                    registered_pkgs = None
-                    for line in intercept.read().split("\n"):
-                        m = re.match("^##PKGS:(.*)", line)
-                        if m is not None:
-                            registered_pkgs = m.group(1).strip()
-                            break
-
-                    if registered_pkgs is not None:
-                        bb.warn("The postinstalls for the following packages "
-                                "will be postponed for first boot: %s" %
-                                registered_pkgs)
-
-                        # call the backend dependent handler
-                        self._handle_intercept_failure(registered_pkgs)
+                self._postpone_to_first_boot(script_full)
 
     def _run_ldconfig(self):
         if self.d.getVar('LDCONFIGDEPEND'):
diff --git a/scripts/postinst-intercepts/delay_to_first_boot b/scripts/postinst-intercepts/delay_to_first_boot
new file mode 100644
index 00000000000..ecdbef95dde
--- /dev/null
+++ b/scripts/postinst-intercepts/delay_to_first_boot
@@ -0,0 +1,2 @@
+#!/bin/sh
+exit 1
-- 
2.11.0


