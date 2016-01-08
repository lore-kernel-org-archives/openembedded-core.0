Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC37760A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:36 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n135so198826270qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4hrQQKrOcicnQfJHt4KvTvenakqc54GLXhoA2EF6LmY=;
	b=HdlOpAiR/hSFf91nTvxt6iUkm9rWf9lxXpXwo4YeGX/fdEXWMyFpKAkUTW4tC8Af3Q
	Fy4KQFkwU/WEqdw1JQiP0La5e/WN1wcID9DHgtJvlkZsHn7nJ1EIeLePUTRkyeBP/oxg
	FFjvc+F+ehZytKqAbp81ZpHnQSPP0nv9nEFkMDVodUG/AKx59yBYDa3qsBVqgldQtgt4
	JlinT2UYzYyTp/bwI4GZlIsnKUf6j6fJOGLgoVsA0dPVsIbdVRTFGTDuqF5YvAiRrVwz
	w/8YSLnGjYqvZPs/19mJAzS4Q7rV3wnl9P0byH7kpksEKFMaqyk+TpPnxTcFk9A+F8kU
	zmjA==
X-Received: by 10.55.78.207 with SMTP id c198mr142009741qkb.34.1452248376982; 
	Fri, 08 Jan 2016 02:19:36 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:42 +0000
Message-Id: <8a439c08d6e1146afc0b47f7bb2940d94c177b96.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 14/53] util-linux: Fix ptest builds on musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:37 -0000

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
2.7.0


