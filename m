Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D37EE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:11:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.59])
 by mx.groups.io with SMTP id smtpd.web11.5022.1692731514232649905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=wIblp3F1;
 spf=pass (domain: siemens.com, ip: 40.107.8.59, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbI/l0/a+/YhnuYNIPzKGIFaAvUsqj/dBxLYVAf4bpR3EMbDMTN4nfGLF+UbHLqH3GDbSy6UhC+3lde/xMik2Z8rMQhNreGDYdu3DcZA2rGjwPCWn0ly0cvs8ywpnvyFZTVXmVKqjS3XZnVcPH88sVMLMPFV9bLKVhWvDWqESReGoDZTIhAiNsnAF9AJFRJqU5nxwgUpiapiw3eIR4c9PX01TPQ/PWXQ0m6dGLEaFFBMiPUgWH7mVYCvyO7Y8lTpywtLB9qjqRKeyDrO0hJtV+aRMH+DgGYCUbSWcB+m7NFg81lHw5Z2P+qWxr8Gku8yYqZHSuyyhjbY7WY8JFA1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+cFYfI5YSHXUK+nT1XtxjI+Y3w+XG9XDWAuIqwXz94=;
 b=CLGIn4akhhbHo/QuDO6jCvVdDjJVeDNciTCMT1ln1zWCFg3QLavHkitZaKFw/P7fk1XCYtucRM1Npb45s5emsS29zy6MrVqVIlrHaws29a4L9V1QxZ6sATNFN+V9VNH058mknGBYn4P3GKc4a+cLyRnT7MpXxNx3dgWBf6yPK4Idd5l553QABPEDvv6CoVYmNknZxQvfZ6juqmcJUpf5Q9n14lTi2pXuuazTVIlcriMJgj+ZglnweZ+wO0B/CvwgCj3K+38lqdDHbpEwf7dLGDqg0nW3evElic4YMmHp/FooaJus6NPayBjoI13uOuD/rfkN2wE1MmOTglsmhHKXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+cFYfI5YSHXUK+nT1XtxjI+Y3w+XG9XDWAuIqwXz94=;
 b=wIblp3F1H6SIOSNlELVUoHS3fozG9eHn7PoMjWwssz1baJr86Y/byYed7XfiKKk2b4DVENc6z3gzajMpwLVKrvo6pHcXmEHpfxkBNnZOuwtVbF+AgjjW9HFDCPODGa07F8w9udrN5aWL36SfTq5cVymaZgesIwbbRHk2CLmwb4SDbW7UxXv4tNt/grwYStoUe9ZCjE4zdnOoM9GuqMJWYZaibw7gK8XUjdEL82QPonPczZ1+axgl5zZCWF50q5BrqZX3V2+Lfa+AxoljovoPPZriOwXUbo2w4bm6qut5WLsfyvs4axoGLNt3FPZFT96L1fHlYZAvmR1so1TtcEZZHQ==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 19:11:50 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b%6]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 19:11:50 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 02/14] build: vscode configuration
Thread-Topic: [OE-core] [PATCH 02/14] build: vscode configuration
Thread-Index: AQHZ1EouY1Ky+eS+70C2ieKwsOSzeq/1KpcAgAAesoCAAM0rgIAAmfiA
Date: Tue, 22 Aug 2023 19:11:50 +0000
Message-ID: <a789650e141c502ed63e5002eab77a4e3cee31e3.camel@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
	 <20230821161120.171956-3-adrian.freihofer@siemens.com>
	 <20230821215634.349b3509@booty>
	 <a76ad1f4279c33a470050da46395839096c3cf58.camel@siemens.com>
	 <CANNYZj83zUc6qAknx03Rc7cxW1ZgkCH5tiY_rW5ueMrdMNqbbQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj83zUc6qAknx03Rc7cxW1ZgkCH5tiY_rW5ueMrdMNqbbQ@mail.gmail.com>
