Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633F6C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:07:44 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.73])
 by mx.groups.io with SMTP id smtpd.web10.4873.1672870060333648225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 14:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=RtMiAFHT;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.73, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJccIQ0sTdDm5Cgn7eu+/Kb7C7NUBWZC5Q05rROXv5xSFiiqgUJbz6bTZMunV98t+OlcdxFcBLUb3hMy2RoFjEfFrBkc+4X0DRk20GGMuvcLhsi626cItbIIj5QXuJMDVeqNb4K0CpAI1VAyRiogcEcgCpW790HNCj48RaYQA+27/yHwlZVpoY8bMGZooO1LfTgHW+w+o2mvSrc67++3L3qbFtAt5ydtRE/ypC4J6UzOudbUKpZRlYOJm7KqTrCm0NV1eNeh9tCfgd5Wg+b1dFfzKrE5MJjfm5lg319Jb2tSuWXDm/XdksR/nAPiSximdV7NDv9pbgitGkPzNSN/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYZGDel3yjoii+f7tL1Q/7FPBFQ+vMgLS39HcLiRl1M=;
 b=F3D99ulXNBoN9TPPb+AnkpoHGYHEDFyn+gwoB7PthdLNYpN4rmrPNe4jonIVl1VaWxegb6Y/Hh2rGufsQnvrTDBEyBoXcZ/v02Sx6jLQJaViPi5P88PkmZ+LE0aMdSLlpQ/npyiEC9CCsUZ/SNnUiVdcnGtb3hmHbAEk7jtHfzwrl/K8l3CmciHQZXYrcH3fw7yU+xG928p+BORnzQrIx9iBPW3vQ5uInT+4RLp45xfY3p2UmYJqvLoZZqZHV8KlK4RUeuNNgqGUmBPQhBYosclLfUk/+1LODR4A3KYP0Y0ifdyV7Bgo3NUBMPkbmWPqScASjG2gkoDyKRgm4H3cNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYZGDel3yjoii+f7tL1Q/7FPBFQ+vMgLS39HcLiRl1M=;
 b=RtMiAFHT/Y35s8cd1+PQFFdg6etb6cxfLvqQlW/k2wsxAQKTkNfDgX6yPttxznXpiJwyLsMuid+20hrsTvB9rweRVMH6OtowaFnmVZhFxkTnVPOEyZRhIjV+esSJWfS87i0qlPISqfdsEpqmTS9+HQ24dXvAsHcCTaZEYpSX4q0=
Received: from BN0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:408:141::32)
 by CH3PR12MB8258.namprd12.prod.outlook.com (2603:10b6:610:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 22:07:38 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::59) by BN0PR07CA0011.outlook.office365.com
 (2603:10b6:408:141::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 22:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Wed, 4 Jan 2023 22:07:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 16:07:37 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 4 Jan 2023 16:07:37 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][langdale][PATCH v2 1/2] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Wed, 4 Jan 2023 15:07:34 -0700
Message-ID: <20230104220735.1529381-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|CH3PR12MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: edec4524-4319-4ef5-0c0b-08daeea0176f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	psA1/nAVKPhc46yfEuApKsvG8yOaCicputv+MB91LTAWANrrmyF8D01FRIGrwZEW308lzF840Zpz76nvBSObyYaP/iJ4xUy+ldBF5z4MAIIRBebqW8GerNjYjtwvl9tJY4g2HEkm+1u2gZhUPM/MZRstMtvpQT6kSACmOIfJbXk6VLvvKlkqO0a8OtYGg8j2kIQACHqizg60wPY7qHmKHXz2vsTfhsO0oF5njiELqlfFD0stNxUkeM4SdwN0+Zi6xcGKEsy8P6XA/kXAD5052EJ/r14Ns9rN9BgwnRjFwdiSpFgSmH0xGeS0vHYdewKaBm06O5EhFpu4cCOIpd8r0fUCfjWiY/4KROwPkFtRX19XGQKmVDDBHE+8WDBbXecMvmRI4xl2mev7zAh9SA4Fct88nk8zfOX/ibOHBwc0uMMpYoYhbXxM8WtIaeCkJ+cWObCnlMpsqJ8aMEy0lm0nQaOMdDgHTHW8K5TxXzaCkQsALCLOHhJ5m5Mc9bl5+9b7ucHBDxfx7DyzhFpNBDRGJwNO8LinNYmk9Oa2+AuO6lha+4l0vHoHFyeWSgk9rL5vcFTaUS5apubftQC9HiYenyfj4dqsz3WAuKt37xB09tQDj0J6VZiyMwgNN/IkI0J37vmxHn53bcKYlZAJbGeoEoQ8XnxB2QaiKIqmOUT0p5JA1vjO/NynIYPy6jfIPnO4Tb9ydyA3wwzXsgqglYWTqci8aFkqdik/O9LAW27RhOc=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(316002)(356005)(2616005)(186003)(40480700001)(81166007)(26005)(478600001)(36756003)(40460700003)(86362001)(82310400005)(54906003)(110136005)(336012)(6666004)(41300700001)(8936002)(2906002)(426003)(47076005)(70206006)(8676002)(83380400001)(5660300002)(4326008)(70586007)(82740400003)(1076003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 22:07:38.1209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edec4524-4319-4ef5-0c0b-08daeea0176f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8258
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 22:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175507

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
index 8ddebf8dd8..06cdc4f1ec 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -546,10 +546,11 @@ fitimage_assemble() {
=20
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=3D1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -n=
ame '*.dtbo' \) -printf '%P\n' | sort); do
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf =
'%P\n' | sort) \
+		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | s=
ort); do
 			DTB=3D$(echo "$DTB" | tr '/' '_')
=20
-			# Skip DTB if we've picked it up previously
+			# Skip DTB/DTBO if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
=20
 			DTBS=3D"$DTBS $DTB"
--=20
2.25.1


