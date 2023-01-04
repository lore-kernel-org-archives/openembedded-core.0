Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66529C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:09:24 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.87])
 by mx.groups.io with SMTP id smtpd.web11.4916.1672870155971817000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 14:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DyUBsy4N;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.100.87, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcINcuQSzrPgY6Jow6p5A28PObwg/Vzasz5gj9DzXAi0uUAfygOhHIdD0zqMtkPHblJSQluc99LcY0RqnAIN6hkPUpH0PINVwOP+Jlx3l9SSAVdwzfHrkc7CzjlvJuGFnC3XXmoYMyt8VhJspPitLpddwu9c22nGxr5mAFV/QkGS5RpdilEY4BKcQIYtgT4xyskmGI91lu3xe542O8zofImwCRcvlTbPFGfdoNVVEDF6geEK4VeE1RIrS+aMKwG45JZ7izvk48XXRQNsjejffYrq13kFbL2aVnCZUxmNQADdq+8flP/9quqHSrlCc32ryNMFSvL6cT0mtkGmtGpV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BDSE7Vtr6fAxTOiZArC+/3h/29hzNh3r5mgrk0SYb4=;
 b=iAJGxdPb2iDsW70NNi0qvQQ5tJgKTMi+K9KJlh61p85qI5Ng7qiCYQCSyDyh+gIHFFsbnFFSMy4jXAZME1oicIdqmjNT6ZFJJahwKUgQFa/Fwu4T6y0AMNXQ6hZtOtQGgQ4xwMrhGus4UWWxO+k7GYB8IvB1ok3D5YybAcEv6VbinhnC2a1kwHMvqg6lMc+WdVbGAmCtDpdgVpfE1QYaTW0ejOpaX8c+dZf5DSEhscCq9ZxCT2FrtHIJKd+7sFmwMBeDIQ9K380bYvlvWlv4egvUgY2BuzdDsXn0yees72I1p2i75L5tfnJ7WJGeDwJe6cE6UHUBoIy1mpJePVG7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BDSE7Vtr6fAxTOiZArC+/3h/29hzNh3r5mgrk0SYb4=;
 b=DyUBsy4Nz3lTq3ZfCZpkGtvB7p1i/lHI+/W+ZzvpsdLMPaCsbFZXwlndzIw6WLH+k8sGt6lKEpNekHPKAz+01UJoKUFNNBdu3+YrahxUI3/OAolGYJVgXZ9pa0SmXoTMSKiDM4vHru0Ekoj2v9nFfAoUZqxppfChg4/V2EZPvV4=
Received: from BN7PR06CA0067.namprd06.prod.outlook.com (2603:10b6:408:34::44)
 by MN2PR12MB4568.namprd12.prod.outlook.com (2603:10b6:208:260::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 22:09:13 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::1e) by BN7PR06CA0067.outlook.office365.com
 (2603:10b6:408:34::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 22:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Wed, 4 Jan 2023 22:09:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 16:09:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 16:09:04 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 4 Jan 2023 16:09:04 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-core][PATCH v2 1/2] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Wed, 4 Jan 2023 15:09:01 -0700
Message-ID: <20230104220902.1530659-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|MN2PR12MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bc1293-60e1-481a-6b2a-08daeea0502d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tRFQ/fqz5q5SgH1N3AG4VL6G8RHeo5nzcytbb+YVJr817z/BrJ+ehBO1eqrldc4zn73U8kszO7dkQ8SfjoggTtU6wygIpbmFzLpQaJnOK5qsJvDCGXey+3UbCqZZzuTK5QT9vlgj8G97gWcOGUbQp/zFe0fxoBVf+Z3NoSW6xgfNuQnInM6ROCb77IzG4VoW648IRYanxzjpCT/EupD1cZRPCPTi2WXqk8p3Jm+mqoE5mdc96JpKA0Wj3p3mMCCS2Y1KYjcdewVnYk/TQE6exltUtENgLx/+rsuwZkk/leid2wXniUvS2yTTkZIYBFamfRMSPJC+xt+US0t+eT2icLejknVYsVyonACNyBO+CXYCL+I2dCqlx2uX6fT5J043cXIdSU5Z3MBI9i226Xc0FbgNTCwaXSM78xyZA4gAQXfrWujC7GfuQmHRa1CuPGGOkiU+LExtVp8652IupTzCyM4eEerX1Y0BhSrkJ+lyYvNdtZQaIT1tmjThkN4NWcdj8NyZZodj8B/ufeNoT4sJkYcV02pCbXO5wIUZzfdkC3f0YFAcpVeGO+XudKJ/nEYez8N2vCUSZTjzJfobPrO4rJHkNvMDuQj1M7tGwqoZNI1GkYUm9qFyMQ7Fj2ADlcfVsg+GuqAHRfS9oEq/YKdw3p8yweCNFREPNVWfxhvz1E25VhNvjdmyICnzETscd91MOp4OyP09B8ILXqyDM9WtMso8UmUV+eDY8+lE746ft9g=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(82740400003)(36860700001)(54906003)(4326008)(41300700001)(70586007)(110136005)(8676002)(70206006)(356005)(81166007)(186003)(478600001)(86362001)(26005)(6666004)(2906002)(40460700003)(8936002)(2616005)(82310400005)(316002)(426003)(40480700001)(5660300002)(83380400001)(1076003)(336012)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 22:09:13.3209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bc1293-60e1-481a-6b2a-08daeea0502d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4568
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 22:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175510

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


