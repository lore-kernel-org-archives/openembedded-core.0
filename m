Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395D1CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:17:10 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18695.1779189427799717005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 04:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=n0YavyYx;
 spf=pass (domain: de.bosch.com, ip: 52.101.83.15, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytaYtBW94sMdfRJP1soPWWj5+exrc98wb7nhf/o1oQ6SjQyWI+MN00JruBR+YqiFlyN5R8PitRlQs+C2HON6nOKSr7sLd6w+0dgXqdoLdPSUi6iet4+nbfoS02h8Mo63GZ9cq77HP+nvZCru8pCPd0wx21HLUBLjIPCGcq+v4LGjF3hwiZMxh3PQBevlOVuwWyhoJ80bAoSZY5+e70jpOJ/LPqNxlEXl41VBlIC43YwzkNJKbS9Toah0yZPSfR6uQN6kJMkvu7lYVbec/u0BaPMeRu5rneAkkpT3b91Pb4LzOrzmiWdhFgL4bECKQ3r6AVu4n0Y/z6Zc2sXCdNsZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDXoSAXs8pf6otV6MOStzzUGlpQM5Io6MQ50+f5/dD0=;
 b=yIo9NsaDwWRavBz84Y61rnzwSr68rXhDwMfPOqmBfkF4WMTVagMwlY6V9vYk7rutEA9Z6cOxF43fJtez7Z3gQ+3VajMb9L0GV5wMOZu79kuY15YsXPMci4yKS/DPv6Mtl0YiGYoEseQHie6LRftIZ7GHou6O2vK7YL3dSTKvmbcENpIuCTS9KIoyqZ5yyEiM1r+lXklDtUNUHR2K/E47UKgmRQdbhBOkSBaIBko5d0IADu0KBBwAO/C8Bn4oGjQVT/3TMQ9JFMG5u/LUthV+zi8NEaQ1HOpJghrEYon8ktCFQ3bmDMJxEhJVyVGcr8sn/1ZNMQaZSJfsyCamLj4RTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDXoSAXs8pf6otV6MOStzzUGlpQM5Io6MQ50+f5/dD0=;
 b=n0YavyYxryT4Lx4v95QeSRrXp4RVnXZ+/VL1yHESC7BoJotFpkQbwcgAAn7sS8v6InrLtB5ea3BSmbdpTtxJIJRkNoN7Qc1nn8HayadKtuqukqzoBzuWn6gXPCCe0KhipnnO68qii9ePUxHRfRNxzzTNt/ZYOgb075+7HqYhx+UWPxR/YwVYOZ4yFOXW7KseHeBVlb/VBZRP5kTtFK7cEVzViTNkoDJVnpIFey/H1ZkgIDYIz6Lt84BjgGzh+UdeGZoFNExCpDUhR2p/vEaZ0kBM6rqH9l14uyObIAVoCag03qhU+SjdYqZV6yGi4zFuOhPr8wtRQKgFXSmjHOfPZg==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by GV1PR10MB6292.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:90::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 11:17:02 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%2]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 11:17:02 +0000
From: "Jonas Mark (BT-EL/ESW1)" <mark.jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "robert.joslyn@redrectangle.org" <robert.joslyn@redrectangle.org>,
	"paul@pbarker.dev" <paul@pbarker.dev>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>, "pkj@axis.com" <pkj@axis.com>,
	"Moritz.Haase@bmw.de" <Moritz.Haase@bmw.de>, "changqing.li@windriver.com"
	<changqing.li@windriver.com>, "Simoes Ricardo (BT-EL/ESW2)"
	<Ricardo.Simoes@pt.bosch.com>
Subject: AW: [OE-core] [PATCH] curl: Remove absolute paths when mbedtls is
 enabled
Thread-Topic: [OE-core] [PATCH] curl: Remove absolute paths when mbedtls is
 enabled
Thread-Index: AQHc4vIMgefS5wUJ8UOW1fazlZUUsrYT/yuAgAE0k2A=
Date: Tue, 19 May 2026 11:17:02 +0000
Message-ID: 
 <DB9PR10MB5354A6011D8064EED83711A9AD002@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260513160218.11997-1-mark.jonas@de.bosch.com>
 <0d9172f08910760f6ff0866997a4723699f96ec5.camel@linuxfoundation.org>
In-Reply-To: 
 <0d9172f08910760f6ff0866997a4723699f96ec5.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|GV1PR10MB6292:EE_
