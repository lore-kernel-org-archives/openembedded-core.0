Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E974CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3967.1791836854279821221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Rtddd4Fn;
 spf=pass (domain: est.tech, ip: 52.101.84.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9FcnN0Axz7wmCdEfu2J2QfKPydRRxcLslEDyzBQE6m5G65z6z/PFZc3kbs/zMWKGrpB5oCjtQzezDq2gMbMBigYr6rhOMGC1DMKtdLoC+vPezOGdO5wP6IGzYsEwZih7O+x3vSlcNpe3i2qUevrN7Ie1amD2nWLw81amQfFdgBf61+C5ZNy0nHSk48RLkklAN1/Z8cFxfK34aNmTcvgjguUNyCvdE+GGZkxzSthTPCDsdwjfD1QozYt7bk0fEnaW0xH7CMIPU3ng+ittmF8qhudevnx7T9DNGp5fYY4rLdcqDM0ZF2+f6suPUIgspHilcGZSGOaD881CdqAQcJc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWl7w9cGSz2DlLCKuxWMJrPMT05C39vxze6FGiXPgUs=;
 b=nVwUJIzeAisZlsg26tcEzGC4A7AZhA6nhFPCtgGFFI1Ka+3P3WStXxpTVajqa09gwqnloqWFr6jxv0LSXNvbBmJ+5p/qWDpyEuRZ+AUQnTpfqrFrnGuymKBl/1bSV0gAB4X6T4/A/rC7k/lSDKRZGGfprhpX/Gs+jhn4ZbOo8jag3CjSDTDBIvZ1W+UQVf5cZlmmEjchtvnSLoKGQdfGSi3eb28DiiHB4u7NMTDhrMnR9suDt3oaLRJI/lOeQv4Fhz3PDA/dQRaqeVR59yckRUpYS4JfS/HZTrFGY0gVp/uocxMo4gITMQwOH6hAXF19Y8rv0KKYRZwYTi+E2pcOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWl7w9cGSz2DlLCKuxWMJrPMT05C39vxze6FGiXPgUs=;
 b=Rtddd4FnN1QAdtam43n3GYYmWlSVSsfDBcBaGyWYsmhIWit1xD3h/Xpk+e1g3g8yyFwIVJf7B5iF/JUuCCdRBwaT+UmKprqAmSynw1Jh3iLvfsti4A30baaKJKteV539GT2hmKEhUXQxlRtoK6FYowtAAW9czJZta5bPjMn4KqLx1z9PFlpaLC2IO5oRplb6vW7Rex4ndSW154VnydY8WLUnDxq+5BgCHkx/BnAauPa1dYrV0/9pbQxY8EQVIptmK2pbn+NmkN7loC09/wd7Q7+47XOX/v8rjQ/XDuV/og101zwLGlWAIk1haiALsVN6kU6hN8cTfvrgcPOUh0TKlQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 10/10] gstreamer1.0-rtsp-server: Upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:16 +0200
