Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4476C657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:09:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN2A16g022842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:10:01 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 18:10:00 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 10:16:27 +0800
Message-ID: <598b9008d99ab046a2c4723b218a6778386b22b5.1542939066.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542939066.git.Qi.Chen@windriver.com>
References: <cover.1542939066.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] busybox: check uudecode before using it in test case
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
X-List-Received-Date: Fri, 23 Nov 2018 02:10:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Check uudecode before using it in test case to avoid unexpected failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-testsuite-check-uudecode-before-using-it.patch | 45 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.29.2.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
new file mode 100644
index 0000000..2d9856f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
@@ -0,0 +1,45 @@
+From 85f164ec427fecbae24140b3c93acbbe2ba1c817 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 13 Nov 2018 11:27:01 +0800
+Subject: [PATCH] testsuite: check uudecode before using it
+
+The unzip and tar test cases use uudecode command, so also
+check it via optional function.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2018-November/086833.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ testsuite/tar.tests   | 2 +-
+ testsuite/unzip.tests | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testsuite/tar.tests b/testsuite/tar.tests
+index d71a349..8c88567 100755
+--- a/testsuite/tar.tests
++++ b/testsuite/tar.tests
+@@ -336,7 +336,7 @@ SKIP=
+ cd .. || exit 1; rm -rf tar.tempdir 2>/dev/null
+ 
+ mkdir tar.tempdir && cd tar.tempdir || exit 1
+-optional FEATURE_SEAMLESS_BZ2 FEATURE_TAR_AUTODETECT LS
++optional FEATURE_SEAMLESS_BZ2 FEATURE_TAR_AUTODETECT LS UUDECODE
+ testing "Symlink attack: create symlink and then write through it" '\
+ exec 2>&1
+ uudecode -o input && tar xvf input; echo $?
+diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
+index af53de9..3b45ece 100755
+--- a/testsuite/unzip.tests
++++ b/testsuite/unzip.tests
+@@ -31,7 +31,7 @@ rmdir foo
+ rm foo.zip
+ 
+ # File containing some damaged encrypted stream
+-optional FEATURE_UNZIP_CDF
++optional FEATURE_UNZIP_CDF UUDECODE
+ testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
+ "Archive:  bad.zip
+   inflating: ]3j½r«IK-%Ix
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.29.2.bb b/meta/recipes-core/busybox/busybox_1.29.2.bb
index df3ea59..a63fa82 100644
--- a/meta/recipes-core/busybox/busybox_1.29.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.29.2.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcS \
            file://rcK \
            file://makefile-libbb-race.patch \
+           file://0001-testsuite-check-uudecode-before-using-it.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


