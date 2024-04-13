Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D1AC4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 06:31:56 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.71])
 by mx.groups.io with SMTP id smtpd.web10.5794.1712989909653840527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 23:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=cE1Tjqlw;
 spf=pass (domain: siemens.com, ip: 40.107.104.71, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/4dTmdQmikl+sILvLqaVjHOhRqGYmE0m3dy5O2wzmQzm0/FUjLmSog27397YSpstWzbGz9acW/Hqx2on8ck097ERMkf5sJGdH+71MXsF+XyhmYdUQiuwNZJ5q6cZ46ZhIl6b7a5Ce3RBFhhasWWfsS72/UZslC4RFQDOr/4tslQwDl3IMcSvtS5++5PwsyHvDfCqhbhfTQi3c4omQfbnzuqi01fsUmtnaVX6HyEK3DC67X+c+ZbsLFbiJeHorFkDWNRVDEFKOE15fSCH68oshu9L5pj2u4DynbAsInOJBpZeOZqrpgTGvMVh2zp7DLxmPysU/ZxkpyFLC0HYeot9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFoFmkXUQA3elbO9r1W5bgU/v9rIlfcIU1H411aZ+5w=;
 b=NeBR9fmX9SBves8QxXMuzanyQDXuLkjt96j5TpiVIg7uCvRJvUh2v+UQrfBHH/ZD3KOM+lZk+zz2OvOZGJ4FpTnLYdaZjnSz7WjuJTClz1xaN7FFD5A1KwDVMlXe4/GP64PORaeB3KuUMwkcCwD2FFUeMTlZlz97fdTVtulHKOrWEw2PFhYMsjU/VHwFg1p2LxWkD01E/cQFqFSU5KMelP/X313i6K2SmjWQl3mbjwg/WKBixn7CBYksP0tA7ItRxLLKvR2dwRiWMKHa+V5BKD9//By/25RyUXndw5vEOkOuFaxkd2JWbvNUAO2bp2M+L5e5aYzELjkIxg0Dwuf48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFoFmkXUQA3elbO9r1W5bgU/v9rIlfcIU1H411aZ+5w=;
 b=cE1TjqlwJt3RGFNOJZjNEt/guth2xo5nx9tEVRhH0uhB5BjeqsNjAJoGKOF9pHlWumljpaS/2rsR3kG4k0df5gjniaTXNTqagUlUM/IlTRZWCrKESIZRVJn2I5OLpOpcKx+MfhioBZ2LUVxrfOmgUH0ZyN0ZjBI1JgLM556h1Dh5bB5dRYLGuF7z+/PJJHqCVifvq5UGFyab0AnUCWb2//Q68xjniwHvO4o5hfiZx8wbWG+oiNTotPY7t/5F4Gvw3pfGZTaSN5Ll59/q9F3CRX/2V8GX0nRnOBzfdkTwpW67sSfzOHkN92B+sVPmuFhZ6FOb53CUcCdj/dvMVQHu8Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB4PR10MB6143.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:389::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sat, 13 Apr
 2024 06:31:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.053; Sat, 13 Apr 2024
 06:31:46 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/3] kbd: remove non-free Agafari fonts
Thread-Topic: [OE-core][PATCH 2/3] kbd: remove non-free Agafari fonts
Thread-Index: AQHajPqnxKX83NteR0mcKxKEvtUtdLFk25OwgAB85gCAAGVr4A==
Date: Sat, 13 Apr 2024 06:31:46 +0000
Message-ID: 
 <AS1PR10MB5697E9AA3A39FABDFDD0CCACFD0B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240412165714.8951-1-peter.marko@siemens.com>
 <20240412165714.8951-3-peter.marko@siemens.com>
 <AS1PR10MB5697E46CE94DF5D1CBC5F901FD042@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1sqLRn60xsM3QB7dUAgKFPKdawyyVEnjBo5vHmU_Udgmog@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqLRn60xsM3QB7dUAgKFPKdawyyVEnjBo5vHmU_Udgmog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=938173c8-2dc8-4442-8ac3-847772c93ada;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-13T06:29:23Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB4PR10MB6143:EE_
