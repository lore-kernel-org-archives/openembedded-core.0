Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAA1E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:22:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web11.140245.1734646917684260218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 14:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=nfiNRaqT;
 spf=pass (domain: oss.nxp.com, ip: 40.107.104.41, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE1EM6pYMiVILBxcCzd6jqCVfwNpT+Q6bx1sMyqKw1vgh/bNQk9F9AumWLnkmhJMYtaCQs7LiTVs0kCR3Cq3YCAy4g7sOebYjZ5HpE7BH82h+5AFpc/0W1UnEohkyzrQPrZ2bH1Q5Su5Q0LzY++UEWfZ5H9dZ05O7UoOCo+cgDEo09kWPbPqp52an/2Dc5oAhEwUbjy4As72MpSP+Z5IloZI+iyv/nVFeCwDeP3GAXLRu12d64esRhn6j6kjU3/hl7Y1uXwA5bLh95MZzvVsS3fnmfs4nBB+zeY9KHz1PmD1Rqa7oCcosgZ3wPS+EdwEmPbXlB+wuaLwzjoF/YMiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=L+KGty7sUaNUt45EOl6I5GhykOsNgB92N/e92MiWY5Y3dNe9QfEWosfFMGtSbPp3Z/oX296BZEYjeWQcOP6ZJhB7jLnhqzQkF55Q50JZ+6wFC4uHo5WkCLRw+RbX5zW5I/4Cjp0PQEQlc6RZR5HHvVrFvToxXlq39iKtL1t7XkRj6KVRrOUlhgW23yKAjy/qn5JtX+GXw2lnsPuQZ7wZu7PMzeY1PzM2wgVh3yAbrNJttMdMWlLJ690qtPch64FCJ3xAKM0/5dj+cv4p76WoJDA1bX2c9LFbc1VXivDF6p4gcTMsAEPXsaidrxOtPmaFxayK/mqrI8mmGLzib3RKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=nfiNRaqTOXRwiJc6bce6akPR+Q40NkH6XP3dAdZAFiiEFrfPIgWtdmOJvMg2YLOkgSTgFgLrChtkvZndgVYxE54fJ0gsmSGDPBQtUti4hTqQrcR/2S6lHFQflMndYds4DoLi2kubZw8BiE4CpD3G3oOOu2jeBYPKtGNRWH0BF26Apl9o06DH8r911YI5GvNmInirD3/73Z9cZbd9wONyAbckuSoYa37QqVPtatCPNvJkFWiheT6gIP2/4dKQH9Xx+c34VfgPGxuQv7Sa3Fg7E5dZrP4bFQEyFWb92BpiEVhSssmVMm/7PKCkQdNy/4Z+ADKuw5ZcUA8BiCtBPuS56w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 22:21:53 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:21:53 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH 1/4] pkgconfig: Add pkg-config-native to SDK
