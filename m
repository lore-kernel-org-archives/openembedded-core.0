Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFAEF589B5
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:44:25 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18059.1776946336516361334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ZQbXfJvD;
 spf=pass (domain: est.tech, ip: 52.101.70.23, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACVss8rTpRdiY4GBRKQrQkT9s2n5A80d2p6ApGq1/G7aW3KM+nrWbDsmmfQCSayVdn9WNjYDOl/K5TFCH+zHtoPCRTtV0EqefcafYWjM62JzhmR7JkupJEua3eO8uYHCuCz4WLg5YZnVFp7+NeuX1yg9Ro9D63Zzlm6a5fj1W5AfiBDbZv/AUvUmyIlDSqiT0bseIrpziKdJHChPEk/R17sbDn/+p5vSgWelZ0oYvIGoTrhYx8jX6z1e3GszweaiZvOF5erzxa//5VU8H+7rR+TBDWmCsBCZRZ0RGiQ90kTIMvtLLQxierLJyVh1TREaRFqVEjduT5aQNq0EGpgPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+ACb5w3MzxE6NxwjkfHP+rta6tEQ/48Zr4uU+PdPBc=;
 b=WNXbKb4hs5tDr/FL/9N2vAw6MUtv5MXVwf/Rg2EVzKnSaZMdgL+IZemcNxywzz6xwMeM0oFHa5vbLb9wLt50wEwxZeIWX9fcrTIY2w0t1ZFmnX5j09p92YoykY5aaJyO6g7zKdCz6RLVgMJNC5X3a4jaavf3JHxNzul3VDXAvufiWuinDAdmHDOAzYeq+F15AUFEQlrySxexGabRlwu/9AWakp25DyDu4/4dPDP2/4qsYLaxyDFoZtrOV4ftn5cdN60cgie83qLScdIQWnLkiQeu5MZQnFVXpYP+h/r1/LQD+AHYosxc+uXdvHg3aibGl37smsTW6fzpkO6fcg/erQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+ACb5w3MzxE6NxwjkfHP+rta6tEQ/48Zr4uU+PdPBc=;
 b=ZQbXfJvDSsQv3iX2e8+OIkyK4r0a4icG9i4oXlb5iQAVSu1urnmS1+FlsHel6WwMNPJoa3vq1MwJ8OAKL+8Ksk71m94eTA2D2S3T5Zujb+/QZs00UfaPBBaosJ6sLbChubrUH2dAmEAoeZGHM9jj87hes+SZEUV8AmwdJ6l/KOv7iUH+vObCamwzkRkz42wQy8iytofh8tJRUw3z4Nvqw3tvVetNRwV4s28ajXAu4T1E6by5i5QzcMJikQXisuCFtT1kfu0ICdh2fMksM2W/41cOqnv+zkP/VFOWOXPRlkH0YWZKt6+4M1VmdPe89g+GtbypFPG7cGyIvHegm2fqTA==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PA4P189MB1166.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 12:12:13 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 12:12:13 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH] expat: mark CVE-2025-66382 as vulnerable-investigating
Thread-Topic: [OE-core][whinlatter][PATCH] expat: mark CVE-2025-66382 as
 vulnerable-investigating
Thread-Index: AQHc0jWnVaiTcUCel0+Yxt42aVjvErXqy7QAgAHEg2k=
Date: Thu, 23 Apr 2026 12:12:13 +0000
Message-ID: 
 <AS8P189MB1672DC5A1BE2FB4ABDC02967B32A2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260422085436.320259-1-adarsh.jagadish.kamini@est.tech>
 <DHZKFY8ILV2M.QM2AAGL87S7U@smile.fr>
