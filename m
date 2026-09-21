Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74667C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 13:48:34 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49438.1789998509315708453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 06:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=Eo0t7/2p;
 spf=pass (domain: de.bosch.com, ip: 52.101.70.56, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBBDdRZ1jJzm9a1BO7M0+gPCRTFPntYpD2opCFFvrwC0P+Fuo5Hi8Fzc0IKtVind0XCZcnt6amm1vv8SW149Ye81pun4/TsBhxluqgtEMWTPKKAlGcUlM43GstJis5UFe0gYuJ3PANbqT1UHFRqOs188QYLXkkYuutXvdTShskTBiYT7giSzK31rb+BFZY3RNzWj7AtSmFv8S7N2+nS/FMARV8rU/ptQl4IwMIzWvdLFgLmElXZ2/aIiFyAoJg9QWWv1hmOXBj6cEKb0U4j0avCksY67Fv5g6bQ/CaovHewpd2+jekV6hzwHWeLBcxkiYkC57q0CX6hrznxs/dl+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2emioAY+ZRYr1okBVGuMRU45x8qdSe0KyEBJKW+NabI=;
 b=hTxCMcvdMp4LwF39dMAbwMoSJdQcCJ+H8cTYIxZZqQ4sd6MZlCxifyzXjinQ1TFVJcbGdz79iz818ks4j/sW3M4rxIG8WKJ8c98WfPzRSB8EMII+Hqux/BFCqvbVh2QQXUUrB+GhdyXS3mjPjbbdhBmrsKNkcTJP4elPkUVWFFI7pHvpKcRhnEMQng7Pu3EqnZadt04S61ljL98juiVIiubT30bQm4i8wHS+iPFxB1YSTfAn+5cyetyx22YErLlgFwZdZWCLEnEAsC2ZQgzWBZxm+7VFRFcqLI0YOHGuFwC2VHJREnc4vHU/21sg8P+AyNsJ+ECSv8uP1e2mGkWg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2emioAY+ZRYr1okBVGuMRU45x8qdSe0KyEBJKW+NabI=;
 b=Eo0t7/2pcBZe/EOQyLYUkDkFl3cjuYGiIA2sgseNyblekHdSv/r+rHbxdJUd5CKVUwlU2BBDZ892GodZx/KMLYu9VdU0CzjLRq6l9kz+101rES41r4Q015r1Q/933rRb/Yuprggqv0QT2BVeH7/SpwvWiDeUGaLWKJwz6oIoR+ft8zjYsjCEysGO2iqzT9AoGhGh0MAoPxPiU8tLADh9OD+WiNntcawtENbR3AhjchzBNLUECH3Biri0coxwdcIFCf/vIdYFZpWXb7OlsadMNFKAXdT34I20KL70HlD4klCwLxalKmuYS6XWzej9RZ4yZw0Go29QV0X5SQiYM8DPOg==
Received: from WA1PEPF00005B8B.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d8::63c)
 by AS8PR10MB5808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:523::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:48:25 +0000
Received: from WA1PEPF000099CD.eurprd04.prod.outlook.com (2603:10a6:1d8::165)
 by WA1PEPF00005B8B.outlook.office365.com (2603:10a6:1d8::63c) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6
 via Frontend Transport; Mon, 21 Sep 2026 13:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 WA1PEPF000099CD.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 13:48:24 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 15:48:07 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 21 Sep 2026 15:48:07 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [PATCH] udev-extraconf: Add missing commas in udev rules