x-ms-office365-filtering-correlation-id: 100f0225-e29b-4107-2574-08dc5b83645b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0Sq3HBfOO9qwWGtYAvPIf+zgynB8aOGjYgRxgZoxd0jhlB6BM0YzySV6ZrHIZssOMZ9ElGA7JlvSgIFyfiK1dwd0qLiiytu7IOuM3VshkKdjzDPbDfBF6cMmIIsgI1QAjGniOWiLMHDI1q7hJiX2CFwgSRe/kHALOOJDVKom5pleavbQE+c/QE2GvZt00d8eMG4Sc4I4OxQOpYiB+VtIKc9yHWcjxyQNovS65yrcuYV9yhdqDSzyEqA5pheZcWKs92EgV9X0ZkNz5pRExZ2+S5qFxnaCqJ33YFL2iCl9O0ch+SAcDXXV9NijlIkz8zEcDOsgArVE1zswY9yRVX/IYBV6dMOSm/IROGeOQwgDeEzY2jD64pcU0jFfOfY8pQuf6J3mxARAQ3VXwlRBe7E2CfYb9pOAWCHInmLKVoXZnpSCWOvt/0QI0Zv2LzUaPoevea9G0N+KhorujVE7ON2AyQCZtsHs2/QM5p0TnvAra0dFLX33HiAGrtbo6vM9qerphj5+U00R/wYhAwGH65bAYF3l9c99+iNtP3akl98zQjdzn5R1KYp90/6NL8XwpnSxpQ96BhYHVKbpyVMdtsnrnxV7GQpzDvFKylygrG6ibTyPZYQZUtwTeGMg49CWjkMTCr1P8UR9wNZl23lmvxmauF6dORuQDmMLcxPLWccNLCw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aWd3YVV2UXloYWw5RklMVkgyTFZuTENUZHBkdVV0WHVtbVlQWHMrOHA1ZjJs?=
 =?utf-8?B?VHVnSjM3cjg4cUFJb3VxM0VkVXVzYXViQ3gyWEdzb0ZCbjBuZUo4bEt1dS9F?=
 =?utf-8?B?UERJemVleHFlNE81VVYxa21LOWd4M2hoQ2lmcGE1Vy9iNFRWWGU0RXNMT1VH?=
 =?utf-8?B?RWlXcTBqeW9Vd1FtYXdkNFZ6UTM2YmYxUlIybHMrTkRaUFQxb0xQWTlINkM2?=
 =?utf-8?B?YTV2MnNZZ1p5Ylh5YzZDN3VRcXJqNVpxT3RHZUNyd3NxNXJwdnI0ZkZkb1BC?=
 =?utf-8?B?OWZmeEJjSzFJSWJTZVRRSGtGSlBEYlByS3ZjYURrWnkxZEJwcm12R09CTTRF?=
 =?utf-8?B?aHVOK3lIeE14bkMyNllUWUxaZlpRNUM5UlMyRkpGZXhtYjFmTStRQWZaeG52?=
 =?utf-8?B?NXNFaXQ4WWx4WDU3TGZFWE9IQVBGOHNMSHcrcWhKMHRpekxkaGE5eDl5VlNM?=
 =?utf-8?B?VmY0UWMwL0tXYXBXSHZxN04xKzJ4QVUxbWd3b0U2ZHVQbDJnNS9RQXVvY09L?=
 =?utf-8?B?Z3ltM01mZjlIcStOMU1hR3FjdGRDRFhNMjB3VFVjb05zME1PTkJoY3JEdVpF?=
 =?utf-8?B?ZUpNbzFBVnlvS3YyQkM0bGpPQ0VqY1g5bkZxVTZ5SDliQ0pxY3k5WmYzT1Zu?=
 =?utf-8?B?MGs1R3hMd2pETHRja3ZxQ3BLbW1jUFlRRHUwU28xbWtTM3duU3RjTndqYm04?=
 =?utf-8?B?Y2R1NTQzQVNhNnhlazNkWmZQYkRvei9wS3padlZMK3hpUWJoNEt3bXM1RitV?=
 =?utf-8?B?T3doMXBWUGlaa3R1QUtXWTFYVGRJK044WGNoWHJLSHFjSWxlSlZIQlhKa2ZZ?=
 =?utf-8?B?a2dFSmlDSnRFUFJTVUhTNEcwNVlQanVaYWg1QzYwbVB0dHVwcExMUnFiOUw0?=
 =?utf-8?B?YVdML2I3NDREM2xEUXlvbnZtR3BwVmtrM3hZRVlxcllZcWVlbFAxSWhYbHpt?=
 =?utf-8?B?MXJ6YzdQbFJkWFUycnlOdVE0RHJTQ2ROZWU2aUo1ZjVjZXAvaWtZaitCZkUz?=
 =?utf-8?B?T25HYU1jWFZpeHlvdWtXSkJvcVBkeWxxcjNSQ0JmR05yNHFHN005VG1zc3dX?=
 =?utf-8?B?MHhHcjkzUVZlei9mdkhWNU9YZkUxS05VM0lIeVRpd09ITXNyYU11SlBjRzM0?=
 =?utf-8?B?SlZFdVZIQm5NR0NkRVpSVEw3bDM4aUswVEZ4ZjFKVUl4SUZsa1pJQXFVVmhx?=
 =?utf-8?B?TXpQZWVOZkF3WmF2Q2tFVmdjd3l6T1g1NnUwMGxuOWlWUWtFOUZoc29qSk9m?=
 =?utf-8?B?L2I4M1VqKzZVbTRuNStKTU1QQU9jcm9VNWhsVnRCK3NlenYya1ZKWDAwM3Ew?=
 =?utf-8?B?TUlmOVdGdVNLSmdZZ3hGRTVDMG5tL1phT1lDU0JHZUdVL1V4cTIzMnlBZ2FP?=
 =?utf-8?B?V08wQUpuZ0ZITmJuSXViRCtvUDhqVDlyZEFmN0R5LzRwaDJrQTBYU1dMRzYz?=
 =?utf-8?B?R3k5YW8rRHZ0ODAwbHlLU21mWUlEYUp5N3E4THdDelNBMTVESWRoVWd6V0c0?=
 =?utf-8?B?cHUrU0dFZnRUc2p2aytsVFRnanRPaUUraVMvNnRZaVdYSmhzVEk5Qzc2bitr?=
 =?utf-8?B?M1BxbENSbFFWby83MURPcVhycHhMUzdTM1kya2lCQmFhcFlhVmFhdzdaUExD?=
 =?utf-8?B?cVVuQ0MyZHZBdUR1NG9mZWxSTTZhQmo2bmhjNE5JMUc4bDhtMmx4NDBReTFi?=
 =?utf-8?B?WCs4UVFyNE9zOW1KTWFtUDZsZndzdjloeGk2eDcrYlQzSzZLQ2QyNm00aUVM?=
 =?utf-8?B?NUphOTRtWGR5SnhzQTM1NHRrZkxrUEJpNzU4ZE1rcE1FM0cvK3hRMTFmaXc1?=
 =?utf-8?B?WEhLYkM1WHRRcjlLLzExMVB1WkJ1MXJDdlB3SUNFOEMrYVRvdWc3Z2RqdTBu?=
 =?utf-8?B?RTBtOU1HK08rVmFwTU1xYXl2QldjM295NWVaMnd1MUpyN295aEV3eC9FdHhY?=
 =?utf-8?B?RHd4R1NtbXcwTGtoRkRvM01wRTNLckJUcUs5WmUwNlkrc0k1OFBSYkxFMEdT?=
 =?utf-8?B?NjdYM1ZBMjYzendIN24zZmN6MzUzaWtkaytTNHFlQmUvZEcxTjluVDBtWVZ0?=
 =?utf-8?B?NjFGcnkydFBCcWs4aXdTZlJJZGFONFdnTnJud1VQMTFJN1VYdzUyTVkycFFM?=
 =?utf-8?Q?3pTSRz6OGAdLBDirlnWoOqbSl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 100f0225-e29b-4107-2574-08dc5b83645b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2024 06:31:46.2149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMLD469uS3aBokUBnoy5LbH0x/pb8GUdeS0Wdt3bj5PDss73hG4HPa47dYBz1vM8fSwtDaLjSXu3FvgZCwaQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 06:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198192

