Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F751C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:49:32 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.56])
 by mx.groups.io with SMTP id smtpd.web10.79583.1705942166848046998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=V/e9cs7U;
 spf=pass (domain: infinera.com, ip: 40.107.96.56, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCdtu+mp1dPpKSLMwPj9cbY1JM+s1Rod+YVLdeDzO94ISErBtyzO37wFfer/N3qk/ojGjO8wqwo1ToMhnd2tLkdrw4ur+A54heODfDxE/Z98420p0dqsiu/z0oQ2zMbPv8j77nFm5d/lcwdiwlhRCb4DbksRZ/bXfDter9Q+7bc40g4Ql7lYguZMyBMthbjY4d8TYetfQifHR4+6I2MwqM9MZW4EV/gC7tO4+z+fga9FN7xa69efi/I3/gDkLs1lizmyWoLM+X/sPWHTciBwMYePctIU61uqeCKFbEt+4Xi0ZVpuSfIfdJDnHVcLHtRkaKLEjUGtSxmEXPoVGVB0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy0ZOinye7qWCxa5HcwD3SQHOnaaYf9KafXf4stATM4=;
 b=JUo628kfLQGBxhIiBV6JEAbs6WY+I0UID4KDkmc0mtf1sdPdzJupp7LKBKAi1G/9dxr9EBUMWb2XHt0y5iWqgIFnLwccHrRVLUnGUqqAkT7YRBJyESLNJpfs0Q60XPOVy43p0vFqRDACVMHyt7rOXPR2xue7UbxG6AaG5ZlOHfWBpg9WL2nafgWebpJk28wZzsuikQl8DNmzZFH5mmxSAkaiO2TGxcv1QIwjwD88Z4OwGcL+ee6FaIXwOOEGYNKjS193UM4PpTR0/uJjV7AoEwfVMeVwOBFL45RJS9hxQGW+RF64xBWyWHvEJ73oFEKok/rvraKDskpYqnffGS72Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy0ZOinye7qWCxa5HcwD3SQHOnaaYf9KafXf4stATM4=;
 b=V/e9cs7UIqDNdIUZRnvl/izJitTz4AR4ahsgjD1/juZ1UNgZXQhOXTRgjIGicStr179riMSu1z3kvoEJ1TfkbR6atmhE1zA5vmsFoiag66cWuB8jtF+Y3IQpKo2KxDWA4IyfbbknquOABSXT6S/6N2ikgG5VoCT9V4bD0+0efOa03MKXBFyw1xLZ8HLsD9O3l+bwfaA6vlqEb2nlCJ7RRj2CrBREDD1oteKSbuQnP/cuBQEYXuSss5opwIP8V79OEFyGQiioc2JvIRrcQn5PnFmo2NEfFGcWAtFAibT+5Zxv/u2i6jThy1bqUmTi2Uc8BSKUq4ihMj5zrKWYm/8yfQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by SN4PR10MB5639.namprd10.prod.outlook.com (2603:10b6:806:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 16:49:23 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7202.033; Mon, 22 Jan 2024
 16:49:23 +0000
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
Thread-Index: AQHaTUPUG5+0CfWaNE6rcQgwgYDmjLDl78UAgAANuACAAAWXAIAACEmA
Date: Mon, 22 Jan 2024 16:49:23 +0000
Message-ID: <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
	 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
	 <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
	 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|SN4PR10MB5639:EE_
x-ms-office365-filtering-correlation-id: 8b462df6-92ad-43ad-68ac-08dc1b6a162a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RroEvYzLJq34HqE7+uPYQUGU9YzPNeB7Bp1cEffq7VfiJU8swENvc45iCSnTvKFgT1TKNpYOWA25SChaQsC6XXmxtPZji1oJpsPcAK7PeL1PEiIp47hL0UpbrgC20E1lgnNq+j9nLJtjHfcRkYkRIYUHA6nkyZ1AHh/nfUV+XEzINH3OSFwbDy4K9hHYnuuqq09QBS2I9BXBYBlJPMznzeYdnFlnXlODUW5kEhahfgWpoJOgHACP+ahMc3ROKM86HXlj7LzCUcc0tcCqejDOkv0+JkLukujTyhoKeHym1oC7zONm6JDJ6jBoiIxe2ddb0WoTFxq2JYsr2nqug8FoS3QQDY9C6bCCci09VxQC+NCZBH48MYvEsbFWlsMHA7DZ+H+FKu4uKLIZ7XDx3dNbPlta4hEtVyS3weYa0JCyVWVf4tlfp9ejIQ8HroI0qiMpGKhMdyd1hy6vf+ZYpPEV5jCJ9vEL+rE923afEtQB+5XynnvBrxdyC7x/Epyq0LrbIldXBkm5VYiNK5ngYqgtDLNz1yeT0KsjIbLJk4jOklTNSM/V5ucoWnlfaJbNYgbH9LD3um9cu15af6azJ4y7Z+yIfBVtk7uEU8sCh7JtOeL4wZPya1cy3OIVSIvmfl4K
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(136003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(71200400001)(6512007)(2616005)(6506007)(122000001)(38100700002)(86362001)(36756003)(38070700009)(41300700001)(478600001)(5660300002)(2906002)(8936002)(66556008)(8676002)(66446008)(66946007)(64756008)(6486002)(4326008)(91956017)(66476007)(76116006)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WitSWHBDOTVTWUsycDdMUWNNNmZLRVkya0RGZzdTK2NleDMxSHZlL1RvemUx?=
 =?utf-8?B?YjNOSUNORG51MUY5L1lEY21keHhyT3BWL2NERk1mR0g2Q3BlQ0xickFSUTEw?=
 =?utf-8?B?bmVCeVl3UmlzYmpnNXRwUmNmWTU0blJkUCt3Z2d4U2xnV1ZCQ1BQdGZ2YVV2?=
 =?utf-8?B?aFpoc1p3dmJzWG5JK0czY1RBa1dSU2c4b1piWFRXeXk0elljaWQzQmRKL3NY?=
 =?utf-8?B?WFFhNjdjM3lRZk1OcDc2M0JoTndQU2gzV3ZYekhuOWFmUjRUbDFrK0hJc1Bo?=
 =?utf-8?B?NVpFWm5GYmtKVUEvSUo4cEQrdHVPOXFXcEoremRHT2xUZVBGWlJGVlRKOXZj?=
 =?utf-8?B?Y3NOeGZIOGR1RFVnQ1pOcjE0NDlDUlZIZThqbm5WUkZ6WmJqNlJudjRDeGdZ?=
 =?utf-8?B?V0k0TnhIZFdYZGpBbS9mWXE1V2lhWjBzNUpxbk5hWmxvWTJaU2o0QTFhZ2Ri?=
 =?utf-8?B?OEpqTjRFYnZLYXVSOWo5NVlxaWdGZVJsNFIwdDN1YnpsRENTdnlkaXZBSkZU?=
 =?utf-8?B?dDZ3R2dXNVcwRWswVkZIUFh1NzV3TEFMcVh5eU92SkZTTVIwZERuZlJGZ0Rt?=
 =?utf-8?B?cTJ3YWhpRytJV2YzNHRVc1hGSm9QUzQ3bzFmcGFDN0srWUVHdGN2dDlIU3hx?=
 =?utf-8?B?K3B1YlhJSEpSUndkY0JQd2w1SG9DL3dwdEVnaXgrRWY5bTFZUmdaL01VeVha?=
 =?utf-8?B?QnpsT0R2TXhaV2dRamFCeVJqcEdsY3N6bS9zc3lvbklQUTRYNXByWS9Rc01H?=
 =?utf-8?B?QTFXdFpCaSs4RThXU3UyRzE3NXZjZHJxZ1hEbjNTNU5LenBiNmJBb0w2YXNt?=
 =?utf-8?B?bXFJZGg3KzMwZGVpYVQ3UmNaOEUrcGl6SGJVcU9xamQ2VCt3OTk2VDJUS0pi?=
 =?utf-8?B?ejY0aFpjbWw0dXRUREJQeTk0OEg4QnRyV2hGMzFBbXNyTmpTdExSSXF1NVc0?=
 =?utf-8?B?MDZ1MXpsLzNZK1FxRWcrS0VRUTd3VkROT0l5c1dqTWRCdm9GdUYrYllRVUMx?=
 =?utf-8?B?YjNWTC9Ldk9nTndUc3RTb1RpZE5VVDd2NFB6RDc4L0E2aWltY3gyWUNlcVZZ?=
 =?utf-8?B?MXdlV0phWnVueUZiSWlwRTBua1FOYUhtWUVCM3BUZkxPaUpqaTJCcHFadmJv?=
 =?utf-8?B?VkpQcEowZTZHVlFESTdlSmxuTmc0M084djhYOTlQOHVmMEJzUHdwU25DWnJx?=
 =?utf-8?B?dWEwQUE1SzFnNE05bVRRdkxuUGFZOTMweHl1OHZkRTZ3TzV3c3UrZ1lRc3VI?=
 =?utf-8?B?T3RKajNPQzlEL1piZnNRZVlXQldwTUpydy9ReWd4bjM2Yk9wWFJ1Q1FXU0cv?=
 =?utf-8?B?SFpCL1d1clJYcGo1RjhIRjRiQkRLdTFEcm11bzJhUWhQNmxTNUY4WGJuSWtW?=
 =?utf-8?B?aCtIU0Q2elA4dDhjTGVDZ0FRNnJkY1k5L0pjb0tWNGxKNXY4NEU1SEZ6dncy?=
 =?utf-8?B?UGJIUGdQb29heEpQR1djR0N5SWNZdWcvL1lHVDVQMFY2WitFaFZyakJQZ2h3?=
 =?utf-8?B?Wm0xcWlRWENtd2hPOFZDUHdIUXVKQ1NGNm1KbWJBQnRmZFVIbGpwUFdVMkl2?=
 =?utf-8?B?K1MvUnZXU1l1bnAyTDBmVGVmcWRidzZ5WUlRbmR5ajhueURiUlU2ZzJudFAw?=
 =?utf-8?B?dTM1ckpDRGZqQ2RpUW1QZFNhNXdScWtacDJPZzFhTGZHbC8wWGJhQXJvZ3hn?=
 =?utf-8?B?QmhVbi9BL3VLWDcwcjZYN1hVMEk5UVNmRlZFTnZiSGJEdjgrSlVEWmxsZG9h?=
 =?utf-8?B?aHdHWUdWK3JWcUVzM3JJRFFKNFdlZGs4NlJEVVRCUkd1WDR3MWNvZVQ4M01C?=
 =?utf-8?B?a253Y1IySUxHcnl0VGkxaTFReWZqMGg3dk50bmV2a0ZQQ0xqdU9uK0w3WXds?=
 =?utf-8?B?SGF5NWhtTlV1MWVlNEYwMGVWNDJrYkN2SmVRYXhMSUhGTFZjMEhXNG0wS1JD?=
 =?utf-8?B?TEJjeVdTaHFhU055dmdFeDhSTjBtRm1XNGlTT3lGNlRiR1p3SGJkTlJyYWtD?=
 =?utf-8?B?akZvMzRWcm9yeXJPVGo3SW1zc3VoMWtueExnRWpUUnhlU0FNZFZENEZWaC83?=
 =?utf-8?B?WDE4T3ViVlZDL2pnTTdQdUtHdlFFUDcva1FjYm02YThKWitaaHpDODhVNDRr?=
 =?utf-8?B?WVBBQzBaZU1sd1UzU1pzODhZUFdTdGlCUmkxZ0c0dlkyY3Rzd1RicklwRFNt?=
 =?utf-8?Q?81AtGHjjwOeI3CT458PfX+GybX4OTkKeLzTHdvd/Eu7u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89067501CDC9AF45BC597C020107D1E2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b462df6-92ad-43ad-68ac-08dc1b6a162a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 16:49:23.1519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdbF7QdU9LhIf75Rp7lKkJT7wym1kdY+9UL+thbbOF8axO5yajfmEYmNZ2CP/SIjs5lCBMWQvH5asu0P7Tfeyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 16:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194186

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE3OjE5ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gTW9uLCAyMiBKYW4gMjAyNCBhdCAxNjo1OSwgSm9ha2ltIFRqZXJubHVuZA0KPiA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+IE1heWJlIGJ1dCB3aGF0
IGFib3V0IHRoZSBtaXNzaW5nIHJlcHJvZHVjaWJsZUEvdG1wIGFuZCByZXByb2R1Y2libGVCL3Rt
cCA/DQo+ID4gV291bGQgdGhlc2UgYmUgbWlzc2luZyBpZiBzc3RhdGUgaXMgdXNlZCBmb3IgYm90
aD8NCj4gPiBJbiB0aGUgbG9nIHRoZXJlIGlzIHRoaXM6DQo+ID4gICBJTkZPIC0gQnVpbGRpbmcg
cmVwcm9kdWNpYmxlQiAoc3N0YXRlIE5PVCBhbGxvd2VkKS4uLg0KPiANCj4gSXQncyBwb3NzaWJs
ZSB5b3VyIGxvY2FsL2Rpc3RybyBjb25maWcgc29tZWhvdyBvdmVycmlkZXMgYWxsIG9mIHRoZQ0K
PiB0ZXN0IHNldHRpbmdzLCBpbmNsdWRpbmcgdGhlIHNlcGFyYXRlIFRNUERJUiBkaXJlY3Rvcmll
cywgYW5kIHNpbXBseQ0KPiBidWlsZHMgdGhpbmdzIHR3aWNlIGluIHRoZSBzYW1lIGRpcmVjdG9y
eS4gVGhlIGxvZyBkb2VzIHNlZW0gdG8NCj4gaW5kaWNhdGUgdGhhdDoNCg0KVGhhdCB3YXMgbXkg
dGhvdWdoIHRvbyBidXQgSSBjYW5ub3QgZmluZCB3aGF0IGlzIGRvaW5nIHRoYXQsIGdyZXBwaW5n
DQpoYXMgbm90IGZvdW5kIFRNUERJUiBjaGFuZ2VzLiBJcyB0aGVyZSBzb21ldGhpbmcgZWxzZSB0
aGF0IG1pZ2h0IGluZmx1ZW5jZQ0KVE1QRElSID8NCg0KDQo+IA0KPiAyMDI0LTAxLTE1IDE4OjA3
OjE2LDQyNCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtDQo+IHZhcnNfQTp7J0RFUExPWV9ESVJfSVBL
JzogJy9ob21lL2pvY2tlL3lvY3RvLXhyL2J1aWxkL2luDQo+IGZuLXhyL2dtY3Utc3QvdG1wL2Rl
cGxveS9pcGsnfQ0KPiAyMDI0LTAxLTE1IDE4OjA3OjE2LDQyNCAtIG9lLXNlbGZ0ZXN0IC0gSU5G
TyAtDQo+IHZhcnNfQjp7J0RFUExPWV9ESVJfSVBLJzoNCj4gJy9ob21lL2pvY2tlL3lvY3RvLXhy
L2J1aWxkL2luZm4teHIvZ21jdS1zdC90bXAvZGVwbG95L2lwayd9DQo+IDIwMjQtMDEtMTUgMTg6
MDc6MTYsNDI0IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gYyBpbiBwYWNrYWdlX2NsYXNzZXM6aXBr
DQo+IDIwMjQtMDEtMTUgMTg6MDc6MTYsNDI0IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0NCj4gZGVw
bG95X0E6L2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci9nbWN1LXN0L3RtcC9kZXBs
b3kvaXBrDQo+IDIwMjQtMDEtMTUgMTg6MDc6MTYsNDI1IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0N
Cj4gZGVwbGF5X0I6L2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci9nbWN1LXN0L3Rt
cC9kZXBsb3kvaXBrDQo+IA0KPiBZb3UgY2FuIGRvIHRoZSB0ZXN0IHdpdGggYSBwbGFpbiBwb2t5
IGNoZWNrb3V0IGZpcnN0IGFuZCBzZWUgdGhlIGRpZmZlcmVuY2UuDQo+IA0KPiBBbGV4DQoNCg==

