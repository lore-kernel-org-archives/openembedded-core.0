Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C68CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:20:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2281.1778268037041207305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 12:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mFJ4GD5b;
 spf=pass (domain: siemens.com, ip: 52.101.66.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcUYzibQDNFxxHELUJDs6xOpbGnak83lfoZLAD1LimKicZtbCLNTKE8rAtXly4BCAaDh6EJiQRU5Xl7Gfd1LHV3J3ng75C+/ybWhBREAsXdb+Hv8YDKdZcKDuSveuE7ljVrWtuEwYupK/sMeX42cybhnzTBa/yphAoZVqH85AWAGr+T9OzFM/4NaopzL0ZhM8mhVIIYqvngK4JbKiEHYPWF5OBa7HwF+cu58bsPsvZeNv0dwaItv/YYQ66qIVjpvTasLW9H0PD3FbiRBwIghSNb87G0Ox7w+y0fhiR4qvF5Kw3JsgKDIBmFhBkcR9nK3lOTEEFmfmFmiTvMUXake1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBu1EAR0lEZmXLZ3q0A7AOf9IwBd9aXc5wGFFo+kThQ=;
 b=rWxIZU6kHsC57jZhJbP+7iORvHKlrb93Wpm3Re8/hqTlskyFOrrTox5O/vUmXTSa+UpagMoLsA2XbHeFdNYNybswdYOZ37VxPthZDn6uKGtnFS7/UfTYavEgh9BJ14F22mwtWqInqWjxgdJOoMFL7DRw80O6yzJk4a0e0a7yrt9SJ3f1CBdNNAdmVFUEAmd7e+Zux3ESsNxWr2GZOgdVZA/j9/Ao5YXrsGx91/ah/FBb04TUaajKAH5OElNvmQH3YpBK8nxQ/m4CpGi25+EyiqCudGAL3Hx+wolyxpeypl1/v9rWmtf4ots7MnvKpOneGtW46p2cECmD/Vc6lMEHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBu1EAR0lEZmXLZ3q0A7AOf9IwBd9aXc5wGFFo+kThQ=;
 b=mFJ4GD5bDOL6mU689/KzYaS3fzGcOjYty8LgngZ4pIYdBPH63opB0nGcNdYfDmrQlF7bFb9ljdL87NSDZraM2HWykl1VOvb0y9CMj7Bt84wmu0S/Apzt55DcMwLSuPGOWjA6WoTlumMgVgO6k2H/WH/aouefHW2cV+MA4EPgXZhbai2TdTsf3FUW0Srlz74wopqVBsDuRLTbaoChg3Rz0kK1R9j6DsjLM5ZDAtJb4jfU8EdPpr0TzEqTJpWp6y0GlskhSpRm6g/mEnKHx9qgDed7DOUpeoanTmfS7G3zSJps8Uh8D6fLnYlCPsRu17yfYlAEjiaHa22fT03wnZdnYw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB7583.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 19:20:30 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 19:20:30 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
 ensure version checks are correct
Thread-Topic: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
 ensure version checks are correct
Thread-Index: AQHc3u7qIk4lsmULuE+oAZxUO/qGRLYEgMfA
Date: Fri, 8 May 2026 19:20:30 +0000
Message-ID: 
 <AS1PR10MB56974954E10358194AC07932FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260508133042.1046523-1-alex.kanavin@gmail.com>
In-Reply-To: <20260508133042.1046523-1-alex.kanavin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=dc621d5a-aa81-4745-b0cf-a27dcb2bbf4e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-08T19:17:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB7583:EE_
x-ms-office365-filtering-correlation-id: 1f74279d-d1f0-4f9a-b8e0-08dead36de38
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|55112099003|38070700021|3023799003;
x-microsoft-antispam-message-info: 
 uOYBPTCbpmSnt7ulmGXSbGJMPqHVOtlSsYaJRNMWxUE7gn6OukdsOxFRTo5BDpThAW2CKwbSQsTCVY7tYP/TD/9lQELxKwcnbwrpwBu5krADkHREj+/RH/R6lLuPps8gi11Nre9NB+QphTpXwwbqGzNcT7UaYe25WETWDtucY9kMbudxfDKJ0JCEkO1trDfHYEkSfoPIU8BST9exnUSva8j/17amIayiEPQYiF2mxy3wQXDy53s8ApbX40H03MU9cn4Efl+WlmrbD+8BSIKhggkRzbCO7bxt7GTr9BGo8VGHJHOoAdjznJinQOsIpni/cK/tWWIB31K/OccsgiatZXJ73sNYAyBU+AcsmWrpQWS85ZxTMvMx9u7V1cH3h6laaKS+SmQ+AlUQGV1K+7UkWhjgvu04FD5P9uAqajQpWznHgvUSfTOQpgM+I0l7JlhZaU3kRvOSfOE/rSjyZJBEh9FaWYu3+Sw3/fzvEkqcscYI8FzVAgpzNQEMcU0g2QITipfsS2Ha65ryzPOeazj6BIQKMrX58cvzlNP+QKw/yOGQwiovDA8Khq84GUKb2mn5aAyqv7WwBIyZfNUrIPP0jhqornvqmOIJFahTkW52zwG/WwZ4ATaWJIXma4QN2nBniOqmqUnupDrnJDVtPun9OkZsZ7gZdYCVe7MzxOY4uEKglDvi9RJtv/UTEXiL9X4yQYyrp+7yfqFPVaVeq5wE3Vm45Q4bKnFxXQemBmO6ztABxrKMkLhjomt1484S55dJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(55112099003)(38070700021)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?u0V8wnKML5mLwxaBK6LeoO1gCx+zHvC9PRfdLCErLe1gvuHSDaVKtn9WKPKU?=
 =?us-ascii?Q?Gwy/72oxwJDz0AFh6Nj6BhxpRPoqZeL/Xbt0KBR9tzX7Xged0oyReKSoHZA7?=
 =?us-ascii?Q?KPZPXkAw4woXvXls1Rs35hqE7bnkFRA3ePsMstoFLGiTCuOkU0LOy5PnYDSE?=
 =?us-ascii?Q?KM4B3k+wfj7ziF3HEY9qvIviCIbMrrbr/5pIitfc2h5rR/RL/FyegH2NwDOa?=
 =?us-ascii?Q?zGjf8dk4ltIB2crD/+3/345T2pToXWqOSFd60s8qsqPgUSQQymWn8Kblh1N3?=
 =?us-ascii?Q?sBeWeFZwQtxeFiQ5U4e7EKWXaHp6KdV4VJXVOY1Qv/qfnfhYA01EgTg/KwnE?=
 =?us-ascii?Q?0capxKOWltRmvsDg6exsXDpObFdRGkqAhvRxZGgiZVa5I1RTBtl7GPU7V1jm?=
 =?us-ascii?Q?qKAjLDaRVUSdyIYrturjjmrJBYdAlnTz9pZH5qq9dIoBgM/IygsYWszz2skC?=
 =?us-ascii?Q?78ZN+D2CDKjAmNlnYLl4M/l9rE01g5o51vBpPSVFpb+WgItcYbMLFRKyg/gj?=
 =?us-ascii?Q?5q8BoMVU9Ccj/UCstxsw+fPlBFmkTpW36C9n2m2VlXq9bo4Ye3Lrxw9KCx2S?=
 =?us-ascii?Q?3jRxSAytSwEbErUH3BocHJ3Mvwfd/9pzcTuXx7gez28eCGQ+n2JpbSRvDp7l?=
 =?us-ascii?Q?8RJZKWihJ8MqsUQ1yQzeojNxnAmZ65PG9oDgiffYq6p/3eLj0AZ4v81i8pP4?=
 =?us-ascii?Q?W4LS+ud84hfImt/E+4akzvcFjl+y2N73W9ENlqRI2QkWAlSNkOMVu+/wm3fY?=
 =?us-ascii?Q?4FYoz/7oLW5+eYsujzutekUGvnR/d8rmnTDtQ0EjNB6nJMuVDjqIfulgod9H?=
 =?us-ascii?Q?EzZtZJ2nbM464DWJyPaR+MEpkRpWWJ6IqZu61j2YeiOZV4VmmfZgYv7l5spn?=
 =?us-ascii?Q?hP27LONYl51SQL6Y8+fBZPkk+xPcpy72Sa08IBS7+LcPJhABNQ6wxvhp6nWZ?=
 =?us-ascii?Q?hhqlzcDraiT2FHEyDfM4Reyu6TNqt3QBhf79Yj19uYZAZATuJWEu0eNvSTcG?=
 =?us-ascii?Q?lxTfiZp53Uxs7whynvhf9ySgOVAUQlAazFcI3rfHdOk2yGpUdhbFnzR/iJsf?=
 =?us-ascii?Q?dlzct/WF+FmYPu6GgOaHorLtWBbt5dvrimQ3JBtWeiufI4y1LBCkvCrUmXVt?=
 =?us-ascii?Q?tdeBc1hHygEgR7+skKkhRcjfApii+vKdM6/7rPM0roI3BxyDs0KRY9PIFIR+?=
 =?us-ascii?Q?HGM9IhnDDLgnj6Xn28bnC2G+GpzxYBWTJKRSNpU2SFfrW9v8Fq+uYdlP740R?=
 =?us-ascii?Q?13K4Bu60KHnJ9IitHvG042zIOfaZOuJQDuXRPcaeQ17au+vtxEOFiXTk9zR7?=
 =?us-ascii?Q?kr7/9gPyeV7UyFyDJCbvjoYrtdA8jUEzI45OGdGjRohZrCd+uM8R/rTTKxEa?=
 =?us-ascii?Q?ZX33tM+fRwz0AoDOfz3pTlwR6KBERUon61cO3Ud6jImi4CVo3r8EeP5ZFwiV?=
 =?us-ascii?Q?sSLRUVk79ad5PUUjhivws6cE/z2++RJmzpeuzR8RWhPFsdhymtam0r7VLFXT?=
 =?us-ascii?Q?5x5Zn1pV5dbIxwuPhRgvHt21joySAFkvZDtSricXodLllgi6wn0FfRTnyilt?=
 =?us-ascii?Q?+qUQRvKSpotBZxoy/Of2FgFboJ+9ddX5t65SLiyHzaiociEu0TC2pQKAfOZR?=
 =?us-ascii?Q?wdAFNhQPR/vuVNQ7Bk/OF3VvOQBiKNF7TsEP01U6eXMnsZaUb39iE5f8Q1UX?=
 =?us-ascii?Q?YLoU1WzvgTKPq2wUKR6QbecKzuRwoFu1j/ERBO2+NlFUpuiWUkte1Uv4Bms+?=
 =?us-ascii?Q?0ko0k5mg7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f74279d-d1f0-4f9a-b8e0-08dead36de38
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 19:20:30.1253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5xtjGDKigxz1V6CQXeJFUhCTF2mpP5uDsehfTYXiMhIveKc29JF/m1Yo6m79QnNdLyL+al5w4wCY/8jXfogWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7583
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 19:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236735

These recipes are intended to be used with ${AUTOREV} (e.g. in nightly CVE =
metrics jobs).
Tag in SRCREV breaks that feature and thus this part of this patch should b=
e rejected.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
> lists.openembedded.org
> Sent: Friday, May 8, 2026 3:31 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and =
ensure
> version checks are correct
>=20
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> These recipes didn't set PV, which by default is 1.0. This isn't correct:
> upstream does provide date-based tags that can be used to perform version
> upgrades.
>=20
> Correct SRCREV in one of the recipes to point to the next tagged commit,
> as existing SRCREV was pointing to a non-tagged commit between 03.19 and =
03.20
> tags.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...b =3D> sbom-cve-check-update-cvelist-native_2026-03-19.bb} | 4 ++--
>  ...> sbom-cve-check-update-nvd-native_2026.03.20-010002.bb} | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cveli=
st-
> native.bb =3D> sbom-cve-check-update-cvelist-native_2026-03-19.bb} (79%)
>  rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-
> native.bb =3D> sbom-cve-check-update-nvd-native_2026.03.20-010002.bb} (70=
%)
>=20
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-c=
velist-
> native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cv=
elist-
> native_2026-03-19.bb
> similarity index 79%
> rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-
> cvelist-native.bb
> rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvel=
ist-
> native_2026-03-19.bb
> index 3387122165..850537e777 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-
> native.bb
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-
> native_2026-03-19.bb
> @@ -3,10 +3,10 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
>=20
>  HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
> -SRC_URI =3D
> "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;protocol=3Dhttps=
;destsuffix=3D"
> +SRC_URI =3D
> "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;protocol=3Dhttps=
;tag=3D${PV}_ba
> seline;destsuffix=3D"
>  SBOM_CVE_CHECK_DB_NAME =3D "cvelist"
>=20
> -# 2026-03-19_baseline
>  SRCREV =3D "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>.+)_baseline"
>=20
>  require sbom-cve-check-update-db.inc
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-n=
vd-
> native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nv=
d-
> native_2026.03.20-010002.bb
> similarity index 70%
> rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nv=
d-
> native.bb
> rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-
> native_2026.03.20-010002.bb
> index c868ba09c1..d1290ba8e3 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-nati=
ve.bb
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-
> native_2026.03.20-010002.bb
> @@ -3,10 +3,10 @@ LICENSE =3D "cve-tou"
>  LIC_FILES_CHKSUM =3D "file://LICENSES/cve-
> tou.md;md5=3Dbc5bbf146f01e20ece63d83c8916d8fb"
>=20
>  HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-feeds"
> -SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-
> feeds.git;branch=3Dmain;protocol=3Dhttps;destsuffix=3D"
> +SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-
> feeds.git;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV};destsuffix=3D"
>  SBOM_CVE_CHECK_DB_NAME =3D "nvd-fkie"
>=20
> -# v2026.03.19-010002
> -SRCREV =3D "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
> +SRCREV =3D "71a7984884a918f7f1464a0efe25ba4a24c569ca"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.+)"
>=20
>  require sbom-cve-check-update-db.inc
> --
> 2.47.3


