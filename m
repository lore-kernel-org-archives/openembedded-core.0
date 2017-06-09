Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 815FB7829C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0576920BAF;
	Fri,  9 Jun 2017 19:13:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id r5hSi3tFzKDp; Fri,  9 Jun 2017 19:13:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D26DF207BD;
	Fri,  9 Jun 2017 19:13:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5B4841624C6;
	Fri,  9 Jun 2017 15:13:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 15:13:41 -0400
Message-Id: <1497035621-66174-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] util-linux: upgrade to 2.30
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
X-List-Received-Date: Fri, 09 Jun 2017 19:13:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Drop uuid-test-error-api.patch as it's been fixed upstream differently:
https://github.com/karelzak/util-linux/commit/b770b487004778f4425639c7ed1bb6ca22d157bf

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../util-linux/uuid-test-error-api.patch           | 99 ----------------------
 .../{util-linux_2.29.2.bb => util-linux_2.30.bb}   |  7 +-
 2 files changed, 3 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
 rename meta/recipes-core/util-linux/{util-linux_2.29.2.bb => util-linux_2.30.bb} (80%)

diff --git a/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch b/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
deleted file mode 100644
index a6fde5d..0000000
--- a/meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-This patch adds error() API implementation for non-glibc system C libs
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- misc-utils/test_uuidd.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
- 1 file changed, 61 insertions(+), 1 deletion(-)
-
-diff --git a/misc-utils/test_uuidd.c b/misc-utils/test_uuidd.c
-index 36f3b3d..7d579ce 100644
---- a/misc-utils/test_uuidd.c
-+++ b/misc-utils/test_uuidd.c
-@@ -23,7 +23,6 @@
-  *
-  *	make uuidd uuidgen localstatedir=/var
-  */
--#include <error.h>
- #include <pthread.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -38,6 +37,17 @@
- #include "xalloc.h"
- #include "strutils.h"
- 
-+#ifdef __GLIBC__
-+#include <error.h>
-+#else
-+extern void (*error_print_progname)(void);
-+extern unsigned int error_message_count;
-+extern int error_one_per_line;
-+
-+void error(int, int, const char *, ...);
-+void error_at_line(int, int, const char *, unsigned int, const char *, ...);
-+#endif
-+
- #define LOG(level,args) if (loglev >= level) { fprintf args; }
- 
- size_t nprocesses = 4;
-@@ -256,6 +266,56 @@ static void object_dump(size_t idx, object_t *obj)
- 	fprintf(stderr, "}\n");
- }
- 
-+#ifndef __GLIBC__
-+extern char *__progname;
-+
-+void (*error_print_progname)(void) = 0;
-+unsigned int error_message_count = 0;
-+int error_one_per_line = 0;
-+
-+static void eprint(int status, int e, const char *file, unsigned int line, const char *fmt, va_list ap)
-+{
-+	if (file && error_one_per_line) {
-+		static const char *oldfile;
-+		static unsigned int oldline;
-+		if (line == oldline && strcmp(file, oldfile) == 0)
-+			return;
-+		oldfile = file;
-+		oldline = line;
-+	}
-+	if (error_print_progname)
-+		error_print_progname();
-+	else
-+		fprintf(stderr, "%s: ", __progname);
-+	if (file)
-+		fprintf(stderr, "%s:%u: ", file, line);
-+	vfprintf(stderr, fmt, ap);
-+	if (e)
-+		fprintf(stderr, ": %s", strerror(e));
-+	putc('\n', stderr);
-+	fflush(stderr);
-+	error_message_count++;
-+	if (status)
-+		exit(status);
-+}
-+
-+void error(int status, int e, const char *fmt, ...)
-+{
-+	va_list ap;
-+	va_start(ap,fmt);
-+	eprint(status, e, 0, 0, fmt, ap);
-+	va_end(ap);
-+}
-+
-+void error_at_line(int status, int e, const char *file, unsigned int line, const char *fmt, ...)
-+{
-+	va_list ap;
-+	va_start(ap,fmt);
-+	eprint(status, e, file, line, fmt, ap);
-+	va_end(ap);
-+}
-+#endif /* __GLIBC__ */
-+
- int main(int argc, char *argv[])
- {
- 	size_t i, nfailed = 0, nignored = 0;
--- 
-2.8.3
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.29.2.bb b/meta/recipes-core/util-linux/util-linux_2.30.bb
similarity index 80%
rename from meta/recipes-core/util-linux/util-linux_2.29.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.30.bb
index 11303f8..6b309b5 100644
--- a/meta/recipes-core/util-linux/util-linux_2.29.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.30.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.29"
+MAJOR_VERSION = "2.30"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -14,10 +14,9 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
-            file://uuid-test-error-api.patch \
 "
-SRC_URI[md5sum] = "63c40c2068fcbb7e1d5c1d281115d973"
-SRC_URI[sha256sum] = "accea4d678209f97f634f40a93b7e9fcad5915d1f4749f6c47bee6bf110fe8e3"
+SRC_URI[md5sum] = "eaa3429150268027908a1b8ae6ee9a62"
+SRC_URI[sha256sum] = "c208a4ff6906cb7f57940aa5bc3a6eed146e50a7cc0a092f52ef2ab65057a08d"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
2.7.4


