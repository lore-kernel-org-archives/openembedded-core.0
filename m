Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE832C001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 16:33:05 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.79])
 by mx.groups.io with SMTP id smtpd.web10.28947.1690129979453635633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 09:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=JkDBytmV;
 spf=pass (domain: welotec.com, ip: 40.107.6.79, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTNM1ZH9ZCj0nOM5SZl/i2kpQBMAWYbfyAhxSn9aQRYugYvCVXjzrTnI1FfQLQrVIE+MOxfM75cOA0lPNrSh0P3mMXR6Ea/oQFtcoHCaWdfJdrURCI6ONiKTrOnnCYQH6u9oOytw/NmlO28UsHjjHn0Z0AaDOGZaXWiyEJ30IlSc1yFM1g3qoV6wJVRZ8uUctAbP0ofaxd7sX8h9EBTjKZVsKSFE95DmADQJ6SDV837pXopYAjzN+JS9iNqB6n32Qu/SKZdnmDzD5vr31mUzqhdaYtnxRteyGf1DOaLxzrjSBPnhf0JI3LhcWtBaSNWV4zxBSrYPSUhWF2c5nx9kPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at317UVp58/0eM92snqY74GbKkfwaw+MOvU+JPlP3/Y=;
 b=P350ljdQqp4HlIMdPQune1ip4CKt4mK5r4d+t3obqlyEonssZwT5HfteK+n1F49T3z1THloFHFTXeOLPRI+yvUw14qhvs9cB/ATbOk9ME4KrbYQj3KmFzwTFJg7LvNHd1rDlqnAfZiIUhCygee59GY0G0DGaPQkeVA7P0PLTQXzQqhkd8X5BbSUclw3TmwOy33oRgRR5Jgu6n91gVsXA0mjQnTFqtTfHLs93beQVjokdjWM4dVcK7gp6/tqwhXY7CaybTJLxvES2WHbdWif5kiHTGI2Mx3y0EiOSWhYKgmL9zVJv6hBgxRBeAbKpAgCdTMm6jmzzbY8heYVmfyGc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=at317UVp58/0eM92snqY74GbKkfwaw+MOvU+JPlP3/Y=;
 b=JkDBytmVc+Z4vW/Ie9vxVjh/AXacnHC5HhA51CUjdiLZReLEfNUT0ek0J48dPN84Ro5J5EXma/wqWFJVX4gD/VJv7u9CvXCMstAGBPQ1QuMXvCPV70Zii/Qjpona6edYbfyYFYjXvz1hzF3WE8EpskN02iegHBaKnFs/XzOBS2U=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Sun, 23 Jul
 2023 16:32:55 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 16:32:55 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZvN72YDZpL3/QxkWU514c4O3nNa/GRH9lgAEvtgCAAAyviYAACkrC
Date: Sun, 23 Jul 2023 16:32:55 +0000
Message-ID: 
 <VI1PR04MB5373D3FCD62C630268F512BD913DA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <17744C0B55ADA271.25264@lists.openembedded.org>
 <AM6PR04MB5368ED123188D5223D0F14B7913CA@AM6PR04MB5368.eurprd04.prod.outlook.com>
 <202307231504286d15f3bc@mail.local>
 <17748A1F3FBBC488.4774@lists.openembedded.org>
In-Reply-To: <17748A1F3FBBC488.4774@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PAWPR04MB9717:EE_
x-ms-office365-filtering-correlation-id: d2ce8717-218d-4f3d-07f1-08db8b9a7797
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xMX/vKN8O1AOeg7hm6gZxeOcbKfCOtrXpOg/CdqXYlgdyicaObOFDJT0Z/4q6scOhtFAW22WLVVBHgVPsfd7MCdyui/IeYMYIC9iklMCb5cXZBzK+NR2T6WF3bZZRjcpI/1B3qjC3OXAPFhGyuCPOsxJGN9tuPvvLdWbCBFWyXWMjeWtfpelFBeHlTlKWiVJonrVQQvwgVOZs7pJWk+P0xJHnxPkZe+sslt5Z+FWa8g1im5SPF7NzVAQEVPgmx8NQM2qvolXNMEinf67tnzL+OzKLUqqYcm3Zc61mX9RU/NVEcHC+QJac8XQ6pLWoJ2IUB3WpcjunvSsNxROMvpSnOZ1cdBYN4EqtoLTJds2cMGAzvP3lSoQ/bWR/kZ2rjqHfzvstGCMfBPgwV2Om7Vw0hDwDrTr+mET1Ny43gteuyKnZnuxxu++rO7K2H5Yz43raRcWeatngIFQDoOrVpTmbNQSqqc2K+nl8nT8R9SIDYYjN9DjCL+JyFtCuPGbTB23WKwGok8BA9HXgiIhM2w9HRxlFqOaEQoMkaUyAyrnH6YCHNweXtoQ4JuNkUe0+yNIZzUwAiWvmw0G7IyIxfL4mxTUlk2P5a1lwhy0CIN2x08=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39830400003)(366004)(396003)(376002)(136003)(451199021)(38100700002)(122000001)(55016003)(66574015)(83380400001)(66946007)(8936002)(8676002)(5660300002)(52536014)(110136005)(478600001)(66556008)(66476007)(66446008)(4326008)(64756008)(316002)(91956017)(76116006)(41300700001)(186003)(26005)(6506007)(71200400001)(45080400002)(966005)(7696005)(9686003)(2906002)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?udl7klHaVbiTQjQ1hkPvTPnc4xzMTIcv0hOgGc1vVGrK+4kTLRK8fFxIXJ?=
 =?iso-8859-2?Q?i15N1IjSjBzl92G5g25xiiDEhhQdb+TOHCspbyzlQj4vW0y9/KtuOTInEo?=
 =?iso-8859-2?Q?YjYHxN2eWjcSqd0cfDTx6Q3jMMZU82sLkDMVPV7LgM6XWYbZJ0TGV2cr9e?=
 =?iso-8859-2?Q?uo7zxGr5wC8Ty4meijiJA8YHUDs02rqBRsx9pWB/gAnsm8ZnkBmatA96Sg?=
 =?iso-8859-2?Q?1ySbl8JWp6/ouGxEpt4JUXs4/CGL1Mx3HHMPYYaWG0tGodn9EOQ64jqUFb?=
 =?iso-8859-2?Q?p5a+0jbsoU7AWiBUwSitTHIq2xLoHAEOSx/JNFMs6x9xxUF/k8lR5dq47a?=
 =?iso-8859-2?Q?9oNHGTcU4s+b/6I9yyuSkARZQiv1UrJooE80YBAcc3GdLBZzasSQui9GOI?=
 =?iso-8859-2?Q?1OGDJupulovnAZaVGP6vCk8agh0GnWK7Twdp7l6IE1tpYb8mOafrz64htM?=
 =?iso-8859-2?Q?LO6yZl/9luwioHmDJf8x1lq0ux3mBQdmEheg+nniBXbHRM3Qsoy3n7N/RK?=
 =?iso-8859-2?Q?KNKFgUVGXSEcqc2Dap8EALnVgofvgqR4ygPsvjVznCUsvQPc+TSMPlI65D?=
 =?iso-8859-2?Q?EPKvXOMpsKCbF7NqN2m54eN9A5LhlgbEcd4+gT2GMI0Nt0mwqgHSDqpgZd?=
 =?iso-8859-2?Q?dWWoVJn4eQXYiq9TaOojO8RpYjcw3fpG1uWf70i/1ZZLfJXfd8o0V0Kg/u?=
 =?iso-8859-2?Q?3YF9ha5RfvAQ/n+z/maJCq779VjFNDC9EfDoQKTkOAZDALEVnVpUUdxd6u?=
 =?iso-8859-2?Q?9qv3YVhgvcCAwmFL+C0Fg8v8LwEEKmv8E6iTwfiarzO4nR3f5DLn1WiATa?=
 =?iso-8859-2?Q?vQKSO2IRAeDKXOKeoesJvyZ7DUMlMYDM0oCZGXDKIJ5iNxZrkxqsapg3JF?=
 =?iso-8859-2?Q?/mQm6W/agEttg+tGGptpQmDrPtT2QOiGOiI6HLZp8QyZeYeTBHgi8FVbpo?=
 =?iso-8859-2?Q?ti/B3zzFbS2BD8W5hTfupAI9N/kz+6hLI+qlBgrQKq1pnkM4sg83OtCGjb?=
 =?iso-8859-2?Q?ScUPW6lSCtPAnoQJvMTCoT5plwV718UKgQCaQ77ZJsNXWInADifxUaYgXb?=
 =?iso-8859-2?Q?BGOMPP1vGcPdkM2p3IMasQpbpL606/SCihtluYZBcjfLctyretImHkohZv?=
 =?iso-8859-2?Q?tiEXhwH/7bbo5VmQ9ueHg6SkIe5AJYyG9Ck74nCJQNW0JiZgkbsc8PM/mb?=
 =?iso-8859-2?Q?FhImU+cCACdtVK8hGdgKZYaWU+BXakDEufS3Du75Jon/x//fRMXAfI9Zgb?=
 =?iso-8859-2?Q?3fqqZ7pNRfqKv3ftYniy0X3DxF0Efc8FaPFstA8k7Fmb5/SsuuXPtTmoRD?=
 =?iso-8859-2?Q?rUE6UX8S+XFeZVY94iTG6UZfUdhU3SBH7mYxGDHIc4h04uMvNpwxqzIZC0?=
 =?iso-8859-2?Q?AfO+/xORhNqXi3mbMyNH88RZNedF+ZTd7+TD5GVZ1YJmiKfZ6O4H4Om3it?=
 =?iso-8859-2?Q?PMRpbNWtlwuAgOGEd9uJJWW4Pix4LNub3Fsogt1OesRW5RF3foD1bYNjLU?=
 =?iso-8859-2?Q?N3R0/vZK/YZ88I0W00lRL+DdgiahOgHBcWuC9SeXz2Glso1IVM2A86RGA6?=
 =?iso-8859-2?Q?8dHnUwdfV/UgmGUk9QJcqHemIv0mJHJyQyiMN8cdC61H0Hm7hcg7YQM9Te?=
 =?iso-8859-2?Q?rWQV3gmTuyuHS7EzBQE/QdOK9UoTX7HvxG?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ce8717-218d-4f3d-07f1-08db8b9a7797
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 16:32:55.0522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsPNMx/UiZwaykWaubn513i6jjX+Ey2KDaulHywupyxsi2S5E+ymgqPFjUKYS0MZa+Cqy6lmaCieGlY/0+ECZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 16:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184761

