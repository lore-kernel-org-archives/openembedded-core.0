Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4A22776F58
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:33 +0000 (UTC)
Received: by qgx61 with SMTP id 61so119655723qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=heCORbury71/73D/dbZLdeIaedTpvbaYgajB6aT0XaY=;
	b=bAVvPQohDoZ7KruuwbXa6FPEe133gKhFrq+fbAmfx4UgIGbrhtpTjvDAoZhyhgujSg
	Kr1utftug82RqBitiQ+p4oqgNVkk4GNBbWl04qjqKU4V3xzSWQpAdpC6MywAv/Fc8k1b
	8u53b8RKhrc75yOnhJKE/0SHjdUpa0YC9wBsqiNVgLI3cS4iy00ey/gtN73cCpBlFD9y
	ICP9DAMy7waTIrsYB5hVMp40axyLm4wucOcbA65e/LBFSVg0o6X0nFTrhfQ0EwR2O8aA
	mLh895EfH8/7Us/lUFlHgSAfa9CBhVleq1owhKdJbFcFsb3ri5mENGI9MDhYCbeMHdP/
	O7TQ==
X-Received: by 10.140.234.151 with SMTP id f145mr24961994qhc.26.1442248294200; 
	Mon, 14 Sep 2015 09:31:34 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:21 +0000
Message-Id: <425a5e9c9f0e96a5dc7929c1be48ca8477ae915d.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 06/12] gnu-efi, syslinux: Support gcc < 4.7
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:34 -0000

This helps compiling the code with older gcc especially on older build
hosts, additionally clang advertizes itself as gcc 4.2.1 so it helps
compiling dependent modues using clang as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnu-efi/gnu-efi/gcc46-compatibility.patch      | 21 ++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb          |  1 +
 .../syslinux/0010-gcc46-compatibility.patch        | 37 ++++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.03.bb    |  1 +
 4 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
new file mode 100644
index 0000000..0ce6d7b
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
@@ -0,0 +1,21 @@
+don't break with old compilers and -DGNU_EFI_USE_MS_ABI
+It's entirely legitimate to request GNU_EFI_USE_MS_ABI even if the current
+compiler doesn't support it, and gnu-efi should transparently fall back to
+using legacy techniques to set the calling convention.  We don't get type
+checking, but at least it will still compile.
+
+Author: Steve Langasek <steve.langasek@ubuntu.com>
+Upstream-Status: Pending
+Index: gnu-efi-3.0.3/inc/x86_64/efibind.h
+===================================================================
+--- gnu-efi-3.0.3.orig/inc/x86_64/efibind.h
++++ gnu-efi-3.0.3/inc/x86_64/efibind.h
+@@ -25,8 +25,6 @@ Revision History
+ #if defined(GNU_EFI_USE_MS_ABI)
+     #if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7))
+         #define HAVE_USE_MS_ABI 1
+-    #else
+-        #error Compiler is too old for GNU_EFI_USE_MS_ABI
+     #endif
+ #endif
+ 
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
index 1a1ba40..eca3459 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
            file://gnu-efi-Make-setjmp.S-portable-to-ARM.patch \
+           file://gcc46-compatibility.patch \
           "
 
 SRC_URI[md5sum] = "15a4bcbc18a9a5e8110ed955970622e6"
diff --git a/meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch b/meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch
new file mode 100644
index 0000000..6279258
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch
@@ -0,0 +1,37 @@
+don't break with old compilers and -DGNU_EFI_USE_MS_ABI
+It's entirely legitimate to request GNU_EFI_USE_MS_ABI even if the current
+compiler doesn't support it, and gnu-efi should transparently fall back to
+using legacy techniques to set the calling convention.  We don't get type
+checking, but at least it will still compile.
+
+Adapted from gnu-efi
+
+Author: Steve Langasek <steve.langasek@ubuntu.com>
+Upstream-Status: Pending
+
+Index: syslinux-6.03/efi64/include/efi/x86_64/efibind.h
+===================================================================
+--- syslinux-6.03.orig/efi64/include/efi/x86_64/efibind.h
++++ syslinux-6.03/efi64/include/efi/x86_64/efibind.h
+@@ -25,8 +25,6 @@ Revision History
+ #if defined(GNU_EFI_USE_MS_ABI)
+     #if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7))
+         #define HAVE_USE_MS_ABI 1
+-    #else
+-        #error Compiler is too old for GNU_EFI_USE_MS_ABI
+     #endif
+ #endif
+ 
+Index: syslinux-6.03/gnu-efi/gnu-efi-3.0/inc/x86_64/efibind.h
+===================================================================
+--- syslinux-6.03.orig/gnu-efi/gnu-efi-3.0/inc/x86_64/efibind.h
++++ syslinux-6.03/gnu-efi/gnu-efi-3.0/inc/x86_64/efibind.h
+@@ -25,8 +25,6 @@ Revision History
+ #if defined(GNU_EFI_USE_MS_ABI)
+     #if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7))
+         #define HAVE_USE_MS_ABI 1
+-    #else
+-        #error Compiler is too old for GNU_EFI_USE_MS_ABI
+     #endif
+ #endif
+ 
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index ef9ae2f..94077da 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.xz \
            file://0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch \
            file://0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch \
            file://0009-linux-syslinux-implement-install_bootblock.patch \
+           file://0010-gcc46-compatibility.patch \
            "
 
 SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
-- 
2.5.2


