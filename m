Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E51C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 13:36:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12768.1787751387636167731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 06:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=cwHbhOJy;
 spf=pass (domain: axis.com, ip: 52.101.65.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jn9dA3OX2DAssYJlytQWcoA2xas4MjcC/8+SdHg9L4ypG3yShk9aCrpMVJ34Y93n4cVt25bQF+rQQCcaCWBacyW5PFgY+q3kaO1AIZj2MXF/wsBiJnlBGRdgs46UeHSzWHk93O3xpR6p0zJuIa7baYOnvQrq0o7nJLM7/H/kdRtkq4SzaK8eCKTvLHS1+PUeXtKM+owwMP76gscH6QFN80E+ZWwvUCQnnA1nsq90pWGoJfpQyZtjuFnnpyC5wtiCxJ46Yyun+Ym8DGI1s4+k+hAiypvHBToA5LzbhZRbxv7b6EBsb81sG4ccBMcBd59jnoF/5qShBp33jFb2FZLK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YyGDkg3kw1f9sK2ZK39gmiKk6hwk1AkNSUri3f9pYs=;
 b=msBH2mH7PsZXt+u7cdcg0EW8A75aUWtZFlE8CJ6+hLS+jTRPEpmH4wc+ZEo3M5glCnlLv2JW9UsE74LsWAq6LXRHuGcIlZnQC8+XHavSopoOXJ9+aSOnGYtUEX7fYpIvoaKJg04OChs/2l1cjqz8E5fgIZqWcqcUbAb1bb0yIy2jgnFK4NPT+es1g4YxIqqH7LfuelZQpc8VXVrULX/K9fgTgVFYl5O7ncUjV3947D3w51D4RN/tydscsX84sZoMgf6D4u60wKPcQYrMddhvHnSu7RcP2SnnYxhgzE521FowEzwP2PDwGgPAxcH0g3e+vVChGX8RQJx5LuE/FyP5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YyGDkg3kw1f9sK2ZK39gmiKk6hwk1AkNSUri3f9pYs=;
 b=cwHbhOJyVbLUtHx9nmkMcAxdveyH0CbKSsEwoS3CTd6cEo8/w/YeCkUb84KEForMmj8+RaTO1k1DbNvhSuWhm5zyMxDxazNi8hzmFVwZ4eKZQQmqsJh04uZKPQLbTo0zVxNM45Sud4WjBaKx2u4RiLhh8vbckczEKI1n/l7p9W8=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8642.eurprd02.prod.outlook.com (2603:10a6:10:3ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 13:36:21 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 13:36:20 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Gustav Lindberg <Gustav.Lindberg@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 141/141] boost-asio: Add recipe
Thread-Topic: [OE-core] [PATCH 141/141] boost-asio: Add recipe
Thread-Index: AQHdNUGnAPmhc432OUOJCecNT/7IJLawUTBg
Date: Wed, 26 Aug 2026 13:36:20 +0000
Message-ID: 
 <DB5PR02MB1021380BA9031F796A5B547ACEFAE2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260826095936.307786-1-gustali@axis.com>
In-Reply-To: <20260826095936.307786-1-gustali@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8642:EE_
x-ms-office365-filtering-correlation-id: fc7bb425-287f-44e6-9379-08df0377039d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|38070700021|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info: 
 turEfNSAO8m3gxF8vrx1+LTz+5vnQ/Gg4nmy5TTDONUWjABPFN97TP2fI8S9RjwQJtIBYWQ6XER5Rc9LsBaKhQEfiStcyBdvfKB6E9x9BawQKu3+UINdF73UmR6qs92M6ChGNSlX5lezFjdLlfhxVMGYpgqdPBxr5shYunT89L09e77gbJaHAxxVa3tETv2RjtODc0g/GssoBMvbrlPaBogNMe40RvLZaIcXziETZnB/anLfAm6S83+J8YInsUFL/TYzQ8js0voXhhevamjQi8f6bTEFp/6mFI33cS6VMBx+0N7DSb4+UXbsKJGU4fublRuu3sfPN4TBK0oeYKpiw/9VFbg03nfzMnxVrln1U80inTs71EKq8EKVxkJEii638PpDvd/RT6ptIHZgcJv0ImQFYVBHbH/1PlOUltfkU3cO65iJzBrZZofBEA03W+3p+fqvomcagumrgtUWfAU8WHIU2UQX31XU2/QuWQ80Mt8jSTUYlhY7O/6hqs86e+wHOwctMlkLUSIoMnEvCf7JtRlPxzYCqBMbg+5EFAGyBQnGWK0WrNyLOxOlaLaJ81HCW6tzsoGAyQBqJAW/FCD0Kxe/fzzD6TFJURzuH9thnujQ455x8TYQZT5K9drm3KktYwbS7aS5Y4k17QAI9SNiMdcQj0WOzE2i+ZLnMtS9IkZmg16DPOIrzVyZ6ZRvzx53zMoXbmV1U8OoVWBt5g4yW0ugG3g2x6h68Ty5+j/xNpg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6N8tsbeXeSjZXwyCzvszqboJvnVVThASYMAmmvGs7FMt4QniCwCzrfjslQ30?=
 =?us-ascii?Q?Wf4mCQ7aL/20aQLUQzBigdCKh0EoRUkYmjByYheRXjZSXk/LlVor0vIGk++B?=
 =?us-ascii?Q?PyhnLgrnSc7HMssFTsAbVXva299HOLptttyeAk8WY9MLtSU7hkNsBUpIfr4b?=
 =?us-ascii?Q?HEDDKqKEpR+9QmQnhHowMmO+vBzy8BgYhmpTqJWTLF4hK+pAseOOR+2TU3/+?=
 =?us-ascii?Q?dCKfoIpsQbu45fP8J06XhoBTCBq4sKprJ0LrNikozTx/FuLvF9Gmo/pSBo5C?=
 =?us-ascii?Q?XexELeZqUMBi3ll8MhzSPJyhG3RbVCrFzJjsrzj6KgF0Cei3knaa5TOm6PCK?=
 =?us-ascii?Q?yOdlTorErHyLn+cr+jMmk0f3P9BXz2h5QvN3iBJGnqBOwg1jKRr/aCul7+vd?=
 =?us-ascii?Q?7SlJhGXzBlvfnDMtBCob+m/8kroKC2W2AAdTFupxsYz0SqVjcUsQm+h5NDkA?=
 =?us-ascii?Q?tC/9yuy1vZj4kjfgShSkn3t7ol7ZeZIp9LLtm/O2P61EYvNbxzwdu5GdrrU5?=
 =?us-ascii?Q?upTTQVPpXp9dCqGwP1L8DHxTdq8K2CfQLCY2FLRYebTWVV1y2u+7YJ+nhN0M?=
 =?us-ascii?Q?CpKOxA9rYSYSTXMBqXZq2JqFSGz1ztQ6Jhq/cxQU7ddqaZyHoCZ7wdRhSFc/?=
 =?us-ascii?Q?Y9wLgTMf0HDGfC1JtlNiYnxlUj/3KMsSMRES5CyX6D0KeDBNy3+A9qm2Jvz6?=
 =?us-ascii?Q?tZaa1fGs9qdvRpuv8z560h5Y70eYhfWNtCQBJA7eoARBIwmvNSudhW2SdrKa?=
 =?us-ascii?Q?uhLIGxSRJYYKgxzYHH0EBO6OYNWXoaWaT25t77nAoxGhU3qPCTmaJx6hKz3x?=
 =?us-ascii?Q?8/uaFWph86jSptPmoJsS7C/fKWE8J5oonUe8d+vI2lk1FS0a5hN0IMq6UAFb?=
 =?us-ascii?Q?CZ+MTZY67cDtsBwizG9BmNOBS1Gxi5yIQCZOPEdl0UHOQgmCuWmCWSoGpsV2?=
 =?us-ascii?Q?cMV19rFmiNpTF5HgsGM88RLSPUtpSQAP28TmwiuaA0qsm2Vxjmove3PGeWBW?=
 =?us-ascii?Q?NoP2F4m9JaqIZ2JHpf8PjKK+XHNPvVNwEjXzIJfOHGS1OKxRo/5Ls7sNV/38?=
 =?us-ascii?Q?IyTkokDJRg/QrMLhcUkdUDmwlHpZfJlVZm0zIMWubzwxV387WA/Jf5epVj//?=
 =?us-ascii?Q?JcUQ8HZxifVXpR19tKqt7E4rYeUbxPNJ6pKVbzZM3ydc8uN6xljB2hPmZJ5X?=
 =?us-ascii?Q?k2Hww3sGjoSv4sI0DKIazRiUZ9BpqrIEHST/p2lrUmLoeZDV6x/hIx1MQO8k?=
 =?us-ascii?Q?Kkyz9/cfBJgRLN5GTIcje1acy2S8ICwqnky0s556a9sbhBocZOWrgdD2f+qS?=
 =?us-ascii?Q?mlp3Epzvtx0moy5kkLmbxUc4j6tLAxzotKi7VdPNQGPQmxWxoa1gzoSP7/wJ?=
 =?us-ascii?Q?24CzgGu+tx+lozQaJXEswlc07/+91s7YJegL2ukqE9T7ubXr6nJvJi6w/ZrI?=
 =?us-ascii?Q?Mv0OLfVnsNHzI5IkWyvLttdipo660jXG64ktXVoUT29mc6uUBYkFUHKsO64l?=
 =?us-ascii?Q?69CBLNiTOEdTLN//Gg82WiTvcr5pbrQ5yQxxFIXk1Pdij6oyJ2bkCZahWiSh?=
 =?us-ascii?Q?vrT8//W72E5RLgz5rpWqoBwYuhVTycI95mgwSS8IxtfcYdNvnKPdifTDp72g?=
 =?us-ascii?Q?N8SEAn897oaGz9JyBLPOim2WX8eBG6411F+qrSUG9d6wcaO+ASAlawR2EuSY?=
 =?us-ascii?Q?7668oWFB7m3/4o2iUsG8YTuVVOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7bb425-287f-44e6-9379-08df0377039d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 13:36:20.5993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLgIWaakcDaNzb1QJUwJJibY5xlt8NkWvm2ClJ7kzuY5ukqcOot9V5nBJh7/V3qF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 13:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244397

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Gustav Lindberg via lists.openembedded.org
> Sent: den 26 augusti 2026 12:00
> To: openembedded-core@lists.openembedded.org
> Cc: Gustav Lindberg <Gustav.Lindberg@axis.com>
> Subject: [OE-core] [PATCH 141/141] boost-asio: Add recipe
>=20
> This is needed to build boost asio as a shared library rather than a
> header-only library, which is needed to save memory.
>=20
> Change-Id: I3ac5ed0ccadae3e9d042b9c4eed3a1ab7220a009

Remove the Change-Id.

> Signed-off-by: Gustav Lindberg <gustali@axis.com>
> ---
>  .../boost-asio/boost-asio_1.90.0.bb           | 33 +++++++++++++++++++
>  .../boost-asio/files/boost_asio.cpp           |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-support/boost-asio/boost-asio_1.90.0.bb
>  create mode 100644 meta/recipes-support/boost-asio/files/boost_asio.cpp
>=20
> diff --git a/meta/recipes-support/boost-asio/boost-asio_1.90.0.bb b/meta/=
recipes-support/boost-asio/boost-asio_1.90.0.bb
> new file mode 100644
> index 0000000000..ea534ff172
> --- /dev/null
> +++ b/meta/recipes-support/boost-asio/boost-asio_1.90.0.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Boost.Asio shared library shim"
> +DESCRIPTION =3D "Builds libboost_asio as a shared library from boost/asi=
o/impl/src.hpp"
> +HOMEPAGE =3D "https://www.boost.org/doc/libs/1_90_0/doc/html/boost_asio.=
html"
> +
> +# Reuse Boost source and licensing metadata from openembedded-core.

Since this is aimed for OE-Core, the "from openembedded-core" is redundant=
=20
and can be removed.

> +require recipes-support/boost/boost-${PV}.inc
> +
> +SRC_URI +=3D " file://boost_asio.cpp"
> +
> +DEPENDS =3D "boost"

Move DEPENDS up to between HOMEPAGE and the require.

> +
> +do_compile() {
> +       ${CXX} ${CPPFLAGS} ${CXXFLAGS} \
> +               -std=3Dc++23 \
> +               -DBOOST_ASIO_DYN_LINK=3D1 \
> +               -fPIC \
> +               -shared \
> +               -Wl,-soname,libboost_asio.so.1 \
> +               ${UNPACKDIR}/boost_asio.cpp \
> +               ${LDFLAGS} \
> +               -o ${B}/libboost_asio.so.${PV}
> +}
> +
> +do_install() {
> +       install -d ${D}${libdir}
> +       install -m 0755 ${B}/libboost_asio.so.${PV} ${D}${libdir}/
> +       ln -sf libboost_asio.so.${PV} ${D}${libdir}/libboost_asio.so.1
> +       ln -sf libboost_asio.so.1 ${D}${libdir}/libboost_asio.so

This assumes the major of ${PV} is 1 and updating it will be easy to=20
miss if the major is ever increased. There is a function that can be=20
used to extract part(s) of the version number, e.g.:

MAJOR_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"

> +}

Use tabs to indent the shell functions above.

> +
> +FILES:${PN} +=3D "${libdir}/libboost_asio.so.*"

This should not be needed.

> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-support/boost-asio/files/boost_asio.cpp b/meta/=
recipes-support/boost-asio/files/boost_asio.cpp
> new file mode 100644
> index 0000000000..bf00c8ff26
> --- /dev/null
> +++ b/meta/recipes-support/boost-asio/files/boost_asio.cpp
> @@ -0,0 +1 @@
> +#include <boost/asio/impl/src.hpp>
> --
> 2.43.0

//Peter


