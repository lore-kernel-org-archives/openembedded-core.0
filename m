Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC56C001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 15:53:55 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.85])
 by mx.groups.io with SMTP id smtpd.web11.28489.1690127626070350178
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 08:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=aBSOLjNr;
 spf=pass (domain: welotec.com, ip: 40.107.241.85, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3H/bBikjp38GjRD9Z2ndx8wjOWOnq5Wb4xw6uwJEUZ9Jxf46OqEry2xH6TKHrYu3h3WnuncIo2ewu9qtubFKajgpK1OcptrYZ0/hHevQKSRBkSiwU/L2kdOgxaMikB+1Y4xHyV8hB/4OVuTWGBQIEb/QZOMIzq3p+yIo5OPfwrvIPUKZwTdx57aFPjZVVIpVIiLlMAG9PFDAdq1/xALQSggNrlVdeT9EhEvixGmScxBfvLOKs58+sz9y3J86N6QWCzTwMKNikzswgqbhkmwS4BFlBs7Ub+w559kU21B1DzjfXPKXwRKkHGTNxNLKxNZ4VGhpIJiNWe2odmjI4L2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMg39KBv44Fk4OOWGzphuzu8cs+7vEGz9p4UK4ch+7U=;
 b=fL7Lb/80Ou703jR2l6kdoS0xAZ/I0d91IQ4grIgCJTweHMGgd4Ne80vuBGNeUpalrJwbUqWnmUgutEviDRNBE4/HA+xnhHgs2m3SpWzqb9JzZLpC2oN0vEHBHdKNns48nSyjyl7mDsTy4PfOFtuDyfeUipmdtX3WCAA64lAkrqQ7/cOa34oM2OjR2lMg5IUbLnRvuuRemHM+E2/TjFykM/Hf+sw3vkmT8xVIsh1SSvkd0liI5haCY7ZfQNrCUr03NkwgPD7PPc5s2FrFaCHbyQxNGO/mliGim6J6yrojO/sheWmuaHChwSKrKEP88WXsc4ACuTUDDtGSu0n/eA8a0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMg39KBv44Fk4OOWGzphuzu8cs+7vEGz9p4UK4ch+7U=;
 b=aBSOLjNruby8XQODqh4IjCX1aiPjpynQhZH2q9lrttTHu+PKtoRUv4K1LR1BFl7HSnMudC3jndXnBpdYOLAZR7PEv1c2JBBLMHzZ4GoxoRupmtEBvZQ5ifksdraWuG+YN+ss9pETbiBEzKGOOuTaXD+xgU/WTM6HSmMjeX7FN8k=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Sun, 23 Jul
 2023 15:53:41 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 15:53:41 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Topic: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Thread-Index: AQHZvN72YDZpL3/QxkWU514c4O3nNa/GRH9lgAEvtgCAAAyviQ==
Date: Sun, 23 Jul 2023 15:53:41 +0000
Message-ID: 
 <VI1PR04MB5373D30D5D3DEF3B36296708913DA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <17744C0B55ADA271.25264@lists.openembedded.org>
 <AM6PR04MB5368ED123188D5223D0F14B7913CA@AM6PR04MB5368.eurprd04.prod.outlook.com>
 <202307231504286d15f3bc@mail.local>
In-Reply-To: <202307231504286d15f3bc@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS5PR04MB10043:EE_
x-ms-office365-filtering-correlation-id: 846845f5-2aed-4f5b-52be-08db8b94fc8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EpeLVRVC3D0ekkKi3r91Sn5r7vUVcEW3NJAYyol0vYTqxmZXUU/S1hteefWG1tw7rOOK4aw9g79omw/Uy1lBSPXSMfqS7Qeu7nk43iOa8cxurrW0LGjuQliOCjVOcgaPoGeZG0ROFGBMC8f/Wyz2I99TEpXpeUwEGokDlmgl5Tk0dIk+JzHp2dAFlolG6p2AySKbJGyJH08KFbTkBgTbFIeU/74hT7TpsKUEAYvh+zZKB+fnly74g7ImGCzJMWl/FUs51C2DnzzWTRYd7vbe7uwP5tqtJ0HYgCL5JSKGLeH1N5IsFYgj8z/jkJwFizpOUjPkqg4UXGGZUyaoqkxNfSzJGbAtwULlSnIyd4K8QDsM9Yrgj0gGJAo8gGmg0xvrjViZ3f+u/1dPcH1VoNhOtCD3i19xlxOPazWQMsHooBlCt0vsQf3fSfMM4EgSJu1lMkSZnQx89PVU8md34Kh2kcIaxCkt9DXjPhob1UDr0S2Bs37Gm1IcQsD3nrgocWA+F/D/1FowaUzOo3hN/Shb9w3BvZxZzFOYyYz4sJWXN3TsuBRRalbibGrA5aMldolna7eY+J0KLPhO1BjiA19XexaO7F0OOhcBOV9jrtDHu3c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39830400003)(366004)(396003)(346002)(376002)(451199021)(478600001)(41300700001)(26005)(6506007)(186003)(45080400002)(4326008)(64756008)(6916009)(66556008)(66946007)(66476007)(66446008)(76116006)(91956017)(316002)(71200400001)(8936002)(5660300002)(966005)(9686003)(7696005)(52536014)(8676002)(66899021)(66574015)(2906002)(83380400001)(55016003)(38100700002)(122000001)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?N3i19oIf9oJCA/sx9nZdI6g0KcdYPxkBczbhwbwnguNmus4UgFR7d1FSxq?=
 =?iso-8859-2?Q?4jqTdHnXV/XvNqj3WVUr49XXiKyOdHHsXxIYWB6JQW/vtrSt6O9gUF/Q4F?=
 =?iso-8859-2?Q?GJhulELZkvQ00QDvKllJQgDBN3w0P8YQpU34/YoM56x1YaTWm4N0L5pcO5?=
 =?iso-8859-2?Q?N1DBZ1gnn+7hpcDLXXr9H9QP2RfKcsEKvYp32h1gLfPHYmfpiBwng4IW4h?=
 =?iso-8859-2?Q?YkrtHaC4oVGXX3QbixZBjDKyV71J4whCYZwyhaRv1H31VcJxeMKHhDHPay?=
 =?iso-8859-2?Q?0xg7y/csdoIrqu598gtRHa7AbC+0bq1ItSUYtcBv4uCbfJhTqBBP/1JhcZ?=
 =?iso-8859-2?Q?2w3JNidiPyJ8tmzDMO4jephaxrfElCb4C+By6w45NsqQouEscqIRsb+GPx?=
 =?iso-8859-2?Q?3JgeUYI/6Gr3q+GJ990ywtwBAuxKw3uC+cqCmJijICxUhalJeZF+MX3Cxl?=
 =?iso-8859-2?Q?KdKA1BLGFb6tgkojpDvI6k+fpfacHcNv9k1YIvhb7kzJ+C2fti6IkmTBLc?=
 =?iso-8859-2?Q?S+SdsSlKs+UGb1OY8inbXdwtot9McSWrQ8MJHX8Hw6pAzIXNsMMT6ayHgD?=
 =?iso-8859-2?Q?G3mQ1KKrQrQW4d/G+nrJ4wWKLhammnMTARNib2gDJ2/+16xdh2tM2omN6d?=
 =?iso-8859-2?Q?I/YRbjkcc9S0UAQC8U9VJEH1qc2j81tmuNWJ5SAeP/eIovq4mf3ruUc+GY?=
 =?iso-8859-2?Q?N5EcpZmQriVj9BD8mcQ9S6hhYTDU7XOM0wt+shLXYcaLziSFs8E3Nw2KmA?=
 =?iso-8859-2?Q?upn9RMQKSzCMnb9PNK8XATMu20IBsUFfw9cVEvwpqgI+v3uHZseLrCfW0U?=
 =?iso-8859-2?Q?Uo8hlqgRrPjvGfDxGIhfttS8MYdZGRMU9iFD6HSt8iUuphB/rTkJ9xw7EW?=
 =?iso-8859-2?Q?uZt5Hz023FH07k12ngqxP/Uts/Fp6ruLsWjPBEWxZktFForgtR9FJfC+Ez?=
 =?iso-8859-2?Q?4T2FsZqFBzdnJZfvw2Ifu0SqaJp4cV7z7xuGyrDBuAShomdwc3UN8lYECu?=
 =?iso-8859-2?Q?GtXVXHJN0bPEYiryKSOdZsnlvM2A6SOg2tGivf20JIn8P4cvV2h3tsZuU8?=
 =?iso-8859-2?Q?IQ1djAHD+D//VWhT/hxQmgmJG983HpaaIAQ5oXGyOlFt5b89wjsmO85d6/?=
 =?iso-8859-2?Q?FmqGR6PZp2sEPTn7rVVJ1lFkr4WBLyrLRT9xVWU1GI65xJ/NIHd9K0R7nI?=
 =?iso-8859-2?Q?gv+N6QU33y28lzXGnsZQDsctyrxVGkDTqJUpghwW8ftv3Vi81XpDVfhI7l?=
 =?iso-8859-2?Q?ywtx3j+bdgMP6OtvJHux0Fvr6++EZLQBHm7VFHvGHz6+hewa07GdyvzcYG?=
 =?iso-8859-2?Q?iZsMx96xnfCFgyJbZ+zjkhwYnm0acZdWFm0rx6AxsTU9zFsxj6U5IySSku?=
 =?iso-8859-2?Q?KbtAqUs50WPuDa4EgtE3c+ZlEnwgT1BBz8x67wHq81aWWZX5/rWCfJEVK9?=
 =?iso-8859-2?Q?nT2Hyq3f75nvYiIyHEfW1jeG2Pm9aFKc0kbZn8G09aEj6Z4E44MQ8dzfMu?=
 =?iso-8859-2?Q?mum7dXJ4xx/3l3Pvc1T40Oz4aej+MHZBaDUh9+v1B/5W92fTmrTcga0QOi?=
 =?iso-8859-2?Q?4TeXgtrptUA6f46BgwT1Vkl9zzXsttMLjV3f3Kz2oioABJA5Qch5kGZT0f?=
 =?iso-8859-2?Q?mHBhqroasbVck=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846845f5-2aed-4f5b-52be-08db8b94fc8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 15:53:41.1253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlcKcaaY+r6RJZKot9IbzI+zMEbfwZmzpseeVs/fHKJyBrG/E3eO5Zstm040q18iE6WsPAft6M3G4RpszSUYnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 15:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184760

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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184740): https://lists.openembedded.org/g/openembedde=
d-core/message/184740
> Mute This Topic: https://lists.openembedded.org/mt/100301979/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