In-Reply-To: <DHZKFY8ILV2M.QM2AAGL87S7U@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|PA4P189MB1166:EE_
x-ms-office365-filtering-correlation-id: a99d65e3-6536-4e0a-42b8-08dea1318db6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007|18002099003|22082099003|56012099003|8096899003;
x-microsoft-antispam-message-info: 
 isvb5oK1wBYijJkHbuL8PGIGtpz1n/plyVlKhVemZ9hrmk7NJERyA9lmn3Tksno0aWlR5BA9Ez7LnoRVbB//rTEJtPaag095bvKLkR+m8iPqhtNvJZjf87jwoZXhntecbJg599PwfuM/PdO+siRghBeR2O2ve913Kp0do2r5boe3813ollKSypwFmvycxdo8nHCA9j17H9E4hKdvhmmv0+c6MU2SEuo5Whw7exCMKwX7w/4T1Zr3dcYnGk5EMBvAnBPiMazoec5YB+jnWxbNdEsb+Q1qwmoaAUszAcQ9/by67m9CILcoUK6x4uCksSJjq9FfQvQV/2NZeG5uPiwdzvAnCHca9XzMEfTNej/AMOM6S32xaf2OrUKBST4G9MlOVsSCOdGBYq96B47ibUOwXzAlV5+523vfZYZT9t4R4uWea1WUSjGjiAOof6MSABV/r+0fLJ8P+Y6pdUueFazdOyLE55aS1fKVZinJyCUpAa3w4q8esbAx20QjNfYe+6CxVSYlVShghwtZZZ2luv/CyZDh7aiJ71NpQjTdqoHDyU5JXf9jAZXtgDSCqOaBwgFh2qy25nkmoa5qnUK68v7+5qt3lIuG/0RidFXdf0fzS4bL2uyaAyTaCs232Eew0ykwcgL2AAvlmtBrxZNnMvTar7q72A6XXCf0fyOjNqmS7YYwXb7LFvz+nkhl2odHneCegpRWBsUXMlnVULz9z1fUK5T0LieJhdeS4pU3uwi4nRYZU5VAYWfYMDiXkPxG2XzPiM+Fu/YGUh3d2Q1QCGbw2VmBuqBaRAyK6cCt1isS0Y0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(18002099003)(22082099003)(56012099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1S8AdyyJH5T1KrN/BQvgnHRxRJh74VJt4yKom6jSxnPtGJ0u34DKfuvmG6ru?=
 =?us-ascii?Q?UG4qNOX3uPpA/g4r1BSn9KvOqbbrdJUalxIT7h9GJ9qrpw0X9OOPzRG+IkAW?=
 =?us-ascii?Q?zu0Hf0g+4Vzi3g4weMG59aWz9lGBmWSgnvgZs2KCgnKrZYDjl9hyGeYQc7Te?=
 =?us-ascii?Q?OT+pflxFXfp7PVuAw5cY9OQJM34OimFow7/wbKWgJvwJ1GZzd7a20FK1DafE?=
 =?us-ascii?Q?ITVfe6LC4g+eSV5uArezAZpV/Dgp4wOPpooY2oH11eIhrlQa0FOuxcnXH3w/?=
 =?us-ascii?Q?0RT21jGwawSRXGMDcBZAYIQ3s0m8m0ORg9pckduosF5U428r4sJg0bzMMAGc?=
 =?us-ascii?Q?++lp/DvXPl70a+2Yddi1LXdxgWeHJnVXHQFPwYhTfsd3yiEJJI7HTEGLm7J2?=
 =?us-ascii?Q?e3LiYsSCESpJMliwJeZn3uobwhM/uHVKLUCWeh2KlcQavtM6JoruxYnAVK8W?=
 =?us-ascii?Q?6eLUBkJSEr7hjKfvP5VdNWnSG4bB5ZSbtGegChACBYsPeqnWCytESI93ZMMD?=
 =?us-ascii?Q?5XG4O2D2Gry9r2v+YiyW4tCle+RVcvzWKHtx/snpShgfVgDoC8seh8Ax4IdA?=
 =?us-ascii?Q?eajkVOQm4DduioEhisYXJ/egdyMeUw9w8n4MxT+pO1111N4570gSA2phMs92?=
 =?us-ascii?Q?iqGOoO/6G7maGCPSG7uifaLAy6vaTETnckBYaBh2noQbXM+ranhByaxvdI3a?=
 =?us-ascii?Q?mPZN9xEKEw/nnwq4NbU7DFzZROeLk4/nUm30vAD9uvfNM/ccocvLgGxnUvvI?=
 =?us-ascii?Q?ksv0nrpNadyGI7NroBj6/Yyn8OOYxJncVWHhnqQg7KDrw5fbI7Tp80N+r9YS?=
 =?us-ascii?Q?k7GQeBm1Fhvv/bTVi9uBRVPyCF0D6fRU4D1YqwN7C71eF61InptccLjDB/Dy?=
 =?us-ascii?Q?qosUWbTzPAMxLbsOw5pEBbOQ4eZdPJKWXGNw6RkttppIDc860cSN+ZmZfoJy?=
 =?us-ascii?Q?njHpXERdZld3B4wRWNnZ00Rz1onNwcJSc2JQtiUZ1EQ/KcFY/ofSsRms251l?=
 =?us-ascii?Q?cd5qEHWEYPE3nUvceFFjvmmFos3og4JU+3AhrnQsvhHTech0X7uzmf4AUwkG?=
 =?us-ascii?Q?SzoPkjlv0PDDeOd557CiHDDdp9dN146iSXTRrD4Weeu5vOoTIjxDEmiz4UxN?=
 =?us-ascii?Q?FmNBCkViYuaMDYeNWABGco8AhYCHS2ctsux2XwqVP/GqYI1N44Ln+f5o/H/2?=
 =?us-ascii?Q?8HjqfgNy825vl+phht/rIkDROKIQnL4n7lhD/QfgNaBtB7JpRoQbwXp4s3hy?=
 =?us-ascii?Q?+by8uz1RTBwx2C4JHd/Jfw1N5qAbqGgD5aDRp9k8fU5GXaeVfKaG1gpz4qLz?=
 =?us-ascii?Q?i2tH2mOINAQ5VOX9Sc5539Steu9jtq/aH2cDzK0FrloQJFu81fJtgHAmZHqr?=
 =?us-ascii?Q?ox42rvo/5w6z9IYJVYYeamp7OO4dfUogvbpB/banPlYDVEyEPwhYpLkdlHM6?=
 =?us-ascii?Q?WexQbo2+Wg3NE8A3rq2NFdEAsz630njPIlyM7Et2M6RRoLdPVNY7lM4Juvzu?=
 =?us-ascii?Q?8icehpH5guub+J8Q7lC29kTKrnwG+RMyWiWh0hiMvmPDqH2exZSTGGlfPsdm?=
 =?us-ascii?Q?1XR/YMxwSmt2KJS4vPUfUrN3XRcE6guQXeS16xaOw5JgEqQOQAbPOxqqpJY4?=
 =?us-ascii?Q?YqT9K5tUsTu+9fPShhwvKzyer6g9TRz0eIO1gl7XLs1KK375PNVEvtoXKSkT?=
 =?us-ascii?Q?UKrcfgIB6QV0G/gPRqLc7Z9sHRmf3KC/0pq+bcsH+a0x5P2vlyaV3JAWJp+G?=
 =?us-ascii?Q?e6AA+KNY6YacGI7YeA3lf1Hj3g3RwKo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a99d65e3-6536-4e0a-42b8-08dea1318db6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 12:12:13.5789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5x4/fCfQvaIeYl2DzIy22qY0x7vVlmLJ2Of/nWLngaSeiChxgLb7h6j/OZY70rWj7sgqgKcjXBsEDda0INTPFavOz8SY1/hAssOyngeOnxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1166
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672DC5A1BE2FB4ABDC02967B32A2AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 12:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235766

