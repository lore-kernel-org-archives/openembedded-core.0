Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C459C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:00:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.41])
 by mx.groups.io with SMTP id smtpd.web11.9335.1716382831001740189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 06:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Osfw712s;
 spf=pass (domain: axis.com, ip: 40.107.6.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDzetr8V0xHGc0b5As0zPK3k+jJPaHqIM8DsEUyqT1YVRwKYxs7tpaC2FAYpuZ17sts8x7HFjOp2Vcy04bNz5gKV54k29KEDX5GbN3ckGs4RowLN1Ehp5hSVrs/9l0CdSe6XTUvrHHvisL+tGVMK9VWMQB4IM52ZQzdhEaUZmNuLeKZHVAohwMDOno6L6oEoZibU+PWF95/tmKeYd6Z2mGT2VaBIKnQI0UIbyTQ03QeLeuQBUqg6cvPnpYboMXpXCwMCmxlNzduDW//QM8QZOrBj7bir2VgWtBcQU0815lb2kzIugY+ymB9DbnMZMP+QYN3mBTgDJm/APLXcDs+fJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YcYhqcJcEKOEB9bZ7d5VqZzXWCALE/QdTZoqETPHKw=;
 b=Tnoq6ZinxIWUxeAwI3B6FsOeChVOFuE89djvFYZHOKpjp1Jpj2ZnhQmn+TnT8s8YNKEEQJsQVLXt2clYZyYCnTWlfDSV9FuGK4guneAUOaIwhBCNJl6VVWl3EQpgHOVTJtw4S00V9mr6ZqOIwWsQpWBPhhzCObfk7DvVAhVLxVk7pYhDLRdZXOoq3g5wEGCSvcjSbo4xAGaGcA+tlhIQrfKY2QZtvu9oeGvO0sKCd4ha+Zt74M4GAIjMkej2JqpBLhZVHuXJ/JR7lcRCHLx2w0WT2fESvfdJqshe2VBNGUMrVxm1LMo6+mz+m8X3abbCNJo4de5k5Uv43ANcCZWj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YcYhqcJcEKOEB9bZ7d5VqZzXWCALE/QdTZoqETPHKw=;
 b=Osfw712s8tlmCyt67ZkUSShQqJ+SbXl0Vpkd4hSJNXpgeXqTojbmtAgZVlWe/2GzcXJkJfcxeBl5TAinZ2iau2WL7quDUjF9QNM2rULnz1cFSsglHkt2I186X4pDPV0O1IZTtUmIEto3fvvR1lQR1chumRECZvozyJF4Lx71kLQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA6PR02MB10813.eurprd02.prod.outlook.com (2603:10a6:102:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18; Wed, 22 May
 2024 13:00:26 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7587.030; Wed, 22 May 2024
 13:00:26 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] base: Switch UNPACKDIR to a subdir of
 WORKDIR
Thread-Topic: [OE-core] [PATCH 1/3] base: Switch UNPACKDIR to a subdir of
 WORKDIR
Thread-Index: AQHarCptHw27fRwti0+Jhl/2SpdXN7GjMTiw
Date: Wed, 22 May 2024 13:00:26 +0000
Message-ID: 
 <DB5PR02MB102130544E52F16C92DD69492EFEB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA6PR02MB10813:EE_
x-ms-office365-filtering-correlation-id: f217ab91-bb68-42e7-659b-08dc7a5f2690
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cvza0E2OG2K2ZnGRlWrx0jEpZGPA+/i9/UbSt7Sf0wYpa6ZVIqt2SHD+Xjld?=
 =?us-ascii?Q?cF5dy4rw9WJ1S50amkXQtuXRKHBVrYkO5+A3Xppu+JKTAy8M9WCJ5Gy1meck?=
 =?us-ascii?Q?Ri5OhOAVpb0tFslCWWlaZ5UbnolaqdGKlAlm+FG1GAN3t/XVBmbXntLeRKRO?=
 =?us-ascii?Q?jRtbavX7aXyC4FJ+ulu4yQTAoKLXDX8459wBxmCnoKAfvdV9/5xJ1v0i71IG?=
 =?us-ascii?Q?v4inl8WPWaLBkvyRlY0jY+hEi/o5Z+OcIfKAlTMQHYbcbNS1Sr8FOxK3iAfL?=
 =?us-ascii?Q?neroxwyy7mJG8zIBiMGdFpnsWIo6XCmSk/UzLdpShoCAOisQajTtstSjKQOn?=
 =?us-ascii?Q?LT8+etqfpqmfNXF0o+sHfVCLemNWTQ9IGFkWGhNAIWyguOCLbbz0hMI27Z1s?=
 =?us-ascii?Q?KnIHzNQK4Hs8eq5T3rvVZhtAlTeYRY/GS9OLCTcj5kMuI7PRJ2lYLfwmsR4b?=
 =?us-ascii?Q?L8SxoJacuOF8xGDNwAEeAedZCTyHm5/flmn0kjbqHZVftErCKN4s/wuA4Vsd?=
 =?us-ascii?Q?d5SQiTQqHUosRBU0M2TuDD4I9gvEO6p6mmCPoNejMauWyF1BI/sX4p7S0EHf?=
 =?us-ascii?Q?4ANNYP+/dBsyurBNnDGsOdGObzqTc7s67+boyHs7BKeoC09vA4GFnaM6Ho6D?=
 =?us-ascii?Q?FdVKtHKJljONyz69sx/Ys8O+nFkVGtFp+b7JnK2ZvcfUAlvARIFPeO1j0tzm?=
 =?us-ascii?Q?onU7ekX+Ro+qyTry0ptYl+CiHOny7zLjYMBz3XenRmJjBpJbqviOrfPuWZPx?=
 =?us-ascii?Q?hdZCSu1GYdq3Jqr7zmnBPe+ggjeEReOXVJ1IGu61KrSV1HaDF8l3mNIS8Cv+?=
 =?us-ascii?Q?e3IQq4aC6OVjd4UAdKYgxG4LmYGqGFxtnhLxIUbM3F29rOQm2oTbpVhjSdry?=
 =?us-ascii?Q?//qhxN7EozgbEggjffBZlkGQyM1SvDbOhiElh9MzxqFrwb3cWMytx6j/fuiQ?=
 =?us-ascii?Q?6zgm/kujLtixusxCqVNZPJpV8ToxZG2aLNqXqTJpLCOOqGjO9A9XA6n0P0aL?=
 =?us-ascii?Q?EtVwxQEKjfb+eErSVfbteotw8WkK0ILyc2b1CElop/O2+D5SQ9yhawvQ6zpu?=
 =?us-ascii?Q?ZhtWjCsXBiCuNqhRAHa56ryEc4OLBItfhn3NCByM4LGwiM5Jt2DPQSpkePsz?=
 =?us-ascii?Q?b97JhCgh0tYkiR9g5ih0ALeDafSDRbWYjPQnTtrKBLpO8w2c2QlxEPbl4pS0?=
 =?us-ascii?Q?nP8tE9ycZudBkaI1swf3kN6Xp/BoyMjhKPc/Tbv91rW8ogBOkX+VxJX+wPV3?=
 =?us-ascii?Q?2Awjofg8XyEmaLdg8kZ46x8nhkBonvEn1IseH9pbeVTYaANhlrdgdjFmXwxq?=
 =?us-ascii?Q?3PFYXvR9CTpIbwWhMxtiQU1tkSy5PfVNB6gGGI5zFtoyLQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bPqDRNSTS9XHbIDM7S4RCTrK4+q/s967n962Spve6qelEx9fwN1jUA3OCqCS?=
 =?us-ascii?Q?vpftcyCABxy9MNTcujzQRUrqIL0r7Zca6seKETB3sek9d7DcCmRnqOqwZBxe?=
 =?us-ascii?Q?SwvBRfUpKncRNz+Ms7Zr26W4fg5pe5Kyvia8gu8VlEOF3ePsKFBzt5AgR7Bs?=
 =?us-ascii?Q?gdsN7ynuC/buv46h6xwZ8xxcmKH/0RIdPLPThJPhjBXcJKd+Y1diOgLxDbaO?=
 =?us-ascii?Q?PlCQTjEeLCCvN+iSEVLPSePO6AvF2WaJphkusWSnQ2A53syJWNRbhTkR6UEP?=
 =?us-ascii?Q?FT4yh/WPDjKXZWWW6/0jnD+7vw/cmOHavWRnFg4NdirYWsP7xO3o7QClPSR0?=
 =?us-ascii?Q?2jyTjVfhuZftmb25KEZjKF+Vc4zRLqXj8a7W/9lmuEzosCuN7Ym92R/9bQPT?=
 =?us-ascii?Q?TXv1ze1xcJSQAJTBekxRUi1hyurT5lYoMDxU0dZGTpesHUVHM6W5w0Ed1zpn?=
 =?us-ascii?Q?I7KXir8uhoFPO6g3aVieJnDQ5dBumqAvOaJQ3/bd+IzEkwy8tCnHKMvXaGg+?=
 =?us-ascii?Q?F4iFXTih3arGgLevjiMIu6RJHwYovO3kbdVe9D1JGcr1zF9oCQARUgtcRATL?=
 =?us-ascii?Q?rAOkFligCMl8979X6NX+QoFzO1qmkBLpiHfgxVZszKpw4g61z2HHEclmQFWl?=
 =?us-ascii?Q?OFAFlkyg5DNpl65Ces29pVpR4l1PwOuRWZL4pGFuhcvPHAiNmqtQFABsvU+J?=
 =?us-ascii?Q?8iwZTdvCNU/prE20KvAG69mYmZiw9nL20hlJxv3h9XU0HmwXYvFacaz8WEPR?=
 =?us-ascii?Q?SdGh4ceLfndQTf2MZRw6tPhTZLG3X6dmbXvACgeo2q+GjNy0JLwxFuIN/It7?=
 =?us-ascii?Q?zPbOumkXdh2i4YC/t/0nNUNuYuWIzsT/JVIjzDaihxE0TlQP25assIb8dyQR?=
 =?us-ascii?Q?jqbD3qrCieegUtaoIOu8TJbRcjeIvkR8l8r8V8BGm/FA35AvUTuKiZxkeqTo?=
 =?us-ascii?Q?EoKyNDj1oH3Nd4bXwlAujxwBntYEFXDxDP0t+TuuZKYSfHvBWeGYB8w+3/Bg?=
 =?us-ascii?Q?XyAu95xFRbP3r8DOPacHE1v13SppX0/ekr+K19ED0SEeEy4uXZIJyae5ehkE?=
 =?us-ascii?Q?8f81YIjl0GVEpf0Az63gsASyBLZT2WvFW+5j/AKVuF8PHWX7laqfWwl8Y6ew?=
 =?us-ascii?Q?FcAISBzCIcA6o96paAd3Av18EqpAGo6IfU0BI1BOesxGuioxoLFPoIUZjvQf?=
 =?us-ascii?Q?i2+nfDjJZJ7wa3ZFmP0bfgLSPVdxA4Lj5vEki1VXlUQtUnxBcKZppzZrjbJy?=
 =?us-ascii?Q?rffHX80qRbxPfjqRZlKhfm6YL9Bs4jyQ8SxEGNAWcvAAyJrU7Tfkpu5eo1cU?=
 =?us-ascii?Q?2zN29pCHORX3LCJ8wfjWoWD5GGNQ5bSTzWMRyy766XFyukrtrFrxtmjFfC3J?=
 =?us-ascii?Q?8DvkIgUyTbpaMJfL/rOhMMXYvzNAt0dvnrVxviksNJfo2SfZmt3cmeAD62zL?=
 =?us-ascii?Q?Yu46sL1Poxmd+p0YjrMvvaXKA48YrGcT8nryOl/GCfnqASx0TTFqC0spb30S?=
 =?us-ascii?Q?hLvQ1xbZli9OgejimkhUukaT5cyRhJQ70xgU4jktRpHIvIXnLmj8yOCfxGMv?=
 =?us-ascii?Q?1GdHhvDbhQvfCQ4Lzio=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f217ab91-bb68-42e7-659b-08dc7a5f2690
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 13:00:26.7016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NclZZlr3PdbmGHXSWQiLoL6pHN+KheDfEhjTuDrc3nJreyap+lhCDPVn9NubAMc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10813
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 13:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199749

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 22 maj 2024 11:28
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/3] base: Switch UNPACKDIR to a subdir of WORK=
DIR
>=20
> Change do_unpack to unpack files to a subdirectory of WORKDIR instead of =
WORKDIR
> itself. There are several good reasons for this but it is mainly about be=
ing able
> to isolate the output of the unpack task and tell the files apart from ot=
her things
> which are created in workdir (logs, sysroots, temp dirs and more).
>=20
> This means that when the do_unpack task reruns, we can clean UNPACKDIR an=
d know
> we have a standard point to start builds from.
>=20
> It also makes code in tools like devtool and recipetool easier.
>=20
> To reduce the impact to users, if a subdirectory under UNPACKDIR matches
> the first subdirectory under WORKDIR of S, that directory is moved into p=
osition
> inside WORKDIR. This preserves the behaviour of S =3D "${WORKDIR}/git",
> S =3D "${WORKDIR}/${BPN}" and other commonly used source directory setups=
.
>=20
> The directory is moved since sadly many autotools based projects can't co=
pe with
> symlinks in their paths.
>=20
> The patch also updates reproducible and SOURCE_DATE_EPOCH handling to
> match the new potential source locations. We can get rid of the horrible
> list of hardcoded directories in WORKDIR to ignore from that code.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/base.bbclass | 28 +++++++++++++++++++++++-----
>  meta/conf/bitbake.conf           |  2 +-
>  meta/lib/oe/reproducible.py      | 19 ++++++++++---------
>  3 files changed, 34 insertions(+), 15 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 066f3848f7c..13e91b24a3b 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -153,20 +153,38 @@ python base_do_fetch() {
>  }
>=20
>  addtask unpack after do_fetch
> -do_unpack[dirs] =3D "${UNPACKDIR}"
> -
> -do_unpack[cleandirs] =3D "${@d.getVar('S') if os.path.normpath(d.getVar(=
'S')) !=3D os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', =
'patches')}"
> +do_unpack[cleandirs] =3D "${UNPACKDIR}"
>=20
>  python base_do_unpack() {
> +    import shutil
> +
> +    sourcedir =3D d.getVar('S')
> +    # Intentionally keep SOURCE_BASEDIR internal to the task just for SD=
E
> +    d.setVar("SOURCE_BASEDIR", sourcedir)
> +
>      src_uri =3D (d.getVar('SRC_URI') or "").split()
>      if not src_uri:
>          return
>=20
> +    basedir =3D None
> +    unpackdir =3D d.getVar('UNPACKDIR')
> +    workdir =3D d.getVar('WORKDIR')
> +    if sourcedir.startswith(workdir) and not sourcedir.startswith(unpack=
dir):
> +        basedir =3D sourcedir.replace(workdir, '').strip("/").split('/')=
[0]
> +        if basedir:
> +            bb.utils.remove(workdir + '/' + basedir, True)
> +            d.setVar("SOURCE_BASEDIR", workdir + '/' + basedir)
> +
>      try:
>          fetcher =3D bb.fetch2.Fetch(src_uri, d)
>          fetcher.unpack(d.getVar('UNPACKDIR'))
>      except bb.fetch2.BBFetchException as e:
>          bb.fatal("Bitbake Fetcher Error: " + repr(e))
> +
> +    if basedir and os.path.exists(unpackdir + '/' + basedir):
> +        # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR}/${=
BP}
> +        # as often used in S work as expected.
> +        shutil.move(unpackdir + '/' + basedir, workdir + '/' + basedir)
>  }
>=20
>  SSTATETASKS +=3D "do_deploy_source_date_epoch"
> @@ -199,8 +217,8 @@ addtask do_deploy_source_date_epoch_setscene
>  addtask do_deploy_source_date_epoch before do_configure after do_patch
>=20
>  python create_source_date_epoch_stamp() {
> -    # Version: 1
> -    source_date_epoch =3D oe.reproducible.get_source_date_epoch(d, d.get=
Var('S'))
> +    # Version: 2
> +    source_date_epoch =3D oe.reproducible.get_source_date_epoch(d, d.get=
Var('SOURCE_BASEDIR') or d.getVar('S'))
>      oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FIL=
E'), d)
>  }
>  do_unpack[postfuncs] +=3D "create_source_date_epoch_stamp"

