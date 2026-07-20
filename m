Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F7FC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:10:12 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4343.1784535003356360861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=UD1rfyfv;
 spf=pass (domain: est.tech, ip: 52.101.83.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcuK68ObVUcL5p8ugHNWRs/GS6jcHk7FesecPXl/dwo4xqbVcV60oqbg4UtbP8cvGFxs0hqXWltkeWR11yvVObRx6aPxivw4oIHPi8loeUaBezjBaGU0WFoM2flEXFpRInfhBXlvtVzE4qOs/SibRnGPf9CFhzFtPWvsl7kMwmS8BmtHO406hZsezBZXUME48+EXiTZ8Nj9ONixuxo/0eG5W4HXUT5tWL3UzdBz2JYPCJoFo2LnpMbb80O3hT3JiiWw/Gjg1OJzzZ0fbJSvMsK+2FLw0DVJFUuWMIlQnf8mIP4foEoYZ3KpdA3JT86VodRb57uKnSdSHzLViYwnnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZqdHVZSRIKJ7L2Tch9Paw1zdu7guAHNDa4eHB02xz4=;
 b=pQnS9JtA4PDlIPsiLh1EVPCmo3KZ6792r3Yv4Jz1lt/51NLuOuM6Juj3zlZ44DuX5DkdAhu0dBuT7lRHy2PN9RcVaXsYRg9nerwX8Wa+PZDB2fELuSpZxebcdfH+0nyGe3RSxPfmFpyetHe9nt0H3U6vGW2161oEkQVYzmnjBHjJSuY1q/GxIZ2sBTV17gcODyLaJziuKXah5B5XAD1TJmG4aSAZi8D5Bo+zrkclPh9AWd0rIJu0GLiP5PKEqde044zo+LwaD8FRJ7T1Hgojqs9vy0kcbzUoQ3G+TMVgUo1B9+Cpmr+r69OuG7pK5J3/3itasgLuoz7iQ7IPJfJc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZqdHVZSRIKJ7L2Tch9Paw1zdu7guAHNDa4eHB02xz4=;
 b=UD1rfyfvwXH54OIvlqwejQSwHKDUDG9Wn7k6aEJEUBxDt2pXgZEtyAzg1jPEDEuEMtWGY5+DsCHFA6THz5cW8FY3X+EPnt6dfsvr4qpxrDQRODp8mIFgEpLXRHpDCHL8spAyowSerUp8hDLIfvskDz1xmGg2zCBbF6Cc26RGFCFUCwTrK7WPzwxKb2cG6Xl78WRqcDh5FMMbbtDMMHOXAnLmrmvHoc3sWNY3IPFVf+Qw2qw8QwIRqXDVFVklfzkxlQ3jPdkgR418jLA1+248GHuMgj1k2o1XBcH/cD1ICLHkD1MYarQC1toEMlh9RCfBUpvVUxGg0uFnwGmdP0JFJA==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB3078.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:267::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.9; Mon, 20 Jul
 2026 08:09:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 08:09:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc-testsuite: inherit nospdx to
 fix do_create_spdx failure
Thread-Topic: [OE-core] [scarthgap][PATCH] glibc-testsuite: inherit nospdx to
 fix do_create_spdx failure
Thread-Index: AQHdDtAMyuj2BP53KkSPvjeAMkYAdLZ1KcMAgAD2sP8=
Date: Mon, 20 Jul 2026 08:09:53 +0000
Message-ID: 
 <DU7PPF66507B2D7EC5ABFD4A688AA3F9360F3C32@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260708115052.71740-1-jaipaul.cheernam@est.tech>
 <DK2Q2D3DOPR0.1PPO4DOF1JPZL@smile.fr>
In-Reply-To: <DK2Q2D3DOPR0.1PPO4DOF1JPZL@smile.fr>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|GV2P189MB3078:EE_
x-ms-office365-filtering-correlation-id: 528c27c6-64e5-4327-34b4-08dee6364793
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|38070700021|8096899003|56012099006|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: 
 dQ6uwOKXl+evFYwopBD8KUFSLbyTmzcWndTCeEOLbu9ksPNvev50h7tMEKuIfZl04+wRU43TfC1Q8XNILlayIKEqEyiLqoiRSBScnBO4ECVQUdqA8CRcoLVESPiFXC0O8aKatFagkXLmEIgCEVuTTIQSN5/mP0bpeGmjR9ROfOaUXsO3+WyBIOHNMjxIkDREy7r9OoIgqQgKz/6INkNh4xyPCoGCNM1u9IFC4dB19+5OCGk2Un/CNsCivBnx+im8uZ3yZcJB7ROJGiXkgaiML9tgfaclMIuTJMU1Xc0ME5PIdmL+FMOJgU/1c/ZHgFAZtS+lG5VMP3ZJnftLeR2sCII0uzwQb4vZUEUYaLpMXY0SssOhWDcdWO+lzX0E9nLRsCYTWpa6uO8g7geJAz04Xtd/qdevayuKN3HMTuWgRWXbzn+/VBPXprcnAatwAkxHuPy9wsW+5H5o7o1mpms6q0Qh4i2JvOZl7CqhCaILH6T0lARMlTL0gP39N9zQa9ezJxMsRSlhdk17vjA04qOdncEL7FitZq66V4jgRYtGpp6yb5/BiSOlIM0UqY713PLoUDtr1wJkFBFuXCJ2rOSsXLDdsNWZ9I30GvZazzF2D0M+Lp90J3u3r0T9IeRk7KLRumdyvUWYhyRPprkidRgjjzOx7t9vGOmNHZDvzrXJvrI8B1KaIdzbvkAjVAmdZ9gR6EfU5tl0pYIC7V6vyDdX2K0EXmUu2tMLSIEw1dqI62w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(38070700021)(8096899003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FSUmplEnr+KF110McwSJDU760op/2/pW2i8zLRIRL0Wq6GGbojcLmPL5a83E?=
 =?us-ascii?Q?80J/IvvDQTLsfkt9GE59wLOfBGizpH0tyNvc9Tn3s9i0NqZS0pMv+lCS+HUO?=
 =?us-ascii?Q?IoTklD+lY+C8gRJ/YIAOLFKJxdadIR/gvCGJ3QMu/GvsNxyAT2GlNA5r/xcS?=
 =?us-ascii?Q?2hdST5+F2jMq2Wv2QH2nKH7FLWCVenle3u5aiJ4k5jwcDdXJL/8B4jATH/Jd?=
 =?us-ascii?Q?+MTUGnLMD/V2XpXgzrl6g9W6oLy63CLIDBgAvn50dYi6pwCw2LxCnJwdzQCW?=
 =?us-ascii?Q?y13pu4NuXJReJBFYjs1SU4j3+y0bF6ph2Jep4CSMhQC+H8yy1kVg2j10qBlS?=
 =?us-ascii?Q?xvngiMAyyYzGo6WM9oWq995vT5mKN0UpuYVgDwV2ghNVi+TajYkp+I5ppeHj?=
 =?us-ascii?Q?ZQ42rm+Nimr1UdvP+5RHrtYI2omUPBRQYf8rILxFqOzVT2kvEHornGd2Kjq0?=
 =?us-ascii?Q?YVZ1UOiNaeReDiUpxkfh8skCUjw79/fxOdqW2h0NrSiFrWO6Q0rgR/n2Cool?=
 =?us-ascii?Q?1pHhIfzobQn9MrIv6xZ2EIa0Ui95v1vp+qMS0MytxYxqvIeuJr+zQn4JBPYn?=
 =?us-ascii?Q?nb56U6vpY5x5j0NDfkXqXbsLosg+pO2EwlHZbEXaScqh27ExPisy1l3AKT0a?=
 =?us-ascii?Q?l4QPrxF+CkuehHnfy2GsES+mkl3+1dQ5tHUvxQGxor2ulWIc12tR95/FX7uq?=
 =?us-ascii?Q?TvqKkcXHQClPrVIXu2+6D2ypArnt2zLc+94TgjU2s8gS8/foGqPCyoL2G72s?=
 =?us-ascii?Q?h+zdsTe+TPmnsX52IIjlzbF9yNFnrNq3LPQs3HzpHegL4BUpT/Un4aZngKbt?=
 =?us-ascii?Q?v8RQtgDESAT2qX9yjdNwBTxRvs66cdvqNwY4Om6r6OOFx8dUp8i1uwwSkJqO?=
 =?us-ascii?Q?4Z7WNhRl9ROCzVHRCRs/JUPBRjcvgIXdyRl70uWPuLFhpvn1TTUnY08Y/0W3?=
 =?us-ascii?Q?pEGiUYXkcPU7EJLPcd4DAmMkl/JNRS9/5D4d6oY+OR/sGPD3eM2siNz2jM94?=
 =?us-ascii?Q?pTOnCPL4ioUWYEHLIk0VKSFzpTG+J/Hac3T2ALXwCkfIZ9e/ajeEaVSrMINR?=
 =?us-ascii?Q?KHVXt+3o779qjftI+QHmMIOCFNDQtVBVLzbSrdYXR4K8yX8Akc4uclAl+yN6?=
 =?us-ascii?Q?5Re24LAzItbCD0PB/ASVHmw7Xp4EYhlJVUvkOkcTbQgmBBqjCGAQ//KdBiVQ?=
 =?us-ascii?Q?eg5SYxHki8el0pJEqR8T+QeTxp8vWDrk5TlbE+FySpplpZxFK2NzlITYtgHk?=
 =?us-ascii?Q?umhgGAuvxhJS9vrvGy+0bQhq1CyunHKs0ky7yDfk0vYwNjW9p01BDtkKl93l?=
 =?us-ascii?Q?uimiYjvliNEUi3DkTZME26E/uERjlVKK03tm0BHPIuEdGJEVvEgzm/NxJtaI?=
 =?us-ascii?Q?6J1GaEQ43YKp6eVVZyGtOxqlCq24fGMm1Es40+7a6orDRM0xcOy3fRZwc36X?=
 =?us-ascii?Q?5XshrJtECo5oiEY4SYFpRM+czM9OUaXGJ3JtDnVB4i53hxEn/Nuh7Oj4/Y8I?=
 =?us-ascii?Q?E91QEtuPlUYPh7FdFtmgSBq1DJVFyJ2eT9ja7tp1rOc4qSLqUIWXFj+0dYy7?=
 =?us-ascii?Q?ZlCh58NXiArqBiWVW15Ra3Tt4OTvybeZxH1ZzrUU8Up06SPQsCo8YzryDs26?=
 =?us-ascii?Q?L1hnJmVUQfdxPVDjoATipSubmtx81qEzQkAD6C8TCN5NvnxxBc5Oa2A13fZY?=
 =?us-ascii?Q?7EDySSx2HWGo3BB8IeA8plmLlgqY92P81BZHlReoKi6QXIZFQ8Gir5XNuE3D?=
 =?us-ascii?Q?xtY3OXARkhBdjuQn0VfWIXgKjKDqxec=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D7EC5ABFD4A688AA3F9360F3C32DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 528c27c6-64e5-4327-34b4-08dee6364793
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 08:09:53.6249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjFHUsFTEsP8GgCRM4k+wWDWtVqFxyLxYY3L0elv+ewlP4xit08fElTT9h8jitM93xQ+Y7/ZimcfupVOvAd5Vt2LOztTrAWlTArCptzt6Vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241340

--_000_DU7PPF66507B2D7EC5ABFD4A688AA3F9360F3C32DU7PPF66507B2D7_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Please proceed with cherry-pick from your side.

Thanks ..


Regards,
Jaipaul Cheernam

From: Yoann Congal <yoann.congal@smile.fr>
Date: Sunday, 19 July 2026 at 19:26
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>; openembedded-core@lists.o=
penembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc-testsuite: inherit nospdx t=
o fix do_create_spdx failure

On Wed Jul 8, 2026 at 1:50 PM CEST, Jaipaul Cheernam via lists.openembedded=
.org wrote:
> The glibc-testsuite recipe fails during do_create_spdx with:
>
>   ERROR: glibc-testsuite-2.39+git-r1 do_create_spdx: Recipe glibc-testsui=
te
>   is trying to create package sln which was already written by recipe gli=
bc.
>   This will cause corruption, please resolve this and only provide the
>   package from one recipe or the other or only build one of the recipes.
>
> This happens because glibc-testsuite includes glibc_2.39.bb via 'require'
> to reuse its source and build configuration for running 'make check'. As =
a
> result, it inherits all of glibc's PACKAGES definitions (including sln).
> While the recipe already inherits 'nopackages' to suppress packaging, the
> nopackages class does not disable SPDX tasks. The do_create_spdx task the=
n
> attempts to generate SPDX data for packages like 'sln', conflicting with
> the real glibc recipe that owns that package.
>
> This issue was exposed by the SPDX 3.0 backport (commit 9c9b954504,
> Nov 2025) which introduced stricter package-level SPDX generation.
>
> Fix this by adding 'inherit nospdx'. glibc-testsuite does not run on
> target or factor into the build supply chain, since its purpose is to
> run tests in QEMU at build time.
>
> (cherry picked from commit 32801348ca231978498612f3ebee121ca27459c1)

Hello,

That is not a straight forward cherry-pick. Commit message and author
where rewritten.

If you need to add backport info to the cherry-pick, add them after the
"(cherry picked from ..." line but keep the rest (author, title, body)
the same.

You can either send me a v2 with proper cherry-pick procedure (only
append, no rewrite) or just request a cherry-pick for me to handle
(looks easy enough).

Regards,

> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  meta/recipes-core/glibc/glibc-testsuite_2.39.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb b/meta/recip=
es-core/glibc/glibc-testsuite_2.39.bb
> index 2e076f4b0f..e0e3e8ba84 100644
> --- a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
> @@ -31,6 +31,7 @@ do_check:append () {
>  }
>
>  inherit nopackages
> +inherit nospdx
>  deltask do_stash_locale
>  deltask do_install
>  deltask do_populate_sysroot


--
Yoann Congal
Smile ECS


--_000_DU7PPF66507B2D7EC5ABFD4A688AA3F9360F3C32DU7PPF66507B2D7_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Yoann,&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Please proceed with cherry-pick from your side.&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks ..&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div>Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Jaipaul Cheernam</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
<div id=3D"mail-editor-reference-message-container">
<div class=3D"ms-outlook-mobile-reference-message skipProofing">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
</div>
<div style=3D"padding: 3pt 0in 0in; border-width: 1pt medium medium; border=
-style: solid none none; border-color: rgb(181, 196, 223) currentcolor curr=
entcolor;">
<div class=3D"ms-outlook-mobile-reference-message skipProofing" style=3D"te=
xt-align: left; font-family: Aptos; font-size: 12pt; color: black;">
<b>From: </b>Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Date: </b>Sunday, 19 July 2026 at 19:26<br>
<b>To: </b>Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;; openembedded=
-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&g=
t;<br>
<b>Subject: </b>Re: [OE-core] [scarthgap][PATCH] glibc-testsuite: inherit n=
ospdx to fix do_create_spdx failure<br>
<br>
</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">On Wed Jul 8, 2026 at 1=
:50 PM CEST, Jaipaul Cheernam via lists.openembedded.org wrote:<br>
&gt; The glibc-testsuite recipe fails during do_create_spdx with:<br>
&gt;<br>
&gt;&nbsp;&nbsp; ERROR: glibc-testsuite-2.39+git-r1 do_create_spdx: Recipe =
glibc-testsuite<br>
&gt;&nbsp;&nbsp; is trying to create package sln which was already written =
by recipe glibc.<br>
&gt;&nbsp;&nbsp; This will cause corruption, please resolve this and only p=
rovide the<br>
&gt;&nbsp;&nbsp; package from one recipe or the other or only build one of =
the recipes.<br>
&gt;<br>
&gt; This happens because glibc-testsuite includes glibc_2.39.bb via 'requi=
re'<br>
&gt; to reuse its source and build configuration for running 'make check'. =
As a<br>
&gt; result, it inherits all of glibc's PACKAGES definitions (including sln=
).<br>
&gt; While the recipe already inherits 'nopackages' to suppress packaging, =
the<br>
&gt; nopackages class does not disable SPDX tasks. The do_create_spdx task =
then<br>
&gt; attempts to generate SPDX data for packages like 'sln', conflicting wi=
th<br>
&gt; the real glibc recipe that owns that package.<br>
&gt;<br>
&gt; This issue was exposed by the SPDX 3.0 backport (commit 9c9b954504,<br=
>
&gt; Nov 2025) which introduced stricter package-level SPDX generation.<br>
&gt;<br>
&gt; Fix this by adding 'inherit nospdx'. glibc-testsuite does not run on<b=
r>
&gt; target or factor into the build supply chain, since its purpose is to<=
br>
&gt; run tests in QEMU at build time.<br>
&gt;<br>
&gt; (cherry picked from commit 32801348ca231978498612f3ebee121ca27459c1)<b=
r>
<br>
Hello,<br>
<br>
That is not a straight forward cherry-pick. Commit message and author<br>
where rewritten.<br>
<br>
If you need to add backport info to the cherry-pick, add them after the<br>
&quot;(cherry picked from ...&quot; line but keep the rest (author, title, =
body)<br>
the same.<br>
<br>
You can either send me a v2 with proper cherry-pick procedure (only<br>
append, no rewrite) or just request a cherry-pick for me to handle<br>
(looks easy enough).<br>
<br>
Regards,<br>
<br>
&gt; Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/glibc/glibc-testsuite_2.39.bb | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb b/meta/re=
cipes-core/glibc/glibc-testsuite_2.39.bb<br>
&gt; index 2e076f4b0f..e0e3e8ba84 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb<br>
&gt; +++ b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb<br>
&gt; @@ -31,6 +31,7 @@ do_check:append () {<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; inherit nopackages<br>
&gt; +inherit nospdx<br>
&gt;&nbsp; deltask do_stash_locale<br>
&gt;&nbsp; deltask do_install<br>
&gt;&nbsp; deltask do_populate_sysroot<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</div>
</body>
</html>

--_000_DU7PPF66507B2D7EC5ABFD4A688AA3F9360F3C32DU7PPF66507B2D7_--

