Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DDAC3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 23:46:25 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web11.129692.1673739978965500017
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 15:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=m47iR8jU;
 spf=pass (domain: nxp.com, ip: 40.107.20.48, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uafz/n2XYtLt4eckEXYXK4lV8f1crLLlItrye5fN0poshpIgyMOaQRb28qtDiZtNygWxhXJIOLWTu2kgR6H92MRAeKlU8dMxXgtuicQqAbZMkNSFDGAPypz7E+cYLZlQ1jShB9TS+cb35TPpiFTlDGCyqyP2gJQb0Ycrbx1mwO73vcaKufIIyIP3hpmZnmrTq22TSy6HllZp1EWbcnZ41L5r/REJD/spzWQvjs+NKmMuH0nKsH48HUK11nkH1YuhP0YbDzs2bYplfL7XgkVYIlPmVuZx12fgQ5YkPnqTq5JAxzS7mq/slcJ/RoSF32bAnKhg839k1ZODdvM4pjPfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bDAsI6niXj2EyzBHHx4Wvh8MZcClvYW16j0sJJtURQ=;
 b=lV8XTE27Vk+PRST1KTqscbuO9ZmpOwaeRI/DuwyPFIjMhQvwciFiGnMFpgWbNVOkdSI/Jj0WDcC6+YfQw8D6GBwiZm+32XZEEHElEcsb+QXVjoTwuY8NCpC0HeNRqsp13lP2uMjMrXJ/xlWqthDFEqaly75+fCGCnDOlpFGMwcEIZwaxWhkon6xHmvTbxMVAdRV0dvnH/XDUt+z0KWwj8FaAlP7k0wPhBd1V+9y6W+ViNBlMassqbAoAt2b9XNMeJqJu84yAzSikk9kKVCBef9Z060erDNc/XTym526YL5l2uSlIEfGcMxXFBiDJNLws8LwkGZLBnTQEgpkSfNIsQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bDAsI6niXj2EyzBHHx4Wvh8MZcClvYW16j0sJJtURQ=;
 b=m47iR8jU2kMow3N8w5o9dQM6tQlbPTyLXDCC5ot77cp3Ft3BanCKiEDMLFiulOtYT3EZX81oJsvIBPY+qTgr+HfOCZSMi0qZViST0OM68DHxvSpBvxCPVIphZB7sqUHztSQPQyqb70MkWIkrQ4YODUPKogDTPUTtxSL13UzubOo=
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Sat, 14 Jan
 2023 23:46:15 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d%6]) with mapi id 15.20.5986.021; Sat, 14 Jan 2023
 23:46:15 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gstreamer1.0-plugins-good: Fix libsoup runtime
 dependency
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-plugins-good: Fix libsoup runtime
 dependency
Thread-Index: AQHZJ6GrEajwI1vly023qur9JUs84K6eJK+AgAA6M6A=
Date: Sat, 14 Jan 2023 23:46:14 +0000
Message-ID: 
 <DB3PR0402MB3852E6FA0B992C1C34CFF270E2C39@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <20230113225155.1730922-1-tom.hochstein@nxp.com>
 <3947c8fbe920b1fe97b1a933ef5f4e32e8fe174a.camel@linuxfoundation.org>
In-Reply-To: 
 <3947c8fbe920b1fe97b1a933ef5f4e32e8fe174a.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0402MB3852:EE_|AS8PR04MB8980:EE_
