Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8259CC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:09:20 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.118])
 by mx.groups.io with SMTP id smtpd.web10.11853.1707757757819144586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=LVB6qWEU;
 spf=pass (domain: infinera.com, ip: 40.107.237.118, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUJbpDyiODo8Vc3RrqA3CC4xZyUQkbugLviQ1NXqMDySsMSTBA2DjPBwbDws68mX5hpqb2d80ijPUVifvm8kCng8OIpC+iICPv1osNHyftQlTB+/fD1F37JNkhx/53+iPmHiuqfKP9pwDNETMt0QGP36RJKeuWgCzbUaeF3EGeSgWHHdnus2kGcuiAJJSXETJEetiATZ8sI186EX7QU+BppkZNZCFuzIFwW+nuRhRLZf4QWQF/GJRCIwTMYHN5CZhBmkyIbgHLj6vss2Vqc0FaXgU5Qxy3tYKOpfEpihwYX5f5VyIF68rcgEMTVD4vyJvelqf5lVcnm+q95dEhk9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBvvNrjcHp16DqConP6antI5kfRqtooKbf5cFDYy4sg=;
 b=HyJdl2CpCpOEDeVcrUnUNE2My6X8cSGpTCbDtGx069zuPLatcP5dYDVuCWnik3COxAZAQM4fQeQncdxP2mU1zrfahayydWy8CAZ8hvV4acKVyiZkCkqYjrQE/u19qCqd2Lm8b8ZFVZiPIGODhwJf8UJvFhiY4PX5YEdi7+92dDF6jipeJhdMo0hHm3qZkli5yCLCexD3i5XEcl7byAEo3B9s4VW7yelSTAcTcaY5GeahRc10caSUidolVmrmpvm/HOTF9OJxHXIPNlpWgCR8jyjEqBF0uT8bjlk4NNZIQ3pQ6/E/QeWQ+S+ZMprlbqVc4ltHreNjDpCwIJUyIUS7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBvvNrjcHp16DqConP6antI5kfRqtooKbf5cFDYy4sg=;
 b=LVB6qWEUU8zEbGi+NUutsene/aMGb+74SqmP4gTN4Ic8qNeT8Isr6prUluPryBGQ6acTzMUntZc7Ksi6uBiIPLVH/62n235pWE92d3ijYPnmbss4xckvd2nQ1nSf2kWciIPDbGXCSDm5WIBg/cGadDX2j7XVd8MottfH/KpNaUXQecvpUN/Cjwr2j3yrFoXW8arm588XTPi7FCQxdrwe31EBX98Toq+G4pNY6ijfUvAtqCsmCAuvvIEtZBELTj3cQZ8eMsvB1fwXdqSd2UKzux0yLd525lfG2P61tJenGkD4rSBfNHghHAmDMMPZT/C82hxNpuaWWavcX2YYdFK/5g==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by IA1PR10MB7360.namprd10.prod.outlook.com (2603:10b6:208:3d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Mon, 12 Feb
 2024 17:09:14 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 17:09:14 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: own class import fails in nanbeild
Thread-Topic: own class import fails in nanbeild
Thread-Index: AQHaXdY0UQUR5UwFCkaI3o9PRGH5SQ==
Date: Mon, 12 Feb 2024 17:09:14 +0000
Message-ID: <9aaeb9e948caa2285b16f15003bab3cc8f348ade.camel@infinera.com>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|IA1PR10MB7360:EE_
x-ms-office365-filtering-correlation-id: 023f89b4-2d43-4d04-2d38-08dc2bed56b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xEDAHnR9SFxJ2YbvwzX/KrsGFYhgZWSvxnVeZ8yul2O76qJzdMYCeV9vDJr81CJqI3xgS9Z3/yYGMRiDm9jXspwsYMuBbwPkUw29Ba7Vy2TTIdXDCrnqfq8E3lerdDQbSyibgpiIwPNn73KoHJDXtF2GhWcsWWqnsWkiu5L4Qlw6HEskuH30vFLMqm8bNWhb4QGhS3e/+tbq1yGvTIYgm9vqV+9iIdrVNYNL6RHLANo45qvS9HY3+6ogTFt2XjqNP0aAL5mnJ/PIPNM8EEEf9Zcn+UeTEXk8qOFu2vKequDcWHAPLmJBAiI34mf/tzmOtePOyK0Hz/qg1GZVIjnqBJpcJf+6cn6Rge+rXnaKTlaP8NXRqthnebq6VtGcyPj4CpskUkw2qSkUYd0FmfOB4faPMoTT9E0A80M6ix92oSygAQ8SiUjeSkNrOMVYRcy7rP1SmwCj5kEMZkkHE5soc9o/dGEfknhg03cZ9zrMhArYBNA+OSSpOoxcwJuzYqjyvwonvN852zqrSqgFlSgyS32SBRQDAQnwerbWAqtQqp/bF3EhCqswSy/KaMHbZc5CHHQGLHrnQKjYHuLSkOa3fvoRsk8gnuXjKKUcQYrGgtjAZMgb633cB6KQDSh5PGt6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(86362001)(122000001)(38100700002)(41300700001)(4744005)(2906002)(316002)(6512007)(6486002)(478600001)(71200400001)(6506007)(2616005)(38070700009)(36756003)(8676002)(8936002)(5660300002)(6916009)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Mitrc0JEczAvTXVCR1V1dGRaUU1LR1FsWHgwWEEydVE2cDAyRDg4a2h0TWlj?=
 =?utf-8?B?d2x1QWNQRHh5bkkwRTN4RzhJc1VIV3NkMkQxaHQySVc0NThqRHdHS0UzeWZJ?=
 =?utf-8?B?RDJtcldxck9iWERNcGFwWUMydStubHRLc01TM2VpalBwcmJiSXJlMCt6U1p4?=
 =?utf-8?B?bWRzSVZGSWpoSlVEKzlyNFY0anFWK2ZQZHljdGtXYlhOOFJ1RDVHdnVlTkt4?=
 =?utf-8?B?ZEVTV0VMQTM3a2FSSEdQV2hUcUZ0b0JoamdHUytCcTlrRHJTNTIraXBFOCsx?=
 =?utf-8?B?WTRKTEloSm9STytqMmQxR2dkTXJlOTlqeWU1a1F3ZVA5STFhRndLc0RXM1hL?=
 =?utf-8?B?YTgrYWxBYVRuWm9UMnJnSlR6M25GQTFjWEN5MTRtOHRwbXUzQmtpREV4TUN4?=
 =?utf-8?B?dzhpYUVYeXJReFNFM0pLUytOdlN6TkgvWFp6VU5hVmlIQzNXZlNXanNsOGov?=
 =?utf-8?B?R0k2NkpnMUdBWDVoR2V2RldZb0Z4Ym1PWm9tRi9SdUpqZ3BGY2VnVDl0Rm85?=
 =?utf-8?B?TXpURi9wKzZDWFpvODl5ZitYNk9Yb3EySk52dmI1TWVzWTEvZTQvSDVLcTEv?=
 =?utf-8?B?WnR4UE9hdHd1aG5vaXRwZk5Zb1RycW1sR0V0ZXdDVzdEdUt3UGhmZEVPL2s0?=
 =?utf-8?B?YW5kUVNjOEFQQlI3R1NxUS8wY0d4cGc5ZUFCSkJnNHNlNFg4MXhoaE1kMWpp?=
 =?utf-8?B?MEIvMkpBZGFIdkVSaWcwTHpEZEF3Z2l4YlJLU1pUQW5HVzdweXlnQUpPYUtt?=
 =?utf-8?B?S1VGUGM2RnErYW1iS3V5dXJTamZUb0RwNEg3WklLTXBvMC9SVTIzWDJhbEtV?=
 =?utf-8?B?dmd3UnllN3FqYXg2L1dMeEJieTlpUjhnWlY2TlZ0SW5aMnpLTXhhSmhTQ1NC?=
 =?utf-8?B?SUtXVEVwVGdWWVJSQnhIZUxmSWtFbDUranhZNEZhS2JPSXhIcjZybEJiR2Nr?=
 =?utf-8?B?eEFsdTVIS1F4KzFnL3ZzL241ZDdxbzFHOXI0bkhEVGNwMFZ4U0pWa3JiRUN4?=
 =?utf-8?B?NGxCZkh0NEU1VUU1ZDZJVmNzckpsZEdaLzNqYy92VGFYQUdUdUNVd252b0xF?=
 =?utf-8?B?Z0FKS01EYUFoVEM3ZmFzWEdZNVRxYmEvZEQwU01zMnRaK0RxQkovcjYxa2lJ?=
 =?utf-8?B?U3JGdnVWMnY5Ung4aWZMdmIvUWdiUHNNTmlOT0UrYXhLR2pPeUxINGdCVWxt?=
 =?utf-8?B?ZHJIWkg5eEJRUW03RDlHeVZwQzNxL1hMU2kwSUZsbUxzTHlHZmRZQzZyUURT?=
 =?utf-8?B?eVdzM1doSW1HYWU4R2lHMXg3WDJYZUh3Uk1VdnVMQ1F0c0RJNHNRN2k2UElR?=
 =?utf-8?B?ckNxdDNzVmw1aVFIUzVmRm9BTkJOek5QZUI0eFh5ZjF1ZnY5bjJRY1MzeFVz?=
 =?utf-8?B?VEVwcmJTMEtUSGYvL1lJb0w0SVdTRFplYUcwMmNLaWlRem4wbmlDbFcvRWJB?=
 =?utf-8?B?Mko5bjBvVCtSaFVnaERMRmV5WTZDN0RRQ3lPb0JzaWRxOW5IeU1oSngwN2M1?=
 =?utf-8?B?Nk43STVQWnhhOFJ3RVV5ZDRMNXUzQzZHeXoydzVhZWpLRzFDc3FuMWcrNm5F?=
 =?utf-8?B?OWZ5aXNiRnJTOEJCYUs3VGRtSjZWL0JwbFpQcG9jVlZPRkNBV0RHNE9ZRDBy?=
 =?utf-8?B?S21FUHFrcHpjWWFGaFFLdzNyK3RnUFR5TDkxNDR6Nk5icjZWdi82a3FERkJY?=
 =?utf-8?B?WnJIbUNEUE9icVFwUmp1Njl3NTJyeU1LNk1jbkdOclRzNnNuU0tEMlczR2R3?=
 =?utf-8?B?cGhUbkNuQk93dG5PbDhmeCs1SGNLdTA5WEdDNUYvOTQzZUZlR0kxaDUwUDdx?=
 =?utf-8?B?LzJSa3VRRmJhNHdhK1owKzFtdzc0K0VNUHRFRHR6Qkc5bXo3NGNjeFNpdldh?=
 =?utf-8?B?TUJtdjhlSUZ6L2Q2OUR3VGtvZEZ5UDllMU9mbXB5UGdUdldacTduL3ptWThC?=
 =?utf-8?B?WDNvTWlrdVJuT1FvM0d0TkN3MnNoamJBVldOU2ZKdXc1ZDdia2dYRCtKZk5P?=
 =?utf-8?B?WTV0dGVQOW9vemc5MUVwVGJZTnArZWx6bmxkU0JIM0NVRXUxbTNlV205eS9X?=
 =?utf-8?B?em1vNzlKQlV1ZncwbUtGQjB1UEYxMUJxa3NmcG93WnRobEpzSjFCaUFxZVR0?=
 =?utf-8?B?RVVleFZTczk0ZlJlNEhBblVnYVNMZzhWbjNEK2VtWFZ4VUM2cUVaVTM3MW8v?=
 =?utf-8?Q?CExUcxCNXwL5oCGdv/iP5EFrPiAt3/pX5UKZftIJhOm5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7955B23EAA47CF4DAD736B6AF798A77B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023f89b4-2d43-4d04-2d38-08dc2bed56b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 17:09:14.1558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNUuhGSgQu0cBQ9qiLoFHnNc02edadL5rzTwfl/lNQ+NYlWYH7uEgyeE9jctJvfFowfv/hlKS3yZwap9OCtJiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7360
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 17:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195347

VGhpcyB3b3JrcyBpbiBraXJrc3RvbmUgYnV0IG5vdyBpdCBmYWlscywgSSBnb3Q6DQoNCmNhdCBt
ZXRhLXhyL2NsYXNzZXMveHJfbGljLmJiY2xhc3MNCnB5dGhvbiB4cl9saWNfYnVpbGRfcmVwb3J0
KCkgew0KICAgIGZyb20geHJfbGljIGltcG9ydCBtYWluDQogICAgbWFpbi5idWlsZF9yZXBvcnQo
ZCkNCn0NCg0KSU1BR0VfUE9TVFBST0NFU1NfQ09NTUFORCArPSAieHJfbGljX2J1aWxkX3JlcG9y
dDsgIg0KDQphbmQ6IA0KbHMgbWV0YS14ci9saWIveHJfbGljLw0KLi8gICBhZ2dyZWdhdG9yLnB5
CQkgZXh0cmFfbGljZW5zZS5tYW5pZmVzdCAgaHRtbC5weSAgICBtYWluLnB5CSAgICB1dGlsLnB5
DQouLi8gIGV4Y2x1ZGVfeW9jdG9fcGFja2FnZXMudHh0ICAuZ2l0aWdub3JlCQkgbGljZW5zZXMv
ICBzdGF0aWNfaW5mby5weQ0KDQpidWlsZGluZyB0aGUgaW1hZ2UgSSBnZXQgdGhpcyBlcnJvcjoN
CkZpbGU6ICcvaG9tZS9qb2NrZS95b2N0by14ci9tZXRhLXhyL2NsYXNzZXMveHJfbGljLmJiY2xh
c3MnLCBsaW5lbm86IDIsIGZ1bmN0aW9uOiB4cl9saWNfYnVpbGRfcmVwb3J0DQogICAgIDAwMDE6
cHl0aG9uIHhyX2xpY19idWlsZF9yZXBvcnQoKSB7DQogKioqIDAwMDI6ICAgIGZyb20geHJfbGlj
IGltcG9ydCBtYWluDQogICAgIDAwMDM6ICAgIG1haW4uYnVpbGRfcmVwb3J0KGQpDQogICAgIDAw
MDQ6fQ0KICAgICAwMDA1Og0KICAgICAwMDA2OklNQUdFX1BPU1RQUk9DRVNTX0NPTU1BTkQgKz0g
InhyX2xpY19idWlsZF9yZXBvcnQ7ICINCkV4Y2VwdGlvbjogTW9kdWxlTm90Rm91bmRFcnJvcjog
Tm8gbW9kdWxlIG5hbWVkICd4cl9saWMnDQoNCm5vdyBiaXRiYWtlIGNhbm5vdCBmaW5kIHRoZSB4
cl9saWMgcHl0aG9uIG1vZHVsZS4NCkFueSBwb2ludGVycyB3aGF0IEkgbWlzc2VkID8NCg0KICBK
b2FraW0NCg0K

