Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDBFD0E6DF
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 13:05:59 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16603.1764075957377397035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 05:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=XzNAsdrN;
 dkim=pass header.i=@bmwgroup.onmicrosoft.com header.s=selector2-bmwgroup-onmicrosoft-com header.b=cgLmq0Ou;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=417ea8bb2=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764075957; x=1795611957;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vwMryRi62HEZwPGTdvwCQFKs2wsaY6O8ZP59crlNcK0=;
  b=XzNAsdrNJlpXv/FNP+vSP7zYgI8yDCKVBaP+iwqlYVx85PoLIhGRxPN3
   mVmAV1h+gSGe7zc3xmosZEkCJGccN4qhXj6iRvDVyz30qv3MoKX76d5kc
   8dQtZVg00tRavJmXH8SXeUIFZU+iTddOHcPeFLbYNjszm8em0iwcFbxPq
   Y=;
X-CSE-ConnectionGUID: ySo6eyBrRW6mX88yVKBMcg==
X-CSE-MsgGUID: UsxTQuEcQcSmmsg2XtJr1g==
Received: from mail-northeuropeazon11011016.outbound.protection.outlook.com (HELO
 DU2PR03CU002.outbound.protection.outlook.com) ([52.101.65.16]) by
 ob1.hc324-48.eu.iphmx.com with ESMTP/TLS; 25 Nov 2025 14:05:49 +0100
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com (2603:10a6:102:4c8::8) by
 PA4PR09MB4560.eurprd09.prod.outlook.com (2603:10a6:102:ef::9) with
 Microsoft SMTP Server (version=TLS; Tue, 25 Nov 2025 13:05:47 +0000
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826]) by PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 13:05:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMh6UY0x64/BJzXbQ0xh+82bdQdrm8S5xW0eb6azOQxTG8BeLG0k7R/HwPX5UqXKdiIZSmP29vW50YQBzFDV8/OLc+mLH2eYGlE/y6ekokzM68fc4YLMvXCapoAgiO75ATQlafqhLFwR+DwqCgcruqAdHlWziAy41FpO3DRPBeV0eM20jvtWzmYLvnhHIjMUY/o4PhhSkOgELAJclh6+8j8AoifBU3Smj9ztuFBQRTr1ZYrjWLKKfzcPlgotOVF2sN3l8u9jnloFyr6hRFUvMJVIc/UctdujWi2rekcyMy3ptBfa62xOBNR2ndAbut3gtZDJ6/Xb7AFkuKDPkPnXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwMryRi62HEZwPGTdvwCQFKs2wsaY6O8ZP59crlNcK0=;
 b=i8oLW4m+FHLAAIQm9b1SSIhhVrDJlxas6lPSwplmH6bltVumpsP+0nRYr3N9c3cw+ccVbUSDGeDnY68q6T5sT1gqvAutSHrZY5oZM2YVTBhU3PQeqvg+Z3mXJCsj73uezTU39+kzSq397nHi0yAtNo849yGT1TN7RIVioPw7rEYZLftTS//9T00kqr3u2C0AI4TkJoIHhdOlxBwDzsumanu5qU2CcfMcrukmwlvI1R/BU1suMm035LjYHyNfaDd5lWk8CH58kceurYbzfz4lplsqvyx+Eq6KT/v4NH+6v1mkDrQlqK3D2SGbyYj+cUad/S16gUOw8BPXTo96Z0Gq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmwgroup.onmicrosoft.com; s=selector2-bmwgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwMryRi62HEZwPGTdvwCQFKs2wsaY6O8ZP59crlNcK0=;
 b=cgLmq0OuLz5igQN3cxZqjDBBjX7OvcCf7ZVIof36NfxSiJeqsmCaGIQSTGsoYDgyBHfLy53TU6lcWWcGYlTgefpc7s8G02hQHv8ISDPJkOvWZHgc3fApobfK4LVni9iv+jwktAZL2WIYInpleZe4L7ev0l8eztKVS46KNLpYG7w=
From: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
Subject: AW: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Topic: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Index: AQHcXd4a4JqGrneHwkiX+phh+Y2I2rUDECDQgAA9dhOAAATwYIAABkRz
Date: Tue, 25 Nov 2025 13:05:46 +0000
Message-ID: 
 <PAWPR09MB80303FA72C627A38CD6CA754EAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
