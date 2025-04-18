Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA66AC369CF
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 01:34:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.3283.1744940052160922814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 18:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o7ujqwVc;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744940053; x=1776476053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AKpB48b+HGRZX0uqzZRrv+82rnkq5Kzfuc5BRhJxnlw=;
  b=o7ujqwVc0MVpMnVKFIxW1xaBclqBx/99e6jJDx1sOV+Iw0fjGdp/jvMz
   a5BY9y40dTflaRRBa1TsZxzr/hfxF5E62PKA6KZwQtF7OOJPgpRYIW1h8
   LkdEf3ISWCqui8UbyR3Er1frZ00+c1T16xirVh4xkp/W6zl3wmpOJ1adF
   EUbKa2/ffSuYWQwZKYDzdE+FG0KqPRhDZAYJAyjhfAOd8MSNMqhjb8zU0
   DpmSBULvIoib8dNPXRf4JqsoeYbqUJQ6xvWarm9fRABRIuYGPXhD3k/79
   ZS/RbS+ORx2cBEcE+C85vIMG69s2HaoAJ6s3P8pF5UgMayJxFXQeKbcKk
   g==;
X-CSE-ConnectionGUID: btWqiTfrTJqPJsaPKvlkwQ==
X-CSE-MsgGUID: Wvtp3mZ7RZ6KzoHTaKw/wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="175720845"
X-IronPort-AV: E=Sophos;i="6.15,220,1739804400"; 
   d="scan'208";a="175720845"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 10:34:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 07331D4C2B
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 10:34:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC31AD8C06
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 10:34:07 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4667A1A009B;
	Fri, 18 Apr 2025 09:34:07 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 2/2] python3-hypothesis: Update to use the new ptest-python-pytest class
Date: Fri, 18 Apr 2025 09:34:04 +0800
Message-Id: <20250418013404.869-2-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250418013404.869-1-leimaohui@fujitsu.com>
References: <20250418013404.869-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 01:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215121

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../python/python3-hypothesis/run-ptest          | 10 ----------
 .../python/python3-hypothesis_6.131.0.bb         | 16 ++++++----------
 2 files changed, 6 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-hypothesis/run-ptest

diff --git a/meta/recipes-devtools/python/python3-hypothesis/run-ptest b/meta/recipes-devtools/python/python3-hypothesis/run-ptest
deleted file mode 100644
index 54f6e7930f..0000000000
--- a/meta/recipes-devtools/python/python3-hypothesis/run-ptest
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-# Upstream "fast" tests take about 5 minutes and currently do not run cleanly
-# (tests/cover and tests/pytest)
-# https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python/tests
-# https://github.com/HypothesisWorks/hypothesis/blob/master/hypothesis-python/scripts/basic-test.sh#L18
-#
-# Instead we run two test suites imported from examples/
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
index 0542a9d188..d7656dc1d8 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
@@ -4,11 +4,11 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
 
 PYPI_PACKAGE = "hypothesis"
+PTEST_PYTEST_DIR ?= "examples"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += " \
-    file://run-ptest \
     file://test_binary_search.py \
     file://test_rle.py \
     "
@@ -27,14 +27,10 @@ RDEPENDS:${PN} += " \
     python3-zoneinfo \
     "
 
-RDEPENDS:${PN}-ptest += " \
-    python3-unittest-automake-output \
-    "
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/examples
-    install -m 0755 ${UNPACKDIR}/test_binary_search.py ${D}${PTEST_PATH}/examples/
-    install -m 0755 ${UNPACKDIR}/test_rle.py ${D}${PTEST_PATH}/examples/
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
+    install -m 0755 ${UNPACKDIR}/test_binary_search.py ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
+    install -m 0755 ${UNPACKDIR}/test_rle.py ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


