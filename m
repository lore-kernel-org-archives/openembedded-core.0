Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F169CE7718F
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 02:38:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.18612.1734835094324511432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 18:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=lw0Dswkz;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.76, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8HIfQKMzO2AJFafPKFuyISKnKu9Q8ECeBVlFiC/12Y1Jgg27CunQkVHooU4F4oWnoCrbfKKwsfFfvlCkvEWNprGqr4wvRFrlZPhC2sgq0R422Hx8QbIZU9V7QwWX+di0A73DOI+rUtd5Qic364lKXMVE2cbc9su6ug0qrKknNmuxToFBc4Bin/bBH1GDkr4wOzINb1gTfZR+YA0aCg7Gy49DuKjTf6zapKgN+kxW1jAbzpqRr08vdS+eDAU75egEN2iE6VqnsYTYtkh7ug2KPdQGnwF5rK3+ayKKvJiWZooggGpZ4aA6vpY81Zsm/V3QhgW2DmV7HAdYjnfe9CMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=r75x5qoLS8DqOIklN6E9KzjQ96tifjzEZoRuoW4sDN575W8kRz6ASuRFK1260OG+HqrhCC1WB9KsstXZwyTNzFrZmcZsEiDYkYRDpBdsenHSeal4JxdLivp9COvFkDI+voLglN8BuqOLalHBddXWV6DEpOTt46G18RcKny/mFlQH9sHZLrIx/aDMMF5KIAYy24iu+zYv1UNa6Q880saCRaYfgHjfy+2kw0RsLuLZU5s9lAeaYo6QUQltNxa8ZlyorxqwwcuIu1Daf0Arx0/y4+/rYS3XOgmx95klSMo6ceFTNInCieXLMpGQqZ/mpEAgZrYNce6in1M0s4wImSw2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=lw0Dswkzpt//wJSNlyuPnwUAQP8Dii/HKp0UEYTbdwanIrorX/aWc82aM5fImG7EZBvBw7Y7luocRzE+Ep8PVfE4uDuB61gqyq+VmRY284HpGhtmnzLNl2zjSEqAQc9TJKDO9VzdSABeEkCJYQCyIqIbdZvjVvGxXMReiBmlvDPpnAkWXy8InptBL8vAr2FQr7rGnnwy2rOkFhBr8uk/Dm57SxeC2Cjfg4j1OIYg2RE9wvCTUMk54nj9TB9sVEvqdW4TqFGiCvLhCALoIOF4406L7GCr2aoB0SylHFJYD4qxioRych9hCJeabCJ0K4yleB/holGEiFTe8mc5fd5TGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sun, 22 Dec
 2024 02:38:06 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 02:38:05 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 1/4] pkgconfig: Add pkg-config-native to SDK