References: 
 <PAWPR09MB803066084BE4261C627B09BEEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <AS1PR10MB5697B560F53B3853DC0107F1FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <PAWPR09MB8030A52B0E6122B81CEED6ADEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <AS1PR10MB5697DDEA8FD729A473CD61B7FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697DDEA8FD729A473CD61B7FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7c23643d-cad5-4db2-8ad1-9b6dc3da2f90;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-25T08:31:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR09MB8030:EE_|PA4PR09MB4560:EE_
x-ms-office365-filtering-correlation-id: 904e48ef-3265-42d0-d08b-08de2c2359f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?v6lY6gm1Pqeyp/102nw0/S1dFHJFFmsPBrJVgzFnWjzzmS8EYOGu7gLBsb?=
 =?iso-8859-1?Q?lWkxLeGBq15jbwRZ8AEeadbbKEG9CFLMRvSp3efusq23VR/8KAvzJA97ry?=
 =?iso-8859-1?Q?rhgrc1ODkWfZ6kTciFt7dwF75EqkNVQ5Az/bEB0vouu0MuumYHw6GpdSbj?=
 =?iso-8859-1?Q?ElbFG1Q2GzHj0Hnu1wzLBYH3zvWLzZWaKfKb7AKbPxxUSN7o3LunrVuwnF?=
 =?iso-8859-1?Q?bvodE4YKtPdf5j3kIcWhdNGp7yXSb0Uyui40+KdpBMDDB/YQRxrM3kAs/B?=
 =?iso-8859-1?Q?A/TLI5nJwq9R3WFEE74ACmAIjbgOajTA8MXNBl1mIYGr8Wf/s3wvpFY1PH?=
 =?iso-8859-1?Q?u6GjmFDHhxZnxmz6+GVpJofdzJXscaiBk0YP0QNdYOYmrHRJg7iGDzNmdO?=
 =?iso-8859-1?Q?YRngkhCGg8jnYZLI4O+4tWkHh6BTpVAKgOurUn3ZCMOaS3M+lly3r25AtM?=
 =?iso-8859-1?Q?IP8DuItx7QOZTeixlSJeRuwKdeiua/T34Y1gQWXuoq0EcKK9mk55MUcoMs?=
 =?iso-8859-1?Q?hlUrUl4eFHI3hIScWIfvZVoWoGGrtVzJd8jHvsxYvhGj/dR7tvNvEoYR6s?=
 =?iso-8859-1?Q?9kBcP1saiLS5W6A65X7dbNv7IGL9a6TTytgR6h2czzdolxoPTX9GfV24Ih?=
 =?iso-8859-1?Q?lnB63XZkpIj7s4uwR13/FLbF0QXvc4WFJjVs2vf7+0PDlui9wfVPp21W7C?=
 =?iso-8859-1?Q?+2O1QfkZo/tBqXZ1qTUGcY68lJSaESjwOhuZbcnM5HmeWewO0c/i2AhujR?=
 =?iso-8859-1?Q?gkyOYApGNTosSy0ALKngiMKB/i1DlpTkuVj4HYce3dEjbY9HkwVI9X1m17?=
 =?iso-8859-1?Q?+XRLiwnr2ESsc4ygCFs3BB0hA46JqJDuzGg/qyhhaq5v03es5Qvnd4v9hD?=
 =?iso-8859-1?Q?3MHsX0DcB/gkOl0BIsF86hHVVIT9qtnpPLUNaPrVC0YySivDab6d508I8l?=
 =?iso-8859-1?Q?sTp1ik/VFcZHxAziBO/BMckZYsFwXg2XRRbAsG7SLeDKB9j1bOC36rBdgl?=
 =?iso-8859-1?Q?mn81jzXHxner7xji6tBCsFzo1oQE7jPTLJPp85ySjnPSKf5ktPRJVqkWkz?=
 =?iso-8859-1?Q?84U32WsF+CX/HtX7rnN9bZOa7OESBgG9dz13zRL/CS0vhKnkDy1m1fdBMd?=
 =?iso-8859-1?Q?pFIUxyjYJW2jOnYVP5amJob95tdH+SzH9uVdvhoa2hCqLb7pBDV1/RY+Tx?=
 =?iso-8859-1?Q?3wHdLwAaRQT0RI4y+D/jQH46ynyeNDQ/Nr3isDYuEqQVK1iIHuHPA/VFj1?=
 =?iso-8859-1?Q?v1YczylMlXYStbBDaK4+IzvIWcMOmCK5YnU2WXE6opw25pnVijAl/y+xMm?=
 =?iso-8859-1?Q?25bcLPgzv299kfVSmf110Z01LyxzHSUwD02FXZamk6hchgO2bQxSoe/K1N?=
 =?iso-8859-1?Q?C6MuvLvPm8LaI+qEkkexCOqRT8+91app9Et2FUcov9T9CcNfcm5dfot/+Q?=
 =?iso-8859-1?Q?WHBGETP+5mAj2qW+JS/GTyGV3yb3S1zF6GgKM+1z0UurthpI+gwgM8UTkp?=
 =?iso-8859-1?Q?xiq3LjQWbsuXhcyv9cgj81rFefUejh2yeLeI/nykQlXdLwUkY46QRM+VcU?=
 =?iso-8859-1?Q?dr8K3gkeh/gd2m1rU2rnRPZrM3fa?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR09MB8030.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Gwicjl76tWwsNfai99eSWn0sZylMlrhrHZU4vRY/IiCtR312P7nVh7Go7q?=
 =?iso-8859-1?Q?kn8Zny1ni/e+05Pv15sE6q3aHbl59TTZZtOq4czdTFFTKgSZSuuDjTJ03f?=
 =?iso-8859-1?Q?0t0dpy/V7QeJw/LcorcugtrAudaL723PNkwyhe7W7sSRqZf5JpAwopV6DC?=
 =?iso-8859-1?Q?4ubAXjrZnJN6Qx0Sv/6nUC5V6AvhmcIJZJp5bNmDsOE82p5nJICz9HLcEI?=
 =?iso-8859-1?Q?GgePcwnvB9paOHehzRdZvGCC7Kz7ape6keDPAgPNXgRrWonphUyn5OF+mN?=
 =?iso-8859-1?Q?DRa8vekoALZKf/jcqSzRp8OdTHs5nu/WWRklLjtdhN55tO9B3IZPeNoO8F?=
 =?iso-8859-1?Q?oZvCAdFzyniSU7lq4Y6y5O7zlSmJymHnQeYbSy4Ni8BpGiZ8IKllNRAFKW?=
 =?iso-8859-1?Q?LqyQqgDndFB9VxbN0ArLt+/WwlmB07EnUPuZPNcwyEzddYmsQ9GJQWrApo?=
 =?iso-8859-1?Q?X96D+NdZ+i/seBw6E9LqfIEhAWIQjj9qhkVJdxsWhldXWpQgB1gpzmMAz8?=
 =?iso-8859-1?Q?NhEEAldn+xbwpQ69FT5B8yDJQY98+853ZEklJ815Ax/YD62T1lPbNER4UE?=
 =?iso-8859-1?Q?ijJ946pE0mYEmQ2RxMpwVhlqcoxUnIYZ6pEB4ZnKoeFEiLx1J/slWHFCP9?=
 =?iso-8859-1?Q?SSMhrUA06yKAGnEEFG76djnsU4A0HEFSueqerRTrHWI7pZRr5vJvw1hmPC?=
 =?iso-8859-1?Q?LeSQxnJ3mCvIhmKoOXvib6f7WA+MU0KcFQaVSS43FoMPyjhdILFIKrUibk?=
 =?iso-8859-1?Q?GOK2DjzDltRULQ0YxAujph3/Uk2lv3GfMZIFDcGoCmBP+MDgoMXV4dRUIU?=
 =?iso-8859-1?Q?6Y7Y0jlNMW1PrCmcnMcoqiWpFQAGAVTg27PLBBr1wr6rkk2wbDehDyTWRU?=
 =?iso-8859-1?Q?F7tLHSxeVdAdrQ7flst9ifIUYQZs4WW2tP9qwJEMTlh3Vel1/jsOhtH4vj?=
 =?iso-8859-1?Q?Y0JZJKzk1+ENN9fQ0ThuzObysmPLFQvY5G/0Mm+Nw9KTTaAiexKoByT+7m?=
 =?iso-8859-1?Q?ecFfUSdSvrsZ1E+lyFv+77a+ZOQ0J6zIl4nV71v2dNFlfPHpmSkGSDjywT?=
 =?iso-8859-1?Q?p+6DdOJxGWyuYM77qOr4brXlKTLBm8MDY8M6WHHp0a8aBb5aJJG4/mMir8?=
 =?iso-8859-1?Q?RqCuoQiICf3d8zhO38/n4ETeSQOG+s7OQ+R2Ln4WULM0fH4R7Urh5kT8TE?=
 =?iso-8859-1?Q?bQqK5iDmJBBzKk/mDDh9ZOqdfbuq0U0Mvkhx30EL6D16//RAtYySwDR79/?=
 =?iso-8859-1?Q?TeRV01hcXV3YXNdVyvsxpsDZ5A8vL+z0hmXibm6cjV9s62Gax8NugmIh83?=
 =?iso-8859-1?Q?MlSX/40GJn9X/ILRZu3fntv46h871ZvC8KKY6tYPjx0H9YYG0y0hoGQnGB?=
 =?iso-8859-1?Q?8oGzdJbaqlaCo8/pYD7Fp2USd4HlQwmDuAPjymqKVNgqzLN8jjv+HsjKhJ?=
 =?iso-8859-1?Q?KamnorIfH9qEz20CPzev6idZeUXg6LTDGAsuQeQ3vS9ew2psEFZk94vp5h?=
 =?iso-8859-1?Q?SRa4EZ80Xpmef0N+g9HiOSM/L0XSBmNciJZMqWNSFRPK2PX7fbLzb2UvJu?=
 =?iso-8859-1?Q?XhIqwlm+4+n49xiFtjUgyGsCrY4Ec+Ll79C6EqEK0F1M8h77c8qB6rRuBo?=
 =?iso-8859-1?Q?3BsqwO+Ql3uEDkAjFJVUBnSKzjEHyon8Mi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	9uoI0VP8leU9nsFJYpwMxGNIfrKfrDb04SeVHhAq3C8+E2DBL7NPP9bc0HlYIadrMqkt1ozzd8C4VXLxXuXbhaXQRiM6FiANmxcR47gW7Xc1jh4RfivgyJz15b2QV1HXmLCu4u8Th1hwxTUlzik5UUGj23tbpso/mA5tDLXu0myRUbwxSsfu3lKiiH4Pj0BjDL4imfw0AQY0n2vSo4Q97LWKrtRV50rZY9pCDdTUbccIE7tt4npUeZ2apOfZmyNK5WA8nvHKxry/E97L1kY/ht+n5xrUkQst82Hmmf3ir9rUmGe6uRm+wV8D0HE2jBUJNrpjg3JCrWGIsb/1SSbFwIsZIIhSpDuhKDXJYbt0+Pu78LSiIp39gqmu1Ugw/obXmVVWsZ/rGw0gUofzI/plmTw3ZO07raG+i/Z7YplnuK5YRGNI4jaJ3Wa/5vUWnBs5Z/2qTA/KikE6PhUkQSr0mpLTkBRVuNjzOJFfyQT19pquGNqqN0SYQaih0WQpa2bX1f0AbENs+yQCbbVUGcemz9GUHkCj1SB0AuyF+DqZlT4nzZznNRsG08tjHRkrz+VauIgJkRxwXUD9waNzfN2aGufHWbQvNaB34gF/NHqiUwBjshE6JDsA76TrBmbz3lpOvwuVXs1iHLkTr7IKkjPyhw==
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR09MB8030.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904e48ef-3265-42d0-d08b-08de2c2359f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 13:05:46.5536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zDY35Rdaq2BmszgLw1LBtngHcG2pzulh3E6O+oJlMYhuhmEMzh29tOiIkr4ExubdCzeqgly961i/hsUwqah3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR09MB4560
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 13:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226766

