Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29C4C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:53:38 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.47])
 by mx.groups.io with SMTP id smtpd.web10.2884.1672800815955180036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 18:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=atFyJLKx;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.47, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRahAiBCzwpT6kVov71yKcVLiwmLJNUEQ2fgEKJITHBd3QJKf8Vqp45yNbZk3krz0H6w6dlzLYa/VBxtSSaYV3wGOvgcSLXpru3YTLtOMP4w8LjD68a4I9LEdFR7hjIk46oE212Wv/myMvnr4QkL78qv0fBzkTXkCDLvhU2+OPxm6RqwacLTCnNtdFL126KBgk5mIIxt7vHTutSuo7eF7a+oieN/PnJEB1o06T+snatTiITZYwIv1jl6APGA70tem0pS0O7i9Lpt2FZ1z3VkKUgBndrGlws9R4Wk0SzZdZbWCSjnZNuA8mssxZUgWJJu1FO8O7oRH2fhPW7hd05+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMteoEE3v0RJ8P3p+6KHlSLfXkPNdiPU7SvKVp+0hpQ=;
 b=cWgLNkUJQ4Pex2HmHPNCAKN+xu/DB0insKO9BsXlHpPd2QSu4ZMC7kttmzWUDt6/F9D2Q309A7go3L7B0cOi0pv8Ou8Ll9bOFbPYILH+TaL0UpfIcI23vjUJ0tmL57xped+QPfynBJcnYBxIXj/75SugiAVdCvKwvrewVTvGpkRJzIaZ97dTspfREd1LsjmFwnT/mE6R4A+KZbjfmAjTlj+rC46d5f7Ge83wfNXflVQqqOXf1UWo0gUKqNU+n+Oni7fvSd0fZrY7JxPH8xlKRQMEVMe8JZZ9V0dneLBORiJ3KEKRubJoyTvqcmtAm+DwnldbWe0BuWn3BiLEcKj5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMteoEE3v0RJ8P3p+6KHlSLfXkPNdiPU7SvKVp+0hpQ=;
 b=atFyJLKxY3j4NbWF79cK9rldhGGgrMaR4JCtccRypIvJBlpn9TtauHJl35AV5ld6fdCuQJhECvJpCc4XRI4l8bfB3Ae07GdDMY1mvbkVOw5bH280TtX8RdrWjGqae47hexXmulH8039cL+pYSX1XRHLXgcAzOKLmaWBqw2tchZI=
Received: from MN2PR15CA0033.namprd15.prod.outlook.com (2603:10b6:208:1b4::46)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 02:53:33 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::81) by MN2PR15CA0033.outlook.office365.com
 (2603:10b6:208:1b4::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Wed, 4 Jan 2023 02:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.10 via Frontend Transport; Wed, 4 Jan 2023 02:53:33 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 20:53:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 18:53:33 -0800
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 20:53:32 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][PATCH 2/2] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Tue, 3 Jan 2023 19:53:30 -0700
Message-ID: <20230104025330.2648640-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104025330.2648640-1-sandeep.gundlupet-raju@amd.com>
References: <20230104025330.2648640-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd5761e-1b99-425a-21fd-08daedfede9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b7dOztOskCY+QBq2EshAVPDGx3AxkickGY9RL4sVGks3uCjBSmtVJNuVIEAu3phG0r0ef1JItDS7xRfp5qr1HCH+wnzHRYaHxKlKMqjlx3T3NvXUjfm9qpM+c6y0OdUNkisY+LNInWlzDjZiKFMZVQ6OfRoFmf/CcaTD+4w31tfAt94B5hNHqoiIC0VJvv0IxX8XI2rLmtOHQQpwpyzkI4h+psGZwYuCxsTPLhQd2QIs/RRXu+XvJWv1beXKCuYGyV1v1has4/2o5CsKB7AIfradPcje03mV4ofENcDOxU2tVU6UJBjj3HHR8x+gIP3ZyRlRrTTQnUQts7RbdDtWD2RbvoxqMqwTXGwSrJMG2F8d2EWesztvp4SBLk+eDJZQyLYP9Ge2Gnxc6CzbZeQrg5aDAdkpFNpRwKrQ3YTjfG32qpcjt9auffvWdfc+NBd8lhN+k/5ZxN0LVsEobzl0hAhjwkDY/QkvXOvkIPqOawHBq2AUVce75IM5rNkw6n3XJU1qKMKqBjWTbYasHBqfXnyTQ3mp5m4xEQSXpuoWd1nQ/As8rtmISjnOs9N+ky6gyXqzxUHM0HVXUxjX9RNS4cE8cuEcZazEc39UYSanhad7fNi+ItQm/of93eOv2759ObAXl8rWSD8+AhPFMlNOsjDRU9Ikjrzg0Wt3i2lC3FPQUVd3w4YojBLk4IXn0qies90kgraMgSC38B/RBQ/WOKhn5eeAZDEFD07r/djwZ6I=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(8936002)(47076005)(426003)(2906002)(8676002)(41300700001)(336012)(1076003)(70586007)(36860700001)(70206006)(83380400001)(5660300002)(82740400003)(4326008)(186003)(478600001)(356005)(40480700001)(26005)(81166007)(2616005)(316002)(54906003)(110136005)(36756003)(82310400005)(40460700003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 02:53:33.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd5761e-1b99-425a-21fd-08daedfede9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 02:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175375

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
index cb6635a673..6cdb0e0174 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -89,6 +89,9 @@ FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configura=
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
@@ -412,6 +415,7 @@ fitimage_emit_section_config() {
 	bootscr_line=3D""
 	setup_line=3D""
 	default_line=3D""
+	default_dtb_image=3D"${FIT_CONF_DEFAULT_DTB}"
=20
 	dtb_image_sect=3D$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEV=
ICETREE}")
 	if [ -z "$dtb_image_sect" ]; then
@@ -462,7 +466,13 @@ fitimage_emit_section_config() {
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


