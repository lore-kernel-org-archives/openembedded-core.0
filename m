Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.11187.1613061381554389690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Wus5927L;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id x14so5764283qkm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 08:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5P2SawUUDcGuF9GO0rhWspQ/w+IR5vReZ0yVbjN13UY=;
        b=Wus5927Lgl1oG98VFN+bNYLQRaB2jEGglL7HpImxfqT7/CUZjLgfDzkewE900jlSTU
         DbwuGyxUiSmUuoewwF4BCLMIHQlVoRAnKFQmAhniQ6PYRaikm/3vq/D7MSQMNJ0Q++Kx
         kA44inQezIL+i1UXfQjnXaT0WpclkJn1gP5neROk1IgbE51OZiKmqIs5A1u+3I++ijBV
         uUHBcLXi1/tq71Uz0Xq4mr+zE/yQ60iht4kVtHYDCYE9RQEd71tNkPvt0gyiozCg0h8a
         v8qon24kKuL4mJw+PWKSK+3P2qMSP4GWcHaufvP//DT3xlkEuXOHFfwRtOUEuTAZbUrX
         QrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5P2SawUUDcGuF9GO0rhWspQ/w+IR5vReZ0yVbjN13UY=;
        b=chhX6dvo0+X/DOvNdrfTDP5AJVoZECGopAGGcJ5jc1xHOnU8PvL0Ax79V7n86HmEwR
         CccIu+5fQlO+PRhwerH+ymxNYx8g7aCz0hec26s1js+YL1oocCc95GVlGovuV3DS2Trv
         Wuyxvl5AL41nbHh98mrS64+vZeZ3mm1Odb7ahjKFFVW45q3wk2w38slvVKnqHzS5X9dK
         zMLZt3yFEPrjNXD5ptR9dyoea3kDV96XvDL2q46hTM4VGEj6slflPBd1lxGs2PN9fMAS
         jiPbKu46Wg5e1KiTDoGBUJ1YAowaK/3TXpb+ta2xJDtAzbZrbnaThy6+wT/Hr2S885nO
         G0Bg==
X-Gm-Message-State: AOAM530xvfZUXwr+IqRcF+PzKPEQLaCnn4lfXsl3T5y/igcUFV8Qy2qI
	Pd4YsZ1ftM6o0KwsbL9wqnkM6DZVOkJhJKAC
X-Google-Smtp-Source: ABdhPJw7ZJWgIKV7MBkxURJBSnQBqF2RQpGYyWA2twgDNZ18tsZDe3abNwZQVbyMuF122DGsThmlaQ==
X-Received: by 2002:a37:7fc2:: with SMTP id a185mr9508691qkd.202.1613061380433;
        Thu, 11 Feb 2021 08:36:20 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:8994:9451:fd1:86a9])
        by smtp.gmail.com with ESMTPSA id 9sm4050839qtr.64.2021.02.11.08.36.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 08:36:19 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH dunfell v2] gcc-9.3.inc: Fix potential runtime crash
Date: Thu, 11 Feb 2021 11:36:18 -0500
Message-Id: <20210211163618.22227-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCCv9 tree vectorization code is faulty and can cause random crashes at
runtime (when using -O3).  Add the backported patch to address this
issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index 4c54ba250aba..1c8e3df51d91 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
            file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
            file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
+           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
new file mode 100644
index 000000000000..dc1039dcc8b1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
@@ -0,0 +1,119 @@
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=97b668f9a8c6ec565c278a60e7d1492a6932e409]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
+From: Matthias Klose <doko@ubuntu.com>
+Date: Tue, 6 Oct 2020 13:41:37 +0200
+Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
+ VMAT_CONTIGUOUS
+
+This avoids using VMAT_CONTIGUOUS with single-element interleaving
+when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
+continue to avoid load-lanes and gathers.
+
+2020-10-01  Richard Biener  <rguenther@suse.de>
+
+	PR tree-optimization/97236
+	* tree-vect-stmts.c (get_group_load_store_type): Keep
+	VMAT_ELEMENTWISE for single-element vectors.
+
+	* gcc.dg/vect/pr97236.c: New testcase.
+
+(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
+---
+ gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
+ gcc/tree-vect-stmts.c               | 20 ++++++--------
+ 2 files changed, 52 insertions(+), 11 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
+
+diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
+new file mode 100644
+index 000000000000..9d3dc20d953d
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
+@@ -0,0 +1,43 @@
++typedef unsigned char __uint8_t;
++typedef __uint8_t uint8_t;
++typedef struct plane_t {
++  uint8_t *p_pixels;
++  int i_lines;
++  int i_pitch;
++} plane_t;
++
++typedef struct {
++  plane_t p[5];
++} picture_t;
++
++#define N 4
++
++void __attribute__((noipa))
++picture_Clone(picture_t *picture, picture_t *res)
++{
++  for (int i = 0; i < N; i++) {
++    res->p[i].p_pixels = picture->p[i].p_pixels;
++    res->p[i].i_lines = picture->p[i].i_lines;
++    res->p[i].i_pitch = picture->p[i].i_pitch;
++  }
++}
++
++int
++main()
++{
++  picture_t aaa, bbb;
++  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
++
++  for (unsigned i = 0; i < N; i++)
++    aaa.p[i].p_pixels = pixels;
++
++  picture_Clone (&aaa, &bbb);
++
++  uint8_t c = 0;
++  for (unsigned i = 0; i < N; i++)
++    c += bbb.p[i].p_pixels[0];
++
++  if (c != N)
++    __builtin_abort ();
++  return 0;
++}
+diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
+index 507f81b0a0e8..ffbba3441de2 100644
+--- a/gcc/tree-vect-stmts.c
++++ b/gcc/tree-vect-stmts.c
+@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
+ 	  /* First cope with the degenerate case of a single-element
+ 	     vector.  */
+ 	  if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
+-	    *memory_access_type = VMAT_CONTIGUOUS;
++	    ;
+ 
+ 	  /* Otherwise try using LOAD/STORE_LANES.  */
+-	  if (*memory_access_type == VMAT_ELEMENTWISE
+-	      && (vls_type == VLS_LOAD
+-		  ? vect_load_lanes_supported (vectype, group_size, masked_p)
+-		  : vect_store_lanes_supported (vectype, group_size,
+-						masked_p)))
++	  else if (vls_type == VLS_LOAD
++		   ? vect_load_lanes_supported (vectype, group_size, masked_p)
++		   : vect_store_lanes_supported (vectype, group_size,
++						 masked_p))
+ 	    {
+ 	      *memory_access_type = VMAT_LOAD_STORE_LANES;
+ 	      overrun_p = would_overrun_p;
+ 	    }
+ 
+ 	  /* If that fails, try using permuting loads.  */
+-	  if (*memory_access_type == VMAT_ELEMENTWISE
+-	      && (vls_type == VLS_LOAD
+-		  ? vect_grouped_load_supported (vectype, single_element_p,
+-						 group_size)
+-		  : vect_grouped_store_supported (vectype, group_size)))
++	  else if (vls_type == VLS_LOAD
++		   ? vect_grouped_load_supported (vectype, single_element_p,
++						  group_size)
++		   : vect_grouped_store_supported (vectype, group_size))
+ 	    {
+ 	      *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
+ 	      overrun_p = would_overrun_p;
+-- 
+2.20.1
+
-- 
2.20.1

