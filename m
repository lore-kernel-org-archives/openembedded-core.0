Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD6BE77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8189.1733294998363110802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K+2jSIKv;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43494a20379so52833155e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294997; x=1733899797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSfRA9nCqka2sbVbKBhYhJCK0XMdRxLDKhqhMjcZPJM=;
        b=K+2jSIKvNpyw9vmMeCFaQp6IdDDouv/GnqYMKHk5RTsKTcOOXXjv2LOxB1kFFv5WFe
         915jPF3VLFd9Ac/Hig6F3mG7tJcOzEfLdhPp/cEPHBXpWeGeZoQcsVutCYG/qRMhmYlq
         lWLqWXVS124hqEypxgy0HJi3BQQIffUg0dGdk7uPLg8MqFNT4vGWzIoJ7AcEnfY8zI3H
         oh76xFjm07R5pO7AypM8jwGejMFog0Ve3n+vz/flq8R6yDuM4wws/E1/Xbe2M4o7DDs6
         n5MkEVKjqrbJ+6lqI1kc4mIaCmP4RRVFKiQGMscCtLdj4Kjh/MTklphBAC45qOqANoLj
         DALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294997; x=1733899797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSfRA9nCqka2sbVbKBhYhJCK0XMdRxLDKhqhMjcZPJM=;
        b=iuJVgF8q/8+0SMeTUXE29WDF1yQKZQtOy37atYkrECIaLtuAXjIc5hDArclhfg9X1S
         2crckUQtwsUAIbLDEkpcdTHGXFn3xI9wc8M7e7lHd3Dmu3M85R5jmXXdT1Ivjyd4eWo1
         +RdK6xywEMRgZSb7dinLttkTbAt+CXhJhcg6k/s9KDeo79TYA6uaHy0u/PCOXwhpbmhy
         PZrc8CQb6wnTWN+2fV7M5ZP1JA73seODIdi+Ob+mOT+MtE0SUcMgsTDhmRGOllU6Iflk
         TaGgoSLS+Gu3HkmPKllENkRlLVpPkw5+LZmROy7sAjj5qJj/QL+dA18B6n3MYWZgHoTR
         vrXw==
X-Gm-Message-State: AOJu0YwgkL4T1tqvNucXSEgAA6dTtanL495RbnD89ogNNGupoaLrq38O
	d+Suwcxs2gXqCnFEDnOBWVKvxdkboJAbsdpsP0I9yERMGP4dHo0IxJvY2Q==
X-Gm-Gg: ASbGncvzRw7t9QAyq3+gsO8rXOkXM73QAoTJENtk1z69EsGMVWTklQGm+zOR/qk4LH9
	wqe9ygEHWkPbu7JtMFz7JVAbvjPF5PpAxOlZdhtd/njIhBUfG4J+2T/HbjWYsBx8jVtfX+ptkE/
	7NpbxAsKwDs8ZMCQc51t2GP8Uyt0swGwX71uPuOy0a2b2ljvXTMOo2bCjDtx7oNqeKYVLKuHBny
	HsNzG1afwUfe0l/Qv2H5+sSntTyZAbnqmX3uheBlraajPLVYBjU9uTMlaDGK0b4Gr+Yn3zLwfYv
	QRaJhVqmwy8=
X-Google-Smtp-Source: AGHT+IG/19lNEZSbMBnHsD91/CTZ1Ir2ScH1+6I6wGdozcslihyps4Pi7XmLrHvxX9ptTtMoxvQxwA==
X-Received: by 2002:a5d:5985:0:b0:385:f8bd:6e80 with SMTP id ffacd0b85a97d-385fd54de4fmr4271035f8f.56.1733294996539;
        Tue, 03 Dec 2024 22:49:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/37] pixman: update 0.42.2 -> 0.44.0
Date: Wed,  4 Dec 2024 07:49:10 +0100
Message-Id: <20241204064920.817016-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208256

From: Alexander Kanavin <alex@linutronix.de>

Drop two backports.

Drop iwmmxt support from recipe and patch (upstream has removed it).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-workarounds-in-cpu-features-detecti.patch |  23 ++--
 ...loat.c-fix-inlining-failed-in-call-t.patch |  56 ----------
 ...6ce00bb79a6b925ed4c2c436e1533e4472aa.patch | 104 ------------------
 .../{pixman_0.42.2.bb => pixman_0.44.0.bb}    |   6 +-
 4 files changed, 8 insertions(+), 181 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.42.2.bb => pixman_0.44.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
