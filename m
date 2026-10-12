Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1655FCC6B03
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3961.1791836843813899989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EeydxJAL;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X92og8yHl0ssqd+I/A6IXXaLl5K1fJ1VjhckMVtU86MktTGPsRgfBp8MNeIdwxeCQXYjyV7lclLJgIJJLUwr/5e9C6tyXqE/7K+i81yGJrblNbuZt4nJ/DDgFkJSPDy3ITSVZIaZ57DZiqyjs0oyadtGQXedE6oEwgVQxDLHG5a0WzlfRlxt4kfWMC7AQBzPDardTzUlD4AexecaEoRdMNFkU0qr4QJuP1MG5Kaj+iDYbgI9NeZi15FP5eyxJTSS6QSjFohpBGljat0s9Xl2qtrjGkj1wxN6K1l7jfHfx0yv9I1KlEpeuhW2mZk2KDqEJFkIIrAG5I5fS+q0EhRmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpZS0RK8LvdwZ9jQdS47KaRtGSJ+I0UfoNOBf5ssyTE=;
 b=QiMSCG4hfGJHqhW5uWmetgOGKQzT5rg+Cv4R/FCgDIGmjwantHqjTtj1RCz1uvQMRSnt3IswBWaFxTVy6jJMZP2DUzNqrLxqdH6GGp0rtOGw8TxA4xWlDsq6ani5CZEFz+weAZefYuKkWmfS7d4CZTZX0pnvovecM9fS+I8X9LVsay3VxkQqBNEV73W+xv16OifWiH+hXHl9viXv2hwUAvdA94hOwlaAtbmc8LK1UMt3EGWK4KORT26sjOOXGNE1XOyLE6oXel7lXO2ecuNGPbyHPGlFpzomOjRYwheXfIcUwEIw83bBoXMlJeKOeXfiRssqLITRIwu5+nC4UrfcQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpZS0RK8LvdwZ9jQdS47KaRtGSJ+I0UfoNOBf5ssyTE=;
 b=EeydxJALueOt0a7EBqRVOpO5cLaDF9e+WE2nXVTAFmtnXLsba5Kep9mhZuDXlELVRWUUo23NAnthat1wMU+mNHZceAcwzf5LI/jFmLbTLMfYuCFNR1t2/iTDClhPWEHisj3fSEOQ/gG+binxBnHf+7ganRZNL3tn7LY9qPdYwk7gKBAGzAPyxMR1wC2fLK73g42ETFiazdwh64HCDSRsDcurqFWfPKTLceTeez8zNWpuyyUnPG1Y3u2Ts5nnCvti947hexLQIkUTHjMSPmdYhAiShYxLiHiRVb4Cu/JXzdRZmbBfC5i8KWquNsLP82eBYta08d3i9zkCPgBHI5HRtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 05/10] gstreamer1.0-libav: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:11 +0200
