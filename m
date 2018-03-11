Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id D0F6F788E2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:49 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id o1so551659wro.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6tBsBCDlXMsk903PXoExlffAU+1xElvdXBwHfHAkWXQ=;
	b=MeIzfMJlUtGsaLh2mLtfUbgMz7PDMcQ4cXRmNsSJo38FA01ivtyp6yxW/26kDZnqte
	9OFxXb2g3yE/ObVI4gyo16RjbfbnJvzbZB2HFHdSVHUVvMZ9o/yzMXQxtpLoTyqA5/2l
	JAal4slUBQpqDxgIJCDbhcIPk876fMD/DPAbYNotnJMCLtJt2Z7jMuWmfhhQpoBJFjQF
	NhttFIgrlM+V1pi/H7ujhavqFU+pqK31bA1/jJ9MqjnBMoqtzQhP8p6CnRatgG63BQvW
	YRFmjHcyJ2ZCgxM2MCJGMaQHx8uPVtHESif0bgl3NWz3nfag9aLuffqRL1izocn8LtpC
	TXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6tBsBCDlXMsk903PXoExlffAU+1xElvdXBwHfHAkWXQ=;
	b=P5+I7H8iGP4Lr3rIZlgWsuaa7Q3etfOzwrCLfwLY2EKhI2GFMM6NMmZrQK1aAy1FRY
	hSuUi09CLxvhMJeTSsXPwMHkK7KRCzf2ZeqCJ80jY40nDBfflg00WPnBsD6VkXSKhbIC
	+2Gl2+J6zgmQt50ePepKBcfffXiKrYWP5kSeqXEyWaQOL+/YCorsCix8uGF/6g6YFXeR
	+yeVBZfx/jOIKB7hVyDEcIuFHzs/f38ot1bbhOgtnoLroWNrJD5GiRGLI9mpXJcq0V8n
	z2Ud1L3wkTynMNU9e1AuY9iokayaNad8yf9LuDEuK4sAEdOz4JO8E0PgKZ3y5yppjIz0
	Gp6Q==
X-Gm-Message-State: AElRT7HR0zSri2pjp+KhBdC60MUdOb0uE0YPneBEOGAhtkd0WfD0/QiV
	Xry3G+05JGZgVo0n6pRoSiF65w==
X-Google-Smtp-Source: AG47ELsG5+eQzLSpMoyP+OQR1IrSxFcJcC3wZFOZ7naEbMUSqjlc8u2LC9p2ZjQCzaUl0+ngnRjqvg==
X-Received: by 10.223.134.121 with SMTP id 54mr2509696wrw.59.1520728970619;
	Sat, 10 Mar 2018 16:42:50 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id u62sm165239wma.15.2018.03.10.16.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:26 +0000
Message-Id: <588382b586eb27ba4825d3bdc0d0a807e956cf24.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 14/16] gcc6: Fix unaligned STRD issue on ARM
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:50 -0000

From: Khem Raj <raj.khem@gmail.com>

Backport
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445

