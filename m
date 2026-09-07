Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40355C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 12:34:41 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33693.1788784480297517486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 05:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=G9C/Ai8I;
 spf=pass (domain: axis.com, ip: 52.101.83.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkO4stQDPwHty7njAm7Vt9RUUL2Aoft7ro2hfK2hwOFkmWmGnDhndaAYBBip66uUfEp40tNhpoFQFapuH0hmYGoOi6E2FJcWUTl2Vzv09UdtmadS1/fM6RXrbSmm4wLpca6ChHNGsR4obS/+tEl4FvrfIvqkVfCquI56wbMo2sXgK2IHNYOjMvc6n/MAZ/AwG9sY/Ov91KJLt079de79tHb5Sh1DT45hOEtFh/xTc3BULhkuR2Wlrt4yghLj7Jox0BONbcko4XkmiwsYdY1d1qJyAgywlwTtQ/ZOgeMsPmmOOc0f4J+0O+6NfAtFmc0uU//db57/+eNBNR5LEyNckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWYemYNgVmAz/M8OCdTRsPM4QSETZpIEY9nSBEv2Dbk=;
 b=u8aJ52sjv3m92ebnm4ZtYOuIQwJhU7NPW/IgGRF0Z3lUdGv3uRPTNeCdlM6eIwKpFEKEngLj6CuiMa7F/ioxMSqdMBIHbnLGk8EEYbIxSVEokt8hQTJD10UkI4j2MpXO3T647tiE6m7Wlei9eQhMeBbqI4985dn5d3Mmu4fyt8+/33mk13clPbZ45W/1TmCuT83E6IYeF+wox2BHlnMHZBTGNsqrErFsp29AZcpxdAJjhLQ7OQC4/+Lv8q0gHuI0D3EuDo/gSpkyLrltJDzDJnwnHMGfTN2yM9u5q+S6oKpCxde6z4GBXcNG9/SCzhE4Y71yJknroTgpviGSDUUGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWYemYNgVmAz/M8OCdTRsPM4QSETZpIEY9nSBEv2Dbk=;
 b=G9C/Ai8IiginPR/JqlB2CUzmHAbcg6ROrko4vWyDL13Q4SBh1GTgn1Pz9p1WXE0TBdzgiRRHvWh6TyOOYBpboakDIMJ/ciHBzXuutx8ZcaFRr/rhJ7JPsC5NmyJVMjxdm2g4g06+vtJoNSV3JuVo4slStMETLT93jZQGvVvMslQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU4PR02MB12103.eurprd02.prod.outlook.com (2603:10a6:10:62a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:34:35 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:34:35 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "ross.burton@arm.com"
	<ross.burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] libjpeg-turbo: use system zlib instead of
 bundled copy
Thread-Topic: [OE-core] [PATCH 2/2] libjpeg-turbo: use system zlib instead of
 bundled copy
Thread-Index: AQHdJChMizFwHDfK+0OH+FJpe8xZ87anIfYggBwft9A=
Date: Mon, 7 Sep 2026 12:34:35 +0000
Message-ID: 
 <DB5PR02MB10213DE8AF8C26AD26B726C6FEFB22@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260804154451.2506951-1-ross.burton@arm.com>
 <20260804154451.2506951-2-ross.burton@arm.com>
 <18CD8C22942BD86B.3076617@lists.openembedded.org>
In-Reply-To: <18CD8C22942BD86B.3076617@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU4PR02MB12103:EE_
x-ms-office365-filtering-correlation-id: 8af2f8a3-5610-4b6d-96b4-08df0cdc6011
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 C0GcRZhCdatw/tW53DktujR5sDpawewQjlfm0uVfy3SdjhvpzEzoLXPfsQiiutU/+NfOwW04RLEOmKAArt6CF/NC7iD8SsHEiVIlofP5gIzENq4W7/TvFE+6q31eAqJSRQSABE+bh+WhCgIsNgdiZM7S7yaCZ9/36bTNLRtChsSo4w0picBDLnz+bZEDzgkH3yTMsvTBA1dis5fWts9bpC/PHuIq5BZx+yTHLsQfa5J/WQnDjPh5mKG6Rptoa2sSIOqu8Kq8LCJu5WbTNO//WSxf0dPk+oxQAf3tOoIbcVbwT81o5Y5r02xdIQvyskVv0whrvs2gHUj/aOEffDgSrdiZ6UHnfPB0brHlMn0qqnXT2Lsa5DLRrYM+OBiJ8FECeZ2Tm4sCqzklzsu96XhcIHHFmqzMG5dLxoyleine3Mb1afscjXSFzBmI1NDV+/oIVlLAppvuWwEkr636USjM9l2xo/hkbRlycnkT4XihergfNL9J9+Nmq1o0a++eKLKcKTfDZGYPLUjL7Bh3YCOZ5TzY7NJ9GNYCusUgSIy+Rm0dyXJQjPAk3S+/4L/4PCzYJAomkGv82pj05fYrRghhYVygCdhoCvxFflQ/rzRb6lfPdaqQAvzuaOER4PbPU+CbCjts80VapxrsHfUgWLFPOJQ15pU1FY8/ChVFTaY+y9g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NFRY0w1Nd9F8HGYQ3b8XrS2DNkpX+PYunvRdFlVC8eOEpjqdijv2a3GDYCDi?=
 =?us-ascii?Q?kIaXBCAxlqsVWBEz3R2p1ueNyl//gsxiJfzX36iP3ZuP0RkdZUO/nFWb1wwI?=
 =?us-ascii?Q?N9d2FZNEXxlFMkqo8PC8EpGi1R6ScXXWJDEMDmOJPhivKmobytE5fGuoEc6u?=
 =?us-ascii?Q?lGJ1zvTx0fxMASpZ6/5ZTG04JqY+5W3svAyEMgId7e3xyvgMUhGDKr6X0Z3W?=
 =?us-ascii?Q?IjkVrcYe0dbtYze4PirrTl1XNHunCo10dC0FN4mGU8WugabkJqDeG2gOUDn4?=
 =?us-ascii?Q?w+DRBVvrgp3+mLC+AWozsbYZDmyZGsWO3SWDMTOo0Px5McuPNVcUOjDWzCdI?=
 =?us-ascii?Q?1vfHvlA2amj0QVzizEDDrEWT+DSa7E5LPg0Hi/Un8ukBjTwqY7uxBE4BOBdA?=
 =?us-ascii?Q?o/lRWOLd/b02+HH11zJbeidMlo3hQFQRbPvHbaOwXTyId3HBTdjGS58aPJIF?=
 =?us-ascii?Q?JmepjRBF5W9P3d/NkujtfJ86nbGHd72l4NSXWu6KlzgzWEhxFYuUlzbkQuT3?=
 =?us-ascii?Q?7E92y+qGdWgEwr71juljSC4JmRqF8mu2isnA/vHu3DyigagqJK1AxQyOYpEm?=
 =?us-ascii?Q?w2oKWeMs6oNIHyUmOGe6bzB1usQViOBSSVMIZ3iSiwmdiBsd53vcAX4CQUc3?=
 =?us-ascii?Q?kWyGsOgqOqjxvbuXJzCEHPT9LmdxwU/K5jaJT5lDSof0g1iq4v5oMnpnjqk6?=
 =?us-ascii?Q?OKaTAnLU4IAQZpfJ2FWSScZ9+vQAs2AQgijrMAhJcksGQJ5g4e6/PRhSvM6W?=
 =?us-ascii?Q?YAxzsBancZovsGiR4gT+1sY3YjwG+ZuK8wOggC2v8QOsM7EcfhkH/59mMJiW?=
 =?us-ascii?Q?WCM19FT0X8tWfnbGJ3z/QaIjyijicuqLmzagNVAWKCzcHP82m8x1qIJuIe09?=
 =?us-ascii?Q?2/7IjYYQA5KAKKiteXrtKAKJ3n91oWmCWRtNL7d9KX3TUjZYi6LNKuwS/DJ6?=
 =?us-ascii?Q?1xamvYA0TQErFfaPDeeeCPtouAlATPSp11lBBXedYY0qUnJKAYu6FWAsgfvv?=
 =?us-ascii?Q?K2o75mIoRtPGUgR5bFSXjtoRjCFT7SCaazaSA/4w59bZyBz3QAw7TyM1I10H?=
 =?us-ascii?Q?yvZl1KZf7NKcd0PjwWCW91L2e+A/1dUAXLd12H9LPpINNA9zcp8ro2LoSguT?=
 =?us-ascii?Q?yoL7USrG7ARht3pG7sz5NFe5MmZqgupphi+nyu13ZNpw6jlR2s7mjHf4c/+C?=
 =?us-ascii?Q?E5aQdFzSHW7/OfKWxLU84M0xx7HRchxUnS2FVgeSqzS9RRJp13s/hSzN1htS?=
 =?us-ascii?Q?QulfX6a68el9yKrhgydKyWYlzaACgpXHZDFLu6GWsVjlZdMSmj5Gpl5dM8hT?=
 =?us-ascii?Q?Dxi69jLWbBr3NSyRiGIQj2pED+lEkZu6vZJ+LVF5IetZddrUoyr7zlJ9HWSs?=
 =?us-ascii?Q?+cNssPjus4NeM1tAGspD/xjEyq9+XYOXhAbmtHlLSCV7JneUo24SMruxizXk?=
 =?us-ascii?Q?byIkbJ8PHHBDblK/vMoimm9iVvl2tmYc4+guJYQxLBMjwUsRchyb3hugXIZU?=
 =?us-ascii?Q?qjCnGMYzkKAONmUnPY/9lIsm5/6XFByGnkb02IynIe7T5uGDjrtw43TMV8nY?=
 =?us-ascii?Q?AGipoPQW7PqPz80XCiyZxvlcHKmQ0xtV4HcGIEGUrJM8e9u5a6orZJ33ZcQn?=
 =?us-ascii?Q?nFZh1IXpztzJxjrqj+r4peqdHXuJ++FPNqAkRTcO5H/iXS1HLJd15T+etL+9?=
 =?us-ascii?Q?CvfnSuC7xbsb0gKB5Qhyy6RKSFg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af2f8a3-5610-4b6d-96b4-08df0cdc6011
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 12:34:35.3448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLsZY9+CxX6pSjeUY7M+0QD10bvlwgmeTAaUYia5Wzn5Kxwn/3+Z3eoeLfPXdK60
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB12103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 12:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245252

Ross?

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
> lists.openembedded.org
> Sent: den 20 augusti 2026 17:12
> To: ross.burton@arm.com; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/2] libjpeg-turbo: use system zlib instead=
 of bundled copy
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> > Sent: den 4 augusti 2026 17:45
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 2/2] libjpeg-turbo: use system zlib instead o=
f bundled copy
> >
> > The libjpegturbo library bundles a copy of libspng which in turn bundle=
s
> > a copy of zlib.  We don't currently have a libspng recipe but we can
> > stop it bundling zlib.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb b/meta/r=
ecipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
> > index 89504419762..7a548d4e9c6 100644
> > --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
> > +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
> > @@ -5,6 +5,7 @@ HOMEPAGE =3D "http://libjpeg-turbo.org/"
> >  LICENSE =3D "BSD-3-Clause AND IJG AND Zlib"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dd21daef3b4b318f770620550=
59c72934"
> >
> > +DEPENDS =3D "zlib"
> >  DEPENDS:append:x86-64:class-target =3D " nasm-native"
> >  DEPENDS:append:x86:class-target =3D " nasm-native"
> >
> > @@ -28,6 +29,8 @@ export NASMENV =3D "--reproducible --debug-prefix-map=
=3D${WORKDIR}=3D${TARGET_DBGSRC_D
> >  EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_INSTALL_RPATH=3DON"
> >  # Ensure the -fPIC options are used to avoid -native compile failures,=
 e.g. on opensuse160
> >  EXTRA_OECMAKE +=3D "-DCMAKE_POSITION_INDEPENDENT_CODE=3DON"
> > +# Use system zlib instead of the bundled copy
> > +EXTRA_OECMAKE +=3D "-DWITH_SYSTEM_ZLIB=3DON"
> >
> >  # Add nasm-native dependency consistently for all build arches is hard
> >  EXTRA_OECMAKE:append:class-native =3D " -DWITH_SIMD=3DFalse"
> > --
> > 2.43.0
>=20
> After the above change, one of our applications that uses libjpeg-turbo
> fails to build. It fails with:
>=20
> | CMake Error at .../recipe-sysroot/usr/lib/cmake/libjpeg-turbo/libjpeg-t=
urboTargets.cmake:77 (set_target_properties):
> |   The link interface of target "libjpeg-turbo::turbojpeg" contains:
> |
> |     ZLIB::ZLIB
> |
> |   but the target was not found.  Possible reasons include:
> |
> |     * There is a typo in the target name.
> |     * A find_package call is missing for an IMPORTED target.
> |     * An ALIAS target is missing.
> |
> | Call Stack (most recent call first):
> |   .../recipe-sysroot/usr/lib/cmake/libjpeg-turbo/libjpeg-turboConfig.cm=
ake:37 (include)
> |   code/CMakeLists.txt:20 (find_package)
>=20
> I can solve it by adding find_package(ZLIB REQUIRED) to the
> code/CMakeLists.txt file, but is that really expected? I would have
> assumed that whatever CMake files libjpeg-turbo installs should take
> care of that automatically.
>=20
> //Peter

//Peter


