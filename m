Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B81C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:43:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.127])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9550.1785239016015686429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=gmdKsnOI;
 spf=pass (domain: navimatix.de, ip: 40.107.159.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5FvOzMDDSvA6YZdQ7dr9kHEzTAINGEq8FbCVlUVSni2NFHiH1Z74aZtMH9Os+E/y6NYfSU7wgmQBqn1RiRmsEhfCjDSlNP77XtJOxEGWRjxlPWgyAQYYF5/nGczqEmV1fmIrvg6pgl5OrAYrN4Rxtr4xLDoRJetc08ekJkhYDs+EaZYaniLixlzUhIC0qxHAmrcRysY+QVDX8BzEHwSdCyMbz83Qr8J/0iNaMl45fGK43nNznhN95ORZ//qEGVEbe2iwJj07VsidM2MVQoZDSdGLjCFAfXbVUlQbJHqtgHPzb0TTMjcDIipUrqlvuC+VJuo10FEQqPkSVbuNghkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OQpfTiTop61GQkOQKrOBq4f8ie/NNK1Y6temCV952I=;
 b=LVadzrUq0PfOz3udfcdoUtA9kQBKJj2I/z7JmIoJbir/ZIgPI4JOO3RKwW7jwxif54XNjwUDPXAla+I8Avo9degyoCCfcUVnywe3aktHoQurq85GrH3eF9uRNGPl9ER1+CiC0vCh7fHVwXfWboMNU+VvUGsPPlqyq80xxF/ZKbdsqoqx1VuyXOUiarM8od4esuA1/Un9AHPaFNXMDrh+i/3zZ5peg+x0IVef+IAiPumJ7+DIOfIObTLxMA8rh6WnOhEVRlywSgjeG9l6S9HAZ7rTKazUxlu1ClPzpg3PLI1GRSkEghoKxWMyyx/9RnpRb6HHq1W49AycJrGK/6+jXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OQpfTiTop61GQkOQKrOBq4f8ie/NNK1Y6temCV952I=;
 b=gmdKsnOIq4KfZEcS0hCtZaZJHvpN5v7Dpug0t8n1iDMIg51G3UPa2cmhxXcyzCCtwAGaS4nAB77ap2QDztpyDR2ZXwqWoCwIf13g5XzFjhkX1X2Ilktf0G9/X8iPNuHK7naVbGrJnY9g0uuWcFz5wv+S7bCxVpRLjRyOAm9UMaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB7741.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 11:43:31 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0245.012; Tue, 28 Jul 2026 11:43:30 +0000
Date: Tue, 28 Jul 2026 13:43:28 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joerg.sommer@navimatix.de
CC: mathieu.dubois-briand@bootlin.com, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] bootchart2: Handle bindir == sbindir
Message-ID: <f1724665f0d2a09e5f6d94796d8581a03b4f814e.1785239008.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: e74446c9-4954-47fe-10c6-08deec9d722f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	K84ag+bx7qNyvhZXHpOmKHofuy3j0C35/5yzvOi4Bgb9aX2YgQHVE1/Za6+eLZS+Rfmr+AHU+2N9t2FnHEn2YgxBpToet+T3T+lVSEyWWYGee+YVfPSTaSC/jOKEk7YUs6E9RLcN2dc7zQWBpI1U5nOdjxbrJYbPx96k56z9QVtEC/7BCmWI2Q+FmRFy+xKD1ulUo9x8JInDBLYkoPXvas0aPTyQqzAn5Igoq9FzoTbmczxQiAdwW6vF8lpKOeeVXFxqqpftNJ7Fn11J/eNSWH0yED58PaeX/seozLV1lx5ecUvzzHiuaH/cXUBWvjTKRSyU1+Q1NozwxFHzoEutAtsxxwNYpqZyGpsS8Ku+xtUDesrquYaMUzp/vlHRJrwMKbfjTOLVgP0dzaAM+UogAeNWdG7dpcnlGuuTBoL+7fSDP5p9f3ZM1A+oLGLzXMuJAJilRwP6ZGXACD1lqKJCsqjvYuzzbtNu9C2O+K+//dxtL/m964qLnAXKjJpOIWqffk787tI1zV6fKhlZQrXDkv2xcOEu88V5kERU5BEcsH+eCcRCyrzjhv00G8anN9E/5Y+q8HSc7g8YhmYO3M7F9b/t3vpasXuNeLYDvl1gNsT0rvlHDnabIzab5vfhUw/6RInSnx4KHaJM+MruLaXK3hp6I5ZqvGLj6Al4cM5YtZw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MbSfOHJeHR+iRuRCendwhdmXhznn7+xsQ3v5IMnfZcB5i4WZeT+wB3v5Nv1x?=
 =?us-ascii?Q?SdbP3wVIpnZFHQK5mE2rVWcCUEN5ry2LTq6bNE7UE51caB855uLSSC/ZQ+kO?=
 =?us-ascii?Q?65SgOArtCHxDpvNFEVTtafAwDupvBh2tvCQjPFb2EifMWPbo20Iwj+1KC0/d?=
 =?us-ascii?Q?M05AUkUPe2ww98nMDQ9aGKcK7nuc1gaDNB5wcxq2ugwrx54dpqten2rTUmoa?=
 =?us-ascii?Q?aHDTPqFlyKm21Vy98eljABY1bn3JTMMFSfxDGcaJdI4XUMlST8jXGHfi7ySK?=
 =?us-ascii?Q?OyyIoXibbfuzBJzUhUsYGF1aGYBINTtd68a+kLFeRkDxOz6c3mmkxafi6JTq?=
 =?us-ascii?Q?cFjwutMXmJPV0dmJSOVBExvq+1YHhObTA2nteGSYdFrzV8CNGkvVJbY68dcz?=
 =?us-ascii?Q?hFmXLenSoALtVMS68hdnm26Y/x9C6sZS4naK7lMhuuJWTBbFfl50jSxNm+WD?=
 =?us-ascii?Q?GZlW/Xa89bgcWU+0lVHHgXxSCs0M/8PHdKriM7N+3fegsWgrJhIJ9WNqUsDO?=
 =?us-ascii?Q?lRF3JbyAq/x5V+WNOWXE5B5XY3qurO0KSYl+W+3tHWET250g86e9Xo6beLVO?=
 =?us-ascii?Q?iwlo/dpOQ6Pm0l2jReoWSHaQcsU5iM7448frGuopUk1Ki8WpMhscjlLt8H1n?=
 =?us-ascii?Q?TZcr22UvhqH2plTjyQ3aWxxa6FwMf0LpTPvd4dq56FwpVb96S+iXYILTFO3h?=
 =?us-ascii?Q?y4LWAmqRsbw9adimvPAS8RF3lE9uMqA/f1lH/+RgfgQgUbFeXHRj4OgnivxQ?=
 =?us-ascii?Q?qi7E2kR3dj0Vzz5xoX26FEJQzURrhaEJy0SV3wzr4qG90yoI/laFBLIc4DWc?=
 =?us-ascii?Q?TIPx8uqI23N0aU9AKt3y0cp0PXcU/CNSDlhRuZZAFv4SpNxO0xAoSGzB/hI2?=
 =?us-ascii?Q?3dIiga/egDOZ5VLpDcGxRSkyca1E3AIxIxdjJAUwd/k0717a+RLz2TvEhJg6?=
 =?us-ascii?Q?K32SYKEV1bM4/vWiVMAyrq3L7ZDKYWi7CbfH8oQHrwEOkuKTajSaI6pLNGif?=
 =?us-ascii?Q?1BVkWK5uumzrm5oq1YPc0cMmUfPze/2dE2b/lPXlRVf2kd8hE511sUrNo+wU?=
 =?us-ascii?Q?Msi3tE5WVWDXIHl31O39ElSM0vvBok26P+q3kin1OuZHP/T85bI3rL52WbAu?=
 =?us-ascii?Q?LsT3qfL8BmZMgjUokJsm/Bo8xf0XLRR3r3SOenC4GngNU5bwFfj72L6ag0uw?=
 =?us-ascii?Q?diZ9xxbJlXW+nPVp/BHax+Ifh7AlgMNjt06CiKaaimyidvX1i6MiM/aY9vyI?=
 =?us-ascii?Q?M6nSHOoiNkc9ueI8oRzJRbPxhZXFc61Jq9VBh7VStDvSaNMOrRTr/j1TvW1d?=
 =?us-ascii?Q?+YN/8E5hNsCp2wbnRvy5FRgCtG/+/DbPidgKSXBMsWFeAHneofC1rJOjppP7?=
 =?us-ascii?Q?Euz2pnOJziIqPMX6FKe50gmmFErBcpD7ZxP8RwYfcv7F2vRceP87nl3eams0?=
 =?us-ascii?Q?WTM3LY8RyuerFffNTCmHx38TGPPGdEJqC/noyJaMMiySFK4iLzyBd2GJISAA?=
 =?us-ascii?Q?tfoihIjJtSvLawApj+2DoKXTUnMtzV0u66rG6jyRFXbrKPO7fEuXIxN8xfFf?=
 =?us-ascii?Q?Z5943OiMuc48E+nfxKlE/lEsGN5OPlZK04Ie6Gy9NpXBSRyNS7JicDjFBXC8?=
 =?us-ascii?Q?XeNRz5KHNOMo65SM7o8cvtK3ZsqI0GerzNpUlDB6Bnov/PELKtW1NY37kyqZ?=
 =?us-ascii?Q?eycttH8c+IyABxxvKWCPjKoIJaxYxwYNTv6nhopM10eBzRV8o0C8V8+7Rnk8?=
 =?us-ascii?Q?WUlDj0C1ISRvhTJ4WdP2ze0zN3+N/OI=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e74446c9-4954-47fe-10c6-08deec9d722f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 11:43:30.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbNT//WBRvOaOPSjO+cIVYEKf9Pz6KJm4zipNVn5mJsn6QHxwmU0z1Kr6/Me4ijmuLM0JcFl+zNhz2x8YCUZFWtGsc+9gHq7rgd4GmekuhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7741
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 11:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242186

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The upcoming binmerge (driven by systemd) merges /usr/sbin into /usr/bin.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/r=
ecipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 77fdd67302..c03bee4c1f 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -136,6 +136,13 @@ do_install () {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${UNPACKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init=
.d
=20
+    if test "${bindir}" =3D "${sbindir}"
+    then
+        install -d ${D}${bindir}
+        mv ${D}${EARLY_PREFIX}/sbin/* ${D}${bindir}
+        rmdir ${D}${EARLY_PREFIX}/sbin
+    fi
+
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false'=
, d)}; then
         mv ${D}${EARLY_PREFIX}${sysconfdir}/bootchartd.conf ${D}${sysconfd=
ir}/bootchartd.conf
         rmdir ${D}${EARLY_PREFIX}${sysconfdir}
--=20
2.53.0


