Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C069BCCFA0C
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15837.1762158114459664447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=HiS8zzdO;
 spf=pass (domain: navimatix.de, ip: 52.101.72.100, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSt27TooIJg+dcFbfqtxIXirIkZMayfYqTLwbuFd5wnYiTIv2iaNMd0qqja44laZeXg/wy4kxsoS54XJzEepo6ESOZWTB3t2D2aicafQSC31QyMh8A3sVM7xGY0YuD8+nNNDNmAY/68xD6k+YBXmNsTROE918uI52WffA+y/m2eQg8OGyA4x1CPpl4M0gI7lWVV2SQQMxgq5sNnqUw2wqNO4TGlhL3yRMLO/br46CA7d6lqT06aXNFhwzwXsm33BLfRzTjx+3I63mJazjGprF7TPewXNdedCU3/cSE3ggAZtGQCFFrsBX4FqWcnAU5zwrDBXOYwumpZR32k5bgpJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKF2EOY/KVg1ZUttAdU69qM+Wrbbu/1U6zoAX2suq28=;
 b=J+kipTQOltYa0RLPBSzeoKg7epfkrI/wIZ+a542o/fFcLZbR5p85gNp9OlA+dir8bX06Deez17AZHYvHGSdBibzh4qqB0gu8Tr4DRxYgZ9Ep7HltJQtzd8YLped5XKWq10l8urGi6gyOK7NdlGN9fs1deCAqVyjtS7Mkj+Sjonkbev/AuPC26LhYCEfNZVRqkt/mCwOw2hQJ3Abij9rTo/DPFRm0aFl/+sJ94A0dI2Yl9IFUugjKaKUAblZ8eMzPAbbH8zcgVMt7BMVUOs8vgcylccfCDtOPv7zBEXxQjVZlDpnU9IeO5gV32peoao3Kr1h/Tc+oOlWbBZfTrt25wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKF2EOY/KVg1ZUttAdU69qM+Wrbbu/1U6zoAX2suq28=;
 b=HiS8zzdOPd/ZxsQVujPkOvqTUh9jlLdk+6bWjO5ZHtlbtHV+4j7hOplNmlqqfMGnen0dHUu2CSyZ2na1sw5xuigAhRdniZttyrvn24N1VqY3SsfHRrn7OKYfrX5rApoO4GOi45347y6Ch3vdvLcx73u0AJcf17N3FuEGFVZMCbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:21:50 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:50 +0000
Date: Mon, 3 Nov 2025 09:21:48 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 05/19] gtk+3: add PACKAGECONFIG for
 libcloudservice and tracker; fix cups backend
