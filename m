Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E94B106702B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22565.1773324606855208740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pRJFaeu7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDEv133876;
	Thu, 12 Mar 2026 14:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9kgG6tb/hKvuRhAkEysiSZyR3eGmY/MUVVdC+4++xio=; b=
	pRJFaeu7a+bWtq0CERcjudPFhfrtCQMgK0NAmGKOcBrnt/7XsvUQYy7HfZ4mUmyG
	fCx5LVs9aoaRh8LUu/KxlLq3XLAjl8w0MTXMKLZuDi1vzV3xWDE5qW2/r4kkqceS
	jaYVSFwvSyjWoyZfgcRgkhT9iloz0IgEmxE9yYeJuzavVy1HNHWSgy5p6lvPxzwu
	t+fZbzr0gS4TG9gUjfuGuE+DvlZjPH3x8hY3AIMAVmaF5+aNCB6HXQUsKXw79Lfh
	9inAnmTCVEQixI2Fa7m9sUlmC08AcgNS1z5LrjhY/g620UUoe1Hm45q9aJn/qpor
	ttAL8aU6Pa2g5vSSy21ciA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 07:09:40 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 07:09:40 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>
Subject: [PATCH v8 5/9] lib/oe/package.py: Don't redirect stderr
Date: Thu, 12 Mar 2026 07:09:35 -0700
Message-ID: <2527ce44ed02a388581f7221c9e47b4541cee3c1.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: V6-y70gUm0frngUhv9AS-BXlcdaJ4afh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfXw/vPyULA/OGZ
 Xs6YuUNTCwWYMTCfBlt3FW78ma90rO3XNgqTEVNeDG0PmKkiLfTlojcjrXGpiCOLpUy4+lKBcKB
 P1J425gtw+YRaMPA/oNp6YgoGpCrsQrRagl1UEtZsRaEZ/y18+J3xumXsYddmMKvBl+D8J5F2s0
 J8msCo9SYpQVDKMyc4FfvLfRv1IYSTt5hlalsqlsI9WeLieCVrPSFbxLj43AOmkD+O4w2HYZ78x
 M2jATLZ+pFlM8oYFalHMSFzwruVTjfElK2svoBYM7sbvm65XDtGx1XEDMb8glw6FWpSdtPfMrHq
 MIjc4MI78ATzr6E6y53H2QqPOjkH36yMQG+eAVajxz5W80525U8dV4aRy/+MaPpRBflH0s8lD5F
 0lz1Rs64+6NdUB4aHmggERD/MWV95jBgQpBFg7JBTkdIwaOU7NPYpVdRvO8F1AXEE4FT5Fujc24
 jdyEZ0PoTI5BS61yicw==
X-Proofpoint-GUID: V6-y70gUm0frngUhv9AS-BXlcdaJ4afh
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c926 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=G_CNgP1_34ZBAdHNgzoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232964

From: Robert Yang <liezhi.yang@windriver.com>

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d389a9f43b..f97eae104f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -276,7 +276,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)
-- 
2.49.0


