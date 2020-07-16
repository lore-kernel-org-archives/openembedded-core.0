Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.29.1594939002142451421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 15:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CoiOGiIF;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id u12so4857627lff.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 15:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sM1Fa6VvpZuU0gOeennO9WYYDM6oTrGOlUYNlb/e6Q=;
        b=CoiOGiIFXkH9SRTHnO32/qMZE0v+qKWFrjh8v0cf1E/sYCPocsNZYpFatJYBQQEGWt
         yS9ZjB0RDQwLNf5x/+sgT1JjEmMrMh50NG+ukV8paQbkpRo16AsvU0WWbdTfCv0VzYfd
         9Z47T4NX9sUtuMRlht92O4ye1MZfqgzjxA3fPpIWElKHkB34quOlzyZeuegZdhNkdRZe
         UdDFAGF/Gbgp7jYHrheRAXAamVZ1Ol3TjWRH82hXpgyp4frHCUsA3EdH0rQW6UBa29jP
         1Y9ISVSwTesml6TkXmQuT7IKSCPJH9jYbo0RVKi06yBKQTB3a7w5sSZ/nd0F/pSL12sw
         Sl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sM1Fa6VvpZuU0gOeennO9WYYDM6oTrGOlUYNlb/e6Q=;
        b=IJPmoNx4fA+M5lInBy3BXEeRdUc4upLHsJuj16tUy8HjPJzPSnqt1KguFn/f61wLGn
         CMobRq2MLc2r+rXNVovbLSnUVc7ZIfw5pI1JyFdpdLRSN5YixjYhPXW83iMrIqal3Cjs
         gkFp5BBlYsNUjTWjzrrrO0hEOi5GzOG9yZ/uQpevqJ6tgL1SkFBGQDwgIzrW5Bb7pcX8
         vv3V2AQlw0syNbDFs+SUijYZfg1H/iM2LQUh8NCHKntHxN+B4BPpqkXELVnk7ctvU1X9
         hysyqxL1PzQQQ1QVSWzQDfcJBE77ZMKYXJcMWYO+DZBkSozPAWNFW9QitmP4z6ydzyJD
         brRA==
X-Gm-Message-State: AOAM5319na08eaN7xtGkr1AGS3Db0SH5nFFoyRwtyNC5ZgeNzBxj/LaN
	1yG0Guj8NbSdVBA4Nb3pl6MV7hYKjWU=
X-Google-Smtp-Source: ABdhPJz0gUJ2rWf/LLKnIyRLzvCX8mzp3IQaKXAx2Eueezywin2B9DU0Krt4FVayIexOyfdbaKks3w==
X-Received: by 2002:a05:6512:6cc:: with SMTP id u12mr2973629lff.148.1594938999641;
        Thu, 16 Jul 2020 15:36:39 -0700 (PDT)
Return-Path: <dbaryshkov@gmail.com>
Received: from eriador.lan ([188.162.65.92])
        by smtp.gmail.com with ESMTPSA id o1sm1300297ljj.82.2020.07.16.15.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 15:36:37 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] gcc-10.1: add fix for PR 96130
Date: Fri, 17 Jul 2020 01:36:35 +0300
Message-Id: <20200716223635.3349898-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96130 causing ICE
(SegFault) when compiling current Mesa git tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-devtools/gcc/gcc-10.1.inc        |   1 +
 .../gcc/gcc-10.1/pr96130.patch                | 106 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