Message-ID: <b39886c6d1d39e893e639a60e368249ffc95941f.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b42fc05-2834-4838-a37f-08de1ab2096c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UWsjUYm8HlueMGsJ0uCqG0VxijnatAPp8zwOOnXsGFpHm8Tfpla4fgGUiVA+?=
 =?us-ascii?Q?DQG6Hb1UqSmR8Njtm7aeRLDO43KT6woTL3cp09vHUfmYiSepP6igRz8iXgn9?=
 =?us-ascii?Q?DF93Q2+sSpPCYGryfb+3C6Lvu/6qikQkzNRMBsYAyWXB+m2pZ2teWtzwO7Uh?=
 =?us-ascii?Q?IToIc7DJrG7EHAlKICsZ7IaJjeLTn2KpHNG7+cjsFaIKeZAy3NQyr0X9ZB7j?=
 =?us-ascii?Q?uFUnMUn/q3/zD76X6TrMbotoX31UEvTgdviG8qZ1CseofmgeE820vnp1cc3j?=
 =?us-ascii?Q?BvcmOUxBcKJfqrpWSLx+kkq4EyfUOMV+fChLH6iXskw7tam9/vEqW9tv7UZ2?=
 =?us-ascii?Q?vNuPOFsVSz6pWiAZu5kxrzfk6DHJ+qa2V0Y6H3ka3IvAplRsdLuaj9KlB6VD?=
 =?us-ascii?Q?xLzI2hF2Q6CyDD5uc0pnEp9x8qTyneME6+SCn1lPcBRG80o1RDwsEEB7+aSE?=
 =?us-ascii?Q?6t/p5R3uDxx3UHVRsl0i9om/jTLuVoBmEhb/fycu7fRnU2HbeMiOheQBmPWl?=
 =?us-ascii?Q?V2rfEwCj9cUJbGxI07nMe3E23TB4vx+LCNZ4773YtcwjAjmW4zzJl2emr32q?=
 =?us-ascii?Q?nSoLWU0J86SIF6aUfzyMzcpZjoN9vDblj6z1shgw3iAWI1MhqqGOe+abpCVp?=
 =?us-ascii?Q?PsBzUaDqO2aHD37efAt8XS7Wl9E65CY0rf7wcqGB3B2sTTpUvMLCUS0iHYx3?=
 =?us-ascii?Q?NeB7re4xNj6M9xmLqt7fZNC4KzcllketTM7YUqCFW8N83ECcxD4WqpX07gee?=
 =?us-ascii?Q?VbyCuyzwwXr2Oa/kURrbq3pmeYa/9BOD8Ymqsvqz88alCHsCXz2kVw/5yJv4?=
 =?us-ascii?Q?rUhZFM2yW0rDbq/SYIVG0h4auWh2AuOKSnUdsvHBhnfa4+4LONUpe/EPmgKa?=
 =?us-ascii?Q?4bwl9ikfBlb6JwNttpREvG0P8WA62D7KFV5de5X6wXIX6WwbguIQY5H7uL/K?=
 =?us-ascii?Q?ZaobV607AhQOm7eS/r0XGACj9HpCxtYDvE09vTHIwgUQkL1a0yxm/JM44bPZ?=
 =?us-ascii?Q?qZ3EgGHuKXR8rs1WPo9pbfNPSX6/EqGotKU7V1RbXbpBC9N/sqnxBM/gpn8i?=
 =?us-ascii?Q?KV30EXgf+OI+1O1gS4Dul0/9GNzooBitoIytRjSL2FkTkcjgNJWfZl+Tinz2?=
 =?us-ascii?Q?4Yp+QD+iz3m6c2yHeOgO6vamWqlXBfLFFrGr23RgKsbmeI6jLJwCO9H/AZb4?=
 =?us-ascii?Q?iw+ETh5AgcEQMBhkgc2dXZxrofCzPHLp3VnbED15X8tfk65tqttPRixXaIby?=
 =?us-ascii?Q?y0sfMmlbZqHnDHQPQHlj6QRbLSiS5e690UXDz/j5HgeRg+vSxl3KjVNb3/QR?=
 =?us-ascii?Q?PkZblIdLKd6v2gBp0kWHw4z7xtrB/A3rKsbs778oelkjAUtAw9pr3OVcrG4V?=
 =?us-ascii?Q?El/LLxQ22HTMWpYtCTSeY989rUAMn6VaYj+bOYeTGrAY+hHnWOGjd5sGlEP/?=
 =?us-ascii?Q?zZOBfSU4saE06GSslleqvvKhRHZ2xEKF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M+mt+8vtknX0exvKwDguaahKOXmmZwWfQ0Hiv+9VYT/5IyOKQpOIAf4eIYVs?=
 =?us-ascii?Q?8i8Xww6oC9VlJzIU5sxDfLa0PxDyAM/vqKsHfo5LKVB99VPeCBvoQdTAHRPq?=
 =?us-ascii?Q?uv/ZIrzM8HBmopaiBawZH9hM0kAw2Z72MQ+emtaFqzK7JgdyR0ZZumZkMtgP?=
 =?us-ascii?Q?avn0siXuUxomXWpWi/GM7IgifQEoCHzCZdZj0CnKFIBr5dnDweZwbtTMaCiH?=
 =?us-ascii?Q?ePO8ysAVzqiVhedtSOr/yvFLQC/iZcLajBf8eRZJSsemb/2elcs0ezfC0qSP?=
 =?us-ascii?Q?Ibt8iSiNtHvC5s+941tCl8PmDymLGe5OzmKUYFmL6s5yq8qT3HxOLh9RNxSC?=
 =?us-ascii?Q?WgMxw2psni9EHgimkdAdofdLnH0R6Njzmo0t9ZyGCYSxul+GnJ9RQtLo3hIn?=
 =?us-ascii?Q?Z3/be3p18zByOUVmYuM7rUhfpV8w9ReFiQ8P1Okxtwp9eJvmuEtCKhC7LnE4?=
 =?us-ascii?Q?jNehdZpOIBuchhum8MR1BzCJpoEPGD+KZdUv7N91yFJaOFlmElvA+q1v6NPW?=
 =?us-ascii?Q?tk1wxfDG9CTYYsFdAC5knh5LPTCbo5rlUEzBCUmAT/bf3XTv06EzV1qYbryG?=
 =?us-ascii?Q?GvCiqjzTn/1NYNgzQgbo7Gzex4BeIUG2sRvnLO42HKKgcEcGI8XC1gqBH2VY?=
 =?us-ascii?Q?cE/TVUzIbE996oZFYDzswZP/Vtc69TfDb/X4mUyL9UZz7bJbB/uJKQbEoQf3?=
 =?us-ascii?Q?DKggtiveuYdwttJlpYs3TGY7vwQSviAnqIvtUCOUBfqqdHWKWIFYY8L+ly5F?=
 =?us-ascii?Q?kKf0b+3XODRXal2zULFcuoRf/z8MasNyrBoGDpuhkTkoaitKH9kJ5QqW02Rj?=
 =?us-ascii?Q?CEQszDSE99Bz5l44zcc/NbZH8Ritn8UWkAPnXXtNh23cc9EcDk3aUdd5laVx?=
 =?us-ascii?Q?uciqOFOFW4PNLhwXQUNqYCbHKdVWLmByryQuz7ltZ0Luh4qCDrYcUVQMnv4v?=
 =?us-ascii?Q?bh/oRBC6AN4iY1ksFcXEk0NmApqtv2SoClo+6RdwXlAd3HDK2B0WYGtzWTJH?=
 =?us-ascii?Q?IKZvZIEqIEE4LyKsIfsn7SLuZBKT9rHyNWsMa4adQvV5Ct/U4Hgqvp035NJA?=
 =?us-ascii?Q?sgxtvoE5nLE6EQ0NrRu87X+WXhMwuXmaD9Wim8H6rnq+oYcsztlMS/POf4AO?=
 =?us-ascii?Q?51x6XYTxfueCAvdQ1IypWuVaOoa7rbDBhxp0kHppdpXoG+RqGcSkL7W2nCME?=
 =?us-ascii?Q?W8SmwoCZll9WDL0LGTDBRWJU5VAaj3cq4ZVCAOK7ynSxd5/DA+LUdV+VMN2V?=
 =?us-ascii?Q?4PyZ1v32gF4KfUlt6Xs9dZCHg1AF+t1t7cJBoXNaJqymTm9PhKaiuRb+b+Nc?=
 =?us-ascii?Q?1A1EacPL7dZK+P9YFf6RqtjOgkBQI77pmtTUyfBt66TCYdm12uvUVtt3IogB?=
 =?us-ascii?Q?8pL4syLm48FXn7Z/eFY0qBanGykYYghbgLQ+2IMv+XK8/EXNoEy/niXjunBG?=
 =?us-ascii?Q?ywpDkYvUbKJLfTv4zGyup5b6uuvWhgdlUsWFwGLRPHxQEf5qGLMJPjvWZyZB?=
 =?us-ascii?Q?m81ERiPCVHfcainzSo1gPUAXIkmzh5TDqumVklt4WoKlGL0a6g0mFsm87Fz/?=
 =?us-ascii?Q?Qv6LtrHCwGqkTb2jNJi77QCMyAADN9B1ADMnz3GKFYzyxN45Cyx7Pdes3XQx?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b42fc05-2834-4838-a37f-08de1ab2096c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:49.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2RBnPJ7k2uWIvgPYCOt5q0B2Q9Eklvontw/lACn6IVvkUQET6KdBZKFxOK3Dna0XamYQ8uA89CYNZ/yLhN8LzaF9pZDKj7755rUwjKwiMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225619

