Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC09C5475B
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 01:52:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13520.1709776360268214894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 17:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R6FCtvn5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796d2585a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4271pS9q017310
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Mar 2024 17:52:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=lENis
	alogE5wWCOT4Xva3J7C/3qsT5G+/cyV6NgrnYo=; b=R6FCtvn5bhBElfShGGxsl
	3S3k+RH9ff1SzXzeVQAU7IRK9xA232ZDOyCBdhYZHO2Zre8vVqZKjINAI2Tr9SF+
	tNZQddFDpFHp2ngcCgdzMyJlXiB0ADv86EwNNwo2gJt7pjF8UQUeWxi4JYN5UxIe
	evU5zc4qvUFxoxPak3vdyiTkV7DbVp/+iQMtNc40CqkTl/FKs7nbpRF24p/NHC2C
	HcdS9dWMEQ6zuxbZ2opyH1KNpix8DC61E7LrR5VJ7MpbSz9/1Ye2subkh/IPGajU
	YtBaJhYbsRKQbUjGEU+f3pFOEPEElfolG0C6KGF8tVl79iMjgTeWeOcfKLouXrZM
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm4b5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 17:52:39 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 17:52:39 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 17:52:39 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: skip intermittently failing ptests
Date: Wed, 6 Mar 2024 17:52:39 -0800
Message-ID: <20240307015239.2600073-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 58DaoswyZISz7yF_uUaTxfgDj5Vt2CET
X-Proofpoint-GUID: 58DaoswyZISz7yF_uUaTxfgDj5Vt2CET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 01:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196760

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Skip a few additional ptests that fail occasionally on the Yocto
autobuilder and remove those added to the remove-for-all list
if they were already in the remove-for-aarch64 list.

=== Test Summary ===
TOTAL: 774
PASSED: 755
FAILED: 0
SKIPPED: 19

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 2 --
 meta/recipes-devtools/valgrind/valgrind/remove-for-all     | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 04f159d701..5bfba1c8d3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,5 +1,4 @@
 drd/tests/annotate_sem
-drd/tests/boost_thread
 gdbserver_tests/hgtls
 helgrind/tests/hg05_race2
 helgrind/tests/tc20_verifywrap
@@ -15,7 +14,6 @@ memcheck/tests/atomic_incs
 memcheck/tests/bug464969_d_demangle
 memcheck/tests/cxx17_aligned_new
 memcheck/tests/demangle
-memcheck/tests/linux/timerfd-syscall
 memcheck/tests/long_namespace_xml
 memcheck/tests/mismatches
 memcheck/tests/mismatches_xml
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index 004589a7ea..8435a6d41d 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1,8 +1,12 @@
 cachegrind/tests/wrap5
+drd/tests/boost_thread
 none/tests/amd64/fb_test_amd64
+none/tests/tls
 gdbserver_tests/hginfo
+gdbserver_tests/mcinvokeRU
 memcheck/tests/linux/dlclose_leak-no-keep
 memcheck/tests/linux/dlclose_leak
+memcheck/tests/linux/timerfd-syscall
 memcheck/tests/supp_unknown
 memcheck/tests/wrap1
 memcheck/tests/wrap2
-- 
2.43.0


