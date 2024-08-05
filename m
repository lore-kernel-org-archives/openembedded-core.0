Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3915C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 14:53:07 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.84])
 by mx.groups.io with SMTP id smtpd.web10.9877.1722869582293597158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 07:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=Y2gD+oHB;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.241.84, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjDvWXNA8wE/AQzN8hlHKVFmB9ZXs0WtzULqxg0XGqJ/KL2JggVuv0HxkdaeQzLQZ8g3R2d/CQPVeiu7SXneLR186rQcQq27d4pBj6MT+gOwmHwd1+JpoQEX/D5NYQ8V4yD5HucM2hh/hxxj2heJsDRnlorGo6fglOy185KPeBEr+mewYz+/N/02FhFsMPjIjJQxco/vUW57xWMfcIcr4OPxKFz1VvrZdhHL2vS3NdU52Y8ocaNuaXt5ImScUGElW84KenjRSL+8GFkn10s1hn7sdA7HNQV45gz9Wrj6j434Lpl0EFX8W6O2owwe30ev0G5DTxjBtm8rvB554wkkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf1IMSTSWr07MVhHrtG5IJiVdvB8a+0kgd6jAqFdxLc=;
 b=inZbDFy0uSqEE/y/q12E408m5dqqDb1WKHiC/fOX+P5w3kZkcaH5gntgBlRq3TsjLXrfYuu1SBH61VO+siZlGtEBWXAfpFtg6iFRJUlF1ScGEwX24WjC7B3b8Uqbp/HLLw9oZMHZD8ajlHIE5U/68GNEcc3vkBBqD9/y14G5yMOwmdKouMtGHjlF2VbjQbbkXPa5F0GBpUGABKuChfGFuHX60wixCVtdwtC04IP98SkIvN0vv7dC1ct5BFPOS0FIScTGr8gpM8W0ftwnEALvmxg+48Iz8YkLj5lrk3b78ntVm1iPiXpb+N3w+uH2lecU2HfFL7VzoNqPf/W+186c7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yf1IMSTSWr07MVhHrtG5IJiVdvB8a+0kgd6jAqFdxLc=;
 b=Y2gD+oHBeM8/7e1cgcfbtfBzQsqKrqdLbBTtDQOyCaczZa2/w5O/bH81WgjNYkyipj6lWWWzeki5VcKLxDRkCJoag/sxxDdruS+uwnUVsOwVRBZx6UYnyTS864piH4WxI5nCpksAawNDr3b2Q9DnDzLMID7TQucfp8X+ShhFTQUYlk3DZghKMiOZ6EBPaef6/jKpVjGXbORKq5+9SV/9jiokB5JkQ57nP6lbvoDS8S8R05hGoGVJ1Z/Pk/1SGElDCHHUcTPGkkc/3th4lu5SqLBNsgDRZ7ZzcMHMPC8YcnOFOKzMA+/m4F4LkyGWl4BqOVc6GzWuAGgbqCB9TGnDVQ==
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 14:52:58 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%7]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 14:52:58 +0000
From: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Pedro Ferreira <pmi183@gmail.com>
Subject: RE: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
Thread-Topic: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
Thread-Index: AQHa5ORNBqNcNeVwKk+w6N9sXWYXnrIUB9oAgASqh8A=
Date: Mon, 5 Aug 2024 14:52:58 +0000
Message-ID: 
 <AM8P193MB0900B95FF9A6569D089C600DC7BE2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
 <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
 <6185d36c7da8c96430a9a1c51d83ed9afedeee1e.camel@linuxfoundation.org>
In-Reply-To: 
 <6185d36c7da8c96430a9a1c51d83ed9afedeee1e.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8P193MB0900:EE_
