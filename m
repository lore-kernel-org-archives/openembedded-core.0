Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50F9E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 12:15:02 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.69])
 by mx.groups.io with SMTP id smtpd.web11.13840.1734092098471192376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 04:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=B5zCSH5I;
 spf=pass (domain: siemens.com, ip: 40.107.241.69, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQC6GX0lK9DPQkUuR+grvfH3BajSje3eiWfMc6iKpO8e6TlrPmLfMJfDc8umSzFP9Lg+Z97g/ckuTgnixsHTLkBOa8zqgm1XYQaowgaDWmwm0YmmB5IBAlTAWYkLOR1ADWZmzw49EEe71f/227NGxFD3mQzBgDifMdtrA9Q0+CnA03ffKht2M5UKcK+hWT7uH2auClam4pDe2IOIhNwLAuV3oKOPAQ2/y+9USc4yoPEeMPOyv6nP6E6C/jCaJbxf8WJhJBQ2k9ztg7zTZ8b8xDqK/PDCmZO0QK05kOzA54F+RhaM6zSCWWW+271KSX3DA+IBubTTEs77FX8tcV+t7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H9ja7NSDwwOo13SEgJ5mQKOqLDi8H6AlmkLQdo3sz4=;
 b=yK0xDcJQGQe6qgDYJZ3w0PUPMMu8uAGpPGqNkUoTZzTYs4MeUhAtIUGne8iPZ1sdYY6qm3S9h1G8si07XGabwwjSrC8ia1NBwHmJm4VFI7jjYZdInfZ7MELj1mzGQk1KM/Ml7P8uJMCXbrWw0RJKJOX9BMVp/JHiqIijsTJeu7kwae907ASTEPvybGIEYMTOoqRVP5qcdsGLnydxI3SY1ZI8K0qely8pKJqIt8w9lIWQKdeohcAElgUvO599NRHYyME26mEMT2fBMAifmV1IMQDglqSKLDwCTWch6YIbs+OF3KUj3jJUhOsRnA/ldJvSNQL5x6MfBKezoGmlc1adcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H9ja7NSDwwOo13SEgJ5mQKOqLDi8H6AlmkLQdo3sz4=;
 b=B5zCSH5Iqnm1CZ5mX/grtu93sgkqfZtZALVdE0FyXhsiz2REnNQd2E1H2Pwj7lXWbUGHzRvHAdZW2VmR9il0kvGOX5yR+NGgxeksLJMRHranTjGl6D3Jo0hnkTNtPSTZ8eeJnRJzy4OL6LPmnS5VRiThZRhcjXCJd8E45ddrSKMzwM20VrzXYBFARtvLmqtjmdv/9RC62dKGwX/sQYaEJ7fCxijZqT674Go6qkGViGk0b9c2ZQWgAsusYiqBf9re/hxy4uzaaHi+yFDQvURa8upxKgvSGHkFDYgwmm+DLrUUq719kkrtyF8y/6S1gej0Zx93ujcwGqFF759bAROUTA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA4PR10MB5588.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:262::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.7; Fri, 13 Dec
 2024 12:14:54 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8272.000; Fri, 13 Dec 2024
 12:14:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] systemd: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] systemd: set CVE_PRODUCT
Thread-Index: AQHbTVc0sJH+j1gvF06YAE6iSnZpybLkFi5w
Date: Fri, 13 Dec 2024 12:14:54 +0000
Message-ID: 
 <AS1PR10MB56970F211E89C972FEE4E2DEFD382@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241213120250.704778-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241213120250.704778-1-mikko.rapeli@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e41c4276-3678-48b1-9fc3-b00907ef3e06;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-13T12:13:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA4PR10MB5588:EE_
