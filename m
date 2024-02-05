Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41F1C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 18:56:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2274.1707159370160412830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 10:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nSIh2J1y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2765244def=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4155p3Rs006346
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 18:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=3WMhZ
	Q1JxXucZhcOcfm3vUDTpXqlHZl46ED0uIINKO0=; b=nSIh2J1ygslvqd67+Sj4Q
	wSFLFagbC+lIGUJQCR5w8T76Xmg6qXWz2WTfKt2nRJga8Sp03KCqJQOX0j/zYRxs
	OHEnzDmcKXWxyNJvYrSdoPQN3B43BG3dKzm6x8r+iAFg/0BjVHetifsGg1mqJ5SA
	E/rsZM9Rbon9L/1m3xVtGCuCb+da+k0x099/ICEX/zmOOtzOEXma/7bkxFVP54H8
	GuK9XjqJBYhEBtT3iLG17fc7S2ArDSZxu3fVIrU8XbIp/3O8kse8fSJnub7azzzS
	yoA8bLRMq6HTr9bDs/D/NxV4XNeAC6MQUVg0x2KCxbMlwXlFEbvQKJ5IbkdotoAU
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs7a418-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 18:56:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 10:56:06 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 10:56:06 -0800
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] qemuboot: predictable network interface names
Date: Mon, 5 Feb 2024 10:56:08 -0800
Message-ID: <20240205185608.1497595-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nVQJ_Wqtc6ywAOqpCXScKJckl5Xjflug
X-Proofpoint-GUID: nVQJ_Wqtc6ywAOqpCXScKJckl5Xjflug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_13,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=622 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402050141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 18:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194963

From: Joe Slater <joe.slater@windriver.com>

Allow interface renaming if 'pni-names' is a distro
feature.

We do not add QB_NO_PNI to QB_CMDLINE_IP_SLIRP because
renaming was never suppressed for slirp.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/classes-recipe/qemuboot.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index ff32aac902..4a2a6f1ef5 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -101,8 +101,11 @@ QB_DEFAULT_FSTYPE ?= "ext4"
 QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 QB_OPT_APPEND ?= ""
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+
+QB_NO_PNI ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', '', 'net.ifnames=0', d)}"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
-QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 net.ifnames=0"
+QB_CMDLINE_IP_TAP ?= "${QB_NO_PNI} ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8"
+
 QB_ROOTFS_EXTRA_OPT ?= ""
 QB_GRAPHICS ?= ""
 QB_NFSROOTFS_EXTRA_OPT ?= ""
-- 
2.25.1


