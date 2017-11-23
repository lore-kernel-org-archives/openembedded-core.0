Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F031786C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 03:52:21 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 207so13466629pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 19:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FokPHrua+8bSExoibDnt1g5Ea7pDGM/k8kAR+W/uI70=;
	b=BPmh9hGTZhALTOM5LpyXwuy8mR8Akjs/JL6gxkShAGrBz3q3heZpo5VVfermHDPtgf
	B/K0cG49ExigcjCe4GMbw3405lZ8mkDL0r5wF6ONBlA9vnWUFYcWVsCRAPEhg/4I9LWB
	eJHqpl4sjqPdr/nRTqxPUGadIaPbnXK9MH/I8WK8ALdth4RV0S+6jNSKtg5pQAxGz7DP
	daM2dY+cUl5arl/VH4ADzM39fV54zK7wlDJc21Z6ImHBZh7YydpCVoB1qyb26zqp25FB
	vE5hYTSbFzsiwKg+4hl71xdXn4UOwOXy+L6kXmle/KGpiuqZjrrWGQVp69sd/Icqht/0
	iizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FokPHrua+8bSExoibDnt1g5Ea7pDGM/k8kAR+W/uI70=;
	b=pmPnQtKUb2/p7Nm+imyIb+bbaoJBbYt1PyBnDRo9+pTEfFggqHgV1oQlJGceCCwm3Z
	3byekHC88daZk2RMW58RpMVNz4EF3PmYd9pBZMXjBoM1Wo7ngbSAw+Q/L1/+rHKdWPXw
	0wPoEJAF2XqWT5LNe6uMXXORJOuqwEmFleyCAP3O/CLFx8NlahjYLqGDNYZ0/gF08iu8
	i1rLBrQVmrkdbwnigUMm2+7M8ycsstzdjgyHkifOdil4hitkylpKbDJ2CtWrkKUQSv1Q
	9FwpmZ4ArycLkDxWLngAk/QkK76RI8c5U6fl4SjGy9msuh9noHdNl2vOrO19o0PeY5Y0
	4t1A==
X-Gm-Message-State: AJaThX69DLXjyMzABLRf9zBoOWK4r77EJykvYEwL8HXyssuUlB6nh4UX
	XFQmtrV4kUODL1UbbfayB30=
X-Google-Smtp-Source: AGs4zMaMrTGaj6D/0JVT/LeTM0H8854PgBGDujbDqzQ0aRiP33sHGfldIj+nisX3nv5jGS/n9osF4A==
X-Received: by 10.98.155.129 with SMTP id e1mr21832744pfk.119.1511409142603;
	Wed, 22 Nov 2017 19:52:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	n2sm25625481pgv.69.2017.11.22.19.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 19:52:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 19:52:17 -0800
Message-Id: <1511409137-30823-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
References: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/3] glibc: Security fix for CVE-2017-15804
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
X-List-Received-Date: Thu, 23 Nov 2017 03:52:21 -0000

From: Armin Kuster <akuster@mvista.com>

The glob function in glob.c in the GNU C Library (aka glibc or libc6) before 2.27 contains a buffer overflow during unescaping of user names with the ~ operator.

