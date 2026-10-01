Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AC2CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 09:00:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6883.1790845231757567094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 02:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=WeClqaIy;
 spf=pass (domain: de.bosch.com, ip: 52.101.83.18, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghINBvbdl5JjE+mtptyVWmqTYP0rr5vmrXVzJNU4mVKEphifteGUrQMANouPy76gL/1EMveJZR47x0/eiyp8wmY2By/DP+B7Z4cg+XrzbRCzhzy6Uvo/RcdJAlK491cuxbFXG42WeSTDTt9D/IkajkWT9plRlczEDcxoimYYR6d2tG3LqMuVD8NsW34TOVTdyP/uzrt1eHLfmuNonbvQSmkGdqXS8Sg7egsO2NllyzyhoETu18Q/id6WMJWLl80403aDpeghyvfTdhnyVtigduioGYwIQOdDK0Q34frEiWbYUDnLTDORKyWQHzl64apK0bsbcdSkzR2BJudlzPi5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiEFnPygCkkjDVbDaBteogMuKmoanHx7opMjjd+0YCk=;
 b=B0Xp5UvmM0ZYYsD1A+2mFFHnMI0jY+YVZ09fGPc6urf2JWkm8Xzp8QCSPLMZ/GMFpuFyvweZV8vMMS6Rt9Iz+7IE0E/kwiTgbXy8ce6cSCYIH6JYkzhnG6PW8dEG1TMWIBvViQsMNvPOg9YSqqK0YvDrKYPZM/hmSWGzodASdTET7VkFABCKuKI9O5dtmSUgXuU1TlhlJ0BOmxa3dz55xuCVA0EqFwi1lcGKBYei3mdNtuGtIkMYKEu24Vmn4qYZnSztNHdGIQR50W8RgB2Wb4O9BKgs+unbarGEi7s/gjolCxBQu3RAuJ20w/7yQlnfOTCOosGEzC7/SLwCnklEAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiEFnPygCkkjDVbDaBteogMuKmoanHx7opMjjd+0YCk=;
 b=WeClqaIyBXGExZAHuYEi8W2Xi2F2tjtL6+314KMTe58vJvYJZdmrPNh0c7EH+S0N497Gk1Bz8IS/V+a3GMd8KWtnbAEVI8lUccGUPuqeqyHlpPYinqCYW+PDObPVE5hLbqwdmGMBXip8M+UiyQepgi9v1KtDMOdH0VduYVuwGXM9hZAdaNZHKcS42jnYcAcZkObGNLqEkWMy3+FWpQXdHLCRL6C2XVdYnjz0UOdGdzAen9asMa/KWJQoHt2rJUNjGQHlPd7PTtrcUdDt4Spg6c75ZM8bYb32t2RjGPkab0O+XnQg0hUlIYYbh1TpBjgN+1kL7U9iw7l9DlmceyY1xg==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by PA2PR10MB8435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:419::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 09:00:26 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%6]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 09:00:25 +0000
From: "Jonas Mark (BT-EL/ESW1)" <mark.jonas@de.bosch.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"Simoes Ricardo (BT-EL/ESW2)" <Ricardo.Simoes@pt.bosch.com>
Subject: AW: [PATCH] xorgproto: Set ALLOW_EMPTY for the main package
Thread-Topic: [PATCH] xorgproto: Set ALLOW_EMPTY for the main package
Thread-Index: AQHdR3jHtav7oPpwiU+ohkEVBlLhq7bm6peAgAGGJjA=
Date: Thu, 1 Oct 2026 09:00:25 +0000
Message-ID: 
 <DB9PR10MB53549FAC3975BDDD2B057243AD8A2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260918141849.1875-1-mark.jonas@de.bosch.com>
 <f2101f97616baa3cee4c5733846dc6b64dd944c2.camel@pbarker.dev>
