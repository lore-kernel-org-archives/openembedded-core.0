Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62D3D2CDE0
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 22:55:10 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57242.1764888902397487813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 14:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=viuoea7g;
 spf=pass (domain: siemens.com, ip: 40.107.162.59, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvDlo/LAgTAUVDOZOMVlDkQ5r9Y7pnAihGocJYn4LFbh0Nd2YsARHJSKDBrVKBmWihjsskv46sLYmTY5okdF0j25v9JfT6Ny8LPXHMNZf92gUdr7Cbn0wFN+K40XCOe+77jjJ+tPPld2G5GuaHOCuttzgBfvXuNXwqP8RYGnTH/1gTUqOYIjlkmVEAroHedmpii4M0BUbULyP7jC3+N16BxdKQH/3jiC8WbyEIiYpWdn3EOuWiMtFTsouJASXV1h+Pq4mYovTjmRj9Y3L+D0RwH8gWHK+Oksk5EjR8XaDkcM3aW/7EazubI1Bmj1sfsLBA+ZgDYtx+TBMAizPnaYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/H5R/B/ai4SmSaXf2BGrClORaQ9RUUofBz8J0SFtv8=;
 b=KUqlwjJRkdl9695nVrsAy3d3LkpBebDooGHS6pZBBVR3q/Q2PBHZA9XcvHB1WHgF3y4VAugaLez4yM+R2GnHyxMDRQNSxm2hRtnY7aoc5CMZo1T3x0uCnsA5ytuDMuuc7KfwfdaD6/xxwS9BM7ts6fjenV6GZmaJnIkj/Cy1cJzgKt+VvWm+Okfo8p9E6ag6u7eRNK0TCOFLBQcPYTyg6pC5JB7oBHyOZuYJ0UCxNqYeOLzEz4ygQavJdxMehDUdKXEo+bKZclqMxnIyUDwM6EInh0aSSkKdQD+wq4+0GYMLwyI/FcVWw/QEUTn9r8lbOqQ6W2Fq6sKWrPZIpZ9HiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/H5R/B/ai4SmSaXf2BGrClORaQ9RUUofBz8J0SFtv8=;
 b=viuoea7gYvQSS4Cr2VrYvQNzZqKQV5xdHPjU0guGcrzjCfw57Q3oReRL0CZmzHeK9HxH05QhMQsGkdbAm7LT5hqZc7ZjJIM7JGsssCa+ORPyw7wcsWpcdAWcFCiBRSLOqKklYk4D2CiXrudqBQgeoNx9Zejbpx3Q8xndjvoY91gCy2ry2kXsFvx5LisTcI1jGz+HaHPDqdny8wqYCn5/OkoVDZLkUpvrmzkdHOEgg72R6p9Vkpwlklf4MWGdDu1ExWWZzDanXnnLaRmeIPyyO0IlitYqBD6a70r2rDLXus4SAQrpfjGoPPqhgmR6K8BUeF2J9Ke132+evZbHKBcQtA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7364.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:460::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 22:54:58 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Thu, 4 Dec 2025
 22:54:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] libpng: upgrade 1.6.50 -> 1.6.51
Thread-Topic: [OE-core][PATCH] libpng: upgrade 1.6.50 -> 1.6.51
Thread-Index: AQHcX8gYIFVWb0gFFEi+UpMwEJ4MNbURwOEAgABhAIA=
Date: Thu, 4 Dec 2025 22:54:57 +0000
Message-ID: 
 <AS1PR10MB56974D27A64E0AADE8ECEB68FDA6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251127180259.3347636-1-peter.marko@siemens.com>
 <7215BEBA-C123-4930-8A4F-A86723B660FB@arm.com>