x-ms-office365-filtering-correlation-id: cee1b8d0-f38e-47ec-b4a3-08dcb55e4bab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dGhwekZQWS96ODhLaWdEQzZsL2t4WlNTOUZONHhjVWtkUjRoeG4zMFFyL3ZY?=
 =?utf-8?B?RjI3THo1ZCtOLzdGQjVtQklqb1l4K09DMDVCRnZRYlFHQWN1dnJpc2pmSFdo?=
 =?utf-8?B?WWNTbXo0TFU5d21aa2RlcG9acTJDcUZBRkZlTUFOWWl6Zk0vdGUzclhtdzdz?=
 =?utf-8?B?bCtVRTBHNGt5Vk9aeUFIczB2QUQybXUrZytvS2dscU1UMUVUcHcxUFY4Rm5v?=
 =?utf-8?B?VmovTVpYQ2hXQ1QvYTRSZWwvcXBZR1dTblBqL2FPVXhwVU1SeTAzVzRiajB1?=
 =?utf-8?B?bEIrcUNxOFVvRmF5SHQ1eEc2Vkw4YXVxU25FeTFNK0wyaTFZTU5NbDFvOUd1?=
 =?utf-8?B?Tm1EY0dqZ0gxNFl4WWdEcHV1TnUzbWNPYWoxM3FxamExTjQ1dHFUZkFpeVRs?=
 =?utf-8?B?K3RGWEhUdFU0SUo0SFpPbjdSREhUWXQ3RUJOUmNFaXl0RmEzM0FIQUdnZDh2?=
 =?utf-8?B?NEk4U3VGdTBMS1Qvcno2ditjTjFKMGFvZUdyOWhVa0lqQUZCQ0poQlpsQTJr?=
 =?utf-8?B?ZGIvNFNvcGUyMTlocklpQ3JvL2lKNnkxRmppQ1JQMWNGR3VUR1ZsL1h6REdN?=
 =?utf-8?B?eVN1ZHRuYVl4WG9hUXU0TFVTajBJMmx1bmtvZzZJeGM3Q2ZtSGdQU3FYNjlB?=
 =?utf-8?B?Y04zc3ZnVUFOUmRRbjd1a1psSWd4R3MvYUtvbkVIWjFsclRTWHQ2MlJ0d2pk?=
 =?utf-8?B?N0VyQjRoU2NaT2RUd2dOWG5OazNMVHgrUytoY1o3UHdOTE1aTkcyNU9NR3p1?=
 =?utf-8?B?SjU1RjMyQUJqSXduOG9paUhYS1VCdGsrQjc4YUdjYTRrejNxOHA2aExURWpu?=
 =?utf-8?B?L0xoM3NiTXJtTkZHM1p4aXdMY3ZqUG4zV0dYbkdqZ2pYN0tCeDVpNDd1bGsw?=
 =?utf-8?B?ajdRRTc2bFJLMElHTnZxZFJYM2FycUxLRG8wQyt3YTBjNzE0YUp1bmlhZ0Ew?=
 =?utf-8?B?dWM2OWYzWGJBRDkvZHRaclQyRUo1ckVYOFAxdEE1aHVIcUVrblVlbjV6N2Jx?=
 =?utf-8?B?dzRYZ1dvcG9MUjQ0ejk0SXJFNUFFRGZpN1AvOS9zbFRUdFQvalVxeVd6bEc5?=
 =?utf-8?B?aU5GblowU1QyejVvYUdWMG84NVl5RDZzbGlrRkVmeXFwZnZkRHMzVkM0bEJu?=
 =?utf-8?B?ZUdmeFNVQ2VTYlhYTDkzTVNyMHFaUElaQzl5bnlXeGVTWVNydjlMNWtVbWNr?=
 =?utf-8?B?em9namtCUSs4MWZ6SDEyMVRvVHhjM2dKbjhLMmJncXVWRzlRVTRsc2RjQ3Zh?=
 =?utf-8?B?UTdXdmFPV1FBbXBzVHpLQnlBRUpKYmhLTXVHeVkvTFpJU2FTTjNPS1pRbGZo?=
 =?utf-8?B?aXNxTHB4ZDhieHVRQzR3VVRZczduQVhqR2t1T05nVUZ6ZiszcUdZbFloWktP?=
 =?utf-8?B?c1p5VWZTMzhEL3FQYjNWaXpCQWFaTStiL1VpWHVUSHNyZVNjb21HWU9QMFpj?=
 =?utf-8?B?M3QzUDBvSkpSdm5peldRaWNFYmhEb1Q0aGUySm9zTElRajNPcjRQRmhOVEhC?=
 =?utf-8?B?MDdvVTRmN0V1MjF5UUd1c3hhdVlXRDljSWJMRkZuOEFGbHNiVGU2MWZVYTJX?=
 =?utf-8?B?Y2NnajkwTkZUUnllTTFQU1dDNHpCNVUrc2tkUytIV3NibUNtSzNtVGJZT3hk?=
 =?utf-8?B?MWJtVzFxQ3BERkZVL2VBOUg2MVcyVmU2YVZIRHRXQWxKWHFGLy9ISlAxNlMz?=
 =?utf-8?B?ckg2YmZPamRtQVN6bXJxdE4raGplTjhWN3k5b3E4dWs1a2tzREw1S29GUm9B?=
 =?utf-8?B?bms1dkZ2L2h1S1RCZERBN3lNN0FCUmc1UEE4TWtYeXUvSk50eTVZMGk5TWlU?=
 =?utf-8?B?YWZ2YnZzdXlSY2RHeTd2RW9NUWdqZmtycy9MQVFZc2JJWmNMZGlkQUpyVkRP?=
 =?utf-8?B?dVpGQ2wrcTJxRFFYdkhCS0MvMWR6VCtBVlU3M3VFRzBuVUE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SU9DMnNMTHMwV0gxZVUzb0lBbGxRSzVKZkxNRnRueVcxYm5PbTQvczE4UWU2?=
 =?utf-8?B?UlNqNEdIVDY0Rzc1emxtdGNSckhKeVFxWU44Y1pvRW5CR0N3TkkzUXU5Zlor?=
 =?utf-8?B?SzBlZ2w1aEIrRUZBUzRnWllwQ1BVOXl3MktTV3VKelJ4Q2ZEelFGYXVzWXpm?=
 =?utf-8?B?WC91bUtIUkRTWXJTL0lrdFZ1ajJ5YlA2dHhIRGVSRlZCNENoK3RHN2VPTm9a?=
 =?utf-8?B?cXY1S3l3Wk5XVmVuTDJPb2dhTkRIeWlvZE9jR3NFb2tjbEZpcEY0L25WMnVG?=
 =?utf-8?B?NXcrenRDN05PMzlWYU5YaHI1eCtxdmxDdkZqdDBoMHJmblFUOTlPanFGcjVV?=
 =?utf-8?B?TW5MSS9IOXJKOFI3TlFZWkdsOEFnN0N4OXBHaUhFSy91UndpanBZbUZzS1dV?=
 =?utf-8?B?VVZIZWtGZ3dnZUE4dThXczNlMUY2N3pqVUlIbjdJWmdJQ3I2UkN3aW9FMlhN?=
 =?utf-8?B?eHoyMTRYZmJpSnhJSkFuQndVYVEyVmlQM0E0NUx2NllEVXErZ2dxZVFSRXQ2?=
 =?utf-8?B?Q29QRVA3aGtlZGFaejVRVVh1NUJpOTBUWm0vVC9LNmNhTy9hK09ONHlTWEpI?=
 =?utf-8?B?Q0F2QnM5MldEdTVIM0labFpyMVpKaUZjb1V2VlBQQURNTzRKOWJpOG15Yy9l?=
 =?utf-8?B?S1Nqc3IydWxLUnlSRWVreDVZUU96anZ6R09RZUlTK3EyRTdKWk1YcTRXN0Rx?=
 =?utf-8?B?TzJSZXJ4SW94T1VKd21lWDVXYjVVS3VqUmJwN2Nvd3VtNGYraWtWVkNZQ1hu?=
 =?utf-8?B?ajRRWkgxV05mUkR4bE5ITzUvWXU4ZkdnUkF3RGdDRzZ4N3RWMUNrcWxhano1?=
 =?utf-8?B?NlRCSEw4MlZPRk5mejNndStVaXkzcHJJYkZWTmpGSi9ZczZBSlptRktVYnhY?=
 =?utf-8?B?YWhlWEhRYU9wVllBVzNDQmJic3BxRDhxNFJwNkJxejZrZVV6Mnd3VUpFWnhh?=
 =?utf-8?B?RlZUNjg0M3ZaR3QrVWdCcHllOTJDMkJIclcrZVowMnpkcjRqZ0NCbGZsa0Va?=
 =?utf-8?B?aDIyL3VHVGJVRVBjWS91TDVGcjFuM3ErYlNTYzREdEdBQmpoT29qOFZZVUlp?=
 =?utf-8?B?YWVvaUhlblFudGtpSkUrbnR1VFdudUp5cU0ybTNqMEI1U2czV1Q4UHVBenNv?=
 =?utf-8?B?WWUzdGJjdWlBUFhHTVdXZkVIbHRZZHNpRTVoTEx2V0tiZFduclpNU080NkNP?=
 =?utf-8?B?SEIyR2VlS08wWGo4ZjBWUE1OWGQrc2tjYU1yd1pzZVhmZWttdGttU0tucGlP?=
 =?utf-8?B?YVkvVUduTnRpRktBbTh1SkZXRlZhQ1NjZzRkczZ2MUdyUEhRTXYxeWlqUkdL?=
 =?utf-8?B?NHRTMFk5cjhxN2Z3UExIMGNwbUt4d1Mxc0NqY1ZkQ053cDZ2QUZGdEIyb0xS?=
 =?utf-8?B?a0ZNTG5yR2lEci9NU1d6T0JOTXcweDZCeE9nZHdJQ08yTW52YTloRlQ0TTZV?=
 =?utf-8?B?ek1ZTWdFb3poeDNRVzN5RDlSdzI4L2w1aE1wS1B6Y0U1WGwxY1pYZlkySXFH?=
 =?utf-8?B?bjBHaWthRmhUK3ZoalBMTVdnRC9zR29GaTNDNG9SaHJuVFVDMUxwZmQ0dUt4?=
 =?utf-8?B?a2czUkRJamtBWkdiRlZaY0RxRzdKYXRsa0x1Z0JRTmoyNUMwUDZIZm9uOXcx?=
 =?utf-8?B?ZVRWZndXUHBVUmN3c1BCRXVYVU53ZTh0MGFTS0ZGcXdRNUIvYllzSCtVc0Zz?=
 =?utf-8?B?WjUwRjhFQks2TEl6NWNKdE5TVmtlL2dmWnBmRXEyNlFpcEhRVzZQWEtNd2NZ?=
 =?utf-8?B?K0lxRjJxWXQ2SnRGQWtlU25yeEdQSFN0amtSWTdGcytxZkI5SVhsWm1YRnNy?=
 =?utf-8?B?TldibzdUZmlHTmNXdk5BSnR6b0ppanlkdkdzM0thNTlpLy9GcDZ2eDFzVVAz?=
 =?utf-8?B?Mm5UZ3ppVUFwbmhMR2Y3bTE1ZDF1VXlabjNnV3JoTWlYQ2U1UTdaU1F5b202?=
 =?utf-8?B?RVNOeFBxczY1cG05dUx5SW1lcGt5V0xyR0FVY1A1Z3FKSTFPYWJHV1lHeWIw?=
 =?utf-8?B?NkJneG9jdnRWdElXTFFTRnhxditNc2NDMGRqdVZxMmlQNkxnSTNiL2FudGNW?=
 =?utf-8?B?VC9qaWQrS3NUSit0SnNWc1l5WkpucEZUN2s5SXo0cUEwbytaa1ByZU9kZkdi?=
 =?utf-8?B?MkFWSTRCODlDU3hCSjdiRmV5b3lPd1UvZmp1WGczTkNJK3BwR3IwTmJPM01j?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cee1b8d0-f38e-47ec-b4a3-08dcb55e4bab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 14:52:58.0643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYELe3hJ5IByodycaHOa/QWJnuzKVtdFhkWTvHNeKs35X+J4iA7SZd3RXxc8F5+Z55wOSE+DFTDduzA9u7Pbh+5dXaVAEi2+H+qYYCcOz80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB0900
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 14:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202993

