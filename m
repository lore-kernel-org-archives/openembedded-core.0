Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.10637.1613059061540580430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 07:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Zsay51CJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id e9so2198031qvy.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 07:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zj+LZY03KstWcXOg2daq3dy28uOaXXlZAVYemrqv22A=;
        b=Zsay51CJYl2n7o8LJnmXgHk/AJC2dFeQbn+9GvuN4lr3Zf7GKf01lsHkPM4c0cF1Uk
         Si+vgGDu6mZrx0lkhUHlVoP4To7g1A3K4UAOGEn3rxLEtb1wtZFHO2P1pCY9R9sqd+AR
         0mSldHGAG4AMdUJRG7ewS15NP+tVXw5nLlTAo/aJ4zDpzZYQgOYgAtA6mqxg+qPH4RSM
         svwNmUgHq7bsrRkZa/qfoczhu/0X43LT8+5EQzw0TMEerDbXVOW2PohMCYKcEWwtuwen
         2sa4UtmeaIFiRCDBMexOz0CRdtgqaMpKRcBaU2BKzScIFNksOy9+zdsJrFf+uau36Y0c
         VVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zj+LZY03KstWcXOg2daq3dy28uOaXXlZAVYemrqv22A=;
        b=c2Okabf/ZPCyvlgfNueejYfiD/8BFK8pp2K0IEdGzYSqNaHga60YyxaIYAd3OU03pC
         MCOsnOJFrZDDbZtEEf/u1Tdvbvo5+j3vW11Tp8Be+YWTdjQjOpZDQK+p5WmCtT2dfLnY
         7umalZ/JSrmkXAMamUF0KWaNydp13QOnwlDSAoRTw35HMEleLYTTxAV1eLoixG5NCcwS
         zjNfWsmS+nKrOFg41rQ1KIRqgtjaA8vvZqkUW+V5xUqc7uAVaRwP72M6VgVh9m3nC1Am
         8IEaxbKxtZT4haOKsMI1YOY6kdSFmJhGCgaz5/krYsltQwmRHJutdQqJiZpoGgKIS38V
         m0Hg==
X-Gm-Message-State: AOAM532iEPIYUWOAjK+24KuI4eQE3Qep3D0WKcy13KcxRSNSprTcVhSB
	imo4Q13iMeZdo0/RvBdQxuA28RAbdOEc/yi4
X-Google-Smtp-Source: ABdhPJyCcV3INkF34Y51IIqioks5ekTdEtllE/Y49cplEH1Ga/B4M3W4QW8XHoKcu+OQOje0jtcxIA==
X-Received: by 2002:a0c:8304:: with SMTP id j4mr8230129qva.18.1613059060423;
        Thu, 11 Feb 2021 07:57:40 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:8994:9451:fd1:86a9])
        by smtp.gmail.com with ESMTPSA id j67sm4296678qke.85.2021.02.11.07.57.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 07:57:39 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] gcc-9.3.inc: Fix potential runtime crash
Date: Thu, 11 Feb 2021 10:57:39 -0500
Message-Id: <20210211155739.17067-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCCv9 tree vectorization code is faulty and can cause random crashes at
runtime (when using -O3).  Add the backported patch to address this
issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 116 ++++++++++++++++++
 2 files changed, 117 insertions(+)
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
index 000000000000..9020aa6c3a1e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
@@ -0,0 +1,116 @@
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

