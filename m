Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhSz-0007e0-U1
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:50 +0100
Received: from mail-ee0-f70.google.com ([74.125.83.70])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:24 -0800
Received: by mail-ee0-f70.google.com with SMTP id l10so5817607eei.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=4O5F7rMx1OgyUR1LOQRNDD4AbA8tBL5JI1V8atXZbvw=;
	b=S0PjXbdNxdVQVEm8Ok8UP0d54QWJ5UxKpyWUnkMcDwkxOa6mOVz5rM2YjBv/ROrJYl
	unfY2Nr0oNWkH9JSSEyv373LewPgRLFgjB8VqH3YvoXvVNyYkr9l15/T4cxIVQDhvYak
	eV64toJl+Dv5Vho1bnXHSM9Mm8InaWSRReD63i+PRqyrant28gLwi2kCr8kSE+jOMtBP
	iufj/xdc6Al4rwZKSyuDYftAg1KSTG5RDX/GHjUzAO0fay2gIQ8TNjU00lGtqaYF9Tl/
	+aVtGrSd6WOa2fjyhcU5v1sH9zJfK9Eh9Nx1FeceDOZolxBrXXI6jdQPA8CEeD1p5SJz
	n64g==
X-Received: by 10.180.79.194 with SMTP id l2mr9377085wix.22.1358635762552;
	Sat, 19 Jan 2013 14:49:22 -0800 (PST)
X-Received: by 10.180.79.194 with SMTP id l2mr9377083wix.22.1358635762469;
	Sat, 19 Jan 2013 14:49:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.21
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:10 +0000
Message-Id: <20752e738080291f5353baa951193a23ac464b18.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlHJ7sKhKSbgdtIjQkA1r2Po3MQ/joRBdzjPobqWrPRqFp7BlDUN9LaKedDkL0UpmkS0H+5kSVFZgZjkCoxMMaRmKeSo8Fs0A5v2jbd0u8X/4M5zUhHVO24I19RRMxSgEYZ4P3jB0teLPLNSd5Zi5S0FCsk50mmBOpuEx/lFqf+vK/mFEBHvqGiLGQFHqKl/bY0y4XN
Subject: [PATCH 07/10] update-rc.d: disable update-rc.d.bbclass when systemd enabled
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
X-List-Received-Date: Sat, 19 Jan 2013 23:04:51 -0000

From: Radu Moisan <radu.moisan@intel.com>

update-rc.d is not necessary when systemd is enabled,
systemctl is the replacement

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass      |   90 +--------------------------------
 meta/classes/update-rc.d_real.bbclass |   89 ++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 89 deletions(-)
 create mode 100644 meta/classes/update-rc.d_real.bbclass

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 83816d6..34f9838 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,89 +1 @@
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
+inherit ${@base_contains('DISTRO_FEATURES','sysvinit','update-rc.d_real','',d)}
diff --git a/meta/classes/update-rc.d_real.bbclass b/meta/classes/update-rc.d_real.bbclass
new file mode 100644
index 0000000..83816d6
--- /dev/null
+++ b/meta/classes/update-rc.d_real.bbclass
@@ -0,0 +1,89 @@
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
-- 
1.7.10.4



