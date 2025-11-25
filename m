Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C4DD0E6CF
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 12:25:49 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15598.1764073540681976196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 04:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Cb8mMg99;
 dkim=pass header.i=@bmwgroup.onmicrosoft.com header.s=selector2-bmwgroup-onmicrosoft-com header.b=Sd4f/iQ0;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=417ea8bb2=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764073540; x=1795609540;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IdWp5f245MjKa3zkznSKcX3TcT1FOmMv+T5gcERBe9Q=;
  b=Cb8mMg99ssMJ5+vgF6K7DZMqwcnce98uDowDaWwfCyJOuHZ/26e3pwUU
   v8DAQg7krpjJr08QZ57OBxLYoIZJXXu2JMJXCjIJPz1reqFWj7WrqNkWl
   OLCQqXrOH3gjhVgOLPziv40FTSsSXBs10smbl+6qPgNrCV7PJE0k4QxeM
   8=;
X-CSE-ConnectionGUID: zGL4wS+STJ2vtBJoTf5KKg==
X-CSE-MsgGUID: Pe3Bb0bpQOayaO3s/oH7UQ==
Received: from mail-francesouthazon11011026.outbound.protection.outlook.com (HELO
 MRWPR03CU001.outbound.protection.outlook.com) ([40.107.130.26]) by
 ob1.hc324-48.eu.iphmx.com with ESMTP/TLS; 25 Nov 2025 13:25:37 +0100
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com (2603:10a6:102:4c8::8) by
 VI2PR09MB7380.eurprd09.prod.outlook.com (2603:10a6:800:22e::21) with
 Microsoft SMTP Server (version=TLS; Tue, 25 Nov 2025 12:25:35 +0000
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826]) by PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:25:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0SUXnhk17LVMSiS8yRmtxNCSes/PccYAHHz9jKU05DrtBJBpjjGn4/FcbuCung6VkK2SzJ9V5KABaHvzMAtG7Zj+elVjQ9yqD882l1IL9GGut7CGoK55AwaEWbTDW4lMmegfpUHW+YEhUblGyxWne7MCuWQrteW4oX2lq7PGnriOasi125dA2RTjD+tPxKlfMMLu4760JlYao8MDJQJj8gQnphkTNops+enyHLKjoO143oEjJDaxizhVEJ0rY7kS7RRuVPqchKovRZqudkdbHdN7fp+xC/5Trz1Kyu6Kmz9nvQrY2DixjHX2fOQYaqB4idyYtrFJcv32BlocImVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdWp5f245MjKa3zkznSKcX3TcT1FOmMv+T5gcERBe9Q=;
 b=fSzFe68J72pwsHsDPi2rn+wgyRjeNpmjwNJLVp25214lQ0d7SL5+MGKJtNjRBD9Xxi8N4DLtlVQ6WHNLH3UsKxn/JqLfvo4jhFW6qn5Buh7IOcFbyND26bA9pCRLbm+zDJfdX7Xbay5XOZPRE5RkGcdudlm8MzJi6Vz0U42F3e+dY7gTgoRSw/DtQp+Q70YBj4L3q/qE99HX+BJ6EjyAN5Dzk2WVDNCgZACR45kQIafYeD0KekZCys+wpy9Q1B9wV9+QgD+SyXwjrV4qsVbk7hvgqAbljhDTL2F8QGY8UAKuh1JkIi6jDG4/MaPP6AIkPhxneQ537kycYeT3V1RFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmwgroup.onmicrosoft.com; s=selector2-bmwgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdWp5f245MjKa3zkznSKcX3TcT1FOmMv+T5gcERBe9Q=;
 b=Sd4f/iQ0tjbdQ4jHUZ8x/lto0NBsMMJ0///CeDa9OA8tnlUZJvqHLiVqBbRCFh2XXl8lz51Sn9n2OEaDzBkmHU83b/L1hSHoLRcWhE20bRqF4F832O/ihi5eJn+tTgiygvnNp52NTxISTX7HM/Rks/0YzAlxiSDsvpSeolTwLRE=
From: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
Subject: Re: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Topic: [scarthgap 8/8] curl: only set CA bundle in target build
Thread-Index: AQHcXd4a4JqGrneHwkiX+phh+Y2I2rUDECDQgAA9dhM=
Date: Tue, 25 Nov 2025 12:25:35 +0000
Message-ID: 
 <PAWPR09MB8030A52B0E6122B81CEED6ADEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
