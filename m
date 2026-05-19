Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33331CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 08:47:05 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.102])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17172.1779180418180260676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 01:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=NdPf+ODT;
 spf=pass (domain: aspeedtech.com, ip: 40.107.75.102, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcwIvI3vlDLw5jg+hotuOqeoE0Zp79zv5+FQziTnKiXUHMymk6kdKVQpC1mFK/dh92coPplRr2Q9QB6/xaor0NQx5bw1GCgri8Z7ZQiukrk5uE6I69exZvX0j9qtfKisog4JlSSEbhiqj+9ISJnaTH9b6rU9x16dHYhI3ETdHgLUnvA3Xn5H2HnpldJcdDsrkvkz4axTGKjjWtez0QinUuGrM1Z3YKkTKs9QnTqgdqJe/1yO0J9FafnRqvBe7ZzRLIP/SSlOGJw5PIEkaVyOj4n4TKg61tHA+j/cTa/1tMmgKUPIvQ6jgkSYDLaA03kAcSi7P8sBAsd2RM6nj4BifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzWa1fNNoy60VBs2wvF9c5+iCP7gcgEdhLnUi0tcu0k=;
 b=OZyBYqvfrGx3Lc2b/cwiur3y3+aaePv5pu31YOg5x8OHmAs2MkRV7CPkeYCGVb626Ds1PF4kpT5HvgqvUvuj1j5CNqU/KiYgs1R/NfJTnP1YLwApLpu0TkQibLWcgoc/TH8ZexaN9cOHl/wGQWAO0wYAnMXMHcA/GZNDAj4Z8ZeA1nMryHmNXWETIDlsCERLgNrmjQjfrTAMhczTcEnF+lyf+tyu/GS7wAdpr7ZT++zc10ZLTpZ6XvSxzZhYlwufaEAK1VJs4YUoh4EWokVDJGSHnvVyEIV4yxHvKAAEaxu2fmiYNEjWwwdRFSORvD18mhkJjHibzqzxLhB6v/bV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWa1fNNoy60VBs2wvF9c5+iCP7gcgEdhLnUi0tcu0k=;
 b=NdPf+ODT/SMtEhiF0j29wKldEVnUICqydev8LRWTSjvuMJ9shG6GrigzBk/QQiBhueH2dhXQcezAyF7y0dJ9LLsIPHisJPg40b9f1TdjIUy+AlsZFkyhx2+LFlizeKvNVArfXzQcUbbOnm90YpoKPp2a4emQ2eOfThkKhSUzuhmv4uBr/XpDlR6+49nCVD2B5Goj/cpZxJu/XIxJWCGWLW68/Zg2AdMjTiZ4YLkr65WIl4LI8SrAfviBVvXcJKYyV9fofnXmZBLuB7qz2ppzfA4i5DdULtQUA8tRqv+h8ziN5smwQITHbI9T4D/3HCvEVJLXGNV1IZ0n8YNeUj1/eQ==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by KL1PR0601MB5510.apcprd06.prod.outlook.com (2603:1096:820:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 08:46:51 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 08:46:51 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Paul Barker <paul@pbarker.dev>, "adrian.freihofer@siemens.com"
	<adrian.freihofer@siemens.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>, Vince Chang <vince_chang@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v1] kernel-fit-image: Check signing key files
 based on algorithm
Thread-Topic: [OE-core] [PATCH v1] kernel-fit-image: Check signing key files
 based on algorithm
Thread-Index: 
 AQHc5E8yVorB/k0zaUColFebuiYitbYUEgWAgABDMwCAADlUAIAABB+wgABofgCAABCCgIAAAZlw
Date: Tue, 19 May 2026 08:46:51 +0000
Message-ID: 
 <TYPPR06MB8206EBF4659AB50D43FDA5FEFC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
References: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
	 <f8757960b4f15bf66d30fad45ab7b0a1512b036a.camel@pbarker.dev>
	 <CAB3asfiuneQrWbw28UeBf_+63xyuGdM0F6GdKE6wa+sSPoKqRg@mail.gmail.com>
	 <TYPPR06MB8206B723A776C8C292BE4876FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
	 <TYPPR06MB82067560309D2AE88ED0DD62FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
	 <ee619ab87ee5000ebc6aa4ffbd66a46f406d5c58.camel@siemens.com>
 <6ced517cf6e836d0cfdadcab83cc595317b27cd2.camel@pbarker.dev>
In-Reply-To: <6ced517cf6e836d0cfdadcab83cc595317b27cd2.camel@pbarker.dev>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|KL1PR0601MB5510:EE_
x-ms-office365-filtering-correlation-id: b5fcf8c7-a5d6-4e40-9db8-08deb5832ba5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021|4143699003;
x-microsoft-antispam-message-info: 
 7rwzNmc6P0iyHjMEgNgJCVrBiC7NQZDbY1WR5blAGV0OvhGjGp4OKrPieA2SwyqhEZzFrNWpmnYk4UodxLkGekDXAuSB7OP7LvxUUNHiYnHsQky9A42IR5BP1KoN0fcqC8KYrR5vHrxqsl3RT7sg53grpMvnSuBMm4dMUxzzv8zv/NDy2cT9W4UEulkqdjYQZUsG//o8Rmyq1fe7t4HUoVX+bNLN7eQcZReqGJBh6dn63iBtUBHu85JBxQpm2waalZOG2ki3uMypQX4ncHGcVl7xIxfvyYL461L5Spd8JgCCeG/On2w5fEZPD/8oGx7t5ictZd9Hhx00YAzKPJZPZQSyrdj5lIYsD9+O4jD5rAWN92mliQg00K7aZKMz8zBy/PGcXkoXiLkX1BvcWeOtOgPXyyrwG3um4wJxbVsLGPOUe1F/VlrkG+skiYQaj9gGyU+a/5dUjAi73jLg+zdTyrmCHuTFykneqoZBEM/iSK1ky+ZVMZtKREg9scU0ymxfdYHYd+WTzWHbwOVhGeneRujolAweloCAa3hggrgcItQdPcNubVuMMyG3kWTGjvZkna4WBE2zaDe8DWY0LXGxFr454r40yiOxSYwq8jIl2LUeLoJZNua2uyc+u46EBvGlGUg6Rq3cAuTEHurxcTQG69BJQcgos0ffbiHVSM14ykAI+/igqi/ghmZJ3HFTsik3n/2AUq2U+vEWKzI2T4YwPRwN4jSKvhg8TvBm44nwB1zvK/QUM3h4TCLW2v4PqYBh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZFNTa2F2NEtySXcvSmZLMytnbDdBdWhrclIySzRUTkZTNEI0SlA0VUF1bzFY?=
 =?utf-8?B?bnFTS0VaT2NMQ2duL3VvdXpNRkR0Sk1YUjVyeHpPS0tCYjRGaWk1T1NYSGVa?=
 =?utf-8?B?Um1yZzArYUJWbnhLS3hjcEZTcWxMRHBiRW5iRG95MUJXTEpKemR3dERXY2ZD?=
 =?utf-8?B?dFlNODI4Z1dhcVlGYXAyRCtLRFU5RVZibXhTTVRpbjFialVIUWorZ2dQcjli?=
 =?utf-8?B?WXpFdU0yTGhvRUNva3lMbDR2OHZ0S3o5NVBYRmFrV0tvQzRkQjR4V3JIa3JU?=
 =?utf-8?B?SzVRNXJFaWVWQmdvNkVhQnZVeTN1a0ZOcE0yNVMyM2lvKy8rKzdSL0tlNFRh?=
 =?utf-8?B?bW8zN3FDaVBPSU9tVzJ3dytremRUT2Q0Nm0zaTVsTTdSSmZwMDJjM1ZjVURC?=
 =?utf-8?B?eFp0QTlMMExieDNpcFA3U2hKRzR4dXM2UGp4WitYTmlNOHlLZGZ2c0pZaCtz?=
 =?utf-8?B?NWY5TW5PU3hvN0g1WTBQcGhOcWZTVkpaWHJqTU0rUC9McTZ2RDZ3QWh3dmhz?=
 =?utf-8?B?NkJZU3drNDA0dzNEcGpxUVIwaDZHQ2VDVFF0cHBjaTJ1akVMMzM4YU4rMlJp?=
 =?utf-8?B?RkhKVi9tZ3JNUGlzSExOVjRhZkdzQVlnRDBISDJaVVl2bmN2a0RCOVo0V2tu?=
 =?utf-8?B?TGo2TEJrS1ZORm0vUDhTSEl4bkFBZlRMQ0pmbVRacUlGODBaL2k3UmRuTkVj?=
 =?utf-8?B?emk2Mm8vZUV6dkxNUHpQamxVQTl2TXFON0hoN05wYUxFUnhJdVFBdlhiRW5y?=
 =?utf-8?B?QUN1WXpaOW5peXgxMTdkNEMvaDlsdm1RR1FFUlFaamsvbFdpZzZXYW1lWHdw?=
 =?utf-8?B?NVhBU3NSQmdUaVlrNXJXekNxVVV2dEphOWlSeFQzL0pMZXhBazZSVTZCQ2hY?=
 =?utf-8?B?d0J4bUtETWh5bVZrN0hkNkFIWjRRRUx0RG9Tc3FSZnVNa0NxT2dtV0ZQeHdt?=
 =?utf-8?B?WWJGOTNpTG9nTEZ0aFZjbksxVE9jVnJOY05UYU9MSlRYTnJVVjdoZUNZUFR3?=
 =?utf-8?B?azlxNmE5eTJYUEd5SXR0SnlTS1BUd3ZPN0JzWkVFbmlrQ0RjRjQwZ3hXS3Vt?=
 =?utf-8?B?S25UcElBTUVpRHVXSEtpaGlCc05oS0t1RDZuMk05TDRRaTNsbTRSZFRSYmNO?=
 =?utf-8?B?bHoydUtSTWlJVUtoeEsyK2ttSGJpYWFMcjZYZVZIcmFmdDlUckoxRkNja2Vn?=
 =?utf-8?B?aVJURlZ6Wm92WjRpNVMzUEVoMkZJVERRRWpvMks5Tzk4Y2RNOHZuWFdvVlNp?=
 =?utf-8?B?WnA5M0pmZWJ1cXEydklxak1nTENOdDRHNkNkbGlVSnRHbWNhYVVTaDY0dlo3?=
 =?utf-8?B?bHlPQUY1MHJnMUN3ZzFSSFQ1Sy96SmRRajZXYnNkK3g3MjRadXFoekFRbFFF?=
 =?utf-8?B?NFJSZmZxOGFqQjJSdVp5Y25rdjQxdFFsOS95QUhQRHpnWjluUU1WNnBnQmti?=
 =?utf-8?B?dS96bzZBeU9wVTlZbUpVMTMyeGFnbXVOYzdxdUxZSE82WHRLOW1yR1VnMkZ2?=
 =?utf-8?B?bGxmUGJhNnRRc1dvc3JFSSszT3YrZWgyTUJCd3pLVm5SRFpSZG9tVDhZa1pz?=
 =?utf-8?B?WE8xd1YwdWhML1d1blh6OFJaTEhFNHdMa2wzYWZPbUQ1a1krcVNkMU9vQnZN?=
 =?utf-8?B?bk4rNmNUdlBXc2hhdHVGSnA1dUVLaUlCcCt6emN2a00zdk9ublVYTEFNR21o?=
 =?utf-8?B?WHdKUWNPemhEaE1UQ2tRRkliVFhPMHdJL21qTTJLZnBQOTlFOUwxK2ZUaUtY?=
 =?utf-8?B?cmdJRERONUtUVXYwZXZxSktFM09jS05vMTlMNExFMDZQd1BUVXdhRDE4WHlj?=
 =?utf-8?B?VnhNZHozMTM3ZzN2VDZUNmhRanVQNmdEd1B4VVdmWFNiTmJRR3VHR3kyVDhP?=
 =?utf-8?B?dnZpWmJOcmxQYkY4a3d2V3ZFc0pNUXhtZHp4MmVvM2hzcWVSUnNxbWdYZHpH?=
 =?utf-8?B?YmNsMmdiajRHSm1JZnhpSkR0OGhnYXlQbGw4Y0o4ZUU0MGZpb2w3Q3RZNmp6?=
 =?utf-8?B?WkQwNk50a3FJQ0RvSFBIRlZ3UzF1RlpuTGRyMEJXV2dnQkVheWhTdGoySWRB?=
 =?utf-8?B?YTI3RGxTSVdhaElVWkVHa25VSUlCRUFTSU0wbUp0SjVKcGhXM2g3SXhaNENt?=
 =?utf-8?B?UWhLR28reUhDSzVwNVNTUUMwS1ovbUJQV2ZXSmlvUmNWQTdXZFJtWEJOMlRR?=
 =?utf-8?B?clFVbzBSKy8rOUF4eVgvbzEzMkRFaFd1alFpYVBTQXVNR3pDclFmaFh1Zm1l?=
 =?utf-8?B?Y1RjTldkWWdrTXg4QkZwckxqTytMaVl2dXZNNHQzMXJYOWZSREVKaDZTOVJn?=
 =?utf-8?B?SHVOZDZQN05CaUNnTEtIdmVYT3lxaE1CaUZnT3NLanRWMzByakV4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fcf8c7-a5d6-4e40-9db8-08deb5832ba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 08:46:51.0164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUaWIaz/FDqCG9XFKX8JNd8FKiF6+r2EY4th84Z5iYD8ZX7a8WV+KOIsAABiFsMw8+/+aT6MzUZ/cKyvOc/dDLXKRLIirYy3b84xMKhSHRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 08:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237293

SGkgUGF1bCwgQWRyaWFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
UGF1bCBCYXJrZXIgPHBhdWxAcGJhcmtlci5kZXY+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAxOSwg
MjAyNiA0OjMzIFBNDQo+IFRvOiBhZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMuY29tOyBKYW1pbiBM
aW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4NCj4gQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBUcm95IExlZQ0KPiA8dHJveV9sZWVAYXNw
ZWVkdGVjaC5jb20+OyBWaW5jZSBDaGFuZyA8dmluY2VfY2hhbmdAYXNwZWVkdGVjaC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYxXSBrZXJuZWwtZml0LWltYWdlOiBDaGVj
ayBzaWduaW5nIGtleSBmaWxlcw0KPiBiYXNlZCBvbiBhbGdvcml0aG0NCj4gDQo+IE9uIFR1ZSwg
MjAyNi0wNS0xOSBhdCAwNzozNCArMDAwMCwgQWRyaWFuIEZyZWlob2ZlciB2aWENCj4gbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBIaSBKYW1pbiwgaGkgUGF1bA0KPiA+DQo+ID4g
QWZ0ZXIgbG9va2luZyBpbnRvIHRoZSBjb2RlIG9mIG1raW1hZ2UsIEkgYWdyZWUgd2l0aCB0aGUg
cGF0Y2guIEl0IGlzDQo+ID4gY29ycmVjdCB0aGF0IHJzYS1zaWduLmMgbmVlZHMga2V5ICsgY3J0
IGZpbGVzIGJ1dCBlY2RzYS1saWJjcnlwdG8uYw0KPiA+IHVzZXMgYSBwZW0gZmlsZS4NCj4gPg0K
PiA+IE15IGNvbmNsdXNpb24gaXM6IFRoZSBwYXRjaCBjYW4gYmUgbWVyZ2VkLg0KPiANCj4gSGkg
SmFtaW4gYW5kIEFkcmlhbiwNCj4gDQo+IFRoYW5rcyBib3RoIGZvciB0aGUgZXh0cmEgaW5mb3Jt
YXRpb24uIEkgdGhpbmsgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZA0KPiBjb21tZW50cyBzaG91bGQg
YmUgdXBkYXRlZCB0byBzYXkgdGhhdCB0aGlzIGlzIGR1ZSB0byB0aGUgZm9ybWF0cyBleHBlY3Rl
ZCBieQ0KPiBta2ltYWdlIGFuZCBmaXRpbWFnZS5weSwgdGhlbiB3ZSBzaG91bGQgYmUgYWJsZSB0
byBhY2NlcHQgdGhpcy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IC0tDQo+IFBhdWwgQmFy
a2VyDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQgc3VnZ2VzdGlvbi4NCg0KV2lsbCBjaGFu
Z2UgdGhlIGNvbW1pdCBsb2cgYW5kIHRpdGxlIGFzIGZvbGxvd2luZy4NCg0KDQprZXJuZWwtZml0
LWltYWdlOiBWYWxpZGF0ZSBrZXkgZmlsZXMgZXhwZWN0ZWQgYnkgbWtpbWFnZSBmb3IgdGhlIHNl
bGVjdGVkIGFsZ29yaXRobQ0KDQpgYGANClRoZSBzaWduaW5nIGtleSB2YWxpZGF0aW9uIGluIHJ1
bl9ta2ltYWdlX3NpZ24oKSB1bmNvbmRpdGlvbmFsbHkNCnJlcXVpcmVkIDxrZXluYW1lPi5rZXkg
YW5kIDxrZXluYW1lPi5jcnQgcmVnYXJkbGVzcyBvZiB0aGUgc2lnbmluZw0KYWxnb3JpdGhtLg0K
DQpIb3dldmVyLCBta2ltYWdlIGhhbmRsZXMgUlNBIGFuZCBFQ0RTQSBrZXlzIGRpZmZlcmVudGx5
LiBSU0Egc2lnbmluZw0KdXNlcyBzZXBhcmF0ZSAua2V5IGFuZCAuY3J0IGZpbGVzLCB3aGlsZSBF
Q0RTQSBzaWduaW5nIHVzZXMgYSBzaW5nbGUNCi5wZW0gZmlsZS4NCg0KQXMgYSByZXN1bHQsIE9F
L2ZpdGltYWdlLnB5IHJlcXVpcmVkIHVzZXJzIG9mIEVDRFNBIHNpZ25pbmcgdG8gcHJvdmlkZQ0K
dW51c2VkIC5rZXkgYW5kIC5jcnQgZmlsZXMgb25seSB0byBzYXRpc2Z5IHRoZSB2YWxpZGF0aW9u
IGNoZWNrcy4NCg0KUmVmYWN0b3IgdGhlIHZhbGlkYXRpb24gbG9naWMgaW50byBfY2hlY2tfc2ln
bl9rZXlfZmlsZXMoKSBhbmQgdmFsaWRhdGUNCnRoZSByZXF1aXJlZCBmaWxlcyBhY2NvcmRpbmcg
dG8gdGhlIHNlbGVjdGVkIHNpZ25pbmcgYWxnb3JpdGhtOg0KLSBFQ0RTQTogcmVxdWlyZXMgPGtl
eW5hbWU+LnBlbQ0KLSBSU0E6IHJlcXVpcmVzIDxrZXluYW1lPi5rZXkgYW5kIDxrZXluYW1lPi5j
cnQNCg0KRGV0ZWN0IHRoZSBhbGdvcml0aG0gYnkgc2Nhbm5pbmcgYWxsIGNvbW1hLXNlcGFyYXRl
ZCBwYXJ0cyBvZiB0aGUgYWxnbw0Kc3RyaW5nIHNvIHRoZSBmaWVsZCBvcmRlciBkb2VzIG5vdCBt
YXR0ZXIgKGUuZy4gInNoYTI1NixlY2RzYTM4NCIpLg0KYGBgDQoNCg0KRml0aW1hZ2UucHkNCg0K
RnVuY3Rpb24gY29tbWVudCBhcyBiZWxvdy4NCg0KKyAgICBkZWYgX2NoZWNrX3NpZ25fa2V5X2Zp
bGVzKHNlbGYsIGtleV9wYXRoLCBhbGdvKToNCisgICAgICAgICIiIkNoZWNrIHNpZ25pbmcga2V5
IGZpbGVzOiBFQ0RTQSBuZWVkcyAucGVtLCBSU0EgbmVlZHMgLmtleSArIC5jcnQuIiIiICAgLS0t
PiBDaGFuZ2UgdG8gIiIiVmFsaWRhdGUga2V5IGZpbGVzIGV4cGVjdGVkIGJ5IG1raW1hZ2UgZm9y
IHRoZSBzZWxlY3RlZCBhbGdvcml0aG0uIiIiDQorICAgICAgICBhbGdvX3BhcnRzID0gW3Auc3Ry
aXAoKS5sb3dlcigpIGZvciBwIGluIGFsZ28uc3BsaXQoJywnKV0NCisgICAgICAgIGlzX2VjZHNh
ID0gYW55KHAuc3RhcnRzd2l0aCgnZWNkc2EnKSBmb3IgcCBpbiBhbGdvX3BhcnRzKQ0KKw0KKyAg
ICAgICAgaWYgaXNfZWNkc2E6DQorICAgICAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKGtl
eV9wYXRoICsgJy5wZW0nKToNCisgICAgICAgICAgICAgICAgYmIuZmF0YWwoIkVDRFNBIHNpZ25p
bmcgcmVxdWlyZXMgJyVzLnBlbSciICUga2V5X3BhdGgpDQorICAgICAgICBlbHNlOg0KKyAgICAg
ICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhrZXlfcGF0aCArICcua2V5Jykgb3Igbm90IG9z
LnBhdGguZXhpc3RzKGtleV9wYXRoICsgJy5jcnQnKToNCisgICAgICAgICAgICAgICAgYmIuZmF0
YWwoIiVzLmtleSBvciAuY3J0IGRvZXMgbm90IGV4aXN0IiAlIGtleV9wYXRoKQ0KKw0KDQpUaGFu
a3MsDQpKYW1pbg0K

