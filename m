Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082C2C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:36:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.47033.1739180171629037793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4136ff35b8=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A60kwg014233
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 01:36:11 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44p7ns1dy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 01:36:11 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Feb 2025 01:36:10 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 10 Feb 2025 01:36:09 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-license-expression: Make the ptest work as expected
Date: Mon, 10 Feb 2025 17:36:09 +0800
Message-ID: <20250210093609.3899881-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Gp7UbeuShZVqnkSCNpKbz0jiOOgqoMs1
X-Proofpoint-ORIG-GUID: Gp7UbeuShZVqnkSCNpKbz0jiOOgqoMs1
X-Authority-Analysis: v=2.4 cv=ULwnHDfy c=1 sm=1 tr=0 ts=67a9c88b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=vIYTD8PQwD82yEZ70JcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=844 impostorscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 09:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211084

From: Mingli Yu <mingli.yu@windriver.com>

After below commit introduced, the do_install_ptest function is defined
concentratedly in ptest-python-pytest.bbclass.
8d84d9e19b python3-*: Update recipes with pytest ptests to use the new ptest-python-pytest class

Use append for do_install_ptest to avoid the do_install_ptest logic defined
in ptest-python-pytest.bbclass be overrided.

Before the patch:
 # cd /usr/lib/python3-license-expression/ptest/
 # ls
 setup.cfg  src

After the patch:
 # cd /usr/lib/python3-license-expression/ptest/
 # ls
run-ptest  setup.cfg  src  tests
 # ./run-ptest
PASS: tests/test__pyahocorasick.py:TestTrie.test_add_can_get
PASS: tests/test__pyahocorasick.py:TestTrie.test_add_existing_WordShouldReplaceAssociatedValue
PASS: tests/test__pyahocorasick.py:TestTrie.test_exists_ShouldDetectAddedWords
PASS: tests/test__pyahocorasick.py:TestTrie.test_exists_ShouldReturnFailOnUnknownWord
PASS: tests/test__pyahocorasick.py:TestTrie.test_get_UnknowWordWithDefaultValueShouldReturnDefault
PASS: tests/test__pyahocorasick.py:TestTrie.test_get_UnknowWordWithoutDefaultValueShouldRaiseException
PASS: tests/test__pyahocorasick.py:TestTrie.test_is_prefix_ShouldDetecAllPrefixesIncludingWord
PASS: tests/test__pyahocorasick.py:TestTrie.test_items_ShouldReturnAllItemsAlreadyAddedToTheTrie
PASS: tests/test__pyahocorasick.py:TestTrie.test_iter_should_can_return_non_matches_optionally
PASS: tests/test__pyahocorasick.py:TestTrie.test_iter_should_not_return_non_matches_by_default
PASS: tests/test__pyahocorasick.py:TestTrie.test_iter_simple
[snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-license-expression_30.4.1.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
index 649b53ea49..73eeff9c06 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-do_install_ptest() {
+do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/src
     cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
     cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
-- 
2.34.1


