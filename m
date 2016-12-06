Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id E67B0719F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:49:58 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id C434EB88FF9; Tue,  6 Dec 2016 12:49:52 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:25 +0100
Message-Id: <1481024991-5882-8-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 07/33] apt-native: merge apt-native.inc into .bb
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
X-List-Received-Date: Tue, 06 Dec 2016 11:49:59 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt-native.inc       | 70 ------------------------
 meta/recipes-devtools/apt/apt-native_1.2.12.bb | 74 ++++++++++++++++++++++++--
 2 files changed, 71 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-native.inc

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
deleted file mode 100644
index 9fa206e..0000000
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ /dev/null
@@ -1,70 +0,0 @@
-require apt.inc
-inherit native
-
-DEPENDS += "dpkg-native gettext-native db-native curl-native xz-native"
-PACKAGES = ""
-USE_NLS = "yes"
-
-SRC_URI += "file://db_linking_hack.patch \
-            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-            file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
-            file://0001-fix-the-gcc-version-check.patch \
-"
-
-python do_install () {
-    bb.build.exec_func('do_install_base', d)
-    bb.build.exec_func('do_install_config', d)
-}
-
-python do_install_config () {
-    indir = os.path.dirname(d.getVar('FILE', True))
-    infile = open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
-    data = infile.read()
-    infile.close()
-
-    data = d.expand(data)
-
-    outdir = oe.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
-    if not os.path.exists(outdir):
-        os.makedirs(outdir)
-
-    outpath = oe.path.join(outdir, 'apt.conf.sample')
-    if not os.path.exists(outpath):
-        outfile = open(outpath, 'w')
-        outfile.write(data)
-        outfile.close()
-}
-
-do_install_base () {
-	install -d ${D}${bindir}
-	install -m 0755 bin/apt-cdrom ${D}${bindir}/
-	install -m 0755 bin/apt-get ${D}${bindir}/
-	install -m 0755 bin/apt-config ${D}${bindir}/
-	install -m 0755 bin/apt-cache ${D}${bindir}/
-	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
-	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
-	install -m 0755 bin/apt-ftparchive ${D}${bindir}/
-
-	oe_libinstall -so -C bin libapt-private ${D}${libdir}/
-
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-
-	install -d ${D}${libdir}/apt/methods
-	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
-
-	install -d ${D}${libdir}/dpkg/methods/apt
-	install -m 0644 ${S}/dselect/desc.apt ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0644 ${S}/dselect/names ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/install ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/setup ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/update ${D}${libdir}/dpkg/methods/apt/ 
-
-	install -d ${D}${sysconfdir}/apt
-	install -d ${D}${sysconfdir}/apt/apt.conf.d
-	install -d ${D}${sysconfdir}/apt/preferences.d
-	install -d ${D}${localstatedir}/lib/apt/lists/partial
-	install -d ${D}${localstatedir}/cache/apt/archives/partial
-
-	install -d ${D}${localstatedir}/log/apt/
-}
diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
index 1e660da..0edceeb 100644
--- a/meta/recipes-devtools/apt/apt-native_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
@@ -1,4 +1,72 @@
-require apt-native.inc
+require apt.inc
+inherit native
 
-SRC_URI += "file://noconfigure.patch \
-            file://no-curl.patch"
+DEPENDS += "dpkg-native gettext-native db-native curl-native xz-native"
+PACKAGES = ""
+USE_NLS = "yes"
+
+SRC_URI += "file://db_linking_hack.patch \
+            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
+            file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
+            file://0001-fix-the-gcc-version-check.patch \
+            file://noconfigure.patch \
+            file://no-curl.patch \
+"
+
+python do_install () {
+    bb.build.exec_func('do_install_base', d)
+    bb.build.exec_func('do_install_config', d)
+}
+
+python do_install_config () {
+    indir = os.path.dirname(d.getVar('FILE', True))
+    infile = open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
+    data = infile.read()
+    infile.close()
+
+    data = d.expand(data)
+
+    outdir = oe.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
+    if not os.path.exists(outdir):
+        os.makedirs(outdir)
+
+    outpath = oe.path.join(outdir, 'apt.conf.sample')
+    if not os.path.exists(outpath):
+        outfile = open(outpath, 'w')
+        outfile.write(data)
+        outfile.close()
+}
+
+do_install_base () {
+	install -d ${D}${bindir}
+	install -m 0755 bin/apt-cdrom ${D}${bindir}/
+	install -m 0755 bin/apt-get ${D}${bindir}/
+	install -m 0755 bin/apt-config ${D}${bindir}/
+	install -m 0755 bin/apt-cache ${D}${bindir}/
+	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
+	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
+	install -m 0755 bin/apt-ftparchive ${D}${bindir}/
+
+	oe_libinstall -so -C bin libapt-private ${D}${libdir}/
+
+	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
+	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
+
+	install -d ${D}${libdir}/apt/methods
+	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
+
+	install -d ${D}${libdir}/dpkg/methods/apt
+	install -m 0644 ${S}/dselect/desc.apt ${D}${libdir}/dpkg/methods/apt/ 
+	install -m 0644 ${S}/dselect/names ${D}${libdir}/dpkg/methods/apt/ 
+	install -m 0755 ${S}/dselect/install ${D}${libdir}/dpkg/methods/apt/ 
+	install -m 0755 ${S}/dselect/setup ${D}${libdir}/dpkg/methods/apt/ 
+	install -m 0755 ${S}/dselect/update ${D}${libdir}/dpkg/methods/apt/ 
+
+	install -d ${D}${sysconfdir}/apt
+	install -d ${D}${sysconfdir}/apt/apt.conf.d
+	install -d ${D}${sysconfdir}/apt/preferences.d
+	install -d ${D}${localstatedir}/lib/apt/lists/partial
+	install -d ${D}${localstatedir}/cache/apt/archives/partial
+
+	install -d ${D}${localstatedir}/log/apt/
+}
-- 
2.7.4


