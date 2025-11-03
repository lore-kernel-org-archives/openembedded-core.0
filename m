Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51C4CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16045.1762158127551463229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=QjE6wQ2U;
 spf=pass (domain: navimatix.de, ip: 40.107.162.85, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poAVWsI7gV7MJw0HAIjEcr5GAdoTQRoBQcTGd9FcU3gdkLPdpr8BkWS/hMblxsfTeVSQzsMQN+rjbVa6rCDEvC7AN2j1VjN7DSz04AAvW/UgxH20jR32aA+2b/UGaqMY2wiS53DK8607OvnzGINipboAHheoXGE1wLAj4ihRBJl7bGFBkmQd3v+ilkh9Na9lAxgRVQva0jshki5IxT9APqPryMK+f0/t8QVk5qQmW9h83rkXpPxfYZPiKeGm+OH2zfO+Fk0NnJIfdL7Z18FDiGNyDzrPxWu/+Y8HmHEN4BPz8b7JckNdApWKPSavoxr7tCz+VM8zBsh04yPgOqH5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lndfZajG/wrRofdJfF5TxnmuYPqJs+nhNE8eqaAnar8=;
 b=xA/8LnC1MysbvPWZcjFtL1ZTtWfkHtqPgBGgv83iKqzokiFbj7SzzIRfyWZxGPGywLMTce6TvWNt2orGSZCA16PHBeFOR49GncjNOd+hMFngH3+lILdqW2Mx5YhzOjDIkDsUeyREbP8nIYOGvhpBSvGe0+7Ldwt4lofG+cCP15wiDOou/1qklz40np99hG87FmwQY7BrgNaWm7FdMCf6G3nF3En2Qjk5ITpca5bYihBvJuPim9cXX4rg4k/O2+JUIe96mvbrptEZ8EBPA3pW+VCQdBrsUq4/o1dDXs/wTCJ1RXZEUOaqpnza+W4eeMzmyJdBb2HWbytmsAeMR//CYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lndfZajG/wrRofdJfF5TxnmuYPqJs+nhNE8eqaAnar8=;
 b=QjE6wQ2Uxmh/6aGcc1nY1UH4+QiOqDTmLcXKdYDqwzQdIrWrioNBwEc2Ugv1kUenwh3PjSlseFzPSelBLF1M0+9g0Ej9nqAnbn67H1dqRAuJZUfHfm8PXAXKUnajAItEg8vVEaukdI+Q4emdOpSXU3CWEWnch8qe1OjdLNFTMQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:06 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:06 +0000
Date: Mon, 3 Nov 2025 09:22:05 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, wangmy@fujitsu.com, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Wang Mingyu <wangmy@fujitsu.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 13/19] gtk+3: upgrade 3.24.41 -> 3.24.42
Message-ID: <b26728ab4f9b84d0951141fa9779c769b1d82435.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e5e155-8eb1-4f7c-6ff0-08de1ab21325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Cq1wCZue47qpvr1QCONN/3mxtvq0ktVZJU41uj0lywrKmRVaTMvjiXZgoFQ?=
 =?us-ascii?Q?+phvnbl50m4XSkFiRBIwjjSxG46V8K1t8CqrH7lvxaBD9rDe3Y0n7Eunobrp?=
 =?us-ascii?Q?QoWND42gMNwHwT0dFz10ktC42pjb0e7vBlNpeHzzBaKOyuXA7FIMXrA2HinW?=
 =?us-ascii?Q?MsC037YKxUKVxGFRK6rGzxvs8U5Kysm5YGlZKG1jolpnYaeBGb3uVmHIEsD/?=
 =?us-ascii?Q?NTMi6OeXhzZTH9wWUSJ5gxCZoHKvvBdcIjAL5RLRJJJZINUs7tx7XW6rI9VK?=
 =?us-ascii?Q?AT6Ieok2cJ0ePBFsAX7M7alKO6Rw1KKUuqucKaMw9qheONg0/7rziX6HLP2Y?=
 =?us-ascii?Q?jslS42ns/N/y8ROD7iOCElGbvJzXcUq1eluJMN23KeCETRA0jVRZu1XQ/Wij?=
 =?us-ascii?Q?pLDIJ9B9VoCI42ES/wlI4+sMXwxZyiI08XotxREciiIZzpg88iWKzfe8r9dr?=
 =?us-ascii?Q?ti8gbPHUWEobOlI1KZDUdz3tlLU7oBRA2VBIUfbjrukY8cJmN/ArJeJecj4a?=
 =?us-ascii?Q?sAK1Pz4/B3lzu8m8J/eCEyscBZl26i/oxrxbVIbSEbjgxowxVGAyiEVKTjX/?=
 =?us-ascii?Q?ObB9ujzyzLEnmvNlwUbByBCVgWTNtVNaUL1dESPePATD+DSV/zGs3KnT3O7c?=
 =?us-ascii?Q?j/Pi2PR9w4cyIYLGYcnWNJWAx6lf2kmV/Njwt8dcoU52rPPgReMM1nta7kzI?=
 =?us-ascii?Q?N4+efvMNn/qP3z6lDtk2ra3sjA11iO5OBE4HuG353zQr0wWFF/7z973RHUKs?=
 =?us-ascii?Q?gB20E4nowBWsVx+bClJbfjQmIjIBKd5VKKtEMUwCNNONmWpGpGoZrnrO5LWN?=
 =?us-ascii?Q?65zC3UwDY47zMYtnpUdaLJPgT6ZZC5w9NZebjAyGEWSZcnh4p8a9SNmZfGym?=
 =?us-ascii?Q?yMyhpjVyWDXTpTAmPzmt3ZU4lKpqzTaV195FN/27Lan0gedw+I3HsLkQqEO4?=
 =?us-ascii?Q?vV4dREp+N5mKQWgdZVaqJ/jHEq9g5fDzULdqvNI5hlsMmOY7FkRjsO5Gs8VS?=
 =?us-ascii?Q?a9Kpjw+r6jI6V8y3somtd5CwKEIq9xoqvfFuC5j3adfxMCTClXmdsW5VQFcZ?=
 =?us-ascii?Q?idzJe/WVbM6b3M59IgfTLeWfH3X1TQ0jsOp1btFMUqnN4l5n3KFDAfl78RVu?=
 =?us-ascii?Q?2OXq2ao2PxK9sE8j/6x/5sZG9DZ0fflJCU3vy3IS03Ca2lOoL+3wXSq9FG/w?=
 =?us-ascii?Q?f+Dr5hPBibe/Zncp8B2xi/IX4hDEFFqzBwBw24WYe1CCWBin8b48LSMg9NXY?=
 =?us-ascii?Q?JsRTcDgha/sKVE1yYK3xyLeSHyW0LnWeVq5Ocb0dqZ6T0FXVRUnhXhO1q4XK?=
 =?us-ascii?Q?w14TJfBn2vdNdv0HE8ZIWKc/geNxTT0E8/q8u8d58OMyfzKr7dDujmvuS71r?=
 =?us-ascii?Q?Tphc6HE/6kFa4zTh88OejK9xRtz6HW6vk4sOncEXpaZ7zGqB7k/ZMDDdNTR9?=
 =?us-ascii?Q?UJrpBY4Xwx+bEG4ouB2sK7F7K4sYBSDC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0ioRLSCiRvMipIrLUeOojsRNIj24nPJX4qrb08uu5e+dcgMRf/XVaa/tLZKW?=
 =?us-ascii?Q?OG55dmCcRBCXuyd65MwyFztX+Bst/P3Z92PiiVmSptgfUTs8dCJ3pCiTgrgm?=
 =?us-ascii?Q?tBNn+LuhFkZtj8KxEVPAF9bumVdwSkZNTI9ccRXoCYkFwOfjP+0GqtNpSRy8?=
 =?us-ascii?Q?SjvE9wp3mWdBn2WeEkM1k2PXdSJH1IGo2tgsgpXVRmXaw6mWVqfGXp/jExQT?=
 =?us-ascii?Q?UEyVJdMOZw2SdCtKj0Zt83bbu0xC9P1H73gaW0P2hrj+/7ikXaNvCH8OySu3?=
 =?us-ascii?Q?PWwAS1NrwVEF4cMg1MmsUDMbOLKvYXEMJs7ZKPtjEXy/GjDdkBe4XcfpenlP?=
 =?us-ascii?Q?AWYyqFvXAuq208ikTDGwVTPf0ZMsqc6x2JMEuWzsrXw74oeuIvm9Bjx7e9MO?=
 =?us-ascii?Q?h0NKyV7NB9XtHCZWvfeDBuZaufrT6Ly1gyPqK1T1xe72YO4oCpGpX747axBm?=
 =?us-ascii?Q?3d7SL0zt//Mu/JF2Ss29p03cmMmVun+G9EXsosl3jzELf+prUgtK2GsA+DPN?=
 =?us-ascii?Q?n6GDZCfuYkXS3FJBQyeuO7IgECyU1AM/2Vd6G8vRo/IGd4LKSmI/GJeF6Dsc?=
 =?us-ascii?Q?jLFqnSO/hHF4Sfu4rj4uUapT4gAhNq59kT9939dzCohm1cbsD87EvHprTe4g?=
 =?us-ascii?Q?8zeincrICoR5f4M2xcr4fULGFYXbnMZGJOdZI5fFEq6R64ewpxJ0Oh+3dS8W?=
 =?us-ascii?Q?/3VZVe8y4bh6TpVCkCWPT8sdRuqpJyBILiUd1THVgmB7nOGyGP+V10nFT/AZ?=
 =?us-ascii?Q?9UOTcCwSJoiDh/8Bo3gu6WRy2vwr+iNOHHhLYMtytX+6gGN9WI+pXNdNK3lY?=
 =?us-ascii?Q?sOI2MaFg9dwbyi77OsqREnXb+107AtcSZoQuhV3o4HGcb7zZ/5Exuts+CQ35?=
 =?us-ascii?Q?MyF3VaPfsCwWSxz9v1tz01kHf2gZsrYsrYT5KopxCRO/Nr+4xOlYiyX+TvM0?=
 =?us-ascii?Q?yGmz9H2J66/xNiTpIDJTNt7VD/YYy8qe2+zEqhdtzvsUuFc4+/ySZTUajoPz?=
 =?us-ascii?Q?pb9ez/N9YpAEDvd4FKvCbd5DKu7UeVeC3vTkFoeRNLZPgIEOGmllaaoC3hi5?=
 =?us-ascii?Q?PnaDuKPQJvai3cIV/bTFqOJgiJxLRWWN0FtWB+OcjYv6+0qz7QERVTCBLd/U?=
 =?us-ascii?Q?a5oatJujyJaBzgisUlCv0Ejl663FnizqX75CdEhmoE6S36vYJy7uYL6mIeLj?=
 =?us-ascii?Q?tDtmM0gOJT4df8aRVncxhpBwipIC4NmZ5yGCabEDju38VRa0leSoaM5OMnFM?=
 =?us-ascii?Q?mkMz5lRZSv0Z/P/p1yM7ZKnBde4s1pdav5sR1HPcLRLilaAykHCHOLaYMA5z?=
 =?us-ascii?Q?xb4kSBioEtIAbEDdX1Sgmo/+d3fxALILoZZlsnKV73gvYw3C9WlLzuGzcBNj?=
 =?us-ascii?Q?ruNLzSoxuMzgmu7eTOMj4WSdXLBrAVO3bTRLHA2xKQENSS9wx3LJ7D9RMRnb?=
 =?us-ascii?Q?C/spvHj2s40RvisjCvYH4/G34WinR2vkplq4q27yrQDXo1DsSG0SD/3oj6eS?=
 =?us-ascii?Q?r3wOh6v7B92i5ynLNFMY4jXy1iPEsMtrxi7jJPBeFdvtqKKPKMq/X3G2jkAL?=
 =?us-ascii?Q?2+RAF3ki8PG8bgjHPpn+acPD2uL4fcDrZo3x4aChKoQkUaLn/3ilwBPo2rZA?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e5e155-8eb1-4f7c-6ff0-08de1ab21325
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:06.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVwiYPG4QGib/prtVX+ZbVYfEDcGjy+OUn+aSk763OdPlFtXg/chGxeyssIDL/MYhq0SMD1W+RaPpdkqZFAcvSHCNDA9IBQOvdvLKhgHr/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225627

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* GtkFileChooser:
 - Avoid warnings about floating refs
 - Improve performance of recursive search
 - Populate search model in an idle

