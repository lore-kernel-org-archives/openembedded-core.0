Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C46E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:15:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web10.21461.1736349302199418444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SazYIaTp;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWC5WhgKXHrFu3WS2f14aPfX6aT30Yth2YsiAHJunDJ90USXIYIZfG7y1zaZvhB9pq297YIazg0i9zmesu5U6pnZsoJpNic4LJCEvqST8TTdjadMiZt+aSE+uKHSGUV+HaimuLleoSDSSXCqCqyTGIV30RMiE5Y6H8t7X9TVnjoXPCt6VEZ+zyxwd6Yhungl/Gx/g8l3kan/N1ifRcGGALWRecCRw9NigCr6lMUAR5JjTSe49i6149Uqeuqod4CmteNm2wdQrwiTCmr5zHzAQZs+2nJ5zqJ8yxjm2N4p/ukhHYKiG42tVtHsuPvAiqZM8XzdKB4IAvd/SrOhLcGqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONpEKbtac1Y0LbWqhgE1UhHRfk345dj0/rcUCZAtEeo=;
 b=ptR5uXwEWi49nrPXyk42Aho2wzt2lgS29v9OjCKddidYKDcRphMzV4Py6RSaR2iZL9RP2e15MKOj+b+kTwKiZzS/+lpo2OnWz5lJu6+M24bZLFhWPTS4QwV1k2ffzWbozPaLBBIYiuVfwxwHfdXXbZGSX3Gp3rS3IYwpt7FpH/ZtJweKSqOoq17QXqJC+iRTxjkY5fva2PHtxmNcirN0gq9qjxEiSsuNW+oRN7lgL9n+BfPJUtrNL6nhJrtbJuehwk24LXHLBqqywOZ4da+WxHqB6Q0jWNK54hDrZ4qHV3+gjl/pneDi5Vd3tnaaYTfsySNqTM0PKAHbCG0iDd+1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONpEKbtac1Y0LbWqhgE1UhHRfk345dj0/rcUCZAtEeo=;
 b=SazYIaTpQFtFUqX9ZakJjd2J47TjbbPPbElCI4oYCl2H2A89p9f4aldT77jvymkO7QXH8LG9Z5s9JWHoz/xkiGHsF4FkxdcS3Dw2r/1kwZrEcj4n1tkkKnOO+YF1l1yYwDv3Meu+JUuoB8WfryYXKloKsze6IKxzYH4W092qH14=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9283.eurprd08.prod.outlook.com (2603:10a6:102:304::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 15:14:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 15:14:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "egyszeregy@freemail.hu" <egyszeregy@freemail.hu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: Add WATCHDOG_RUNTIME_SEC optional
 variable
Thread-Topic: [OE-core] [PATCH] systemd: Add WATCHDOG_RUNTIME_SEC optional
 variable
Thread-Index: AQHbUgegZ0DxGJ0OrU+WaBAFjOepurMNHAyA
Date: Wed, 8 Jan 2025 15:14:58 +0000
Message-ID: <D8CBBDEE-07AF-4D18-8BE7-AEA4EC86D06A@arm.com>
References: <20241219111615.601-1-egyszeregy@freemail.hu>
In-Reply-To: <20241219111615.601-1-egyszeregy@freemail.hu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|PAVPR08MB9283:EE_
x-ms-office365-filtering-correlation-id: e80db534-5592-441b-16d4-08dd2ff73724
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TzhGUEY2VG4wYSt6Yk1rbVdDN1h0TUdOaHU4Z3BKV0JQYkhpdTdkcWlVc0ZZ?=
 =?utf-8?B?SWQ5Sno5WnZiMXB5alRUL05kV09sKyt0SGs2ekRsbDdJOThFUFRTZ0k0b1pY?=
 =?utf-8?B?anl0RUtDS1FteDIrZDZqMmE3bDN3SlZhVHdLSjg0UjlhVlU4bS9WL1RVYkl0?=
 =?utf-8?B?cm9BWVRGMXVFb0doVE9pZ0F4R213bUFXUWt4UUV5L3V2VG1DOURGaEM4OWNZ?=
 =?utf-8?B?b0VZWTNlRVpZTDJ6ajJQSnFBRlVLZGJ1TTdpRzBzaEZiNDdZclhqNUZpS1hs?=
 =?utf-8?B?bGhKMlFhdjR5cTQxWTRDalUyUWVZRlR0ZmIvMkkrTVhnUk5mbU9abUoyU3Q0?=
 =?utf-8?B?M0xyczQwMDhCdUpTNG16cWNYeEN2NFZjY2NIaks5ZVo1TzRQUkNGcmxSak5D?=
 =?utf-8?B?TEtLeUNPRlVPSTBYZDBQV2YwZVg4VytRUEdnZkRZaUZONldMTkFvRFY5ME1q?=
 =?utf-8?B?VW9oZzE5bEdiZ2hiVC9XdnpJNkxkZEdRYXp3aVhRR01OTkJuMitGeE9aOFJU?=
 =?utf-8?B?S0lub2N1Q1lxczc5aHFXckZ3OGlKTXdxTkV6ODhKR29EMlJ0eFlpWmVXemxC?=
 =?utf-8?B?YzZSZGIxT0Q2NHVZTXJTaUdJY3VadG0yU3Y0V2VZN25ud1FnZ2JNc3dJVFc5?=
 =?utf-8?B?eCtmdmlrZURyblBLQWI1aTlhb0tiWFNiMnF4MTdjcG1pZ3NKK0dFSGJoZzZu?=
 =?utf-8?B?QVpHWnZjbGNmcWt4QUFoN3o0eWN3V1VNSXhGQ1hPUmJueWh3akFncTROR0hj?=
 =?utf-8?B?YnA4NjVxZU9uQytwUzh0WjkyTE1MbHJISlFUSk4vY3QwcENyZ21qNmRKWWI1?=
 =?utf-8?B?R0h6T1hyNUhvSVpzeXBUSkZxSG5EMWNZZ3FPVWdqMm15UGlUMTlVVlpsZnEr?=
 =?utf-8?B?ZnEyYmRWZEZYbWUvRjRFdFk0WkRmR2lBdjArVFovK1ltNGxOWm9SaXkzK2p3?=
 =?utf-8?B?SkQrckgwb2JVRHNPalBMUzVnNGt5dFlQU1pBaHBBVXB1ejRGYTBXSDNqbE5n?=
 =?utf-8?B?UDFkcmJoaU1PMndNYy9xT0FVTThXRkxKbHRGc2k4dDBJV2VDRFJzNkQzSjhs?=
 =?utf-8?B?MEgvNWhSQmpxTDFnbVhyQU11Vlc1aFVkQ0RucFBFODY1TlVZVk56RG1ubWQz?=
 =?utf-8?B?QlBpdkpWNnAyR2RhSGxzalM3ZTJYeHNvWU90OTl5V0lSTmZjWElENFF1VzJ5?=
 =?utf-8?B?Z2dPVklKdmZ0Nm1iSUlGM1FHVVo3aUV4d1JoVjRoZElBQlZmcmZ2Z3I5RDFn?=
 =?utf-8?B?U3JGYW0xNlhvU2o4NTVHNXl4czRrTTBrcG9pb1krQmxxWXhzV25yVHhGQlhq?=
 =?utf-8?B?S2NMRlRpMDRvQ2NYL085MWV4RCs5a1kzS0xMb0Jka0pDUC85SVQ1cGZmR2pT?=
 =?utf-8?B?MU5lNmxxd0ljODdSOHVKYWh1eW1pbDFFelFHWCt3VGtNTmRhTkpETjZCVzNX?=
 =?utf-8?B?aU5TUURrY1BlZG9mRG9NTHpzU0lxc0lLUGdkVWMwYzV6dU11NlJLZ3F3K0Nh?=
 =?utf-8?B?ZlM0M1JxRUtDbDZCUUJnSHFMdG5WTFo5c2l3anZUZGZMRTFKcklXVk9ocTFI?=
 =?utf-8?B?SGU5MlJrKy82NmQ2ZWdyb3huOXh2SE1SdWlDL29VUUpDYVYwdXdYV2I2dXRR?=
 =?utf-8?B?d2QxdWNmcVJ4T0w2aXJrSHNNMWJCN3N5UVpRZ0JneFdVcHhDRGRiNXgyY1h6?=
 =?utf-8?B?OEJZWXNuc3U0VC9KMG5na21xaG41b3NpQXVEL0tGSTNYdW5ubUFPSUJuc3A5?=
 =?utf-8?B?cVpjdmwwMEFSUitjMHAyRjdkTzhlcGd1bzNFMzVpbGptSUppOXhUaTBEYjMw?=
 =?utf-8?B?dzAwOFpCa2lSb1dTd0RSRE5hQ1hTMzRIRXNLNFZvYVN5T3pPbDhMSzVxSWxL?=
 =?utf-8?B?cC9udzIvREY2V2N6QndJOERjbGNObTRibGVRckxCWUlyN2ROUFJvQnpNSGhi?=
 =?utf-8?Q?ld0gUMGfJiiNcUTdYp3k3EY2b59CNXg9?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWRlSFROWjM3YldxMFQ5dC8vb1pJdldqSUhoaXdGb2JNWEdUUUNpelYvdGNu?=
 =?utf-8?B?VDBVY0t3TTVPc2U5QThMV1M2bHplVUU1eS9CK011dlpsdHRpMUp6YjRVekli?=
 =?utf-8?B?azRBSGNpZmJtMnhhY1Y1ZDdhZncycVJITEN6RFVGcEpTb2pvQ1RDNUZyVGtP?=
 =?utf-8?B?ZytsczQyc3VFT1pGYm1JUFN5WkFxakNmSS9jU0pWd0xjVXdsMEs4NS9ZdTha?=
 =?utf-8?B?RStvSjF0bFJHVVAzbkh6MUF6ZTZyaVQvVktxQ2kyY1pMRHN3UjhiVW56UDNE?=
 =?utf-8?B?cUZpMk8yRURRVDZneDB2b3YyYUw3V21XR0VBZ3czOWhQRWwvc2dDb0Y4ZDJF?=
 =?utf-8?B?SFFFYjB0Z20zNnUrT0ZtT3lubzZoSHl5T1UybWp2WVRqb3J3K2lNaytUZzZQ?=
 =?utf-8?B?WUxJclA4SEJwR0JxTjZIWWFMWU9xT3czR1J3TVdKczczdllNM3ZzTjd3Ymxk?=
 =?utf-8?B?T2VGNXNEQ25SbkR6SjNaYW42UzlYTmQxeW94bGZ5dFNycEMxV1ZEeGxYcTU0?=
 =?utf-8?B?ZnhuS1RFVVZUQ0JnMmlhVkpsRkJVWkRmQS9KVHhpWllFbUFtOGhWL0dUQmRa?=
 =?utf-8?B?MHhtMjRzdFhSTVRkOUtzdUxqejc0KzEzV3pMS1k0N1dGd2ExaGRmdVkzcC9L?=
 =?utf-8?B?aUhsbkttL1pEYlRpT0Z3d3RBS2JtSE5lMUZjSm90d241cmV5NXNtNmI0R1Er?=
 =?utf-8?B?TE1EOEI5SXVQN0tyOG0xWlR4T3h2QzdIRFJ6OS9lekFtY2g5WkR0N3BEYjA2?=
 =?utf-8?B?TWFWUDBwNGJ1Z0g4YVU2eFhjSFhvemlKbHRXM1FyUTluMkZDMlVsUm1qRUZp?=
 =?utf-8?B?K2hZNGNKSTVYK2c1bWlkNXFRN0FkNm1pOGl6NWlaLzNUT0RtOWZpMzNCaGlk?=
 =?utf-8?B?dlEwOVJUQU45NEVHR0RCQU4rSnFvbDVydm9yb01wclMveHg5eXRyTXBjeDZL?=
 =?utf-8?B?Tm1vaHNHWTI0ZVE2d2ZwdEJONGdRZitIbEZpN0FHQTZ0SUZ6Mk5waEUwLytI?=
 =?utf-8?B?aE82RnZhck1uNjdVQXZKRE1pVmhhRGxXWEZqREpLRWtPRVA2dnVPZWdPamFx?=
 =?utf-8?B?MHF3N0xHcEdpekw3MjYvOThRc2ZrUE81byt0YkQzaEZoWjhsWEhobndWdktD?=
 =?utf-8?B?eE5xVytWK0ZBaUxBS1JPS1cvdzJsNUlDY2JqYVdVa2VObWwzbEpqcUM5Y2do?=
 =?utf-8?B?elpLaWNsQk12ZWMwR0RRWWZaMUQ2cG0xNGt4ZEJVck5sVGVQa2d0N3M5WGZi?=
 =?utf-8?B?d2dEQUduRjdhSW9RYXNFNUVDR21yOEJVNW9wTWVhbmVDMDhGZU1Sb090SWZt?=
 =?utf-8?B?SU5CSE1UVkJDSkhoaWVWd1ZveGlCTTdobGhBVmdMN3UzY3RQOGI3enNjSXdX?=
 =?utf-8?B?aTlCOERaSjBFUHhnNW1tS2l6bmFJL1NjblgzSnRBQU0wSWdvVlM5bExib1Qr?=
 =?utf-8?B?eEtkRWFKeUkxNE1JL0Q4YjB1c1ZUV2ZySDkvZjFnSCtldE9BUFZ4UjFsVk9F?=
 =?utf-8?B?Y2trNDhOV2RqcjArQUpZaWRlNGEyUTBPVjIzUmM3V0JydkdiWTkxSm15ckxT?=
 =?utf-8?B?MGEvMDdjUGNHK25OVlIxTGxicFY1Ry9rRGVSYURYUUNSaWdXenl6eGFUWHp3?=
 =?utf-8?B?UjkxWHVkSEZrOWlvZlROT0pQU2FyYStmek5Fc3VHOUhXZmc3NklDbUZWd3dO?=
 =?utf-8?B?eFZDWWlkSURuVDhiR1phZVJVY0ZUYlJqWFYydkxKeVVXSHo1SVdvMWZKUng1?=
 =?utf-8?B?dWc2QkdWRXh1L3R4OVV4b3RNMThHY2MvaGd3VVNsdndKYTkvN1VHbFNpZUNo?=
 =?utf-8?B?Nlc4NUdrelNWVTZKbGNzRm5NY3F1K3Z4dGxMZDQ4SjAwZ2RvOFVIVGc1TCs1?=
 =?utf-8?B?RnJBeVlqalJBWFhnZGtmODJRSXRwTkliRnBHOGJjYkt2ZE1EdHd4eWQ0T1Br?=
 =?utf-8?B?SXh5YUNzNjcrWWxnZDhCMk56UzVhMmFHK2xkalp2bDdsczBZTGpnNE0wN3Zq?=
 =?utf-8?B?M2VUTm5nUHIzWWpkMk0zZzhGc1VJNG5uODErL0ZZQzEyeGEwRHJmYnV6RUs0?=
 =?utf-8?B?bXoyUnl2UDU4SDhQcmJzako0aHdTanZ2QkVZZmJBeHU1ckFTTkFUa1FPd0hP?=
 =?utf-8?Q?NpTx8IQffto5WpNeAQumBJjQY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4488F7854B96974CA32E5F271682A0DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80db534-5592-441b-16d4-08dd2ff73724
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 15:14:58.4688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4vi1iWtLW3WbsrUqQBxdQCSxTDchvY+DxdRi3QS5OjxjI4zjtYZQTRF7cUlItMC9Ai10Mkfc5xGvxIvZefwZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9283
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209564

T24gMTkgRGVjIDIwMjQsIGF0IDExOjE2LCBMaXZpdXMgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGVneXN6ZXJlZ3k9ZnJlZW1haWwuaHVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+ICsjIFRvIG1ha2UgdXNlIG9mIHRoZSBoYXJkd2FyZSB3YXRjaGRvZyBpdCBpcyBzdWZmaWNp
ZW50IHRvIHNldCBXQVRDSERPR19SVU5USU1FX1NFQw0KPiArIyAoUnVudGltZVdhdGNoZG9nU2Vj
PSBvcHRpb24gaW4gL2V0Yy9zeXN0ZW1kL3N5c3RlbS5jb25mKSB0byBhIHZhbHVlIGxpa2UgMjBz
DQo+ICsjIGFuZCB0aGUgd2F0Y2hkb2cgaXMgZW5hYmxlZC4gKGRlZmF1bHRzIGlzIG5vIGhhcmR3
YXJlIHdhdGNoZG9nIHVzZSkNCj4gK1dBVENIRE9HX1JVTlRJTUVfU0VDID8/PSAiIg0KPiArDQoN
Cj4gKyBpZiBbIC1uICIke1dBVENIRE9HX1JVTlRJTUVfU0VDfSIgXTsgdGhlbg0KPiArIHNlZCAt
aSAtZSAncy8jUnVudGltZVdhdGNoZG9nU2VjPW9mZi9SdW50aW1lV2F0Y2hkb2dTZWM9JHtXQVRD
SERPR19SVU5USU1FX1NFQ30vJyBcDQo+ICsgJHtEfS8ke3N5c2NvbmZkaXJ9L3N5c3RlbWQvc3lz
dGVtLmNvbmYNCj4gKyBmaQ0KDQpXZeKAmXJlIHNsb3dseSBhZGRpbmcgbW9yZSB2YXJpYWJsZXMg
Zm9yIHN5c3RlbS5jb25mLCB3aGljaCBpcyBleHBsaWN0bHkgZGVzaWduZWQgdG8gYmUgZXh0ZW5k
ZWQgd2l0aCBjb25maWd1cmF0aW9uIHNuaXBwZXRzLiAgVGhlIGxvZ2ljYWwgY29uY2x1c2lvbiBv
ZiB0aGlzIGlzIHRoYXQgZXZlcnkgb3B0aW9uIGluIHN5c3RlbS5jb25mIGhhcyBhIHZhcmlhYmxl
IGluIHRoZSByZWNpcGUgdG8gc2V0IGl0Lg0KDQpBIG1vcmUgc2NhbGFibGUgYXBwcm9hY2ggd291
bGQgYmUgdG8ganVzdCB1c2UgY29uZmlndXJhdGlvbiBzbmlwcGV0cywgaWUgeW91IHdyaXRlIHlv
dXIgd2F0Y2hkb2cgYXNzaWdubWVudHMgdG8gL2V0Yy9zeXN0ZW1kL3N5c3RlbS5jb25mLmQvd2F0
Y2hkb2cuY29uZi4gVGhpcyBkb2VzbuKAmXQgaW52b2x2ZSB0b3VjaGluZyB0aGUgc3lzdGVtZCBy
ZWNpcGUgYW5kIHdpbGwgb3ZlcnJpZGUgdGhlIGRlZmF1bHRzLg0KDQpXaGF0IGRvIHlvdSB0aGlu
ayBhYm91dCB0aGlzIGFwcHJvYWNoPw0KDQpSb3Nz

