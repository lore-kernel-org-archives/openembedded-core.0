Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6440CCA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:02:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.18])
 by mx.groups.io with SMTP id smtpd.web10.17275.1756044137256441170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=jZxePzCS;
 spf=pass (domain: siemens.com, ip: 52.101.83.18, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHjepzmaO9liXhM3arYpBsx7FUA7rsw4+ZUHbz8eeMevwV+vMIXU/oPy0u5b9bylYQYpBTfl8arugHI3cCEV6bgTvF+RrysPo6PkgQ6wDenCtzVkUCceinCjTi0cDSxIGbHamMI3Q5aCpIzQSbEIUawhsm8npRm6YEa1e5fgAn4INxrRPAWe4hEu0fSte1H8j1EwUyKD0eNS+XhevnGtAKzZffPL8Jva3+n+99T0FZ04tEdH+yTeKNTnFBxg9jKwyGhcLiKayYFoLnJ9DDcNIV5X5C6njYQt6PxkrnexrI64JY8DYgpLSd1OIWi1Rk2sonzpo86zkD0sTnuUaVdH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQTdtr8V0oXuYdTQsSiHRj9yppWIEAGHtqMqhG3cOrs=;
 b=gRoRxzvRXS6UmLvssn9BuKKjNM8VDu9dHKnzaO2gZPUIgPdZEg9PhKA7O6AwqQ5u+fHQiHjUtB+KaoHQJNkJjOksTPaxA0F5mUbTi8jm/s/1YIVZHlrZLra+rv9NOmdFuEg/NwnUti56H+cf0+It2dsB3/T5dAFuOGvPdXl3mtqeQL8MLzSX4EEqwdOk6UyB8BVQpWg3vHuYH3Q3Ih0lwrfRBOlx4kWnxSpi2CjtxLq05dW2tWE/S5CjN2riWsB8oANMvMLj+VlR7AMIiXkbcAXPNxXz6hAsRF8xt9JCG1ejevKLzTW6JjE32mLkQ+dyA5vgqzdNaJCmdecD/uZPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQTdtr8V0oXuYdTQsSiHRj9yppWIEAGHtqMqhG3cOrs=;
 b=jZxePzCSbnPMIIsBy9fVrZ0P7uIrgeBcwW7ROH59EePYUTUanI/ohHs/1kqyVsiZM1avIYPvev3oncGj8iYHpqokpH/b1cKz1tzorOxmTLu/6eIzrSCnTyY8SQF90e8zr7vhlgzx3gpKqNbS8RsmBBuoqUwCqNi2ev/OPFw3CGxWEaxNrrRuk1GrDQA9fB27wiN6ZmAFFsnk0y7OjP4knBvoKeJjth8fFDY+1kez1w7cVRDo8J4RYlzMP5/YwXXRpkaNL/vO7eQJ2rHutXqsr6iniiZXfz//HdEA1qRWrlLGOxcuD6PvLILNF2orUkA7ulNxan0aQdUP2FUNAyNFzA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8298.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Sun, 24 Aug
 2025 14:02:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Sun, 24 Aug 2025
 14:02:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] go-binary-native: ignore
 CVE-2025-0913
Thread-Topic: [OE-core][kirkstone][PATCH] go-binary-native: ignore
 CVE-2025-0913
Thread-Index: AQHcFPgTWUCahsQWgEG532gfP6PnvLRx1Vzg
Date: Sun, 24 Aug 2025 14:02:14 +0000
Message-ID: 
 <AS1PR10MB56971774C31909C5E8C9C723FD3FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250824130654.1095026-1-peter.marko@siemens.com>
