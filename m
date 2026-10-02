Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1967FCA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 12:40:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11111.1790944831677088519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 05:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=Qt6i4eJ5;
 spf=pass (domain: de.bosch.com, ip: 40.107.159.19, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS3/qEwCTdMHmghLLQViYLOWuLe/UzmkJt+0Czsio3KCD38hYqT69+hzBCmtbGIYHedY/fiRIwKaWqH2RuZiFHMRIETp9hFIX4gW5UJj0LS8FJl6QWGkGw/N0KXeTYJasab5A59w2kx7pT9NgPcl4ZWQjomnOjLU243YNgQNuJV9tcLyijR9ub+kvo1YUdlAtpk1Od1A8/6JlNr2r6M96+oy2YwBH5UacL83i9I6IlWT+55RhmGwHuM9UzBcujlyWdKslUah/RVL2TrI07ApqbAgKbQdIEs8FFRZS1wulBx/Ro7UGRr1A2sR9Lgwwolg56EnAsf0lXEyg8N1fvS1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Uav+K5x6z4cI+KRCROHhjlDXcGMO1viZG4HDPX9rZ0=;
 b=T75QPiU/adlK69M7HFlS0+Il4ws0SRA1DPejdlJc8oHxf74ENecwo/6lT2+6b2E1dDVJixOXOlwZDH2f6gqNAavSTSUIa9WKgGNo6+gC2IuRbK0l64SHt6z2p1iXJRq4rr7DwGPhkmZBf49waGJsO/1qs8Ryi9Iqf3VtqJEW0zLmCHirDxQgjd+GEvZrejMIzbFAnvZIEBzqw0O4r+qrZN9VezqPN8mLOeP1m7nebLbD1cVXc9b+8dtdt3Ts8fb03qCCpVEcCXz0WekksyOxbjleIk6uOe+oBo7O3Y+HY1c6YNM4OarX1JjnLrPKry7QRoe47V7Vc7VYvdkWtSk1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Uav+K5x6z4cI+KRCROHhjlDXcGMO1viZG4HDPX9rZ0=;
 b=Qt6i4eJ5qwoHU1Wg48J05kTlRix/DsVHhCHz+f02fsmKc2R1d9yPKvXipSSBfZibOGez0rH7WJZMGvAx5cLm/RqVboOEXEshuOZDyeF8n8BfHNjHpl3YS+nawYsHjyXmAPewO24ckZzxxl8wjQmDj6y4QOFqCFcjVIOXTSYzkTB/e8F5et+fcS2faIo8RRG05ZaJ3ycMt5q9tTNsAZParURnt8WuSR2HnboqTyOpZ0WuGCuohC3axWfKocZM56TGmXFSNq2pcl5GW5BHpPQIduQf0YBa+i2q8CQ2VGUWlAWyLLDshipuLujyO8mNH/u+rW7Bww89kK/oWSGsQnGUpA==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by DB9PR10MB5186.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:325::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 12:40:26 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%6]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 12:40:26 +0000
From: "Jonas Mark (BT-EL/ESW1)" <Mark.Jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker
	<paul@pbarker.dev>
CC: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"Simoes Ricardo (BT-EL/ESW2)" <Ricardo.Simoes@pt.bosch.com>, "Jonas Mark
 (BT-EL/ESW1)" <Mark.Jonas@de.bosch.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [PATCH] xorgproto: Set ALLOW_EMPTY for the main package
Thread-Topic: [OE-core] [PATCH] xorgproto: Set ALLOW_EMPTY for the main
 package
Thread-Index: AQHdR3jHtav7oPpwiU+ohkEVBlLhq7bm6peAgAGGJjCAADABAIAAFo6ggAGNgQA=
Date: Fri, 2 Oct 2026 12:40:26 +0000
Message-ID: 
 <DB9PR10MB53544833C3D64B7678BC8678AD892@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260918141849.1875-1-mark.jonas@de.bosch.com>
	 <f2101f97616baa3cee4c5733846dc6b64dd944c2.camel@pbarker.dev>
	 <DB9PR10MB53549FAC3975BDDD2B057243AD8A2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
 <34e67117d3a6fa876092f3736d3ecfa3f2b8fbc1.camel@linuxfoundation.org>
 <18DA695297972727.1648921@lists.openembedded.org>
