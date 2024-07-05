Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9C9C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 13:19:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.131])
 by mx.groups.io with SMTP id smtpd.web11.16998.1720185564274278982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 06:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=IwK/yQCy;
 spf=pass (domain: navimatix.de, ip: 40.107.22.131, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLKCTfLywyuselfKOQOtjQUivBX53YaoZUSDWSwULw2AqsIGcqCiyaDQURAX4R58Rw+62/079d3inUWQKhmPfyxOIJQlIUt2UPAybIH4IpmFJpD/BuyLDpT4IeTzuPtzmoERzHmWo+mL1OIQ3x1uigjxZw/QWZ+AkQj5ae8FZdPAK8LuieVaotWLghmS0AmZPaMU8WCkvDsWfbDqnPdo6DEb+/HN33UQ+xPPIpemgEjAsxOiHINHGxUC95MCpPWUelxacUgg84XjGV192jK3kLDazkjtm8u9uJeqzNDDxVCkxgGRqLYabhFfgsStePdMmsEWnM8bI/jR/y2otS0srQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gb+T5tsfBXDf1or5JND3sBRzPG0jK2tDvGC5WuTqEVY=;
 b=RnQCo4N6KJoKidiX1hw9leEK7ggHrMso4ZVG+/QD1ZNDE9/tqF6haT+x9egD45XNqDEeIEXlct4XODeyy5YcRWk1UHPw+K6nRdKIY09nYzlRKLl6nyrpqSoFj3DpVS99ib6s1/cdCfNhk+8m9qRGkh8SY3/jWT89A+Bg4+FRCby4stZeRYRsNPVhPPXJYh8A6dQ0z7SGqPFEtrPVb5Z19SRCOknhHfU/PhLjocpg+Gf1w/SwTjrcepXsf1lYVryngNyqdIxSzv+E+YmicngZetYT1Kb59gnfWZZAQ5s3GpuRgJa2L0QbtFp5OpSZCh9qEUouPqQW2452qUJ3Tl+r/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gb+T5tsfBXDf1or5JND3sBRzPG0jK2tDvGC5WuTqEVY=;
 b=IwK/yQCyvgaJ6rzq8lgIY/l8dVhDmHapL8efwSY/z8YZ9/r8MrBc7SnMT5bGvczssuGSd13NceLN7PUhlugpMZvr9DjcEXK8U7T/i2Qeu//zCTeGIYINtKRl0GUePFHK/3k5hzvVJGnQKCT/WOOd98ZZioCrF9lR1GOb3D5UY6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB8PR01MB6280.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:150::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 13:19:21 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 13:19:21 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] classes/kernel: Delay module signing until after strip
Date: Fri,  5 Jul 2024 15:19:08 +0200
Message-ID: <bc15a9ebae0ad3841ac2be887c288b451426e69b.1720185337.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::10) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB8PR01MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e98a03e-082b-4e1f-fda0-08dc9cf514da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u8Rkn85c3HkzSEuQ0mUJflkZggkUJ5vZYKfifjYTudDm0uqchd25tLWyOXpM?=
 =?us-ascii?Q?izoy0I/DX+284cWmARbfed6rZnRZRGTH+7cffqdkGXMwAmI+kthhkcZOVPCi?=
 =?us-ascii?Q?C81RcmprbPQbcWgXdrxHSIYpJ3cbu5SjscfddhDsvvrAgkp1PoevD0I+0Jv1?=
 =?us-ascii?Q?LJerU2+o1yqfCupC9lJvrSSG89e1ldxv9O9qsVtkmjUv95OFvOl0llBLPUps?=
 =?us-ascii?Q?9eZmOda0Iqmwmw/R7kyzgBSTH3L0LBWDrRvkqZd2tEr5N09iTId07SNhv1Ua?=
 =?us-ascii?Q?yvUNzzIfr8/b6e/PYLQT9htXI3RVNX5i+QKRp+e8hhjtcPJlG9QiwmuXWXD7?=
 =?us-ascii?Q?PCKDPKf0o5F2obvksFae/zVx4ja9RIoLV2P+ft4gN18PfjYrc/a/gCEGro4f?=
 =?us-ascii?Q?LxWgRy5jtLNO5yrQ9lO3FyqvlSvVtJ2XgQTD7gKK+/iuGLCAPJvfVF82jJpq?=
 =?us-ascii?Q?sx74jfaBdh7grK4O6skz6AQg7c+csj1k7v5LyJC4V7ns0brX+g/ctjpJdRWW?=
 =?us-ascii?Q?9TAP17vVyf49w7RpGNHA7UcR8GxDvasZcRXPkU9znLMTCvDpfeMOHIPPrfxj?=
 =?us-ascii?Q?OgEsY8cunUJ/Zm18UacJqSbSaLN1+O7VzBlYrDmvbEy7ed70Yh+mTuMdPBE5?=
 =?us-ascii?Q?lovvTMdb7TnzgIbpHZKgfbd4i0aKGlZTql+EkTHpeQi+Y6tnqVhFEy8A2tcv?=
 =?us-ascii?Q?6SZQFsb0Wgc19cTTJxVDcj3ElqqmrWeL2YE5hpKHHsxUSo4xxtjxrrXJjLoH?=
 =?us-ascii?Q?m0k1mQo3q67l5W0B7UEcAJYE/tIEnFruN/81wsBkcDGYN5h54B4cocTmxqD0?=
 =?us-ascii?Q?nL8570a6m4kUtk3Ai/rTDGTvr6CL9fosMNZ1cUJkpDfkJ62fgXSw+fJvw1hv?=
 =?us-ascii?Q?ZOuS10rePEY2qGbF9C2PFDRdvXIPsTY7s96JyMswIcJNYgagm68cbceNfo2t?=
 =?us-ascii?Q?PMBqG6nYMC/ShzqnsU8KkSC2v0lq3UDLGMM/SCVbvhNzIQKbVIZS5sHQBxeu?=
 =?us-ascii?Q?2x1KsDtxHM9tbhqvV75KZjKgJFTmgg5i3P6fXlWP6qi1I3zs9qOnBIOQMsNP?=
 =?us-ascii?Q?Ie01uk4Yc3oC2kuo1otc7M1UFUx2Z78emayVJxdwUfPhZgNdfKdB53vg49vD?=
 =?us-ascii?Q?MXGYN/zFSEMj/Jmp2wtriPJawQZtclx2KcEXTU7/1euuEaXqSx8Coe1WbHl/?=
 =?us-ascii?Q?ZBgqbftGYhZPP3qoKzPsSf1w1Uj88ef2ZDUkL05y8qGEFg1Ftn4l7rrfJ0BH?=
 =?us-ascii?Q?8sWwdHMs2R4jniGL6kuR5sZazfUfAVFPRVxpqwoCF/n2vMByBug24OX/WdXL?=
 =?us-ascii?Q?4t8c+7+iEYAUAspGBUsUlElbftz88jWk5hRLYT6sVr0FKHxIMlMM/ZY8O/fx?=
 =?us-ascii?Q?MQVYRX5doXlfRei0ntVMCVWVekZ6j4Z+y/JDg5M2YyvRWTBU2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E9QuINIr9vZTAFwM4gsYV7D1RcljFsRZ/7ul0Tq5QVQct4P7PuyWAX/WzkKk?=
 =?us-ascii?Q?lDi4Y4aIM4IIpKvOlP2K6rmNs7ObrHYOgc4yRbYaEj9KToGTTB/8XX85twfi?=
 =?us-ascii?Q?+y57nBDYNoX7yMYQOXaRBK/HdPc7DtKX3F2ZgsA/2peOE1LmPZjhPGI+ODyA?=
 =?us-ascii?Q?5zCbNjxVjMaYSv89CXr+Ntwmt/Fd+DeiD5zBAEFfr/5M0QXtaFC51V/34DVN?=
 =?us-ascii?Q?PL4S9RQaXT4h4XqLOgDozG4w0LnCFz3mVMsQrtZEPzUhQdjXhRwpiOEPw6Gs?=
 =?us-ascii?Q?YGb0e3DuGkvz+7DNXViVxiG89pqlwWv7LbVyPJI2Mr0a8ronMMEybqRaYbsY?=
 =?us-ascii?Q?QraFeRBVJ8OEHfjwNIcYb/JxzE0MGAAeu6WE//K+Ao/wStdOaONCRC2Z8M/5?=
 =?us-ascii?Q?nDah1zB6anmcOlUnoCCz7KEL5R1vVAD0MCwtmSNGhMsv9T1e5v7jPXBqSw/4?=
 =?us-ascii?Q?Jys30iTBqaPUIkfB43pFHqtA+DnWFwfGkWpuS5gTrfD0cnO8qit2iqKOoRA3?=
 =?us-ascii?Q?SUAm9fjhGT4kqim95Ejd9CngcERA1ZnwA6j2ByRE94h05rdYRTg2BUiAijJk?=
 =?us-ascii?Q?L43dk4ZMsziDMxzm9fa8LUev7N3mUkWA6k4T8Zlagc0orDUcUDQIi0AlVRk+?=
 =?us-ascii?Q?GNlhCq0kXy25ocdSM7oM0aIeG4quM9LEN4FWbT+UtqeJ0IMnrTLPFFaEF3Nj?=
 =?us-ascii?Q?3s6kkK+yURGOSTA4l47WU2eYXwkL3hRis5hIM1zYWLp1pHF9sfecdIO9ASkP?=
 =?us-ascii?Q?xlthppAdcjq02REJSeJ8TEhxqn6RP+k/qKLRUjb+e5BSNj2jTvGjxRpP2plF?=
 =?us-ascii?Q?b9qTcVlXbRn2QL7wGOF/7MKnFIiRIGmbeBjmk8E1NBJ+Bg+7jfc3fCN6DPKt?=
 =?us-ascii?Q?xm/7GlLHu1AuX7TmkezOq+6guD9sXjyAzptDrJ5P6/c3GcJenLBMHkJP3kLc?=
 =?us-ascii?Q?+FGqF5J0/m955WwmxrQME4tCMQvz6bAPkl5gq5Sv8/7QWjd/gti44z/zy+9Z?=
 =?us-ascii?Q?ybwXVFPQKuI9iGZ1GpDYC9Al0roq7UO/sv4mrq5CQaKD1VJyabMx5XJ5zvah?=
 =?us-ascii?Q?vV6CEE6z6PyoQ8f9rzBiC8hgCe/R0j1PxUUAF30rWBX5aqk8x2NcBNA3lYs6?=
 =?us-ascii?Q?lA/zuM4IcrQ7he6TQwbEvGJ5NBKcrU9RDcOJJ6JuUoz32zraE+IcVLWtglop?=
 =?us-ascii?Q?YW25JEROUC6foL0YutxXG+6Cj094BsZHivCDSJjBXiaIXWT8Rd4rV8PxW3JS?=
 =?us-ascii?Q?65L7qV7wL0U11o94M7qJq7fnLvbg6F+CL+XmJEEwHKPEkqH3gam8GYlrz1xG?=
 =?us-ascii?Q?DLqvXmWbJfI8Y+/lPmGi1RqrrRlb0uKyL+Xg4MdlHLobbHcGSUdx4Rvz4vTN?=
 =?us-ascii?Q?pxsSFDXFnOxlYDi4FSpBWug1TJDb8YXtL32dKOnlMx/3Y+pY3XePscge8k7p?=
 =?us-ascii?Q?AnUJShMh3q2dppb5l8AdTpQMO0NNYfns7fR4Ngvme1tehKW4jpjJLTvzME+/?=
 =?us-ascii?Q?yHU6BrbGcO3N4JlDh/0SeqzOhziJZgyv1jcSxnF7xRUjxIPtp4+LR5pqxTiR?=
 =?us-ascii?Q?EXsrBQzUf5PlG1xsETjhpKiSRsN5PVrA3U0U2Dj0/c1AEYD/dpIx8upCHTgG?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e98a03e-082b-4e1f-fda0-08dc9cf514da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 13:19:21.1260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LKeV0Cd9emZk7zGh06VbrZztTXlyByejX5uaROpq9tiiHWn6hLn7eZO/OiKFtIMMdORlysMGzPID/Siv9spdHXIh4SlX1QNbBSFEfResII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 13:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201607

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The current do_package does not strip the kernel modules, if they are
signed. Hence, the files in a release image stay very big and the debug
information are not split into the kernel-dbg package.

