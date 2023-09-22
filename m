Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30CBE7D0D1
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 06:41:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.15569.1695364863090660874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 23:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="133117451"
X-IronPort-AV: E=Sophos;i="6.03,167,1694703600"; 
   d="scan'208";a="133117451"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 15:41:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 63465DB3C1
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 15:40:58 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A8C5CF7DA
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 15:40:57 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F58087265;
	Fri, 22 Sep 2023 15:40:56 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>,
	Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [PATCH V4] tar: add ptest support
Date: Fri, 22 Sep 2023 14:40:50 +0800
Message-Id: <1695364850-2892-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27890.005
X-TMASE-Result: 10--28.188700-10.000000
X-TMASE-MatchedRID: hAjGS+X1uJ1SuJfEWZSQfBMxKDqgAFSz3hng3KTHeTaOEENgsUAuYv4Q
	R/7oUDJyKqrQ7lLcMnzolef5VxxwA6jC6/MNUxOopSXVpBS+ilY3l2plwgrtWCD1HdXyqDnEti3
	GfHANr+CcZ81PGbcSHgS2kVlHSIV7Wjws5pdLmBZO5y1KmK5bJTZlY6a4lRLZPZN54nI8dEzePr
	dhC8Q7L7bSfXlldRMcBt+ZjFMtGVzWzUAcn0Tx4ErOO5m0+0gEIsskYJKBkqRr5Rm/tuDWmZnAl
	BEbeOzkuuklncNdZERwk5p7o69tnaZY4PxfRMWEU94+rsr1GDzAmOfzKotTovH96zhMF86nP0DM
	9hKssEwx2n5f7J35aX1mi+4I9qv2hVlVt3AYQ1yVF2HD8EHNp/ambF/lwyYQw6juv/EevUCYlws
	/utSEvf7grQFIVVxhDtZlbWOVwNAM8jMXjBF+sBRFJJyf5BJe3QfwsVk0UbslCGssfkpInQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188040

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for tar.
- It is taking around 3m to execute with kvm, so added it to PTEST_SLOW.
- It contains 244 cases.
- Below is parts of the run log:
  START: ptest-runner
  2023-09-22T05:58
  BEGIN: /usr/lib/tar/ptest
  ## ------------------------ ##
  ## GNU tar 1.35 test suite. ##
  ## ------------------------ ##
  PASS: tar version
  PASS: decompressing from stdin
  ...
  ## ------------- ##
  ## Test results. ##
  ## ------------- ##

  200 tests were successful.
  44 tests were skipped.
  DURATION: 190
  END: /usr/lib/tar/ptest
  2023-09-22T01:11
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/recipes-core/images/core-image-ptest.bb  |   3 +
 meta/recipes-extended/tar/tar/ptest.patch     | 107 ++++++++++++++++++
 meta/recipes-extended/tar/tar/run-ptest       |  14 +++
 meta/recipes-extended/tar/tar_1.35.bb         |  28 +++++
 5 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/ptest.patch
 create mode 100644 meta/recipes-extended/tar/tar/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9160103cb0..3df7c9e405 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -109,6 +109,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3 \
     strace \
+    tar \
     tcl \
     util-linux \
     valgrind \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index b81ab7b7c8..b6f5c2fd60 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -24,6 +24,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
