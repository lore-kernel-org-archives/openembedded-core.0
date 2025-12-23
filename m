Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BB1E6F08A
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 12:29:03 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.99829.1766492943090770182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 04:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iURC3Qn6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb3801f7eso2668981f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 04:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1766492941; x=1767097741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1q7Z8l2t7EMOs1QjIlcIjJZnF0w9FrR/TEA4W3Mr5kc=;
        b=iURC3Qn6ie6xZj87Zw1DR7U0DCQGS1gwA1y0qUTCtB0d3di6C7BTLW7RP/gwRowvLd
         uubhRi1bgV8/5kC6fDYEMzhNTUOY8T3AztoCIT4jWmVHpp0zD/MUcKn7F3C9KTfKZQ5M
         xvdQ6tRzU7EifMEAoV9QEHXEIodLGrJIpMOgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766492941; x=1767097741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q7Z8l2t7EMOs1QjIlcIjJZnF0w9FrR/TEA4W3Mr5kc=;
        b=YMUzVc/ttzZs2wvRrikejMELNeKQ3+jzefyfCwsgt1JXVJKhT9UJ1LUx2+oci2I3Bc
         ySpmpicUIykH/+ti5/HHhUR6j5QvjIYjHoBDhyWzhiQxEEd08czUUHZRnZlJpN69lEvA
         vF0C7+vXxjb01/h4fwa+IJMSSIl2QPIEVjNtVRm+Pn8Yq9vEzwYtxvB4p7q5ns5cFrbH
         APxf5C8EhgbdQZL0PV3gCqX6eWPoyKQZ1cAGi2gUmziiC5dukJNtc09JOdhqs+gdcrVJ
         Td7XbQg2RNBTxMse37B7/RRRDi3YOkcz096eakURRk/lGkuySKFNWhkPgM9Kac/Z3niN
         q6og==
X-Gm-Message-State: AOJu0Yx2KX3Fdpj9Q115xm7A3CWG+/maQgEIydBuNgLRut4qWpv9882d
	KGnedr9N+NU2VdA2QCne3gMq5hWBHCp8TDkp5N2VFSMnbYIjkK6ocOofHVQBy3coIBnfm5tilfX
	FJgcepK0=
X-Gm-Gg: AY/fxX5aY1MzGXBaHDzlLQ2lOG/Yjdufw/4tC28s9NEUKbwNx9WPV5mOXt7nRyYEZri
	mFi4WdlRdVSdgJ5WqevG8J+bKgzKMrBKg33twnb0Yc9k3q1/tb1M0Z4YecIvX0fo9eO4fO025pL
	mQWYYFNdpMTrcuX6ob/kwnUcEKLR4JX62KiCUamByg9LlH70hYQXDGSwiS+A6djuRguQ+i6tsWI
	qtPfyZIxnEYR0LfFBe1kuRr/jAGQZjElAo7qEwCI8VwSzqtfjtNSBlZUj1kbekDA7nTojGm1BvR
	2jH0FXvPJM8P1jx12WsOR0uzKUA9mE1CgGUOpHoXxYtsUjTM8zEslbQtj+HQARFLJ7zntPmLOML
	HbVssAyQ1BVFgtk0Wb9WqtLox1PzZUSYghBZ9dhRZzxiS+eQQkO2Ycn9XZxWWTOu9bQR0Jxzx7Q
	8zf6q/enLD/ASjRsecKBRg/GmQksA+esmqVFiakDI=
X-Google-Smtp-Source: AGHT+IGGfryuOP+nkyPBWOdfAZZd49MYvOI9TK8cm2pvsgOoIkBLylQlNfraRHZ5XVtbkXGM9+k+AQ==
X-Received: by 2002:a05:6000:2089:b0:431:9b2:61c0 with SMTP id ffacd0b85a97d-4324e4c92b0mr16460337f8f.24.1766492940534;
        Tue, 23 Dec 2025 04:29:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fbe8:fa2e:dc4c:3e42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm27114311f8f.22.2025.12.23.04.28.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:28:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ltp: Backport fix for 6.18 kernels
Date: Tue, 23 Dec 2025 12:28:58 +0000
Message-ID: <20251223122859.1547252-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 12:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228465