The idea of this change is to suppress the signing of the modules on
`modules_install` and run `modules_sign` after the debug information was
striped.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/classes-recipe/kernel.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)


Another idea would be to move the code to split the debug info in package.b=
bclass to a
stand-alone tool and inject this in the kernel's modules_install.


diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 89badd90f1..96e40be085 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -461,7 +461,8 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
-		oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${K=
ERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware module=
s_install
+		# don't sign now, it's down after extraction of debug information
+		oe_runmake CONFIG_MODULE_SIG_ALL=3Dn DEPMOD=3Decho MODLIB=3D${D}${nonarc=
h_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_ba=
se_libdir}/firmware modules_install
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
@@ -497,6 +498,16 @@ kernel_do_install() {
 	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL_I=
MAGEDEST}/Module.symvers-${KERNEL_VERSION}
 }
=20
+sign_kernel_modules() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
+		# modinst_pre=3D prevents the cleaning of the target before signing
+		oe_runmake -C ${B} modinst_pre=3D DEPMOD=3Decho MODLIB=3D${PKGD}${nonarc=
h_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D${PKGD}${nonarch=
_base_libdir}/firmware modules_sign
+	fi
+}
+
+PACKAGEBUILDPKGD +=3D "sign_kernel_modules"
+
 # Must be ran no earlier than after do_kernel_checkout or else Makefile wo=
n't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
 	if [ "x${KERNEL_VERSION_SANITY_SKIP}" =3D "x1" ]; then
--=20
2.34.1


