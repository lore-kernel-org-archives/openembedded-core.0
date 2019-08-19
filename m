Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA0B7EC56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 13:57:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7JDulOb032164
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 06:56:57 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 19 Aug 2019 06:56:36 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Aug 2019 21:56:34 +0800
Message-ID: <1566222994-21907-2-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566222994-21907-1-git-send-email-zhe.he@windriver.com>
References: <1566222994-21907-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ltp: Fix ustat02 failure
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
X-List-Received-Date: Mon, 19 Aug 2019 13:57:06 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch to fix the following failure.
ustat02.c:44: FAIL: ustat(2) failed to produce expected error; 14, errno: EFAULT: EINVAL

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...02-Fix-EFAULT-in-32bit-compatibility-mode.patch | 36 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch b/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch
new file mode 100644
index 0000000..c936b78
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch
@@ -0,0 +1,36 @@
+From 156776a3e29491b363fdc9811912e1298655d060 Mon Sep 17 00:00:00 2001
+From: Steven Price <steven.price@arm.com>
+Date: Fri, 19 Jul 2019 13:48:17 +0100
+Subject: [PATCH] ustat02: Fix EFAULT in 32bit compatibility mode
+
+The size of dev_t is larger than 32 bits which causes the dev argument
+to be passed incorrectly. On Arm this means that the EFAULT test case
+actually returns EINVAL because the device number isn't recognised.
+
+Signed-off-by: Steven Price <steven.price@arm.com>
+Acked-by: Li Wang <liwang@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/156776a3e29491b363fdc9811912e1298655d060]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/syscalls/ustat/ustat02.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
+index 9bbe4f3..1a0e9e0 100644
+--- a/testcases/kernel/syscalls/ustat/ustat02.c
++++ b/testcases/kernel/syscalls/ustat/ustat02.c
+@@ -36,7 +36,7 @@ int TST_TOTAL = ARRAY_SIZE(tc);
+ 
+ void run(unsigned int test)
+ {
+-	TEST(tst_syscall(__NR_ustat, *tc[test].dev, tc[test].buf));
++	TEST(tst_syscall(__NR_ustat, (unsigned int)*tc[test].dev, tc[test].buf));
+ 
+ 	if ((TST_RET == -1) && (TST_ERR == tc[test].exp_errno))
+ 		tst_res(TPASS | TTERRNO, "ustat(2) expected failure");
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index f6c7de6..b0e2f96 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Add-configure-time-check-for-getdents-getdents64-API.patch \
            file://0002-check-for-RES_USE_INET6-during-configure.patch \
            file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch \
+           file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


