Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010D3C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:10:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5514.1704921018448278348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 13:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r1/JRzU7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1739c17419=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AIH31i021820
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=W0tn2
	SCJP5Xj3B4Avxd5X6ZjJ1WNRLFCNTND4ub9e4I=; b=r1/JRzU7PfeX7AjSOvv5C
	OLpNpGTTScoaUXJDouBzqkLBWzu9jH0emraok7oiksOdcZEd3rIIf5K0b44vX0+h
	wm7yJ4BdA7ngt7ioEOVKcyCQGeW7UaQzfd3Qx4fbNeduGVWUAn3VjKEPwrtFeMXJ
	qjt61I79i5F1TMGAUGOUj/vU8y21cFU4Ocj82Cd8yTJRhlJcVpKjYl0KKdjd2lx3
	Svmlhsj2+lgQrVySwkx2LJKPGvi2Jw35puCVWp6d+WHIbuQhni5dCAJrw25SDlu6
	ARhkMix3Ic0civVbtHUK/IKOWXt4jmQZlyj0JoQyIlYeodzyv1fXDwij7hhxwsud
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewu5d2a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:10:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 13:10:46 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 13:10:46 -0800
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface names
Date: Wed, 10 Jan 2024 13:10:16 -0800
Message-ID: <20240110211016.1470053-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uKKtDiHjpAFic4nrQj7A7cyhpsk03rb8
X-Proofpoint-ORIG-GUID: uKKtDiHjpAFic4nrQj7A7cyhpsk03rb8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=793
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401100168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193527

From: Joe Slater <joe.slater@windriver.com>

Use a pattern to initialize interfaces which start
with 'en'.  Also, make 'eth0' a pattern so that we
do not see an initialization error if it has been
renamed.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../init-ifupdown/init-ifupdown-1.0/interfaces             | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
index 0acf4cf441..e617fcf69b 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
@@ -13,11 +13,14 @@ iface wlan0 inet dhcp
 
 iface atml0 inet dhcp
 
-# Wired or wireless interfaces
-auto eth0
+# Wired or wireless interfaces including predictable names
+auto /eth0
 iface eth0 inet dhcp
 iface eth1 inet dhcp
 
+auto /en*=eth
+iface eth inet dhcp
+
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
 iface usb0 inet static
-- 
2.25.1


