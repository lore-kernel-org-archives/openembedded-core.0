Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D38C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 17:25:12 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.74])
 by mx.groups.io with SMTP id smtpd.web10.49646.1673198709046474061
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 09:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=U+eFmRSg;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.74, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6rSZzrA2RJPKtFmKaeFPprOALWHhyjFvQ+76k9oplu6pPaZHTwQhZktW6RpR61ZrHbNCdYayFHZ2w+ILbK6KwUpKrc8SfE3VkxIy+oDndXts6TViMqtAoB3Obmdl4d4hGUVMy7Q159GbqiEbHuYU9v8yMuwNeHI125qPf1sDyQqIF1vr7+VW0EnSPKyRADy85GMwK45aDH5CIZRhNAdbW0guXO+KMJeMVDHn8TcvREIrKEU7TtvY0T7q1knfNtrBC3OlDRSukCHpj0epBqAqkBWdCIclh/JiZFIVtZhbOt/0KbRAIniVr9QI8WIFrJgpvaktnv/PLhxLkYflKXCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivBBKUsnf0p0KCsUaUbzhf0D6QK4DFXpP0SAHvp9TJ0=;
 b=P5LwAUnuh0mZgl9yvhJOtHtU6PDhUwzRt/updfQ8/yqsviaYWYT5Hovc2aSSwyP2XwqtclumH58ik9rsmDKk71osfXNAFPVCxiqOjcqy0JloyTQAaDjjdlXiRSfhSOXfM7DSPg+F3G5Tdke3dQ2ULKgMYrdUpCrtbmD84JyD63v2XiopYlknDHyAnQLzj4HT/ax18/V/ek8fHdZbYpZgF23cBS3pjijRzM5rj4djAG0On0VNKc0DZsRC4GN30JsDGSR1kHT19RY6mC0NeC+Q8wQej92fgsv8blmNymjEtU00quoqCBAx2Dbgc0v950AdYAgCf6oZgZzYC2Ync1kpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivBBKUsnf0p0KCsUaUbzhf0D6QK4DFXpP0SAHvp9TJ0=;
 b=U+eFmRSgYDYGMPX5wxAI75awYzJVWs5fUP50dEdzmdMHgK6wYPqb3WnDr7/BFT4pYjCA/Kd/QJraVb3J3ldyMbzqs+xQBgEj1eS9QcQbPjWpRcO64PJ+95OOyhNHCTgBV3OpJ9kq2M6v8xWsC8C2AHkoOC2cdZWnrNWzqQXKXcE=
Received: from BN9PR03CA0929.namprd03.prod.outlook.com (2603:10b6:408:107::34)
 by SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sun, 8 Jan
 2023 17:25:07 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::fd) by BN9PR03CA0929.outlook.office365.com
 (2603:10b6:408:107::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Sun, 8 Jan 2023 17:25:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Sun, 8 Jan 2023 17:25:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 8 Jan
 2023 11:25:05 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 8 Jan 2023 11:25:05 -0600
From: <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>,
	<michael.opdenacker@bootlin.com>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-core][PATCH v2 1/2] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Sun, 8 Jan 2023 10:24:56 -0700
Message-ID: <20230108172457.2365468-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 7705591d-d942-4a29-45c0-08daf19d4921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u3ikaIg7fRiDk4bCZ0YOlqoV4eqg5FbPSTJvlfikvvwIr7Ke3XhIZLFVoEwRWGK7WVMqa1kHro3g62zp8ankArMVU+WY/QOZPXZjz6/bCpcxGGIheDHDPHtFweRkBHsrc0VpnLE6LxgPDuIguKkBSAOCjxnf3nPzmwD1lWjiGhPwgD5pa1sjB0cBfWdFrtknhITQvziM1zA7WHNFaXiRlhQemoQnC22hbDgzG9WYxaytmEk/XhJH2mnlH9Yt+73/g4FTl6+QwjtCUP8E+AWwvPcHw8GkoY6+1e01cN7zzMKGEeXF+jRQPFF880EThEqYX+X/GiVz8zs6bQiR2NZ/mpmaDtwYyXolxWazSAaewbQ9HAg+t+HKeQBV/jz/Dw88Ld36j/ZgDmm5nLd5b+E+rQiLm8w2wmnZHz0vkRRt2JMRn+xEVkpK6jnjURTaCJQ7sTmb8kKG5yDKU4Cqjfnl0B7wzq+w0EaqXE4X3woTN8uAih1VYhRNY2Ao2kUbX6FEVILOXrcI4E8Sel5gZbknUAaIXuYSIF4ClRbM4ofjldQtVY3ejo9PZyETVXh9XBu42Kz2JYKihZmvz6VoYsCT3qNwn9OE4c2NGm+5cRGmf8sOnwi4a+9+4+Ums4cwkSnJZ32luz8WAjIRL3TEqXkG5wz6oymdhWqEA+pTu0iq9hMHSGHZ1MxcEkHc2lPD0HYj68vMsKiCjR6ZBVT1lpyyC1BN4wQZjdlaExcIeZNDQww=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(54906003)(40460700003)(41300700001)(110136005)(8936002)(70206006)(316002)(4326008)(70586007)(36860700001)(426003)(83380400001)(356005)(40480700001)(336012)(47076005)(81166007)(26005)(1076003)(82740400003)(2616005)(478600001)(186003)(86362001)(8676002)(6666004)(82310400005)(2906002)(2876002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 17:25:06.4954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7705591d-d942-4a29-45c0-08daf19d4921
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 17:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175631

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

The dtb files must be before the dtbo files, otherwise the overlays may
not be applied correctly.

From Bruce Ashfield:

  We can split between dtbs and dtbos, they just need to be sorted
  for reproducibility reasons.

  Of course, this was only working by luck previously (before the
  sort), since it has always been gathering dtbs and dtbo's with
  find, depending on filesystem ordering for the order in the
  fitimage).

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---

Changes in v2:
 - Remove 2 loops and use single loop for dtb and dtbo with same logic.

---
 meta/classes-recipe/kernel-fitimage.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 7980910aa8..92e236a0a4 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -590,8 +590,9 @@ fitimage_assemble() {
=20
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=3D1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -n=
ame '*.dtbo' \) -printf '%P\n' | sort); do
-			# Skip DTB if we've picked it up previously
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf =
'%P\n' | sort) \
+		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | s=
ort); do
+			# Skip DTB/DTBO if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
=20
 			DTBS=3D"$DTBS $DTB"
--=20
2.25.1


