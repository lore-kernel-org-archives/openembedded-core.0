Return-Path: <Sakib.Sajal@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53DF47E5EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:26:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4VKQgao014694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:26:43 -0700 (PDT)
Received: from ssajal-HP-EliteBook-850-G3.wrs.com (128.224.140.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Fri, 31 May 2019 13:26:42 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 May 2019 16:25:51 -0400
Message-ID: <20190531202552.21421-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531202552.21421-1-sakib.sajal@windriver.com>
References: <20190531202552.21421-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] ptest-runner: close all fds in child process.
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
X-List-Received-Date: Fri, 31 May 2019 20:26:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When running 'ptest-runner bash', a test named vredir fails
due to too many open file descriptors.
The test sets the maximum number of open file descriptors
to 6 (ulimit -n 6). The test passes by interactively calling
run-ptest, but not when using ptest-runner.
Security-focused applications will close all unused file descriptors in
the child after forking but before execing.

From the failed ptest log:
   run-vredir
   87,88c87,88
   < ./vredir6.sub: line 10: /dev/null: Too many open files
   < ./vredir6.sub: line 13: /dev/null: Too many open files
   FAIL: run-vredir

Upstream-Status: Submitted [yocto@yoctoproject.org]

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 ...l-file-descriptors-after-completing-.patch | 69 +++++++++++++++++++
 .../ptest-runner/ptest-runner_2.3.1.bb        |  4 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0004-utils.c-close-all-file-descriptors-after-completing-.patch

diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0004-utils.c-close-all-file-descriptors-after-completing-.patch b/meta/recipes-support/ptest-runner/ptest-runner/0004-utils.c-close-all-file-descriptors-after-completing-.patch
new file mode 100644
index 0000000000..6cc941b853
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner/0004-utils.c-close-all-file-descriptors-after-completing-.patch
@@ -0,0 +1,69 @@
+From 63c1b0d154a8028084a26dd523efa379420d8a5d Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 30 May 2019 16:02:04 -0400
+Subject: [PATCH] utils.c: close all file descriptors after completing a ptest
+
+vredir ptest fails since too many file descriptors were open.
+
+From the failed ptest log:
+   run-vredir
+   87,88c87,88
+   < ./vredir6.sub: line 10: /dev/null: Too many open files
+   < ./vredir6.sub: line 13: /dev/null: Too many open files
+   FAIL: run-vredir
+
+Added function to close file descriptors before starting a new process.
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
+---
+ utils.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/utils.c b/utils.c
+index 504df0b..05c2bfe 100644
+--- a/utils.c
++++ b/utils.c
+@@ -28,6 +28,7 @@
+ #include <fcntl.h>
+ #include <time.h>
+ #include <dirent.h>
++#include <sys/resource.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+@@ -240,6 +241,23 @@ filter_ptests(struct ptest_list *head, char **ptests, int ptest_num)
+ 	return head_new;
+ }
+ 
++/* Close all fds from 3 up to 'ulimit -n'
++ * i.e. do not close STDIN, STDOUT, STDERR.
++ * Typically called in in a child process after forking
++ * but before exec as a good policy especially for security.
++ */ 
++static void
++close_fds(void)
++{
++	struct rlimit curr_lim;
++	getrlimit(RLIMIT_NOFILE, &curr_lim);
++
++	int fd;
++	for (fd=3; fd < curr_lim.rlim_cur; fd++) {
++		(void) close(fd);
++   	}
++}
++
+ static inline void
+ run_child(char *run_ptest, int fd_stdout, int fd_stderr)
+ {
+@@ -252,6 +270,7 @@ run_child(char *run_ptest, int fd_stdout, int fd_stderr)
+ 	dup2(fd_stdout, STDOUT_FILENO);
+ 	// XXX: Redirect stderr to stdout to avoid buffer ordering problems.
+ 	dup2(fd_stdout, STDERR_FILENO);
++	close_fds();
+ 	execv(run_ptest, argv);
+ 
+ 	exit(1);
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index e2eb258d0b..afa407b48b 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -13,7 +13,9 @@ PV = "2.3.1+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
  file://0001-utils-Ensure-stdout-stderr-are-flushed.patch \
  file://0002-use-process-groups-when-spawning.patch \
- file://0003-utils-Ensure-pipes-are-read-after-exit.patch"
+ file://0003-utils-Ensure-pipes-are-read-after-exit.patch
+ file://0004-utils.c-close-all-file-descriptors-after-completing-.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


