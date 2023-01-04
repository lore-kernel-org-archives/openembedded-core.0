Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED254C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:52:48 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.84])
 by mx.groups.io with SMTP id smtpd.web10.2845.1672800761799755906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 18:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=mN919Q0O;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.102.84, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJyJlnI0EyZ4bDvrRYgBwKZ8iRvsnfRaOEdMR2lz1k5xS7pkDaN40LxIByBHLhLmqmUtfAh8pxBQRi4DYKCsen2I3ZHa7Fq6cNocgAOgVwIgI1GJ8nH4dNOSE8+3VpY5l1LN7sDc74U5i3Ohzz8urh99aGp2lyLnGAkyEz9lEpvs2JQQliwuSroVsvEY3seMfpgu+sORR6vdHY+s6OGqVvZggvaEeQOBwbL59EQ3oVuXak/qPVGzKonLU1/wrFFk5BU7dxPOxuAMIHnXWp2c06sGhZ9TBMGHBBolb2MrVUGjL2j7imc4sisJIXx5WsIjLWgWYMXb7cmz5KFOnp5quA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uldxpAUZvPw4fJvQnC2W+xm9v41pF3kwChLVDAiTdNI=;
 b=YMz+Hwvr/9y2THzChWffOKrG08nDMfjd0FncVZJ8U0exdjs+KV9f9K70owM3oWY6rRLiEHdl/lmJgYRhwt0Axu71Y4P1QffBF7sdrkxOgFMI0l9Ar3hLJAGrGY0uW3EEsbbF+qSCHz0NSeFqE1k9l3WmarSI65ckf8pcjBR8iR/fC1uoF5mlsTNTvaMA+XvAhH8IYhpwzR5xiJHMx86Jp7y+hkYlV4dBUSNnZUVAdUgDQiacap7zqzbvBFU1HSQ6HroQDTIHgD3AwnXagrZo3JzUTUZ0LbRfWuuLONo/t998vIDCwueQ67oixBwLSc0po1HIuIKACDV2K4Z0OaLMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uldxpAUZvPw4fJvQnC2W+xm9v41pF3kwChLVDAiTdNI=;
 b=mN919Q0O0Cp4GoBCmRTiJle37hBFMTOqclOH7A5AzwSyuDwBAhLcqEFnIwva1XHuE60AYfA5r0zj5+2zMViCBQx8dqgUhUUcmXMsPU3YIR7cUdW+alU4u63sajpmgqohNVQt6SQ5GHIc6LNEmPanMFd3Qpo3rKXpx0Csj7BnzQU=
Received: from MN2PR15CA0012.namprd15.prod.outlook.com (2603:10b6:208:1b4::25)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 02:52:38 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::df) by MN2PR15CA0012.outlook.office365.com
 (2603:10b6:208:1b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Wed, 4 Jan 2023 02:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.10 via Frontend Transport; Wed, 4 Jan 2023 02:52:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 20:52:37 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 20:52:37 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][langdale][PATCH 2/2] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Tue, 3 Jan 2023 19:52:34 -0700
Message-ID: <20230104025234.2647514-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104025234.2647514-1-sandeep.gundlupet-raju@amd.com>
References: <20230104025234.2647514-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 765fb41b-3acb-48aa-79af-08daedfebd5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xL9rFZQp8019oWAj229NCvzVP2AzYk66s+7YHqCYmzzMYRJax9G2WnvlM65zN/NcV/5e+UUEWPruhBsU2iCCqnuRWdTtfQMUq1/k44IhFlhec7PlmGIbcODWk/1BXbnmy+3XikLDEjr8XzmiY84iCf+P+PEWta8q+CIExy8si63ieMxYdtbcHYEsStaQghg2DiYd8hEKi7bxhQTMr8+hWLZ2oSGf5YK5MyCv5niYaT0AtNI5MmfZAn1zig8zH+7W1GhcccChj54l6fgLstosibZEr6hlA86RN7nLrTE2bMZk+VkirkkNPOIBssGNfNl7RYG/XrgFCtnZHc9v2eWqPVVQ15mfNqR1LmlM7a0tuMyxWKZIHgqHFNq5nmuMeHA7vFll4dqGhHV6/j/xynWNj21fLjLCyWca+D1P6V0FV7kt4oQEX5gUAXb0qIkKVFElyQz+hdwZaCw6Zsf9O9Td+e+o0LUOsaRfkSTSP1+EhfR67R9KZ/kMwg13VDQwcbrn3YHtLn5gSGmodgu9LxBjdd4l0+pfttxRlOPEzapczJjUJk2lcovVAfOrxgQvkA8sCzM+ISHd6JaukBw686cs20ZZatxEvv/IqbjcNVH+UG7psxZTnmjphglrdvkOd8pfqQtez/jdbNMqd5wo5rbsqWW4Iy+R8clcgv/LsAFnM2jEqOoXz3iJYLycg7Fhm8sdV+WFWBgYjFY4xdDtv0JrRi76gxxEUVveZMeFEUzxOmU=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(426003)(83380400001)(2616005)(336012)(186003)(82310400005)(26005)(40480700001)(6666004)(40460700003)(86362001)(36860700001)(36756003)(356005)(81166007)(1076003)(82740400003)(41300700001)(4326008)(8676002)(5660300002)(2906002)(8936002)(316002)(478600001)(70206006)(70586007)(54906003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 02:52:37.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 765fb41b-3acb-48aa-79af-08daedfebd5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 02:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175374

Allow user to select the default DTB for FIT image when multiple
dtb's exists.

From machine.conf or local.conf user can specify the default dtb
for FIT image as shown below.

FIT_CONF_DEFAULT_DTB =3D "board-default.dtb"

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 183d42308d..9735d88a60 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -73,6 +73,9 @@ FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configura=
tion node name"
=20
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?=3D "cpio.lz4 cpio.lzo cpio.lzma cpio.xz =
cpio.zst cpio.gz ext2.gz cpio"
=20
+# Allow user to select the default DTB for FIT image when multiple dtb's e=
xists.
+FIT_CONF_DEFAULT_DTB ?=3D ""
+
 # Keys used to sign individually image nodes.
 # The keys to sign image nodes must be different from those used to sign
 # configuration nodes, otherwise the "required" property, from
@@ -375,6 +378,7 @@ fitimage_emit_section_config() {
 	bootscr_line=3D""
 	setup_line=3D""
 	default_line=3D""
+	default_dtb_image=3D"${FIT_CONF_DEFAULT_DTB}"
=20
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
@@ -417,7 +421,13 @@ fitimage_emit_section_config() {
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "$dtb_image" ]; then
-			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        # Select default node as user specified dtb when
+		        # multiple dtb exists.
+		        if [ -n "$default_dtb_image" ]; then
+			        default_line=3D"default =3D \"${FIT_CONF_PREFIX}$default_dtb_im=
age\";"
+		        else
+			        default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        fi
 		else
 			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$kernel_id\";"
 		fi
--=20
2.25.1


