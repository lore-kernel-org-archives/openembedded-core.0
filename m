Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 303716FFF7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 05:16:41 +0000 (UTC)
Received: by oige206 with SMTP id e206so62573082oig.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 21:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JoebA7a3/dffd2NfimhDWKod3/a0V/9KsyKPLsYAsno=;
	b=EdfKMobY2N1tVm/EvsX0oinUJvVimuX5rQ8VblZeNSvZmNd7GLYSd0dqho0tWOYRYn
	RkpWMTGEvNOuIRD+/lPXKguIpdw8g5sHWucd9poYM6iTW70Eee3fsaSSsmVhnftWjwft
	Fo+Hce6tdx27h1bx5vpAyAfQW1NE9+nF/pcrmFpyVawlBDGtffqYolAKiiqzvKCUo5GE
	wA7Axj2xT3JejkaTgXllZSHAAMUsWqbvDPdhbQSp6O61AxO7jOkOhbwrZUlVsDFboMO5
	NS3hqobeu4d03WAuOC1uUQG43RTlqSw/GxAt8r09jvl60bmszGuZYvEfYWhrlqCa6zKM
	5jow==
X-Received: by 10.202.85.211 with SMTP id j202mr10768886oib.55.1449206202265; 
	Thu, 03 Dec 2015 21:16:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j7sm5166424oeq.0.2015.12.03.21.16.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 21:16:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 21:16:35 -0800
Message-Id: <1449206195-22318-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libpng: update 1.6.19 -> 1.6.20 (CVE-2015-8126)
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
X-List-Received-Date: Fri, 04 Dec 2015 05:16:42 -0000

Version 1.6.20beta01 [November 20, 2015]
  Avoid potential pointer overflow/underflow in png_handle_sPLT() and
    png_handle_pCAL() (Bug report by John Regehr).

Version 1.6.20beta02 [November 23, 2015]
  Fixed incorrect implementation of png_set_PLTE() that uses png_ptr
    not info_ptr, that left png_set_PLTE() open to the CVE-2015-8126
    vulnerability.

Version 1.6.20beta03 [November 24, 2015]
  Backported tests from libpng-1.7.0beta69.

Version 1.6.20rc01 [November 26, 2015]
  Fixed an error in handling of bad zlib CMINFO field in pngfix, found by
    American Fuzzy Lop, reported by Brian Carpenter.  inflate() doesn't
    immediately fault a bad CMINFO field; instead a 'too far back' error
    happens later (at least some times).  pngfix failed to limit CMINFO to
    the allowed values but then assumed that window_bits was in range,
    triggering an assert. The bug is mostly harmless; the PNG file cannot
    be fixed.

Version 1.6.20rc02 [November 29, 2015]
  In libpng 1.6 zlib initialization was changed to use the window size
    in the zlib stream, not a fixed value. This causes some invalid images,
    where CINFO is too large, to display 'correctly' if the rest of the
    data is valid.  This provides a workaround for zlib versions where the
    error arises (ones that support the API change to use the window size
    in the stream).

Version 1.6.20 [December 3, 2015]
  No changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.19.bb | 27 -------------------------
 meta/recipes-multimedia/libpng/libpng_1.6.20.bb | 26 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.19.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.20.bb

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.19.bb b/meta/recipes-multimedia/libpng/libpng_1.6.19.bb
deleted file mode 100644
index 214f9d3..0000000
--- a/meta/recipes-multimedia/libpng/libpng_1.6.19.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "PNG image format decoding library"
-HOMEPAGE = "http://www.libpng.org/"
-SECTION = "libs"
-LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=586a8dac4d039e74af7b68ff2bc5fc41 \
-                    file://png.h;endline=17;md5=a38a64f8b5cf0ea4e2d4c2cb47150151 \
-                    file://png.h;beginline=19;endline=111;md5=d3e773acb87d7a35863203538167a776"
-DEPENDS = "zlib"
-LIBV = "16"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
-          "
-SRC_URI[md5sum] = "1e6a458429e850fc93c1f3b6dc00a48f"
-SRC_URI[sha256sum] = "311c5657f53516986c67713c946f616483e3cdb52b8b2ee26711be74e8ac35e8"
-
-BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
-
-inherit autotools binconfig-disabled pkgconfig
-
-# Work around missing symbols
-EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
-
-PACKAGES =+ "${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.20.bb b/meta/recipes-multimedia/libpng/libpng_1.6.20.bb
new file mode 100644
index 0000000..6c149d2
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.20.bb
@@ -0,0 +1,26 @@
+SUMMARY = "PNG image format decoding library"
+HOMEPAGE = "http://www.libpng.org/"
+SECTION = "libs"
+LICENSE = "Libpng"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55b60b5bb3ed92fbf9197e565a7fac02 \
+                    file://png.h;endline=112;md5=a6352a338642f0dbd2fc280ae060d3e9"
+DEPENDS = "zlib"
+LIBV = "16"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
+          "
+SRC_URI[md5sum] = "3968acb7c66ef81a9dab867f35d0eb4b"
+SRC_URI[sha256sum] = "55c5959e9f3484d96141a3226c53bc9da42a4845e70879d3e1d6e94833d1918b"
+
+BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
+
+inherit autotools binconfig-disabled pkgconfig
+
+# Work around missing symbols
+EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+
+PACKAGES =+ "${PN}-tools"
+
+FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