index a3de91a2c6a3..a2dd2ae252a5 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
@@ -66,6 +66,7 @@ SRC_URI = "\
            file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
            file://0037-mingw32-Enable-operation_not_supported.patch \
            file://0038-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://pr96130.patch \
 "
 SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
 
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch b/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
new file mode 100644
index 000000000000..f0e6f85e22f9
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-10.1/pr96130.patch
@@ -0,0 +1,106 @@
+From 0d03c0ee5213703ec6d9ffa632fa5298d83adaaa Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Mon, 13 Jul 2020 18:25:53 +0200
+Subject: [PATCH] ipa-fnsummary: Fix ICE with switch predicates [PR96130]
+
+The following testcase ICEs since r10-3199.
+There is a switch with default label, where the controlling expression has
+range just 0..7 and there are case labels for all those 8 values, but
+nothing has yet optimized away the default.
+Since r10-3199, set_switch_stmt_execution_predicate sets the switch to
+default label's edge's predicate to a false predicate and then
+compute_bb_predicates propagates the predicates through the cfg, but false
+predicates aren't really added.  The caller of compute_bb_predicates
+in one place handles NULL bb->aux as false predicate:
+      if (fbi.info)
+	{
+	  if (bb->aux)
+	    bb_predicate = *(predicate *) bb->aux;
+	  else
+	    bb_predicate = false;
+	}
+      else
+	bb_predicate = true;
+but then in two further spots that the patch below is changing
+it assumes bb->aux must be non-NULL.  Those two spots are guarded by a
+condition that is only true if fbi.info is non-NULL, so I think the right
+fix is to treat NULL aux as false predicate in those spots too.
+
+2020-07-13  Jakub Jelinek  <jakub@redhat.com>
+
+	PR ipa/96130
+	* ipa-fnsummary.c (analyze_function_body): Treat NULL bb->aux
+	as false predicate.
+
+	* gcc.dg/torture/pr96130.c: New test.
+
+(cherry picked from commit 776e48e0931db69f158f40e5cb8e15463d879a42)
+---
+ gcc/ipa-fnsummary.c                    | 10 ++++++++--
+ gcc/testsuite/gcc.dg/torture/pr96130.c | 26 ++++++++++++++++++++++++++
+ 2 files changed, 34 insertions(+), 2 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/torture/pr96130.c
+
+diff --git a/gcc/ipa-fnsummary.c b/gcc/ipa-fnsummary.c
+index 045a0ecf766..55a0b272a96 100644
+--- a/gcc/ipa-fnsummary.c
++++ b/gcc/ipa-fnsummary.c
+@@ -2766,7 +2766,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
+ 	  edge ex;
+ 	  unsigned int j;
+ 	  class tree_niter_desc niter_desc;
+-	  bb_predicate = *(predicate *) loop->header->aux;
++	  if (loop->header->aux)
++	    bb_predicate = *(predicate *) loop->header->aux;
++	  else
++	    bb_predicate = false;
+ 
+ 	  exits = get_loop_exit_edges (loop);
+ 	  FOR_EACH_VEC_ELT (exits, j, ex)
+@@ -2799,7 +2802,10 @@ analyze_function_body (struct cgraph_node *node, bool early)
+ 	  for (unsigned i = 0; i < loop->num_nodes; i++)
+ 	    {
+ 	      gimple_stmt_iterator gsi;
+-	      bb_predicate = *(predicate *) body[i]->aux;
++	      if (body[i]->aux)
++		bb_predicate = *(predicate *) body[i]->aux;
++	      else
++		bb_predicate = false;
+ 	      for (gsi = gsi_start_bb (body[i]); !gsi_end_p (gsi);
+ 		   gsi_next (&gsi))
+ 		{
+diff --git a/gcc/testsuite/gcc.dg/torture/pr96130.c b/gcc/testsuite/gcc.dg/torture/pr96130.c
+new file mode 100644
+index 00000000000..f722b9ad2a9
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/torture/pr96130.c
+@@ -0,0 +1,26 @@
++/* PR ipa/96130 */
++/* { dg-do compile } */
++
++struct S { unsigned j : 3; };
++int k, l, m;
++
++void
++foo (struct S x)
++{
++  while (l != 5)
++    switch (x.j)
++      {
++      case 1:
++      case 3:
++      case 4:
++      case 6:
++      case 2:
++      case 5:
++	l = m;
++      case 7:
++      case 0:
++	k = 0;
++      default:
++	break;
++      }
++}
+-- 
+2.18.4
+
-- 
2.27.0

