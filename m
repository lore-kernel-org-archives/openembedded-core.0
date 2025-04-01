Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F88C3601C
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.113])
 by mx.groups.io with SMTP id smtpd.web11.20054.1743516309641251854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IbywiWMC;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.70.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNSLWRyR1p/pRgckbttJtk3DL4kjSRP/EwdtAVvj12MEoY09jJ4a+MpNqkPgQ+CgkAiLr4uhHiKP+k2aLMkuztGs8AiDouBB+uiC76W8Dy0CfwIHYgN/OpoBDiYlmdEAdYuqDW7Co8MG2ggwuO4ksOS0iK0e7DqcnNNcUjbAUU7ToEP0450Y3O7HcqGN/fNRhd3fiNvxTni2FSovsKnCn/kSFswYUHdKRlI0bpdUuWQMMn2wl+JXWFk6bqWBRAhuTcNbaqD+JRvrKiGHoz1MkP8wLupEXzkQtyjCbYbK0Bq9R33CEUBdsiTAyu8166VhiROZvH7Hf42ihYW9moN4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6veEGoQ3rmFv5MfyGgLbYefphwQq1GVNOhnxvPDpNQ=;
 b=bFMtx/6c6NPKF7Hw+xs5eCIiH/qg0LVPSo9+zZ0/pBMRfKo3l8v3ceF66xp/WZ3Tw4s/W7eOQba7KVi9gIizRQZhw1it/vRy8DgmZVPYaK+D2dRMkyy342xz56lUmH6hDEnUzGsR44aTFYLJiBrsBYh7NeCwRGgNX+38YrDYv7oV/fvaa9zZI9oe1kZv7tAQg803mg+ToKpqLPO2Y2YRyN2b4javB+WFA3GLuTJmR6sD+vsgTMcWuY+DAE9k917l1emojDexkaFPQgxYv3reEGYw5DMQFckEOKxY2tCAqStfRENzpHNdfTQx2K/6cl8BP8bvq9ATXPkTKfBgiwOh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6veEGoQ3rmFv5MfyGgLbYefphwQq1GVNOhnxvPDpNQ=;
 b=IbywiWMCEWQVavC6ip84UMF0SH7HFGuhY9NxR0J3M+952Dox/zwBlvu+lKs2qQl0YBCiO2tjhEMqXhwJb4SYZ9U2SliJXYNtmnsopBdQbmVoYLlMP+FRT4NMLdeDcZDPNm+/NL7dQzB2RQSwW9U1TgwD9RRczZGXP1EMRCmkeqkJ+hSQehb8wQa8mP9vWkIpeE4S7Geh0kLoLRgeZdEX3HGjsyR3pGNe1LRbxO7RV7BC7VA5FxnMMgZPEWTUjLQbsgDHu8+MkvfuPEXd9ken/K3uEjlPTWAwdaEAgHFIm8llIiShVrk/KjrYcRo5Abn6El+9q5DdU6Xz5lYg4WjDqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7088.eurprd06.prod.outlook.com (2603:10a6:800:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 14:05:08 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:05:08 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 5/6] glib: Support using alternative runtime D-Bus