x-ms-office365-filtering-correlation-id: 58468e8c-30b6-47e9-5ee8-08dd1b6fc09f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?WODV5efAfvTkE7upJ52idlIGAch8d9KDhGQ4PeeGDkyt0zhSeG5QHrcV6IV9?=
 =?us-ascii?Q?Jy1UzTep6uhv4sI8LtmTILEREFhTLaWRvR+pGo7XCA29qMtWXMo875Ww2DwQ?=
 =?us-ascii?Q?1KsKbxVWfi1uIhuRpkAXsJShIq+iIesrhQkbxhLZDBs01UykRsUgWrDqQ1qG?=
 =?us-ascii?Q?8WiVHfLP7V9CggCjBS9nn6n9QA1BeAU5fIsFiJMn+7RoSpRnuJADdYulQH2V?=
 =?us-ascii?Q?IO2L5wxBC8KbdXXtXbfGEGeB9KOEo2Ht/xgfqRUZnLWN5DWZOriXA+zDqPB+?=
 =?us-ascii?Q?YJkvDy7mi1fFkWSU5LrdEhnQ8DtdtS168LReAp1phXY+uGfIVsojk9p/LNrx?=
 =?us-ascii?Q?0SXome65otC2h9lLRtBafDOSH4T3ksISuiOSK8EvSXPLwZmm9+X+rNv0tsQa?=
 =?us-ascii?Q?FNCl0FtHvo3Z+D7qpikHsxEoSEwTCCuVNFOG1PlOR+zNpTCHM2IR8PGPgRVj?=
 =?us-ascii?Q?H/8Q1gZi5F4DpwvQzPV+NGApKLa7rfXIRnvONjDgoiA8OwE3jPpplrpYPcU3?=
 =?us-ascii?Q?q6N/61XEwTdhQZW6SxqoCh7OiiaOqTxIrzkG/ABQzhvORi1bzgyM2HYrS6R1?=
 =?us-ascii?Q?2O78vFlkL3r28fmfGF3HdcRbWhQnaMSPOj3XVHb8yUX8Y8GT5dAyK9WLJNVL?=
 =?us-ascii?Q?+vdYOtBBrUlzZGrGWpj4amcteD2lMOGlxFRe8Tmrde8cS4kjy6EJPcy87woX?=
 =?us-ascii?Q?YD/fLZKZ1BoDtd9h4VrQJsAsQ39GJeOL4yWYD+5Dxl9T4pqU7Rs0AWpYu/bN?=
 =?us-ascii?Q?MHTXBo+aMUDYVQdfEv/WlT0ZoDnxj5zHZWTQo55hdGOhIBYBSzIcj7kM5WHN?=
 =?us-ascii?Q?tT//oCNW0fpATZV4PnQab1to57s4BIjEHboFGyOF9gaAepWuHaxDNZcvC+bY?=
 =?us-ascii?Q?VCTojMv6N4Irxuo/3SoGSAOuu8GxE22GVPZqY57rAKzWg8eUXKpK7JrshLL+?=
 =?us-ascii?Q?5axf1wn0JjPZTf3LPTULOkYRR8pjveGJKGTnC0h2gw7wIgffz+q2+zD2dWlU?=
 =?us-ascii?Q?LBB1lD6nblJV/TJmznKhNpNvVMEVxcQuEJzPZDtfPkqUi8RFzFo3v1ftApRe?=
 =?us-ascii?Q?usj6UbP162SHhrpj+cIHRSH65mGSVZDDc86E4zDH6XGRuJOunumVe0qoQ4PI?=
 =?us-ascii?Q?xM69nbgVsSlyC1dH+taeAAIosp1c5ktD6rcSvbpSTnUVdTUd/zebJKnT21jI?=
 =?us-ascii?Q?d81elq9lWWsfFfTxvCBoBL5VJEErvs8h7uiuLdYfko3EqeLOpjmsX8WETQ7a?=
 =?us-ascii?Q?cNQ2DldkgxbSHVTWd3c1uc4T6btp4tRZJfE0EF3gQpekddnI7MScMe+nTwcZ?=
 =?us-ascii?Q?RrtS04XOa2/F/7cw+t2X2wZIJqm+FqC1Fc6LmqVtPEtVsI7XJ9HOJyoZxHl8?=
 =?us-ascii?Q?VWMck/QuX4QLeFITmBfpjS6H7Vppu0XqWrLmehXU9c3nCUWnfQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Mh8rlLQxjw1ivhKfw77p+s09jD7RplNOYOq+lRodrO8sYodV+0wCHZtG9zbe?=
 =?us-ascii?Q?C5hIRMa3VuBLMfj8H4PpKdMvl1aKj/zrtJ60hluMQxNUCe/6eMvUM1Rv4hIj?=
 =?us-ascii?Q?+VEzF1tlI7Jx0xw6vgNWQ6u9/tGQW28UtgmYQG+hY92gFnqkYdfAe0slSlkD?=
 =?us-ascii?Q?Ymga2pH8L03Y4akh48pCeskQ9kqeRaFNmw9XXkYvOyXSA3+pVlur3Zg63UL9?=
 =?us-ascii?Q?KhYq7XNuB5RrLx9AiOgMod6ZJlUR+8PVpUgOqICCmxTCr0aA9vRQaoivqEZ/?=
 =?us-ascii?Q?jVVPzOGjRP7jaaNwIV++5RU7DL+cCjGmyNOqNtABX02iVIonjNzxwLdsMeJW?=
 =?us-ascii?Q?6E60xekuz+yXpawWyVqQQ70U2POCWyAZjveh5w6m4Z1tFraX1tO4W9/THFZF?=
 =?us-ascii?Q?I7pxPOyETS4udmhbYuaN7VdxnmHXzxiV8+5j8FEycJN5b7N/Dknbb4Xaulz2?=
 =?us-ascii?Q?UqZgNZHGKbPogr3NzB3yoI0DYWbhtJEXALgxAY1SbI2WwVaijqfQaB94LhX4?=
 =?us-ascii?Q?peqbQ1KhbhPJ3KxoD4jzHpbf8Mig8L5R8uF0EUS6B5kblm8mUvMI1t4uQ6F5?=
 =?us-ascii?Q?tKfZvsFdFSwMjSx3FH4cv+SWfGQlCMV/6R8yH4v94h39RZy5onFCl5KzCmlg?=
 =?us-ascii?Q?rvk8xerJP/1c8wyYUhD2t3JPmyFB9bYzQ4sjNfjy1Cu51VUTJGX8GzGMSdkd?=
 =?us-ascii?Q?Up0TET1xrmGnDL8Rlz0e+ljDdk20zq+vzNNwRoJF9xrcWCBCYQfoms/AT3GY?=
 =?us-ascii?Q?jRdSu8LdhTRGlRcTiB2LjuHrUQSSeJyI1ZIoqt+NCroGSdPf5hmBJRQHqLtr?=
 =?us-ascii?Q?A0E+pDZPw0NDVvRePTLNlQ4ZUUFUxLSg/ocIpzJAfNZAFGGs6QJD/pvc7UC8?=
 =?us-ascii?Q?evxtgpAQwojSNHdHffO29aVAMcwMPIiUYS3AOPQncxG7MeCcNnQK2IEZV92m?=
 =?us-ascii?Q?qn/h3d5WHqpxOB+XidEfJ49+bwCMxs9PXh8TAlvOIgFIYd7WbkjlLnQtIn/3?=
 =?us-ascii?Q?gS8kOiDlB3wIOdL5uJnefOmo0JPQAfF+5Jgzcy1xZfzkf9pTl322xwR03RR+?=
 =?us-ascii?Q?Ad1xs8OcRkisPxiix1T7XPR74dqbpl3ZI11MsEO3McTAVooPY+CvGbXveUYe?=
 =?us-ascii?Q?poMGwAAhDjO8rN1ihv/OtODKD+yYvVujEzGCDhQYEBboF/FGtgwMpsh1e2D6?=
 =?us-ascii?Q?JfukZHyWT+8rdtyk49nTAClYFAWB2nc/jZgNeAI4ZZGpN2JlvrbCI7uD/3i8?=
 =?us-ascii?Q?oUMpSU+h/88aGNllBxtLsw3ZEPPNLTV5kMuELK5t5kEA5Nwj+d+oomfp/y6Y?=
 =?us-ascii?Q?wBcro+7gG0zgR3CRu9n8cdUjrYdOq+ci7hSuTKNQImrpDZP5kXUUiiOCxlzA?=
 =?us-ascii?Q?XV510ydLYmtGoMWnCTLzCqMNnYaGom8AGRE0h1zXsa+X+Oha5gToNLonwoyS?=
 =?us-ascii?Q?UBuRpECibJ6OOTxuel9XHaynEkspMT9wDyS7t1K00dWRG3CQhFNWou9XyleF?=
 =?us-ascii?Q?5gYN0mFdF0LTC6XGcuh+cxVvvX/ksnaCFvOdUeBBOLA2RSGOM3mRhhG8vaYU?=
 =?us-ascii?Q?LNC2HOW3a1mxgeMIkUqy/dadASscxAbKHPhA83SV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58468e8c-30b6-47e9-5ee8-08dd1b6fc09f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 12:14:54.2887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C7RztUoPRUL90GqGj2LC1Vfm40owtXY2TLxnmG9HaXmwkGLvB5zDsBxIqlmlH+ehCOl3UZ8rqD4tA1EmIIDwPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5588
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 12:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208681