Date: Sat, 21 Dec 2024 20:37:06 -0600
Message-ID: <20241222023709.2233470-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:d3::27) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f0b1d2-4ec7-45e5-8ef9-08dd2231a9ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XkXf8Nyeg84l9Mzg+lBiXgRDSa1mOxPhczZN2tfKUNX7c34OgepvCJy9Dkvo?=
 =?us-ascii?Q?7ZMUUfJ824ATt/LvdS+yP2Qo0Aen7lmUhhRP5m5EcxrX5Ck0kWxg3MSRNo+5?=
 =?us-ascii?Q?Gug9DgoPX9twrTXindlfWi0jzgN35afRmSgrVIxWe5cswmOWfUKKDV9Uz72Q?=
 =?us-ascii?Q?uIVN/7Xm990EbVndOGwMxIaYPDjRLvDhlal5j9LIzlTP5Rs0kl3Fol/DQrBD?=
 =?us-ascii?Q?s5Ah14+qS0+tc2HOxnl8X7655kKZzyIiBuzQxJf5FClzFzsj4FxL1I4bLAtn?=
 =?us-ascii?Q?ajPbfE0oF0vXXQDvne+8LsY8Vl+Dk0UOIrQrFxeIxBHWVfxKdZGSijIu0UzP?=
 =?us-ascii?Q?IH1ThsNb7J5dlEICTarJT/F4yttP6tjXPx2eH6bVVLPwFrE1R2WObHco2zdE?=
 =?us-ascii?Q?HAMXyJN6qq8lFGe9hx+zd8SNlrYKuBgAmwjnB3qnp6qKfr0ROJBcmVv7J9/S?=
 =?us-ascii?Q?ZynKVgyNrhSKEmHl1tVLmBO08FTIKnhzoASQl4NAbRXj0FqhxiXe/4vVfRjj?=
 =?us-ascii?Q?EHWboZbPxTZa5rEj7m06vSNJBq/s3yaiZzNEgkPxc5NIEMyOqixPAhhm/G4A?=
 =?us-ascii?Q?ujYwn6bcQKzBRLIXoAUVTFE0pwPT8cw7t5VaNuorMSCG4ofIJy7se2Gy/qRN?=
 =?us-ascii?Q?Rcuiso6YmG8FkqI/o9v9H76lcYHemFdgRKVgNJNx96nVON+5zscTYWjkOQC2?=
 =?us-ascii?Q?/mec+Cj4doSpMfDa3fp5ryeHJCBQXv5lfCmWKQKZQol/R6zpSwW+MWTV/w0G?=
 =?us-ascii?Q?G9RAtahNR2lTd3soVMzX2hrddhw4nv8iRhJcBD9jC5RmvvwY9EIT5RsKCodF?=
 =?us-ascii?Q?MnaCyR5+QkqnaIx2uEqf4OoFQexOrsNDXp8H6cYg32xx+ngC/P3rAzOhCzRg?=
 =?us-ascii?Q?caa3xQB4aLmluePpurafH2Gr4Hr/GPBq5WoGm9e/Jh/devAgO8TAQN3/YR5T?=
 =?us-ascii?Q?+mmkIJIHmJcGOQTn9B9ipOfL69ffVQ+aPq+r3wiRnwCtUHrLLTWxiv+958Xm?=
 =?us-ascii?Q?WN++kl28qTXU2r+IE8h/vdEpgjVDKVBEAmcdZIhN5nvawgbCNKHnWpEbcqYR?=
 =?us-ascii?Q?jNBYNQtv8xP/U4vBfnZfwXtDn/fVBBNuQqD2hRE0NVlAw/QaZ49l5A7wWlhu?=
 =?us-ascii?Q?xhMqE/PSw4Hd3ejaJmyOjjGXahQoOhP0HLQnh8419GeymESxW5H9Onm5unSo?=
 =?us-ascii?Q?7Tcp1ZolTfXIV/333E0A1xGFwu1GSRNgNygrRrezjq47xZk492vjiZnMnqc5?=
 =?us-ascii?Q?QgjRHOP6N2+jpAHE2knmHhDANVJ4oyxve6wkqcxwQc/UNT+cp0AvlzsTf1vI?=
 =?us-ascii?Q?qH+2VbeYGB5fWfb0nc2KHkw3u1X4KYPvovs9FccTx1o+353sPyQEn04UUXYn?=
 =?us-ascii?Q?4zuttu8EOXeHWAMIaCfwVlCYvCQgQsEUAspGVIlzf3Plk6s8uRDjZ0GeaznY?=
 =?us-ascii?Q?csv/SU+fI1L2HJpCTlr/mX78msAr4Y9e?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GmjRlGwZtuLG6PajW0p0l0WKRyQ8RHwtv+73On0NyQaJmRAXYbSbps8EQe4o?=
 =?us-ascii?Q?fBdODcMsi6NOMy82aI73exPGWavJ/IgA+4Jf4Aqf8gFfGWUS7MUQ1VnoAG+m?=
 =?us-ascii?Q?0QeZWxt9ZBYDNur4jP+1DYac401EELd4grXBDehxbUFM0epQuCIGIjJtmP31?=
 =?us-ascii?Q?BcjxnWZrF3VfjwOa2FV71unad09ObKV7Q8amPQdNCM37gMoNyTrGnDg6CzLG?=
 =?us-ascii?Q?eNZx1pRy+KXYYypMK0iI7onZWTb5zvEtBooUL6upfpMXGj4S1N5KK/XMqU7Q?=
 =?us-ascii?Q?Br4q7FTy2JwOilw9T7uoRdCOu0vt0UM3jdQpgU85fd8GZdRgUp7CtMVZsgCX?=
 =?us-ascii?Q?Fe22Cd/9clTv0fENM8MEbwjskiZnFpbyM+ZjjGeDBndtp8LQ0EVqyiYwCnFS?=
 =?us-ascii?Q?515XM7jwN2B1ftX/aqKFHpKB1+6FW+9O5jS0Wl8cCLKgfb3dV5/bEdmwQKad?=
 =?us-ascii?Q?0Q/E0IiV0JllVTKhW6am5dv9DxBqhWu95tXo7naIurAEgZMqNaVZrEtOtVBN?=
 =?us-ascii?Q?EFM2NYovcNh7uHczzrJMohRHnTkhEPB64WZcRwLJOLqu/3zQv3b837OLjp9O?=
 =?us-ascii?Q?GEjbSLKo8piRd703xnG4MWXmLNkffMDyFg0KaX8qvITaVFknaqgFJgZCATSS?=
 =?us-ascii?Q?LYRfudI+KVeqTKSb10dIlelC6C9PvEVThl80WZRPVy9q8Ln9f10Cw9hTBw25?=
 =?us-ascii?Q?4g5KPX2Fhxv860RGTy8wIiyeYUgd5YSdv6vAe8Np1oErnJMUCOl3vOel5r++?=
 =?us-ascii?Q?QQG7UdzhNxmCrHe7U/MuQ59PAPkwep8XzCM3Tsu6aPZoRbfMz7Ce/M39aXTF?=
 =?us-ascii?Q?EbkYXpQwP6FfTYThWlAhGBxlQvTo8MASgEN8hQ4bsgVmEIxq8tl9lqnUI+EW?=
 =?us-ascii?Q?YJAiyEyClQznISxC58MQZa74tgtUYMOCBFBotN34Vvh2Q3opeheY4vPId/hE?=
 =?us-ascii?Q?TvqEkckjKNRmRhDXGtJzUiZ1bmHuYtD638inNAIhQaJfEKl9iJ2A87tvFdtR?=
 =?us-ascii?Q?kc8ejBjrZ2BfD7c2rrjYSP1wc20W66AN93Q/bOMM9OaAThVOoVAtO2ug+27z?=
 =?us-ascii?Q?EAnRZxWLk6hbEVhdaSMULVAENNsmEw1MtY1lbujKbT7plBmLqs2SbChV+8IW?=
 =?us-ascii?Q?Ru/hBZ9TzzSnvhI4aNGQSW5wIsLKCDjIYEiFs7CKHIcp/nZQywnl4qK3WRP3?=
 =?us-ascii?Q?YurkOfPZfukUMiYPLBn/9JntJsAi69/5IsQqK08Rsy4qn72l2W9xkDu0Yb/C?=
 =?us-ascii?Q?HgYc0OP7Dv9yT8TX9nXitXkfaEGWUk2IURNufomDtbmEWrnRRi1A5eyh/8oy?=
 =?us-ascii?Q?dynQPBwyKIvOw5DVe1HZcwcMUYIhYrxjJ1bP/gqpc43McCf95X/bi75EIjlN?=
 =?us-ascii?Q?Ka0PICsFeEswBntkyMjOsN2NQsEba0H/cZ20kRGsCzxJ8ZJ8PrkjzilpTgKA?=
 =?us-ascii?Q?phyFqH2uEnhEaPySni4T5SPmkOOh8HVuKgL2FPpHqL0gL6ez7mxTyBKCO3s+?=
 =?us-ascii?Q?29lS+fwfU3ruWjgRXhPVW9s4sKepOwV9INNVih1eLoEsk1BHzOA4WudtDI7m?=
 =?us-ascii?Q?GpzYFXYBuzwhO0cv/C/V5GSOcKKE1h9XIG4xQAldEne26CtbA6on5sUOjETg?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f0b1d2-4ec7-45e5-8ef9-08dd2231a9ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 02:38:05.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3VIutuoR1bSGsYiSEXH7+zLiWVZK3D1cnJm/eFOpYugdP3rKMbC04Ecc3bZjqrgULk8+t2678peXw4lf+X+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 02:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208995

