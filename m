Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E839A7F323
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:28:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x839SlsR018771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2019 02:28:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 3 Sep 2019 02:28:46 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2019 17:28:45 +0800
Message-ID: <1567502925-351840-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] ltp: syscalls: rt_sigwaitinfo01: Fix failure for MIPS arches
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
X-List-Received-Date: Tue, 03 Sep 2019 09:28:51 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch to fix the following failure.
rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
(.../sigwaitinfo01.c: 148): Unexpected failure:
TEST_ERRNO=EINVAL(22): Invalid argument

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2: Rebase

 ...sigtimedwait01-Fix-wrong-sigset-length-fo.patch | 46 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch b/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch
new file mode 100644
index 0000000..0e56c08
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch
@@ -0,0 +1,46 @@
+From a5046625eaeed2d3fba456c3ba84c6c141c2ad7c Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 29 Aug 2019 21:09:46 +0800
+Subject: [PATCH] syscall/rt_sigtimedwait01: Fix wrong sigset length for MIPS
+
+rt_sigtimedwait01 fails as follow on MIPS arches
+rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
+(.../sigwaitinfo01.c: 148): Unexpected failure:
+TEST_ERRNO=EINVAL(22): Invalid argument
+
+As this case purposely bypasses glibc, it should align with the size of kernel
+definition of sigset_t which is different from other arches.
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/signal.h#n15
+
+This patch turns to use _NSIG which is always right for all arches.
+
+Upstream-Status: Backport [a5046625eaeed2d3fba456c3ba84c6c141c2ad7c]
+
+Suggested-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+---
+ testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+index 5a32ce1..6a30c27 100644
+--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
++++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+@@ -128,9 +128,8 @@ static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
+ static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
+ 			      struct timespec *timeout)
+ {
+-
+-	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64 and 8, resp. */
+-	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, 8);
++	/* _NSIG is always the right number of bits of signal map for all arches */
++	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, _NSIG/8);
+ }
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index 69d75d5..e9a588f 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -47,6 +47,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
            file://0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch \
            file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch \
+           file://0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


