Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3YvB-0006t1-8W
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 22:22:29 +0100
Received: by mail-wi0-f179.google.com with SMTP id ez12so91031wid.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2013 13:06:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=EgRk+LyePEcWi9h2Kka4RaD6waTh5ZokUD11doya/nk=;
	b=NvWiLPt3+eYV9ympCCkGOcH+FYsDofLL2M8EWeTXFKyxyHEVphvWMauEP/Sf+xNdZS
	023Q+cwlv+oHMB7TTJfUehKSsLykt20uJIq7HC7e/uKE8SkqEp+zbTUinK5ncPd6DX/M
	iTHTxWc7pu6zAv8tI5kjgZqKY9QGVnchIk8DqFUA7ayIbXxuLfkVYPIJxeZZp6qgISkB
	xzNwfMf/mGaRgGzyUWg4+7yoCFMXdrNxJo+M3eWG+SwwrhR8GKJAxH968GLUh5tf7JzS
	joYx7hxDyjdWFMjHtkHkKIYsv9eOyj4Mrnfa5fDTWEEuFWFHQGmlU4t4VS7vOOdjiYYQ
	k4yA==
X-Received: by 10.194.108.200 with SMTP id hm8mr5553542wjb.21.1360269484018;
	Thu, 07 Feb 2013 12:38:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w5sm10862907wif.11.2013.02.07.12.38.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Feb 2013 12:38:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2013 20:35:52 +0000
Message-Id: <1360269352-11713-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn0xDoXltUWFVKbX64ntuQjqPkVZ1Mfvq917uYnYC0VtU4JnToELIRajaj4Q3VRYWV0+yc0
Subject: [PATCH] Revert "update-rc.d: disable update-rc.d.bbclass when systemd enabled"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 21:24:42 -0000

This was just wrong - when systemd is being used there'll still be packages that
use SysV-style init scripts, which systemd supports fine.

