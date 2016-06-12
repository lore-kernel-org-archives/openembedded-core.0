Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 531B36FFD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8PLpG021207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:09 -0700
Message-ID: <4f1364dec6b9be5b84991ed3811d4ce0172087ae.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] gnu-efi: 3.0.3 -> 3.0.4
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:20 -0000
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

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnu-efi-Make-setjmp.S-portable-to-ARM.patch    | 50 ----------------------
 .../gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} | 17 +++-----
 2 files changed, 7 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} (60%)

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
similarity index 60%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
index 6b130a2..6a4acfb 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
@@ -2,27 +2,24 @@ SUMMARY = "Libraries for producing EFI binaries"
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
           "
 
-SRC_URI[md5sum] = "15a4bcbc18a9a5e8110ed955970622e6"
-SRC_URI[sha256sum] = "c530f21a15fd9c214dd92d29a6caa20fac989289267512020b6da1f5e6f5b4cb"
+SRC_URI[md5sum] = "612e0f327f31c4b8468ef55f4eeb9649"
+SRC_URI[sha256sum] = "51a00428c3ccb96db24089ed8394843c4f83cf8f42c6a4dfddb4b7c23f2bf8af"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.8.0