Date: Thu, 19 Dec 2024 16:21:17 -0600
Message-ID: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdffa98-c8b0-401e-650e-08dd207b8a71
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zBDaONA0QBj56vSDsqxF2LFKobexS719X0cE8/k9feiiacTP6ptBgD4et9Q7?=
 =?us-ascii?Q?R5GxcPB02URrhcZ8CkOmd8AV7JC0INjfpAdZchNZu6gS9PMCAqcH9PQr44om?=
 =?us-ascii?Q?pIjLZRsFJIhgADpaDwKiP90dsrlDrhVknKYxSvDP46bBK90vbWY2o9Vmw1ES?=
 =?us-ascii?Q?lrwiawq2nuh3El6eF5p5yd8qi57pSycr7QaVzeXCPtgagQpsXTCZsQfS56Sr?=
 =?us-ascii?Q?CNNIvdwhV2Fgswt00f5I5HY+2ObggkuazKIYkQGjlXLXc9zDQxjXn7tZyG3/?=
 =?us-ascii?Q?B+A3sSaBlGvDWGl8KJuhwQ43G9N1Ytvs0I2Tam2L2UAM7IeGw0rH6HpFfHpl?=
 =?us-ascii?Q?KCSHeolHF0SCgOxiaAMKsH538oYwynFdxNC29MQ0ExkVuTTHTgMReXW8ZPXl?=
 =?us-ascii?Q?Yj3STc3pOP6BC2qAVt54behZFFTaYIh0c41HzTobY/PKoXET0ulNpgn7HIfJ?=
 =?us-ascii?Q?FjWHCSftaL1OTX2YtA6jS5voLfO0y+lAtpBXl3zEIcXwruSm38/e4RK8VV4L?=
 =?us-ascii?Q?RW6cVx5b8GsYoFhOLlEqk3Sb1h3FeyqsGxyDgKKbXxN9p/m243VT0EqzKJsD?=
 =?us-ascii?Q?lQPUZhymfaBL3RqB+xqz3qoj9NaTMqIn3oJEowtWSPcwEN5QAYjVtkCU+5lR?=
 =?us-ascii?Q?DxZ2izKzGl97fFY6Jg5PIJgWVumcjSXNCAUuEtxDY69VDBpCc1Q3KPd+QQbc?=
 =?us-ascii?Q?Z4xT/S+nvBozoEclx2AUZr73cUiyCIHDluw++H7/rdHsVhG9UAto+xe47xz7?=
 =?us-ascii?Q?n3LOtdmF+5kA0dIsIZeaIoLvPp7IOwOhSey/sl2jT8VNsgmUh91l2fo0Pc9J?=
 =?us-ascii?Q?Mm3lf5ov/yDYOFKnJezSI747YgSZuRIoO/M+Vpf3OpU6ZCCKYVaaJie4Bou+?=
 =?us-ascii?Q?cvFzqw1oyTxafOdX7u7Vyqq1mafObjxelditFm0WeSV+2iHXXvj1/mRmP7lJ?=
 =?us-ascii?Q?myRT+oIQ19kdwaZjOxytNmKtZsB6fw/3N3Sd1seWhAvastggA0iXqOfiucFT?=
 =?us-ascii?Q?0NAcPUllhcf0NbT4TZmsy+zCKxVgbTZKNMxrxLZ99OFfP0sLnlBeTaiYvp2k?=
 =?us-ascii?Q?oaJvHzN0wEKW1U4NUsw3ETc6T7rwgrbvJEaY/CRtNCDVG211ft45+xBN4YrE?=
 =?us-ascii?Q?MFZ4rrjvANPtvxXuFIIA1Hci3QJ7Ut7uBjnfToxjsD6dPO0l5OF1dXYN8PVb?=
 =?us-ascii?Q?OaS+mUdOohjC3oFltT/7HWi3CH6mjQqmqx53oPeJI68w6JQG6WOOw0zhjIbI?=
 =?us-ascii?Q?UjbpiYGpdeaNy0pEN7Q6y6Ip/2gDRgQwU+IFktHB6rjME5MdeT1CjhLEFKgf?=
 =?us-ascii?Q?Dj/BpqqhS9Dsn6fPNxrlHjbuJ5kLG6p3bsI7ytvMvwWn3Wq7pSNoXX2j8NwF?=
 =?us-ascii?Q?/Es33Pm1D7mdi2OiEsWOEo/8TZM2z5DBwTUckDhu3JIcklWjpsV8T28j1SqD?=
 =?us-ascii?Q?iv1fC8jGZ1hJ0/40gizPeEUYSJGlaovX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TB+I8/whCVcI+r+CUqORdi7pR4AaTe4KbXrZv6/D50Ao6kHiatmAmbL/2XuS?=
 =?us-ascii?Q?+lU3Twv2MS6izxMo4mnlMShIlNEtJBX6692z8udKCO4dj86D+70og9EO7lis?=
 =?us-ascii?Q?HJ7H4yiL25AlmHV2ySzmKqs5SctCkn1apbdnqUYodB8yNXb/5SEjHYs2vSw1?=
 =?us-ascii?Q?JcCofZ1ZQaMGbDOZEFh8DejcfIrmHgqIUVxsp+irZORyT+svYjrKu3iXvo+m?=
 =?us-ascii?Q?trNPeJh74uVLjobbxmHFich+1aJHhLV3u7CzdzHSIg91KnkD74Fj1xTeRVUB?=
 =?us-ascii?Q?LoARD4UCz7G1v7D+JxVBJdPxT3rw69VcQMnhVroynG3qJLbYRtV09p5sK8RD?=
 =?us-ascii?Q?CfZhbhHsNfLekrxOsfhtq2o1ScIFLikGBl4PuRKDEY4HEW/s7ow6RuHy6BQ/?=
 =?us-ascii?Q?+l4a/Qvno84jt/5t/lapXSRv4JX2j7TQPDSh8zcp1Gr9ISSplEeeWzSwih4U?=
 =?us-ascii?Q?ekN9yPDIOGA6K//sHRG593xJ0lBrlGMn5zmySvBQBRmcP8EzqgNDyMmyexi5?=
 =?us-ascii?Q?fa0n6ay6GH/cvquZePpPVdQ1YJJPP43oMwIyNMeLeMtwsvDYzXKh7+y1sFJI?=
 =?us-ascii?Q?YAql2j2iSb/M2znZZGbxnDkSvpM3cmwxRf+vQ/JUAE/85N4e+CA6AIyVTt70?=
 =?us-ascii?Q?4vCVfToNZRCC5q5ZQSTON2pgmqqIROS6Ew/7/xRYDBYFt6Wetxh06f8Hz3l4?=
 =?us-ascii?Q?lSuMW7vlEC6YM7XRjj7gpFFX3cVUzyjkaDbUFjNOu5vgjqLV69MU77onelhy?=
 =?us-ascii?Q?R3+AYCNEsY3m8iVgaCHnY0HSAkfs8A9PFrjzPiSiPAasKHyrmUkn6dEwL8Ot?=
 =?us-ascii?Q?jsGG56K1lYFyON/oZ5NYmmc0zSWI5KLhYoC/g+orVcdodmSeDm3iGOC6WtTH?=
 =?us-ascii?Q?SZXQb98oUb8e0KGEhADXV6Q0nyH4YFQty4Ow+PrpZZwe+BTmyJ53dygeF5mp?=
 =?us-ascii?Q?/iWTymZuB/s6zRCFlhgmv6H6TK8We/1s7m2EzT1ioD3O9A8lphnVeYUHQ2M3?=
 =?us-ascii?Q?vBCrp6Nw1Udc689EiDJBmwNQ1WJZNGr5tQJ9qm7kq4yT7NHJ5zL5j1ETA/l0?=
 =?us-ascii?Q?Da6T80fVNJGoIPYtFMkuhaspbhpCtzcEjeAzhQ7/e1fZA+zBzW09LkeQNZyE?=
 =?us-ascii?Q?30UjBBtUh9zgxEiQFUrJMQCDBlkqiSTdO2qeJrEuhevVFx6yzkZauUnE97Wy?=
 =?us-ascii?Q?7eQVUthD2c30ow6xnekLOVaRA4lIHZzL1MYkZC7l8CBbXcE1LiwSdYx+ZVuv?=
 =?us-ascii?Q?9yxYTZxkJGnRYSi9gYnpzOkbTQCO9g3QgI/C4q/e02drzUUgXQ8lN8fW475z?=
 =?us-ascii?Q?dS7HIR6NrE9JWeddL9TldlELk3LGIVr5n+8qNFNSxeKbG/GOoYdwLRBcXAEI?=
 =?us-ascii?Q?au4kSK5lID2fSA1DEWTOUeUwdxDckjQc0xip1XJFRixoeoiCoPWqr3JrV51U?=
 =?us-ascii?Q?6cS9bYDWaDCk+woh1BZJTwowsCYz5F1+Go7t+n65u1NUQKyAblHxlIV+9X9i?=
 =?us-ascii?Q?N8nePVUiwmniwRPYlDOM4f7Ja8URRgxqs3IMbepzbPQTGgHvRUZfy+b5rzlM?=
 =?us-ascii?Q?P/jjmmMPes6eVcTiNrvXIra3XA9lgAANBrAoxiW6VdVQ6FPxamY/nabqYHcB?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdffa98-c8b0-401e-650e-08dd207b8a71
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:21:53.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgIyulVXEjqNVAW7bbz09iscjWq/Vbj8PcrOHTeuzsHMDJLfZueXcC1MZvC6sCr+fO9DedHysZ9i8YLLmHO60g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208959

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