Affects: glibx < 2.27

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-15804.patch | 111 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15804.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-15804.patch b/meta/recipes-core/glibc/glibc/CVE-2017-15804.patch
new file mode 100644
index 0000000..b0dada3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-15804.patch
@@ -0,0 +1,111 @@
+From 2fac6a6cd50c22ac28c97d0864306594807ade3e Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 2 Nov 2017 11:06:45 +0100
+Subject: [PATCH] posix/tst-glob-tilde.c: Add test for bug 22332
+
+Upstream-Status: Backport
+CVE: CVE-2017-15804
+Affects: glibx < 2.27
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog              |  7 +++++++
+ posix/tst-glob-tilde.c | 53 ++++++++++++++++++++++++++++----------------------
+ 2 files changed, 37 insertions(+), 23 deletions(-)
+
+Index: git/posix/tst-glob-tilde.c
+===================================================================
+--- git.orig/posix/tst-glob-tilde.c
++++ git/posix/tst-glob-tilde.c
+@@ -1,4 +1,4 @@
+-/* Check for GLOB_TIDLE heap allocation issues (bug 22320, bug 22325).
++/* Check for GLOB_TIDLE heap allocation issues (bugs 22320, 22325, 22332).
+    Copyright (C) 2017 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+@@ -34,6 +34,9 @@ static int do_nocheck;
+ /* Flag which indicates whether to pass the GLOB_MARK flag.  */
+ static int do_mark;
+ 
++/* Flag which indicates whether to pass the GLOB_NOESCAPE flag.  */
++static int do_noescape;
++
+ static void
+ one_test (const char *prefix, const char *middle, const char *suffix)
+ {
+@@ -45,6 +48,8 @@ one_test (const char *prefix, const char
+     flags |= GLOB_NOCHECK;
+   if (do_mark)
+     flags |= GLOB_MARK;
++  if (do_noescape)
++    flags |= GLOB_NOESCAPE;
+   glob_t gl;
+   /* This glob call might result in crashes or memory leaks.  */
+   if (glob (pattern, flags, NULL, &gl) == 0)
+@@ -105,28 +110,30 @@ do_test (void)
+   for (do_onlydir = 0; do_onlydir < 2; ++do_onlydir)
+     for (do_nocheck = 0; do_nocheck < 2; ++do_nocheck)
+       for (do_mark = 0; do_mark < 2; ++do_mark)
+-        for (int base_idx = 0; base_sizes[base_idx] >= 0; ++base_idx)
+-          {
+-            for (int size_skew = -max_size_skew; size_skew <= max_size_skew;
+-                 ++size_skew)
+-              {
+-                int size = base_sizes[base_idx] + size_skew;
+-                if (size < 0)
+-                  continue;
+-
+-                const char *user_name = repeating_string (size);
+-                one_test ("~", user_name, "/a/b");
+-              }
+-
+-            const char *user_name = repeating_string (base_sizes[base_idx]);
+-            one_test ("~", user_name, "");
+-            one_test ("~", user_name, "/");
+-            one_test ("~", user_name, "/a");
+-            one_test ("~", user_name, "/*/*");
+-            one_test ("~", user_name, "\\/");
+-            one_test ("/~", user_name, "");
+-            one_test ("*/~", user_name, "/a/b");
+-          }
++	for (do_noescape = 0; do_noescape < 2; ++do_noescape)
++	  for (int base_idx = 0; base_sizes[base_idx] >= 0; ++base_idx)
++	    {
++	      for (int size_skew = -max_size_skew; size_skew <= max_size_skew;
++		   ++size_skew)
++		{
++		  int size = base_sizes[base_idx] + size_skew;
++		  if (size < 0)
++		    continue;
++
++		  const char *user_name = repeating_string (size);
++		  one_test ("~", user_name, "/a/b");
++		  one_test ("~", user_name, "x\\x\\x////x\\a");
++		}
++
++	      const char *user_name = repeating_string (base_sizes[base_idx]);
++	      one_test ("~", user_name, "");
++	      one_test ("~", user_name, "/");
++	      one_test ("~", user_name, "/a");
++	      one_test ("~", user_name, "/*/*");
++	      one_test ("~", user_name, "\\/");
++	      one_test ("/~", user_name, "");
++	      one_test ("*/~", user_name, "/a/b");
++	    }
+ 
+   free (repeat);
+ 
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,9 @@
++2017-10-22  Paul Eggert <eggert@cs.ucla.edu>
++
++       [BZ #22332]
++       * posix/glob.c (__glob): Fix buffer overflow during GLOB_TILDE
++       unescaping.
++
+ 2017-10-21  Florian Weimer  <fweimer@redhat.com>
+ 
+ 	* posix/Makefile (tests): Add tst-glob-tilde.
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index e4ba28f..76a410d 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
            file://CVE-2017-15670.patch \
            file://CVE-2017-15671.patch \
+           file://CVE-2017-15804.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


