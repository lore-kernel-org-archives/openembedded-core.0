Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF21CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:25:01 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18111.1779459895309661777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 07:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=lJCxNivJ;
 spf=pass (domain: de.bosch.com, ip: 40.107.130.60, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYBdD8q+BbWy7FsKjyxvKblLTXwBHlLXkgya00g7DNDHQNe9I5eNzanA82xtXf/FoAZ+b+02epKjoVIDxaMdvbOtGpGJfBY+2gtH/J75WjRXLOqJCkhD33EBN3S7vZhq+XG/lObgsu42Xfxo+D2Rodf+3wIfoBL1vN7Kg90/HRmAnt2x4k71eAp3FAQ2s2kU+6C4GFPiwk7i1kRvh9VIG3AVeaeFZEiNeneaRom+4zNAtD+W47EikWSo1j6orPEl1eiJcLvN19J28Kdt0AGFLC7UuEaPC6g7CJdsqXQPMvp7lNuVoiN9VTiGxopQlORtvRDVYH/4xcSwv4LNV/LhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpdvSxduNAXVsp4XEq/SQkaiWYBjFUyTeG/H4M4RuiI=;
 b=FIRyAMA4x8VlRLMhBJcNzSpwDjWNL6UxKxqYn7MpnNPB/0dj+VXy2C/iHKf0Ovell9Ca8hRz1Vh3tce/N0tBdOYYvVjF1O+1ccNim5KuXYWuOjIn9rc3m7kg++LUiB7/vwXZKlgvxGMiEe9BvoEjPz26BLhb3WE3kGoFctKojS8Q2jHbhhUoYX4puLAY1HVD8n+R002l8Al0lIhGy0ikCQ5O9HUEhrlc8oA3LhP0LyZYoKh3ELkQTfz5Zwp7Z1hnP0Uv9HjdjCadfBSKMzVl8HjmfONgXMn8NG9VZuqbZRM/hxSNqSV9YfJN81D79sGGMTVbMl1qkIbu68mh3KOXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpdvSxduNAXVsp4XEq/SQkaiWYBjFUyTeG/H4M4RuiI=;
 b=lJCxNivJ/VaR0YHnb+7fvNkNj2LpMWXcwPxyJmA1LvPrv7mqv0dZeS+ibXHdnZ9rKK2LJczm+EBida4okGfh0GOT41r/zLzv19Uygl45vHYhrHlDU3NudqVSCM/lSsYMopEZ+rxGCYwbEjs/pqlLXRi2tndzTEY3bDmkn4VViGv5SacUZ1n30Yv34yVf0vuMVymDeAfoIh4RlZYEaAritD0cxHTp0S5psqyTNbR3qIp1xiFpAjo1JnuWaOYDNLsNrzCnpXDZ662f1k18KT6OkNVkYRdb+fBGNFWKLtlaxHwPmiyXlQPfv/M1ZeiOkuWEKYr/CbQfqkNVYiIQQVs6Fw==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by GV2PR10MB6743.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:24:50 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%2]) with mapi id 15.21.0048.013; Fri, 22 May 2026
 14:24:50 +0000
From: "Jonas Mark (BT-EL/ESW1)" <mark.jonas@de.bosch.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "robert.joslyn@redrectangle.org"
	<robert.joslyn@redrectangle.org>, Paul Barker <paul@pbarker.dev>,
	"peter.marko@siemens.com" <peter.marko@siemens.com>, "pkj@axis.com"
	<pkj@axis.com>, "Moritz.Haase@bmw.de" <Moritz.Haase@bmw.de>,
	"changqing.li@windriver.com" <changqing.li@windriver.com>, "Simoes Ricardo
 (BT-EL/ESW2)" <Ricardo.Simoes@pt.bosch.com>
Subject: AW: [OE-core] [PATCH] curl: Remove absolute paths when mbedtls is
 enabled
Thread-Topic: [OE-core] [PATCH] curl: Remove absolute paths when mbedtls is
 enabled
Thread-Index: AQHc4vIMgefS5wUJ8UOW1fazlZUUsrYT/yuAgAE0k2CABNnkgIAAGVSQ
Date: Fri, 22 May 2026 14:24:50 +0000
Message-ID: 
 <DB9PR10MB535435D181D8B4955ACCDCE3AD0F2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260513160218.11997-1-mark.jonas@de.bosch.com>
 <0d9172f08910760f6ff0866997a4723699f96ec5.camel@linuxfoundation.org>
 <DB9PR10MB5354A6011D8064EED83711A9AD002@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
 <77A5FE30-035B-48B1-8D94-0F219D9D69F5@arm.com>
