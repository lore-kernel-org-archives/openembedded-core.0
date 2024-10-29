Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A8CD2AB05
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:17:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14824.1730193446912947186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 02:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=103298b06a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T4cLXm031504;
	Tue, 29 Oct 2024 09:17:25 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8kau1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Oct 2024 09:17:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 02:17:23 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 02:17:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>
Subject: [oe-core][PATCH V2 1/7] meta/lib/oe/sbom30.py: correct python list comprehension
Date: Tue, 29 Oct 2024 02:17:17 -0700
Message-ID: <20241029091723.2851061-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091723.2851061-1-hongxu.jia@windriver.com>
References: <20241029091723.2851061-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qAGH4A77Hn4VTCxp3KqgnRbLT1WSchy2
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=6720a825 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=kB6j27Rbq3LGHQ-lY6oA:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qAGH4A77Hn4VTCxp3KqgnRbLT1WSchy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_04,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=859
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410290072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206478

The python list comprehension is not right for list:
>>> license_text_map = {'LicenseRef-FSF-Unlimited': 'http://spdx.org/spdxdocs/gettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/8d31e22acc4a8979f24dc24042692fb548fc8fc8d85d775ddac406abb122ceea/license-text/FSF-Unlimited'}
>>> license_text = ((k, license_text_map[k]) for k in sorted(license_text_map.keys()))
>>> print(license_text)
<generator object <genexpr> at 0x7f8575173270>
>>> [(k,v) for k, v in license_text]
[]

Change the () to [] to make it a list instead of a generator expression.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 27ab5e45ac..8db90f30fd 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -577,9 +577,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
         ]
 
-        license_text = (
+        license_text = [
             (k, license_text_map[k]) for k in sorted(license_text_map.keys())
-        )
+        ]
 
         if not license_text:
             lic = self.find_filter(
-- 
2.25.1


