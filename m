Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 478767FF1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so2169494wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xxMeoJ6sGc7JTW6Zicc+DD8zO3n8rGrdYCBp9rx8nyk=;
	b=YfZHvccx5JIUMCPdT/HY11ilB+FvksFy3b00PjPdoMwdSnPexWxTQq96XTCK/dDfqL
	wvJuMoCpjcpChinSQ1+Im0lb+SHOwNws37bdveY0Pkel5FZKiF5k/l2IEKSdihdwBvgq
	6OafYLTjviJhP4YraNLtn5iA0yHyMMngdceUQS4FK+JFJFdZI5TnwmSyCo5WBrAckTvR
	5w1K5PLE4zwm25CKMZx+DziDVy7u3QtwXtaXhSb6l350RiVFZ7uEzC7SbDPybiha2qr6
	lAGC7CIKQfFfQuBYW79pk6sqWA5+peMXBOjUxtqzotevkMVphCCx9+mXwWuBLQQ2r147
	HCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xxMeoJ6sGc7JTW6Zicc+DD8zO3n8rGrdYCBp9rx8nyk=;
	b=qT3tqYkdSxA+5GyFv2i2wZN1tAjgHwOKtPBE98gUewWgCQ1CASeFfjGk7tpwLT+MaL
	9CcyUzpewrz+gFWacbxJBsuEAr7JnU/Fhmbb6KvNK3R1NrrOfsaFunCoNgetfY07srhp
	IQ1LKVgi2tCH7jOBNzPWfacl7AJZXMjkn5Fo6hI7BodR1yhnsb9wZLAoyj4r4nu8pKYB
	jnOkWn22CpUvBDGloagn2J8XgjhScmhIs3Jn9F8dZfaMN+mVaVPKYXMCZW2ceIF5/q/1
	jx6Ruxt/mi83FWAacPPL3bhok03AHe7RiHNTRfIFBrkm9AIngqfSb5m3c0cNOTZiH8Wq
	TFYA==
X-Gm-Message-State: APjAAAV3QuZuEvLXMwQXiV9FGpTpgB99Yps9YS0QlC03TuqocgCYREZX
	piwmBqWGdx5YAvfLauEMrBMGi6oKWMA=
X-Google-Smtp-Source: APXvYqw9yr79ZwAx8H7huIPmln9vdjGOX4u1fXIqS5x3U0o1Ya5ACcFCmDhRjWuX5xpZEPVQBtJ+gQ==
X-Received: by 2002:a05:600c:294d:: with SMTP id
	n13mr3506776wmd.130.1576679889832; 
	Wed, 18 Dec 2019 06:38:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:40 +0100
Message-Id: <20191218143758.129308-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/25] nss: update to 3.48
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:10 -0000

Drop a backport, and a patch that causes build errors with
the new version.

