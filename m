Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3F9E67A87
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12730.1772521006616928060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p98h+HFx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234sKoY1536224
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=APaOU1WdYajt3TUKF7+ja2OwYC0U4YEG5IFSk8HtGPY=; b=p98h+HFx8Aca
	M4CY9Sn17ui3l3HQodksMSYHeA38BCEIHXbTwVSwLPRL5SQv4IAzDMwA6I+0oJkE
	/Nacf9wpv63HfnCdUsxoNPWHHQJXU0j9r54wkipv0gCiKc+QjebaZyv7R8HTfl3q
	12WQEWJfBdb/sIb42CvuImeaZtElUKI6FKbMND29ETXt08Iz5j7x99OCYaAsReTU
	Sl98A2YJAR4T5cF3FI4Uq1JdBPCsHpS3VyZrM4RwY+NRMS2AFJSRHvhO5oHHHceB
	L9z9NbRpBZVM1gkdPjf7ujebwmUcNpje4eagSwxvxIdA0gjR61xPKzLJBzq/XOq/
	VoiNhmgJWw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kac0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:45 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 04/19] ell: upgrade 0.81 -> 0.82
Date: Tue, 3 Mar 2026 14:56:25 +0800
Message-ID: <20260303065640.2541884-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a6862d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=LGoDYoR6XVE4qATRCkUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CU8Eq_3A7ixDQXlAPRnTe54PntdVnzjq
X-Proofpoint-ORIG-GUID: CU8Eq_3A7ixDQXlAPRnTe54PntdVnzjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX147Qk7pXiXk0
 7pUuuCTbAev+ad+eIlHxf4E2celLzLbbHWq2QcddUTELOVoaNW2Fu2eic1ORql+JFTxhogq4Ew1
 9QZm44Svljm0HxawrXpE7ecTaGRPoKmOEutKXdlDE8Q6p/rQZz2lDzGrxzwMNtHQc1i6UMXlpz4
 0U+Rq3wwL4r6t7annPj/slAjtLcTNjzLnQKYToGsDY+KVjWGZJ042rKjJ/W8gUH1nr2UlWNaBlH
 PYJbs+G+ovXWdykVr8Tt/BWN+h3nYQ311Anj1u0Ny6otjltsPAjeEEhLiGimUub4frCFCGD3uyQ
 zJoNUGPsuAmRFUtNgxLCXG+NdQDz1Kgv4KP0YOYtQ3HjCaBphCkgxSrki7wUAa5h86MXYNrvgIu
 vg8F0RUJWbWVpnhDrbkAFROb6ZKNeGM7l2uXjwO0FqGjHJKL/sTW9qPQeTzVwapOWzSPB5Dw4wA
 MHLOv5CZpuEw5Mq3aFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232242

ChangeLog ver 0.82:
    Fix issue with using -std=c23 compiler setting.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/ell/{ell_0.81.bb => ell_0.82.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.81.bb => ell_0.82.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.81.bb b/meta/recipes-core/ell/ell_0.82.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.81.bb
rename to meta/recipes-core/ell/ell_0.82.bb
index f9b702531a..ec2b563035 100644
--- a/meta/recipes-core/ell/ell_0.81.bb
+++ b/meta/recipes-core/ell/ell_0.82.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14"
+SRC_URI[sha256sum] = "133a9273151090b4cc37676063cc00ff350a093032ba20a2aaf8b3c5fd6f8b6d"
-- 
2.34.1