In-Reply-To: <7215BEBA-C123-4930-8A4F-A86723B660FB@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5b726396-bf16-4508-a0f9-9721d2d6e96f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-04T22:52:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7364:EE_
x-ms-office365-filtering-correlation-id: c5b053bf-5b60-4e7e-5807-08de338825fe
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?54dLKBtEauESU2Ghj73Sg267u0+IgSrTWfSLsP0Ew0kyN/swu26uHrZhkmEg?=
 =?us-ascii?Q?B/0bW1nKOyqKh/njNfybQLLEvnM58Hgd627Fre0v3PaKjQNiXCYilDeMhMSR?=
 =?us-ascii?Q?5EAcz9HxVnbPS2kdREt/EP5Dt3hsP61qpnAjVV0/wdgbOGtaW1fANpjNAdve?=
 =?us-ascii?Q?AigkdCNrwTGoucJpqYa1WtaCcshHCuFMzwVB9edexkIInyD2YwOF2Uh0c1iq?=
 =?us-ascii?Q?l0QwTiX1wcFIQ2OROywmlkG5dBaEjIGZdOYTUVhlwgTnRo6IUuWwp7acExSG?=
 =?us-ascii?Q?lFV6cXbeXOe7li2tfphI64CRUYYgQgAMNS2FPXQATUX1JO/06ozkIVt3t1JN?=
 =?us-ascii?Q?SElAuTmr48LwvUFWeSkrcSdl6G5E8W1GkEmwRNPVc2UrimcY6okCx5sVZfSw?=
 =?us-ascii?Q?+y7ZhKLeLvfk5DGvp7CQ5NhC8N2A08K1byQB0eX68HdUdLa4QfOBwHry+hwH?=
 =?us-ascii?Q?xkxy953ck5w0HDLaqIlgre96DfWwW3HQ2YZ8xXluaaS1kpO4nIrmI2MGDqGa?=
 =?us-ascii?Q?hfDjVp0vSKaG3khbldn2OnY7XbmWdkbxAnDnZrUuVj8h98JQk6AJc6auwMng?=
 =?us-ascii?Q?E3sJJxnF1jeU2mHfOcpp2heJoXKVlTAdlxo1BOmuhxtRux6JoY8h38VQ7lP7?=
 =?us-ascii?Q?3PiY+Ca7Z8ADln+AxQ1tdmm1P+G2cqUyX94GqnEYrmHEM1IJ/D878SmiJH5U?=
 =?us-ascii?Q?T6f4l7Kde3SYr9of5jw0xJPJ7y5ZaoPKKR5OtmgkrVwOhPNwrfTvZqYQZVhd?=
 =?us-ascii?Q?90CTKNz1FPyylmTVivrovOK4rYZ7+R6ItviBoEM0MuVgFrj1W3VQoIp9Ae+I?=
 =?us-ascii?Q?jo8JWfB8y6E/auH2Mj5F4EaAr9r/WJ5iBktqVfpVSwwdVFPq9Kty7V/yRdw7?=
 =?us-ascii?Q?Ip/YsRCjQiiLB8lT92xyFh6BnXWCGUt+8Z6Qf6i4JmgF+deDffhnixdF+gT7?=
 =?us-ascii?Q?N2SJlPFSeBPqzrh+0qjNH64iL6bf24q+8vwj8r9pAx8iJQttDSnKvwTO3x7w?=
 =?us-ascii?Q?LayQQ2IIFdJZD8MlaLd/U0gafPOpmHgq3JvzCEDLWFVDriA4+NBaNFwToFdI?=
 =?us-ascii?Q?+2+TEpyhQqSd1BVpCDtLkujD7d+B+S7fz1JVza61gE0LKExtDhClzzC6AlSx?=
 =?us-ascii?Q?PxWBekU33jLAiQnicrtj0ImtT+3cQJ/otBoJndL67rHEcetj4KlHpOGPJFLr?=
 =?us-ascii?Q?9Zy/vK1FrEbExZKodrQEWPkiJmeT3tNHkJeyP38cFSZGOug2CMD7TPWcrjmN?=
 =?us-ascii?Q?7cPh6wwh7tGPyJ78BketAIpVD3dvti8h6Mex40q0B12kC/89VOl+9LNyonaK?=
 =?us-ascii?Q?54Ae7nrqjvggQpQybQX4Gm98JvuuB9J/E2FN9YqntBDEkW02NFtVxTEzEnZF?=
 =?us-ascii?Q?IABoiPs0qFqVeBHjIWezsmE63eCaa/2+zNQHR9uUFf70TG8UeZdHHyncwoDi?=
 =?us-ascii?Q?V8TK2I8t5uJPQ5s26tpQSJMld8TWjaNlxIpZycDBo8y1vuR/3rgdAw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fk3VwK9rA1nhlgt1bFNjKeugr867Cac7wOLYNKWAjCNb2Um3oCSNbwp6vxjk?=
 =?us-ascii?Q?HTTj3yttxrv3mlz29A3pNW9+RZ1ak0BljiHMyTIcq4iQo97Lw3lWSjBVuV20?=
 =?us-ascii?Q?/cfGRBMgahGFHVxcI8Tf211RmutDyC740G7DX66Wk+ycyXFuTlm9azbfLXE3?=
 =?us-ascii?Q?wO+lrk8s4b5BPh1I00iHTRpN98Rm+ubvDh77l3dq9HlHIOJwei2eJkV0jgHx?=
 =?us-ascii?Q?Bghfc7RZaNvKZxvqZ4M+FyS5ykSmFdkXX5VgaG6nUmUBsTu9yqO3w2MKytMS?=
 =?us-ascii?Q?9sH2koYQ1f2x2qW5KO6vbb41cOkjPrwQq8w2z8UQ31oJQMnkCLW+KwxV5P1v?=
 =?us-ascii?Q?9hjchrYWhr75PugxraGf0VeJp0VpDUYWF624tGFkVWVbf5Q/HA46C2Z7b/7m?=
 =?us-ascii?Q?TYtgkvvUwQ5xjziWjn6G0T87ureb4+uF7UTkUBoiAZZjfNqET4Cj9v+CnGk8?=
 =?us-ascii?Q?rJwapN6onHmoJ+PK6uYnUIapG37io+U8bMHN3MTlDLkGjCTA+YEg/5PmoPmz?=
 =?us-ascii?Q?mT71lECRMZRx1vvGhdb90aiwsYV1prk04UcBd4ieVDWLsVtHey6PmDq0ySKn?=
 =?us-ascii?Q?oTS6WsWdetyJTW8coydm/HozhfOpw6GfobqLcOy3z60SeSVViYYx2U5Rg+8U?=
 =?us-ascii?Q?rfMXG1CjTVVDVoNvXQ0p9IFSsOUxEc7hQD5s6wnBkww0nerQkc9Ok5SnaCSm?=
 =?us-ascii?Q?vfrTchQiFQjSwDroMy6IdnrAqQRcEr1DtuVn8lDITkF4JJVx7RJfcjBIPkX9?=
 =?us-ascii?Q?iSapwXxQoxVkYFiPat+nnjuoaMHe4iuqNtF1ecCYR/IYeFA6w4G8mOFGk/Jv?=
 =?us-ascii?Q?CUQ6u8vyfyeWAhwa3RTqIMSJ/f2Ipg5b7Ml9Qy/irwCYWjJ8zcAb73WHe1rH?=
 =?us-ascii?Q?MFSfOwOVIknWrmnFPgo5srlgd1SxLqDFag7pyO3qVWrYqzfWlw+ok40OfN5P?=
 =?us-ascii?Q?0CKRcwEIzuYZkzI+Q+BmKmYlgKbyC8Xj0LB8nn+Q8OD2HVhRypLX6890LOfU?=
 =?us-ascii?Q?nWq/BKCWFOpwSPs2/ZkNz8pIuz8e4J39yPsEmGmlBJxSwb2UlTFahZV2Bd7Y?=
 =?us-ascii?Q?pPj5EbcrEkR6T3RscPWvAs43tDWkcbSEMOpQCnmsiqcZMXsEgOZ/JaeaXPGw?=
 =?us-ascii?Q?0Ll21EfEJ4L/EFZK9S6f6RNXc3UvkU/nar9k9VOfGx4SUYU8W+KVN4+k4muD?=
 =?us-ascii?Q?+J1dIJ4oH3pe3nOTv+D+tMJMGWexPLyrBGtCfdjtPLTBAQujGZbTNSkyBvXY?=
 =?us-ascii?Q?gFhuPoHFtALY/yKk8oz19xWhduqcUvTlOmG/3A7+lTNP6bKPhacHkYNzz49T?=
 =?us-ascii?Q?d/bKTk9/mGJnkbN4EwUgehCwTEa/53tEwU0MtuCsdlWk2pZ6hJHd5pUqAt1J?=
 =?us-ascii?Q?9lM/tUJY5BmlLYvbqrgrhUPTUyF1d5o+U7gUeDvPLEE8gXmTjUo+Z6GzkmCz?=
 =?us-ascii?Q?0z1bRzvRnA9ObIKQCW1XvLy2RnmZ8kM8aKdbg8d/flWvmrKJ4kWrGycgiNPs?=
 =?us-ascii?Q?4RSgkE7a81c45wQNQ0ZaVlfKr6tRCON1XeytcTTR9h8xD0mMB8e6toAa7BtP?=
 =?us-ascii?Q?1j7IFaP61KnIeyHZgOJdfz7gApfiIjTVKSmYipf3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b053bf-5b60-4e7e-5807-08de338825fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 22:54:57.9068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +i8+E3tTi1Wn1R5eQ7WcNEGJzj/2rIqsg8v7y8psPQh7mtDTAm7aVdNoc4XsYym7qJAXU8QqesFKPeshYdYYmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7364
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 22:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227325