In-Reply-To: <f2101f97616baa3cee4c5733846dc6b64dd944c2.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|PA2PR10MB8435:EE_
x-ms-office365-filtering-correlation-id: 7952129f-b937-4355-1be0-08df1f9a6f0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|22082099003|18002099003|4143699003|4133799003|10067099003|56012099006|5023799004|11063799006|6133799003;
x-microsoft-antispam-message-info: 
 moO+ep+iwRJk1/1THiBYu5DLond51JQWGcS/4tC69wBQNq2ox3H/RFOz8DBiXWuDe61bd6H1UwX3ga8qy7z+rI3LmC42h7zJKdm6AHH8HyuxoJaAwn4WjMk3gIT6Y9ziRi5cv7oVUA0hzf0ViQpC/nVZ0WSHYQXQ5U8PYQRamJofAVjWlPqJFedxf5PG1c9ZnHXtPuMNgvw9kMJ0US2lstl0bFL8tYhVSXoA20Ec85/Fl17NxyFgonSYVpuFFbrOObc5R6vSCcBUA4NcKkj1xSLEKAyvhOXl4rxbqput1gLj6FvNRWJ7LsJxhjIg4L76e08TP0WBuqcbuvnBfXuo+ZxNsSDyeuQnpuOPuVG3vRwbBSLRMtcIsNvygwWWvdbOL13+ozoQNrtMAFYDVngaIAYCnEjJcf0pMmwA47cWkFbZuYMfrrti7zTvIyJF9rD1DhVVuCrb3isT9PciMmBcNZw45CQiA8BnmV1tNFBSewA34UGh4CCvYyQ4FzkZSfHwxOCFbSdQ0bsUsKCH8UMH7fnlV/oAkPaExJPDOsycDdqRAi+WY0sBd/vXcT7VnYFP9bBq1KKof+xLfiP4y1vprKtmLOk3XsiRVw4m8l9Tw4RhYRbOMe3cqG6TFipHOHrwH28J5GJxG36F79gU3S0rtreAtGPoWl64aji0r6D/tIMVO8soYfN0Y+e7UwaJJIWjtSI9d9ObIAIIC79wUz4Kl9EIGKL8Q79EaDqaqmbHsJ8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(22082099003)(18002099003)(4143699003)(4133799003)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/Cp6zq0flI4hHlu8dKZMqzlAsUd1w0yJgWVtK/tvosLMFogsV9WatznbCG?=
 =?iso-8859-1?Q?S3ONfTwZzokgX+92NiwtBnnYHTft0xLC4V/HMgjFPYDtscNahnb01VIElw?=
 =?iso-8859-1?Q?HZnqPY1EhSqxzJgA/yp2kyC3P4Vo94UxofLDKnIE6teAbUxJFmNg9UwABS?=
 =?iso-8859-1?Q?ytTWfpziZq5cbi6Pfyv2EtzdRnVKcAcTJZtmH5zxu/NWOXElxtjsbg3CrF?=
 =?iso-8859-1?Q?qvs75kVR85Z662iRVtXGWGUn1iqMChn2qYZqEXUxNB7kTDsnBsH8rnHnuY?=
 =?iso-8859-1?Q?gX75g9egRzLPsGod7CtNSe/U+VgaBdKODWKvfmCQoZuGj+TpdutzmUBL4p?=
 =?iso-8859-1?Q?wskqsC9J0IM6fT2op6tQmesJJTF7qiaNYMK0tHK1eF5x6T8BSC5LWqaXDq?=
 =?iso-8859-1?Q?IcZ5wDkgSpxbE+IleYfRq5f3FMfex5ljeMa/pGULDaiAaf+HzQ2wFmC23R?=
 =?iso-8859-1?Q?xkyzstn6z+BMb/lUlb5YHk8hiyeY5g+s+H59hsyjdAxNwkl4NpF2N8DSFc?=
 =?iso-8859-1?Q?Yqa8+mUsDg9ZVlIO1FVldfNQlaFmaGtXZYUm5TxOK8n4fOmsQLoShSSQ06?=
 =?iso-8859-1?Q?gUD3LBPjDgK2iBmeR4/96WFDaNHcwiCihdp8Zd49wYDk/7eu3h8lKW22r8?=
 =?iso-8859-1?Q?za1kyfVMcmicKCBeOMUYLWu54sDDYtuCj4gjEj8Rp7goNvFkoh/FvbEntX?=
 =?iso-8859-1?Q?MX7myIdw4heylUL+4QlttaYPnGD3HthNM8Y5nqwqDxU8CZwPZ5529h/Dj/?=
 =?iso-8859-1?Q?HEc3BSrTG72fdxeObDdZdiwcdJAOk5jw/dA1xlJIHsrHhj2/sP+0VkJaDR?=
 =?iso-8859-1?Q?fAluXru1Fjw2+D/OdrSpPQ3bypPdSPo4o1XxjcL2sy/jkDhrEycIt77AvB?=
 =?iso-8859-1?Q?e2DfmDg4thBpVRL7yRA5brfPX6pjzzbNx3bROb7oSnH4x3iC9jU4rkvaGJ?=
 =?iso-8859-1?Q?nVD4ZfYrgMca0Y2g7u9XCTnafX8LEeS0fgNYGo2X1YyCdpd5ahuILORwuG?=
 =?iso-8859-1?Q?s/7icHeLd930cXAkVKIGdLXY1CJUmRuAVgg6EfM28LzH2AlYa8XddGagCo?=
 =?iso-8859-1?Q?+1K/2zAghRauNZoRo2Opqk/QN1c6scv93SSAHmbceculBhuTs9gBgJUivh?=
 =?iso-8859-1?Q?mWQGIvpRjs0WELb4w1KWgVUxqWTnIfEPImlMaN1GxEXg8OUTsjzq6DcSiJ?=
 =?iso-8859-1?Q?7iNUTk6bgtrrziy+U91PyDeKEcAhdP4xFbItb0FSoORy86ZkhyjDoFap7w?=
 =?iso-8859-1?Q?vyRbtWOJj0OMrxJ/OTt1ntI1o+O9R/s0Td/AhlfhsdKcN4rCkL7kdqmc3f?=
 =?iso-8859-1?Q?K7UL6la018OcsU6AhpDJQ2KHa+6MQpVDpxN6gB2sIhFAy5oHxr2NPUal30?=
 =?iso-8859-1?Q?1RIxHB5dqK1rVBke5/fUHXFr05pgQJ9s6rUUZ4W8+TmuydEC1qS61MVkSN?=
 =?iso-8859-1?Q?GBRafNCueyxzhzjqdQjjhNA9BSqrDVzo/koxXONlf5YRpkb85D9b13wpps?=
 =?iso-8859-1?Q?nyCy9fa6Jp9K6uBgkdAWE9j/JFUIzXSMwiy5bHb+rJ0m+x3k2L/bgtxodh?=
 =?iso-8859-1?Q?E+586uVPK9TzrBr8XHO5kkSSPDFTzDk9QiipPpH5nsmu+22o6qlc5k+cTv?=
 =?iso-8859-1?Q?vSx65RkO5i/h+ML2C/iyykiJNHD8LI2qMBQG/H+1xsOu2gs4mVd8/+rXuL?=
 =?iso-8859-1?Q?hRjf0QSXbaxo9Uxlw5Ds8QCU8WkdRN7vfbOXcr2lORnqwneexhs0HSRnMf?=
 =?iso-8859-1?Q?OMgHpLWgAsrOKRJpZLq3al7qtryBo90tfpRYvBLPjo8vWu?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7952129f-b937-4355-1be0-08df1f9a6f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 09:00:25.8231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8DzHuQCaAaMd0ldRvosj74OAituh/AXE0HUZaNOdBbKIaAl3y2lEONbyvkaVaa3+ngnkta1sqHw56Rtxus6MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8435
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 09:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247018

