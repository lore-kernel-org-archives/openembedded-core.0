Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B66E2745B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:45:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8C8jZWb021017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 01:45:46 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Sep 2018 01:44:58 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2018 16:55:56 +0800
Message-ID: <1536742556-35300-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ltp: fix mmap15 failed on qemumips64
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
X-List-Received-Date: Wed, 12 Sep 2018 08:45:55 -0000
Content-Type: text/plain

Actually, this is not a bug, mmap15 only run on 64bit system.
On qemumips64, mmap15 return EINVAL, x86-64 and arm64 return
ENOMEM. This is because mips system check the addr that passed
to the syscall mmap15:

    https://github.com/torvalds/linux/blob/master/arch/mips/mm/mmap.c#L71

If the addr larger than (TASK_SIZE - page_size), mips think it is invalid.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch | 41 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch b/meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch
new file mode 100644
index 0000000..18eba27
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch
@@ -0,0 +1,41 @@
+From b909805b4fc1b72e0ce299afb4abc02720ee81da Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 12 Sep 2018 14:24:35 +0800
+Subject: [PATCH] mmap15: mips64 return EINVAL
+
+In mips64 kernel, system check the addr that passed to mmap:
+
+    if (TASK_SIZE - len < addr)
+        return -EINVAL;
+
+Link: https://github.com/torvalds/linux/blob/master/arch/mips/mm/mmap.c#L71
+
+Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/394]
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ testcases/kernel/syscalls/mmap/mmap15.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/mmap/mmap15.c b/testcases/kernel/syscalls/mmap/mmap15.c
+index eff27d6..a10b5c7 100644
+--- a/testcases/kernel/syscalls/mmap/mmap15.c
++++ b/testcases/kernel/syscalls/mmap/mmap15.c
+@@ -81,9 +81,14 @@ int main(int ac, char **av)
+ 		}
+ 
+ 		if (errno != ENOMEM) {
++#ifdef __mips__
++			tst_resm(TPASS | TERRNO, "mmap into high region "
++                                 "failed as expected");                        
++#else
+ 			tst_resm(TFAIL | TERRNO, "mmap into high region "
+ 				 "failed unexpectedly - expect "
+ 				 "errno=ENOMEM, got");
++#endif
+ 		} else {
+ 			tst_resm(TPASS | TERRNO, "mmap into high region "
+ 				 "failed as expected");
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index 7c364a6..9cd3489 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -31,6 +31,7 @@ CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
+           file://0001-mmap15-mips64-return-EINVAL.patch \
            file://0004-build-Add-option-to-select-libc-implementation.patch \
            file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
            file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch \
-- 
2.7.4