* GtkGLArea:
 - Fix a regression in transparency handling

* Printing:
 - Avoid accessing freed printers

* Accessibility:
 - Drop support for the deprecated atk_focus_tracker

* Wayland:
 - Fix monitor sizes
 - Fix a crash related to tablet removal
 - Infer resizable edges for tiled windows
 - Always commit soon after acking a configure

* Windows:
 - Avoid committing NULL strings to IME

* gdk:
 - Use css cursor names as far as possible
 - Sync DND cursor use with GTK4

* macOs:
 - Fix cocoa pasteboard constants

* build:
 - Allow building against sysprof-capture-4

* Translation updates:
 Georgian
 Hebrew
 Kabyle
 Persian

(From OE-Core rev: 2f4cdc1ef16f1b86f5632fded21792d71d58de16)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 051e1bd593cb0f7c8d47cbb3953eeaf8fc0f8314
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.41.bb =3D> gtk+3_3.24.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.41.bb =3D> gtk+3_3.24.42.bb} (8=
8%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.42.bb
similarity index 88%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
index a9b2065683..5612e50e8b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
@@ -6,7 +6,7 @@ SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${=
MAJ_VER}/gtk+-${PV}.tar
            file://opengl.patch \
            file://CVE-2024-6655.patch \
            "
-SRC_URI[sha256sum] =3D "47da61487af3087a94bc49296fd025ca0bc02f96ef06c556e7=
c8988bd651b6fa"
+SRC_URI[sha256sum] =3D "50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a947=
25e2de112377e2"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.51.0


