Return-Path: <chia.chuan.wu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3463975A02
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 09:18:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2015 02:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,515,1432623600"; d="scan'208";a="609928528"
Received: from ssid-ilbpg4.png.intel.com ([10.88.227.68])
	by orsmga003.jf.intel.com with ESMTP; 21 Jul 2015 02:18:04 -0700
From: chia.chuan.wu@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jul 2015 17:17:49 +0800
Message-Id: <1437470269-18898-2-git-send-email-chia.chuan.wu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437470269-18898-1-git-send-email-chia.chuan.wu@intel.com>
References: <1437470269-18898-1-git-send-email-chia.chuan.wu@intel.com>
Subject: [meta-oe][dizzy][PATCH] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Tue, 21 Jul 2015 09:18:05 -0000

From: Robert Yang <liezhi.yang@windriver.com>

We have libxml2-python for native and nativesdk, but don't have it for
target, and can't find the reason from the git log, libxml2-python is
widely used, after looked into it's configure.in, we can add it
by PACKAGECONFIG.

The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
acted as work becase it's conigure can check automatically, python is in
${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
${PYTHON}.

Add python to PACKAGECONFIG, since createrepo rdepends on
libxml2-python, otherwise the target createrepo can't work.

(From OE-Core rev: ed72e123724599e70eb4d283f06fca3e56a8b50a)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 212d9d4245cef2343f21d65fa1ee7cfd537432a3)

Signed-off-by: WU CHIA CHUAN <chia.chuan.wu@intel.com>
---
 meta/recipes-core/libxml/libxml2.inc |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index c729c19..6f01128 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
-DEPENDS_class-nativesdk = "nativesdk-python"
-DEPENDS_class-native = "python-native"
 DEPENDS =+ "zlib"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
@@ -30,6 +28,8 @@ inherit autotools pkgconfig binconfig-disabled pythonnative ptest
 
 RDEPENDS_${PN}-ptest += "python-core"
 
+RDEPENDS_${PN}-python += "python-core"
+
 RDEPENDS_${PN}-ptest_append_libc-glibc += "glibc-gconv-ebcdic-us glibc-gconv-ibm1141"
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
@@ -37,16 +37,16 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
 }
 
-do_configure_prepend_class-nativesdk () {
-	# Ensure we get the correct site-packages path
-	export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
-}
+export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
+
+PACKAGECONFIG ??= "python"
 
+PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python"
 # WARNING: zlib is require for RPM use
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
 
 # required for pythong binding
 export HOST_SYS
-- 
1.7.9.5