For historical reasons, we should not limit the check to systemd_project ve=
ndor.

sqlite> select vendor, product, count(*) from products where product =3D 's=
ystemd' group by vendor, product;
linux|systemd|1
systemd_project|systemd|106
sqlite> select * from products where vendor =3D 'linux' and product =3D 'sy=
stemd';
CVE-2012-1174|linux|systemd|43|=3D||

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mikko Rapeli via
> lists.openembedded.org
> Sent: Friday, December 13, 2024 13:03
> To: openembedded-core@lists.openembedded.org
> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> Subject: [OE-core] [PATCH] systemd: set CVE_PRODUCT
>=20
> systemd.inc is used by systemd, systemd-boot and
> systemd-tools-native recipes so make sure all
> match to "systemd_project:systemd" vendor and product
> in CVE database. The split between systemd, systemd-boot
> and systemd-tools-native is specific to oe-core and
> upstream just refers to systemd.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/recipes-core/systemd/systemd.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-
> core/systemd/systemd.inc
> index 989ca667b7..288d49e007 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -20,3 +20,5 @@ SRCBRANCH =3D "v256-stable"
>  SRC_URI =3D
> "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=3D${SRCBRAN=
C
> H}"
>=20
>  S =3D "${WORKDIR}/git"
> +
> +CVE_PRODUCT =3D "systemd_project:systemd"
> --
> 2.43.0


