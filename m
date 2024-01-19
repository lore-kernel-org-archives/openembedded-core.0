Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86C6C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:34:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19965.1705664038577596569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 03:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j007g14H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1748114a0b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J9wrZ9012464
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=TRadU
	Cj4dayOeVE0xYXrqVQ50R5H9bOoOITnXX8PY0w=; b=j007g14HB5Mg9MTX+DKtv
	GsLvwP/46cQ8dkPBPrOrJRAIKP8Vn96hqCcSc8tTNfBaPm09BlcxvmLwV8TsVHI2
	9XyQswjlbPVTaMWoI8rjbHxPDhdJqgO0zRTp+CHUF/2TR/JMOT9ssQmP9OgBb+dH
	lJr+mzGeW4N5ea9QQ4+HI/jA9f+Rb3TTC7Asz5WgXtdvmzgrCZtC1tqF9nOmT73e
	yAo9L6NYJPAa5fn5U2w39DBmybsyZFDDBYB3TTrciV9txDB47RSPYNZEX1Y8IzN7
	bip/P+xqUctkw2boR4LqRtSzMMFirk5EHeY/h3jcMHBPlxzytUVSszOAyKNCE7Mi
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxf01k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:33:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 03:34:07 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 03:34:06 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] xmlto: Remove the explicit PV setting
Date: Fri, 19 Jan 2024 19:33:52 +0800
Message-ID: <20240119113354.3000697-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jAoj2MwFvhNbeh-twlJiXVsgEtoMu3pG
X-Proofpoint-ORIG-GUID: jAoj2MwFvhNbeh-twlJiXVsgEtoMu3pG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_06,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=568 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194029

From: Mingli Yu <mingli.yu@windriver.com>

The latest release for xmlto is 0.0.28 [1], but the PV is set
individually [2] in terms of backport several patches to fix
builds with newer compilers after 0.0.28 was releases in 2015.

[1] https://releases.pagure.org/xmlto/
[2] https://git.openembedded.org/openembedded-core/commit/?id=27a5000724e4f4df274279bcd801d1dc2830208e

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index d5a0e69849..69f989f5b8 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -11,8 +11,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-PV .= "+0.0.29+git"
-
 inherit autotools
 
 CLEANBROKEN = "1"
-- 
2.25.1


