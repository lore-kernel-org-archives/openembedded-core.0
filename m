Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4104.1794169788892620328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 12:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SZ3xXKRL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261108202946545861eac200020777-sredwj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261108202946545861eac200020777
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 21:29:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8gKH1eZx6WPsKZnJJF1Bcr4FK0LGAorOp8COKNCZMtY=;
 b=SZ3xXKRL1OLUQsZjWK4mQBlRNKOv2ahSFSJSbQrosPZ93aUIZY/md7EjSXE3tNAVoncWn5
 JHGTGTPbe44b/+2PGdWnBpPwGGotuZrmUPUDWQg9sSqKm1dTl0s4KNNgXI0SBjyzOU1oXYJk
 ZcTYu0XVczUXx0jv5gFCd2GGIBG1eq1nA1s4vSCyWaya46uKgIx0H7uMM0DEIM+p/s+p8hLl
 Av8wEyGNsqxb5X6UPlFYXw7p8XUPhJX2ZmEWXuig5QJncQP52V2y1jqUDWqRuBGuR3qaS1eD
 vXt1etPcp7OlegmtL7Xt/gvHLcqY7tZlO+blViSGAcyClh27j4nJxa7g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] popt: fix ptests
Date: Sun,  8 Nov 2026 21:28:55 +0100
Message-ID: <20261108202855.2743590-2-peter.marko@siemens.com>
In-Reply-To: <20261108202855.2743590-1-peter.marko@siemens.com>
References: <20261108202855.2743590-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 20:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249765
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

test3 is failing due to missing test data.
FAIL test3 - 1: failed output is in /usr/lib/popt/ptest/tmp.out, diff is:
FAIL test3 - 2: failed output is in /usr/lib/popt/ptest/tmp.out, diff is:
FAIL test3 - 3: failed output is in /usr/lib/popt/ptest/tmp.out, diff is:
FAIL test3 - 5: failed output is in /usr/lib/popt/ptest/tmp.out, diff is:

This is not detected because the test harness returns always 0 and
failure string is not in autotools format.

Patsh test harness output and install missing test data.
PASS: test3 - 1
PASS: test3 - 2
PASS: test3 - 3
PASS: test3 - 5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../popt/0001-Fix-test-output-format.patch    | 33 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  3 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/0001-Fix-test-output-format.patch

diff --git a/meta/recipes-support/popt/popt/0001-Fix-test-output-format.patch b/meta/recipes-support/popt/popt/0001-Fix-test-output-format.patch
new file mode 100644
index 00000000000..36bd3a8311c
--- /dev/null
+++ b/meta/recipes-support/popt/popt/0001-Fix-test-output-format.patch
@@ -0,0 +1,33 @@
+From 3aac82ac6b8ea69533c6cf5e8e8745a0932b8bac Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Sun, 8 Nov 2026 20:50:31 +0100
+Subject: [PATCH] Fix test output format
+
+"run_diff tests" have different output format than "run tests".
+
+Having : after test results string complies to autotools test format and
+makes all tests output the same.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/popt/pull/149]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/testit.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/testit.sh b/tests/testit.sh
+index b8357c8..f10f4d8 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -28,10 +28,10 @@ run_diff() {
+     diff_ret=$?
+ 
+     if [ "$diff_ret" != "0" ]; then
+-       echo "FAIL $name: failed output is in $out, diff is:"
++       echo "FAIL: $name: failed output is in $out, diff is:"
+        cat $diff_file
+     else
+-        echo "PASS $name"
++        echo "PASS: $name"
+     fi
+     rm $out $diff_file
+ }
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index cd35ddcdc63..dadcfdfeac8 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://CVE-2026-18739.patch \
            file://CVE-2026-18839-01.patch \
            file://CVE-2026-18839-02.patch \
+           file://0001-Fix-test-output-format.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
@@ -29,6 +30,8 @@ do_install_ptest() {
     for f in test1 test2 tdict test3 test4-1 test4-2 test4-3 test4-4 tstuff testit.sh test-poptrc; do
         ${B}/libtool --mode=install install ${B}/tests/$f ${D}/${PTEST_PATH}
     done
+    install -d ${D}/${PTEST_PATH}/test3-data
+    install ${S}/tests/test3-data/* ${D}/${PTEST_PATH}/test3-data
 }
 
 BBCLASSEXTEND = "native nativesdk"
