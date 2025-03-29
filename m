Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90CEC36013
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 18:09:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.web10.15946.1743271751020567932
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 11:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Bm7EMIaL;
 spf=pass (domain: oss.nxp.com, ip: 40.107.130.3, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCTYlMuDI/ZQlC/83HZp5uIsPbeN8DWykCiSiOKytFXQnfk0SuzeDr/GjwXTLLlim9spZZsO7dp9clUfPN5VWo2IlgPZ9NnR65XSbfKE1qnT/kwY4UnSq+csV+xo7guWwV0LCqMtNcplJKo1svMu5rYFAJB30BfZpd/8UGQIEmXVlv575n8Lw2xwZ0754DeFRkPafTw+jck3Z4C8d7qnF8bZiapkD9quyWKj7COrz25RNr0H9mouwh6m3A8gX7tef/X0Q3uDD8jUMPflx7Wu5uDvHf/GZmatSgMf9Q0fBENVuw7WyGAb3F2HGPnG4O5rXsdrztrcIWyIt5s3qz9X7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEEEMq2DcGspCQsEy1omP5cnSh/d5Go39OBT9X+FlyM=;
 b=Qo0o2aV3wDjtFzVSLRAxY5ytS6hcs6J+WMcVJ68pbABUSJrNRB0DihGigVjBNTI9hK1omh4lQ8nkO+0iygHEtWwwAT0V4g8lnABc0RZeF64PqiAUwKafP2W0aEc6M/kPTYxnUhVJrZaGeCurWguHZIec4+lFwkWZxLKeLQANpP2/cukPntwV72N/B6Ts1uwTVfeml9LJH59+CzQySTZKZ2e7479dg/3kk8qd3wGPVzs3Ar/3LyllVwLb+cIjHT2NzO7oddR6pswVJByD99iecRAFfzKWL1lPtnIJU0FU/s9dPmw4OICf1UiQ/uwQlQo898yuex584mmLAIUliWQOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEEEMq2DcGspCQsEy1omP5cnSh/d5Go39OBT9X+FlyM=;
 b=Bm7EMIaLiM0J6d3w4A1/3XvrnRW2dRkIsu+9STmm0kL6LrQvluECF9vretvEGVmiWL0oQPwxa1tmmhGUX4KWD8psUKprWygrSjO4u1rvHxdu3D+s1dVn7B7eFYg4Iv+g8RJbPfpozTL9ymJDZGYDWjxpP3CaUjJASkdtsoy06+VM5u9ooOXyacRjgwxmoahaYSSfAi03l//M5RInsuLCTbeOTt/yUeJmpBY+e/rzWmmE2yU5XITkC02ppF+0ZyvU0/H3grq+V9e6weIw60vZgvSvIVKecIk22Bhbc0toowCR1FnWZEHSTo5wzHWcZ14IlfEFYEOauUU/+dV5IaL5Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9394.eurprd04.prod.outlook.com (2603:10a6:10:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sat, 29 Mar
 2025 18:09:10 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 18:09:10 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 3/4] meson: Fix host_machine setting for native cross-file
