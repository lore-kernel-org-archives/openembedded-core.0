Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC16C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 15:14:47 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.66])
 by mx.groups.io with SMTP id smtpd.web10.7.1706282081036239206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 07:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=pCy6ZGvS;
 spf=pass (domain: infinera.com, ip: 40.107.223.66, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTo4WeIhl+zwEm+nv4HTxOxgzYn7eZy0v5E6OCD9G/VB2j3jEdLmOOxSTrIfTPxNglHc7+0IaAHwiL/KI9+dcZPGQIMVu1GsHQn9wT/SmGM9+PIZZYKA9DzBPX5dkH7I06R5a3Axv5rRA1yGF4fxnMYLrj310HFKRadixIHBgsIvfr0owosyNy0i2b1Lo6v92cDE3gGwBsN1Yww/H0kP8TGad34d6JqmQ55UIUV4gUh35T7vz5pccmZtoqaZI5QIZ4+0m6oTPLWxR42eMORfQhWd8jVRAUqlMacNy0p+qqqT80UPlBP1wA7L8/abTirdWdE5P2h+D/taj5fXjqvgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8kkSyusDPn7gIbl7g3l3W3l8zWgSXze0PXKWFHdaoM=;
 b=jUBge1uJbOjOjIv+sK2GL7eYgILXDlfnsRchUNrG37K6ZjhgeaW1k5cwn27daRmG5kdhfVaK4si40QCV7bhfyKpuCryBXK2uin/KrgpV3P/NTJYvzqR4SkR85hAP5PJ8gOFnvyNx3I2ASZwKKWJblgj0MfIUc9lVXTBswyBAQFwhVCGwIXEq5ztmAfgL0lJqcRKHa4jwoLnvIadkAVoax276SVuOfjC5XJhcUeo21hFzOCMxddm9P7xISGhgIvdN5SvjRA7Pr18Ac9TpylZnldaY/htgr64T0Wusl7VJxCm/g8OwWdDz7FrtOICz1+akQVPZko44LL4I3Bv6r4jQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8kkSyusDPn7gIbl7g3l3W3l8zWgSXze0PXKWFHdaoM=;
 b=pCy6ZGvSjmekI26m3DKBnuoCyRHLR4y1y5SDbQqVgITDWpswiQ74cqR0UI7FbDcKMRcXRkyK29dKZa+BUjJ55qXQMaLvRT4NXEVeminpQCsWHOl53mCPStOA7EXI5Tj39JyLbQBXdn4vU+4Mi4mUzwV+tY6wDw1LSrRVF04sOwGpG2fSLPgrx5qLHX9WuiuuKUaFoyJYUwKk5UVns20FkmT8fnw9YZV0rdJ0WJI6kVDT+Wvd3HVqIRZYvT7BgvZC5q0DUeQacN+dneUXGfWgA2Jj60/BBarD15ZJL3Ra+LBWgztOOqwLkBcdAKannD3c1LGhIJprtnV4HjIYJJvAXQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CH2PR10MB4391.namprd10.prod.outlook.com (2603:10b6:610:7d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 15:14:37 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 15:14:36 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Topic: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Index: 
 AQHaUEgkMNzCIETAnkmJ7AygmSs1ubDsAvKAgAARooCAAANfgIAAFguAgAAAwACAAAVwAA==
Date: Fri, 26 Jan 2024 15:14:36 +0000
Message-ID: <7d151635479f421df3e711f39ad99fef71b2f833.camel@infinera.com>
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
	 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
	 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
	 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
	 <7b811dd50bf9451b3a221c547fe13328f2dac140.camel@infinera.com>
	 <CANNYZj-sad7Cb8iVae=mACp55vYu8b-K9Gr69jTFpWaD=fQgmg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-sad7Cb8iVae=mACp55vYu8b-K9Gr69jTFpWaD=fQgmg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CH2PR10MB4391:EE_
x-ms-office365-filtering-correlation-id: f27c4dfc-0cd1-446e-6069-08dc1e818277
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TQzN+fZVSeyjmK7j7ydc67ro36zBP6mtUAPhzGo6zupSDlEEaMuerlxIgl5z0vC+nYOHOkJZJ6AA/RMl7AHs18ylEY/JkCiRSJlxwKPnix9iVKVZpZdelxDpy3kjEfp/QKuJdiunc7BHpwQDtVPYdEEB9lGvoekO+a4AeTh9aH1Qt1Fv5X/1EsoAH3+NNrl6pyLogFq+u9DwPDBA4OURP13Wzp/VZE2wAmhCdyqWWuG+HqmdRGbM8NAuuxf2QD4Pcspub/Sg1S03EAphfygtZCY/WK6DKAezECwnHB8ru+yOod0X/LiaJ/0ZxOoByuazXM43A34Rlcxo+AuzUKP4r81SajcYWp4uFoTkAtI9AN28s2oDBceI98YbK7qQAFba14USrWQwzmOtfjDhD/iIwDygUIbiPaVWthvf5eZaCJ6ewveqQuxZvHTgd4u/c1wqvQ20n2/76xnezUPk0E/eOZpMiJS2B82o5Lw3uUPEZ0x4oTirrxWcdl6DPGc+hSaAsGfVKU0GxaMWXdy/Csn6V90y+tUdC+firTfZOMhQjSBX5jUExFR3D9+UfdHc+1dmL2x7BmxOZ0/kzZtDFMs2cwWHsebx7+Q7wn8X+YewsSy90mc5s6YehCsYgoEqwUc3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(39850400004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(91956017)(5660300002)(4744005)(2906002)(478600001)(66946007)(8936002)(66556008)(66446008)(4326008)(66476007)(64756008)(41300700001)(6916009)(76116006)(316002)(8676002)(38070700009)(36756003)(38100700002)(86362001)(122000001)(71200400001)(6506007)(2616005)(6512007)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c1VVOWl4WnJFQXVjaVdvaWRlZHNINCtmNFF5aUd3TWZtVjlJQ1VIcDRHdGlD?=
 =?utf-8?B?VC9rTzRacXk1UXB2dml6bldwbHplenBmMHFjSmJyZG5XQ0tWalJubnIwc0Zj?=
 =?utf-8?B?T3lHU1VzUUV2MFRBdUNjbjNUa01OTE9KZXlFZ2pWWWJXajZWN1VVdUFwaW03?=
 =?utf-8?B?NTFGNk1aVGUvRysyZHdiT3RvK2QvbkJqeDBVanFqWC93bUgrSEwyM2EwSHRM?=
 =?utf-8?B?TEVjOHRRbU01bDduQzN6U3ZKd1ZTcEZyU2lsaHlJSFdYWGNtc1FnalZuVDhH?=
 =?utf-8?B?ZVNYbjJvalRMVEc4cFR2aVo4V1pnUGlVcGtsS0dGKzNRUEhIdXFHV3VrZjlE?=
 =?utf-8?B?MEd2V3MwdE5waWpGR3RlRGpvN1phZ3lSTk5maFB3QVl0ZUoxUHFBdVEvYkI4?=
 =?utf-8?B?czFJejBIdHBkc1JPWHZoamNPbWZtYy9YOTFlNE44V0pmTjZqTUJBaHlGNE1t?=
 =?utf-8?B?bnB1YnZUQmpRNjFHNjhQcE5YcG9saFR1SjIxOTZjQmRHNElqbVMwSnY3emJi?=
 =?utf-8?B?M3hmSDV4ZS9udWdHZ09XOVMyK3JRQVZmYU5MSWNrLzAxaE5EL29wdVVOMTg5?=
 =?utf-8?B?ZndpZzUxTG1pcmJJcmV3SElTS0N2WHVRV2lFWmxBZWRLQTZHcFdud3VDam9P?=
 =?utf-8?B?YWI1cTVJYVVFWFYrUW5BNkxLQlV2UFpNUmJGaUdtaENVeUd3ZkYzWURHVkta?=
 =?utf-8?B?QXlNUHhmK2FVSGhjNFZLaXBMU1hmWW5KdXUyNWdXaVZ0WVJvbXVydWFYNHhJ?=
 =?utf-8?B?UUhDNXJNSjE5ak0zS2taTmtHN1cyT0FyTkpYTEJQOURTTllmMjJ5YjRqaDdj?=
 =?utf-8?B?NFBUQjRhaWgxRHRyS2xYNVhWSHZLTTlGaTlGcS9TUk10SGdEakdqMHJkRlM4?=
 =?utf-8?B?cnVrbEdmZTdhWUJuQkcydkNZeHJ3ZkR5SUxjZEJLNjc1WGNRaVgwTVR3T2V5?=
 =?utf-8?B?em1mRFNZa3RNTlFHN2FOcnVsc254aGJFU3dJb2J4bGhkSXRZQk8wZGRmM0E3?=
 =?utf-8?B?VDBsOVMvVFlWQlhlNHpPajFMNm43Y0RCNCtySlhyd3lzUHVsL3BhcS96WGVE?=
 =?utf-8?B?RzlLWXpRWXhKUmhFcTFXY2NmVzRTU2FMRWJCVUJGWHBtelhldCtBcFE1UldX?=
 =?utf-8?B?NVdvRHViTVdpRy8wMTlmRjJ1OFVZOFBvK3JYa21NdHVKaE1HbUZaeEY1U21J?=
 =?utf-8?B?ZiswUmVwamptYnE1d3NvNU1hZ0JkQnVOR0ZCUkRPWG45Qk1NS3hKWUZHY0pj?=
 =?utf-8?B?M3ZMK1NBRG1yVTNwdURlbVp3dGM3L0dlTmloQU9zMnYvVEY0cytnaCtvMzAy?=
 =?utf-8?B?bFRvbHZHL3lFV3lVQXJNNGhCMEVpZkZITFdFbytxZXFVVGxSZDI1bVFRWW1V?=
 =?utf-8?B?dVpJMW1NbzJraThEdW9OazhPVXlBSElyMkhmNHQzYVMxYmxaSXdPckNkZ0xx?=
 =?utf-8?B?Um4xWGl5aFRYa1h2endVa1lOenhNOFRBSVdtd2hINzBVTkdjcUpibnNXQlp1?=
 =?utf-8?B?Nmw0UFBuV2RNMWROd2pTdkJsMTk2RlRVS3d3Rjd0SVhnRnI1OHArbk1BNlps?=
 =?utf-8?B?U1hrNE5NaVBRODU1bXJUT0RlK3UwRDhaajBlV3ZrU21EZitma3dGUUxWSTc2?=
 =?utf-8?B?aGpZdGJEWnVHZTdZRlBaK3RuTlA4UEV4Z0RiZ0NQMFkyNFk4cmJZU21mTy9B?=
 =?utf-8?B?bjdqNTRnSjR5S2VubG5VRjVKOEloT2MvbjJBcjVMTnNWVnVNUXJ4VVFGRFdy?=
 =?utf-8?B?Lzk5MHlQZ3VJSFBBM1VWMXpjbVJ3NmRBV1FHZGhJYjc0ZDFnbklTUGYxUFlJ?=
 =?utf-8?B?ZGdCQ3R1b0JWZzkxeWpIc3J1eFJyMS83UG5heG45enpmempRWmo0OER1V1F1?=
 =?utf-8?B?WG1abE1rdVl2eFA1bGlmWDlrdkpNbTNGVXovT25UMVBtUjZ6cnpUaUZoVHJD?=
 =?utf-8?B?bVJSSmwrWnEzSmdvMXI2M2xPR0YzVzBGdDlwMzZTM29hSEd6VEE1ZG5UUDFD?=
 =?utf-8?B?ZG1pcUhaZnBoREtUM2xPZDVNWVNEbzZuQ1FZSHo2WWtkWjN1SU9uNDlOZXJZ?=
 =?utf-8?B?Q0QyM1hQSURibnpXQjlTME1MNW1kb1ZEc2tnWFBHN3lwTUpVbkU1Vlg1aGUz?=
 =?utf-8?B?UE5lZnRZUnZoUWlrNWdEUW8wUUw4MEQ1MXlZOWFWeFp0RTFHQnEyOWRLeDc3?=
 =?utf-8?Q?ofmnz6obhlRtoO1OgsHn/FojMhIQBQ4m+uXtIFgBbuV2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <491AB996E080714FAF7EE344B3D90568@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27c4dfc-0cd1-446e-6069-08dc1e818277
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 15:14:36.8107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6x616bq7/hdiJSTVke8gHI0bZ8XHfCjqxcr3C+YYIPD+wXfGQjwMy94D69Pbn3V+mEHcZ9AbO4rMCfQkVTxEsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 15:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194390

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDE1OjU1ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gRnJpLCAyNiBKYW4gMjAyNCBhdCAxNTo1MiwgSm9ha2ltIFRqZXJubHVuZA0KPiA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+IEEgdGhvdWdodCBqdXN0
IG9jY3VycmVkIHRvIG1lLCB0aGVzZSB2YXJzKFNBTklUWV9URVNURURfRElTVFJPUywgYnVpbGRo
aXN0b3J5IGV0Yy4pLA0KPiA+IGRvIHRoZXkgbmVlZCB0byBiZSBvZmYgaW4gdGhlIG9yaWdpbmFs
IG1hY2hpbmUgd2hlbiBidWlsZGluZyB1cCB0aGUgU1NUQVRFID8NCj4gPiBJIGZpZ3VyZWQgdGhl
eSBqdXN0IG5lZWRlZCB0byBiZSBvZmYgZm9yIHRoZSByZXBybyBidWlsZChpbiB4eHh4LXN0IGRp
cikgYnV0DQo+ID4gbm93IEkgYW0gbm90IHN1cmUgYW55IG1vcmUuDQo+IA0KPiBNYWNoaW5lIGlz
IHR5cGljYWxseSB1bmRlcnN0b29kIGFzIE1BQ0hJTkUgc2V0dGluZywgcGxlYXNlIGRvIG5vdA0K
PiBjb25mdXNlIGl0IHdpdGggYSBidWlsZCBmcm9tIGEgc3BlY2lmaWMgY29uZmlndXJhdGlvbiBp
biBidWlsZC9jb25mLy4NCj4gDQo+IFNBTklUWV9URVNURURfRElTVFJPUyBhbmQgYnVpbGRoaXN0
b3J5IGRvIG5vdCBmYWN0b3IgaW4gc3N0YXRlDQo+IHNpZ25hdHVyZSBjYWxjdWxhdGlvbiwgc28g
dHVybmluZyB0aGVtIG9mZiBhbmQgb25lIHdpbGwgbm90IGNhdXNlDQo+IGNhY2hlIGludmFsaWRh
dGlvbiBhbmQgYSByZWJ1aWxkLg0KPiANCj4gQWxleA0KDQpBIGJpdCBvZGQgdGhhdCByZXByby4g
YnVpbGRzIGZvcmJpZHMgdGhlbSBpZiB0aGV5IGRvbid0IGZhY3RvciBpbiBzc3RhdGUNCg0KIEpv
Y2tlDQo=