x-ms-office365-filtering-correlation-id: b3e48243-120e-42f2-56ad-08daf6898644
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5XAnjYLKQhoFV5K1imEkpYNy6yAKyLm4LecnDsr6Eo7oLxbLj/q+0yeOjzqR6PF6SK1GYgzMEDorCi91o7jZqA5mzo9tM/HW62yM9beQ96SgCUCjYIn5krRJJXxE3AjCB8t04HVM0c/KKB2myi06sgDHWQvTxEVg1SoqEVUWNBRe7zcsVXTvJvhjf5Vw/Wcma9xastVL5iO/n1Jp40qxleM96SnSh+M6FHoubBEYdc5qbksfEGd8x0Upgr9fc0ilQl+WTs3hUtiSWNdghHstKejBksp5bDJLf2l2ZDtjhuh27NhdLcJZ9hfHyOFhJYMRZZGQte0SQNJba7AvwhjW6Jz2gwqKGfOBOchMYBsF3jf9CaGJDs3FnXopY2DZ1Nf0kfpTk0IBT4n2p4xw3D1YGWFsStRVS9c/pS9SEM/spJdenIZWBi6B/dx/EnTFa1J967jxhnhHf7ZO1asM+tGJLwjxaJ1ZWaNRM7e/NmA63HbrMFoDWTM+sv1zygoOHN2AqYIZm8r601jNQyH1c8hNcfvOMH21FnPTu4iq5IvKwep+swTrMx1C9jNVVo4S+EwEw4kG1u/zisrCa90lqlPZ3f5RR8c6czEKn9/E3SdAGHiXfMNjnm3wAF1CJN+gSE8rNIeVtJP+2moVNhnDO28VYs5qhbTpsM2cRcKxhm00io0tmMT9sta8bCUSx9eQG/jgbaOepv8rLfIoLB+dCPhzgb8fiBfCZSPfZZpHwi7y0Sc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(6506007)(2906002)(53546011)(55236004)(76116006)(5660300002)(122000001)(52536014)(44832011)(83380400001)(8676002)(64756008)(8936002)(66446008)(33656002)(38100700002)(9686003)(478600001)(41300700001)(38070700005)(45080400002)(966005)(186003)(66946007)(66476007)(7696005)(55016003)(26005)(71200400001)(66556008)(86362001)(316002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WWQd9g8v9z6H1RuU3oRcrPQzdqvTlBf+AB9a6rkvR7pLYDAP7gZAnwZ6qJv0?=
 =?us-ascii?Q?2hjaeLlKKdV8GiPIZsNavqlGxvb+gDRDxon61H3/roNu0ENQhm/ZEJ0XFE0l?=
 =?us-ascii?Q?m78ZTIaoYxcyaHUSw3bGOUctNOSu7cFqQJlgv5mGSEd4qYSzDGc5TThU4mdo?=
 =?us-ascii?Q?79PCvVWJxu69X2ZuTMExb6gX5MQ1enf6HVWTKVbJ4vErZbJUdkYqHXmJcPgC?=
 =?us-ascii?Q?YHpI+Kl5jL143MA9a2xDtFnJwLVNrNHGRXnJ44xgWZ3lhEsBN78PTYUtNKV+?=
 =?us-ascii?Q?MwgAheYyKdQiZsGHUxmGbcyZh4CeRNKJ4TQfF5d/tvu+doibGcIMiNsKh8ET?=
 =?us-ascii?Q?nf+DJSLiDfZ80/cZwpsWuEGXnJOJeQLS6g2UDqqeSOk2ClooFaF71NmC3RSy?=
 =?us-ascii?Q?q7LpEoBu1VFOkPtb4w7HLHKd3rFSpDP2nzZHTHUxCaa5bUfattkx/K/fvNtG?=
 =?us-ascii?Q?CfnkjooJGMLSXmy20U+8LnztLkYFvkWwgqvSjWueKEciN+DJRLXmgz8TL4jh?=
 =?us-ascii?Q?ziq4hKTJg/ND6PmYH9gR9TaEYJUlZNBRfvF2tDXenAcQybP3mkm0fJXwUTu7?=
 =?us-ascii?Q?Wp4xIX3tjvcjjh6tYkMJE3lcjPqo0OOTapfUms4KwLAmdlGhFHHkPkN3HVLw?=
 =?us-ascii?Q?ZZNchr4N2+d4jSpXK8mYL46y3bzBls5uec15zCLfWMjiKeA9vqGpQ3qZ8PcF?=
 =?us-ascii?Q?713YM1Wij3oRe68asOh3izqe/PgFOySSIbpFsWt04Zv0B57q4l3deiJuOUEn?=
 =?us-ascii?Q?nFbHJKh9CEGDP6+V/28Vz1Nr0g/tiN6MkhAPvwpwcbDb0AnewC1YIo23Toce?=
 =?us-ascii?Q?BDUYJTzQvkq1E18PNilB29I/xqxa8gOEkF6NyjdTIO/5csNMG4+RBWjhBuUU?=
 =?us-ascii?Q?sdHcgl/VS+oTzn7NNBWfZWoPnCh4gv9JbtMe2N7J/tgLidWjUkb6qrqqQrNT?=
 =?us-ascii?Q?saBpvEkb94X5U7101NSPoFCE9y/D/Z8cUfPWmNg67Mx5IjBYC0C2AhcxLuzX?=
 =?us-ascii?Q?oTjUZytFEXCGEcO98KKQfyAnMhk2OfwySDq4ncPN8R/bfvjwFjjcDyghVoBl?=
 =?us-ascii?Q?jBXswnn9R5adhRxdIFjp6aXB9j/F/g8tdrsM3i52jhW4j8jOFW2BkD/A6QgK?=
 =?us-ascii?Q?hPR8NfvTvmBfGWHqyhDgy6++ZjISCrqJEtEA78UVSW57lHPuqEHQn4vmgWDz?=
 =?us-ascii?Q?IwzHS15WQHNdsXK0C3IviProYXbbvudztZ+LQoApwHLYwg9uKkVMKKsGfv6A?=
 =?us-ascii?Q?ibvL3qBGZsAs/OWgMImjhFN8ABEX2lTNht+MeLdT3hgNzsECPVvm12dl5QfQ?=
 =?us-ascii?Q?yW3iWpGM2IO1ybuliAl51UumRrTXvgy6rj4UH8FAMNmL+U3yXWpBnZPOzc+u?=
 =?us-ascii?Q?EpbGVduD5U0Eh4jn5MUHo98ZgY5+HhVNizD66AOpLcLNH/0NS9LMZBkivrq6?=
 =?us-ascii?Q?YEHd8nDCG5Nw59i5AAxIIQIaauB7vPkcz+Ha+uBh+0w/n/xHgIhR4avH6OCb?=
 =?us-ascii?Q?VEDtpat7dAgrC8ofOI2KDiVh3FdV7ALZqnaaAwCeK69pbiJ/mMBZCpWfk2UX?=
 =?us-ascii?Q?rcOla0aaZsB5o/EKUr4o6OgTOW/w4X+jkCf07Tbz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e48243-120e-42f2-56ad-08daf6898644
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2023 23:46:14.9299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmGyHDvvCREZA7JQf33lt+03w99LI9oT5PIf487mvkESnKEyywjqJeWbLJ7jHUWK1DisHokYUkC5ZwZKX7SKFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 23:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175859

Thanks. An earlier commit [1] did add libsoup back to the DEPENDS list, tho=
ugh it was not mentioned in the commit message, and I overlooked it in the =
code what with the dropping of the -Dsoup=3Ddisabled.

[1] https://github.com/openembedded/openembedded-core/commit/88d30848981db2=
cb7b1f2021ba07e40976cd789f

V2 coming.

-----Original Message-----
From: Richard Purdie <richard.purdie@linuxfoundation.org>=20
Sent: Saturday, January 14, 2023 11:02 AM
To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-core@lists.openembe=
dded.org
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Fix libsoup runti=
me dependency

On Fri, 2023-01-13 at 16:51 -0600, Tom Hochstein wrote:
> The runtime dependency on libsoup set via PACKAGECONFIG does not work.
> The problem is the dependency is placed on the main package, but the
> soup package has no dependency on the main package.
>=20
> I considered modifying the call to do_split_packages from
> gstreamer1.0-plugins-packaging.inc, changing extra_depends from '' to
> None:
>=20
> ```
>     extra_depends  -- extra runtime dependencies (RDEPENDS) to be set for
>                       all packages. The default value of None causes a
>                       dependency on the main package (${PN}) - if you do
>                       not want this, pass '' for this parameter.
> ```
>=20
> However, the problem with this solution is that it does add the runtime
> dependency to _all_ such split packages.
>=20
> So, fix the problem with an explicit runtime dependency.
>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.20.5.bb      | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

This threw a load of warnings/errors, see:

https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F4792&data=
=3D05%7C01%7Ctom.hochstein%40nxp.com%7C2a738415ebef4c494dd108daf6511d1f%7C6=
86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638093125482952300%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&sdata=3DcfdxmtUBAwPNqIcKtqSxdABCkPq6O6S42ZEkn1CrDAg%3D&re=
served=3D0

Cheers,

Richard

