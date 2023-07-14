Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF85FEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 10:15:02 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.54])
 by mx.groups.io with SMTP id smtpd.web11.15465.1689329695283390157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 03:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: welotec.com, ip: 40.107.14.54, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8FtreJl1vhyon2cOWUhO++elBn4KqEXCKxHgDHUWzaAUEcgmKrbk8li7ShArTPjnqWHeFXnXhXH0HvtAInIzd4v2wwVhLQJTtbvxGPc/P5OE6RCeu2eDpwC1Cv+B9d/e3yqg/LN3iHjximcL1FbhRIHNPlvcV6AzuQCBrcRHofnQT8Fj5uZWEOEVrWeBXGXywxzZ7ZPQJRIZHkHyHIaYgPQw9YFfIiGZW2LAPMK+JpWgjVLjAIk9bX3wOm6YZVfVpbA/1FgfhIaZxKgQPY6sZt65aczLDAkzePXctVQr/IIkJrhx8Li30Ku7THvvQLyvGf00NQloXy/vWWaZ+M/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqAKzN4DRUL3UsT4tRhNkBudvCI+7FgzRmkR7tIXWkA=;
 b=Lo0Iw8zomyVyOJnceDA45pzsHcxS3kOerLfV+JpBOw3XpJtoyElVmJtmdLZWICixRA6Kz5X0ibjCrqhmtnnIkETK+sVt0ishT2FrJCornM8evIPh2VmHFoOVkg3ftLBPmcr5ONlCxH4oF8It9YJbH4yLhL2fTisOknnqKjI7Q/mCo8IQ6K3vuMx1CxYmziK2TWrgPkiTDfzJXkKbHRfY9O9GV2eBdwqrPdgqwhL1yfsA771JDcyNCAP5uaLvvNZJEfW6bazyBxwjOMspFaYhUHlFs1phVfK7bMwmaL9/qZdXoFDT9M0k6jn2eyRqUQzQCdpoNImRvebBgrt5FkSxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqAKzN4DRUL3UsT4tRhNkBudvCI+7FgzRmkR7tIXWkA=;
 b=qjK2pNoQMytRAlYifg3m8ptXuazZrypWnFhT9ACMs1v2yh9m60tvPWi4CWZz0PtnCMfk4GNZeESwWzfJ5bTREQYwyqdm+tkUojVPiAamUp/EnFIFc6au2oapxMRR7I1Ba8q/EoeaZCmbVZH5dY+/IpoINd5s+0zdXBhFHHeLnP0=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 10:14:50 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 10:14:50 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZtPO0ExVqSFyGMEyeVPylMPzW7q+2r+KAgAJd9ro=
Date: Fri, 14 Jul 2023 10:14:50 +0000
Message-ID: 
 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
