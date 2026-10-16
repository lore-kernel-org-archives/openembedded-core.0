Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E91CCF2C3
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:45 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5936.1792189483573038049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nqZ1oUje;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b060ec084so185589f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189482; x=1792794282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Age2ODD56r6/hasnWswZ2cbPL+JOYAMAovt6VvuEUx0=;
        b=nqZ1oUje0uGCdm6OugW7mfPHOk1QeTr6p939eimvrPSqdWU9l/k3XrebWKr1xskMkG
         o3kLDeUy8/I34ahegZcAWVQof0h8BVRS6QgobNj//i92hExmRGUadDQ5VHQ1lbEEYOo+
         BSNSF9/z+zIW5BFkOuLPdHODmDbGWSIwwkkEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189482; x=1792794282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Age2ODD56r6/hasnWswZ2cbPL+JOYAMAovt6VvuEUx0=;
        b=P8vjT+sZ3X4EdBTgew+IIfGRr4K2E1WQ55YtpXq2nRN0o4TzjiQ810JIPEoW3/YBBG
         aqG0e/hgMrJUQeGLa5sr3bQ3jbx6JGv1l3EyvVyUyxsH/+BzQsIp5rTF2SYmvyJt6tZm
         HZqnOt5sdFe/u3jaLaIb919TI4FB8Ja8zbIZPdV2mzt1NpHq9K8tPJQtUR9PKsvsQ1P8
         W+iveQzVzf/hDIrBva5GJ7G8w5M/56e20v7i8fcGcobPrGXqDqVdGbQWZKzOwH5zuvTr
         Kab/A1V4Ti8K+uc7hGDRugAP3rEbJ0tTzRE4DNlg45+YDSzbAtcVhbvF4CtR2lnBDWAC
         hBmQ==
X-Gm-Message-State: AFq9FYIPGo++2q6wxGclAxqjaRILIi/rfr7pA/NbnAURnV7PI5z6qFC6
	vCjBNBjXZ7VOgn6wMjEEQvyzxLBiRTTjKsCZFQzv5vHPBdBh1kpNSoRlcrYP8XQRgqg/SFStqeS
	ATPkQ3Tc=
X-Gm-Gg: AYBFou3VCl1+reQ0+AcPlgaZ65Vsz7oysJLn1wb/DnyVPdyTar++9AEXTfac4NxQdET
	IkwwFPzR/bRqaoo0XGV2aAC0dvI+J5YjfPMsovEzPYeEtWDv4usJZnD9ULgKfhHmWtxms8z1Djt
	JCoRvCfmM6En516BaJOIvgdzXsSq9RNJfbaqeWdiygPpMPJQfhjavjC3+75EWsh4kYjSc8L0ea2
	W0A632wjBl24Gu5R8uZdjbkqifYkW7DBp5NLAyXwq7Deml2IpoyO3/EiTp4s10m+/AS4HvZuo9G
	Y0fAlTAL/NV7M9JGuPmQqh1VljuN00UWE6nk+fGwWnYqLMbb37u2b5WYFrNLPZaVX9rVkoNdH7Y
	xvm7VVjWznspdLL22W8srVqDKIL0CofgND7pYDFwWa4cIbx6hLyRnIOEC7Kns5gr5P568932Vh8
	xoteGoqNb2RwLRvgymt44GGbHFTz9AVIoazsPBxsUmOnM51+tHwOrR9bDD8c5dYG2h2H7Liw9ZT
	onKN1q+1QGAt71lIEx4miru3xK2XtAUO9gxV+N4DhjsG8Ed23rPRPIljnts4Mk0oW8UYg7N4SE=
X-Received: by 2002:a05:6000:144b:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-48e07fa96e2mr1584927f8f.44.1792189481729;
        Fri, 16 Oct 2026 15:24:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 04/17] popt: patch CVE-2026-18739
Date: Sat, 17 Oct 2026 00:24:06 +0200
Message-ID: <b9b1a3fe7176282f5e95393f8e17beda0bef44e1.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248054

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.
Convert change in cmake file to autotools/makefile.
Install the new test in recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c211972ad21e1801abc7dd15951093316c5528f4)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: backport translated cmake to automake
     (the project migrated in between) ]
---
 .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  3 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
new file mode 100644
index 00000000000..0a1e8f35907
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
index 3e9137c156a..10c4b4b0af7 100644
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

