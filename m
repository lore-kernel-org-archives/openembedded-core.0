Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51FBE606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 13:44:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6JDiIOc025616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 06:44:25 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 06:44:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 06:44:03 -0700
Message-ID: <faf8243132248efb16ac8c23479b8f1275692020.1468935802.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468935802.git.liezhi.yang@windriver.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] gnu-efi: 3.0.3 -> 3.0.4
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
X-List-Received-Date: Tue, 19 Jul 2016 13:44:25 -0000
Content-Type: text/plain

* Remove gnu-efi-Make-setjmp.S-portable-to-ARM.patch since it is already
  in the source.

* Updated LIC_FILES_CHKSUM
  - The following files are gone:
    lib/arm/div64.S
    lib/arm/lib1funcs.S
  - Updated md5sum for other files, they add the following words, which are
    still GPLv2+:
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    1. Redistributions of source code must retain the above copyright
       notice and this list of conditions, without modification.
    2. The name of the author may not be used to endorse or promote products
       derived from this software without specific prior written permission.

    Alternatively, this software may be distributed under the terms of the
    GNU General Public License as published by the Free Software Foundation;
    either version 2 of the License, or (at your option) any later version.

* Remove -mfpmath=sse from TUNE_CCARGS since gnu-efi doesn't support sse to fix the
  problem:
  rtdata.c:1:0: error: SSE instruction set disabled, using 387 arithmetics [-Werror]

* gnu-efi's Makefile treats prefix as toolchain prefix, so don't export it,
  otherwise there would be errors:
  /bin/sh: /usrgcc: No such file or directory

