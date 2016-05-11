Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id B405973218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:22 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so4047844pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=26QQJXHPfNrWah+kUxayHszvHJQH2tHOdjbd53gki1U=;
	b=hcUWK61MQIUJ2BwQIJtCrqmCQ4kvPe1DJ6lcPmOSNFWo2nx7GyUV64IGGTCUh//VTa
	yyTkgFe/4FuYctrubClp/WvZC7gndeBEJ40LFCI35F/90teYA2mBUBxPrIT+rEYTstg5
	Y2PWurVlgN098bl1KcnVY5lyjORcgZH4GZbNNEC40RaCPqyl83BCnP7T2LPx6qGAmepu
	TlmfQfRxeqx+lqK470z4lvK6/Rs/PEsdilOGj7bTycn5vQFf+800ez2pRcVSWhdcOHIA
	bcWFxguDpH+DbP9SXoK9mr+wv4D+hDYD0uBNKAQLRwNtuHQ9CiQYOYan8+bvJRviDVQn
	OThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=26QQJXHPfNrWah+kUxayHszvHJQH2tHOdjbd53gki1U=;
	b=gEqY0dm17NYe2kvIquG8KVGsg+siuJT3or8K0o9wJXkiM001Ur0SYd7KYOuMD4vZXh
	WGs8ZiZq5P8XQpexP7XDsH2ZvlpTX1Em0rYvLJgPfOfttUp/nctq3ZImq1bHD31iLcp1
	CXBFkwzDqDLnrDdF22XRVg1vIrEZxDbto8w4ZUibbCkEF6cpq0pXQ8ZYu6hliApW/wpg
	eEjfldMNW9FkiCHS+60F1BPq+Pksw9+iL+BtDmOgRwbmzW6Y96zWE6CjpfbPYuLEvmgB
	1zZHrXW5MRhoPtO6RngTeVUdIgO/IshC6VSnOlw6RE8dVfXg3fvUWl9LI0xKgNJEpaih
	s1Jw==
X-Gm-Message-State: AOPr4FUuTHjxwK4SxXe4AvmItp8mkXzAZkFfvYUdQ+cBSDOc8yb2ivC5pV782fUgXFW1Og==
X-Received: by 10.66.171.41 with SMTP id ar9mr6708400pac.125.1462988183753;
	Wed, 11 May 2016 10:36:23 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:35 -0700
Message-Id: <041f6e28df073b6a0c333fac296abbedb7726d30.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 32/42] libunwind: Add a confgure option for tests
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
X-List-Received-Date: Wed, 11 May 2016 17:36:23 -0000

Tests dont compile on musl due to its use
of {get|set}context APIs, adding this option
to disable tests helps it to compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-add-knobs-to-disable-enable-tests.patch   | 69 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_git.bb    |  5 +-
 2 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch b/meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch
new file mode 100644
index 0000000..673a5bb
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch
@@ -0,0 +1,69 @@
+From 459e471fcc33d300f7bbcdaf3e0dc338d9dc15b9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Apr 2016 16:56:34 +0000
+Subject: [PATCH] add knobs to disable/enable tests
+
+Some tests do not compile on musl libc
+in general its good to have such a knob
+since not all builds may want to enable
+tests
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am  |  6 +++++-
+ configure.ac | 12 ++++++++++--
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6a3ed9e..0c29b3e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -42,7 +42,11 @@ endif
+ 
+ nodist_include_HEADERS = include/libunwind-common.h
+ 
+-SUBDIRS = src tests
++SUBDIRS = src
++
++if CONFIG_TESTS
++SUBDIRS += tests
++endif
+ 
+ if CONFIG_DOCS
+ SUBDIRS += doc
+diff --git a/configure.ac b/configure.ac
+index 85d78f8..d362387 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,6 +129,10 @@ AC_ARG_ENABLE(documentation,
+ 	AS_HELP_STRING([--disable-documentation],[Disable generating the man pages]),,
+ 	[enable_documentation=yes])
+ 
++AC_ARG_ENABLE(tests,
++	AS_HELP_STRING([--disable-tests],[Disable building tests]),,
++	[enable_tests=yes])
++
+ AC_MSG_CHECKING([if we should build libunwind-setjmp])
+ AC_MSG_RESULT([$enable_setjmp])
+ 
+@@ -395,9 +399,13 @@ AM_CONDITIONAL([CONFIG_DOCS], [test x$enable_documentation = xyes])
+ if test "x$enable_documentation" = "xyes"; then
+   AC_CONFIG_FILES(doc/Makefile doc/common.tex)
+ fi
++AM_CONDITIONAL([CONFIG_TESTS], [test x$enable_tests = xyes])
++if test "x$enable_tests" = "xyes"; then
++  AC_CONFIG_FILES(tests/Makefile tests/check-namespace.sh)
++fi
++
+ 
+-AC_CONFIG_FILES(Makefile src/Makefile tests/Makefile tests/check-namespace.sh
+-		include/libunwind-common.h
++AC_CONFIG_FILES(Makefile src/Makefile include/libunwind-common.h
+                 include/libunwind.h include/tdep/libunwind_i.h)
+ AC_CONFIG_FILES(src/unwind/libunwind.pc src/coredump/libunwind-coredump.pc
+                 src/ptrace/libunwind-ptrace.pc src/setjmp/libunwind-setjmp.pc
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index 0949a32..cc8c2b5 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -9,9 +9,10 @@ SRC_URI = "git://git.sv.gnu.org/libunwind.git \
            file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
            file://0001-x86-Stub-out-x86_local_resume.patch \
            file://0001-Fix-build-on-mips-musl.patch \
-"
+           file://0001-add-knobs-to-disable-enable-tests.patch \
+           "
 
-EXTRA_OECONF_append_libc-musl = " --disable-documentation"
+EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
 
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.8.2


