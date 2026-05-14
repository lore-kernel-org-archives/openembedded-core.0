Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD66CD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 10:58:35 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8094.1778756312130399810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 03:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oEYBIkMj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oEYBIkMj;
 spf=pass (domain: arm.com, ip: 52.101.69.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CJAOLTq5FxfbV+0codrNbM+wE0lf7deqnh3kDQKBk5ApA0yN5fq/txr9/UJkYfmEm+Ah9ZBHUBpwMsDWzPALbelrZ5VXsPYv6Bfi2b5BCCYYeE7ozp1oMnu7UQ6u4oplNZkhuQQYhHt/DDcoDmIWvuIVvoeIzSOzn2FpDBCi/Gyq9Z77MpSs408q/MPndWJbirb+QxMTBo4jOt1CCEZmALiT94YJidUHEqiANx99Z/Xcu6xB8LNm2Lj1O503xeZzohLxIn3tRKe+SXTeKTNREOI2bzyDNtRii5X6HHUOVuetmPB259wF6mQU67inG+EHnjo2+winc1AqH9vBA1om4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSzqOfEtGIlnk38/yl6fEQIkBGwe+QVUoxId0u6uiuM=;
 b=kCIlUxnkPuU7fnlugvdbvxClpFiLRysj42jHtIqimgf4NdNnJL+hDzqnp+KniaNezLZ4/DH3UC193ZjmL4SAb/mp41d57uP9grXtBQ04KQ6JxX7YirlgnGXQqZHaD7BLoB0RR2iXK4Udxcv3QFcchWbdPeU1FsNSWL2yd89zoybvaXA8O8ktAkF5MF5GL5Rh1nTY2xpvTpd7dC7M3B8dSLA8RDayGNtabDF7wY5RkQhzYoHHMeeEcY6eGEYkt7qGpcIP6S10/bz6cYm2p7i9llD90DBQq3vnIzeKDqs/jvw7KFqYcUyTo5fTmfjhD/GdV8vNWuopZ1u/SuAgfuQLZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSzqOfEtGIlnk38/yl6fEQIkBGwe+QVUoxId0u6uiuM=;
 b=oEYBIkMjaPCK7JTHo4LtihJKxsCPH4Cw8B5fuWuFrGnO+jyrRa6CBypv5ke5vsf7omgUPzpcqj2K94degsisnuyB09hkpmyVHmyiwbgkv/FDHYiCVUmzwrw5ttQKZobr70RY9T3i9aiMwkypJq9PsoI3CGmJlLBwRuXdXhYE5Os=
Received: from AS4P192CA0054.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::14)
 by AS2PR08MB8949.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 10:58:25 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::e2) by AS4P192CA0054.outlook.office365.com
 (2603:10a6:20b:658::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 10:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 10:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwO9IR9x9Yk7DrzU8D8mimObmEsM5WgQgnwN/4wvmkJYORUtmxwLpRgyLivnF1X4Ghucs7i5CrBVHyTmW80X9aT+nZVkPZfMStSWz75hSDQWhx5Y0HqjaZdA1zyazRqWYOsw+F11kZ1TjTtnck65nEmqRhP6nULMsOdWI7mBNHJsPwaFwAnJbYrPAWsKHWzyf5EoiEWcLc9L/kc7F0R23X031lLjGpMgQBXzAGYFFqYhGfj7LBouQ82nQq8IFCT+Qq4JQU2rudEf4k/OelG3P+c8nC5LiJfgp5MKAHgen0X7gB5aobZgHV/hSc4ZaopZdasNuzwmDPvQgcMq2SBO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSzqOfEtGIlnk38/yl6fEQIkBGwe+QVUoxId0u6uiuM=;
 b=ZOCWwhIJIZ6XlHtaYqxyFqVrRqRY+w7jOR7pUuonFOfEaBmVQvAVTxBfzw1YBJR9nsqzegKDUM66UCuE0TfDvx+slMXB+nF5YlMr7nuPNpAlEMkssKq/7FWwLzF2W8L9nA2kHYF3Ye7SwMdoLI5rlcTWLni5Q5Stiu6zFXfxnIHE8yitgB066yYddR2lRD1soC+raquQ2j65b9cloXEFWaYo16uwemGJwyVgtukHMa7FtC4LORWkQIlXrUCR1jVEzvDB/Vuu7Jep4gL+3zCXs+wcB5tRCKtaRqBJaitZnzfFjhBHezwcjD9EwAe+G6Ktfv9Po1NaKUFL6XK8aMNVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSzqOfEtGIlnk38/yl6fEQIkBGwe+QVUoxId0u6uiuM=;
 b=oEYBIkMjaPCK7JTHo4LtihJKxsCPH4Cw8B5fuWuFrGnO+jyrRa6CBypv5ke5vsf7omgUPzpcqj2K94degsisnuyB09hkpmyVHmyiwbgkv/FDHYiCVUmzwrw5ttQKZobr70RY9T3i9aiMwkypJq9PsoI3CGmJlLBwRuXdXhYE5Os=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU0PR08MB9417.eurprd08.prod.outlook.com (2603:10a6:10:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 10:57:21 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 10:57:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?Sm/Do28gTWFyY29zIENvc3Rh?= <joaomarcos.costa@bootlin.com>
CC: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] ovmf: simplify PACKAGECONFIG's default
 value
Thread-Topic: [OE-core] [PATCH 1/3] ovmf: simplify PACKAGECONFIG's default
 value
Thread-Index: AQHc4SjMkKz+TSG3AE+SC17/OWqH5rYIz2eAgASPGgA=
Date: Thu, 14 May 2026 10:57:21 +0000
Message-ID: <B94EE239-0488-4DF5-80CD-81B9EC3A630E@arm.com>
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-2-joaomarcos.costa@bootlin.com>
 <16ac5a86-680c-46c6-8079-92a0880f5def@cherry.de>
In-Reply-To: <16ac5a86-680c-46c6-8079-92a0880f5def@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU0PR08MB9417:EE_|AMS0EPF000001AD:EE_|AS2PR08MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: d2181eba-3ad7-41ec-8a39-08deb1a7b8dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|3023799003|11063799003|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 TE2kjKTVtvLoPkFNIhvYoVxsosOhdulAQpy2ICDVORoF5fIQ2UVN1X0KhUTPEnteYDCVREXjg5+k+0wNdsnamA9mrAfeMxGKo0QfQNAvO1RQ4sH93wVww50hN2AcwM1pEBL+3vTh/9yqTl43sMUEaF9r3VzuHfwdtvv03in1HWLExS1EHUMOxOmrHS9GIAPLPFENRd15V3ZEe0oahHgZIALSN01wikyC8PYBfipP75dooAIRtuqku7G1oZj+YC9ZjRE95BEdha5aIl8jlb4NJ+7lglQzE8RlOPneNpwaRuiFhjekooPZhwCnji6ATWpiaFwqtSyqIWlqTLXLrM9R/06L6lnvd7Sk1keHwafAvQeR1GRAP3oX/u+Fsnfq4cvF+0BCDBflh1Ax00C7vgvHUpewPO8FaTed9VgfcDLfm6po8TlPJDEBQ+rTO4OApTa5G5BrfRrA7QRNsfFHznnBCF9KOnmP6TAQ0mjO0/XxaVGnXjvLYcR5hPaBtzq08rhyE2QJNh+hWAVSvJk/+kyqqS5m+vvRhYOo5oxqmVBIBwztsf6fm/KeJDLYiWM7Vdze1Y+kCn27AaKnfcV1axMVBHLWvEWhwFnHfteavNlQqZL4HP3UW0DxYIJd3KXzg0qIMH0r9HZb/MgMKF24JpUyp65rgAKg+1V8s0gAq2XkO3dmP3dFVpILxicCL7Iqir0iBV87rriLobibg/BKsiP0vf6R/iQ8R8YkPkxQspM4C6Yg4wqQplwa4UaoR7YxUUPd
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(3023799003)(11063799003)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00085B4E2486F34C8867ADA28E88F569@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 QbjUzEUNJ/Eeti/7Ow5Xo852vrtadYjfAcIzlo/fq0Xyj3Ks0dbdeg1XKEzyxZWdHe14lcliWWBDy8Z4gk6pAvxs4Lz7zeFGLllXWq65aPNGPoHNalq0IbnUO4p1gXyY/bgVXBp/sj5Aqj9HQfsRpl/DsQX0Nw0vW3ilKyqDkgrFs74w36En+Rb0rX7JCSfTuvePkIRRwG0+yQJDP3hNpq+7kMxAzTGzzUPtHhVdND51yPrifcFYGmmlnO/sWMI6yBYdu45Vvu4ZMzs/v3falZMyhjHxixx1l+5znRzzbOvswmv9jpdH+l5KsMHHTkYrFTidyZeF7iX4WOL/5qr2Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9417
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7bb7367f-8cfd-4d0b-4193-08deb1a792ae
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|14060799003|82310400026|35042699022|376014|56012099003|11063799003|4143699003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	UyRWgf7uaJ3D/UmsN8k5qXabSmFAsQhFnj5bLWx1HnFiJw+OZcaGIrI3ZriN0Kza1L22nPObItj4FQmFNvGpR4GN6K7gEemy4LZ07hE2d0xzUBVG93cuRKblgUiAYqhROT2HtMMqvmeieIwY/gvzWkcMcdPH1sCF43F+TFTfSKON0JcjLY8lOwTErqorDswUsLrp5n//0NN0VVt8bUp+z+7d0mMldhkty6W9W3TUrfLXwNh2BBGh56sY8hNGdqzs+7fiDXSrG7beNsq8yPZV8+FKAeL0LGV6iEUiiyb5y4syVLVH1qhsECkbplYDb+fr4ZXJ7nGEzKWCe5MIx00pnCc+ZrFyYgH0z+s8p5pmofajZEgHq4EhfZ4k+AVb8woeSsW32EH0hZh0jkgF55pAMZBVI5rO/dR+/QxcJAe9n1uRAGzE8Vee+W5QG6xYRRQtuPh6JXVWUqtMB95sT0Bs28hEzG81rp8xdEXMEMf4bHUpaIgV3ageswBJOJV3WnUXbZXoDwe6d0QhqDULPWPxaQ7TNAM49z17hhQm5z4qb8HnTQdBEf48DjCUEwG2B3R6Az/pymbqPqDlUk0T64s1LQeDVw5B9LBh1zMqaA2EeCOXCKnzWywkEG1tsJm8Ev1To4JrkJAWG6iRAJo5fQb4DSD0KrYZJFqDGq4rFmWOIT5G5QD6y4MjzFuJwIV6cgNgqUvR3ruRZhWMg5BD4YEgfzDZbiFXvqUMKIIaX9dlf/A=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(82310400026)(35042699022)(376014)(56012099003)(11063799003)(4143699003)(3023799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1KnIOXmw1dHxQKMdCS9LYVM6dH3cgd3OLhBy9tEUrgqzP7GTCBcBT17bjpDNlsydJguJuOp//UDNQysOc1LOSuRLavl8A5NS0QLj5PFnkDF89fOmMYI97uoo0wGh+U9Tfnnhey+2KrCTJRS2Iq1yWKLxi0/0a/cxw6MhRQ6QRrk52x6LUtkF49eb3VRIl8bdW/7fTnZaqWRssRFmlPoVu1vcSPhKyPGIZysaKqgfMiBgNZTNEOzzWAYexCNaOE1zZppa985TJHmgYXXJjmXDG5/r8tEbHHUODF1cJfy4GcCh61mcjCkBzhUVhq5KkE4ht4rqU8vA5F60OMd5KsnmMmBmViM9KL/jbR9mafNMwHFzLVouBPjml7YLxcMyODwmt3bym4jz9pPq/I8c8xjZnFKnMq3rvDIytVBpXGENmrbiPjj2cSiv3YHEHHlFHAy8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 10:58:25.1391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2181eba-3ad7-41ec-8a39-08deb1a7b8dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 10:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237024

T24gMTEgTWF5IDIwMjYsIGF0IDE0OjE5LCBRdWVudGluIFNjaHVseiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cXVlbnRpbi5zY2h1bHo9Y2hlcnJ5LmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4+IC1QQUNLQUdFQ09ORklHID8/PSAiIg0KPj4gLVBBQ0tBR0VDT05G
SUcgKz0gIiR7QGJiLnV0aWxzLmZpbHRlcignTUFDSElORV9GRUFUVVJFUycsICd0cG0nLCBkKX0i
DQo+PiAtUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ01BQ0hJTkVfRkVB
VFVSRVMnLCAndHBtMicsICd0cG0nLCAnJywgZCl9Ig0KPj4gK1BBQ0tBR0VDT05GSUcgPz0gIiR7
QGJiLnV0aWxzLmNvbnRhaW5zX2FueSgnTUFDSElORV9GRUFUVVJFUycsICd0cG0gdHBtMicsICd0
cG0nLCAnJywgZCl9Ig0KPiANCj4gSnVzdCBhIGhlYWRzIHVwIHRoYXQgdGhpcyBpcyAqbm90KiBl
cXVpdmFsZW50Lg0KPiANCj4gVGhlIHVzZSBvZiA/Pz0gbWVhbnQgdGhhdCBhbnkgPz0gKGFuZCA/
Pz0pIHBhcnNlZCBhbnl3aGVyZSBiZWZvcmUgdGhhdCBsaW5lIGlzIG1lYW50IHRoYXQgaXQgd291
bGQgc2V0IHRoZSBkZWZhdWx0IHZhbHVlcywgYW5kIHRoZW4gd2Ugd291bGQgYXBwZW5kIHRvIHRo
b3NlIGRlZmF1bHQgdmFsdWVzIHRwbS4NCj4gDQo+IE5vdyBieSBtZXJnaW5nIHRob3NlIGludG8g
YSBzaW5nbGUgPz0sIGEgcHJldmlvdXMgPz0gd2lsbCBvdmVycmlkZSB0aGlzIG5ldyA/PSBvcGVy
YXRvciwgbWVhbmluZyB0cG0gd29uJ3QgbWFrZSAgaXQgdG8gdGhlIFBBQ0tBR0VDT05GSUcgZXZl
biBpZiB0aGUgTUFDSElORV9GRUFUVVJFUyBpcyBzZXQgdG8gdHBtL3RwbTIuIEFsc28sIGFuIGVh
cmxpZXIgPz89IHdvbid0IGRvIGFueXRoaW5nIGFueW1vcmUuDQo+IA0KPiBXaGV0aGVyIHRoYXQn
cyBhbiBhY3R1YWwgaXNzdWUsIEkgZG9uJ3Qga25vdywgYnV0IHlvdSBtYXkgYnJlYWsgdXNlcnMu
DQo+IA0KPiBNZXJnaW5nIHRoZSB0d28gKz0gaW50byBhIHNpbmdsZSBvbmUgd291bGQgdHJ1bHkg
YmUgZXF1aXZhbGVudC4NCg0KVGhlIG9sZCB2YWx1ZSBfd2FzXyB2ZXJ5IHVuLWlkaW9tYXRpYyBi
dXQgdGhlIHJlcGxhY2VtZW50IGlzIHRvby4NCg0KSG93ZXZlcjoNCg0KUEFDS0FHRUNPTkZJRyA/
Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zX2FueSgnTUFDSElORV9GRUFUVVJFUycsICd0cG0gdHBt
MicsICd0cG0nLCAnJywgZCl94oCdDQoNCklzIGlkaW9tYXRpYyBhbmQgd2hpbHN0IGEgY2hhbmdl
IG9mIGJlaGF2aW91ciwgaXQgaGFzIHRoZSBleHBlY3RlZCBiZWhhdmlvdXIuICBDYW4geW91IHVz
ZSA/Pz0gYW5kIGNsYXJpZnkgdGhhdCB3aGlsc3QgdGhpcyBjaGFuZ2VzIHRoZSBiZWhhdmlvdXIg
aW4gZWRnZSBjYXNlcywgd2hhdCB3ZSBwcmVmZXIgaXMgY29uc2lzdGVuY3kgYmV0d2VlbiByZWNp
cGVzLg0KDQpSb3Nz

