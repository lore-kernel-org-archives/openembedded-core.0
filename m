Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1A1C3DA7D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:52:48 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.42])
 by mx.groups.io with SMTP id smtpd.web11.2880.1672800760506224010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 18:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=SyOZmQDh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.92.42, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbwQkfcahLbDQyQujQj/zsX8YnmJIPooIYp69Dp2U70vuCFUtHFDV4cmAz7I/4PCXgkxCE1+NCCCDaCcRUq0xwLxx1DgasOmlQtqIGopXf5325blVv4q5BmvAO9bE7Kvb+Ej8Q948JnKBS20emKojdvkllH4Z7/foTsIMomM240S3Oc122QEg+Hvay2ONfT2r6e+vW3AYWI56OGhnCXPQPRjG66mLFW7qClJFNR3YiuUoKkncPnrz/AI3VRMwi1a1fqwBUZkOSxA5o88ISuuJpcoUrYfhysvmXTB23aaO8Bplb8qXRkBFov+S64SLrxlvp0Qd6FRU47LYAUITONQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbV4rRmWfuL2ZwYy6w0tOQF/gD9JV5peUXy9e79yOIQ=;
 b=alzOWfMFnONe8DV4L5m4Pa4q7xsnk4VhOreqMq6jZMi2NvRqvbdRAQfeY2ekIY1xwcB2JtLeCT9CPM2mhKHg88z0DYuvn3HRm+sDnsbh05YZRnGkmhXg+MUCp4g4cnzvlEPDRoeqqeBY9W+56UVpnWjwwOI8UuqmtFkJxwLJ8ham9VIa57p8tb9Q8Ye7wouz9t3r7etbaIKibgSbOiWWRxG1gRv/1p7D7rcrbjTrnYRtJDrjfDdQ5ldWLOlONr4CqshWXcIXDTBcWjDmnGJ/RfhyAJXnUmRF99532kFwhGGPq1RFgkVwICySWxrjxfCbhZeGb7Ykdkwa072XzLnWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbV4rRmWfuL2ZwYy6w0tOQF/gD9JV5peUXy9e79yOIQ=;
 b=SyOZmQDhVVmfSbinBnR28VE3dAgjvR1vFoD0YrvVngYQjD6kGrdUR3r6HSCXS/T0HCulPERj+tlcZQxcFQVirSBbfnpataL2ioktSjvH+Q4qnHNpmB6fHXgaUtbzFAMBCBekiB/hqwifZzAorsu2CtuEP0rbQEumQq+YxtNHdXI=
Received: from BLAPR03CA0116.namprd03.prod.outlook.com (2603:10b6:208:32a::31)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 02:52:38 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::f3) by BLAPR03CA0116.outlook.office365.com
 (2603:10b6:208:32a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 02:52:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 02:52:37 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 20:52:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 18:52:37 -0800
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 20:52:36 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][langdale][PATCH 1/2] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Tue, 3 Jan 2023 19:52:33 -0700
Message-ID: <20230104025234.2647514-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|SA0PR12MB4541:EE_
X-MS-Office365-Filtering-Correlation-Id: 84789268-35a3-4da1-8ba9-08daedfebd28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qJKnJI7tb1lGws8L2AciGuPKs5dO1SQFqUH2mMZHbBA6WlN5fpmzUGWS/fAAH5YL/Q/iDlrYROnyzfHu5c6fIXw+GOOK3cmQprULRMxWdIekiS+P3hlGPAn93WUsgBu/sNigHFGwNzOCJC+qOM7LtKBTrjoECLUCk+icwOV0ImjYVT27SwX162aQf6crqy4tjSGDjDvGJPImlQCWHQJaYgCkSvMf9XnQkQkayVIezK2ZlEp/XzMm/xP/fhFpUk2AaqHT0ig3+Au/vKcoUI2/zEaiwK+0HKRj67FOzDD2aTeHyfa96nd23ixE5NMVMsiNlJsVp0tcArlMtwhV3m/e6PXwCyf3ZBGJnsd6+6ztiRZ8uPq5eP7ZXDIeTQ15pbxEbnzCKnKyiXcvUUeVlw/6Be7q3R261HpoUnRuuhiU+2lqYNfOvya2COGfuu4xOMAJgHLauPAwDXKDdbG5x0w9/ajySE6HhqJAXAI7iQEKzklb0iB9hkrOF5vaE41l+9VJ1AGMfPyDHGiqNeJ+mwLvWAPYbGAD2gqgyWz8lew0dAs30qAoWG+NYzGmoihVYVi/Jx0cfOdgvubavUv3bHMuQqhWzsVsGfi9VtxfaSGlNFIIuVby4Qs16lxSOjL36yigkk+2gwNVNkomX4Ok62EeE9ici4QBVod3Eplpr9KIwDlH0rGMsupN1fBTYjuQkNKp2pN5uRpcfSWkPU7KWMUjL408WLGp6My+OTKyaoN/ZFo=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(426003)(83380400001)(2616005)(336012)(186003)(82310400005)(26005)(40480700001)(6666004)(40460700003)(86362001)(36860700001)(36756003)(356005)(81166007)(1076003)(82740400003)(41300700001)(4326008)(8676002)(5660300002)(2906002)(8936002)(316002)(478600001)(70206006)(70586007)(54906003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 02:52:37.6904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84789268-35a3-4da1-8ba9-08daedfebd28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 02:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175373

The dtb files must be before the dtbo files, otherwise the overlays may
not be applied correctly.

From Bruce Ashfield:

  We can split between dtbs and dtbos, they just need to be sorted
  for reproducibility reasons. Two loops versus one, would be
  fine, with not too much duplicated code.

  Of course, this was only working by luck previously (before the
  sort), since it has always been gathering dtbs and dtbo's with
  find, depending on filesystem ordering for the order in the
  fitimage).

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 8ddebf8dd8..183d42308d 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -546,12 +546,21 @@ fitimage_assemble() {
=20
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=3D1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -n=
ame '*.dtbo' \) -printf '%P\n' | sort); do
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf =
'%P\n' | sort); do
 			DTB=3D$(echo "$DTB" | tr '/' '_')
=20
 			# Skip DTB if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
=20
+			DTBS=3D"$DTBS $DTB"
+			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
+		done
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf=
 '%P\n' | sort); do
+			DTB=3D$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTBO if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
 			DTBS=3D"$DTBS $DTB"
 			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
--=20
2.25.1


