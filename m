Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id F0D7660290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 01:17:27 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i6so6323331pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 18:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5nnkVi+Sb+iauFVERX9XfQJv0BuRqEEllhqSYe0nRu4=;
	b=oulsaBcJmGRQWpH+iP6e+ug/xT7EIDip9zfZBm2/fAvHpr3KqwjAhH3D5udWslfp0D
	0TaFmvOVQH5jqElqgHPUIem2+gU8i6W9SVYuIgsVjItUgrnTwXJgjkUVAcDZgwvS3Axz
	SQtLuPmg+Q7YZbb7ZpzzEaLiGdcGxOnmA5zvEkLt6xZss5Ya1URaAWzeqjvpUF8OLlx9
	dI67QTjRtDxpEieeOU4PbHC1uOPqPzdY0hs0WuqGbYA5P6+IxMNCdfGmNj6Ehu2mi3UI
	PM+q3m2hdPuABguU3zPq/O6Ec8/4ert8nLQXGg9NfcBtERS2kMfHIaLK+WSz7Hm6vl2P
	Glxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5nnkVi+Sb+iauFVERX9XfQJv0BuRqEEllhqSYe0nRu4=;
	b=hWSniZGMlgXki9kmVMf50oB5M3mKQs5/XhAC4z0PjQj1X77l1xL2PoHMVOdgPv5W+I
	01GNPZSpvjzWUK2IpAPt0G2+BsW5fSDy8NdMYzjS/lhRNDSKsarmRUm9bVfZIdSsZPos
	id0xyl9eY9tXsff5PvL2jZwofGjA1rjNQDPx2ttpVHF8106+UnlYcddUGo25gr7Y4Uqs
	bgFt3ZQibTs9o5nNeuS0e7B3WyAhUUmFiBh+RJHn31ejjN7jSHfn+G5YeVdx0JuHQyWa
	u518b3ycDYAAGA9AQm32j8tRcbIp/SzGu6yZ6VZRymiTJJH1ApzwVjDgalShTeSOjM7c
	UGWw==
X-Gm-Message-State: AEkooutjmwGXkONCCUg53XCpJhv4l2BYEnzSljAz1TrAIYLGyb5D+iWDxRi+Z4HfWCQH+A==
X-Received: by 10.98.30.133 with SMTP id e127mr1902686pfe.104.1469150248372;
	Thu, 21 Jul 2016 18:17:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s89sm15027342pfi.83.2016.07.21.18.17.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jul 2016 18:17:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 18:17:20 -0700
Message-Id: <20160722011720.5975-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] gcc: Don't use vectorized builtins when Neon is not there
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
X-List-Received-Date: Fri, 22 Jul 2016 01:17:28 -0000

Fixes [YOCTO #9991]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.1.inc              |  1 +
 ...et-71056-Don-t-use-vectorized-builtins-wh.patch | 92 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.1.inc b/meta/recipes-devtools/gcc/gcc-6.1.inc
index 0426028..f52842d 100644
--- a/meta/recipes-devtools/gcc/gcc-6.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.1.inc
@@ -79,6 +79,7 @@ SRC_URI = "\
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch \
            ${BACKPORTS} \
            file://CVE-2016-4490.patch \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch b/meta/recipes-devtools/gcc/gcc-6.1/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
new file mode 100644
index 0000000..9c39c7f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
@@ -0,0 +1,92 @@
+From 84d2a5509892b65ed60d39e6e2f9719e3762e40e Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 31 May 2016 08:29:39 +0000
+Subject: [PATCH] [ARM] PR target/71056: Don't use vectorized builtins when
+ NEON is not available
+
+	PR target/71056
+	* config/arm/arm-builtins.c (arm_builtin_vectorized_function): Return
+	NULL_TREE early if NEON is not available.  Remove now redundant check
+	in ARM_CHECK_BUILTIN_MODE.
+
+	* gcc.target/arm/pr71056.c: New test.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@236910 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gcc/ChangeLog                          |  7 +++++++
+ gcc/config/arm/arm-builtins.c          |  6 +++++-
+ gcc/testsuite/ChangeLog                |  5 +++++
+ gcc/testsuite/gcc.target/arm/pr71056.c | 32 ++++++++++++++++++++++++++++++++
+ 4 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr71056.c
+
+diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
+index 90fb40f..68b2839 100644
+--- a/gcc/config/arm/arm-builtins.c
++++ b/gcc/config/arm/arm-builtins.c
+@@ -2861,6 +2861,10 @@ arm_builtin_vectorized_function (unsigned int fn, tree type_out, tree type_in)
+   int in_n, out_n;
+   bool out_unsigned_p = TYPE_UNSIGNED (type_out);
+ 
++  /* Can't provide any vectorized builtins when we can't use NEON.  */
++  if (!TARGET_NEON)
++    return NULL_TREE;
++
+   if (TREE_CODE (type_out) != VECTOR_TYPE
+       || TREE_CODE (type_in) != VECTOR_TYPE)
+     return NULL_TREE;
+@@ -2875,7 +2879,7 @@ arm_builtin_vectorized_function (unsigned int fn, tree type_out, tree type_in)
+    NULL_TREE is returned if no such builtin is available.  */
+ #undef ARM_CHECK_BUILTIN_MODE
+ #define ARM_CHECK_BUILTIN_MODE(C)    \
+-  (TARGET_NEON && TARGET_FPU_ARMV8   \
++  (TARGET_FPU_ARMV8   \
+    && flag_unsafe_math_optimizations \
+    && ARM_CHECK_BUILTIN_MODE_1 (C))
+ 
+diff --git a/gcc/testsuite/gcc.target/arm/pr71056.c b/gcc/testsuite/gcc.target/arm/pr71056.c
+new file mode 100644
+index 0000000..136754e
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/pr71056.c
+@@ -0,0 +1,32 @@
++/* PR target/71056.  */
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_vfp3_ok } */
++/* { dg-options "-O3 -mfpu=vfpv3" } */
++
++/* Check that compiling for a non-NEON target doesn't try to introduce
++   a NEON vectorized builtin.  */
++
++extern char *buff;
++int f2 ();
++struct T1
++{
++  int reserved[2];
++  unsigned int ip;
++  unsigned short cs;
++  unsigned short rsrv2;
++};
++void
++f3 (const char *p)
++{
++  struct T1 x;
++  __builtin_memcpy (&x, p, sizeof (struct T1));
++  x.reserved[0] = __builtin_bswap32 (x.reserved[0]);
++  x.reserved[1] = __builtin_bswap32 (x.reserved[1]);
++  x.ip = __builtin_bswap32 (x.ip);
++  x.cs = x.cs << 8 | x.cs >> 8;
++  x.rsrv2 = x.rsrv2 << 8 | x.rsrv2 >> 8;
++  if (f2 ())
++    {
++      __builtin_memcpy (buff, "\n", 1);
++    }
++}
+-- 
+2.9.0
+
-- 
2.9.0