Date: Tue,  1 Apr 2025 14:04:29 +0000
Message-ID: <20250401140430.13837-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401140430.13837-1-niko.mauno@vaisala.com>
References: <20250401140430.13837-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003849.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8823ec-49de-46c3-7445-08dd712635ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zWW9lIsXlKzefALhB+AGtoWXk+AqNM91Y+y9WIngfcWAOrZ6esvKAhdFrcGl?=
 =?us-ascii?Q?9xPBgzneL+mDF26EJIh5JlI4xEqPQ/LBUErY6ngw3Mo24aT5TxCxIutOtuA9?=
 =?us-ascii?Q?3KQ8MPlMy31h+YV/D0K/KtqKDy+9pnpIlVq+oCpXk+bjTScLmxKHWuC2wm1X?=
 =?us-ascii?Q?mDNMmJyAIG2wRX6dWLDtB8fyMQVugHtsWGyeYI30vgzBANPnDIiVFlj15x/R?=
 =?us-ascii?Q?pjXlveI2Q+XRiumcIrqLjFdJf5bj/iw1V0NWN9g+svXxgeBwPr7hVyS2wlTU?=
 =?us-ascii?Q?AMwnxY9t5qix4wT/kF0urtSbg1B4p+jluQQuAxtqF1vv/RrY9Z6evl1SBLRV?=
 =?us-ascii?Q?CJNCM9HzWLAuFNo4BVki8zs6n8zcCnxOHHLiTNUJoZZdPu1erUF1Elej9r6h?=
 =?us-ascii?Q?73nlDCXDpUHEjM5Cw14kL1UUr+1UoC7A5vncoHRxzppjwLULHQQ7v46gm3i0?=
 =?us-ascii?Q?9Mnz8aJeRoSJdPFncD/+mZni7NzmxevneAKy6u6hIygwBSHmvt420sXgW5Xm?=
 =?us-ascii?Q?GsAnGjaGAxN8naRFcQaBgviH5fgBDEPWqaRiXrlGGoSpQUYUZxpDnd40mdX7?=
 =?us-ascii?Q?Hb8pVaMNSKfZ9v2wimFrzqK3f9+ToBtO8z7WK6/TpSYVHWIBAvD4AROwVCIG?=
 =?us-ascii?Q?im4z+9TVQc3OL2mSApmRb9fSDY9d2l2Pr7vW9HxPCYnlz321Sf4qF3FP2/2r?=
 =?us-ascii?Q?jYOmpNttleI9bly/H0x9RHxxTWAxsdGGQPDZRcKQaE2gcO8UmwuE1MrVaWT+?=
 =?us-ascii?Q?wS421HWpWmfrGrTDPuIHMdy0Jt7CnfGf9Fifap9y2/pkQNCtQpl3GWLNwldr?=
 =?us-ascii?Q?/iFBzXSEvgKYe89T8Q7ekHWtx1ipwasky3FexseDVL54yJ0uWA5Yj+vQelBN?=
 =?us-ascii?Q?UQrRSaNa6QdveZ5ZW0/ipV+uenwkEuAuBLZKOCZVGYxnkSNvrgz4cMp9da7l?=
 =?us-ascii?Q?2SDhg30EswluFkM3gkGP4qnxBKrFjbeV3uqKoROGrLjl7c8mxPi4jILF0Rj1?=
 =?us-ascii?Q?zBrl7io14VyNV5h1mbAPxmODqG427EBlZnT/fTAgsWUxPwrIu93ONq8mEEHu?=
 =?us-ascii?Q?LwPq9oWl7Bpnt8Pb8ToKpI6PNOgQDjO1xUEBqbPtuAzGASrmVlJk/aXhacdT?=
 =?us-ascii?Q?TKUTrzam7IhaMB7ydb0Y+q6kvw8N8mC/BAEY4wMakOTNHR+5KtRU6sHUgBum?=
 =?us-ascii?Q?K+PRPPmEY0LixwdEKJejLOC7QcWI+EnH6tlbm/K+7W839T0/2KC+555XNVFk?=
 =?us-ascii?Q?u8ckGIaz498I+R4eJoKq6gVnLgUjlzj/7RSoC3m21ckER1wvgEkl7+BfM9tv?=
 =?us-ascii?Q?wO0yvWaF6fGdAT1D7N8n2Cj1z2xk7fuXGBmqLffMmDf6bWJx8V+zP0inHm92?=
 =?us-ascii?Q?qoqe4IiMV+gxH5hUEIFKMNmLKYgXYkvUdI+K17ek2fbA73j63pZ/QDwZQRWu?=
 =?us-ascii?Q?bB/Cd5ewguvCcj9/ModwLpgrgwTaClXW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZRBxMkMoB+qXxi28QQ8POHtS/cesIWNQ2Rvm8VLpzYeJrz7TNurx1ZBQ1Wyk?=
 =?us-ascii?Q?9w4+OFuSu5q1QZMGnNtx+kgvxWVQ8TadxurjpF6eFesWrxD0LJ6n2eVl1REh?=
 =?us-ascii?Q?1OonpKKK5bDvq5iV80uvWx63Bgkpnz8YVi7OSFudTrefZ/RPpfnJ2oqW8lKp?=
 =?us-ascii?Q?FIsPV85Gxsq1wPSn4dLAMzWJiVB8I1ELvYNz0YQVyTYvMQLHYlCSLEWnK/06?=
 =?us-ascii?Q?5S1j4gfB+UAS9XRYBsZhm58Thac0qCzfHms67Me/VPLDfl3sgXou8HtWlk6h?=
 =?us-ascii?Q?13NGFZQLgM5hgMHiDt4u1ZtCTszoCPzoWcbGMlBzoHay68FqetOCpryzFIYe?=
 =?us-ascii?Q?NdGNI5S4n7NXaBJqB35NHMM9G836DKNdIIFB/Brs2jVOlbDvV5SQVKZIbGmb?=
 =?us-ascii?Q?pgyDayRN+RyQZHeZBlz4WGus/tl5LJnpN0BiwJLftjl/vhCzaNLJT6WqpLnc?=
 =?us-ascii?Q?ov4k5gkP4Hu64/6upfY7ulZyuHfdmfl7Q/WDuXe1fG6PiTCutubLGYhRU+J+?=
 =?us-ascii?Q?02iLG5htOMhYKlP+/ZVNjFH/OZ3vzhyalMmjp9o3UWtVMLVIc8Zvy9nPg2Qm?=
 =?us-ascii?Q?s1FJ20wjD84DiHaW++3MP27I0ToZJQO3Bpl78D1Ibq6a8MPtCORV4SKMuqBh?=
 =?us-ascii?Q?can6LPsyvTav/fj9tF0HwZueQ3wkvk6jaUxpZ4GuoICBcmCOILNki6xNU6+N?=
 =?us-ascii?Q?U3CpD1G7uurI/r0v36yfbd1Us6wqw4w1HnpCfFiAgLqbn5CSp4ajxpkj7l6s?=
 =?us-ascii?Q?vIuP2eYA34tSsgYPApXNKSFbInNX7nXV21rm6ZX3+E+MrSMFvyKPrH+3PsbG?=
 =?us-ascii?Q?+BQ0cAbxqquRQqw8OLjfFrhP80b3xxki0UnLrusQOXgVKp3zp3DRVP0fwhmG?=
 =?us-ascii?Q?huRqvNAFXwZlYrsCcoC0tmD/qKvJbX1kANb0rbuY9JDzIlXnEIJV8+Waa0mH?=
 =?us-ascii?Q?UOuyIn/kYLinUlu6rnqnngP1b9MokKZh8Q9LMxdYg9RBswgfhDRAyuWudiEF?=
 =?us-ascii?Q?MxLQXo1G2IqdfzyjvB6iFLiCFDbCL6+gAHRTwYwmqC7m/ige+bT8AuvOAdIK?=
 =?us-ascii?Q?VF0ulT5Uo3qqLhev/Dt6WDGiUHCOzKNHFL1a2On7Zls2DBe2OGGy89yvR5CT?=
 =?us-ascii?Q?Bfy61WjQaw+NA/SmGdZWzIYM31XX1oBp6ysiyQb/b7rUjPXhcQ4jislqsk4q?=
 =?us-ascii?Q?tvhbrnlFjVSMHs94p5x04x3mRGVu2kv1Skgbv8Qsr6VRWSMxPEfXT0LOxwlh?=
 =?us-ascii?Q?/nuFj9YlfK6U0qrF5BEAAITTVEd+E5THF397MFbP90bplzf6MS9ja1YyWYc4?=
 =?us-ascii?Q?HJwzFnr88wokSfh1n6xIJ5j5Sh/8lAB8FBjqnWtx5C4Gc0uv7cT7pRN/TOKO?=
 =?us-ascii?Q?55G8ZfWbk9KPipx37gpynhk6TbHm2MJywTOOG2q1DrSxilkseHP25Xu+5TKi?=
 =?us-ascii?Q?Cj02+srRgS3ZPGHlTTuVXdG5PxP7JzNO1O4MLQo9c8kXTs90sm27uRBN9g6q?=
 =?us-ascii?Q?6+glN4MdKegh8KYpv2oUqNArvtyhAbnmFlyVGfjcFHhj8+IAvxizfKYIWarz?=
 =?us-ascii?Q?ygM1vxLoy6bCxX+oumuP/NS3WWRg0foJSs6eByopqXfIpcMj1Aw2M6y/UJJZ?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8823ec-49de-46c3-7445-08dd712635ab
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:05:08.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQRiW+0hIYZaMTL9zhQdac2cbD0yIV2x75p/U5hci82YC+QZ0q+LQyvaA6UR2POBBBHwhAss5Chb2QtbtUjygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214133

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 61e1a3ef17..2cc48f0a06 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -160,7 +160,7 @@ RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}=
"
 RDEPENDS:${PN}-ptest +=3D "\
             coreutils \
             libgcc \
-            dbus \
+            ${VIRTUAL-RUNTIME_dbus} \
             desktop-file-utils \
             gnome-desktop-testing \
             tzdata \
--=20
2.39.5


