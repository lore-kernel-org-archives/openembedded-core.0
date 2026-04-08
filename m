Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1591105D9A3
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:25:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98361.1775618725853373321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Ztl4jy0S;
 spf=pass (domain: axis.com, ip: 52.101.84.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0tkoeHDsP/9/HWSWtHGRCkNfMprm0AUE7ihgLQTz9P+HqsfFCJukwENVNxJbIl8FWJ2zf6IoTac0ancd0lkSJpuhzxvrH/q+TW60Eii58D4Y7uwHaienQb1OXqNd8th9Lq7MQ3wYwk3mnU84bNVO6oRuSOdxGcQZGi9Nmyy1ypL5AvpDN1hdtqXWYJjNj9r85mmiUH5/kzX/4X8fzc2usEAFX0ZKm94rv6hXSgjSnGGdydqKF4hclA34cHeEJhEDgqpoehj+2SivQJ8qQDbo/1Sz0fAAzzf/wsLf2MVNxE6X31owgZCGkfqq2dU6EO9eziLxW1t//SzPOF92wv4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiwCsGjU455jVWR7EZJGxZwSA0ntKV/cfaeQ0425D3U=;
 b=IvH0rn+C+s1Yf49iohSklfKkO50LI8OF8ZwgknY6TnvotUnGkQc22KM2pMU9mz5inyfi2x0wfW945f4CFcq0mL08BfftGCQgA4UjkAwJab436J0cf6CcqLrrmhDM0YmeBp3sv/w3K2/gEf0JDqPjBIeZLXn8Qih6l3V8zddwRxQtf80BmtEnfWnPZ0RGnTXkKSpHd/NXO18SUK8Th8PuZMOmD+OSqXNx9P+KNSiYMSBy0rWe3qMd4+2XjTI1GCQM8RadSphzLweyDVITdDcPzlIARafh/cEzKwymKSOEb3P2swKiVXmnm3ZCZISOhF9IiTn41T/gWWH/b1ZeDA9Fjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiwCsGjU455jVWR7EZJGxZwSA0ntKV/cfaeQ0425D3U=;
 b=Ztl4jy0S9VhpXMlJXYTHKT09Pt5XyGjk17SjUFr3VkwKs2h429N6WM7bOOyLkemna3U6Iji69tM/jAoDjRc7QHLdzCYUPsbL3n0NF15B/QZTzSLmPAP05OZ8WynQkDRWpY19rSAMne7ZhkIzFzML4p6nBN/DNCb9JD8BpNWqJRM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB10338.eurprd02.prod.outlook.com (2603:10a6:10:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 03:25:22 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 03:25:22 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Thread-Topic: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Thread-Index: AQHcq8JrmSM+ut1aa0usJT8b8JwZN7XHabnQgAx0iQCAANfWMA==
Date: Wed, 8 Apr 2026 03:25:21 +0000
Message-ID: 
 <DB5PR02MB1021341EFF82F095EEE25C287EF5BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
 <20260304103203.1649-10-wangmy@fujitsu.com>
 <DB5PR02MB10213FE000AAE2E4B66AD8618EF52A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <DHMZSNJNLA01.15TXU54LBULSW@bootlin.com>
In-Reply-To: <DHMZSNJNLA01.15TXU54LBULSW@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB10338:EE_
x-ms-office365-filtering-correlation-id: 28c28547-8b44-442a-a2bb-08de951e7789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 XrU68cpKEnGiqoIxqUqmHTWxWx1c/MjSDy3UsYUdt27jv8jWkF64vrUQoi9tPNBzaWuVoK53ewBXxCoSC1nOGADP8RyMDItvCLfLH8iTKpzTgwsYLapU9FC6yjpAVcE4pIBfDLdp6IER9L+YdYPDokKh2d7OZ/y7+wu1HcGxGegJDK3mLaleugkssjCoCB3TIQBKTW6KwyQ0ZiWsF4E0IaHYpwxbPzh3APsrVg2Klk+bSRtXgrripSDuBWwOEnW+UeUDDkDKBYc8WB5v5BHCHfD7OTNokCFCdcwHbUBHK2VqQ25Tz5tjm9jNwWm+A9yGtR3kI9CjD1GJaATdMauCDuByJMsvA9GNH6XKmC2UyBKERFfe/1jmmfZObFpQL0Rv/DqxfwTMkvGtM6lHhtxCjbweJcNAQ3KaCwIvu7mksDEp2yKHveMhFcujta8nQszV7spQbRsuuyU6EsGc4ne6d6DohRAdGmP2R0sfMtHCnejSA9kSp+/hZuVkBkhwI9VgjTjreK+H/4H5Uut+s65ZJS9aA62mclrckWdR9j8k4TGzHJ1KYV+AU7CspU6v1xhnJK8sSTvp5PtofFdeS6ujOzfmtuflbPFTdVH0HmGRK84ptZn+dsQk80auJhGgO6uk6YNgQp93y1p5vjAw6it/qfD9kToOpHtF1ruXNi5FV2QvzVBqy6mI0DNp1d50tqCGAgkjpE9+0vQ2t4ctBaygJz0tZLD/PQUEMMzor/U66584I2C0s9aWUyZY8DYPwxYv2sPziTee2jsyW2/lUFX1dQTsu+n1CmFcFWO31LDvTqA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NFgra2Zzcjd5b3c1Y0hrejZ0UFVPZEVOZG56b3ltdkxSYlJDcHN5SFpXT0Y0?=
 =?utf-8?B?TXRVVDgwbUVWSDZ5SDE2WUZlc1ptRzUyb1h5dy8zbCtmai9oVmZldGFYVEd3?=
 =?utf-8?B?cUVoR0tXOFE4TmlmNHk5Smt2RTI2NFdFV3lMb0tteWduUVc3OXJkcm9vRVpM?=
 =?utf-8?B?VlYyQlIzaUw3ZUIxeGhpN3Fvdnc5Y09YRHBzdWZHMmtZT1k4TDB2Ym11a21C?=
 =?utf-8?B?eEdzYjRLN0MrcHpXM3FkN08xYmNIYTFTUUdvR3RRSzFXdmgvTkwxT0JvYVhy?=
 =?utf-8?B?SDdmTXBBcUdrQVhmTmNRNkgyWDErenV6SlFMcSsrTzdwaG9uUkVSaFFycTlP?=
 =?utf-8?B?VzNkeWRSSEsyUlpnN1gxVDZIV0Y1MHVoRVg0STI1dWhYaTJyTEhhVU5zekhZ?=
 =?utf-8?B?RzZsOS85Z0RLODd6UFlQTzZDK2VUVmdkdWdkSXVIcFFDNFFIS0hJcGNxa01N?=
 =?utf-8?B?TWtKYkhlREFKZng3di9tQWR3U0c4N05JWStqbHM2bmxRaUZuYTU2TGx0K2VR?=
 =?utf-8?B?TkpiM2ZXRUJlS0pCOTNjc1FxU1E0T1BXamJ5YzFURWtvcHZudlp1WDBJMlJU?=
 =?utf-8?B?QUpuNmpWSkt0MU5sMlo3NzROYThGL1RVaEZYU3BMZUxJUHJta1RJK25lek1B?=
 =?utf-8?B?NW9SRDdkVU9TL0xCa3dMS0IwMnFHdjQ3SElBcFVZRmtLeW5JeG1YVTN4WGMr?=
 =?utf-8?B?Vm1NaVpjUCtmNXdyMEU4dG1vak9sdGRWZ084b3JtWkpMVm5lUnZTcGgzb2lh?=
 =?utf-8?B?S3lnSDQvVnQ0RFhtWmEvNEU2MUIvblVRcHIwamVOZ0dMV0xYMG5zenZUVXZT?=
 =?utf-8?B?dGtjeWE3UDFmWWdMRjZGYmVZWnZHb3NmNk1xQWpkK1FIZTFoSS9Vc2g2MXRl?=
 =?utf-8?B?WC90WkRTaHJmOEk4bmZ4MlhtVHFWbDRtajMvaU5uQkh1SDRXaVdCQ3B2NkFP?=
 =?utf-8?B?VHNrSnpJVUtMejRJd2l0MGp2LzBOYXY3OWx4UWhCUkZzbkxXdWZKLzJWRHll?=
 =?utf-8?B?b1VrL1FZVWVtNjdWa0dCb1pxM0VLQ05xRmFxN2JkTVgxdS9ucHRJZkFzTW9J?=
 =?utf-8?B?Rkw2cnAxOXpaLzNNdDhzOWRKM05PVmxDdVZhanMxdW5WZWlQU1NVcjdSSUpx?=
 =?utf-8?B?NUZ2Wm9OOVBQZzhqLy9RZGNCRGo2cjVkd2EwSnFtZGVTRmZSWDBybEVhS0o0?=
 =?utf-8?B?bkJ4OGNHcGxhaDVOM1Z5VnFlbVpLVFNGdE9welpCcU9OMGx5d0ZpQXl4Z3p6?=
 =?utf-8?B?NmJ1QjR2VjNBY2JCNnlXUmRNTkJWZGphY3RjcktSWHYzNEdjL2M0UU5TenBl?=
 =?utf-8?B?Y3duT1B6SDN1QnlGTU1xZWVSUVlva2lNeCtDUXBJMTlXM1lsdkdrMDF4OGNV?=
 =?utf-8?B?NFdsdFFQUTk1bitRQ2NyTkFsc3dkZDZzSjNTZWRZZE51bVN3ZWxUQ2xQWHhH?=
 =?utf-8?B?OVpUZGsyOUFxYkJ2Zk41bHA4aVduWVVYOFFzTUx0dVhVeHc0Nmd3cVVtenV3?=
 =?utf-8?B?Zzg4VEs2S20waEpVM0U1MmhCQzY4UDJ0UklqdDVXN1FiL0MvY0lXT21tYkhy?=
 =?utf-8?B?MXJsTFY1eHBKT015R1Q5UXB4cmVoUXRvcGdvN0RNakNIZXM4SEwycSttRzl2?=
 =?utf-8?B?TXlDWHJIWm9aWkdUQ2VoQ1lyNnBSK3RFWXlXeFJTOTlZZU9TU0xmTUx6eVhn?=
 =?utf-8?B?QUp3c0N0SjlibTJDbmtYNytsUDY3K0p2SlpveTgxNW9tYnc2c2xodGp1UnVO?=
 =?utf-8?B?dWVNVTd5Um51YVRKK05hZjV6NzZBWm5IZkxpRXhtQ2cxcTlKL3FmL1RFRTZx?=
 =?utf-8?B?RUlwM1Q0UytzaHFXQ21kUkdzR2lZUjhDY0srK0psbUJYcEFCQ3FjTCtkbkxw?=
 =?utf-8?B?QkpQYlJXNDdQa051ZzE2c2p1MTNsbStSR3kxL1JGNUN2MDJLcnlqaTh4d0kw?=
 =?utf-8?B?M0cvd0NxVXdQQzJGZW1jMStKankyZ0NhZ3ppWkwyVlVWTU5JTVlqWExVUlYr?=
 =?utf-8?B?MzNhVWdWbEZxWlJQK2hVK0VQSHB5b1NsT3Z6UThDZU9pZlhBaTNsckJYcmhj?=
 =?utf-8?B?bFl6cDFYYlpXdkZmbDZ3YWhzNjQvNUVVS1A4RWRwc0VEQkpZbUNhUHQwZHJF?=
 =?utf-8?B?c1dXbThVNHFBSFRCQW81TFZKUGovTlBJbVpBdk5vdzFodGFmWnFWcG11cTJo?=
 =?utf-8?B?SjFJSHgvMnkvWEhKdWw2Uk9mTXNCSlRHK3djYmpJam9OdGJ0Y1lMMllpNmRT?=
 =?utf-8?Q?AfOlE/Vf4ziSpl9ElLjRWoQWoIECX5R2Nk93FNBEqU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c28547-8b44-442a-a2bb-08de951e7789
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 03:25:21.9914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gFrx7gNa50OlOsdTrVLA5XMS7tvzKasBCvFM8pHG07Kr+doBe7ixMHHQmLICq2IA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB10338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234804

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDcgYXBy
aWwgMjAyNiAxNjoyOQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+OyB3YW5nbXlAZnVqaXRzdS5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMTAvMTBd
IGdzdHJlYW1lcjEuMDogdXBncmFkZSAxLjI2LjkgLT4gMS4yOC4wDQo+IA0KPiBPbiBNb24gTWFy
IDMwLCAyMDI2IGF0IDY6MjIgUE0gQ0VTVCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IFdoYXQgaXMgdGhlIHN0YXR1cyBvZiB0aGVzZSBw
YXRjaGVzLCB3aGljaCB1cGdyYWRlIHRoZSBHU3RyZWFtZXIgcmVjaXBlcw0KPiA+IHRvIHZlcnNp
b24gMS4yOC4wPw0KPiA+DQo+ID4gSSBkbyBub3Qgc2VlIHRoZW0gb24gbmVpdGhlciBtYXN0ZXIt
bmV4dCBub3IgbWF0aGlldS9tYXN0ZXItbmV4dCBpbg0KPiA+IHRoZSBvcGVuZW1iZWRkZWQtY29y
ZS1jb250cmliIHJlcG9zaXRvcnkuDQo+ID4NCj4gPiAvL1BldGVyDQo+IA0KPiBTb3JyeSwgdGhp
cyBzZXJpZXMgaGFzIGJlZW4gbG9zdCB3aGlsZSBnc3RyZWFtZXItdmFhcGkgd2FzIHJlbW92ZWQs
IGJ1dA0KPiBpcyBub3cgYmFjayBpbnRvIG15IGJyYW5jaC4NCj4gDQo+IFRoYW5rcyBmb3IgdGhl
IHBpbmcsDQo+IE1hdGhpZXUNCg0KSSBoYXZlIHNlbnQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIFdh
bmcgTWluZ3l1J3MgcGF0Y2hlcyBub3cuIFRoZSBvbmx5IA0KYWN0dWFsIGNoYW5nZSB3YXMgdG8g
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLCB3aGljaCBub3cgZGlzYWJsZXMgbmV3IA0KcGx1Z2lu
cyB0aGF0IGhhdmUgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLg0KDQovL1BldGVyDQoNCg==

