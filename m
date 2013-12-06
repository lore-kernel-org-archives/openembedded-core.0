Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7C06DD74
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 21:34:35 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 22:34:27 +0100
Message-Id: <1386365667-6394-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1386247884-23813-1-git-send-email-obi@opendreambox.org>
References: <1386247884-23813-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2] xorg-lib-common.inc: use REQUIRED_DISTRO_FEATURES variable
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
X-List-Received-Date: Fri, 06 Dec 2013 21:34:36 -0000

Convert custom DISTRO_FEATURES test to distro_features_check.bbclass,
and keep exceptions for libpciaccess and pixman.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 v2: rebased after update to pixman-0.32.4

 meta/recipes-graphics/xorg-lib/libpciaccess_0.13.2.bb | 2 ++
 meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb       | 2 ++
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
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
index d1f3df7..51cca5d 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
@@ -33,3 +33,5 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "cdb566504fe9daf6728c7b03cc7ea228"
 SRC_URI[sha256sum] = "ae2bd664057e330d41b40336ed296d3512318ce7f2401cc42601f2613d371e4c"
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