--_000_AS8P189MB1672DC5A1BE2FB4ABDC02967B32A2AS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
This patch should be dropped.

Thanks!
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, April 22, 2026 11:11
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH] expat: mark CVE-2025-66382 as vul=
nerable-investigating

On Wed Apr 22, 2026 at 10:54 AM CEST, Adarsh Jagadish Kamini via lists.open=
embedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> No fix is available yet for CVE-2025-66382 [1].
>
> CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availabl=
e yet"
>
> [1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Sorry, but that will be too late for whinlatter. I finished reviewing
the branch and will start the release build soon.

Regards,

>  meta/recipes-core/expat/expat_2.7.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/e=
xpat/expat_2.7.4.bb
> index f1eff49688..65aee9d17f 100644
> --- a/meta/recipes-core/expat/expat_2.7.4.bb
> +++ b/meta/recipes-core/expat/expat_2.7.4.bb
> @@ -36,3 +36,4 @@ do_install_ptest:class-target() {
>  BBCLASSEXTEND +=3D "native nativesdk"
>
>  CVE_PRODUCT =3D "expat libexpat"
> +CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availab=
le yet"


--
Yoann Congal
Smile ECS


--_000_AS8P189MB1672DC5A1BE2FB4ABDC02967B32A2AS8P189MB1672EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This patch should be dropped.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, April 22, 2026 11:11<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][whinlatter][PATCH] expat: mark CVE-2025-66382=
 as vulnerable-investigating</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Apr 22, 2026 at 10:54 AM CEST, Adarsh Jagad=
ish Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; No fix is available yet for CVE-2025-66382 [1].<br>
&gt;<br>
&gt; CVE_STATUS[CVE-2025-66382] =3D &quot;vulnerable-investigating: no fix =
available yet&quot;<br>
&gt;<br>
&gt; [1] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2025-66382">http=
s://www.cve.org/CVERecord?id=3DCVE-2025-66382</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
<br>
Sorry, but that will be too late for whinlatter. I finished reviewing<br>
the branch and will start the release build soon.<br>
<br>
Regards,<br>
<br>
&gt;&nbsp; meta/recipes-core/expat/expat_2.7.4.bb | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-cor=
e/expat/expat_2.7.4.bb<br>
&gt; index f1eff49688..65aee9d17f 100644<br>
&gt; --- a/meta/recipes-core/expat/expat_2.7.4.bb<br>
&gt; +++ b/meta/recipes-core/expat/expat_2.7.4.bb<br>
&gt; @@ -36,3 +36,4 @@ do_install_ptest:class-target() {<br>
&gt;&nbsp; BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; CVE_PRODUCT =3D &quot;expat libexpat&quot;<br>
&gt; +CVE_STATUS[CVE-2025-66382] =3D &quot;vulnerable-investigating: no fix=
 available yet&quot;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672DC5A1BE2FB4ABDC02967B32A2AS8P189MB1672EURP_--