Backport a patch to allow compiles with 6.18 kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...6ead3d6ef504c82551b12306e751d23ddb45.patch | 193 ++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20250930.bb     |   3 +-
 2 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch

diff --git a/meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch b/meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch
new file mode 100644
index 00000000000..1c06e254000
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch
@@ -0,0 +1,193 @@
+From 2d066ead3d6ef504c82551b12306e751d23ddb45 Mon Sep 17 00:00:00 2001
+From: Wei Gao <wegao@suse.com>
+Date: Sun, 14 Dec 2025 02:15:20 +0000
+Subject: [PATCH] listmount04.c: Update struct mnt_id_req support for kernel >= 6.18
+
+Kernel change from v6.18-rc7
+78f0e33cd6c93 ("fs/namespace: correctly handle errors returned by grab_requested_mnt_ns")
+causes the test failure with following error message:
+listmount04.c:128: TFAIL: invalid mnt_id_req.spare expected EINVAL: EBADF (9)
+
+The fix require following changes:
+
+* struct mnt_id_req got new member mnt_ns_fd in v6.18-rc7.  That is
+fixed in a fallback defintion in lapi/. If the fallback is used is now
+done via typedef (that requires also update in statmount.h).
+
+* New kernels (>= 6.18) have also different errno. This is fixed by
+runtime check.
+
+Link: https://lore.kernel.org/ltp/20251214021541.3256-1-wegao@suse.com/
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Li Wang <liwang@redhat.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Signed-off-by: Wei Gao <wegao@suse.com>
+[ pvorel: Shorten TCONF, rewrite commit message ]
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+---
+ configure.ac                                  |  2 +-
+ include/lapi/mount.h                          | 10 +++--
+ .../kernel/syscalls/listmount/listmount.h     |  2 +-
+ .../kernel/syscalls/listmount/listmount04.c   | 37 +++++++++++++++++--
+ .../kernel/syscalls/statmount/statmount.h     |  2 +-
+ 5 files changed, 44 insertions(+), 9 deletions(-)
+
+Upstream-Status: Backport
+
+Index: ltp-20250930/configure.ac
+===================================================================
+--- ltp-20250930.orig/configure.ac
++++ ltp-20250930/configure.ac
+@@ -262,7 +262,7 @@ AC_CHECK_TYPES([struct cachestat_range],
+ AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
+ 
+ # Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/mount.h> */
+-AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
++AC_CHECK_MEMBERS([struct mnt_id_req.mnt_ns_fd],,,[#include <sys/mount.h>])
+ AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
+ AC_CHECK_MEMBERS([struct statmount.mnt_ns_id],,,[#include <unistd.h>
+ #include <linux/mount.h>])
+Index: ltp-20250930/include/lapi/mount.h
+===================================================================
+--- ltp-20250930.orig/include/lapi/mount.h
++++ ltp-20250930/include/lapi/mount.h
+@@ -45,14 +45,18 @@
+ # define MS_NOSYMFOLLOW 256
+ #endif
+ 
+-#ifndef HAVE_STRUCT_MNT_ID_REQ
+-struct mnt_id_req {
++struct mnt_id_req_fallback {
+ 	uint32_t size;
+-	uint32_t spare;
++	uint32_t mnt_ns_fd;
+ 	uint64_t mnt_id;
+ 	uint64_t param;
+ 	uint64_t mnt_ns_id;
+ };
++
++#ifndef HAVE_STRUCT_MNT_ID_REQ_MNT_NS_FD
++typedef struct mnt_id_req_fallback mnt_id_req;
++#else
++typedef struct mnt_id_req mnt_id_req;
+ #endif
+ 
+ #ifndef HAVE_STRUCT_STATMOUNT
+Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
+===================================================================
+--- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount.h
++++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
+@@ -15,7 +15,7 @@
+ static inline ssize_t listmount(uint64_t mnt_id, uint64_t last_mnt_id,
+ 			 uint64_t list[], size_t num, unsigned int flags)
+ {
+-	struct mnt_id_req req = {
++	mnt_id_req req = {
+ 		.size = MNT_ID_REQ_SIZE_VER0,
+ 		.mnt_id = mnt_id,
+ 		.param = last_mnt_id,
+Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
+===================================================================
+--- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount04.c
++++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
+@@ -14,14 +14,18 @@
+ 
+ #define _GNU_SOURCE
+ 
++#include "config.h"
+ #include "tst_test.h"
+ #include "lapi/mount.h"
+ #include "lapi/syscalls.h"
+ 
+ #define MNT_SIZE 32
++#define BEFORE_6_18 1
++#define AFTER_6_18 2
+ 
+-static struct mnt_id_req *request;
++static mnt_id_req *request;
+ static uint64_t mnt_ids[MNT_SIZE];
++static int kver;
+ 
+ static struct tcase {
+ 	int req_usage;
+@@ -34,6 +38,7 @@ static struct tcase {
+ 	uint64_t flags;
+ 	int exp_errno;
+ 	char *msg;
++	int kver;
+ } tcases[] = {
+ 	{
+ 		.req_usage = 0,
+@@ -79,6 +84,18 @@ static struct tcase {
+ 		.nr_mnt_ids = MNT_SIZE,
+ 		.exp_errno = EINVAL,
+ 		.msg = "invalid mnt_id_req.spare",
++		.kver = BEFORE_6_18,
++	},
++	{
++		.req_usage = 1,
++		.size = MNT_ID_REQ_SIZE_VER0,
++		.spare = -1,
++		.mnt_id = LSMT_ROOT,
++		.mnt_ids = mnt_ids,
++		.nr_mnt_ids = MNT_SIZE,
++		.exp_errno = EBADF,
++		.msg = "invalid mnt_id_req.mnt_ns_fd",
++		.kver = AFTER_6_18,
+ 	},
+ 	{
+ 		.req_usage = 1,
+@@ -113,7 +130,12 @@ static struct tcase {
+ static void run(unsigned int n)
+ {
+ 	struct tcase *tc = &tcases[n];
+-	struct mnt_id_req *req = NULL;
++	mnt_id_req *req = NULL;
++
++	if (tc->kver && tc->kver != kver) {
++		tst_res(TCONF, "Test not suitable for current kernel version");
++		return;
++	}
+ 
+ 	memset(mnt_ids, 0, sizeof(mnt_ids));
+ 
+@@ -122,7 +144,7 @@ static void run(unsigned int n)
+ 		req->mnt_id = tc->mnt_id;
+ 		req->param = tc->param;
+ 		req->size = tc->size;
+-		req->spare = tc->spare;
++		req->mnt_ns_fd = tc->spare;
+ 	}
+ 
+ 	TST_EXP_FAIL(tst_syscall(__NR_listmount, req, tc->mnt_ids,
+@@ -130,8 +152,17 @@ static void run(unsigned int n)
+ 		"%s", tc->msg);
+ }
+ 
++static void setup(void)
++{
++	if (tst_kvercmp(6, 18, 0) >= 0)
++		kver = AFTER_6_18;
++	else
++		kver = BEFORE_6_18;
++}
++
+ static struct tst_test test = {
+ 	.test = run,
++	.setup = setup,
+ 	.tcnt = ARRAY_SIZE(tcases),
+ 	.min_kver = "6.8",
+ 	.bufs = (struct tst_buffers []) {
+Index: ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
+===================================================================
+--- ltp-20250930.orig/testcases/kernel/syscalls/statmount/statmount.h
++++ ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
+@@ -16,7 +16,7 @@
+ static inline int statmount(uint64_t mnt_id, uint64_t mask, struct statmount *buf,
+ 		     size_t bufsize, unsigned int flags)
+ {
+-	struct mnt_id_req req = {
++	mnt_id_req req = {
+ 		.size = MNT_ID_REQ_SIZE_VER0,
+ 		.mnt_id = mnt_id,
+ 		.param = mask,
diff --git a/meta/recipes-extended/ltp/ltp_20250930.bb b/meta/recipes-extended/ltp/ltp_20250930.bb
index 1514aca8fe0..30897de7ca0 100644
--- a/meta/recipes-extended/ltp/ltp_20250930.bb
+++ b/meta/recipes-extended/ltp/ltp_20250930.bb
@@ -29,7 +29,8 @@ SRCREV = "d2550ffbbcfe163212cd7e9c132db65ae0fa06ed"
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
-           file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \ 
+           file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
+           file://2d066ead3d6ef504c82551b12306e751d23ddb45.patch \
           "
 
 inherit autotools-brokensep pkgconfig

