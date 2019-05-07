Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDA47D076
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0PM5j59z5l
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234711;
	bh=jNOfCKPCoZdNcAjrTKMKmCn//Tnjh7Cc7R3gvrBY+ew=;
	h=From:To:Subject:Date:From;
	b=XoF2UqQR2LMb5w4LM0NSvZlslnTYSm7mqZUFSpQq+i0tK6MAG4t+b3y3KwwtXy23w
	us1zCG7qunJ/YdrfUHOCYjNPahUCa3H/YThg9F4KV1y/RxZ2WmS4f9ivc6kvFBtGNP
	ckwFCPxXiMMwq6zo7aID8KLAs154sq6VhCJh7G1m8x2e6l+lxzEwbKxJZ4+DPwQEj2
	7F2broNtXQz82z6iZOMz3Orh0sPiveerUvPNYWai+6MkkiijYcI95yPj3LU54Gdx7P
	Zja9D9T/lu0B+7ZZ8ScCjrPcE3uTyuFQthnuwnGrZxJOEMHLg4kbK1D1PuXYMa+sXS
	DF6GmpKUuLDmD6Zl2M1lCga99x5l/UVC5u4524+8cADErfeOZZOFyLh69i1DQt3Tbp
	BhUts7JaU3PIq6wdZ2XiA+YjER3X7ix8aTpm/ajRqUqlAHgSpmuildglQQvtNRa3+P
	KEKFQswq8egsc8NvrKs/kVAQJYRm2DkOL0FyoOeakEdlD6FkWdynYALxP+DJPJ8XY/
	zRn1IUku5jUdCgVc3g5bxVxGsRxA1ygI+wMAKiesikkrMs2aYLBsM0YounvpiCa4Ah
	dppJlOVHCB/5uNdwjNP5QI1kcG0imgvaUJnKNa1fDO7wneW9ke0PTLe7xoueDoZBPW
	Rrv9GX8/mPNsqgAoPiku55d0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:11:40 +0300
Message-Id: <20190507131151.31070-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gnu-efi: Remove support patch for gcc < 4.7
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
X-List-Received-Date: Tue, 07 May 2019 13:11:51 -0000

No host platform that is still supported uses such an old gcc.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnu-efi/gnu-efi/gcc46-compatibility.patch | 35 -------------------
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb     |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
deleted file mode 100644
index 69efd34e24..0000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8d16ae374c5d4d9fac45c002605a66cfb8c08be5 Mon Sep 17 00:00:00 2001
-From: Steve Langasek <steve.langasek@ubuntu.com>
-Date: Wed, 9 Sep 2015 08:26:06 +0000
-Subject: [PATCH 3/3] gnu-efi, syslinux: Support gcc < 4.7
-
-don't break with old compilers and -DGNU_EFI_USE_MS_ABI
-It's entirely legitimate to request GNU_EFI_USE_MS_ABI even if the current
-compiler doesn't support it, and gnu-efi should transparently fall back to
-using legacy techniques to set the calling convention.  We don't get type
-checking, but at least it will still compile.
-
-Author: Steve Langasek <steve.langasek@ubuntu.com>
-Upstream-Status: Pending
-[Rebased for 3.0.6]
-Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
----
- inc/x86_64/efibind.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/inc/x86_64/efibind.h b/inc/x86_64/efibind.h
-index 4309f9f..02c0af1 100644
---- a/inc/x86_64/efibind.h
-+++ b/inc/x86_64/efibind.h
-@@ -25,8 +25,6 @@ Revision History
- #if defined(GNU_EFI_USE_MS_ABI)
-     #if (defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7)))||(defined(__clang__) && (__clang_major__ > 3 || (__clang_major__ == 3 && __clang_minor__ >= 2)))
-         #define HAVE_USE_MS_ABI 1
--    #else
--        #error Compiler is too old for GNU_EFI_USE_MS_ABI
-     #endif
- #endif
- 
--- 
-2.9.4
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
index 0667191fbe..f844435472 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
-           file://gcc46-compatibility.patch \
            "
 
 SRC_URI[md5sum] = "32af17b917545a693e549af2439c4a99"
-- 
2.17.1


