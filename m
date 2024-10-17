Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8794D2127D
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 11:15:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46013.1729163723339963619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 04:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0020a0abc5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H5U2Rc014193
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 04:15:23 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3989ueg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 04:15:22 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 04:15:21 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 04:15:21 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sanity.bbclass: skip check_userns for non-local uid
Date: Thu, 17 Oct 2024 19:15:20 +0800
Message-ID: <20241017111520.3456904-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Wzirlqwh1v-inbaf-AeBSUIHYO8DTQw0
X-Authority-Analysis: v=2.4 cv=F7EFdbhN c=1 sm=1 tr=0 ts=6710f1ca cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=4NFgcF_JjhmXo6FzB2AA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Wzirlqwh1v-inbaf-AeBSUIHYO8DTQw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_11,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=663 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410170076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 11:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206012

From: Changqing Li <changqing.li@windriver.com>

Bitbake preserve network for non-local uid, refer [1],
so check_userns is not needed for non-local uid

[1] https://git.openembedded.org/bitbake/commit/?id=4eafae7904bae6e5c6bc50356e8a9077f2e207fa

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-global/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 72dab0fea2..a0b2508e11 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -484,6 +484,8 @@ def check_userns():
     # succeeds (at which point the uid is nobody) but writing to the uid_map
     # fails (so the uid isn't reset back to the user's uid). We can detect this.
     parentuid = os.getuid()
+    if not bb.utils.is_local_uid(parentuid):
+        return None
     pid = os.fork()
     if not pid:
         try:
-- 
2.25.1


