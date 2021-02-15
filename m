Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.31871.1613399924669154866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=npvPfynO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id c16so6250924otp.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+5IKI9UsEgoBVfheXH69I8ssZq74rxgaz127DV4EcxU=;
        b=npvPfynO02ThOt/X0kqBlGECCpoByeS5Hz9xuPGV2DjkeOJPmr4aUBQ9wLx3AEIS+r
         RhPuFq2MhODjlAcErYd52/4kLX6Hdj0k93aYVBIE+U3kvRhMsT99/enEkFoduUZmroGv
         t1N10ZGCpHS9zTCHOq4xpJDH2vLNCSo1mPMXV63ndHO+FI9Pi4nTP1IXx/mWZwSVzZeQ
         UuuMaWadpdllhs+98siQN55tKM7e76AZ9VAensbK5cuq7U4+POSGxGyPVcqZ/v9+KuyE
         SOctXnIRDP4xdmLxSnN1QHncYPlEXn4Dk8j9aChCBNzNYWL+A5tfxw7t3ngGlAfEogJ/
         WKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+5IKI9UsEgoBVfheXH69I8ssZq74rxgaz127DV4EcxU=;
        b=CzXt9U0WtKI6Afkm7RvkjhzitVQUp0IvgtT1ysOqKpEjl4Gwp9NvLVWMrGlw9XmwH1
         +aLdgsE8dS3ouPiZzqGy2GOo0SdPaifItbNN6IRuZF+sNRRic+JdcNF9SxLcr39JP3xH
         ziXnv62/BaSeKZNJNJr5L5P4uZBQ0i1SXfZtIXFMjRbs67UIp1C4XLPbp/K1CJKhsTwR
         QL8jr72mK+SLR2zqKsCKyHtp8Y0Xvg4tQDZOqB7plNSApqnIcWjl/jlABhjGW4Xo1rjM
         wZjoSwdGc9psb7O82iRuTgSq5nrjhyZVBCOQLm5F0A4So2MrMavLa4cgv99KH5oIZtjt
         vGSQ==
X-Gm-Message-State: AOAM532d9RD9jj0eyxIDlg1OeIItFaOibMlNLCmuZpFLVdZZMAoeTu5Q
	YKzo1+NRgJfXq6pY0WgJugnO+/8mraY/+cdq
X-Google-Smtp-Source: ABdhPJwepwNeQYDkzcdg2Q9usUf9h0vqITFMUPIp2RJdwGonnaKy/wG5vqZJk+C4Y4qxUZDX3Ztzdg==
X-Received: by 2002:a05:6830:4129:: with SMTP id w41mr11637290ott.332.1613399923593;
        Mon, 15 Feb 2021 06:38:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/17] gcc-9.3.inc: Fix potential runtime crash
Date: Mon, 15 Feb 2021 04:37:22 -1000
Message-Id: <7cb7c5a97d936e35a155faf5b81f8b8545a0c23a.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jdmason@kudzu.us>

GCCv9 tree vectorization code is faulty and can cause random crashes at
runtime (when using -O3).  Add the backported patch to address this
issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index 4c54ba250a..1c8e3df51d 100644
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
index 0000000000..dc1039dcc8
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
2.25.1

