Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6DA71A4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 06:02:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBC62vqG002776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 22:02:57 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 11 Dec 2016 22:02:56 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2016 13:59:47 +0800
Message-ID: <a93d0f61f3c6676a28b52681d9c7eda2b5dfbb47.1481522082.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1481522082.git.jackie.huang@windriver.com>
References: <cover.1481522082.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ltp/posix: replace CWD with PWD
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
X-List-Received-Date: Mon, 12 Dec 2016 06:02:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Backport a patch to replace CWD with PWD to avoid
error messages in test results:

basename: missing operand
Try 'basename --help' for more information.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...ix-option-group-test-replace-CWD-qith-PWD.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch

diff --git a/meta/recipes-extended/ltp/ltp/0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch b/meta/recipes-extended/ltp/ltp/0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch
new file mode 100644
index 0000000..8034152
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch
@@ -0,0 +1,44 @@
+From f356775c400f40e3803d80a7bd295b4265959c45 Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
+Date: Mon, 29 Feb 2016 14:34:40 +0530
+Subject: [PATCH] run-posix-option-group-test: replace CWD qith PWD
+
+When running LTP Open Posix Testsuite there is lot of messages as:
+
+| Usage: basename FILE [SUFFIX]
+|
+| Strip directory path and .SUFFIX from FILE
+|
+| *******************
+| Testing
+| *******************
+
+This is because there is no $CWD defined in shell and it looks like $PWD
+was intended instead.
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ testcases/open_posix_testsuite/bin/run-tests.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/open_posix_testsuite/bin/run-tests.sh b/testcases/open_posix_testsuite/bin/run-tests.sh
+index d4bd988..5ee5687 100755
+--- a/testcases/open_posix_testsuite/bin/run-tests.sh
++++ b/testcases/open_posix_testsuite/bin/run-tests.sh
+@@ -29,7 +29,7 @@ run_test_loop() {
+ 
+ 	cat <<EOF
+ *******************
+-Testing $(basename $CWD)
++Testing $(basename $PWD)
+ *******************
+ $(printf "PASS\t\t%3d" $NUM_PASS)
+ $(printf "FAIL\t\t%3d" $NUM_FAIL)
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 841302b..6e2ceac 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -64,6 +64,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0037-containers-netns_netlink-Avoid-segmentation-fault.patch \
+           file://0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.3


