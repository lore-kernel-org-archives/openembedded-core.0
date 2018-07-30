Return-Path: <joel.stan@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3574E78D8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 05:11:01 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id r1-v6so6566629pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 22:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+Mk+oa7mqoGvpFqafP5EJDefquRdS10oVOVoOCPdQp4=;
	b=ev8v7qXeWhNA5AqteYLnPYjp2z3i9bRLhMWUo9JSDa3oTeZfhbr74qZD2DhsooZlSd
	mR0MtwXSFtm6v4vYrJwXVr3BUYlKAz9UIPpjTZqdzrq4J3goFSyS+2x0X6cF/UqAeJ1t
	0dOBfa5n2Lg1MCXNTzcKP3rghEjdlIaVHA7BLdIeXdCs15Mx2H8TEcJOB5eeqfsStdme
	ppYUyxyn58tvhl+ZgZi9dQpJm2fJ8TGVNM15xoeLSe6LRnGg/zON8sF8pfAxjkPUmBor
	65q86KUDNDT1+xK6sszJPiUm7KRe3JYlo4y4mHK5Oeo/GE1whcnmD1ESK/rYXZYtnNBQ
	soNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=+Mk+oa7mqoGvpFqafP5EJDefquRdS10oVOVoOCPdQp4=;
	b=B6ZS2h/hS/0l88/X/S7/FH7XtSWA7jbDfaE1CAs59xd5CqkYx94b7fkEUFpy4e1c7y
	9X3splXSGnoDKyW4HH2qKtqRMIVLvUnwPHaEalbt+pabjzd99OD/ZI2Uxr6yCOsjryoH
	IrBE43TTW2XP0qEsT/zo0hx89s3go7nKuSGDUBY22CtJQMhvR02EdYiDO2SZlgOzPRaL
	Sp7itGZ0HEpXIQ+6rml7o41W+AEtuE3lprdbzU7NQPX/XJHISpELlSFB88rZBJ28wt/3
	RJsLJBRNBAaLPViNH6OBBo8bVuOPDesdLTAzePwKVj92nf0W/g+yhxS3H8Rz7uO2RMTD
	8MKw==
X-Gm-Message-State: AOUpUlEHH/Hs5ckvPN2peFDoYup55ijYXs6CEZUYcT14scwEu3xZs66v
	V+LVe/dUd94GfKC1xcxWZ2lFmoly
X-Google-Smtp-Source: AAOMgpc05zNyZ9Hx83m1bbzhbGga8SsIhZrmqhjL1nbBhyU9MN3qLPrJ4yiR7XEL92rCzbiDQjkqCA==
X-Received: by 2002:a63:5a5e:: with SMTP id
	k30-v6mr15323608pgm.123.1532927461979; 
	Sun, 29 Jul 2018 22:11:01 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	b12-v6sm14766569pfe.148.2018.07.29.22.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Jul 2018 22:11:01 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 30 Jul 2018 14:40:56 +0930
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 14:40:29 +0930
Message-Id: <20180730051029.5530-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730051029.5530-1-joel@jms.id.au>
References: <20180730051029.5530-1-joel@jms.id.au>
Subject: [PATCH v2 2/2] gcc-7.3: Backport fixes for std::pair high memory usage
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
X-List-Received-Date: Mon, 30 Jul 2018 05:11:01 -0000

C++ applications that contain a specfic use of std::pair with tempates
cause the build to require many gigabytes of RAM to build.

This is a fix that was applied to the upstream GCC 7 branch.

Change-Id: I213f96d1d6332e2dce5765482ff3413f1abd7ff8
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc         |  1 +
 ...-PR-c-80290-memory-hog-with-std-pair.patch | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
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
index 000000000000..1ad19dc0ea80
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
@@ -0,0 +1,57 @@
+From 8c014bceeca6a558519e86b16a8142accc41e94f Mon Sep 17 00:00:00 2001
+From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 28 Jun 2018 00:25:21 +0000
+Subject: [PATCH] 	PR c++/80290 - memory-hog with std::pair.
+
+	* pt.c (type_unification_real): Skip non-dependent conversion
+	check for a nested list argument.
+	(braced_init_depth): New.
+
+Upstream-Status: Backport
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


