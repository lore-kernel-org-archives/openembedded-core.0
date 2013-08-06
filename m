Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 010E8612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 19:08:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r76J8S1f001399
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Aug 2013 12:08:28 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 6 Aug 2013 12:08:28 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2013 12:08:27 -0700
Message-ID: <1375816107-30963-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] openjade-native: do not create shared libraries
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
X-List-Received-Date: Tue, 06 Aug 2013 19:08:28 -0000
Content-Type: text/plain

CQID: 429576

openjade is the only one that uses the shared libraries
and sometimes it cannot find them!

[Yocto #2972]

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../openjade/openjade-native_1.3.2.bb              |   29 ++++++++++++++-----
 1 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 8af0b52..ffdb3fc 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -7,7 +7,7 @@ SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "opensp-native sgml-common-native"
 RDEPENDS_${PN} = "sgml-common-native"
@@ -24,8 +24,13 @@ SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7
 
 inherit autotools native
 
+# Per bugzilla.yoctoproject.org/show_bug.cgi?id=2972 we do
+# not create shared libraries.  Note that openjade still links
+# to shared libraries from other packages.
+#
 EXTRA_OECONF = "--enable-spincludedir=${STAGING_INCDIR}/OpenSP \
-                --enable-splibdir=${STAGING_LIBDIR}"
+                --enable-splibdir=${STAGING_LIBDIR} \
+                --disable-shared"
 
 # We need to set datadir explicitly, but adding it to EXTRA_OECONF
 # results in it being specified twice when configure is run.
@@ -55,13 +60,21 @@ do_compile_prepend () {
 do_install() {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/openjade.html
 	# for details.
-	install -d ${D}${bindir}	
-	install -m 0755 ${S}/jade/.libs/openjade ${D}${bindir}/openjade
-	ln -sf openjade ${D}${bindir}/jade
+	install -d ${D}${bindir}
 
-	oe_libinstall -a -so -C style libostyle ${D}${libdir}
-	oe_libinstall -a -so -C spgrove libospgrove ${D}${libdir}
-	oe_libinstall -a -so -C grove libogrove ${D}${libdir}
+	# install shared library version if it exists
+	#
+	if [ -f ${S}/jade/.libs/openjade ]
+	then
+	 install -m 0755 ${S}/jade/.libs/openjade ${D}${bindir}/openjade
+	 oe_libinstall -a -so -C style libostyle ${D}${libdir}
+	 oe_libinstall -a -so -C spgrove libospgrove ${D}${libdir}
+	 oe_libinstall -a -so -C grove libogrove ${D}${libdir}
+	else
+	 install -m 0755 ${S}/jade/openjade ${D}${bindir}/openjade
+	fi
+
+	ln -sf openjade ${D}${bindir}/jade
 
 	install -d ${D}${datadir}/sgml/openjade-${PV}
 	install -m 644 dsssl/catalog ${D}${datadir}/sgml/openjade-${PV}
-- 
1.7.3.4