x-ms-office365-filtering-correlation-id: 9ce7ec09-63b6-4e1a-6983-08deb5982704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|11063799006|22082099003|18002099003|56012099003|4143699003;
x-microsoft-antispam-message-info: 
 QxzYjE+ZtRJX3lcLMT1mQxHbMZc2Lvfaj+QyLNB8KswxvCG/2vxYBe2j8A5xWskoC8HdPmF0e8qtmG5sMZrCo4xK2+Au8CZ/Jl9DtRastL+WeWt+gf5mdYJAtGqxk++mugcZRjkuD7QCwX1MUEGtvNh/XeOUkAho13tDS3Jr+zrJuUYyEes/dCC6Tg6PzCw/ktbl4StMFv6dSRvN+tAjetQBsk5QJlLdCvG8jjT84kuCZh16DMhOUg/jrjdaswCk/oZ8h78etlofAmOiNXxfB4UhALRtfSdD4oYYj6wSgCtxy+b+CFQeBZVYQMm4A120BwBJxJFHg7pdAlXdnYvEMieQ/3fG1/3HgFBx9aYCN5+OJdJdV5t54F+iv55C5sa2mk1sSSmKQKmWdZGgFA1ClN4zXgjMwi9m7l5bWgaRUnGgxA6I2HktTc92fW2w6Fj3vE3N1hurnbi5t7IiQXGRVqojx+bj1IFPPu0sIxjspWXhsMVdduFF2lUn2oGChoxrGh2ORBwKSdNb11yAdUH8nvb8I7JXzNuucBy9Jegr7KI29QecKrhstUwKTZG6nG4Ix/kc4xMKFHgl274Xx8RPYLUY1iLeByFi6Mk42LTEKVM7ChJAfRhzBJ4zh4lWqtxu7YBz+g60UyBgDl/8ZrOi1ALYjQJ3Ov/zq6LIe8e7Xqxk185Y6QAlX01w8VqFToZf/oVIxuLi9gwkJ5QWLSwtVPEvmrnf6e31I+X+/MH44nf91gcaY2IvlVqkaJ5Ijs8S
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799006)(22082099003)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QTk5UjAxOFdKcFJQSzhuV1NOSUNlanVmbUdVLzF5SmFUbElrTmtMN05peUoz?=
 =?utf-8?B?TG1ndjBUWndzWjFOWnRPTWpsa1FDeHdBMjg4bWxWb1ErOHR2cUFMdTZkUE00?=
 =?utf-8?B?a1NoRGN1Wm1EZnRQZHRlLzNQK2pEU1U5bm5RUmJzOUI4bnRoakp4cTVsMjhi?=
 =?utf-8?B?Y2xRQWlyMmRTT1lTZFp0M3hFWmJYc1E2MldpZzdnTzRic0VBSzByekhDZ3dI?=
 =?utf-8?B?cTVRVDZnc281WjJ5VFFkSkN2cGpkMXB1TWtZSmtQcStEcHArWE5QTnFRejh2?=
 =?utf-8?B?T0k3T3dVU1k3L29Vemc1d2JpbzVEbGpPZzhvbi9tdUN6clZBOU1UQW4vYTdo?=
 =?utf-8?B?eFR5bGZJc0pwREduT2JQcHZBZ0cvWHo0MkVwdVRmRmNWczR2TFRtN1lHcFVz?=
 =?utf-8?B?RTQ4ekRyL0t0QWFnak1ObFNJWkF2dmZ5RjRXa0hqMG9CbVRvRExCNmRpM0ZZ?=
 =?utf-8?B?NHV2L3JVNHhFTVlSSCs1cGl0VGhoOUg3TTNLQkZKY2FYZ0w4NHNpSHUwbmRJ?=
 =?utf-8?B?RC8wYnpOc1h4THV5MDBJaG8yenNHbUREc0tkaFJhRjY2VmR5Qk5tVlBwZXhu?=
 =?utf-8?B?L1RVME1ZN3BhdXQxZnZaeENEdzVUNnhZd2dYa2M4ZWJOcCtPVnZqWEhMRXBO?=
 =?utf-8?B?OHpuSFdPV0ZscFk0WUhpYndwbjAzY1M1eWdnVWhGc2R6UGVOZ3o1RzVpVU5B?=
 =?utf-8?B?eEluSWlUMFYyT3VGS3cwS2ZBV0J2a2g1WlZkVWI3V2xlSEVJQ0lGdWw1KzhL?=
 =?utf-8?B?MUV0N0hGN2xUTjErY3dCTkxNTjRxNnJ5R0s1WkhzeUhoUmZZeThKcFh4V1A5?=
 =?utf-8?B?dGdjNGdBMnRFZHh1bHJCWVMxMjFyVXlrWGVOcnNDN0d4ZnJJRXFzL2VESys4?=
 =?utf-8?B?REZwY0hKckxnRHF4Y05MRThFQUFuR2Qxb2VXWExMWlp1WGQ5SFpHd25MRGRh?=
 =?utf-8?B?blcxU01xRHB2NGJBQmRCRDZHVnorTkZ0TEs5NE9YbnJYcnNQV2lXd1NLNU1H?=
 =?utf-8?B?djBjOHBLOVdId3Jwb0xmbVZWWjEwWTRCOU1YRzRhQjZSV2wwNTY1K2F0YVNu?=
 =?utf-8?B?Z0k5U2FGV3VyMlZDY0VmbVlHZXNydDZTNG5Md1ZvZzYvZEQvM3E0Y1F6c1Zh?=
 =?utf-8?B?RmVrTVlnRjk3eEpNK3Y5TndTVFhvdElTdDRNemoxYnlMTWtSVFI4VW9XbTNa?=
 =?utf-8?B?c2c4SXhZa1pYeld4c0lwQUZtRXNKZEsxRzZnencyZWZGL1JzOVhmVFJVY2ph?=
 =?utf-8?B?OXZkdHFOTGN4VnhQd0ZEazR1cEI1MzBJcHZrRElMR0hnd3hEV0ZEem80QTly?=
 =?utf-8?B?cjByUFNaU01mZnd3L3pTcEVyQlJneXRYZFFsdkVibWVnVGMwTFZFZG1CWWpN?=
 =?utf-8?B?eUYzOVhnZ212N1BNY2hRbEk1VmxWSG9YaWd5WlFlTHYwYkJ0STc5b1dJQU5F?=
 =?utf-8?B?Z2E0aHFwS1luRzBuMnRyV2RGeUJxbndCYVB5M1I0TFViUFlPdU5BZDU3R0Jz?=
 =?utf-8?B?Ui9XeTVuYzc5S2YxZnhZcXFJcEtWb3pHQVlrT3lQb1VvYkZoZU5jV1NPaENC?=
 =?utf-8?B?V0xNU3kyYU5NZm1XNlRUTmxSM3BNMjV1QmJKcElLSWQ0TE03bk5tbGdwMHFp?=
 =?utf-8?B?UklmYTd0eUxVUWhISmVXbkFRc050bE4vSjVnZThqYVpvZXZDM0dRMW5JMUg5?=
 =?utf-8?B?YWlUb2hYQVhyRnZ6Qk9zZnNiVGNBd1U4Wk5BUk1HYW1rWnMzT3g3UVlGdmVS?=
 =?utf-8?B?VUxmdjFvZ1dTWGNJbTM2TVV0UGw5cU1BYjBhbGUzclhtbVUxWGs3TWYzeFU3?=
 =?utf-8?B?L0NyblVSc1dBQjM4a0NOeHpZRnlhVEczMTNualAvTTdhbEY3UUZ3Y3FvRzRl?=
 =?utf-8?B?RDc0alZFNnFZQm5hcG1sbk5xL3NpUlBPQXloRTdGZDV2cjdwY051UFM1V3JM?=
 =?utf-8?B?MjJNRFAxYjJtSkI4Qm9EMXBHM3UzL1JsQ25XZGwwekFkRm9IT0lTNDd2Tktt?=
 =?utf-8?B?S1RoTEdpM2oyTXMrWDJadmlzbWFWTVpvN2NuZGVlQ3kvMFlZWTk2ejJuWHlG?=
 =?utf-8?B?WkNIdUVqU2kwMEhoQ1JLVXFzUzQrZjUzWVVoZEV5aExCTm8wL3NMWVRyVXNQ?=
 =?utf-8?B?RFlEMSt4Z2ZpZGliZjFQa3JnVGlYV0dYaHY5Qm4xNCt5bjZaYjZ2OXhCMHRU?=
 =?utf-8?B?Zld0Z0ZWS3lWdER3RGdyaVJXM0lodjRqeDQ4OG1TMlVtSGxNYlo2QkJ2RE1X?=
 =?utf-8?B?NlVHdnhsaFdsY0ZETndXeWU5aHJXY01lREI0YU84SXRPV2EwM0wxV0VKZXUz?=
 =?utf-8?Q?ATFzT1//p2DKdx9pwq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ZSBGVjM8fcIpRzKxlcPqjfcSZZlA0RKNN2XiVhS4dnCLFCmi3/7P6xpEDs+1ZmgSFvgb0i+DBHChge7IdMlkcsJyK7c2jwCVLH1dPqgRDx2j3ch+504UKR7Tt6xYXaaVyXNbBM5U+yXfBIVMgMjhYiFDwmAyGOd3vsznv73DJV7LzNTfJhnHtxtm1ap1sxVYKg7hCmE2e++MI8T9WbNiQdfuwvYGppIiC+dSrPxTCWsHSchg413KKjuwINoWhNOOky1A/0ivONDNjRyNQjV8j5JGicr95isvp+mRD7Vreybpu5hHCIkefd21RMgp8wkScMCACmE1tEBetzXHUlDrhw==
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce7ec09-63b6-4e1a-6983-08deb5982704
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 11:17:02.6821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMp/7Ej3wORxJtYeUtRz1zOwM6YdlgKoSyNrWYBV5sxHJHl/bmZY4ilyxJgXCFPdwBaCIJXXJ2n99lz0KFROhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237310

