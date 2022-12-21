Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C377C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.25617.1671645360958282586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aLoM+QDI;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id s7so16266604plk.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7EUekXTWDoZ/WyTpbzFdtWbqhmEX26nmHtXoZ1beq8=;
        b=aLoM+QDIwBtbl/smNWKZR1tf3qdc6viBYxLKG42lH1qqyNxAVCLlyJ1H/0ell+wkrI
         /hs5q9ELDFcwsxcqkNQ1GkKPDChn4cvHAIlSAksM7bXls+P+FcQnC4yHpK8UiCSJtYpW
         1dqDiHIAHSOUln84SMdVUi9kbKve7k/fPNKmlggzTT4M3sY3/DlM7p+eSofBayjHiBW4
         p/LfrbUFuJALhR6Cwb/mxF4cipJqGUX78BadvIwQciEELx1W472IBqASvyR/ROY9dc58
         3/+6UzWfzShtJshAkqMHCIzTFMWBAgQxO5g63V5Jg8LsVU8qW7VzyGdnriIY/aooZNDd
         mVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7EUekXTWDoZ/WyTpbzFdtWbqhmEX26nmHtXoZ1beq8=;
        b=ucbzULdojIs2WD2tif4Y855f75SwHOgWiLguGH4qabjdzle/aPxlFFz9as/W/bbMDL
         i58IhPOset/dAuxA9IVCdRn9jvE16w9RgI4iCjnQwVoHdxeZY8h/8eXoGgG8I9aYaqUV
         4NZjoRCUIBuP3a3MnrBxT2rj/mTrxjCJgMCRIiZid5wN0vpGZwBFCXNSGPDd3T1f3vfs
         npx/L32dZa5hFCdTi+3AL5g2ILYA/Q8JYTm4o6YRyzblpY9OI2CFJhUtyj93LjMRdm7t
         10uTYgT45n3DKfrowFR5rOwJycs0H9MJHlQekgqpTj/iyGNYwFjvsD8dLlTK7qxW8g9D
         R8Bw==
X-Gm-Message-State: AFqh2kr1+i7JloquVyn70Mje7bijkZ+zWgYfULtGkBXZ2ucWezOdgBpr
	sJmgXfX4onXHmcAG6aS09YMeGHgyvvA=
X-Google-Smtp-Source: AMrXdXsRWyidMRY7gHPcoS61EEzs44Gawu8Bl5IOW1h/hFi6GxJsEwBGeJ6iD+QSTBiGREkjnpJZvw==
X-Received: by 2002:a17:90b:2786:b0:221:7043:74c4 with SMTP id pw6-20020a17090b278600b00221704374c4mr2997814pjb.13.1671645360196;
        Wed, 21 Dec 2022 09:56:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 8/9] numactl: Enable largefile support
Date: Wed, 21 Dec 2022 09:55:50 -0800
Message-Id: <20221221175551.1940464-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174933

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onfigure-Check-for-largefile-support.patch | 27 ++++++++
 ...at64-fstat64-ftruncate64mmap64-with-.patch | 64 +++++++++++++++++++
 meta/recipes-support/numactl/numactl_git.bb   |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
 create mode 100644 meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch

diff --git a/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch b/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
new file mode 100644
index 0000000000..152eb2807b
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl/0001-configure-Check-for-largefile-support.patch
@@ -0,0 +1,27 @@
+From 61f910f5d12d6f6a66223b5af6d74e30ace3a2e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 12:10:37 -0800
+Subject: [PATCH] configure: Check for largefile support
+
+This helps in using 64bit versions of off_t related functions
+
+Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8510fc5..d74bc6e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,9 @@ LT_INIT
+ 
+ AC_PROG_CC
+ 
++# Check for enabling LFS support
++AC_SYS_LARGEFILE
++
+ # Override CFLAGS so that we can specify custom CFLAGS for numademo.
+ AX_AM_OVERRIDE_VAR([CFLAGS])
+ 
diff --git a/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch b/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
new file mode 100644
index 0000000000..03b98e0a2c
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl/0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch
@@ -0,0 +1,64 @@
+From 8a08d3583d77bebeb1763fb9b378899201ce5afa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 12:11:13 -0800
+Subject: [PATCH] shm.c: Replace stat64/fstat64/ftruncate64mmap64 with normal functions
+
+These functions were needed when _FILE_OFFSET_BITS was not 64, using
+AC_SYS_LARGEFILE will detect it correctly and make the normal variants
+of these functions behave same as their *64 counterparts.
+
+Upstream-Status: Backport [https://github.com/numactl/numactl/pull/159]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ shm.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/shm.c b/shm.c
+index 20537d9..5d0d1ab 100644
+--- a/shm.c
++++ b/shm.c
+@@ -24,8 +24,8 @@
+ #include <sys/mman.h>
+ #include <sys/ipc.h>
+ #include <sys/shm.h>
+-#include <sys/fcntl.h>
+ #include <sys/stat.h>
++#include <fcntl.h>
+ #include <stdarg.h>
+ #include <errno.h>
+ #include <unistd.h>
+@@ -135,7 +135,7 @@ void attach_sysvshm(char *name, char *opt)
+ /* Attach a shared memory file. */
+ void attach_shared(char *name, char *opt)
+ {
+-	struct stat64 st;
++	struct stat st;
+ 
+ 	shmfd = open(name, O_RDWR);
+ 	if (shmfd < 0) {
+@@ -146,14 +146,14 @@ void attach_shared(char *name, char *opt)
+ 		if (shmfd < 0)
+ 			nerror("cannot create file %s", name);
+ 	}
+-	if (fstat64(shmfd, &st) < 0)
++	if (fstat(shmfd, &st) < 0)
+ 		err("shm stat");
+ 	/* the file size must be larger than mmap shmlen + shmoffset, otherwise SIGBUS
+ 	 * will be caused when we access memory, because mmaped memory is no longer in
+ 	 * the range of the file laster.
+ 	 */
+ 	if ((shmlen + shmoffset) > st.st_size) {
+-		if (ftruncate64(shmfd, shmlen + shmoffset) < 0) {
++		if (ftruncate(shmfd, shmlen + shmoffset) < 0) {
+ 			/* XXX: we could do it by hand, but it would it
+ 			   would be impossible to apply policy then.
+ 			   need to fix that in the kernel. */
+@@ -168,7 +168,7 @@ void attach_shared(char *name, char *opt)
+ 
+ 	/* RED-PEN For shmlen > address space may need to map in pieces.
+ 	   Left for some poor 32bit soul. */
+-	shmptr = mmap64(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
++	shmptr = mmap(NULL, shmlen, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, shmoffset);
+ 	if (shmptr == (char*)-1)
+ 		err("shm mmap");
+ }
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 23be0a3b4f..0f71258bc3 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -18,6 +18,8 @@ SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Makefile \
            file://run-ptest \
            file://0001-define-run-test-target.patch \
+           file://0001-configure-Check-for-largefile-support.patch \
+           file://0002-shm.c-Replace-stat64-fstat64-ftruncate64mmap64-with-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.39.0