index 4569dca01e2..35faafea5b4 100644
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
@@ -1,8 +1,7 @@
-From a0f53e1dbb3851bb0f0efcfdbd565b05e4be9cac Mon Sep 17 00:00:00 2001
+From 0beed8c190b27a07e7f1145a46a7ca8a75864263 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 23 Aug 2012 18:10:57 +0200
-Subject: [PATCH 1/2] ARM: qemu related workarounds in cpu features detection
- code
+Subject: [PATCH] ARM: qemu related workarounds in cpu features detection code
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -17,14 +16,14 @@ Upstream-Status: Inappropriate [other] qemu fix
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- pixman/pixman-arm.c |   82 ++++++++++++++++++++++++++++++++++++++++----------
- 1 files changed, 65 insertions(+), 17 deletions(-)
+ pixman/pixman-arm.c | 77 ++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 62 insertions(+), 15 deletions(-)
 
 diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
-index 23374e4..d98bda6 100644
+index d271e96..8f6e241 100644
 --- a/pixman/pixman-arm.c
 +++ b/pixman/pixman-arm.c
-@@ -129,16 +129,35 @@ detect_cpu_features (void)
+@@ -128,16 +128,34 @@ detect_cpu_features (void)
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/mman.h>
@@ -45,7 +44,6 @@ index 23374e4..d98bda6 100644
 + * endian 64-bit host system running qemu and may theoretically fail).
 + */
 +#define ARM_HWCAP_VFP 64
-+#define ARM_HWCAP_IWMMXT 512
 +#define ARM_HWCAP_NEON 4096
 +
  static arm_cpu_features_t
@@ -60,7 +58,7 @@ index 23374e4..d98bda6 100644
  
      fd = open ("/proc/self/auxv", O_RDONLY);
      if (fd >= 0)