Add a patch to make ARM HW crypto optional; upstream for some
reason does not allow disabling it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ppc64-inline-assembler-for-clang-r-j.patch | 35 ------------------
 ...figure-option-to-disable-ARM-HW-cryp.patch | 35 ++++++++++++++++++
 .../nss/nss/nss-fix-nsinstall-build.patch     | 36 -------------------
 .../nss/{nss_3.45.bb => nss_3.48.bb}          |  9 ++---
 4 files changed, 40 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
 create mode 100644 meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
 delete mode 100644 meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
 rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.48.bb} (96%)

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch b/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
deleted file mode 100644
index 59e44e68418..00000000000
--- a/meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6b351dbb049b3b3ab6c0d51aa3c1c7fb3c9df80c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
-Date: Mon, 22 Jul 2019 11:07:41 -0700
-Subject: [PATCH] Bug 1493916 - Fix ppc64 inline assembler for clang r=jcj
- Seems clang's inline assembler doesn't want registers to be prefixed with
- "r", while gcc accepts both - r0 and 0 for GPR0.
-
-tested with clang 6.0 and gcc 8.1
-
---HG--
-extra : amend_source : 87e09bb59c78bdb25b9573b9f29511e10b9db6fa
-extra : histedit_source : 9b3fad70ac2851bf7de14d42c34db4a5fba41710
-
-Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/671d89b6c4a6f41707bb044534751098e2e3f211]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- nss/lib/freebl/mpi/mpcpucache.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/mpi/mpcpucache.c b/nss/lib/freebl/mpi/mpcpucache.c
-index 336b4cc..2ad291f 100644
---- a/nss/lib/freebl/mpi/mpcpucache.c
-+++ b/nss/lib/freebl/mpi/mpcpucache.c
-@@ -727,7 +727,7 @@ static inline void
- dcbzl(char *array)
- {
-     register char *a asm("r2") = array;
--    __asm__ __volatile__("dcbzl %0,r0"
-+    __asm__ __volatile__("dcbzl %0,0"
-                          : "=r"(a)
-                          : "0"(a));
- }
--- 
-2.24.0
-
diff --git a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
new file mode 100644
index 00000000000..fe29d198820
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -0,0 +1,35 @@
+From 5595e9651aca39af945931c73eb524a0f8bd130d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 18 Dec 2019 12:29:50 +0100
+Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
+
+Not all current hardware supports it, particularly anything
+prior to armv8 does not.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ nss/lib/freebl/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 06506f0..a8b015d 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -125,6 +125,8 @@ else
+         DEFINES += -DNSS_X86
+ endif
+ endif
++
++ifdef NSS_USE_ARM_HW_CRYPTO
+ ifeq ($(CPU_ARCH),aarch64)
+     DEFINES += -DUSE_HW_AES
+     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
+@@ -145,6 +147,7 @@ ifeq ($(CPU_ARCH),arm)
+         endif
+     endif
+ endif
++endif
+ 
+ ifeq ($(OS_TARGET),OSF1)
+     DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
diff --git a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
deleted file mode 100644
index 181c69adb04..00000000000
--- a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix nss multilib build on openSUSE 11.x 32bit
-
-While building lib64-nss on openSUSE 11.x 32bit, the nsinstall will
-fail with error:
-
-* nsinstall.c:1:0: sorry, unimplemented: 64-bit mode not compiled
-
-It caused by the '-m64' option which passed to host gcc.
-
-The nsinstall was built first while nss starting to build, it only runs
-on host to install built files, it doesn't need any cross-compling or
-multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
-error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-===================================================
-Index: nss-3.24/nss/coreconf/nsinstall/Makefile
-===================================================================
---- nss-3.24.orig/nss/coreconf/nsinstall/Makefile
-+++ nss-3.24/nss/coreconf/nsinstall/Makefile
-@@ -18,6 +18,13 @@ INTERNAL_TOOLS  = 1
- 
- include $(DEPTH)/coreconf/config.mk
- 
-+# nsinstall is unfit for cross-compiling/multilib-build since it was
-+# always run on local host to install built files. This change intends
-+# to clean the '-m64' from ARCHFLAG and LDFLAGS.
-+ARCHFLAG =
-+LDFLAGS =
-+CFLAGS =
-+
- ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
- PROGRAM		=
- else
diff --git a/meta/recipes-support/nss/nss_3.45.bb b/meta/recipes-support/nss/nss_3.48.bb
similarity index 96%
rename from meta/recipes-support/nss/nss_3.45.bb
rename to meta/recipes-support/nss/nss_3.48.bb
index c8005a5b3a5..2344ceac1bb 100644
--- a/meta/recipes-support/nss/nss_3.45.bb
+++ b/meta/recipes-support/nss/nss_3.48.bb
@@ -25,17 +25,16 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-nss-fix-support-cross-compiling.patch \
            file://nss-no-rpath-for-cross-compiling.patch \
            file://nss-fix-incorrect-shebang-of-perl.patch \
-           file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
-           file://0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch \
            file://blank-cert9.db \
            file://blank-key4.db \
            file://system-pkcs11.txt \
+           file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
 
-SRC_URI[md5sum] = "f1752d7223ee9d910d551e57264bafa8"
-SRC_URI[sha256sum] = "112f05223d1fde902c170966bfc6f011b24a838be16969b110ecf2bb7bc24e8b"
+SRC_URI[md5sum] = "7855014d8653aec66106ad910487a9c9"
+SRC_URI[sha256sum] = "3f9c822a86a4e3e1bfe63e2ed0f922d8b7c2e0b7cafe36774b1c627970d0f8ac"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
@@ -81,6 +80,8 @@ do_compile() {
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 
+    ${@bb.utils.contains("TUNE_FEATURES", "crypto", "export NSS_USE_ARM_HW_CRYPTO=1", "", d)}
+
     export OS_RELEASE=3.4
     export OS_TARGET=Linux
     export OS_ARCH=Linux
-- 
2.17.1


