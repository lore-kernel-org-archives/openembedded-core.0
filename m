Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C480C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 16:19:57 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.47])
 by mx.groups.io with SMTP id smtpd.web11.19570.1706545188148162180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 08:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=qs1pfzfo;
 spf=pass (domain: infinera.com, ip: 40.107.237.47, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/ipK23Y37jkrl9plOJJSbQI3IP1HSG45b0KLnD9qYqB5WRZ0SReYoWoLpqszIS/W9Bo/LXPSe/vEjLosAWe5O1fNWnK1TNBTxzeoA5WLW+1uD2pi9gd0t1eH+Llu7+DEly20IGQe5nvBLfyA0fF/vV+wnfrwU3dpXnBcg3YWFIODU4n9MaWShjKyuRnLaGEmrmHJ7hvqGKZmAsMB6iZXND5k40B/LDtG8k4vGydWAGbbOoiEhKQfrh7YMYxH7uDIlfLGB6dDPuUn1CiwlxLhpi08wBKar8aqggdJHfr2LcEgrwt0B5/3BLOvbmIOwAaa3RWbVSNT7J3BS6JECHIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkytQASoM19OYRw+957bT3+490PLXWKCuyfyAJgJgSA=;
 b=eWNQTenP4nD9Y7tb5oIqnFB9VgUBjOaWCctWgvzOxdETX1QA4EAt70gYr75UMi9oOnXzjtrxLcv+geS29FAmLw1PwI8IFdkz7EEYJPRJB3x28fKvqqL4OcAA4moVyT3VMF5QyN9PnQwsd5HqoRAJZ+LzZj0LLZXgmLQr2g2aVotIgEsh7+p5pGHBbGMe1WeLGaaqPMTjM6Gfk/HnOYPkmDBX9ht2PkbmkStgjhaBYHEN5Q4k0d9s/AjPyOthXQzjO7Eox9SysmmtszVHrJ75dHrlvejAIGL8z9ebHuuMwdVbaLDOITa0qaj0n3ARASr/8JuDwwZRNwtBXlWMle68VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkytQASoM19OYRw+957bT3+490PLXWKCuyfyAJgJgSA=;
 b=qs1pfzfoTCyJsULR02prx3JSAQkbkpt1S2tM+XKXL4g7mSGtUEI6jYszF1L6i+S49Ic9dWBLhNmUyBA2Ymwa/JubVY8Oyp9HVxs/AOn8k7Hb2UKOVJUCrYZ4vgDODocGa+in1uv6BS94/VFPCKoK/ySINp0uCAHZm6jNtl+DTe3NBcSnoRvdnhBQ/X1vDK3vG5MqC6Igm8Ths2JLQz7bDdNMZsNF3t/dC3A7XBU954bkCRPnZgBhKxB7rGiPFHvdDaiJa+DVUcPoy7QJMnoXH0tw+MCqUleA3hoG/9KGmTmUybhkhTqKnU/wRtFnUgR7z7vFnCchGPJOYAikmK+VtA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 16:19:45 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:19:44 +0000
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
 AQHaUEgkMNzCIETAnkmJ7AygmSs1ubDsAvKAgAARooCAAANfgIAAFguAgAAAwACAAAVwAIAAAfwAgATHMwA=
Date: Mon, 29 Jan 2024 16:19:44 +0000
Message-ID: <b4d6e17c57303d3de089954c0fb70febc737cea6.camel@infinera.com>
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
	 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
	 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
	 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
	 <7b811dd50bf9451b3a221c547fe13328f2dac140.camel@infinera.com>
	 <CANNYZj-sad7Cb8iVae=mACp55vYu8b-K9Gr69jTFpWaD=fQgmg@mail.gmail.com>
	 <7d151635479f421df3e711f39ad99fef71b2f833.camel@infinera.com>
	 <CANNYZj8kEHJVfpUUP3gh=rEwGe6MO_UsD8mvwe=vTVSSBJ5L3A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8kEHJVfpUUP3gh=rEwGe6MO_UsD8mvwe=vTVSSBJ5L3A@mail.gmail.com>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BN0PR10MB5093:EE_
x-ms-office365-filtering-correlation-id: 608c83bb-13c1-4bf1-5825-08dc20e61b03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aEd3XlkxSziIAq4gPS2mZ7NFfkI73yFcVdIcuxfPtQO4v6PRDRAKuRolOwZUzu42An9tNdkaCj9Mm/MPR6Ca9797Uc8lDZUukqS/AaDhoy3c3MzpcrYPDVexnet7TEPaVTwNH+/sjaKc76sJrn+zBd4Xqtk8SXLFb3zkOkESuhPnTk0u9IpkN4ZcMVcz7uBZErqYKniwdbTTpn6wkKIa23cBGBfmc/phjHcFkYiVTqGZi/MPJMgWbhU5Ditcud1E8uUfvdKsYsPUXnFLv5koQClQm3xfy9yKSMk436QKnJotKzrg6A2I6yBwmN92NTbySRvoSSGlJu0NSwDthVJv05McZRf6hUwnFrAO28z+4Yix5C3uH4Yn4q7HUypp2usFhpYgstgXFofl1mCWg3t17GM3PX/YNyDAZmb9HIGG1LooSO2l1jpz0vybJPH1uzs/+q2L/6wlbchtlOjafcuInJhokbZE/Agutm1aT0YdJCTw2rWDLUh+QXLgRVs5zkhHzxHkm8q3OU0Jr5+5ToNaLJVBi7aJacGrgdvuF7d9pRTFJqeNLLJRtPZbA7svlbtJYU30e5WDg5XHW+JoPj84hosIAwUhRWb0oL+uWJQQ6ofd1rvkGjJjZxDM+d+nldlV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38070700009)(41300700001)(2906002)(5660300002)(36756003)(66946007)(66476007)(6506007)(64756008)(66446008)(66556008)(6916009)(316002)(76116006)(86362001)(91956017)(6512007)(2616005)(478600001)(6486002)(71200400001)(4326008)(8676002)(122000001)(8936002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?clFoY0hQNmlnS0xDdTdtMU9YdEY1RnRGcGdFNkJna3kwdlJLVkNZenhHOTBC?=
 =?utf-8?B?eXlRaVFSOHRlQmxHOHNvekxPYzRCaEpaQnhtREdFSUZwUEFKUTBSNi9qczNC?=
 =?utf-8?B?djd3TGZMdnE0aWtGR1NrUHF5eFFOR0c1VStFcXNwQStDdnV2bHN4VHdhaW5K?=
 =?utf-8?B?ZEJFenlFTjluSTBMMWVEZmk5UTRmNHVtR05TWGI1QUNzZUdqbUVycnAxSktq?=
 =?utf-8?B?QVM2bXgyOHFCVWdkWjhCSG5wWkFaczRxdXRCbkJqWWtVMklUSU9kUXE2M3U0?=
 =?utf-8?B?TGtTSWtnUC9pZnpMRG4xbVJiYS9EeUU3akdrWlFFSGFxcXdPemZ4QzJ0bWZR?=
 =?utf-8?B?RTdiaE93ZDJyWC9FM0Ixa2RVQnp5aklSajl3TCtwWXIxMlRmdXVMVmdFNDdJ?=
 =?utf-8?B?ZmcvVE1qdDZjTWlCeVdKdjJUQWljODRiczM5ejBXZnIxSjhzOGRGMCtiL2NE?=
 =?utf-8?B?N1NGdXc1MytKVi9HMnFybzVrM0huZEZmVXNCelk1OHlVYml4Y3FlS2c2enFL?=
 =?utf-8?B?bEUrVHRUWDVuTGZHdUwvdk5PclpGRE96K0t5OHU1Mnh4UGNQTkxxYkdiQlVL?=
 =?utf-8?B?V0o0K05ra0x0NC8yZG42ekxuV2kvRmJVb1JkaEh4dnNleTd1UWRTbmkrZGVD?=
 =?utf-8?B?NTl4OEJxUW9ONkNvQ0s2RVIvV3FLYmdtZEJkeUdxRzFWTGVqRVNudVFGUzNF?=
 =?utf-8?B?QWprRndLbHhGdEhsUklpeCszTlRQNWNhWjZ2R00wVUlocTdGOURRdU1JY1I0?=
 =?utf-8?B?WU05Z1lOb1A1V01FUUdPOVJ2L0NJa3YwZ2NHcm5lZTRzbmFYb1RZd2I1RlRN?=
 =?utf-8?B?SDBUeTVGQmVkSXk0T3ozYVhUYWozeUFvQVRDOTdwQmFvVFBJc3hRSGJmOERM?=
 =?utf-8?B?emh6MkxobkhYcTlHanRtU1luS2Q3amRlVEhjRmUzcUpYRzJRTVZmT2VvM1hU?=
 =?utf-8?B?TjVtMVdPYWo5aXE0RTd2Y1hVaTdqc1VUSmRtVWpieEYxUVNBUE4yekNaNzhN?=
 =?utf-8?B?WVZPbzhTWXRUM2tHRlhXNVhKOWx2cllvY05OdHNOeVoyMUZrVktmamJRMTQy?=
 =?utf-8?B?Zm4zeEdZUHVXSnc5WUxxTndjcmxrb1duL21VYUh3ckJxYjlzdVRmWXVSTzg0?=
 =?utf-8?B?VVZiTCtkZVdDZStxZE5kTDExMTNDdDIxNFc2YVJBODhPRHBvZXNRSUdIdjd2?=
 =?utf-8?B?bFJncldVbEJ4YkJGWm1LakZZNHJ4TTdKNWpKRGVPQ3BCTUl3cmVybzdabk9L?=
 =?utf-8?B?VnFCZGcxQSs2cVJzL1lsdVNhd2VUN2syMktoc2dsczJxdXA5OHlBMVNmeWRo?=
 =?utf-8?B?eDhMM2l1ZmlNMUR0NnRxeHlML081a0xjc0JXTmdLRFBRYktnVzQ1WG1abUNQ?=
 =?utf-8?B?NmxBRUFyTWdMWVo3UndTYmdaamtqdmFGRzBTOGJ3cW5pVmVwUlV6YXlGZk1E?=
 =?utf-8?B?WUdyS01ua0paRWlKdUtLZ1p4T2dCWWdBQ1lORzIvelBqclo3NHcxNWFQK29D?=
 =?utf-8?B?MXFsVUkrVGVUSUIweUdPK0dKd29nQXhNb0lqV3lVZGFMazlOQzhCczEvTmpm?=
 =?utf-8?B?em9PdFB1dmRWYlJUcDE2K1VJTnluOGk2QXhZSkxhV2plSDAzWEREUnJ2ZUY1?=
 =?utf-8?B?VVlRUm4wWXRNT2tQRXBVU2JpNFRmakQxdHl4eG1qYWRxZ1p2bFNiZlpLS3gy?=
 =?utf-8?B?NFZCbnhMK2ZiK1J6K2dETktWbE5GZWtkaXFYeUdxWi9jMHBFMXRZajY3bzYr?=
 =?utf-8?B?VllTWUlqVmR5bFV0bWVpWHpqMzk2WUlOZmhHaVhrVzZXSFpUNVlRd3hPcVpv?=
 =?utf-8?B?SWJlZmpYSlVyc1NPNGVpS0NLWGhsbWZCYkc5Z1B5Rmdkc0YwcmFsMEd2L0Mw?=
 =?utf-8?B?Ykx5MFVyS3BIWGpzblBwMlpxVS9nTGx4UzViZkFYemY0YVRRYzFaczBKQ2Rm?=
 =?utf-8?B?Qy95TU5nVURpZXpnc2RkN3lrWkNBNG5PaXhnN3Bvc0xlRm5ZMGRPSllhelh2?=
 =?utf-8?B?WUIyb3NrS2xPVlZ2R25YQVNhclI2SEl1aE5wbUUyV1VkZDYwS292YVJ5V2xG?=
 =?utf-8?B?ZlFPbkRXRDhaUUtlRWtRaGt6V0lJOUlqdmlORlh2MDZqS3Jidkc1VWtIekFS?=
 =?utf-8?B?VUxMMmRVSGdWSFRiYlZNOFRNV201ZVlBdFdPaDlTMTgxUWh4RGJZaFR2V29F?=
 =?utf-8?Q?7gtpy0MDqO5iH/ti9s7KsvpJ9jGvdsZBlFQYaFd8iJIr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC9489B2C429A644853886D73551D3CF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608c83bb-13c1-4bf1-5825-08dc20e61b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 16:19:44.7470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBqyre7hMnkcHdp9M8pv9ORKm8dkywFMWTmsA0C7utb7fL4ewKViS/Psd4RxvISbqCWsxJCzUWRD2Ad7r80Ynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 16:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194463

SSBtYXkgaGF2ZSBmb3VuZCBhIGNvdXBsZSBvZiBvZGQgdGhpbmdzOg0KMSkgSXQgYXBwZWFycyBv
ZS1zZWxmdGVzdCBkb2VzIGEgZnJlc2ggY2hlY2tvdXQgZnJvbSBnaXQgd2hlbiBidWlsZGluZyB0
aGUgQiBicmFuY2guIFdlIGdvdCBhIGZldyBwa2dzDQogICB0aGF0IGJ1aWxkcyBmcm9tIHRpcCBv
ZiBtYXN0ZXIgYnJhbmNoIGFuZCB0aGF0IGJyYW5jaCBtYXkgY2hhbmdlIGJldHdlZW4gQSBhbmQg
QiBidWlsZHMNCg0KMikgVGhlcmUgYXJlIGFsc28gc29tZSBleHRyYSB2YXJpYW50cyBvZiBwa2dz
OyAtZGJnLCAtc3JjIGV0Yy4NCiAgIEFyZSB0aGVzZSBzaWduaWZpY2FudCBvciBhcmUgdGhleSBq
dXN0IGluY2x1ZGVkIHdoZW4gYW4gZXJyb3IgaXMgZm91bmQgaW4gdGhlIGJpbmFyeSBwa2c/DQoN
CiBKb2NrZQ0KDQpPbiBGcmksIDIwMjQtMDEtMjYgYXQgMTY6MjEgKzAxMDAsIEFsZXhhbmRlciBL
YW5hdmluIHdyb3RlOg0KPiBUaGV5J3JlIGZvcmJpZGRlbiBpbiBzZWxmdGVzdHMgYXMgYSB3aG9s
ZSwgZm9yIG90aGVyIHJlYXNvbnMuIFlvdSBjYW4NCj4gcHJvYmFibHkgZmluZCB0aGUgcmVhc29u
cyBvdXQgdmlhIGdpdCBibGFtZS4NCj4gDQo+IEFsZXgNCj4gDQo+IE9uIEZyaSwgMjYgSmFuIDIw
MjQgYXQgMTY6MTQsIEpvYWtpbSBUamVybmx1bmQNCj4gPEpvYWtpbS5UamVybmx1bmRAaW5maW5l
cmEuY29tPiB3cm90ZToNCj4gPiANCj4gPiBPbiBGcmksIDIwMjQtMDEtMjYgYXQgMTU6NTUgKzAx
MDAsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiA+ID4gT24gRnJpLCAyNiBKYW4gMjAyNCBh
dCAxNTo1MiwgSm9ha2ltIFRqZXJubHVuZA0KPiA+ID4gPEpvYWtpbS5UamVybmx1bmRAaW5maW5l
cmEuY29tPiB3cm90ZToNCj4gPiA+ID4gQSB0aG91Z2h0IGp1c3Qgb2NjdXJyZWQgdG8gbWUsIHRo
ZXNlIHZhcnMoU0FOSVRZX1RFU1RFRF9ESVNUUk9TLCBidWlsZGhpc3RvcnkgZXRjLiksDQo+ID4g
PiA+IGRvIHRoZXkgbmVlZCB0byBiZSBvZmYgaW4gdGhlIG9yaWdpbmFsIG1hY2hpbmUgd2hlbiBi
dWlsZGluZyB1cCB0aGUgU1NUQVRFID8NCj4gPiA+ID4gSSBmaWd1cmVkIHRoZXkganVzdCBuZWVk
ZWQgdG8gYmUgb2ZmIGZvciB0aGUgcmVwcm8gYnVpbGQoaW4geHh4eC1zdCBkaXIpIGJ1dA0KPiA+
ID4gPiBub3cgSSBhbSBub3Qgc3VyZSBhbnkgbW9yZS4NCj4gPiA+IA0KPiA+ID4gTWFjaGluZSBp
cyB0eXBpY2FsbHkgdW5kZXJzdG9vZCBhcyBNQUNISU5FIHNldHRpbmcsIHBsZWFzZSBkbyBub3QN
Cj4gPiA+IGNvbmZ1c2UgaXQgd2l0aCBhIGJ1aWxkIGZyb20gYSBzcGVjaWZpYyBjb25maWd1cmF0
aW9uIGluIGJ1aWxkL2NvbmYvLg0KPiA+ID4gDQo+ID4gPiBTQU5JVFlfVEVTVEVEX0RJU1RST1Mg
YW5kIGJ1aWxkaGlzdG9yeSBkbyBub3QgZmFjdG9yIGluIHNzdGF0ZQ0KPiA+ID4gc2lnbmF0dXJl
IGNhbGN1bGF0aW9uLCBzbyB0dXJuaW5nIHRoZW0gb2ZmIGFuZCBvbmUgd2lsbCBub3QgY2F1c2UN
Cj4gPiA+IGNhY2hlIGludmFsaWRhdGlvbiBhbmQgYSByZWJ1aWxkLg0KPiA+ID4gDQo+ID4gPiBB
bGV4DQo+ID4gDQo+ID4gQSBiaXQgb2RkIHRoYXQgcmVwcm8uIGJ1aWxkcyBmb3JiaWRzIHRoZW0g
aWYgdGhleSBkb24ndCBmYWN0b3IgaW4gc3N0YXRlDQo+ID4gDQo+ID4gIEpvY2tlDQoNCg==