In-Reply-To: <77A5FE30-035B-48B1-8D94-0F219D9D69F5@arm.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|GV2PR10MB6743:EE_
x-ms-office365-filtering-correlation-id: 66a9e02b-537f-47f8-da90-08deb80de258
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021|4143699003|11063799006;
x-microsoft-antispam-message-info: 
 cIVDuSXNQefwlnSk3Yobfc526I31WEcE7FXgAcu+wLrnnMoKSRP+kVQkw3TYLm0JxUeqU/2jgfU8HhJG9S70oxtaEHWOfTdjhu+scJF5RqxKH0NYNvO6mSsBn9aTTjmy3nWNQEPwFILwK72hvLxDjB5HldPLJBO95xin40W0R3IKqogccBWJPPoweK6UUTS5caYyFJdUEOgMKp7PR9aCOnJ//odsHTEY02xnEpCvZqovn+pRnw16e1OxVX8oHkb95YgnM+/w3lgtPNEaxnimsYW6iswQzQpL+EIout+DMe6Vb1OnOfDqLmt7DLHhIl/qdTB4m5UVfFj3GLOP7ifdKrnCfKlIss5EMb4UuT42k2A43OLWMOhVxlWTdWRVLXj8jNJzILxw6WBf/gBvIVcC0SzG1M6S0QYuH6x0QjubQX1gVOuNvrabUkO+s+3JR/4eJA61FHBKVm5+f2HuPbuiuO/z/jSWk/2b9Zi2T0Kdww7OfEQJzhbLyjt9n7byiNoBJZ+L/MgtX/JwFl8vURhJOKAKWosom0i/izXbulXYBX1FVLKfG5KiSS13hxo7gcqB+cBsBxrtSZ+OL6CCIT0kNl1fj4mondp6ZlQZWsZcuRXmYWuL+9NOgHU3S/66CXCiW/jDmGZ8kWHpIIRcDUxmawx8pbICxYSkqGgh2b7XEUZ39Ag4D97FKr0k5svfFunl5JfkudPmP6+0dgDI9LvVQPb7OTYyH+6Mscx2PoTiB7R2+/SGbCAnGHW7zLHeM5tG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZkxTMWljaDV0NTBZY2h5VlRMVHc5NXhoZFBuME8wOUNGckxCQzk0bmY5RTJk?=
 =?utf-8?B?L2NRcWIreG90SitqU2hLS2hCQVZLd1dXU3ZHMzdUdFRoNU9FK3ROM2MzY2JM?=
 =?utf-8?B?cHcwSVlZeDgxbXBqbVBocGVGSkhCeDZWOGtuVTYxVUUyQ1Y4clB6ZlZsNDZm?=
 =?utf-8?B?MGh1emJiL3RzRTVyMW5TRXhWM29SSm1UakRXYTZhckxnNEFGVS9zaEk0encv?=
 =?utf-8?B?bS9nR3M3WjJGOFFaUUZsTXVlSmVwQVlROTJrWHArWE01R0M3WHBENjVDVGt4?=
 =?utf-8?B?bjZNWC9PemtUeW5wZGJMQWtzNTNPTkNtVE1BdWpCdm9MdVVOWkROMFlpTFRi?=
 =?utf-8?B?Tm5XeVNsZGJBV2xHVlZkV0NBcDR0blkvczU2Vjd4MjVzTitTdllrL3UraU43?=
 =?utf-8?B?R3NTVzMwbzB5WVNIc05tZ0VEeTdIaGhBaHM4SHU2ckVzMlAvSWlnOVBHT2xp?=
 =?utf-8?B?YWlROWg0YU5ncWpydGJpTElpYXBLK0wzV2FtZEI1Y0dGSG1JSVJnZjhvbHE0?=
 =?utf-8?B?cVBQSDNkanQ0YzA5QmN3TEVNMW1xaWVJQVpBVWM5cWdnUXFOeVYwZngvQTRp?=
 =?utf-8?B?MmVIU1MrdmNFa1VQK1FOb25WeW5semthcVB0NWVvSmVvSXQ3RXRjMWRZaU9D?=
 =?utf-8?B?TXdzeXpMY01ROFErb01CSzJ1dkNKMDJaRmJtQUk2RzdtLzA5QXhsaEQzejJy?=
 =?utf-8?B?WkNQKzZRMVBlMlZEMTEvOWJtUTVYQmZSOFRzMmYyK2lrQVpPMHFUcE5rdEFh?=
 =?utf-8?B?Vjc0enkrTTlGV0kzUFJNbC91SDcrS3Q1VFVhUk9XNzVjYTZKK3kwQVZUZ1FU?=
 =?utf-8?B?Y2tWbTI3NHpkWE02UDNvZjJ5Q2o2ZWR2TUJCR1c5R2l6VlBJN3pndHBmM0NW?=
 =?utf-8?B?Z1Y1WUVpR2NKa0hRaDM2QTRuN2dsS2crL0V1NWJVb2tQT0VYMG9aZnUrOFRn?=
 =?utf-8?B?OFpSUVF3QlBMcDUwSi9CY3lNbVRvc0RlRUVOUjl4MzJRZXlTNXVYMnZscmVD?=
 =?utf-8?B?WEs0eWU2dE5HZ1EvTWYwakpMWEcwL2NROUZKYXB2c0xqMzkwdkFZMTBWSkRE?=
 =?utf-8?B?Zjhnb2UxeUgzSDlMRUJUMXpVTHlpTFBBZkwyVzlyeVloeSs3TlB0TjhDdmJW?=
 =?utf-8?B?M255N0FWNnRZT3NaVlRCazFyclJmd29OUzRvUkcyRVpkUDEwWHZjcEdaK0t1?=
 =?utf-8?B?YzByY3c3ZkFEaHZEbkt0WjJyOE1aN0VQNkR6ZWtOQW4yRDVEbnBBQ2w3dVVU?=
 =?utf-8?B?QkhIV243QmtpVmpOK3VUNVMzb1hWbjJiSDlvUDBwV1BvZm0yUUZ2Vnl5UFlB?=
 =?utf-8?B?WjhtbllkUy9OUXY3T2N2QWluY2REQko3cVZNTlpmczdseFN5a0tISW03SzRS?=
 =?utf-8?B?Y254RklESXorK3F0TzlwNmRPUWRrRnorNHRVQ2FyV1J1L1AvTTZVSUNuWVpj?=
 =?utf-8?B?YzBTdFhOWTQ1aHNvRXE1clg5MWxhV2ZyaXdHc01QZUhrQ0hVZGp1OUFNZ0Rp?=
 =?utf-8?B?R21tbW9pb2JVRzJEbG5zQlY4aWZZeVhhT3hvQnFyYlVCUUVuaFpqZWsvUTZz?=
 =?utf-8?B?Tk1rZ21JN3RYM1NhbUtJc2h1MzUzMVFDK3d1bzdWRU5ORDV2S3NPa3VHQTBM?=
 =?utf-8?B?ZmZnQ2FxemhjaVB3dXVzWjEzNVF0bWh6QUJiN1dFcTRBMTB5UmcvWFhxMXgx?=
 =?utf-8?B?a1VMNmRvN3psM1RmMlhxaXJjbkJJZEhMeHNscmNBNkw0VkdPSEliN2FjSGdC?=
 =?utf-8?B?cjlhNEhWRWxuQWhQc0lmTWI2V0g2T2piTDBqSjcydDMycVEzMVRxZW51RTZM?=
 =?utf-8?B?TnBlaFVmbmVQTWRJTUQ2eUpQNU4ydzE1eGlWcnJ2c1FRS2JWVFNteTVITFNK?=
 =?utf-8?B?VkhUR3RGY3NGa3RtWWl2c1BGbGwzME5PK1NwQk1pYjdYcjNKSjhBTUNac1Zq?=
 =?utf-8?B?c2NHSHhKajBjWThhUW0vbVZmNmF5OS9wQlNacFFQTFpsZ0MvdVJTdU52QkVa?=
 =?utf-8?B?TlRVcTFka0tzeVJyVEt2QlZZeEcvQnc0VitpSFFSMzVweWIxTVpaMHlNdXRm?=
 =?utf-8?B?RGllMFBEWk4wRzJkbmxZSWoxOTYzZ21wTXBCLzdXNTRobVZ2c0xZRUdlUVEz?=
 =?utf-8?B?N2Q4ZjV0RDlhdUY5Z0VWWGhxODFQMUN1b2NwS1ZaZmY2QzZSdFc3c0pjRytz?=
 =?utf-8?B?VXNVdEQ4bXByT3hSUUxUWUhGRlpZaHVlUjN1VVltblhQcFhnWlM1eW1wZGVp?=
 =?utf-8?B?V1MwT0h3N3BkeVZQS2o0L2NmSzUyZE5hakNrbmtjNmZYTGZ3K2F1ZW96WjJL?=
 =?utf-8?Q?u8spEzXUl9D6VQcE4s?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	HMvRUuMgs0AVMWQdnDEJaWcVQfO/jPczhQGY3FqfxQicPzWiQUuAB2USuEJm2TNG1KgPWKgl6Jh1DSmejf7Dp7hBC/gxaA/lMrvRRa663lK1X1NoWYORb/Hc6HqWDTyu2nmM1w7pxkK7R11K2Hom+UvHvkfDdkKIjxg/uugzOO7Dypq2SZiU/mmhnTdL6KJzzjZA1lScA1DfSApVdGs9O4ZP1i/xIaPsj3PR/Au38rD8bSho3qAa4MbJv/uDMpc7vJQJHUzUx3ys/mI/RG/KdbwEiLMrXPV5yWEajPyXhvgbPwh90RZ1YsGXc0FA6BgB2P3GT8pB00RpolDUxGiSGg==
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a9e02b-537f-47f8-da90-08deb80de258
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 14:24:50.4132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guWkvWGMQo5RiuRYLXZlmXyYujFqzBs6FYGgEewbrV4NjakFzLI1MqLnk0DFX4LuWjPRq3+LH+bp6RdLzUp1Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 14:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237550

