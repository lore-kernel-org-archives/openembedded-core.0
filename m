Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DC8C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 15:54:50 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.77])
 by mx.groups.io with SMTP id smtpd.web11.142629.1673798089185087032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 07:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=QG7FH60T;
 spf=pass (domain: nxp.com, ip: 40.107.13.77, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGYNHnRZo+tFkknvu5NBMfzDd4Pnthyh3pPZpI8lIadu7rK7IRzU02liLOl0TzvNeHJmBQKzFeU8VCS2hlRRvnEaN/72QGDT9YMYMBlLQt85/eYbhyLrvqhHSpXNVmrDqTc5DHwM/pkgNp6ck3XnGALnccY8gcEf6wxG9aD768hlX5/TWFV83b+77lJhEfuvR6Xc8mWVattGN5e4BNqkQwIZpKF62OPoh1ssD1bImib+oY5S8iRdDB8P2jHz7L6Kzs7Q1Pru8nNBQIXxpHKAZYBiyVM7QJnNyHA/qRL8meOi0b+Nqp57FdKLUmT5+lyoJ32584W6DLe7u9ObxNFLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ie3C4Im6RBupknfsWyoj6cak6gMh3B/BRXt/7qCxQ0g=;
 b=TWGKkR1iL6UWZsxOC4qqukG/RQhoYdvb2zGpDfjrZDbkmI9lP6+d0SCtm/MPTgb9QkT/CvT41mPsI2C7ZBucfJhwM8i5a86hXydU3v+3zbdV+WVjz2ahb4OhiAvGa44IXaGQX+QrX4AnjfzY4OiJxGz4i2MbT1+wM7nPvRvRGS/SVfWzG9S3Sq+digIKlJrr/D97C0KzAe06Y0HXUu+dumTCocytV/5CR/kbn22ARALvLUqJViSywzTXOtFqYdDgefEUDTzS1ZY2a1T18J/XeL+9JjRZ45JZRlwWGQMoOfW2irz8VKK6Oe7jg94EVpp17Ds8tU+fFoXm0kPLPOHxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie3C4Im6RBupknfsWyoj6cak6gMh3B/BRXt/7qCxQ0g=;
 b=QG7FH60TiJ6RUpaoqiKdREjVmei3W7F/qavSgc8XJFMpk9ozdtQlhtOM0AYVpbdFIcSq29fJcN6OdBto5AmOoUlIlPhHVz6FS0NipkE31PbSIygRNb8IO4+l8xEkd5rhnzSwp6xgPoMj0bnJdaPPCkVNAwedN6Zw6oX7s//mgBU=
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by DB9PR04MB8075.eurprd04.prod.outlook.com (2603:10a6:10:25d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Sun, 15 Jan
 2023 15:54:44 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d%6]) with mapi id 15.20.5986.021; Sun, 15 Jan 2023
 15:54:44 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-Core][PATCH v2] gstreamer1.0-plugins-good: Fix libsoup
 runtime dependency
Thread-Topic: [OE-Core][PATCH v2] gstreamer1.0-plugins-good: Fix libsoup
 runtime dependency
Thread-Index: AQHZKHLmXPhNeN+zKEW4t9n7UVTfZq6fla0AgAALGPA=
Date: Sun, 15 Jan 2023 15:54:44 +0000
Message-ID: 
 <DB3PR0402MB3852E2AE8423B74D676FDD09E2C09@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <20230114234936.2242153-1-tom.hochstein@nxp.com>
 <76323aa4a372a29c19bcb7baee5ea24b3afb2b73.camel@linuxfoundation.org>
In-Reply-To: 
 <76323aa4a372a29c19bcb7baee5ea24b3afb2b73.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0402MB3852:EE_|DB9PR04MB8075:EE_
