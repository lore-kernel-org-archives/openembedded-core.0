Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 13C1D73257
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:11 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id e65so142593586pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4hrQQKrOcicnQfJHt4KvTvenakqc54GLXhoA2EF6LmY=;
	b=YRg0VWh+oJMX9+7vqgaDqCpJbxmvUm31GWUxV/BIp4UX4kHh7qplhfeNPCW/Oiqquc
	tO9jSgysu9mYLyzbnhebVmMQmFslWYIC+9iBabN6LoNVrvhwaXOjtpxiOUXK/pRkB97M
	ji9q9JWP9xpoWoph7uMtkTkNHy6NmObSaW1iT9jaDwhfR0+fQgMTklm7ZmnOQjnR5PPA
	gLMq0YHksW+V8s42qLJuWm7SKQzvkU4TW8KrSTIHE0qz0dPwwCk507IkHeF+qcPWTjBd
	sSfhNurp61iendfr5NR+9b1NcylV2gfJxOygXIk7QolKszU7CJtlxxk5e0DqmGR08Dkr
	babw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4hrQQKrOcicnQfJHt4KvTvenakqc54GLXhoA2EF6LmY=;
	b=eUT2jOguqPJhIrtm+jvr2kxuDGHfnV332ordNPZDyy5nqPaxe0seH3x9GVKrDWoOsV
	rvIhggwu8ncpL1Dru3FaHbyd2DUdilMYwpMLxKXUOEnkFp7rQcY68uJuBTCD2wwOuHL7
	HhjoPvm5SthC5K3D6WbYla4rXgvjYpNUyITZle+KibExF/VrwpGWvsPcBZG8NN4KOjs/
	nVadUsh+J9TkknwFfAgHjJIulvV4Dae77Zuhc+6ZzwPg+SGVoGU/wQj28jgYY6tlzTZo
	YU6HVdnzMp6Vmyo0sf4nPeVXc+m/D6Lt9fqRrXpAh4/yUTcqcjcMoPMrhaGki+TR0or0
	yfpA==
X-Gm-Message-State: ALoCoQkggDoTpRQZu6/QAyOwyCiBRq4HeHhyVUsS7BtLSiRS9DYS0chx4wafchxAxK5R3V7ttvOEiUSVATjQosMKfiakCWKEYA==
X-Received: by 10.98.71.197 with SMTP id p66mr29053682pfi.166.1453030632130;
	Sun, 17 Jan 2016 03:37:12 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:46 -0800
Message-Id: <64d103db0864a200573b3eb75cb6a23338ea91b5.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 13/73] util-linux: Fix ptest builds on musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:11 -0000

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


