Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623A2C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 21:36:48 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27344.1785879406869690097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 14:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ZaRFSWQn;
 spf=pass (domain: est.tech, ip: 52.101.66.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nai67f/EqqtKwhIZNRLnRgj18d8lzumVGlPIq+TCPgwOWQdqcuM4koZLwhV/Kby7X0ItsjkHYRNseS3d6RNnfB2ySm+iNm1DC0RjGoiNLgQJRHxtGtxLVMA1SbpGXeGCy14hTHHGqEW0EVD6fJHtfqfy3LC7lAJ2L+3reCsmPnSAYkeROhx3DdkuaYrGBLuu7UbvIoweJupDm7bIxOKTkhC41ajAz9WGsrhRERbRMzC84cwFVtTBuuXl9mu9hWUR12nEUfabK7nOpdMYz23jQjU1L0U4OMY/K2JXoISXpsktCTVdLLweWUv6zHWYSkCjPX4DY7CiM86j3ZHYus6iHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIVqXyTYepZc6YT/4Z0rv6n4eVjlkvjos7N2TSMamoY=;
 b=eWtuE/Rk9MDho3HJwxWOYbrIQBl12LlrzMFtEU8F+PDIbfajZM0mUVQosEP5aqjZRYh2Jr6jAYogV/b75cOWRSBxXyAWUNTyw3aRjGqM8TpYzytuIM4dEMecWOJDEUvO1XfDnWg4gYIo0qGLuWHko0icuRdOX01hv7tuzv2y5zy9GSAg4WpLGNKZPguIT97AfjJJmISQAnwPs1L0QrMfgAoF4OS3oqQ4i4BifMcCt/JEtcD2r7Ql8z8uYBHswf/2KTRBsxKmxWzBZKffUqD5rg97qJvpg0hcu6SUUSkKTqcskTQcYvIe16uRiBEKrYdi2pskdd3ENc8bzgpMC7OXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIVqXyTYepZc6YT/4Z0rv6n4eVjlkvjos7N2TSMamoY=;
 b=ZaRFSWQnf+3DT6IDVzNrD+pryyzSbVdQ5bjWERuhidVRKCFOrezJEw74V+tBTYxMfKMt8HMnLDoM2vWcyDqZiPx7GZw9JPpgcb/BuvUbJG8rcKsVl8s0yZIk4rT7EvOCwVEHRWv7E9hQXU5/akIKkqf3yqZ+bV9CaGY8MiFf+H3W3a/d3AgW2fqvqC37Bo3Hp3HRbueruM5/YTtFJATGVuRVSDE+2ELCE7jHn26LTnO2pz5T0E4D5qlDtLksIVcwj0h8OnnLq4cn4paH+qX8bHLhtne7OsCRWvMF/NmhKdWD7V5ASLF9o3P2eG6s0oFtOMcR0W8pVYRlwfY3/BKLbQ==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB3P189MB2330.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:43b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 21:36:39 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 21:36:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 5/9] libtool: 2.5.4 -> 2.6.2
Thread-Topic: [OE-core] [PATCH 5/9] libtool: 2.5.4 -> 2.6.2
Thread-Index: AQHdJE2rVboIlOcp0k+qt7Uk/L7R0raOaSZJ
Date: Tue, 4 Aug 2026 21:36:38 +0000
Message-ID: 
 <DU7PPF66507B2D7F686F5CF25824702B130F3D42@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
		 <18C899AE0F118A3D.1990914@lists.openembedded.org>
	 <18C8A8C4FB56E625.3417489@lists.openembedded.org>
 <19f7ec53e3ecdf3dece894a2049acd408ac6ef9b.camel@linuxfoundation.org>
In-Reply-To: 
 <19f7ec53e3ecdf3dece894a2049acd408ac6ef9b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|DB3P189MB2330:EE_
