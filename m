Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3914CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 13:26:53 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.web10.13976.1755610005969719716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 06:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oo5IHu8M;
 spf=pass (domain: siemens.com, ip: 52.101.66.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRqRMdKtIM2KbXZpb9Bqk5Gd9Q+oTNGfliYGp9hCn2ceviqDS+l+dy/nbo7MH3KSsCXh8CEp98XLWA4mcyScuNpd5ZYLEBa7IRbSQqPgHE2kt+CNczXod6nmj6JLaEYdfPUgQoa8vvLggFuZO126gDWq2MZltoEq1EF4QZtKW+uZiJnp7/NZxaJyoO1l7wPePXUuGuI8x6McBRP4TmtUS17/nbmuzkcC+wdAQS5tHSXJHuI1ntVdrIu7Ezmm7cvKz2CZuabiKoUU34pZsJLA6tsCtlNdevJZ+f14hbmRVz6WQdK6FMgTHuBf/7/o09heSXJwcaeGzL4gLnXBjs25rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q/3F2G96Zhu3RQ6BD0ZysaIKidJQkAi4AQMB2+Npok=;
 b=auPZEQbgTFZZtaMUb2oQwxO/xqkBDO4EC4biQQlMBNBi+gjN3afn+OaKgausnkWoB46FmR+qE/6jD8v+ScjU3Cw/SfhCYUstm5WeToeh1zfLUiS7cakfPqa4ELGzcJYZK2BpDleN/A8xJlgZNALJzhs0ThgLZhkYP5K0jXowcYWRaKkktcW2m8oiH2+ymmydxI2X2HZr7FeGiDli8FE1BiBuXrP9mEGqDdtgjXJnHva+kTOeh1LqDUIBkYsxIBpGK5YNqC7x51/D+vYQRRbW5icxiyMEOqF+fOYIeFi/0swpg03jyIJYS8dDXg30F+oksAoYzwSYaOVhsD1hcHQIPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q/3F2G96Zhu3RQ6BD0ZysaIKidJQkAi4AQMB2+Npok=;
 b=oo5IHu8MIQ2Lp4NaVEU3zmdMUTqwKIaNHM7ABl7B4dyHfX1OrL8qbclRLcD3g13Rub6aTl9qLFvi25ayuYusoL4YvPLiQxvalN69Qs5R0xDs4pXQBXAnCdKqEfFTpNLVfpqYB84gAnnExFkTHxI9e1ClHRDskQGNV3L3Q6I707045q2wHfIJMTEXS9EHxO7Mt3EoNEkYRhA4yLs3tYSI3GQ7F1n50ie6S3EelgRBJZzprwddIQmViiz74CM8CPeqVHGRZHeJCWnIPZD4bsXzONr6LNYWZSKrWTm49R4Y/CMP66HbnR6WLF5sL3CqojC6ns0bBmuK/p8o/EGo8zHi6A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8824.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 13:26:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 13:26:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "youngseok1.jeong@lge.com" <youngseok1.jeong@lge.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [meta-oe][kirkstone][PATCH] json-schema-validator:
 backport v2.2.0
Thread-Topic: [OE-core] [meta-oe][kirkstone][PATCH] json-schema-validator:
 backport v2.2.0
Thread-Index: AQHcEQwbEDr9DEoCAUC2H5YR+pA7rLRp9vhQ
Date: Tue, 19 Aug 2025 13:26:41 +0000
Message-ID: 
 <AS1PR10MB569707601FC1E6559192E6B1FD30A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250818062647.11831-1-youngseok1.jeong@lge.com>
In-Reply-To: <20250818062647.11831-1-youngseok1.jeong@lge.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8fa43baf-74d8-4427-b992-f1abc0126446;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-19T13:24:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8824:EE_
x-ms-office365-filtering-correlation-id: 69aaf6a2-94bb-4a4c-acf2-08dddf240913
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qq5Rwi7N0/z4R/juJVhg1da0ee86hSAzBpveubI/1iba/roaGepCsc+0M5+c?=
 =?us-ascii?Q?V8Zln5L9HWmF5FyEtniyLgd0Z51snjQk1sZmlOZChh7Hr4VC8E5iCY9pXVmU?=
 =?us-ascii?Q?94i34CRJmKOgu6mrCTLa0K8AC8jHvQfRCZx+m5OKhQbMDqp1YrruUhUgkhTE?=
 =?us-ascii?Q?5QQGZ8S4t4/YGyVDBO0QJjc6FAd9twWDuhMd9unYvbIOpqn8ECr72p5vRe7R?=
 =?us-ascii?Q?6RtT26nofzsrW3f51z+bl9TbBstEDhX3+jrDwXcVw5P9Qewedg1uAtDUqcLx?=
 =?us-ascii?Q?uOfk2PxV6rLYcLXzYmW7WgqN8MJc+7P9MPcNZXImL0tXskQN6XN2lf0NsaaO?=
 =?us-ascii?Q?xKfsK9GPOl+HyV65O9jQEtTfz9uTGhzeFCZLXu4FBg4/OxQf84HxkSuut423?=
 =?us-ascii?Q?kRNWj/MtxEwsIkyACIJ18AOW5zaGjBhug5omKT4StoIC6KtBzUeUo5WJeGbj?=
 =?us-ascii?Q?HF8zEVYbBBW+ZmD4uEXjC4V1kMXV+6piedkoGzblxXBr3ojWWL/gaJGjhYmW?=
 =?us-ascii?Q?3DbGR2LqeM4buk5xyqBY+120PiUUQs86fdrfrm6P45yz1agpsVCel7yQx3nk?=
 =?us-ascii?Q?SVOMF9mkj7zOOiAOTD4emXYwRSZY4jEV00UCn1ZpM8/omMrT5CTB5ap0Klto?=
 =?us-ascii?Q?Xy8FjhxSj3dJoZ53EQdEoQLRyXHVhlEmRJ/bdshxiSe8EEXzMVFaFC0qcvCT?=
 =?us-ascii?Q?WzTjHwUm+/cqPGHi+GHlNHl5f7clpAbRKO+KxKm4Vy5znsxZ0urDBxPM6k6s?=
 =?us-ascii?Q?+fiBPZDZ3Ed0a8JetXFXlT8oI1+RJShvUX1IQMKQG1QkIXqjjTrWlCVlyieP?=
 =?us-ascii?Q?VYHK0gmDtomysxkL0V0EmCpe9YvL6vUKAc4xM7HKxCF4SV9dsQZhJX5CBORy?=
 =?us-ascii?Q?3O/zoneAiKq6jvPT5wbFN/jrinn2/0F1bfKe/wAjJngg/UCLuna2+7vbEiFx?=
 =?us-ascii?Q?s26lK1rtg20PSGQK9hejNHzlHkiMLzc12COV0ZQ2MjxutvzZQOVJT+odkBWN?=
 =?us-ascii?Q?cGNuadG1AKQk2Cc4n9hyNM9NSlDjomSP6I7ES0pFAm9mKiVvrYx1iHFwOcdE?=
 =?us-ascii?Q?EniYVWKaQpQ6/34sXsGxVIz8yqUAEI8iXEzfYpgQaDS5olTgwcGTC/8p4G95?=
 =?us-ascii?Q?nFkvfRKnRLDjVTu+RG1A40BlNqnJRIjfdW9ZmifgYCZT9uXccOUOVX7WrIw3?=
 =?us-ascii?Q?4HGnxskD9+E3xF7atNosmbF9fN0kuFMCnMtETR5SNC+NZW52PDj4qTbFlemu?=
 =?us-ascii?Q?iHsMfU+Dui+UhsA8zBTRxdTUjxdPCuhoqGGVn/vDIW5TCeNKmEoZzYRUO19f?=
 =?us-ascii?Q?oAbBGTnPNOWsDZWhiVPmGulC38Jl9Jd230Z2+qd72tCxw/8EyCypnC3MwNAL?=
 =?us-ascii?Q?3ceQ2xSoNU3Cyu7b/Z/FsR+w3Tvk5i2QgBKHx4zwXaMCbJuO4ZZF4P+pvi8+?=
 =?us-ascii?Q?9UujW7saBUE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bgoIJPrNcQe5TIE7gdHG0m/9PUaqpd/gchexp2grdDuZ2yo9Et1OoCFk3CAO?=
 =?us-ascii?Q?9U9WlsicRFKSQudQjiDxqJk734HiQW909gXSZ52X40i5rc31a+ejrd2F6CiI?=
 =?us-ascii?Q?5EMlSy+YZd8+TXBrOgdsR/4Y0qsQKRqO3jnSdIxXWl7GnpP6dBTtI1yy49qH?=
 =?us-ascii?Q?jTYT20PpwIQwA7z3coad9TOqdF1R1Z+c/LF3LLEcfAiZZY7xGXrbQ2TLNW8j?=
 =?us-ascii?Q?8p/z96qpavDcls/x4oJZei+mF8Q1xj25b+7aK3HvCIj4PFW7raykONRgu/ah?=
 =?us-ascii?Q?xPWRQrcQ7OoRd8d3qqEaZL5m1qFdMKyan26uD9xy+A/lLgjENLo+nGtrGSFR?=
 =?us-ascii?Q?PImpS5EW0Yf5lEjLazxY30imvgTyCLZD5ez6Zp4CEr5WztR5e9CRj0sh2+nt?=
 =?us-ascii?Q?GWMAeyKns1wDTnxeBphmOCdZcpJNnd62RGbK7hBl73d6PivhJQ1neGKyKZzk?=
 =?us-ascii?Q?S5J574qItMXIZBgPsXtO0IWMiDaw0fx1urDURm3tB9DKIP+JVTYke5znKUtP?=
 =?us-ascii?Q?zhgJvnTZCd19+QgX5P5pMnJiNy/9f2acz3H055pSaWaAKURIqONmpiqQyxjL?=
 =?us-ascii?Q?0sj/CFoJJYc/HE2wEeNik3wcVwkxO/YL2SLoyzNo+k6+nL+Q2vg383mZgRKA?=
 =?us-ascii?Q?oVCKnwgFGk0hjz2i30Vm4HWVhMFiBY6JvGaWaj3MnGxk8DxRmpII8RCd7LDc?=
 =?us-ascii?Q?h27UCKzQYeWVduvmNb5bsEDc7WSbFwInvFw+z99MqZ7wpVz8f0m9ytHEpoCt?=
 =?us-ascii?Q?qEg09MkHFxnV2wOH4w+KfvoX6kaUWctvLL7RyBP73wngxjuXaKnjnBPZdSol?=
 =?us-ascii?Q?HBQ+Jt/vmR9OnTtE3HsVdHvnTXwq67HcnQCD4Drl1uqsdBsa+NKoPnb08R78?=
 =?us-ascii?Q?f3mhxUP6lsW1MWYu5A2TBwFOnkZNFjqvrk8dhL9JAW9gHbSRBitBTry20J2x?=
 =?us-ascii?Q?VB+0GhvZ8gi+H6eaZlFo+tsUbuvQeBpqlnR4/dAvCE76ClcuwRYMarlNdUje?=
 =?us-ascii?Q?G37FsZRalXuu3hDyt4thEGlr7y3WFNw6J4Wl31Oxv6EdpSvjiNSGzemIMGrl?=
 =?us-ascii?Q?fCfNfSr7GxNf4yShCwDW0zfxi0RM9zRkN7KXMiplur3YJ1qNrUGgYZpHEbNm?=
 =?us-ascii?Q?UuUvQ9JS8Pgq5leq7GZnYcSSK8iW6e9bRtn7pRNbbKalptBaVS3X9R+NnGEM?=
 =?us-ascii?Q?U0Wnf/ARV7WoVxvApTCNOjfVcbQQGFTM9Ed5xjH8rEcPXV3oyu5kIT4h4Ik+?=
 =?us-ascii?Q?l00Alj0AJu7BH9K5VcQ6ynxMOfR7UmpZkLA3omQtc8EQDVNmVX8YmTXxW26/?=
 =?us-ascii?Q?sSkDG1TX+XFe+gNo/ILqfH2FSQgEEsKVH5C9hmMrw7+5HcrPgPL3mO8bYBRL?=
 =?us-ascii?Q?sw0WBn/GVDY7sCVDSWnsB+9950dCMZDTnUp/X9209P5qL6Wnq1A2oFPaCdVU?=
 =?us-ascii?Q?lDcmPZtDfMojvH0lO9qD9t5tHViczgyE1erz1yw5l74MW+mm8M9+JcVpm9FW?=
 =?us-ascii?Q?nFsJZDb7D+WLosyVGBnfp8Zub6r9hmlaXVnKFAHdPjJnHyBfZGNNsudbwZ4b?=
 =?us-ascii?Q?oWyDhe91Vv9RC/QQxeONXtwi+/tp89Yh6UQHAw8f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69aaf6a2-94bb-4a4c-acf2-08dddf240913
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 13:26:42.0040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gbefpb4GmUvJ+J2GHPDwX7ah1AQfqYWsSnxmFq4Di829EPYJEEOJjBSTMuEzJV56Zd7MmxQc4FURkkEo+dexDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222113



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of youngseok1.jeong via
> lists.openembedded.org
> Sent: Monday, August 18, 2025 8:27
> To: openembedded-core@lists.openembedded.org
> Cc: Youngseok Jeong <youngseok1.jeong@lge.com>
> Subject: [OE-core] [meta-oe][kirkstone][PATCH] json-schema-validator: bac=
kport
> v2.2.0
>=20
> From: Youngseok Jeong <youngseok1.jeong@lge.com>
>=20
> The v2.1.0 has issues related sysroot when some recipes DEPENDS it.
> For details, when CMakeList in some recipes has the line like
> find_package(nlohmann_json_schema_validator REQUIRED),
> that issue is occurred.
>=20
> See error log:
> The imported target "nlohmann_json_schema_validator" references the file
> "/usr/lib/libnlohmann_json_schema_validator.so.2.1.0"
> but this file does not exist.
>=20
> A patch to fix this sysroot issue exists and was included in v2.2.0:
> https://github.com/pboettch/json-schema-
> validator/pull/128/commits/63406ef87f23c55d8a03a0ac6e3149a59edf037e
> So backporting the 2.2.0 from scarthgap is better way rather than
> applied that patch to kirkstone.

This is against LTS policy.
Backporting patch is the correct way to handle this.

>=20
> Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
> ---
>  ...or-Install-off-if-it-finds-it-via-li.patch | 29 ++++++++
>  .../0002-Fix-assumed-signed-char.patch        | 71 +++++++++++++++++++
>  ...003-For-root-value-use-empty-pointer.patch | 41 +++++++++++
>  ...ch =3D> 0004-cmake-Use-GNUInstallDirs.patch} | 23 +++---
>  .../json-schema-validator_2.1.0.bb            | 16 -----
>  .../json-schema-validator_2.2.0.bb            | 19 +++++
>  6 files changed, 170 insertions(+), 29 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-
> schema-validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-l=
i.patch
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-
> schema-validator/0002-Fix-assumed-signed-char.patch
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-
> schema-validator/0003-For-root-value-use-empty-pointer.patch
>  rename meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/{0001-cmake-Use-GNUInstallDirs.patch =3D> 0004-cmake-Use-
> GNUInstallDirs.patch} (60%)
>  delete mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-
> schema-validator_2.1.0.bb
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-
> schema-validator_2.2.0.bb
>=20
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch=
 b/meta-
