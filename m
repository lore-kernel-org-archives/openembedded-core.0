Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A00C369B1
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 17:28:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.1])
 by mx.groups.io with SMTP id smtpd.web10.32589.1744392526803705511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 10:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=M6GfSQWJ;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.1, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysdnw1UerctLi39e+ZrLR01aPE3EaZBk31vuvExOVhqnREAtoY9yGIS/R4ble++gzxR6L3/FLMTf748srPD3ad3S80pTLo9tGCXofLKgqOvn6yNd6aaCw/yIWGb2Bo9H/bzAAlarfQLaHeMZ5swaRuVac0Mi8Ni5L2qGPIYROq98n6irLoOzzoiJ8k9EsFpFP3acQuaqSgEr9Sj17KfoLV8ffC1QRdeEWPpflrPnoVLGh006Y89qe5gd6hqeHXMXzGzZ9V/7BtsKVTYrwHF1PRtfrLT0rUsZ5JRoW5SlLHR7encXUdQ2csqOMl23qET6ALfy529vJVGKOYpUcQNWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlTv9Z+5+6uafom5gmXMNW1wWOJ2wQESc43LC5+PBgI=;
 b=R2nE7Iu5R24k40hP4b8z6jDK80aFDpiCPQDHfaSGJz8QmY6VTIGHJqSGTAP/Kt8if92ALhJZce58TA3mUaKpOXatv8FlcSdEEhiOz1VbJaycDmXmqheA6t4pHrdR206rDZBdzoH/paEMo28FcgMHQ2OJmHZPqQDSMxDqtJ3gyH6MDaGUoGbxwvVc43wEKNem8pjGut78P6iOq/ZHtAeJCz1LtILnhtPlNZt0zB51haOgAHaepOKLkACboX34xtllE7ac0mdlwVsJxWxu5Q+kLohqi/hEEuy4yOOcKsT/SZX5O4nG+315LFRZWpeySYbOgwp66Z+N1oyJu63/XSnhbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlTv9Z+5+6uafom5gmXMNW1wWOJ2wQESc43LC5+PBgI=;
 b=M6GfSQWJgRq7dk2q/O/9A/ydgrk/30EqGptOb2gmdGNINMBUOPEJq1NOhw8y7l7r/uavtvs+TVL5+ohZMMNq57L9GNE4ajjiHbvVyX9xyr4Wij7ki2QjB2fj2skfeuzyj1kDEyNf9KgIsxcdDVnfheEtDHMjQxAoEXahzgNDqjVckM4RSzLPF5GEvW7sdr3RQ1tQwMIpPDan6RwioQlxUhuaWxynLJ6JaKiZ+bjMAvk5BbpLud6jbttQx7AThE7NpTGi6zbhmI/Mc/7WuKr1rLMSke2W1/sLaYclmlGSOO419cOheTIkI8q5wMFMaQIjI/SDnkyHrVSsYT2eA0G1jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 17:28:46 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:28:46 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v6 4/6] meson: Fix host_machine setting for native cross-file
