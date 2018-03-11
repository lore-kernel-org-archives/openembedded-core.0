Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B734878978
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:43:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t3so10104915wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZXIIR1/HiZ/rmviSOoezPM9w6tPQ06+1j9PB4rXnacE=;
	b=dcrdNqFG8piedzEJGY/7R64MoDKH0bIJmc5DFTpUXmRSeE2EZHhX4z6tCJ6qrClXoH
	+68EhblxJNtutUF6waR74IMXDkasUQflxOjT4FuB0BDbVH1eO4fLm2UTf6/TmebipXf0
	PXflPc0Jel3/WU6tHbhEYYqhEHk0wwM4Dy8ANwKQ9eGVaJLYaeWtp6ajBVuS72T2dNVp
	o+DvlU5UjVihj6dXjabGix+agt69ovo7Zq7Q6TIrHx5ZRdvcDsUfvQXAf6obAaQbneHs
	bD668UA3rPfG8GiYzO9+Zb2ieaRhVK8Z2Z2UOgRmbiEupvRK+vrrI6khZ8nf3GGRQgEr
	Uzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZXIIR1/HiZ/rmviSOoezPM9w6tPQ06+1j9PB4rXnacE=;
	b=QiCFrO9F2Tz29YSjjk4vxjfEgTv8W7hC/dE7ejecvbzoVg/48d2d6UZZrlB5WVobXy
	Xy/TdxH3JZLxRjLOzR86GZRd02I2Ypw9HiajQE2KPXtIxtY6hBK2c3Esro55hybkLwu2
	3ildCL8rXKFD+N63+eGlzWhNMrxUIiLfwaMxkiw2RSzOaz0UZEVoHQc+s9r2afC1RAQF
	FQOq1b4KRussbEX9zxbkNSAf4OiqFvZKMMWPXmFYz8YXWK/sG1Yn1RyxDTjxW8UmnaSr
	4BjXcXA41zQ0CUEsy9Zf36PtVd9lTP6v2frzD1XRkU5lL6HuPhSIW65+10PN49ayIoUP
	gxUQ==
X-Gm-Message-State: AElRT7FgziEbdajguuJDO3yTwRhEVBQC0H2V88XW5W/lmTLKI+YyXdXN
	lzk38FwvocCaRwfGoe9YWevy7Q==
X-Google-Smtp-Source: AG47ELvDeJOfR73If+B5tZa5S5W/sBSqzbOPesxHzQ06Q2rBgvMQNeienvIUj98Ofb3iHh90jLC1Lg==
X-Received: by 10.28.23.143 with SMTP id 137mr2228688wmx.153.1520729001990;
	Sat, 10 Mar 2018 16:43:21 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w17sm6337810wrb.12.2018.03.10.16.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:43:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:43:12 +0000
Message-Id: <63490f854799973943a05143f5140e40548946c3.1520728804.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728804.git.Martin.Jansa@gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
Subject: [rocko][PATCH 3/8] gcc: Link libssp_nonshared.a only on musl targets
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
X-List-Received-Date: Sun, 11 Mar 2018 00:43:22 -0000

From: Khem Raj <raj.khem@gmail.com>

glibc already provides the content for libssp_nonshared
in libc_nonshared.a therefore we dont need to make it
universal.

This also fixed build issues on glibc when linking statically
and using -fstack-protector

Fixed errors like
/mnt/a/oe/build/tmp/work/i586-bec-linux/aufs-util/3.14+gitAUTOINC+bdfcc0dcfc-r0/recipe-sysroot/usr/lib/../lib/libc.a(stack_chk_fail.o): In function `__stack_chk_fail':                                                                       /usr/src/debug/glibc/2.26-r0/git/debug/stack_chk_fail.c:27: multiple definition of `__stack_chk_fail_local'                                                                                                                                   /mnt/a/oe/build/tmp/work/i586-bec-linux/aufs-util/3.14+gitAUTOINC+bdfcc0dcfc-r0/recipe-sysroot/usr/lib/../lib/libssp_nonshared.a(libssp_nonshared_la-ssp-local.o):/usr/src/debug/gcc-runtime/7.1.0-r0/gcc-7.1.0/build.i586-bec-linux.i586-bec-linux/i586-bec-linux/libssp/../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libssp/ssp-local.c:47: first defined here                                                                                                              collect2: error: ld returned 1 exit status

Cherry-picked from oe-core master d71eba26850838b2878efea3f8c392a2eb2ebbfb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  2 +-
 ...shared-to-link-commandline-for-musl-targe.patch | 42 ++++++++++++++++++++++
 .../gcc/gcc-6.3/0041-ssp_nonshared.patch           | 28 ---------------
 3 files changed, 43 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index e569e0220b..2f29fbf635 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -65,7 +65,7 @@ SRC_URI = "\
            file://0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
            file://0039-Fix-various-_FOR_BUILD-and-related-variables.patch \
            file://0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0041-ssp_nonshared.patch \
+           file://0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
            file://0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch \
            file://0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
            file://0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
new file mode 100644
index 0000000000..310f7aacba
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
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
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
deleted file mode 100644
index 0744529741..0000000000
--- a/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 551a5db7acb56e085a101f1c222d51b2c1b039a4 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Sat, 7 Nov 2015 14:58:40 +0000
-Subject: [PATCH 41/46] ssp_nonshared
-
----
-Upstream-Status: Inappropriate [OE Configuration]
-
- gcc/gcc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 2812819..9de96ee 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -863,7 +863,8 @@ proper position among the other output files.  */
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
-2.8.2
-
-- 
2.15.1


