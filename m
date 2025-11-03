Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D465CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 15:27:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24121.1762183639290897992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 07:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SrlOfYY0;
 spf=pass (domain: siemens.com, ip: 52.101.65.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOovdwtnJvmffuU4JPEcSNIHmf4c0lknQDs+S3eIP5huJOsYwv96gpmEDSuJz+rN26Aob/doaxBdXc85xy7Oy87SD3fO5iQop5Vc3NekuwRnbkD56GTjuN1aMvhUtNmKzENx1BnZVvRTgTZ/CKO71dWn4tolEhZx8frBEx9NtYN5CK35zoxzPIvShQUpedNQX9qKlSryE6MS0HROd1ZyRYlOFbVhZKWy02mDnk28r2cge4gM4gQ9j3AE584EwfqArgnlVp8AdnPdqQdkRqPkrYDbxQcfc8HC5xY6rREUjcCCOuAIkiUsp8lMd87pBj4QOnRsOCNJrmWuDCtWfMEVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rJHteZO+3bYPBvp1DDjcwjPeVG/eumvIgQlqlXzySQ=;
 b=kU7o7bOzR85LsTa18DWTcwurrjhnJPyNUfD060vvG0LdEKicKsf1knwmsPJyOgGbRFP6FHh04tTFyEYaQIiHXyE46JoQ0NmmqL7g+ICvUNPbw2kkTCBPkb48IDp46CTRQ1lDPccPLpU4E0J8l3WXCT5lvpe8JGjactsPOGJOc38FEDauBtP9omRQxkl85rnSyomXSPJgS4VIi8qKZvWeiSR/yg/L9Wa6pq3Sng3WxVpeXryr0NGpbQX7d6jwRTzOtujgZNDMi4yfJT0/ERIlP5EDowd2boHyqD+x6G3S4J/AKX7OLW38sU8zkoDrgPQrfzDTmPAPcqQyw7WoNt/MNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rJHteZO+3bYPBvp1DDjcwjPeVG/eumvIgQlqlXzySQ=;
 b=SrlOfYY0Vy+M76l+I6Ggoh7d3r7c6KNdBlH4HDkvp7xnNguh9/kQZrFEo4wE6lgi0fuX8CmiqD5krRmasbBmIpka92Y9o5ro4qGB27pxEncBc1Qi/NoRX29tes5eqUdT8czYVjVVFo/ZcaltncZ+ELIZFaErPZTOZ6c2eQNC4yn+Qfcg+wFBA70dOuTwUvElTq/mIX3Cg9DsSf1Wf7Sh2DqPLjdXAGDuflTbLUv3dl1qFEcGmhSCBLKbJt8mB7s1HEDIMCd88FOiHI6PUA6GXd0gxKGPhBqJlduXwPjmbNt0ZTeVT/3/P5Bti+l+92MRKGSuwAjb31dMAfzlR+6lvQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8986.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:27:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 15:27:15 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Niko Mauno <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>, "rybczynska@gmail.com"
	<rybczynska@gmail.com>
Subject: RE: [PATCH 5/5] cve-update: Keep mtime stamp in the database itself
Thread-Topic: [PATCH 5/5] cve-update: Keep mtime stamp in the database itself
Thread-Index: AQHcTM6qoOx/HMnrh0mRh2uJmpNwFrThD0ZA
Date: Mon, 3 Nov 2025 15:27:15 +0000
Message-ID: 
 <AS1PR10MB5697FAC4934335CDF4EF7403FDC7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com>
In-Reply-To: <20251103143157.315178-5-niko.mauno@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0c01e4c0-f496-48ff-b823-5ac80190a344;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-03T15:13:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8986:EE_
x-ms-office365-filtering-correlation-id: 5ff08d62-e768-4698-6b51-08de1aed7828
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?vuiZS7ElSZPuAGUXIiL2IGt/jnueGmQm9okvCXUdGEJKXYuaZ9vC6d1sTL2b?=
 =?us-ascii?Q?8kw9+HUdaSjXMSevrNeKYf4BMcysknh9sc6AMqq94rmofcw4cL0IEXRYd23x?=
 =?us-ascii?Q?cSwKB5SZtg+7jGZbIKxsJgETYzss99DCWkrMgicrU3EQP8ByIV6Gzb26GHni?=
 =?us-ascii?Q?ZBgKZO1D8vit2aggmGBtb5buGCK24hCrKKc+ICubXSeAzaslq7vzrfyPS19f?=
 =?us-ascii?Q?E1FZDPe3brm+Hmvy9TEFbSJlhzpJxxh6ykaE/QjNkpXrAgxWZajM08IzpMZu?=
 =?us-ascii?Q?/z4cMZujQPAYsssed2nNgcHxkGu1s4NTSEZEpgNB0Nwq3yd++uWM7LLIUUeA?=
 =?us-ascii?Q?dZOfWO+DWFEE2r92IPjOU7cOemzkn9YxDMXmVY/D+Ms8kSonOhWTPxcVCTqs?=
 =?us-ascii?Q?o2uKfwbo3vBRan1YE/pKIUKPF2W4dAknyLbBekSrXqUgOMIftKTMFy9iUBdT?=
 =?us-ascii?Q?R/5LoYcNCDDQqNe0yopM4f8b6zbm5w+2ktxz+uwYkw7LcCQx4Z3zCIdknbIa?=
 =?us-ascii?Q?LXUAQ6ArJg/+GMhP6uO1PhdglSMKp+AB97dIA9qBjOOXbxuTfx/0bkI5KytE?=
 =?us-ascii?Q?d/QyVWxQqHj8/aILD57o+Z02oOkRLLjSgN7UjH7Zqt5Hkpoo5LAahezo3DgG?=
 =?us-ascii?Q?+nVusX/vdlZgBgOQ6LPnlomjbXn9Ys6jm99SP5Njk7JEh2zEdN7CtcKMYoIj?=
 =?us-ascii?Q?q27izBNx0Kpyt/WH7cceLbUcL1WOxKfB8bVa5TCqe5V3u16N4xdRxV08n0HS?=
 =?us-ascii?Q?nqGB3lwl7Dw9FG27tvg1Z03y6J8WTcIKGLN4Zx8OT4P/WcSIgf9m4qh0btVg?=
 =?us-ascii?Q?Z92ydbRDU+uOpR3+xdE6jERK83BuVYT1Nn53ym8rqTzzF6qyJxV4wUT64cs6?=
 =?us-ascii?Q?X3yO9LrhqxxO9MPU29ud14m3yi+bYpNu4Lu7Hsz+Q2Iq/8bc2Kp1fIMkq6v3?=
 =?us-ascii?Q?LUwD28JKgTX2tkrnIUCLs+r99pfKds4pbyrc9O41Jmw+PpHgSNSQSovG6DY0?=
 =?us-ascii?Q?Z1ds08UC35j73STaj0xUNCHkzNOWNMrZ1XfihLfwT7rvjSoVw5WBIC5O57B2?=
 =?us-ascii?Q?tS9WLTr5CN8sRrMkrkimQo1ZOa3OytMHGao74VblW7h+f0nFtqjUUuGnkJy8?=
 =?us-ascii?Q?aVWMJFaob6fi/VtgfotqjGL6yUprUr9lZPxq9am7i1XeimuiVzdMbNqIPMDA?=
 =?us-ascii?Q?qfI84au0wpq+gIBRgpu28YWsaPYWxCs1zyinYal/BluHDmpQY80xPT4YdZwV?=
 =?us-ascii?Q?sn0unhTypEpMzKrBgf14KoR7FLJZXTfR/+KmglIR0d627cQ7zc9JJqb7q0V1?=
 =?us-ascii?Q?Fz6M/iIP/6JPLrirQLaixuFDbTS32+YWSGwkJ4wmz1E87ID+U4EmPwcgpcNI?=
 =?us-ascii?Q?oZybheBeN3nTANIU21gnWR8xA0ilboZUiKlDbaTBJta1KwA6O420vR+o2qaS?=
 =?us-ascii?Q?SKbs29UMmZQLGp89Y/VgR8dK61HXfVvt/FKtk3UDztHuF9WFt5iEY637pb9A?=
 =?us-ascii?Q?nptvkvjADixmnmf9dKuIfWXBHCkJrMSrS/no?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?f2AhBhXPYbvEFwZJ16KbBiNGkjX3tV8fVCxTOz1+9x/r8v81lt5SJmEXetQb?=
 =?us-ascii?Q?BO+K7sWZgnP3QRDI6NaGVjc+rUwQPoI9hRw8T52lcNnPsBwDdBqpHSvcT1h3?=
 =?us-ascii?Q?dun8UtC2Wy+xxAzvx3Nyj17QNWTlcb7uD5bslJMCsO/KRFilbOWltsBgYp0U?=
 =?us-ascii?Q?dAmHyhzbDKA9I8c0a8DQV2qzkOVdAgfqPiSvM9wl/IaOag/uBq9gXbJztaQD?=
 =?us-ascii?Q?Mu4ob38eZYi7mJAl1a0xWcDcrNpQbjYorz82pnRwJcH6ZbUk68uyAUDoyBmc?=
 =?us-ascii?Q?3sBIOHuu6L90jQehdajqNU7tgDEHhD0aNhR/dlMw2Lu8Tfl06WhwgIVDKsKJ?=
 =?us-ascii?Q?pME2Cl+r85xUPfEgYkR2bx0j0BVoHZj9sg1wFAQ0xDOTSMopxRaZnSTxhCPL?=
 =?us-ascii?Q?SDV2FfK7R1kb3pTwtpYPq6mL3x5kdjrxS7qc1oc/dc/XyOt7MbT46QPofyiy?=
 =?us-ascii?Q?Wb6iRQzx33YnK5hSGVMJ8iyFvQLbRrjxdZJBUW1cYW/hHA4taSHEjQ5Wtt+S?=
 =?us-ascii?Q?nh5WtSKpb27wHnrT1oXWTA3OVnLsq35/x5Zil0w5+JxGwLiCXfrzr/Avf5Wy?=
 =?us-ascii?Q?V8cpMYjzJZbR6xJYvdy2cEBl7vWcz0SkctdK0/V3L9p2zFBQYpYNCpdo6Y54?=
 =?us-ascii?Q?ZbK7Wkk5GZ9NZsocVISdoBpfhUxHW7QRtKXh2EpgDtub6bGBXBZTNklZN1B8?=
 =?us-ascii?Q?UNKlWBObXeo/Kp3yERimjm9av+J7k6AKEYCA96HlE4vfiGOGPQ0DC0JZUA8M?=
 =?us-ascii?Q?TKv9QzY/AWY/Tj1iJbX/58kATWe/YBQounX3UQe/kTejb/isvXjgseykbGv2?=
 =?us-ascii?Q?us/sBSL6FzqkNwYFTnqb1oHdnU4FnsM8hLN6DwfKqtbofFwSSc974A8JK9Vv?=
 =?us-ascii?Q?Nea1eor5638w2EdJYM18aakvDHOc17nUD7EW/Gzh8w0oPjb/GcbIrxCummYK?=
 =?us-ascii?Q?CjOXbiEN2rM4nXdSyKVjlukntFvhtmTIz6TCoAZ3h2RBhkLTeefI37dA8ZsI?=
 =?us-ascii?Q?92fWrHlVVZ4BnM+DGSGx9dd2jXtE/DvugA+RHGEmk+5VNzhifsDYxr1o0blp?=
 =?us-ascii?Q?K4SiSwpamQvkNFpDf3oi/kTdhENBshrApXMxvZZy25/y/BahLPkOL70ka39z?=
 =?us-ascii?Q?WpqC1rew0CxsmNuVKIgctATCas+6GWTuAFTGODESTOLi49Rm+qFJhaEWt4Yl?=
 =?us-ascii?Q?Jyo+ntJqNoj/5Am0Bpk1NSsGFwN26AdeXAi6TmouTWlWjsT35jVn73POSuYo?=
 =?us-ascii?Q?CXBB/vflpUW+UssXuAKWd/hWQnSd1xE0Mnlv/kVfAtI1oG0W9SjgGeI55zQr?=
 =?us-ascii?Q?7T5lLOHoE1ItWpbYOg1n5cAAnyA1ZHlgg/Kzn4MU03v+83Nn2dMy2RlMqglK?=
 =?us-ascii?Q?tY/4nVfc9/Jh7TdZ0jVeWPPRvTTuM+s3rptpn65S+Qmv5FV8RUE7iksXoZP1?=
 =?us-ascii?Q?o3x+cPBCR8y8rGRiYnBKz6CB2TTV6r3uoKt//BEhpLw/IV1DYFUJ4PdoLS4v?=
 =?us-ascii?Q?luWA4Ju1fLCvjQ8nghInZUGNIelr3Ld2m5uWAK+9v/fN9flto2UvCTt+oLxf?=
 =?us-ascii?Q?bvo6dqQ3f4sy7F0Zn7Oa6lP+dEWgNPAAcqjVCgVG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff08d62-e768-4698-6b51-08de1aed7828
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 15:27:15.8645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrndQ3GIccNptK3GbBZOdv1mHpOzDg45hmOZzAfuTh77ggh7cKfXaJg+9Jh1CSo7SGqbwDPN54zOLBDg3I6Mug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 15:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225664

Thanks for this contribution, it was on my TODO list for too much time.
I have also one small comment inline below.

Peter

> -----Original Message-----
> From: Niko Mauno <niko.mauno@vaisala.com>
> Sent: Monday, November 3, 2025 15:32
> To: openembedded-core@lists.openembedded.org
> Cc: ross.burton@arm.com; rybczynska@gmail.com; Marko, Peter (FT D EU SK
> BFS1) <Peter.Marko@siemens.com>; Niko Mauno <niko.mauno@vaisala.com>
> Subject: [PATCH 5/5] cve-update: Keep mtime stamp in the database itself
>=20
> This should help to avoid problems that will occur if the modification
> time of database file itself is altered e.g. by unassociated
> process(es) on the file system which hosts the database file.
>=20
> Since this change updates the database structure by adding a new table,
> bump the 'minor' version number in database file names to enforce full
> database fetch. This should also iron out e.g. situation where the
> database might have inconspicuously omitted entries due to way in which
> the mtime of database file itself was relied upon.
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/classes/cve-check.bbclass                |  2 +-
>  .../recipes-core/meta/cve-update-db-native.bb |  3 +
>  meta/recipes-core/meta/cve-update-native.inc  | 59 ++++++++++++-------
>  .../meta/cve-update-nvd2-native.bb            |  3 +
>  4 files changed, 46 insertions(+), 21 deletions(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index 259c699af2..7252c4ecdc 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -35,7 +35,7 @@ CVE_VERSION ??=3D "${PV}"
>  NVD_DB_VERSION ?=3D "FKIE"
>=20
>  # Use different file names for each database source, as they synchronize=
 at
> different moments, so may be slightly different
> -CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdfkie_1-1.db'}"
> +CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-3.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdfkie_1-2.db'}"
>  CVE_CHECK_DB_FETCHER ?=3D "${@'cve-update-nvd2-native' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'cve-update-db-native'}"
>  CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
>  CVE_CHECK_DB_FILE ?=3D
> "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-
> core/meta/cve-update-db-native.bb
> index ca83c80958..c1db67ce55 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -18,6 +18,7 @@ def update_db_file(db_tmp_file, d, *_):
>      """
>      import bb.progress
>      import bb.utils
> +    import datetime
>      from datetime import date
>      import lzma
>      import sqlite3
> @@ -31,6 +32,7 @@ def update_db_file(db_tmp_file, d, *_):
>      initialize_db(conn)
>=20
>      with bb.progress.ProgressHandler(d) as ph,
> open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
> +        pre_update_utc_timestamp =3D
> datetime.datetime.now().astimezone(tz=3Ddatetime.timezone.utc)
>          total_years =3D date.today().year + 1 - YEAR_START
>          for i, year in enumerate(range(YEAR_START, date.today().year + 1=
)):
>              bb.note("Updating %d" % year)
> @@ -82,6 +84,7 @@ def update_db_file(db_tmp_file, d, *_):
>                  bb.debug(2, "Already up to date (last modified %s)" % la=
st_modified)
>              # Update success, set the date to cve_check file.
>              if year =3D=3D date.today().year:
> +                conn.execute("insert into MTIME values (?)",
> [pre_update_utc_timestamp.isoformat()]).close()
>                  cve_f.write('CVE database update : %s\n\n' % date.today(=
))
>=20
>          conn.commit()
> diff --git a/meta/recipes-core/meta/cve-update-native.inc b/meta/recipes-
> core/meta/cve-update-native.inc
> index 298c89b498..2934f7ad07 100644
> --- a/meta/recipes-core/meta/cve-update-native.inc
> +++ b/meta/recipes-core/meta/cve-update-native.inc
> @@ -33,6 +33,7 @@ python do_fetch() {
>      import bb.utils
>      import bb.progress
>      import shutil
> +    import time
>=20
>      bb.utils.export_proxies(d)
>=20
> @@ -46,26 +47,24 @@ python do_fetch() {
>=20
>      # The NVD database changes once a day, so no need to update more
> frequently
>      # Allow the user to force-update
> -    try:
> -        import time
> -        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
> -        if update_interval < 0:
> -            bb.note("CVE database update skipped")
> -            if not os.path.exists(db_file):
> -                bb.error("CVE database %s not present, database fetch/up=
date
> skipped" % db_file)
> -            return
> -        curr_time =3D time.time()
> -        database_time =3D os.path.getmtime(db_file)
> -        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time)=
,
> time.ctime(database_time)))
> -        if curr_time < database_time:
> -            bb.warn("Database time is in the future, force DB update")
> -            database_time =3D 0
> -        elif curr_time - database_time < update_interval:
> -            bb.note("CVE database recently updated, skipping")
> -            return
> -
> -    except OSError:
> -        pass
> +    update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
> +    if update_interval < 0:
> +        bb.note("CVE database update skipped")
> +        if not os.path.exists(db_file):
> +            bb.error("CVE database %s not present, database fetch/update=
 skipped"
> % db_file)
> +        return
> +
> +    if os.path.exists(db_file):
> +        database_time =3D get_mtime_timestamp_from(db_file)
> +        if database_time > 0:

How can we hit the database_time being <=3D 0?
Did you plan some try/catch in function get_mtime_timestamp_from?

> +            curr_time =3D time.time()
> +            bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_t=
ime),
> time.ctime(database_time)))
> +            if curr_time < database_time:
> +                bb.warn("Database time is in the future, force DB update=
")
> +                database_time =3D 0
> +            elif curr_time - database_time < update_interval:
> +                bb.note("CVE database recently updated, skipping")
> +                return
>=20
>      if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
>          bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe =
uses
> CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch =
or
> update")
> @@ -107,10 +106,30 @@ def cleanup_db_download(db_tmp_file):
>          os.remove(db_tmp_file)
>=20
>=20
> +def get_mtime_timestamp_from(db_file):
> +    """
> +    Resolve the time when the CVE database was previously updated
> +    """
> +    import datetime
> +    import sqlite3
> +
> +    conn =3D sqlite3.connect(db_file)
> +    curs =3D conn.cursor()
> +    res =3D curs.execute("select TIMESTAMP from MTIME order by TIMESTAMP
> desc limit 1;")
> +    latest =3D res.fetchone()[0]
> +    latest =3D datetime.datetime.strptime(latest, '%Y-%m-
> %dT%H:%M:%S.%f+00:00')
> +    latest =3D latest.astimezone(tz=3Ddatetime.timezone.utc)
> +    curs.close()
> +    conn.close()
> +    return latest.timestamp()
> +
> +
>  def initialize_db(conn):
>      with conn:
>          c =3D conn.cursor()
>=20
> +        c.execute("CREATE TABLE IF NOT EXISTS MTIME (TIMESTAMP INT)")
> +
>          c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER
> UNIQUE, DATE TEXT)")
>=20
>          c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE,
> SUMMARY TEXT, \
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-
> core/meta/cve-update-nvd2-native.bb
> index 01d3e8e754..77d7408b16 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -72,6 +72,8 @@ def update_db_file(db_tmp_file, d, database_time):
>      import sqlite3
>      import json
>=20
> +    pre_update_utc_timestamp =3D
> datetime.datetime.now().astimezone(tz=3Ddatetime.timezone.utc)
> +
>      # Connect to database
>      conn =3D sqlite3.connect(db_tmp_file)
>      initialize_db(conn)
> @@ -141,6 +143,7 @@ def update_db_file(db_tmp_file, d, database_time):
>=20
>          # Update success, set the date to cve_check file.
>          cve_f.write('CVE database update : %s\n\n' % datetime.date.today=
())
> +        conn.execute("insert into MTIME values (?)",
> [pre_update_utc_timestamp.isoformat()]).close()
>=20
>      conn.commit()
>      conn.close()
> --
> 2.47.3