The following code is part of the anonymous python() function in base.bbcla=
ss:

    if os.path.normpath(d.getVar("WORKDIR")) !=3D os.path.normpath(d.getVar=
("S")):
        d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
    if os.path.normpath(d.getVar("WORKDIR")) !=3D os.path.normpath(d.getVar=
("B")):
        d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")

Since it is (or will be) an error to have S =3D "${WORKDIR}", it should now=
 be=20
possible to move the addition of ${S} to PSEUDO_IGNORE_PATHS to bitbake.con=
f.=20
I also believe ${UNPACKDIR} should be added to PSEUDO_IGNORE_PATHS.

And on a related note, would it make sense to make B =3D ${WORKDIR} an erro=
r too?
In which case the addition of ${B} to PSEUDO_IGNORE_PATHS could also be mov=
ed=20
to bitbake.conf.

> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b2c500d8739..75c850760f6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -405,7 +405,7 @@ STAMP =3D "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN=
}/${PV}"
>  STAMPCLEAN =3D "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
>  BASE_WORKDIR ?=3D "${TMPDIR}/work"
>  WORKDIR =3D "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> -UNPACKDIR ??=3D "${WORKDIR}"
> +UNPACKDIR ??=3D "${WORKDIR}/sources-unpack"
>  T =3D "${WORKDIR}/temp"
>  D =3D "${WORKDIR}/image"
>  S =3D "${WORKDIR}/${BP}"
> diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
> index a9f717159e3..1957c974347 100644
> --- a/meta/lib/oe/reproducible.py
> +++ b/meta/lib/oe/reproducible.py
> @@ -75,10 +75,10 @@ def get_source_date_epoch_from_known_files(d, sourced=
ir):
>      return source_date_epoch
>=20
>  def find_git_folder(d, sourcedir):
> -    # First guess: WORKDIR/git
> +    # First guess: UNPACKDIR/git
>      # This is the default git fetcher unpack path
> -    workdir =3D d.getVar('WORKDIR')
> -    gitpath =3D os.path.join(workdir, "git/.git")
> +    unpackdir =3D d.getVar('UNPACKDIR')
> +    gitpath =3D os.path.join(unpackdir, "git/.git")
>      if os.path.isdir(gitpath):
>          return gitpath
>=20
> @@ -88,15 +88,16 @@ def find_git_folder(d, sourcedir):
>          return gitpath
>=20
>      # Perhaps there was a subpath or destsuffix specified.
> -    # Go looking in the WORKDIR
> -    exclude =3D set(["build", "image", "license-destdir", "patches", "ps=
eudo",
> -                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-d=
estdir", "temp"])
> -    for root, dirs, files in os.walk(workdir, topdown=3DTrue):
> -        dirs[:] =3D [d for d in dirs if d not in exclude]
> +    # Go looking in the UNPACKDIR
> +    for root, dirs, files in os.walk(unpackdir, topdown=3DTrue):
>          if '.git' in dirs:
>              return os.path.join(root, ".git")
>=20
> -    bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
> +    for root, dirs, files in os.walk(sourcedir, topdown=3DTrue):
> +        if '.git' in dirs:
> +            return os.path.join(root, ".git")
> +
> +    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackd=
ir)
>      return None
>=20
>  def get_source_date_epoch_from_git(d, sourcedir):
> --
> 2.40.1

//Peter

