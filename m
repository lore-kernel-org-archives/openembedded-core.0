Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2FE77E4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:56:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8L7u2pF001249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 00:56:03 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 21 Sep 2017 00:56:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 15:54:58 +0800
Message-ID: <1505980498-12202-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] ltp: fix hanging issue for gdb01 case
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
X-List-Received-Date: Thu, 21 Sep 2017 07:56:02 -0000
Content-Type: text/plain

If gdb01 testcase runs as background process, gdb can receive SIGTTOU
and then the case gets stuck. Replace stdin with /dev/null to fix this
issue. The patch is backported from upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ommands-gdb01-replace-stdin-with-dev-null.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20170516.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch

diff --git a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch b/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
new file mode 100644
index 0000000..f7c0a4b
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
@@ -0,0 +1,34 @@
+From 2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Mon, 11 Sep 2017 12:57:58 +0200
+Subject: [PATCH] commands/gdb01: replace stdin with /dev/null
+
+If this testcase runs as background process, gdb can receive
+SIGTTOU and then testcase gets stuck.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ testcases/commands/gdb/gdb01.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/commands/gdb/gdb01.sh b/testcases/commands/gdb/gdb01.sh
+index 07ae36f..e3a5b51 100755
+--- a/testcases/commands/gdb/gdb01.sh
++++ b/testcases/commands/gdb/gdb01.sh
+@@ -29,7 +29,7 @@ TST_NEEDS_CMDS="gdb /bin/cat"
+ 
+ simple_test()
+ {
+-	gdb /bin/cat -ex "run /etc/passwd" -ex quit
++	gdb /bin/cat -ex "run /etc/passwd" -ex quit < /dev/null
+ 	RC=$?
+ 	if [ $RC -eq 0 ] ; then
+ 		tst_res TPASS "gdb attached to process and completed run"
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index 1d0cc1a..653cbfd 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch \
+           file://0038-commands-gdb01-replace-stdin-with-dev-null.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


