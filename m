Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC204C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:18:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.24])
 by mx.groups.io with SMTP id smtpd.web10.59866.1744060717594523402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=bNZtMenS;
 spf=pass (domain: oss.nxp.com, ip: 40.107.159.24, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbhv4y65YeBoetFyTsrt0XNgANDGnTopvzndBocaJfl85jgoHhm/zh39OXl7kSK8CBo/+4++Gmedf+j+PYcM9Kqyajl04K1C7zA21bWh0+wCk49DpsSXPFHOhsDDSD9SOSlaKyWHvRKk123lD3tgAq/1w0B6qEa62Z06nA62JxCH/Wj7h3DJl+KljCBQdGtWLNfSbLKzSYOtSwUZGRGuPOwlnpNxhI5IaIn4b055gGeRhE3WRMN1Kpp/fpWW9RCzHgP3ROcMCzZShZC5459i7GrXsLjrJvp0g6Dk5Ka219rdtX1DJFPmx33dmKlMKvMf0RTqH4Cjk756ASgcEK+TQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u9G6gy4ewDxffdqS/LgiHGS/TP17SZ70KjAyJDKqjQ=;
 b=dpx+joNztN87v5ceBzMOvCA0DimU1qEe+7kpVDYJVIo2Ps16c2zgPCzh+fmqMWoyitttAaXuUNX8kUiZiTR0M5H+mN3Ck1xKz+NBWEiRbWr6N6h5TnSQ3KtyvqJK8fXsQ9W2xP+G8w/qfRg3qadVjLKAxRGKGUnBzb5XmekiI9MVrJqxMtSuctlttRw6asznrMphVKIUvdh3UTN7bsjy8czTT7WpTueYdfaW73sQPrwea/7tu/dlGlxH2fIXpJIDRz8LamYTExrPtGD3ylGMSqGPpmGZ+hxpeJcPprFeCEH59R/SugdVvyVZTM4BgzQ/QTg207/5KZlh96TUEcHhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u9G6gy4ewDxffdqS/LgiHGS/TP17SZ70KjAyJDKqjQ=;
 b=bNZtMenShusHEn+GE8sWKWG6up8bHimbSBpRbPG3U2bRzAMkGW80T8bgCxhh/MbgJ7GXJzRqcbK8KH7LQ0rfUf07pSvJ14NgOfKyJ2jjCosEiYluCpi2Yy7PCXYUYrRwwuTmxFkWuOPzidJMJ5xA7FdgjhUZzY2CkglXaGAWn8t1YN+DIewDGGvQzTCSqtzilQa/dwGl2beYULBWWpkAATFa6IYIgi3ynXa5gbmDFYqzbzNXWd6PIUT9yAA4VzS365x+3PsPw9Nxrx9SHZnTCrz+fshqaTUyceWD/gVP9Tv1Y4D57iYlIdee5PxARbcsp/n6b1QwbDZQ2EwBYvctrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10760.eurprd04.prod.outlook.com (2603:10a6:800:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 21:18:36 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 21:18:36 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v5 3/5] meson: Fix host_machine setting for native cross-file
Date: Mon,  7 Apr 2025 16:18:04 -0500
Message-ID: <20250407211806.1782316-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10760:EE_
X-MS-Office365-Filtering-Correlation-Id: 544de6e0-5529-4942-ece0-08dd7619c217
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cnR1bYf1dSAnD2iyVRFIHrQjMBv3GWlCXkphB+JO0KjSvu3CwNi+g55B+v3r?=
 =?us-ascii?Q?XM1xd9xjl2j8+lDXnurGfJlo3U5Icc+tbxDqZ101tZKdzDvvszBEFr0sU6//?=
 =?us-ascii?Q?YsNiwZnavjc8nwk774GBEYA63fdG83eABQyaFYO+z1xKvJ2vUOSgk4nroDyc?=
 =?us-ascii?Q?YOvHhe7vMz8srkggQ1lTv/eu+4prSTz3AcPrzswJnREru3r14pWj/Km8OaSs?=
 =?us-ascii?Q?3W+KO3wMTUm0JS/QFzPOddCdnORDslkR03cos+epgEq9bS16Rf3VOLrQGTS0?=
 =?us-ascii?Q?Tg2q5O1JLmq5Tce+Avg2xmUb3QH4nAQzIDaT8nzpn9zjN8QmD7jtHzJHpjsa?=
 =?us-ascii?Q?1Dz8nGu0wZZ9mv8gsji5JQEd9wmaf3tLVfyPoqHzrp82oPBBHWS4q98qExkF?=
 =?us-ascii?Q?u2kpFPATXlJwQ57fN+1AYU1JURIB83HarQ+gzE/UCTRJtrk3BLhWYi6ldQn/?=
 =?us-ascii?Q?0azNFz4VeFmm6FeG9Tg4QTOOdfuuVNQDJuMcmsIZWSZ1u4BddZcfVZWJxF3Q?=
 =?us-ascii?Q?A5NUDmlmjG9pXwxKdtLmWM8BaeCUT4yZFuN8pRVmKeFYnFr0IMvhpHyGAhc3?=
 =?us-ascii?Q?c/A7WHuq28HXiA6MTBQkQTyfvOk3msj1GZUt4e4odALmlz5y4jWlJgg9dtI0?=
 =?us-ascii?Q?eUe39mvQ24maH3Eqv502WDThyIOisF2UMn+PlwvxvKiE69oOiUQOw3QpUBnc?=
 =?us-ascii?Q?wYCgMT3Afvvdjy8SdObPEyJES96KU1EPv+oA+ZD3FcFNVJt3kh+VhgXcTdbY?=
 =?us-ascii?Q?ORaocwnOUiIrf0glg5dxRmA7HIR1KHBrv9yBnIJqre4g1nyEa6dmbZJcxUIg?=
 =?us-ascii?Q?wC/DJI2yGOrgMn3w09SkryYAKD44Sha8ExdpO0Khh2aguoVlDEPJpoYH8g7J?=
 =?us-ascii?Q?nHSHoApR51o01CuYxP60vqv2a0ri6dcRfT+1f9YeQYLmBQBrFCHk6B3G+8Kn?=
 =?us-ascii?Q?JqC+JWxvEpLpJ7BPkPTJeZ7i2MREcUEy6LwlkDdQ4e7pQbQyTNZ9Cky0L14V?=
 =?us-ascii?Q?Vtv8kBDVFda/to3peWobsmbsF4lv03WZyn6RgYoO3R9BEtCua7wTVYf47QgM?=
 =?us-ascii?Q?KAFu6gPov78Lo0xMuodgQRsGuNefBYJS5LX3RpgQbI0dMfse35OyyDQTFJY4?=
 =?us-ascii?Q?jmHC0TjqJLt7J4mJrEpoobD4JtQVhymvM4dlo6nMKlzS5XRsSzKs17K/kaY2?=
 =?us-ascii?Q?lRi9BofHPKgHlKFHrTjWChryC5MezWscHKfGi980cnysQwRlzsHulz1/mecf?=
 =?us-ascii?Q?mn2UlOkqP+FNK1sD6UCNkoKH4iiI7Y9jGDne73GlpihoJLyazURjsyIZLNrG?=
 =?us-ascii?Q?5E4ySQGg/TcYvnA2Cp/2/W3+aIgrLSMlO/Yil7MIR7dzOl32wO/b1LYPuULq?=
 =?us-ascii?Q?WIdJLc/LDF3QjYHj6ZB+uQMbc1wt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r1qRNGpW3RgBEf8cXC7/qbKBbs+TdbFcN7G49GzVPfi6NNm4Ub0zU09al5SN?=
 =?us-ascii?Q?pCqtKg0B+J2X7jmUPEU4gQx1Iiuyg2IWihvOd9Yk54psF0LIji4rTXXjG+1H?=
 =?us-ascii?Q?XZ2OGtPObM5VEaEEGtQtcIc61iJkAlDBON+VDxZruobKHlT/NNw8PLUgWZln?=
 =?us-ascii?Q?rGZ2U98in274AZnpvBQ05+61ol7BjDn2XqJArxQmhrhUCjOJUyLNKo9JEras?=
 =?us-ascii?Q?hyBdQYbV8cbPFF/C2Wpnw4Zj1SzQq+W6pAJvjwJ6ip/YKPGo+skt/dJTaNlW?=
 =?us-ascii?Q?lfA5GheHNUMZOCysUE08jVpt9ZyGWTR5UecWBMt65R4WCeeBV0DKLf49k797?=
 =?us-ascii?Q?G6wJSNbWOjXqxpUw8eyxx3QYzeDQ3XFOmCtnxlM83FdpnZ8gxFZiNHJIrvpq?=
 =?us-ascii?Q?cRiEncSqbwF6FamtSQaZAbFumkKUeyOVdGWTZORG37/EWm9NbqI2x3038D8E?=
 =?us-ascii?Q?nJFzD+oZpmvQCm5nZC8pNRsXFrGXGcI0K8C9B2QTXBPJAG3pXoQOUKc311ax?=
 =?us-ascii?Q?jh0oB4B/8r5cgQkK5UklfP3bh0w9AZp39HVL059V5oRTAMDjEbGxfqMB811l?=
 =?us-ascii?Q?6WxQAiz89QgkAtfDjD6dpP6XEgO+hahh++ifKqYYK7dBf1WFK8iJ05suAkan?=
 =?us-ascii?Q?cMJumHdqCwsrrAv/VfXztv8Te/kKvYWyUv9COEyqIjg7CEht7KN461OUJTPO?=
 =?us-ascii?Q?skg4xeJYiXBoHTWh2OZuE7gW4Cz4cul+tAeT3ZY65xjuYTjrVS61ZRSvl9LZ?=
 =?us-ascii?Q?V9lc+pek9QcY1Aq/pVWHUH7yoZakmTVuTunNQnK//C/Rgk+r2eEKw8zYeSaq?=
 =?us-ascii?Q?ku1BoUfENBicJ/qCAy6tWLQT3qJ04E90P0Lo5uDZ/oEwD9n6plTOsAVvIWNp?=
 =?us-ascii?Q?YUs9sTYXVqag7BHW1g7MDtNVW/2k7B8YHVB0WSwtwHM+FLuwXjOYRuqdAMr2?=
 =?us-ascii?Q?GyygGx5goArUpl3JfnPFmkMUeQUADdWdnUf+UQwt5SMWGpP2GVdpigMo8m/a?=
 =?us-ascii?Q?GG63GTwcKxSC8qd/jY0LEbZN1MG6sov7LE3AQIEMs7bW5dFm23LBDMi/5NEU?=
 =?us-ascii?Q?yLLI98Lg4nrNOsvWlg0cr87nG3trUw8VW8fW5U0vtdXI8dwqzT7Czuxr1rkf?=
 =?us-ascii?Q?H8GWpmsLt1ttIc4gEpctlrFKh6wH+5tcLBEx0Pryb93XdE+Mej5tM7p62xwO?=
 =?us-ascii?Q?zwsm22VGpcRB3f0vYM+0TuQ/9x2d5UVyzxcXOUTCMERFJKgAdN/sLY2xcjU9?=
 =?us-ascii?Q?G5tvIADqSTlvijerXwWsYMJ9fZZHCLkOuOzlGgJzznnE95gFPfJc40l1l70l?=
 =?us-ascii?Q?Ei2cpukaLrifNAuPN8GsOhmrH49klKaP/VPJgdO//RDX22rcjdMO3F4953Gt?=
 =?us-ascii?Q?fcObt67CvMmv2QxGLJy+7U5CqsxyhrJWN49hrYARocalnYHxbqlxCqunepeb?=
 =?us-ascii?Q?F5KAyfQfIgxzQYoBCdPfeBcv8jb5PJkgOZ2U1qBQ8O/OacxiIpXn08fXOhy8?=
 =?us-ascii?Q?y8uLXVzmbqr15+8/bH5V0s4qVezRISlz2yLtXIjviffWphAW7olEViU+UULu?=
 =?us-ascii?Q?c3A0vHHZ68wynzKCcBS/aNjsPiJ2e+W/pGpYdF3n?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544de6e0-5529-4942-ece0-08dd7619c217
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 21:18:36.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyaqIea00XtZYrTfuHFsRKlhog2aCwY6SpSzF7dYmUhF1ygnES6lCaK+pLl9d9LcIMWsOw542tT/ORm8gWPI1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 21:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214479

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson_1.7.0.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.7.0.bb b/meta/recipes-devt=
ools/meson/meson_1.7.0.bb
index 44872a5f7b..3e89669807 100644
--- a/meta/recipes-devtools/meson/meson_1.7.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.0.bb
@@ -118,18 +118,14 @@ needs_exe_wrapper =3D true
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
@@ -143,10 +139,6 @@ do_install:append:class-nativesdk() {
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


