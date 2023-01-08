Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70D2C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 17:25:22 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.86])
 by mx.groups.io with SMTP id smtpd.web10.49648.1673198712845530921
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 09:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=UUuOmq2i;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.95.86, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlNF0OkiyUlufn9JS0LuQoJscW3kg8Zq0Mm/xh/7DV0YAI3pshqkDH2mv5MrbxYDsx6bDVyuJhjqiLX4Jhui4pQ1QTo68Mz1J4LhVvSO5g67zs8uU1bMlf8qBoSj61L16C2fIQ5PcbpjxE1ycrDTiT694sPDpNNdACuNKUQIERnQZE/J35rHLZ5FJKLwArL+HezqHLxh6FMFKF6pT0iuc5t8LQnPQgbZ3aW94PuoUq5qToe040X121RSBW7oDdbwVHmZe3SsoylETsLbnJvbK+DVTQoNXm3OVdDvY68jlzPJpBVqR4xrmzMyrEuaaUgg7YjslVNEDwn++Yydfn65xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VU6R1FpN1f+KkEdPoiDJ/r+lJecLI45bTDyYN3cJbU=;
 b=HQUwcBovqHUX6Vqj9olja3GddgVnuBYRhOoNCjX5oTaR44p6Hgbaazhaj3glr4uLAwYW22sYKgYOxRhVRmPGtCj66k2UEO357ixidPo5FlVTCdRaTSoM2oubWxYB5OxIvNPhIHnM+D81bfTbnzXBwkeO6ZMsxsFS64HfNZ8dGO0cqP8CVA1DnSFPt6N4dLmg7tmXR+83akXEBsYTBEZ6VVo6WIlj1s4PlQEELcFW9O9XV6DvkQmJ/eQ4OwnUP7gPfvc9bLsXYHOZTjJ4XgBhOP1E1esLTPTOKTtN3BRWLXqDU9elWCz2cN98HDEWWPIcLZDIVD0BwZV0o5wNP/fo7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VU6R1FpN1f+KkEdPoiDJ/r+lJecLI45bTDyYN3cJbU=;
 b=UUuOmq2iDHHRyg2pCxmu3Ddy0FOAdhBJ8ZrLOBlPE91sNZMuwVXZ2We8LqfXS0COouUHdSLk1BUgLVDhpq5t3sog908B5iVHEbbUiOGJXiYIfea/Atkc+MPAYuuJfGnOWa32ugnNUUb56JLOoXZdi5CE/oo6q34My2YcQLRlIgQ=
Received: from BN9PR03CA0903.namprd03.prod.outlook.com (2603:10b6:408:107::8)
 by CH3PR12MB8076.namprd12.prod.outlook.com (2603:10b6:610:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 17:25:07 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107::4) by BN9PR03CA0903.outlook.office365.com
 (2603:10b6:408:107::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Sun, 8 Jan 2023 17:25:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Sun, 8 Jan 2023 17:25:07 +0000
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
Subject: [OE-core][PATCH v2 2/2] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Sun, 8 Jan 2023 10:24:57 -0700
Message-ID: <20230108172457.2365468-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230108172457.2365468-1-sandeep.gundlupet-raju@amd.com>
References: <20230108172457.2365468-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|CH3PR12MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 501496be-2540-4e26-db70-08daf19d499a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jRPmwNAK+DXdtdZkrDW2iY8B/naTZevY/uyDrwMNA++XEDM6bbCygT508dhPOITEGeoa7YOpG5QVYZ0gck5r/4UZYUkgbydBta2kQZMzvdH5YXDfOfwTIkJHaH2FXGX9mxupnKfKYZFPvqM2Src7Q11IrPKgM5F+s/0IAV90ho++GGFiDMlh6zGYBHE8gga4DJM4/+5kNu+hyrQcdLQKsi53WpVofL9pr68aqr1mpkmWHCC/JI+LDB0z7eVGcPHWOOus/ALyqNC8vtnwHDxP6+BK0wE3UdF/7hO/r8S6enD/lbDEiqxXONN2N9ohvLRslMGXkYr6ogxqPnsSnlGKTSj4LrXibPYVx9BMQpWQ+t168H6bloNvhqJNUGnN1968r2LZhUYhhs6g56ML/so6t0QBEwom5Eopz7I4zaywqQ+duDRSZTEgUSa4+ucq3yn5/2waxpBQL26et7YfOrAcsuL0vtR18cDMoKhtYPtp9xNNstN0TLh277YPkoqdV2yEHpF2MZXcrJa0h24TEck5uj3/bYawUCCJKeb9iazWzewj7vJOHFhBMPgRh1QZooF8z8qUl6OKE6VlVrqAwvUHYWyRDhztSSW252sma5eAmTjaxfZuM58rvUdAVQt/0N6Tos8Sn6sY1LZ/u1TBcrzHZLaV3zonb4Qzn35EC70z5AGZK95GIFre+veRMK/VqvVQ24eOSLNZY5IBgsVLDSAZXLKKHrtSFX6yUpZShf5XbeU=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(478600001)(6666004)(186003)(26005)(110136005)(54906003)(316002)(2616005)(36756003)(8676002)(70586007)(70206006)(1076003)(4326008)(336012)(47076005)(426003)(40460700003)(41300700001)(8936002)(40480700001)(83380400001)(82740400003)(2876002)(5660300002)(82310400005)(36860700001)(86362001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 17:25:07.2922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501496be-2540-4e26-db70-08daf19d499a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 17:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175632

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

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
   path.

---
 meta/classes-recipe/kernel-fitimage.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 92e236a0a4..b77747404f 100644
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
@@ -462,7 +466,17 @@ fitimage_emit_section_config() {
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


