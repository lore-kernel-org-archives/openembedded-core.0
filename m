Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 587EA73232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 21:40:02 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b14so144314996wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 13:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gJ3MxGtB8pR5pxPnbzesUwHaptcgEuTT05qU0ubDdC0=;
	b=IH1kifwnDWYMfb0M4vjbHh+l3kvbN21Uqi5cNbOyxHZHRX6hwKTlToU92IrbWpety3
	QiSLSK5H3AaXZ9UlUunXQieDfDNJuWAi99IbZjXHSWGW4nADTVUs+wKsVRQVRfiTtKlp
	IRkX1TYWEcdiJi1QLoZE6RhWqNA8MtL4j7OwsVYoyeyV1tuJ07Emx7P+CCVFrr88Tyxv
	4ue5RXzoKSQzO5o9nSt042Ue++6L8114dQWe+r4EhAW+OHJe896qzx/AO475r5jZ1Xtn
	CIevWY+xvMX0h8AUZl1BB5YQE4T7rnKYJ9LQLmRWRvgW4BaE55TQkX9ser1l8LpG07dU
	EtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gJ3MxGtB8pR5pxPnbzesUwHaptcgEuTT05qU0ubDdC0=;
	b=GLlNG+KoP3bPg3Z5aAAeprHT/8+v/IhD3j86pgTzy2AdEYtHIde2S1rzNxQtHBgnpw
	WTPEAIbInraLteK2DGk/52s+r9Pp3BTr//fltj10xilmYNcc65//E44sXkTThHJ5Zph9
	aNwgJrg6u5Riz9mLAUeJubqSF36R8CpL93+LM0IGg/VNoCvmApHZM4hwZnzb1OlYjhOk
	xCn5ZNktScZgC1xCduNR5T+kG7JUzqwZhesexdSlg/BXRhE3ZFzDVi5Heh/P49PcmGz1
	U3jU9daLpARh69+npgUkA1yAOEss+OqPzp/V9rX5ngzC6ncQabk5TjE7zbOChV/PkFhh
	trmw==
X-Gm-Message-State: ALoCoQlMxPbu445rz9OggXrfhscbiqacgcuUrCnsiNq4suMQoYGhG0Rt9u7ROdTfFA51XPPYB3jAXF3J0cHnZBXzGmMrhLfK+w==
X-Received: by 10.28.111.194 with SMTP id c63mr19521863wmi.90.1452202802994;
	Thu, 07 Jan 2016 13:40:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u69sm15442575wmu.20.2016.01.07.13.40.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 13:40:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 21:39:58 +0000
Message-Id: <1452202798-31957-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] freetype: enable out-of-tree builds, and use host zlib
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
X-List-Received-Date: Thu, 07 Jan 2016 21:40:04 -0000

Add a few ${S} and ${B} to make out of tree builds work, and stop using
autotools-brokensep.  Annoyingly we still need to use a custom do_configure so
add a comment explaining why so someone else doesn't spend 30 minutes trying to
make it work.

Whilst here add a small patch so we don't need to tell the build where libtool
is, and remove class-native do_configure as it doesn't appear to be required
anymore.

At this point I started to get carried away.

The do_compile_prepend is redundant now that configure is being told what
compiler to use for build tools, so remove that.

Instead of using the integrated zlib fork, add a PACKAGECONFIG to use the zlib
we build and enable that by default.  Also add a disabled PACKAGECONFIG for
bzip2 support.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../freetype/freetype/use-right-libtool.patch      | 14 ++++++++++
 meta/recipes-graphics/freetype/freetype_2.6.bb     | 32 ++++++++--------------
 2 files changed, 26 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype/use-right-libtool.patch

diff --git a/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch b/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
new file mode 100644
index 0000000..c58d5b7
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
@@ -0,0 +1,14 @@
+Freetype think that it knows best about where libtool is, and explicitly the
+libtool autoconf macros telling it where to find the libtool script.  Of course
+we prefix the script with the target triplet, so it's wrong.  Fix this by
+removing the forced assignment, so the configure script's knowledge of where it
+put libtool is used.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- freetype-2.6/builds/unix/unix-cc.in.orig	2016-01-07 19:21:45.244943479 +0000
++++ freetype-2.6/builds/unix/unix-cc.in	2016-01-07 19:21:50.213112131 +0000
+@@ -19,1 +18,1 @@
+-LIBTOOL := $(FT_LIBTOOL_DIR)/libtool
++LIBTOOL := $(FT_LIBTOOL_DIR)/@LIBTOOL@
diff --git a/meta/recipes-graphics/freetype/freetype_2.6.bb b/meta/recipes-graphics/freetype/freetype_2.6.bb
index 70599c6..17ab1c8 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.bb
@@ -13,48 +13,40 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 
 SECTION = "libs"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
+           file://use-right-libtool.patch"
 SRC_URI[md5sum] = "5682890cb0267f6671dd3de6eabd3e69"
 SRC_URI[sha256sum] = "8469fb8124764f85029cc8247c31e132a2c5e51084ddce2a44ea32ee4ae8347e"
 
 BINCONFIG = "${bindir}/freetype-config"
 
-inherit autotools-brokensep pkgconfig binconfig-disabled multilib_header
+inherit autotools pkgconfig binconfig-disabled multilib_header
 
-LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
-EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
-EXTRA_OEMAKE_class-native = ""
-EXTRA_OECONF = "--without-zlib --without-bzip2 CC_BUILD='${BUILD_CC}'"
+EXTRA_OECONF = "CC_BUILD='${BUILD_CC}'"
 TARGET_CPPFLAGS += "-D_FILE_OFFSET_BITS=64"
 
-
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 PACKAGECONFIG[pixmap] = "--with-png,--without-png,libpng"
 # This results in a circular dependency so enabling is non-trivial
 PACKAGECONFIG[harfbuzz] = "--with-harfbuzz,--without-harfbuzz,harfbuzz"
 
 do_configure() {
-	cd builds/unix
+	# Need this because although the autotools infrastructure is in
+	# builds/unix the configure script get written to ${S}, so we can't
+	# just use AUTOTOOLS_SCRIPT_PATH.
+	cd ${S}/builds/unix
 	libtoolize --force --copy
 	aclocal -I .
 	gnu-configize --force
 	autoconf
-	cd ${S}
-	oe_runconf
-}
-
-do_configure_class-native() {
-	(cd builds/unix && gnu-configize) || die "failure running gnu-configize"
+	cd ${B}
 	oe_runconf
 }
 
-do_compile_prepend() {
-	${BUILD_CC} -o objs/apinames src/tools/apinames.c
-}
-
 do_install_append() {
 	oe_multilib_header freetype2/config/ftconfig.h
 }
 
 BBCLASSEXTEND = "native"
-
-- 
2.6.4


