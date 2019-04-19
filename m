Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2059B6C106
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 08:59:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3J8xPAl019821
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 01:59:25 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 19 Apr 2019 01:59:25 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Apr 2019 16:59:23 +0800
Message-ID: <1555664363-333572-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v3] ltp: Fix setrlimit03 call succeeded unexpectedly
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
X-List-Received-Date: Fri, 19 Apr 2019 08:59:25 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch from upstream to fix the following error.
"setrlimit03.c:54: FAIL: call succeeded unexpectedly"

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v1 to v3: Add Upstream-Status and Signed-off-by

 ...trlimit03.c-read-proc-sys-fs-nr_open-for-.patch | 70 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190115.bb          |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
new file mode 100644
index 0000000..39623c3
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
@@ -0,0 +1,70 @@
+From db57ddc1497e72947da2b14f471ab521478ef99d Mon Sep 17 00:00:00 2001
+From: Tommi Rantala <tommi.t.rantala@nokia.com>
+Date: Thu, 31 Jan 2019 19:49:00 +0200
+Subject: [PATCH] syscalls/setrlimit03.c: read /proc/sys/fs/nr_open for
+ RLIMIT_NOFILE limit
+
+Since kernel v2.6.25 RLIMIT_NOFILE limit is no longer hardcoded to
+NR_OPEN, but can be set via /proc/sys/fs/nr_open, see kernel commit
+9cfe015aa424b3c003baba3841a60dd9b5ad319b ("get rid of NR_OPEN and
+introduce a sysctl_nr_open").
+
+nr_open default value is 1024*1024, so setrlimit03 has been passing fine
+on new kernels, only "unexpectedly succeeding" if nr_open is set to some
+larger value.
+
+Signed-off-by: Tommi Rantala <tommi.t.rantala@nokia.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+
+Upstream-Status: Backport [db57ddc1497e ("syscalls/setrlimit03.c: read /proc/sys/fs/nr_open for RLIMIT_NOFILE limit")]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/syscalls/setrlimit/setrlimit03.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit03.c b/testcases/kernel/syscalls/setrlimit/setrlimit03.c
+index 29b52aa..12455fe 100644
+--- a/testcases/kernel/syscalls/setrlimit/setrlimit03.c
++++ b/testcases/kernel/syscalls/setrlimit/setrlimit03.c
+@@ -35,7 +35,10 @@
+ # define NR_OPEN (1024*1024)
+ #endif
+ 
++#define NR_OPEN_PATH "/proc/sys/fs/nr_open"
++
+ static struct rlimit rlim1, rlim2;
++static unsigned int nr_open = NR_OPEN;
+ 
+ static struct tcase {
+ 	struct rlimit *rlimt;
+@@ -51,7 +54,10 @@ static void verify_setrlimit(unsigned int n)
+ 
+ 	TEST(setrlimit(RLIMIT_NOFILE, tc->rlimt));
+ 	if (TST_RET != -1) {
+-		tst_res(TFAIL, "call succeeded unexpectedly");
++		tst_res(TFAIL, "call succeeded unexpectedly "
++			"(nr_open=%u rlim_cur=%lu rlim_max=%lu)", nr_open,
++			(unsigned long)(tc->rlimt->rlim_cur),
++			(unsigned long)(tc->rlimt->rlim_max));
+ 		return;
+ 	}
+ 
+@@ -65,10 +71,13 @@ static void verify_setrlimit(unsigned int n)
+ 
+ static void setup(void)
+ {
++	if (!access(NR_OPEN_PATH, F_OK))
++		SAFE_FILE_SCANF(NR_OPEN_PATH, "%u", &nr_open);
++
+ 	SAFE_GETRLIMIT(RLIMIT_NOFILE, &rlim1);
+ 	rlim2.rlim_max = rlim1.rlim_cur;
+ 	rlim2.rlim_cur = rlim1.rlim_max + 1;
+-	rlim1.rlim_max = NR_OPEN + 1;
++	rlim1.rlim_max = nr_open + 1;
+ }
+ 
+ static struct tst_test test = {
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
index ddf97e2..1d0c00b 100644
--- a/meta/recipes-extended/ltp/ltp_20190115.bb
+++ b/meta/recipes-extended/ltp/ltp_20190115.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://define-sigrtmin-and-sigrtmax-for-musl.patch \
            file://setregid01-security-string-formatting.patch \
+           file://0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