Message-ID: <20261012202716.38597-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0046.eurprd04.prod.outlook.com
 (2603:10a6:10:234::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8e44df-5ee8-4a6b-5bbd-08df289f3acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|12006099003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	nzoS/JklmiiF+1X5QJpJmyqnkDUpHZiwCA7K5IZagDpgtAEhEGSVHpwB7G5v6jFVd4bv1jqGMDI/pNrjRF2303CeB0odK+NlS7l5X3CZecuW0j0XE4OGulClR5R5oht4n7z9fr7FnHpdDKlPlM7JDbwEvPctmG6EM4/AFrpkUf/DxM5HxT/Ly3DwZfi+R8AxvL6FUc6SFaUq4KW8/A0RT29kOnqV4xhC1lczEqMgGUw/jFINyJln0qg4KwoQJfMmUiIzqYuYeAzgWkGd7qHDbufxWw8arxbazT+E5mvVkIDhkBIGBJWpX0lCg1KBvoM1HKDwNXi+6eJ8IsiPRLkAd0vzah3YPGZ/fDMIXGTx+3B3gS6sqUyBTGt2zIZ6CnguNpztYAg2gxJz/eiRVRFzaaSg7uX0maiqhvFF8RLkVzDZXfEmvGXfimM6zqR++mkoRpgjL0HlyE/p7PMicYgWUh6jkBzuwkn5Sb7tKogDn2gUHCTglsDF5+vYBjud5ioDB5Z0vBhTXZ4MwDWEqCVwyi0ym1NYP8fQj63Ucrw5cM9YohcjUIL/14MT6WsdnVF5FSJ7pEpF+olBhFcUr+EhPjMu4a2tIF+taHZHIX2Dcaw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(12006099003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QV1DBhTL9Qz+q/N0fj9r9jp7tv/tibhgbVbCKeC15BTRc7oYo/+O00YmhQeq?=
 =?us-ascii?Q?6P/c2UqwnKhSrJlfsH4jLT0BVjMLtwh4r2ceY670iEx7xpIsBETtMvvfqMT1?=
 =?us-ascii?Q?tU7molHMtVfWVwPsyd6hOPEuFmsGSuDja/JL5A16M9g1oJPTw/2ISynNQ+XF?=
 =?us-ascii?Q?amAtrxrvSqvHR+fmvLPHwOcMJAqWZX48b/LoPyF49lJkzhTyGpjND8NAiUra?=
 =?us-ascii?Q?55L5UKkO+ZhfErvPka2rAnAm0fDKzNHgS5nK3oa64Bd59DepjHoM80RC5Rld?=
 =?us-ascii?Q?M8bop/oFkR5dI1nwGjXN9p0wp6IttPKCu1AsHV1dnDIf4eVw5SFU5ji9UD+4?=
 =?us-ascii?Q?FKXQWMn6owMyRb16ahod8OEMpH8F0c6iCjuHMQVBMKL0WXxyQ0106exoTRhW?=
 =?us-ascii?Q?QM1k67uzsY70DJxOr4CAh9orZcTZjWgdzsAHSojb7ED8ItfVNveerVy9g2hC?=
 =?us-ascii?Q?VPCwyYIkul4djT+T3OQSdFlAwo4co1dRbLqvltOggxNPGuwFW9YkKNN1TE1g?=
 =?us-ascii?Q?XEg4wlZDRVOImw3H2etXe6/mJ8ZVDTUGoz/mIJM8fAdnjnO+bPgMJeiOcPK9?=
 =?us-ascii?Q?fvotbW3bgOtXl8DnrEWnlIowr26BZOmySnzKgzxRla/rhTcv2CDqzxrLRmCP?=
 =?us-ascii?Q?79iOncqev2FLYjj7mkRAa0TT6HTKk61RtRIDYjZm+HswpnfQQXe7UIAe9bva?=
 =?us-ascii?Q?bKs/4hP34WGsRffZpKA9N3pa2SOiCN7X3O2Y6J56yKNZroiM0f2OWetodkCB?=
 =?us-ascii?Q?/gIEbfCdZtdFBkEuftxuKifjOZ8joBaMd7w4MBsTp6tA74b37TwHZj8mMz8L?=
 =?us-ascii?Q?xmISgvOESAmZQswL9r7IKlOkCNouV9L094RHX7MlT007dFT1kjYvjmZJFBGD?=
 =?us-ascii?Q?po8etJdJM37uE3YMC1VnHQjF05AumDdezOrwCam5l5klIpVjxP1oDhX0Vvge?=
 =?us-ascii?Q?rHWlf96eD1wa8SFP2ZoqN1rLqWLgE+zNJuws4nWCSAWd9v80hnpo2aQ05cOC?=
 =?us-ascii?Q?hgyKPIuCRCd/kFZCkyvPEuQM2OwhAMmsF5R8Xq+sLI6B4k3rNBbGwFlEGJDU?=
 =?us-ascii?Q?aYnUoDI0PbjMo+t/zOnXngyI4qhDLP1RVuLFchOvKJ8kFIZi4ZshJHQA1+6t?=
 =?us-ascii?Q?BZGwptPY98pWT17I8QRuIpnZrdbD2ZWTxDCLKEHAfh4wjAX5fNjgIgoQ39GR?=
 =?us-ascii?Q?O4/V/E7E2TgyyP3H50twDqK9RhxoIw7TPxt0cNYFxDAQR+H5EJynw9Wh52sh?=
 =?us-ascii?Q?BsAgtxDP+ndhP/9mEMiGLeDwJXQE5vSbn4GuHKISI8UZ7fVoI4jTkXvV8Bho?=
 =?us-ascii?Q?MnyHjbkdZuMG9QW+Jrc99lRBu8govLbqcXmR4+X9QZTLQGP4W35hZU7j4g9B?=
 =?us-ascii?Q?cHpvgFpfYN2R0uQWcI7/DqrQzRqzEj1nO4c08ek/rVnVtsJFSaWKp4UJ3OwS?=
 =?us-ascii?Q?b0+ElHz4wWSYYDE6mFULGeTzUV63D9wAtDV7MJJziZRJvJ1dde/WHPJWwy6c?=
 =?us-ascii?Q?GuR5pMt7WxPhaW8nN76CXZuXw4g6J13tNZPPdcZyJdjLn5CSPgFb9dMrbuXT?=
 =?us-ascii?Q?ZX+9GlgiWtbavYWPLi+yehv7Ac0d0Dw0+J1poF5DeR1SjsVSPk4IUBmDA4yn?=
 =?us-ascii?Q?2D/fDtaivC3VnhKyY6fOuRD3yXeyzQqL0Qj7MpK237F4aiQk8WExaTIpjupk?=
 =?us-ascii?Q?2YzLgGz6Snd1qwTRNHWk5sv64eEmJtMUz68yYwBpZgrQXg5TzoqAzymLcvtV?=
 =?us-ascii?Q?Ci2isfun1g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8e44df-5ee8-4a6b-5bbd-08df289f3acc
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:26.2324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAGA7j9/W1ubNdBt8uc8gewceWajc8nGOxZIvw4gZIfpOxE7+m61hfzKGajPv2fFN7PVRuNwJaDyZJ3NY3HhKflhzf8Nauzr6DzMT6MO1rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247680

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

  - Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...streamer1.0-libav_1.28.7.bb =3D> gstreamer1.0-libav_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.7.bb =3D=
> gstreamer1.0-libav_1.28.8.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
index 0eb98da021..22f071b17c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb7=
7e486cc36129f7a770 \
                     "
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "58da51dd39ecf1cf6faade34cc6412001be2e2e145bca8ae0f=
45336f60a36ab2"
+SRC_URI[sha256sum] =3D "98ad3d7f8932c495e268708903f1c3388d5f26a0db34727a9f=
861ee23b724177"
=20
 S =3D "${UNPACKDIR}/gst-libav-${PV}"
=20

