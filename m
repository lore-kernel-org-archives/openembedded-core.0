Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63599D2FEF4
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 22:34:41 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2118.1769553278462636224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 14:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SuFZZoKy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1fuZhcaBoFc3alg3H6/qIkDLuek0AiIpkPz6I8s9SrW5RRL6mJu6ytfJ4FB4InHRETzcmJQZmFgAthFOM65q6XMkMX2tJteLgswEsvp02L8FWcW+aEqVb1yncvMZqgGWBqsM0a0s7tYwV8q/7DN0norrpkti/Bs/QFED1qUTNs0qKNEovnDMo8MtZdd5qeu7jrjLm1fDmaDp282c6Zd414jC5qlHYPa4mndKXk0gSegsb3v/rb12Tpv1upNoIIyaF+jz2+33afsHD3gpzNGiBTuZW/X/HhtAuppx8u/LdM/9lJ2VKpP6Ps/49DXt7k+23D89c2e0JnE1zPsPsFhUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJHVoZso0aAg1OE6fPpkSoS1FYsEjcmp0R+555dj5zk=;
 b=BbLv0HDadBDt4DIWYYCqCiMkpxYZnUaxZ6RGAdd+j5jaVWEVe1dBvsnCbvPX1Q7hQRLpyPFyUQYF623WPxFD1mf2I2QZcWiPxAASRNqPUIusBJX7Thq+yc3MjDQT+Bplk2PVP3lYpeAMZTHUy+sE4Rn4+Itj5+20eFFw772C7fnwRxX3qS0b3md0IUdaj8FlDNntLwE40UqrA5JbYAiJtOI7XJnf8fWTn2GkKjTn9nbSKXCEKCk7Yj93nKgk76s96z1QsXDf8HIFqEylCvScBqv5w6MtbVeydScsjy41mU1T7Tto68orvi0azibnapfX/u2roX3CCpBiHZ20/GTGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJHVoZso0aAg1OE6fPpkSoS1FYsEjcmp0R+555dj5zk=;
 b=SuFZZoKyzEEUAoGaRaAv4zRuc81OBDH0L4eh+DTJ35iWH+c8rzXK3Zs0l+LGEbzTBRW3YnF/ZsWwoKHn/Ub7U2jybFoeGsi1Sr8eRBOs6XVvVm2yVJvl9FAqVi0jd+BQ6w33XJu+bDcpI/+pb0/AhapDY5rg1uEkABM3wQQrD0U=