OK, I got it, but correct me if I'm wrong, namely packages differs between =
builds?

I have found this link https://docs.yoctoproject.org/dev/test-manual/reprod=
ucible-builds.html for it with instructions
on how to reproduce it. I'll give it a try and In case of problems will try=
 to ask.

Cheers,
Piotr

Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: niedziela, 23 lipca 2023 17:53
Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: ODP: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: =
add support for ACLs and xattr

Hi,

> Hello,
>
> On 22/07/2023 21:03:43+0000, Piotr =A3obacz wrote:
> > Hello Alexadre,
> > this time everything should be fixed and working :D I have tested it th=
rice:P
> >
> > Additionally I've discovered that somehow, during all these patchsets, =
an extra param "--numeric-owner" has gone from opkg-build script,
> > which is important to store uid(s)/gid(s) as numbers instead of names i=
n tar archive. An updated patch has been already pushed to opkg-utils
> > upstream.
> >
> > You can run it and tell if everything is OK.
> >
>
> This ran and mostly worked. The remaining issue is the reproducibility
> issue:

I'm glad that we went further in this problem, but
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230722-1a1a=
_7s6/

> Unfortunately, diffoscope is not running on that large set.

unfortunately I don't have knowledge what's this link about. Can you explai=
n me a little bit and how is this being run from cli?

> BR
> Piotr
>
>
> Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedde=
d.org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
> Wys=B3ane: sobota, 22 lipca 2023 22:55
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> DW: Piotr =A3obacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add supp=
ort for ACLs and xattr
>
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>
> With fix pushed to the opkg-devel:
> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> opkg-build is able to create tar archives with ACLs and xattr.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.con=
tains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_=
FEATURES', 'xattr', '-X', '', d)}'
>
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --
> 2.34.1

>
>
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

