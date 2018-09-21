Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7F279880
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 06:09:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8L69lHt003297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:09:48 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Sep 2018 23:09:47 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Sep 2018 23:09:25 -0700
Message-ID: <20180921060925.46930-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180921060925.46930-1-hongzhi.song@windriver.com>
References: <20180921060925.46930-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sigwaitinfo01: recent glibc calls syscall directly
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
X-List-Received-Date: Fri, 21 Sep 2018 06:09:47 -0000
Content-Type: text/plain

The case of sigwaitinfo related to sigwaitinfo API failed.

glibc commit
  8b0e795aaa44 ("Simplify Linux sig{timed}wait{info} implementations")
  changed sigwaitinfo to call sigtimedwait, which calls rt_sigtimedwait
  syscall directly.

So, an invalid pointer no longer crashes child process and test
reports failure. Fix it by accepting either crash or EFAULT.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...nfo01-recent-glibc-calls-syscall-directly.patch | 75 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
new file mode 100644
index 0000000000..46e7fabd3d
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
@@ -0,0 +1,75 @@
+From 0932ca0a6f3ed9f7ae4487ed77ec07eb3610f4a7 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Thu, 20 Sep 2018 21:49:02 -0400
+Subject: [PATCH] sigwaitinfo01: recent glibc calls syscall directly
+
+glibc commit
+  8b0e795aaa44 ("Simplify Linux sig{timed}wait{info} implementations")
+changed sigwaitinfo to call sigtimedwait, which calls rt_sigtimedwait
+syscall directly.
+
+So, an invalid pointer no longer crashes child process and test
+reports failure. Fix it by accepting either crash or EFAULT.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2018-September/009338.html]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c    | 30 +++++++++++++++++++---
+ 1 file changed, 26 insertions(+), 4 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+index 95a9436..8fa8ac3 100644
+--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
++++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+@@ -371,19 +371,41 @@ void test_bad_address2(swi_func sigwaitinfo, int signo)
+ 		tst_brkm(TBROK | TERRNO, NULL, "fork() failed");
+ 	case 0:
+ 		signal(SIGSEGV, SIG_DFL);
++
++       /*
++        * depending on glibc implementation we should
++        * either crash or get EFAULT
++        */
+ 		TEST(sigwaitinfo((void *)1, NULL, NULL));
+ 
+-		_exit(0);
++       if (TEST_RETURN == -1 && TEST_ERRNO == EFAULT)
++           _exit(0);
++
++       tst_resm(TINFO, "swi_func returned: %ld, errno: %d",
++           TEST_RETURN, TEST_ERRNO);
++       _exit(1);
++
+ 		break;
+ 	default:
+ 		break;
+ 	}
+ 
+ 	SUCCEED_OR_DIE(waitpid, "waitpid failed", pid, &status, 0);
+-	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
++
++   if ((WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
++       || (WIFEXITED(status) && WEXITSTATUS(status) == 0)) {
+ 		tst_resm(TPASS, "Test passed");
+-	else
+-		tst_resm(TFAIL, "Unrecognised child exit code");
++       return;
++   }
++
++   if (WIFEXITED(status)) {
++       tst_resm(TFAIL, "Unrecognised child exit code: %d",
++           WEXITSTATUS(status));
++   }
++   if (WIFSIGNALED(status)) {
++       tst_resm(TFAIL, "Unrecognised child termsig: %d",
++           WTERMSIG(status));
++   }
+ }
+ 
+ void test_bad_address3(swi_func sigwaitinfo, int signo)
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index 9cd3489722..c99d5a2b00 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
            file://0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch \
            file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
+           file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


