Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0400871EC3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Apr 2015 14:58:19 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YjUCJ-0006ob-8G from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Apr 2015 07:58:19 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Sat, 18 Apr 2015 15:58:18 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 18 Apr 2015 17:58:17 +0300
Message-ID: <1429369097-22171-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: add ptest
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
X-List-Received-Date: Sat, 18 Apr 2015 14:58:20 -0000
Content-Type: text/plain

Enable ptest for e2fsprogs by reusing provided testsuite.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 .../e2fsprogs/e2fsprogs/ptest.patch                | 66 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 11 ++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 17 ++++++
 3 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
new file mode 100644
index 0000000..b8a53e9
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -0,0 +1,66 @@
+Index: e2fsprogs-1.42.9/tests/Makefile.in
+===================================================================
+--- e2fsprogs-1.42.9.orig/tests/Makefile.in
++++ e2fsprogs-1.42.9/tests/Makefile.in
+@@ -18,7 +18,7 @@ test_one: $(srcdir)/test_one.in Makefile
+ 	@echo "#!/bin/sh" > test_one
+ @HTREE_CMT@	@echo "HTREE=y" >> test_one
+ @QUOTA_CMT@	@echo "QUOTA=y" >> test_one
+-	@echo "SRCDIR=@srcdir@" >> test_one
++	@echo "SRCDIR=/usr/lib/e2fsprogs/ptest/test" >> test_one
+ 	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
+ 	@cat $(srcdir)/test_one.in >> test_one
+ 	@chmod +x test_one
+@@ -26,7 +26,7 @@ test_one: $(srcdir)/test_one.in Makefile
+ test_script: test_one test_script.in Makefile mke2fs.conf
+ 	@echo "Creating test_script..."
+ 	@echo "#!/bin/sh" > test_script
+-	@echo "SRCDIR=@srcdir@" >> test_script
++	@echo "SRCDIR=/usr/lib/e2fsprogs/ptest/test" >> test_script
+ 	@cat $(srcdir)/test_script.in >> test_script
+ 	@chmod +x test_script
+ 
+Index: e2fsprogs-1.42.9/tests/test_config
+===================================================================
+--- e2fsprogs-1.42.9.orig/tests/test_config
++++ e2fsprogs-1.42.9/tests/test_config
+@@ -3,23 +3,23 @@
+ #
+ 
+ unset LANG LANGUAGE LC_ADDRESS LC_ALL LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME PAGER
+-FSCK="$USE_VALGRIND ../e2fsck/e2fsck"
+-MKE2FS="$USE_VALGRIND ../misc/mke2fs"
+-DUMPE2FS="$USE_VALGRIND ../misc/dumpe2fs"
+-TUNE2FS="$USE_VALGRIND ../misc/tune2fs"
+-CHATTR="$USE_VALGRIND../misc/chattr"
+-LSATTR="$USE_VALGRIND ../misc/lsattr"
+-E2IMAGE="$USE_VALGRIND ../misc/e2image"
+-E2IMAGE_EXE="../misc/e2image"
+-DEBUGFS="$USE_VALGRIND ../debugfs/debugfs"
+-DEBUGFS_EXE="../debugfs/debugfs"
+-TEST_BITS="../debugfs/debugfs"
+-RESIZE2FS_EXE="../resize/resize2fs"
++FSCK="$USE_VALGRIND e2fsck"
++MKE2FS="$USE_VALGRIND mke2fs"
++DUMPE2FS="$USE_VALGRIND dumpe2fs"
++TUNE2FS="$USE_VALGRIND tune2fs"
++CHATTR="$USE_VALGRIND chattr"
++LSATTR="$USE_VALGRIND lsattr"
++E2IMAGE="$USE_VALGRIND e2image"
++E2IMAGE_EXE="/sbin/e2image"
++DEBUGFS="$USE_VALGRIND debugfs"
++DEBUGFS_EXE="/sbin/debugfs"
++TEST_BITS="/sbin/debugfs"
++RESIZE2FS_EXE="/sbin/resize2fs"
+ RESIZE2FS="$USE_VALGRIND $RESIZE2FS_EXE"
+-E2UNDO_EXE="../misc/e2undo"
+-TEST_REL=../tests/progs/test_rel
+-TEST_ICOUNT=../tests/progs/test_icount
+-CRCSUM=../tests/progs/crcsum
++E2UNDO_EXE="/sbin/e2undo"
++TEST_REL=./progs/test_rel
++TEST_ICOUNT=./progs/test_icount
++CRCSUM=./progs/crcsum
+ LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss
+ DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss
+ export LD_LIBRARY_PATH
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
new file mode 100644
index 0000000..1ac2513
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+cd ./test
+./test_script &>../test.log
+if [ $? -eq 0 ]
+then
+	echo "PASS: e2fsprogs"
+	rm test.log
+else
+	echo "FAIL: e2fsprogs"
+fi
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 66065bc..67a5ea7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -87,3 +87,20 @@ ALTERNATIVE_${PN} = "chattr"
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[chattr] = "${base_bindir}/chattr"
 ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
+
+inherit ptest
+SRC_URI += "file://run-ptest"
+SRC_URI += "file://ptest.patch"
+
+RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps"
+#RDEPENDS_${PN}-ptest += "expect"
+
+do_compile_ptest() {
+	oe_runmake -C ${B}/tests
+}
+
+do_install_ptest() {
+	cp -a ${B}/tests ${D}${PTEST_PATH}/test
+	cp -a ${S}/tests/* ${D}${PTEST_PATH}/test
+	sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
+}
-- 
2.1.4


