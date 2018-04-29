Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id BD11671A8C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p9-v6so2015713pgc.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x7CWv/KGEQ3fZP5lpcH1ygwLNsAqx70tTetzHE9RSaM=;
	b=jgnJJPP6tppXFmumhrbqlhiu4oaEspvRR2L+c1RYXwQ35ZKWp3UyTeDfs1OkewrErs
	wQTIm1L+1v4m7CIAAagRk90o1GIOGF7VukNiOmUI6u/Y0yTXz6kOYZCZW6bL8O0zkwxv
	pt7ETym/Fk9mBORPZWI1SpEaKKGYC/5hZiV+5A48oAlKmP8PGWdezkNKXCF2ARzAWO/M
	2yNycxKLw3hWiIbABkRjVUZRZJYdIJVP+EFPn9D7C6+lLNEMRzlCcMMPSWnctQ7EBcjB
	4XNW6MhubvIiNZTpySQmESHAD+mMd/7TgVRSkbaICOcjHnANZ/mg2fQOKtEnnE01mayc
	GxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x7CWv/KGEQ3fZP5lpcH1ygwLNsAqx70tTetzHE9RSaM=;
	b=L84RooIzlQFauB/LbuhfKD1bwmmr8wKnWWyWbpSYNx5VORWaxQvPuI7B5bntBMX18p
	OB0VZjY1PQYMC8NWHYC04Gl0Hru18v2cQYdh3His8HuUl7DCdhRunPUpGg0eYV3r63aR
	tD4nMqJdl/Y0Ra8A/3hRCM/Xyt95Y9M6B/8k4nXWmLXTy+MyihP/Kxh0JWr4d0SJUA1u
	5ihtv3fTBoJAEskO3SpNNzBuZiv8ReBmafA9Dyb0a5CcLBBDFU0U59k6IC7v8ZzPpETW
	wZ/Ml2Q07HzxGJxynDUYrdLx3fVOLITzgzeuzqTQuhYIozQX+qU81TUZtGCqi/PFUECU
	EF/A==
X-Gm-Message-State: ALQs6tCMiOG2UytOjt7gTi6lxep0X14+jq9O8UGT8M0UznYzOod2uOmr
	P9G9KXE1/TNmaTgH2xTXAGXVBA==
X-Google-Smtp-Source: AB8JxZrOFS4L6iV40iimrJ9XzqiD0n7HWl16tqQqkXXI9XIVhZPn5V2VSRezSfiVOc6OyNb1R7ax4Q==
X-Received: by 2002:a17:902:bc08:: with SMTP id
	n8-v6mr9771526pls.97.1525030596490; 
	Sun, 29 Apr 2018 12:36:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:03 -0700
Message-Id: <1799ed5d0d121a23e61cd0fd9a8196ae649876ab.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 16/24] ltp: Fix build after removing rpc and libnsl in glibc
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Disable-rpc01-on-glibc-and-musl.patch | 29 +++++++++++++++++++
 ...option-to-select-libc-implementation.patch | 14 ---------
 meta/recipes-extended/ltp/ltp_20180118.bb     |  1 +
 3 files changed, 30 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch b/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
new file mode 100644
index 0000000000..78c6dfb2b1
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
@@ -0,0 +1,29 @@
+From ff39e6b69f0b26dad8ab685ee6116ff92bc363db Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Apr 2018 00:08:55 -0700
+Subject: [PATCH] Disable rpc01 on glibc and musl
+
+It is not buildable with libtirpc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ testcases/network/rpc/basic_tests/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
+index 66e9d5675..16a64e7da 100644
+--- a/testcases/network/rpc/basic_tests/Makefile
++++ b/testcases/network/rpc/basic_tests/Makefile
+@@ -23,4 +23,7 @@
+ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/env_pre.mk
++
++FILTER_OUT_DIRS += rpc01
++
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+-- 
+2.17.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
index 84ab37ea39..0781ba1743 100644
--- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
@@ -102,20 +102,6 @@ Index: git/testcases/network/nfsv4/acl/Makefile
 +endif
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
-Index: git/testcases/network/rpc/basic_tests/Makefile
-===================================================================
---- git.orig/testcases/network/rpc/basic_tests/Makefile
-+++ git/testcases/network/rpc/basic_tests/Makefile
-@@ -23,4 +23,9 @@
- top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/env_pre.mk
-+
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_DIRS += rpc01
-+endif
-+
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
 Index: git/testcases/realtime/func/pi-tests/Makefile
 ===================================================================
 --- git.orig/testcases/realtime/func/pi-tests/Makefile
diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index 14fb41b3bd..8992f1b0f2 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
            file://0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch \
+           file://0001-Disable-rpc01-on-glibc-and-musl.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.0


