Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426C5D44D71
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:05:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46434.1730901921749369545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 06:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1040a804e6=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6BDoaQ020189
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Nov 2024 06:05:21 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjmawr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 06:05:21 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 06:05:20 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 06:05:20 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] multilib_global.bbclass: Avoid expanding native recipes in NON_MULTILIB_RECIPES
Date: Wed, 6 Nov 2024 06:05:20 -0800
Message-ID: <7ee79c781aea254888bae3aa9873710c31b742a9.1730901843.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1730901843.git.liezhi.yang@windriver.com>
References: <cover.1730901843.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7DwzeUoYbmCapvBVEwAf7qInDYPmYAzV
X-Authority-Analysis: v=2.4 cv=YvBdRJYX c=1 sm=1 tr=0 ts=672b77a1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=0vO0SL8fNpwg_1vli8oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7DwzeUoYbmCapvBVEwAf7qInDYPmYAzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_07,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=724 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411060111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 14:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206784

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
MACHINE = "qemux86-64"

$ bitbake lib32-grub-native
The build would go on before the patch which was incorrect. Now:

ERROR: Nothing PROVIDES 'lib32-grub-native'. Close matches:
[snip]

The nativesdk doesn't have such an issue, so only skip native.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib_global.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 973ac9130b..c95c3a586d 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -184,6 +184,9 @@ python multilib_virtclass_handler_global () {
     if variant:
         return
 
+    if bb.data.inherits_class('native', d):
+        return
+
     non_ml_recipes = d.getVar('NON_MULTILIB_RECIPES').split()
 
     if bb.data.inherits_class('kernel', d) or \
-- 
2.44.1


