Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6F0EE49A5
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 20:28:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.40])
 by mx.groups.io with SMTP id smtpd.web11.6836.1692736104535775945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 13:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=I1QMMC4+;
 spf=pass (domain: siemens.com, ip: 40.107.247.40, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggRtLeE4SsAIB0bxEmq3FQ6Kp67JywfTLznZbHRwprSLYiJCvaRuu/ys8mIG+rnaycDinINeAhJ7g9xOLou8kvxLlQlzj5YTqGmUxFThIxikklYAAkVI9/cbj52hDrL4FQyfJtdNpYtzkZZTKedt+xJj9ll2jVWHPK+2s1YwjbjIi7ZvmS+rcsPdOO8pyOwwylI5DKeKL8lXpUlbfOJR4oJG53jk/muAX9f6yVA1pZjchnGCueNYdY+crLHdfmPatcx7dKFGr6s0/WpDSLLs0dc1Gv3TWKaEUXy3HUH+ACST1ny2uSKi66qDWQAZqNZS86LSd64E9oCKjquC1SRuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJ16wHQt7pT5vO2h0Ts+OBGKDNGW/2oDy6fKwIhQBxY=;
 b=OFnMBq3e76RG80RVCH6dzcxPUQf87xdgIYm7JlDoRtktIysXmS6unIkjHi2r+yM43oPWWotUTtaUTyIyfAF/YGYeBlZpL7oyFCHtEWQYZ+LAHgF8X6U9+71+7I9w0qFAkznzWfGt9lGEad1Eh04fufYLVl7QhYcBdFbqBKu0XFzPn2b2AzKoUyW2Upt+2lK2ybczqYjl/Grbfoj8g4AiOP7ArRUXFGTFiYFo1seu0/c1hdYJv8Sl0UqrbGPmxBAxwoZtz402+DCUB9mbvlM3e6nhC356rdIvtC23ny1aAMcyhFhQj8xwUCM1E0dM65IVIU0971pwBhaOkFmaLbbgxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJ16wHQt7pT5vO2h0Ts+OBGKDNGW/2oDy6fKwIhQBxY=;
 b=I1QMMC4+HTxrZ1f5BRDbCkXTR9sqBUXYqDKUwVxyKLbWCf6hBkksCdquD2XE56cLaLVmjPqHRAXz3lj637tBkByYaqX+Mnk3xqvI8U0VB1STudxrwy54OMYl9D1rY34bsZ9o399W6Pyynv33ObLeA/mGGF3cOFvdXaFj5kxEll6Bniv5Ve5k+CgrN3IhCIrUtQk3RpTzsKzTDlHvCr9Svm5YT/85Qh36A/HvDIXxZeytxEtlGeCtUadaA0COXfJAovB7L/d16XFse3ZRkpejl6s+2jFuhyPedieeMawDTxyP0vh98E0xylxHQgpV7aGRCzofoVBcp10RkvoOQa5paA==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB8PR10MB3179.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 20:28:20 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b%6]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 20:28:20 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 02/14] build: vscode configuration
Thread-Topic: [OE-core] [PATCH 02/14] build: vscode configuration
Thread-Index: 
 AQHZ1EouY1Ky+eS+70C2ieKwsOSzeq/1KpcAgAAesoCAAM0rgIAAmfiAgAAQHICAAAVCAA==
Date: Tue, 22 Aug 2023 20:28:19 +0000
Message-ID: <c8aadd00104fb9d62118090d94dfad9fe6eb5268.camel@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
	 <20230821161120.171956-3-adrian.freihofer@siemens.com>
	 <20230821215634.349b3509@booty>
	 <a76ad1f4279c33a470050da46395839096c3cf58.camel@siemens.com>
	 <CANNYZj83zUc6qAknx03Rc7cxW1ZgkCH5tiY_rW5ueMrdMNqbbQ@mail.gmail.com>
	 <a789650e141c502ed63e5002eab77a4e3cee31e3.camel@siemens.com>
	 <CANNYZj-zdUaGvPeS4juieXME2CLMwCRr1QFruZtZ361Xhi8SxA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-zdUaGvPeS4juieXME2CLMwCRr1QFruZtZ361Xhi8SxA@mail.gmail.com>
