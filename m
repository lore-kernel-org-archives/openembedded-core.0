Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8852BCD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 17:16:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.346.1780074977621207569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 10:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nBiYbqIf;
 spf=pass (domain: siemens.com, ip: 40.107.130.40, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onzzeQdj4qKvlQ8xCasvB34/RQN4dB8RarjUE6pskTN1aLVyl9Lp1rpt86JXFohBsXI7jmG5927y6taFq0QF+s4qxV3we9Zlaj8VoYYr6YOclvwsZLsvfMjy3cloMSKopEmozOzUvzf1G90j03VaDBzg7ibFrpgLPnerxuVHgc9dFLPVFgWyQoxg2YbablL6rthJnH+aHXwBCMPgL+pb36X6TcOECWEyB2VUjclpgKC4Q8z26CGbcN4uvdf08X8ftSuIg83vCq3469BgMk9KMrhc0zPvIvLc690yAWfRIQI8gpLWnm46jRvbLvYUwZjgqbTtkC4a3kCJvjLxWy7YdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1mBVlkOV/qNcQtvDUblzNPt6qcNOeaUVBLl5zVVpCI=;
 b=gf1rCV9xINPRoX/zL346/D5FIfh0TUDkoFoPZ82MNGUMMEkZgPxxNEQluDPPxOZgowLfe1owhjelF4n06cNO1kyAfPrxchWoBHYp7e9yCzKIby0RUt3qzGgR/fQZynoGKBuTx6GaMA0h+5ORUlrgXL7DVoQfkEoH/7W7suyrAl5F/7FqFhOYHW+Sbp7+2NXtYNc6qztdalNm+neWzpFm14Zv5E5Lp9dQoVeB1ipyJ4zvBtZwgM0bYTCD07oqSH1bilX/EdolzaluxLsoRNRbc3siB9BzXOsxobS6Bd5c4wPGk30Z34FC0JUjEpKxsuE7SOcEpGP93b/DBF9LKw9u6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1mBVlkOV/qNcQtvDUblzNPt6qcNOeaUVBLl5zVVpCI=;
 b=nBiYbqIflGts+k6tgP0jO/Yf7nERhLkAmxs0RD0VaFfRd2Y9EROQwo1BXHIGjR5aT89cSP+WXME/KVGXivAJ+0CF5pepIHx/lER3LPxiEuhwj23pPADNRR2AG5kKe00VxGvpjnshItFufQDXVclavi55/jXws4VbJaLM64OzlIV1fhzLhD4Nk7g0weEXbw5YvOwDa8DBmsQoqdlhAbCMOxZu7TvgJQ9Y76K1paDyKtfR+EEAbt7ZNDPTLPjAxo4AkGfpoW+W99XOvqWyIAxwbKeC64CLuIiXEdZVLhIAtPTdk6wC1QhldwTqGzq7VkrOtFoWm9vI36RzHDo7QP5y9g==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by DB4PR10MB7039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 17:16:04 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 17:15:50 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [PATCH] ninja: enable large file support for nativesdk
 builds
Thread-Topic: [OE-core] [PATCH] ninja: enable large file support for nativesdk
 builds
Thread-Index: AQHc5EowgbY6OrCWRkGMPDlN2DxOp7YUU9SAgBD/VbA=
Date: Fri, 29 May 2026 17:15:50 +0000
Message-ID: 
 <AS2PR10MB734741462B212304DA0A020CDB162@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <20260515090645.1053312-1-peter.tatrai.ext@siemens.com>
 <9ac6783613c77c303633416679e5cfb1d5f77808.camel@linuxfoundation.org>
In-Reply-To: 
 <9ac6783613c77c303633416679e5cfb1d5f77808.camel@linuxfoundation.org>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ccba3fb1-a534-4f7a-9626-df6628601532;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-29T17:09:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|DB4PR10MB7039:EE_
x-ms-office365-filtering-correlation-id: 7e54cb6a-f3bf-4f61-41f6-08debda5eea1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|38070700021|18002099003|22082099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 SNkhNEfoSNm0IZU4vYY93yBYTIaL+TX8hRbklR4ubZ68w8myG34TQOEFsT0a56rwoNdLxzbbond25nVpFNZ2pWlf8J4utGkFmzc6d4KzQzWPLcPJ8NtLk3YO7bGk2d3EPNg6PIOKywv1d0aURPIxe9UXHQG1ciTGYXH5qfHbsYMDQxwl1oBxIMdUpyccwOpU8FIxgtoK1DLJd6FFrSWOsBOV62qTU7OGTXftXYqoXcDgnpL5wTbbSTUNk1ARWQKAImjK+zbM2Ln6YbSJivil3aGejPx5eIgVHU4Hz/77H52D671Q75XuVePIGuBfNPXdfJRVkIma7+xJo29U6id6F77T8tbyrVR1Htj/ncBJGSrjZ6GEAtctCgqj9eU/NyrD5wNxxxS26zrFL/YZjsGplQieS0PJMrxlpOHKGc3v8LuNJfE/ZGSM+buFNGpT0q5R5xusDedVi416KHBHKJuMe8YYC0Hb52taI7J+ibvQS24E9dJVo35xohZ38OT0//kaJDGHAUAyPZPLl7gL5q7+xnCDj5iiozSuNBCNnOFR8CVmvKegzLgmzxH6uzm7/UuWH8jIsjkfT6nZ9DoITjuSkeunUcK6yY6R3CJqAq/1cwRfaB4zK4t+XQubShNQUhCg2waoc1meFhgZCNRFL18hfURH/w1JmnaS1yV5aMncuRsFt9Z+b2yxV4qnIDydXJ2XcpIekVVDmRhfPJ+bfsHDTUbSMDrdyJZH9EtPW4QLZW1m5fhYghKYc8fOzfSoU3qC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZE9GeUhSbU5nZDZ0Mk41Z3U3bk9BSkRXNVFUYnVKdmVZcUhDVWQrcWp6Mjly?=
 =?utf-8?B?eVpwOVVWeWhjY1lHZHZ1VG1uK2s2dDlibTVwOGxqRE1aVzJqd2hlZnoyNVBV?=
 =?utf-8?B?YlBIenZUYXFtNElnUDRiVTJvcWhOZkFYUWpxc3VhdVBrcVpIdFVxMnVubkxW?=
 =?utf-8?B?SzFvTVRoWkxQSDlQbjkxbFRNcjVVdmdId2E1WU4zYmExaEEzQTcvN0wwbHZj?=
 =?utf-8?B?R0hySzRTbGZtalZ6Q2xJK3RpN3N3SUQwUmdNc3ZpTHBSUE1HTmQyRTdJamVV?=
 =?utf-8?B?djdvdlcybGNkWCtzMHBRVlpSaWFwakxFTkFtTEhVRDE2QnRvbGxpV0VGTFgz?=
 =?utf-8?B?MkNiN2VLZDJ4VzNsQVZ1eTdxR0NzQmNaMEQzQ3VPOTJqeFo0UldEOEg2bmhO?=
 =?utf-8?B?YlljNDlveng1cTZpSmV2c29odSsrQ3ZDbUJDV0RXeVYvS24wTWxBdFFIWG9K?=
 =?utf-8?B?QjQ1M0dTemRSR25WTHhTSG1LOHllVG9PbndHeDJCVXNsNU40MjJrQzhVTU5o?=
 =?utf-8?B?RmxyclJlM2VlNFhwY1VKRmRnSm1RRFExc3NFdWYzSEZ0dDlRYjZjWFJSeUs2?=
 =?utf-8?B?NGFmN1U1M1h1dTFiR1lodWpJaU03b0V5amJBQ2FOemtCME5QMytvK3c5RWFF?=
 =?utf-8?B?T1FEZFJjWmRFSENxZmkzdjVPT2xpL0dKUDNvdVlLdzNHSHp4QlVnOFJ2d2R5?=
 =?utf-8?B?QlR5REJtcW9TSTJjMkpYQXY0VmJKMkdhSzRUQkZ2UFJncXNnVlZENlJmZFFq?=
 =?utf-8?B?TGJWeE1QRXZaQzNpa2ZrUHpyNW9LSXpjVSt3dk1zODZuYTJQTHNzUXJFQ3Rr?=
 =?utf-8?B?bkViMzlCcWZMa3Y3VUpUb2FjNlhXWjB5bm91dUdzN1lWaVFHd1lnbUNlNEZY?=
 =?utf-8?B?K3JZeWZNeTIrTkRZYTk1SnNqdHp6aEJkM0lZZHVIS2tPVTFhcHl1bHpVaXls?=
 =?utf-8?B?a01DWk9wWWRWTnh0QjRuSUJlZllCT3JNQytlZVI0TXdhaFVnK1dLeURvUkN6?=
 =?utf-8?B?SzlpR3VDUDFDT0ZUamJqN0Z0UVNTVmFucHRQTE8zNlBXWE0ydjFrSlczenIw?=
 =?utf-8?B?SG9GYlFLSDhFdW53V0dlOXlVTldRUHArN2xjR2pNdmE2eUcwVTNTZXFyTUVl?=
 =?utf-8?B?Yml0ZXg0U0tDS0lSd2dZM2tITkFpaW9kQmgzMGRMSkl6ZVowSHZnSXZBVHht?=
 =?utf-8?B?ckVjRnEvV2xWNTVBeCtRSmtpbmZNc3BNeE5mQVRoVENxTzg4dHJOQk84bkMv?=
 =?utf-8?B?bUo4dklyNzVPVC9MbjB5bGdJSkpKblJONHhSdittcmtzc1ZnOXh2WDJreGVI?=
 =?utf-8?B?Q3VscWdudXF0TlhCWnVxZHd4M1poUTZwK2lOOFVXNVRMclpocnMrRnVjUFJh?=
 =?utf-8?B?UjhMdHI1SUlQRU4xUG1tSHh0NGJGdldHdlpuLzhtc0FYa1NPRlJZem5Rbk83?=
 =?utf-8?B?czBobklScWhOdEIyQkFabXdHY0FBVm1ZdVBGYVN3RkxRY0hmMmtvbllGd1dT?=
 =?utf-8?B?TG9lcm5lb1VkbEkvcG1weWpFby9GZGU4MVFkd2o2b3Y1SUd5S0VsSG5QbE1o?=
 =?utf-8?B?cnlqTHBSSTVoY0pTcWo3eUtPRVpxZmgvbmU3L3hTNmhmWkY0dDFGT2k3ZnUr?=
 =?utf-8?B?eE9HR21rbUN6YmdiQ0E5M2JKaUplWGF3cmY1Ukt6YmJxUm1HL2VhWEJEWWk2?=
 =?utf-8?B?Y3EvVjdEaEcyeE9IZ0ZiaWh6NEhsU2p4NmtmZEJsYWgxK1p5cFhSSU1mOFNr?=
 =?utf-8?B?KzdYZ0JjdDhSNGxEQVZ5MGw1dTNlc3FFVS9FbVhvZ2ttcStLWmptNzh4UEtN?=
 =?utf-8?B?SWpxRWxjTDZNMGMwdjg4M1NiS1djaUJNZGRwdG9OVjJPc1lncmV5SmhHMWtU?=
 =?utf-8?B?WTJjczB3ODJObXh5d2RHQWRMM2pqNDV0U3g0amZEN2dzaGZMb01pMlhRVTR3?=
 =?utf-8?B?bUhWM2w5d2lSZzluT2pGdWRBRnhlT1VhSVhpekhHUzBRV3dsdTNNZitCNytN?=
 =?utf-8?B?b2ZuTC9FWkVoaFkxUEhnaGUwVWdHM2ZPUW9FTWNtQTVrM3JtajNCQ0JlcW5m?=
 =?utf-8?B?dkdBWGJ6YmY2aWR1QXp4b1BNZTZFZWtuSmxHaHNVZDR3bzh4R2xjeEN6Q3Qr?=
 =?utf-8?B?UzlVdkNFY1JwT0hQRFlWMnBtZWNpRXNwRHIvSjJPRloxRW9IMVpZcE5TUFlQ?=
 =?utf-8?B?aUNOZEVseU16aGV6MXh2NHJEeFErU2ZBMUhWL2Q4S3Q1Nm1DM3FWT1J1ZWlk?=
 =?utf-8?B?TDB0RGxJMDdjSURISmVBejdLeEsrY2lML2lTWWpJSmxHY3ZtTFhQNnVROHlN?=
 =?utf-8?B?SVp0REJNV1NyL1ZkejVMQkM0ZHgyM3M1dTNESzVFSXRldUhxVzBWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e54cb6a-f3bf-4f61-41f6-08debda5eea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 17:15:50.3798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBzb9H/0Hgn0ol/a2HWq8gHh4s/6+PYG6zsAMwfE2owqwjrktcplvg1vfJX1BmeRQRk5S94jlN88pn8XcDH4ZY4AHIzYAEhiMWwU96C6ixM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 17:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237769

PiBJIHRoaW5rIHdlIHNob3VsZCBzZXQgYm90aCAtRF9USU1FX0JJVFM9NjQgYW5kIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQNCj4gZm9yIGk2ODYgdW5jb25kaXRpb25hbGx5IGluIGEgc2ltaWxhciB3
YXkgdGhhdCB0aW1lNjQuaW5jIGlzIGRvaW5nIGZvcg0KPiB0aGUgdGFyZ2V0IGVsc2Ugd2UncmUg
anVzdCBnb2luZyB0byBydW4gaW50byB0aGlzIGVsc2V3aGVyZS4uLg0KDQpTZW50IHYyIGFzIHJl
cGx5IHRvIFJpY2hhcmQncyByZXZpZXcsIGJ1dCB0aGUgY2hhbmdlZCBzdWJqZWN0IGNhdXNlZCBh
IG5ldyB0aHJlYWQ6DQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS9tZXNzYWdlLzIzNzc2OA0KDQpUaGFua3MsDQpQZXRlcg0K