Building weston with an SDK fails to find pkg-config-native:
```
Did not find pkg-config by name 'pkg-config-native'
Found pkg-config: NO
Found CMake: /opt/poky/5.1/sysroots/x86_64-pokysdk-linux/usr/bin/cmake (3.3=
1.0)
Build-time dependency wayland-scanner found: NO (tried cmake)

protocol/meson.build:1:14: ERROR: Dependency lookup for wayland-scanner wit=
h method 'pkgconfig' failed: Pkg-config for machine build machine not found=
. Giving up.
```

Fix the problem by extending the pkg-config-native wrapper install to
class-nativesdk.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipe=
s-devtools/pkgconfig/pkgconfig_git.bb
index 6f13d0177e..2b298eb5e8 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -46,9 +46,9 @@ FILES:${PN} +=3D "${datadir}/aclocal/pkg.m4"
 # specifying an appropriate provide.
 RPROVIDES:${PN} +=3D "pkgconfig(pkg-config)"
=20
-# Install a pkg-config-native wrapper that will use the native sysroot ins=
tead
-# of the MACHINE sysroot, for using pkg-config when building native tools.
 do_install:append:class-native () {
+    # Install a pkg-config-native wrapper that will use the native sysroot=
 instead
+    # of the MACHINE sysroot, for using pkg-config when building native to=
ols.
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
         < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
@@ -59,6 +59,15 @@ do_install:append:class-native () {
     install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
=20
+do_install:append:class-nativesdk () {
+    # Install a pkg-config-native wrapper that will use the native sysroot=
 instead
+    # of the MACHINE sysroot, for using pkg-config when building native to=
ols.
+    sed -e "s|@PATH_NATIVE@|\$OECORE_NATIVE_SYSROOT|" \
+        -e "s|@LIBDIR_NATIVE@|\$OECORE_NATIVE_SYSROOT/usr/lib/pkgconfig|" =
\
+        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
+
 pkgconfig_sstate_fixup_esdk () {
 	if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" -a "${WITHIN_EXT=
_SDK}" =3D "1" ] ; then
 		pkgconfdir=3D"${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}"
--=20
2.34.1


