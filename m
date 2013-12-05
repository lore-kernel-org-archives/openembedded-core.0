Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 754556DF29
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:51:29 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 13:51:24 +0100
Message-Id: <1386247884-23813-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] xorg-lib-common.inc: use REQUIRED_DISTRO_FEATURES variable
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
X-List-Received-Date: Thu, 05 Dec 2013 12:51:29 -0000

Convert custom DISTRO_FEATURES test to distro_features_check.bbclass,
and keep exceptions for libpciaccess and pixman.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb | 2 ++
 meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb       | 2 ++
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc    | 8 ++------
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
index 6da86f2..d837bbd 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb
@@ -10,3 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
 SRC_URI[md5sum] = "b7c0d3afce14eedca57312a3141ec13a"
 SRC_URI[sha256sum] = "abab8c2b050afb89bc29280e9c6b50ec5867174960d88bfb81a01036ec20de19"
+
+REQUIRED_DISTRO_FEATURES = ""
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
index 36d9b2d..55bddee 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
@@ -34,3 +34,5 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "2d0588e20dc1308b29b2fca68dad9a9c"
 SRC_URI[sha256sum] = "4fbb51788fe7cbd8abb5f80aed95ec878704e57a06328f7bebe0306e3822c96c"
+
+REQUIRED_DISTRO_FEATURES = ""
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 07b0373..231776a 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -11,7 +11,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools distro_features_check pkgconfig
 
 EXTRA_OECONF = "--disable-specs --without-groff --without-ps2pdf --without-fop --without-xmlto"
 EXTRA_OECONF_append_libc-glibc = " --disable-malloc0returnsnull"
@@ -20,8 +20,4 @@ EXTRA_OECONF_append_libc-uclibc = " --enable-malloc0returnsnull"
 UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0returnsnull \
                                 --disable-specs --without-groff --without-ps2pdf --without-fop --without-xmlto"
 
-python () {
-        whitelist = [ "pixman", "libpciaccess" ]
-        if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
-                raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
-}
+REQUIRED_DISTRO_FEATURES ?= "x11"
-- 
1.8.3.2


