Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C7AC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:09:24 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.55])
 by mx.groups.io with SMTP id smtpd.web10.4912.1672870155426178902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 14:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=QZ31dtPa;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.92.55, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2m1VgmAMBmGc7U24m2bYcU8SWw5RBj1elTaRRoegR/BQbL2Uc2Whi5Fk8Ho082nl53VI++N+hWhnzu/2J8gPTuzw7bEN1pyrNDaq+oCq38CJmlaQszg0Oto8e+LZN4m0NXQC7DpO5430u09xJ1041Sh4BeuinVX+hIAjIM75j1Kqpzn2KVtjQw+2KMj+sVFPBJ9T92+pxsX30b5skbYtxIzmDT+vRkQboIIUAlGQSI/ahlf/yGAwRKA+obakFqAZlwkBjdYr3IKgzw5m33xhL1fPeoacJYlkzIXZ/EkKJww6ajd8/CgHw4AyUScEBpz1n3vEpPOxHmQq+pGZ3czPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm8MQcf4ZUt1up2y0HGps0UqjQcl3SmHMZsqcWb57iE=;
 b=LX3Lnbt08TylcqLb4BIOis8qvXL+C99RLBMmWTnL2PVhnuqsRdPKpJHJzw/PzlMamRMSbp/wJpSk7XpySi9YeViTgY99i/qJ4Mn5ich4Y3QqgmIC2Dq88Bc34jE8PcQ9EmycVxeEaYDajQ6iCvS/JsLagovoLqDK6Vm+nTfYbgRyGiVvbqUA5sNMo+m2Z4PdKqo+g2fRYtx1tcKj0UC+ImYZROM0Jiv11sNu5G/vAvnpkibsYwXKsPv0IQpSdBYiZmVgdZsu8riaJjj59eHGRlFqQghA5LteMTY5Uf0d4WRlYSIycE/Gp+aT/mrEBaHe0ujusJhzebi0dXUdSQUZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm8MQcf4ZUt1up2y0HGps0UqjQcl3SmHMZsqcWb57iE=;
 b=QZ31dtPaZ/Ey1SofGn1ILtcKjNwo0HsykT9gOWeLqXO9Wn/2F7Dem0+K80ZyRuDdazTsGsJcEGUnYNhIuwZQc2/y21FOGni7EUu01bhgmeFKjC+Ekh3OQXxdQrATyxbgJA/NdMBUgYWRXGbo1OoDjthgz/MF/OBvCZEwlnaDONs=
Received: from BN7PR02CA0020.namprd02.prod.outlook.com (2603:10b6:408:20::33)
 by CH0PR12MB5060.namprd12.prod.outlook.com (2603:10b6:610:e3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 22:09:13 +0000
Received: from BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::df) by BN7PR02CA0020.outlook.office365.com
 (2603:10b6:408:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 22:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT096.mail.protection.outlook.com (10.13.177.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Wed, 4 Jan 2023 22:09:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 16:09:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 16:09:05 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 4 Jan 2023 16:09:04 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-core][PATCH v2 2/2] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Wed, 4 Jan 2023 15:09:02 -0700
Message-ID: <20230104220902.1530659-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104220902.1530659-1-sandeep.gundlupet-raju@amd.com>
References: <20230104220902.1530659-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|CH0PR12MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbdceb7-dd9d-4381-5f80-08daeea04fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jsPjUmCnrFw9UtxLacFS74np+hWSw3AeqHy3JYEQIkISu5CCjALjzcuHBVDX/e20vS3P6W/wvByflGgQkUZVs2l38cKIGeKM+9AFMbGs+wbQhI0RRi+MquJ8U0tIIcfDAywQQl2yiQ06xys2WcKoEkM32/9Q7h4bKnhKI67gkXIStA9as6/p07O6PIW8w8J4HIscPhCqPiUMRSQkIiVTJmV9LIkrCZMIfob4Vi1ZElGzps4EMCCgnd/77LUa1HcBzQa9NrXExjdwYc0bHrSyt0O8TIvKMPaPrT37JMC4Zr6untPlEGXstHBsLvPLgqYBwxNS1PP3BXeT6o0aRblS6T6sUMiqUO81xpMO/EfU7xub6KFecPuTMMiRBbSlv/+YoFZkdMmqaZrHk2OtGm5S5fi2gXvFGE8BJHkxcv0rk6d86Rpabc+OStOk/r+srT9km9fpyB8vC9ADzNifk5vjFAQLy+S0KIhyMkohoI1q6+2FdVYStzN1UtRxytms4gCBAUXoNJedPhWTR9fSNFF+o7GYlQamVoJjSlrb1R1sqW0CNKNALBOQ/Bk/FIrclUiBwFuS3OEAsYNpUG3W3WTpYQq//XnkpzPkVUibho6oBybvE5KGEymmSqS9UuKGVw1t9ebO30Q2rft54sEzElICzoi00VgkmrzUZ5px0hQlhdw+VSmZVnclVjHN7wlGF2hwHY7xbxsatkJoF96exXk2I9Ko6r95pMcPTIaPulRORo4=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(426003)(47076005)(83380400001)(356005)(82740400003)(86362001)(2906002)(8936002)(5660300002)(41300700001)(82310400005)(40480700001)(336012)(478600001)(186003)(1076003)(26005)(8676002)(2616005)(316002)(4326008)(70206006)(110136005)(54906003)(81166007)(70586007)(40460700003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 22:09:12.9168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbdceb7-dd9d-4381-5f80-08daeea04fed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 22:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175509

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


