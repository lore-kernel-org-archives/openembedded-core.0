Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFECCA5FEC
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 16:47:27 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8996.1791046045624737125
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 09:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=N3tgQFbJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026100316472332b73803000002077a-0dfav6@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026100316472332b73803000002077a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 Oct 2026 18:47:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=g20YAaxFrvz0UOuJh8z6shPW/4o0ZrlZLn0q9s1e2fc=;
 b=N3tgQFbJdo4a6n9Yj+ja4dcSjwEFkTZqyJ7WyWYpV15FHGwkeAujQlsmn7f80NSXHyGRAx
 7MJZgLzXmNPWGoF0efk+8TnceO9yySFsxvf6EhsQCTap36p/KbLac8hCwuff67UO5K8HqX+m
 IkG27zTK7z5qESYmUr2CX0o2KQ2eYLtJBFYc/l8Dg5v74ecGKc/zYJQsJqcnJHwQDdHaDbsa
 DkLes1e26lhhTgoOhmviqPy8oPv2IUsNvkODk08AtoN+OnrI6SuBWmDYCt/6uw8QaSbZDtcG
 IXaYBMf2UkS8zqCZN6LbLsQUvAHRUAtmmLIIKwE+JP9dwqXVxn9ETt/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/2] popt: patch CVE-2026-18739
Date: Sat,  3 Oct 2026 18:45:41 +0200
Message-ID: <20261003164541.1905649-2-peter.marko@siemens.com>
In-Reply-To: <20261003164541.1905649-1-peter.marko@siemens.com>
References: <20261003164541.1905649-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 16:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247167

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.
Convert change in cmake file to autotools/makefile.
Install the new test in recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  3 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
new file mode 100644
index 0000000000..0a1e8f3590
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -0,0 +1,92 @@
+From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17 00:00:00 2001
+From: Yao Zhang <294772273@qq.com>
+Date: Wed, 5 Aug 2026 14:52:10 +0800
+Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in poptStuffArgs()
+
+The poptStuffArgs function only checks whether (con->os - con->optionStack)
+is equal to POPT_OPTION_DEPTH (10) before incrementing con->os, and does
+not increment the value by 1 to perform boundary pre-checking, as
+handleAlias does.
+
+Add a new test program as a reproducer for this case.
+
+Co-authored-by: Panu Matilainen <pmatilai@redhat.com>
+
+Fixes: CVE-2026-18739
+
+CVE: CVE-2026-18743
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/popt.c        |  2 +-
+ tests/Makefile.am |  5 ++++-
+ tests/testit.sh   |  2 ++
+ tests/tstuff.c    | 17 +++++++++++++++++
+ 4 files changed, 24 insertions(+), 2 deletions(-)
+ create mode 100644 tests/tstuff.c
+
+diff --git a/src/popt.c b/src/popt.c
+index 9ea3dfe..458aadc 100644
+--- a/src/popt.c
++++ b/src/popt.c
+@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const char ** argv)
+     int argc;
+     int rc;
+ 
+-    if ((con->os - con->optionStack) == POPT_OPTION_DEPTH)
++    if ((con->os - con->optionStack + 1) == POPT_OPTION_DEPTH)
+ 	return POPT_ERROR_OPTSTOODEEP;
+ 
+     for (argc = 0; argv[argc]; argc++)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index c410389..99fbf64 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -11,7 +11,10 @@ EXTRA_DIST = testit.sh \
+ 
+ AM_CPPFLAGS = -I. -I$(top_srcdir)/src
+ 
+-noinst_PROGRAMS = test1 test2 tdict test3
++noinst_PROGRAMS = test1 test2 tdict test3 tstuff
++tstuff_SOURCES = tstuff.c
++tstuff_LDFLAGS =
++tstuff_LDADD = $(top_builddir)/src/libpopt.la
+ test1_SOURCES = test1.c
+ test1_LDFLAGS = 
+ test1_LDADD = $(top_builddir)/src/libpopt.la
+diff --git a/tests/testit.sh b/tests/testit.sh
+index 4078f51..d26be3a 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=f1
+ 
+ run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=-1
+ 
++run tstuff "tstuff - 1" "-13"
++
+ if ! [ -e test3-data ]; then
+   # create symlink for running during 'make distcheck'
+   ln -s "${srcdir}/test3-data" test3-data
+diff --git a/tests/tstuff.c b/tests/tstuff.c
+new file mode 100644
+index 0000000..b820c7b
+--- /dev/null
++++ b/tests/tstuff.c
+@@ -0,0 +1,17 @@
++#include <stdio.h>
++#include <popt.h>
++
++int main(int argc, char *argv[])
++{
++    poptContext ctx = poptGetContext(argv[0], argc, (const char **)argv, NULL, 0);
++    int rc = 0;
++    for (int i = 0; i < 100; ++i) {
++	const char *ea[] = { "a", NULL };
++	if ((rc = poptStuffArgs(ctx, ea)))
++	    break;
++    }
++    printf("%d\n", rc);
++
++    poptFreeContext(ctx);
++    return rc;
++}
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index 3e9137c156..10c4b4b0af 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -11,6 +11,7 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-18743.patch \
+           file://CVE-2026-18739.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
@@ -23,7 +24,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-    for f in test1 test2 tdict test3 testit.sh test-poptrc; do
+    for f in test1 test2 tdict test3 tstuff testit.sh test-poptrc; do
         ${B}/libtool --mode=install install ${B}/tests/$f ${D}/${PTEST_PATH}
     done
 }