In-Reply-To: <18DA695297972727.1648921@lists.openembedded.org>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|DB9PR10MB5186:EE_
x-ms-office365-filtering-correlation-id: 061abfc5-c207-4a68-cc18-08df20825573
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 r3bo3Kq61X67Y5IK5y94C3tgmcYS4u+vsq6XPpq7HtupjNCU5J3B/mHuEgLydZOCa8v5y0FsVoUW067awEOBtAEM0PEKU8R6huATMf3DFnO0R8RkdH4v8XOwiuuF3MHTqEGlBoltjqgXNSdlmXHoiL2pMqAdEygFAHwVXqJkseDDEl8hSSw1izKaG53h1Npk/nUpbVfclAhabu0y2LiCO7zsdvw6oQsRsRSTFG+jthL7/9yKm7gllSFw48Xb+iWjF9L6gSFecT5gW1rGbWhD1Y+ylwUa/jZ76hzlUm4IyaiJmNIvfEsg9wGZ8a8cMZP9BWeBNF3fvOyG88UAkO0rIla15i3WDx5mPAAx7yj/Z3pKxjCNtPzWKAE2nf9D83Vp1CO03nGXzIcRlI0nR/v2QAZge9PQrhKwVLzPwBbUHlhdoUs/es5Bzsb+pAjT3XsFZiht4ill1sP164ecAYzbaQzrUqHZzAQ/5H0a+BsbPfgoP6ER0EwWKLo+vwt70t7YEygVPAR/gkJZ0wRtO0bBlgrCxk2z1qnkKFxMKPnxaLEC5nUJOPnHYmbCkrsCg7jtcBVYcuUP10U/S4wUVvhypJe9ss2pPAafEuz5jSGyqZqagb5YE1B1otNuLbElLAW4Bfry3wG8LaCu4B8N49bOFNSWAYXMmmhXhBfvqSOJt6QtdkARmOAsgpxIdHhpFf7RXvdawA6wVRauMS+n76nkFebFRqn20c2Gwe/9SNe/TXY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHZoeDV2TGQrUjlZOHZPZ3lPemFuK1RZUnJSU2U2TGI3MVV3SE5JeDZ3cjBR?=
 =?utf-8?B?VnU5RER0YU94ajExOXRURlBwaExSK3RabHlRVVNEMkVKVTBYeXhYSVJvZ0ox?=
 =?utf-8?B?d2pCYTQ4NHVNM01pb1FRU2JRb21tTis4anRUNDA2SlRsSjFYVHlZdHlKUngv?=
 =?utf-8?B?WDZTK1B4QWZQaUlHandmNlMwVGM3a2huVVAvdHdiZXBEVmMrTllWSXJqdTI3?=
 =?utf-8?B?MnVFaDFZY0dCcVBuUlMxUjNPdEgvdm92YnAwK1E3RDc5VjZEeHpickFGb1Ru?=
 =?utf-8?B?b3d5M2JhR0QrRW1rOG1ybXBDV0QyWFhqWnhzeEk5bldDcVdZTWhXZ2VWMHkw?=
 =?utf-8?B?QXJGbzJhVmxpbjdFcWhQSUtVaGRZOUxjV0tsa2RPMmhqWjR4RzZYYlExdCts?=
 =?utf-8?B?SFVYSU5Jam1XT0x2ZTFjZEE0TXJhdEY4Y1JkNG4rZ2pkUm1ScGVQMnUxekJx?=
 =?utf-8?B?dnFTMGpqZ2Z1aFY0bVJ6N1RieGYwOUgyN2svbmtrS29WRkwzcmgweURkSXdv?=
 =?utf-8?B?L3pudHpKWVZxNHhzYXZMTWxUeWpnc3JhSU1EUEZwdEhzekJma2xlak9iQXNM?=
 =?utf-8?B?a3ZaVi9EbWdncGVrVUhDd3VRMkQzRVVoNDhzUGNtYmdybzR6OUY4bUROcWtO?=
 =?utf-8?B?TFh3QUJxdDQ4cjdLbkYrWFN1UGU1SmJKQSsyRGJRd3k4YkNlZm9KejhFbXVS?=
 =?utf-8?B?RHJaNEpNQXR5OEJhL1B6d0VUdngrYTJVTVdrcXVzQmRCenlkVVNqRTk2bFFK?=
 =?utf-8?B?bU1EL0c2NmwvUHR6dXJCSy9DMnRQUmFCdFBwbkpZNkYzMVVCVjdWSTJKZ2ZP?=
 =?utf-8?B?My8rMktyZThDTUZ2NHVOLzdlYnJsM1ZZY2tCWTNGbSt2cWlZQXh0bXZnSWg3?=
 =?utf-8?B?b1RDNkNXQjRUb2luNlduVmNyRU11cmlrdFMxZGFtY3oyVUVRTnlYUWVZR0JN?=
 =?utf-8?B?VGZ1L0YwUHVJbGs2dGZwTDdQdnc4eis2U0JLbzQwZkY5cUVHUnhRWmgxSGlM?=
 =?utf-8?B?ZGFnQzE1YWFSOWJmVUw4VUdtNzIwbmFNUGZVUjZTNHUxQkdVK1ovcEF0WmQ3?=
 =?utf-8?B?NGFxeTVBa0dSRkdMRkJyRlB0b294YkpOaWIrc3FzWGdWN01IYlZZM0F2TGdq?=
 =?utf-8?B?cS9KSC9MT1ZZV00zcHFaT05kSUxZemxDOVVhcUhsU0JvLzNGWDFKeldyRkRS?=
 =?utf-8?B?dzRvbEtjTXhOY1hhSjgzMkx3alpiakhsRDZNLzFHRG9xd09vbCtwMFlWbFZ1?=
 =?utf-8?B?OTE2d2s5NlAyR00rRHorM1FqTnRjbkdNWWlUbzQwdjlaWEV5ZmNUaDR2eEMv?=
 =?utf-8?B?VUJ1MmFSTE96NjJXMFBMZlRvL1ljdWJCQjNuMWZBV2NjRHM2MUxiV1Z1dVo3?=
 =?utf-8?B?TDdhSVR0cjc5UEVwR3c0OUJwdU83NVhoUTR5S1F6bFpSTGZpSmgzK0FGbjBy?=
 =?utf-8?B?bHpYMDFnT0pGbEhidzNKYWlBcEFZYXBDejZrcDNZU1Vlait3OEQ3dWJyYUJN?=
 =?utf-8?B?RU85a3l1REszS1ZnOVNnc254MkFBc0grSTZaUlpUZUFENnNzM0t2cEtoWStl?=
 =?utf-8?B?MjBVaFJScll6VHMyMk9XaFRyTEd2S3NkVFFwbTdxbmMzVlYvZWpmTnNoREJu?=
 =?utf-8?B?eWZURlJLdUJYY1oveERLWEdkeUxheU1HSURRc09qYzZHY0lKZEMrTnJkVjFB?=
 =?utf-8?B?UkhjdVNmZk9zZHg2eVh1QitHTEUrcDFnWHFQRmJneHc3SjlQcGk0VEJiS3Fn?=
 =?utf-8?B?YjVaVCt3RjlsaXpLTHI0Ym5hVWwvM2FQdkxDMzJ6cnRIZzgwdGd6dHJ6UVJL?=
 =?utf-8?B?cERJcXdnTDF4d0dEa2p4SGp2bEZLQ2RtNFlBdkFOM1g1ZVE4YjMwZ1BkaTly?=
 =?utf-8?B?K2VXVFF5ZElQRkZMcjlqRHRXajRaRi9rRk9CbzlBelJnQ3V3alIxUnpxR3lP?=
 =?utf-8?B?NTdEVmlaRlNUNU1NSkxYdktrOURGMEV3YU5zU2NhTjBPWjZYUTRKY0RIUDM2?=
 =?utf-8?B?Tjg4ZjlveDh3Z1Y3UHBxRzJVUTMwRXgyYnhoT0hrMDN6Ri91cVZCb24wenov?=
 =?utf-8?B?V1B3aGJsdnR6dGN6M1d2M3FlTGNvVzgrbWozTXlQOEUyUDBZY2JEVU9iSTIy?=
 =?utf-8?B?K2lJSldMUVVOVVNvSUlxMndzL2dJdXlCN1UxYk1MbjVqeTlkeGFlZytkUVg1?=
 =?utf-8?B?QzRsQ05IMCszeFpYSUhSUi9FUE1Cbjc3ZUd3QjBTelFFeG5YYU1HaXVaR1h0?=
 =?utf-8?B?SThUM09aSXVGcEtCMWFNY3E5QWpLeHVXMThYV0EwVVZ1WjRhSXE3T0QwTnF1?=
 =?utf-8?Q?Qp9rYozcuJ0cOcfwmB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 061abfc5-c207-4a68-cc18-08df20825573
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 12:40:26.1135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: br6Z/gn/iHqeOeHHSsZphAeXwqYV4dmnhaPnRN/cW6yIaP/zgLvqFWODkMD4mlUHr/MoNxIOS0HubQPJS7aB6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 12:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247117

