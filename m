Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAA1D24467
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 02:19:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2442.1728613156028842131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 19:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0014d2b31d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B1gten016908
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 02:19:15 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sdq82cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 02:19:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 19:19:13 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 19:19:13 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] regression.py: skip checking status for ptestresult.rawlogs/ptestresult.sections
Date: Fri, 11 Oct 2024 10:19:11 +0800
Message-ID: <20241011021911.396047-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011021911.396047-1-changqing.li@windriver.com>
References: <20241011021911.396047-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TZtm8I6S_h_5JUrVi6ITSzj78nJoovHp
X-Proofpoint-ORIG-GUID: TZtm8I6S_h_5JUrVi6ITSzj78nJoovHp
X-Authority-Analysis: v=2.4 cv=LfZu6Sfi c=1 sm=1 tr=0 ts=67088b22 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=kE7PL1y5uTkMCJOHyisA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_19,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=760
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410110013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 02:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205652

From: Changqing Li <changqing.li@windriver.com>

ptestresult.rawlogs/ptestresult.sections don't have status is expected,
so skip them to avoid following error when running "resulttool regression
base target":

ERROR: Failed to retrieved base test case status: ptestresult.rawlogs
ERROR: Failed to retrieved base test case status: ptestresult.sections

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 scripts/lib/resulttool/regression.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 204e6eecb7..33b3119c54 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -212,6 +212,8 @@ def compare_result(logger, base_name, target_name, base_result, target_result, d
 
     if base_result and target_result:
         for k in base_result:
+            if k in ['ptestresult.rawlogs', 'ptestresult.sections']:
+                continue
             base_testcase = base_result[k]
             base_status = base_testcase.get('status')
             if base_status:
-- 
2.25.1