V2l0aG91dCB0aGUgZml4IHlvdSBjYW4gY2hlY2sgdGhhdCB3aXRoOg0KU2V0IG9uIGxvY2FsLmNv
bmYgOiBJTkhFUklUICs9ICJidWlsZGhpc3RvcnkiDQpSdW46IGJpdGJha2UgLWMgY2xlYW5zc3Rh
dGUgYmFzZS1wYXNzd2QgJiYgYml0YmFrZSBiYXNlLXBhc3N3ZA0KDQpUYWtpbmcgYSBsb29rIG9u
IGJ1aWxkaGlzdG9yeSB5b3Ugd2lsbCBzZWUgdGhhdCBmb3IgYmFzZS1wYXNzd2QgcGFja2FnZXMg
dGhlcmUgaXMgbm8gZmlsZXMtaW4tcGFja2FnZS50eHQNCg0KUmVhc29uOg0KT24gbG9nLmRvX3Bh
Y2thZ2UsIHRoZXJlcyBhIGxvZywiREVCVUc6IFNoZWxsIGZ1bmN0aW9uIGJ1aWxkaGlzdG9yeV9s
aXN0X3BrZ19maWxlcyBmaW5pc2hlZCIsIHdoaWNoIGluZGljYXRlcyB0aGF0IHRoZSBtYWluIHNo
ZWxsIGZ1bmN0aW9uIGZvciB0aGUgYGZpbGVzLWluLXBhY2thZ2UudHh0YCB3YXMgdHJpZ2dlcmVk
IGFuIHNvIHRoZSBmdW5jdGlvbiBleHBlY3RzIHRoYXQgdGhlIHJlY2lwZSBwYWNrYWdlIGZvbGRl
ciBleGlzdHMgaXQgd2lsbCBza2lwIGBmaWxlcy1pbi1wYWNrYWdlLnR4dGAgY3JlYXRpb24uDQoN
Ck9uIGBwYWNrYWdlRGF0YWAgdGFzaywgdGhlcmUgYSBweXRob24gZnVuY3Rpb24gYHdyaXRlX3Br
Z2hpc3RvcnlgIHRoYXQgcnVucyBmb3IgYWxsIHBhY2thZ2VzIGZyb20gYSByZWNpcGUgcGFja2Fn
ZSBhbmQgdGhpcyBmdW5jdGlvbiBpcyBwcm90ZWN0ZWQgdG8gY3JlYXRlIHRoZSBmb2xkZXIgaWYg
dGhpcyBkb2VzbuKAmXQgZXhpc3RzLg0KV2hlbiB3cml0aW5nIGBsYXRlc3RgIHdlIGFyZSBwcm90
ZWN0aW5nIGl0IGZyb20gZmFpbGluZyB0byB3cml0ZSBkb3duIHRoZSBmaWxlIGJ1dCBmb3IgYGZp
bGVzLWluLXBhY2thZ2UudHh0YCB3ZSBkb27igJl0Lg0KDQpNeSBiZXN0IHJlZ2FyZHMsDQoNClBl
ZHJvIEZlcnJlaXJhDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NClNlbnQ6IEZyaWRh
eSwgQXVndXN0IDIsIDIwMjQgMzozMyBQTQ0KVG86IFBlZHJvIFNpbHZhIEZlcnJlaXJhIDxQZWRy
by5TaWx2YS5GZXJyZWlyYUBjcml0aWNhbHRlY2h3b3Jrcy5jb20+OyBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogUGVkcm8gRmVycmVpcmEgPHBtaTE4M0BnbWFp
bC5jb20+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzJdIGJ1aWxkaGlzdG9yeTog
Zml4IHBhY2thZ2Ugb3V0cHV0IGZvbGRlciBjcmVhdGlvbg0KDQpOb3RpY2U6IFRoaXMgZS1tYWls
IGhhcyBvcmlnaW5hdGVkIGZyb20gYW4gZXh0ZXJuYWwgZW1haWwgc2VydmljZSwgc28gZG8gbm90
IGNsaWNrIG9uIGFueSBsaW5rcywgbm9yIG9wZW4gYW55IGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB3aG8gdGhlIHNlbmRlciBpcyBhbmQgYXJlIHN1cmUgdGhlIGNvbnRlbnQgaXMgc2VjdXJl
Lg0KDQoNCg0KT24gRnJpLCAyMDI0LTA4LTAyIGF0IDE1OjAwICswMTAwLCBQZWRybyBGZXJyZWly
YSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gVGhpcyBmaXggZ2FyYW50ZWVz
IHRoYXQgb3V0cHV0IHBhY2thZ2UgZm9sZGVyIGV4aXN0cyBvbiBidWlsZGhpc3RvcnkNCj4gZm9s
ZGVyIHRvIGF2b2lkIG1pc3NpbmcgZmlsZXMtaW4tcGFja2FnZS50eHQgY3JlYXRpb24gZHVyaW5n
IHRhc2sNCj4gYHBhY2thZ2VgIGV4ZWN1dGlvbi4NCj4NCj4gVGhpcyBpc3N1ZSBoYXBwZW5zIGJl
Y2F1c2UgdGhlIG91dHB1dCBmb2xkZXIgaXMgYmVpbmcgY3JlYXRlZCBvbiB0YXNrDQo+IGBwYWNr
YWdlZGF0YWAgYmVmb3JlIGdlbmVyYXRpbmcgYGxhdGVzdGAgZmlsZS4NCj4NCj4gQWxzbyBpdCBl
bnN1cmVzIHRoYXQgaW4gY2FzZSBvZiBgZmluZGAgZmFpbHMgd2UgbGVhdmUgd2l0aCBhIGhhcmQN
Cj4gZXJyb3IgaW5zdGVhZCBvZiBoaWRkaW5nIHRoZSBlcnJvciBvbiB0aGUgZm9yIGxvb3AuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IFBlZHJvIEZlcnJlaXJhIDxwbWkxODNAZ21haWwuY29tPg0KPiAt
LS0NCj4gIG1ldGEvY2xhc3Nlcy9idWlsZGhpc3RvcnkuYmJjbGFzcyB8IDggKysrLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCkhvdyB3
b3VsZCBzb21lb25lIHJlcHJvZHVjZSB0aGUgYnVnIGJlaW5nIGZpeGVkIGhlcmU/DQoNCkknbSBh
IGxpdHRsZSB3b3JyaWVkIHRoYXQgdGhpcyBtaWdodCByZWFsbHkgYmUgYSBidWlsZCByYWNlIG9y
IGEgZGVwZW5kZW5jeSBwcm9ibGVtLiBJZiB0aGF0IGlzIHRoZSBjYXNlLCBjcmVhdGluZyB0aGUg
ZGlyZWN0b3J5IGRvZXNuJ3Qgc2VlbSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gYW5kIGlzIGp1c3Qg
d29ya2luZyBhcm91bmQgdGhlIHByb2JsZW0/DQoNCkNoZWVycywNCg0KUmljaGFyZA0KVGhlIGlu
Zm9ybWF0aW9uIGluIHRoaXMgY29tbXVuaWNhdGlvbiBtYXkgY29udGFpbiBjb25maWRlbnRpYWwg
b3IgbGVnYWxseSBwcml2aWxlZ2VkIGluZm9ybWF0aW9uLiBJdCBpcyBpbnRlbmRlZCBzb2xlbHkg
Zm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IGl0IGFkZHJlc3NlcyBhbmQg
b3RoZXJzIGF1dGhvcml6ZWQgdG8gcmVjZWl2ZSBpdC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50LCB5b3UgYXJlIGhlcmVieSBub3RpZmllZCB0aGF0IGFueSBkaXNjbG9zdXJl
LCBjb3B5aW5nLCBkaXN0cmlidXRpb24gb3IgYWN0aW9uIGluIHJlbGlhbmNlIG9uIHRoZSBjb250
ZW50cyBvZiB0aGlzIGluZm9ybWF0aW9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSBi
ZSB1bmxhd2Z1bC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBjb21tdW5pY2F0aW9uIGJ5IGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHVzIGltbWVkaWF0ZWx5IGJ5IHJlc3BvbmRpbmcgdG8gdGhpcyBl
LW1haWwgYW5kIHRoZW4gZGVsZXRlIGl0IGZyb20geW91ciBzeXN0ZW0uIENyaXRpY2FsIFRlY2hX
b3JrcyBpcyBub3QgbGlhYmxlIGZvciB0aGUgcHJvcGVyIGFuZCBjb21wbGV0ZSB0cmFuc21pc3Np
b24gb2YgdGhlIGluZm9ybWF0aW9uIGluIHRoaXMgY29tbXVuaWNhdGlvbiBub3IgZm9yIGFueSBk
ZWxheSBpbiBpdHMgcmVjZWlwdA0KDQpUaGlzIGUtbWFpbCBpcyBlbnZpcm9ubWVudGFsbHkgZnJp
ZW5kbHksIGp1c3QgbGlrZSBDcml0aWNhbCBUZWNoV29ya3MsIHdoaWNoIGxpdmVzIGluIGEgcGFw
ZXItZnJlZSBhdG1vc3BoZXJlLiBUaGVyZWZvcmUsIHBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJv
bm1lbnQgYmVmb3JlIHByaW50aW5nIGl0IQ0K

