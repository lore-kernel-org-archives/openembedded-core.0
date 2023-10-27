Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E642C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 21:32:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.58])
 by mx.groups.io with SMTP id smtpd.web10.24732.1698442355806070184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 14:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=rn65FNph;
 spf=pass (domain: axis.com, ip: 40.107.21.58, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUu8V/hJyJYqIIkxq3yO05JxMk5glMfIaTvOKq5XAirVmUdrKKilyjg5hgG88FaIynFYHbves43OSTJWAW4brbVD4E1VrGO1L6DTrZJYlqoPb7l1+aXcxlQnJvFPWFI4ONkjxNNiZqy99JeHjXiXHBkjyO1rTvGl39+snLL60ivgWZZyO9YdFct+huprEdwAFw27soGxfvwp/L+xwZRt83QnB1eG+xrRyTy+ytiKMeYh2DWjbknZ74rv56Yamygifdc+64TT+PjWLdAK+Z28Q7c7uW7U3VCWk87PvhCd7Na52zwbUtbMgFZkNTP9E919JjUS9uN8aaxDrPb6Zbt+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFvp7l4sR5APahrf30D9l7h/SaHvJPUcYbZ8nJjlZK8=;
 b=maGIdR/F/w7PcoPvN98e+UoqZBpn4UneKN5Mt04xypzompldoxwFrBklcmwdk3GM1b+gxgGCHmUT1XDnZZ/CYkfLQ9w/8pWvMfcHpAsz7cuz2h3EnEpwhxaWyhUUb94U/Gbl/gfJIL2Jl2RzQwGFwIbZw/gXL1vLqY1iuhy+UguDmK7USxEuHgzxJkUBCu6uMkg0+T+8Xi5ARZLi2oan8vR+7Em3ZDs4WqPVKP/XqYsel44cJOfIhzVxNXBWNgi8ww9dtlK9FEQqINbaBYR9UnYeCVkVU3BTNioXT9ttIsWGCfuwuCEl5ip3SO/vgC8dvWSNYeqb09UkU++EYzEVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFvp7l4sR5APahrf30D9l7h/SaHvJPUcYbZ8nJjlZK8=;
 b=rn65FNphEv0te2DEnwBlKV2bbCas254+Xsrytou6X7l5WYues84aQ2Kdhol0rmVbc9+ToIVJMFL9FrOXzOsD90oDG8iqf/L1NzxL1ZEoq6x9jy1ZiMyHfYMJUilRIX2BtWcnKahE5ohas6jHB/MD8MlNjQWBH9xov4Icqcu3qcI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBBPR02MB10844.eurprd02.prod.outlook.com (2603:10a6:10:530::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Fri, 27 Oct
 2023 21:32:31 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 21:32:31 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>, Vyacheslav Yurkov
	<uvv.mail@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Lukas Funke
	<lukas.funke@weidmueller.com>
Subject: RE: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
Thread-Topic: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
Thread-Index: AQHaAP2lcnwPRJKEIkuhwhu68ba06rBeLgJA
Date: Fri, 27 Oct 2023 21:32:31 +0000
Message-ID: 
 <DB5PR02MB10213B4D8AC353F63C209ADF9EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
In-Reply-To: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBBPR02MB10844:EE_
x-ms-office365-filtering-correlation-id: 7a00ce9c-053f-4357-fd4e-08dbd7343a24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZK4WhFpweW0a6smV4PyQVrWwzq8akmJClZwX/F0zzuX+2lqjyURUal0Ge7yCtYtutZj6hpr8IO84kY2h78o+Nl+N/WjK4CHv1uIzUMh+N891uLGKxGTUrTGC50/6fdXYJl8amMBztS9IbKiL+GhlHhDo1d+xgO6c1Xdkb+POeLrZKftXAjs4NkEsLfIi1AfKsQBhv0wy7xTlk14vLq8vv2kXpwU78eUNaNlInyOBul9nyrSot/Ks965fyrbcIdJLSWiVG6aE1N+uYEDGIRRwmONZyCT7HVtOhhhAW4RsJfFBX/qIFfgWrUafqELXnvaQ838CfkwiLlCmbnCQsswQvirJ8+qdy1eIhZRr3ttiCY3DrPomOBf9We10iVuxmA1G3vIaGpD+X1nr8oXtxQHDEP9WVdalXg9YjnCCb/OL0zHt3/wwLofwxu9DDk+Tyr3ICaHjJ4ASB7cphIqtw5HZwevk+6Ue5kZTE96XvUf5wa81kNfK3C/MmyKL4dvUi+tBvWDKHUnxXhj7HrjPgfHGjb+HPQdhDDpl+7YYoF64aDyS3oUl8iortd+jPTC3UiZp14upbhWK2J5Sx0ZsgyzlQXGgEMXx6qc80es9Ky4ZjzTOw++rbTFUFbVxe3DBRtWh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2906002)(33656002)(478600001)(83380400001)(86362001)(8936002)(4326008)(8676002)(52536014)(26005)(5660300002)(38070700009)(41300700001)(44832011)(66899024)(66476007)(66556008)(66446008)(64756008)(66946007)(54906003)(110136005)(76116006)(55016003)(316002)(38100700002)(9686003)(53546011)(122000001)(7696005)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VvjHzqjJD3vPbXRC0sQ47+lqKqvZd8YWr1QpM2sCWM5m/vP+aMXjUQyCA+vC?=
 =?us-ascii?Q?nKx5gokYTQPeeGDWrkOFTIXgv45nCVmwMJnehxTjql2LpqWGaRxZlv0gpRLn?=
 =?us-ascii?Q?0Fp/25T+COVUHALEda4V74S/s/aUho9EZNiRBmswwm6tpztxjXC+bRHNaCwY?=
 =?us-ascii?Q?Cu7ARzxLYwSePaqOXMXFx3iANylAIR/4x31yLRZxXlqyDTTK24t+eeIT4Hsm?=
 =?us-ascii?Q?FR9csG2RKgbbcoWzUgdn9OJdox1DScBm9zl0fy0WVpZIYW8F/FdTctKeLx2g?=
 =?us-ascii?Q?JR72EGqdXFqTZztYjsS1ZhsAwA4PXhNuAxj+wTKYJzqOXGTfqsb2DjmyRzwq?=
 =?us-ascii?Q?kdHjak49FdyW7BBNVgRfILxAVq5CTRS7Zwq1m9pENbAhq/UEmu4+qtHkxu7s?=
 =?us-ascii?Q?ynBx6CPt4RTEjXibSnhvRel2cQXKX9GbmZd/mzO3ZYmiC5C6GOFxToTdkYkK?=
 =?us-ascii?Q?aeKstMJcJLNCMhWmVZBQxuY0ARexqz8KN2MtrwwUM0sNEvme6eSmtfkUtHCA?=
 =?us-ascii?Q?hfeCA/c0Gc6itDCeGF4Q+NthP2GDpo0tms9w+8Ga1qrfPxLqGOGWc8WZyKIi?=
 =?us-ascii?Q?gH+/HD6b5Q1V2YKqAAqoiSzqgOg6/35DT9b/Dzog2sz2KBqh3L9JPa74mmzb?=
 =?us-ascii?Q?Ak7JPixFHQghbJDb8VUVvbCNU6pynmpfFt58fvuMz86mYFTVcm9k277qD0Dj?=
 =?us-ascii?Q?/4jZocvasjluv9D6lCD/sRJ4GEH6JwxHAD7GzaQJRYbMKpxgBoJVYOPSQzsl?=
 =?us-ascii?Q?BsGS7FN6LkyCsSTjb89VcTTDrLOxDzmj8yC4mH1DXATKPHWKrUWaA5gwrBNs?=
 =?us-ascii?Q?ZPQiLzP693QWZBvQHtDsExVrKy6zSP2OHeCQ5qIA6cS8iGfaeE2QKtzvOIWZ?=
 =?us-ascii?Q?/I6qIpop054TA8Pbp3vfIQ86+HiD3jQnYKKRGxcTqJl/Ko+TXPSB8H5lT8gP?=
 =?us-ascii?Q?iVxhr5Uq2STNUQaCn2jnkDp5p6CmIu7a8QDRBBexlckbtP1Xr6N8oLcBGo3W?=
 =?us-ascii?Q?kTp2TEpimccCIYO3u2OGWLyyoTiuXyE8fPZ7088rXgzIJDdHNeI9f4H8OdSB?=
 =?us-ascii?Q?eksH9FEjtmK9HBm/gSA/Bh8jmsr8/9yM65BGuAIV69m+xiSKLC3jxSJI61xu?=
 =?us-ascii?Q?0UCGSlW4TXJ2HbDq8xXlwAlosq49V0fftl7K4bSTU4lcgq6+YulMHH4YpiTR?=
 =?us-ascii?Q?YXeo8V+4NJ+6gmM7omD5Bwqf2uPelayZu7YsLcb9n32hZLbQn+WSLVDmkGxd?=
 =?us-ascii?Q?OQfTVqfEDG1S8MR+ZE+t6zPJbYII3Z/MNLMc4JBGsr94CF2Sh1k78V9dqQqz?=
 =?us-ascii?Q?42MhtWMGLuO8aNY9rUlgWyedqGX0Svhm8N6QUMXrSH3oPsNarGsxZYnpopQd?=
 =?us-ascii?Q?oEZfggPE7JjoRnINyjd2yan449ygnPRriBmNqa2QZI1zxDkhx9s9rNGKHxZ5?=
 =?us-ascii?Q?noPXwmz0MQWQULI8mPHty7xAnElttu3vptG2IPjjTsIcyGcId8guHpYaeelA?=
 =?us-ascii?Q?FPS4mWrYvfnJUG8BaFpdx/XrueIVRaU6IxFBvuK51nu/U15UtjKMTsDDd54W?=
 =?us-ascii?Q?4mFJo5Y5xbEDRNiJFFI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a00ce9c-053f-4357-fd4e-08dbd7343a24
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 21:32:31.6560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grHAfgRodycppnxN3C6PQFcnH8SqQ8Lb4kpSBkgoQv/0e7NZJJvRvdTN+GGOCm75
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10844
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 21:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189753

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Lukas Funke
> Sent: den 17 oktober 2023 15:27
> To: openembedded-core@lists.openembedded.org
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>; Vyacheslav Yurkov
> <uvv.mail@gmail.com>; Martin Jansa <martin.jansa@gmail.com>; Lukas Funke
> <lukas.funke@weidmueller.com>
> Subject: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
> recipes
>=20
> From: Lukas Funke <lukas.funke@weidmueller.com>
>=20
> This patch series adds a recipetool handler in order to create 'go' recip=
es.
> Each recipe contains a list of dependencies in their SRC_URI
> variable which are derived from the projects `go.mod` file. For each
> dependency the corresponding license file uri/hash is added.
>=20
> The recipe may not work ad-hoc, but is a good starting point to create
> a working recipe and have a working offline-build.
>=20
> Lukas Funke (4):
>   classes: go-vendor: Add go-vendor class
>   selftest: recipetool: Add test for go recipe handler
>   recipetool: Ignore *.go files while scanning for licenses
>   recipetool: Add handler to create go recipes
>=20
>  meta/classes/go-vendor.bbclass             | 135 ++++
>  meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++
>  scripts/lib/recipetool/create.py           |   2 +-
>  scripts/lib/recipetool/create_go.py        | 730 +++++++++++++++++++++
>  4 files changed, 1029 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes/go-vendor.bbclass
>  create mode 100644 scripts/lib/recipetool/create_go.py
>=20
> --
> 2.30.2

I do not know much (anything) about Go modules, but we have a couple of=20
recipes that use Go modules, and I would like to offer some suggestions.=20

I would recommend to separate the recipe and the main Go module from=20
the dependencies similar to how it is done for Rust by the=20
cargo-update-recipe-crates bbclass, which puts the dependencies in a=20
separate include file.

In our recipes we use the following pattern:

LICENSE =3D "... & ${GO_MOD_LICENSES}"
LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D..."
require ${BPN}-licenses.inc

...

SRC_URI =3D "..."
require ${BPN}-go-mods.inc

and then in the ${BPN}-licenses.inc file we have something like:

GO_MOD_LICENSES =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"

LIC_FILES_CHKSUM +=3D "\
    ...
"

and in the ${BPN}-go-mods.inc file:

SRC_URI +=3D "\
    ...
"

Separating the three files like the above keeps the automatically=20
generated parts out of the main recipe, which I believe is a good=20
thing.

And yes, we have some bbclass and some tool to help with the above,=20
similar to what you are adding in this series.

//Peter


