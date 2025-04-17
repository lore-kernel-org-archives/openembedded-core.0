Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4716C369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.57])
 by mx.groups.io with SMTP id smtpd.web11.15750.1744913447237915834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 11:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=n5n9K113;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.57, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CA1i6pTOlNElfp4ru+7R5041S0AvBhmrAJIr+cRf3OAlEobAgtL73Fj+ZLUIK6WHVsE3aMGjTBGg8HOESdFqGCsgCyPoO53uZVmc9+AB90wxLWjVVyS1qz5fmrkXu1ePWZPgWZsco/1NOFcnKqm1jolfw0febgV4ZFFrQQcx8o+UHTuWT1MTzazk2TfCPT0fpUwRnNI400DBw2oeFLM6unimhSdCJPcSX7xoytrFXBmXIoXaQCUyFkOjW5chpWTtyJuWgmiz8PqODjV2kkgRdZ7A/PNZcKoyaDCDIki24xFr3iUWzAugqLC7pPrA+Hi+qBeWpf+Z1vRJjzytZOudLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlTv9Z+5+6uafom5gmXMNW1wWOJ2wQESc43LC5+PBgI=;
 b=irRjiEPaDaJAVVLNmtfsq1NHMDO67gNTETdQ6yVs4MQtpjRVJiTnOUu/jvga5Fumos0PkqL16P7vSQ37yOpOZYf+0mc3w14XuyAOOlSowkYvqaqctM4MzrY0Oshg04Rduas1esHYiQQZdczluqypQ3cGMTh6NjrRpsFtlniZa4f8cr+G0YiEfJ4WOguNl+UYTF7qjp1f73x0aA9p71H1bExeBURSTGFmZGgw20JOpXF7azfwBUM6fKCeZ1RZxJNNt8cuiArvaOwVyLmSlcPRDlHIIVNCjH03suRD6TFtaSY7WJeXamM3/zF9BJR+8DTc7UpA39knGNjfp/DlaNlOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlTv9Z+5+6uafom5gmXMNW1wWOJ2wQESc43LC5+PBgI=;
 b=n5n9K113OspN7JUwZWupfJQbzOx9G9JNfJES4YEMj9oeJeNhfXs+3gfWaLhR6M46C5eDmFKWvtEoWSGif1UhT86lhxutQXHv2XXmW7T5XvT0184+MsNAXdKAzdqXfJwWiec3fiUsx72ypYZb4q+q1cix7j28hM7bRM7856dxYmHq0b87uNnRRwvDwE8KLWFXz3kxxVia9po+Lw4oqyDRqTw08Jl6WmEob4Nk4qDt7uw0cB9lsp1TbcUyQCNoVBRizTXkXYI9OYrq8Vj6Le9984/yPEn5fTMQ3iI1DdyaLK9YIyrZ4eB8dYxx7m8DPSQfli4ubpBJgGIpBIhwNQyMqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:10:31 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 18:10:31 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 4/7] meson: Fix host_machine setting for native cross-file
