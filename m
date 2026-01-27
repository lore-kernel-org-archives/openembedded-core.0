Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D22D2FEE0
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 20:31:02 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22029.1769545858364552294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 12:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Tie3JPjq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.69, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PleeEwsAWpGtN6oNymWGuWnsYyqLqHGK7unbBXFvRT2KETBjT5DHqfM3LBDTO841B3x/WSh78wH1oOdp+zi1ZDr0Rg2AbujSZPHGTdEdggSAR/PvqXdjSbZwzdKJCn0cIMliA+Gq3ldfTaxfIG6b3lNzL0AFgJQG+sSw4NsWkEz1cB36qqMmZmj4b63As7YnGemdPTcJeGqru9nClfGLTV21xi7GCj/4/IozLOoKQoiB2VWufhCr42OVHlG1k9MZAHKMI8mt9Dt4gG8+x5eeTe4g8ZdQRC4bbtW8YhOlAPftLgPGlSQ3kLbubwfAk3hsD5gM0jrXA37HKBtpR9jwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qk9Er9DeQD4s8rm9HEpa7rWfuZ37/Z8xNHjfAROGys4=;
 b=sju0bjKswPSlCYHU6afrxMO64sI5e1LAmgAfbDXHwbAYr5tUTssjp6li/Sk3Yk55+sMHUzipG9ttVLIQ8xOBhautR+UMI2S/EjTYUATar9WILizUK2f2962XgFe+cAAkri9tLuygxHLBYWwYdEI+Eu9ToqumVA0xbqVtFUXOcSIxvmsnLANKGPi+M9LAUk3Hn7w1jmaZFyS2JzrYS+/EA2IvHLXph4Xpb8TGCMUsu6bi2dySasbe90nq3ZgRceyFSV/2O9sjh/Sw+AXD7k/3AT9eF7FRyP0ugoSvyG54TIiYPVt3T2KssJTjrn2+ji/O4YrrOA/mVb0hhQYCWXP1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk9Er9DeQD4s8rm9HEpa7rWfuZ37/Z8xNHjfAROGys4=;
 b=Tie3JPjqvs6fZdKe48pYt9Jp2TJLgFxHqahG9QPXkvXAXiktNvITidEoj+wjvCSPeg9MbksBOW+45tm549mqD4iqpelzoXiErTdsnCRrQlC1BNT0laxXvVLhjzK8XRR8WYF85kCAo4u+CLILJoN2DrdzPL92QTbY3Rv4qbN/TMk=
