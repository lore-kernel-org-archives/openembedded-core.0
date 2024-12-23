Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C24CE7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 20:05:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.71])
 by mx.groups.io with SMTP id smtpd.web10.20963.1734984321952508713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 12:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=PiTm8CSB;
 spf=pass (domain: oss.nxp.com, ip: 40.107.247.71, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+s8WoPDK2Xr8xzUTJF2y4iMFEkJuUDIecoHC860N93wVDbdcXHnLdlSLHiTgIqWP0f2FV68LJgBjoFcbEBu89xc/4YFxPoUTcecl9uYJGLt6IbirKuAaFgYq1X6sn5cCTv3EU/vVQjlwaakctJtTDvr9BhBJvSum4fqWT3M6FXClZ8Itk81lNL1qqZt38riKbV/hI6wkL352XeXDv2LLhOGx/aMNOJsqbMWoQJOJu/uGkS9x39ARxCIf/27T6wjeDH5KaWjXdwECYKqnZWZyqhVkFDcYpP0vOG8wcvegmNVb9af3ZV8DfsAEnWeaOOPPIgkgsYUYrO4BthAVDy6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epIEKRjqGJElmQl+6kZUAyBh7YI/1hpQ+FlfQ+3ykRI=;
 b=FdzO+MIIfPSawkp79WR+vm37ZF02/6jrGc79n5om7OvnpWMIN9ZGtIDzlzxTvNQBB/bLoH+xyiDum9X1YsFxV789ZPCs4SBTSgaTJtf3mlEPDpzLhtyHr/rwY8+FcOHLU0k3NMjlYbSrN8SkvQOm8jDQagSCPYY4/dxnZn0OcqXuAXlA6UzKhaSPoMhSYjXy5wPmE8SbojeacOoGoW2xUv3yVpgl3AIpsNHbe80cZw6QR7r00m1hbmkQelmmxb+gE7D1KA1IpvWGRDltlsyPAioN47PArFOtwd4m8bXbDjpI/zPlqEAXil8Jmybn30Dt/1sxk7BfR+EIUjXv29ZU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epIEKRjqGJElmQl+6kZUAyBh7YI/1hpQ+FlfQ+3ykRI=;
 b=PiTm8CSBn6jGbnclfX1qd68IQ+1ZnqcKm97IOAL7eX+U2JeP3xB5f75qQKunyDgdpR+dxyztvu+SpXw4u94SP/izbL+9MHEyMiumQI2sukxHONMQnWB10WZAPm5TvQi6aDOFRJ7fmF+cgQxNAaYRD6NHS9m58iIfZGFbxjZGTkV8O7UsKZOi7oUp2bJrs76HoZ/fsEGJcNPcorIwzfyS9VVfkB1nCZdbP9AZ323jKCsm7MNr++h2ezkV/+71r0vPklmhhSHpiCqtkDDnCLm3rnUn/ehVUpvWcRjfLYZ0L7M2CbtvaR+as6/hG7Q61xBZhGTOwmIdrrcTndwkojSZEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 20:05:15 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 20:05:15 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 5/5] mesa: Fix missing GLES3 headers in SDK sysroot
