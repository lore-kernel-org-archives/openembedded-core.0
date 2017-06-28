Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2D37805C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:42 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id t186so34134289pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YwIyUTciGeIiaIBZQVWXjaYnnIOHcmPQ9Rej5qwjlco=;
	b=nVlLGiFvonKMN0KUVTNomia0LrkD4cbYiiciWImx+asrJhWY2DgeG9yXu3wZ4YoWm3
	Q9dpofk24VKD7PXQHvKf579o2bicNBH8YbGWlcjlBYQF2NxLHGHyACO4l30xs70Od/pA
	XeCXulG79fw/MW/sEhR7aZbX2IpULVSg+7GhuXoEZWHyhR2PrFunlv8rOEivxgeqqTZ7
	wxBE2kxJwx5BpPsUI2DE4Jyoa+9ZtT8IKPClizkSuIPM8se6x5X/r+MrdfzJo2cXFifZ
	emOCieehLRYX00XVa0XY80e1UJ6RdpOMi6nThqE2dThUNGRNFInQczfY2RUNIRrivyZe
	DPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YwIyUTciGeIiaIBZQVWXjaYnnIOHcmPQ9Rej5qwjlco=;
	b=fXKMry6mhTnlev6OCxt/BZq5RjA2QDDuCuWkk/mfNZ9uGc+kJ93KD5810C3PSTsqGv
	qn5ccst1wzuyr0YW/eLRuGZmyjFQoML0Nbl9fePKIQenea0mOpN2d/cKQ38h2JOoiFgR
	uZ1u7Qx0QEs+HQwXkXr4KHokaXM/8FoqUR9ciEHiTHtDzGKDSpMT0cqeN9JrXVgU9DLt
	53oeuUECcX/Cpj77GIi/uF3ou4D+i1gIZyDe92TtJCFHdP+TLmvNw4K7YqnFuRgcKByv
	zQmBTV2BkBFqPieZzSHsgXoOVv2JTw6Npdbwqt7E7V9VGaFSK6DPej2bWAKNb5PXmBdm
	R2Ew==
X-Gm-Message-State: AKS2vOzYNl4ND+Un6OhqGpYSFPRUhyUObGPvmxSQifQ/atMiyjtG6D3l
	G1iDn3nsfC+k5Nqk
X-Received: by 10.84.198.129 with SMTP id p1mr12571706pld.120.1498665883910;
	Wed, 28 Jun 2017 09:04:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:18 -0700
Message-Id: <ae6dfc9b2ebd6b243848a35d68b6a6767e01522d.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 05/10] gcc: Link libssp_nonshared.a only on musl targets
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:43 -0000

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


