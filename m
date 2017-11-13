Return-Path: <samentu1@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 814CA7848D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:00:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z3so7111866wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=H+FFasPYUsU5nJfddVIJmf3FAAjDq839zP9d//7zNZg=;
	b=rcOAFqQD2STAr2lVOKHg0gs6CRn7UvYVGtBLl3UWjr4Z4B6iLxsyS9rpFjEGD4i7UU
	2CKRPDqXI5uT4Z8KDmdeHfegm3fug+gD/YoZXx2O/5g0sXMN8NqNoUIwQu8ntAFhReys
	s440cJzdWKjTyqnStDcmcElPHy0VRUHG7pb1xGAqk3i1vqhlVbkjW5LRu7FZkKC1lS5N
	QhLJXJXS0PqEHrxGZ9Ez0urzZOtc+vpYGQRR4AF22NruTWUq7hntSbRbpdrL6DhC4LG5
	lFzxI5S8WYwBJrztoVDhJPqyJlyWxV6WX5+QX/aDR+8hJIaugWiZzBuQRg7P2/y9rgNA
	BmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H+FFasPYUsU5nJfddVIJmf3FAAjDq839zP9d//7zNZg=;
	b=KP4/Epdov9+mc4NykRoaRUAELX/C71ECJ5Smdx05VoI/Gx7hMoVqtdsjYpVMT1fP+Y
	mLcZk4FutKyBRKwdQJilOtH0yul4MpJjAKnhXgtqsGRHk9KmwKoig2RT75KTI8R0cn4T
	FDN0pJe2IXRtxhA5Pu2acDHKGdTodN+R1ryOxkeFgQ9bLDIBPEp9TWpJNPNj6CLfpKA/
	rzrQHsRVOp1LRJeuL76JLMgjqw3BvmUMG9jOO7M3snttmKwLX2o3KydsGzet3i/bZvas
	106TD/an2r5USNyuNPaiAgDuYUfHgCxyQpBMIdEkLI3nMd0LRUUbUmC2KtjfTwY3/3Ma
	h2fQ==
X-Gm-Message-State: AJaThX4JhWuLBXzem2/7/2+in8Y00Z+qTZW6AC3qJHllmkqNrvz/Jq5g
	fZkoUYROEQmeSKIyacE9KJtkBmLbn6E=
X-Google-Smtp-Source: AGs4zMbDWL2IQyZF5UkWcOZUu1/MwCEIEVLTakIHNGXP0zUW22L4/OhemyRvMZciaiMmy6JT84ebIQ==
X-Received: by 10.28.182.85 with SMTP id g82mr6568612wmf.32.1510599625428;
	Mon, 13 Nov 2017 11:00:25 -0800 (PST)
Received: from localhost.localdomain ([79.115.216.36])
	by smtp.googlemail.com with ESMTPSA id
	o70sm54759496wrb.62.2017.11.13.11.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 11:00:24 -0800 (PST)
From: Florin Sarbu <samentu1@gmail.com>
X-Google-Original-From: Florin Sarbu <florin@resin.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 21:00:11 +0200
Message-Id: <20171113190011.17183-1-florin@resin.io>
X-Mailer: git-send-email 2.13.6
Cc: Florin Sarbu <florin@resin.io>
Subject: [pyro][PATCH] gcc: Use libssp_nonshared linker specs only for ppc/musl
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
X-List-Received-Date: Mon, 13 Nov 2017 19:00:25 -0000

Link libssp_nonshared.a only for ppc/musl because glibc already
provides the content for libssp_nonshared in libc_nonshared.a and
therefore we dont need to make it universal.

(From OE-Core rev: c08247e3c7c004a40281d4010186a9ace86e0e47)

Signed-off-by: Florin Sarbu <florin@resin.io>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  2 +-
 ...shared-to-link-commandline-for-musl-targe.patch | 87 ++++++++++++++++++++++
 .../gcc/gcc-6.3/0041-ssp_nonshared.patch           | 28 -------
 3 files changed, 88 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index d74f12c466..5c81a33af0 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -71,7 +71,7 @@ SRC_URI = "\
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
index 0000000000..29b7ce72d2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -0,0 +1,87 @@
+From 210f6b3b82084cc756e02b8bc12f909a43b14ee8 Mon Sep 17 00:00:00 2001
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
+ gcc/config/linux.h          |  7 +++++++
+ gcc/config/rs6000/linux.h   | 10 ++++++++++
+ gcc/config/rs6000/linux64.h | 10 ++++++++++
+ 3 files changed, 27 insertions(+)
+
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 2e683d0c430..1b4df798671 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
+   }
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++
+ #endif
+ 
+ #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
+index 684afd6c190..22cfa391b89 100644
+--- a/gcc/config/rs6000/linux.h
++++ b/gcc/config/rs6000/linux.h
+@@ -91,6 +91,16 @@
+ 					 " -m elf32ppclinux")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #undef LINK_OS_LINUX_SPEC
+ #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 3b00ec0fcf0..8371f8d7b6b 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -465,6 +465,16 @@ extern int dot_symbols;
+ 					   " -m elf64ppc")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+   -dynamic-linker " GNU_USER_DYNAMIC_LINKER32 "}} \
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
2.13.6


