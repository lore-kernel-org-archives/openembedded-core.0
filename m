Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC03E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:47:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22370.1736351240322837706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310345b2cc=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5088Fodx011901;
	Wed, 8 Jan 2025 07:47:19 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphrqjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jan 2025 07:47:18 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 8 Jan 2025 07:47:18 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 8 Jan 2025 07:47:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <colinmca242@gmail.com>,
        <JPEWhacker@gmail.com>
Subject: [PATCH 1/3] meta/lib/oe/cve_check.py: fix patched_cves not updated
Date: Wed, 8 Jan 2025 07:47:16 -0800
Message-ID: <20250108154718.3031653-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hW24wPY4kJU3nQDvZV6lZJ8xW3Air8cO
X-Authority-Analysis: v=2.4 cv=Oa1iDgTY c=1 sm=1 tr=0 ts=677e9e06 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=VeiiIR8w4iMOD6i4s64A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hW24wPY4kJU3nQDvZV6lZJ8xW3Air8cO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1011
 mlxlogscore=845 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501080131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209573

Due to commit [cve-check: Rework patch parsing] applied, it missed to
update patched_cves dictionary if cve_id not in patched_cves

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 85a899a880..5c272ba4ff 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -170,7 +170,7 @@ def get_patched_cves(d):
         patch_file = bb.fetch.decodeurl(url)[2]
         for cve_id in parse_cves_from_patch_file(patch_file):
             if cve_id not in patched_cves:
-                {
+                patched_cves[cve_id] = {
                     "abbrev-status": "Patched",
                     "status": "fix-file-included",
                     "resource": [patch_file],
-- 
2.34.1