Date: Mon, 23 Dec 2024 14:04:56 -0600
Message-ID: <20241223200456.2504683-5-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
References: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: b593344f-23b4-4986-562d-08dd238d1de8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cOOLedmtxzdBKC61nHzxmoFiCaUzCsk6k4ls1CEfg1SzskBzN9ig1VgxfMQK?=
 =?us-ascii?Q?HNBMFtpyeEfazR69xRf3LziAnEoYZg6KDNn5PlXIEdT1hkKDtusl+o1qraZT?=
 =?us-ascii?Q?UkS7xWiy3h8B7GTHx4qfXptl6I2IcSHZqwboZS5LhKiIp50cMHupuwrMXGWl?=
 =?us-ascii?Q?Mof5Eyv3XpBraRW895oAJr38DNXodnxcU/3fIIZKN/qDQSlew4RE57HfrkL3?=
 =?us-ascii?Q?dYaybDCcPm2R7J3gY16IcLYoAJFTZONp/sXGjNOl6X05+T5cwTVrq1PkzvaD?=
 =?us-ascii?Q?r2kxwAgkhEPwaQGNYnIzwT2NwynteoE5chyTBN282NwAVOt/dDqxCDAWEF4W?=
 =?us-ascii?Q?s5W60cCcEXA1ETSRpfRQzVgnNl3lhf0Lt1Q+d2p0CbPy+qYzW7k+dPiD1Xn2?=
 =?us-ascii?Q?T6hJaeIp05uMcSEyK+sd8Qo40u48I6/O7yx6otn4VpqNz3t2ugVCgH/2hGCH?=
 =?us-ascii?Q?mm2G7LGrTb2XfqcqJnwm8WilCTbsn2HdRpqcN8QrzYWQ1RDcQy97NMJUFIin?=
 =?us-ascii?Q?WvtJI2KYXPZsu2YAwAqLHbyhgAeuW5eAtNpCKmfeHWp1RNdM7EPAgA+dLWJ2?=
 =?us-ascii?Q?wC1ZsLHaOVQh1jIQChdw+yrFPAlF8LITR6Bhm0n4GkMOTO8HDf2T0BRVD0uj?=
 =?us-ascii?Q?RE3Hn57caXLDkTK+IjypiS4c1pTjcKpJcNNQFSZgCzEc4E6IxTUQOI8S84LH?=
 =?us-ascii?Q?AhyT89D5fYepIFjZuaWrPQp/OV8Oe2LA0QvTe1YCW/TXEboyEHpfgJiBhfep?=
 =?us-ascii?Q?V77HH2OmltaeVT6xq3/K1niroaMmVeSiUXjUKiNvqEfbGeEmPqAsBreW4Rue?=
 =?us-ascii?Q?+Y+F62ijIV2viZTYkZPpEHAV+z9YUW48ir2dLtAbYuhZtA5gBhd10G4BZjpZ?=
 =?us-ascii?Q?sLf8wKqzaFDtmnqf78jUOuRmCwxiH2Nkn3R6JujjMckpvrVyr3iCev6ZZ22M?=
 =?us-ascii?Q?INR5epiy71HfCq6VbCnAx27K+kzNcbISskN3WUS64J4Fycsm4oUEgqugugcG?=
 =?us-ascii?Q?RmPjuja3Hba+KgVwhQ3zpp+Wf1LqKUphYqA+h4hw5QVQ0xsOhJ11UCChB1te?=
 =?us-ascii?Q?7VNYMH9eaGvbHvie1FX8J9xM6OoMPlDyJAxvjsthD2OknMe6yov1BXoHJziT?=
 =?us-ascii?Q?0s6gjdKuyjrQQ40Ls35Zc89O3FnGocbJBcfoaoxv57Wb1BN9Jns9cN0DaDX+?=
 =?us-ascii?Q?d3kbdlbAOSbC8902Z+aqtcBtVy0/yM4+UzMIFjD+YeMqAFCO+IsIgQHDNwk4?=
 =?us-ascii?Q?xsuvC9x8a6lgMulqt7GqkhlO4CGATaEGxdiVhu9OuT1r6nU7wflq+uxc5pr8?=
 =?us-ascii?Q?xfCBSq8C+oJTsBL2KgVezMMJlr+tBHC/0CnVetfzGh7fly//bnvjKNQp8tnA?=
 =?us-ascii?Q?wbLBJ71f5BjvzcZCohkXDftcTwEC/O3+3WZD4W6f06Ksn7Bum98JZMaIzzvL?=
 =?us-ascii?Q?MZBse35NwXzdQEzBu1OuhKTJr7FlwDaZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P5Rsvl0oEorMjWG/utLE+jwTFSNN8Jsu3TkZKQzAVM3bxYWBQ5qUUkyemxl4?=
 =?us-ascii?Q?Jxk018AetYXfovo0GqVTnpzY3WGTq7GzBvg9kZLUJNL6mCoDcaWHMhXXTwNG?=
 =?us-ascii?Q?dlLzugf5gZMFbnfipKOt2oJYzI/l3QhMsMmwxiwvEmjoj6QIK5qP6lsRwugn?=
 =?us-ascii?Q?dSV8/VDy5AtqX2zs0ubd07Ii5nnebMwa9pKKkwfyoXcy74LW5XN/LKvz/d/5?=
 =?us-ascii?Q?GxwhcCFcvkTNdOdYcqsbC8VcarDbNwso2L4YpKHRZwZfxN0F7bzvjvy/SZCy?=
 =?us-ascii?Q?eqM6mQb9qwXfx4EnS6EMkXPmiOqTylzQ2qJ4CIPIMvNZIWiA4F7za8Ip0Rc9?=
 =?us-ascii?Q?dJowC+DpJyGVTQcbexcBpJ3prJ4iKoX9+K5gkuvueCYLJobgGn2iCVqUVpjm?=
 =?us-ascii?Q?nbGetQMPjyEFkRtZ4Y/uvOURmca6phiwZwtU7GPiTG7X76Nq4wMO98dndmDf?=
 =?us-ascii?Q?W/wsBjub5NnDf4pcjRNApiMw8SJr2CVNB/+K70xp+DUDdB3Kfr6R2bytkpgU?=
 =?us-ascii?Q?QHLEzyhIj88txDEOnWt9y33/MTXS6MVLjjWEpp0KrVN7uM1OO2ksQLt1Klby?=
 =?us-ascii?Q?1nMb+kU1ArnOxAg5PZ8M1rpkrdz6wL6CXnG9fn5uFXojf8KiQ1NDdls7Ga2w?=
 =?us-ascii?Q?LcBrDfUi0vTI8cdQUT37ev5MVW35CszNOiSK+5nMBulr2V7M9wMaoRZwiLrE?=
 =?us-ascii?Q?hV6a+3frKT8zyU0yJ0ZYU2z94goqnSxLMS2hUiNNls8rwhcXqE4DqxTo/9RL?=
 =?us-ascii?Q?TuId84iQH/fJQn8YezrNJHD6GZ5N/QX3lXXr0zJcFgP51Y9T+gLZj9kQEBp8?=
 =?us-ascii?Q?HBeApDBWThzNlUjLDwZObznjs45Bt44V0KOngrrrGaxzF2u7SM7sU24Bkzwb?=
 =?us-ascii?Q?d1p/gxlWTBHxl5pDq/6gh12SmfeKqrT6gVTnw7lC2yvu7UQ/c0lmh2i/3aup?=
 =?us-ascii?Q?AVwpk3mz6vOB24BWJytaFQWOFYJpJME+JaJbgu85Eg0ZTOlMnLGLk8o1ZFGb?=
 =?us-ascii?Q?GD/d1y+TRvSeafjuVLw+xVUJdv87edhs6xxqtv/sJ9JUOQLj06eo8yTYrzNS?=
 =?us-ascii?Q?z7RR79ZD+XUkbYRJozd2LpBQeRV/6ewrY0ZghZOOXwxf5v3rlTtPdJpJ2jJH?=
 =?us-ascii?Q?I+LO1h4DyaOGnSAXTwpexmtHj+mfDX1xCVo9QSsJWYib/EjTbBObYApYaVpu?=
 =?us-ascii?Q?XMC2/Rw2yae07PRdCaEK+DOZrerJUThpQoUq9wgmqkHQQQxw1qmxYqIYDY4X?=
 =?us-ascii?Q?ttRViLYWaZ6Dr2eksNVH7yayzQwn4fOClsOrs4n/iZYW2cKfly9VT7PjF2sG?=
 =?us-ascii?Q?4f6voo1Qv2tbw9+WsmJWbvxV91dNAqwk7nDpt+TDBDliyTnQK3K8DWwdCjGH?=
 =?us-ascii?Q?TPGGZRFOL2F2zuNIbB7Ib3lZgnpg3oJH62ocdkE7uI7HzYQo69RxYAxxQ2zP?=
 =?us-ascii?Q?kWvk/4E+F7F0IQLRk8o5EMf8aztNrfXZHvOllIuj6CyRG7h8/aiHJJazvRdF?=
 =?us-ascii?Q?NyWfH0fgKpeegB44roU2UOQvbdgQ/1CrGcQJYn6lZxEcmPwbWnjkg25Vu3ql?=
 =?us-ascii?Q?EhhQ8J6mkfaVaUI5WcBWf8O6K5WSSpAOwGPcFLuj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b593344f-23b4-4986-562d-08dd238d1de8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 20:05:15.6921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9C6ZR+TVHzb9hX6c18PFlEQOJrqy6msBl4vcKKQEq8IGuDQk7PfviYAd7sw+lC7E3mackWGyZ9XNlVLvLlMM3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 20:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209052

Building weston with core-image-weston SDK fails:
```
../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: fat=
al error: GLES3/gl3.h: No such file or directory
   29 | #include <GLES3/gl3.h>
      |          ^~~~~~~~~~~~~
```

Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
which is packaged in libgles2-mesa. However, the headers are split
between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
GLES3 headers end up missing in the SDK sysroot.

Add a dependency so the GLES3 headers are properly associated with
the GLES3 implementation.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 9fdf496e8b..b3c595b767 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -233,6 +233,11 @@ DEV_PKG_DEPENDENCY =3D ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
=20
+# GLES2 and GLES3 implementations are packaged in a single library in libg=
les2-mesa.
+# Add a dependency so the GLES3 dev package is associated with its impleme=
ntation.
+RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
+ALLOW_EMPTY:libgles3-mesa =3D "1"
+
 RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'openc=
l', 'libclc spirv-tools', '', d)}"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
--=20
2.34.1


