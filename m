Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC3C788D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:45 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v18so12298738wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PlJleQJ4SgQaqpkADFSpuOM8/N6eKEMY3MEeK+jpyho=;
	b=TVwN86sWC0waYwQr/WQnXT+a51RY4lbWqcOe+x2m0fwZ4fLCLj+68MG920+v/QTqnd
	0RkjlVE1u3f3ytftiaD9R0wJ+ufR+MZpFE7P6T7Keucg15eo1i3XL/PLxuiAF5gFAFRz
	+AueudBhVK0vgwVwUW1h45V3HVgOSSOvQ2jDrJkB282OWFppVnpFxdc6z5zijNBf4KKU
	0PMvKJvXg8713Hqr/ABGYU3Ry8gOMwLPI+lEmPJnS2Tmc4gWCHTVbct/13wxFAcQygO6
	SWUQIWalHQ9J7Yt4VSIdPQ2kDN85RrHOxIDdx1P//KnWxsRdPpy5oRq3t4UlOUmuvHD0
	zC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PlJleQJ4SgQaqpkADFSpuOM8/N6eKEMY3MEeK+jpyho=;
	b=nVrpnbk5TB1Np/3lVx+gzEgZYL9A990dMh/pOJZCMWQ2+wHPOxs0bTQbGFcVuFpmXP
	NYG2AW60nBbjhGI6ZMz4smw9tBIIVZ4gDH3Qx2nIn3Z+C88WZQKJ21mdl8ddA5vkuJ3x
	15eO/faUwB9+NFkRAjKCi+87vhLzkRIp23FYqw+rA6VZVd9VxLuiqi7ZZcLmxPFJJbAv
	s+DgRBk0Wg1szlgFjAwLOc70KIbqviqMn+gxoeeyxHLbzzg4Gdjq3MBMbLo9kSJ6ehPn
	lH+kvPwq0apbDJ4FuvoaP4HlrBpbS7H2hQZPT/YuV1+2m2I5qy0TbizUtTTLul4gMMwD
	/DRA==
X-Gm-Message-State: AElRT7G4thfd98aJHl0GsC5ISli9sAzmub1jx4vxhe88Dkbnhc1jPlmX
	hfrOrkXEE750g8xe3IUIn5Ay7A==
X-Google-Smtp-Source: AG47ELv8s0aJnt6837cKpWkS2WhGfZGoIIDI9QJNeizrNVbni+Z1cml6Gy5v5oRrgj6EMdoeXFKOow==
X-Received: by 10.223.196.141 with SMTP id m13mr1177523wrf.173.1520728966785; 
	Sat, 10 Mar 2018 16:42:46 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w17sm6333428wrb.12.2018.03.10.16.42.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:23 +0000
Message-Id: <27eaa97595cbac38a8bec118fe3d5f8920ab814e.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 11/16] gcc: Link libssp_nonshared.a only on musl targets
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:46 -0000

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
index 0d98be3861..7b409f119b 100644
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


