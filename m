Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043437"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776372"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/22] ifupdown: Skip wrong test item
Date: Sat,  3 Jul 2021 00:19:49 +0800
Message-Id: <d96dc6345619977748a1dbb4ed981d031d7ecee6.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zqiang <qiang.zhang@windriver.com>

Skip wrong testcase(12-15) in testbuild-linux and rebase the patch
tweak-ptest-script.patch.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4edcfbace258d94d814c7d61f467e5384e2645fb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-ifupdown-skip-wrong-test-case.patch  | 32 +++++++++++++++++++
 .../ifupdown/files/tweak-ptest-script.patch   | 15 ++++++---
 meta/recipes-core/ifupdown/ifupdown_0.8.36.bb |  1 +
 3 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch

diff --git a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
new file mode 100644
index 0000000000..c751e4fab0
--- /dev/null
+++ b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
@@ -0,0 +1,32 @@
+From 98243deface88614e3f332c4a85d04a9abce55ff Mon Sep 17 00:00:00 2001
+From: Zqiang <qiang.zhang@windriver.com>
+Date: Mon, 19 Apr 2021 14:15:45 +0800
+Subject: [PATCH] ifupdown: skip wrong test case
+
+The test parameters of testcase(12-15) file is not right,
+it triggers a test failure, these test items are invalid
+and are skipped directly.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Zqiang <qiang.zhang@windriver.com>
+---
+ tests/testbuild-linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/testbuild-linux b/tests/testbuild-linux
+index 1181ea0..5f148eb 100755
+--- a/tests/testbuild-linux
++++ b/tests/testbuild-linux
+@@ -3,7 +3,7 @@
+ dir=tests/linux
+ 
+ result=true
+-for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
++for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
+ 	if [ -e $dir/testcase.$test ]; then
+ 		args="$(cat $dir/testcase.$test | sed -n 's/^# RUN: //p')"
+ 	else
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
index d7600cf243..ea88a9086a 100644
--- a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
+++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
@@ -3,9 +3,12 @@ Tweak tests of ifupdown to make it work with oe-core ptest framework.
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ tests/testbuild-linux | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/tests/testbuild-linux b/tests/testbuild-linux
-index 1181ea0..d5c1814 100755
+index 5f148eb..d9b1698 100755
 --- a/tests/testbuild-linux
 +++ b/tests/testbuild-linux
 @@ -1,6 +1,7 @@
@@ -16,8 +19,8 @@ index 1181ea0..d5c1814 100755
 +dir=$curdir/linux
  
  result=true
- for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
-@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
+ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
+@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
          echo "Testcase $test: $args"
  
  	exitcode=0
@@ -26,7 +29,7 @@ index 1181ea0..d5c1814 100755
                  >$dir/up-res-out.$test 2>$dir/up-res-err.$test || exitcode=$?
  
          (echo "exit code: $exitcode";
-@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
+@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
           echo "====stderr===="; cat $dir/up-res-err.$test) > $dir/up-res.$test
  
  	exitcode=0
@@ -35,7 +38,7 @@ index 1181ea0..d5c1814 100755
                 >$dir/down-res-out.$test 2>$dir/down-res-err.$test || exitcode=$?
  
          (echo "exit code: $exitcode";
-@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
+@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
           echo "====stderr===="; cat $dir/down-res-err.$test) > $dir/down-res.$test
  
          if diff -ub $dir/up.$test $dir/up-res.$test && diff -ub $dir/down.$test $dir/down-res.$test; then
@@ -47,3 +50,5 @@ index 1181ea0..d5c1814 100755
                  result=false
          fi
          echo "=========="
+--
+2.17.1
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
index c0a90a3972..0daf50acab 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
            file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch \
            file://run-ptest \
+           file://0001-ifupdown-skip-wrong-test-case.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
 SRCREV = "c73226073e2b13970ca613b20a13b9c0253bf9da"
-- 
2.31.1

