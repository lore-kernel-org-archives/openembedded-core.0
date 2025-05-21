Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BA9C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 11:26:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web10.8787.1747826758865601355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 04:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=R6cYsMIa;
 spf=pass (domain: siemens.com, ip: 40.107.20.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnE+hfqo2f2rv/NHCru8KncsWhjTD0zJDS4OFH0KFK1OdcqrWLyES4FeWKBysZre+I+mSldpewJQ/Lz2etmuDaEQKvT60jMSofjlRwuoFofI3wRRRtoK+gXod3P0geM/5GL8jUCMK7bCdRwx5ykLphVQTgkQyP/SBkRT7FHjsqkgh56rWQ+4POnL+yv3LkGAlJhOpKrcfaITLj5EqXB+iqFLAgUcNU+xqQ4HM3cahB9c0XZfSnMCB+t32RMM+3f+zlMGKQznkc+KatoeAm78bh4Gl73HLFTGkEWvej9EgXdTAJ7g0uh7uC9bea9z0NM0hfm79VNNKYFu1/KdvPwibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSwE9w91Wp6h+HpLsx2NJ3lWdXVu1VszrlQJozeTbrE=;
 b=uukTG0toMA/CiESbTLI226z1mBo9ZKeZqOUQD9GQa4vjNSVidChhtVI+gstsT57YIRjacUf/VmErw4qruF3AFhorDQzfW+PvvG8e1pX2Dsv0yuaorp60jMu8l1r6G2EZvAQCN1Mxyyr4LqafldNJVlxzJ/Y31rWYxVLhWmF79uzpLN3/S1qe4WKjkzQmNbK1sCNgISA7Tmucy9UHFfRzv3IjYaoeTaAuRxW2qjZpuXW6IIjQkKU3PfoWEubVgHp4oOHF2ElV/iZMQN+pwdgl/J6SO3qKjHd8/TCcKqMJhrjagJswspaD3ltS+mzzjrNI37D/69fjeVLF5jjmNcrZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSwE9w91Wp6h+HpLsx2NJ3lWdXVu1VszrlQJozeTbrE=;
 b=R6cYsMIat3bsgieB/VbaFzbku8+DP6fvEVfid/l7dPvl9WnrApZ10yw+qe6m6/2jFB9hbtwHruOHldGJsLZihkr5haBuLEcksu8mPvrLm2ZOUf1VV2xMRqmxbrfGF2DI7BDn/rDIXD/z3+wAJ2aXHs5UnnfUBMxtlXMvnmgwxVyw1Jz0jJu6tPmU3fNQ3NZnhNAqnHyBAQ0Vn9OStWhd08yUr7c2J6NKZaTj1NQu98rskKC8IIILCsnLX7r/22p6zAIwyDcqjzjD0nZLtiGLjPjs2xlNX5IEx5uoIkqXEzT1LITB+XEJprjxFHf//1jyGN+u6Rjj5tcpv8WG2xtR8w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3768.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 11:25:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 11:25:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] Revert "xserver-xorg: mark CVEs fixed in
 21.1.16 as fixed"
Thread-Topic: [OE-core] [PATCH] Revert "xserver-xorg: mark CVEs fixed in
 21.1.16 as fixed"
Thread-Index: AQHbxlMp/0L9bQk/ikm/5733bPxttLPc+CAg
Date: Wed, 21 May 2025 11:25:54 +0000
Message-ID: 
 <AS1PR10MB5697488DFACCBD82D8F571E5FD9EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250516111027.1710115-1-ross.burton@arm.com>
In-Reply-To: <20250516111027.1710115-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=440a69b8-6f31-42ad-9615-433faf4b257d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-21T11:20:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3768:EE_
x-ms-office365-filtering-correlation-id: e02d684d-0925-4f5e-de9d-08dd985a4057
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hZYCC5kBjUfvek8pm6IuVdjz4teSqMjXk9L1NUmxu+y4rB1TVl3aSn84yBps?=
 =?us-ascii?Q?vZ3VBBNZhURaT9OScpRWzoQlLDi7voUVrCXurRheHGNoxVY7Cl86Is3toiDO?=
 =?us-ascii?Q?+nC8w80eEidy/Hpeoa0AYd2Bt0ZkuNC8OiwrJGfevKVfdc1u0EZ310U8Jw/3?=
 =?us-ascii?Q?OAWZfPBaUbjFFxSztzqP2A19/++iEOx7qhXKSIxGmk/OsEqpKNr0FLLwLlf9?=
 =?us-ascii?Q?pL4A0RTf94ExMKtg/OQuw4OFLxKYMjRaKgKhjB0QS5iyTVfLLqZH6awDyglZ?=
 =?us-ascii?Q?1XcgGZgZhp8Mgo6/d2dUF10v2ZKqPwVNTuI8KgvAfHFcY/8lp42TU6xrOdJw?=
 =?us-ascii?Q?p65O6CWROLD+UGmtX6Vcy4axKHITZa7o4P+xL0+ptnbAK5wSbulAT+2fGg+I?=
 =?us-ascii?Q?k8XHiifNInhsX7InklblRh7WxBtx8fOSR+kI/yfNDVei6u9DRDLyvYDB1FdP?=
 =?us-ascii?Q?SaeRR4Q9ffAZobE28CSdo40RbFaYYsUU9U0yVWDl1j+V0UGduuRYJwa4Nc6p?=
 =?us-ascii?Q?wMXui22g1reD8tLTKGrAF1bfpcUmzl7qjQ0qZFhCjgM/e6+OO9wnI81Peroj?=
 =?us-ascii?Q?U2eqsE14o45Hm5G+m33umk6d7Wrhp8KGM9vkUBQ9CBkx4MSUI2cfb+BCELh/?=
 =?us-ascii?Q?Rx+AAGfln/7HPZrtc+kE7fKvxpYSI8I4vlJ0jRb7PJR87dQ3FP8b4m6okP50?=
 =?us-ascii?Q?4BNauKwsQ09utVEh3EliIzmVOXOK+9e0NU2o7YmE99f9MqUFl1kVql5caf7C?=
 =?us-ascii?Q?ciH4k1QFrNgSLAAYiwfuz964IdSBFxZynN7NbKCnWp2trJmM3K6TIzbX9x9v?=
 =?us-ascii?Q?I0UoYn73xxY7tbaBvT3bEc5/j/AO9v7IcOrRURiwSuMDuTwHMFOgFDpAEj+1?=
 =?us-ascii?Q?q6sNzwq/SDpmWNIQt22s+J8fzfvkioSufVsqA4/tTjCzt8UDTHL9RlDSWExB?=
 =?us-ascii?Q?tD+AmWs/Lk/yEznEF+AB2eTZ0xAl6drBwt0Y7MAHeJ++j3ls/a1tPgSAnxD9?=
 =?us-ascii?Q?iepj4IU2AZslKgekqk5bLwYwjACQZKYh1KrnQUdLXGV020GJnYmNQ1yIOshW?=
 =?us-ascii?Q?BRfoL98xnSPqXft5JtsITmOEKmedroyuFwx/MJwkiNrVxai49ob3w/QXWFeh?=
 =?us-ascii?Q?iTRqwol3TdXZWS6DThVy6qLohTM4g3BhpJp4e7qYT9W7Kc7+gr6lAQYHAggO?=
 =?us-ascii?Q?OfMEeC4NezereX0+bpCBDKLQ5OBppfMxVmXqgSXdng9fZWX5QMi+pJWhuvv5?=
 =?us-ascii?Q?rDr1Xp6b9T8REZMf/Fum3bQOmG+tDiNFr3nI2F/UaEvBm/tABuCn66L2A5Tb?=
 =?us-ascii?Q?VRDvEIG06qZSdj55NhEOD+NSRn7glcT5XWQ6SPwj7xFjba4Mr33uIsrBwR6A?=
 =?us-ascii?Q?cG4DL0deqgld8omWYTsjEspX/BkwoLGh49A42caXaAsFhkGNVbeizAnVGAcU?=
 =?us-ascii?Q?7UH3aNaQBB4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KiUGJrDxLCglqXgmUuO85IvGpq8HH/eChVvU/A+txqBurY+yFDZGJzwIcif0?=
 =?us-ascii?Q?gqANmy4ouzYHnDAPFIe/t815xO0Qvg2advvOQ/j4ELCBLqDw8Rni6SM+r+Ei?=
 =?us-ascii?Q?2GyPYJK5RcOkY12BzJB63cXfE8u17k8udcKwTh4JVEmOWu/oRZk8kEovdldQ?=
 =?us-ascii?Q?WtoPbshcDdL38tWFqlrwId5fgqqVXjIFpq/o32KDX+hVxkyGd86LCVSPL6/B?=
 =?us-ascii?Q?eHZepSOSJ1F3ypZIbQJu2Xfxuf3sQIDdvQLMp8p8Bl41ddIbj0yf2jJ6cLJD?=
 =?us-ascii?Q?8hhhgQAmJPKbbUAOim307AT0yXIwSbWjEDG3EdZwWyx7VkaO1QcD90Co13cy?=
 =?us-ascii?Q?ME7A0shr4SNkf/AOcYYf9YoCHc30ciMPWckKwWaDA9nxqq5ixmO3YxQW2m+N?=
 =?us-ascii?Q?kERUFCkk3i/Iqr1bCzs51oYPYn1EVaQVdJ6GmWcFBrFhLlsiwRQA6nkDqTqg?=
 =?us-ascii?Q?HPct8+Xcz4E1al0xGf7ncwsE7BQOwJ445ZJ2qehRXVEt3bbXuyOi7Gtn7D+u?=
 =?us-ascii?Q?zZ+aRZUqo5z2I1up489YUPKGymNV8MzqYMKJ3pq3E0UDRa5ch6KcOVyqlAJ3?=
 =?us-ascii?Q?W/u8Zada3LmllN9DQO8criKSz0xwSfMWzU0C1yEvVuGOWMChm8QHUIkt/YDu?=
 =?us-ascii?Q?Lm/XVfPG/7l8tbIE2SE9O60O3YPs0mZe1ysdWznupwgylIXG3CbVabjY+kg1?=
 =?us-ascii?Q?+nVUiKLQeWh5NSPtCWINvwojZyK5Dch8T2i9sP+2yXS1JFhJzBgbWrTj3RRr?=
 =?us-ascii?Q?uiCOAVfplF+CDaHQzSwDJ57JGo/1KdvuXgr5Vy8/wv6C3qeuOoTDWRKvU0lU?=
 =?us-ascii?Q?Hb8eRKF2f7Zw9rakS1iB5oPKLj7pBYFjfP9o9rX2rB/ejoQomZtmJx8y42li?=
 =?us-ascii?Q?/03FFZS9XBBPihaFqMz45e695pDytPYE2kkTkqVYeHfjR7dH2C1liK3xbGAB?=
 =?us-ascii?Q?iBy2hrjUz70Dqoh1vGRreKdISxTwbSE/6tsZkbP+YjDDu/XfzjNgtAZkQOuy?=
 =?us-ascii?Q?Dzjt9iQPsCKEyqx0LrXlHJ/tBhjywbvENiYemClz3I3tXLvibGrKjgqks6Uu?=
 =?us-ascii?Q?yeBZ85kxKV0GpfisVJwnyemUySMHwaB4NoW+zbzHy9HtJxCXJBWAaQaOy9GU?=
 =?us-ascii?Q?1MCsWKSgk/uB8Bnxzhvjw/R/pNgQup7NKMoNtBKNBh7KnycrUt6Efj98az2q?=
 =?us-ascii?Q?rpoepygV5A/dV3YjN4AiL4hfO5GwtU1I8xGBpYb+DQGcjRee083u7+0xByCb?=
 =?us-ascii?Q?aHAqkuqsemqkDa/fQ9n2DjhFUdSTVxixLz2NOX0JN9qjUYnyNmLthmaRjxGS?=
 =?us-ascii?Q?JPuBFwqrFYvwJu8TbXV/SgWssgLpSym5DTxPjwoywQ5IbJQTjl2wIcisZbto?=
 =?us-ascii?Q?JhzWKjTC07zg4EMFWG2WE/CXEtsIp1NaPl0S7dGoTGcnqRY/qiKara9aWS+N?=
 =?us-ascii?Q?seYhlvMYWADFe4NC2oCelbS4aWepsF2QXp2IB8bI8xW2r6WfPzo2SNuTb3xa?=
 =?us-ascii?Q?dFLBnJ1Zaq7/ExcfvTTA5rxq60Qszgwp2ifxMkuznu2O2+vRxdnlj5t/LYZM?=
 =?us-ascii?Q?gPmtA76W9N16MEuWQBgTLrfKlmxj/sbFChAf2xA7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e02d684d-0925-4f5e-de9d-08dd985a4057
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 11:25:55.0014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6S094MKSHz9pbfvOF35pKowz1Jz/gFszMLB1qZoBCPwdAvCzEb2Leecy+SQvbwKzLCUzzBsVcFHWDai4g4CgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3768
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 11:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217020

Would be great if someone could delete broken cve-check sqlite DBs from aut=
obuilder infrastructure.
It contains stale data from over a month ago and these reverts caused these=
 CVEs to reappear on
https://valkyrie.yocto.io/pub/non-release/patchmetrics/

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton via
> lists.openembedded.org
> Sent: Friday, May 16, 2025 13:10
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] Revert "xserver-xorg: mark CVEs fixed in 21.1.=
16 as
> fixed"
>=20
> The CPE data in the NVD database is now complete, so these overrides are
> no longer needed.
>=20
> This reverts commit e3419fbaf2999a821e1890a12ab27285cc25b577.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-
> graphics/xorg-xserver/xserver-xorg.inc
> index fbe860c6ea2..7645f11c146 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -154,7 +154,3 @@ python add_xorg_abi_depends() {
>  PACKAGEFUNCS =3D+ "add_xorg_abi_provides add_xorg_abi_depends"
>=20
>  CVE_STATUS[CVE-2023-5574] =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'xvfb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
> -
> -CVE_STATUS_GROUPS =3D "CVE_STATUS_REDHAT"
> -CVE_STATUS_REDHAT =3D "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596
> CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-
> 26601"
> -CVE_STATUS_REDHAT[status] =3D "fixed-version: these are tracked as versi=
onless
> redhat CVEs in NVD DB, fixed in 21.1.16"
> --
> 2.43.0


