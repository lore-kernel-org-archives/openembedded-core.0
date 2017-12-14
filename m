Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4E5B78882
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 06:47:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBE6l25D025444
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 22:47:02 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 13 Dec 2017 22:47:01 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Dec 2017 14:45:04 +0800
Message-ID: <1513233904-17502-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513233904-17502-1-git-send-email-yi.zhao@windriver.com>
References: <1513233904-17502-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH 2/2] ltp: fix ar01 case failure
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
X-List-Received-Date: Thu, 14 Dec 2017 06:47:01 -0000
Content-Type: text/plain

Our binutils is configured with --enable-deterministic-archives, so ar
runs in deterministic mode by default. The ar01 case would fail because
it doesn't consider this mode. Backport a patch from upstream to fix
this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...s-ar01-Fix-for-test-in-deterministic-mode.patch | 252 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20170929.bb          |   1 +
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch

diff --git a/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch b/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
new file mode 100644
index 0000000..e7c927e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
@@ -0,0 +1,252 @@
+From 04da9478887e705ea38e4f097492da20e651686c Mon Sep 17 00:00:00 2001
+From: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
+Date: Wed, 13 Sep 2017 15:48:42 +0800
+Subject: [PATCH] commands/ar01: Fix for test in deterministic mode
+
+If binutils was configured with --enable-deterministic-archives,
+ar will run in deterministic mode by default, and use zero for
+timestamps and uids/gids, which makes the test case abnormal.
+
+Fix this by add the "U" modifier when deterministic mode is default.
+
+Signed-off-by: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
+Signed-off-by: Fei Jie <feij.fnst@cn.fujitsu.com>
+
+Upstream-Status: Backport
+[http://lists.linux.it/pipermail/ltp/2017-September/005668.html]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ testcases/commands/ar/ar01 | 92 ++++++++++++++++++++++++++--------------------
+ 1 file changed, 52 insertions(+), 40 deletions(-)
+
+diff --git a/testcases/commands/ar/ar01 b/testcases/commands/ar/ar01
+index ddab2e0..d688f76 100644
+--- a/testcases/commands/ar/ar01
++++ b/testcases/commands/ar/ar01
+@@ -23,14 +23,26 @@
+ # This is a basic ar command test.
+ #
+ TST_CNT=17
++TST_SETUP=setup
+ TST_TESTFUNC=test
+ TST_NEEDS_TMPDIR=1
+ . tst_test.sh
+ 
++setup()
++{
++	ar --help | grep "use zero for timestamps and uids/gids (default)" \
++		>/dev/null
++	if [ $? -eq 0 ]; then
++		MOD="U"
++	else
++		MOD=""
++	fi
++}
++
+ test1()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
+-	ROD ar -ra file1.in lib.a $TST_DATAROOT/file2.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
++	ROD ar -ra"$MOD" file1.in lib.a $TST_DATAROOT/file2.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -47,9 +59,9 @@ test1()
+ 
+ test2()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
+-		         $TST_DATAROOT/file3.in $TST_DATAROOT/file4.in
+-	ROD ar -ma file1.in lib.a file4.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
++			       $TST_DATAROOT/file3.in $TST_DATAROOT/file4.in
++	ROD ar -ma"$MOD" file1.in lib.a file4.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile4.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -66,8 +78,8 @@ test2()
+ 
+ test3()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
+-	ROD ar -rb file3.in lib.a $TST_DATAROOT/file2.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
++	ROD ar -rb"$MOD" file3.in lib.a $TST_DATAROOT/file2.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -84,9 +96,9 @@ test3()
+ 
+ test4()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
+-	                 $TST_DATAROOT/file2.in
+-	ROD ar -mb file3.in lib.a file2.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
++			       $TST_DATAROOT/file2.in
++	ROD ar -mb"$MOD" file3.in lib.a file2.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -103,7 +115,7 @@ test4()
+ 
+ test5()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in \> ar.out
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in \> ar.out
+ 
+ 	if [ -s ar.out ]; then
+ 		tst_res TFAIL "ar produced output unexpectedly (-c)"
+@@ -117,7 +129,7 @@ test5()
+ 
+ test6()
+ {
+-	ROD ar -qc lib.a $TST_DATAROOT/file1.in \> ar.out
++	ROD ar -qc"$MOD" lib.a $TST_DATAROOT/file1.in \> ar.out
+ 
+ 	if [ -s ar.out ]; then
+ 		tst_res TFAIL "ar produced output unexpectedly (-qc)"
+@@ -131,9 +143,9 @@ test6()
+ 
+ test7()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
+-	                 $TST_DATAROOT/file3.in
+-	ROD ar -d lib.a file1.in file2.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
++			       $TST_DATAROOT/file3.in
++	ROD ar -d"$MOD" lib.a file1.in file2.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file3.in\n" > ar.exp
+@@ -150,9 +162,9 @@ test7()
+ 
+ test8()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
+-	                 $TST_DATAROOT/file3.in
+-	ROD ar -d lib.a
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
++			       $TST_DATAROOT/file3.in
++	ROD ar -d"$MOD" lib.a
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -169,8 +181,8 @@ test8()
+ 
+ test9()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
+-	ROD ar -ri file3.in lib.a $TST_DATAROOT/file2.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
++	ROD ar -ri"$MOD" file3.in lib.a $TST_DATAROOT/file2.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -187,9 +199,9 @@ test9()
+ 
+ test10()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
+-	                 $TST_DATAROOT/file2.in
+-	ROD ar -mi file3.in lib.a file2.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
++			       $TST_DATAROOT/file2.in
++	ROD ar -mi"$MOD" file3.in lib.a file2.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -206,9 +218,9 @@ test10()
+ 
+ test11()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
+-	                 $TST_DATAROOT/file2.in
+-	ROD ar -m lib.a file3.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
++			       $TST_DATAROOT/file2.in
++	ROD ar -m"$MOD" lib.a file3.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
+@@ -225,9 +237,9 @@ test11()
+ 
+ test12()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
+-	                 $TST_DATAROOT/file3.in
+-	ROD ar -p lib.a \> ar.out
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
++			       $TST_DATAROOT/file3.in
++	ROD ar -p"$MOD" lib.a \> ar.out
+ 
+ 	printf "This is file one\nThis is file two\nThis is file three\n" > ar.exp
+ 
+@@ -244,9 +256,9 @@ test12()
+ test13()
+ {
+ 
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
+-	                 $TST_DATAROOT/file3.in
+-	ROD ar -q lib.a $TST_DATAROOT/file4.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
++			       $TST_DATAROOT/file3.in
++	ROD ar -q"$MOD" lib.a $TST_DATAROOT/file4.in
+ 	ROD ar -t lib.a \> ar.out
+ 
+ 	printf "file1.in\nfile2.in\nfile3.in\nfile4.in\n" > ar.exp
+@@ -264,14 +276,14 @@ test13()
+ test14()
+ {
+ 	ROD touch file0.in
+-	ROD ar -cr lib.a file0.in $TST_DATAROOT/file1.in
++	ROD ar -cr"$MOD" lib.a file0.in $TST_DATAROOT/file1.in
+ 
+ 	file0_mtime1=$(ar -tv lib.a | grep file0.in)
+ 	file1_mtime1=$(ar -tv lib.a | grep file1.in)
+ 
+ 	touch -c -t $(date --date='next day' +"%Y%m%d%H%M") file0.in
+ 
+-	ROD ar -ru lib.a file0.in $TST_DATAROOT/file1.in
++	ROD ar -ru"$MOD" lib.a file0.in $TST_DATAROOT/file1.in
+ 
+ 	file0_mtime2=$(ar -tv lib.a | grep file0.in)
+ 	file1_mtime2=$(ar -tv lib.a | grep file1.in)
+@@ -293,7 +305,7 @@ test14()
+ 
+ test15()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in
+ 	ROD ar -tv lib.a \> ar.out
+ 
+ 	if grep -q '[rwx-]\{9\} [0-9].*/[0-9].*\s*[0-9].*.*file1.in' ar.out; then
+@@ -308,9 +320,9 @@ test15()
+ 
+ test16()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
+-	                 $TST_DATAROOT/file3.in
+-	ROD ar -xv lib.a \> ar.out
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
++			       $TST_DATAROOT/file3.in
++	ROD ar -xv"$MOD" lib.a \> ar.out
+ 
+ 	printf "x - file1.in\nx - file2.in\nx - file3.in\n" > ar.exp
+ 
+@@ -332,8 +344,8 @@ test16()
+ 
+ test17()
+ {
+-	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in
+-	ROD ar -xv lib.a file2.in \> ar.out
++	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in
++	ROD ar -xv"$MOD" lib.a file2.in \> ar.out
+ 
+ 	printf "x - file2.in\n" > ar.exp
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb b/meta/recipes-extended/ltp/ltp_20170929.bb
index 1a7e869f..bc0ecdf 100644
--- a/meta/recipes-extended/ltp/ltp_20170929.bb
+++ b/meta/recipes-extended/ltp/ltp_20170929.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0037-ltp-fix-format-security-error.patch \
            file://0038-generate-reproducible-gzip.patch \
+           file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


