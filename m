Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E147C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 13:40:19 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12743.1787751612553033690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 06:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=nHmz1Am2;
 spf=pass (domain: axis.com, ip: 52.101.83.53, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcUW/58lFLAU0Pc8R9drrcsS3WC9wm5yaAWG58/qKJCHvQ5lPSPNRAV7kxZe0pmvPRDWHK2AcX8ZjPjaz8pcIliq0yha/DN9aFGyKzLmF9rwasPeG6fXRCXEpGIZve59Mw0YAhbxthb+2lRdoSfzCY4wd+5tlTAmt5AmkBazVJd7nNe9/dvIgYre4dWle+586J4JTqqFfII9alINeW29Laj+iCrysw/L8Yd0SIWsa0XhOAEs+RxbK//pS1taLVa6V6cMsuzOtuDb+lcsTA5TY7+lPA1ZRHYs5+ePQx7NqDKucIwfoducVHXcx5eAlbVSqIrpL0wRI1HlPl3Vdlk5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiQZ3aS290cgmu3szGs/r5Ki7HWKJB2AmBGi33+kcs8=;
 b=oLro+OCeeBzgFW392qNsl1R4tCWp7Vf/QQfvXws2SD/7gwCyaP3t2m9vubYp1y8/txzNglp7PxcQN/82HIgTMx1Z+xXcXNC5f6yAnqrgE864vUBy8x8vl9rF85feFQj2do8r3wPwT9KuArCkh7oS/jljhs7J1OlpggjjaQHgQxOhux31eyYBa95YKzIInLJ4dVCXMCp+qg8nmKgcemadRMpDnX7SaVm36wWxPQ1FNqXhiPCEI4OcfKr1wKIgT/94xzdOOpU7jjDXqbR5B9FkGG3IbI9xgIkWBpiMjwR51wIQ+eH1RvVK+xB478RLHf1UioTGzCwHh/Yskam9lrcy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiQZ3aS290cgmu3szGs/r5Ki7HWKJB2AmBGi33+kcs8=;
 b=nHmz1Am2zKaJIprp+o/M7w7IYUltRHD/dbvYuCSoy2S7W2vcIA6RH4WCBHVCawBow+X7blk+QMvg+2dCFlXpP09MS1BIOsVYer5aGraAp4KZBaR3KHvtUso1sDS/HGpy4hhxzyuXtw0AiciMLaIlV/b4QBqApmGfF8FUB8rOLn8=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AMBPR02MB12140.eurprd02.prod.outlook.com (2603:10a6:20b:724::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 13:40:07 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 13:40:07 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Gustav Lindberg
	<Gustav.Lindberg@axis.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 141/141] boost-asio: Add recipe
Thread-Topic: [OE-core] [PATCH 141/141] boost-asio: Add recipe
Thread-Index: AQHdNUGnAPmhc432OUOJCecNT/7IJLawUTBggAAEd4A=
Date: Wed, 26 Aug 2026 13:40:07 +0000
Message-ID: 
 <DB5PR02MB102133B03E0DA89C4E7678142EFAE2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260826095936.307786-1-gustali@axis.com>
 <18CF5E6A5FC73F8D.3446132@lists.openembedded.org>
In-Reply-To: <18CF5E6A5FC73F8D.3446132@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AMBPR02MB12140:EE_
x-ms-office365-filtering-correlation-id: 8ad52067-a3d2-44c6-087a-08df03778afc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 S/lAtyjlshciQx5uB0jJ2ZYKu42wRCZ3B8Mf6nvwqLbX0+1swiaru+Df48j2/w6DEUzYwrjzTJj0ihAmCCAE4j82GvzAi9dZ9lcLmteAs77Wd1/KI+3Oq1lB0oqOgBEroJlyitvyk173I79kfVh/7sFPJjdHOlBtSMJa3JBLPGhCX7OOaTT/ASeqacFAUTxabQ7Z34pd0IIx+qTQH1S47OVGNinj4xYHloZx6m2HJ4HAXIQ9Q5X3wQpZxqk+9vtQYE9IOh0TVyUL+dsMKmROpgBXNT4gKrUT3WBd3MhOt+1O8pJLbT740qNdSbYChgYwQNKm7lyHx1tBhUYwKTaad270ETfm9GuSBsZSZ6nXQDmyRTjG0+sI+g+eYrNWT8PZL9mIekqdYgRCxPYhyKB3o9vnt9R8omVExr5ZGljjhtnZ7/rgDH5dF8gUnGh40wuf8sP2GJZKBraW9edtp9aJDAHCoBhYMo3nuTXROUusxLcBTvfqHzKka9MOAc7HYnRNcalPys+i/LqjHvupVI+wJfilN4606e36WnjULEC1+TQo2I4khOq/NG+J47wtwl7UZ7cxSIHS2z1fTQnpegcWywizX3Yy9Ue69ZpiydDjn6qzvKrnl8v8xTJ0cF83+N0QZHucTdfdUZzjBZu9KScJYLsShZ++LVKBzefLVKOd5Ry9kYgCCwQm8XXwJUOjzs3ZdpZIVq48ZiHAJ1YvFDOO0yHBnAd2CbMG3UI8BsSSVIU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?G9ekwWqTY0QWXZ9JXZ0QSZX01xXNgJ4dhS+zMKoRrtEtGv+d3pyyHE/mnO5S?=
 =?us-ascii?Q?2BGumi+bZCMFzBYv2HHUxwsyc/y/3E+fgaKdEMphZbU4a9xmBDeAfdvWXZVz?=
 =?us-ascii?Q?qCJxhWbh9+yzmUsh64dOEeORLEp2UfErBud3ArRxH+QHE5vjvqbM09jO3O6B?=
 =?us-ascii?Q?XcnGNO5VfRtwHyanMJUEBrTEK9BilX0m/SbmI9yzNy18xzpHoW/60sVZJxgf?=
 =?us-ascii?Q?FZCReZc2qMeNSK/QINXb762kPIxGx6r4u3h//TKX/XSnvbvclZzFXawvY8Lz?=
 =?us-ascii?Q?bbTAPaLEvMQ1ZDfMoiDTnNWAoXaJDn3r/A/fpAmJlJVNdIMnyr5Au4sUwWnb?=
 =?us-ascii?Q?TZ828JyQ/2oVL97SAkLEBKMvZRXjeCoCKqjwAAN9UbTQuSuB1eqMcGuqj/5t?=
 =?us-ascii?Q?lUg8qqONEcnmmqmG8moPhtS3rxjVN0APbyCmFsV5rReOlfhMIhn+2xxwMJa+?=
 =?us-ascii?Q?5H/g62ebu5FOkeW8O/LsmotBbUII9pVDnzZ4YSRpF3byl//zZySx5l8H1qwz?=
 =?us-ascii?Q?WVKByIRAhhsrQlDr3fFJ49jSOcsmCZ5LNFcVFpBP+Ze4m65oO5TDa9LT9d9N?=
 =?us-ascii?Q?xtyQtwdRx8zrmLpiQW3OxC2699ecN83Cf1lE2/kMpk9i8olKMCGoE2jeDlRr?=
 =?us-ascii?Q?EthR0VSdHfIg+XYydwv+6mVjUYv7/T6844M1FoJQb82wTUK5rHOyWloCGVfX?=
 =?us-ascii?Q?UPVCai2ivzBEs/tPTFJqDJIvh9T1kDS9GwyQ6k4WX9pLF/SQ25NjCx3CcwjG?=
 =?us-ascii?Q?/jLO6nkom4THsWuupp8CN1SM4F0P94d2RbjuMsJWZH/xIcSW7vu2G6h0E2sf?=
 =?us-ascii?Q?uDuK5Z74Amli4LUzskCq0NnHrIs5wCZqb1dtuoPOQtiZI1w+tFg83dBR9wIJ?=
 =?us-ascii?Q?/kyCeefGVZhCoJOc67UChaxYBrxr0FTDyMN4lMeeRsmUx4Rok8HQSdq38rVG?=
 =?us-ascii?Q?koxu++moZf2PTfeJQvGzUBUHAO/9+ntEVOSd1TxKZsMDTDpmbzZVrIEghMy3?=
 =?us-ascii?Q?9Src6XQU6h5ll2xZxWaWLnIQXO3hKxXoQhaz4yt/Id6XvXvdEqX/lgVs1TRX?=
 =?us-ascii?Q?uhEw32bPFARdZc4hP9T6J1oWqZLF1roqXH9Q/Sv45BWbp4gmIopsPN4wkwPO?=
 =?us-ascii?Q?LD33OSa782O6oTybQXQivtMxYH5I3s5tviSlb7PRI+Mm609vzPwWVcsqKl5H?=
 =?us-ascii?Q?+cZEK6qzo5JkYxPguweDyzoMnbTwUovDE8kIacp2bcVFh7llWQTVdTELnB3g?=
 =?us-ascii?Q?08B9r1ni+eV9PlT9r+nqhKd1YPhTIyw+dAzQRCCBhCza11kw+wBg9kBYsOxj?=
 =?us-ascii?Q?TXodufLXhZTLgoeHCZmG3YQfyxOhHj2FUviGXbk5heqmFTRiR54mtR9jxzvt?=
 =?us-ascii?Q?06I7L9eGRpzxeTNKzU6QQuhZQRdEiIfBkjb9xrYjuqL0uDhGbUyqyq5j+bQj?=
 =?us-ascii?Q?8Ol5O81Q928nrR0zCVrFZuotTZZ2B7ZuzwYkRKd6rJ5ybgfLCEIHCb59abYP?=
 =?us-ascii?Q?XYB7SC8TfKvo1tWsz3a8ytZ6svRPv/0+4Sd2V41nnmm7Di83BUYZX20sUdRO?=
 =?us-ascii?Q?SoQMwP3zwbU1hjPmOTMTd43R8nSb5Sxkyr7JxgAv2u/Pe7wDX1G8ZmR+qURT?=
 =?us-ascii?Q?EYeeSBAQhNn1cFcXC8aJjgWjw27PF896hUE9Yxpdy/hgIksTKN2tOp3fKY8f?=
 =?us-ascii?Q?HnObrIbGLt3ZhEiNvx/7xz5aHLU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad52067-a3d2-44c6-087a-08df03778afc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 13:40:07.7123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylUe6C+jsjchH678FndKyJVqKCm1Nugzwev/XnnNdhDSBkOa/pX1KhF+6q7FABPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB12140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 13:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244398

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt via lists.openembedded.org
> Sent: den 26 augusti 2026 15:36
> To: Gustav Lindberg <Gustav.Lindberg@axis.com>; openembedded-core@lists.o=
penembedded.org
> Subject: Re: [OE-core] [PATCH 141/141] boost-asio: Add recipe
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Gustav Lindberg via lists.openembedded.org
> > Sent: den 26 augusti 2026 12:00
> > To: openembedded-core@lists.openembedded.org
> > Cc: Gustav Lindberg <Gustav.Lindberg@axis.com>
> > Subject: [OE-core] [PATCH 141/141] boost-asio: Add recipe
> >
> > This is needed to build boost asio as a shared library rather than a
> > header-only library, which is needed to save memory.
> >
> > Change-Id: I3ac5ed0ccadae3e9d042b9c4eed3a1ab7220a009
>=20
> Remove the Change-Id.
>=20
> > Signed-off-by: Gustav Lindberg <gustali@axis.com>
> > ---
> >  .../boost-asio/boost-asio_1.90.0.bb           | 33 +++++++++++++++++++
> >  .../boost-asio/files/boost_asio.cpp           |  1 +

It would probably also make more sense to put the recipe in=20
"meta/recipes-support/boost" together with the current boost recipe,=20
and put the .cpp file in "meta/recipes-support/boost/boost-asio".

> >  2 files changed, 34 insertions(+)
> >  create mode 100644 meta/recipes-support/boost-asio/boost-asio_1.90.0.b=
b
> >  create mode 100644 meta/recipes-support/boost-asio/files/boost_asio.cp=
p
> >
> > diff --git a/meta/recipes-support/boost-asio/boost-asio_1.90.0.bb b/met=
a/recipes-support/boost-asio/boost-asio_1.90.0.bb
> > new file mode 100644
> > index 0000000000..ea534ff172
> > --- /dev/null
> > +++ b/meta/recipes-support/boost-asio/boost-asio_1.90.0.bb
> > @@ -0,0 +1,33 @@
> > +SUMMARY =3D "Boost.Asio shared library shim"
> > +DESCRIPTION =3D "Builds libboost_asio as a shared library from boost/a=
sio/impl/src.hpp"
> > +HOMEPAGE =3D "https://www.boost.org/doc/libs/1_90_0/doc/html/boost_asi=
o.html"
> > +
> > +# Reuse Boost source and licensing metadata from openembedded-core.
>=20
> Since this is aimed for OE-Core, the "from openembedded-core" is redundan=
t
> and can be removed.
>=20
> > +require recipes-support/boost/boost-${PV}.inc
> > +
> > +SRC_URI +=3D " file://boost_asio.cpp"
> > +
> > +DEPENDS =3D "boost"
>=20
> Move DEPENDS up to between HOMEPAGE and the require.
>=20
> > +
> > +do_compile() {
> > +       ${CXX} ${CPPFLAGS} ${CXXFLAGS} \
> > +               -std=3Dc++23 \
> > +               -DBOOST_ASIO_DYN_LINK=3D1 \
> > +               -fPIC \
> > +               -shared \
> > +               -Wl,-soname,libboost_asio.so.1 \
> > +               ${UNPACKDIR}/boost_asio.cpp \
> > +               ${LDFLAGS} \
> > +               -o ${B}/libboost_asio.so.${PV}
> > +}
> > +
> > +do_install() {
> > +       install -d ${D}${libdir}
> > +       install -m 0755 ${B}/libboost_asio.so.${PV} ${D}${libdir}/
> > +       ln -sf libboost_asio.so.${PV} ${D}${libdir}/libboost_asio.so.1
> > +       ln -sf libboost_asio.so.1 ${D}${libdir}/libboost_asio.so
>=20
> This assumes the major of ${PV} is 1 and updating it will be easy to
> miss if the major is ever increased. There is a function that can be
> used to extract part(s) of the version number, e.g.:
>=20
> MAJOR_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"
>=20
> > +}
>=20
> Use tabs to indent the shell functions above.
>=20
> > +
> > +FILES:${PN} +=3D "${libdir}/libboost_asio.so.*"
>=20
> This should not be needed.
>=20
> > +
> > +BBCLASSEXTEND =3D "native"
> > diff --git a/meta/recipes-support/boost-asio/files/boost_asio.cpp b/met=
a/recipes-support/boost-asio/files/boost_asio.cpp
> > new file mode 100644
> > index 0000000000..bf00c8ff26
> > --- /dev/null
> > +++ b/meta/recipes-support/boost-asio/files/boost_asio.cpp
> > @@ -0,0 +1 @@
> > +#include <boost/asio/impl/src.hpp>
> > --
> > 2.43.0
>=20
> //Peter

//Peter


