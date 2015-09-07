Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4A6763F8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 02:19:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t872JrwM028079
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Sep 2015 19:19:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 6 Sep 2015 19:19:53 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Sep 2015 22:19:51 -0400
Message-ID: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gnu-efi: Make setjmp.S portable to ARM
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
X-List-Received-Date: Mon, 07 Sep 2015 02:19:54 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This patch fixes the following error:

  .../lib/arm/setjmp.S:18: Error: unrecognized symbol type ""
  .../lib/arm/setjmp.S:26: Error: unrecognized symbol type ""

The problem is the assembly syntax that is used is not portable to ARM,
where the '@' symbol is a comment:

  > Note on targets where the @ character is the start of a comment
  > (eg ARM) then another character is used instead. For example the
  > ARM port uses the % character.

(From https://sourceware.org/binutils/docs-2.25/as/Section.html#Section)

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../gnu-efi-Make-setjmp.S-portable-to-ARM.patch    | 50 ++++++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb          |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
new file mode 100644
index 0000000..ced128a
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
@@ -0,0 +1,50 @@
+From 8a356d4b6a242ce63b73920d3ed33f88f9e12fe3 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Sun, 6 Sep 2015 05:20:43 -0400
+Subject: [PATCH] gnu-efi: Make setjmp.S portable to ARM
+
+This patch fixes the following error:
+
+  .../lib/arm/setjmp.S:18: Error: unrecognized symbol type ""
+  .../lib/arm/setjmp.S:26: Error: unrecognized symbol type ""
+
+The problem is the assembly syntax that is used is not portable to ARM,
+where the '@' symbol is a comment:
+
+  > Note on targets where the @ character is the start of a comment
+  > (eg ARM) then another character is used instead. For example the
+  > ARM port uses the % character.
+
+(From https://sourceware.org/binutils/docs-2.25/as/Section.html#Section)
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ lib/arm/setjmp.S | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/arm/setjmp.S b/lib/arm/setjmp.S
+index 6e3fbf0..85c8705 100644
+--- a/lib/arm/setjmp.S
++++ b/lib/arm/setjmp.S
+@@ -15,7 +15,7 @@ BASIS,
+ 	.text
+ 	.arm
+ 	.globl	setjmp
+-	.type	setjmp, @function
++	.type	setjmp, %function
+ setjmp:
+ 	mov	r3, r13
+ 	stmia	r0, {r3-r12,r14}
+@@ -23,6 +23,6 @@ setjmp:
+ 	bx	lr
+ 
+ 	.globl	longjmp
+-	.type	longjmp, @function
++	.type	longjmp, %function
+ longjmp:
+ 	ldmia	r0, {r3-r12,r14}
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
index 8cc22ca..1a1ba40 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=9;md5=2240d
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
+           file://gnu-efi-Make-setjmp.S-portable-to-ARM.patch \
           "
 
 SRC_URI[md5sum] = "15a4bcbc18a9a5e8110ed955970622e6"
-- 
1.9.1