SGkgUmljaGFyZCBhbmQgUGF1bCwNCg0KPiA+ID4gV2Ugd2VyZSBhIGxpdHRsZSBicmllZiBvbiBv
dXIgZXhwbGFuYXRpb25zIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gU28NCj4gPiA+IHdlIHNh
dCBkb3duIHRvIGNyZWF0ZSBhIGhvcGVmdWxseSByZXByb2R1Y2libGUgZGVtbyBvZiB0aGUNCj4g
cHJvYmxlbS4NCj4gPiA+DQo+ID4gPiBGb3IgcmVwcm9kdWNpbmcgd2l0aCB1c2VkIGNvcmUtaW1h
Z2UtYmFzZSBhbmQgbG9jYWwuY29uZg0KPiBjb250YWluaW5nDQo+ID4gPiB0aGUgZm9sbG93aW5n
Og0KPiA+ID4NCj4gPiA+IE1BQ0hJTkUgPz89ICJxZW11YXJtIg0KPiA+ID4gVVNFUl9DTEFTU0VT
ID89ICJidWlsZHN0YXRzIg0KPiA+ID4gUEFUQ0hSRVNPTFZFID0gIm5vb3AiDQo+ID4gPiBCQl9E
SVNLTU9OX0RJUlMgPz89ICJcDQo+ID4gPiDCoMKgwqAgU1RPUFRBU0tTLCR7VE1QRElSfSwxRywx
MDBLIFwNCj4gPiA+IMKgwqDCoCBTVE9QVEFTS1MsJHtETF9ESVJ9LDFHLDEwMEsgXA0KPiA+ID4g
wqDCoMKgIFNUT1BUQVNLUywke1NTVEFURV9ESVJ9LDFHLDEwMEsgXA0KPiA+ID4gwqDCoMKgIFNU
T1BUQVNLUywvdG1wLDEwME0sMTAwSyBcDQo+ID4gPiDCoMKgwqAgSEFMVCwke1RNUERJUn0sMTAw
TSwxSyBcDQo+ID4gPiDCoMKgwqAgSEFMVCwke0RMX0RJUn0sMTAwTSwxSyBcDQo+ID4gPiDCoMKg
wqAgSEFMVCwke1NTVEFURV9ESVJ9LDEwME0sMUsgXA0KPiA+ID4gwqDCoMKgIEhBTFQsL3RtcCwx
ME0sMUsiDQo+ID4gPiBDT05GX1ZFUlNJT04gPSAiMiINCj4gPiA+IERFUEVORFM6YXBwZW5kOnBu
LWJhc2UtZmlsZXMgPSAiIHhvcmdwcm90byINCj4gPiA+IFJERVBFTkRTOmJhc2UtZmlsZXM6YXBw
ZW5kID0gIiB4b3JncHJvdG8iDQo+ID4gPiBESVNUUk9fRkVBVFVSRVM6Zm9yY2V2YXJpYWJsZSA9
ICJzeXN0ZW1kIHVzcm1lcmdlIGV4dDIgaXB2NCB2ZmF0DQo+ID4gPiBnb2JqZWN0LWluc3Ryb3Nw
ZWN0aW9uLWRhdGEgbGRjb25maWcgbXVsdGlhcmNoIg0KPiA+ID4gRElTVFJPX0ZFQVRVUkVTX09Q
VEVEX09VVCA9ICIqIg0KPiA+DQo+ID4gWW91J3JlIHNldHRpbmcgUkRFUEVORFM6YmFzZS1maWxl
czphcHBlbmQgPSAiIHhvcmdwcm90byIgYW5kDQo+IHhvcmdwcm90bw0KPiA+IGRvZXNuJ3QgZXhp
c3Qgc28gaXQgaXNuJ3Qgc3VycHJpc2luZyB0aGUgaW1hZ2UgZ2VuZXJhdGlvbiBmYWlscyBhcw0K
PiA+IHN1Y2guIERpZCB5b3Ugb3ZlciBzaW1wbGlmeSB0aGUgcmVwcm9kdWNlcj8NCj4gDQo+IFlv
dSBhcmUgcmlnaHQsIHdlIHRyaWVkIHRvIHNpbXBseSBvdXIgc2NlbmFyaW8gYXMgbXVjaCBhcyBw
b3NzaWJsZSAtDQo+IG1heWJlIHRvbyBtdWNoLg0KPiANCj4gV2UgYXJlIG5vdyB3b3JraW5nIG9u
IGNyZWF0aW5nIGFuIGFic29sdXRlIG1pbmltdW0gbWV0YS1sYXllciwgYQ0KPiByZWNpcGUsIGFu
ZCBhbiBpbWFnZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlLg0KPiANCj4gVGhlIHJvdWdoIHNrZXRj
aCBpcyB0aGF0IHdlIHdpbGwgaGF2ZSBhIGZvby1wcm9ncmFtLmJiIHJlY2lwZSB3aGljaA0KPiBk
ZXBlbmRzIG9uIHhvcmdwcm90by4gSXQgYnVpbGRzIGZvby5jIHdoaWNoIHVzZXMgYSBjb25zdGFu
dCBmcm9tIGENCj4geG9yZ3Byb3RvIGhlYWRlciBmaWxlLiBUaGVyZSB3aWxsIGJlIGFuIGltYWdl
IGZvby1pbWFnZS5iYiB3aGljaA0KPiBpbmNsdWRlcyBjb3JlLWltYWdlLWJhc2UgYW5kIHJkZXBl
bmRzIG9uIGZvby1wcm9ncmFtLiBXaGF0IHRoZW4NCj4gaGFwcGVucyBpcyB0aGF0IHRoZSBTREsg
Z2VuZXJhdGVkIHdpbGwgbm90IGNvbnRhaW4geG9yZ3Byb3RvLWRldi4NCj4gDQo+IFdoYXQgaXMg
aW50ZXJlc3RpbmcgaXMgdGhhdCBzb21ldGhpbmcgbXVzdCBoYXZlIGhhcHBlbmVkIGJldHdlZW4N
Cj4gS2lya3N0b25lIGFuZCBXcnlub3NlOiBXaXRoIEtpcmtzdG9uZSB0aGUgYWJvdmUgc3RpbGwg
d29ya2VkLiBUaGF0IGlzLA0KPiB4b3JncHJvdG8tZGV2IHdhcyAiYXV0b21hdGljYWxseSIgcGFy
dCBvZiB0aGUgU0RLLiBFdmVuIHdpdGhvdXQgYWRkaW5nDQo+IGl0IHRvIHRoZSBSREVQRU5EUy4N
Cg0KV2UgY3JlYXRlZCBhIG1pbmltYWwgbWV0YS1sYXllciB3aGljaCBpbGx1c3RyYXRlcyB0aGUg
aXNzdWUgd2Ugc2VlLiBZb3UgY2FuIGRvIHRoZSBmb2xsb3dpbmcgdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZToNCg0KQ2xvbmUgbWV0YS1mb28NCiQgZ2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9y
dWdzaS9tZXRhLWZvby5naXQNCg0KQnVpbGQgU0RLIGZvciBmb28taW1hZ2Ugb2YgbWV0YS1mb28N
CiQga2FzIGJ1aWxkIGthcy1tZXRhLWZvby55bWwgLS10YXJnZXQgZm9vLWltYWdlIC1jIHBvcHVs
YXRlX3Nkaw0KDQpJdCB3aWxsIGJ1aWxkIGp1c3QgZmluZS4gTm9uZXRoZWxlc3MsIHRoZSBTREsg
d2lsbCBub3QgY29udGFpbiB4b3JncHJvdG8tZGV2Lg0KDQokIGdyZXAgLWMgeG9yZ3Byb3RvIGJ1
aWxkL3RtcC9kZXBsb3kvc2RrL3Bva3ktZ2xpYmMteDg2XzY0LWZvby1pbWFnZS1jb3J0ZXhhMTV0
MmhmLW5lb24tcWVtdWFybS10b29sY2hhaW4tNi4wLjk5K3NuYXBzaG90LnRhcmdldC5tYW5pZmVz
dA0KMA0KDQpPbmNlIHlvdSBhcHBseSBvdXIgcGF0Y2ggYW5kIGFkZCBSREVQRU5EUzpmb28tcHJv
Z3JhbSA9ICJ4b3JncHJvdG8iIHRvIGZvby1wcm9ncmFtLmJiLCB0aGUgU0RLIHdpbGwgY29udGFp
biB4b3JncHJvdG8tZGV2Lg0KDQpPdXIgaW1hZ2UtZm9vIGJhc2VzIG9uIGNvcmUtaW1hZ2UtYmFz
ZS4gV2UgZGlkIGFub3RoZXIgdGVzdCBiYXNpbmcgZm9vLWltYWdlIG9uIGNvcmUtaW1hZ2Utc2F0
byBhbmQgYWRkaW5nIFgxMSB0byB0aGUgZGlzdHJvIGZlYXR1cmVzLiBUaGVyZSwgb3VyIHBhdGNo
IGlzIG5vdCBuZWVkZWQgYW5kIHRoZSBTREsgY29udGFpbnMgeG9yZ3Byb3RvLWRldi4gV2UgZG8g
bm90IHVuZGVyc3RhbmQgd2h5LCB0aG91Z2guIFdlIHRoaW5rIHRoYXQgdGhpcyBpcyBlc3NlbnRp
YWxseSB3aGF0IFBhdWwgdGVzdGVkLg0KDQpXZSB3aWxsIGJlIG9uIHRoZSBPU1NFVSBuZXh0IHdl
ZWsuIE91ciBlbWFpbCByZXBsaWVzIGNvdWxkIGJlIHNsb3dlciB0aGVuLiBCdXQgbWF5YmUgd2Ug
Y2FuIGhhdmUgYSBjaGF0IGF0IHRoZSB2ZW51ZS4NCg0KQ2hlZXJzLA0KTWFyaw0K

