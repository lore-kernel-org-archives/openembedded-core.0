Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CB2C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 18:52:33 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.62])
 by mx.groups.io with SMTP id smtpd.web10.2328.1706035945474883330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 10:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=P9Izd3Dd;
 spf=pass (domain: infinera.com, ip: 40.107.223.62, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpdqHi1RysGCR/0dfvliOrIhT7QZQeZZbQLPGTY9zUjhMdtuDm2vr3MFD3weCqvJKNL/FrLNC95Tua+f//OCAJz/H+oeGd30xaqdUfdKK12BX+culh7qHsPTVCCDh43BROkmSMDz48nrFwpOSxl8OuM00/yTjP7Ze/gsue26o4gHM+9Uy+D1vkfUytPHKQ1RcvEIzD1Aiczvhv5G6xNV/UIoOtU/AQOW5OUi3soivSYUIL5DMAQOdHR45S53p+7eF8InscVg8IRgLk6P1tuxLANgB7cjawYnKzTBBFQOgHVwRZVRPmThvIOYiKTdMqf3tVqx0G3lZnxC483Hl+K4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbua8IHO0XBFyRtmYuNmO9mfpN3rFvm1f6q+1p5b170=;
 b=iENVjCs/88DxODnwMk/DK3G6UEcufEBKUVOLrcixZu7autcMwo9ZRnOe1TzILvrIr9fuXTB8YPxWszYIn9row9OTLoNpC3SgxF19uB+TBEhtTtPYvuzU5G0KtwAdusc7db9mJ6bS5CXmA3pU+f0RYrw9bWxUYQcU4wybBG0Mfgw2eK2Mgw76+/zs+kNKmd60UCAjMTUlvHvWYXV2paRHEgIOx968naQhxWXMXSudQJXNVMR1QyEpU/E2d+LyBnqLYTqh/7CGm/bIoFVvrMqhCpnvB8wHMOPV6QJ0U4NeCALxP8ltk8uIBuX8k+2ntEetrZQBfZBJpEDewkMaJ6Mu+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbua8IHO0XBFyRtmYuNmO9mfpN3rFvm1f6q+1p5b170=;
 b=P9Izd3Ddr7ei9zgv44DNvKkHlMwlkC1w7RoyAoHJAkD2ghw/46c6bva0l/tcReZaVJVbQDQXUXDrkcZ24s590rmbrAqtvHLGKtlCq9jlhEe7hpzFikhWDLHw4exFXVIsSmzIqpS1ICk77fBCtuBhjUi7OgbG7a2fNSsnOSl/sQGdPXpsX+Bcy2h0jORcAN5bPpo2mFp/ZateCuEhu+Xw1pBHIglD7yIYpwyOpUoJSmqTKPuVFnl+5YeYoFN7bqQkhvzOE0ZFh6RjEjdszQrRHZNjZm3T/jhtGdUUKdLAMM/vgeGGPVANpUWgRm9o+Jm7zDlnZlZ2M1oW6Yqd251mNw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by SN7PR10MB6362.namprd10.prod.outlook.com (2603:10b6:806:26e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 18:52:22 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 18:52:22 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] oe-selftest -v -K -r
 reproducible.ReproducibleTests.test_reproducible_builds always succeeds, even
 when pkg is non-reproducible
Thread-Topic: [OE-core] oe-selftest -v -K -r
 reproducible.ReproducibleTests.test_reproducible_builds always succeeds, even
 when pkg is non-reproducible
Thread-Index: 
 AQHaTUPUG5+0CfWaNE6rcQgwgYDmjLDl78UAgAANuACAAAWXAIAACEmAgABAKQCAAXSIAA==
Date: Tue, 23 Jan 2024 18:52:21 +0000
Message-ID: <e28167217b5f0404b81bb87d15c8a1df5e2cc938.camel@infinera.com>
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
	 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
	 <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
	 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
	 <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
	 <CANNYZj9HK0rmThC_uzN5vaNCYyWx2dfOuA2CH340ATavho1MHQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9HK0rmThC_uzN5vaNCYyWx2dfOuA2CH340ATavho1MHQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.1 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|SN7PR10MB6362:EE_
x-ms-office365-filtering-correlation-id: 2fc0f2dc-b6d4-4c90-08b2-08dc1c446ea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AllFXed0sURU8kaVFQHitQSZIwH+PGpC49tpit8dUYbwBAgdZsaaPhFxTXtOcepgfJWTgEoyFyKp3mZo0gGnSIpKWySiQWwbr8J9wcg6DeRn/sdJcPkksOZynkIIJ8XXugvBO9boW/niHW99AOAfmhG5V6hRcnDi02luFienpPO+TN9nClRPyYV4HAFAHMR496LxdWZ0oj/rqi28Xn9iY8vcga7GFUzPPrsmVRrfrMAgOg4HpnJA1UeM74F5RfMmE4zc2RGw90jk2kfRWGtz0X86D2Nn2qvyPN6EI4iW5SwmlWSXLk9NPaiU2g0ovhUyt7T8bMMaMmWjpEOgU0TF7uC6Rp5XJtSSC3hf0+Ufbj3gzggGk6V0UKpPvHyoDhDUzFp2SKemTTkMvV22wHJCkTEOOpR2xagaG8xjXN3jioBmS0r1zxfn90rbTgHc4HnaFG0WRm3XSbcdgdNu/JeRwBDbxZxhQ7Ous0MYVfuuseTOKUuB0O3EwvAoLsli+lOsAUKryobDPiWUPo0sG6M3bxxQ9WbBtKNsUvf2+E9nTU8ZaJtP9rGHoMczxq6yXpfCyrD5zjgoLvWzO0bfEoay8OXt4oiN5bnAUHzDyakdJnMM5+BL7jvrCD+As7SiOPBe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(346002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(38070700009)(66556008)(4326008)(8676002)(8936002)(66446008)(66476007)(2616005)(66946007)(64756008)(6916009)(76116006)(91956017)(316002)(2906002)(5660300002)(478600001)(6486002)(71200400001)(6512007)(86362001)(41300700001)(36756003)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VTY1djc2UDZ5aFNTVjRIV1czeVFuYlJscCtJamRXclRzRmoyeGJxZmR1a0RD?=
 =?utf-8?B?dGgrd21KZDlRTFU5dUlLeDhTbVk5NmNtaFc0Sy9GRXNUUm02b21qYTlsNHZU?=
 =?utf-8?B?TEFSK0VLV3pyYjcvYy9XK01Nc29PVGNPSURpbFkxelZxcmdCWXhBNlBmVnp0?=
 =?utf-8?B?YW5UN3ZHR084K3R2NkpIZkNCK3RXc3pNSnBFSEFrNkw4MmJFem92V3doSHV5?=
 =?utf-8?B?b1BvVFU0TmxOYlJOc2gwSWpSc2prM2RLNkkrZ2RQYmdLY2xCdmEvZU9mSmJ1?=
 =?utf-8?B?UVM2VFptUnJTeUtIdHlCdXNqWm9WVGlTUXNwVFVhMnlZUFVzRWo1RFAvU3pG?=
 =?utf-8?B?MGFhKzR3ZFNaYjB0S3ZFaFBoTVBIdVluNVRJd042emJlSFVCekZRRmdhMWpI?=
 =?utf-8?B?TldWdFFOTGV5ajhNY1pBTDhoSitRZjJJeU5hMzdjTjVHcXFuNVhOYnl6VjBM?=
 =?utf-8?B?SnNjcVVDOUJOSHJjREdIenJWN092YUpDN2MzSWtmUTYwUUJNV0VGc3dhS0N6?=
 =?utf-8?B?NVdQUDQ2YjJFTmdtZnFnUmxlOG1oOUpYeTg0S1VJbFlndkE0aTZpaWorMTVw?=
 =?utf-8?B?SGVac0dZaGFBNVN2UWxibzEvWWdkSzJOMkdDWWNPQndSbklBb25ITnVQNERT?=
 =?utf-8?B?NzdIZVRGUCtodkk5c2QrcVUxam1mTW4wK2hxVmJSaGZSR2FrZEN0dGdHdVZp?=
 =?utf-8?B?QmltaG1IUyt2dU1TUCtCaHRZc0taeFZVc3ZUaHBKR3NCRU4yMWpYSXI1ZUcz?=
 =?utf-8?B?dHpQV0FNVk9xMlMyclZ1RGRXekJjWjhlTG8wRFZyTTREc0JwVTMveGdRMDlj?=
 =?utf-8?B?cXdIWjlkdlI1bTlXZml2dTZYUWNhckhpZU1mZmJxQ1dycXdURENteW1PVUVQ?=
 =?utf-8?B?ZWlwcWFLRGtPcFRtWTRLVXRWRWRvOEM0SVQ5OUNhS1FXbXl0bUNxT3FtVFlG?=
 =?utf-8?B?ZC9razhLdzVwS1RzVnVUNVF6NzlUbzRPT2sxa1VjSXBzaTl6TFowUmYyclNC?=
 =?utf-8?B?bEhSSTFHZFBGYTdmclNkZjlrMXdoK0pXV0U2bFlQNVo1cjZMdTNzdVJDeTJZ?=
 =?utf-8?B?bkl1d091ZGVYanlvb015Q3BvMVZyTCtxME9rbWdGaVdpN3JNeXBPcmZnY1VW?=
 =?utf-8?B?ZlRneVkvWStaamQyNXFMVkkzWTNBdGJ6N3ptOHZIbVo3akpleld5MDRjOGZv?=
 =?utf-8?B?U21pK2FsWUFaa0ZsQkxFREZhZ1ozRm4wVEt6Z1gxRTZUQ1dJOGRZb29iTHdH?=
 =?utf-8?B?ZkZ0amVYd21ibWIxQ1pjbE9saDNlTTFRWkF3bitCNkJHYUJOd1lFVFpxV1FC?=
 =?utf-8?B?Mm5ZUkY1TEtvODRnTnpQNUtVUUNwSFVvTnR4RjB4LzNUTWUycWR0WGs5c2VY?=
 =?utf-8?B?RWlBaS9LU2R4SnhGOEhJRWRPYnc0TzgwTW04KzN5TFhERjBhamJNczIzQVJY?=
 =?utf-8?B?cG1hL2NsL0dDM0ZYK3EvalJjYmZzNDNzNkxDRFlrWjBLUThoQm95bDhONVIw?=
 =?utf-8?B?QkhWZllIMmJjV2NTd2VyZmo5TDIxMWRCSU9Eb1JrQ2pyRU9ZVkZ4U09BWklO?=
 =?utf-8?B?ZXZlaTBDWExVbFBsRThOdUM4K01HVHk5MEFGVEpERmI4cVc5V1VEODB4dFlu?=
 =?utf-8?B?Qi8zNXc1T211MTE0bHJVWFVVcGxtcmwvZ2hHVkZSWUIyWGRqaHFyWG1QSzFU?=
 =?utf-8?B?bUoxS3hra3RoTnowM2UzS1BXV0IyQkxFOVc2NHhoczBzcjJIVlVjNkw2UDFU?=
 =?utf-8?B?dXQzVjNBZ2VQZzJFMWxoa2FBdHhTcGt6ckFtQ2R6Q3h5SWMyVGxmeFJkZHVX?=
 =?utf-8?B?Wk5nMlRUcUlUOHlvbUR1L2liTDdDYkF3eFJvenZWSDRzV3RDaHZRVkV4NkRk?=
 =?utf-8?B?Z3ZoY2VkREl1MkFxNFZZZ21oTHUybDgvRXVVWEFUK0lLTitYcXdhejV2ZTJK?=
 =?utf-8?B?cEVlazdQVjZRYUF5cm1HNHhLS1J3dnJsSnRzcHFoREUyNkl5RUlVMkNVRTVn?=
 =?utf-8?B?bnRqWjhGQlZZUXcwMk1wRkVwVTdDckk4SjhFUGlGV0ZJVVVOMjkreE9rYk5m?=
 =?utf-8?B?amd4OFg5a0d4Tmp2Z1BaOHVyekY5am5UYXdqQzduK2hFcStWbmRJQXI3NmZD?=
 =?utf-8?B?VE5oaUJiL0JnV2R2cU5adlpRZXdIdVRmTzFFM0plcnRobTNIODhhenhISFVl?=
 =?utf-8?Q?IXQ7pM0M2eHoNccHJKvLMqcMVegdC0f6OoyKvT22mTHH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DA5C66D7D60524397094130DB31103A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc0f2dc-b6d4-4c90-08b2-08dc1c446ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 18:52:21.9594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7c4WULi2xTtU4M+6Znvc2aJH+rNTjIPz31Irp1eZIBJf7VnJVdOkTAro/V/QuaZpyqDrQDmfC1ylpN3jNQXwNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 18:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194247

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDIxOjM5ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gTW9uLCAyMiBKYW4gMjAyNCBhdCAxNzo0OSwgSm9ha2ltIFRqZXJubHVuZA0KPiA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIE1vbiwg
MjAyNC0wMS0yMiBhdCAxNzoxOSArMDEwMCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+ID4g
PiBPbiBNb24sIDIyIEphbiAyMDI0IGF0IDE2OjU5LCBKb2FraW0gVGplcm5sdW5kDQo+ID4gPiA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+ID4gPiBNYXliZSBidXQg
d2hhdCBhYm91dCB0aGUgbWlzc2luZyByZXByb2R1Y2libGVBL3RtcCBhbmQgcmVwcm9kdWNpYmxl
Qi90bXAgPw0KPiA+ID4gPiBXb3VsZCB0aGVzZSBiZSBtaXNzaW5nIGlmIHNzdGF0ZSBpcyB1c2Vk
IGZvciBib3RoPw0KPiA+ID4gPiBJbiB0aGUgbG9nIHRoZXJlIGlzIHRoaXM6DQo+ID4gPiA+ICAg
SU5GTyAtIEJ1aWxkaW5nIHJlcHJvZHVjaWJsZUIgKHNzdGF0ZSBOT1QgYWxsb3dlZCkuLi4NCj4g
PiA+IA0KPiA+ID4gSXQncyBwb3NzaWJsZSB5b3VyIGxvY2FsL2Rpc3RybyBjb25maWcgc29tZWhv
dyBvdmVycmlkZXMgYWxsIG9mIHRoZQ0KPiA+ID4gdGVzdCBzZXR0aW5ncywgaW5jbHVkaW5nIHRo
ZSBzZXBhcmF0ZSBUTVBESVIgZGlyZWN0b3JpZXMsIGFuZCBzaW1wbHkNCj4gPiA+IGJ1aWxkcyB0
aGluZ3MgdHdpY2UgaW4gdGhlIHNhbWUgZGlyZWN0b3J5LiBUaGUgbG9nIGRvZXMgc2VlbSB0bw0K
PiA+ID4gaW5kaWNhdGUgdGhhdDoNCj4gPiANCj4gPiBUaGF0IHdhcyBteSB0aG91Z2ggdG9vIGJ1
dCBJIGNhbm5vdCBmaW5kIHdoYXQgaXMgZG9pbmcgdGhhdCwgZ3JlcHBpbmcNCj4gPiBoYXMgbm90
IGZvdW5kIFRNUERJUiBjaGFuZ2VzLiBJcyB0aGVyZSBzb21ldGhpbmcgZWxzZSB0aGF0IG1pZ2h0
IGluZmx1ZW5jZQ0KPiA+IFRNUERJUiA/DQo+IA0KPiBZb3UgY2FuIGZpbmQgb3V0IHdpdGggJ2Jp
dGJha2UgLWUnIHBlcmhhcHMuDQo+IA0KPiBBbGV4DQoNCkZpbmFsbHkgZm91bmQgaXQsIHdhczoN
Ci0gICAgICAgQGVjaG8gJ0JCUEFUSCA9ICIke0JJTkFSWV9ESVJ9IicgPj4gJEANCisgICAgICAg
QGVjaG8gJ0JCUEFUSCA9ICIkJHtUT1BESVJ9IicgPj4gJEANCg0KTm93IGl0IGF0IGxlYXN0IGRv
ZXMgdGhlIHJpZ2h0IHRoaW5nOiBUYW5rcyENCk9mZiB0byB0cnkgb3B0aW1pemluZyB0aGUgYnVp
bGQgc29tZWhvdywgZG9uJ3Qgd2FudCB0byByZWJ1aWxkIGFsbCBob3N0IHRvb2xzIGV0Yy7CoA0K
DQpTZWVtcyBsaWtlIEkgc2hvdWxkIGJlIGFibGUgdG8gdXNlIE9FUUFfUkVQUk9EVUNJQkxFX1RF
U1RfU1NUQVRFX1RBUkdFVFMgYnV0DQp1bmNsZWFyIGhvdyB0byBwb3B1bGF0ZSB0aGF0IGxpc3Qs
IGFueSBwb2ludGVycz8NCg0KIEpvY2tlIA0KDQo=