-@@ -147,32 +166,61 @@ detect_cpu_features (void)
+@@ -146,30 +164,59 @@ detect_cpu_features (void)
  	{
  	    if (aux.a_type == AT_HWCAP)
  	    {
@@ -71,8 +69,6 @@ index 23374e4..d98bda6 100644
 -		 */
 -		if ((hwcap & 64) != 0)
 -		    features |= ARM_VFP;
--		if ((hwcap & 512) != 0)
--		    features |= ARM_IWMMXT;
 -		/* this flag is only present on kernel 2.6.29 */
 -		if ((hwcap & 4096) != 0)
 -		    features |= ARM_NEON;
@@ -130,8 +126,6 @@ index 23374e4..d98bda6 100644
 +     */
 +    if ((hwcap & ARM_HWCAP_VFP) != 0)
 +        features |= ARM_VFP;
-+    if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
-+        features |= ARM_IWMMXT;
 +    /* this flag is only present on kernel 2.6.29 */
 +    if ((hwcap & ARM_HWCAP_NEON) != 0)
 +        features |= ARM_NEON;
@@ -139,6 +133,3 @@ index 23374e4..d98bda6 100644
      return features;
  }
  
--- 
-1.7.6.5
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
deleted file mode 100644
index 5c79754e50f..00000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 16 Jul 2024 15:31:16 +0800
-Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call to
- always_inline
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Refer [1], always-inline is not suggested to be used if you have indirect
-calls. so replace force_inline with inline to fix error:
-In function ‘combine_inner’,
-    inlined from ‘combine_soft_light_ca_float’ at ../pixman/pixman-combine-float.c:655:511:
-../pixman/pixman-combine-float.c:655:211: error: inlining failed in call to ‘always_inline’ ‘combine_soft_light_c’: function not considered for inlining
-
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115679
-
-Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- pixman/pixman-combine-float.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float.c
-index f5145bc..f65eb5f 100644
---- a/pixman/pixman-combine-float.c
-+++ b/pixman/pixman-combine-float.c
-@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float da)
- }
- 
- #define MAKE_PD_COMBINERS(name, a, b)					\
--    static float force_inline						\
-+    static float inline						\
-     pd_combine_ ## name (float sa, float s, float da, float d)		\
-     {									\
- 	const float fa = get_factor (a, sa, da);			\
-@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,		ONE_MINUS_DA_OVER_SA,		ONE_MINUS_SA_OVER_DA)
-  */
- 
- #define MAKE_SEPARABLE_PDF_COMBINERS(name)				\
--    static force_inline float						\
-+    static inline float						\
-     combine_ ## name ## _a (float sa, float s, float da, float d)	\
-     {									\
- 	return da + sa - da * sa;					\
-     }									\
-     									\
--    static force_inline float						\
-+    static inline float						\
-     combine_ ## name ## _c (float sa, float s, float da, float d)	\
-     {									\
- 	float f = (1 - sa) * d + (1 - da) * s;				\
--- 
-2.25.1
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch b/meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch
deleted file mode 100644
index 927ca08cc21..00000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 865e6ce00bb79a6b925ed4c2c436e1533e4472aa Mon Sep 17 00:00:00 2001
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 12 Jul 2024 11:11:17 -0400
-Subject: [PATCH] pixman: Adjust arm assembly for binutils change
-
-A change in the latest version of binutils broke building pixman for arm.
-
-The binutils change:
-https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b
-
-Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/96
----
- pixman/pixman-arm-simd-asm.S | 44 ++++++++++++++++++------------------
- 1 file changed, 22 insertions(+), 22 deletions(-)
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Backport [865e6ce00bb79a6b925ed4c2c436e1533e4472aa]
-
-Index: pixman-0.42.2/pixman/pixman-arm-simd-asm.S
-===================================================================
---- pixman-0.42.2.orig/pixman/pixman-arm-simd-asm.S
-+++ pixman-0.42.2/pixman/pixman-arm-simd-asm.S
-@@ -818,13 +818,13 @@ generate_composite_function \
- .macro over_white_8888_8888_ca_1pixel_tail
-         mvn     TMP0, WK1
-         teq     WK1, WK1, asr #32
--        bne     01f
--        bcc     03f
-+        bne     1f
-+        bcc     3f
-         mov     WK3, WK1
--        b       02f
--01:     over_white_8888_8888_ca_combine WK1, WK3
--02:     pixst   , 4, 3, DST
--03:
-+        b       2f
-+1:      over_white_8888_8888_ca_combine WK1, WK3
-+2:      pixst   , 4, 3, DST
-+3:
- .endm
- 
- .macro over_white_8888_8888_ca_2pixels_head
-@@ -835,21 +835,21 @@ generate_composite_function \
-         pixld   , 8, 3, DST
-         mvn     TMP0, WK1
-         teq     WK1, WK1, asr #32
--        bne     01f
-+        bne     1f
-         movcs   WK3, WK1
--        bcs     02f
-+        bcs     2f
-         teq     WK2, #0
--        beq     05f
--        b       02f
--01:     over_white_8888_8888_ca_combine WK1, WK3
--02:     mvn     TMP0, WK2
-+        beq     5f
-+        b       2f
-+1:      over_white_8888_8888_ca_combine WK1, WK3
-+2:      mvn     TMP0, WK2
-         teq     WK2, WK2, asr #32
--        bne     03f
-+        bne     3f
-         movcs   WK4, WK2
--        b       04f
--03:     over_white_8888_8888_ca_combine WK2, WK4
--04:     pixst   , 8, 3, DST
--05:
-+        b       4f
-+3:      over_white_8888_8888_ca_combine WK2, WK4
-+4:      pixst   , 8, 3, DST
-+5:
- .endm
- 
- .macro over_white_8888_8888_ca_process_head  cond, numbytes, firstreg, unaligned_src, unaligned_mask, preload
-@@ -1065,9 +1065,9 @@ generate_composite_function \
-   .if offset != 0
-         ldrb    ORIG_W, [SRC, #offset]
-   .endif
--        beq     01f
-+        beq     1f
-         teq     STRIDE_M, #0xFF
--        beq     02f
-+        beq     2f
-  .endif
-         uxtb16  SCRATCH, d                 /* rb_dest */
-         uxtb16  d, d, ror #8               /* ag_dest */
-@@ -1077,13 +1077,13 @@ generate_composite_function \
-         uxtab16 d, d, d, ror #8
-         mov     SCRATCH, SCRATCH, ror #8
-         sel     d, SCRATCH, d
--        b       02f
-+        b       2f
-  .if offset == 0
- 48:     /* Last mov d,#0 of the set - used as part of shortcut for
-          * source values all 0 */
-  .endif
--01:     mov     d, #0
--02:
-+1:     mov     d, #0
-+2:
- .endm
- 
- .macro in_reverse_8888_8888_tail  numbytes, reg1, reg2, reg3, reg4
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.44.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.44.0.bb
index 4be72665f96..aeb1c392d3c 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.44.0.bb
@@ -9,10 +9,8 @@ DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-           file://0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch \
-           file://865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch \
            "
-SRC_URI[sha256sum] = "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3fe62626e38e234a625e"
+SRC_URI[sha256sum] = "89a4c1e1e45e0b23dffe708202cb2eaffde0fe3727d7692b2e1739fec78a7dac"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
@@ -32,8 +30,6 @@ EXTRA_OEMESON = "-Dgtk=disabled -Dlibpng=disabled"
 # ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
 # linking mips:loongson_2f module with previous mips:isa64 modules 
 EXTRA_OEMESON += "-Dloongson-mmi=disabled"
-# disable iwmmxt due to compile fails on most arm platforms.
-EXTRA_OEMESON += "-Diwmmxt=disabled"
 
 EXTRA_OEMESON:append:class-target:powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
 EXTRA_OEMESON:append:class-target:powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
-- 
2.39.5


