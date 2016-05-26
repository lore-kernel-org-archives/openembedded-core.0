Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7B96FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:55:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 05:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="985165565"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2016 05:55:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 15:54:53 +0300
Message-Id: <16709b46d01be28b7fb5bd4065d1fb101e144944.1464266929.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8b5285972ecb25a04289bc0b050d8f44d18fc048.1464266929.git.jussi.kukkonen@intel.com>
References: <8b5285972ecb25a04289bc0b050d8f44d18fc048.1464266929.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464266929.git.jussi.kukkonen@intel.com>
References: <cover.1464266929.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 6/7] gnupg.org-hosted recipes: Change SRC_URI to https site
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
X-List-Received-Date: Thu, 26 May 2016 12:55:11 -0000

https version seems more reliable and in an informal test fetching
all gnupg recipes now takes <20% of the time it used to.

Define GNUPG_MIRROR in bitbake.conf so future tweaks to this are
easier. Replace some slower mirrors with the official ftp site
and another from gnupg.org mirror list.

Set UPSTREAM_CHECK_URI in all recipes that need it to
"https://gnupg.org/download/index.html" as the directory listings
are not up-to-date.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/mirrors.bbclass                           | 8 ++++----
 meta/conf/bitbake.conf                                 | 2 ++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb              | 2 +-
 meta/recipes-support/gnupg/gnupg_2.1.11.bb             | 3 ++-
 meta/recipes-support/gpgme/gpgme_1.6.0.bb              | 3 ++-
 meta/recipes-support/libassuan/libassuan_2.4.2.bb      | 3 ++-
 meta/recipes-support/libgcrypt/libgcrypt.inc           | 3 ++-
 meta/recipes-support/libgpg-error/libgpg-error_1.21.bb | 3 ++-
 meta/recipes-support/libksba/libksba_1.3.3.bb          | 3 ++-
 meta/recipes-support/npth/npth_1.2.bb                  | 3 ++-
 meta/recipes-support/pinentry/pinentry_0.9.2.bb        | 3 ++-
 11 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 9e6d483..1184708 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -21,13 +21,13 @@ ${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool \n \
 ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu \n \
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
-ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/ \n \
-ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfnet.nl/pub/security/gnupg/ \n \
-ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/ \n \
+${GNUPG_MIRROR}	ftp://ftp.gnupg.org/gcrypt \n \
+${GNUPG_MIRROR}	ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt \n \
+${GNUPG_MIRROR}	ftp://mirrors.dotsrc.org/gcrypt \n \
 ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
 ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
 ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
-ftp://ftp.gnutls.org/gcrypt/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/ \n \
+ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR} \n \
 http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/ \n \
 http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/ \n \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index acef30b..942b8b1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -583,6 +583,7 @@ GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://git.gnome.org"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
 GNU_MIRROR = "http://ftp.gnu.org/gnu"
+GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "http://kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
@@ -600,6 +601,7 @@ SRC_URI[vardepsexclude] += "\
     GNOME_GIT \
     GNOME_MIRROR \
     GNU_MIRROR \
+    GNUPG_MIRROR \
     GPE_MIRROR \
     KERNELORG_MIRROR \
     SAVANNAH_GNU_MIRROR \
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index b4ccbfe..6ccffd5 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 PR = "r9"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
+SRC_URI = "${GNUPG_MIRROR}/gnupg/gnupg-${PV}.tar.bz2 \
            file://long-long-thumb.patch \
            file://configure.patch \
            file://mips_gcc4.4.patch \
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.11.bb b/meta/recipes-support/gnupg/gnupg_2.1.11.bb
index 8e2189b..5d1372b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.11.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.11.bb
@@ -8,7 +8,8 @@ DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
 inherit autotools gettext texinfo pkgconfig
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://use-pkgconfig-instead-of-npth-config.patch \
            file://dirmngr-uses-libgpg-error.patch \
diff --git a/meta/recipes-support/gpgme/gpgme_1.6.0.bb b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
index 86eda23..a2d0587 100644
--- a/meta/recipes-support/gpgme/gpgme_1.6.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/gpgme.h.in;endline=23;md5=5027eec93a996272a9a0a6a86cf35775 \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/${BP}.tar.bz2 \
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://gpgme.pc \
            file://pkgconfig.patch \
           "
diff --git a/meta/recipes-support/libassuan/libassuan_2.4.2.bb b/meta/recipes-support/libassuan/libassuan_2.4.2.bb
index f376d63..92ec5c0 100644
--- a/meta/recipes-support/libassuan/libassuan_2.4.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.4.2.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 
 DEPENDS = "libgpg-error"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
 SRC_URI[md5sum] = "70151995c2330ae1261c0a7ca34cf478"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 5478253..a4f3cd0 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "libgpg-error libcap"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
index 0dd1602..e4190ce 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SECTION = "libs"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	   file://0001-libgpg-error-Add-nios2-support.patch \
 	  "
diff --git a/meta/recipes-support/libksba/libksba_1.3.3.bb b/meta/recipes-support/libksba/libksba_1.3.3.bb
index bc21164..9c901f6 100644
--- a/meta/recipes-support/libksba/libksba_1.3.3.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.3.bb
@@ -13,7 +13,8 @@ BINCONFIG = "${bindir}/ksba-config"
 
 inherit autotools binconfig-disabled pkgconfig texinfo
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
 SRC_URI[md5sum] = "a5dd3c57fca254935f5cf8db26e39065"
diff --git a/meta/recipes-support/npth/npth_1.2.bb b/meta/recipes-support/npth/npth_1.2.bb
index 1b3962e..66aa347 100644
--- a/meta/recipes-support/npth/npth_1.2.bb
+++ b/meta/recipes-support/npth/npth_1.2.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "\
     file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6\
     "
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/npth/npth-${PV}.tar.bz2 \
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
           "
 
diff --git a/meta/recipes-support/pinentry/pinentry_0.9.2.bb b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
index d6b7130..d315a99 100644
--- a/meta/recipes-support/pinentry/pinentry_0.9.2.bb
+++ b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
@@ -12,7 +12,8 @@ inherit autotools
 
 DEPENDS = "gettext-native"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "f51d454f921111b5156a2291cbf70278"
 SRC_URI[sha256sum] = "fd8bc1592ceb22bb492b07cb29b1b140bb882c859e6503b974254c0a4b4134d1"
-- 
2.1.4