Fixes [YOCTO 12297]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 568227133be3f9f015679df3525f6c4f86304fd0)
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |   1 +
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 +++++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index 314994bed1..9ddd56f778 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -86,6 +86,7 @@ SRC_URI = "\
 "
 BACKPORTS = "\
            file://CVE-2016-6131.patch \
+           file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
 "
 SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
 SRC_URI[sha256sum] = "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69855334d2c914d4"
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch b/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
new file mode 100644
index 0000000000..0214ab83d9
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
@@ -0,0 +1,194 @@
+From ad5bf450aef2ffee6d57ed193fabc5f72f8eaa65 Mon Sep 17 00:00:00 2001
+From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 19 Oct 2017 13:16:42 +0000
+Subject: [PATCH] [ARM] PR 82445 - suppress 32-bit aligned ldrd/strd peepholing
+ with -mno-unaligned-access
+
+Peephole patterns exist in the arm backend to spot load/store
+operations to adjacent memory operations in order to convert them into
+ldrd/strd instructions.  However, when we have strict alignment
+enforced, then we can only do this if the accesses are known to be
+64-bit aligned; this is unlikely to be the case for most loads.  The
+patch adds some alignment checking to the code that validates the
+addresses for use in the peephole patterns.  This should also fix
+incorrect generation of ldrd/strd with unaligned accesses that could
+previously have occurred on ARMv5e where all such operations must be
+64-bit aligned.
+
+I've added some new tests as well.  In doing so I discovered that the
+ldrd/strd peephole tests could never fail since they would match the
+source file name in the scanned assembly as well as any instructions
+of the intended type.  I've fixed those by tightening the scan results
+slightly.
+
+gcc:
+
+* config/arm/arm.c (align_ok_ldrd_strd): New function.
+(mem_ok_for_ldrd_strd): New parameter align.  Extract the alignment of the
+mem into it.
+(gen_operands_ldrd_strd): Validate the alignment of the accesses.
+
+testsuite:
+
+* gcc.target/arm/peep-ldrd-1.c: Tighten test scan pattern.
+* gcc.target/arm/peep-strd-1.c: Likewise.
+* gcc.target/arm/peep-ldrd-2.c: New test.
+* gcc.target/arm/peep-strd-2.c: New test.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@253892 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/ChangeLog                                      |  8 +++++++
+ gcc/config/arm/arm.c                               | 27 ++++++++++++++++++----
+ gcc/testsuite/ChangeLog                            |  8 +++++++
+ gcc/testsuite/gcc.target/arm/peep-ldrd-1.c         |  2 +-
+ .../arm/{peep-ldrd-1.c => peep-ldrd-2.c}           |  4 ++--
+ gcc/testsuite/gcc.target/arm/peep-strd-1.c         |  2 +-
+ .../arm/{peep-strd-1.c => peep-strd-2.c}           |  4 ++--
+ 7 files changed, 44 insertions(+), 11 deletions(-)
+ copy gcc/testsuite/gcc.target/arm/{peep-ldrd-1.c => peep-ldrd-2.c} (63%)
+ copy gcc/testsuite/gcc.target/arm/{peep-strd-1.c => peep-strd-2.c} (58%)
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index 9c0813d598d..e3da9f77fb6 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -15926,12 +15926,23 @@ operands_ok_ldrd_strd (rtx rt, rtx rt2, rtx rn, HOST_WIDE_INT offset,
+   return true;
+ }
+ 
++/* Return true if a 64-bit access with alignment ALIGN and with a
++   constant offset OFFSET from the base pointer is permitted on this
++   architecture.  */
++static bool
++align_ok_ldrd_strd (HOST_WIDE_INT align, HOST_WIDE_INT offset)
++{
++  return (unaligned_access
++	  ? (align >= BITS_PER_WORD && (offset & 3) == 0)
++	  : (align >= 2 * BITS_PER_WORD && (offset & 7) == 0));
++}
++
+ /* Helper for gen_operands_ldrd_strd.  Returns true iff the memory
+    operand MEM's address contains an immediate offset from the base
+-   register and has no side effects, in which case it sets BASE and
+-   OFFSET accordingly.  */
++   register and has no side effects, in which case it sets BASE,
++   OFFSET and ALIGN accordingly.  */
+ static bool
+-mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
++mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset, HOST_WIDE_INT *align)
+ {
+   rtx addr;
+ 
+@@ -15950,6 +15961,7 @@ mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
+   gcc_assert (MEM_P (mem));
+ 
+   *offset = const0_rtx;
++  *align = MEM_ALIGN (mem);
+ 
+   addr = XEXP (mem, 0);
+ 
+@@ -15990,7 +16002,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+                         bool const_store, bool commute)
+ {
+   int nops = 2;
+-  HOST_WIDE_INT offsets[2], offset;
++  HOST_WIDE_INT offsets[2], offset, align[2];
+   rtx base = NULL_RTX;
+   rtx cur_base, cur_offset, tmp;
+   int i, gap;
+@@ -16002,7 +16014,8 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+      registers, and the corresponding memory offsets.  */
+   for (i = 0; i < nops; i++)
+     {
+-      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset))
++      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset,
++				 &align[i]))
+         return false;
+ 
+       if (i == 0)
+@@ -16114,6 +16127,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+       /* Swap the instructions such that lower memory is accessed first.  */
+       std::swap (operands[0], operands[1]);
+       std::swap (operands[2], operands[3]);
++      std::swap (align[0], align[1]);
+       if (const_store)
+         std::swap (operands[4], operands[5]);
+     }
+@@ -16127,6 +16141,9 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
+   if (gap != 4)
+     return false;
+ 
++  if (!align_ok_ldrd_strd (align[0], offset))
++    return false;
++
+   /* Make sure we generate legal instructions.  */
+   if (operands_ok_ldrd_strd (operands[0], operands[1], base, offset,
+                              false, load))
+diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+index eb2b86ee7b6..d49eff6b87e 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
+   *p = a;
+   return a;
+ }
+-/* { dg-final { scan-assembler "ldrd" } } */
++/* { dg-final { scan-assembler "ldrd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+similarity index 63%
+copy from gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
+copy to gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+index eb2b86ee7b6..6822c2b1454 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target arm_prefer_ldrd_strd } */
+-/* { dg-options "-O2" }  */
++/* { dg-options "-O2 -mno-unaligned-access" }  */
+ int foo(int a, int b, int* p, int *q)
+ {
+   a = p[2] + p[3];
+@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
+   *p = a;
+   return a;
+ }
+-/* { dg-final { scan-assembler "ldrd" } } */
++/* { dg-final { scan-assembler-not "ldrd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
+index bd330769599..fe1beac7229 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
+@@ -6,4 +6,4 @@ void foo(int a, int b, int* p)
+   p[2] = a;
+   p[3] = b;
+ }
+-/* { dg-final { scan-assembler "strd" } } */
++/* { dg-final { scan-assembler "strd\\t" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
+similarity index 58%
+copy from gcc/testsuite/gcc.target/arm/peep-strd-1.c
+copy to gcc/testsuite/gcc.target/arm/peep-strd-2.c
+index bd330769599..bfc5ebe9eec 100644
+--- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
++++ b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
+@@ -1,9 +1,9 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target arm_prefer_ldrd_strd } */
+-/* { dg-options "-O2" }  */
++/* { dg-options "-O2 -mno-unaligned-access" }  */
+ void foo(int a, int b, int* p)
+ {
+   p[2] = a;
+   p[3] = b;
+ }
+-/* { dg-final { scan-assembler "strd" } } */
++/* { dg-final { scan-assembler-not "strd\\t" } } */
+-- 
+2.15.0
+
-- 
2.15.1


