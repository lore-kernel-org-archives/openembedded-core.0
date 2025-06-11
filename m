Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577BDC71136
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 17:51:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.10])
 by mx.groups.io with SMTP id smtpd.web10.1838.1749664274424321426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 10:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=nxy7Yl8Z;
 spf=pass (domain: axis.com, ip: 52.101.65.10, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT7NkCEJ43qrmT/GnSx0m+E1T7DD7OM+ip6EFhFeoLodqNABU3BEY6Cw2s7M8bLvUqx/Zw1fEDyy2O+SlDTSzO0PJ4k5s1Om3G0jwNiZSwxowL0RRv7AQtEoJYx+BvS0zmgWndQmR4/PNGWEpbhoU2TQuUqvoPr/dowxWup3pxIsk6fx5gT7JNR0e2Kv631BJEks25bVSJ7iie79LAdZXlsegefvJ0nJf1cDP8T9BZwTk1XAucoT5fR1BY7sDn78yr0dnTgaSjk/+Alk8jQZvM7K5bS43XzY3m3v1FrzZ7LIwdoJCMkoBGPbtY0H5wuqbWIC3u0l5YsQORd7iBElug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG+LRpeGL8fx/h2O3noG4JKx881SCxti6a3yw5a4Wqk=;
 b=JrvgjCmbbRc93O32y90LdBCJk7Du6DfzGntf2fYWBIVqSw0Pzjhe4Ww5IFZtbaA7hL4xfFuTSDiFu7/xSebpi6x7qg/vsmpJNoJMZrkhJWK8RsIogaL+rlHIHw2JotkbGVNR5cXANZWwsFW4oYOp+WT2eD+0UKvSaFfSApwL68da0XmhAk6Yv4UU2tkPrI9dOdAhPAAFpfFue+Q9TqmepVYMQ9VQ/k8CvwGuxT3K38y4/u2xK7e/P1ugDNXYy9l05eB/289D2Vevg5jV6g5iFcBrlV8XhlSJC4YnK8vFZEg8lbnkVRZsHiUReTBv60lTiuhxVWGC+2/U5I3JBK8BRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG+LRpeGL8fx/h2O3noG4JKx881SCxti6a3yw5a4Wqk=;
 b=nxy7Yl8ZpMJVDGBIhvy8KFc95pFXKxC80ncZsHrSWCZFRNJ1RxKntLULUO+UfQiMXvB+32cn6uvan3YZf7fiW6A7avbwwu/8Kpp4uEf/ynGy89wBnBd9gLAAmNgSqd3P8sdkEirE60oCY94/Wqgv7aToJDo06b6MQfV1KlzGOEc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9626.eurprd02.prod.outlook.com (2603:10a6:20b:5a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Wed, 11 Jun
 2025 17:51:10 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 17:51:10 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [RFC PATCH 1/9] bitbake.conf: set
 BB_GIT_DEFAULT_DESTSUFFIX to match default S value
Thread-Topic: [OE-core] [RFC PATCH 1/9] bitbake.conf: set
 BB_GIT_DEFAULT_DESTSUFFIX to match default S value
Thread-Index: AQHb2exPpV7exk3sKEuaB56yjSaCQLP+OyBQ
Date: Wed, 11 Jun 2025 17:51:10 +0000
Message-ID: 
 <DB5PR02MB10213988D0EE8B84F66840730EF75A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9626:EE_
x-ms-office365-filtering-correlation-id: 7bed6655-deaf-424b-1e21-08dda9108d01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gkrKc9ZFUaePrlAaW2MvurHLFEY1VsQoWFJEps2CCVG76C7F6f0wIs0l3Woc?=
 =?us-ascii?Q?QFM0MtUthdQLkcmkvrGXxsSJDPTAGCMRHA9JmeSSGYqaBcH1ivKQkgNgu6AQ?=
 =?us-ascii?Q?uirahYAlBbV+N+s2S13TRr0v6KTkRn3deOSpU6Mv+FnE6K1bfp5TbPdtQDwr?=
 =?us-ascii?Q?V2aF5T82PovK96byKn9qTlWiJ92OI6ySeWLjcCtGaskTnfgs2EUWM9AZEfsi?=
 =?us-ascii?Q?G3pxFOANOj/A/2HTwDSudG8CzmmZ0BDhJy3lF1dyIS4duX943bHKB0+dD3Nk?=
 =?us-ascii?Q?bYxokmCW62CDIGrsHoSpFBecD0yW4BzJzya0hgPsh0v4VxQ2JsgPJwqCzQ/N?=
 =?us-ascii?Q?MqQzmsitc2cwYO5rN2P5ykuFygtzdHqqc+jmodz8YVIb/+8Ylo268tfTY6nb?=
 =?us-ascii?Q?7Kt2lxeZWNXFpoM7Mzy1eRqlIUwny6G/wO9cu4ymuVh1W3Kzi8PbIP7UsxG1?=
 =?us-ascii?Q?5n5FiS18nwYKqC1IGaTvXog6FYv+Bo02ZcBIcINr3WmDA1Ni8Fe91Xbx2Iut?=
 =?us-ascii?Q?kvfSaC9XFuIS3zWDMjd8qbfUTDPqZ/PBPHkE2V3lL6hrguCfdm70HhMVd9Fs?=
 =?us-ascii?Q?w6Z9SoIEBn590rDdj13cQn7gmoRy+9kPgZoTaNn7Qmjfg6BlzywgSCrwt3cf?=
 =?us-ascii?Q?gesUiWNZyv93ZRvNE8Afjyd56yHQ45KaeGMhgq3agHR95GWYs7hb55n9kYww?=
 =?us-ascii?Q?1VU+Am/FjqeeHcKkR5J5o42rVVlzZB7iJP1yAisqlcJ5jQSrdAz6kLRY4nuW?=
 =?us-ascii?Q?zAy3PTjcTzRmdSOOl5k2Snhr69mM9GI08FmssUC09JSw5IgqjqgD5LcENUzX?=
 =?us-ascii?Q?vNhU5urIxuQ8ik6hv7K77gHDPk59Nd4HLaKYZ/kwH48VBaPS/ASaFBUXwFM/?=
 =?us-ascii?Q?8LIvis5tZZTNgpuZEfygVJZKsr5oFTvHtBkeHHYyMxswrT7ItMKYqAUsdD09?=
 =?us-ascii?Q?KznZlP5Ebp1NlQab6clsoNO6FdM0jnVkV/DKNGPvzW1fuWF+h+7eVCLmlkb8?=
 =?us-ascii?Q?w9vPnKwPxyEEioZSE0k4eiFLRl0acyQ9UPHsK5Tvl1ohkF+qDnfagxQJCX30?=
 =?us-ascii?Q?NVzv+FCHrekiql1zx9btz0vSowxb5jZvmN3iUiYErkCd7TTQR3JpaQUoeLrP?=
 =?us-ascii?Q?m6Bcz/BF2zbayJO8RNP4LkrD1EtkVP+DuZYhfNBxR6Oc8thE3uPjIi0Vegzq?=
 =?us-ascii?Q?2syj4V/yIoL1U+EY6xnb+lQkMBGwNVoK41u+DIc/zSLAIe2Vbsh73tfw0ghl?=
 =?us-ascii?Q?/blnKEBu1efJb5UJZxoF1Zfkrc0Kfy6qbDayC26XnUBJggBbRLpqsKcoTp35?=
 =?us-ascii?Q?5BD2arn7B7bn4gXVLxr++m8ZO73OYzeLVdfW3GWtvEtblisoBcfWPEslZB2G?=
 =?us-ascii?Q?dIZITwUDPAeEV4B7So/FXa3oR4E6yJwJ6yYCfXZQANa++o7lSaY+meqq4pot?=
 =?us-ascii?Q?FVHeg/3rU1cwfil8ofN0PkLCqGCjk8xi1DhqaP86IH4dYKFLm+tbvi1SJw4p?=
 =?us-ascii?Q?a5MQ96GTO57Asd8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?C322tjvKSKPum8tPePsiJXa/H8k5jdG/S0tVLbsIMOo/J2PjWSRnGHWQpcCr?=
 =?us-ascii?Q?ADw4pPOGGDZ+jLz5gHxkSmPp7hucjP4L0K9tWiXo++9mY5TnGWiDPRCcEypU?=
 =?us-ascii?Q?mnHTAb6bSHnTqsfmSEzyPel8dkOKlMs2zZjyIf1dB9db4prY27oaJgXYEINr?=
 =?us-ascii?Q?ub0EaHqg6sylCO3plQD0no0ANJAghczkm95n8SHhNRwmtUgu8kFjYE1L2Ra0?=
 =?us-ascii?Q?fvb6e8UIb9t2Foy9jxI3vCEoWlWc2ZdOrqgof7ueVGGIibHflRK5TJc+lUGu?=
 =?us-ascii?Q?88HckvApP2POd72mv4TtXbfp/+kzrit8urK+QUhO/xXYew74IR45hziwMqmV?=
 =?us-ascii?Q?GojAbmV7F8HSF5eAEfzEJYQcfDeD5XoM8lFMTZO7OLw/dRDJ+vbXpz0tyJXL?=
 =?us-ascii?Q?q6njMDyillt3Q7CC1QqyHRtq3TcBV7np+W7koP5DwMNBmUErtNWqvpFNPUyh?=
 =?us-ascii?Q?6cCGvek0CXlTaKdVtsgBTaOywoLE2CzqgadHtDRQSV0gb6hqfMYvFGqzywlE?=
 =?us-ascii?Q?toiaipN0ycGhbEhATIZInnEEhlAom3sfjD1P2CzKnbxahwb7gu0m0LMVOS89?=
 =?us-ascii?Q?AYaLvPcTiBuMGWEQw6BmbUQt4l2kRxDSRZ8EjwWpUv3bDNyAhzI/vbqhBt3n?=
 =?us-ascii?Q?7cEY6GlkdOeHztJHD+nzZwdTaMnxJIVm4pKC14FjAcRq44aI2SUNc2qZnnqY?=
 =?us-ascii?Q?+DbjyRvTzN+5pJT0n4kCS6cHHxZL8ke90+UC8NngJZXpzZM41XnFlS/5ARkC?=
 =?us-ascii?Q?vl7W38WVvhOdlpDIGvAVQl+lyXY3KznEbBV9FaEJ+HGzQC0Wd6Bh4DBkK97p?=
 =?us-ascii?Q?Zw2kxdj/8GW6LrL9TWeJ8GPKODzrXREieoV66EjEyOBD8s5kScadFJNp+KK4?=
 =?us-ascii?Q?OtyDc91aXM0fZLEWHqknIvX/xQC7DJ/+xmEbaZYMlt8IvZ5ciEMdFAuhVEsg?=
 =?us-ascii?Q?rOjNgdw4xRO5w/t8zjtok7h4wNKhkI7efV3IHCVu5sB4Go+C50R/KsyC87FZ?=
 =?us-ascii?Q?RFMa1PuaqLq4/xpOhLfxYAN+oDxV6Cm4XBODLtTbliJoO+AagsEAPt0Hgy1l?=
 =?us-ascii?Q?LhXhg2s3SiozgE8a00Lhq770gtQQ/2yWpj4j0WUFFNfnXD9ujMJZzSjmB69B?=
 =?us-ascii?Q?zf1sREV3xQYhV5Fzmdh/DPxsJKeK3gsDBey0M/SxamSva5Rc9ebXDlJy33sF?=
 =?us-ascii?Q?uds+S8+sp7+zWeNUzWxn1KxXvaFPpWkxCJKQyD2VwBkhLs9XoSE9+S5WwPys?=
 =?us-ascii?Q?bHFg6/o3z1mjSK18Gj5EB7FsLSe1V2Qmr6uHUx2+86VVj3hq6g6AFUMNsfRa?=
 =?us-ascii?Q?uGRpxrMV+jBOdcBtpb0GddnbIiJ/X5ZVL4nEkhsxTnMbtDVOqjFWHLHxAXXk?=
 =?us-ascii?Q?s0b/faMq9V2aj9WQM0o+kZHtuToS4pNewbPx4EDysNJtUsB3tw4jjQlqHJf/?=
 =?us-ascii?Q?jm2qBF1k3HhbjTaseNtNXIIScv4GQIR9MfUYiLG5o1XMqCQCaEXd20Ja3z1f?=
 =?us-ascii?Q?BNHoIooatsW7iTbZh/La8FC7i2TFb3LdEL+Ic9/J/ssZHqH5W2SMmTmzihs/?=
 =?us-ascii?Q?aBkgIbb4DSI4TB91Fxw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bed6655-deaf-424b-1e21-08dda9108d01
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 17:51:10.6541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7z2yuVzL9MH3KBcn4eJZf0DI+gXptmlZht2bIcDHFNwHHJv5SnDL4S1eIwHJW3bG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 17:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218466

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded.org
> Sent: den 10 juni 2025 11:44
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [RFC PATCH 1/9] bitbake.conf: set BB_GIT_DEFAULT_DESTS=
UFFIX to match default S value

This change does a huge amount more than that subject indicates.=20
Would it be possible to give it a subject that reflects this?

>=20
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This allows removing all the S =3D ${WORKDIR}/git assignments.
>=20
> A few recipes are setting S to a sub-directory of the git tree and need
> to be adjusted accordingly.
>=20
> bzip2 recipe is fetching a tarball and separately cloning tests;
> adjust the recipe to put the latter into 'bzip2-tests', instead of 'git'.
>=20
> devupstream.bbclass no longer needs to rewrite S, and is adjusted
> accordingly.
>=20
> Adjust scripts/lib/recipetool/append.py to not hardcode 'git' as unpack
> destination.
>=20
> Adjust kernel-yocto.bbclass to use the git unpack variable instead
> of hardcoding 'git' (there's also removal of repetition of
> string constants and a correction of workdir/unpackdir mismatch in
> one of the if-else branches).
>=20
> Ensure build-appliance-image recipe does not use 'git' as checkout
> directory for
> poky repo, but rather explicitly name it 'poky'.
>=20
> Ensure reproducible.py code that looks for git repositories does not
> hardcode 'git' but uses the destination set by BB_GIT_DEFAULT_DESTSUFFIX.
>=20
> Ensure recipetool does not write out unneeded S settings into newly
> created recipes that fetch from git.
>=20
> Adjust selftest to not hardcode 'git' as unpack directory.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---

[cut]

>  200 files changed, 46 insertions(+), 239 deletions(-)
>=20
> diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb=
 b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
> index ca2141c9722..e87e8f15b3e 100644
> --- a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
> +++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D "git://git.infradead.org/mtd-utils.git;bran=
ch=3Dmaster \
>             file://0001-tests-Remove-unused-linux-fs.h-header-from-includ=
es.patch \
>             "
>=20
> -S =3D "${WORKDIR}/git"
>=20
>  # xattr support creates an additional compile-time dependency on acl bec=
ause
>  # the sys/acl.h header is needed. libacl is not needed and thus enabling=
 xattr

While not technically a problem, this introduces double empty lines to=20
many recipes.

//Peter


