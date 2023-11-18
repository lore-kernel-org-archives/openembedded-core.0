Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D955FC2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 17:18:14 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.12645.1700327891057301513
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Nov 2023 09:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id D0233520B1
	for <openembedded-core@lists.openembedded.org>; Sat, 18 Nov 2023 18:18:08 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.170.27]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r4OxL-2BhMMz0; Sat, 18 Nov 2023 18:18:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] ffmpeg: Upgrade 6.0 -> 6.1
Date: Sat, 18 Nov 2023 18:18:38 +0100
Message-ID: <20231118171838.42190-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700327887-E4E0893F-041F45CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 6dfbf8e0-8a10-4383-abc0-add2bbe2fe6a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Nov 2023 17:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190865

-Remove patches that made it upstream

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ops-clip-constants-used-with-shift-i.patch | 77 -------------------
 ...bswscale-riscv-Fix-syntax-of-vsetvli.patch | 35 ---------
 .../ffmpeg/{ffmpeg_6.0.bb =3D> ffmpeg_6.1.bb}   |  6 +-
 3 files changed, 2 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-x8=
6-mathops-clip-constants-used-with-shift-i.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libswscale=
-riscv-Fix-syntax-of-vsetvli.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.0.bb =3D> ffmpeg_6.1.bb}=
 (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-x86-matho=
ps-clip-constants-used-with-shift-i.patch b/meta/recipes-multimedia/ffmpe=
g/ffmpeg/0001-avcodec-x86-mathops-clip-constants-used-with-shift-i.patch
deleted file mode 100644
index a47a20365f..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-x86-mathops-clip=
-constants-used-with-shift-i.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From effadce6c756247ea8bae32dc13bb3e6f464f0eb Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?R=3DC3=3DA9mi=3D20Denis-Courmont?=3D <remi@remlab.net>
-Date: Sun, 16 Jul 2023 18:18:02 +0300
-Subject: [PATCH] avcodec/x86/mathops: clip constants used with shift
- instructions within inline assembly
-
-Fixes assembling with binutil as >=3D 2.41
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/comm=
it/effadce6c756247ea8bae32dc13bb3e6f464f0eb]
-Signed-off-by: James Almer <jamrial@gmail.com>
----
- libavcodec/x86/mathops.h | 26 +++++++++++++++++++++++---
- 1 file changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/libavcodec/x86/mathops.h b/libavcodec/x86/mathops.h
-index 6298f5ed19..ca7e2dffc1 100644
---- a/libavcodec/x86/mathops.h
-+++ b/libavcodec/x86/mathops.h
-@@ -35,12 +35,20 @@
- static av_always_inline av_const int MULL(int a, int b, unsigned shift)
- {
-     int rt, dummy;
-+    if (__builtin_constant_p(shift))
-     __asm__ (
-         "imull %3               \n\t"
-         "shrdl %4, %%edx, %%eax \n\t"
-         :"=3Da"(rt), "=3Dd"(dummy)
--        :"a"(a), "rm"(b), "ci"((uint8_t)shift)
-+        :"a"(a), "rm"(b), "i"(shift & 0x1F)
-     );
-+    else
-+        __asm__ (
-+            "imull %3               \n\t"
-+            "shrdl %4, %%edx, %%eax \n\t"
-+            :"=3Da"(rt), "=3Dd"(dummy)
-+            :"a"(a), "rm"(b), "c"((uint8_t)shift)
-+        );
-     return rt;
- }
-=20
-@@ -113,19 +121,31 @@ __asm__ volatile(\
- // avoid +32 for shift optimization (gcc should do that ...)
- #define NEG_SSR32 NEG_SSR32
- static inline  int32_t NEG_SSR32( int32_t a, int8_t s){
-+    if (__builtin_constant_p(s))
-     __asm__ ("sarl %1, %0\n\t"
-          : "+r" (a)
--         : "ic" ((uint8_t)(-s))
-+         : "i" (-s & 0x1F)
-     );
-+    else
-+        __asm__ ("sarl %1, %0\n\t"
-+               : "+r" (a)
-+               : "c" ((uint8_t)(-s))
-+        );
-     return a;
- }
-=20
- #define NEG_USR32 NEG_USR32
- static inline uint32_t NEG_USR32(uint32_t a, int8_t s){
-+    if (__builtin_constant_p(s))
-     __asm__ ("shrl %1, %0\n\t"
-          : "+r" (a)
--         : "ic" ((uint8_t)(-s))
-+         : "i" (-s & 0x1F)
-     );
-+    else
-+        __asm__ ("shrl %1, %0\n\t"
-+               : "+r" (a)
-+               : "c" ((uint8_t)(-s))
-+        );
-     return a;
- }
-=20
---=20
-2.41.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libswscale-riscv-=
Fix-syntax-of-vsetvli.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-=
libswscale-riscv-Fix-syntax-of-vsetvli.patch
deleted file mode 100644
index 94e0ba6d10..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libswscale-riscv-Fix-syn=
tax-of-vsetvli.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 85eefb65eb632d827e17a72518dd289dcd721084 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 2 Jul 2023 19:29:55 -0700
-Subject: [PATCH] libswscale/riscv: Fix syntax of vsetvli
-
-Add missing operand which clang complains about but gcc assumes it to be
-'m1' if not specifiied.
-
-Fixes building with clang
-| src/libswscale/riscv/rgb2rgb_rvv.S:88:25: error: operand must be e[8|1=
6|32|64|128|256|512|1024],m[1|2|4|8|f2|f4|f8],[ta|tu],[ma|mu]
-|         vsetvli t4, t3, e8, ta, ma
-|                         ^
-
-Upstream-Status: Submitted [https://ffmpeg.org/pipermail/ffmpeg-devel/20=
23-July/311514.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libswscale/riscv/rgb2rgb_rvv.S | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libswscale/riscv/rgb2rgb_rvv.S b/libswscale/riscv/rgb2rgb_r=
vv.S
-index 5626d90..bbdfdbe 100644
---- a/libswscale/riscv/rgb2rgb_rvv.S
-+++ b/libswscale/riscv/rgb2rgb_rvv.S
-@@ -85,7 +85,7 @@ func ff_interleave_bytes_rvv, zve32x
-         mv      t3, a3
-         addi    a4, a4, -1
- 2:
--        vsetvli    t4, t3, e8, ta, ma
-+        vsetvli    t4, t3, e8, m1, ta, ma
-         sub        t3, t3, t4
-         vle8.v     v8, (t0)
-         add        t0, t4, t0
---=20
-2.41.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_6.1.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb
index e65f80d64b..6b5731d052 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb
@@ -22,11 +22,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234e=
e4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18=
d1b79df004 \
                     file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02"
=20
-SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-avcodec-x86-mathops-clip-constants-used-with-shif=
t-i.patch \
-           file://0001-libswscale-riscv-Fix-syntax-of-vsetvli.patch"
+SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89=
c44e47e289137082"
+SRC_URI[sha256sum] =3D "488c76e57dd9b3bee901f71d5c95eaf1db4a5a31fe46a286=
54e837144207c270"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
--=20
2.42.0