Date: Sat, 29 Mar 2025 13:08:52 -0500
Message-ID: <20250329180853.1057381-3-tom.hochstein@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f6aadcab-8715-41b2-ff0f-08dd6eeccdff
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PkkbKhFbyAOOcq1S2bDCqTXm40TUJZkC5+ZI2pCZzgJW90dV6yHjI7D3A6jk?=
 =?us-ascii?Q?yrOf10qXt32cKRW59FS7RTNd1KkGVpfftxAYNtoy4LHWuHHLkxkKF5vX87EY?=
 =?us-ascii?Q?fF6/l2JY2ULS2cWfkQHB3MogAZ8rCb4NiSvwLwV9n5ho+mESBxd7MFQxw+dF?=
 =?us-ascii?Q?vp1DYHTRslZovLhoNoQ4UcBf2axRhigd4e3GdUE7wx2LGUVLKf2tVp9fTXip?=
 =?us-ascii?Q?EA/FKHr2fS574MRRk3Ry6fCGeQDSMnp/NrjFjbDzAXpsa9AZdhtsupyWWyHV?=
 =?us-ascii?Q?LASypGxvqCtjLI9H08wgAS4jiHZV8YNgipdPiEAKNDw+MGpuLndF1LCUcWIR?=
 =?us-ascii?Q?2FBb0JxP61X/OcvTHZx0nAK1z601qBGq1yleWyfyYrMF26VR78wVNr4RcRh/?=
 =?us-ascii?Q?520HPIADdM7WqQ/UydUjGi5nQEqTjZrK3B2D4NyD0ezcRULmlTFZPXUO7PeS?=
 =?us-ascii?Q?kDiYyHhriJwj12oNJAcg2CmCxFP9f5nrHuh5B8UjOddj+EzWV0x1zjqrN+UH?=
 =?us-ascii?Q?VgqWnYABEsLvQUYSDtTPmTZPWk08x9oWPMR1wz6ugV104O4GroG25rc6b2dD?=
 =?us-ascii?Q?MVj26CCTCeCRlzj2Il6rZKokFPQ7eaPMLfpngs/Uu+RvYv5pM+zucxi6JPRV?=
 =?us-ascii?Q?YM8OlP93gJGSa5BSbB0dH0UwBbs0EHkjAGHR35zrXUKxSq+A1Nkjb5wGpm1f?=
 =?us-ascii?Q?iqB28XfF1LMAaN17D+eb3ZVOCkzclMTgX6FckCrN9OyeUpq1XT3nGUlkSxjR?=
 =?us-ascii?Q?oPlVbSpnUiRI7nfrf3tcHWlJce8HCDfeO4WB23DzT3JPsNGXq+6sMvUcmVK2?=
 =?us-ascii?Q?Rod5e3rz+r+lB5yJsf/V6aeK15jZogM0H/JIFbSdvNaYfIrDjyh/hqkGenky?=
 =?us-ascii?Q?SLaHNFtPA7wUmWIAdYrc4KxdffcjW620Nto+9Hrhh7pde0rN/uCn4rFhlXb2?=
 =?us-ascii?Q?3YqDyS8+LZYdXazSLqZb1tubT4V7J/VoyTBINf2wzvfWB2AH8CD5zCNFZx2W?=
 =?us-ascii?Q?8rKs2jNefVoUdJQsGHOA2PpMbuA7lGr33YRPmPvuX1VXqFo7KZCkjY5uCkVQ?=
 =?us-ascii?Q?ebMLv4qHVKB2EoV4v1ryWlgK9KOe5OSsmoTbirzjBqTyJN9edwwxm44gr04o?=
 =?us-ascii?Q?fdcaR50wcqebTVgJkqmlDsgfufPDJqUAPILtsykcOTyeeIAzPnnWKPqHqhBo?=
 =?us-ascii?Q?jGkXpfDhAWeo1lQBMTYP9seuXEqKbejmbjbVs3odHvv/LAev58DH/8Rt0jyP?=
 =?us-ascii?Q?vFiv9xzmBE80H5JU+lO+SK238iyZxYP+InVEAWbDhFAM5Luf4sHhzmipRhb5?=
 =?us-ascii?Q?ii8p6B6/G2hgEi2H5nTIYlknNISsHH0/liNtFvJX6Bn60kaRCHB5+y30E0FG?=
 =?us-ascii?Q?1Ep/y+3yHRPiE9YBDPQWBin/eVGohcAaE+Z5INdmhhCSE3W0hA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kw18lMlHeGgeMMIDV76KuteRhxQLBzDeJZ4Ec9gg8QvaXEa1r93VxNcTUNhc?=
 =?us-ascii?Q?PwBWl1Gi2foc7cBrjakhYSY4SNThca/bSoJob+ru2avVTHr5+Jw6DVa1kH88?=
 =?us-ascii?Q?FsXA3Yuf3lVxT5uFUY73ZmZjMoRzYJL2vcsfDknPW4jySE2++HkuHnUDyNxs?=
 =?us-ascii?Q?4UA/Y/KIjzlUXNSrys5zxJcW1FntAxVemV9jAAbTn5erIRUM4gDrVMFZbHwR?=
 =?us-ascii?Q?6JYSl1IUAgB4jQRFEqnhJr4rIKuTTJ+/U5ivxAVD+O5f81PF3cCaMNx9NZZY?=
 =?us-ascii?Q?BXNNP1vCW4Y6c/Y7MzrnPsRqRQULQW3dhRGvlbpUtefo4Ni6Sa0G4q/CmMHV?=
 =?us-ascii?Q?kYKf3Cjhu24KwNnf0HJZzRIwjPkijGLAAtpSD+LZJg2v8oAXKe0Csk/2euV7?=
 =?us-ascii?Q?gvXbAqoQLjq2sfNMq1g4CoSvUPcDEl9mYS/4igWRwkSkPJ5sHpWPoKlSzYK+?=
 =?us-ascii?Q?/z/AjHuift+gYE6qdRd0SCWn95Tvp6t01SRiWaNfzBx4esJYi7cTU78pMF1a?=
 =?us-ascii?Q?7hjFeCqdnCmLxFOMndYMOyJulWRP3vakqYCZ798bhGhtI1sR4g3sOYyx28Th?=
 =?us-ascii?Q?2IXgTEAfzfbyGDRprd31C3LeUg/JscuxDWlMHoDx70mQsjiCYu0XptY8v7Lk?=
 =?us-ascii?Q?IKn5yCxFNHU0oAWRKODtuZolVitTm2Fbo9HDWepaz3bWcOnXp+UtRe2lRrIw?=
 =?us-ascii?Q?sb1WoI1djffltM/Tgxn0Zl/COx9RNyne7iBi6bwVhwuNGcavR2XQu7m+AqPp?=
 =?us-ascii?Q?iYH/bR99a2Ei6S3VSqm2pXjiMseW7rGRpd03qZFLEP46rhFaAkJ7SxNfccj4?=
 =?us-ascii?Q?vCKEThQDmBY9/FD4luLCsFPnOmDSOn8tcUX1Tl1V1S1a0dWeQwEwEyC994nv?=
 =?us-ascii?Q?ZKX8iq/yKzMe9bRS2JW5R6qRCJ/zTplIGlTEeiwPI5D3QRWdttZJf8Rv7G7g?=
 =?us-ascii?Q?byc4XjhEigHGP6uTuB3WEe6nEn1H4KTHcNPJX8cNdWV08uC2B1QY/hDSGW2m?=
 =?us-ascii?Q?2jo5OypsZMWcOiZTlVtqasC+dSXyxja4j2GRO0VbL6mZbjY9R4TsIOZmcxB3?=
 =?us-ascii?Q?MtWH5D4Je2hjtjegBddgIqqwxgZMbsLI5vxpT6+A+URe9JWm4ZrBHooHSAih?=
 =?us-ascii?Q?s5SBGjMqDfTmDrmZ81N0Umm1DPlHffil5xJO7GqGkzCMIU9O58WR05wwiER5?=
 =?us-ascii?Q?OrXIrxkP6niybQh1kKwlOkziNAWcE7EkLSW731qIMH/kuquWvpLwcQXRl692?=
 =?us-ascii?Q?fZDsLjQVkMoFn3I58lilGDspmjnb52lgG2BIcCwuDkFO1YM8J+rDBHYh7+g6?=
 =?us-ascii?Q?Ny0Lqq3NIvwzjrDofAxmbhMzlZqu2uUf4Cc6rpng/3bMvR0paC4IfjaM+zKp?=
 =?us-ascii?Q?G7/aeZHwyGgH6usLtHWRQ06Mb3KCSc0wSNLL+IxQfjrAbXibFX9Bl24oW5T8?=
 =?us-ascii?Q?qLe5AegHSQkHfz7kKgUuElygRy7cIF9r9d9azsaLY1vhKp9FH5Ymju+AiBdP?=
 =?us-ascii?Q?FoV3FbkcAUJ9GGXCbb8jihCaJG1j8XWkgi3omneGlxTvxHtFAG4bTixeQo/n?=
 =?us-ascii?Q?hdt3eF/f32MU4tkBsaAVWiSsrexOkHMj2Xnso+2Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6aadcab-8715-41b2-ff0f-08dd6eeccdff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 18:09:10.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq5Mj7l4Mlwps2piQxgyLZJ849a/4AjbctINj1xtPVfiCrkS+H6i9WSzFphdnpB7yyaB/3cjFXFZxI1hYlG68w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 18:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213891

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

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


