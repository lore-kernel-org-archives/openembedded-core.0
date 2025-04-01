Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77496C3601E
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.113])
 by mx.groups.io with SMTP id smtpd.web11.20054.1743516309641251854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=VWNNQxzj;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.70.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+eU251kUYKRdxocyE+2Gv54lcQczP3YQTEUtN98JbsAxr6mHlNpxb4Sb9X/EGFBK8hwe/ZLpknf/uxBmxYuCMhThpqUH7MVH4PB0krhZVQIkomh06MpTOkmr3kRMh0+qbHpT5sKLxYJjpcyy6EHDjo8vtYWNSCuJmMrjxOa+GBVC40Lu70kRYjxgNtlkSQhPjhmclNgA6pBAbeIkX192opXfxRPZFlvOeSITTZZgc73vuu58NINGL9MwGNJSNO3vdxJVn+/F1+vOSkpRR20mJ1oRov1H4uPNXnUn9eBu87Hjr4Y0NAe+LUdUcHt8UXcAZtXiVDf5I9EPsm3+O0WJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxd3Rjf6GyJT0RKxTaf8mBa2G8SOeAgkESvH4Vh6uoY=;
 b=ZFfyGEVC1YANfbX4SlBaITHDC/hZXrz56xPuw6su7VzkmECkCrYTUXgWhP15CGUH1XWFlqMS6jAGgbTMmiBqwokRxbMXs21SkJ5TJNzBxkABENtKZQqKDWlZOasSJ63Bc9sXsx/bnAsAqS0oqeiZAb9sEm2fD0G98MqEl/wK08pJdVLw7RADPRO8Covtx1kJ6wBe4SM9IK1my2o75kFs4Co32Tbwk+4GASfjOCY6QL+2yV/ThYPefD29wODQNn9uDkN0JANexuGmmA449gR7X6HYM9Q+glFFecPczitmEvyGsiTqi8Y4ksib2dW3zrgfYbuY2bk4YCBJIKE/HsNg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxd3Rjf6GyJT0RKxTaf8mBa2G8SOeAgkESvH4Vh6uoY=;
 b=VWNNQxzj6RQzy6q4yI87Cb+9lbMb0MXG/GUkWYkWOctQKtIcCv5RQ3HASiMU2X2KtYzEp95I9HjBc23gisDw9MqSmHpbd7sKRAYdwmBFZt93nc4lQqhUHoK4MvLCciUNAuIgRN/R0ZfMbLWz6yo/Jw7oUiEDCSua0rlsXlnksVvVBaF7/YIZ9cxMKfiYihvdihcQTl+ttAlmdddVCu1XZUsVcr/EvarIHydGfBEpjgTf5yzAXWWRCcDVSYyxT29njl29Who/eH1xeyy67KCAuax4l/8yGBCjpaL7SGShm0iaGnLy4d4TTjga/x0cUoz4qONuyVb8QUiFYsEcp8X/Gg==
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
Subject: [PATCH v4 4/6] systemd: Support using alternative runtime D-Bus
Date: Tue,  1 Apr 2025 14:04:28 +0000
Message-ID: <20250401140430.13837-4-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8f6a4431-3b9d-4a87-3830-08dd71263567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1R9EMQOHZtadAw6g4/yrm+3PZLl6rJrwDhlN/FzZvDOC61UMG8w4DKVDa/Kn?=
 =?us-ascii?Q?kO1OuvbVAutXYRPPBT+qqqbRydxsKgc5PMRVthKzDWpviIFoNSQiPSt6RpoA?=
 =?us-ascii?Q?UdQfWDN+3fGhIgr1uKhpN1If0yxDNR5hc6esn1lZ8t1Wg+Hy7F+B+paOyFy3?=
 =?us-ascii?Q?jMmMDbbPHMPbLi1MwQe4Yl98b/SghKC6hs90GHR3D77pgF+PfEHmkJXPLpM1?=
 =?us-ascii?Q?dWpu9RFEQAiU53V7Io22Hv+L4A9y4JnDeVAtrp4qNCGKRswn6Bdrfm/KAPqU?=
 =?us-ascii?Q?pnfnvZrmmJBm+DfmmTxMNyt//5Wa1CKPpYA38UnObFXKdDUS1qoV46lwkbol?=
 =?us-ascii?Q?2SpEiPpM3/QDvTm+aKhKglF5tbjlwJWBjINE2m2nMLMeSUzPghq9g/md3Fj9?=
 =?us-ascii?Q?k4iD/01hxayaaQ2dlSrGJOKY4NYXj3qXZosd5M6RybVwle2N2K/nGU7h7Xek?=
 =?us-ascii?Q?oy9BhA7ZHXMLEWyl5yxP/ad8uyw+Qdzw73hfldMoWosACbWkOjdVwupoqF8F?=
 =?us-ascii?Q?uJy1+AZqZgW8/23t8vbWtSbYd+BMIoJMqUVpihJcN1RU+p49p1OQhoQ52uTp?=
 =?us-ascii?Q?7+ibp07+HlKcJpnlflFVR7RW3yeqV/S1/lnZ1uXQlkFK7yqusYN7zJG1gNJN?=
 =?us-ascii?Q?ame2+jkck60lML3Uud/fB+wuKYBs/oeTd5amgbELBXuQ5Es0cIdMpr3OG1Ai?=
 =?us-ascii?Q?pFjzsAOlAGdjHTrqEBSrt1oE7YfwoB5rocFdViWJw5mgYhnLWnEN9Hl97riO?=
 =?us-ascii?Q?CM8byDhJ/RbhxgY+HQued2STuCfQiqIGS7YngaMfCbuj+VcEpg+2JqfmURuB?=
 =?us-ascii?Q?iFhpsrd3jQ9LHs3DnxgxOGPo4NS5Pt87Vl8OJDOV+6Ec1r3XQnOXrGDaeOS4?=
 =?us-ascii?Q?NGYB7D6QiKEFLBHbscYxZnZmFnZrVU668ly2J1/cOrjrVsZQJNnoLL1j9ZcC?=
 =?us-ascii?Q?EPUSO/kg+2Xqt8ubctLXc4mEzr/w5jZtyRzo79zjrfFd6Rat35ToK0DOK+b3?=
 =?us-ascii?Q?yb3xnsMOQlekLypw21hLMYSRqn6FFlm/LR2DZFr9Mw8LeT10NNghfjgZiy5O?=
 =?us-ascii?Q?3qkfwrIzS0gdpgRF1tHQ7ipNQs4xxv8yOB5bay7PBacm2zoCtjg9VzaGLwRa?=
 =?us-ascii?Q?j8gtcgKZT4Ka4rtgVRx0SEjOga/rqdACS7HgkhOE7vR7SDHw9zoSykKTPf0Y?=
 =?us-ascii?Q?EsC4utb1EqlqawEeLUEMYwYS7GU4OUwVNFh+rnjbaC1WR9WZl227L52w0aX/?=
 =?us-ascii?Q?jws0HAW8LN0A0Rjnwsk8MLue3OO84PoStZyV/XdEdxxFwa3p2NBcRhatK6iB?=
 =?us-ascii?Q?NqaisXKEkhNDv9IYJgRsUvmljpeTnVEpSUdXKkhz0ah+F3QdcIryFKDe0rXf?=
 =?us-ascii?Q?ShTu6wSzWy7dgKG4zMiO+ByqXe7n0q7Bcfw8r+CXJfuc8ojsJRS9p/ovF0d5?=
 =?us-ascii?Q?/04tiKQvvfu4lafNF1bWOcczneA5+sfx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CTVY1JHOv80+VufbTehaCzeppjvChnNXJMBazWFew4aXXKsWQO5AomSpE6kI?=
 =?us-ascii?Q?5quYVpojQ01RgzEKogFhQ/uLdrBb6xyC6FEuWyllp3sVftzmYSwFXHa6aSoo?=
 =?us-ascii?Q?K6xxXTn7GVfw7obxD0btamEfxU5QChpQNqLiBAthZ49ZuVPnfbSitkjT4tYL?=
 =?us-ascii?Q?Vpis4AVWIz/rS60zBjBu3VWGKka/rIdEPgGfYVgJ5aoLTx5M30aC3lugwJZB?=
 =?us-ascii?Q?KSX882UzHedXMsFeBAJ3ZC6K3cyvaNLpFDVOuqBH6GJtpVKi0QufWGXjtxvh?=
 =?us-ascii?Q?dnwa+0PqzkuB7dQYLGYZcCatMaMRv+wOHNlwPVi8xhyb8GqZ2twI2q4nHd2S?=
 =?us-ascii?Q?ZD9m4w2rpwtJaG6Jbry4oXP+8Q3zQ08SRA1EoUr521YE5UUbw/iCtk6/jM2Z?=
 =?us-ascii?Q?RK36DfrXXP0/VX+Avz95/EGnQ3m1YqlWIu3+6dk1Of2h+O4UQYPhprGK7mST?=
 =?us-ascii?Q?n8XLdbQrA3ixBozN8auQwippkAxHAUab64GE/xzEr1GzLnY3v7lswOIg7fSh?=
 =?us-ascii?Q?q2fwUgBUcSP7TNcTJyQ0+UT9p2pHYEWXMnvSnJ1d0bQ2pKyLZmLU/wGxG7IB?=
 =?us-ascii?Q?uZKTkIUaW2XBPXJYuV+MyThB9hXLwp8URyqw6qXDTF7mDV2Cc0eZgs+FcDjT?=
 =?us-ascii?Q?13uXSMn7H2RLJVilX+gS//bzc/SjXZT7fnKcqQTULC2+imzcxtZE2YZUQSEM?=
 =?us-ascii?Q?Fo8BCLes3ADBHHKIrJK6+cqkfuhsOWclf/Z3qdI9aAXflbATNQI8Rv43VW3D?=
 =?us-ascii?Q?7fl0qewAOcmckQ7F1ATBRlnxEX1kPubLcMw2YDVQBEL17ypuc5nnd89iZ2Pe?=
 =?us-ascii?Q?Oiq/vKh723tybQ83P5f6GvxEcUqMIBns0KtVXMEZmdrdCFc84pql0O/7IiCD?=
 =?us-ascii?Q?fZwgmqOKA1nwFs7TbHze9DbUjXnSgAEDMQKlY/RyKUdqTvP/fZ3hwB6VDg4+?=
 =?us-ascii?Q?yfiYjCe8tJyThmGwc/I4Nu0mKEHYZmLyhciDEyv61rLEjs+fRPm7U4Uc8zSL?=
 =?us-ascii?Q?c7omCDS/cf5bndZG+c5NGEwzRtCLTNejluXLZuevemxZ8DskJ8KpU8OQA8L5?=
 =?us-ascii?Q?ULdqX8Wz7LjxEaSEbdGmoeURTd0DbDRMIhOB0RbdPxDp6Bqqtghhh1YcdFwf?=
 =?us-ascii?Q?DYh7l4X5keA3v2PkXMWCfhMw4ke/dHU1U88haL4qqbtq2GB0qOj4zj94kP/Y?=
 =?us-ascii?Q?b7jbs9ySJfVSZ0BMgbM5Tvb1XqkhtdA+43qr97J2AWt9ROEAzth51fHHPZaD?=
 =?us-ascii?Q?VPWQJOHHpHBQ/22AOD3eFxwzVDINlBXR/HBBJaxNs/FW7wiPgVHQ92elIHbL?=
 =?us-ascii?Q?PHoQlKn3RfksYszftP63ZE6xEQFwTREdIJpmPDU2rbV/6Q71VYyDxG8FCpkr?=
 =?us-ascii?Q?6ru1MOMnfaKtyk5cjc529RtYSZ02t4wOsgD4Zca/UIPlUleUlKLgInhD/UnQ?=
 =?us-ascii?Q?sptIyRM1EUBbvbQVf9ljeDkGXi99ErZHqB424WcyuYzjs374rmXxKek2sksc?=
 =?us-ascii?Q?nCy6fmWUFFHIlEAXlz49ejqR5qGsqfSRNkOToyDDBGWYyKgVthl2+f2dAJOg?=
 =?us-ascii?Q?bbIkT/O6z4cHILjzz6m+a6sjxgaNfckT7nE4FAxgyKd4T74IGVsKsDwvAU8d?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6a4431-3b9d-4a87-3830-08dd71263567
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:05:07.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEztkpbfbXk17F4X2y30wB0KykHGSbOr1p5EEsbjeIZik6U3nvBcD7Mqz3ojSXpMLw7dpPsnAfuloIqFZ7/eRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214132

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core=
/systemd/systemd_257.4.bb
index 64fb8fe69a..24aad11c0a 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -752,7 +752,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/inter=
faces/ ${sysconfdir}/rpm/macros.systemd"
=20
-RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck uti=
l-linux-swaponoff util-linux-mkswap"
+RDEPENDS:${PN} +=3D "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-li=
nux-umount udev (=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty ut=
il-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-g=
enerator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} +=3D "volatile-binds"
=20
--=20
2.39.5