Hi Paul,

Thank you for looking into this.

> -----Urspr=FCngliche Nachricht-----
> Von: Paul Barker <paul@pbarker.dev>
> Gesendet: Mittwoch, 30. September 2026 11:19
> An: Jonas Mark (BT-EL/ESW1) <mark.jonas@de.bosch.com>; openembedded-
> core@lists.openembedded.org
> Cc: wangmy@fujitsu.com; mathieu.dubois-briand@bootlin.com; Simoes
> Ricardo (BT-EL/ESW2) <ricardo.simoes@pt.bosch.com>
> Betreff: Re: [PATCH] xorgproto: Set ALLOW_EMPTY for the main package
>=20
> On Fri, 2026-09-18 at 16:18 +0200, mark.jonas@de.bosch.com wrote:
> > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> >
> > When creating an SDK, the populate_sdk task relies on
> > COMPLEMENTARY_GLOB[dev-pkgs] to decide which packages to install
> [1].
> >
> > However, xorgproto is a header-only library, so bitbake does not
> emit
> > a main package. The only reference to the -dev package is an
> > RRECOMMENDS from the -dbg package, and such weak links are not
> honored
> > when installing complementary packages [2].
> >
> > Fix this by setting ALLOW_EMPTY for the xorgproto package. The main
> > package is now emitted, which makes ${PN}-dev reachable through the
> > complementary packages and lets recipes that depend on xorgproto be
> > built with the SDK.
> >
> > [1]
> >
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.
> > openembedded.org%2Fopenembedded-core%2Ftree%2Fmeta%2Fclasses-
> recipe%2F
> >
> populate_sdk_base.bbclass%23n38&data=3D05%7C02%7Cmark.jonas%40de.bosch.c
> >
> om%7Caab8cf3183ca4239566f08df1ed3e999%7C0ae51e1907c84e4bbb6d648ee58410
> >
> f4%7C0%7C0%7C639263567650300241%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG
> >
> kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoy
> >
> fQ%3D%3D%7C0%7C%7C%7C&sdata=3Df9cFsWo%2BKHygCkswyUibFR5HSatvEJebVEPq6%2F
> > n%2BEso%3D&reserved=3D0 [2]
> >
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdocs
> > .yoctoproject.org%2Fref-manual%2Fvariables.html%23term-
> COMPLEMENTARY_G
> >
> LOB&data=3D05%7C02%7Cmark.jonas%40de.bosch.com%7Caab8cf3183ca4239566f08d
> >
> f1ed3e999%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C639263567650353
> >
> 303%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMC
> >
> IsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> > bj372IW8yy1wIQ3J7oIMEXlv2knUrzqUGxtFSPrNhNg%3D&reserved=3D0
> >
> > Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > ---
> >  meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
> > b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
> > index e187c56fbc..df09135e27 100644
> > --- a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
> > +++ b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
> > @@ -23,3 +23,6 @@ DEV_PKG_DEPENDENCY =3D ""
> >  RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +# This is a header only library - thus everything lands in the -dev
> > +package ALLOW_EMPTY:${PN} =3D "1"
>=20
> Hi Mark, Ricardo,
>=20
> I built the SDK for core-image-sato, and this already includes
> xorgproto-dev without applying this patch. I can see the package
> listed in the target manifest and I can see usr/include/X11/X.h in the
> target sysroot.
>=20
> Could you provide a bit more info on the SDK you're building, any
> local config changes, etc, so I can reproduce the issue?