x-ms-office365-filtering-correlation-id: 2706e7ec-ad39-4128-a0e4-08def2707792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|10070799003|23010399003|1800799024|11063799006|10067099003|4143699003|6133799003|56012099006|3023799007|22082099003|18002099003|8096899003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 H87SSbI/vl6YG1tsR/3vcIADbMiJXlvbVgVnMSMGWrbiJqMMqiPAjRXArTKjA+lVuIJMkxnv+Q+b5iwD2hApwfrqk5Q5tkfqX4nje4N/eZfGijcDrejd/6GeW2/9d+CDFGObJfTWWNFFHdX7CA7V8NswrZRPbyBBXOvfzwxmxnO+IWfuP7Vu+RElJBEyE908HY+4l2eXuenXwK+QFfHbljijdlKLAf60FLxGrsUkcWiRHulNtslidfUYSH4RCxCofKEpP4kRl+Eh7zdOIFvXhL/HRWVHoKwb9UotB8yZvRik094UtjfnPAZjh8VBkLf23PsnG/4JYR38h6QMiNtTLBjXABW4bePW5TeO3oj1AfUezX7dFpuLmMynC2G+ZOJp9jEqv9ImCM8H5wVWbfIKxaKn4z0eLsBlz+H4NTT6ka6v/jxaiDgo/UjYOtIZSXim3w+fdgtwsP6LxyQ3Hn405hl6oUVcHLxxYQiLwGYYXPqu/MzFGYKu8hRkZJgqS/GyqlKyKoQ+dOrHAezWnEYIRZMjhi3+DF+wQiGNew1EOKlNViDriavYkSiF3EAGcDFnVgzsLilV1LKSx7wuX2Wgo7L8+ovJyJA1/v6WYP81khTE5rmMUPxGh2I+eyfqRu0tetKgkZ5mZSpz1NTyff1i6pfBjYiCjKYq83x8pqx7uzA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(23010399003)(1800799024)(11063799006)(10067099003)(4143699003)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003)(8096899003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?ymlwyK7009pJbKe+D7uaNnE5VNcDEZJ9h1q+zw+QVd/IndkDl/hZpXc4?=
 =?Windows-1252?Q?SIxDDnDVhpaMtQ7h0J6xf1DdwcPcpIOqMmceyslpwvSk82S7B9hlioq1?=
 =?Windows-1252?Q?GK4Yzhnw1b1EEDTrFOZQT9l/9JwMz1npBvkCudaOLNJHalTqS6YTI3lh?=
 =?Windows-1252?Q?5p3nrCq6d/BKshNHHWCTPnkmwerEOtepiSNKsO3ybt8ktdTptoW7g/um?=
 =?Windows-1252?Q?HtpqsZhDs84PnuWPwK8vHskB2dnCecFb61BaPEYTAJFm/oft+pt4X2mj?=
 =?Windows-1252?Q?YZ5eiO0JCKVo4/kxPDKr+EGkApnICq2oYp7zGL3cF4UY4JEvUTLM16X4?=
 =?Windows-1252?Q?Biuk+jfWzHHZLetRgT9A77oubdQIk/Tk79c5jw1vwwoAHmRgPPtCFjKM?=
 =?Windows-1252?Q?NcMG/cdIfRlAx/DR4gZdWW2t00xOb6eqpTpf5MQ9xPCVzA5Gf9525a4s?=
 =?Windows-1252?Q?8SI5/zv/32OGnKDcjQNIqVGR5aimncIVF26+7NyKJoSQCx3HTapYk6bN?=
 =?Windows-1252?Q?MhoOAtCpG3A3srCOdST8/TdFk+Sz3f32hBWVRwEa/xFBOc0WAJiGa1lU?=
 =?Windows-1252?Q?+z/Bqdjl0KQ2aJcKu386tMYWa9ze6/UTpbVHjjT4WpRWm8ySunlsTjDm?=
 =?Windows-1252?Q?yiNUncd/b9XxEkqNM+70S9CrAaWHHqbDl3jr50HGsLCuOYH3inRfWn7M?=
 =?Windows-1252?Q?W2JQyl/WKjFCImWcQcpEC6961mNBIF1AcHvu6EHrpAtJwt4WMJ+ReaEG?=
 =?Windows-1252?Q?WruZWFUPuj03PuxciBtHlBKpSEfG5AwM2XPvt0gmkSwQhHQC0/HJ+Wd2?=
 =?Windows-1252?Q?f/fe0JulR6CQrBOCwns6h0hyhY83gvB1Y8l5/NbjvZlo1F3aLrJvtpd6?=
 =?Windows-1252?Q?/L8LIGQuIcZ17e3zSiYHzP1R75lNGnI1LySWqWBbCEhg3krHdOmcWjaI?=
 =?Windows-1252?Q?GngaNKw7QbHYP4jcNxdHv22ecOI+ztb4v71KXW15zN0jxr9SQaLNr3gv?=
 =?Windows-1252?Q?ja8ZZbwssazuneqP81ZCPGOE4hjjU0WI5MTMO58RGxE+OD447yjHhbRx?=
 =?Windows-1252?Q?8EgwHrEUoVnVzsJbkek5g14Dh75LsD8CjR+krkCH73G29eONyKe6lGMk?=
 =?Windows-1252?Q?GxPK1VkXwVsG+2jauEMEOmw3ZM/BkR6TWsRMGD/XmNp1hJbPOUr62aH+?=
 =?Windows-1252?Q?rvRsAg1eIiFs9XUhEDgC82+qgcC64GbMmHYj9i47hX4NsoP28+vh104e?=
 =?Windows-1252?Q?0o7XUcDZI+RqMqeOY35PJQuDBbDWs7JfOI09VHGyZ3J6mGus+ibxuuRy?=
 =?Windows-1252?Q?Z8Dx14XwmM2Y4O9O/yGfa1X+YL4UklgwewzN9ftgx+j1wxkzCwzexPU3?=
 =?Windows-1252?Q?ArolS82R7HIVJK587A0gVjHM3RbVJOz7z/rGBv7iL6eJjEC2FOEmqK3+?=
 =?Windows-1252?Q?F0IOSS56P5cbqAJ3JXFJnKBr+RfBKmyNdkopnVcJ4FVG3RWORg1cgTQ0?=
 =?Windows-1252?Q?/k0PIZbfpJxHCK8XhaIGc6QodaTQGH4xNgnKBXFn1aLEe4W23jOkr9fo?=
 =?Windows-1252?Q?uGAZoGI/EKOKNn+OPIwlcOyEMvgKQRcZSpkr88YIv92CnPKAVlo+QR26?=
 =?Windows-1252?Q?5ppqzyJY11Cb0KGxqznh54Ds57n6TOJSr+vYuaRS+SGGPF1zrMcPeM6S?=
 =?Windows-1252?Q?BdxpUQdihSA5umi+5w01ZxrzQ9SllJM0nNXZt3L1L0vTVp/9LppHUsFF?=
 =?Windows-1252?Q?U5dtN1G2O+BWvH8isSagYR7yAAZIsxdmMye+YS66JkRXq4Z5CoUFUoFH?=
 =?Windows-1252?Q?vDBu0UMcxLh6QAfd/hMJQeWkYLH9oFvSL9nkfHPrGpq49Q8kBeuOag3z?=
 =?Windows-1252?Q?sqg/zM9+Fa+zh4eruWjeWaf7nZRiv/u89ENtSUkxigkW2FgbD2aZ4THs?=
 =?Windows-1252?Q?JC8Gmc/N?=
x-ms-exchange-antispam-messagedata-1: DY9kWYesz/eRTQI4X1Bu0WPOaDqDZg7Lc7I=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D7F686F5CF25824702B130F3D42DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2706e7ec-ad39-4128-a0e4-08def2707792
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 21:36:38.9350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kV+dRvSsuv0pyqZCI7+1Km463JR1oLvUqZcA95oCdQQo02euHXQNOf6hV+M+9JlbcLthOyIMC9+tnR5djSeE3YHg1oJ1pc264bdi7QbZlWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2330
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 21:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242803

--_000_DU7PPF66507B2D7F686F5CF25824702B130F3D42DU7PPF66507B2D7_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

 Hi Richard,

Actually , I also sent a patch for lib tool upgrade on master https://lists=
.openembedded.org/g/openembedded-core/message/242734

  I reproduced it locally and dug into why. The root cause is that -WCClink=
er was never a valid libtool flag (only -XCClinker is).
  It worked in 2.5.4 by accident, but 2.6.2 widened the passthrough pattern=
 from -Wa,*|-Werror|-Werror=3D* to -W* (for LTO warnings),
  so now -WCClinker gets passed directly to gcc which rejects it.

  I'd go with --disable-cxx-exceptions for riscv64 =97 consistent with all =
other arches. The -WCClinker typo can be reported upstream to libunwind sep=
arately.

Regards,
Jaipaul
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
Date: Tuesday, 4 August 2026 at 22:13
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 5/9] libtool: 2.5.4 -> 2.6.2

