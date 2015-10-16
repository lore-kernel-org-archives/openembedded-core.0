Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1AE77145
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:07 +0000 (UTC)
Received: by payp3 with SMTP id p3so65987270pay.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LMtL13b/M3d7EYOrRMOAlcdbiVb9u6Xrlj3T4N/fV/A=;
	b=FEEV7qy2e5HbsPdenc2e4E0y/0TPMdOHRR6drMGuKgP4P7g+nJAgSZJopQuMJIZ7Az
	Msttns5RdrnKdD3iQ0kmMNwJFOWlyZ11SMRJKrfPfGavalQGD+BeRIsOM58K3hokCl58
	x2nqDG6+JnVmtr+/87h3AtBxDeDohrqsP+zv01RfSg6HqCeVQF0uTxgngkYQSWaXJ0OZ
	CAWoBCy76qTAuNUaOOHyTde4ax+J6J1iUOigp9TbHE+TqCO83IyG1HubGKkgYF8+Xk4S
	8kKmKRKF+m3zOEW+0sDlfmFuSiOpFG+idj/5pxCXUhP2KW068emPUTSF9XCa0TbNNCwt
	jjdA==
X-Received: by 10.68.247.106 with SMTP id yd10mr14913723pbc.105.1444982407605; 
	Fri, 16 Oct 2015 01:00:07 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 00:59:57 -0700
Message-Id: <c560fb3190e685abd118ce818aa906e0c00002ce.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 3/9] uclibc: Fix build with gcc5
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:08 -0000

An agressive optimization in gcc5 meant that we get linking errors
with uclibc build, this patch fixes the issue by letting gcc know
that these funcitons are used.

Change-Id: I8ecf3999a0855b3bbf4bc2df576be5351f9be5b0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 ...zes-away-the-write-only-static-functions-.patch | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 14a577f..9e3d644 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -16,5 +16,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
         file://0005-Always-use-O2-for-compiling-fork.c.patch \
         file://0006-ldso-limited-support-for-ORIGIN-in-rpath.patch \
         file://0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
+        file://0001-gcc5-optimizes-away-the-write-only-static-functions-.patch \
 "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch b/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
new file mode 100644
index 0000000..e622f87
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
@@ -0,0 +1,51 @@
+From 2659fb25d32f4b29c1c96aa5730fe40e19d53ab0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Oct 2015 17:38:37 -0700
+Subject: [PATCH] gcc5 optimizes away the write only static functions and we
+ end up with
+
+  librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
+  rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
+  collect2: error: ld returned 1 exit status
+  make[2]: *** [lib/librt.so] Error 1
+
+marking these functions explicitly used with __attribute_used__ avoids
+that optimization.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c | 2 +-
+ libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
+index f4d6f41..0c2edd7 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
+@@ -27,7 +27,7 @@
+ #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
+ 
+ static void *libgcc_s_handle;
+-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc) __attribute_used__;
+ static _Unwind_Reason_Code (*libgcc_s_personality)
+   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
+ static _Unwind_Reason_Code (*libgcc_s_forcedunwind)
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
+index f9a4ffb..f0c3047 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
+@@ -25,7 +25,7 @@
+ #define __libc_dlclose          dlclose
+ #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
+ 
+-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc) __attribute_used__;
+ static _Unwind_Reason_Code (*libgcc_s_personality)
+   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
+ 
+-- 
+2.6.1
+
-- 
2.6.1