Date: Mon, 21 Sep 2026 15:47:24 +0200
Message-ID: <20260921134724.1974-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CD:EE_|AS8PR10MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: d84a0845-b2e7-4979-0237-08df17e70221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ok0bCfkn/cpPVgNsa4/tNAO6N9DiLRCRvlv9De7i896seV+hO6Hj+Ip25geQKyh62fMDEdCQ2MJy/5DdA5zOguPJp7m2AKqO0DWsGJEE4fqYSosEwrHRkGc3q1TMOtNay+XSamPmmJ//Ph0nsbNZ3Iqt8bJnZgKaPafGqaqRXaK7vGy0sFGJ5gFiEJuiDEDO6qTmTce2WWVqifPcb2i53I0+XGdhV6Av59sMoSB7OXGGlmEziDSkac3Fv6ACQeA6M8NKeAI+ZiarpYLSoINe+Kkd6P6nHZn3K+ZiUfU/Ib+Po5aFZ9lGFguwmSInL89J7AgFzUNwkgs/6dau4oypiF4HI9AxN1TjamkrC51MPu7W/bvph8Yz9nPE1UT4KUc5YZ/i62gWNu7BQbDyLa0LhiPNUIzZmsVGUVLSFPMOg5uUwmc695DKUEjZyIsE6KLYnTWH7r3XC3s9HeKsWGOWqJhITZqoSh01HqLFx1DzPWkN0/14O3MS0b+VzMEuYsU4va4EofxmxH7GaOuId0mdjRPXam5qYyG1MDLJ4NpWhoovjcWzZI9jy5ojns08i1D/xGbdiEwZGfa/7As0qDjBYxefeDSFSz+qobzTpn+/5GOyvWKX81FQ8ks1A7S6OtGNCCXG5oRgYFLDGN1bnHxEx7mmCVnXCTsHWPr3Om2290WkuxPUnyJ+rp+/oBJxGulppaCdK1LjU0dJRZU/M245FQ==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BsJzoxZ4XytdEZkORbisQYE6i1Y8EsBL+VJT4IjEwmgvLTU+ZBYAT2ZOzDZF7CPdPQNyx25BngoGFb7jfFjxRLh2Mrc95tNOYEPt57L+TVcDlI0tTsIZYTsGUnwnC3+C4m97Re3rApnZz0UGvayYS0WDEVTrIC5v1f3S4jXPJaTUB6xEqH1dZj21uz3GwqBG3fmr16xvhRK3RPYpSEu8jwLdDftfVCd6g4mnJH/lVJ/RliWGTqeh/iGGPY3cgIFv3My5vr6tY/3+JXazTE+HeFUkY18ZXpLK1dGAu4hvPbihX3IpirwH1SkM5kPSqYDMERt6/zRibOKKuu43LqvpWIx8HPRAV/H9y8Jf06EEcDZ3vWHaEqYH44VHPS5rQOGXhfQlpETLVCX8IhrLTnruDKJACXhvEuGZUqoJO6C/wh2kGE/U4cnSwnxNOlueB1m7
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:48:24.9481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84a0845-b2e7-4979-0237-08df17e70221
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	WA1PEPF000099CD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 13:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246332

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

As per udev(7) man page, each key-operator-value must be separated by a
comma.

```
$ udevadm verify /etc/udev/rules.d/auto*
/etc/udev/rules.d/automount.rules:17 style: a comma between tokens is expec=
ted.
/etc/udev/rules.d/automount.rules:18 style: a comma between tokens is expec=
ted.
/etc/udev/rules.d/automount.rules:19 style: a comma between tokens is expec=
ted.
/etc/udev/rules.d/automount.rules: udev rules have style issues.
/etc/udev/rules.d/autonet.rules:17 style: a comma between tokens is expecte=
d.
/etc/udev/rules.d/autonet.rules:18 style: a comma between tokens is expecte=
d.
/etc/udev/rules.d/autonet.rules: udev rules have style issues.

2 udev rules files have been checked.
  Success: 0
  Fail:    2
```

This patch fixes the errors shown above.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-core/udev/udev-extraconf/automount.rules | 6 +++---
 meta/recipes-core/udev/udev-extraconf/autonet.rules   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/automount.rules b/meta/r=
ecipes-core/udev/udev-extraconf/automount.rules
index 62578ea631..88842f5247 100644
--- a/meta/recipes-core/udev/udev-extraconf/automount.rules
+++ b/meta/recipes-core/udev/udev-extraconf/automount.rules
@@ -14,6 +14,6 @@
 #
=20
 # Media automounting
-SUBSYSTEM=3D=3D"block", ACTION=3D=3D"add"    RUN+=3D"/etc/udev/scripts/mou=
nt.sh"
-SUBSYSTEM=3D=3D"block", ACTION=3D=3D"remove" RUN+=3D"/etc/udev/scripts/mou=
nt.sh"
-SUBSYSTEM=3D=3D"block", ACTION=3D=3D"change", ENV{DISK_MEDIA_CHANGE}=3D=3D=
"1" RUN+=3D"/etc/udev/scripts/mount.sh"
+SUBSYSTEM=3D=3D"block", ACTION=3D=3D"add",    RUN+=3D"/etc/udev/scripts/mo=
unt.sh"
+SUBSYSTEM=3D=3D"block", ACTION=3D=3D"remove", RUN+=3D"/etc/udev/scripts/mo=
unt.sh"
+SUBSYSTEM=3D=3D"block", ACTION=3D=3D"change", ENV{DISK_MEDIA_CHANGE}=3D=3D=
"1", RUN+=3D"/etc/udev/scripts/mount.sh"
diff --git a/meta/recipes-core/udev/udev-extraconf/autonet.rules b/meta/rec=
ipes-core/udev/udev-extraconf/autonet.rules
index 19676aa13b..2c02668097 100644
--- a/meta/recipes-core/udev/udev-extraconf/autonet.rules
+++ b/meta/recipes-core/udev/udev-extraconf/autonet.rules
@@ -14,6 +14,6 @@
 #
=20
 # Handle network interface setup
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add" RUN+=3D"/etc/udev/scripts/network.=
sh"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"remove" RUN+=3D"/etc/udev/scripts/netwo=
rk.sh"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", RUN+=3D"/etc/udev/scripts/network=
.sh"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"remove", RUN+=3D"/etc/udev/scripts/netw=
ork.sh"
=20
--=20
2.34.1