In-Reply-To: <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DU0PR04MB9251:EE_
x-ms-office365-filtering-correlation-id: f425d786-f42f-40b0-0618-08db845328ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 i/PmM/8zBZfUaRLEuGoRz7pbWlGB4Je3XqZxwGtlqqqerXhI8JDy6FqTUjuRwpy/6CmHWCK74YzPA2Mn8O0U2wQct79Gj7XMciyF1FFGD2COxpIx9CB7MZS3sVC1nrN6AltZs6SfDe08dSzmE5yEZGZWMqBEJroW7A2q+S91xD1ROwfxczvpg28ViromT/h3g7QqUc9iwvRiHD4a/jv8Z24yCEzZbbQI7P/S0I4fzOKhbo/sShqqtaCz0743THz3bERxpLFqgCPETfpuHqi8Rq6dpBVSzmtUqVsCV2WD5WOA1ZDUjV7g64cpdl4N3jXsW9UsoEKThurvaUSmGnRU7qNlYnJmoCnIYkMy1/ij/UZ6HjvSdrJl3xmNMOGWSMCdW1b2Z7OG1t5nOlDum8y9k8hKoTF25sgmVikWbtPCdSw1xFfkBxk1kZ5r+tN9T7jErntAVD7llTNXfVzh4Roj6qk9Bu4gYQuX+QJV9HgeSk2o/dKsHL6tLNghlxQybrkGT5/kVBvE7lYizgvARK8gol6UMUNJf37N7iGPKJiq2Mg1DaSOuYqEytxyCOstDj14FGX8UdpbdHc6fP6D0skJUi5/rjx4E6YWf1ajAkOUlWY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39840400004)(346002)(396003)(451199021)(316002)(8676002)(76116006)(66946007)(8936002)(41300700001)(19627405001)(55016003)(110136005)(66899021)(91956017)(52536014)(66476007)(66446008)(66556008)(64756008)(5660300002)(2906002)(478600001)(45080400002)(71200400001)(966005)(7696005)(166002)(86362001)(26005)(53546011)(6506007)(9686003)(186003)(33656002)(83380400001)(38070700005)(66574015)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?nOEJ2bQwv6baflIaTAdFKAvdHaxnUcboco2VUEFf+lKTM9q8lW1BD6pCik?=
 =?iso-8859-2?Q?CqBiMfqzVFvEsr7CRLmlFWpT513OmPo7gxWQdKUfhYCzzF1PxyAaj8+vep?=
 =?iso-8859-2?Q?mdd0+YAiI5UAUYN4nnGhiBz/rMpscfFI9Qajm8QLIrb0XzpYtPTti3kXO9?=
 =?iso-8859-2?Q?st43+nrPe6bm3awpK39odMs7H9vSn+bfADPT5iq6oZ988UqQ6QpKFCaBdD?=
 =?iso-8859-2?Q?NPaI5allg7niR2391WnoJxtCE0sCJ3vyAVuJz8Is5zXbrTIndFvsKyX/DW?=
 =?iso-8859-2?Q?0E4mqvc5WHhYUYSCNl5k5EwF6l7AwuVade18XjaQ46hIPH8GjFkMGlBiMx?=
 =?iso-8859-2?Q?0yxxWiT64NWgrRv7FXVo1wGaV1Z1SKEOa2Ob5kMDrx1OnMPCgWrcqRT7A8?=
 =?iso-8859-2?Q?Ft23Zz5AWmNDOmUHVe2haYkYSKTe+UHdjDTzOIlZYN6gAIB6t8RKrYQCLB?=
 =?iso-8859-2?Q?waJktUT6VNbmOVij7AfMmWHylrl/kg1Pck/qV2ExNkRQ+UaLT87iPY7g6K?=
 =?iso-8859-2?Q?AsFaNkL3avKtpvQ6UCxiaVze1IFaG5QslYIdrPk5gcXBIRMPmZJTQjfVzX?=
 =?iso-8859-2?Q?sO+dY0pVEdwndXkjrKTpWrWgjwcynaUEro+4bjnwpNY4d2/ZY/9upuOw/M?=
 =?iso-8859-2?Q?x5ailvIWAxFeqnbhDEEG0fVBqxjENv/TUFU265Qj5i97EAQwTl/TvLl7t3?=
 =?iso-8859-2?Q?PJdA7qGveqHUD6+IpuGCN5GgF18uC1WIDzrYTQHQf905cG91QlqZPocsSG?=
 =?iso-8859-2?Q?5joiIeeGnK1R2+Zpibj63c/TCHcoi0rD3VgF9Znu9/cZqYqIr9a0o2q6o2?=
 =?iso-8859-2?Q?3IL2m39GBfe3QtaaZcNh2PpxbfsYdNfKsN3JXNPETU1Kh3nSkb/2An2zVf?=
 =?iso-8859-2?Q?DGwpedd/KVGnyAtOlzjQINbvrSwBxNHBLH0N9Fn9aMIQutojRy4fspPC1X?=
 =?iso-8859-2?Q?+mAUCMBY1R2Sgk1Ga0otBivDjZZ3eZ9+kz1uj3dXwihXb10SDuaFOIYK5n?=
 =?iso-8859-2?Q?CpdmUjYGUOf5bE6n7qqDs2DiZzLDWiFvQU2Otinwmp1bPR3hhEKgKD1qBW?=
 =?iso-8859-2?Q?JSLGR4ogClP+//4iLCITm3b4PRuK29Rmd3cykbYyHJdGHtYlZFftH1DE1V?=
 =?iso-8859-2?Q?DwlAZdq5EEIcjpW2qrCFd2VhWbJ63PAJrf58H3VAPUCYXH+4Q+lO8pTutQ?=
 =?iso-8859-2?Q?KAgcRHA08uZa9/vy1gLAGXXBXV+ev5epP727Gy1bj5aSMM6Qe5V1KqxiWL?=
 =?iso-8859-2?Q?sy98jUz7+T2/GKJsQG9m5kG3yWcjpeUuz67Z89nI5p5kWit2LTc36hIzld?=
 =?iso-8859-2?Q?Ppaq9cVauiP/eB1K+eO8pEUbIBGwha1Tw63TC9vUHaUZigb5XLpT3toqM2?=
 =?iso-8859-2?Q?VUpDUAKp40ih22BJ3oGK8Tg8pjMf6FTegNB2VLeCfz7Vg90gyRg9WrBkEa?=
 =?iso-8859-2?Q?CUp+ecap2iZc1J5xbQ8sO2x/Xuyc2B1c1erh9aKt5y59mhsYWthb+Lup24?=
 =?iso-8859-2?Q?De5nv0wk9bXzWsVeUoForbUH+XjoUkYj4m6Na4iVLYhScfIZfzhLVkM/Wz?=
 =?iso-8859-2?Q?mfhmyVp5nCzSYVJ+C/+B1YVrmqSwivm9+azLnchIdHO68QNg3990UgDDY6?=
 =?iso-8859-2?Q?R4el8onHUwAHk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373A7CF0029527D7AA884689134AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f425d786-f42f-40b0-0618-08db845328ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 10:14:50.2404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJ9cRye5bYk0B2NrLGP1Tq1bJuXr3hv5aoBfV9Lj8wz/+60LGvEbwkF2SCcLAvDm4GNL2U1woXEiD25JfSX+XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9251
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 10:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184256

