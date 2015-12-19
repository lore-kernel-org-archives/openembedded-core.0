Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 81E3B731AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:42 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id k189so125478560qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=C6PLA1T5PGIMowVtTPHoTpflAPILcffuAw52+L7fxVw=;
	b=yNXfv8vxeJXcJ2yFKHUJY3mrGIIapjb2HWK/j9MMv6GeGkFusyFSjxyk7YmxakM9i/
	p7yXyrdcScbTKwGH3wuwUVQWP9MVbu6IH0olMjxyoaXK0KfCUpulmAAvrBnSdFD1sAo0
	jhUGItQJFhcdJRSscv/vXePs4Fh18jVoy52HvZgm8Iij7KKm8hcleFO9vHMNs6+schsf
	HE0eytoNuq9Nzde/yY7UEv+KIYPRoqDlQ0wDpHjNB3aFnPOJcNZNlrXUjARXwroxOu0k
	w9sz79j3ptNNIKq3tKcbEjjvusemD2nYgpTV3ad7mU8hI36YZqrdLrCakhu3QxIdDtpp
	TWMg==
X-Received: by 10.55.214.82 with SMTP id t79mr15216623qki.61.1450569162859;
	Sat, 19 Dec 2015 15:52:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:26 +0000
Message-Id: <3024f5fd79b2e5f3fcbe03bc322317dce4ed20a6.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 17/17] util-linux: Fix ptest builds on musl
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:42 -0000

musl doesnt implement error() API, hence provide one

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../util-linux/uuid-test-error-api.patch           | 92 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.27.1.bb  |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch

diff --git a/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch b/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
new file mode 100644
index 0000000..1b0ff79
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
@@ -0,0 +1,92 @@
+This patch adds error() API implementation for non-glibc system C libs
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: util-linux-2.27.1/tests/helpers/test_uuidd.c
+===================================================================
+--- util-linux-2.27.1.orig/tests/helpers/test_uuidd.c
++++ util-linux-2.27.1/tests/helpers/test_uuidd.c
+@@ -23,7 +23,6 @@
+  *
+  *	make uuidd uuidgen localstatedir=/var
+  */
+-#include <error.h>
+ #include <libgen.h>
+ #include <pthread.h>
+ #include <stdio.h>
+@@ -39,6 +38,17 @@
+ #include "xalloc.h"
+ #include "strutils.h"
+ 
++#ifdef __GLIBC__
++#include <error.h>
++#else
++extern void (*error_print_progname)(void);
++extern unsigned int error_message_count;
++extern int error_one_per_line;
++
++void error(int, int, const char *, ...);
++void error_at_line(int, int, const char *, unsigned int, const char *, ...);
++#endif
++
+ #define LOG(level,args) if (loglev >= level) { fprintf args; }
+ 
+ size_t nprocesses = 4;
+@@ -257,6 +267,56 @@ static void object_dump(size_t idx, obje
+ 	fprintf(stderr, "}\n");
+ }
+ 
++#ifndef __GLIBC__
++extern char *__progname;
++
++void (*error_print_progname)(void) = 0;
++unsigned int error_message_count = 0;
++int error_one_per_line = 0;
++
++static void eprint(int status, int e, const char *file, unsigned int line, const char *fmt, va_list ap)
++{
++	if (file && error_one_per_line) {
++		static const char *oldfile;
++		static unsigned int oldline;
++		if (line == oldline && strcmp(file, oldfile) == 0)
++			return;
++		oldfile = file;
++		oldline = line;
++	}
++	if (error_print_progname)
++		error_print_progname();
++	else
++		fprintf(stderr, "%s: ", __progname);
++	if (file)
++		fprintf(stderr, "%s:%u: ", file, line);
++	vfprintf(stderr, fmt, ap);
++	if (e)
++		fprintf(stderr, ": %s", strerror(e));
++	putc('\n', stderr);
++	fflush(stderr);
++	error_message_count++;
++	if (status)
++		exit(status);
++}
++
++void error(int status, int e, const char *fmt, ...)
++{
++	va_list ap;
++	va_start(ap,fmt);
++	eprint(status, e, 0, 0, fmt, ap);
++	va_end(ap);
++}
++
++void error_at_line(int status, int e, const char *file, unsigned int line, const char *fmt, ...)
++{
++	va_list ap;
++	va_start(ap,fmt);
++	eprint(status, e, file, line, fmt, ap);
++	va_end(ap);
++}
++#endif /* __GLIBC__ */
++
+ int main(int argc, char *argv[])
+ {
+ 	size_t i, nfailed = 0, nignored = 0;
diff --git a/meta/recipes-core/util-linux/util-linux_2.27.1.bb b/meta/recipes-core/util-linux/util-linux_2.27.1.bb
index 14a77ca..7549158 100644
--- a/meta/recipes-core/util-linux/util-linux_2.27.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.27.1.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://util-linux-ng-2.16-mount_lock_path.patch \
             file://avoid_unsupported_grep_opts.patch \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
+            file://uuid-test-error-api.patch \
 "
 SRC_URI[md5sum] = "3cd2698d1363a2c64091c2dadc974647"
 SRC_URI[sha256sum] = "0a818fcdede99aec43ffe6ca5b5388bff80d162f2f7bd4541dca94fecb87a290"
-- 
2.6.4


