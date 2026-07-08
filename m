Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25D5C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:31:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4599.1783502914230086933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W5Frpm39;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild10.wrs.com, ip: 205.220.178.238, mailfrom: prvs=1649fb9606=hbarde@oak-lpgbuild10.wrs.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688Br7m3613463;
	Wed, 8 Jul 2026 09:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=QC0VOq4p5
	UpBJWxosZ8pDp5mgDY7z18dT07n6987iKs=; b=W5Frpm39hZmfAEig3Zf58X0Lf
	dfroXsIFPQK2GXJQ0p8wR9lTcy8gHRXkJVpHUhjLPi/lexZcOlbFodik1GdsuzFl
	PiCpypbH6mvKtE/W8CQ6OVk04cEMRmD5L+EWjVewtpfEJpbe3Uxwy37/mLJzwKCx
	RVeG5NJHtNrFp5xUC/YFJZ3TpcMpyryk1n4YlUORGECvqfQ95Mk76UB5eDFflEBD
	HFqjBUvNXcFetN7Y2ydwDWfxZCNi+oOaiVtQO3eTpy7jLVmeV80yJ/N9LlVYOWU0
	AEmhJqR9TuvrqGQCYeT4pAWS64GzqgAo4qhSgtYnSkuTDKMhgJ4fjN8aqEZcg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6qcwdyhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jul 2026 09:22:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Jul 2026 02:22:56 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Jul 2026 02:22:56 -0700
Received: by oak-lpgbuild10.wrs.com (Postfix, from userid 1762445298)
	id C79F2A88D8E; Wed,  8 Jul 2026 09:22:55 +0000 (UTC)
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tgamblin@baylibre.com>, <randy.macleod@windriver.com>,
        <Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH 0/2]python3-setuptools-scm: fix build and upgrade to 10.1.2
Date: Wed, 8 Jul 2026 09:22:50 +0000
Message-ID: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=D4537PRj c=1 sm=1 tr=0 ts=6a4e16f1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=gDZZjt-lw1u9C-BfYNEA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: 36WeZs7_lUKGTmQJ4MKx_cWrHGM85bPM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfX2DsMXaulJ49S
 rtLg0nwPjIwXcWfuTUYRRKI4Ho9VNJubEdxvhbJ29CMW3g/Hl5hU45UemMsQVAHGe6ggS7jUyTd
 w9MUTu4i9OlhacvPmR0DLSLuzYC/cCaegcITdJQO182fs4qL4Cle
X-Proofpoint-GUID: 36WeZs7_lUKGTmQJ4MKx_cWrHGM85bPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfXwhBOj6Hwr58u
 ZO1U+gADvN9WW3KeC+8Vmju9gao+hm3r7Bb3z+HFoSPHByNasrKUbhwMxMKdSEAkBk5y4wdsNJA
 igNFR5U3Nc4JN2i4lelGz2tbHSD2SOT/W6cWpftVhyY2pxVAlMlSe3FMolyTLhPxEqOAnN0a4lw
 WJvvqVQkKPA6gmq/7Bnz8xp8QNUY/wF3S8Sxe60k533E0qhHYiQCg+gxNgPfxhXXg0Pj4UQ/Su1
 ixD+A2agrgO9c7JbU0UazSbPXfC1HN011kHxQyk54oNXxGEsKTIq9ViF0M7aUCF6AEoBaY2zqxr
 YFIKGeoiLjg+bAzrNz8rqkJQpmDj8jgMh898HE8ixwquBbWUY9cdyPB/DzWIGHuxv+Kox01SMi7
 09MhgLgOOhkDC3qc/uxAHRTX3Iu8KUILQGcqM+dt/zRLS0IfCQbbvS3iH1Z1MQDfScSG5c6PM3C
 n0t6Ie/cnzS9ZXTOnVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080089
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240448

The AUH attempted to upgrade python3-setuptools-scm to 10.1.2 but
failed at do_compile because setuptools-scm tries to determine its
version from SCM metadata, which isn't available in OE tarball builds.

Patch 1 exports SETUPTOOLS_SCM_PRETEND_VERSION to bypass SCM-based
version detection. Patch 2 completes the upgrade to 10.1.2.

Build-tested: python3-setuptools-scm, python3-vcs-versioning, and
python3-pytest all build successfully with this series applied.


Himani Ramesh Barde (2):
  python3-setuptools-scm: avoid SCM-based version detection
  python3-setuptools-scm: upgrade 10.0.5 -> 10.1.2

 ...uptools-scm_10.0.5.bb => python3-setuptools-scm_10.1.2.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb => python3-setuptools-scm_10.1.2.bb} (84%)

-- 
2.54.0


