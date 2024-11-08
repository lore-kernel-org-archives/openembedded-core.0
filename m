Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97930D5AE5E
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 11:59:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web11.11215.1731067162851084004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 03:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QxTPsTMz;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QxTPsTMz;
 spf=pass (domain: arm.com, ip: 40.107.22.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=J1mwJJwqczk1b/Z9KY8eWhBjeRKlxhzCA7+wKy+Dld+x3CplYFen/2q6PA2Q9IihrDrc/lcQxPPWnk+kDWCom7Bd64VdJOg/QozLrBw7yZkCHya789Fs/s6+iM+xvwSOaAj6eErmEqBo4CErQZhyYh8yBv6LxOsMbrVdy2U8TMY5AIlo9yArmxksp3gvTI0kz4yfhrBKepNOI0WpzS2wbglS+PVIRsm8HJUDn2kyRzY5YIhpOaRIaiKeXHba5Z3TJu/mrRjvngIoybkxOPGs57l4cr/7nD1gMLu3taOqtz9zQGUa3a18UtfUwtOHVGo4Vw0kZ1KTKfKVIheWCJwE+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WEIlZZ4PuXr27xw+Yrpwlc1rkw+HRidQ4Rsv1EZSYQ=;
 b=UtltR1sm0odzgUZnb2E6jErzbJfvOV8MjlIily9dfMAnK2BINkkkNvTX9aQpP8GFUNW51Mbs24UY8HF8eoE3BBTD0uCZzWBPXavZbqBE/qfxHXK/ZTbFZzOxUDfikMIiR2CsBQCOw3PKvIiMz3dtfwh/sH+4lV+msEphC4RXYdyk0B6zQQWHaNsw0cuxpmzue2UKVhyrVDk9vfB+foQv+k4s46Xp7+96AjYNMaUcV2FE6j/tj655dMrbAFvtt/uoSJ5q1KKEM+yF7jHVti9SZvGzAmfVJambXlc+eaxecFKnMNpjgZAX3lrYsz58dD9q8ENxd0YDnKI4tLGBC3mNZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WEIlZZ4PuXr27xw+Yrpwlc1rkw+HRidQ4Rsv1EZSYQ=;
 b=QxTPsTMzx4YkaO0SDRghVYdjQ39q/YXKUjjMig5DWkrGncWm2kbl8Sg6IILUCqU1/weVgTbP2X0D61WbohwoXi7U2gOFTNaaFKjDTw7/1Nf2nlH7TJEpZ2lUu0ikxMSydq+cj9ark9D2W6PTyKg7cLmGfiJNK6u1fbb0GBNnPIw=
Received: from AS8PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:310::10)
 by GV2PR08MB9398.eurprd08.prod.outlook.com (2603:10a6:150:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Fri, 8 Nov
 2024 11:58:44 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:310:cafe::83) by AS8PR04CA0005.outlook.office365.com
 (2603:10a6:20b:310::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 11:58:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Fri, 8 Nov 2024 11:58:42 +0000
Received: ("Tessian outbound 59ce3b063f98:v490"); Fri, 08 Nov 2024 11:58:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5415468d62c1c870
X-TessianGatewayMetadata: DYZzQ9csX7CeV5gcfKuXWr45M7/ruzwZdTzelh51KU4m4nBbhJteCat//KEm9OF2CXzwTpuTvSopyZ+YF3J6vWo0X+QfbCRaK1ZvzjrTtH+bRBcWm0e+u+To2hM08mQaKGt70cY+4ESetnmJBn4x12au071BY1MSxy+PfbiKY+o=
X-CR-MTA-TID: 64aa7808
Received: from L20f946dc8ab1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0ED9E281-59C4-42F1-9332-107E59792EC2.1;
	Fri, 08 Nov 2024 11:58:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L20f946dc8ab1.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 08 Nov 2024 11:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq/M7muIt1M+pY37ygYUqfAhABiIdpqODKtGRAJeD1DX91nA7ilUeR7OTTclcqNfq6xFShPP92xg8st3Wkle6GZ8ue4BDRiDIK9cuStIsCFYPYG6tU/69f+2fBJsaSLK8ZI5kwjBaXocTvMHBvdUPaxOn68k+0E4x9gfFwF3Vz4hLdkG3i06yAg5Bvb61BADhPtnnLRIM03MlXaE9Mraw6etRMEthvrbpwqbJb0VsFz/QK6ustykMvCrY3TEd4htsTKPbw14qPh+3+v7t+SFsnpDtqlWqR9y9t0IKRaBHqULk13XP0++az8zpU3mcOs8DvBlJGDXod6kIDnqcnyeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WEIlZZ4PuXr27xw+Yrpwlc1rkw+HRidQ4Rsv1EZSYQ=;
 b=ge+0z5st9c0Nlhz+p2EPo9LqiOxBfHI0gv8P1maR8LhAKQpXKc2B8JIqd14k8aYnoFJhtONj9aebH7pkcS+PxaQhsp1AbZyZ0Dvmh2HIkb5/SnRWeCLMoCtS4XGahyy0MqpFLYKqKJC8ZpIFrGWN/MJlgunjdol3n5poyn0ifGNMwv4N5C9dEdGfRyyHOfrRtyfu3ooOjTq8q/EZINCDQQj/GFKp9KuANhuOuOt0AnmxEhdTRaCqqcQpuL7hh1LGpACJfn4I+ztUkMeh8twDPCAJSN+eY2v260+qL055+n55zq7meTfGMHyiNZxfZP2OguUJa9+JeXrNC+T9zJR0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WEIlZZ4PuXr27xw+Yrpwlc1rkw+HRidQ4Rsv1EZSYQ=;
 b=QxTPsTMzx4YkaO0SDRghVYdjQ39q/YXKUjjMig5DWkrGncWm2kbl8Sg6IILUCqU1/weVgTbP2X0D61WbohwoXi7U2gOFTNaaFKjDTw7/1Nf2nlH7TJEpZ2lUu0ikxMSydq+cj9ark9D2W6PTyKg7cLmGfiJNK6u1fbb0GBNnPIw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8480.eurprd08.prod.outlook.com (2603:10a6:20b:55e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 11:58:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 11:58:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/8] python3-setuptools: add more comments to
 a patch
Thread-Topic: [OE-core] [PATCH v2 1/8] python3-setuptools: add more comments
 to a patch
Thread-Index: AQHbMTnjy6OVWiF2mkeMWqhZlrv3JrKtLCeAgAAcaoA=
Date: Fri, 8 Nov 2024 11:58:33 +0000
Message-ID: <3A0A428D-40B1-4E36-AEC3-CE2EB4007A43@arm.com>
References: <20241107172404.4017047-1-ross.burton@arm.com>
 <Zy3lCZixZnhcyawo@bootlin-mathieu>
In-Reply-To: <Zy3lCZixZnhcyawo@bootlin-mathieu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8480:EE_|AM3PEPF0000A792:EE_|GV2PR08MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eea873f-0ac5-4f82-9cc8-08dcffecb101
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WStGMy92OC9FNXZqQXVMWWhPS1pITVcrM2w0OU1SK3JUeXR5ODFsMjBOZW5n?=
 =?utf-8?B?K242c3RGUVdyaHhTRkFKeWhhcDk1c3RtZ1dQTEdDaGxqRU5mZGRtNUhCWHY0?=
 =?utf-8?B?Wjd6azJ2RmMxMndwZGxYTjVoY2hQdHFiUVhydlFOWjUvRjRjSm0rTmVNU2Vj?=
 =?utf-8?B?QkJEVkY1cEZyQWZzaHlOOHI2aDFDc01kbGhBbmpIaXNWakFCLzc1bk1rQ1kw?=
 =?utf-8?B?YUJHM1lRd2NEVHkzK2FTSnBncDFrZGI2N0NGbkhSMUVReENwdnVMNXhocjdz?=
 =?utf-8?B?WlgwYnlLTndLZ1NyRjlCSG02SzQwYUlNOTF6ODBTNWp5TjA5aGs5RkVXRUNl?=
 =?utf-8?B?eVZUbVVDYUJucUp1bHF3SHZncHNZYncrS0xHZmtNMkphQXZCK3RQbXdORENU?=
 =?utf-8?B?emRwM2FBMHBJQml3VjFCKzRIbEhyL2o0UG5QSmFyNDUxYUk0L3lkSEg1TXA1?=
 =?utf-8?B?eStwOWowVXFSUnd6VnlPa09TTTdpcWpwMkJHSVZNbXlwdlhEZEE1ditROFJ2?=
 =?utf-8?B?TURvblBLQmtEeEVOTDRMeExnTHA0b3NYUnpHTHpHV0lCanl3eUcvcitQNDl0?=
 =?utf-8?B?VkIyWjlsczMrWGRDaHVpOEswQU5NSFF3NjJNZGdMVEFiQmhMUzVtK042bFlD?=
 =?utf-8?B?VExnb0h5NlFDeWRzcm5DbjZZelQrNUc1NDV2aCtYUHJoSDBEVFFyRWdXM3px?=
 =?utf-8?B?QzFsWWdFSnp0MFVQdjg5RXQ5aTRKWU16SDRuZm1zcTJBL0NWTllLUXVwOWpo?=
 =?utf-8?B?L25kbE5yN2RsVGJHZHUrWDhGb2prS1g0UkNPYjB3c05aRFRabW1UOHc1R1V3?=
 =?utf-8?B?a0VUM0VFM3F2QS9MeVE0aURBcUFZSytqR29waHhxMlIzbWg5UWNId3Jkck1j?=
 =?utf-8?B?Mk5GeEpYdkwvWUd2SGlPUXRQbThNZWJRRTdBRnFBVWYrNXJuVS83ZTZvSXBJ?=
 =?utf-8?B?S2pUdGVrUnhTRWJOOWRxZTVFY0tYcU11SDVLYVl0K0tVcThNM2c2WUVhNkdN?=
 =?utf-8?B?RXMyZGJLWG9IaTFwb2tPdUxJVFY1SzJib0ZRTTVoODZ1SUJIQjRvUnQ5aFFG?=
 =?utf-8?B?dG5BazFaS3B6RU10anZGNTRVbFhBbnBCQnVHeWhwK04yWjk2S3BKTm40TWhy?=
 =?utf-8?B?SFc5cm00N0FMa0hNV2xXMjVaNFBsSjFRRDBNZFVpSGhaRE5XYnBPOUtqMGNO?=
 =?utf-8?B?MXhNZjVJeHczRjdaaXNkNklOVnhyWUNHVlFpQ1lQODdUNFR5RDd6RzgvL09D?=
 =?utf-8?B?d0VrQmFBUUxxV1BTUTB3WFF3VjlzZjhlQ1BvbHBhUzlBWHhaVjhyeGJKVUJN?=
 =?utf-8?B?aWl0d1RBYTlZcGQ4NVdnOHM0c3ozWjZqVHhtaTkxM1Z2cUljTS9QVmN5N2Rs?=
 =?utf-8?B?aXJOa1lEa1QyTVJ4Y2FUWUM3QnJWYkp1dlNHVkp2SHFlME14TVZ3RkwrS3B0?=
 =?utf-8?B?NEZyRTYxOWhOdkp4T093ZlYvaUNMUHVqWlZCeTFsZWFTL2o4bHNHRmxuOEJi?=
 =?utf-8?B?d2g2SG1hVjhLblR3WWhZTFA5aGdsRXdMbXdQYlU5ejJFSW9BeWNONEZZbDhh?=
 =?utf-8?B?OWhxUnUzRTkxaFVxWmdtenB2NXRpRnp5LzFKaTJ2VnA2VGo3NXU0dkhHM1l4?=
 =?utf-8?B?aHV4MVpYRXJndnpNY01wOVJFZDZXZ1h2clpKeENmOG82VkpCaTdMMmtQNTJC?=
 =?utf-8?B?SENjc3J5VThnc1l6NU8vVDRVNVQ3NWp0ZU9ZOXNWRUNlSm5BajNWOVY5L2RG?=
 =?utf-8?Q?rlK4YvghjvQ1A1NYT0P5632nX5Ic9CIkkKbGFsU?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A723921C97C4243A85CF559B1CAF305@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8480
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de86eba1-7a0b-4536-62cd-08dcffecabb7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eU5xYWtxekZoNG5JcGwzcXNaeGVNWG5ZM3lTUDdnZE5Yd2RlNTdFUVNEL2FJ?=
 =?utf-8?B?Wk8zQ1h3MVovK21qelRVTTBUSWs4cURoSXlQUUFmTXZkaU85WWZnTitza2Vl?=
 =?utf-8?B?aVpRUE5LL2VQOVlIbnZJMmJ4VnIxQS9GZDVRTGE1MkNRV25MM0FBWXpKWjNt?=
 =?utf-8?B?UEQ1Qk5BYmFueUo2Y2xXSHU0RlRRNU8zM1J4THoyaWZydklJRUxTMFBxYTVV?=
 =?utf-8?B?SldmeW9odjU0L25EUkk5NDF6b2JsOTkyOERabmlUa2M0TVM3NFBjRUV4a0lz?=
 =?utf-8?B?cFVhdGNOS09sL3cydlRzS0lGZlUzSGFtdlZYV1JaS01zTGdPQitPYUxhR3Vt?=
 =?utf-8?B?ckZZTmhidHlsbmllbmhaU2c2amlHSXdJZ3hsbHhZbTlUK3d4clBqR214YnJU?=
 =?utf-8?B?WDZHV2JaNHpQeWkxN1RiWFRHWmhHRzF4R29XWk5LOFFaS0crY0xqMkY2eUZ0?=
 =?utf-8?B?ZW9aUWhORllkZEI1NzdlMmdoenFiQm5tOUlLaEdFZnlHd0M5WU8rMXdlekhr?=
 =?utf-8?B?MlpOUW9sUk00SDZjUzBjemZxb2ptZlIvaHVNQkdvaHczZTNnbUV1LzN6WHRm?=
 =?utf-8?B?cjVIenVvMlV0U0RaOXNJb2t6YW5jTmJmYTJnUkF6WS8ycHgxREZ5WFRidDJ5?=
 =?utf-8?B?cVRjZHZKamV0dDZEYzlsenhYZ1E5T1hnVmlhTXFZTU1CNXgveFZtWnRiaGZU?=
 =?utf-8?B?NmNqSGlSQWxjdi9xNDFxY3o5b1JpK1RUc2kyT0k0S3NZUzlvUFRaRk4zenpR?=
 =?utf-8?B?aXN1ckRvR2xpZ21aWWUxbk5jcFdLZU9zNXNSM3dTUTdmOUk5ZnV4ZUYrS1hF?=
 =?utf-8?B?dFVMWjgyRVdCRlpRdDRoZWRNYmorQlU0cWdCRVpIb0lqOTFpV0Y5Wkc0eFJx?=
 =?utf-8?B?bkNvbUN0ZTI3TWQ0M0x2NVZ2WFUvdUFtZE5ML2p4Q0JkYU1jK1lUSCtFQVAr?=
 =?utf-8?B?a3BVeDlsczVGYWhDRUNrRG1OWnhETldjZFpWY1JyMFVRZzJuNWwwVURSdW1J?=
 =?utf-8?B?LzI5UkhrVSsrVVBkNEMweStLTDBXVVJUK3JMS1RqdXppazV0TFBGaWsxd1Rv?=
 =?utf-8?B?Zk10ZU94RjdwSGIyVjhpWkx1bS9SS2s3SGZuMW96ckJsMzdGL3Q3OW5PMTVz?=
 =?utf-8?B?NXFRa1kxU0VOd0pjc0RPMkZlRVlNTiswN21seHFRbmI2NlhFMWR3S2lQTjFu?=
 =?utf-8?B?MjRZSFBBbHZ0UmRPcHMwaW9pOXpiWTNpTXdvSFB5bldmR3dkU0U4Z2Y0ckpl?=
 =?utf-8?B?OWhGSjJOemp5UWRVZ0pjenRwc04zenY3Q3VCZUp2Qm1nS1BmdUtrWmNXWkVo?=
 =?utf-8?B?cHk3RzVEMnd4blplR0xkRVhKd0h0dzh3VlpSMTh3cGpBZFRpbHVuSkVNZ0lm?=
 =?utf-8?B?bFZyY00wTjRWZ2dqMTZBc0FqVnNCOExyTU4vU2JVKy9nU3ZJYUM0QmNCLzMw?=
 =?utf-8?B?ZUo1QVZlN2o4eHNTbkcvUGZaT0p0YS9KdDVJMHduRTFhU1djTHBmQmNxTDRE?=
 =?utf-8?B?KzE3aDRVU1dpSnBzY0d1bXhHL1krblVDZ3VjZEdTbGs4SzREMEY4OEZDd0RU?=
 =?utf-8?B?dFdOUnBrQWprbU5xZVUzTFFmUG5tYzRCY1dGdUEvUlh0dGVkbEJwSlZRUWtO?=
 =?utf-8?B?QlUxK2FaSVpQWTJndmRzQnVqUmkzZjlYWU5jeE5EM1EvVVRPeUJjWUthbVYy?=
 =?utf-8?B?THNOWnZKMUI4MGJqemViV0w5aTRTZVI1TlFqcG42MGpsNjRUUFFwSU5VNUdY?=
 =?utf-8?B?Y0hzWjA3dTBOSTJheHc0TWYxeURGVURGU1ZaeVl0MmZEVFFmYkZBb1F0WWJD?=
 =?utf-8?Q?sXhGrvCCg8T0gtiRZqgSR2UZUSos0/+HFNjgE=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 11:58:42.6336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eea873f-0ac5-4f82-9cc8-08dcffecb101
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9398
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 11:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206868

T24gOCBOb3YgMjAyNCwgYXQgMTA6MTYsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5k
dWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgTm92IDA3LCAy
MDI0IGF0IDA1OjIzOjU3UE0gKzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KPj4gQWRkIG1vcmUg
ZXhwbGFuYXRvcnkgY29tbWVudHMsIGluY2x1ZGluZyB3aGVuIHdlIGNhbiBkcm9wIHRoZSBwYXRj
aC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5j
b20+DQo+IA0KPiBIaSBSb3NzLA0KPiANCj4gVGhhbmtzIGZvciB0aGUgdjIsIGJ1dCBJIHN1c3Bl
Y3QgaXQgaXMgc3RpbGwgcmVzcG9uc2libGUgZm9yIHNvbWUNCj4gZmFpbHVyZXMgb24gdGhlIGF1
dG9idWlsZGVyLg0KDQpJIGp1c3QgcHVsbGVkIG91dCB0aGUgcGFyYWxsZWwvb3V0LW9mLXRyZWUg
Y2hhbmdlcyBhbmQgc2VudCB2MyB3aXRoIGp1c3QgdGhlIGN5dGhvbiBjaGFuZ2VzLCB3aGljaCBh
cmUgdGhlIGltcG9ydGFudCBvbmVzLg0KDQpJ4oCZbGwgZ2xhcmUgYXQgc2V0dXB0b29scyBoYXJk
ZXIsIGxhdGVyLg0KDQpTb3JyeSBhYm91dCB0aGlzLiAgSSBqdXN0IHZlcmlmaWVkIHRoYXQgcWVt
dXg4Ni13b3JsZCBidWlsdCBwaWdsaXQgZmluZSBmb3IgbWUgd2l0aCB0aGlzIGJyYW5jaDogaHR0
cHM6Ly92YWxreXJpZS55b2N0b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMvNTkvYnVpbGRzLzQwMSBh
bmQgSSBob3BlIHRoZSByZXByb2R1Y2liaWxpdHkgdGhpbmcgaXMgZHVlIHRvIG9yZGVyaW5nIGNo
YW5nZXMgdGhhbmtzIHRvIHRoZSBwYXJhbGxlbGlzbS4NCg0KUm9zcw==

