Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6E60782A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:36:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7P9aUK8001950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:36:42 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 24 Aug 2017 19:10:33 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 10:11:20 +0800
Message-ID: <1503627080-18372-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] e2fsprogs: fix ptest script
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
X-List-Received-Date: Fri, 25 Aug 2017 09:36:41 -0000
Content-Type: text/plain

* Fix hardcoded path for ptest script which would cause failure on
  mulitilib:
  ls: cannot access '/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
  ./test_script: line 54: /usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory

* Add missing '$' for shell variable reference

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../e2fsprogs/e2fsprogs/ptest.patch                | 25 ++++++++++++++++------
 .../recipes-devtools/e2fsprogs/e2fsprogs/run-ptest |  2 +-
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index cc32dbf..7df0967 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Inappropriate
 
 diff --git a/tests/Makefile.in b/tests/Makefile.in
-index 60cf655..ce220f1 100644
+index c130f4a..d2ade03 100644
 --- a/tests/Makefile.in
 +++ b/tests/Makefile.in
 @@ -18,7 +18,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
@@ -9,21 +9,21 @@ index 60cf655..ce220f1 100644
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
 -	@echo "SRCDIR=@srcdir@" >> test_one
-+	@echo "SRCDIR=/usr/lib/e2fsprogs/ptest/test" >> test_one
++	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
+ 	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@cat $(srcdir)/test_one.in >> test_one
- 	@chmod +x test_one
-@@ -26,7 +26,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
+@@ -27,7 +27,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
  test_script: test_one test_script.in Makefile mke2fs.conf
  	@echo "Creating test_script..."
  	@echo "#!/bin/sh" > test_script
 -	@echo "SRCDIR=@srcdir@" >> test_script
-+	@echo "SRCDIR=/usr/lib/e2fsprogs/ptest/test" >> test_script
++	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
  	@cat $(srcdir)/test_script.in >> test_script
  	@chmod +x test_script
  
 diff --git a/tests/test_config b/tests/test_config
-index 7f39157..c815a44 100644
+index 547ef4c..e11e6f4 100644
 --- a/tests/test_config
 +++ b/tests/test_config
 @@ -3,24 +3,24 @@
@@ -67,3 +67,16 @@ index 7f39157..c815a44 100644
  CLEAN_OUTPUT="sed -f $cmd_dir/filter.sed"
  LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${LD_LIBRARY_PATH}
  DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${DYLD_LIBRARY_PATH}
+diff --git a/tests/test_script.in b/tests/test_script.in
+index 9959e30..442999d 100644
+--- a/tests/test_script.in
++++ b/tests/test_script.in
+@@ -39,7 +39,7 @@ for i; do
+ done
+ 
+ if test "$TESTS"x = x ; then
+-    if test -n "DO_FAILED"; then
++    if test -n "$DO_FAILED"; then
+ 	exit 0
+     fi
+     TESTS=`ls -d $SRCDIR/[a-zA-Z]_*`
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 1ac2513..e02fc7f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -5,7 +5,7 @@ cd ./test
 if [ $? -eq 0 ]
 then
 	echo "PASS: e2fsprogs"
-	rm test.log
+	rm ../test.log
 else
 	echo "FAIL: e2fsprogs"
 fi
-- 
2.7.4


