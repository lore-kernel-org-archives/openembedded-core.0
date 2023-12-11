Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D030C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 00:58:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.97077.1702256303133320729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 16:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SlUUQMnT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0jShr001854
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=HGQJmV5MYdR7cP3kwAHgwVy5d3q2SwJPXqzIKchuq3A=; b=
	SlUUQMnT5nDKCuc69LKxIeh5cE9WZxX2Z782JRtK4OLV42Abuwr6HU+7mH30i3+Y
	D1HhqT4D1iEkqLac921wnj4tnuRMr2ve75wbeaxDcEguj+3kz+W2XFEcr5KwzZXl
	dwI+GYLEavsZ6KmKRwmDdDxXFa7AzhCruOE5eTBR8FYha5gRwQfeypetlDTM1it3
	xhkTF/pjtOcDdjJo0BFlgt05IdEd5vBLLj8wrS5cTJ0lLvbgGwz1VMtuEfQk2LcH
	WRDxYE4iRIamISVwElFHPe6CVJEkCEA0MTCtEkxJonzUlmIjsj6K0huERsmoH2mT
	2gRvJeMJf2A/rp3peBJOcQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvrmkrvwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:22 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:58:26 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:58:26 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] eudev: create dir /tmp if persistent tmp is used
Date: Mon, 11 Dec 2023 08:58:15 +0800
Message-ID: <20231211005815.1119314-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211005815.1119314-1-changqing.li@windriver.com>
References: <20231211005815.1119314-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: RJI5cv8sOUL_xJKAYpoijc5D3nqHO5Di
X-Proofpoint-ORIG-GUID: RJI5cv8sOUL_xJKAYpoijc5D3nqHO5Di
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=660 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192135

From: Changqing Li <changqing.li@windriver.com>

the automount rule for udev needs /tmp directory available, if
VOLATILE_TMP_DIR = yes, to make sure /var/volatile/tmp exist, if
VOLATILE_TMP_DIR = no, to make sure /tmp exist.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/udev/eudev_3.2.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index d0758691bd..56c2e453b7 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -50,6 +50,10 @@ do_install:append() {
 
 	# Use classic network interface naming scheme
 	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
+
+	if [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } = False ]; then
+		sed -i -e 's%mkdir -m 1777 -p /var/volatile/tmp%mkdir -m 1777 -p /tmp%g' ${D}${sysconfdir}/init.d/udev
+	fi
 }
 
 do_install:prepend:class-target () {
-- 
2.25.1