Accept-Language: de-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DB8PR10MB3179:EE_
x-ms-office365-filtering-correlation-id: 961f2c78-2128-478e-9d64-08dba34e5299
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kkRo5yvVK1ctAPERaX6pNjWYS6HaPuVqpM71oypk8r+H+fS+Ce1irzOf0xs1FJotWhYlHOrhov6h/DNHq6/B3Zebim87KI9wuoC5RPZvx2p7sm2tJlCOLD5Vs6lxMIgYF/Bj/3q+67e03QLOViBeBsDxEH5d4yNWnnYKASmJHgoU3cFwnrUdtK0+fkBSLoesr0Lbs+zqc7FsSDagA5t9agmYEm4OQvC+7DtnG2zr7HOkOUax6KjSXnx2/cXcdSEU3UlDTahv8CDhhcScPTz3roNOBdabDZUl0Zkyf4YdRx2oguI/kfMeNWCxCUj3EFBFbhKdovQMSC5PhX33yGxbVtsVM8nFv+szNwRDBzYMiIUA+8p9b05O2k4LkHcZ1GfsoLOemlzcM4gtTZqelB77+9BLi5uCM0UaGCp6tDZn/n9MtZBkoQVzq9x+tAfU9dtUzDOhEkSYfDg2CdD8tWRgaNad/sNzQ8bkAK4+ToM50RkPPALwdKvwpn+aXQGV0BhkY9tMpvCyVOOzQdKIqRHZZkpqLuKNgr1s2PgRN7/clqiCXAm5fZD4xg7xuQY9MuKK2Tfg2tnka4AjAbIcxOZ90ZLVUqsFZVAPjJGIdNZde2o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(1800799009)(186009)(451199024)(66899024)(71200400001)(6486002)(6506007)(2616005)(6512007)(8936002)(76116006)(5660300002)(86362001)(2906002)(4326008)(91956017)(38100700002)(38070700005)(82960400001)(8676002)(36756003)(41300700001)(66476007)(54906003)(64756008)(6916009)(316002)(66946007)(66446008)(66556008)(122000001)(966005)(478600001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y3JEZjdNRXU5eEVZcmdaeFgvdFZETllvNzRyN2I4dTU3YXFhRDE5QXN3cmo2?=
 =?utf-8?B?M1g2ZkJYbmJOOEZiRFpkRUt0N3FFbDNCNzZFbi9CRUJYbHRvbTdwdlhwaUJ6?=
 =?utf-8?B?STBGTDVTNUx0VHNMWDFrZzVBTnhCYzdmbHFVK2FjWjhFR1BJS0VxSW1XU1lD?=
 =?utf-8?B?VldPVHoxcjZZbEROSEIxa256eVlOWWhBOTJNalJhYkxiUmV1TFhhMTcwdFZD?=
 =?utf-8?B?aHZ5U1JSTDF1MWhobWpjdHVzV2p0K01GV3ZWVkxlOWVySkhkdWE4K3ZMZ1N1?=
 =?utf-8?B?cXliWEU1UHRCYWRsYlcrdDdvYWRzVk5iWnpqSnYvM2xNZTZVUUZab281YUlp?=
 =?utf-8?B?dFh4UnAxLzFKRzB2WW5OejdMc1BRSndlc24zc2F4NEpvZlBxZUREenlsZTFj?=
 =?utf-8?B?U0M3VEJmTlpDWldrM2Njclo3bGNhOFowS3FhczVvcHEwNVJhdGR4YVNZaU5T?=
 =?utf-8?B?ZDlNVUxQVXhsVUo1ODFWeXU0NG5vVmFGREVKM0ptb1N5YXptdkRuUHFKSlBo?=
 =?utf-8?B?RFNaTWtPWDhndXZCWGxoOTJuZ1NpMHZldUxCMlRlaitmM0tIaW51eWNZNjk2?=
 =?utf-8?B?Q3dWSWdrUytvazlnL28yTDIwb0NCQUFSV0M4QUVldXZ1dXp5bVZrZDYzSGZW?=
 =?utf-8?B?L2pzYjVleU9kcm1mU2RkQ08vK3hRL3NSN3pIRDJnMFFmNkVFSWpESXE4SThO?=
 =?utf-8?B?UWxWWm0wT1BqOGdHelMzcFlCQWxOT0FGQWllaW5lejlQYnlHeTZWdVZyK0Fp?=
 =?utf-8?B?Q2t5WjFWN3ZzZHpUY1k4eFBORU9PWW4xZG5yM01BRzFvWWR5WkdJbWZBVE1Z?=
 =?utf-8?B?RHpWRHVXd0RaMzRMVlovZ3ZYdUR0MFR5WnRLcGdxR05vMGJQcEp0WHdJbTJC?=
 =?utf-8?B?NGRPZUhSVHpGU0JONHg0TXBYY3RmeWpuMWt4dGxSSUtQUWNTQ0RnS2hydXRa?=
 =?utf-8?B?dTMzYmhDNFVHamNCUkFhL2tQdlhmUVE5T3l4cllWYXRFNXNRbmxxd1J0dm0x?=
 =?utf-8?B?aWovTHphV3d4MGxoZHZYUDBVN05LSXZ2M1BzcDMwQUIzaEdFa293S2NXRVBw?=
 =?utf-8?B?UXJ2LzZrR0g0LzNJNUd5V2VJa0oraE85dFQzYm01czA4RDFma1pBaURTdk8z?=
 =?utf-8?B?MSthOEtmV0drZ1U1UGtIOTg1TVluNmEycnpaUHZxRG9EOFM5Wnd3dml3VWUy?=
 =?utf-8?B?eGxFVjJLUHhWTjliMndobXRDQU0vVFJmbm5tZVRmRFE5VHFyWnJjaFdRYUJ6?=
 =?utf-8?B?U081MUVMdkMvSVlNQ2JSTHBVTFlKQ0trekhpY3lIS3dqZ0lRT2l3bno2YTQz?=
 =?utf-8?B?SUdqOXA1SWIyTVRSL3h4ZDZmd1ZuU2tPcW1LaWlKWjBKL242eUxoZWR5RGVi?=
 =?utf-8?B?TkxjWU43eHpEcHVweWRnNHpMVXRWOEJFbmYyb0YyWFVpM3lEaUdjY0MyOUNF?=
 =?utf-8?B?aEdKQndzWHkwcDlPRWMwOVBMSUoxVTUrZzJPVFlMaVBoZTFsOHRjYXJ0SUc1?=
 =?utf-8?B?eXM2Y3dPSjZiNTBUd1hjeUg4NmF2VVphSThqVTFmNm91YU9VQmkyaDBzU1Iw?=
 =?utf-8?B?bFJrOXJwVmtlNHJxeUJyNlUyYitybU14K0hhTklKOW9TU3JZcDdONWxYb1Bm?=
 =?utf-8?B?VjF6UXpDb2FWR0R2YXRWY3U0Wnk5cEdLaFp4eVZzWmxBeXdIaVk2VHZrSExt?=
 =?utf-8?B?UWJoVHVpRHkzcDZDcEpxRk1LUE1yaS9LUWxueFJhVHpVczlpVmxCWDZJN294?=
 =?utf-8?B?Q3BOOXp1N3ljanB6UDhYQVBrTXRTYXBjSlBrQzBUaHNFR0lzck8ydGFxUEM1?=
 =?utf-8?B?bEMvMzVJdnIrb3lKSnIxT1NsZVNXM3FWTmc3Wjg0UHlkSDRZb2dNRmg3cUFx?=
 =?utf-8?B?VHdCeTB3MU5GOVpkaDNLWXFkeXExalhVMzA1N2U0anhDV3ZaazlRWHlucTNk?=
 =?utf-8?B?TTgzTG5BRVVyaTRuUmFEWGhiZVJvSWF3VzFpNmU3V3IvaHU4QSt3YnNkQVNw?=
 =?utf-8?B?SzEyeHFuTjZodFJuNk1jM1J1UlpKRm4yNzVXUUhDTVFkMXlxekdvVitCWXVv?=
 =?utf-8?B?Q2IyelFPaithR0UzcHZsc2xpaDJKL0tVcitmK2JRQU90MmorMjYrSGxQM3Uv?=
 =?utf-8?B?VEhSSTBZVVlyUXdjakNNdlltL0lYcldBN1R1bExwdzBQQ1hCTkJOS3JqMU1a?=
 =?utf-8?B?YmI0cUN6UDJzUlBtcWZXYm5nL3ExMWFqRW1rampZNGM2eU03cEJLZURpL09m?=
 =?utf-8?B?RFc2dis0cjFSc1F0OUZaNDNPUzF3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B1EF4B6B528FA4C99FEAF1A8276DC85@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 961f2c78-2128-478e-9d64-08dba34e5299
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 20:28:19.1478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlgTOPusM3sqD/k93F51GoVI7HKU+duANO8Zik7Ezs0IcH/hbCCYlQ4qR6h83R5xmkbGnJzv7i+Wy4b8mtUfI1CwrI4xbh2MsYQ/tDA921g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 20:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186538

T24gVHVlLCAyMDIzLTA4LTIyIGF0IDIyOjA5ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVHVlLCAyMiBBdWcgMjAyMyBhdCAyMToxMSwgRnJlaWhvZmVyLCBBZHJpYW4NCj4g
PGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+IHdyb3RlOg0KPiA+IERvIHlvdSBtZWFuIHNv
bWV0aGluZyBsaWtlIHRoaXM6DQo+ID4gDQo+ID4gY2QgcG9reQ0KPiA+IC4gb2UtaW5pdC1idWls
ZC1lbnYgLi4vcG9reS1idWlsZA0KPiA+IA0KPiA+IFllcywgaXQgd291bGQgcHJvYmFibHkgd29y
ay4gQnV0IG1vdmluZyB0aGUgYnVpbGQgZm9sZGVyIHdvdWxkDQo+ID4gYnJlYWsgYQ0KPiA+IGxv
bmctZXN0YWJsaXNoZWQgc3RhbmRhcmQuIEknbSBub3Qgc3VyZSBpZiBzdWNoIGEgY2hhbmdlIHdv
dWxkIGJlDQo+ID4gYWNjZXB0ZWQgYnkgdGhlIHVzZXJzLg0KPiANCj4gSSdtIG5vdCBzdXJlIHRo
ZXJlJ3MgYSBzdGFuZGFyZC4gWW91IGNhbiBkbw0KPiANCj4gLiAvcGF0aC90by9wb2t5L29lLWlu
aXQtYnVpbGQtZW52DQoNCldpdGggInN0YW5kYXJkIiBJIG1lYW4gdGhhdCBqdXN0IGRvaW5nDQoN
Ci4gb2UtaW5pdC1iaXVsZC1lbnYNCg0KaXMgd2hhdCBwcm9iYWJseSBtb3N0IG1hbnVhbHMgc3Vn
Z2VzdCBhbmQgd2hhdCBtb3N0IHVzZXJzIGV4cGVjdCB0bw0Kd29yay4gQnV0IHdpdGggVlNDb2Rl
IGl0IGRvZXMgbm90IHVudGlsIHRoZXJlIGlzIGEgc2V0dGluZ3MuanNvbi4gSQ0KanVzdCBzZW50
IGEgdjIgd2hpY2ggYWRkcyBhIHN0YXRpYyBzZXR0aW5ncy5qc29uIGZpbGUgdG8NCmdpdDrCoGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2Uv
MTg2NTI0DQpUaGUgZ2xvYnMgaW4gdGhlIHNldHRpbmdzLmpzb24gc2hvdWxkIGNvdmVyIGFsbCBi
dWlsZCBmb2xkZXJzIHdoaWNoIGFyZQ0KaW5zaWRlIHRoZSBwb2t5IGZvbGRlci4gRm9yIGEgYnVp
bGQgZm9sZGVyIG91dHNpZGUgb2YgdGhlIHBva3kgZm9sZGVyDQppdCBkb2VzIG5vdCBoYXJtLg0K
DQo+IA0KPiBmcm9tIGFueSBkaXJlY3RvcnksIGFuZCB0aGUgYnVpbGQgZGlyZWN0b3J5IHdpbGwg
YmUgbWFkZSB0aGVyZSwgYW5kDQo+IG5vdCBpbiBwb2t5Ly4gQXMgbG9uZyBhcyB5b3UgZG9uJ3Qg
bGV0IHVzZXJzIHJ1biBvZS1pbml0LWJ1aWxkLWVudg0KPiBkaXJlY3RseSAoc3VjaCBhcyB3aXRo
IHVwY29taW5nIG9lLXNldHVwLWJ1aWxkIDopIHdlIHNob3VsZCBiZSBmaW5lPw0KDQpZZXMsIHRo
YXQgd291bGQgYmUgbmljZS4gQnV0IGl0IGRvZXMgbm90IGNvdmVyIGFsbCBwb3NzaWJsZSBjYXNl
cy4NCg0KQWRyaWFuDQo+IA0KPiBBIG1vcmUgcmFkaWNhbCBpZGVhIGlzIHRvIGluZGVlZCBwcmV2
ZW50IGJ1aWxkIGRpcmVjdG9yaWVzIGZyb20gYmVpbmcNCj4gY3JlYXRlZCB1bmRlciBwb2t5LyBk
aXJlY3RseSBpbiBvZS1pbml0LWJ1aWxkLWVudi4gSSdsbCBiZSBldmVyeW9uZSdzDQo+IGZhdm9y
aXRlIGJsYW1lIHRhcmdldCBhZ2FpbiBmb3IgdGhpcy4NCg0KDQo+IA0KPiBBbGV4DQo+IA0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxODY1MzcpOg0KPiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdl
LzE4NjUzNw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC8xMDA4NzYxNDgvNDQ1NDU4Mg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsNCj4gYWRy
aWFuLmZyZWlob2ZlckBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
DQo=

