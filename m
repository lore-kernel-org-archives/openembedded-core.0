Return-Path: <jussi.laako@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1193878354
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:38:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 04:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="900563745"
Received: from jlaako-lnx.fi.intel.com (HELO jlaako-lnx.fi.intel.com.)
	([10.237.72.200])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2017 04:38:30 -0700
From: Jussi Laako <jussi.laako@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 14:34:08 +0300
Message-Id: <20170915113408.37844-1-jussi.laako@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] libgcrypt: provide libgcrypt-config wrapper around pkg-config
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
X-List-Received-Date: Fri, 15 Sep 2017 11:38:30 -0000

This patch adds a libgcrypt-config wrapper for pkg-config support in
order to avoid patching all upstream packages using libgcrypt, while
otherwise keeping pkg-config functionality.

Also updates libgcrypt version from 1.8.0 to 1.8.1.

Signed-off-by: Jussi Laako <jussi.laako@linux.intel.com>
---
 .../libgcrypt/{libgcrypt_1.8.0.bb => libgcrypt_1.8.1.bb}    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.0.bb => libgcrypt_1.8.1.bb} (81%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
similarity index 81%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
index 1797d9584d..529882d8a4 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
@@ -15,18 +15,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
-SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
+SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://libgcrypt-config-wrapper.patch \
 "
-SRC_URI[md5sum] = "110ce4352f9ea6f560bdc6c5644ae93c"
-SRC_URI[sha256sum] = "f6e470b7f2d3a703e8747f05a8c19d9e10e26ebf2d5f3d71ff75a40f504e12ee"
+SRC_URI[md5sum] = "b21817f9d850064d2177285f1073ec55"
+SRC_URI[sha256sum] = "7a2875f8b1ae0301732e878c0cca2c9664ff09ef71408f085c50e332656a78b3"
 
-BINCONFIG = "${bindir}/libgcrypt-config"
-
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo pkgconfig binconfig
 
 EXTRA_OECONF = "--disable-asm"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
@@ -47,7 +46,7 @@ do_install_append() {
 
 PACKAGES =+ "dumpsexp-dev"
 
-FILES_${PN}-dev += "${bindir}/hmac256"
+FILES_${PN}-dev += "${bindir}/hmac256 ${bindir}/libgcrypt-config"
 FILES_dumpsexp-dev += "${bindir}/dumpsexp"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