Received: from BL1PR13CA0300.namprd13.prod.outlook.com (2603:10b6:208:2bc::35)
 by BN0PR10MB5046.namprd10.prod.outlook.com (2603:10b6:408:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 20:30:56 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::88) by BL1PR13CA0300.outlook.office365.com
 (2603:10b6:208:2bc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 20:30:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 20:30:54 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 14:30:51 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 14:30:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 14:30:51 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RKUpOL1109933
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 14:30:51 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vkpi7-000000003pN-2ejx
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Jan 2026 14:30:51 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] uboot: Deprecate legacy UBOOT_CONFIG flow
Date: Tue, 27 Jan 2026 14:30:51 -0600
Message-ID: <20260127203051.14706-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|BN0PR10MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: 512034a2-5146-4010-3827-08de5de2f868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZqMsSBHziKox/T6GgWEWyoOZwKAfwVpq85q+NtQzzDi+0bzTgK4ewGshK0SH?=
 =?us-ascii?Q?yG8/06ezPwWkr//8InQ7enyEMhd6iJTm/OsCS0TkrU9i9kLD8WTjC762rTvC?=
 =?us-ascii?Q?8ZyQV2WgGwhxlG8iv44ZJdb7ZRP/5/6rFFqPiJGw2CKLwJ8fdV5g4N0QISfT?=
 =?us-ascii?Q?n5JqxChX/cNG734dLwzzSMU4yKOQvKk1F/B3Ra/3aSg2ThZycRrJcjL9V2Au?=
 =?us-ascii?Q?3/mEX3cREO6OPIMMRH+gsHyIBPCCDX8hgCwn4AjvVIIybw047K1TLUxHZaeG?=
 =?us-ascii?Q?+NcZpm1gXtCfh0hb/DDBdwRbjfDLGQUAwz8mpW7/dHTDNiLbAL7SzVXUORxh?=
 =?us-ascii?Q?CY93L6118eVcn0tiU42/DRenT54SSFvLW4Eeed7st6c3lul1vB6gLzl/zrNe?=
 =?us-ascii?Q?UmaoWr9n74pOH7nWjiO8d04WaOF4THSIeNH7uVdROp4G4oJz3dAz9bgdXicF?=
 =?us-ascii?Q?NKHbIm22/A+lLz3a8brY/92BnTndEDg7k9orH7TvP1znfmxlN7sLtlk/DrmR?=
 =?us-ascii?Q?2K3LPQmB0o37AyXi/0XA6VA9qcl5TWU/1A8smQkQ21xtCUYNaZKyNYzWomRZ?=
 =?us-ascii?Q?/TBU9jB+3jlBm+7rRzORu+fEY50JfwpdQjk6iRm3apbgwhVTwOwge2/KTWsk?=
 =?us-ascii?Q?ppDxUOcALBPjptfWKEw9fpc5bw/m8sU3KnYhR+8/hoaYAx4KrrQipdydcx5R?=
 =?us-ascii?Q?RD37xV+pivmBjY5hbwXKLdcdXLjGieDH/SMJoeccQrND7z+FVsm8TGQPyilv?=
 =?us-ascii?Q?4sG4n+0DxQGymRjGPdCSnHkVH6JQE/7fHke1VE4i6mu2txgDhNxYa4/bpgTi?=
 =?us-ascii?Q?VhOVDq2T7oDPlymTxsOOevEEA8+lbv/GdjDU4ncqLz7axyFbcnzemBt4blXn?=
 =?us-ascii?Q?Ny1x33lR8wNpNU34OAGAiCj7Hh5ZPoJitBxENXqYf/TWXRHk+0a0RHaGtDRL?=
 =?us-ascii?Q?OunE7+I9hMc08MzheIAXUjuV+HTsaHRhOktKFTkoB4edj0/cWlpr59CAkQbi?=
 =?us-ascii?Q?/IzyhITU8OHI9PxnBFFbSrazDspqeNEIvHgdIz/4c7qkMazIvnSlnme8QX3f?=
 =?us-ascii?Q?xs/of3/59tvsgUTdKbXd4KSPSHRHxmtphKXKFhMBbZO18Ut6pj5pqf7SKXYF?=
 =?us-ascii?Q?Ys2FPfF49YSGxwckHL6300up7yoDpt0AS7Khy48dBDLCQu0DsqmBqqW+oaL5?=
 =?us-ascii?Q?g3mHcde9uQTh4WwwWBlWwl8MyL+LcI9VXukYAZBliDmlqN78DDjiTK5bEeQ7?=
 =?us-ascii?Q?FXOFI5qnDXNOoIv0R8be8HQQhX/ntRkRbXWJYCnenEHusVAmLeNJg8lifo82?=
 =?us-ascii?Q?wKwTTveFRxMf2RT0+oOX4V/R5CQtysdD1Q3ciD6WVFQinVb/mCsjzl7pM2KR?=
 =?us-ascii?Q?1rlbgNlMiuYzBbEQYpj8EF8yVZ+XmGYkBDYUutj4uzo9ZfuVJchCXVTAvIAe?=
 =?us-ascii?Q?ADBpr7EjKiYlkmK+ZhoOZ9PveQeorcTSJ6PvwdSHJgfAXPedMxwg6aLAp6Tw?=
 =?us-ascii?Q?zbpCJzsLrekcHFue8gGyz8jPnv3PqmB5xxcsqVOmSyKAH7XcXv8Np+zUCvKP?=
 =?us-ascii?Q?sTkgbneGAG414GYhY8uP4v4W7o5oB/v3u9AGaKDFfe+EuziIHUU+Y+yGyf8u?=
 =?us-ascii?Q?4uZM4ps+IAPw360RZVGlDvILawFgmdd1vxKmJwDeOki74TAz1pfJxSM82Zml?=
 =?us-ascii?Q?/viw0g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:30:54.3621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512034a2-5146-4010-3827-08de5de2f868
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 20:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230065

