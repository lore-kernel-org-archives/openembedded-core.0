Return-Path: <rewitt@declaratino.com>
Received: from p3plsmtpa09-08.prod.phx3.secureserver.net
	(p3plsmtpa09-08.prod.phx3.secureserver.net [173.201.193.237])
	by mail.openembedded.org (Postfix) with ESMTP id D8C766AD3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 17:33:37 +0000 (UTC)
Received: from localhost.localdomain ([74.131.113.133])
	by p3plsmtpa09-08.prod.phx3.secureserver.net with 
	id t5ZJ1l0082skrMm015ZeGS; Wed, 26 Jun 2013 10:33:39 -0700
From: Randy Witt <rewitt@declaratino.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2013 13:33:17 -0400
Message-Id: <1372267997-9077-3-git-send-email-rewitt@declaratino.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1372267997-9077-1-git-send-email-rewitt@declaratino.com>
References: <1372267997-9077-1-git-send-email-rewitt@declaratino.com>
Subject: [PATCH 2/2] systemd: Move functions that only affect metadata to parse time.
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
X-List-Received-Date: Wed, 26 Jun 2013 17:33:38 -0000

From: Randy Witt <rewitt@lpdev.prtdev.lexmark.com>

The functions that don't have dependencies on the data in ${D} should
run at parse time. This way overrides behave correctly and the
python functions can actually be replaced/redefined in individual
recipes.

i.e:
systemd_postinst_${PN} () {
}

This is useful for times when you don't want to enable or disable a
service automatically on install, but still want the rest of the
functionality of the systemd.bbclass.

Signed-off-by: Randy Witt <rewitt@declaratino.com>
---
 meta/classes/systemd.bbclass | 70 +++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 0447e53..b997f32 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -12,6 +12,37 @@ SYSTEMD_AUTO_ENABLE ??= "enable"
 # even if the systemd DISTRO_FEATURE isn't enabled.  As such don't make any
 # changes directly but check the DISTRO_FEATURES first.
 python __anonymous() {
+    # Check if systemd-packages already included in PACKAGES
+    def systemd_check_package(pkg_systemd):
+        packages = d.getVar('PACKAGES', True)
+        if not pkg_systemd in packages.split():
+            bb.error('%s does not appear in package list, please add it' % pkg_systemd)
+
+
+    def systemd_generate_package_scripts(pkg):
+        bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
+
+        # Add pkg to the overrides so that it finds the SYSTEMD_SERVICE_pkg
+        # variable.
+        localdata = d.createCopy()
+        localdata.prependVar("OVERRIDES", pkg + ":")
+        bb.data.update_data(localdata)
+
+        shebang = '#!/bin/sh\n'
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+        if not postinst:
+            postinst = shebang
+        postinst += localdata.getVar('systemd_postinst', True)
+        if postinst != shebang:
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        prerm = d.getVar('pkg_prerm_%s' % pkg, True)
+        if not prerm:
+            prerm = '#!/bin/sh\n'
+        prerm += localdata.getVar('systemd_prerm', True)
+        d.setVar('pkg_prerm_%s' % pkg, prerm)
+
+
     features = d.getVar("DISTRO_FEATURES", True).split()
     # If the distro features have systemd but not sysvinit, inhibit update-rcd
     # from doing any work so that pure-systemd images don't have redundant init
@@ -20,6 +51,12 @@ python __anonymous() {
         d.appendVar("DEPENDS", " systemd-systemctl-native")
         if "sysvinit" not in features:
             d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+
+        for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
+            systemd_check_package(pkg)
+            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
+                systemd_generate_package_scripts(pkg)
+
 }
 
 systemd_postinst() {
@@ -58,35 +95,6 @@ python systemd_populate_packages() {
             val = (d.getVar(var, True) or "").strip()
         return val
 
-    # Check if systemd-packages already included in PACKAGES
-    def systemd_check_package(pkg_systemd):
-        packages = d.getVar('PACKAGES', True)
-        if not pkg_systemd in packages.split():
-            bb.error('%s does not appear in package list, please add it' % pkg_systemd)
-
-
-    def systemd_generate_package_scripts(pkg):
-        bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
-
-        # Add pkg to the overrides so that it finds the SYSTEMD_SERVICE_pkg
-        # variable.
-        localdata = d.createCopy()
-        localdata.prependVar("OVERRIDES", pkg + ":")
-        bb.data.update_data(localdata)
-
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
-        if not postinst:
-            postinst = '#!/bin/sh\n'
-        postinst += localdata.getVar('systemd_postinst', True)
-        d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-        prerm = d.getVar('pkg_prerm_%s' % pkg, True)
-        if not prerm:
-            prerm = '#!/bin/sh\n'
-        prerm += localdata.getVar('systemd_prerm', True)
-        d.setVar('pkg_prerm_%s' % pkg, prerm)
-
-
     # Add files to FILES_*-systemd if existent and not already done
     def systemd_append_file(pkg_systemd, file_append):
         appended = False
@@ -153,10 +161,6 @@ python systemd_populate_packages() {
 
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D", True)):
-        for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
-            systemd_check_package(pkg)
-            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
-                systemd_generate_package_scripts(pkg)
         systemd_check_services()
 }
 
-- 
1.8.1.4