* Add aarch64-initplat.c-fix-const-qualifier.patch to fix build on aarch64:
  initplat.c:44:35: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../aarch64-initplat.c-fix-const-qualifier.patch   | 35 +++++++++++++++
 .../gnu-efi-Make-setjmp.S-portable-to-ARM.patch    | 50 ----------------------
 .../gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} | 27 +++++++-----
 3 files changed, 52 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} (59%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
new file mode 100644
index 0000000..965f074
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
@@ -0,0 +1,35 @@
+From dc83b84dc8b4e71efce47143497aac6c126065cf Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 18 Jul 2016 08:40:29 -0700
+Subject: [PATCH] lib/aarch64/initplat.c: fix const qualifier
+
+Fixed:
+initplat.c:44:35: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+     unsigned char *p = dest, *q = src;
+                                   ^~~
+cc1: all warnings being treated as errors
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/aarch64/initplat.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/aarch64/initplat.c b/lib/aarch64/initplat.c
+index 2ac03a7..aae7beb 100644
+--- a/lib/aarch64/initplat.c
++++ b/lib/aarch64/initplat.c
+@@ -41,7 +41,8 @@ void *memset(void *s, int c, __SIZE_TYPE__ n)
+ 
+ void *memcpy(void *dest, const void *src, __SIZE_TYPE__ n)
+ {
+-    unsigned char *p = dest, *q = src;
++    unsigned char *p = dest;
++    const unsigned char *q = src;
+ 
+     while (n--)
+         *p++ = *q++;
+-- 
+2.9.0
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
deleted file mode 100644
index ced128a..0000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 8a356d4b6a242ce63b73920d3ed33f88f9e12fe3 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Sun, 6 Sep 2015 05:20:43 -0400
-Subject: [PATCH] gnu-efi: Make setjmp.S portable to ARM
-
-This patch fixes the following error:
-
-  .../lib/arm/setjmp.S:18: Error: unrecognized symbol type ""
-  .../lib/arm/setjmp.S:26: Error: unrecognized symbol type ""
-
-The problem is the assembly syntax that is used is not portable to ARM,
-where the '@' symbol is a comment:
-
-  > Note on targets where the @ character is the start of a comment
-  > (eg ARM) then another character is used instead. For example the
-  > ARM port uses the % character.
-
-(From https://sourceware.org/binutils/docs-2.25/as/Section.html#Section)
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- lib/arm/setjmp.S | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/arm/setjmp.S b/lib/arm/setjmp.S
-index 6e3fbf0..85c8705 100644
---- a/lib/arm/setjmp.S
-+++ b/lib/arm/setjmp.S
-@@ -15,7 +15,7 @@ BASIS,
- 	.text
- 	.arm
- 	.globl	setjmp
--	.type	setjmp, @function
-+	.type	setjmp, %function
- setjmp:
- 	mov	r3, r13
- 	stmia	r0, {r3-r12,r14}
-@@ -23,6 +23,6 @@ setjmp:
- 	bx	lr
- 
- 	.globl	longjmp
--	.type	longjmp, @function
-+	.type	longjmp, %function
- longjmp:
- 	ldmia	r0, {r3-r12,r14}
--- 
-1.9.1
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
similarity index 59%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
index 6b130a2..e0d8ee7 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
@@ -2,27 +2,25 @@ SUMMARY = "Libraries for producing EFI binaries"
 HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
 SECTION = "devel"
 LICENSE = "GPLv2+ | BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=9;md5=2240d7bbdf0928294c2f4a68b14d6591 \
+LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
                     file://gnuefi/crt0-efi-aarch64.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
                     file://inc/efishellintf.h;beginline=13;endline=20;md5=202766b79d708eff3cc70fce15fb80c7 \
                     file://inc/efishellparm.h;beginline=4;endline=11;md5=468b1231b05bbc84bae3a0d5774e3bb5 \
-                    file://lib/arm/div64.S;beginline=6;endline=12;md5=a96c84f5ad12b4f011f98b5d039242f2 \
-                    file://lib/arm/math.c;beginline=4;endline=10;md5=64dd1987cee1dcf59d11aa572cfa644e \
-                    file://lib/arm/initplat.c;beginline=4;endline=10;md5=64dd1987cee1dcf59d11aa572cfa644e \
-                    file://lib/arm/lib1funcs.S;beginline=9;endline=33;md5=f56d5ebbc87136bc66cfe24db82bcf01 \
-                    file://lib/aarch64/math.c;beginline=9;endline=33;md5=cfade4c560e033a7bb02dab282872c7d \
-                    file://lib/aarch64/initplat.c;beginline=9;endline=33;md5=900cb1ffbe3e1ded344102be921830f1 \
+                    file://lib/arm/math.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
+                    file://lib/arm/initplat.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
+                    file://lib/aarch64/math.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
+                    file://lib/aarch64/initplat.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
                    "
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
-           file://gnu-efi-Make-setjmp.S-portable-to-ARM.patch \
            file://gcc46-compatibility.patch \
+           file://aarch64-initplat.c-fix-const-qualifier.patch \
           "
 
-SRC_URI[md5sum] = "15a4bcbc18a9a5e8110ed955970622e6"
-SRC_URI[sha256sum] = "c530f21a15fd9c214dd92d29a6caa20fac989289267512020b6da1f5e6f5b4cb"
+SRC_URI[md5sum] = "612e0f327f31c4b8468ef55f4eeb9649"
+SRC_URI[sha256sum] = "51a00428c3ccb96db24089ed8394843c4f83cf8f42c6a4dfddb4b7c23f2bf8af"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
@@ -38,6 +36,10 @@ EXTRA_OEMAKE = "'ARCH=${@gnu_efi_arch(d)}' 'CC=${CC}' 'AS=${AS}' 'LD=${LD}' 'AR=
                 'RANLIB=${RANLIB}' 'OBJCOPY=${OBJCOPY}' 'PREFIX=${prefix}' 'LIBDIR=${libdir}' \
                 "
 
+# gnu-efi's Makefile treats prefix as toolchain prefix, so don't
+# export it.
+prefix[unexport] = "1"
+
 do_install() {
         oe_runmake install INSTALLROOT="${D}"
 }
@@ -45,3 +47,8 @@ do_install() {
 FILES_${PN} += "${libdir}/*.lds"
 
 BBCLASSEXTEND = "native"
+
+# It doesn't support sse, its make.defaults sets:
+# CFLAGS += -mno-mmx -mno-sse
+# So also remove -mfpmath=sse from TUNE_CCARGS
+TUNE_CCARGS_remove = "-mfpmath=sse"
-- 
2.9.0


