Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AF2C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 13:27:37 +0000 (UTC)
Received: from out199-3.us.a.mail.aliyun.com (out199-3.us.a.mail.aliyun.com [47.90.199.3])
 by mx.groups.io with SMTP id smtpd.web10.38122.1669037251576637927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 05:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 47.90.199.3, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VVN3Gsk_1669037241;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VVN3Gsk_1669037241)
          by smtp.aliyun-inc.com;
          Mon, 21 Nov 2022 21:27:26 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [OE-core] [PATCH] flac: upgrade 1.4.0 -> 1.4.2
Date: Mon, 21 Nov 2022 21:25:16 +0800
Message-Id: <20221121132515.2028-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 13:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173652

From: Chen Pei <cp0613@linux.alibaba.com>

This small version release only has a few changes, but fixes several bugs.

FLAC 1.4.2 released 2022-10-22
Like the last release, this release only has a few changes. A problem with FLAC playback in GStreamer (and possibly other libFLAC users) was the reason for the short time since the last release.
Changes:
	Remove xmms plugin
	Remove all pure assembler, removing build dependency on nasm
	Made console output more uniform across different platforms and CPUs
	Improve ability to tune compile for a certain system (for example with -march=native) when combining with --disable-asm-optimizations: plain C functions can now be better optimized
	Default CFLAGS are now prepended instead of dropped when user CFLAGS are set
	-msse2 is no longer added by default (was only applicable to x86)
	Fix cross-compiling and out-of-tree building when pandoc and doxygen are not available
	Fix issue with Clang not compiling functions with intrinsics
	Fix detection of bswap intrinsics
	Improve search for libssp on MinGW
	Fix issue when the libFLAC user seeks in a file instead of libFLAC itself

FLAC 1.4.1 released 2022-09-22
This release fixes the release tarball (which was missing man pages and api documentation in FLAC 1.4.0) and some build problems that were found with FLAC 1.4.0.
Changes:
	CMake fixes
	Add checks that man pages and api docs end up in tarball
	Enable installation of prebuilt man pages and api docs
	Fix compiler warnings
	Fix format specifier
	Enable building on Universal Windows Platform
	Fix versioning from git

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../flac/{flac_1.4.0.bb => flac_1.4.2.bb}                | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.0.bb => flac_1.4.2.bb} (80%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.0.bb b/meta/recipes-multimedia/flac/flac_1.4.2.bb
similarity index 80%
rename from meta/recipes-multimedia/flac/flac_1.4.0.bb
rename to meta/recipes-multimedia/flac/flac_1.4.2.bb
index 360396380d..32383927a2 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.4.2.bb
@@ -9,29 +9,25 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/flac/main.c;beginline=1;endline=18;md5=893456854ce6bf14a1a7ea77266eebab \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=73c74192ce89ee6238d15a171e00c971 \
                     file://COPYING.Xiph;md5=3d6da238b5b57a0965d6730291119f65 \
-                    file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
+                    file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
-SRC_URI[sha256sum] = "af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506"
+SRC_URI[sha256sum] = "e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4"
 
 CVE_PRODUCT = "libflac flac"
 
 inherit autotools gettext
 
 EXTRA_OECONF = "--disable-oggtest \
-                --disable-xmms-plugin \
                 --without-libiconv-prefix \
                 ac_cv_prog_NASM="" \
                 "
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
-    ${@bb.utils.contains_any("TUNE_FEATURES", "core2 corei7", "sse", "", d)} \
     ogg \
 "
-PACKAGECONFIG[sse] = "--enable-sse,--disable-sse"
 PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
 PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
@@ -41,3 +37,4 @@ PACKAGES += "libflac libflac++"
 FILES:${PN} = "${bindir}/*"
 FILES:libflac = "${libdir}/libFLAC.so.*"
 FILES:libflac++ = "${libdir}/libFLAC++.so.*"
+
-- 
2.25.1


