Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93B3871A54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 07:06:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3J76De2022806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 19 Apr 2017 00:06:15 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 19 Apr 2017 00:06:12 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 19 Apr 2017 15:03:57 +0800
Message-ID: <2489d6cd0d9212b4d970cdc9f7839c8448ca8ac7.1492583858.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1492583858.git.kai.kang@windriver.com>
References: <cover.1492583858.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] libsdl2: fix build failures on powerpc
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
X-List-Received-Date: Wed, 19 Apr 2017 07:06:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch from upstream to fix build failures on ppc and ppc64.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libsdl2/libsdl2/fix-build-failure-on-ppc.patch | 50 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch b/meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch
new file mode 100644
index 0000000..1520bcf
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Backport [https://hg.libsdl.org/SDL/rev/5184186d4366]
+
+Backport patch from upstream to fix build failures on ppc and ppc64.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1477159315 25200
+# Node ID 5184186d4366169617b434f5b71c618a7035cde4
+# Parent  71d4148e32de5088c4bc2f04c1e5ded647a2bf82
+Fixed bug 3466 - Can't build 2.0.5 on ppc64
+
+/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
+/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
+     const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
+     ^
+
+diff -r 71d4148e32de -r 5184186d4366 src/video/SDL_blit_N.c
+--- a/src/video/SDL_blit_N.c	Wed Oct 19 21:22:42 2016 -0700
++++ b/src/video/SDL_blit_N.c	Sat Oct 22 11:01:55 2016 -0700
+@@ -118,12 +118,6 @@
+         16, 8, 0, 24,
+         0, NULL
+     };
+-    if (!srcfmt) {
+-        srcfmt = &default_pixel_format;
+-    }
+-    if (!dstfmt) {
+-        dstfmt = &default_pixel_format;
+-    }
+     const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
+                                                        0x04, 0x04, 0x04, 0x04,
+                                                        0x08, 0x08, 0x08, 0x08,
+@@ -136,6 +130,14 @@
+     Uint32 gmask = RESHIFT(srcfmt->Gshift) << (dstfmt->Gshift);
+     Uint32 bmask = RESHIFT(srcfmt->Bshift) << (dstfmt->Bshift);
+     Uint32 amask;
++
++    if (!srcfmt) {
++        srcfmt = &default_pixel_format;
++    }
++    if (!dstfmt) {
++        dstfmt = &default_pixel_format;
++    }
++
+     /* Use zero for alpha if either surface doesn't have alpha */
+     if (dstfmt->Amask) {
+         amask =
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index d747cf1..12d3aaf 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://linkage.patch \
     file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch \
     file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
+    file://fix-build-failure-on-ppc.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.10.1


