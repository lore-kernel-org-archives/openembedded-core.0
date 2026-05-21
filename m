Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C00CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:47:19 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33737.1779360432062363144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=NK2JfA4/;
 spf=pass (domain: ericsson.com, ip: 52.101.83.45, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYkgQTEIKKcToL58v4sSKdzNgspmwu+YnHVnNx7a985TSvikKq1ca0/kPnwcVNHutZFmWMp5qxn2EPGPEAEy/NE20iid0E8e+mSkIYC8FRQhYwLDEiiJCvr7y2/9Z/b0gWtrE56KSodTCuGdOFZ5W+I8nYM1OYXNAtfIlgCSk1FVCb/lawvtdko6U4WBmlZe0swgGUxrXsosMQNYaOvt8fnki6IIpypZpe4yjbDEBNujjzbDB0sTGNy8nk9HazwSrv4SHhACegpsOnsqw+M2u26pgFbSbnw5SHKcr0UYwOhfPAW6/maxwU0YIL79hyntWegk0cjjKQoFSqp0UBvlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlHClJRMAk1zxIs1yugVoFyx8b/dDmOWwz2u6WKwAvc=;
 b=Jy6wnlY0K9lz27MuXOPIYuslK6VSaBgcMKN4M1MHHAdQn0NeEhHQ84lZQR+5Wz3ykgJk1EK8iMExlScMgQUpCVrBrbZUrDPWbyM5rJ8kOF7LQp/gIyv8vpAKsDHvMjqVkb5OUgCsZVSxn3ap4SXUian+UBuMIrtvk5xvZ0zYQa2ikvcvaMs9Y09SzJHqAptoRWw5EWkqWDwW1W0A9PPDWFpCqPL/eF0ufGRCK3E9PWgGLzQOh6dq60fnTIhAipVAUoQ8MvtmWAsT3ZW1PHcNb9p7wOhFwtN+udgVdHNRSc6IgWxOzznsnbMkiNX8YHObg9DpcaNcww2xJMzUrc/WPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlHClJRMAk1zxIs1yugVoFyx8b/dDmOWwz2u6WKwAvc=;
 b=NK2JfA4/i+K3qyX8rCzTyhpDVVpHm0JoNusgLX/twpEZ0gaeZXEMwWWWBleucOU2tgHyiExT/6NkKpUlKRzKdvf8B5l41GCcGbUH5IelupgYRW0Zn5PxILrBfEo1lEHB8FXXYKktuhINWbgf1BJdaNtQ1NFCkuWNU3ePsE4anviCbmDSbQZED5cY1EUK98CNouLWynzqwwgkqt5aotHPGKJ+VNWGWbY7Qt3K8lst3+9ODmOte5ZsBhKIFAA/cA+r6bb7icA7w4vm39WHVwuyj3zNicEP62JUb10p79hBdE01d8pms24dVhwEChkuDVLRBVgPKvmUgQ6MUg2gcIaHVg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by VI0PR07MB12034.eurprd07.prod.outlook.com (2603:10a6:800:33a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:47:07 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 10:47:07 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ticotimo@gmail.com"
	<ticotimo@gmail.com>, Tim Orling <tim.orling@konsulko.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Subject: RE: [PATCH v4] devtool: upgrade: extract changelog between versions
Thread-Topic: [PATCH v4] devtool: upgrade: extract changelog between versions
Thread-Index: AQHc5s6W6ed30615g0Sv9IRu2gWVD7YYSI8AgAABdBCAAAIXgIAAApWg
Date: Thu, 21 May 2026 10:47:07 +0000
Message-ID: 
 <PA3PR07MB107217A6ABFF34CED17D7B4A78A0E2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260518135925.2579226-1-daniel.turull@ericsson.com>
 <CANNYZj_b1FwJ888KMGpMSvBHQTWw6ns_M83Z3hn5WQHbi-_WCQ@mail.gmail.com>
 <PA3PR07MB1072144F3A9A22B216961FBCB8A0E2@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <CANNYZj8uZeX=uRvG4LunO8M51bfA26otSP9=R=Nx+Eqbd_Lexg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8uZeX=uRvG4LunO8M51bfA26otSP9=R=Nx+Eqbd_Lexg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|VI0PR07MB12034:EE_
x-ms-office365-filtering-correlation-id: 9b8acd3d-f5d4-4e6d-4bc1-08deb7264ddd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 cURm3NUH4CDp1gnYBniVbovMGhckJ28JdibhvBc8ISAvoZXlK1NF3vI4JcUvryTEc9hlXyKOoXNjaSMmtGKyXCi/wxT8KhAL/Ppuiy4E+stGBwhv2/F9W0xbxNmbkHD92u5UOybMEJOVgGwJbJPQ16+scIhbOIivGz57iZ/Mgga/J5JpRfyj6BnOWzRJ4L1UuOCykGU5Jp/Aw39vsh+BM4I1CkGmlizbZs9p99FXkDAGRgmSN/PwdpX68DocdEw0rKXJi8vqJL0rE3VQn5pEpQkb6+XKTOoeNkRqgLBr7nqizx+FCOHrNiDxu30PIAkaUaNjTgfJ68BuyD+hgmVGFTAGCNHtzzKJdP/uub/Kd6vXqoQj8jHUkdubAyHRmMdJa32ioi5I2yNcYzdfEg/mawQROkqFEYcRhuXAvEjuAwY7COwAOtPdmDf7DyXRUhFKu24R4ZRXChujPbwKJEZu9CaEQpE1JeDK+YyYFKGnEomTkee8OI4P9PG9V0BrubJ3NaZ27ZH94ma++vGV/IdrldOacTubgS+RuntDu4GFcqPt+LeJJ7SqhKm0NvYmWfiegY65Kw0ybGCyzRDtC21+blZVXDVn21ZDo+VhFkmW/IUyWld9LE+uv5iUl7KObtc6Qi2VW1cHgXVuTb6aLWT77M/4d6yqUEimaJAWF6hHfAPtCuqWedxdsGTHAgHA4Tr8cAdHYZHFDUtw4smoEi9NdJRh4jsWIiY97YgYXioH5ddCPB+drtpJHveU26Pt0oPZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eGluekJEQ0JJWlIzTjFuTmgrcDZhbHNNK0RnUEcxR2I1MUFLUHViY1RFaTBJ?=
 =?utf-8?B?amhUZW9iNTFlOVVKdDRBWkNXQW5TT1NsVHhYUUNITUlpTHJ3U2ZyVlBkcXdQ?=
 =?utf-8?B?S3h2VU5pVkxkVGx4b0dBeTRoeDRVQ1dMYUxVWUNGMU5RR3Vad3ZUYnZyMkJR?=
 =?utf-8?B?UzZKZ1FLNDV2VUpKZ0JMVVpXc2lIRis2SkFvMk4wZlBPN2hUSFpRaDYrQzlU?=
 =?utf-8?B?VUZjcm5SRHRBVmlUWWdHTkNXRmplQ0NjLzBLWVFvZzhmd21tbFVERDFhTHl4?=
 =?utf-8?B?OHd2MWJ2YVBFVkVxNEZxQnQ2bjdsdFRZRXJRcjFJQVhkUnArYkhlR0RORjVT?=
 =?utf-8?B?VUovLzBtUjVvUXpNc0NWUi9nTlp5V1VoS3FEdzRlNXBid2xMM3FoMTYrWE9h?=
 =?utf-8?B?bzA4TmFFVVlCOStzbHpZMmxkdC9xcTFnaVVZRnRsWks5Z1BUTnVyMi9DUEpW?=
 =?utf-8?B?b3QvdWdmamRjZC9nZ0Fxd3JkVFNOL05WSEVBSzhVaWpySjFSakZVc3BzMkJP?=
 =?utf-8?B?bGljNlFwanJ3UnFENWlzU1diMWU4dUwvbGpLd0JSRVhrQ09UbWlScTZ0YzV2?=
 =?utf-8?B?VDFKd3JpeVpYeGJld3RIanV3RnZ2a1BieDU3WjRqWURnREJGMW1hMzVoeHZw?=
 =?utf-8?B?TTZMSE82VnM0QUc2Vjk2SUltMWlNL1UwM201c1YwcWR0UE1CcXllZ1VzQzVv?=
 =?utf-8?B?MzNiK3Q3UEpPb3VBTWpaSm8yOGJDb3Y2MVd2QVU4Y0dFTks4MVV5S3BpbHlH?=
 =?utf-8?B?N1k0MjNCTm5SUjllSXZWNGF5cUVhZVlHdVllcTdPUGdKZzFaRmc2WVhOdmNI?=
 =?utf-8?B?UC9ENWVvbWlSVWpObWhicklwR0orcXBOcHVobGU4aFlTNEFWUVUxNDg1SjY2?=
 =?utf-8?B?QlpiWmRSWFkyUTJFeDBCWkZsUzlxa1BQVVUrVnM0UVQ3QWY4S0IwOHVqVXlk?=
 =?utf-8?B?SjlhRTFnQ25RZmpxeTNOYjIvdDI1TDIyTUtnN1hheVJEZ3ZiME5sak5ORVBO?=
 =?utf-8?B?eUtvWWVVNm55TkdVWmM4NG5zaWZodDdlNUFiOU5kbStNSnJ5aHVaYmY2R1dK?=
 =?utf-8?B?TUZUaEVPaS9YNWV0V0tWTldVQTRKZVdxTGU4dlhvMmRETEpuVjl0SjVIQm5B?=
 =?utf-8?B?T3ZqSzhXRERRcEU3SXk4d1dYaWNlbGtPVFVtb0wvMnZ0RGJLc0cxSU8zZmFO?=
 =?utf-8?B?TjkyNVhGcUN0WkNZOEJ2NmN0a3NEZkdKK0k5NnpETUp3TWl3bE8wVnpHQ2xI?=
 =?utf-8?B?RkIvY0p2aHNxZzZKbHNSaVhWVDRLRkU0Y0o4Q1hNNW9OYVZxYVJRS0swNlpo?=
 =?utf-8?B?UTR6WXl6NTYwR0svbTJhTTZQSHFNZnZlUHNpMG10Q0lWSkZqSXNPMUtyK0hE?=
 =?utf-8?B?YTBCTDVLQlpFQmpSTDB6TFJybDRPZWhBZVhLZlJ6d1FabmdMZ0w3RmpySC91?=
 =?utf-8?B?STdhdjR0YWdsRFZxY0NlQ2pVYTVJZnI5OFdFOHZaZkJRQ3FyVFBPekNPSWdV?=
 =?utf-8?B?bzhjMHhhU1hPNkFzY2FweW03KzFQcWtlUVVvbXRuMG1HVHV6V2VBc24wTk9X?=
 =?utf-8?B?VWNrZmxYbXhRNE0zVU0venYyWmRRU2pNaUtpd3Zjc1lMWWhINGJMdkk3Nkd6?=
 =?utf-8?B?YVNvcTUzZWkvTkVDdXJsVG1CUGFSWTdSWVR2SXhCSnYrMndPdnc0T3RMclFx?=
 =?utf-8?B?Y3dYcDBkYWEzUHcvRk1RYm4wa0hkckJoZFU5dUhnelRFTWtmUGMyai92dVdx?=
 =?utf-8?B?bS8zeHR6bzVTd1JCRkp0Vkp5dmNJTTJaaG9Id3lvclB0Y3FtSHF0SDdPVXNn?=
 =?utf-8?B?aFBnemhLd3luejRYazJ3Z1RHYWlnQ3NES2dKRXhzdkk3QXdOK1ZqMzNwdG1I?=
 =?utf-8?B?OEo1Slo1cldPRlN2WFF3SVFjRXptNzNEc3hiaVdabURkVWMxYXkzN2h3ZWFK?=
 =?utf-8?B?aGNhYjNxWEN1WjVJSm9EcVFtWVNZb0NOV0IwK1V6bUwzWGFuUEJEa3ZXVUgz?=
 =?utf-8?B?ajZtMTNpMS9DZ0pqaDFyTmNFaW9mbk9EYi82M3p5VFplQ3l5YVZ4MWNsUHdp?=
 =?utf-8?B?VU5GUHJqVlJxUWcvTkhGNXFpa0JlajJnamNqZnIwTndONDhrYTBuY1lnWGY2?=
 =?utf-8?B?UFBTN0xhOGVJOUhPYVlZUkVteVcwUlVCbm1SQzU0VEVtb0EyM0RBMEJXelNB?=
 =?utf-8?B?OHdKT1c1NWlKWVhWWHdVdzFieVRURnRqVzFhcE1JN0Q5VnBLYmdYZXNxSjAz?=
 =?utf-8?B?cVYyKzZGWHZvMDNJK1ZsNm1JcThqRW8yV3hqd0hzMlloQUd3dE5NcDcyVFEx?=
 =?utf-8?B?ME5XOEMwSC9Zc1RVTzlRNGNNQlBwTDRiTHlQbk1oS3VKVjdGR3UrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8acd3d-f5d4-4e6d-4bc1-08deb7264ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 10:47:07.5611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uBcTwnuhVb+mmSXpmW7St/B27So8LRLA/3LRJA3lAjGENJ5TFMxfuYasxrd8zu226qPKX0rjclCRXiRnxlubjjjs2o8mFFKZzDWN030g1ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237504

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCAyMSBNYXkgMjAy
NiAxMjozMQ0KPiBUbzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyB0aWNvdGlt
b0BnbWFpbC5jb207IFRpbQ0KPiBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPjsgUmlj
aGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0g
ZGV2dG9vbDogdXBncmFkZTogZXh0cmFjdCBjaGFuZ2Vsb2cgYmV0d2VlbiB2ZXJzaW9ucw0KPiAN
Cj4gT24gVGh1LCAyMSBNYXkgMjAyNiBhdCAxMjoyNSwgRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1
cnVsbEBlcmljc3Nvbi5jb20+IHdyb3RlOg0KPiANCj4gPiBZZXMsIEkgY2FuIGRvIHRoYXQuIEkg
d2FzIHdhaXRpbmcgdG8gc3VibWl0IHRoZSBBVUggcGF0Y2ggYWZ0ZXIgdGhpcyBiZWVuDQo+IG1l
cmdlZCwgYnV0IEknbGwgc2VuZCBpdCBhbmQgcHV0IGEgbm90ZSB0aGF0IGRlcGVuZHMgb24gdGhp
cyBwYXRjaCB0byBnZXQgaW4uDQo+ID4NCj4gPiBJIHdpbGwgdGFrZSBhIDEgeWVhciBvbGQgb2Ut
Y29yZSBhbmQgcnVuIEFVSCBza2lwcGluZyBjb21waWxhdGlvbiB0bw0KPiA+IGJlIGZhc3Rlci4g
SSdsbCBwdXNoIHRoZSBjb21taXRzIGFzIGlzIGludG8gYSBjb250cmliIGJyYW5jaCBhbmQNCj4g
PiBhbmFseXNlIHRoZW0gZm9yIGNvcm5lciBjYXNlcw0KPiANCj4gSWYgJ2RldnRvb2wgdXBncmFk
ZScgZmFpbHMgdG8gcmViYXNlIHRoZSBwYXRjaGVzIChvciBvdGhlcndpc2UgZmFpbHMpLCB3aWxs
IGl0IHN0aWxsIGJlDQo+IGFibGUgdG8gZXh0cmFjdCB0aGUgY2hhbmdlbG9ncz8gDQpJdCB3aWxs
IHN0aWxsIHJ1biBhbmQgZXh0cmFjdCB0aGVtLiBUaGUgZXh0cmFjdCBuZXcgc291cmNlcyBpcyBp
biBhIHRyeS9FeGNlcHRpb24gYmxvY2suDQoNCj5JZiB5b3UgZ28gYmFjayAxIHllYXIgaW4gdGlt
ZSwgdGhlIG11Y2ggbGFyZ2VyDQo+IHZlcnNpb24gZGVsdGEgZm9yIG1vc3QgcmVjaXBlcyB3aWxs
IGNlcnRhaW5seSBjYXVzZSBhbiBpbmNyZWFzZSBpbiBzdWNoIGZhaWx1cmVzLCBzbyBJDQo+IHdv
dWxkIHByb2JhYmx5IGRvIGFuIHVwZGF0ZSBvbiBjdXJyZW50IG1hc3RlciwgYW5kIG1heWJlIG1h
c3RlciBhcyBvZiB0d28NCj4gbW9udGhzIGFnbyBhcyB3ZWxsLg0KDQpPay4gT25lIHdpdGggY3Vy
cmVudCBtYXN0ZXIgYW5kIG9uZSB3aXRoIHR3byBtb250aHMgb2xkIG1hc3Rlci4NCg0KQ2hlZXJz
DQpEYW5pZWwNCg0K