Hmmm... Did I forget to put it to commit message? Well, OK.
Basically, the original URL was not valid for new release, so I put it to m=
irrors and added new working one.
I'll check download urls again and send v2 with updated commit message and =
or url changes.

Peter

> -----Original Message-----
> From: Ross Burton <Ross.Burton@arm.com>
> Sent: Thursday, December 4, 2025 18:06
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] libpng: upgrade 1.6.50 -> 1.6.51
>=20
> Hi Peter,
>=20
> The URLs all change, can you explain what happened?
>=20
> Cheers,
> Ross
>=20
> > On 27 Nov 2025, at 18:02, Peter Marko via lists.openembedded.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Handles CVE-2025-64505, CVE-2025-64506, CVE-2025-64720 and CVE-2025-
> 65018
> >
> > Relase notes [1]:
> > Version 1.6.51 [November 21, 2025]
> >  Fixed CVE-2025-64505 (moderate severity):
> >    Heap buffer overflow in `png_do_quantize` via malformed palette inde=
x.
> >    (Reported by Samsung; analyzed by Fabio Gritti.)
> >  Fixed CVE-2025-64506 (moderate severity):
> >    Heap buffer over-read in `png_write_image_8bit` with 8-bit input and
> >    `convert_to_8bit` enabled.
> >    (Reported by Samsung and <weijinjinnihao@users.noreply.github.com>;
> >    analyzed by Fabio Gritti.)
> >  Fixed CVE-2025-64720 (high severity):
> >    Buffer overflow in `png_image_read_composite` via incorrect palette
> >    premultiplication.
> >    (Reported by Samsung; analyzed by John Bowler.)
> >  Fixed CVE-2025-65018 (high severity):
> >    Heap buffer overflow in `png_combine_row` triggered via
> >    `png_image_finish_read`.
> >    (Reported by <yosiimich@users.noreply.github.com>.)
> >  Fixed a memory leak in `png_set_quantize`.
> >    (Reported by Samsung; analyzed by Fabio Gritti.)
> >  Removed the experimental and incomplete ERROR_NUMBERS code.
> >    (Contributed by Tobias Stoeckmann.)
> >  Improved the RISC-V vector extension support; required RVV 1.0 or newe=
r.
> >    (Contributed by Filip Wasil.)
> >  Added GitHub Actions workflows for automated testing.
> >  Performed various refactorings and cleanups.
> >
> > [1] https://github.com/pnggroup/libpng/blob/v1.6.51/CHANGES#L6281C1-
> L6305C47
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> > .../libpng/{libpng_1.6.50.bb =3D> libpng_1.6.51.bb}           | 6 +++--=
-
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb =3D> libpng_1.6=
.51.bb}
> (89%)
> >
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb b/meta/rec=
ipes-
> multimedia/libpng/libpng_1.6.51.bb
> > similarity index 89%
> > rename from meta/recipes-multimedia/libpng/libpng_1.6.50.bb
> > rename to meta/recipes-multimedia/libpng/libpng_1.6.51.bb
> > index aa2dc99f10..8cfb914917 100644
> > --- a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
> > @@ -10,13 +10,13 @@ DEPENDS =3D "zlib"
> >
> > LIBV =3D "16"
> >
> > -SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
> > +SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
> >            file://run-ptest \
> > "
> >
> > -SRC_URI[sha256sum] =3D
> "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
> > +SRC_URI[sha256sum] =3D
> "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
> >
> > -MIRRORS +=3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/
> ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
> > +MIRRORS +=3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/
> ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/
> ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
> >
> > UPSTREAM_CHECK_URI =3D "http://libpng.org/pub/png/libpng.html"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#226855): https://lists.openembedded.org/g/openembed=
ded-
> core/message/226855
> > Mute This Topic: https://lists.openembedded.org/mt/116504477/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


