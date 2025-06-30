Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C740CC8302B
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 15:17:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.19])
 by mx.groups.io with SMTP id smtpd.web11.43317.1751296627948888466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 08:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=AKengMjh;
 spf=pass (domain: siemens.com, ip: 52.101.66.19, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1KvF+4F53SFCPCAl9VxLmd/VQrDmmzPhPTSZrM62AYwF6BjesfIHiA3q82pnfEQfFw1oHK22rvhoVBAF3qvV3qguW3FVUWzpbq7ih4sscPlQ32M4G4yrP8bKXT3S/RRgS74ocbuaZ68D2pcHhXnwBu8evlRQ2kTxcLYh22X9VYYzvVdBP5sJie56iICtdG+aso4wx/yJeSTvX4Umgovwtn+0h+0/wsCsKtYBLJGJaknVIZJObiJCR37FAKRvk1nvPd3jmZwcoYPO1jCrtU2ugfCeNJveA5ONINTFavCXayEXZvshAJkTGsJVbQyo2d4qBjbG9XnRP8rrNQ7KlUt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aafibJSL/aYUtaG9kgzTVOnEEt6PU+1qD25IhtYU3Cg=;
 b=Ig0IjEHBNYAUqHvDeMVAZMJHTcUQfGRg2f2enbqngkpavVnkf3vY96RWR4DN0es7OUGgKTIYK3omK7l/sfeo7lP1v17vZjdf3PKD2OqcwC+d594JApOUNk2dmSuExW2XIcxIwRcn5o21P0CmCjtDmZoYhwJABj1HZgQF+F7cRlFxPk5BqW4Evbm6GnOFGjXzxgJiyJzj9ZZzt7r3ToH1HWadk3cKmRkemRyahPr3d+hb/BqI4Kg9O5fF+f1di27xaxnufT7Q4U6YKXKmNDpy4n1JU4FDls8Ra5zH/UaWlv3v3024Bl9jEdId1VNcopU0+PEO+835CFCxAsHIqGIEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aafibJSL/aYUtaG9kgzTVOnEEt6PU+1qD25IhtYU3Cg=;
 b=AKengMjhl1f4dS/0ZWRf2K9ej/wUAWO6zfVwzcVf4x93RTMU4AySA+Hus565tgVfIUf5q22r0wymIlomA9cmKnMmXOU0YPI8NoXoPhLAL0yO3HonkOlSNWaANuXhVD76s5imuZeGkHJEiFyfUlxhPbScCnnC0IMArgk1Di4P9sZzlWwJSO+BmKWOcBclSCG8zM+MPRuBadnZTKYn/oZmx9UZkvUBtJyi1ledlkV4Jz+06dyHlLXQJerx47/dmpdPoXvye0LkqEmY2y80yFi5ns62D0uchFbGPukKSrGbWvLXW61KZLbpI2/5xdU5IF3qY2HFOfqctAev8M9SoT5//g==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by DUZPR10MB8127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 15:17:05 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%7]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 15:17:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "vgiraud.opensource@witekio.com" <vgiraud.opensource@witekio.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Bruno Vernay <bruno.vernay@se.com>
Subject: RE: [OE-core] [scarthgap][PATCH] busybox: fix CVE-2022-48174
Thread-Topic: [OE-core] [scarthgap][PATCH] busybox: fix CVE-2022-48174
Thread-Index: AQHb6c5n4a8Y/wpaT0GeHKMPj/2I2LQbz8ww
Date: Mon, 30 Jun 2025 15:17:04 +0000
Message-ID: 
 <PA4PR10MB5707816D6D6EEC5804B870EEFD46A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20250630145027.2540389-1-vgiraud.opensource@witekio.com>
In-Reply-To: <20250630145027.2540389-1-vgiraud.opensource@witekio.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ace666af-3390-453a-8572-abe2ef9097b0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-06-30T15:14:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|DUZPR10MB8127:EE_
x-ms-office365-filtering-correlation-id: 503d83ee-70f3-4ec2-d4f7-08ddb7e92be9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?U8J2cWyyXvWRSQBWkCHdRbmK8XIR/51UaNkSSthwHtv2SgevT/s4rrcBcot9?=
 =?us-ascii?Q?pBa9MiRQ9iPBYvAYFJ8E/aAFgRjmYk7HB6p093tHTTNIsQzQhPbUotIgBoB4?=
 =?us-ascii?Q?wrO+0moNYU9EA7s0KBSkHDW+vr4NK4l0DCkvsLSH6f/DF2hZRqzWhYrf7tRE?=
 =?us-ascii?Q?OMJVzHDslPAbBCzAx+xendkCNX6ZPZ7LQCfe5TXTrz+qM8VxOw9/6RMBj3Rs?=
 =?us-ascii?Q?0mb8FIoaSM4gWmcQ8+kmTfNI7JtUueraz1tKKPUCnyDK5bnpYKHmdCYRnjzX?=
 =?us-ascii?Q?4XR2vL1gMxyGp88FoJHyfCKLx2L6l22KvdgrauNo7OpTc7nS6G5irbg/jKyX?=
 =?us-ascii?Q?hdx8QOk3FFc0dI2tPGFiG2o/OiISY6pqNSUnasUaw3J3ELy/Xg7m/R+sMhw1?=
 =?us-ascii?Q?pHJayQF7Wnr84PbvdLAebEQzHtNxE3cZIRz4gAQ4fT0dcseu6zAg5s0c7oOn?=
 =?us-ascii?Q?RJZ8eDBQVFjeqqIk2dtAL7m4KLBLmgnkMJJE9R1N3pfGqSmuzJ15D+Vuv/VK?=
 =?us-ascii?Q?SUNy1dW5ZfGaH+e9wEOgj7rQ92N/LjOUKQ6oUkH/Q0M2vBHgShZE41HE9UrM?=
 =?us-ascii?Q?/L+Sb8gClXUyGDWNcfdXJI6en38O/GM2JXCIjcANHiH7x3DB7j6iGX+b4Opu?=
 =?us-ascii?Q?grl5pgJIdIRrgXAlEF3mPWUQNLsu3M2bNrcktj4jvhHxiSxWQknAtOnzxCV0?=
 =?us-ascii?Q?hQAJblrF5wfvknd4WqLyKVL+L9EBGgAtUuhEqoa8zwHjTVgiue/OTGIBivFq?=
 =?us-ascii?Q?MUNn/ZsSK6Podm1gq4iBLh9yjcYZfg3DTPuUbXMe5Y0bWPLQsGdv6Q+pPyUg?=
 =?us-ascii?Q?kUtq/9Zs9eKlAYUkkX0ZRZ9KZZZdQCFuJDaZFcumzARajSYyMjNHqrhHAO/N?=
 =?us-ascii?Q?G7uXxwWUDv4kFg7FbM5H9+3srhFp3w9K9McVUYKUya6yR215tzm4h5mbYpRQ?=
 =?us-ascii?Q?Fi1174PppR/fz6Bb7Jtnc2hR+AYtFAKKLHLRe9xd+zpJvd+4bCrnMjNABNGF?=
 =?us-ascii?Q?BdJHjpyOekHD0NbPIHR+sgsiiLyULixsDG0Z1jabErCLyFYF02cvk4RXndGX?=
 =?us-ascii?Q?AW5SdPj7fteyowsSfRVPxxeAXB8gd5owYVbLUsNExxs6Ylv3W0+ArdPodiEF?=
 =?us-ascii?Q?kTgyaw8IzPYX42vfRfBdzU3omGMKbz8A1WCxVxe3utyKHbC1dIOfwHhzUc+4?=
 =?us-ascii?Q?OtfZ5dlnCNntt9uKWQlGMNxlRGhfkqCUrf46rg3EVnSwFe+HYOFfB0KfXn9+?=
 =?us-ascii?Q?3hsKQ0QDJW1aqkLGn1K6+XmBo7kqwHo40JF/U1luu/cUhhb4s9tX0zyuHa8F?=
 =?us-ascii?Q?PTZ/XbRKVeg2FLR6vO2X33qwDIFbaII9BpxoWEY3kBc/BHn4MPa/DbfLJjij?=
 =?us-ascii?Q?TSRSEalkfQjSdOlgiK4vITvXy1OwdrTFEudpZTWFbL4CpRxBA+CG8583Xv6s?=
 =?us-ascii?Q?BTK11km68WSoL0z1qsmaeXxufaWy4NyCUpgrh+CFbqSW+bXUKzwnOKOWX9tx?=
 =?us-ascii?Q?9Vy2HymP/JIPJ7VwuzAVstPtWjOxkNHlytkFarzLOJNDJ5/kSkb+5zTXmygF?=
 =?us-ascii?Q?tVe0CzrrFDmzTyZ2Pui1a3TcVVUR3IEIvMJmYlgArMNffLQLPjRPM+LPJOR5?=
 =?us-ascii?Q?51yI6MgkfoQ/nSSGHmxxNrf30XLm4z5an64w1qRRvbc1aZW3A9+24C0N80uO?=
 =?us-ascii?Q?g4WY+8HQ0D/668sIolWvXwVi6V0stMv1R7//HnQFo5w/KH9G?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2rLnBm4UMK6+CzoY+DcFrG3W1NPB5wkMCsfXkgRUcV/+Dhs4/1ZkrJxEWBXl?=
 =?us-ascii?Q?vx59mpYBVYgsUvoQsDDluQCCYMc2qbalVtDCGSccdLKTgLE1kmIzVc32+h4i?=
 =?us-ascii?Q?jwuxAH9KogNZ5BDEkYcL6VDmzZMVqESSEE0hSos9aT64WwbD/I1jVFkRlLJ7?=
 =?us-ascii?Q?TyF70sidpc2DDfWrcFxrit1xHIB49eKddiaYkfuo6Cxn3nIA4TQUyK8cg81H?=
 =?us-ascii?Q?ktyiDwmNH3SHWRibQTlmEdkALx7AdGwwvuelhcuIAfOdJcTQOFcJe6cRzBaC?=
 =?us-ascii?Q?af8dEdm9uEKwi9THyy2yTmidZe68T0JmNz8DGrcDdFxhApGlbUidrVlQqlJh?=
 =?us-ascii?Q?ofdxty/wcZrzX9spsgDA4RFeQNC7+N9q++KwjlKpXW3CLPsZXYR8GO6oMTtQ?=
 =?us-ascii?Q?E1VvNfKqo4CNSC6IoztfWj9wQHfDtUaQI4q911vkYVST6nXKh1LvJaJNDmv9?=
 =?us-ascii?Q?71/tAQdDY9GE0zJJ+boLeSG6gNPHQYWX9mnHNMQw9QdVXDWFoz5EMNzDzqW9?=
 =?us-ascii?Q?/+QviBBbVe/B4CnorD1uJNp+WSuSvrqTghaDotJ+Tt5qTOLwM8cMNs2a06N/?=
 =?us-ascii?Q?DbXwU+99t5JNpTAgBPtaVr+Pw6NpAHveWnr2iKadcvk4fLFMpyBMKP8Q6PQY?=
 =?us-ascii?Q?Vqezm077jaffLVUPLcgWuKQUs5PurKSALU9ivnDmu68GqmLtwCWoaerq+wiX?=
 =?us-ascii?Q?R6mFRxlM+0grv6gMBeF7uydhJMViozSCy6fLYd4FIrfljRoOt8y55Gvq6+yy?=
 =?us-ascii?Q?0CZo4oNjdu02/QgGbBBpf2oBYl/6XbMlh9S+3qEP3oX/82zbaYCP9qpZWON8?=
 =?us-ascii?Q?+RwOEQnVLqjERTTbXmGOEL90gmlQS5H0+6VL4YkXq4l1AyjVSzqRLXatkGP7?=
 =?us-ascii?Q?3MVHV0oM58s7LEWBjWgdTT2wYUltM947Iq9SuD0Jk29G2d8kWB4QLsssvT9B?=
 =?us-ascii?Q?8sGH/ggpj6DyPhKYcJ8LySeh5zQFNmv4n8INU9A2Z6bSicBHl8vJfQ0ZBlrp?=
 =?us-ascii?Q?AhWXuXpwgPKdV/9pEkV7muogW02C44/YuyDiPAr673KtHaJhfj0Fo8DobJK6?=
 =?us-ascii?Q?jzMI21bSdmMWS8qTEKHreQxjHOCsq3d2zYioXJRQRtuecKujV+jRloMjkogC?=
 =?us-ascii?Q?x6qw2VzJj/+5yb0L9dXTVCjyBHlBSeE2wRh7xBiJYfL8aZVp3d9l24ZW3g58?=
 =?us-ascii?Q?rMGZvTKnugGyoShUE23g1wWg623NKaCchmdAQcWhc5xY/2YjxJIxRSrnueql?=
 =?us-ascii?Q?AUNcfR7UCgb859GjHnfWDi4VkqjEPdMPW8I3AUf6oCbZ5/I0bEEJjAvX+FWR?=
 =?us-ascii?Q?4AuCVmswQbsXwqzb7vINoyYeJJ2EbXzxRUg84NcZ6dsKPTthO/pJrNeAW15Z?=
 =?us-ascii?Q?AbdZMp+AmWrEifpXEGOy1Ph5Mj4EditHPdRy/3E7kfGU2NN3QqCx9YK6Itfk?=
 =?us-ascii?Q?FYGCsFnmnWJ5+piOzD+c9xIjc9xl6JcDi5Vq+3uHcCONHQqGVhWIKackJD+w?=
 =?us-ascii?Q?fJJRNBC5QSTCHTg9xhy9TwCKNOLHF3LwNh/eVeVW16cCi4da8wbdAX8Pl5Yd?=
 =?us-ascii?Q?UXQVRQT2XwFRHiiLwq67Y+6GSlLpVleizQMfNRl0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 503d83ee-70f3-4ec2-d4f7-08ddb7e92be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 15:17:04.8241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVuGKNXvaSkW8M4yBm0OOFriftJJyYjqj8bCTfEtaJQswdThqlaKj3z6F6LY8E4XkhkuWIbBNZDnAuvXzLa3cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 15:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219527



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Victor Giraud via
> lists.openembedded.org
> Sent: Monday, June 30, 2025 16:50
> To: openembedded-core@lists.openembedded.org
> Cc: Victor Giraud <vgiraud.opensource@witekio.com>; Bruno Vernay
> <bruno.vernay@se.com>
> Subject: [OE-core] [scarthgap][PATCH] busybox: fix CVE-2022-48174
>=20
> From: Victor Giraud <vgiraud.opensource@witekio.com>
>=20
> shell: avoid segfault on ${0::0/0~09J}. Closes 15216
> CVE: CVE-2022-48174
>=20
> Upstream-Status: Backport
> [https://git.launchpad.net/ubuntu/+source/busybox/commit/?id=3Dca2afcbf42=
017d998
> ce3d6726f5ff5072a3fa853]
>=20
> Signed-off-by: Victor Giraud <vgiraud.opensource@witekio.com>
> Signed-off-by: Bruno Vernay <bruno.vernay@se.com>
> ---
>  .../busybox/busybox/CVE-2022-48174.patch      | 80 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patc=
h
>=20
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
> b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
> new file mode 100644
> index 0000000000..01d3213281
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
> @@ -0,0 +1,80 @@
> +From ca2afcbf42017d998ce3d6726f5ff5072a3fa853 Mon Sep 17 00:00:00 2001
> +From: Octavio Galland <octavio.galland@canonical.com>
> +Date: Tue, 13 Aug 2024 10:42:58 -0300
> +Subject: shell: avoid segfault on ${0::0/0~09J}. Closes 15216
> +
> +CVE: CVE-2022-48174
> +Upstream-Status: Pending

This should be "Backport" as stated in the commit message.

Peter

> +Signed-off-by: Victor Giraud <vgiraud.opensource@witekio.com>
> +
> +---
> + shell/math.c | 39 +++++++++++++++++++++++++++++++++++----
> + 1 file changed, 35 insertions(+), 4 deletions(-)
> +
> +diff --git a/shell/math.c b/shell/math.c
> +index 76d22c9b..727c2946 100644
> +--- a/shell/math.c
> ++++ b/shell/math.c
> +@@ -577,6 +577,28 @@ static arith_t strto_arith_t(const char *nptr, char
> **endptr)
> + # endif
> + #endif
> +
> ++//TODO: much better estimation than expr_len/2? Such as:
> ++//static unsigned estimate_nums_and_names(const char *expr)
> ++//{
> ++//	unsigned count =3D 0;
> ++//	while (*(expr =3D skip_whitespace(expr)) !=3D '\0') {
> ++//		const char *p;
> ++//		if (isdigit(*expr)) {
> ++//			while (isdigit(*++expr))
> ++//				continue;
> ++//			count++;
> ++//			continue;
> ++//		}
> ++//		p =3D endofname(expr);
> ++//		if (p !=3D expr) {
> ++//			expr =3D p;
> ++//			count++;
> ++//			continue;
> ++//		}
> ++//	}
> ++//	return count;
> ++//}
> ++
> + static arith_t
> + evaluate_string(arith_state_t *math_state, const char *expr)
> + {
> +@@ -584,10 +606,12 @@ evaluate_string(arith_state_t *math_state, const c=
har
> *expr)
> + 	const char *errmsg;
> + 	const char *start_expr =3D expr =3D skip_whitespace(expr);
> + 	unsigned expr_len =3D strlen(expr) + 2;
> +-	/* Stack of integers */
> +-	/* The proof that there can be no more than strlen(startbuf)/2+1
> +-	 * integers in any given correct or incorrect expression
> +-	 * is left as an exercise to the reader. */
> ++	/* Stack of integers/names */
> ++	/* There can be no more than strlen(startbuf)/2+1
> ++	 * integers/names in any given correct or incorrect expression.
> ++	 * (modulo "09v09v09v09v09v" case,
> ++	 * but we have code to detect that early)
> ++	 */
> + 	var_or_num_t *const numstack =3D alloca((expr_len / 2) *
> sizeof(numstack[0]));
> + 	var_or_num_t *numstackptr =3D numstack;
> + 	/* Stack of operator tokens */
> +@@ -652,6 +676,13 @@ evaluate_string(arith_state_t *math_state, const ch=
ar
> *expr)
> + 			numstackptr->var =3D NULL;
> + 			errno =3D 0;
> + 			numstackptr->val =3D strto_arith_t(expr, (char**) &expr);
> ++			/* A number can't be followed by another number, or a
> variable name.
> ++			 * We'd catch this later anyway, but this would require
> numstack[]
> ++			 * to be twice as deep to handle strings where _every_
> char is
> ++			 * a new number or name. Example:
> 09v09v09v09v09v09v09v09v09v
> ++			 */
> ++			if (isalnum(*expr) || *expr =3D=3D '_')
> ++				goto err;
> + //bb_error_msg("val:%lld", numstackptr->val);
> + 			if (errno)
> + 				numstackptr->val =3D 0; /* bash compat */
> +--
> +cgit v1.2.3
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-
> core/busybox/busybox_1.36.1.bb
> index 42dd5f71eb..69e9555766 100644
> --- a/meta/recipes-core/busybox/busybox_1.36.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
> @@ -57,6 +57,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-
> ${PV}.tar.bz2;name=3Dtarball \
>             file://0002-awk-fix-ternary-operator-and-precedence-of.patch =
\
>             file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
>             file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
> +           file://CVE-2022-48174.patch \
>             "
>  SRC_URI:append:libc-musl =3D " file://musl.cfg "
>  # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.ht=
ml
> --
> 2.34.1