Hi,=0A=
=0A=
>> just so that I get you correctly: Your suggestion is to add additional e=
nv setup=0A=
>> scripts for opkg (and possibly other affected tools)? That should be doa=
ble, but=0A=
>> we'd need to add (and backport) support to read the env vars and apply t=
he=0A=
>> necessary curl options to opkg - or patch libcurl to do that automatical=
ly (and=0A=
>> thus behave like curl CLI)?=0A=
=0A=
> Having custom patches in curl recipe for this is a bad idea.=0A=
=0A=
I'd agree. If at all, that should be an upstreamed, opt-in feature - so at =
best=0A=
a long-term thing.=0A=
=0A=
> Having some wrapper or environment scripts inline with what was done for=
=0A=
> curl-cli/python/git is probably the way to go. Links you provided show th=
at=0A=
> libcurl is respecting environment variables when those are provided.=0A=
=0A=
The code I linked is from curl-cli, it's not part of the library. I checked=
 the=0A=
source code again and did not see any CA-related env var handling in the li=
brary=0A=
parts. So this seems to be left completely to the libcurl users. From what =
I can=0A=
tell, opkg (master) also has no env var handling yet (as opposed to Git for=
=0A=
example), so it'd need to be added.=0A=
=0A=
I'll send a message to the opkg mailing list regarding the issue.=0A=
=0A=
Moritz=