+# tar-ptest in particular needs more space
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
diff --git a/meta/recipes-extended/tar/tar/ptest.patch b/meta/recipes-extended/tar/tar/ptest.patch
new file mode 100644
index 0000000000..08a6575d00
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/ptest.patch
@@ -0,0 +1,107 @@
+tar: add support of --am-fmt
+
+Add --am-fmt into testsuites.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
+
+diff -rNu a/tests/testsuite b/tests/testsuite
+--- a/tests/testsuite	2023-09-22 13:42:29.696287678 +0800
++++ b/tests/testsuite	2023-09-22 13:54:54.592276865 +0800
+@@ -592,6 +592,8 @@
+ at_recheck=
+ # Whether a write failure occurred
+ at_write_fail=0
++# Automake result format "result: testname"
++at_am_fmt=false
+ 
+ # The directory we run the suite in.  Default to . if no -C option.
+ at_dir=`pwd`
+@@ -947,7 +949,9 @@
+ 	at_trace_echo=echo
+ 	at_check_filter_trace=at_fn_filter_trace
+ 	;;
+-
++    --am-fmt | -A )
++	at_am_fmt=:
++	;;
+     [0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9][0-9][0-9])
+ 	at_fn_validate_ranges at_option
+ 	as_fn_append at_groups "$at_option$as_nl"
+@@ -1156,6 +1160,7 @@
+   -d, --debug    inhibit clean up and top-level logging
+                  default for debugging scripts
+   -x, --trace    enable tests shell tracing
++  -A, --am-fmt   automake result format "result: testname"
+ _ATEOF
+ cat <<_ATEOF || at_write_fail=1
+ 
+@@ -1917,7 +1922,9 @@
+     *)          at_desc_line="$1: "  ;;
+   esac
+   as_fn_append at_desc_line "$3$4"
+-  $at_quiet printf %s "$at_desc_line"
++  if ! $at_am_fmt; then
++    $at_quiet printf %s "$at_desc_line"
++  fi
+   echo "#                             -*- compilation -*-" >> "$at_group_log"
+ }
+ 
+@@ -1944,42 +1951,51 @@
+   case $at_xfail:$at_status in
+     yes:0)
+ 	at_msg="UNEXPECTED PASS"
++	at_am_msg="XPASS"
+ 	at_res=xpass
+ 	at_errexit=$at_errexit_p
+ 	at_color=$at_red
+ 	;;
+     no:0)
+ 	at_msg="ok"
++	at_am_msg="PASS"
+ 	at_res=pass
+ 	at_errexit=false
+ 	at_color=$at_grn
+ 	;;
+     *:77)
+ 	at_msg='skipped ('`cat "$at_check_line_file"`')'
++	at_am_msg="SKIP"
+ 	at_res=skip
+ 	at_errexit=false
+ 	at_color=$at_blu
+ 	;;
+     no:* | *:99)
+ 	at_msg='FAILED ('`cat "$at_check_line_file"`')'
++	at_am_msg="FAIL"
+ 	at_res=fail
+ 	at_errexit=$at_errexit_p
+ 	at_color=$at_red
+ 	;;
+     yes:*)
+ 	at_msg='expected failure ('`cat "$at_check_line_file"`')'
++	at_am_msg="XFAIL"
+ 	at_res=xfail
+ 	at_errexit=false
+ 	at_color=$at_lgn
+ 	;;
+   esac
+   echo "$at_res" > "$at_job_dir/$at_res"
+-  # In parallel mode, output the summary line only afterwards.
+-  if test $at_jobs -ne 1 && test -n "$at_verbose"; then
+-    printf "%s\n" "$at_desc_line $at_color$at_msg$at_std"
++  if $at_am_fmt; then
++      printf "%s\n" "$at_am_msg: $at_desc"
+   else
+-    # Make sure there is a separator even with long titles.
+-    printf "%s\n" " $at_color$at_msg$at_std"
++    # In parallel mode, output the summary line only afterwards.
++    if test $at_jobs -ne 1 && test -n "$at_verbose"; then
++      printf "%s\n" "$at_desc_line $at_color$at_msg$at_std"
++    else
++      # Make sure there is a separator even with long titles.
++      printf "%s\n" " $at_color$at_msg$at_std"
++    fi
+   fi
+   at_log_msg="$at_group. $at_desc ($at_setup_line): $at_msg"
+   case $at_status in
diff --git a/meta/recipes-extended/tar/tar/run-ptest b/meta/recipes-extended/tar/tar/run-ptest
new file mode 100644
index 0000000000..23512104df
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+# Define tar test work dir
+WORKDIR=/usr/lib/tar/ptest/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./atlocal ./testsuite
+
+# clear log
+rm -rf testsuite.dir
+rm -rf testsuite.log
+
+./testsuite --am-fmt  AUTOTEST_PATH=${PWD} abs_builddir=${PWD} COMPAT=1
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index 4dbd418b60..5b085ebcbb 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -42,6 +42,34 @@ do_install:append:class-target() {
     fi
 }
 
+# add for ptest support
+SRC_URI += " \
+    file://run-ptest \
+    file://ptest.patch \
+"
+
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/gnu/ check
+    oe_runmake -C ${B}/lib/ check
+    oe_runmake -C ${B}/rmt/ check
+    oe_runmake -C ${B}/src/ check
+    oe_runmake -C ${B}/tests/ genfile checkseekhole ckmtime
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    sed -i "/abs_/d" ${B}/tests/atconfig
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "s%${B}/../tar-1.34.build-aux:%%g" ${B}/tests/atlocal
+    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/checkseekhole ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/ckmtime ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+}
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.25.1