> oe/recipes-devtools/json-schema-validator/json-schema-validator/0001-Set-
> Json_validator-Install-off-if-it-finds-it-via-li.patch
> new file mode 100644
> index 0000000000..6e6a4b93e8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0001-Set-Json_validator-Install-off-if-it-finds-it-via-li.patch
> @@ -0,0 +1,29 @@
> +From 35939115142db6cd366ab11b29692a0179338ddf Mon Sep 17 00:00:00 2001
> +From: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +Date: Fri, 18 Aug 2023 15:54:25 +0200
> +Subject: [PATCH 1/3] Set Json_validator Install off if it finds it via l=
inking
> +
> +Upstream-Status: Inappropriate [newer version of cmake in main branch]
> +
> +Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +---
> + CMakeLists.txt | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index f636734..9e4587f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -55,6 +55,9 @@ option(JSON_VALIDATOR_BUILD_EXAMPLES "Build
> examples" ${JSON_VALIDATOR_IS_TOP_LE
> +
> + if(NOT TARGET nlohmann_json::nlohmann_json)
> +     find_package(nlohmann_json REQUIRED)
> ++else()
> ++    message(STATUS "Found nlohmann_json::nlohmann_json-target - linking=
 with
> it")
> ++    set(JSON_VALIDATOR_INSTALL OFF)
> + endif()
> +
> + target_link_libraries(
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0002-Fix-assumed-signed-char.patch b/meta-oe/recipes-devtools/j=
son-
> schema-validator/json-schema-validator/0002-Fix-assumed-signed-char.patch
> new file mode 100644
> index 0000000000..1c4b871bb6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0002-Fix-assumed-signed-char.patch
> @@ -0,0 +1,71 @@
> +From 2065015da40cf79dd8ec9e3f186538e17c3b592f Mon Sep 17 00:00:00 2001
> +From: Robert Joslyn <robert.joslyn@redrectangle.org>
> +Date: Wed, 30 Nov 2022 13:07:29 -0800
> +Subject: [PATCH 2/3] Fix assumed signed char
> +
> +The code assumes that char is signed, but whether char is signed or
> +unsigned is implementation defined. On some architectures like PowerPC,
> +GCC treats char as unsigned resulting in compile errors:
> +
> +	smtp-address-validator.cpp:213:1: error: narrowing conversion of '-32'
> from 'int' to 'char' [-Wnarrowing]
> +
> +Fix this by specifying signed char.
> +
> +Upstream-Status: Backport [https://github.com/pboettch/json-schema-
> validator/commit/491ac44026e08f31790f5cacffa62e168bb35e32]
> +
> +Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +---
> + src/smtp-address-validator.cpp | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/smtp-address-validator.cpp b/src/smtp-address-validator=
.cpp
> +index a63ead0..3903b51 100644
> +--- a/src/smtp-address-validator.cpp
> ++++ b/src/smtp-address-validator.cpp
> +@@ -63,7 +63,7 @@ static const short _address_key_offsets[] =3D {
> + 	1363, 1365, 1367, 1368, 1370, 1388, 0
> + };
> +
> +-static const char _address_trans_keys[] =3D {
> ++static const signed char _address_trans_keys[] =3D {
> + 	-32, -19, -16, -12, 34, 45, 61, 63,
> + 	-62, -33, -31, -17, -15, -13, 33, 39,
> + 	42, 43, 47, 57, 65, 90, 94, 126,
> +@@ -711,7 +711,7 @@ bool is_address(const char* p, const char* pe)
> + 	{
> + 		int _klen;
> + 		unsigned int _trans =3D 0;
> +-		const char * _keys;
> ++		const signed char * _keys;
> + 		const signed char * _acts;
> + 		unsigned int _nacts;
> + 		_resume: {}
> +@@ -728,9 +728,9 @@ bool is_address(const char* p, const char* pe)
> +
> + 			_klen =3D (int)_address_single_lengths[cs];
> + 			if ( _klen > 0 ) {
> +-				const char *_lower =3D _keys;
> +-				const char *_upper =3D _keys + _klen - 1;
> +-				const char *_mid;
> ++				const signed char *_lower =3D _keys;
> ++				const signed char *_upper =3D _keys + _klen - 1;
> ++				const signed char *_mid;
> + 				while ( 1 ) {
> + 					if ( _upper < _lower ) {
> + 						_keys +=3D _klen;
> +@@ -752,9 +752,9 @@ bool is_address(const char* p, const char* pe)
> +
> + 			_klen =3D (int)_address_range_lengths[cs];
> + 			if ( _klen > 0 ) {
> +-				const char *_lower =3D _keys;
> +-				const char *_upper =3D _keys + (_klen<<1) - 2;
> +-				const char *_mid;
> ++				const signed char *_lower =3D _keys;
> ++				const signed char *_upper =3D _keys + (_klen<<1) -
> 2;
> ++				const signed char *_mid;
> + 				while ( 1 ) {
> + 					if ( _upper < _lower ) {
> + 						_trans +=3D (unsigned int)_klen;
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0003-For-root-value-use-empty-pointer.patch b/meta-oe/recipes-
> devtools/json-schema-validator/json-schema-validator/0003-For-root-value-=
use-
> empty-pointer.patch
> new file mode 100644
> index 0000000000..eac997ae58
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0003-For-root-value-use-empty-pointer.patch
> @@ -0,0 +1,41 @@
> +From fa49c29942763285c51b7d2dea417d9f51e4961f Mon Sep 17 00:00:00 2001
> +From: Sven Fink <sven.fink@wipotec.com>
> +Date: Fri, 13 Jan 2023 09:15:42 +0100
> +Subject: [PATCH 3/3] For root value, use empty pointer
> +
> +Upstream-Status: Backport [https://github.com/pboettch/json-schema-
> validator/commit/59c9d6200bf3cd54b4fc717ec1660c91eddb4d1a]
> +
> +Signed-off-by: Parian Golchin <Parian.Golchin@iris-sensing.com>
> +---
> + src/json-validator.cpp | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/json-validator.cpp b/src/json-validator.cpp
> +index 7f34553..3c73d98 100644
> +--- a/src/json-validator.cpp
> ++++ b/src/json-validator.cpp
> +@@ -553,6 +553,9 @@ class type_schema : public schema
> + 					else_->validate(ptr, instance, patch, e);
> + 			}
> + 		}
> ++		if (instance.is_null()) {
> ++			patch.add(nlohmann::json::json_pointer{}, default_value_);
> ++		}
> + 	}
> +
> + protected:
> +@@ -1134,6 +1137,11 @@ public:
> + 			propertyNames_ =3D schema::make(attr.value(), root,
> {"propertyNames"}, uris);
> + 			sch.erase(attr);
> + 		}
> ++
> ++		attr =3D sch.find("default");
> ++		if (attr !=3D sch.end()) {
> ++			set_default_value(*attr);
> ++		}
> + 	}
> + };
> +
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-devtools/=
json-
> schema-validator/json-schema-validator/0004-cmake-Use-GNUInstallDirs.patc=
h
> similarity index 60%
> rename from meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0001-cmake-Use-GNUInstallDirs.patch
> rename to meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0004-cmake-Use-GNUInstallDirs.patch
> index 4b1184a394..8199e4f8d4 100644
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r/0001-
> cmake-Use-GNUInstallDirs.patch
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator/0004-cmake-Use-GNUInstallDirs.patch
> @@ -1,4 +1,4 @@
> -From e0b1ad02c678513412aba95a1b2fb4005c3c0452 Mon Sep 17 00:00:00 2001
> +From a42d374aa260caec5f683c75d0db322811e51ab9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 19 Mar 2022 22:40:49 -0700
>  Subject: [PATCH] cmake: Use GNUInstallDirs
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 5 insertions(+), 3 deletions(-)
>=20
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index c4cc218..594dc5f 100644
> +index 9e4587f..3eff234 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -122,11 +122,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
> +@@ -93,11 +93,13 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
>       endif()
>   endif()
>=20
> @@ -32,15 +32,12 @@ index c4cc218..594dc5f 100644
>               RUNTIME DESTINATION bin)
>=20
>       install(FILES src/nlohmann/json-schema.hpp
> -@@ -155,7 +157,7 @@ if(JSON_VALIDATOR_INSTALL)
> -     # Set Up the Project Targets and Config Files for CMake
> +@@ -129,7 +131,7 @@ endif()
>=20
> -     # Set the install path to the cmake config files
> --    set(INSTALL_CMAKE_DIR
> ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME})
> -+    set(INSTALL_CMAKE_DIR
> ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NA
> ME})
> + if(JSON_VALIDATOR_INSTALL)
> +     # Set the install path to the cmake config files (Relative, so inst=
all works
> correctly under Hunter as well)
> +-    set(INSTALL_CMAKE_DIR "lib/cmake/${PROJECT_NAME}")
> ++    set(INSTALL_CMAKE_DIR
> ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
> +     set(INSTALL_CMAKEDIR_ROOT share/cmake)
>=20
> -     # Create the ConfigVersion file
> -     include(CMakePackageConfigHelpers) # write_basic_package_version_fi=
le
> ---
> -2.35.1
> -
> +     # Install Targets
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator_2.1.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-=
schema-
> validator_2.1.0.bb
> deleted file mode 100644
> index 00d26d7b34..0000000000
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator_2.1.0.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY =3D "JSON schema validator for JSON for Modern C++"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc441d022da1b1663c70181a32225d006"
> -
> -SRC_URI =3D "git://github.com/pboettch/json-schema-
> validator;branch=3Dmaster;protocol=3Dhttps \
> -           file://0001-cmake-Use-GNUInstallDirs.patch \
> -          "
> -SRCREV =3D "27fc1d094503623dfe39365ba82581507524545c"
> -
> -S =3D "${WORKDIR}/git"
> -
> -DEPENDS +=3D "nlohmann-json"
> -
> -inherit cmake
> -EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DBUILD_EXAMPLES=3DOFF
> -DBUILD_TESTS=3DOFF"
> -
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-=
schema-
> validator_2.2.0.bb
> new file mode 100644
> index 0000000000..02dcdb2696
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-
> validator_2.2.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "JSON schema validator for JSON for Modern C++"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc441d022da1b1663c70181a32225d006"
> +
> +SRC_URI =3D "git://github.com/pboettch/json-schema-
> validator;branch=3Dmain;protocol=3Dhttps \
> +           file://0001-Set-Json_validator-Install-off-if-it-finds-it-via=
-li.patch \
> +           file://0002-Fix-assumed-signed-char.patch \
> +           file://0003-For-root-value-use-empty-pointer.patch \
> +           file://0004-cmake-Use-GNUInstallDirs.patch \
> +           "
> +
> +SRCREV =3D "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS +=3D "nlohmann-json"
> +
> +inherit cmake
> +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -
> DJSON_VALIDATOR_BUILD_TESTS=3DOFF -
> DJSON_VALIDATOR_BUILD_EXAMPLES=3DOFF"

