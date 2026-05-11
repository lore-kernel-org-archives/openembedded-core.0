Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766CECD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 08:07:03 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45400.1778486814094988726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 01:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=igYnjh9B;
 spf=pass (domain: ericsson.com, ip: 52.101.84.66, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc4Zn6yd16oZjrMT3N4lXG/YMkKb8MABWooOHDe9wm0ERA0KBhTezBqgLDtxRIeY4bI1CSrZb8Q4k5Hr8OyxD3NxO8LaQX3gHhQez3dQ9V+sZuENi4zHyk1mi9UQ1BydcDSqfHBmwT2YxI3IN5PfNo4hI1twgokB1yVpTdXOb/xy7IMVH2SjZZB0pCcXdxX94d7ExAV3WUaqsNNEBNACYXRkPaVsm96YmmusviouJfpsUpLBhfa3cHHNP1XD8ZDaQFG0UqvKaTt2xRHEwIaG6KrUBbDqzti7PEEjfHspgT6muSiIn73WIXaeZHmYGDDKlv591pacrwqT55TQg9MX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE0AftZlUxjrr43mkiv/ARTkFqponiYYvFPI1tJwAkg=;
 b=It0Pd22zi6JKreVm6eoOrQQMOww/5oxF4NKAM5MzO/RvpLmNrqDux6co6Jr+8DyJnVFH/EJIhk9X629CK4mOtaaQs7DpZU3DiYF3ihpWaXT+dX37AOg13AgzM7JmqJGvTHXBOZgH1BUjOKN53WvUrA4HYdxYHSCsKE9rqseae+WVS21UsxQ3WuIaKEHyQG3s3f5lfWtawVlQSC5f+SmLciKdTxWep3CcIX2QrhJ8+I0oXcr8yp9x/G6toi9QaazSC3o1xvziTaY5MS8Q8as8SCch9DyoGGOac/ppwxTYU5LV7Jknc4g/Nhuq4OkiccDmXAxwL4xAxN+LnNtHl/j7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rE0AftZlUxjrr43mkiv/ARTkFqponiYYvFPI1tJwAkg=;
 b=igYnjh9BeHSzKMsEwz9yjRlwrchxLA79K+tSZ0xEbIsvbbAuGYkqOR1yscou1QNGmwPeDRqawCw1ImrSG7IcwxHOcC7/E3iepkiTLE0npCnI+bWdBENngeAVm94STXycVr6DWlmj2M0N0YsLNcCBrjY/7LzGI1URZtABM/vv5tueKG82dK4N/DjY2ZVHE5oNQDbfXy3C2WWSozfZXZvk3UYenjA6M+DWmla1ENFuJpg5cdGaCm28Slhf82tWsBY1j+bF+/IehzNJAUtMW/Spw8gBO20GO02TaKFisoHcZ6J/LBMxwQowgN1dkP4Noqh45eVaLmAKH1gg1UWEmQF4Ww==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS2PR07MB9519.eurprd07.prod.outlook.com (2603:10a6:20b:64b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 08:06:49 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:06:49 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "trini@konsulko.com" <trini@konsulko.com>, Paul Barker <paul@pbarker.dev>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
Subject: RE: [Openembedded-architecture] What to do with vim in
 openembedded-core?
Thread-Topic: [Openembedded-architecture] What to do with vim in
 openembedded-core?
Thread-Index: AQHc3u7EOpIL5FSYZUmf0o15g0W1sbYEgSqAgAP6P/A=
Date: Mon, 11 May 2026 08:06:49 +0000
Message-ID: 
 <PA3PR07MB10721F0DFCA5DC39A8D55DF4A8A382@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
 <20260508191857.GE1858239@bill-the-cat>
In-Reply-To: <20260508191857.GE1858239@bill-the-cat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS2PR07MB9519:EE_
x-ms-office365-filtering-correlation-id: 0d6c24fe-543e-4701-118c-08deaf344109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4133799003|22082099003|56012099003|38070700021|18002099003;
x-microsoft-antispam-message-info: 
 o9BevCxRGtDg9X9Mqb4Y/iufojHNEzUgKbvjCaCukmmk1ABU9eGux2YWDzAmMhP/9xe2UyV/G7/5h1d+Qs5qzYf+ePALcTgPzpAuj5hndcZjB6FYBoC9JL+G/uwfJUrD2Fl7VOhe/MHZzPNpN9tO8IHJevlJPxyHkEkq59gsBCelppIqjKm4wZzImG+1esAyphku0Agmw9FvzoB6LBDY377kdw7Buv4iPwqaNaWDstIOs3jR5kLMtyIOs9mYS5Hi8EvbGnLgqp1/HKZUnKLRAAhJQwoTirvyBqUBsA0K7C19oB/cDKt+nFDeJ/rmdd5r9i3vpRqRIYv+cD0RTl7eH2tXVK/T/Nbl9KYx2HLc01bNPHgzn8gduD23siN2EPCUQu2VAJ4vCugitfGP6748a7D53uvo8Z/bJ05mB4FfFscGBrwTJNcdF5Tv7XgtYZyAvhXTiHY31rHhwnUR4pFi7VAoYgSCJAH7/z1PMlNDXwimQ4alpLT7Voac7NKFjxs6V9oudJMtksNIly8SoE+uqy1zdUlRcPCRtntO5v/cbxm+q/FMFQh8XYgfRBs873HkQIB048SI0wXLsIMx8mP9uNwUdbHGBnekn+XLbJY0eQtWIsplZR8ave9oXiwdT3sPuQOJrt+sUmB1D+gMx3ZhZznCEqhzeCN3uk9sRT/YszRP86F6DOIwuPXtbgST7Yi3f060RmLNlfmu+1Qy9JqimDhJN8kLxKCJ8rSZ/7RG+y1VJ3CEc+oz2v2qe8RfHEbt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4133799003)(22082099003)(56012099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TDh2WjEySnliVzhoaE5uMDFrUWpLS3YydGptek1LbkZSdXAyR3E5U0ZvTERH?=
 =?utf-8?B?RjRVTGlPb2FDM0wxTmV2aE9teitEY2VEQkZmcXBKUW1USXc0SVNvcndpdjZn?=
 =?utf-8?B?bFJBeVI5MDlnNUpEeEdZeXNMc0tXeG1CUnFBRlhwNCtrelVINnpPT1FuSlhk?=
 =?utf-8?B?S0cydHBpMnNyaTY2QTVUSEN2YXRyclgwK3RZR21za1d3U0hUOHRiTU9BWjVT?=
 =?utf-8?B?Q3pRZG5PaHl6ejUvNzBtWHAwallmTVNkTm1VZU03SFRPbndEMzlteG1za2Nt?=
 =?utf-8?B?VnVybGt3bmFORC8yQ1o4aktGUXdPNGF1a28vSktXaHVUaXdvYlNXY21PL25m?=
 =?utf-8?B?bmFhd0FFamxNZ0VDQ3pWMWpNbXZHVENLU2gwL0NEeUdIOHdOZnZya3ZIU0FQ?=
 =?utf-8?B?ZWo0YVBUUUNoY3lkempaa0xvMUg2VlpKalFGMTY5b0htSW9NS1BJMUd6SlR6?=
 =?utf-8?B?eDFrQmV3UEhLSzhpRmtCSEw5cVVZNVBEUmZvMmVGUENxL2YxWnloZ2hoQmZi?=
 =?utf-8?B?TkpOK1NxRnl2dHVVQU9ZbjNtUTU3a3pkSnhCVzU4UXBwTXBSS0RST1JPRito?=
 =?utf-8?B?Sk9vUkVnbTZQNkVDcHBBcm9hTTZXaEZSa0hqTXJ6czNCaVdYend4VFFLSTRl?=
 =?utf-8?B?cXBmc2tERDdUYWdxNVk2OXV3MHltRWtOL285VStaL1FmOG0rZ2RadUw2dlJO?=
 =?utf-8?B?TFRTdWZCYmdzVE1qY2lObEk4dFI5T3puamJTNkZlUmR4cm1sTHBTWmtWdERF?=
 =?utf-8?B?Z3VtL3kydzR5Ui9yQWUrSUdIRHpmWm9IaGs1cHNjQklEOFJQaXJMS3NZT011?=
 =?utf-8?B?SnVEdXhLaG5uV09NcHM0ZERXYUxOanNZZHRwTC9Ea1g4MVo3bHc3MGVHTjJH?=
 =?utf-8?B?MFFlR3VuUFBReUhYV2Frdkl5a3ZTY3Zxa2dyT0J5cHd3TFBSZm5JY0pPZldG?=
 =?utf-8?B?VHY2RlpnZngweTh2cmNreXRsb1JiVy84NVZSckFZY3ZUcDBKR25rOGdnMUtO?=
 =?utf-8?B?NXJqOWhUbG1CSHo4Q0RuZGhZUTdNaWxQQi9VK3Y4RDE4SmthdTN2RWozZmFi?=
 =?utf-8?B?c1dWKzNhUWZ3QzltUjNJc1V4a3NBam83MmxyZHUrY25QYi9MeVZ3S1d2elNT?=
 =?utf-8?B?MFMwSmcyUWNENXdjSVNyTDd2N003SDVuUnlvQ2E0cHd4RUtXdjlLODJ5UHBI?=
 =?utf-8?B?NVFaVG9NKzVnbWRNSlV2MFhwcHB4dkRxYnJPK0dlblJ0b2NycVkzaW9IY1BM?=
 =?utf-8?B?T1hDTzNKeXowMTZDc1QxcDdjU09BckhrK1lDb3pPVXRTL1pBTi9KSWV1djdv?=
 =?utf-8?B?ajlmczVQbGswQS9RNVhMNmJIZVFlT3dRcW1wRWNJSGdHM0RJKy9id3dXY3h5?=
 =?utf-8?B?N0tNeXVUTXJYdTNlY1owd0UzdG43R2NCdWR5V0tqY1pCZ2l6Qm1PbC84Z1B1?=
 =?utf-8?B?N25OblMydWhrcmY0cldUc0ZSdVhNRU9NTlpIMzRCYXNXbjltVmpPMjVWcjJB?=
 =?utf-8?B?V1FhVTBHT2lsSlpCQVFIUUtuVGQ1amppS2hUZGtwWUlvNXZXZ3Z3UUs0TUpk?=
 =?utf-8?B?SnJEbG9tN2xOUngvTXlMT3ZrVDJ2VTE2NXp6eGQrVHNwRnUzNmI2YjI0THRG?=
 =?utf-8?B?eVc3WnY0MzBMR2t6VmQ1alhqWEpFWElHQmk2NHhzVndLR200c0pSai9UTm96?=
 =?utf-8?B?WlVDZnVNb0RkZkl0WVVDSnZ5UkFBWjdkZGNMU2pReUQ0alIxZWYyam1kb005?=
 =?utf-8?B?L1o3anErQWgzSUdjZFkvNVVaRE8yMUxrVC9pRHhqWDFWeTFGV3NpNTllU3Rh?=
 =?utf-8?B?SDI5ZGRBY2JzRVo2eTJYN1RtRC96Z2RXUlVrWmUwZkF3aDR4eXdBT2JjVnNO?=
 =?utf-8?B?OXpBUjB3OFl5RHJITHhOT0U5Y0NscXJHeDR5TTduM2QrczJNTWd5cjNFVlFl?=
 =?utf-8?B?N1pTclFVaDUxd1k0bmVBaGR1UGJ3SGlrQndHaTFiL2xRb3o3N3UxL2ZnMGdG?=
 =?utf-8?B?MTRBakp6endaaTIzMTJhQm5KVHhROFVaWmpHZVZMOUoyb2plS0lpa0YzeWha?=
 =?utf-8?B?Mytsc0E0enJJU3p3WTJmVHNPbnJCOTV3L1ZyTmlMQ2ZHbGNCV0lCb1V2R3dx?=
 =?utf-8?B?ZDVLYllobDVTa3R1d0NURG5UVmxsTFllV2wxSnA1YkFvME16dU1kdk5KTDdN?=
 =?utf-8?B?SUFiNU4wZFpMV0VPK1lsLzJhZXFuWTBsQjJsTWMzNzE2UGM4cWtuVWpBUmRk?=
 =?utf-8?B?UkxyMGFkY3dBVzNVM1I5dEFjTEw5UFNvalVzN1RBOFBOdXArWjIyWU95ZStS?=
 =?utf-8?B?QXVDZUd5YU9RR01hbllPMk51OGh4SkFtOTh4QzlNK0JZQlJxc0Zrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6c24fe-543e-4701-118c-08deaf344109
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 08:06:49.6945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4GwBHjynD4YSmFMSFOMT5yf7ufdNRiwUX1whi2mzv2fVoU+22kwplohfnBbRkaH5v5QCvqPNtF32MsUZ31g0bVjnCKm/Xox49JKLFAF81g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 08:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236782

V2h5IG5vdCBhbHdheXMgdXBkYXRpbmcgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uIGFsc28gaW4gc3Rh
YmxlIHJlbGVhc2VzPyBJdCBpcyB1c3VhbGx5IHVzZWQgaW4gZGVidWcgaW1hZ2VzIGFuZCBpdCBp
cyBtb3N0bHkgdXNlZCBpbnRlcmFjdGl2ZWx5IGJ5IGEgdXNlci4gVGhpcyB3aWxsIHJlZHVjZSB0
aGUgZWZmb3J0IG9uIGJhY2twb3J0aW5nIENWRXMgYW5kIHdlIGxldCB0aGUgQVVIIHVwZGF0ZSBp
dC4NCg0KSXMgdGhlcmUgYW55IG90aGVyIGNvbXBvbmVudCB0aGF0IGRlcGVuZHMgb24gaXQgdG8g
a2VlcCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Pw0KDQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtYXJjaGl0ZWN0dXJlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1hcmNoaXRlY3R1cmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFRvbQ0KPiBSaW5pIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFNlbnQ6IEZyaWRheSwgOCBNYXkgMjAyNiAyMToxOQ0KPiBUbzogUGF1bCBCYXJr
ZXIgPHBhdWxAcGJhcmtlci5kZXY+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnOyBvcGVuZW1iZWRkZWQtDQo+IGFyY2hpdGVjdHVyZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT3BlbmVtYmVkZGVkLWFyY2hpdGVjdHVyZV0gV2hh
dCB0byBkbyB3aXRoIHZpbSBpbg0KPiBvcGVuZW1iZWRkZWQtY29yZT8NCj4gDQo+IE9uIEZyaSwg
TWF5IDA4LCAyMDI2IGF0IDAyOjI5OjQzUE0gKzAxMDAsIFBhdWwgQmFya2VyIHdyb3RlOg0KPiAN
Cj4gPiBIaSBhbGwsDQo+ID4NCj4gPiBXZSBoYXZlIGEgdmltIHJlY2lwZSBpbiBvcGVuZW1iZWRk
ZWQtY29yZSB0byBwcm92aWRlOg0KPiA+IC0gQW4gZWRpdG9yIHdpdGhvdXQgdGhlIGxpbWl0YXRp
b25zIG9mIGJ1c3lib3ggdmkuDQo+ID4gLSBUaGUgYHh4ZGAgY29tbWFuZCwgdXNlZCBhcyBhIHJ1
bnRpbWUgZGVwZW5kZW5jeSBvZiBkb3Nmc3Rvb2xzLXB0ZXN0Lg0KPiA+DQo+ID4gSG93ZXZlciwg
dmltIGlzIGRpZmZpY3VsdCB0byBtYWludGFpbiBpbiBvdXIgc3RhYmxlIHJlbGVhc2VzLiBUaGVy
ZSBpcw0KPiA+IGEgcmVndWxhciBzdHJlYW0gb2YgQ1ZFcyB0aGF0IG5lZWQgZml4aW5nIGR1ZSB0
byB0aGUgbGFyZ2UgVUkgYW5kDQo+ID4gaW5wdXQgc3VyZmFjZSBvZiB2aW0sIGFuZCBiYWNrcG9y
dGluZyBmaXhlcyBoYXMgcHJvdmVuIGRpZmZpY3VsdC4gVGhpcw0KPiA+IGlzbid0IGp1c3QgYSBZ
b2N0byBQcm9qZWN0IGlzc3VlLCB0aGUgRGViaWFuIHRyYWNrZXIgWzFdIGN1cnJlbnRseQ0KPiA+
IHNob3dzIDE0IHVucmVzb2x2ZWQgQ1ZFcyBpbiBUcml4aWUgYW5kIDE1IHVucmVzb2x2ZWQgQ1ZF
cyBpbiBCb29rd29ybS4NCj4gPiBBbmQsIGl0J3MgdmVyeSBkaWZmaWN1bHQgdG8gc2hhcmUgd29y
ayBiZXR3ZWVuIGRpc3Ryb3MsIGFzIHZpbSB0YWdzDQo+ID4gZXZlcnkgY29tbWl0IGFzIGEgbmV3
IHJlbGVhc2UsIGV2ZXJ5IGRpc3RybyBlbmRzIHVwIG9uIGEgZGlmZmVyZW50DQo+ID4gcmVsZWFz
ZSBhbmQgbmVlZHMgdG8gcmUtdmFsaWRhdGUgYW55IGJhY2twb3J0ZWQgcGF0Y2hlcy4NCj4gPg0K
PiA+IFNvLCBJIHByb3Bvc2Ugd2UgZHJvcCB2aW0gZnJvbSBvcGVuZW1iZWRkZWQtY29yZSBvbiB0
aGUgbWFzdGVyIGJyYW5jaCwNCj4gPiBwb3N0LXdyeW5vc2UuDQo+ID4NCj4gPiBXZSBjYW4gdXNl
IHRpbnl4eGQgWzJdIHRvIHByb3ZpZGUgeHhkLCB0aGlzIGlzIGJhc2VkIG9uIHRoZSB2aW0NCj4g
PiBjb2RlYmFzZSBhbmQgZnJlcXVlbnRseSBtZXJnZXMgY2hhbmdlcyBmcm9tIHVwc3RyZWFtLg0K
PiA+DQo+ID4gV2UgY2FuIHVzZSBHTlUgTmFubyBhcyBvdXIgZGVmYXVsdCBlZGl0b3Igd2hlcmUg
c29tZXRoaW5nIG1vcmUgY2FwYWJsZQ0KPiA+IHRoYW4gYnVzeWJveCB2aSBpcyBuZWVkZWQsIHRo
aXMgaGFzIGEgc2Vuc2libGUgcmVsZWFzZSBtb2RlbC4gVGhlIG11Y2gNCj4gPiBzaW1wbGVyIGlu
cHV0IG1vZGVsIGFuZCBsYWNrIG9mIHNjcmlwdGluZyBmYWNpbGl0eSBtZWFucyB0aGF0IENWRXMg
aW4NCj4gPiBuYW5vIGFyZSBtdWNoIGZld2VyIGFuZCBmdXJ0aGVyIGJldHdlZW4uDQo+ID4NCj4g
PiBJZiB3ZSBkbyB0aGlzLCB3aGF0IHNob3VsZCB3ZSBkbyB3aXRoIHZpbT8gV2UgY291bGQgbW92
ZSBpdCBiYWNrIHRvDQo+ID4gbWV0YS1vZSwgYnV0IHRoYXQgd291bGQgc2ltcGx5IGJlIG1vdmlu
ZyB0aGUgbWFpbnRlbmFuY2UgYnVyZGVuLiBXZQ0KPiA+IGNvdWxkIHN0b3AgYmFja3BvcnRpbmcg
Q1ZFIGZpeGVzIHRvIHZpbSBhbmQgcmVjb21tZW5kIHRoYXQgYW4gTFRTDQo+ID4gbWl4aW4gbGF5
ZXIgaXMgdXNlZCB0byBwcm92aWRlIG5ld2VyIHZlcnNpb25zIG9mIHZpbSBmb3Igc3RhYmxlDQo+
ID4gYnJhbmNoZXMuIEknbSBvcGVuIHRvIGlkZWFzLg0KPiA+DQo+ID4gWzFdOg0KPiA+IGh0dHBz
Oi8vZXVyMDIuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRnRyYWMNCj4gPg0KPiBrZXIuZGViaWFuLm9yZyUyRnBrZyUyRnZpbSZkYXRhPTA1JTdDMDIl
N0NkYW5pZWwudHVydWxsJTQwZXJpY3Nzb24uYw0KPiBvbQ0KPiA+DQo+ICU3QzE2NTNjZTkyYzEz
ZjQ2NzVmN2NiMDhkZWFkMzZhYTViJTdDOTJlODRjZWJmYmZkNDdhYmJlNTIwODBjNmINCj4gODc5
NTNmDQo+ID4NCj4gJTdDMCU3QzAlN0M2MzkxMzg2NDc0NjExMjU3OTMlN0NVbmtub3duJTdDVFdG
cGJHWnNiM2Q4ZXlKRmINCj4gWEIwZVUxaGNHa2kNCj4gPg0KPiBPblJ5ZFdVc0lsWWlPaUl3TGpB
dU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveQ0KPiBmUQ0K
PiA+DQo+ICUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9aXZmQnFESzB6ZU5WZThqJTJCeTMlMkZa
cUR4ekMwJTJCRg0KPiA2eTFVYWtRSW1CDQo+ID4gbWFyckElM0QmcmVzZXJ2ZWQ9MA0KPiA+IFsy
XToNCj4gPiBodHRwczovL2V1cjAyLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZnaXRoDQo+ID4NCj4gdWIuY29tJTJGeHlwcm90byUyRnRpbnl4eGQm
ZGF0YT0wNSU3QzAyJTdDZGFuaWVsLnR1cnVsbCU0MGVyaWNzc29uLmMNCj4gb20NCj4gPg0KPiAl
N0MxNjUzY2U5MmMxM2Y0Njc1ZjdjYjA4ZGVhZDM2YWE1YiU3QzkyZTg0Y2ViZmJmZDQ3YWJiZTUy
MDgwYzZiDQo+IDg3OTUzZg0KPiA+DQo+ICU3QzAlN0MwJTdDNjM5MTM4NjQ3NDYxMTQ0Mzc5JTdD
VW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiDQo+IFhCMGVVMWhjR2tpDQo+ID4NCj4gT25SeWRX
VXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxk
VUlqb3kNCj4gZlENCj4gPg0KPiAlM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPWFDUiUyQmZNSU9P
cktYblAwRiUyRnAxcVhyanlLdyUyQg0KPiBOUUdVbjk2RzYlMg0KPiA+IEZuQVlyT2clM0QmcmVz
ZXJ2ZWQ9MA0KPiANCj4gTm90IGFuIG9iamVjdGlvbiwgYnV0IGEgbm90ZS4gVGhlIG1vdGl2YXRp
b24gYmVoaW5kIGJyaW5naW5nIHZpbSBpbiB3YXMgZm9yDQo+ICJleGNsdWRlIGJ1c3lib3gsIGhh
dmUgaWRlbnRpY2FsIGZ1bmN0aW9uYWxpdHkiLiBDaGFuZ2luZyB0aGF0IHRvICJhbG1vc3QNCj4g
aWRlbnRpY2FsIGZ1bmN0aW9uYWxpdHkiIGFuZCBwdWxsaW5nIGluIG5hbm8gaXMgcHJvYmFibHkg
ZmluZS4NCj4gUHJvYmFibHkganVzdCBtZWFucyBhZGRpbmcgYW5vdGhlciB2aXJ0dWFsIHdoaWNo
IGJ1c3lib3ggcHJvdmlkZXMgd2l0aCAidmkiDQo+IGFuZCBuYW5vIGNhbiBhbHNvIHByb3ZpZGUu
DQo+IA0KPiAtLQ0KPiBUb20NCg==