Received: from CH0PR08CA0027.namprd08.prod.outlook.com (2603:10b6:610:33::32)
 by DS7PR10MB4927.namprd10.prod.outlook.com (2603:10b6:5:3a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 22:34:35 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::20) by CH0PR08CA0027.outlook.office365.com
 (2603:10b6:610:33::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 22:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 22:34:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:34:33 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:34:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 16:34:33 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RMYXje895458
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 16:34:33 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vkrdp-0000000063V-2bRK
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Jan 2026 16:34:33 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] uboot: Deprecate legacy UBOOT_CONFIG flow
Date: Tue, 27 Jan 2026 16:34:33 -0600
Message-ID: <20260127223433.23270-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|DS7PR10MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e26b7c-677a-4dd4-c7c8-08de5df43f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?44OeVFeWNgS5t2zp3nsAlYuOUMTS3SduSrIw895LsnvyXrR+6AfwDZrWBT18?=
 =?us-ascii?Q?fa9QNtdc9i6HXLc8DYoUu+fbwjnZgxieUiVquH4ITcvwG/m03Fl6XudlIW00?=
 =?us-ascii?Q?CFtHorE012pMGmAgg2YuEXcqQIcjkt+FQsNGIAsKUmh+IMXQ34Rlz52cvWTO?=
 =?us-ascii?Q?IMqyTu37UzRsMHnKvEt+3XQiu3POQeVf8fLJXS217NXeAuCyUAEcL9+H1PJT?=
 =?us-ascii?Q?oW66KgXIgRfvCQcTcG8RbLDTlGkKXnGbpfYpvi/HyGgd5iw0yvzscnA6NpHZ?=
 =?us-ascii?Q?F37pXe5SQyETRfA5bBD3O7vHQ4N7QXridO2n4Fen+Vbgg5vTWiSEiGfliscV?=
 =?us-ascii?Q?BKkLn3BVCwC6MMzJmDPs4DZHwtHppnylGmAxwew2x8sQfnVuEdxy0HvBV9AH?=
 =?us-ascii?Q?v8Tlmdh4C4C3hrCdr9FZd360zdqd9HVfdADlPIRldt/l7dENeBnIY6ZoNJGA?=
 =?us-ascii?Q?mItXw3KphfxZKNZcZkyjtCyjO0Aw8easZlfI8vOT69e0SAW7XuAbKpLkcv+X?=
 =?us-ascii?Q?CRuWZuIvlKEzCyC1IsTarJi9bRNQYRDWBRVxl2QIHle4vWKVbmBHmfkRQ8iD?=
 =?us-ascii?Q?dk/hS9f7Ures8ii8ocLtNidqCYykrKUGwvIWtWgZuQlYmF//Ie/oGzSxQRJ8?=
 =?us-ascii?Q?z9xk8lQxh+KOe5qqiwgpNHhmEdsmSKgrELpKG06AiipifCyv/VCMVmQRP56V?=
 =?us-ascii?Q?2y/Wbp9EVfVNmMv29D6ecPbvK8KH6wSbSgqLSCQCpvtkntlXJOcMCJRf/cIz?=
 =?us-ascii?Q?uKENh+B5/kWgvcUsiTvjy0v0mmwiF5vs427mH4ltC4klvzTpHyLAr2gZnR15?=
 =?us-ascii?Q?gbc+ttM1CB0yrWX+YuFTugO5EAV4HHaaY67InGi2bBsDFatJR/qF1cK3Qs8Z?=
 =?us-ascii?Q?POtsRIV/oOiSX8gK+qp+P9nQABLakfWbMhMysqy9zdaimFvZW4NxnPHzSBGY?=
 =?us-ascii?Q?xYkUGwZL6nf79AKlDZSdNes4P61FURmyJQ+LZM/djz16vQbYIBG/UBBE6K+E?=
 =?us-ascii?Q?u71uLg1S7qVpcu7SEFahh8c7uiO53r1loAXQIdxIxchhMFcQFFeoUUtaOnpO?=
 =?us-ascii?Q?UbrTLW8HliK5cSKkK7KIrjIClT0Vlbx8r6HKkNK3K9lfn4Y1x6XZ6QeWoGyN?=
 =?us-ascii?Q?MEvw39SxbjlJNN7LDPzVMiOX3z/T4g5odI/YrTOU+5HsUZ7BZLs9HOraYas7?=
 =?us-ascii?Q?r4eB/0rKIGtNzsQLiV53RhCfNR3vU5ecaoSdOnmL1L+Y7johVGY0xk+qkLur?=
 =?us-ascii?Q?Yq5EuiKdp7PV56NJEu0smdDhjUjNpDlYNMUEIXT1ADeYU3d806FGep+tmPAq?=
 =?us-ascii?Q?RJEQcIax+VKzO/7FQt9IG8gUKqdgyKSyfsqNqbRueNBhuJUvC3OKEsExilOv?=
 =?us-ascii?Q?iGs/07p+qvYlvLJmpzriBSaAFlpRYcl0yOQQq9MFtJ5VeXtAte1GQ8xXTDz9?=
 =?us-ascii?Q?WXtggU8t3H33Gd6ct5Hn0TAH51UO4+UmSMog80RM1q45uMp9SwR5Ti9vacOh?=
 =?us-ascii?Q?Nu7bAAvkjafpwaAtJIssSHwJI0asbb0hBLgjKGCJjE76c6tclCZckrx1yiG2?=
 =?us-ascii?Q?5u6w1AAHZxJ3mdQN2vG2xcVcUazAOrBXzvLoPwf8xToRQyVyCOyK3yXvuDaq?=
 =?us-ascii?Q?jWASQrIEzj0gZPfEZcVG8b7ctfpBz8biuzYf84P20RIMOirx4TH+IxJRppqZ?=
 =?us-ascii?Q?wSYW2g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:34:34.7003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e26b7c-677a-4dd4-c7c8-08de5df43f44
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 22:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230068

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
v2: Fix spelling error in comment.

 meta/classes-recipe/uboot-config.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 823a66157a..112fea2de4 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -27,6 +27,9 @@
 # deemed to be limiting in terms of expanding support to more and more kno=
bs
 # that might need to be turned to customize a config build.
 #
+# NOTE: Suport for this legacy flow is now deprecated and will be removed =
from
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


