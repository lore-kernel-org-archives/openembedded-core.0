Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9944CCA1007
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:02:21 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.29])
 by mx.groups.io with SMTP id smtpd.web10.57447.1756746135597142391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 10:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=U9ZeBev/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=U9ZeBev/;
 spf=pass (domain: arm.com, ip: 52.101.69.29, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fuF43mjs6DiiKU+QiG97J9mVa84eFhHJUj0Mb7ABKiWL/1wzlQtPzkAW7oC+/DmurY7IeSwhp4p8keBsYK/7q4OaMMInafNHuNHf3yfZWIGP8xTy31OKL05kPH0FlCk+FtzSuD+Zrk6HqOkDxBeUP/rXNceuPJhU4zDZV/tRrR0z8a7LF8hoF2cvgfhQWGW9TDkbU4GQIr0O31a+TyQZvVqxS8urs5/ZcfTAqaJMoQ5m0DobNqnLr9MFMF9cn6pw1vy5XjMAyjbpIUX8I/MKnZku/MiDud9SlONozsEHabKqEJutX2RUuZgdef3zDeHzBJ5ZnvFWlRmrRqlplUu/0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEW0yfm9MS9PfVeT0Rfj8vMybb7NBu34ug+9dkdZpJc=;
 b=rRnf80UWgnS9BJaIhSaZ+TCrmVfhoheNr5mStx6i8XVMbLLd6OsjxW/qkbJqIfnCxaYqzZIzIDm8/eib6PU43BI6yWFm7O/ZnQiery61NcSTbF2joMLdXj78N6HGFa+o6mIyG0PgEwxyv8OgsMDvx8qZ8iFxcgXekRqsNDtTDOMwXH4imEPZtIbqJgWL+X4YonZJBImT80IlMnzc1JCVcwWLtaEcUVRBVsWFQ5XylJuKwO3ZhKDs+4lqsG2hXvSTmtO+ZVsr2z0WTx64A9MMh6EdhN+DjDsmovZvRO2awB+6NpdXN0fNr1oTSsOYHuor0GfRikz5b3VUzxGcmXnGCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEW0yfm9MS9PfVeT0Rfj8vMybb7NBu34ug+9dkdZpJc=;
 b=U9ZeBev/j8w06jyHJoccWqx9o/X9Ac9sPS7KoxZt2R3URwuMGhuMvCty654oujnqGFew5SW4qB3B4Wf/lMLx70Pvx7eizBKdB6eVRl9g1m86FH3FB5bEGmMSzsie5k9CLolj7dQHohhcrlKR8W2stFH3h+qkRNNnE3zbkJkdUnE=
Received: from AM4PR0302CA0017.eurprd03.prod.outlook.com (2603:10a6:205:2::30)
 by AS8PR08MB9867.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:02:07 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::41) by AM4PR0302CA0017.outlook.office365.com
 (2603:10a6:205:2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 17:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Mon, 1 Sep 2025 17:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caP/Ve00IZLn+/EkbSPcefF0PFEQVm75bpHMmwUztg5r0U/XshuJHgsRdeNihIVygvNCIjenVBRZE7ppkXJDwHkNr7JTlL7Ju2Dj0KIaQa8Q06VTp40PIZyiNitdufWolCMBSMFZdkxj4igFw2kdvfzRpFWFLETDWQ8T+eSXZaHHxBlPNvPPMVkR+DMZWNINwQjVeQPRB9XFiSYXy4HKa06mvb9fdP9pYUyS9dDGDhLl+MzU5PfvD79frrgPAb+P+XUzOLhkSG9qgZ1KHeVNW7hzvyW5mlmfOr5y4pi/K9XEzKdc1NLLMGuBnCnEhNV0PYnfCes1ynbhkaUgKpqYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEW0yfm9MS9PfVeT0Rfj8vMybb7NBu34ug+9dkdZpJc=;
 b=CqOAEOlaTjdJqSXyTefrrMbXwOk4ys3XZKzmMoZI7u4QQbrW4GGJGZbtsjopnLg366N14X4CU5HklmLCjCE3wCul8cQIuffm6Ue7CIra7JcOb1n2dzsQ8ZqkZzwUqLINIIDAeJI/5jhew0207QLvhwmDhI9a91OHZN29vG8fi0As3WmBnPa7k+OhEqpDvakmn/dVZTA630qT1yq2WPL71iObi1VJUksiKh1MzxD7rE87hPWqMOH/xqEulH7KnH/lasuPGNgSVM/xYWtUcZHIOCdiy0VLfhKkriZ/ovdAWo+U+Fke6KznSvUG0NOzEQpY9unQQaZAdtBjJSWSUJ7V5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEW0yfm9MS9PfVeT0Rfj8vMybb7NBu34ug+9dkdZpJc=;
 b=U9ZeBev/j8w06jyHJoccWqx9o/X9Ac9sPS7KoxZt2R3URwuMGhuMvCty654oujnqGFew5SW4qB3B4Wf/lMLx70Pvx7eizBKdB6eVRl9g1m86FH3FB5bEGmMSzsie5k9CLolj7dQHohhcrlKR8W2stFH3h+qkRNNnE3zbkJkdUnE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB7930.eurprd08.prod.outlook.com (2603:10a6:150:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 1 Sep
 2025 17:01:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 17:01:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "frederikbraendstrup@gmail.com" <frederikbraendstrup@gmail.com>
CC: "poky@lists.yoctoproject.org" <poky@lists.yoctoproject.org>, Patches and
 discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH] fix: use pkgconf instead of pkg-config
Thread-Topic: [poky] [PATCH] fix: use pkgconf instead of pkg-config
Thread-Index: AQHcGNrTOPH52wJdbUy8ZjUJc2rug7R+kl+A
Date: Mon, 1 Sep 2025 17:01:31 +0000
Message-ID: <3E66023C-C680-49BB-AE29-38D4623AA29D@arm.com>
References: <20250829114713.1577609-2-frederikbraendstrup@gmail.com>
In-Reply-To: <20250829114713.1577609-2-frederikbraendstrup@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB7930:EE_|AM3PEPF0000A798:EE_|AS8PR08MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: e9249832-20c1-4ac2-ace1-08dde9794784
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N3B4clNCT09XcTFsQXl4NGlNbFcyemJyaEl5aXg1YWpsRUl1TGZsYjdHMTBS?=
 =?utf-8?B?RGM0VnBtem1wbVBaWmxrSTVJQk40OHRlNnhGRG1CK0tHcVMrTmlvY1J3Z2FW?=
 =?utf-8?B?YzB1S0hhd0Yzblpqa2hBNzl6eFl3YVNWRzNkWWJNVXNqaGU4c0c0cFoxUzBD?=
 =?utf-8?B?L1dIWWR2SWkyR3ZBT0R5Qm0wdUo5Y2lNU29tdWVFQWpFamJybmNvR3NSbmlt?=
 =?utf-8?B?QkxZVXdTbU1YM3g1OTFINUtuTmNpa2E0aFdBRFQ0Vk0rMGJYSEs4U09sS0pr?=
 =?utf-8?B?N29jcHhuWFlIZW0yU3hjM3BVb28xd0tkZUszUGdqaDdoeS84UHpWYVREaEdT?=
 =?utf-8?B?SnVSanhYcmhydGpPVTJ0cURrNnNZV0tZZVU5dUVidVZ5VHRONnVOK0ZKait0?=
 =?utf-8?B?blZBZTZ6UG1nMllwZUpSVUtWV0MwL2hhZDZXNGd2N1RTOThKcEI3NjJib3ZM?=
 =?utf-8?B?WXB0a1UxRnh3d0g4c21ZTlorQzVDem1od1pzYjZCTThJdkxlT3Q5ZnZ0QkFT?=
 =?utf-8?B?dmNnd1pST2d2SE9lYW4rdGl6WnpKM3p0TkhSR2p3c1BVK0Jkc25uNmFYbWxC?=
 =?utf-8?B?Z1FiMUdEeGtyWU1sUE5iODM4aE1KalR2MHhlczRSOHJqeHVXSERpZmRtZlRa?=
 =?utf-8?B?aFpTTGJaSkN0Szk3dlY2SUpaSGVVYjlBdkhZeWJ3QkhEOW5YOFFOUXM0WkRr?=
 =?utf-8?B?dFZaSUV4Nm95QnNkME1BcUdmUTBPaytkY2czNVRwL2ZQYnRqM25neXhkdTkx?=
 =?utf-8?B?QitxYWptWUMzU2NjWFh3M3ZQZXZSWU1DbjF1eExMcWQzYTByMm1MeWhpdjB6?=
 =?utf-8?B?OFVxUGpyM20vcEp1Y243TWhlYVJZSDF0T1ZYK3FJVWxtUDRnc1l6WUo0Ukxx?=
 =?utf-8?B?UlNPNC82K2JLWGYxSkQzVkpNREpUcUV1aGFtYkJOZWFtV0Q3Q2c4OHBDOGNX?=
 =?utf-8?B?aDY0T3F2Wi8yY0REOXlBcE8weVQxbDBORUpCZkdJY2l3MDV3VDBqaHZBREw2?=
 =?utf-8?B?TEVLekluZ1dyS2hvTjRHOVBVaHB4ekRIQnZvekozZjhNQUtzc3dPQkQzeTVC?=
 =?utf-8?B?RHVHQjI0S3pRYUsvRFBORkRDNUlnLzk1UmtFbm5rOGlBWjB1dHZTdzBxOE5u?=
 =?utf-8?B?UzdHVkFnWC9ZQllUek55THRUaHF4V0MrbHlMUnh3T0V6SWxGSjdkMWtaQkZu?=
 =?utf-8?B?YitxWDBBOFhrTUF6WmpMMVhsc25ET2xKNG5BNEpyZXY3MVU3UzJtRkpPeHlO?=
 =?utf-8?B?VGd4ZjZQNWc4bWxCR1pnNEtqRGdVTFlNQlpjMU0zdERDRE9ZN2JicTl4YXRB?=
 =?utf-8?B?Mm41TzE4b2VMeUZzbEhiSU5MWXo5MlAzWk5HeCtaWU9TSzI0Zmk3NGV0VDBX?=
 =?utf-8?B?dm5QVWJBc1cxd0Q4cFJvQnBmMWxUclRxc1I1RzBrYzJYVlljK0dyYjNROFps?=
 =?utf-8?B?cExPb05PZkh2L0FWTzlJYmFyK3FVRWtYNHhkQndKZ2hZRmpwblFRSVU4QjMr?=
 =?utf-8?B?N2J4RVhJTVpCbFpYaWR5YVZ5N1pwMGVuN2NTN010UGdKbHNCazJOSTFUQ1VZ?=
 =?utf-8?B?Uy8wNU1XSlkvTU9uWUwvVlUrWUdFRmxsRURXQ3Z5b1FNemlsdWJnblVkbld1?=
 =?utf-8?B?ek80MjZUdUhlSFJjMXpXYlo3Y0JweWkxQXorVVRmODRlN3RjZmFrek5vUnlY?=
 =?utf-8?B?OWsrMm1VWi9yNm9zbkM1U01Ma1hjeGFpRFdJbEYvT0tlUWRjclpIbWhYbGtl?=
 =?utf-8?B?dmRkL1VkbHN4dm9XcjB1ZGsxdnhkRDNsNVhpSmQzZ1VzTVd5TXhLdVliTHh0?=
 =?utf-8?B?RXhnK2VjeWpRdm5CcXh0cGd1UCsrczA4Rlo0RDhWN05zc3dBTDFQcHcwL0dr?=
 =?utf-8?B?eE1WN3lpOGpBeWpJUkNWdGxNYkp2UkwrVmxQYWgyTXJQcHRaZXI3VDdQTjFq?=
 =?utf-8?B?MU9jaXFMOVQwdVJwSFp5UDNFRVlQMlYxcUR3T0Y3TUxwZlBDRGhRSW4vWjdC?=
 =?utf-8?B?RG1mTElrTEZ3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <23F953216E6EDA41AA2C670EFB226DFB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7930
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f8ef8e05-6722-4d5d-f4c9-08dde9793377
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|35042699022|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1hNMUtZbWN6R0JlVUlmWDVOS285T29MNlhaYWdEOHRGdG9laGI0ZG5LQ0sv?=
 =?utf-8?B?bVpFM1JYaHR5WFFxL1dlcXRlb2JjamhvbXNrMHFCclk2RnM5NHdROEN1NnI5?=
 =?utf-8?B?WVY0N3RzY3VYMnpLMHlhRG04bFZQdHJtcTlFR1FKL2hxMWFsR3ZXbENLUy9O?=
 =?utf-8?B?ZE9CZ29JS3BPNFdWRXUyR2xncHA5OWJ0dHZScnNvWi9WSDJRWlQ0ZlB0bnFv?=
 =?utf-8?B?Q0ROa0lpZ3RXZTJYNmZLeHZjeUMxdlFTRFM5MmFabUQvNjMySkFhQlJMN1lo?=
 =?utf-8?B?Q3dGNE1uVE9oMnNiVUlpT3J2VldqOGNWd05sOS9NdE9ZbEwwMGR1dG9zM29L?=
 =?utf-8?B?eEp3WVk1SmxvUm11VUxWYW5sZk9YMnZWRm1iYUVQSDlVZ2p4M0huUHNyWnp2?=
 =?utf-8?B?N1JmbUZpQkF0bk9ObjJGaGM5Y21nelFRWUI1ZktHcTdqcDEyNEpMV3BpOWdk?=
 =?utf-8?B?MnBmbyt0S0c5UnRrdllUdUVRamdROWVrdmtLL0lZbFdXUTRZa2FxblU2dWNQ?=
 =?utf-8?B?c1JoamdQSENDUlhlQnF4VXRHcW91R1ZkWjlGcElEN3ZSN2ZxNFBrOThGMTEz?=
 =?utf-8?B?THBPRHd4TDNsdlk2ekxsN25rYXUxbGg4bjdxQ0VNZzdGMHFtVktBT3R3eFY3?=
 =?utf-8?B?RDVpTXd1WXg1MWhMQnNaamdxdXhaY1RoTW41ZERHdkcxWEd2R1hrY0s1eHBv?=
 =?utf-8?B?WlI5NTY3WmozUGlRZFQ5dFB3YUdNVWxMUTBhM2puUVI3dXFaY2V3VG44d3ZP?=
 =?utf-8?B?MEFQcHVvcHZ1ckZ1c3RJNHh2Rzd5dEtrM1YvSzJHU3RRaEJDSnFEK2JuVWhJ?=
 =?utf-8?B?UzU5MVJEWE02cGI1WVJDSVB3VHB5dVhQdWY0SkczMVc3SlZQTkdWZnhiZHIw?=
 =?utf-8?B?L1A4d0xNK2pUYllOSnNFRWswYVFqYnpsTzNMRlpTNno5WTdZcDl5Y1p2OTBV?=
 =?utf-8?B?d1VhUHNvWHo3RTdSMThISjhac216cnZ2OWNqbXllc0NYanlFNmdVVVp1Wldn?=
 =?utf-8?B?NVlYaGZxeGxaL3JaMnRYeFBwZUY0SHRWblVTU0t6eHI4cDlnL3dlMXp1a0J2?=
 =?utf-8?B?SFRJb2t5MWxKK25zRkp4bFJmamhPQzA3eVRESytHZW1YUU5ZTm1EL2Y0UGFC?=
 =?utf-8?B?cWRvZ3hpZDE5eHlFYVJjNjVCWjVhTGRGSURaaVh2NmdiYlozMGZMUnRZZUxZ?=
 =?utf-8?B?ZE96Zmg2c1dHRWRieGdUR3RZclNZOGQvUDVqY0ZCcW5JeExMMzQ4VlFCUU8y?=
 =?utf-8?B?R09CSkV3aTl2U3AvN05hQTIwWUV6MW4rSm5lNkNhVVIwVXVlN2t2dkV3cCs1?=
 =?utf-8?B?cTBjWFFHZnAyNGZjeE1XcTFUV2tvSS94NWUyeXpVWU01MjlEQXl5aHZFUHAz?=
 =?utf-8?B?Q3I1QzJvditkUkYrcHNpaUtsaXZwdExFN2wvYWhvQWlDTG0vcDhuY2RaaENi?=
 =?utf-8?B?enN1bVl2NWptNlJHM1ZyL1ppV2xWaEJ0NnA2WEJ6ckZpOWZaUU5wSEVQYzVJ?=
 =?utf-8?B?bEVNSEpXYld2aE4zYUlXaHpKdCsrdkdnQytZQTcyb1A2ekYyVStKbmRSV2dv?=
 =?utf-8?B?NzRaSVZNNFhVdEsrWUk3RHpkRFNWMi9RUHM5emFvZkFwV2YrbitrNW5KQXNJ?=
 =?utf-8?B?cG9MV09FT2pwcjVCSjBVa2FmTnZ6cUJuS05tUDlHUXZHMDVMQ255b1hRWjQ0?=
 =?utf-8?B?ZVNORCs1R2YrUFJLWkxPRXVIZGFaakQ2bnNxWkRzRldMQlhPb2JEdHVEVUw4?=
 =?utf-8?B?b2x5alIxL1M5ckZ5MW51Rm1OZ0t2T01VUlhsYW9zdm9MNEZuQ1M2dUUyNzhi?=
 =?utf-8?B?d3hER0haeHhHRy9rTzd2ZkFNUmRyZS9QY0tQUVptYzZlSFA1NkZodW1uRkU2?=
 =?utf-8?B?NVJLTGNlREhvSi8wNEFCNVRBWG42dHhST0s0cEVhRmxoeGN6ekNUa3RKb1hQ?=
 =?utf-8?B?R3d1aXE5TkxyTzlpeFBzYVZGb2dtVVQ3UCsvaXNXbUI3OXpuSnIyMFpnZVJ0?=
 =?utf-8?B?MVBJcGtaT1ByN2daZStHNnp3eGhxd20rdUxTNFRCc2M0OUVaNWRsc1RSTlNE?=
 =?utf-8?Q?7XPn9Q?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(35042699022)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 17:02:05.5718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9249832-20c1-4ac2-ace1-08dde9794784
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9867
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222669

T24gMjkgQXVnIDIwMjUsIGF0IDEyOjQ3LCBGcmVkZXJpayBCcsOmbmRzdHJ1cCB2aWEgbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZyA8ZnJlZGVyaWticmFlbmRzdHJ1cD1nbWFpbC5jb21AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+IA0KPiBBcyBhIHByZWZhY2UsIEkga25vdyB0aGlzIGlz
IHByb2JhYmx5IGEgYml0IG9mIGFuIGFnZ3Jlc3NpdmUgbW92ZS4gQnV0DQo+IHBrZy1jb25maWcg
ZG9lc24ndCBidWlsZCBvbiBuZXdlciBHQ0MgYW5kIENsYW5nIGNvbXBpbGVycyBkdWUgdG8gYSBs
b3QNCj4gb2YgaGFyZGVuaW5nLiBUaGUgb2xkIEsmUiBzdHlsZSBDIGNvZGUgaXMgZGVwcmVjYXRl
ZCBhbmQgY2Fubm90IGNvbXBpbGUNCj4gaW4gdGhlIGdjYyBkZWZhdWx0IG1vZGUuDQo+IA0KPiBw
a2djb25mIGlzIGEgbW9kZXJuIGFuZCBjb21wYXRpYmxlIChhbHRob3VnaCBub3QgbmVjZXNzYXJp
bHkgYnVnDQo+IGNvbXBhdGlibGUpIGFsdGVybmF0aXZlIHRoYXQgaXMgbWFpbnRhaW5lZCwgYW5k
IGhhcyBtb3JlIGZlYXR1cmVzDQo+IHRoYXQgYXJlIG5vdCBhdmFpbGFibGUgaW4gdGhlIG9sZCBw
a2ctY29uZmlnLiBJJ3ZlIGJlZW4gdXNpbmcgdGhpcyBwYXRjaA0KPiBmb3IgYSB3aGlsZSBub3cs
IGFuZCBpdCBoYXMgd29ya2VkIGZsYXdsZXNzbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmVk
ZSBCcmFlbmRzdHJ1cCA8ZnJlZGVyaWticmFlbmRzdHJ1cEBnbWFpbC5jb20+DQoNCkZpcnN0LCBJ
4oCZbSAxMDAlIG9uIGJvYXJkIHdpdGggdGhpcy4gIEJ1dCB0aGUgbGFzdCB0aW1lIEkgZGlkIGEg
dGVzdCBidWlsZCB3aXRoIHBrZy1jb25maWcgdnMgcGtnY29uZiB0aGVyZSB3ZXJlIHNvbWUgZGlm
ZmVyZW5jZXMgaW4gdGhlIG91dHB1dC4NCg0KSGF2ZSB5b3UgZG9uZSBhIHdvcmxkIGJ1aWxkIHdp
dGggYW5kIHdpdGhvdXQgdGhpcyBjaGFuZ2UsIGFuZCB2ZXJpZmllZCB0aGF0IHRoZSBvdXRwdXQg
aXMgaWRlbnRpY2FsPw0KDQpBbHNvLCB0aGlzIHNob3VsZCBnbyB0byBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxtYWlsdG86b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gc28gY2FuIHlvdSBmb2xsb3ctdXAgb24gdGhlcmU/DQoNClRoYW5r
cywNClJvc3MNCg0K

