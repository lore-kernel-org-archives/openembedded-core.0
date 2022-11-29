Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE93C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 15:52:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web10.153050.1669737141795812660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 07:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NaVByp7G;
 spf=pass (domain: arm.com, ip: 40.107.21.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLw5MdciTT6vvClj78jCWCQqhsc3w+3G5DMk/ZYdlFdHTzDsXMK/dBTxOjxVA9p8s1CEitccwMdxE4VF6LCwoCXuxbQjjukFTJrt8Gy2Quz9mtdMU1xhYOogYGyOa+mXhQy598EfE2NIhsF0BVrqp5hmLKl9b82WJ/qZIpL+xbmJ1HmjxIvyj2vcZyl3oTULz8Mn4EzO+IgE93ov8jF2FQxSyEGD3att/lBk7hPK34gjQOCEPtzR9w9bcmLTxZBjfZERXtSCQke0KElCOZ9icIwYqfYdnDdjkO6ZAXhxew5JvCCSBkUJiT2p5ugCQwVjioRhnuAlAry4aZEuzo55eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP7rfurliSHTpGb1BhSLFLisiNs9hD2NoSNi97uqQZA=;
 b=MkKq2f391zBJZsfABotiRWUynufurnMKM4eag8VCyXVtGXFtr2WDTk07JGTFhSjDHDa64f1eMHbFyygKD3iSmInXhFkvxEADpyDmOppL2O1qpGlMoyVaeqcIdRS0CrYaVclaCCAt21AucaoCM/cPwQEJLIZF4c5h5sBN1rDa8CBMdshK2qsCCNyLK+chBfqKjmbF40yI0U0+TB3jxeLBg/NdyZx/f/hBFWzjC4wYtGGHm7/UwjyhnuY8riIxIbgqvUWc8Zzn0MPiMluaV4iHxrbQ7Kb0zFTWert+HOxxJ6Lsq4shfhCWt/Zcks9ap7LAN64JxRf25b69OOSv1sUM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP7rfurliSHTpGb1BhSLFLisiNs9hD2NoSNi97uqQZA=;
 b=NaVByp7GR89fAqlKZumOT2q2T8G0SMGK/P/kTxd5c+N1tGRnTKUfX7ZzGXSqPR+VDuZ2X76fWforrneg0pHpMFHlPC9rWLA18fXekJv+dq1/g18VDOPWEUoKVP7i47I0az4zLb1YfDNKMXYhpSW9Yg7TnwYYvV+b3t3tdD7LFwE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8271.eurprd08.prod.outlook.com (2603:10a6:150:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 15:52:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 15:52:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][master][langdale][kirkstone][PATCH v2] rng-tools:
 backport patch to adjust jitterentropy library to timeout/fail on long delay
Thread-Topic: [OE-Core][master][langdale][kirkstone][PATCH v2] rng-tools:
 backport patch to adjust jitterentropy library to timeout/fail on long delay
Thread-Index: AQHZAqWVqmDOjJd/YkO7H3a+R94OKK5UEW2AgAH+WIA=
Date: Tue, 29 Nov 2022 15:52:17 +0000
Message-ID: <0ADEBB89-0C61-4976-946B-4A0E1B997EA4@arm.com>
References: <20221127134909.72700-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj95YNhEgK+ony5KyLo_DBXJg-wE8cD7F9xVH4vDMELqwA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj95YNhEgK+ony5KyLo_DBXJg-wE8cD7F9xVH4vDMELqwA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|GV2PR08MB8271:EE_
x-ms-office365-filtering-correlation-id: 3c457cc1-95b0-4459-19e1-08dad221b144
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VzTaa+Azf0F0K+NBJidxaBBnk4htbef/2SHRVMzvUn9ht/DI3WYfcfsVSOEAFB4ueh6an44dFWAD4bfiBvOZhuDH548qxf6HmR58e6HafPjIweo+pzlnHfU+l8Npp5PUTrMBzyqvbHxX6TLP9X5FCtS8C0bNzmtYnPBm3YEVInbOGr1BNLMiNz0Z6GOFFmQjhBjRFuWkDTiQG9cBbXFIh0uoHMDjunCVLs0bLWi65O28mWzFi8v2KKFprU7SBgYjHSomiguTGq8PQXevHfbHOI8qhpLPIDpnvXRAC6fEiW4qFYDboRuXoMkUXudxwsH1mMZvwa6osPzYan+rzSeCkxF+6ye5FNdbUIDOcZ/MT3IZrulgj/oSN0vTLHYqLtTYI/dUUkumvgRmqaOWrLIgOuifqsodXDUIhSWxwIYc6iEZsEoEPmGSPryMxhiv5y+u60auQsfwTNSg49wffaeq8as8l0Z7oe2hXjSoslJd/cn/EHHu9iib8HU9cXDliZI/tEGwduvqrfbiQvSxZGOLrxM9PcyAKtEqdkUgnu45PZMypNg3PN1r/Tso6LMZ+XhKNLPCz532F7jiqN0V+f/GS6PssdiGCyR7S6EZnVSy7FldcQaLjcr5cMiE9RpvqzW0i4kQNAmA9ximvJ1GAn6P8XWKSpvC8bxSXQZzHEUPDnLJGN2fYB3R9ql0CxR1z0O3quhOGtXIWtn52t5MYH4MkE/aRtfdcH2fx21XoKN/BTKKv8uYDrRbVuduXDRi7V3uLLDeSaT/+IEkmjKbirLC+A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(2906002)(6512007)(6506007)(966005)(6486002)(478600001)(86362001)(38070700005)(36756003)(33656002)(122000001)(2616005)(26005)(186003)(38100700002)(91956017)(76116006)(41300700001)(4326008)(5660300002)(53546011)(71200400001)(66946007)(8936002)(4744005)(66476007)(316002)(6916009)(66446008)(8676002)(64756008)(66556008)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?blFkd3RHOEVleFR1N2VxOEp3Z2ZRbTUrWThmbjIzdWhGS2lXOEdpZVV3MDFs?=
 =?utf-8?B?eWN5czQva1NlQ3FZZ3E1OUphTXN3UHFPU0tpOFlQWEh0TWpUOXhBRndVWkx6?=
 =?utf-8?B?Z0lwMzRXbTh1YTZZdCsxS1Rib3VWaG1peW1rcEw1NzA5cUVLWWxldFNkR3Fx?=
 =?utf-8?B?RGkybzZQVnlXdzl4WnR0WmJyb0orRkxvVS8vV0NsYnpjRVA4aTBkYlQvMmcz?=
 =?utf-8?B?WFI2cWlpMnFWNXYybHpMM1Iza0wwVGh1Und3NnQ2dTJ3LzdOYzlFZzJEV2dz?=
 =?utf-8?B?RGc1NkhDbzN4YTVVUk4rMlRsczh3S0cvTHBsWnNwNlIzN1pzMUdnS01rMDNq?=
 =?utf-8?B?YXVCTkRKcjloMWhQbGZKNU9tb0xGbWd5YzgyZHQvVVJmZHU4cURtdmJ0RUxL?=
 =?utf-8?B?eDdhbERPQkZiTkdhclc4aDR1aStoZk5Kd2tGckhFTlZ2cnoxdUFmdGdwNitP?=
 =?utf-8?B?VnRQaVVzWWRUOHpxRGIzUFViQmREWW9HZzQ4cEpmZ1l4Qm5URm80ZitwVTZU?=
 =?utf-8?B?RFJ3WDh2eG56YldDbW5nRE9sZmxGM3d4elYyUGoxWlRtUndJR2Mzb3lVV1VN?=
 =?utf-8?B?MHhFY0FtbVpZTDVtVDNXYkZwdkRHU21lSWsvRUNpOHJOalVJOHpUV1RuZ2tO?=
 =?utf-8?B?TEVrcGlRT0VEQkJOclNDSXpoMUcrMCs2ZEJQS2gzbk9HM2cvRzNxa2tXSEE3?=
 =?utf-8?B?UXVtUjJxR1hBQ3JUR09zbW8yYldKSlhWMWNidCtMcHRtc3AwcFdVeTdRQXZF?=
 =?utf-8?B?UDVvV0NuTzVRT3hqQVV4T3pPeG1nbEpleXBHR0lNZ3l0Q0VPdEkyUmtJOThF?=
 =?utf-8?B?UFBRUk9DQS9JWmZhRndIS3d1SVVVS3R1OVYxYWt4eW9BRjg0VlBPU1BjQW5k?=
 =?utf-8?B?bXN4TmNmK29RN0JHSXdzSDhQOXhNN1hCWG5OYmZUS2xQODhoMXR2M3ZjNTVl?=
 =?utf-8?B?RWRWWVZyN00zOFFZMmR0enlvRlEwaUozOWhDOGtXVnZBekZZK3JBME1wOHZB?=
 =?utf-8?B?aFdnSGtxWHRteUZ5eGd3WU5qNGtobzJiSFJIVTgvTDF1UjdaRWJZSG85Y0RX?=
 =?utf-8?B?T1NaR3RPc01mRGtadlh5dXBscUVDa1dobTdwcVVreENJSXBSR3pheWxmcWdh?=
 =?utf-8?B?ZysyMUlNYkpqRi9XQ01Edy9EdzQxRGEyVHZPOXV3WEJWTitrb3NyQWV1V0tD?=
 =?utf-8?B?ZzdBSWJENGs1OTVxMXFnY0dUR0p1a29LN0RSaGQ2RTBMR0d4NjdCRS9ZZHpH?=
 =?utf-8?B?a3hZRENDWHpNK1ljYWp4U2hPdDdoTWs1d3V5MXp6TFpNcVozbDJVTUl6MzNl?=
 =?utf-8?B?NDFERUF1Y1hrWHVFOU5PYThIQjkzYUE4dEtpOGUvZGlNMit2czI5OGs3aVdX?=
 =?utf-8?B?VTlUdmtjZC91RTV5TVdpZTkvejZvb1hIcENKNFdDSDhYRC83TG4ySHBwWHdV?=
 =?utf-8?B?ckQ4Z3VJTGFiaGxqVTFibm1Bb1Vyc2pNWkYvaHNld3J6TWV4Uzd1d21lZUpF?=
 =?utf-8?B?dGlkWk5NbFQwLzF4MzcrTW1sU21PRjU0V3ZLQWQ4My9kYWg1L0l6SkhnK0R4?=
 =?utf-8?B?TC9aUHZsYTRsTFhrNE5jaFdKY0xRckt5U1lLOEpvaTF0L0JMOG1PZkt1T3Ju?=
 =?utf-8?B?UnUwemI0bFFqa3pRZUludHFCN2Z4UGQ1dXRFeXhid2c4alpPblpqeTZNM3F1?=
 =?utf-8?B?SXpxclQyMDVCR3hxRlplWGtHYUpxdFFRL20rdm9SSVREaFlObDVqeGRxdEhm?=
 =?utf-8?B?dlpKTS9HRDMzL3hEeExROTJHVWFPY1Q3b0VDZ3MrY1RSRjg5ZDdaUmlrSS9k?=
 =?utf-8?B?dUR6TFRBMWVielZaaUlua3N2N2hmdUl1Y2FqRER2blBBc2crSUkrblp1akln?=
 =?utf-8?B?Yi9WL0RQb0Vad21MODlVaDJzUmhwbk9CQUp1bHJmWlUrd3FRTnh4bHJCNUlk?=
 =?utf-8?B?eExGcFBBcVNUMGMzRSt1YWMzdWg3R3p3WDczNjhhNHNhMlNWZUFDRDEydEYz?=
 =?utf-8?B?OHd6N3ZkZVFqZUVZMXBkMUYwK1cvdzhYZlFpSGNYdjFxODVpUzI5L3g2MU1p?=
 =?utf-8?B?Z05BMXA2RDhqcHdheG5yb2hKRUgvMlA5Q1E0YWxNRnZaUkxwMTdjNjR2amFT?=
 =?utf-8?Q?1ykIIWy7mS95Y57PXeDN5PbKN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56100C918E955D43A9B0FF393EAEC50C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c457cc1-95b0-4459-19e1-08dad221b144
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 15:52:17.5650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIL0QWgdNIfplxlmFXVE68yx6JBQA536kLxIfcA8j1Jm2T/JXJQD/Sv9n+Y1lZWGhLH/oBY4nWAzvclz7JXQgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 15:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173981

T24gMjggTm92IDIwMjIsIGF0IDA5OjI1LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFN1biwgMjcgTm92IDIwMjIgYXQgMTQ6MzksIFhpYW5neXUg
Q2hlbg0KPiA8eGlhbmd5dS5jaGVuQGVuZy53aW5kcml2ZXIuY29tPiB3cm90ZToNCj4+ICAqIGFk
ZCBsaWJnY2MgaW4gUkRFUEVORFMgZmxhZyB0byBzb2x2ZSB0ZXN0aW5nIGZhaWxlZCBpbiBjb3Jl
LWltYWdlLWZ1bGwtY21kbGluZQ0KPj4gK1JERVBFTkRTOiR7UE59ID0gImxpYmdjYyINCj4gDQo+
IFRoaXMgbmVlZHMgdG8gYmUgYmV0dGVyIGludmVzdGlnYXRlZCBmaXJzdC4gVGhlIGNoYW5nZSBs
b29rcyBsaWtlDQo+IHNvbHZpbmcgdGhlIHN5bXB0b20sIGJ1dCBub3QgdGhlIGFjdHVhbCBpc3N1
ZS4NCg0KSXTigJlzIG5vdCB1bmNvbW1vbjogaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qu
b3JnL3Nob3dfYnVnLmNnaT9pZD0xMDk1NA0KDQpSb3Nz

