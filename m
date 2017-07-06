Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE3C774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:34:02 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id j186so1925610pge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9BN/uAVEDiGr7jBxSUfVS5eubEUAZqlLmRITJyJHk2o=;
	b=CY5oB7r6Yh8/MKbEazJ6vyEQyWxmMix0lVsQIuc+mUnxa4i3qPemwwCCIw5tYtZrGl
	c+PIeOJqjvpvoRaHBygsH458MWFyruxtcIVU9aKJj5dAC9NKD+KJW0S4jFFhvla/TCHJ
	gvFHTChd+aKv+TS+H4FmshjDv5yyq/qJBoz0V6mngp8UJdecaivpjBCCXMrgYFheCd3J
	2OJcJvzaiRcZUVcAe4No4rA39GMBMqykmTy2YrInQ/pL42/Xs6EGzkVS1HtRHZGxUlEq
	SV4K2/Tl1MubXPaDBCwMD1I/csWzi2yV6IN3OkqRpCy4PjYUjPFmJiSMwGq8cyHJ2UH9
	MngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9BN/uAVEDiGr7jBxSUfVS5eubEUAZqlLmRITJyJHk2o=;
	b=gWbk3KrZj++DL12Fkgk32KRp2IRJu70AX8FWJss5G+Y8qo3D19Mk27pBpHnwgY9Dzz
	jmjHK+5o5vxMrHqYzMiwlv6u4Z3pWzmQcHrePS/P7I/PumQ1ULv6YUSjDpu7HeB/eV6h
	DrkG/Aqw1uUWjKwJplzltRsSB51Px+aM3C1J1vYxYIc6bnqldtLT7E6vUgQZXQtusMOj
	keVXdnCNjFAZL1Ip4r7jQeHWj5ZlqPMbYXuB2+OuhLsrXy2Y/Xzlx90MybJVaRJUPOXN
	b+0Z6i7401IHuKrHReWzBuJicXfyVS1HbcT0SKfOQdrheBXU2W7LZEjUh5eNWU3tPBYi
	yAqQ==
X-Gm-Message-State: AIVw1105zFsuSOZjM7p2WMaLPzGEvyy+E3QlTZBXQZn3AQ1QAKNkLUB2
	KhDcNDsMZaLY+ECd
X-Received: by 10.99.134.199 with SMTP id x190mr26740991pgd.127.1499351643995; 
	Thu, 06 Jul 2017 07:34:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.34.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:34:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:20 -0700
Message-Id: <7c3dc9c2a0076d57e88fb474542d6796e9965a9a.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 19/22] valgrind: tests build fixes for musl
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
X-List-Received-Date: Thu, 06 Jul 2017 14:34:03 -0000

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


