Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63472C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:07:44 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.41])
 by mx.groups.io with SMTP id smtpd.web10.4874.1672870061285658727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 14:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=TEeyq7jW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.41, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCIhYJm4jiJgUFCVdsKd8P+3FE9JwUofvJmFnpxMbKf6gWG9vnygsOMED2TJ2dhCSa0Cp9xwKJ1XPKNWD52rRjhn89zeWaop+/P59dpaHk69rQdoEPdRmDAtRIfpRtX1LVOcpLhaX7CyBafYHyMn0TN8V523wpBmNNCM9lqWGy72qxtsLoexgF2+EnOnLFmFlR2WBK7/W0ZiQkOn2/ZAu3UN6KsZmVU6JzwiKof9k9+IiT41sqf6F97wBwryn/PUy8/0YrZlFqpxIqn/y3lXEUkxTRN97FrzkCJMadyNTU6JZdVlA/CutFmHCJXetQf4A58dXImyemqHDeod22U4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWaEBn+q4b37VTYLbyUE8rG8SIhTBxYgWF47Ssq+d+U=;
 b=hFiuPz2DtPgpOsYvg9j35UDOY4s9NWhBSHdZx5xPVzR5zPHusvp+AaoDKC6z7AxZSyA43c1VV+MnXYXF7PsgzwXNDmMLZtSpPLIQmp9tFTPginmtWuQ0IP56udhNMvqUXdiMz7jl4qDiF/HN7ymJFliB5koziGcz2YRI21DfKOt4HCe5+AzZQjCrmCM4MIDeYa+19UfPIRIaKkrz9cbhV42GhKLPOYEGjZl8N9kiASaD32JfE8Zz06oiU/tpxDuOrabwXkD3uT4WRp4e4m6rz6BkFr5Ka4njNjR5W+NBfftgGImSRWJPPy/TxnXE3JIPZFo94uX3dUXE8j2Y4hF3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWaEBn+q4b37VTYLbyUE8rG8SIhTBxYgWF47Ssq+d+U=;
 b=TEeyq7jWUX6krU+RWhmVEuEfu6ZTDcJdV3K3x7QQCN1pD2hCxyJPymc685YG2G1iZLZYdxOtYDBYQDeCr5Mh0EUM/CB1rUtNsJvJjR23FdR0J/+Rux5VDrdueEwxB1gHBv6mHXZc0JrgNWPGDHfFt8DGdXuECvVS0LWan5StLX4=
Received: from BN0PR07CA0014.namprd07.prod.outlook.com (2603:10b6:408:141::7)
 by PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 22:07:38 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::94) by BN0PR07CA0014.outlook.office365.com
 (2603:10b6:408:141::7) with Microsoft SMTP Server (version=TLS1_2,
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
 2023 16:07:38 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 4 Jan 2023 16:07:37 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][langdale][PATCH v2 2/2] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Wed, 4 Jan 2023 15:07:35 -0700
Message-ID: <20230104220735.1529381-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104220735.1529381-1-sandeep.gundlupet-raju@amd.com>
References: <20230104220735.1529381-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 539d308d-177e-4e06-55c1-08daeea017bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZMX+u3+8kkOZM+Nv7ixMjQ3uDUnjoCZDnyDSZsLFHAWV5zXEMWBXMzJoeTq8AtDAP8YrgKns3UiMRKRpj1snjW+vPsSdPYnwCRpdnoSUjQAbmGtHVqU1QEJum0q6486x8R2ADlbenzS5GmlTV/aDG8rnWKfyW7Vq1k4EWv4aCKqbfxpCXF6PJbrJRMgt1rNStrp1RXkViAMagbw5lrxhdzLZg9TPGBSRs1vBTFB3ZWfxkYkzM7pwJDYypq3i3W/Pi/n9iSov+GMqxIhiDBMqm91VIruRPIfT7p8Wisqw6g9WxS27XYYJjE3ScqYhNOAOvN6byAymo9nC3/wtb29xlq30gg1rSEuKRNRGrTS9XHeqZFAveT2hkpRbvYQeC0NChEPfaoE/JjC9ryZMPztXLywStV9PJHtOYHBSKCcZS07G9adl2gSqSWPqU+QkMfDQi/SddiNaj2k9DYCThETQqZhPJCGSFQuIhS+NJedfblWkr8GnDZ7WkmxZRDK8rT47f/RKqnoYAfAcdK7qK5qCWA7aPHoRbxNk+TGs9tVCEEF+gmC0aGHhFuqj5TM3UdQu5ffRqHMB3gWPcZ6Hl/tEoT1Gew6OQLqmkEoaA7+LNh4iU755GUxvM8nklPgjV36Qgr65imkKxByfWrr5Tnr0ODbQj6txN1lmFCMHaO6XVICuZ/BZFYmnKeS/N34idw4EeQOJwNMX5LeBBImIw8nJR4/GoqXIILb8mjCrcaXwfDQ=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(26005)(186003)(83380400001)(2616005)(336012)(47076005)(1076003)(426003)(40480700001)(86362001)(82310400005)(40460700003)(36860700001)(36756003)(356005)(81166007)(82740400003)(478600001)(54906003)(316002)(2906002)(110136005)(4326008)(41300700001)(8936002)(5660300002)(70586007)(70206006)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 22:07:38.6365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539d308d-177e-4e06-55c1-08daeea017bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 22:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175508

Allow user to select the default DTB for FIT image when multiple
dtb's exists.

From machine.conf or local.conf user can specify the default dtb
for FIT image as shown below.

FIT_CONF_DEFAULT_DTB =3D "board-default.dtb"

Also fallback to avaialable dtb when FIT_CONF_DEFAULT_DTB doesn't
exits or empty.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---

Changes in v2:
 - Add check condition if FIT_CONF_DEFAULT_DTB file doesn't exists
   and fallback to avaialable dtb in EXTERNAL_KERNEL_DEVICETREE
   path.=20

---
 meta/classes-recipe/kernel-fitimage.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 06cdc4f1ec..f6d82ce061 100644
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
@@ -417,7 +421,17 @@ fitimage_emit_section_config() {
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "$dtb_image" ]; then
-			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        # Select default node as user specified dtb when
+		        # multiple dtb exists.
+		        if [ -n "$default_dtb_image" ]; then
+			        if [ -s "${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image" ]; t=
hen
+			                default_line=3D"default =3D \"${FIT_CONF_PREFIX}$defaul=
t_dtb_image\";"
+			        else
+			                bbwarn "Couldn't find a valid user specified dtb in ${E=
XTERNAL_KERNEL_DEVICETREE}/$default_dtb_image"
+			        fi
+		        else
+			        default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        fi
 		else
 			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$kernel_id\";"
 		fi
--=20
2.25.1