We were a little brief on our explanations in the commit message. So we sat=
 down to create a hopefully reproducible demo of the problem.

For reproducing with used core-image-base and local.conf containing the fol=
lowing:

MACHINE ??=3D "qemuarm"
USER_CLASSES ?=3D "buildstats"
PATCHRESOLVE =3D "noop"
BB_DISKMON_DIRS ??=3D "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    HALT,${TMPDIR},100M,1K \
    HALT,${DL_DIR},100M,1K \
    HALT,${SSTATE_DIR},100M,1K \
    HALT,/tmp,10M,1K"
CONF_VERSION =3D "2"
DEPENDS:append:pn-base-files =3D " xorgproto"
RDEPENDS:base-files:append =3D " xorgproto"
DISTRO_FEATURES:forcevariable =3D "systemd usrmerge ext2 ipv4 vfat gobject-=
instrospection-data ldconfig multiarch"
DISTRO_FEATURES_OPTED_OUT =3D "*"

When we compile core-image-base then without our fix we get the following e=
rror:

$ bitbake core-image-base -c populate_sdk

NOTE: Executing Tasks
ERROR: core-image-base-1.0-r0 do_populate_sdk: Unable to install packages. =
Command '['/media/workspace/yocto_master/build/tmp/work/qemuarm-oe-linux-gn=
ueabi/core-image-base/1.0/recipe-sysroot-native/usr/bin/opkg', '--volatile-=
cache', '-f', '/media/workspace/yocto_master/build/tmp/work/qemuarm-oe-linu=
x-gnueabi/core-image-base/1.0/opkg-sdk-target.conf', '-t', '/media/workspac=
e/yocto_master/build/tmp/work/qemuarm-oe-linux-gnueabi/core-image-base/1.0/=
temp/ipktemp/', '-o', '/media/workspace/yocto_master/build/tmp/work/qemuarm=
-oe-linux-gnueabi/core-image-base/1.0/sdk/image/usr/local/oe-sdk-hardcoded-=
buildpath/sysroots/cortexa15t2hf-neon-oe-linux-gnueabi', '--force-postinsta=
ll', '--prefer-arch-to-version', '--force-checksum', 'install', 'packagegro=
up-base-extended', 'packagegroup-core-boot', 'packagegroup-core-standalone-=
sdk-target', 'psplash', 'run-postinsts', 'target-sdk-provides-dummy']' retu=
rned 1:
Solver encountered 1 problem(s):
Problem 1/1:
  - package packagegroup-core-boot-1.0-r0.qemuarm requires base-files, but =
none of the providers can be installed
  - conflicting requests
  - nothing provides xorgproto needed by base-files-3.0.14-r0.qemuarm

Solution 1:
  - do not ask to install a package providing packagegroup-core-boot



ERROR: Logfile of failure stored in: /media/workspace/yocto_master/build/tm=
p/work/qemuarm-oe-linux-gnueabi/core-image-base/1.0/temp/log.do_populate_sd=
k.3071259
ERROR: Task (/media/workspace/yocto_master/openembedded-core/meta/recipes-c=
ore/images/core-image-base.bb:do_populate_sdk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4485 tasks of which 4475 didn't need to be r=
erun and 1 failed.


Are you able to reproduce the problem using our setup above?

Is our fix the right way to tackle the build issue we see?

>=20
> Best regards,
>=20
> --
> Paul Barker

Cheers,
Mark

