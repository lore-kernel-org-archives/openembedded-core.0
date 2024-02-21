Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A23AC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 00:04:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1731.1708473860172231657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 16:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s/9mYHTY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=278168f1c2=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KJBftC029639
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 00:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=pPeK9
	FXxEcGY1jVrM0d+HbPuyhDbO6cO825/2b8R1Wo=; b=s/9mYHTY3Fqhl6DW/eaKG
	hMrsyxakQlr673Tw95ag4ChjrHA1IudMDGY3T7iAazBcl3tOAwEI527CXmu98aP3
	T4d21KDKhWN3NgZpg1Y8BF7HbCW5OrFZbotOGJnQW0OACGnhio3U9pOi6pQJ8SjO
	UmFgMA9DxTBmGKDMRRbsqT3Se54TQ0oL8B8Y66d7u8EI1TLuhMzrMdEEXAAIzkQW
	aHRJCPRu2xAfU6tTel1cnZh9rN8sUD5N/oRlwzUpjocoUmYI7X8CxVD0b8glo5JH
	GB7AzmGuf/rszrcHYdj80nBN2Kri/D6LGHHZIXdfNLmU41RsI3xQfmnhDgBd/YHQ
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd21787u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 00:04:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 16:04:17 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 16:04:17 -0800
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][oe-core][PATCH 1/1] qemuboot: predictable network interface names
Date: Tue, 20 Feb 2024 16:04:17 -0800
Message-ID: <20240221000417.2846910-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: J5jX7RVL61Lwq5DSKN58iP10ZzdXiztP
X-Proofpoint-ORIG-GUID: J5jX7RVL61Lwq5DSKN58iP10ZzdXiztP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=696 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 00:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195931

From: Joe Slater <joe.slater@windriver.com>

Allow interface renaming if 'pni-names' is a distro
feature.

We do not add QB_NO_PNI to QB_CMDLINE_IP_SLIRP because
renaming was never suppressed for slirp.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/classes-recipe/qemuboot.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index ff32aac902..4a563b8ccc 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -101,8 +101,13 @@ QB_DEFAULT_FSTYPE ?= "ext4"
 QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 QB_OPT_APPEND ?= ""
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+
+# qemurunner needs ip information first, so append QB_NO_PNI
+#
+QB_NO_PNI ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', '', 'net.ifnames=0', d)}"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
-QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 net.ifnames=0"
+QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 ${QB_NO_PNI}"
+
 QB_ROOTFS_EXTRA_OPT ?= ""
 QB_GRAPHICS ?= ""
 QB_NFSROOTFS_EXTRA_OPT ?= ""
-- 
2.25.1


