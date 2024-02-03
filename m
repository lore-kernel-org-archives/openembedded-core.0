Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35142C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 07:56:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.13492.1706946987544505414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 23:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K/ylp7bk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-339289fead2so1785414f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 23:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706946986; x=1707551786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxuGR4YIHCUMgsM2wwh4AyquSx95DHDrA3peEjDGR2w=;
        b=K/ylp7bkOc3Mf5DLBkUE5PCynhB9SMzLse9KOEFXc4Tzlij/0hjPdB8pGv7bN/AaMu
         hH+LKS/EiHT9fIKho/6LCmDQAEDlhb72T1J3RqLisohYM1OHsf009mD2xEGumekPlTHb
         iGnEJxdg3kH/+MpfwF7p+kuclbRycQg03EFTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706946986; x=1707551786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxuGR4YIHCUMgsM2wwh4AyquSx95DHDrA3peEjDGR2w=;
        b=K5Y/t7tGjxXxO8bhz3H1AEFkRrfm7vsIgr/ERJ32B7gHwBD9cQvi5Mbo921Qe3oUUE
         +1W6bHOLwS5dkBXZAtWV7wtiRkPBeiiBwPEVY63ONRUcFyWHZdr/JHzNK7uuB9V2LqTe
         YH1OU1QBUJ1MV9zdKimmDvch3RpDluKJbRkTD8Ocr6MWfo+5vf4ra9qa7YeJd1AnGLC0
         CrQkfKcIXMmBXKbcDHsXnIpmlkFnu8JfUGA7ZTpkBe6KZJ7PhzQDI1VH86rQedIj9pJW
         uUEsYFk1YunpeDGVL0GR0GMjBvQSwL0IcwjxtFshl0rJ88khM8b2tFn8kavQ4sGCDbl9
         /DuA==
X-Gm-Message-State: AOJu0Yzal+uC03M/gjGOjqj1JRwy7v0erK0ZmaVLXLPl8MexsfVCHcSS
	eIr4py5CJgiCn4xuRpK6DVupwZMrtX1QpAYQol+pdQyX8Olu/ntNPxNympf7GiQwX079iAqmIEe
	l
X-Google-Smtp-Source: AGHT+IGdBlP9t1eXpkAPzYTAZ+VeBRyo4+b3vbHeceenRUORbuLtJu9tkwZk72eonoGwLkTTE6uMKQ==
X-Received: by 2002:adf:cf11:0:b0:33b:150a:858 with SMTP id o17-20020adfcf11000000b0033b150a0858mr5722631wrj.5.1706946985771;
        Fri, 02 Feb 2024 23:56:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5be5:6aa5:96ae:21ea])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d40cf000000b0033aeb0afa8fsm3490195wrq.39.2024.02.02.23.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 23:56:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] numactl: upgrade 2.0.16 -> 2.0.17
Date: Sat,  3 Feb 2024 07:56:23 +0000
Message-Id: <20240203075623.2150849-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240203075623.2150849-1-richard.purdie@linuxfoundation.org>
References: <20240203075623.2150849-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 07:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194834

Drop two backported patches, refresh others.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...onfigure-Check-for-largefile-support.patch | 27 --------
 .../numactl/0001-define-run-test-target.patch |  7 +-
 ...at64-fstat64-ftruncate64mmap64-with-.patch | 64 -------------------
 .../numactl/Fix-the-test-output-format.patch  | 11 ++--
 meta/recipes-support/numactl/numactl_git.bb   |  6 +-
 5 files changed, 8 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
 delete mode 100644 meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch

diff --git a/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch b/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
deleted file mode 100644
index 152eb2807b3..00000000000
--- a/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 61f910f5d12d6f6a66223b5af6d74e30ace3a2e1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 12:10:37 -0800
-Subject: [PATCH] configure: Check for largefile support
-
-This helps in using 64bit versions of off_t related functions
-
-Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8510fc5..d74bc6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,6 +14,9 @@ LT_INIT
- 
- AC_PROG_CC
- 
-+# Check for enabling LFS support
-+AC_SYS_LARGEFILE
-+
- # Override CFLAGS so that we can specify custom CFLAGS for numademo.
- AX_AM_OVERRIDE_VAR([CFLAGS])
- 
diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
index 9e65a451338..185dcb3e2d3 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -13,10 +13,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index b6db339..de176c4 100644
+index e84b21e..94a8bff 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -124,7 +124,9 @@ regress2: $(check_PROGRAMS)
+@@ -126,7 +126,9 @@ regress2: $(check_PROGRAMS)
  test_numademo: numademo
  	./numademo -t -e 10M
  
