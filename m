Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 860C779AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 10:16:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9BAGUSG024917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 03:16:40 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 03:16:19 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2018 18:16:17 +0800
Message-ID: <1539252978-415942-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] e2fsprogs: fix test f_detect_junk print error msg
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
X-List-Received-Date: Thu, 11 Oct 2018 10:16:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. This test need to check config.h, so install it

2. Test script have problem when the file want to grep
don't exist, change the check command to fix this problem

even we install the config.h,  but the script use relative path,
and will find the config.h decide by in which folder you run
the test scirpt. like below 2 cases, if without the fix of
check command, it will also met error msg in case (b). But, with
the fix, the problem can be fixed

a) root@qemux86-64:/usr/lib/e2fsprogs/ptest/test# ./test_one ./f_detect_junk
f_detect_junk: detect non-fs file data: ok

b) root@qemux86-64:/usr/lib/e2fsprogs/ptest# ./test/test_one ./test/f_detect_junk
grep: ../lib/config.h: No such file or directory
./test/f_detect_junk/script: line 3: [: : integer expression expected
f_detect_junk: detect non-fs file data: ok

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-e2fsprogs-fix-ptest-error-msg.patch       | 33 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb |  4 +++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch
new file mode 100644
index 0000000..4187e6b
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch
@@ -0,0 +1,33 @@
+From e193316891510ec3852699d57a860c65615196ef Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 11 Oct 2018 15:13:24 +0800
+Subject: [PATCH] e2fsprogs: fix ptest error msg
+
+Upstream-Status: Inappropriate [oe-specific]
+
+original command want to get count of match lines, but if
+config.h is not existed, like our case, the result of
+$(grep -c 'define HAVE_MAGIC_H' ../lib/config.h) will not be
+number, and cannot compare with 0, so fix it by check
+command executed result.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/f_detect_junk/script | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/f_detect_junk/script b/tests/f_detect_junk/script
+index 2577842..d56ec1a 100644
+--- a/tests/f_detect_junk/script
++++ b/tests/f_detect_junk/script
+@@ -1,6 +1,6 @@
+ #!/bin/bash
+ 
+-if [ "$(grep -c 'define HAVE_MAGIC_H' ../lib/config.h)" -eq 0 ]; then
++if ! grep -q -c 'define HAVE_MAGIC_H' ../lib/config.h 2>/dev/null; then
+ 	echo "$test_name: skipped (no magic)"
+ 	exit 0
+ fi
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index 823d18b..fa4d837 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
+            file://0001-e2fsprogs-fix-ptest-error-msg.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
@@ -129,4 +130,7 @@ do_install_ptest() {
 	find "${D}${PTEST_PATH}" -type f \
 	    \( -name 'Makefile' -o -name 'Makefile.in' -o -name '*.o' -o -name '*.c' -o -name '*.h' \)\
 	    -exec  rm -f {} +
+
+        install -d ${D}${PTEST_PATH}/lib
+        install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
 }
-- 
2.7.4


