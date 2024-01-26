Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC699C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:21:41 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.60])
 by mx.groups.io with SMTP id smtpd.web11.15674.1706275293499106438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=CKSRcrua;
 spf=pass (domain: infinera.com, ip: 40.107.244.60, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4GPuD0iX6Bjb+mph1Wb1dB/eoBR3YGnxtmjDkXMgXqUlFagglyC8Uk4t1XB5brRQ3/eLIktipavWnFZQ2vs65O6zv5Q4uwW9BW0mEVzJcH0fAlB3AvJcsYInfhB3ev0+no57QFZmHrbysZ8dQY8dFx7+YDaCCx6WZSVxb6/fH2zO1aN7PGslQXJAflp/btj9MtjtbiOJpMt5Zx9KoofH9yVohkEH2N9jt0vIMknE0Te5Sx7dxMwJ1WF7Pbyi0ncDkuHoHx7rpuMsPUw+qXGT93BqA6JvScXGp/6TjFfKfpuhNIipiZ4Ee3FlMzSWS6Nd4torRaNLhH3ycY5qv5Mgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp+pic1UTwfhci9AdXOtdJU7jSZMabFsW6+IPK9gj5o=;
 b=jAiQqvMqIw4Ebq1NH5hfAh9JUcdbsFNDRbcbVGNrkI0GbHE0UyFnAz6+b4LxOPMUSd1C5keWc5M+msGhyflv2vjlE8gJihrDHNqfMC8KHRuIBrMNSPsh7Vxy1iCK3j+9PRTFRxgG5rZ2gnil2pXsBtp869aaKUHDipNOVkXbhPKU1pWQKJU2WEXwAjT5yzU3tB5RdAmdZOCTtp8jLOdNLlMZUrNQUlpSiG1s1NJOO0Z60XpL8uPLxIJdagdI5FmiZW4ZqsBIcacy1ibB1Niud3tNz0YQE7c7XxfkvuMYrIZBqeHubltX7A2ElaVFw4FfV5AA+gS+0bW1L+HQ9U2kpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vp+pic1UTwfhci9AdXOtdJU7jSZMabFsW6+IPK9gj5o=;
 b=CKSRcruawuTANhwO8gCAmkh107IfqhYOcz7oSU79eTyEGcVi8nMckHZDmNNTEj1SVhTpVCpU2SF9cMETr4m/pfFC+M96No/BExB0eArNVWwLgl6h1O4dqebFIhTDzKN5h1e1sXYC9GG5qX1+j1nfRjfUjkBMdZKzv5H9XLz8M6GxGJttLGVgFDO56tXXaKReNLPJj1gbqPyjhGn0rVOzsVPBj+IPYRzF+mpsGuLA8z98EyOWPWBk39H8iI583oS/zxqWKDqkyw8DkbLnZJIfTkdvy4XP+7IGMmSNrekWVy+I8gO3AGzNbLXTzK9iNkfb9becX89LW50zrkaqASDMDQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BLAPR10MB4913.namprd10.prod.outlook.com (2603:10b6:208:307::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.28; Fri, 26 Jan
 2024 13:21:30 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 13:21:30 +0000
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
Thread-Index: AQHaUEgkMNzCIETAnkmJ7AygmSs1ubDsAvKAgAARooA=
Date: Fri, 26 Jan 2024 13:21:30 +0000
Message-ID: <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
	 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BLAPR10MB4913:EE_
x-ms-office365-filtering-correlation-id: 98463faa-6337-4a00-862d-08dc1e71b594
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P0qurNskAiwMxq2FGBMgb61JRUNvPG2HD+OheHLY61oSUSqMhXvSsBor+uu3YbHQ0v67iXjLak2fpQiO07a1Cd11IZopY0c6vsWuXP7TZs8UU/FAhdcNSI+CfPobXthQw3iqqfhBXpXO4Xx4wmjFdUFswHkGzNAvIx7Jl1s3dbanJTHsIli8TGzKS6b5wMFyPQeKDSHzKbTkpnwWgR59pJRkqdmbSUAZgCiGtBfASH3Sy/rCKZoS7vTVfQLll4yDMkIAjVihxKiLaoPMlTRUmpcZPXIjfqib57VnwGIRS+1hI175p6MspXqek6YI/rjPx01aeZY+o3KUg4I2Gx13jwuLnOSNQhC3ejViL8qpmqsDChcryAanE08IY+9G+Ik55bzvzwLVhYr7VhPCjxISglZ/UIFIOughaQaEf+rF3H7tbvD8D6xxiTXLyj2b6hBpVX++9wBO3op4IGehYyTeYX4PpKr6D+od1UCCrw9uRoQt6xgMYU2ZqNQDliGhG3WIUqrl0yFwcwqn9H3kIv8sEXCcJS/hd2sWtD5gHLvrT+U4hQBG8BNKJItBEVDCL738iiYIdrSEtu4Jsqzj3cMF+OH42QP72xQXQUn3ukMnbkNMldhzy1ZOvMlg9fuB4g/p
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39850400004)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(76116006)(6916009)(66556008)(66946007)(66476007)(66446008)(64756008)(4326008)(316002)(8936002)(8676002)(6486002)(478600001)(86362001)(91956017)(2906002)(36756003)(38070700009)(41300700001)(5660300002)(6512007)(122000001)(38100700002)(2616005)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UkFqM0xadUFaVTdoYU10azJrNXNKUWxVTVVCQ1doTnlSTWtWY2UzaFpZUDdX?=
 =?utf-8?B?TjdHUkpZZFJNOFN5endnNWJWOFE3WldOSUNtMnEzbkdUOVVwdVlkUnova2VL?=
 =?utf-8?B?OURiODFVY2hMaWJDaURlS2gvTUFKVExSbWdSNzRwa0tXUXRnd2p0d281Snd3?=
 =?utf-8?B?VHRaOG9Gc2VGa3RwbllUa0FZR0tURjR1QWM5R2ZVNWtrSHlwd2NOcTdBb1lY?=
 =?utf-8?B?SHJJR3BiWVplbFQ2cjRCajhUK1Y4alNPZVBiWHZOWEtLaGczeHh1LzV0UEVs?=
 =?utf-8?B?SGxpYU1jK0JyZDlTQmFSeWo4NXVUcXBYckI3UE5uWVpCWTdEWSthb0VUTnAy?=
 =?utf-8?B?b2F5UktCU3dTSytTc2hBcENNV3cvL3M0SWt4bU5TMllEdWNtVmRxQmVBMENI?=
 =?utf-8?B?RDhQWnc0RXRmN2duODJHZkcvc1lyR0drRDB3eHpTclBuTGlQaTN2MzFCVGFL?=
 =?utf-8?B?cnpyRkFScnVad2xUenlpajRYcUFhV3c4K0x1UFpmM3NlUngxTnMvdGhqelRO?=
 =?utf-8?B?bEtzWWR2SGo4c001K2dTQXhURytYWWNpc1hTdFprSmh0VHUwUzlEeUFYZ2Qr?=
 =?utf-8?B?R3BuUndDd0NrZE1yVU1TWktKaHJhaFJwbXMzMkcvWWd3VUJ5ZUgxaXladW9m?=
 =?utf-8?B?T1pUVDR5ckt1MUxOSHNQY2FpZkZtQzdTUDJiUHo2MXd1S0FkM1UyZ0ZUYW5v?=
 =?utf-8?B?VVFMRCtUTmpTWkNUYlVCdWpiK0g1dWVFSHJiUU1LejZXaTZ5WGJkWWV4UHlt?=
 =?utf-8?B?Qm03Qk41TjI5VURqcHhVUldyVHpXZzZDRG1WcCtSc001aDJmclMzVUxUdWgz?=
 =?utf-8?B?aUFUNDViRnRvRGFLQWRoRWpyeFBSMXk3alhWOUg5Ymhua0JiS1Q2UDc3WWhk?=
 =?utf-8?B?bnNudUlIQmVHN1lXSGhkMnRySGRWTlU4d0REQWtnNGJoTEVxa0RsYkQ3WXNq?=
 =?utf-8?B?Y0MxZFVMbTYyYkRmdzNiY1Y2bmZNSzljWkNnc0dna0E3ZHFicGFOTUdLQUFZ?=
 =?utf-8?B?WEpGdUhQUWNYSWNaSGs2YkE4dlhIWmtiYjFZdkRYS0xpb2E2SUUxamdKbE1z?=
 =?utf-8?B?WFNIZjFucDBsRm4xUVZzY2dlS2gxY0xZbEtNa3FWcDliRzU1OXR3MHlzZnIy?=
 =?utf-8?B?ajd0VElxeVFsYnErZWlITHBWL0tiU2pQNy9LMjR5OENCOUpIN2lCTy80SmZN?=
 =?utf-8?B?aDJONy9KS2dGTVVrK0N6cjUxa1V2dEsvd2UxOVRXRHJGSUsrUUVVSE4wY2lF?=
 =?utf-8?B?MHhLbnRoTEh4VVZTWUVEU3FIeTRDR21SVTlGbU5TV29IRmFiWnBZd0V6elZC?=
 =?utf-8?B?RmpuWjRYN3EyM1pPWUdRNmozNktvTzFNdWo2VXppUE5ENHNUOHFpMVZzaGhr?=
 =?utf-8?B?MkR2R1ZhbG1RUFZnS1JTRXJxT1VBbVhPSnJGZHdyUm5CZ0lrNWNmbjBBd3Rr?=
 =?utf-8?B?QWJyRWx1ekhUVEdPbExaVkZiNTNWZDkyaGFjTEh3RW5jdUNUZHREck5wT1ZP?=
 =?utf-8?B?ZWpQTUhzNVBwNysrRVl3ZEFJbXlMUjA5QmtmVzZMTVRFVFNzMWdvWk4rZW1K?=
 =?utf-8?B?aERkZ3NNTExIRFB3bERyQWRkZit0TE9mZmUxNkROaDFEeElyeERzK1BWditN?=
 =?utf-8?B?dERkTkNlNnFhb0hoeXpaQmtJUTlLOG9ldUhtOXl4V1BoYlMvdHplSFl1dlJK?=
 =?utf-8?B?UVdDT0NFVVVNVDhaeUpUYWZkNFhKaThuRkxXKzdSSWlVN2JXeEs1TmtHUkZI?=
 =?utf-8?B?aFBNVVk3WHFtdjc5b2RmbG02YXlXdFJzZnZUMTBxa2thZ3F4OXFyb0dHeFFX?=
 =?utf-8?B?WkVxK2o3d3FneUV2OCttdDNjNFpWNlA3bXkxdVV0cUNCNStBeDRZTWhpc0FC?=
 =?utf-8?B?ZUFrcHk5cCtqSHJuUktZSnhZZVNyT3l3SFQ4K21JZkw1QnI5bmQ4STV0d3Ns?=
 =?utf-8?B?dzZZdWVQUVBtaXhPZ3E1RkdzNVlPNVRlRzdGN3E4K1ArV0ZuTi84N1djcWFN?=
 =?utf-8?B?U1JhVHBwWUJyNWJWQUpWZks0VGFLZ0hsNXRUelpXSHQyeUNBeUo5RUN6WHJR?=
 =?utf-8?B?dGVabWJJY0U1aFRQZlk2S2NVM3VlQXY4WkJSK0JOcmEwazgvNmJSZThzL1dk?=
 =?utf-8?B?QVdqQ2lYUnV0R2ZnNHRBdkpjQm53QUM5MXhlN3BVZEF1dENJM2g5bDBETzFm?=
 =?utf-8?Q?Kq1b3xd++HGfjv/kexSA0SjCfEmIg+kQSlmZTwHsMsdE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E76B0789848DBC43A127EF7EEA5DBF44@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98463faa-6337-4a00-862d-08dc1e71b594
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 13:21:30.6126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GTp9GzoW93pB3NSnmFzlfGnzdqha5MUhq57FFQgeiOwLtN+TAj6+UqGbUF4bM3jIzkV74fmckAeCYb0maUCxpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194359

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDEzOjE4ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gRnJpLCAyNiBKYW4gMjAyNCBhdCAxMjowOSwgSm9ha2ltIFRqZXJubHVuZCB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8Sm9ha2ltLlRqZXJubHVuZD1pbmZpbmVyYS5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gVGhlc2UgYXJlIGhhcmRjb2Rl
ZCBzZXR0aW5ncyB0b28gb2Ygd2hpY2ggc29tZSBjb3VsZCBuZWVkIG5lZWQgdGV3YWtpbmcsIERJ
U1RST19GRUFUVVJFUyBmb3Igc3VyZS4NCj4gPiANCj4gPiBTbyByZXByb2R1Y2libGUgYnVpbGRz
IGRvZXMgbm90IHNlZW0gdXNhYmxlIG91dHNpZGUgcG9reSBvciBhbSBJIG1pc3Npbmcgc29tZXRo
aW5nIGhlcmUgPw0KPiANCj4gVGhhdCBpcyBub3QgdGhlIGludGVudGlvbi4gSWYgdGhlcmUgYXJl
IG9ic3RhY2xlcyB0byByZXVzYWJpbGl0eSwgd2UnZA0KPiBsaWtlIHRvIGVsaW1pbmF0ZSB0aGVt
Lg0KPiANCj4gVG8gY29tcGx5IHdpdGggc2VsZnRlc3QvY29udGV4dC5weSB0aGluZ3MgeW91IGxp
a2VseSBuZWVkIHRvIGNyZWF0ZSBhDQo+IHNwZWNpYWwgY29uZmlndXJhdGlvbiB3aXRoIHRoZXNl
IGV4dHJhIHNldHRpbmdzLCBhbmQgcGVyaGFwcyBzYXZlIGl0DQo+IGFzIGEgY29uZmlnIHRlbXBs
YXRlLCBidXQgdGhhdCBkb2Vzbid0IG1lYW4gbWFraW5nIGEgc3BlY2lhbCBkaXN0cm8uDQo+IFRo
ZXJlIGFyZSB2YXJpb3VzIHJlYXNvbnMgZm9yIGFsbCB0aGVzZSByZXN0cmljdGlvbnMgZm9yIHJ1
bm5pbmcNCj4gc2VsZnRlc3RzIGFuZCBzb21lIG9mIGl0IHByb2JhYmx5IGRvbid0IGFwcGx5IG9y
IGNhbiBiZSBzb2x2ZWQgYmV0dGVyLA0KPiBidXQgYXMgb2Ygbm93IHRoZXkncmUgZW5mb3JjZWQu
DQo+IA0KPiBzeXN0ZW1kIGhhcyBiZWVuIGRyb3BwZWQgZnJvbSBESVNUUk9fRkVBVFVSRVMgaW4g
bWFzdGVyLCBzbyB5b3UgY2FuDQo+IGJhY2twb3J0IHRoYXQgY2hhbmdlIGlmIHRoYXQncyB3aGF0
IGlzIHByb2JsZW1hdGljLiBZb3UgY2FuIGFsc28gY29weQ0KPiBhbmQgdHdlYWsgdGhlIHdob2xl
IHJlcHJvIHNlbGZ0ZXN0IGlmIGl0J3MgdHJ1bHkgdW5zdWl0YWJsZS4NCg0KSSB3aWxsIHRyeSB3
b3JrYXJvdW5kIHRoZXNlIHNvbWVob3cgYnV0IHdpbGwgbm90IGdvIHNvIGZhciBhcyBjcmVhdGlu
ZyBhIG5ldyBNQUNISU5FIGp1c3QgdG8NCnJ1biB0aGVzZSB0ZXN0cy4NCg0KQnV0IG5vdyB5b3Ug
a25vdyB3aGF0IHRoZSBtYWluIGlzc3VlIGlzLCBob3BlZnVsbHkgeW91IGNhbiBmaXggdGhlc2Ug
c29tZWhvdy4NCldoeSBub3QgZm9yY2Ugb2ZmZW5kaW5nIGNvbmZpZyBvZmYgaW5zdGVhZCBvZiBl
cnJvciBvdXQoaW4ga2lya3N0b25lIHRvbyBwbGVhc2UpPw0KDQogSm9ja2UgDQo=