@@ -27,6 +27,3 @@ index b6db339..de176c4 100644
  
  TESTS_ENVIRONMENT = builddir='$(builddir)'; export builddir;
  
--- 
-1.9.1
-
diff --git a/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch b/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
deleted file mode 100644
index 03b98e0a2c4..00000000000
--- a/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8a08d3583d77bebeb1763fb9b378899201ce5afa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 12:11:13 -0800
-Subject: [PATCH] shm.c: Replace stat64/fstat64/ftruncate64mmap64 with normal functions
-
-These functions were needed when _FILE_OFFSET_BITS was not 64, using
-AC_SYS_LARGEFILE will detect it correctly and make the normal variants
-of these functions behave same as their *64 counterparts.
-
-Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- shm.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/shm.c b/shm.c
-index 20537d9..5d0d1ab 100644
---- a/shm.c
-+++ b/shm.c
-@@ -24,8 +24,8 @@
- #include <sys/mman.h>
- #include <sys/ipc.h>
- #include <sys/shm.h>
--#include <sys/fcntl.h>
- #include <sys/stat.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <errno.h>
- #include <unistd.h>
-@@ -135,7 +135,7 @@ void attach_sysvshm(char *name, char *opt)
- /* Attach a shared memory file. */
- void attach_shared(char *name, char *opt)
- {
--	struct stat64 st;
-+	struct stat st;
- 
- 	shmfd = open(name, O_RDWR);
- 	if (shmfd < 0) {
-@@ -146,14 +146,14 @@ void attach_shared(char *name, char *opt)
- 		if (shmfd < 0)
- 			nerror("cannot create file %s", name);
- 	}
--	if (fstat64(shmfd, &st) < 0)
-+	if (fstat(shmfd, &st) < 0)
- 		err("shm stat");
- 	/* the file size must be larger than mmap shmlen + shmoffset, otherwise SIGBUS
- 	 * will be caused when we access memory, because mmaped memory is no longer in
- 	 * the range of the file laster.
- 	 */
- 	if ((shmlen + shmoffset) > st.st_size) {
--		if (ftruncate64(shmfd, shmlen + shmoffset) < 0) {
-+		if (ftruncate(shmfd, shmlen + shmoffset) < 0) {
- 			/* XXX: we could do it by hand, but it would it
- 			   would be impossible to apply policy then.
- 			   need to fix that in the kernel. */
-@@ -168,7 +168,7 @@ void attach_shared(char *name, char *opt)
- 
- 	/* RED-PEN For shmlen > address space may need to map in pieces.
- 	   Left for some poor 32bit soul. */
--	shmptr = mmap64(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
-+	shmptr = mmap(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
- 	if (shmptr == (char*)-1)
- 		err("shm mmap");
- }
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index a7bc8d322ee..00c4f9dfcbc 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -14,18 +14,18 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
  2 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/test/regress b/test/regress
-index 2ce1705..d086a47 100755
+index f06b22f..2fdfacb 100755
 --- a/test/regress
 +++ b/test/regress
-@@ -74,6 +74,7 @@ probe_hardware()
+@@ -78,6 +78,7 @@ probe_hardware()
  	if [ $numnodes -lt 2 ] ; then
  	    echo "need at least two nodes with at least $NEEDPAGES each of"
  	    echo "free memory for mempolicy regression tests"
 +	    echo "SKIP: numa regress"
-	    exit 77  # Skip test
+ 	    exit 77  # Skip test
  	fi
  }
-@@ -207,10 +208,9 @@ main()
+@@ -209,10 +210,9 @@ main()
  	rm A B
  
  	if [ "$EXIT" = 0 ] ; then
@@ -60,6 +60,3 @@ index aa6ea41..450c510 100755
  }
  
  # still broken
--- 
-1.8.4.2
-
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 0f71258bc36..bc5b09fc82e 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,16 +10,14 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "10285f1a1bad49306839b2c463936460b604e3ea"
-PV = "2.0.16"
+SRCREV = "c1165896572b74e971d817909bf652066ddf801a"
+PV = "2.0.17"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
            file://Makefile \
            file://run-ptest \
            file://0001-define-run-test-target.patch \
-           file://0001-configure-Check-for-largefile-support.patch \
-           file://0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.40.1


