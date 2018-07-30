Return-Path: <joel.stan@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE0378D62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:42:22 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id s17-v6so4932684plp.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 21:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f3jYohpcTJZzOS3NmPFD/BaVVkjhKlajPmMJ7791BXM=;
	b=f2F2Bts7SebqgXDE1V4bYkCfoGtemo/za8kMCe3vJo/i4MvX2THczNOMKiP/Fln9nu
	0gUMMGHt5qPIo28g8pISWOrp/zblMF4sVBz8OsZDRH6pzU6vU67u0lxbfWb4n/C+LZBs
	95Oh96rG3tUycMqhzqce6nbnBHx5pwo8CXtPhpMHbU0aFY1VQPdMGXxLMeeHxd7XrMbW
	HRnkhZzBFlef5nETKRfuuwCO7jM+X5of3O1gg8IL6mPo2g34222NMeKfTxlFKmbd/mGM
	XoRgvGDN1PPM1oPyEaNgjgPPvDmgde14ngi/50IdFFdXgCV99HYZtq+hk15liVpqEBxm
	fLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=f3jYohpcTJZzOS3NmPFD/BaVVkjhKlajPmMJ7791BXM=;
	b=IjqesuCsva+YEgUaATIEGzvSzz4DnSusaXcitMYM3aG3jFUKISQGNpo+26BZcTGgxU
	qnjclmRh9k3AehLIgT5bt5hkEApXoUMlg5+UDv4MjKdwFIWO5wY+ptFMAtGioUfTLkUQ
	AM3TNBjRp0q1VSLB/Tz6451mJtgwubHGg0zrruQSXP9S6u3JoyVXfN/OLfIzMg9o0FXx
	t6+FDDN9nYkdj6MgzGgmHfrn6EKC5Sx/0OCBSPyEMgwRkTIIZ/94dUvjfp1hcuQS7pkv
	Tylgi7Inq+nPOay/enX42uIZz2v2VABHMleWGdZStOUWS1s62lfIJVua0UYjYero5Or5
	AmFA==
X-Gm-Message-State: AOUpUlFFbFKmQ60cAcuvPcBqsmX5PY8C6YndUSCta/r2vBwdFow9+qNl
	zbN4QdIMW6EE6p8HEJr64WC9VYDB
X-Google-Smtp-Source: AAOMgpdkMZTt0QETS8xGAkGal6+1/dEE88i6ywuk5M+cAyz4s6yBADhLJ72Mbr5ntfm/fsZPLXE9EA==
X-Received: by 2002:a17:902:184:: with SMTP id
	b4-v6mr15232211plb.340.1532925743493; 
	Sun, 29 Jul 2018 21:42:23 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	q28-v6sm17502359pfg.144.2018.07.29.21.42.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Jul 2018 21:42:22 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 30 Jul 2018 14:12:17 +0930
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 14:12:00 +0930
Message-Id: <20180730044200.3164-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730044200.3164-1-joel@jms.id.au>
References: <20180730044200.3164-1-joel@jms.id.au>
Subject: [PATCH 2/2] gcc-7.3: Backport fixes for std::pair high memory usage
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
X-List-Received-Date: Mon, 30 Jul 2018 04:42:22 -0000

C++ applications that contain a specfic use of std::pair with tempates
cause the build to require many gigabytes of RAM to build.

This is a fix that was applied to the upstream GCC 7 branch.

Change-Id: I213f96d1d6332e2dce5765482ff3413f1abd7ff8
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc         |  1 +
 ...-PR-c-80290-memory-hog-with-std-pair.patch | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index 81320dc52a59..c7c88f12e499 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -80,6 +80,7 @@ BACKPORTS = "\
            file://0001-Fix-internal-compiler-error-in-testcase.patch \
            file://0001-PR-rtl-optimization-83030.patch \
            file://0001-Fix-ppc64le-build-Partial-backport-r256656.patch \
+           file://0001-PR-c-80290-memory-hog-with-std-pair.patch \
 "
 
 SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
new file mode 100644
index 000000000000..ba43af92fff1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
@@ -0,0 +1,58 @@
+From 8c014bceeca6a558519e86b16a8142accc41e94f Mon Sep 17 00:00:00 2001
+From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 28 Jun 2018 00:25:21 +0000
+Subject: [PATCH] 	PR c++/80290 - memory-hog with std::pair.
+
+	* pt.c (type_unification_real): Skip non-dependent conversion
+	check for a nested list argument.
+	(braced_init_depth): New.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@262204 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ gcc/cp/pt.c      | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/gcc/cp/pt.c b/gcc/cp/pt.c
+index 79cfd0129226..71077a3b0498 100644
+--- a/gcc/cp/pt.c
++++ b/gcc/cp/pt.c
+@@ -19242,6 +19242,24 @@ try_array_deduction (tree tparms, tree targs, tree parm)
+ 			  /*nondeduced*/false, array_deduction_r);
+ }
+ 
++/* Returns how many levels of { } INIT contains.  */
++
++static int
++braced_init_depth (tree init)
++{
++  if (!init || !BRACE_ENCLOSED_INITIALIZER_P (init))
++    return 0;
++  unsigned i; tree val;
++  unsigned max = 0;
++  FOR_EACH_CONSTRUCTOR_VALUE (CONSTRUCTOR_ELTS (init), i, val)
++    {
++      unsigned elt_d = braced_init_depth (val);
++      if (elt_d > max)
++	max = elt_d;
++    }
++  return max + 1;
++}
++
+ /* Most parms like fn_type_unification.
+ 
+    If SUBR is 1, we're being called recursively (to unify the
+@@ -19478,6 +19496,10 @@ type_unification_real (tree tparms,
+ 
+ 	    if (uses_template_parms (parm))
+ 	      continue;
++	    /* Workaround for c++/80290: avoid combinatorial explosion on
++	       deeply nested braced init-lists.  */
++	    if (braced_init_depth (arg) > 2)
++	      continue;
+ 	    if (check_non_deducible_conversion (parm, arg, strict, flags,
+ 						explain_p))
+ 	      return 1;
+-- 
+2.17.1
+
-- 
2.17.1