VGhhdCBzdXJwcmlzZXMgbWUgYnV0IGZpbmUuDQpJJ20gc2VuZGluZyBhIHYyIG1vdmluZyB0aGUg
ZmlsZSByZW1vdmFsIHRvIHRoZSByZWNpcGUuDQpCdXQgeW91IGNvdWxkIGFsc28gaGFuZC1jcmFm
dCB0aGUgcGF0Y2ggYWdhaW4gbG9jYWxseS4NCg0KUGV0ZXINCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IA0KU2VudDogU2F0
dXJkYXksIEFwcmlsIDEzLCAyMDI0IDI6MjYNClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNL
IEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIDIvM10g
a2JkOiByZW1vdmUgbm9uLWZyZWUgQWdhZmFyaSBmb250cw0KDQo+IE9uIEZyaSwgQXByIDEyLCAy
MDI0IGF0IDEwOjAy4oCvQU0gUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiA+DQo+ID4gSSBrbm93IHRoYXQgYmluYXJ5IHBhdGNoZXMgYXJlIHByb2JsZW1hdGljIG92ZXIg
bWFpbGluZyBsaXN0Lg0KPiA+IEhlcmUgdGhlIHBhdGNoIGFzIHppcHBlZCBhdHRhY2htZW50IGp1
c3QgaW4gY2FzZS4NCj4gPg0KPg0KPiBUaGlzIGRvZXMgbm90IGhlbHAgZWl0aGVyLCBUaGlzIHBh
dGNoIGlzIGRlbGV0aW5nIGZpbGVzIHNvIHdoeSBub3QganVzdCBkbyB0aGUgZGVsZXRlIG9wZXJh
dGlvbiBpbiBkb19jb21waWxlOnByZXBlbmQNCj4NCj4gcm0gLXJmICR7U30vZGF0YS9jb25zb2xl
Zm9udHMvQWdhZmFyaS0xKg0KPg0KPiB1bnRpbCB0aGUgbWVudGlvbmVkIHBhdGNoIGlzIHBhcnQg
b2YgYSBmdXR1cmUga2JkIHJlbGVhc2UuDQo+DQo+ID4gUGV0ZXINCj4gPg0KPiA+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxOTgxODIpOiANCj4gPiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdl
LzE5ODE4Mg0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL210LzEwNTQ4NjQyNC8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1j
b3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgDQo+ID4g
W3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

