Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1594E71DCF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:41 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e7so1956556pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YwIyUTciGeIiaIBZQVWXjaYnnIOHcmPQ9Rej5qwjlco=;
	b=LWoM0WkyHhzBo789qG9sDe9GFFtOaPqiws/rFlr2YLP2WLl50loPhPim9ZNdG/SCpr
	Z2x+cf46SVC6y+n4d8ZJEXBJk5OTL+lVkRv5RFoNPZ06KZlxWMlNJDTs+MxtvreCQptu
	OwintGSxrATf8zUsgMfj3/PZQnHOJXvgBQVMLHIfgmlNtXP+PTcqFSihKFGxzTtverxr
	yYt1gDte1R35dQNiTM0KvX+ZtP/rsu++HPJZ9kWFrmm6NvplvETdZY6TOi63PWi0mfhY
	YOCqq2kevkK+MLWYmbJyFUgAtgT07z6vbMQzAzhivgb0Chx4hiFi9aCdYgxvJyTDNa6l
	0UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YwIyUTciGeIiaIBZQVWXjaYnnIOHcmPQ9Rej5qwjlco=;
	b=TlbxHeW2u+HMzbYd/AaFujniKxVq9DAtXZ3qNPcchqyQ54Oy/WRwuYvOMXeIbL47xH
	wU0ypQV0nJZje6yxTNZXAI20p7wrXyft0g3nm5JrR4T8NViyKza03xWLpX8+F6FRjZql
	2fUSrF1HWbO06gEFvdxl1xHP0fXa69e7xLSiSNwjTHw4KDl9UEK3W452biyiSAZHtXdr
	1ZpZbE2CHjzB5B6Ge5McPFveuDuq8QkSJX3WQ51r7K8iww6d+eBhSW5z52bqLBNCsXMc
	gjWP5s9m+vR/tdWVHIS6QNiTB4b1Sp1uPSR9UhHtUm/En6Kix1bco4ED1DnkXfDGMz9g
	E5eA==
X-Gm-Message-State: AIVw110tAMYMiu29/ekROv160RKcYqEO5X89cZH+udk/T8n0UGdMFhJG
	xuUMmS7kaGDoSCPD
X-Received: by 10.101.70.15 with SMTP id v15mr26896192pgq.229.1499351622837;
	Thu, 06 Jul 2017 07:33:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:06 -0700
Message-Id: <fd1f5cb8f72695c43e5f0e49bc198ddeb7b839ad.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 05/22] gcc: Link libssp_nonshared.a only on musl targets
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:42 -0000

glibc already provides the content for libssp_nonshared
in libc_nonshared.a therefore we dont need to make it
universal.

This also fixed build issues on glibc when linking statically
and using -fstack-protector

Fixed errors like
/mnt/a/oe/build/tmp/work/i586-bec-linux/aufs-util/3.14+gitAUTOINC+bdfcc0dcfc-r0/recipe-sysroot/usr/lib/../lib/libc.a(stack_chk_fail.o): In function `__stack_chk_fail':                                                                       /usr/src/debug/glibc/2.26-r0/git/debug/stack_chk_fail.c:27: multiple definition of `__stack_chk_fail_local'                                                                                                                                   /mnt/a/oe/build/tmp/work/i586-bec-linux/aufs-util/3.14+gitAUTOINC+bdfcc0dcfc-r0/recipe-sysroot/usr/lib/../lib/libssp_nonshared.a(libssp_nonshared_la-ssp-local.o):/usr/src/debug/gcc-runtime/7.1.0-r0/gcc-7.1.0/build.i586-bec-linux.i586-bec-linux/i586-bec-linux/libssp/../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libssp/ssp-local.c:47: first defined here                                                                                                              collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  2 +-
 ...shared-to-link-commandline-for-musl-targe.patch | 42 ++++++++++++++++++++++
 .../gcc/gcc-7.1/0040-ssp_nonshared.patch           | 28 ---------------
 3 files changed, 43 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index b52d51fba6..96fc11c943 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -64,7 +64,7 @@ SRC_URI = "\
            file://0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
            file://0038-Fix-various-_FOR_BUILD-and-related-variables.patch \
            file://0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0040-ssp_nonshared.patch \
+           file://0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
            file://0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch \
            file://0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
            file://0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
new file mode 100644
index 0000000000..310f7aacba
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -0,0 +1,42 @@
+From 75a42d6d0f1f9784327f74882195a5c24843d5a8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 18:10:54 -0700
+Subject: [PATCH 40/49] Add ssp_nonshared to link commandline for musl targets
+
+when -fstack-protector options are enabled we need to
+link with ssp_shared on musl since it does not provide
+the __stack_chk_fail_local() so essentially it provides
+libssp but not libssp_nonshared something like
+TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
+ where-as for glibc the needed symbols
+are already present in libc_nonshared library therefore
+we do not need any library helper on glibc based systems
+but musl needs the libssp_noshared from gcc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/linux.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 2e683d0c430..5ff0a2cb2ff 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -182,6 +182,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
+   }
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++
+ #endif
+ 
+ #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch
deleted file mode 100644
index e9fb35cb91..0000000000
--- a/meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6c98538411ac30c2262b2635547974c6cd1699c5 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Sat, 7 Nov 2015 14:58:40 +0000
-Subject: [PATCH 40/47] ssp_nonshared
-
----
-Upstream-Status: Inappropriate [OE-Specific]
-
- gcc/gcc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 84af5d5a2e1..2c6471aa565 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -872,7 +872,8 @@ proper position among the other output files.  */
- #ifndef LINK_SSP_SPEC
- #ifdef TARGET_LIBC_PROVIDES_SSP
- #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
--		       "|fstack-protector-strong|fstack-protector-explicit:}"
-+		       "|fstack-protector-strong|fstack-protector-explicit" \
-+		       ":-lssp_nonshared}"
- #else
- #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
- 		       "|fstack-protector-strong|fstack-protector-explicit" \
--- 
-2.12.2
-
-- 
2.13.2