Accept-Language: de-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|AS1PR10MB5675:EE_
x-ms-office365-filtering-correlation-id: d372a866-8bce-451c-3d63-08dba343a370
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bvtC9bxHIrRuQG4CoBkMd/7nYgnSWJ0x/iTTPHfO6n1yX5XTYh5UEmlu04dyQ4eI1CZpDBUlu09wIvZlhH59hUAjAbDyPop5MSm96afD924QxLsap724Nx74QCgesE2fTCF1D1p7kbIWWc18yua5iQrggp3nSwL8036zXHFPobTTMs1yGt8iJ/ql/H6GzdmbXSrXR8WUC0O4nfSyJ40xwU6Z8FpkEDiEVjmbcI0+o6ZUd8sNjZSYkFSyFfDY0EJSxOkjIVUl4LXjRRrVcFsmgqIXCHBm5DRavmLMSGp7DvKlIU9nCTjj+4L+ljuFQ8uCj3d1ajBU9KB8v/UR4GTd7xj8egRd1FeMXkM0P5b8rIfJscdg8otiK+Lc42UByxxtURRWYtQrf58zBgwCClsV6BsO4pThGLKgVMVRHVp//hFlxurms50XqEzGFp72rIcVh9VqNdIbU0QIyRuLoXoWjNGeai6capF21RWestMUn2WK4KFjoArFmyxyQ6UsjWKIi+1Oj6UdOR6pHXgcksQ+5SpkfGg1NNSaYjDctQ+rTH+N9yFwDMql5OSUpNnqyQ429EoteeEcwOgAbWrb7rS6uGIj6F0jCBQEumh9kyY7QtE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(2906002)(38070700005)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(86362001)(8676002)(2616005)(8936002)(4326008)(966005)(316002)(66946007)(64756008)(6512007)(6916009)(54906003)(76116006)(66556008)(66446008)(66476007)(91956017)(66899024)(82960400001)(478600001)(122000001)(71200400001)(36756003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UjhhMnFpY3A2UkRUUXpSMEpHajlDL3V1QUNqRUVIOWF5OFBnem5xaWtmMm9X?=
 =?utf-8?B?OEpEUC9iYmZZR1RodnIwQ0ZEcFMzMytScGNBMW40ejJ3RmJWN2xDbmR4NEV4?=
 =?utf-8?B?SStjV3dyK1NjM0Vwa05NcURYV2c5ckwxbmc2WmhJdWJoSHZXUndFaW5ZNEd6?=
 =?utf-8?B?V2x3dXJ3U1BIZDRPTnZBdHB3MHRDeTh2c0daNnRFTDdNL09BbTJOM0s5aytI?=
 =?utf-8?B?d3dRd3I1MG03bkQwM1VJK1A4YkROWFNEK2pjanUwQWRwWEd4Q2l6UTBydlFn?=
 =?utf-8?B?Q0Nha0ZzMVE4c0pBVjNRbkhQbFJycWFoQTRSeXRDRzIzVmVqaWpCWDNyZ21W?=
 =?utf-8?B?TXhnYTNNSUZvY3JZZkVwd2lUY0s2dUJMMEVVWm9EeVZrRkhGYTIxT3krTXcv?=
 =?utf-8?B?UFMxcFhLY3E0LzlqQ05uM1pUWFJQZ2h2WDRIVDQ1UUphUXgzR2JqOHM3Ulo3?=
 =?utf-8?B?ZU1sMWNMWmFmd3lmUUFBUGEvdHNpejNNSXVQajBnUDdXVzkvbDhkVmRtL0JB?=
 =?utf-8?B?Tm1OVmM1ak5mNHErZEgvY2preW1TSnNpbFRZS1l4aWduT083WDlLb01qaVNi?=
 =?utf-8?B?ZHhDWmhuQ0Jmb3hlZWIrTFYvSUZRVitRTFROU2R6cjdWeXo5b3ArTXV3Z09C?=
 =?utf-8?B?ZnYzb0J2aFJhVkE0Njc4OEFNT3grcDNFM0RzMzFqUU9mSTR1cXovdDBQYzd4?=
 =?utf-8?B?a0ROQjhZbGxMOThIQ3dTM0luRzUwenVjb1FZRjdqS1pZYjdEOXl0ZldKeVBl?=
 =?utf-8?B?VlZJRlpReW96UWZJeHE5bjkvMGRMSnB4YlVHYkFtK2NycytDYnQ1NUhCU0pZ?=
 =?utf-8?B?aDFLaDJUM2FGU2lUcWovK0VjVjRIbThmdmppNTVXbHBZb05iWTd6VVVSS01x?=
 =?utf-8?B?RUhnb3dhai9JV05jR1E1Z0RjMFFPT3lHbHMzYU5Hek5SUEJhUmxSYWVyQkIv?=
 =?utf-8?B?M3pNOU5KNkRLeE1rZndnWS9mVDlyRDg4d2VLR2JlR1FUWUUxOXJQeCs0OWlV?=
 =?utf-8?B?YThCOEU0RFNVQmhjVW9BcTZoQ2lCUFZDNXVDU0FUV010VEh0SmdsOUJNYTJH?=
 =?utf-8?B?SzBKWEhGUGNReXlRWS9Jb1ExU3Zjd2VDY1RTUHJRQ0g4eWFpTHpoZDNOTW1y?=
 =?utf-8?B?czRtV2I1d3J0eWNIa0xQeGpQRElzaDdXTUZiWHhMeHEzQXc1bEtDTnBlZ0lo?=
 =?utf-8?B?Lzl3bnRIVjNEMzJaQ3ZhZzM3RXgwQXFjdUQzeVZJZG84N2hjL2psUFhxQ253?=
 =?utf-8?B?ZWhON21NQzcvSTZZSFVVUXAzODM4aERwZmt3a1ZKTlZ3c3RXSEpBQlJQdGpN?=
 =?utf-8?B?T1dhZTB4RnNubmdBaXdGbmRBQlQzbCtFeDREY3FwZFJVL2JudDdIeUNaRkVl?=
 =?utf-8?B?WG9mL09Wb1VZZ1pxUGR4OHlYb0FMTTczWHdDeDdjWWtnUERaNGdSYU1sT211?=
 =?utf-8?B?a0Y5R1RnMDhqOHN2clVEVEhpUExJVExIdmR2ekJKSnIzcVhRY21Uc29CSDdH?=
 =?utf-8?B?emYrbktwYU5oa00rK3hDRi95STBmZEdXMzhwK0UwZWFQU0VLTWMraG1ZbWNF?=
 =?utf-8?B?aWJ6elVwajloQy9JbkE4di9sWVp6d25nY2hBNVFKVlhVWlBCcXVzakJ3UjUw?=
 =?utf-8?B?eWFFM2w2cFNub3NWa0NlUVZQZnRpM0dpRGp1VkxyQlRhOVplc1FOc0tPcVhE?=
 =?utf-8?B?bkRucEFHM1IrRkVmMm95SEZWeTZPMXhEK3FiTnUxSWo5ZTFaWGlJLzE3eEti?=
 =?utf-8?B?Q0JIMmNPRnI2VEJMdFcxVWtXM0pNcmVOUUEvSHNLcTk4dXB0R1kxQlN6Z2x4?=
 =?utf-8?B?NHZkb25heHROMTNZYlJidWhQOHlmUHpjbWs0LzRaVTc2TjUranNOUzg4N2tW?=
 =?utf-8?B?MDBNM2Z0UnZPaEdFcE01bWlEYVhNK1ZOdGpUMEtxb0RBRFBNa2R2Rks3SVNz?=
 =?utf-8?B?YjJMVEZZMUZjWFFWaXRYZWNqdm1ZS2t4SnA0YzBpWG1mTktrTEVTTWZocnhI?=
 =?utf-8?B?UFVaSWxLbWVwdEVMaWxjMHIxbkxYakpYQ244NER4NXo3SGFzMlRYQkx2RnRp?=
 =?utf-8?B?bTh2SzNXNk1INjZ5ZFlYRGZHSG03dkVjWkdob2FzLy8zKzFROFhndit0b1pt?=
 =?utf-8?B?YlhScGsycjFRdUFobHFLRkdpMmFvaDUxdW9NeFQ3WU8xM051cFUxM3BsME5s?=
 =?utf-8?B?NkUwb0l6SjFKSzhIc2tjbWdOd2x0YXJaSjlwQmRma0t6TnNKYk05VGgxM3pJ?=
 =?utf-8?B?MmJNY3hUWFVUSWU2TjBqOGNFbDhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B908AA5C901A4B45B84125FA0238839D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d372a866-8bce-451c-3d63-08dba343a370
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 19:11:50.2760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o6slhKN5D7XLos8HKdaar4XZXhzXyfBaGqcunvJJPXl5/4sC9FaICTzDqIf/rk4rjJ2va8R1nSIxQI/WTSddPrYL54QS/GsA/G08Aq0aRMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186522

