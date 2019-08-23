Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE157F333
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 07:26:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7N7QalV016748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 00:26:36 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 23 Aug 2019 00:26:29 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2019 15:26:28 +0800
Message-ID: <1566545188-273512-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ltp: syscalls: rt_sigwaitinfo01: Fix failure for MIPS arches
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
X-List-Received-Date: Fri, 23 Aug 2019 07:26:35 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Add a patch to fix the following failure.
rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
(.../sigwaitinfo01.c: 148): Unexpected failure:
TEST_ERRNO=EINVAL(22): Invalid argument

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ..._sigwaitinfo01-Fix-failure-for-MIPS-arche.patch | 49 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-rt_sigwaitinfo01-Fix-failure-for-MIPS-arche.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-rt_sigwaitinfo01-Fix-failure-for-MIPS-arche.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-rt_sigwaitinfo01-Fix-failure-for-MIPS-arche.patch
new file mode 100644
index 0000000..9a0df74
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-rt_sigwaitinfo01-Fix-failure-for-MIPS-arche.patch
@@ -0,0 +1,49 @@
+From b4193bc3fdeb278abc54944b4773ffa45ee432af Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Fri, 23 Aug 2019 14:34:43 +0800
+Subject: [LTP] [PATCH] syscalls: rt_sigwaitinfo01: Fix failure for MIPS arches
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
+This patch adds specific case for MIPS.
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-August/013313.html]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+index 5a32ce1..5c2fa99 100644
+--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
++++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+@@ -128,9 +128,16 @@ static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
+ static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
+ 			      struct timespec *timeout)
+ {
+-
+-	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64 and 8, resp. */
+-	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, 8);
++	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64 and 8, resp,
++	 * except for MIPS which are 128 and 8, resp.
++	 */
++	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout,
++#ifdef __mips__
++		16
++#else
++		8
++#endif
++		);
+ }
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index b0e2f96..14c1219 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0002-check-for-RES_USE_INET6-during-configure.patch \
            file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch \
            file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
+           file://0001-syscalls-rt_sigwaitinfo01-Fix-failure-for-MIPS-arche.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