On Tue, 2026-08-04 at 18:00 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2026-08-04 at 13:23 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Drop one patch applied upstream, refresh another.
> > Switch to xz compressed source tarball.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../{libtool-2.5.4.inc =3D> libtool-2.6.2.inc}  |  5 +--
> >  ...-cross_2.5.4.bb =3D> libtool-cross_2.6.2.bb} |  0
> >  ...ative_2.5.4.bb =3D> libtool-native_2.6.2.bb} |  0
> >  ...3-libtool-remove-help2man-dependency.patch | 17 ++++----
> >  ...r-static-libs-for-internal-compiler-.patch | 39 ---------------
> > ----
> >  .../{libtool_2.5.4.bb =3D> libtool_2.6.2.bb}    |  0
> >  ...ol_2.5.4.bb =3D> nativesdk-libtool_2.6.2.bb} |  0
> >  7 files changed, 10 insertions(+), 51 deletions(-)
> >  rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc =3D>
> > libtool-2.6.2.inc} (85%)
> >  rename meta/recipes-devtools/libtool/{libtool-cross_2.5.4.bb =3D>
> > libtool-cross_2.6.2.bb} (100%)
> >  rename meta/recipes-devtools/libtool/{libtool-native_2.5.4.bb =3D>
> > libtool-native_2.6.2.bb} (100%)
> >  delete mode 100644 meta/recipes-devtools/libtool/libtool/0005-
> > libtool-Check-for-static-libs-for-internal-compiler-.patch
> >  rename meta/recipes-devtools/libtool/{libtool_2.5.4.bb =3D>
> > libtool_2.6.2.bb} (100%)
> >  rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.4.bb
> > =3D> nativesdk-libtool_2.6.2.bb} (100%)
>
> This breaks libunwind on qemuriscv64:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2034