x-ms-office365-filtering-correlation-id: eb6d494e-cb10-4d7d-cac9-08daf710d20a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kPvmvCj809+zDzcetZlAOJoRE3gFyTQ4B4iygXCWWqw13T/bDhvNlAxbg14ETkO5aVliOBefCUz0wtQ+oMz/qpo4lO/FjM1PDjHKa0/q0Ooh0AJc5djhuRoj553pvvk1q5mp3NlscmEQmI/anAh17TLkPzZXAAKKn3utyRugMlyDrosfiAGt9DIWps9zPitib95eI3hOFh2QPwj/xPBZVQh8mSGJ7r4284K/7E/p2mq6eX57rbD36LbmuL4BT9HaSyjNRZEJcrbG5qso2MwWJXq5P8Da8iMmRoxSEEJ1DtykQ30N8LDS38+Q3XZGtzS7/10It69dVXm2hYVt8inPW7JMnoQyraOch1VlTnLBqOXrgbk27TKDYl52N7gbd9J+CSRaY+6Q0rjekuQiZNU67QnxFDeixq2UtDaHLL8tFptGHy84d1feSBaV8jri0D5yxqY53El8S/eIQx0kLFxYa85I+Uvt1+No0dlXIdgh5xeHpPNRbiVIUaXVtN8cXl/sRDnxgNGeiM33qzBdyHy2pzgE/EzzEOsx1iW1mP32mYkahHh5LaHnfgY3C1QA/DGuckmGnEg0Vm8iXykyKvH4Ie05z0Y2bTdUP255dFuMs4Y+uLiekNs+AdTSXv4W4bXIRF7Gf0A30aeQJjnDuAP5FimAqagW307lF9adKnsCIpv5S5nsSak8X6BCzWODwJeyPuVRxah/XRqhax779efR3x4mVCIk1gsKv9xN6CvRMq0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(38070700005)(86362001)(44832011)(76116006)(52536014)(8936002)(66476007)(64756008)(66946007)(66556008)(66446008)(55016003)(8676002)(2906002)(5660300002)(83380400001)(122000001)(33656002)(38100700002)(478600001)(7696005)(966005)(71200400001)(110136005)(45080400002)(316002)(41300700001)(55236004)(53546011)(9686003)(26005)(186003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7Cs8deJBJng6EA5X95NLmFPEpoUZMhwA4kTS2Etk+/xjZbRFzezgaqXfX0qR?=
 =?us-ascii?Q?qe63oUMLme2wcpOtMcdhF+MU+sRxyNanB/qnx6c6IRWuGBji2CrFLQR1F5hU?=
 =?us-ascii?Q?e38P15M2U6IKtSpG+bCnl/mEp1Kn8YOPPgnstBzmq7ekAIaHG8Ags5DMNd4S?=
 =?us-ascii?Q?tzSDwQDZrqkRvyOutX46CRHF7tu9MT+fP6SaBA6jqRJrqyxV+3QYbQERk2n9?=
 =?us-ascii?Q?pq91LFwqN1kNclap21XJVSkQo7VhzDtaFMR+5SzlInsOvzx71T+5CvCg8kjH?=
 =?us-ascii?Q?o5IF1tgby5p0zhUTcgaRaM7RCBB/M0fDfW4E7pCpUebSd1fK/7RDURouDsoa?=
 =?us-ascii?Q?N/R7FtkLrCQIqW8/yFn1XbXaay9WQHwKQ2qGhM+50fp7t3sGqokVtM6lN+iK?=
 =?us-ascii?Q?loDndv/nNtXifDmFGJBy0DfcHI6bOKbGLQ7EZk0sXWAAsxQ6ivgF0fCUUbIC?=
 =?us-ascii?Q?fX5ZMqYm7L5//OmeXuU9jls/jZEGcRR3zun149cEZVp5vVAWBHqIFgQxhmtX?=
 =?us-ascii?Q?XHwUCp6NJ6QiKvRjG6Pp72Zp7iB7LHRwy7UDzxusT93XL99WDfzoRiE4agD1?=
 =?us-ascii?Q?oh4aYzx4CCaYK5wR/QSwAcBu3B4F6HrbSwlTDXfwDbL20SsyEtNjCnTj4XA0?=
 =?us-ascii?Q?NbpVfd5t2Jx6g2JLWxx594nXQ2ow+26ZoZC7bXg13TL1uNvetb5mbvdjmJFK?=
 =?us-ascii?Q?tBDjNrhWbDxO74ih+P9NV20diHnjHDMjbL1Fr5fmtLUhPI/WjEuz4EwciazS?=
 =?us-ascii?Q?Vq6uTi6ZpMl0LVPOqAHTxXclA/gFk4E8t8+NQJcIPKh2N7dtG5yQwZOnT7OE?=
 =?us-ascii?Q?EC3nvtmlPCUc8ez960u9PtOx3hrjPa5it/GUE/1/CoyVtZ6pXYEb2aUc+WRt?=
 =?us-ascii?Q?l4+6Gei//19zL2nBZ715PksY48wD4SHmcWdh3PyMqt9KO0YJpk7aULi4jkPq?=
 =?us-ascii?Q?7/gjoR9kU9+zsk5vjl+pn6ja22SM/p2WgAmdxmKV1+23pGZgdtb3G/9I3QPE?=
 =?us-ascii?Q?CstBWJZGIPtLiohjUdVTfwSYV82DnPNF6UY6rhVIPbYTCBCROMJ5WHA/uUz5?=
 =?us-ascii?Q?DGQICQScoi9IZmaPIIYJKlTbz0TjZw9a3Srdl/UVDHmomivXBd0w1fV26Fgf?=
 =?us-ascii?Q?5AZI4HYDS+MLHCLfAsBTcMkNq3r4reVOcrlYDng+4Y0vdXOLjkX4dDZlwtix?=
 =?us-ascii?Q?y5TobnSt148jZKD1rOaX01Zbe66LHP1VFrTP3ngk0aoPrHW8HAOsVP7z+LMH?=
 =?us-ascii?Q?+r58oRqqAzWbbugndppXzuMJU0KiJKDPh2h9qt8j9635WT4fw9vlqhQyxpGd?=
 =?us-ascii?Q?AcXUAtMpLwykIV5AMeqENWj5c25B0pyDp/LEYiVuA4Qv9hZGwpZPBd5XpVbg?=
 =?us-ascii?Q?UYAJXs38LwmLngtYI3rXIrfW7fKdKLpKt9lbyQBtcxT2MuluGIBXdnrYNfqF?=
 =?us-ascii?Q?0MWL7xWymsTMgwxH6GuNF9kz2Xnuo70ltPlwxot4zc1M1BDeQY5prZGKy12Q?=
 =?us-ascii?Q?H331XfGp0xSdZAdiz+b3vLbKmnyyb3wMxlnUvlVUWU2wcMCSluIpfN/CxBp9?=
 =?us-ascii?Q?FEuKdTU6VrVhVQLVP+kPEMQD0DNJg5d9fkSh1oV7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6d494e-cb10-4d7d-cac9-08daf710d20a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2023 15:54:44.1337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6v3nRT489L1SRf+xp9stvgaxd1XyBbHlwy7R1yQqFykQsohCJVpujSG9zRKCCPo74WtF15aC3z602084Ees+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 15:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175887

Okay, will this do the trick?

+RDEPENDS:${PN}-soup +=3D "${MLPREFIX}${@bb.utils.contains('PACKAGECONFIG',=
 'soup2', 'libsoup-2.4', 'libsoup', d)}"