SGkgUmljaGFyZCwNCg0KPiA+IEZyb206IFJpY2FyZG8gU2ltb2VzIDxyaWNhcmRvLnNpbW9lc0Bw
dC5ib3NjaC5jb20+DQo+ID4NCj4gPiBXaGVuIGVuYWJsaW5nIG1iZWR0bHMgUEFDS0FHRUNPTkZJ
RyBvcHRpb24sIHRoZSBjdXJsLWNvbmZpZyBhbmQNCj4gPiBsaWJjdXJsLnBjIGFyZSBnZW5lcmF0
ZWQgd2l0aCBwYXRocyB0byBTVEFHRV9ESVJfVEFSR0VULCBjYXVzaW5nIHRoZQ0KPiA+IFFBIGNo
ZWNrIGJ1aWxkcGF0aHMgdG8gZmFpbC4gVGhpcyBpcyBkdWUgdG8gdGhlIGZhY3QgdGhhdCB0aGUN
Cj4gbWJlZHRscw0KPiA+IG9wdGlvbiB1c2VzIHRoZSBwYXRoIHRvIFNUQUdJTkdfRElSX1RBUkdF
VCB0byBmaW5kIHRoZSBtYmVkdGxzDQo+IGxpYnJhcnkuDQo+ID4NCj4gPiBXaGVuIGluc3RhbGxl
ZCwgdGhlIGN1cmwtY29uZmlnIGFuZCBsaWJjdXJsLnBjIHdpbGwgc3RpbGwgbmVlZCB0aGUNCj4g
dGhlDQo+ID4gZmxhZyAnLS13aXRoLW1iZWR0bHMnLCBidXQgbm90IHdpdGggdGhlIHBhdGguIFNh
bWUgaXMgdHJ1ZSBmb3IgdGhlDQo+ID4gbGlicmFyeSBwYXRoIGZsYWcuIFRodXMgZHJvcCB0aGUg
YWJzb2x1dGUgcGF0aHMgZnJvbSBib3RoIGZpbGVzIHdoZW4NCj4gPiBtYmVkdGxzIGlzIGVuYWJs
ZWQsIGFuZCBhZGQgdGhlIGZsYWcgJy0td2l0aC1tYmVkdGxzJyB0byB0aGUNCj4gPiBjdXJsLWNv
bmZpZyBhbmQgbGliY3VybC5wYy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gU2lt
b2VzIDxyaWNhcmRvLnNpbW9lc0BwdC5ib3NjaC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFy
ayBKb25hcyA8bWFyay5qb25hc0BkZS5ib3NjaC5jb20+DQo+ID4gLS0tDQo+ID4gwqBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xOS4wLmJiIHwgNiArKysrLS0NCj4gPiDCoDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTkuMC5iYg0KPiA+IGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTkuMC5iYg0KPiA+IGluZGV4IGI5MjUx
MzM2YjguLmNjMzdjYzkzNGIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y3VybC9jdXJsXzguMTkuMC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwv
Y3VybF84LjE5LjAuYmINCj4gPiBAQCAtOTMsMTMgKzkzLDE1IEBAIEVYVFJBX09FQ09ORiA9ICIg
XA0KPiA+IMKgIg0KPiA+DQo+ID4gwqBmaXhfYWJzb2x1dGVfcGF0aHMgKCkgew0KPiA+IC0JIyBj
bGVhbnVwIGJ1aWxkcGF0aHMgZnJvbSBjdXJsLWNvbmZpZw0KPiA+ICsJIyBjbGVhbnVwIGJ1aWxk
cGF0aHMgZnJvbSBjdXJsLWNvbmZpZyBhbmQgbGliY3VybC5wYw0KPiA+IMKgCXNlZCAtaSBcDQo+
ID4gwqAJwqDCoMKgIC1lICdzLC0tc3lzcm9vdD0ke1NUQUdJTkdfRElSX1RBUkdFVH0sLGcnIFwN
Cj4gPiDCoAnCoMKgwqAgLWUgJ3MsLS13aXRoLWxpYnRvb2wtc3lzcm9vdD0ke1NUQUdJTkdfRElS
X1RBUkdFVH0sLGcnIFwNCj4gPiArCcKgwqDCoCAtZSAncywtLXdpdGgtbWJlZHRscz0ke1NUQUdJ
TkdfRElSX1RBUkdFVH0sLS13aXRoLW1iZWR0bHMsZycNCj4gXA0KPiA+ICsJwqDCoMKgIC1lICdz
LC1MJHtTVEFHSU5HX0RJUl9UQVJHRVR9LCxnJyBcDQo+ID4gwqAJwqDCoMKgIC1lICdzfCR7REVC
VUdfUFJFRklYX01BUH18fGcnIFwNCj4gPiDCoAnCoMKgwqAgLWUgJ3N8JHtAIiAiLmpvaW4oZC5n
ZXRWYXIoIkRFQlVHX1BSRUZJWF9NQVAiKS5zcGxpdCgpKX18fGcnDQo+IFwNCj4gPiAtCcKgwqDC
oCAke0R9JHtiaW5kaXJ9L2N1cmwtY29uZmlnDQo+ID4gKwnCoMKgwqAgJHtEfSR7YmluZGlyfS9j
dXJsLWNvbmZpZyAke0R9JHtsaWJkaXJ9L3BrZ2NvbmZpZy9saWJjdXJsLnBjDQo+ID4gwqB9DQo+
ID4NCj4gPiDCoGRvX2luc3RhbGw6YXBwZW5kOmNsYXNzLXRhcmdldCgpIHsNCj4gDQo+IEluIG1v
c3QgY2FzZXMgd2UgZG9uJ3QgbmVlZCB0byBlZGl0IC5wYyBmaWxlcy4gSSdtIGNvbmNlcm5lZCBh
Ym91dA0KPiBzZWVpbmcgdGhpcyBiZWluZyBhZGRlZCB0byB0aGUgc2VkLCB3ZSBzaG91bGQgZml4
IHRoZSBkYXRhIGNvbWluZyBpbnRvDQo+IC5wYyBmaWxlcyBpbiB0aGUgZmlyc3QgcGxhY2UuIEkn
bSByZWFsbHkgaGFwcHkgd2UgZG9uJ3QgbmVlZCB0byBjaGFuZ2UNCj4gbWFueSAucGMgZmlsZXMg
YW5kIEkgZG9uJ3Qgd2FudCB0byBzZWUgdXMgcmVncmVzcyBsaWtlIHRoaXMuDQo+IA0KPiBjdXJs
LWNvbmZpZyBpcyBhIGRpZmZlcmVudCBzdG9yeSB1bmZvcnR1bmF0ZWx5IGJ1dCBjYW4geW91IHNl
ZSBpZiB0aGUNCj4gLnBjIGNhbiBiZSBmaXhlZCBhdCBzb3VyY2UgcGxlYXNlPw0KDQpUaGFuayB5
b3UgZm9yIGxvb2tpbmcgYXQgaXQgYW5kIHlvdXIgZmVlZGJhY2suIFdlJ2xsIGhhdmUgYSBsb29r
IGF0IGl0IGFuZCBnaXZlIGl0IGEgdHJ5LiBTbyBmYXIgd2UgaGF2ZSB6ZXJvIGV4cGVyaWVuY2Ug
d2l0aCBhdXRvY29uZi4NCg0KSW4gY2FzZSBzb21lYm9keSB3aXRoIGF1dG9jb25mIGV4cGVyaWVu
Y2UgaXMgcmVhZGluZyBoZXJlIGFuZCB3b3VsZCBsaWtlIHRvIGdpdmUgYSBoYW5kLCBoZWxwIGlz
IHdlbGNvbWUuDQoNCkNoZWVycywNCk1hcmsNCg==

