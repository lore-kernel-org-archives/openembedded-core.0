Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1D971BF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:09 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 50CD4B87F89; Thu,  8 Dec 2016 22:47:59 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:37 +0100
Message-Id: <1481233677-27298-14-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 13/33] apt: rewrite do_install
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:10 -0000

Install missing files and directories (apt, apt-ftparchive,
apt-helper, apt-mark, trusted.gpg.d).

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt_1.2.12.bb | 73 ++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index c531a49..20c7cb4 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -4,44 +4,55 @@ require apt.inc
 
 PACKAGES =+ "${PN}-utils"
 FILES_${PN} += "${libdir}/dpkg"
-FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
+FILES_${PN}-utils = "${bindir}/apt-extracttemplates \
+                     ${bindir}/apt-ftparchive \
+                     ${bindir}/apt-sortpkgs"
+
+PROGRAMS = " \
+    apt apt-cache apt-cdrom apt-config apt-extracttemplates \
+    apt-ftparchive apt-get apt-key apt-mark apt-sortpkgs \
+"
 
 do_install () {
-	set -x
 	install -d ${D}${bindir}
-	install -m 0755 bin/apt-key ${D}${bindir}/
-	install -m 0755 bin/apt-cdrom ${D}${bindir}/
-	install -m 0755 bin/apt-get ${D}${bindir}/
-	install -m 0755 bin/apt-config ${D}${bindir}/
-	install -m 0755 bin/apt-cache ${D}${bindir}/
+	for f in ${PROGRAMS}; do
+		install -m 0755 bin/$f ${D}${bindir}
+	done
+
+	install -d ${D}${docdir}/apt/examples
+	install -m 0644 ${S}/doc/examples/* ${D}${docdir}/apt/examples
 
-	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
-	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
+	install -d ${D}${includedir}/apt-pkg
+	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg
 
-	oe_libinstall -so -C bin libapt-pkg ${D}${libdir}
-	oe_libinstall -so -C bin libapt-inst ${D}${libdir}
+	install -d ${D}${libdir}
+	for f in inst pkg private; do
+		oe_libinstall -so -C bin libapt-$f ${D}${libdir}
+	done
+
+	install -d ${D}${libdir}/apt
+	install -m 0755 bin/apt-helper ${D}${libdir}/apt
 
 	install -d ${D}${libdir}/apt/methods
-	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
+	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods
 
 	install -d ${D}${libdir}/dpkg/methods/apt
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
+	for f in desc.apt names; do
+		install -m 0644 ${S}/dselect/$f ${D}${libdir}/dpkg/methods/apt
+	done
+	for f in install setup update; do
+		install -m 0755 ${S}/dselect/$f ${D}${libdir}/dpkg/methods/apt
+	done
+
+	for d in apt.conf.d preferences.d sources.list.d trusted.gpg.d; do
+		install -d ${D}${sysconfdir}/apt/$d
+	done
 
-	install -d ${D}${includedir}/apt-pkg/
-	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
+	install -d ${D}${localstatedir}/cache/apt/archives/partial
+	install -d ${D}${localstatedir}/lib/apt/lists/partial
+	install -d ${D}${localstatedir}/lib/apt/mirrors/partial
+	install -d ${D}${localstatedir}/lib/apt/periodic
+	install -d ${D}${localstatedir}/log/apt
 }
 
 PACKAGECONFIG ??= "lzma"
@@ -49,9 +60,7 @@ PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_
 PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
 PACKAGECONFIG[lz4] = "ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
 
-do_install_append() {
+do_install_append_class-target() {
     #Write the correct apt-architecture to apt.conf
-    APT_CONF=${D}/etc/apt/apt.conf
-    echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
-    oe_libinstall -so -C bin libapt-private ${D}${libdir}/
+    echo 'APT::Architecture "${DPKG_ARCH}";' > ${D}${sysconfdir}/apt/apt.conf
 }
-- 
2.7.4


