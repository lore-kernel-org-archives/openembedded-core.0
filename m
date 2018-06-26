Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 10E92747E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 20:24:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a22-v6so8590264pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WVxRMl/Xg47ERpuRZBzr+R2PT23vfPUelNb9sSmK2FI=;
	b=u2tzSQl1vbV6sC3H6k0b8dH9NvjhDCojWf1kmmg+of+HpoY/qkEq40bYm2Yi+08NrM
	8fai89/H+g8kzT+XgOpU0fSdJTxsXqvDaMkUP9XSceSoJShlvpOtxGBHrXdyzRgeCsu9
	f0G6aSoWQth4PrXHmZEr9PzO53hhQuo0lnhZPyvI3yEmX+dPMiXrQZLR07YcVIn3tIgE
	/DNKEVTLJEuW0T/KwmfGecpwRYY/BxHi9X7mDQLrsxY73Br6ef0giipAXx4PKEVTJ8tC
	lpt8D9hWADnJg6SU+5baiV57XO5qRWJiVoEuOZf+5Vw9yqIdO+Y2P4+asir+za8RNixb
	qkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WVxRMl/Xg47ERpuRZBzr+R2PT23vfPUelNb9sSmK2FI=;
	b=QuNyD+7hqvyhxwYJwIErs0gRTd+Dn9faFUVvjB7GeFzb/L3G3L7Q73pJQfeAgyS7BG
	koTS733XWEi6cTv2bxULIufWEyNtP9UQjCMMD07gpX0WDKLzR/+O5lIrVIIDZ7LCIP7d
	a7DVdAZNaVaYflNwI8yZ7lNNtyq7g5LBDPQ6Bg2BE5mSh6o2rw6dijqPaxqgbmKKqtyX
	MCcpkU6ZYqeL91/KkRgnGy+2tdTyJSiADVxbXGHYmvPkzGCDKDakKg8LrdikcZgAmvd4
	enVKfnuRb1XZzPNsa0BnniSi7TIWPf7zGOEIVg/TuP0tQVyZQ8C4DUmgG+ojOBjoWLJu
	rIXQ==
X-Gm-Message-State: APt69E3BMjOqiPniiJjBBY03yhQd2qmpK4QDd9psxnhJ2FK3guR9s8nn
	CcsNqcWhSX3fEnavDmg5X5pkqA==
X-Google-Smtp-Source: ADUXVKIK1l5K8XFjFaAulQuerTPK94rqcW537AdM8YOkuPsaQkOdnFK1RcQQfLym1TtQ1e4vS52Kew==
X-Received: by 2002:a65:4d08:: with SMTP id
	i8-v6mr2605406pgt.427.1530044700966; 
	Tue, 26 Jun 2018 13:25:00 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r86-v6sm4267645pfd.154.2018.06.26.13.25.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jun 2018 13:25:00 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2018 13:24:55 -0700
Message-Id: <1530044695-26021-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] db: drop legacy ARM specific SWP based mutex optimisation
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
X-List-Received-Date: Tue, 26 Jun 2018 20:25:00 -0000

Although the ARM SWP instruction may exist for ARMv6 and above, it's
not guaranteed to work, especially on SMP systems where it's use may
lead to instability at runtime, etc:

  https://community.arm.com/processors/b/blog/posts/locks-swps-and-two-smoking-barriers

Keeping the optimisation for architecture levels which pre-date SMP
(ie <= ARMv5) may be safe, however other distros (Buildroot, Debian,
Fedora, etc) are not doing so and mutex contention is likely to be
less of an issue on uniprocessor systems anyway, so the benefits of
this micro optimisations are not clear. Since OE uses ARMv5 qemu as
a proxy for testing all 32bit ARM architecture levels, it's desirable
to keep the ARMv5 builds aligned with later ARM architecture levels
wherever possible.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../db/db/arm-thumb-mutex_db5.patch                | 50 ----------------------
 meta/recipes-support/db/db_5.3.28.bb               | 18 ++------
 2 files changed, 3 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-support/db/db/arm-thumb-mutex_db5.patch

diff --git a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch b/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
deleted file mode 100644
index 6a8eada..0000000
--- a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Original patch submitted by jbowler@nslu2-linux.org on 2005-11-17:
-
-db: fix thumb uclibc operation in 4.3.29
-  - uclibc thumb builds were using libpthread to implement mutexes, the
-  - uclibc version seems to be a stub (at least on thumb).  This commit
-  - fixes the ARM/gcc-assembly mutex implementation so that it has thumb
-  - support and the resultant db4 works (tested on LE Thumb uclibc)
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Author: jbowler@nslu2-linux.org
-
-Index: db-6.0.30/src/dbinc/mutex_int.h
-===================================================================
---- db-6.0.30.orig/src/dbinc/mutex_int.h
-+++ db-6.0.30/src/dbinc/mutex_int.h
-@@ -474,6 +474,25 @@ typedef unsigned char tsl_t;
- 
- #ifdef LOAD_ACTUAL_MUTEX_CODE
- /* gcc/arm: 0 is clear, 1 is set. */
-+#if defined __thumb__
-+#define	MUTEX_SET(tsl) ({						\
-+	int __r, __p;							\
-+	__asm__ volatile(						\
-+		".align 2\n\t"                                          \
-+		"bx     pc\n\t"                                         \
-+		"nop\n\t"                                               \
-+		".arm\n\t"                                              \
-+		"swpb   %0, %2, [%3]\n\t"                               \
-+		"eor    %0, %0, #1\n\t"                                 \
-+		"orr    %1, pc, #1\n\t"                                 \
-+		"bx     %1\n\t"                                         \
-+		".force_thumb"                                          \
-+	    : "=&r" (__r), "=r" (__p)                                   \
-+	    : "r" (1), "r" (tsl)                                        \
-+	    );                                                          \
-+	__r & 1;							\
-+})
-+#else
- #define	MUTEX_SET(tsl) ({						\
- 	int __r;							\
- 	__asm__ volatile(						\
-@@ -484,6 +503,7 @@ typedef unsigned char tsl_t;
- 	    );								\
- 	__r & 1;							\
- })
-+#endif
- 
- #define	MUTEX_UNSET(tsl)	(*(volatile tsl_t *)(tsl) = 0)
- #define	MUTEX_INIT(tsl)         (MUTEX_UNSET(tsl), 0)
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 093ee44..b7ed2c7 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -21,8 +21,7 @@ PR = "r1"
 PE = "1"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
-SRC_URI += "file://arm-thumb-mutex_db5.patch \
-            file://fix-parallel-build.patch \
+SRC_URI += "file://fix-parallel-build.patch \
             file://0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch \
             file://0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch \
             file://sequence-type.patch \
@@ -47,7 +46,6 @@ inherit lib_package
 PACKAGES =+ "${PN}-cxx"
 FILES_${PN}-cxx = "${libdir}/*cxx*so"
 
-
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
@@ -59,18 +57,8 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
 DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
 
-EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
-
-# Override the MUTEX setting here, the POSIX library is
-# the default - "POSIX/pthreads/library".
-# Don't ignore the nice SWP instruction on the ARM:
-# These enable the ARM assembler mutex code, this won't
-# work with thumb compilation...
-ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
-MUTEX = ""
-MUTEX_arm = "${ARM_MUTEX}"
-MUTEX_armeb = "${ARM_MUTEX}"
-EXTRA_OECONF += "${MUTEX} STRIP=true"
+EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot STRIP=true"
+
 EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
 
 EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal -I${S}/dist/aclocal_java"
-- 
1.9.1


