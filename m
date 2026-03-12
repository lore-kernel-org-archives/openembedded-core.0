Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7983C1067030
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22419.1773324605491670307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AyfrIrHS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDEw133876;
	Thu, 12 Mar 2026 14:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wUFy0oMS3o3TH+oV+vFX8lwwu9VMxBIBALskk9G57BU=; b=
	AyfrIrHSjKEKkmTl/Q6m9qbIdDTo9Hr7bVdxbYJhn8NrKgFLd+XCYB5KQb6ZHHBK
	4JZ46T+17jCf03WnQVFwVD9Qksid9VPQNYkovOcHpi5BqfVp1Fgb7q0MPBHI6AVH
	Xe3BaijXi5IWj1lw2iLDFHou+cM/9QKX61on4RKT86UjaVWIIib1VMrVHEi36NaX
	jbEke4J/APiiSZyhd0f1NoSex/8E05JL2Nc0ZOwgSvmF4IjQTNp8+E1xYQupceH7
	+75YbWfFDLJl/K/QVpYNPpmUD/fBct+VqTYUkreIzp5oNCZZfOfkbGx5Vll5M5rD
	VT+8mqRJbbf37guwIEd+CA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:43 +0000 (GMT)
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
Subject: [PATCH v8 6/9] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Thu, 12 Mar 2026 07:09:36 -0700
Message-ID: <9140ceb39e37e1bcb209f94fea3a457d8aa63a89.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gapTKJIqGg6EsbFFSPVkBaCGzCUe8jjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfX677b9y8z1q2Q
 dTePSNRi6qJNPT7Nc3YemWP/Ss0npPj3yLuxJF9YNNxGPBM5yjl2jYlAc0tuEECD7SqKkaoGFUa
 h2S15yj3DGZgoM3cpwj63r4galimwUr66T9tMmg4VIfSkBL81Il9b9OiUSMhIEVPXyQOfSg7yuz
 C7xXWirEf2P98JClh2cI64n2KQXoi+Df7jIG9rmh/Zvhn6BZQBQ7oV8ZW3m8D5QYLR/tyBI6Bbf
 5wjNzloP05qtuYVl2oGNihMQSLR1OMoNl/mHKSk0N0aC5W9gFhhviQ7v8tNaSXgeQdDxJjg/Fnj
 CAiEtl1QIYIV8zZrqWXAuvZTvtKXsv2UYmsIVFPQOhvjdR34eSSq9+EWW1nilLPDChSrXvkk4aP
 6HYEkLqTH/+qBdTkqxCoODDHHkIvf+BRRu8lGB/bkr5c5Uba9FFuiAN2ukmtOIEYm9W4Eioi8bu
 3GnO5xRIgKQ7Af3LhbA==
X-Proofpoint-GUID: gapTKJIqGg6EsbFFSPVkBaCGzCUe8jjY
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c927 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=4Dhi_sbw-4GiiV7o3rsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232959

From: Robert Yang <liezhi.yang@windriver.com>

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 1d71f373a4..9fd8122d77 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -8,6 +8,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 849407cca5..618016b315 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -52,6 +52,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "
-- 
2.49.0