In-Reply-To: <20250824130654.1095026-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f727a143-24c0-4b9f-9e1b-5f9c2a63b2c3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-24T14:01:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8298:EE_
x-ms-office365-filtering-correlation-id: 78b11ca3-511d-4a82-709c-08dde316d408
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?/CM9N/x22GFrFftBDVDL3/4U4ZnsQx4zMPON2wTezXAwRZHJMyn/gfGciK8M?=
 =?us-ascii?Q?XYm9VKZDzfa7ZMsBEOw3lTa8J6dlpiJoOwfka5MDFzRg7vTZ84C6zOuv6JOk?=
 =?us-ascii?Q?zTWab83j/bKFItDXYyc3WXaC9ZUfjry/fUszyCMz/ERDm07WfinnWJkgiY2e?=
 =?us-ascii?Q?vSkWLOhzKeI0zUiH1BfO4ha8o1YpqZyBTv7aTDVTv46Jt+MGLsE66dZLVFFg?=
 =?us-ascii?Q?RwJaxrBBDvf1RqhdiQYY6DKhTfrsTwvqs0vhnq51OzLNgg7yzt8PjMAk1Zm0?=
 =?us-ascii?Q?7m5k/PUk8aqEXEMhywAWO8TQ+qJeiBVo02GEumHmZVFO3w6W/kI0qN/DEwkZ?=
 =?us-ascii?Q?uwIgpRJrw7R2dwQ4Dl+tXrijM046McLuoVfA2/jB7fjYc+vFt4IJ9e0Qk6dV?=
 =?us-ascii?Q?aNizVwU+ARLq4JEX+4a2oyn8xsrl5DTr2v0Mj+g+CtsWoTa3plycnJfQMoZd?=
 =?us-ascii?Q?pr8vT60O0rmd7Ug8VGYwzWrVmAZu5Oa+o9G3Xj8DnW92E09uSag8MqIAhSdD?=
 =?us-ascii?Q?Rr9bg2ZLVNsks4lTWIKHrzkuH6YcAjJ3md5Yg1fvODfNhlqMiWIqogXNe1+I?=
 =?us-ascii?Q?EUjv7W0CXgpWI4AXpaOgPhXQXIv74WzQLRH0XcAKU+67lkywTEb7iu6BHewc?=
 =?us-ascii?Q?oH0y6NLWr6udGVydli4DZJeZNT2JvoTLIIgP1ps650Yv/tAoTCr5rmbJV5r6?=
 =?us-ascii?Q?PEuQzD7MzP64eUVLy1S2sRmtIC+SjS/+bO4RlIIFX21kdazZVpWhSJwzl//l?=
 =?us-ascii?Q?XW49FTsH11Jh7chfNECzeh/PqxvFUTNyketUjir2sLc9XhRHrH4cTVScrq0R?=
 =?us-ascii?Q?GeuLbD/etSd52aU1OuI95+vYNjbuC8hHwNH3x5ma9379P/WpLYcdEV0cWHcs?=
 =?us-ascii?Q?6Cz2WSHoqs5m7yBFkGOMKhVYDA5Icn7MgUvovd3T0BMKJJuF/1e7vEihNH2c?=
 =?us-ascii?Q?HxM0No9O8ACq68V2f6GvM7IIfCfm199u9r0KCtn/Yjli82jlXChhzx8JlpiK?=
 =?us-ascii?Q?My58+9qj5FsgFJHs7gGEocSkGYN5kAdoECHePrIcCFSWq7j1u1LdkiZASueP?=
 =?us-ascii?Q?aAv9ih/6fC5+Eqa38tNHOiYDO4RrCR8BXIf1+1S9PJKzEb4o0Rl9abmfjyWz?=
 =?us-ascii?Q?PNfCMUtPxw8MkRsf/RKSncqCqENXTO3aucXgpos2spuadI17FAyVY7QqzI+5?=
 =?us-ascii?Q?Vk0kfsPxiKXOEHRJ1bXcx8eogNDOVIe288Uk6rl9kf1X3zx484ymbrgPdRdZ?=
 =?us-ascii?Q?szZoB/oq4SEIJf9ojBP24UqSag1ktIX1s8HoeXq2TUlYdBlOknuKklksd+zF?=
 =?us-ascii?Q?3NnuUM4KchZBO8IGGXvgBFRQAQn+/2JzvDp2/iGycHyioPMf0G1HQfwXbMTN?=
 =?us-ascii?Q?oNvvLZk76pYWwOdAywQ7VoZdgUn90WW53VtshcaRFUnyrMML+nXzQvvi8rbJ?=
 =?us-ascii?Q?AQy8muc5jX0HSY7xV3JwLmk+Ph8ia+R80sej1zHGy6ogukhhS9vDXQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1NkPT6G9ckk/XyyLTj2pAtpGKiHPuE9+9UfgHH06WCa403aGDdpnUYxZKIrE?=
 =?us-ascii?Q?UmFhCBanMqanMNPG4Pu4ZnHC3czIsM8u3ygZnyqTtRY/4HEIHPNM884qqshT?=
 =?us-ascii?Q?qSx+XQnN50N74KiXOvqIo0VfcrqZH/rXD7clLEXD/ysR0E/SKfPmKPRRQ9qW?=
 =?us-ascii?Q?C/onKVanTBfjclyCx9jynlxzTfd6grdI15ZVe8rYfxVlhVNY1WcHWG3iCCQX?=
 =?us-ascii?Q?B/FEgXQNS41TDRU0NDPwbGywQtUe/4c4h/mOapqZPsKCHPkwYu8hEDST32R9?=
 =?us-ascii?Q?iIuQAtOK3AZW5IqUyxBVviowpwBTF1FgOBmhVdGZYXvHjP+pWgNztRqbJ35A?=
 =?us-ascii?Q?6R3P4LDXWxKjPFmxtcHCe9D1NcXk6E7dbSnxYm0wvE71k5a5Bwisr+jjhCAv?=
 =?us-ascii?Q?yUMa5m6ES+Bb2Z5RQghcE4WqiGowrKQ6sbnK7W+rxYzQLGf88JLT4jUi0+uf?=
 =?us-ascii?Q?1MS14QyoZknFTWsVZBpEXV8YpsdtMZmQxYP/BJtLVDI1R9OLQhrL3jvi49uT?=
 =?us-ascii?Q?3c25uuhWsB65Yzkvk/AtQvpLUGOG8168lF6r3nwo3RkwM3Fl7GdPWS6eeusg?=
 =?us-ascii?Q?SCx+AnaXSDTu3GdpJmIQFePEkhtKFR/AKoQTJoqJHRaPqWl3h41BmQx6MPLF?=
 =?us-ascii?Q?6Use6uRWNA8shAgH+mARXhdwDLkaUqpdEKmzp1HikbTXB5SMq1Jf09f1O8Xr?=
 =?us-ascii?Q?gVUW9aDfhgccHb8NKc6v4IybnFgZ0+0Xv/OLO3vbU9DBCtgiHY23WbylpQIE?=
 =?us-ascii?Q?6BKHSntpx+WGqMSSXc5MdGYfKH6bZDfKLMX+qIIinYRhsJQI1Xw2WWOSwZtG?=
 =?us-ascii?Q?Q5W7d/78GXUA5N2QVTtSb2fHazc4dhbfSbF76iw6+rUMYXrR46D3Cetn9IXg?=
 =?us-ascii?Q?a3NTwd35BmVS5dlx2Wu0uhrZzCpR0uM11FmS58Cs6ZagOTsyPalYqSIUpsQ/?=
 =?us-ascii?Q?+2zQSGgNsACquUyBhvPUkUQaqsztGd12VOr2SNHM5mfrF9RZcqPgTgxOx4JG?=
 =?us-ascii?Q?Cs5gVaKQ3X2sST/MN3+Tq4ngpfjmZHj/tyDc7U+1MfBhjHNjUp35wO3nJYME?=
 =?us-ascii?Q?7MYrCsmx1RcP/cdJfqdn0VeExzWYN7l5oyLiOi8VLZSu/iUJgfw2j6rHT9c5?=
 =?us-ascii?Q?ocK6KyYYgReduLSjoK04zp3TJimtF1Z8ItTXOMhzLmrPqmCTA3skm51GT5lC?=
 =?us-ascii?Q?IrN6S54ccSRyUvjp1yhlRHUnVP3R/5A2x5+apV7r0ikt0C01S4wE5J3xUCVT?=
 =?us-ascii?Q?g6D6IZDUEHuqSGfjFJDVEs9BxQSOZ55/zRTFvV5qNCa2ASi60C7rEk9oGfYi?=
 =?us-ascii?Q?kyrWo9YvB0atTM9SKzvPLrsr6wSb/43s9s8CcIiHqAMU2SBwTWAjQz7p+qo8?=
 =?us-ascii?Q?jEQ8JcVEm/k5gSG4C4/oVQrZ99pD6osHO8OQQEQNmRtJbfgqU4Za1fxiXX+7?=
 =?us-ascii?Q?7wu2YVO3IFne1uDxMkrr7OXg7CbuvYX/5ropd+RgirnaVNN60RTVCzibaEkQ?=
 =?us-ascii?Q?UpvB5Vbe4ifpBpzkpAs24RDo7yP/omf/E95srWvz+2Dim0Qqm8QflLRhOLCy?=
 =?us-ascii?Q?E/xtZ+Oiw2XLhkP4LaKzyebrXuc6CyHszWh3fJmb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b11ca3-511d-4a82-709c-08dde316d408
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 14:02:14.2494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37Jf6BoKgv7x+HfEvDNyE2fJrMsdBBYJ7Mx7T3X8gZWN8O0wKLoiqmb9FiGrq3yXB1MkqG/LlNz7XFtwetUF8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222376

Please ignore this, it should have been for scarthgap, not kirkstone.

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, August 24, 2025 15:07
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][kirkstone][PATCH] go-binary-native: ignore CVE-2025-09=
13
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> This was already done for all other go recipes.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/=
recipes-
> devtools/go/go-binary-native_1.22.12.bb
> index b15b60a691..7688a090f4 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
> @@ -18,6 +18,7 @@ UPSTREAM_CHECK_REGEX =3D
> "go(?P<pver>\d+(\.\d+)+)\.linux"
>=20
>  CVE_PRODUCT =3D "golang:go"
>  CVE_STATUS[CVE-2024-3566] =3D "not-applicable-platform: Issue only appli=
es on
> Windows"
> +CVE_STATUS[CVE-2025-0913] =3D "not-applicable-platform: Issue only appli=
es on
> Windows"
>=20
>  S =3D "${WORKDIR}/go"
>=20