Date: Thu, 17 Apr 2025 13:08:31 -0500
Message-ID: <20250417180834.1722588-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: df27ffe8-365e-4285-5593-08dd7ddb23a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K8Y13vUKhkldEH3D9A+oKqqqNbVRvguqOBbqTjWlfFr5E/fjn/rCE6W9Gf22?=
 =?us-ascii?Q?XLXbAqikhPigpb1wP/FkQDTR9JbOvvbEj5C3ZAkKh9JqQxxuFr8IWmwgSMvF?=
 =?us-ascii?Q?WH1SQPv+qSvIlfVyD3IzKG3t+Rh3077YAnjbhvxfdcyK9Q8JM6gCIZ1m30hy?=
 =?us-ascii?Q?2gG8TwhRP+pQtLpKuhnc8wJJOHJNMkd45QDgrfbeWZibnhaagF6nW6B0dh4C?=
 =?us-ascii?Q?AQ6pkOvCzt1smEjlHDkSv4hGYuzvrgn+XaeXxHOWk8KxdSekSqwkaJ1lvQD9?=
 =?us-ascii?Q?0ihVXt7Un7ryLmjtMMEFD+rzKlPOpPNIaMWmfMMYXp/mI6F5oE75Js3z7UrZ?=
 =?us-ascii?Q?GmTtOK080eDI9kRcjshc+wWZMjQaj9/+30b4RsaOYWSwTx7xQ0diyi0u8Jpj?=
 =?us-ascii?Q?b0lwBJmjOc73wVDXeiTsgNb5YUBsbZitFJUWUYq4wQRoC8gI+wz5j8ASmAAg?=
 =?us-ascii?Q?EB2in4IQQV/RMqP7AuVC3jXf29a9qLysVpy4NsDbxEtciEa3sfnXsMeV2NBo?=
 =?us-ascii?Q?ozZijbk/neKsdb2jZU0fbetzaT0G9z3Avd5D9RdFaIY6mNF2gnZe/VfwX9H7?=
 =?us-ascii?Q?+nCRgmSADUZVWrYUr7WmZkHzTYy9cbojM5WKrUPiCse0o9D551QrcLvod3n6?=
 =?us-ascii?Q?FU76wbnpb+z0/gDF2wxFrpz0/gG+7XMqm5ZJj+Aar8V5WMT8DIv1iKbhsrNA?=
 =?us-ascii?Q?1PdtC/ZeUwjWfD/Dj/K8jcjh8TK3OMdn/qiJnB5aYvDzfXNz89Qb5CWOJb/L?=
 =?us-ascii?Q?5ARQ3bnS5w8p6xCKqHLcV7LNza08fp8GvwzuAeQq3lmvq1JuPS7LLNDM58XO?=
 =?us-ascii?Q?JDMny4adBTPSMKdrEdvSE4sPqjUUZ7ieMXsPze7QtBvdpCoD21HbuMIzWB5C?=
 =?us-ascii?Q?GBWSw6ixr4ipOx4cLej252sEnLqfBVCDgvw5vvPtULLLieK26W1aTm9RhaNP?=
 =?us-ascii?Q?ahHX/6XE3ZZukL8FDWb4gPMV4hMDw7KMrzqszr0+7FQMRF60SZ5XDWD0GmH8?=
 =?us-ascii?Q?JlI8Y1PiPW7rPrrqO+bruvE23EpRnLU20TTF3Lj6jbgQHMDABiU5dCM/UAon?=
 =?us-ascii?Q?qdEsqy3eBm0eWmt87BCkgMwzb8ve5qwXMavUYl4hgYBnWOyJXarArKeFh4Fj?=
 =?us-ascii?Q?FK58tgY4/QANb3OiquA66WwbebyNp2js35ANHZ/O1SUztHbwVh+vpEJi6icv?=
 =?us-ascii?Q?JAGlrDDYvM3ggNaz072++ow18YWFsQAsmy5l8U7u01lojhXaJHmAtfGBq7O2?=
 =?us-ascii?Q?qJKGFf5Ene31GcsbSN2t9eCHWFTHWCRjUnhuVWG4pwiT12nR4PY3f+6LFceR?=
 =?us-ascii?Q?Jtxf/EG2mzRV2a/+7hQ1KUGq85Lu3TT0w7zQ80ZrORAk4YLbNolCXfAUBllj?=
 =?us-ascii?Q?qFb7e/0D7S/rCtlHTpTST5ehIojPQV1C0c5mzZe0MLsTBUk54/YHfAMU+KeS?=
 =?us-ascii?Q?vh5xoNdcKU0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WwCq/Yj2eLzfsGbxUZXhEK48TvaLy9ic6kARa2n/WeCwpGByQJCnpJMRg1Fm?=
 =?us-ascii?Q?kPnozN551bHFSl3tcMMrgx8qiT7cfUfMkQrG5PRt7b0Km8MTLGJbRnDh61ie?=
 =?us-ascii?Q?Hts+0NmfO98T+s2nbeZERDupx6+ykUDK0isHBz5Cozuz1XW3KvOp1gDBuEeR?=
 =?us-ascii?Q?m5+rb9gL+f9gbPKoSc1B5r0GuHmriEPkYB+Z0ByOdAghZNxNOyXLHFxSbkq+?=
 =?us-ascii?Q?dn0FEZ3ZMCt33JrXAjQPEO9yVxTCZrRyDJ2ZziKyLoLdtBitETa6ifjVsEOp?=
 =?us-ascii?Q?yXoquJLwGOawTR8ZDhxJdTe+WQDqpX6ehfg0DmOCXz/Of8YqZv+CepZ+E2tI?=
 =?us-ascii?Q?sAd6qirPK1mNv3M1gHO/PAaRzZaLO8nHDjZgsRc5lTl2SYRhoerWsfefm/u7?=
 =?us-ascii?Q?n0rlpUxnS82LLH3xzM0HhYapiFaVuOs1tiAOnza2NHXw5gKtnJ8oxmgZGtIS?=
 =?us-ascii?Q?BXHyGh1SVwiCDbbIQVkfL4eUfEs8YWzYECFGoMz9+jtsZCxdn5ZqAm11qDnm?=
 =?us-ascii?Q?GF6lz2lVzgBDNoacU14sjODCmZ7nO41rf7Jib03VKz7KsDC8uOWBOsX9r5Nd?=
 =?us-ascii?Q?1QGqXVYSMZz6A/sebUu9NpSx6dDxUeWMBTAog7rB9whQb5myojAN6/Hnqza0?=
 =?us-ascii?Q?708LAJ1QMkIAoDIfK5eGebrVIiJerKPi47R+P3wlmsCcx1zR3JCyQ1cAMr67?=
 =?us-ascii?Q?/hHaj5A9pKTUuwgG0Yn+UJbgWVEW9dqXIftCm9vQu+r3t/BIum4lLKOmXz6c?=
 =?us-ascii?Q?w+B92mb7J6pOenVO1UU+aLSyLZkkiX+uOzRQqAQgQ12zTcmdXK120r1SgSFo?=
 =?us-ascii?Q?sT5UOJSK+COJ9XJhHlVT3QDoB+n8tYZJCi1zPqsZ4sgLBUpGBU+sxJrlrVZS?=
 =?us-ascii?Q?SN/F8KKnU97JShR+huuKX0d1RvAq6FdCAHpxygzz5koPYalfmYupaQDMLjLu?=
 =?us-ascii?Q?p1qHDtDqPZ2cKq6Yhg6Us71V9KI4nB71lAblt6zQj64yXVEYmIdS+Ora8JcQ?=
 =?us-ascii?Q?9iyxyhrgzxo2NSOGx6dMU3TF6zRoQ76FZ9HW7zdX4ezMhGgjFz5CXD+11zoW?=
 =?us-ascii?Q?n5J9FwuOqvxxY6FklXqJCENwroK2gt46lz6FA+apiVEQhg3qyk4kdjrrjco0?=
 =?us-ascii?Q?geq/Qgzi+uDSQiMH5b2pVwpcgjVFXnWjnnPZlBXFY3etX7At46refw1TCyLR?=
 =?us-ascii?Q?AFTbSdACPN7a6q+qqoDdfgAvTBrGCIOjRQWxyf5aVJSwrpPwGw65OMvwrHpV?=
 =?us-ascii?Q?vJa+gKTal6OeHkAK6wrstM+P9cKl5y76/6AE8uC8T1HPDiau9j0C039HQTxx?=
 =?us-ascii?Q?t8PLb1VYyk0VblNwP8PJh0KggprUa+SJP4Hc95KFxAUCQf1BTLqcVpKDAxAU?=
 =?us-ascii?Q?L1Q28N4cPuKl1GvaCcuXWMictFYExjquSZD85tfCVk/fa5H3S0geS/YZr/Yg?=
 =?us-ascii?Q?8tDThV/RGEUXYyYC0d8gXVGpbSdCl1TT2RAP2XYoAy9cye3qOc1jnBSjc2H0?=
 =?us-ascii?Q?FGVlPm8O1XogCWbBkqMlTbPS/Qvk8Wwwd2a3qu9aB7ITW4DDb26YWr8vV8Wj?=
 =?us-ascii?Q?CEOAVTwVSrQp1ovxbdkWrxfi+pBU5wwo2Vd6NL5vB29TqpABkH9WoKb0rpzS?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df27ffe8-365e-4285-5593-08dd7ddb23a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:10:31.0610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPzxR+zRiQ1g5SJ4Qn4b6a1sFisz/Mv18W5DqciW4vZMYnrUq6WVGG6BtSg4KPHIpMBq7Q+qToVOi4Xm6i+xSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215114

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