T24gVHVlLCAyMDIzLTA4LTIyIGF0IDEyOjAwICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gSXQncyBwcm9iYWJseSBzaW1wbGVyIHRvIGVuZm9yY2UgdGhhdCB0aGUgYnVpbGQgZm9s
ZGVyIGlzIG5vdCB1bmRlcg0KPiBwb2t5LyBpZiBJIHVuZGVyc3RhbmQgdGhpcyByaWdodD8gSG93
IGlzIGl0IGNyZWF0ZWQsIGFuZCBhdCB3aGljaA0KPiBwb2ludD8NCkRvIHlvdSBtZWFuIHNvbWV0
aGluZyBsaWtlIHRoaXM6DQoNCmNkIHBva3kNCi4gb2UtaW5pdC1idWlsZC1lbnYgLi4vcG9reS1i
dWlsZA0KDQpZZXMsIGl0IHdvdWxkIHByb2JhYmx5IHdvcmsuIEJ1dCBtb3ZpbmcgdGhlIGJ1aWxk
IGZvbGRlciB3b3VsZCBicmVhayBhDQpsb25nLWVzdGFibGlzaGVkIHN0YW5kYXJkLiBJJ20gbm90
IHN1cmUgaWYgc3VjaCBhIGNoYW5nZSB3b3VsZCBiZQ0KYWNjZXB0ZWQgYnkgdGhlIHVzZXJzLg0K
DQpJIHdpbGwgc2VuZCBhIHYyIHdpdGggYSBtaW5pbWFsaXN0aWMsIHN0YXRpYyBzZXR0aW5ncy5q
c29uIGZpbGUgYWRkZWQNCnRvIGdpdC4gSXQgY292ZXJzIGFsbCBidWlsZCBmb2xkZXIgdW5kZXIg
cG9reS4gSSB0cmllZCBzZXZlcmFsDQpkaWZmZXJlbnQgdGhpbmdzIGFuZCB0aGlzIGxvb2tzIGxp
a2UgdGhlIGJlc3Qgc29sdXRpb24gdG8gbWUuDQoNClJlZ2FyZHMsDQpBZHJpYW4NCg0KDQo+IEFs
ZXgNCj4gDQo+IE9uIE1vbiwgMjEgQXVnIDIwMjMgYXQgMjM6NDYsIEFkcmlhbiBGcmVpaG9mZXIg
dmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGFkcmlhbi5mcmVpaG9mZXI9c2llbWVu
cy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gDQo+ID4gT24gTW9uLCAy
MDIzLTA4LTIxIGF0IDIxOjU2ICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPiA+ID4gSGVs
bG8gQWRyaWFuLA0KPiA+ID4gDQo+ID4gPiBPbiBNb24sIDIxIEF1ZyAyMDIzIDE4OjA3OjA1ICsw
MjAwDQo+ID4gPiAiQWRyaWFuIEZyZWlob2ZlciIgPGFkcmlhbi5mcmVpaG9mZXJAZ21haWwuY29t
PiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gPiBUaGlzIGlzIGp1c3QgbXkgc2V0dXAuIEl0J3Mgbm90
IHN1cHBvc2VkIHRvIGJlIG1lcmdlZCBpbnRvDQo+ID4gPiA+IHBva3kuDQo+ID4gPiANCj4gPiA+
IElmIHRoaXMgbm90IHN1cHBvc2VkIHRvIG1lIG1lcmdlZCwgY2xhcmlmeWluZyB0aGF0IG9uIHRo
ZSBzdWJqZWN0DQo+ID4gPiBsaW5lDQo+ID4gPiB3b3VsZCBiZSBuaWNlIChlLmcuIGFkZCAiKioq
KiBETyBOT1QgTUVSR0UgKioqKiIpwqAgdG8gbm90DQo+ID4gPiBvdmVybG9vaw0KPiA+ID4gdGhh
dCwNCj4gPiA+IGFzIHdlbGwgYXMgbW92aW5nIHRoaXMgcGF0Y2ggYXQgdGhlIGVuZCBvZiB0aGUg
c2VyaWVzIElNTy4NCj4gPiANCj4gPiANCj4gPiBUaGFuayB5b3UgZm9yIHRoZSBoaW50LiBJIHdp
bGwgdXBkYXRlIGl0IGFzIHNvb24gYXMgSSBnZXQgbW9yZQ0KPiA+IGZlZWRiYWNrLg0KPiA+IA0K
PiA+IEJ1dCB3ZSBzaG91bGQgcHJvYmFibHkgZGlzY3VzcyB0aGlzIGEgYml0IG1vcmUuIFdoZW4g
VlNDb2RlIGlzIHVzZWQNCj4gPiB0bw0KPiA+IHdvcmsgb24gYSBtZXRhIGxheWVyIChlLmcuIHBv
a3kpLCBzb21lIGluZGV4ZXIgcGx1Z2lucyBzdGFydA0KPiA+IGluZGV4aW5nDQo+ID4gdGhlIGNv
ZGUuIEluIHRoZSBjYXNlIG9mIGEgbWV0YS1sYXllciByZXBvc2l0b3J5LCB0aGUgYnVpbGQgZm9s
ZGVyDQo+ID4gY2FuDQo+ID4gYmUgdmVyeSBsYXJnZSBhbmQgaXQgaXMgdmVyeSBpbXBvcnRhbnQg
dG8gY29uZmlndXJlIFZTQ29kZSB0bw0KPiA+IGlnbm9yZQ0KPiA+IGl0LiBPdGhlcndpc2UsIHRo
ZSBwbHVnaW5zIHdpbGwgcnVuIHdpdGggMTAwJSBDUFUgbG9hZCB1bnRpbCBhbiBPT00NCj4gPiBl
eGNlcHRpb24gb2NjdXJzLiBJbiBwcmFjdGljZSwgdGhpcyBtYWtlcyBWU0NvZGUgbW9yZSBvciBs
ZXNzDQo+ID4gdW51c2FibGUNCj4gPiBmb3Igd29ya2luZyB3aXRoIFlvY3RvIHVudGlsIGEgZmls
ZSBsaWtlIHRoZSBvbmUgYWRkZWQgYnkgdGhpcw0KPiA+IHBhdGNoIGlzDQo+ID4gZGVwbG95ZWQg
YmVmb3JlIFZTQ29kZSBzdGFydHMuIEFuZCBmcm9tIHRoZSB1c2VyJ3MgcG9pbnQgb2YgdmlldywN
Cj4gPiBpdCBpcw0KPiA+IG5vdCBvYnZpb3VzIHdoeSB0aGUgc3lzdGVtIHJ1bnMgYXQgMTAwJSBD
UFUgbG9hZCBhbmQgZXZlbnR1YWxseQ0KPiA+IGNyYXNoZXMuIEluIG90aGVyIHdvcmRzOiBJZiB5
b3UgZG9uJ3QgaGF2ZSB0aGlzIHBhdGNoLCB5b3Ugd2lsbA0KPiA+IGhhdGUNCj4gPiBWU0NvZGUg
YXMgYSBZb2N0byBkZXZlbG9wZXIuDQo+ID4gDQo+ID4gSXQgaXMgZXZlbiBtb3JlIG1pc2xlYWRp
bmcgdGhhdCBWU0NvZGUgc3RhcnRzIHRoZSBpbmRleGVycw0KPiA+IGltbWVkaWF0ZWx5LA0KPiA+
IGJ1dCBkb2VzIG5vdCBzdG9wIG9yIHJlY29uZmlndXJlIHRoZW0gd2hlbiB0aGUgaWdub3JlIGxp
c3QgaXMNCj4gPiB1cGRhdGVkLg0KPiA+IEluIHByYWN0aWNlLCB0aGlzIG1lYW5zIHRoYXQgZXZl
cnkgdGltZSB0aGUgaWdub3JlIGxpc3QgaXMgY2hhbmdlZCwNCj4gPiBWU0NvZGUgaW1tZWRpYXRl
bHkgc3RhcnRzIGluZGV4aW5nIHRoZSBidWlsZCBmb2xkZXIgdW50aWwgdGhlIE9PTQ0KPiA+IGV4
Y2VwdGlvbiBzdG9wcyBpdC4gRGVwZW5kaW5nIG9uIHRoZSBzeXN0ZW0ncyBPT00gaGFuZGxlciwg
dGhlDQo+ID4gZW50aXJlDQo+ID4gYnVpbGQgbWFjaGluZSBtYXkgY3Jhc2guDQo+ID4gDQo+ID4g
UGFydGljdWxhcmx5IGFubm95aW5nIGlzIHRoZSBQeXRob24gcGx1Z2luIHRoYXQgaWdub3JlcyB0
aGUgZ2VuZXJhbA0KPiA+IGlnbm9yZSBsaXN0IGFuZCByZXF1aXJlcyBhbiBleHRyYSBpZ25vcmUg
c2VjdGlvbi4NCj4gPiANCj4gPiBIb3dldmVyLCBwdXR0aW5nIGEgc3RhdGljIGZpbGUgaW4gcG9r
eSBkb2Vzbid0IGxvb2sgbGlrZSBhIGdvb2QNCj4gPiBzb2x1dGlvbi4gRGVwZW5kaW5nIG9uIHRo
ZSBzZXR1cCwgdGhlIGNvbmZpZ3VyYXRpb24gaGVyZSBpcyBub3QNCj4gPiB2YWxpZC4NCj4gPiBB
IGJldHRlciBhcHByb2FjaCB3b3VsZCBiZSB0byBoYW5kbGUgdGhpcyBpbiB0aGUgYml0YmFrZSBw
bHVnaW4uDQo+ID4gQnV0DQo+ID4gZXZlbiB0aGF0IGxvb2tzIGtpbmQgb2Ygd3JvbmcsIGJlY2F1
c2Ugd2h5IHNob3VsZCB0aGUgYml0YmFrZQ0KPiA+IHBsdWdpbg0KPiA+IGNvbmZpZ3VyZSBvdGhl
ciBpbmRleGVyIHBsdWdpbnM/IE90aGVyIGlkZWFzIHdvdWxkIGJlIHRvIGhhdmUgdGhlDQo+ID4g
Y29uZmlndXJhdGlvbiBmaWxlIGdlbmVyYXRlZCBieSB0aGUgbGF5ZXIgc2V0dXAgdG9vbCBvciBz
aW1wbHkNCj4gPiBjb3Zlcg0KPiA+IHRoaXMgdG9waWMgaW4gdGhlIGRvY3VtZW50YXRpb24uDQo+
ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBBZHJpYW4NCj4gPiANCj4gPiA+IA0KPiA+ID4gTHVjYQ0K
PiA+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91
cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxODY1MDApOg0KPiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE4NjUwMA0KPiBNdXRlIFRo
aXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDA4NzYxNDgvNDQ1
NDU4Mg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsNCj4gYWRyaWFuLmZyZWlob2ZlckBnbWFp
bC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