Mark the legacy flow for settings the UBOOT_CONFIG options in a comma
separated list.  This code will still work through wrynose, but will be
removed once wrynose is released.

Add warnings to point people in the right direction for fixing their
configs:

WARNING: Legacy use of UBOOT_CONFIG[foo] =3D "foo_config,foo_image,foo_bina=
ry" is deprecated.  Please move to using UBOOT_CONFIG_* variables:
WARNING:     UBOOT_CONFIG[foo] =3D "foo_config"
WARNING:     UBOOT_CONFIG_IMAGE_FSTYPES[foo] =3D "foo_image"
WARNING:     UBOOT_CONFIG_BINARY[foo] =3D "foo_binary"
WARNING: Legacy use of UBOOT_CONFIG[bar] =3D "bar_config,bar_image" is depr=
ecated.  Please move to using UBOOT_CONFIG_* variables:
WARNING:     UBOOT_CONFIG[bar] =3D "bar_config"
WARNING:     UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "bar_image"
WARNING: Legacy use of UBOOT_CONFIG[bing] =3D "bing_config,,bing_binary" is=
 deprecated.  Please move to using UBOOT_CONFIG_* variables:
WARNING:     UBOOT_CONFIG[bing] =3D "bing_config"
WARNING:     UBOOT_CONFIG_BINARY[bing] =3D "bing_binary"

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/uboot-config.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 823a66157a..87ec908000 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -27,6 +27,9 @@
 # deemed to be limiting in terms of expanding support to more and more kno=
bs
 # that might need to be turned to customize a config build.
 #
+# NOTE: Suport for this legacy flow is now depcrated and will be removed f=
rom
+#       master after the wrynose LTS release.
+#
 # UBOOT_MACHINE =3D ""
 # UBOOT_CONFIG ??=3D <default>
 # UBOOT_CONFIG[foo] =3D "foo_config,images,binary"
@@ -181,14 +184,19 @@ python () {
                 if config =3D=3D f:=20
                     found =3D True
                     items =3D v.split(',')
+                    if items[0] and len(items) > 1:
+                        bb.warn('Legacy use of UBOOT_CONFIG[%s] =3D "%s" i=
s deprecated.  Please move to using UBOOT_CONFIG_* variables:' % (f, v))
+                        bb.warn('    UBOOT_CONFIG[%s] =3D "%s"' % (f, item=
s[0]))
                     if items[0] and len(items) > 3:
                         raise bb.parse.SkipRecipe('Only config,images,bina=
ry can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
                     # IMAGE_FSTYPES appending
                     if len(items) > 1 and items[1]:
+                        bb.warn('    UBOOT_CONFIG_IMAGE_FSTYPES[%s] =3D "%=
s"' % (f, items[1]))
                         bb.debug(1, "Staging '%s' for IMAGE_FSTYPES." % it=
ems[1])
                         imagefstype =3D items[1]
                     if len(items) > 2 and items[2]:
+                        bb.warn('    UBOOT_CONFIG_BINARY[%s] =3D "%s"' % (=
f, items[2]))
                         bb.debug(1, "Staging '%s' for UBOOT_CONFIG_BINARY.=
" % items[2])
                         binary =3D items[2]
                     break
--=20
2.43.0