From: Markus Volk <f_l_k@t-online.de>

Add options to enable support for libcloudprovider and tracker

If the cups backend is enabled, the mandatory file backend gets disabled an=
d
thus configure fails. Fix it by not defining the print-backend and just inc=
lude cups
as a dependency. Additionally add it as a runtime dependency.

Now, if cups gets enabled, it should include the following print-backends
by default: cups,lpr,file

(From OE-Core rev: 5ac88d032968f4d005a61fc34f7e3e6e55426ccd)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 2725d99b79b4caa9b301d206a2b1a7851d2b74cc
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
index 1d726b5696..8d01e6077f 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -41,8 +41,10 @@ PACKAGECONFIG[x11] =3D "-Dx11_backend=3Dtrue,-Dx11_backe=
nd=3Dfalse,at-spi2-atk fontcon
 # this is provided by oe-core patch that removes epoxy/gl dependency from =
a X11 build
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,-Dopengl=3Dfalse,libepoxy"
 PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwayland_backend=3Df=
alse,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wa=
yland-native"
-PACKAGECONFIG[cups] =3D "-Dprint_backends=3Dcups,-Dprint_backends=3Dfile,c=
ups"
+PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
+PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovider=
s=3Dfalse,libcloudproviders"
+PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tracker,=
tracker-miners"
=20
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-c=
ache-3.0
--=20
2.51.0