Is this a general rule that explicit RDEPENDS require explicit MLPREFIX?

Tom

-----Original Message-----
From: Richard Purdie <richard.purdie@linuxfoundation.org>=20
Sent: Sunday, January 15, 2023 9:09 AM
To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-core@lists.openembe=
dded.org
Subject: Re: [OE-Core][PATCH v2] gstreamer1.0-plugins-good: Fix libsoup run=
time dependency

On Sat, 2023-01-14 at 17:49 -0600, Tom Hochstein wrote:
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

Better but there are still multilib issues:

https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F44%2Fbuilds%2F6551&data=
=3D05%7C01%7Ctom.hochstein%40nxp.com%7C2519f1815a0e4f78782c08daf70a6dc4%7C6=
86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638093921412421859%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&sdata=3Dtr%2BSVqrVpQ1zPOMB8bDURNFWyurODBuk8SZk0o%2BOvCo%3=
D&reserved=3D0
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F52%2Fbuilds%2F6425&data=
=3D05%7C01%7Ctom.hochstein%40nxp.com%7C2519f1815a0e4f78782c08daf70a6dc4%7C6=
86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638093921412421859%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&sdata=3DdE5w5xWhVoVARs9hl9FGrzL1ckK2N9ARJ84hmdAuqOo%3D&re=
served=3D0

Cheers,

Richard