There are two possible fixes I found, we can either
s/WCClinker/XCClinker/ on configure.ac or disable cxx exceptions (which
would match aarch64/x86):

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/recip=
es-support/libunwind/libunwind_1.8.3.bb
index bc1a108e42..1a3a816d78 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
@@ -27,6 +27,8 @@ PACKAGECONFIG[zlib] =3D "--enable-zlibdebuginfo,--disable=
-zlibdebuginfo,zlib"
 PACKAGECONFIG[latexdocs] =3D "--enable-documentation, --disable-documentat=
ion, latex2man-native"

 EXTRA_OECONF =3D "--enable-static --disable-tests"
+EXTRA_OECONF:append:riscv64 =3D " --disable-cxx-exceptions"
+

 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"

not sure which is "right"...

Cheers,

Richard

--_000_DU7PPF66507B2D7F686F5CF25824702B130F3D42DU7PPF66507B2D7_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;Hi Richard,</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt;">
<span style=3D"color: rgb(0, 0, 0);">Actually , I also sent a patch for lib=
 tool upgrade on master
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/24273=
4" data-outlook-id=3D"8cceef5a-504f-4cff-a44c-cf0e7f780955">
https://lists.openembedded.org/g/openembedded-core/message/242734</a>&nbsp;=
</span></div>
<div style=3D"line-height: normal; margin: 0px; min-height: 14px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;I reproduced it locally and dug into why. The root cause is tha=
t -WCClinker&nbsp;was never a valid libtool flag (only -XCClinker&nbsp;is).=
</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;It worked in 2.5.4 by accident, but 2.6.2 widened the passthrou=
gh pattern from -Wa,*|-Werror|-Werror=3D*&nbsp;to -W*&nbsp;(for LTO warning=
s),</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;so now -WCClinker&nbsp;gets passed directly to gcc which reject=
s it.</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 14px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;I'd go with --disable-cxx-exceptions for riscv64 =97 consistent=
 with all other arches. The -WCClinker typo can be reported upstream to lib=
unwind separately.</div>
<div style=3D"direction: ltr; line-height: normal; margin: 0px; min-height:=
 14px; font-family: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Jaipaul</div>
