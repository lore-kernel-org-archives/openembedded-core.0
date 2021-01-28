Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.20844.1611814476698976212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 22:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103927450"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 14:14:32 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DE9EF4CE6019
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 14:14:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 14:14:28 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ltp: upgrade 20200930 -> 20210121
Date: Thu, 28 Jan 2021 14:14:25 +0800
Message-ID: <1611814465-10935-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: DE9EF4CE6019.A4465
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-ltp-pan-Use-long-long-int-to-print-time_t.patch
removed since it is included in 20210121

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...an-Use-long-long-int-to-print-time_t.patch | 33 -------------------
 .../ltp/{ltp_20200930.bb => ltp_20210121.bb}  |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch
 rename meta/recipes-extended/ltp/{ltp_20200930.bb => ltp_20210121.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch
deleted file mode 100644
index 381ac417ca..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6c2085badea7b461245837c452a0d3d8a8c2afff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Dec 2020 22:09:28 -0800
-Subject: [PATCH] ltp-pan: Use long long int to print time_t
-
-Some newer 32bit architectures ( e.g. riscv32 ) uses 64bit time_t so
-using %ld is not sufficient to print time_t, this also fixes a crash in
-ltp-pan on riscv32
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/ltp/patch/20201221061415.2540216-1-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pan/ltp-pan.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
-index 8b9fbe5594..54b7cb8f26 100644
---- a/pan/ltp-pan.c
-+++ b/pan/ltp-pan.c
-@@ -1389,8 +1389,8 @@ static void write_test_start(struct tag_pgrp *running, int no_kmsg)
- 	if (!strcmp(reporttype, "rts")) {
- 
- 		printf
--		    ("%s\ntag=%s stime=%ld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
--		     "<<<test_start>>>", running->cmd->name, running->mystime,
-+		    ("%s\ntag=%s stime=%lld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
-+		     "<<<test_start>>>", running->cmd->name, (long long)running->mystime,
- 		     running->cmd->cmdline, "", "exit", "<<<test_output>>>");
- 	}
- 	fflush(stdout);
--- 
-2.29.2
-
diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20200930.bb
rename to meta/recipes-extended/ltp/ltp_20210121.bb
index e3c49fbf53..c541f9859f 100644
--- a/meta/recipes-extended/ltp/ltp_20200930.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -27,14 +27,13 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "da2f34028f046a208aa2fed5e287df2538e69f91"
+SRCREV = "4d005621edd109d119627eb9210b224a63bf22cb"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-ltp-pan-Use-long-long-int-to-print-time_t.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1



