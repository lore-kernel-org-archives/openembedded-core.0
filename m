Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJvEf-0000R8-SD
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:21:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GNC4ch000670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:12:04 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 16:12:03 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:16:23 -0500
Message-ID: <a6471df1337d5f904defb60f761f3c5ae8c3f468.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 10/17] findutils: Use update-alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 23:21:30 -0000
Content-Type: text/plain

Change to using update-alternatives to ensure that we're consistently
using the class, and the package provides are being setup properly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/findutils/findutils.inc      |    5 +++-
 .../recipes-extended/findutils/findutils_4.2.31.bb |   22 ++++---------------
 meta/recipes-extended/findutils/findutils_4.4.2.bb |   17 +--------------
 3 files changed, 10 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 7a07ad5..64909a1 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
+
+ALTERNATIVE_LINKS = "${bindir}/find ${bindir}/xargs"
+ALTERNATIVE_PRIORITY = "100"
 
 # diffutils assumes non-glibc compilation with uclibc and
 # this causes it to generate its own implementations of
diff --git a/meta/recipes-extended/findutils/findutils_4.2.31.bb b/meta/recipes-extended/findutils/findutils_4.2.31.bb
index bd455a5..0c37836 100644
--- a/meta/recipes-extended/findutils/findutils_4.2.31.bb
+++ b/meta/recipes-extended/findutils/findutils_4.2.31.bb
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz \
            file://gnulib-extension.patch"
@@ -16,7 +16,10 @@ SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz \
 SRC_URI[md5sum] = "a0e31a0f18a49709bf5a449867c8049a"
 SRC_URI[sha256sum] = "e0d34b8faca0b3cca0703f6c6b498afbe72f0ba16c35980c10ec9ef7724d6204"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
+
+ALTERNATIVE_LINKS = "${bindir}/find ${bindir}/xargs"
+ALTERNATIVE_PRIORITY = "100"
 
 # diffutils assumes non-glibc compilation with uclibc and
 # this causes it to generate its own implementations of
@@ -25,19 +28,4 @@ inherit autotools gettext
 # see diffutils.mk in buildroot)
 EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 
-do_install_append () {
-	if [ -e ${D}${bindir}/find ]; then
-		mv ${D}${bindir}/find ${D}${bindir}/find.${PN}
-		mv ${D}${bindir}/xargs ${D}${bindir}/xargs.${PN}
-	fi
-}
-
-pkg_postinst_${PN} () {
-	for i in find xargs; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
-}
-
-pkg_prerm_${PN} () {
-	for i in find xargs; do update-alternatives --remove $i $i.${PN}; done
-}
-
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index b2898ed..d80511c 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -1,6 +1,6 @@
 require findutils.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://01-27017.patch \
             file://02-28824.patch \
@@ -13,19 +13,4 @@ SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd7
 # http://savannah.gnu.org/bugs/?27299
 CACHED_CONFIGUREVARS += "${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
 
-do_install_append () {
-        if [ -e ${D}${bindir}/find ]; then
-            mv ${D}${bindir}/find ${D}${bindir}/find.${PN}
-            mv ${D}${bindir}/xargs ${D}${bindir}/xargs.${PN}
-        fi
-}
-
-pkg_postinst_${PN} () {
-	for i in find xargs; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
-}
-
-pkg_prerm_${PN} () {
-	for i in find xargs; do update-alternatives --remove $i $i.${PN}; done
-}
-
 BBCLASSEXTEND = "native"
-- 
1.7.3.4