<div id=3D"mail-editor-reference-message-container" style=3D"color: inherit=
; background-color: inherit;">
<div class=3D"ms-outlook-mobile-reference-message skipProofing">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server" style=3D"col=
or: inherit; background-color: inherit;">
</div>
<div style=3D"padding: 3pt 0in 0in; border-width: 1pt medium medium; border=
-style: solid none none; border-color: rgb(181, 196, 223) currentcolor curr=
entcolor;">
<div class=3D"ms-outlook-mobile-reference-message skipProofing" style=3D"te=
xt-align: left; font-family: Aptos; font-size: 12pt; color: black;">
<b>From: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Richard Purdie via lists.openembed=
ded.org &lt;richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org&gt;=
<br>
<b>Date: </b>Tuesday, 4 August 2026 at 22:13<br>
<b>To: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc: </b>Khem Raj &lt;raj.khem@gmail.com&gt;<br>
<b>Subject: </b>Re: [OE-core] [PATCH 5/9] libtool: 2.5.4 -&gt; 2.6.2<br>
<br>
</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">On Tue, 2026-08-04 at 1=
8:00 +0100, Richard Purdie via<br>
lists.openembedded.org wrote:<br>
&gt; On Tue, 2026-08-04 at 13:23 +0100, Richard Purdie via<br>
&gt; lists.openembedded.org wrote:<br>
&gt; &gt; Drop one patch applied upstream, refresh another.<br>
&gt; &gt; Switch to xz compressed source tarball.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.=
org&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; &nbsp;.../{libtool-2.5.4.inc =3D&gt; libtool-2.6.2.inc}&nbsp; |&n=
bsp; 5 +--<br>
&gt; &gt; &nbsp;...-cross_2.5.4.bb =3D&gt; libtool-cross_2.6.2.bb} |&nbsp; =
0<br>
&gt; &gt; &nbsp;...ative_2.5.4.bb =3D&gt; libtool-native_2.6.2.bb} |&nbsp; =
0<br>
&gt; &gt; &nbsp;...3-libtool-remove-help2man-dependency.patch | 17 ++++----=
<br>
&gt; &gt; &nbsp;...r-static-libs-for-internal-compiler-.patch | 39 --------=
-------<br>
&gt; &gt; ----<br>
&gt; &gt; &nbsp;.../{libtool_2.5.4.bb =3D&gt; libtool_2.6.2.bb}&nbsp;&nbsp;=
&nbsp; |&nbsp; 0<br>
&gt; &gt; &nbsp;...ol_2.5.4.bb =3D&gt; nativesdk-libtool_2.6.2.bb} |&nbsp; =
0<br>
&gt; &gt; &nbsp;7 files changed, 10 insertions(+), 51 deletions(-)<br>
&gt; &gt; &nbsp;rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc =3D=
&gt;<br>
&gt; &gt; libtool-2.6.2.inc} (85%)<br>
&gt; &gt; &nbsp;rename meta/recipes-devtools/libtool/{libtool-cross_2.5.4.b=
b =3D&gt;<br>
&gt; &gt; libtool-cross_2.6.2.bb} (100%)<br>
&gt; &gt; &nbsp;rename meta/recipes-devtools/libtool/{libtool-native_2.5.4.=
bb =3D&gt;<br>
&gt; &gt; libtool-native_2.6.2.bb} (100%)<br>
&gt; &gt; &nbsp;delete mode 100644 meta/recipes-devtools/libtool/libtool/00=
05-<br>
&gt; &gt; libtool-Check-for-static-libs-for-internal-compiler-.patch<br>
&gt; &gt; &nbsp;rename meta/recipes-devtools/libtool/{libtool_2.5.4.bb =3D&=
gt;<br>
&gt; &gt; libtool_2.6.2.bb} (100%)<br>
&gt; &gt; &nbsp;rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5=
.4.bb<br>
&gt; &gt; =3D&gt; nativesdk-libtool_2.6.2.bb} (100%)<br>
&gt;<br>
&gt; This breaks libunwind on qemuriscv64:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/45=
/builds/2034" data-outlook-id=3D"f9c9e98c-0dba-47b9-bae5-f900395cabeb">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2034</a>=
<br>
<br>
There are two possible fixes I found, we can either<br>
s/WCClinker/XCClinker/ on configure.ac or disable cxx exceptions (which<br>
would match aarch64/x86):<br>
<br>
diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/recip=
es-support/libunwind/libunwind_1.8.3.bb<br>
index bc1a108e42..1a3a816d78 100644<br>
--- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb<br>
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb<br>
@@ -27,6 +27,8 @@ PACKAGECONFIG[zlib] =3D &quot;--enable-zlibdebuginfo,--di=
sable-zlibdebuginfo,zlib&quot;<br>
&nbsp;PACKAGECONFIG[latexdocs] =3D &quot;--enable-documentation, --disable-=
documentation, latex2man-native&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OECONF =3D &quot;--enable-static --disable-tests&quot;<br>
+EXTRA_OECONF:append:riscv64 =3D &quot; --disable-cxx-exceptions&quot;<br>
+<br>
&nbsp;<br>
&nbsp;# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20487/" da=
ta-outlook-id=3D"ca9a14f4-91f6-48c0-b74c-815026753d25">
http://errors.yoctoproject.org/Errors/Details/20487/</a><br>
&nbsp;ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
<br>
not sure which is &quot;right&quot;...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</div>
</body>
</html>

--_000_DU7PPF66507B2D7F686F5CF25824702B130F3D42DU7PPF66507B2D7_--