This reverts commit b94227f7290796f6ebbe5c5ff1680b9b689022b1.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass      |   90 ++++++++++++++++++++++++++++++++-
 meta/classes/update-rc.d_real.bbclass |   89 --------------------------------
 2 files changed, 89 insertions(+), 90 deletions(-)
 delete mode 100644 meta/classes/update-rc.d_real.bbclass

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 34f9838..83816d6 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1 +1,89 @@
-inherit ${@base_contains('DISTRO_FEATURES','sysvinit','update-rc.d_real','',d)}
+UPDATERCPN ?= "${PN}"
+
+DEPENDS_append = " update-rc.d-native"
+UPDATERCD = "update-rc.d"
+UPDATERCD_virtclass-cross = ""
+UPDATERCD_class-native = ""
+UPDATERCD_class-nativesdk = ""
+
+RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
+
+INITSCRIPT_PARAMS ?= "defaults"
+
+INIT_D_DIR = "${sysconfdir}/init.d"
+
+updatercd_postinst() {
+if test "x$D" != "x"; then
+	OPT="-r $D"
+else
+	OPT="-s"
+fi
+update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
+}
+
+updatercd_prerm() {
+if test "x$D" = "x"; then
+	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+fi
+}
+
+updatercd_postrm() {
+if [ "$D" != "" ]; then
+	update-rc.d -f -r $D ${INITSCRIPT_NAME} remove
+else
+	update-rc.d ${INITSCRIPT_NAME} remove
+fi
+}
+
+
+def update_rc_after_parse(d):
+    if d.getVar('INITSCRIPT_PACKAGES') == None:
+        if d.getVar('INITSCRIPT_NAME') == None:
+            raise bb.build.FuncFailed, "%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE')
+        if d.getVar('INITSCRIPT_PARAMS') == None:
+            raise bb.build.FuncFailed, "%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE')
+
+python __anonymous() {
+    update_rc_after_parse(d)
+}
+
+python populate_packages_prepend () {
+    def update_rcd_package(pkg):
+        bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' % pkg)
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", True)
+        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
+        bb.data.update_data(localdata)
+
+        """
+        update_rc.d postinst is appended here because pkg_postinst may require to
+        execute on the target. Not doing so may cause update_rc.d postinst invoked
+        twice to cause unwanted warnings.
+        """ 
+        postinst = localdata.getVar('pkg_postinst', True)
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += localdata.getVar('updatercd_postinst', True)
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        prerm = localdata.getVar('pkg_prerm', True)
+        if not prerm:
+            prerm = '#!/bin/sh\n'
+        prerm += localdata.getVar('updatercd_prerm', True)
+        d.setVar('pkg_prerm_%s' % pkg, prerm)
+
+        postrm = localdata.getVar('pkg_postrm', True)
+        if not postrm:
+                postrm = '#!/bin/sh\n'
+        postrm += localdata.getVar('updatercd_postrm', True)
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
+
+    pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
+    if pkgs == None:
+        pkgs = d.getVar('UPDATERCPN', True)
+        packages = (d.getVar('PACKAGES', True) or "").split()
+        if not pkgs in packages and packages != []:
+            pkgs = packages[0]
+    for pkg in pkgs.split():
+        update_rcd_package(pkg)
+}
diff --git a/meta/classes/update-rc.d_real.bbclass b/meta/classes/update-rc.d_real.bbclass
deleted file mode 100644
index 83816d6..0000000
--- a/meta/classes/update-rc.d_real.bbclass
+++ /dev/null
@@ -1,89 +0,0 @@
-UPDATERCPN ?= "${PN}"
-
-DEPENDS_append = " update-rc.d-native"
-UPDATERCD = "update-rc.d"
-UPDATERCD_virtclass-cross = ""
-UPDATERCD_class-native = ""
-UPDATERCD_class-nativesdk = ""
-
-RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
-
-INITSCRIPT_PARAMS ?= "defaults"
-
-INIT_D_DIR = "${sysconfdir}/init.d"
-
-updatercd_postinst() {
-if test "x$D" != "x"; then
-	OPT="-r $D"
-else
-	OPT="-s"
-fi
-update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
-}
-
-updatercd_prerm() {
-if test "x$D" = "x"; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
-fi
-}
-
-updatercd_postrm() {
-if [ "$D" != "" ]; then
-	update-rc.d -f -r $D ${INITSCRIPT_NAME} remove
-else
-	update-rc.d ${INITSCRIPT_NAME} remove
-fi
-}
-
-
-def update_rc_after_parse(d):
-    if d.getVar('INITSCRIPT_PACKAGES') == None:
-        if d.getVar('INITSCRIPT_NAME') == None:
-            raise bb.build.FuncFailed, "%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE')
-        if d.getVar('INITSCRIPT_PARAMS') == None:
-            raise bb.build.FuncFailed, "%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE')
-
-python __anonymous() {
-    update_rc_after_parse(d)
-}
-
-python populate_packages_prepend () {
-    def update_rcd_package(pkg):
-        bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' % pkg)
-        localdata = bb.data.createCopy(d)
-        overrides = localdata.getVar("OVERRIDES", True)
-        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
-        bb.data.update_data(localdata)
-
-        """
-        update_rc.d postinst is appended here because pkg_postinst may require to
-        execute on the target. Not doing so may cause update_rc.d postinst invoked
-        twice to cause unwanted warnings.
-        """ 
-        postinst = localdata.getVar('pkg_postinst', True)
-        if not postinst:
-            postinst = '#!/bin/sh\n'
-        postinst += localdata.getVar('updatercd_postinst', True)
-        d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-        prerm = localdata.getVar('pkg_prerm', True)
-        if not prerm:
-            prerm = '#!/bin/sh\n'
-        prerm += localdata.getVar('updatercd_prerm', True)
-        d.setVar('pkg_prerm_%s' % pkg, prerm)
-
-        postrm = localdata.getVar('pkg_postrm', True)
-        if not postrm:
-                postrm = '#!/bin/sh\n'
-        postrm += localdata.getVar('updatercd_postrm', True)
-        d.setVar('pkg_postrm_%s' % pkg, postrm)
-
-    pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
-    if pkgs == None:
-        pkgs = d.getVar('UPDATERCPN', True)
-        packages = (d.getVar('PACKAGES', True) or "").split()
-        if not pkgs in packages and packages != []:
-            pkgs = packages[0]
-    for pkg in pkgs.split():
-        update_rcd_package(pkg)
-}
-- 
1.7.10.4



