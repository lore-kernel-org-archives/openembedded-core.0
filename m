Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E41DC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 10:44:31 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.97402.1680602413810718691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 03:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qqcnrh/8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680602411; i=@fujitsu.com;
	bh=nA3sK+3+vaN70UHlpYIyhCemo/FzrR2+8X4fj7UsnzE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Qqcnrh/8iORIZTriBC3iVFSJGfwdLBBnItzS4F6YnxrJA/iRmJOpGsCyyZTwCU3m8
	 BVcBGgcgCB785xnh5p7SFWbOEE1nlqDTaa8Qg3KW4uXoUT3xbiImt+DgtJa696vhJ3
	 G66985ZzJvfPiW5KYK4FJEZt8yg1L7s1nlo9ug5xb1474B9MvMnsXWgrrEp3/+vHLs
	 NcqttvHJ3OxLReB20lXAvVWO9uCQL2H64BvO6ACmAueHkXxOKUJVdQjn/P5tNUsfJd
	 To+fGR91KW39Ybcd30J9kyJHyvf5ws37Nt1mFgvZNi5VrTZwZhiMbFDdXcvBIIq0+O
	 AxRqYxDTUzw1g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSVf7q3a
  KwZwFbBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bvjZSCfvmK5ktZDYwdUl2MXBxCAo8ZJabs
  P8raxcgJ5FxjkpjQIAuR2M0o0Th7NViCTUBSYnnzKqYuRg4OEQE9iav/REHCzAKuErsenGPsY
  mTnEBYwltggARJlEVCReNq0jQXE5hVwkDhytZERxJYQkJPYsfoJE0RcUOLkzCcsEFMkJA6+eM
  EMUaMoMbVjKQuEXSHROP0QE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6RXlJRZnp
  GSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYAimFCd/2sG4rvev
  3iFGSQ4mJVHeRxu1U4T4kvJTKjMSizPii0pzUosPMcpwcChJ8Nq9BsoJFqWmp1akZeYA4wEmL
  cHBoyTCG/YBKM1bXJCYW5yZDpE6xajL8fHPxb3MQix5+XmpUuK8xz8DFQmAFGWU5sGNgMXmJU
  ZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvBYfgabwZOaVwG16BXQEE9ARrVEaIEeUJCKkpBq
  Y7Iu/pktJGXC7/ot9b2+v/Zens8Z42bwNqSWlxseVPVV1KypyxSdy398Vkb7HZbv5dL0tcddm
  m2qqzLkWfD3z0BdBnY6alxx7Xj+6/eHLPJuv38TF4p7+mRtTwPqhYcmp6F/PXeplVVWfJ05TP
  Lnx+fzYdZ1x70scn7a4Cp47xvHmBasS26PH2wIrE1n1BdfO/D8h+op+imyV3aoWn9ak/4edXt
  VszGqQfO6+agbDo+/ZIlfMHD9WqX1rW3Sd12zrk8pYQ9b4Jt0ru2IvHvZv1pNytHJ02nH85dF
  8XZfstfytbNmvO0TXX21iLlI8UnCxwuNgTmrFAZa42+038lOL34ldLpqs/GjH7wO9VyKUWIoz
  Eg21mIuKEwGnMfQMSAMAAA==
X-Env-Sender: qiutt@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1680602410!1015138!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4510 invoked from network); 4 Apr 2023 10:00:11 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Apr 2023 10:00:11 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 71D5C10046F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Apr 2023 11:00:10 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 64FCB1000FC
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Apr 2023 11:00:10 +0100 (BST)
Received: from localhost.localdomain (10.167.219.96) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 4 Apr 2023 11:00:08 +0100
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Qiu Tingting <qiutt@fujitsu.com>
Subject: [meta-oe][PATCH V1] lz4: Add ptest support
Date: Tue, 4 Apr 2023 17:59:59 +0800
Message-ID: <1680602399-5469-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [10.167.219.96]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 10:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179682

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for lz4.
- It is taking around 25 min to execute so added it to PTEST_SLOW.
- It contains two case: test_frame, test_fuzzer.
- Below is the run log:
  START: ptest-runner
  2023-04-04T08:28
  BEGIN: /usr/lib/lz4/ptest
  Starting lz4frame tester (64-bits, 1.9.4)
  Seed = 485
  Basic tests completed
  All tests completed
  PASS: lz4/test_frame
  Starting LZ4 fuzzer (64-bits, v1.9.4)
  Seed = 7154
  Overflow tests : 64 bits mode : no overflow
  All unit tests completed successfully compressionLevel=9
  Overflow tests : 64 bits mode : no overflow
  All unit tests completed successfully compressionLevel=10
  generating low buffer at address 0x1000
    65536 /  65536   - all tests completed successfully
  compression ratio: 54.326%
  HC compression ratio: 51.129%
  ratio with dict: 34.335%
  PASS: lz4/test_fuzzer
  DURATION: 1518
  END: /usr/lib/lz4/ptest
  2023-04-04T08:53
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  3 +--
 meta/recipes-support/lz4/files/run-ptest      | 26 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb         | 21 ++++++++++++++-
 3 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/lz4/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d60ebb38fc..d6351466f2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -105,6 +105,7 @@ PTESTS_SLOW = "\
     tcl \
     util-linux \
     valgrind \
+    lz4 \
 "
 
 PTESTS_SLOW:remove:riscv64 = "valgrind"
@@ -114,7 +115,6 @@ PTESTS_SLOW:remove:x86 = "valgrind"
 PTESTS_PROBLEMS:append:x86 = " valgrind"
 
 #    ruby \ # Timeout
-#    lz4 \ # Needs a rewrite
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design
 #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
@@ -127,7 +127,6 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 
 PTESTS_PROBLEMS = "\
     ruby \
-    lz4 \
     rt-tests \
     bash \
     ifupdown \
diff --git a/meta/recipes-support/lz4/files/run-ptest b/meta/recipes-support/lz4/files/run-ptest
new file mode 100644
index 0000000000..278db179ac
--- /dev/null
+++ b/meta/recipes-support/lz4/files/run-ptest
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+# Define test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+
+case_name="test_frame"
+./frametest 
+ret=$?
+if [[ ${ret} == "0" ]]; then
+    echo "PASS: lz4/$case_name"
+else
+    echo "FAIL: lz4/$case_name"
+fi
+
+case_name="test_fuzzer"
+./fuzzer
+ret=$?
+if [[ ${ret} == "0" ]]; then
+    echo "PASS: lz4/$case_name"
+else
+    echo "FAIL: lz4/$case_name"
+fi
+
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
index a2a178bab5..5b57dd4639 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -12,11 +12,15 @@ PE = "1"
 
 SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https"
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
+	   file://run-ptest \
+	   "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
+inherit ptest
+
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_IGNORE += "CVE-2014-4715"
 
@@ -27,3 +31,18 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN}-ptest += "bash"
+
+do_compile_ptest() {
+        oe_runmake -C ${B}/tests/
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests/
+	install --mode=755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
+	install --mode=755 ${B}/tests/fuzzer ${D}${PTEST_PATH}/tests/
+	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+
+}
+
-- 
2.25.1