References: 
 <PAWPR09MB803066084BE4261C627B09BEEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <AS1PR10MB5697B560F53B3853DC0107F1FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697B560F53B3853DC0107F1FDD1A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: PAWPR09MB8030:EE_|VI2PR09MB7380:EE_
x-ms-office365-filtering-correlation-id: 4bd4708d-e88c-4ce1-b81a-08de2c1dbc23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?VtNHoSWDsjlXlcERpssjsN2rYHvoN9uomysRqC/29wmcMdMvYXrqJoalDr?=
 =?iso-8859-1?Q?uI3z38xD4EMLlLMW7hru78by/+yoMEgUQseRkJB//M2ZYF+65fwRUnMXcf?=
 =?iso-8859-1?Q?IfixTXcPzSHwgvd7mBcTPaNaOMFc2EUkO8y1Iypx1jjyoi54PX09zrTHEr?=
 =?iso-8859-1?Q?JIyiRupHXNsVeOzPttRbg93fgoCld25tPapMCOkRxiPfcwW9QOcDEnoW5K?=
 =?iso-8859-1?Q?aJ4SkiaRHlKQuLLOTR9Vf0ZVBij62Zzataj7H0S64djpRwCD58pY5KuWTd?=
 =?iso-8859-1?Q?pZZcTGzK46KFxLIqaM6xZNDh2AP69v6j/G8ozy4CP580nrKswlza3dGlxt?=
 =?iso-8859-1?Q?c55pZSytQcAFmpRYTJok304vqkAW2QNpR28Z+LGzgZxT0fv2rCVw7sP47x?=
 =?iso-8859-1?Q?bP4z1Ds/G7LpHWHuhwLvQWmj8lixqV4RM8p+pwgzVuwZSDPvci4ekDuPra?=
 =?iso-8859-1?Q?MGh20s4/hQwgfIWkPVRlMH3DI99kyjRhlOBrJrN4PkW5r5ZSkhwBx0H95F?=
 =?iso-8859-1?Q?7TW0NfURTzx2IBbIK1LQARCl3UUWF3HQpHaYTcRhlZhxld1u1d0V0Gqo/p?=
 =?iso-8859-1?Q?yY6oQIjgd77ojKZYtXvnoGYSxTdgw0NNPE21bbdaka/ZCND1WflcayfH2P?=
 =?iso-8859-1?Q?4abC3creHs6cXWViD71PntCAnFgsor7NipP53TmuoSxSFINXdpiTERVU3B?=
 =?iso-8859-1?Q?ONR1Z0j7U+aIUcfV0W3pQ+QDu0itb3BKRikQ2g0kCESm/oHI7a4kAd0hWp?=
 =?iso-8859-1?Q?ZTBOGjS3lqj3DPoM3bpvHS9ZEDjZukuqydXOeJFRDys6jFTgBin+ViajAg?=
 =?iso-8859-1?Q?NsqJBC/97d0yjjIJ09eZHDDYKBAUwazTkAwFruUQKhTSNjdcJvnbdD8ypt?=
 =?iso-8859-1?Q?Vpv1JxprnW384LK77LhZtUTc9NAmxyGrBwkaC6AuCGscD2Sfk6p8JcdRRB?=
 =?iso-8859-1?Q?bvx/Wc9InfGDShtom3mQu49JLfA/5cxDmZoMuP0F1LFOgoVL7NJWqod5NW?=
 =?iso-8859-1?Q?emmqH5Pn5f+ba5/HNkVBlI3lRsvmzSnWCVN/oif9EUwdB2Sga+FkEo6aX4?=
 =?iso-8859-1?Q?DzqcETuJel8OPINnxNe3jmUutcEGaMlngZc8G9xQLpaukXLFVwC32r/V/H?=
 =?iso-8859-1?Q?k71U4HPm9cxXDFfDm1pPn1UIK9PQshMcRk4ixu9GMzM3Qhi/uAYZWCghbw?=
 =?iso-8859-1?Q?TpZlAHpCCxA3iYIp3teBq1wkDLCc/mp/HB05w/uFtcShOS0tThDbneB2xR?=
 =?iso-8859-1?Q?9ZvHLAMjHaPcVUixFB/JdEGNTR3Otx9RV5zkmX9qCNYS2ZUaXU5sDyiHon?=
 =?iso-8859-1?Q?M52p94KL+JpRHwpxnFVX2TQDiBHhsI31YhLR5Yo/I+1oXN1Pzrpo9Gf4e4?=
 =?iso-8859-1?Q?WdqtJ2DwKqxQKi4GNbjZ2BlfybWRjNAMBhqOHvxAOVIkKzY7yWe88D8yuk?=
 =?iso-8859-1?Q?oNRX38OfgTxeztonzzOFNkKMEH7neA9/Oi2WW6bsD5HePz2i2ZCzegBupT?=
 =?iso-8859-1?Q?A6YfpcJNHqP0wtOJwgKgmpZ+bP2xlEDjw9lCOed5dCONca+v+HUwDYDvIU?=
 =?iso-8859-1?Q?kZ/bd18hcVvLU5oYVt5U/0TiLFmk?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR09MB8030.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3IG/AEenOHpZULjWf52gFyAhbTUEa4fNxI5MF3F+88OJKxtk/7IsXtkrE0?=
 =?iso-8859-1?Q?h/ToxTl94TjX1aUSyCAjcWKcRSzCoFusnir2cNdS9jw5s3F8dpk9Qua8W4?=
 =?iso-8859-1?Q?ks9RmLYDvFq6OmiDOkF5lwxpPIMiYCuPyk3zjzZMsOVuMBYhLMCAZBa+lZ?=
 =?iso-8859-1?Q?ZBKZcrNDLa6tuRsJ9v51YPZuLYIj76pc1wdLgvLGNbfsKtpe/Y+ofQfJWW?=
 =?iso-8859-1?Q?FndmklQgno6wlcJvYPKP+tKL3qZE4JgkRO0frrsv6vOvjbkKDkar11RlI4?=
 =?iso-8859-1?Q?BOsC1A+9PqhLRtz2PnwSHPo+UUdik76H+6BQBJCVgVp+tWrBz0mCGoFTio?=
 =?iso-8859-1?Q?fwENBLKWsL3PBDEeZrqMsNRAvP7xskh3nMlp4YSokLThLpBFLTPwQJfKlO?=
 =?iso-8859-1?Q?y/WVBTrjSSeFoiT6yzOnEMK4e0b9Ve9ANSNJ1g3sBae5AKVcKire9K0tJW?=
 =?iso-8859-1?Q?RPSOWoaJ9AaqzSVCcp651vmu0J85BhHxVpsKlqA+KtYudX7LxmCZ3VtFFO?=
 =?iso-8859-1?Q?xPwE4S+jmEAzraZ37oPDXZWfnGqVMmLl3cApUUIWaqALE8oN69s9IAPyZJ?=
 =?iso-8859-1?Q?w0l4wUO3Cz3Ni29qfsRJZRVd5RxaA7HtY1Y712rTt6bIhAMR5K+qDNI+vI?=
 =?iso-8859-1?Q?w8XLEKgbcMaJKDUoge3C+yMA8i8iDFp/d8cF0WjKFOvuaFkiXr2q7tCNdP?=
 =?iso-8859-1?Q?pENjdbsUCSXtwuMnC5fNaSNX9iqSbUOmPzir6FYtm0lr3M8jhBM9J69gmF?=
 =?iso-8859-1?Q?jhzhjeRxfTmiup8bHy6/2Jnnqet0cWRE23WQvT4jZQrqVfPYK+a7YtivVk?=
 =?iso-8859-1?Q?wYkMOyUQkDv30P2dM2HjIa07w2caYqU9cdGA+8Do40BoJC4gDydzs/TL0q?=
 =?iso-8859-1?Q?sYCbwtoAdFzW5ZDf5vwVNY3oNPR7Zo54+NQq0XM3ssl6VjhnshpB830q7d?=
 =?iso-8859-1?Q?HhmRfO1nN/X/HwYgFSuPaaPGu4triCPjvpMddl0OCvslDo+Pjcz4UHwJna?=
 =?iso-8859-1?Q?s5Y5v8J+tZecvwEKb8/WHn5BEtV+b9drGJUuAfLgctvU30sQHJaY+gmc1i?=
 =?iso-8859-1?Q?HItjjF0qpBc/OxSAYKRetZFl0TimjMIEk+7Moijr760WnTaX9vGziCTaL+?=
 =?iso-8859-1?Q?NGzKpneqKlUm0J1FerT1LDXN2Xm9NoWZqbxaAWkYSIKgzMX6qrGchxWE/j?=
 =?iso-8859-1?Q?WDgQSObNyIfdn9WbObUlcG0FRGZdp/jqa6GJCLyl+eZmpPgjclbeDsumH6?=
 =?iso-8859-1?Q?Kfakyz24C6SqEAsdj4TQqaulgoctBYe2Ep+G/6OKR3D1NYQMTP5/Bg0ToO?=
 =?iso-8859-1?Q?qRvaxlMnkcKxpM0vR4AXydcW9OuYmwJRVeo5UI+qpDGGDBGetNm8z4ziX1?=
 =?iso-8859-1?Q?dzXbGvW04SWlXEMDdM7dQVVl76tD4Sc8os5uvpRvea9Sz6AjDldvYmx4Ld?=
 =?iso-8859-1?Q?zjz+ogB6kCC93f7aItA/ySYJlZsUoQyl2XwE3ArAR17ZMG2YvmyPF/9wEM?=
 =?iso-8859-1?Q?hltElgKJaZFcsIlyV6anULsktClsttEeJKkBCcxbw4quda84Yc+TOm+Fbj?=
 =?iso-8859-1?Q?ZKHc33hFHgLtE4cpCctTUEGTw2vRLFYaXH6iSmKx8NSNn1JgEwslrhBWZi?=
 =?iso-8859-1?Q?nTH65vg3Nv5HBc6+iFPQFE3+caCXCYzuUY?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	w7hI7gRg9Vww+FBfxy69uuP/ocvx52TC4zmdAgjTq5GXN3XoYsyFJYiGr1ZpNFZAMtcMMxieeKwT7GbZfu73Fj3iLKw7M0LuIeNYhLpLh0/lBl+uUtMi6tnq3EViIAOlpDmN5hwvtEclHkKxuvvspmsTXbi5Aqvsya6WID/nZTXZAlGUNh2NesG1/Fj34YHDqRg97j2/V6aTTM4k/QBa8X+gVkApITtyKT4A/sRnc0vJ5BXEvpsBrZn5vPPBXK5SQac3bV/chuU1E3iYowFWe/VEfKM+sVBoiefyR4ZnP1qNyVA9/Y8xg2M1NAJkTnPPEdGYEMuI1Vk8frWmzOWEmYtqNy8V2EhumQHI2tst22bErwjKx0CRqs8J77QLFJu6cfxLBkoGn9urol/uRaV7fPbYTiWy+QrnTFkE/bSKuKvBdo3BE56oe5apGXfGNg3s5ICu3uw2bYD7KJWOEb3N5E0udORwze+tfKAAjOjWkRpjdaSxbWNtWIMj5ayQVDXT5brhCeYwRJ/cOfDppUI8AqXI7Cv4+Z7Yl+y7Zy4VV7Ni8N2sYykVaCt1CGGABDQeZxvmBzgV6HR6L7Sk89FkIw9DpqYNTelQ+BJuyx474CPv5npK5V+b7ZRxfgudCPlPnseH042roaz84wLAgXSugA==
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR09MB8030.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd4708d-e88c-4ce1-b81a-08de2c1dbc23
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 12:25:35.4935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yfLMFuDYHZqd07UfZ7ps974oIBMkvG+3RorRGgyc06DjWRMaGCnKgQWXFoV2ZZhsFcLkFOq3+LDrIa1nkuPO9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR09MB7380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226764

