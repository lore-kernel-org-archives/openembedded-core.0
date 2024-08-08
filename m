Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C174C52D71
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 17:20:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.65657.1723137631751706627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 10:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02D7BDA7
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Aug 2024 10:20:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C717E3F71E
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Aug 2024 10:20:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: fix build with binutils 2.43 on arm with commerical codecs
Date: Thu,  8 Aug 2024 18:16:08 +0100
Message-Id: <20240808171608.1312222-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 17:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203143

binutils 2.43 is stricter with label names, so rename a label to stop
assembler errors.

[ YOCTO #15570 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...lpdsp_armv5te-fix-label-format-to-wo.patch | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec=
-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-ml=
pdsp_armv5te-fix-label-format-to-wo.patch b/meta/recipes-multimedia/ffmpe=
g/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
new file mode 100644
index 00000000000..a5947af668e
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_ar=
mv5te-fix-label-format-to-wo.patch
@@ -0,0 +1,52 @@
+From 0b541aa54b9573d8eef7401a0cc58c422fe60a9a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 8 Aug 2024 18:04:17 +0100
+Subject: [PATCH] libavcodec/arm/mlpdsp_armv5te: fix label format to work=
 with
+ binutils 2.43
+
+binutils 2.43 has stricter validation for labels[1] and results in error=
s
+when building ffmpeg for armv5:
+
+src/libavcodec/arm/mlpdsp_armv5te.S:232: Error: junk at end of line, fir=
st unrecognized character is `0'
+
+Remove the leading zero in the "01" label to resolve this error.
+
+[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D2267=
49d5a6ff0d5c607d6428d6c81e1e7e7a994b
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libavcodec/arm/mlpdsp_armv5te.S | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/arm/mlpdsp_armv5te.S b/libavcodec/arm/mlpdsp_arm=
v5te.S
+index 4f9aa48..d315686 100644
+--- a/libavcodec/arm/mlpdsp_armv5te.S
++++ b/libavcodec/arm/mlpdsp_armv5te.S
+@@ -229,7 +229,7 @@ A .endif
+   .endif
+=20
+         // Begin loop
+-01:
++1:
+   .if TOTAL_TAPS =3D=3D 0
+         // Things simplify a lot in this case
+         // In fact this could be pipelined further if it's worth it...
+@@ -241,7 +241,7 @@ A .endif
+         str     ST0, [PST, #-4]!
+         str     ST0, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
+         str     ST0, [PSAMP], #4 * MAX_CHANNELS
+-        bne     01b
++        bne     1b
+   .else
+     .if \fir_taps & 1
+       .set LOAD_REG, 1
+@@ -333,7 +333,7 @@ T       orr     AC0, AC0, AC1
+         str     ST3, [PST, #-4]!
+         str     ST2, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
+         str     ST3, [PSAMP], #4 * MAX_CHANNELS
+-        bne     01b
++        bne     1b
+   .endif
+         b       99f
+=20
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index dea1f545804..fe34b87ccf5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -27,6 +27,7 @@ SRC_URI =3D " \
     file://av1_ordering_info.patch \
     file://vulkan_av1_stable_API.patch \
     file://vulkan_fix_gcc14.patch \
+    file://0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.pat=
ch \
 "
=20
 SRC_URI[sha256sum] =3D "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a=
1f4ac0873616f968"
--=20
2.34.1