--_000_VI1PR04MB5373A7CF0029527D7AA884689134AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

OK so, does any one have any thoughts regarding this patchset?
________________________________
Od: Alex Stewart <alex.stewart@ni.com>
Wys=B3ane: czwartek, 13 lipca 2023 00:04
Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro n=
ative features support

ACK this patchset, assuming the other maintainers are happy with how
we're handling the DISTO_FEATURES.

I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes
into the 0.6.2 release, which I have just pushed. They've been merged
afterward, and can still be applied atop 0.6.2, and they'll be merged
into the December opkg release.

I have a branch ready to upgrade the opkg and opkg-utils recipes, but
I'd like to wait for this patchset to clear, because they will otherwise
conflict.

On 7/12/23 15:04, Piotr =A3obacz via lists.openembedded.org wrote:
> Include support for ACLs and extended file attributes for native
> builds, by default.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..8daaaad615 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>
>   # Native distro features (will always be used for -native, even if they
>   # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
>   DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
>   # Normally target distro features will not be applied to native builds:
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184214): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184214&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C5f8da74516a243c921=
d208db83240b6a%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247963054654=
529%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DQ5P4AeMiYA5a7F9ugeSTLgLPVLs%2BK=
Sm7kc8j%2B%2FeRO1U%3D&reserved=3D0<https://lists.openembedded.org/g/openemb=
edded-core/message/184214>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100106217%2F3616788&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7C5f8da74516a243c921d208db83240b6a%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638247963054654529%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3Di7UvS7QZnOOGllgFy3znpE21ZDf7fq4s22G%2FAK9%2Fpmc%3D&reserved=
=3D0<https://lists.openembedded.org/mt/100106217/3616788>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C5f8da74516a243c921d208db83240b6a%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247963054810757%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3DmLCcz%2Bj4FIcQPZ7mQLKaVEruE5fCIJmXIk9ExYpJ9ZU%3D&reserved=
=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [alex.stewar=
t@ni.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


--_000_VI1PR04MB5373A7CF0029527D7AA884689134AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
OK so, does any one have any thoughts regarding this patchset?</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alex Stewart &lt;alex.s=
tewart@ni.com&gt;<br>
<b>Wys=B3ane:</b> czwartek, 13 lipca 2023 00:04<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">ACK this patchset, assuming the other maintainers =
are happy with how
<br>
we're handling the DISTO_FEATURES.<br>
<br>
I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes <br>
into the 0.6.2 release, which I have just pushed. They've been merged <br>
afterward, and can still be applied atop 0.6.2, and they'll be merged <br>
into the December opkg release.<br>
<br>
I have a branch ready to upgrade the opkg and opkg-utils recipes, but <br>
I'd like to wait for this patchset to clear, because they will otherwise <b=
r>
conflict.<br>
<br>
On 7/12/23 15:04, Piotr =A3obacz via lists.openembedded.org wrote:<br>
&gt; Include support for ACLs and extended file attributes for native<br>
&gt; builds, by default.<br>
&gt;<br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; meta/conf/bitbake.conf | 2 +-<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 9625a6fef4..8daaaad615 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&=
quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; # Native distro features (will always be used for -native,=
 even if they<br>
&gt;&nbsp;&nbsp; # are not enabled for target)<br>
&gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;acl x11 ipv6 xattr&quot;<br>
&gt;&nbsp;&nbsp; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; # Normally target distro features will not be applied to n=
ative builds:<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184214): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184214">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184214&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C5f8da74516a243c921d208db83240b6a%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247963054654529%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DQ5P4AeMiYA5a7F9ugeSTLgLPVLs%2BKSm7kc8j%2B%2FeRO1U%3D&a=
mp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10010621=
7/3616788">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100106217%2F3616788&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C5f8da74516a243c921d208db83240b6a%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638247963054654529%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3Di7UvS7QZnOOGllgFy3znpE21ZDf7fq4s22G%2FAK9%2Fpmc%3D&amp;reserved=3D0</a=
><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C5f8da74516a243c921d208db83240b6a%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638247963054810757%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DmLCcz%2Bj4FIcQPZ7mQLKaVEruE5fCIJmXIk9ExYpJ9ZU%3D&amp;reserved=3D0=
</a>
 [alex.stewart@ni.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
-- <br>
Alex Stewart<br>
Software Engineer - NI Real-Time OS<br>
NI (National Instruments)<br>
<br>
alex.stewart@ni.com<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373A7CF0029527D7AA884689134AVI1PR04MB5373eurp_--