Hi Peter,=0A=
=0A=
>> Is there anything that I'm missing or an easier workaround to restore op=
kg's=0A=
>> HTTPS transfer abilities?=0A=
>=0A=
> Qruick workaround could be to set host path for native/nativesdk?=0A=
> # use host certificates for non-target builds=0A=
> CERT_BASE_DIR ?=3D "/etc"=0A=
> CERT_BASE_DIR:class-target =3D "${sysconfdir}"=0A=
> And use "--with-ca-bundle=3D${CERT_BASE_DIR}/ssl/certs/ca-certificates.cr=
t=0A=
>=0A=
> However, the system will behave differently with curl-cli and libcurl.=0A=
>  So what should probably be done is to implement env handling for everyth=
ing=0A=
>  using libcurl as was done in the patch series which prompted this hot-pa=
tch:=0A=
> [...]=0A=
> Especially with commit message saying "... respects host CA certificates"=
.=0A=
> I guess that series didn't take libcurl into account and should be extend=
ed instead of trying to find per-usecase sulutions.=0A=
=0A=
just so that I get you correctly: Your suggestion is to add additional env =
setup=0A=
scripts for opkg (and possibly other affected tools)? That should be doable=
, but=0A=
we'd need to add (and backport) support to read the env vars and apply the=
=0A=
necessary curl options to opkg - or patch libcurl to do that automatically =
(and=0A=
thus behave like curl CLI)?=0A=
=0A=
Regards,=0A=
=0A=
Moritz=

