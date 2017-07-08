Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC14780CD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:49 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id j186so29354920pge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9BN/uAVEDiGr7jBxSUfVS5eubEUAZqlLmRITJyJHk2o=;
	b=Fc6x6Ekn8uW+NsxWrdrqcVyfSuVtKvZw860VdS8WmMWpGpWpOojGuZHBrahbW5qX2q
	CFLhP+7tqp147c8mTjntt0EB/XlsQiOGgYwnWvrBxDzUzQBDoptezG9Cp+3IyMnuqlF4
	AHXMtw7lWi5uV0JAYipOCNSBwMXKMCfAYXLzZVV/UWWDYrUGKdXmkVfIymiWEQwgbXUE
	+qLjfFWXf9ATccQU6x7r8la2EYWpvJkVTrvOcDmlZ5vyN017tfvI/7o1pGCH7YACGzFF
	IUee6Y7yFWN0iXnOnlCuPqoz+aF3wmYN3H0xoXmadWuI8Q1A7vMG2TayfPIfLf5x93uZ
	6+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9BN/uAVEDiGr7jBxSUfVS5eubEUAZqlLmRITJyJHk2o=;
	b=gFVuoeOsNaHSz2iyeqXXzxtyTqp+D4AToaH+jJifMoHr2v5Im827Ry9M3McHHNq22G
	jaEQmFBZP3xQNd1C0LwwUEL6v2NHFbeZDC7uwL6gN873CZL0gR49ysy5v9T5aLuhyC4g
	e+ETRuE3ysWviaFpypNAzRZl87sgAmNsHatOcIDp+ayIc85ZtrPkeDCy/z1hFOzszcmW
	BnXsUHtyuR03CpaizrTOk+yOh43erVxK1y3uRJbe+SxjhWK8dvTM+zuFXn0AQl9dURUb
	q2rFJe1yol84LJNnw72qhf1LsoAWPiBAHpdxzSAo24hO4XN9XpvuNi1mxU0FpDPZxXrS
	sAKQ==
X-Gm-Message-State: AIVw11375C5uWFqOk0kZp7T3Sjkc1LACOxfFwNvsMaNbqJn3K5s3SDXz
	256QJWsdndbzDnt6
X-Received: by 10.98.212.19 with SMTP id a19mr37245884pfh.131.1499520890578;
	Sat, 08 Jul 2017 06:34:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:28 -0700
Message-Id: <a5f3f461ce4f14d5b1964e4784f93f60bec7129b.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 09/10] valgrind: tests build fixes for musl
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:50 -0000

x86/aarch64 needed minor changes to make few testcases portable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...m64-Define-__THROW-if-not-already-defined.patch | 32 ++++++++++
 ...emcheck-x86-Define-__THROW-if-not-defined.patch | 32 ++++++++++
 ...verride-Replace-__modify_ldt-with-syscall.patch | 68 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  3 +
 4 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
new file mode 100644
index 0000000000..a48d7db070
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
@@ -0,0 +1,32 @@
+From 3409dc35c15bb14c8a525239806322648e079ab1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jul 2017 17:12:43 -0700
+Subject: [PATCH 1/3] memcheck/arm64: Define __THROW if not already defined
+
+Helps compiling with musl where __THROW is not available
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ memcheck/tests/arm64-linux/scalar.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/memcheck/tests/arm64-linux/scalar.h b/memcheck/tests/arm64-linux/scalar.h
+index 9008816..8ef050f 100644
+--- a/memcheck/tests/arm64-linux/scalar.h
++++ b/memcheck/tests/arm64-linux/scalar.h
+@@ -12,6 +12,10 @@
+ #include <sys/types.h>
+ #include <sys/mman.h>
+ 
++#ifndef __THROW
++#define __THROW
++#endif
++
+ // Since we use vki_unistd.h, we can't include <unistd.h>.  So we have to
+ // declare this ourselves.
+ extern long int syscall (long int __sysno, ...) __THROW;
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch b/meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
new file mode 100644
index 0000000000..5433472291
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
@@ -0,0 +1,32 @@
+From 67d199dbdcbb3feff5f8928f87725fc64c0307d7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jul 2017 17:36:42 -0700
+Subject: [PATCH 2/3] memcheck/x86: Define __THROW if not defined
+
+musl does not have __THROW, therefore make it null
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ memcheck/tests/x86-linux/scalar.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/memcheck/tests/x86-linux/scalar.h b/memcheck/tests/x86-linux/scalar.h
+index ef28b03..52f742e 100644
+--- a/memcheck/tests/x86-linux/scalar.h
++++ b/memcheck/tests/x86-linux/scalar.h
+@@ -11,6 +11,10 @@
+ #include <sys/types.h>
+ #include <sys/mman.h>
+ 
++#ifndef __THROW
++#define __THROW
++#endif
++
+ // Since we use vki_unistd.h, we can't include <unistd.h>.  So we have to
+ // declare this ourselves.
+ extern long int syscall (long int __sysno, ...) __THROW;
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch b/meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
new file mode 100644
index 0000000000..fa1344c853
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
@@ -0,0 +1,68 @@
+From d103475875858ab8a2e6b53ce178bb2f63883d4c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jul 2017 17:37:56 -0700
+Subject: [PATCH 3/3] tests/seg_override: Replace __modify_ldt() with syscall()
+
+__modify_ldt() is specific to glibc, replacing it with syscall()
+makes it more portable.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ none/tests/x86-linux/seg_override.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
+index b7619c9..c89874b 100644
+--- a/none/tests/x86-linux/seg_override.c
++++ b/none/tests/x86-linux/seg_override.c
+@@ -2,6 +2,8 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <string.h>
++#include <unistd.h>
++#include <syscall.h>
+ 
+ /* Stuff from Wine. */
+ 
+@@ -52,14 +54,11 @@ inline static unsigned int wine_ldt_get_limit( const LDT_ENTRY *ent )
+ /* our copy of the ldt */
+ LDT_ENTRY ldt_copy[8192];
+ 
+-/* System call to set LDT entry.  */
+-//extern int __modify_ldt (int, struct modify_ldt_ldt_s *, size_t);
+-extern int __modify_ldt (int, void *, size_t);
+-
+ void print_ldt ( void )
+ {
+    int res;
+-   res = __modify_ldt( 0, ldt_copy, 8192*sizeof(LDT_ENTRY) );
++   /* System call to set LDT entry.  */
++   res = syscall(SYS_modify_ldt, 0, ldt_copy, 8192*sizeof(LDT_ENTRY) );
+    printf("got %d bytes\n", res );   
+    perror("error is");
+ }
+@@ -83,9 +82,6 @@ struct modify_ldt_ldt_s
+   unsigned int empty:25;
+ };
+ 
+-/* System call to set LDT entry.  */
+-//extern int __modify_ldt (int, struct modify_ldt_ldt_s *, size_t);
+-
+ void set_ldt1 ( void* base )
+ {
+   int stat;
+@@ -102,7 +98,8 @@ void set_ldt1 ( void* base )
+   ldt_entry.read_exec_only = 0;
+   ldt_entry.limit_in_pages = 0;
+   ldt_entry.seg_not_present = 0;
+-  stat = __modify_ldt (1, &ldt_entry, sizeof (ldt_entry));
++  /* System call to set LDT entry.  */
++  stat = syscall(SYS_modify_ldt, 1, &ldt_entry, sizeof (ldt_entry));
+   printf("stat = %d\n", stat);
+ }
+ 
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 4cf8062031..b63d27861d 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -32,6 +32,9 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
            file://0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch \
+           file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
+           file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
+           file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
            "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
-- 
2.13.2