SGkgUm9zcywNCg0KPiBPbiAxOSBNYXkgMjAyNiwgYXQgMTI6MTcsIE1hcmsgSm9uYXMgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG1hcmsuam9uYXM9ZGUuYm9zY2guY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IFRoYW5rIHlvdSBmb3IgbG9va2luZyBhdCBpdCBh
bmQgeW91ciBmZWVkYmFjay4gV2UnbGwgaGF2ZSBhIGxvb2sgYXQNCj4gaXQgYW5kIGdpdmUgaXQg
YSB0cnkuIFNvIGZhciB3ZSBoYXZlIHplcm8gZXhwZXJpZW5jZSB3aXRoIGF1dG9jb25mLg0KPiA+
DQo+ID4gSW4gY2FzZSBzb21lYm9keSB3aXRoIGF1dG9jb25mIGV4cGVyaWVuY2UgaXMgcmVhZGlu
ZyBoZXJlIGFuZCB3b3VsZA0KPiBsaWtlIHRvIGdpdmUgYSBoYW5kLCBoZWxwIGlzIHdlbGNvbWUu
DQo+IA0KPiBUaGUgbG9naWMgaGVyZSBpcyB0aGF0IGN1cmwgbG9va3MgZm9yIGEgbWJlZHRscyBz
eW1ib2wgaW4NCj4gbGlibWJlZHRscy5zbyBvbiB0aGUgZGVmYXVsdCBzZWFyY2ggcGF0aCwgYW5k
IGlmIHRoYXQgZmFpbHMgdGhlbiB0cmllcw0KPiBhZ2FpbiB1c2luZyB0aGUgcGF0aCBpdOKAmXMg
YmVlbiBnaXZlbi4gSWYgdGhhdCBzdWNjZWVkcyB0aGVuIHRoZSBwYXRoDQo+IGdldHMgZHJvcHBl
ZCBpbnRvIHZhcmlvdXMgcGxhY2VzLg0KPiANCj4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgZmly
c3Qgc3ltYm9sIGxvb2tlZCB1cCB3YXMgcmVtb3ZlZCBmcm9tDQo+IG1iZWR0bHMgZml2ZSB5ZWFy
cyBhZ28sIHNvIHRoYXQgd2lsbCBhbHdheXMgZmFpbC4gVGhlIHNhbWUgcGF0aCBpcw0KPiB0aGVu
IHVzZWQgZXhwbGljaXRseSBhbmQgdGhlIHNlYXJjaCBzdWNjZWVkcywgc28gdGhlIHN5c3Jvb3Qg
Z2V0cw0KPiBkcm9wcGVkIGludG8gdmFyaW91cyBwbGFjZXMgZm9yIG5vIGdvb2QgcmVhc29uLg0K
PiANCj4gUGF0Y2ggaW5jb21pbmcuDQo+IA0KPiBSb3NzDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2gh
IFdlIGhhZCBhIGxvb2sgYXQgeW91ciBwYXRjaCBhbmQgY2FuIGNvbmZpcm0gdGhhdCBpdCB3b3Jr
cy4NCg0KQ2hlZXJzLA0KTWFyaw0K