Message-ID: <20261012202716.38597-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0014.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 38054eae-ccd2-49a3-d3c1-08df289f3f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|12006099003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Dj7Uwei7zjctvkOTQrHEzhUZoNU9ns2MDSD6SGePpZ+oKcItdoWcqqCmq1LFkkbg5NKCsHpjp7nkDim8t2uxmtkhV0Xzd+S8akj2amGWdQPgc+0ZVbKsMvAQpVTB5EiEmEATdRGg8Rc4fbNLnTac3vgKmG+5P+Li0C/+Qest8tBYagu+yu/QvAtmBsmI7Zfpph8g3sT19FPd54p/1ZAcmMCmeffO8MeOgGZAP2i5f+8oHSXtwjEpmdK5RLlV2vP5i2dH5GInwPvJriHD2m2R+e+bUVRAtbJFx7De2YZHKr8JJRaexzYhb5oiBRKwOWGv0i74KH9iCshXrhGxkqUCWGBnd4W8CNBKrfsgZHniWeGnvYo6brAo3sgl5yadkNa5i3scDMQPIcoDCzKlAsgIIyUl1ds9XaM5LHFRA8SYp+QA6hBuaO9gdsP0VqJuxxSNNpf/+jZtcjkn46YBZR7DuGpGOlLRYAKMylx2C7OaAEkxS4iln/49+qqrgIi3aVv4nn0kR4LMRYVI66KvmJraTS//h7IG0GZr4KNMmNPQKMrILjfK8pTrJz4fV6ESQ2JvfxAt+qa39ziX8VlQtTxgcvWf3CVpiY1fNdo1+pOB7zc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(12006099003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tz2GOc2fKiVTv7I4seR1inPgpSZVVmN60EPpaYW2FQCUvG22bxrzSDPieEoE?=
 =?us-ascii?Q?Z2zZk3H2VHF1xeDoHwAdrtCVRNde8bDw3cegesfQ5BeZy56TmtQwGS70kW2L?=
 =?us-ascii?Q?iuh/bRgnB9SY/xDWdmpeGwN5xQqGFQJto/LjNhuUABg0GEpzAqZZdBBbSx43?=
 =?us-ascii?Q?ltY20DMum03544mEYauQQPA2I3w9tfCw7kGuPU4aNEyJOHsW2v+L4a22voyX?=
 =?us-ascii?Q?m2m583CM7FATMjup/s36mHnsto/3ah7iuf/Ncb+mFe+GLvXPXSv1ubq1IJTF?=
 =?us-ascii?Q?7elgUbtVWzuH5OG0Lw4XoOWk9/IXYEDooWMuI0jSI7nvlomtKfRcpq0YVYRm?=
 =?us-ascii?Q?AGRNqa4aUL72AfpA9etvdeuJsFlfxd/iH++DSriMc13tQ6/t5jUSpD6n8spN?=
 =?us-ascii?Q?x5izcHveDzUuQhSJDrLviDzbpyLiYsoSQxm6f5Dag2BQCWK3HAk2QQ7LuPUZ?=
 =?us-ascii?Q?iaCSyqn9EwWQH2nCboOB8gWhIbOQe27xHvCtMfESagIytgG8I6xPC3vEBasO?=
 =?us-ascii?Q?ZSzkZ+g+3ash2StQ+uvIS7PYb1z2IbLPT3k1HjTUowsRvSBdyjrpkgljoFMO?=
 =?us-ascii?Q?HAynFGwlch9Pt6tMDE2R/euKSn2nI9RP7V25nR7xPBqw9O24lUYUPBrici6G?=
 =?us-ascii?Q?BHcqUZXkyZyHr10XTeyW24MTz3hoAsyxVUhdjQ06QMmWbIUWjWlSZyoTuDNl?=
 =?us-ascii?Q?JN04LCK4aOJhxhYMlS11IQuGld9vgS/ZA/AXPEWx/X8rDWIV+CRz8qwTBIWM?=
 =?us-ascii?Q?eEthb/qcWfMlJ6Xn6surDbNLlczVwTame+xPjL8rnGOu9ERflD6WuVEiI2LU?=
 =?us-ascii?Q?LAvSJeH/kAGJJKV0dQLwpsp9Iv+ag8zR8b2GaTxsGo93IkdeGtpQuS1n1Y8p?=
 =?us-ascii?Q?35WzQuS2a3Zw7xv5dSmPpRY+YIXhbCphS3l2fy6qQjlQsqDrnmuhxI1+3XKN?=
 =?us-ascii?Q?ff0rd2L5Hk8IPdAWniASwvo8EKKAu26sULCXO3LXVeHwnqrW9z+BY/pt4UJc?=
 =?us-ascii?Q?mhddEdMZXclZv6TYJFSCbqhiCFz+jatGSMkDno9jUobVK9nbOYU/5Qwc+WC8?=
 =?us-ascii?Q?XFhy5bcPx9UCq+PKCRSpM982pkv00/PKiFwMiA/iiwv9RmTiWozHAuUazdsL?=
 =?us-ascii?Q?hPu9n4MJ5NNpNL0kyzPC4FN406fCnhczg2AsNKhEZ1ohVeSbPeu79sL+aojZ?=
 =?us-ascii?Q?KITb3zqijKs1SfDNo/uDnd8zJ9EAoVSEzvAnFnPFRoduY0+aVwwsumyL4afX?=
 =?us-ascii?Q?UZ45yUXQWzkbNo7knQafQCn0KQe/D0hRanP7DUGgcMjuMJ0XjdMWIo5dj9h5?=
 =?us-ascii?Q?CiGvTUzTiZCOHdkxeSdQU6v9L6A3J6y4/KfHrXpMHM8RycjZgOtQ81KOINvn?=
 =?us-ascii?Q?f71xHzhRX7vrKGLFHQXm735pHRKOC+piPpeF56qEB4s7t22Vn3oyRLvKiqLb?=
 =?us-ascii?Q?376wtAVM3u2G2VGkNQ+2Xw8YBGsq+t0m9vmAmmbSxv5v3Xa6s15/v2/uqF6h?=
 =?us-ascii?Q?RwjBaBn8lncWButyvhv7J4Cm22ZYllWJ9fLzwVFvhBG7VjJu/jiMuwNcy5uA?=
 =?us-ascii?Q?3sZuW3OkZ1gfKsmxiEd+ZwRDHG6RCitUMZ308NeCq+eokBwXvluqb/7YJqwX?=
 =?us-ascii?Q?jmvae3i1kg6n5neKJtJNnbg6NqHizUaboEruqIpf3nWvcSxfVzSXLEJmrt+l?=
 =?us-ascii?Q?IIT6OBiFmlKR5EAJkTqJ6dN+p9tWUR/FwgLTks60WqjEoonsx41KvhY8Hoas?=
 =?us-ascii?Q?AXjJT1Z7pg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 38054eae-ccd2-49a3-d3c1-08df289f3f27
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:33.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1r5VklJTaFalkNtSEGsQMD53UtPgpyLpGzlFbx1olFRnu8I4+Sl1JHOcLNF+LzIieN5/JJAOADEWLGyuJxIrqHGnW0c4Sq7vlhc8LsdMFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247685

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...rtsp-server_1.28.7.bb =3D> gstreamer1.0-rtsp-server_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.7.=
bb =3D> gstreamer1.0-rtsp-server_1.28.8.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2=
8.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.8.=
bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28=
.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.8=
.bb
index 9c5ce9e59c..36c3f2f9a8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.8.bb
@@ -10,7 +10,7 @@ PNREAL =3D "gst-rtsp-server"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "de43a59a0c89a14eb1c14ae8e81e5b45c4e9d7b1f930b0ebaa=
d360f9b5e0b5c4"
+SRC_URI[sha256sum] =3D "59181ed21a5bc0533fb4f77cb7bc6005d89365e834b0c1294a=
fb9ab5f7d96fe0"
=20
 S =3D "${UNPACKDIR}/${PNREAL}-${PV}"
=20

