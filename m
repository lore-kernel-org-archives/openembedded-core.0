Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1BB71C6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:05 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id A8C22B80B95; Thu,  8 Dec 2016 22:47:58 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:32 +0100
Message-Id: <1481233677-27298-9-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 08/33] apt: merge apt-package.inc into .bb
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:05 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt-package.inc | 78 ------------------------------
 meta/recipes-devtools/apt/apt_1.2.12.bb   | 79 ++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-package.inc

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
deleted file mode 100644
index a553aa2..0000000
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ /dev/null
@@ -1,78 +0,0 @@
-apt-manpages="doc/apt-cache.8 \
-	      doc/apt-cdrom.8 \
-	      doc/apt-config.8 \
-	      doc/apt-get.8 \
-	      doc/apt.8 \
-	      doc/apt.conf.5 \
-	      doc/apt_preferences.5 \
-	      doc/sources.list.5"
-apt-utils-manpages="doc/apt-extracttemplates.1 \
-		    doc/apt-sortpkgs.1"
-
-def get_files_apt_doc(d, bb, manpages):
-    import re
-    manpages = re.sub(r'\bdoc/(\S+)/(\S+)\.\1\.(.)\b', r'${mandir}/\1/man\3/\2.\3', manpages)
-    manpages = re.sub(r'\bdoc/(\S+)\.(.)\b', r'${mandir}/man\2/\1.\2', manpages)
-    return manpages
-
-def get_commands_apt_doc(d, bb, manpages):
-    s = list()
-    __dir_cache__ = list()
-    for m in manpages.split():
-        dest = get_files_apt_doc(d, bb, m)
-        dir = os.path.dirname(dest)
-        if not dir in __dir_cache__:
-            s.append("install -d ${D}/%s" % dir)
-            __dir_cache__.append(dir)
-        s.append("install -m 0644 %s ${D}/%s" % (m, dest))
-    return "\n".join(s)
-
-PACKAGES += "${PN}-utils ${PN}-utils-doc"
-FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
-	       ${bindir}/apt-config ${bindir}/apt-cache \
-	       ${libdir}/apt ${libdir}/libapt*.so.* \
-	       ${localstatedir} ${sysconfdir} \
-	       ${libdir}/dpkg"
-FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
-FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', True))} \
-		   ${docdir}/apt"
-FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}"
-FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
-
-do_install () {
-	set -x
-	install -d ${D}${bindir}
-	install -m 0755 bin/apt-key ${D}${bindir}/
-	install -m 0755 bin/apt-cdrom ${D}${bindir}/
-	install -m 0755 bin/apt-get ${D}${bindir}/
-	install -m 0755 bin/apt-config ${D}${bindir}/
-	install -m 0755 bin/apt-cache ${D}${bindir}/
-
-	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
-	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
-
-	oe_libinstall -so -C bin libapt-pkg ${D}${libdir}
-	oe_libinstall -so -C bin libapt-inst ${D}${libdir}
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
-	install -d ${D}${sysconfdir}/apt/sources.list.d
-	install -d ${D}${sysconfdir}/apt/preferences.d
-	install -d ${D}${localstatedir}/lib/apt/lists/partial
-	install -d ${D}${localstatedir}/cache/apt/archives/partial
-	install -d ${D}${docdir}/apt/examples
-	install -m 0644 ${S}/doc/examples/* ${D}${docdir}/apt/examples/
-
-	install -d ${D}${includedir}/apt-pkg/
-	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
-}
diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index ae0bce9..3efa14e 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -2,7 +2,84 @@ DEPENDS = "curl db zlib"
 RDEPENDS_${PN} = "dpkg bash debianutils"
 require apt.inc
 
-require apt-package.inc
+apt-manpages="doc/apt-cache.8 \
+	      doc/apt-cdrom.8 \
+	      doc/apt-config.8 \
+	      doc/apt-get.8 \
+	      doc/apt.8 \
+	      doc/apt.conf.5 \
+	      doc/apt_preferences.5 \
+	      doc/sources.list.5"
+apt-utils-manpages="doc/apt-extracttemplates.1 \
+		    doc/apt-sortpkgs.1"
+
+def get_files_apt_doc(d, bb, manpages):
+    import re
+    manpages = re.sub(r'\bdoc/(\S+)/(\S+)\.\1\.(.)\b', r'${mandir}/\1/man\3/\2.\3', manpages)
+    manpages = re.sub(r'\bdoc/(\S+)\.(.)\b', r'${mandir}/man\2/\1.\2', manpages)
+    return manpages
+
+def get_commands_apt_doc(d, bb, manpages):
+    s = list()
+    __dir_cache__ = list()
+    for m in manpages.split():
+        dest = get_files_apt_doc(d, bb, m)
+        dir = os.path.dirname(dest)
+        if not dir in __dir_cache__:
+            s.append("install -d ${D}/%s" % dir)
+            __dir_cache__.append(dir)
+        s.append("install -m 0644 %s ${D}/%s" % (m, dest))
+    return "\n".join(s)
+
+PACKAGES += "${PN}-utils ${PN}-utils-doc"
+FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
+	       ${bindir}/apt-config ${bindir}/apt-cache \
+	       ${libdir}/apt ${libdir}/libapt*.so.* \
+	       ${localstatedir} ${sysconfdir} \
+	       ${libdir}/dpkg"
+FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
+FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', True))} \
+		   ${docdir}/apt"
+FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}"
+FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
+
+do_install () {
+	set -x
+	install -d ${D}${bindir}
+	install -m 0755 bin/apt-key ${D}${bindir}/
+	install -m 0755 bin/apt-cdrom ${D}${bindir}/
+	install -m 0755 bin/apt-get ${D}${bindir}/
+	install -m 0755 bin/apt-config ${D}${bindir}/
+	install -m 0755 bin/apt-cache ${D}${bindir}/
+
+	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
+	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
+
+	oe_libinstall -so -C bin libapt-pkg ${D}${libdir}
+	oe_libinstall -so -C bin libapt-inst ${D}${libdir}
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
+	install -d ${D}${sysconfdir}/apt/sources.list.d
+	install -d ${D}${sysconfdir}/apt/preferences.d
+	install -d ${D}${localstatedir}/lib/apt/lists/partial
+	install -d ${D}${localstatedir}/cache/apt/archives/partial
+	install -d ${D}${docdir}/apt/examples
+	install -m 0644 ${S}/doc/examples/* ${D}${docdir}/apt/examples/
+
+	install -d ${D}${includedir}/apt-pkg/
+	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
+}
 
 PACKAGECONFIG ??= "lzma"
 PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_easy_encoder=no,xz"
-- 
2.7.4


