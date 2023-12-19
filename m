Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6ACC46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 02:47:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3558.1702954038243954475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 18:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JhSrV+R8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0717775950=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ29R4T010084
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 18:47:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=ZhXAfmV/ZOnUYklEyztZ5ywZAVTbG9++f4jV4NawwwE=; b=
	JhSrV+R8DRXNocBP0JIzjH6Mn3Yk0eEyyRFqOl7w1kXkGBmPHPpdxTmNJ8t4QiJg
	tK2IMmcec3KKUrQzEKDWC6wJGvdnuWt4koMtMnfaCjMblQLKHcWi9+GEAWyQWd6i
	/LhQAUo9mNYJsZiSvN1vUJVYOEtDBDGhm449eGBCINp/4xg7LfsS1Svo/kwwEMHA
	/oO5G7l22qQgQYulBBTISl8DK8/ut1MYAXmkz7kApGCMNTcJJDgvXsB83xmpX1rx
	OKXdI0AwNR84VyvaX03Jdwhbu3/g9fk6AhzSTFZ1aHGxcT1DH6bOYxyky9dYpRKe
	iRz9Nv0ReNHcsnP0qjeTHQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kjb44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 18:47:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 18:47:23 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 18:47:21 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 1/2] python3-license-expression: Fix the ptest failure
Date: Tue, 19 Dec 2023 10:47:14 +0800
Message-ID: <20231219024715.4040882-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANNYZj9aLEa=zCFMxv3cdjmwDdk3ZRyhsn+qtYFeY1LLBDyfPg@mail.gmail.com>
References: <CANNYZj9aLEa=zCFMxv3cdjmwDdk3ZRyhsn+qtYFeY1LLBDyfPg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qUWUOaWGypJ9Hzcy0XgiOc-Zhewrw-Gv
X-Proofpoint-ORIG-GUID: qUWUOaWGypJ9Hzcy0XgiOc-Zhewrw-Gv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192686

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below ptest failure:
 self = <test_skeleton_codestyle.BaseTests testMethod=test_skeleton_codestyle>
 def test_skeleton_codestyle(self):
 """
 This test shouldn't run in proliferated repositories.
 """
 setup_cfg = configparser.ConfigParser()
 setup_cfg.read("setup.cfg")
 > if setup_cfg["metadata"]["name"] != "skeleton":
 tests/test_skeleton_codestyle.py:22:
 self = <configparser.ConfigParser object at 0x7fd87cf55110>, key = 'metadata'
 def _getitem_(self, key):
 if key != self.default_section and not self.has_section(key):
 > raise KeyError(key)
 E KeyError: 'metadata'

After the patch:
 # ./run-ptest
 [snip]
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_bad_syntax
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_exception_as_regular_key
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_exception_with_choice
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_exception
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_exception_strict_false
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_key
 PASS: tests/test_license_expression.py::UtilTest::test_build_licensing
 PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_licensing
 PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_info
 PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_info_vendored
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_duplicated_elements
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_empty_input
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_or_relationship
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_regular
 PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyle
============================================================================
Testsuite summary
 # TOTAL: 175
 # PASS: 175
 # SKIP: 0
 # XFAIL: 0
 # FAIL: 0
 # XPASS: 0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

Changed in v4:
Add python3-license-expression to PTESTS_FAST
---
 .../python/python3-license-expression/run-ptest                 | 2 +-
 .../python/python3-license-expression_30.1.1.bb                 | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-license-expression/run-ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
index 5cec711696..8d2017d39c 100644
--- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
+++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
index 31fb88d6e5..92ca419e4a 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
@@ -26,6 +26,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -33,4 +34,5 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/src
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
+    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
 }
-- 
2.25.1


