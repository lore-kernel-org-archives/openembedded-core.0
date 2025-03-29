Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA1CC3600C
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 18:09:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.web10.15946.1743271751020567932
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 11:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Yzu/wbUg;
 spf=pass (domain: oss.nxp.com, ip: 40.107.130.3, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8RUIKUMHsoWbNFwOfOB5ZQ7ucniiWl7f5FH7SN961TX+l7vjGhqG6sEs7TYvDXN8IppVxpZMTI3DDH52B4YmMLU+B41eZ8YI190s76XDgD1qfnnzPYDW7r9YUAXKBTC7HH0tYMjBZeT60kIl3E0yiWweZVDlNXggLDpqKa85xNnq4yYscVY/uQTG0sDUb8m+XDcGCS49c7PjQt2jrpB4H/Fm0Vc/u1B+BU1Zn2bp3Zq6tmqJpk4JppElcYBIZxV37wWZnK8uYIwa+uEbe1R+ieVTriPIWZSWHo5zGkMjSJ61bn9uopCAeK8iZ3fnrdmGQdM8jMZNeZQd61+cj1Llg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7O8W/YGLkZ4MlExFF4Pdk7kGC0sxc8jOuSdP2DTgsH4=;
 b=MG7hm/0+nJomkcenhj8V8unpN6mBsXVH/LEnd6DctuJgRwy1qhJSq2EcyXEy0wAU6xBVHi/JAJQ28BTRjcTvjA9R3uRyQ9JTd0MB79JCGN+XT7HS/E35JR5oEcvGXrpr93qexqYw4V3ggAmklv99bNRO24/o31ctiARFKo5Rev0KU1GU1mTF9Oc6sWNzHSyFk5liaQvTQ99WB6y7oJTc1A+owU+RFEtJsJTXZlfPrVpWzwdtExoo3/H7CKmZHyxS8X+8nLYbdinaajDYrxZRlwhD9zt0dSbLu2+lNMxK0894NdGcZoJt16vzQPWBUr2dpdKy0L8HpPdcSbO/pLKNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O8W/YGLkZ4MlExFF4Pdk7kGC0sxc8jOuSdP2DTgsH4=;
 b=Yzu/wbUggkIJYYyJCJbBtmsNikgZv0c2v7Ml6im/L/NcaOUlgAH3z4x1M9IuFXt/c4riuBe6qXNuS3kW1SjLGiy5AuwlXT8nnLljQdMl9gwzArzzFc7TuSIV+HJ7BBnd5S4uYUR7vr4TgYIGToUvSagmi7+S9tiQP7oy4B5ZZOLnBwXXi2o8T20RegZAPgD7A3jzmVrbresCN5Zo7cLFbb1fLnDacV8Fc+AGPxT1A2hvqrdDVUXYnFfX9v1ORo505HXN/bxzPdqVy4e5Hmm7u5GJLy7obPTnFgz+aDOARAP0Vx1PUA4wUnOX52nqH++EAODtfiq/8BuloC1epGzqnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9394.eurprd04.prod.outlook.com (2603:10a6:10:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sat, 29 Mar
 2025 18:09:09 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 18:09:09 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 2/4] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Sat, 29 Mar 2025 13:08:51 -0500
Message-ID: <20250329180853.1057381-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
References: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ab76bc-7b74-40c3-8890-08dd6eeccd2a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ys4h4QLT2v9RcqTBCf5I3NJgmp1DQz9abtfbkuedB2UOZ/zQJB8Cn3dcZYYq?=
 =?us-ascii?Q?2b/fBpBFg/JQ9wtIIOgiEQ+40zy3gUCCfThW6V0+Lrh1TwBHn5JGypO0cHKn?=
 =?us-ascii?Q?SdXc3FkkNJGWZaQTjafs555AKAoNZ1QOClACpc3IVDidEWUoT1cmDDDorfYN?=
 =?us-ascii?Q?/vHpDS1mreLbi2cQeb6qbUYT16AMyHSVl/ubTQXpx1O+AnJFsPAqmyDg+xkF?=
 =?us-ascii?Q?VDo7BAb2YPcswWyJlo9URXQxM71/mCrpcu5yu8/5fQRei8AW9rQEmxWrERhl?=
 =?us-ascii?Q?qPtuIb5+Q0sHyriFeHStQ3PTcrOYha9erjYK2/RCw9Pc3dBHVYHZEovzETU7?=
 =?us-ascii?Q?+X7Ze0gYX9KWdl8z7YwHS9QE1TdCFaakt24VkVBjkLDFyra6eyi1vJGMs8HG?=
 =?us-ascii?Q?GQH64AmT6OiU2PtAKN4I6EaZgbQT6B/1Jo7D/FliiyDbD095CP4SZBJdfjSw?=
 =?us-ascii?Q?zjiB5y209KMzEKjn44Unwm+pOOgTXDZqS5KwCVpYJmVi6OX+HAStrW/lxwgP?=
 =?us-ascii?Q?kYFKfoMRWWeb75krhSp2m6YGmf323CiNC3pL2b5OINK2f2GSAMQuaYa2Asyr?=
 =?us-ascii?Q?idpGQx52wEchQe9/siOWHa/BXM1+dvHrNX2R4IQqpf5rK5Su8o8FpbAJI73x?=
 =?us-ascii?Q?9FXdwR9mUevcs1TdwU2d+OD/8Xp8eEDWSeueRGYXk6adamD2m6D/mVvbTEaD?=
 =?us-ascii?Q?Bfwq6i8z0w8WE/56Hg664OlKKZezGg8VVxfaQJk8xpBBstcGGrRVc2TkO+FB?=
 =?us-ascii?Q?CpXHDz2VKBST4HfxvH/vV3xf2wYXR9hPpL7EoAZT37LzE7xg9IerdWY6kboI?=
 =?us-ascii?Q?Gcw+EFpgVTKYjy+UaVml0dxPRVzJ9f6NmnkYhQmuQGaETPj5sCUcgb425XZM?=
 =?us-ascii?Q?ZcquowV7sQ2ZaMvZYmHn73B13K2VLoNhHfw5YTVuKyFapy+qRCAbkL6NcDlN?=
 =?us-ascii?Q?kvQvT0952k00BRtb9zac3WEmXAvHqLrPOQzLH/3dZwY/dPBpU7kYEe7VGCdx?=
 =?us-ascii?Q?g/UenNk8p345YUPYaStvMdJrcsAXrm6aXOH0p+8S4MnY3WeVvbj8mZM0dfcD?=
 =?us-ascii?Q?ZlcM0/eQlF9SzatBrS8Zl4TjGOg0ywjN9k3xddA2mj7ECkbIJoosFyc4oEq/?=
 =?us-ascii?Q?S3eQZgqGETLJ8spwGK/a50e3klkacz27vstUHf9IjwTpsfxaXiTa0V1k5R6x?=
 =?us-ascii?Q?8kyCKSpiAN4vv0IqQu2YoyX27BBbfVtaFnBttGhngHjN7JiR0zekFOjGBgkc?=
 =?us-ascii?Q?VP/yl4bOlfxFTSl5V3hLsxI7jJEZcVbH7eA/GIy3SMht1KDGXpMxL29ramtr?=
 =?us-ascii?Q?/i1rD3lZZhsGFzJc3dh/EQd5wVGeULOAGxm9PgVlu3c1/qD1YDXhXAQMBoGL?=
 =?us-ascii?Q?00/5c0JzZ8Sd59e5G0XyW0UZoj7e1U5la7hffVpbS67QZ/FB5X95PHLlTjJI?=
 =?us-ascii?Q?QGNZh6OyE5gh7uD3dRlF/qo7jYEim6zr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/EV/j57ld1H/LKXZSzaSqJenql+iN2nDYBPVf37rTj4rOCPB5AhQClldVsj7?=
 =?us-ascii?Q?JbGlXNAwmn9pfq2Do9IHOtg5sxKlw+ucUoq5ScUTZhzspaMFovFd7P6sZUUt?=
 =?us-ascii?Q?/WYvumONF5FSNjC6hIiK/AoeY9aKefP5uiQrsysdJecf+hHMON0Q1TewflOj?=
 =?us-ascii?Q?Sbg01wjYu4UDo/y/koY/u/8B1gr+4lLXaaK5FFNnTqMixUO5LZk661UkgSGJ?=
 =?us-ascii?Q?rdzazMmOK2WmA1py1DqweaWBjVKiA5bcPWxrT6IesezqenVf6crM4bp743xa?=
 =?us-ascii?Q?h/9eHmQRmKWglYnJXpGfqmfkkXBX6ui3LxAr2Wb+FSC2qJxbl3E/soNlXfTY?=
 =?us-ascii?Q?edBI3EdarZLUr57tkrcoLZ4Lg7gUXfQxd0eXKNH2Pn+h9dUhAxtN31/XptzS?=
 =?us-ascii?Q?DmT84zzcU8RLTZyOOdqcYdO6RNgwgiajFgGKwspT8kp4tHjcuvLmGVZPSDFH?=
 =?us-ascii?Q?hVoGPUZ/a2n31m6xmjXofyNM2iwhpfEs+BRiok7xhcfVXIYipr+beCo+JTh+?=
 =?us-ascii?Q?pbZd8+9dWCiMgZiUJ79OHNz507GJYtUdTWgmpJXzJCli3m1WckB4SG6yUhjq?=
 =?us-ascii?Q?cmJ2aGjo98fpz586ro1WG4ODb6Ygaz3ll3kGWT+/HLy45OoHw1KWyDhd7HJI?=
 =?us-ascii?Q?v+OvXhmohC7h/FBCu9Iq9pVYbYWAP/rqFb/I6Km59HCEvOYfcXIYPh3pgXOI?=
 =?us-ascii?Q?BXI0eDHTWKYVilaYUAvtkzBoMfdQaiE5+FIUAWSdb3RjF1LYJOOWkFW9eYmS?=
 =?us-ascii?Q?rS+yGqPj31dciMwGhcHKMnbnLjrggLrqeZu/j+49ZeCJtK/1jY5ii8xdiAPp?=
 =?us-ascii?Q?QN7RgvGUozvYTiouXijZ5oW6bBGvcC1UgLZIaVoa9LtgIz4NF73kO0IMKKpy?=
 =?us-ascii?Q?0lM9uGXm5VL7zmVqYfPEq9aSqhG2kjO3edwDJ6JFHDeSjeQM6c8Zbe0KieJ7?=
 =?us-ascii?Q?ArKwYVTDq8P1P1fZe5AkGSEL8S2JBdfRHX51W5j1svlZlK6VOuVdt3aWCcJm?=
 =?us-ascii?Q?+cVctC9IOcFiaYHfY1QeQ/3045pvmQZEGiEcO5MqTpuvRiVOPffQfMfZ3Tzv?=
 =?us-ascii?Q?bDgeZIh40EGi1Lxx4bExUi/bm5LCMlsEYIMI4yyGDztqiBSFymWBNcvZIni0?=
 =?us-ascii?Q?ehf+r1Zfbi62K90VeVedr+P8GBaeGo6J7haQYDm33mY0QNNzuhmjcNRpUlSO?=
 =?us-ascii?Q?F3dB9kTNJNHR5KQBIY/d4ICle1WtbL16lFoI5udpT/KiTE7mE5MsPa7hHH9R?=
 =?us-ascii?Q?qs4fWxnkv/mJI3GmW8svofudbYmYrk1O25PvwiManXl5JAOdX068qRxf98R2?=
 =?us-ascii?Q?22tVGILE9KQb24nKo/1OIERdP3D762SdTg8ZkKSJCU5bdL/2YNnDypNQJPKd?=
 =?us-ascii?Q?k9PlCZdR4Y9Q8H0ueBONBabM1a/Bb3eTEgw4kWrZsh05U+MF0QnBpV9yJ8J0?=
 =?us-ascii?Q?25bSBK9ah8BJcRSrAR1BJFil1NUH1JmEMt5+ciJsBL7zn/3Ife3/mFwFcsiE?=
 =?us-ascii?Q?pONy7Tu6GraObyIX1qeE0WmiGR98aXbr6mAoXMavvlqn4UFaGHC2AGxPQjml?=
 =?us-ascii?Q?vy6bECGlzECOqRNFyNAQBqoHa8FQfpGt9uc1buqE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ab76bc-7b74-40c3-8890-08dd6eeccd2a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 18:09:09.3515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnjfWtb/XE38Qe2W0nsHxoJYZ3Wk1FDIaaNabeOIwk4gJIYhsIBhDmKzMz1jaTbfX91F+ikOHkYD+V0a5GpcPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 18:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213890

The Meson settings added for the standalone SDK need to be available for
the Yocto build SDK as well.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index e54685e965..3053cd0f1f 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -103,6 +103,12 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
 	echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
+	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system('TARGE=
T_OS', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('TARGET_=
ARCH', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', d)}"' =
>>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.34.1