Date: Fri, 11 Apr 2025 12:28:01 -0500
Message-ID: <20250411172803.3706607-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040AF.namprd05.prod.outlook.com
 (2603:10b6:518:1::5a) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ff214a-562a-4fa2-d32d-08dd791e505a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J1c4to1YUOC3EmmMSDHriTMCyqwR4gRoJ3PDh+4zoXHyBd0nOMGTeJH4Z4vf?=
 =?us-ascii?Q?qPV7jr/V7ZnKOnZB/sNKdhb/hg9mxMmQa79hXuqSiUfbofWy9lrXGCly9+xu?=
 =?us-ascii?Q?PmADqoM7ueYpQymCwj+m5oveFlR25iCDZkZ2BjwOaZcLAMwFlV4WdCi+Mt5h?=
 =?us-ascii?Q?x+IJ/Clj9wUXtevf1BNE3m3wmo5nJvEjtCnM2gLzaSIl1PFMNUjgrOjuiGqv?=
 =?us-ascii?Q?Iu1uxx8b/uARor2T2PXzDAMheSmagOPusc50vnVgUA31KFu0kfUVMkp4hEPQ?=
 =?us-ascii?Q?GGFh7PHQjRBnWyPMYFnx0S85yS5c+idFc6d+YqZK7Aa89lK7EWuTbsAJpWX/?=
 =?us-ascii?Q?hWBU5qR9/16j5/4uNRXYx9x1DQmLnVF0G5jlNLr/F/N6FM/v/qRa3hFwpv/h?=
 =?us-ascii?Q?h6sf/FPfMzU1stbZp3vr3z4qn5Cc61WUu/w4+xHlvGJceoAYvoIhdsvC5FBL?=
 =?us-ascii?Q?c2qUd+QIiI/+BSKIc29KvPMmncjc4Yn2T3uzRJz/QENbP+BznZg1Cx2VSGB3?=
 =?us-ascii?Q?Zy3K/dTUbj0uHMyV9bhWSBshQVClQsRy/1u4hzfNy7ctQF6UvHYdJ4GWY4nv?=
 =?us-ascii?Q?9IhoIlTKuVHAuacEysxzpaYun1t26hCIYWIC3BBg5iYyBb8283LRSaATZnjI?=
 =?us-ascii?Q?MABYm2PuiuTPM4M61fTKhPrfb5nts9oKhVa5WR0SdcqQIsJ0Hr7SogfHMYGn?=
 =?us-ascii?Q?dJgsSFaCoTUFsg8TcdHW1YZhCRXpXjajJPXXk8go7j8p5539ehiiGQgK0L96?=
 =?us-ascii?Q?Gq0VyNypVQeTG8bqiw4izBZJ7hqJ+YyhHknolTrGd+aDM3Nb8aOn1IiRsAWO?=
 =?us-ascii?Q?eYeKhC7ZOzlgWyVBTgzGTggtmMN5IAK7nKd8xCTvvjPg5wnoGW8uINXv5FBs?=
 =?us-ascii?Q?KdQgj98jLfIhjXOepdjzPIUHD5uS3BiAAXxsBlBMwtRQnpHu8hEVhzwHMI5I?=
 =?us-ascii?Q?oE2TkZvADZwv8Gw7zZn9sp+zkQMdG3l7Ip0EyoE7jVrZpJkI7w1RAC6m7VmU?=
 =?us-ascii?Q?2q3aH2pftCnGVFcLNOjYDQNXWH8NQ9ZR5egyXyhCy6TyNv4nHyzgm3h7Rlmg?=
 =?us-ascii?Q?6jcDeKuUrBRHmbH1kCwDROGyEpSZ45zRmFoLKRl07AgW9llTHsGALrzkQHwK?=
 =?us-ascii?Q?mSGd0Kr+i22fXN5HnbImPBpTkwibAFV4qNN5K0uxd35h+lQgAKi8sBZHQ/vt?=
 =?us-ascii?Q?ogh+ZbmZn0lhD8gmUrb9FoeoC4IO80UOznPpVT1pOLq02wlk8ZSCGF9fwWKo?=
 =?us-ascii?Q?IvGVg3D/lBUMN/nb9i5xhIQcfoEpBW3Ozw6t7F2Lg02Jj1LMbG9LLILpZNRj?=
 =?us-ascii?Q?cmQ1emhPOUyWOr/gAwLLLhyOPF6CYxp0nTHA7nqHUxrq/CaUBilPaGiAcj2X?=
 =?us-ascii?Q?M/7YpFRCEGsoQiwd5nG1+0RsTN0NC5L2A3efKHFkSmkmjc+Cr1V2UGQ5Gxre?=
 =?us-ascii?Q?sdyqErV+tbc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Le+dXT1ArWVBSU2pc2d/3dOMkywcoGKtWmaQWQgkUObv4f/G2KNyhidDj/VE?=
 =?us-ascii?Q?+Ofh6CuAiw+KywImL/WYn4XW97fYqLL9pPdmr13TCi6Y8s0kc0Ogd5o/hUhL?=
 =?us-ascii?Q?ZQIWhGuaIhPUNp7wG3pFyLaJRmeUYFewA5c+pCX5Iv84ttWKSgTn5SQZymTT?=
 =?us-ascii?Q?VifO+KDDUeIpsQW+ewhpX7dmRhGHKsziFsnfom1crIhxjw6ZaAntyRYwWSV0?=
 =?us-ascii?Q?n9DY5jth/zLP9mHvkz7mnYMWSCGswIwDTsmwgoJardt5IXr/PRfhy6zmVuZI?=
 =?us-ascii?Q?U1B2d1+i5FEM3ULPBI2IG96HVzRPstsj68RnbHyDG5B1BajxiL3Q7g61t6kT?=
 =?us-ascii?Q?8V/HKMc+fs6FFo81sM/SiN3w10wu7YqoB69bnsaL4bs2QlwkpR1fQD+H06W6?=
 =?us-ascii?Q?yGFrD8fQHVlO9AOoNiALjVwmfDzinzgxZkNmTpVwOu24sve4oLLZjbHIJuld?=
 =?us-ascii?Q?RF3GT13DLVh/E/cjGOkLbAxSZXmTDEZkz4pI+JX8ps0YAm5HhhTLOZGFDUov?=
 =?us-ascii?Q?J0Oe/9Na+Me0gsU3t1ZxgwyVk9zrv7eaWlSbnnuLHmZLRKc0dVpfF4U0UtKz?=
 =?us-ascii?Q?nrf3/gmgsQB3++GEzltt467Lf/OjrdIrvyTfcGEL9QjCli81ha7KcPON4GKP?=
 =?us-ascii?Q?Kmjb9s7f1prqGwe1TEhjOBmGqIzzI1paOK7brOWcrmNNcTGY/kfAUPdleD8v?=
 =?us-ascii?Q?z3F3dscBHgBlkATXTuKdqhLQXF35wEwq/ZZERhTV61tepr1A4LJjpS0cRfpT?=
 =?us-ascii?Q?lJaWIm3lZ3apEJi3ZKX6/ncRjEu5CesZspdBbxTiV3U+Djnsy7VfRpz88oK4?=
 =?us-ascii?Q?MsLgrbD8PtVDuddbwGsbXOS0W0Q5hl+VdFu31R/LG4gI84MCMVJS0nkCRnyk?=
 =?us-ascii?Q?Afp3Cs41pMA1NRdDxpUo0b2tYdVtOlRB0YZPxWVwdxtAiQmkgTAXUjP/Rb1I?=
 =?us-ascii?Q?9wriTCiEkk3InaECSwLDFXUWevpopxuRAoy5IVCrUdETCc1MP2ltC9AoeKsP?=
 =?us-ascii?Q?+DdUyx10KWjBGrN2nzWN2LNMbb4NqizWkBGfNVJYZgd3DOn3tyV6dc+OZOk5?=
 =?us-ascii?Q?9KXTlMv63w1dWk5RcHWt9EBzgnpsyDa106NU2b5cwUIPn4OfPlW50A4yvceD?=
 =?us-ascii?Q?O2yssz+UA3NuPnihv3c5SUEYpfg6ufN+cwvG98paXZ4twUJN3V87yDaMLeCa?=
 =?us-ascii?Q?qAjt9ZgEkpEVWUl6jSd8T2CtxcD3OoWWscZAnUL0O6YsNp3X0gGHZ1OGP7mV?=
 =?us-ascii?Q?TKTQQlALfxA6dF4K8/WTBIxX7VlaOsiNhaF/8k7IL1fVfhYsDuuRCKxb/hwJ?=
 =?us-ascii?Q?LjFEMwRZpkoqB3IdBwcHUd3OE4ZU7EKzpZxnohuHj1U3odwbYbChhxHOY6pG?=
 =?us-ascii?Q?VvBEFjnmObhT437OXqasUyjRMndO/cS/CwxLnvgo6LstiuO2vZNI3BuaMrTj?=
 =?us-ascii?Q?UXuC8FneBsqFaSuBUFNw0VsQa2KXUQpyrD6Jn4C8vP0v7iNlgFsHwS6brd+Z?=
 =?us-ascii?Q?1BBLz2+iPiSl1ULcsa9dMvs1Pmq1xaPJQzp2lXNmCJ7jkzAiWOxKrmwQ7uqE?=
 =?us-ascii?Q?idm6IoJGCaW/sXDfPfZVWPwBZmiepsCZ/i0sLyXZXppYwyxXDn0ZIdyKM8i7?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ff214a-562a-4fa2-d32d-08dd791e505a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:28:46.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPK//xyVjCHLovm0JyBWmC4UDRDLvFWhiogH+kafplMiDealJxNzBiOJ2KR5XaCluJQkfdf41rja/P3POa7HNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 17:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214750

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson_1.7.2.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.7.2.bb b/meta/recipes-devt=
ools/meson/meson_1.7.2.bb
index 45a74612ce..7e9c661818 100644
--- a/meta/recipes-devtools/meson/meson_1.7.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.2.bb
@@ -107,18 +107,14 @@ needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
-system =3D '$host_system'
-cpu_family =3D '$host_cpu_family'
-cpu =3D '$host_cpu'
-endian =3D '$host_endian'
+system =3D @OECORE_MESON_HOST_SYSTEM
+cpu_family =3D @OECORE_MESON_HOST_CPU_FAMILY
+cpu =3D @OECORE_MESON_HOST_CPU
+endian =3D @OECORE_MESON_HOST_ENDIAN
 EOF
 }
=20
 do_install:append:class-nativesdk() {
-    host_system=3D${SDK_OS}
-    host_cpu_family=3D${@meson_cpu_family("SDK_ARCH", d)}
-    host_cpu=3D${SDK_ARCH}
-    host_endian=3D${@meson_endian("SDK", d)}
     install_templates
=20
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
@@ -132,10 +128,6 @@ do_install:append:class-nativesdk() {
 FILES:${PN}:append:class-nativesdk =3D "${datadir}/meson ${SDKPATHNATIVE}"
=20
 do_install:append:class-native() {
-    host_system=3D${HOST_OS}
-    host_cpu_family=3D${@meson_cpu_family("HOST_ARCH", d)}
-    host_cpu=3D${HOST_ARCH}
-    host_endian=3D${@meson_endian("HOST", d)}
     install_templates
=20
     install -d ${D}${datadir}/post-relocate-setup.d
--=20
2.34.1


