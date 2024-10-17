Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D03DD374A1
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 14:23:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web11.50424.1729175009417190730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 07:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dZ81Jz3Y;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dZ81Jz3Y;
 spf=pass (domain: arm.com, ip: 40.107.21.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dOTOBJyBWT58Rw6md9BubcHEUu4VvmMC+V+zOfjijXORadXiw1UDBQF1tvxLL+WIbuR496isZg/+FT1gUkAJk79+r+zCwmem0l5n9kNAUUwcq4ZyCEMXQNJ0gLCUy+81fXB6Qe3lvf1DWnws3hDxmeK9cP5YNCpiVnDHbfUPSTdz9kkt210+gHP9F5Xz02A0EM18VJA8trMD6nrmCl6Fk6WY2S55aLCBDZJfdWfLKJEYoaflD6mcXCFI7L3gsYXGd/hglrJ5jIdvzbW0CqscudwWXSuFrh069QlIZZfzbIBIRkXfIB85tw1kf3ZsTP6Ewm3HfiepBky5HhJmJ03kbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVGOx5BY2m1IkoMvB4/BjuhSjvah/UGM+hmP7jqcOi0=;
 b=hjE2diuCUNWae0C2D5PuSOtwWmSGV8DVC3BRnPTBk1d9NOPQVufp3nU+cUUPqYCEYb125OsLjEDHD7gEluGAiFkM4F72O285sky2fRWpSPyun05tabHQI3Glk66sEMdqJqXUPMO2m9pqZVNbY3u2LloSusHZzkZY7gPeeSu/eNV15UXG6CRII0AX/jKwOmRPtk1Olqi9ULVzcYQ0EPyB1nymqt4qgzWA+MWXUT//+XVGEy1pl0kR7u3Q/diQEdM09NanY+Ce3XaGkZgkbAZKt4D3iBHUdRnt9HsjzTklHIZ3Ft4N0Bcz8oBPGZKLmiPvV9UlDRoGPgQ5YieSEgMOsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVGOx5BY2m1IkoMvB4/BjuhSjvah/UGM+hmP7jqcOi0=;
 b=dZ81Jz3YjzCFyHhJt5aLYZ/qWDIf2ddz6EYm9+1XRowSA5c/75xcyHH6qQvKwrbryTp5ouvAeg1TSvRT+JVNj7Gc70uEg2dwxlMdsWjaCU3yR6cuoPaOYbX9POoz571CcniHnBNo0VT5MkqXbquso02Gn+o2tKEEfx1YF7Fb+so=
Received: from DU2P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::6) by
 AS2PR08MB9667.eurprd08.prod.outlook.com (2603:10a6:20b:605::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 14:23:23 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::d2) by DU2P251CA0011.outlook.office365.com
 (2603:10a6:10:230::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Thu, 17 Oct 2024 14:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17 via
 Frontend Transport; Thu, 17 Oct 2024 14:23:22 +0000
Received: ("Tessian outbound 5c9bb61b4476:v473"); Thu, 17 Oct 2024 14:23:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 698f07e6c9bee776
X-TessianGatewayMetadata: Sv2qNEizXxYtYwfsUaVESXxc1Qx8cKicYIDt91YbvFnMl5OjAWb+7hXt66PWKNXrxf7th2e+HXpR0o/pB40J80eqeg/xm71SpepKU9SjB9KfVHuVrCcDCyelU+fZvltkwWym/TA/fF8Rl3ut1U/H38WUXV5mFTAU5u5N2Ax77mg=
X-CR-MTA-TID: 64aa7808
Received: from L6647f32b2730.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 92858216-851A-45F0-922F-D6925A1D4E24.1;
	Thu, 17 Oct 2024 14:23:10 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L6647f32b2730.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Oct 2024 14:23:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgyDzVL/yLLFgV3PcAYhAl0m43rIWLLZuRT1gAz+Hg/9dmhEb6obFqOLrssqbNwJnzCt+caZqBGUN4Z0ib3mP4ZuisbuOFZ3hJYo2gVYHb963Ob3xoSG/7o/h6KtBajBIvnVwXFD3SonNEvCYApvjlBkAg5uUJmwDqFSIxiRQCN736Wx7y0rClCiaVVYycurCrKNm+iIeTFL00530FpgTBvmPg+me+BtqruNXHoTMFS7n9iM9dDQuVPC14RjI+BhLTE6s38ys1TRQpOgRvItm3a8cymyecLzzhNVTojydyQwhg0uxJp3pjy1eiNXw2Ug5ybRwxhua+RV9D7VoNbLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVGOx5BY2m1IkoMvB4/BjuhSjvah/UGM+hmP7jqcOi0=;
 b=zRdXaVapboLoBAn3dljRcAm3iw9rYjsBzzIVcbDLUsrBpmwgYeuRxFlzdJLWY4baWoebofz47HB5X6eSmT/IwiiMEcsXPX7evn99XrjaK7u+KpBi2b3u4VrFr6TcIErYKuv0vx4sYb1lSalo79Pqq5VZY8LO8K98EMpJdwzaMHI0EYGkopvCQxZm3VgTcnJeJW9Zlr89/bPNCSN+2niamfH0fiKMdy7l3tSWMrTDMjruQqYXqcEF+RuJovIa5nDQsax4JTLan0CTMfL89d5coDATyRAsLKBpFr2ss57rNo2B8x5BCsStmm/2uN9z/ANYxWCzSXgegX+FHRhO0qpDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVGOx5BY2m1IkoMvB4/BjuhSjvah/UGM+hmP7jqcOi0=;
 b=dZ81Jz3YjzCFyHhJt5aLYZ/qWDIf2ddz6EYm9+1XRowSA5c/75xcyHH6qQvKwrbryTp5ouvAeg1TSvRT+JVNj7Gc70uEg2dwxlMdsWjaCU3yR6cuoPaOYbX9POoz571CcniHnBNo0VT5MkqXbquso02Gn+o2tKEEfx1YF7Fb+so=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9549.eurprd08.prod.outlook.com (2603:10a6:20b:61e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 14:23:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 14:23:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: Fabio Estevam <festevam@gmail.com>,
	",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "marex@denx.de" <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [OE-core] [PATCH RESEND] u-boot: upgrade 2024.07 -> 2024.10
Thread-Topic: [OE-core] [PATCH RESEND] u-boot: upgrade 2024.07 -> 2024.10
Thread-Index: AQHbHi1Imo82Cm7NDk6K18LwZqvmOLKK8guAgAAH8wCAAAnEgA==
Date: Thu, 17 Oct 2024 14:23:06 +0000
Message-ID: <8399E2C9-2297-4147-BFD4-63CE81315B87@arm.com>
References: <20241014113549.1594444-1-festevam@gmail.com>
 <ZxEO4yJA4VVLQdsN@bootlin-mathieu>
 <de94f4d8-0ae0-487b-a45e-01098869866a@cherry.de>
In-Reply-To: <de94f4d8-0ae0-487b-a45e-01098869866a@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9549:EE_|DU2PEPF0001E9C6:EE_|AS2PR08MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 4030b16a-ec32-45fe-18d9-08dceeb74149
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dFNqYmxjRFlIWU5admxBZkdiaFpMbmgzTEJ0QkZEOGhMT2xISHBYVUc1dTh1?=
 =?utf-8?B?MnFVemlXMmNzcDYxU3BSVXlqbUJsMTBncTBnK1JnOVFwZGtMTUQzMFJIQ212?=
 =?utf-8?B?ckdHUVdxZWxBbFVSRmlwWDk4eFFWNDhuWS9GWldhSVlJZ2Rab0N5UjNhVW1I?=
 =?utf-8?B?M1g1RlA4Q3kyTjUyRk45ekZUZXZYTi95UXk1VW45MTkrdWxFWGVZNURjSSt3?=
 =?utf-8?B?cUR0TmYzNFRwS3pjV25qVS9tNDNhVVlOUytWNjVwdlptUk1yUkM4dG9XQnY5?=
 =?utf-8?B?dWVYSVlabUNqNzVoYXpjR0xCdDUyT2YyS2pOVDg0K1VrSXV4Mm43NFJXQTdu?=
 =?utf-8?B?TlFpenV2c2JKM20yNXBZSERvTXpCM3lCOThWMXQ1bE83U3A4Y2VUKy9EVk4z?=
 =?utf-8?B?cDkxOHl4clJiNmNUNnhBMW0vdFNXcjJyenRuMGZiblhoK2JGeFlYV3RGZC8y?=
 =?utf-8?B?a3NmMm1Kcm9najJXWjArOFlJanBGSzJEbnZXakdBd0VnRFRsOG9xZExmRkFm?=
 =?utf-8?B?MVltUFNUNmRZdHZ6WTF0MEFpWjJONWY0aTM2bE5wc1VWK1JTd2szT3NwTGda?=
 =?utf-8?B?MFhLSmt6SWlhUEo5M0JFai9uMERDRVlnaWd5aERVdzJodTl5bmE4QjM0NlNQ?=
 =?utf-8?B?VUhSTHBxWFRMc2trclI2TXd2dlU1UUQ3dmRVbEk5cFhhYXpocEFhRVFaUVpM?=
 =?utf-8?B?U1c1MEF5RVpmU3YxY0xFNVdzcWwzcmxjT0dYblN2Y2x4VCtRTUd6VmNyRTdU?=
 =?utf-8?B?ZzJGUTIzamtXa3B4ellESTVDUUpPZE01RHAwczl0OHVQOGg0MkhHNDZzUzQ2?=
 =?utf-8?B?cXBEWGxuUjYxRzBpNnpVV2lHK2loVVlQRndRREdvTDJlbTk0bzlxdEMvQ1JX?=
 =?utf-8?B?ZlIwSDcrVGp6KzFGUmhMd00xcGk4WXE3akw3amtMWWNoRDgrT2U4MER4VnVN?=
 =?utf-8?B?K2VDV0VyM1pnQnpjUnlKSURobjdRRHl0TFBBVlRkNVdFZlV1SVh5dDl0eDFE?=
 =?utf-8?B?NHU1NXRJdjV4QlgwaDNSZ2tCQXl6VmIwVzhJTks1QnJNU3pGblZFUXdVUWRh?=
 =?utf-8?B?UGpFL29pTlFFSjNWbXk3bzFkV3ZLQmYrR0hxeFVmcGtiOUVNU2ZUbzBFbjVv?=
 =?utf-8?B?dkdVNCtjMHU1VE9EVnhHMHhwSTRmcVRyWXFaRWhQQitpMVl1aldNd0QxM25J?=
 =?utf-8?B?dVBIcEQ3WjFuY0NLVkpQTUhacThVb3Jpay94VC9oZmJNbmtlTXl2Y1JqWm9q?=
 =?utf-8?B?czNZaDNjQUJaVFZzS2pTWG5OcmttQWtISk9yRHVjSHZtWE1HcWN3cGVPd2Yv?=
 =?utf-8?B?clRqZWthdkNOaFhaVnJqL09tdUpTTnRoOEFIcHAvK1VVZUJNRTNuY004eDlM?=
 =?utf-8?B?QTltTkREbEI2MmxxZTh2NTFTSit0SFhVUzV3bDVsOThmeDR0T0NtNkxTOTBo?=
 =?utf-8?B?THVtOWl3UnRmLzB3V0UwcVZQa1FUWXRWNkFrZXY1ZkNVOW83RVpCRFloZDFz?=
 =?utf-8?B?YXlkeVZaLzVkRnRqTnU3VHhpOVJPWWh1L2RHRUZKZWZmL1JnVWN0M3o5UTdJ?=
 =?utf-8?B?SXpicERabHQ0K1QvZTgvQ0crS0swbXdHQXRzUmNPR2JkYUowWHVXMWoyKzAv?=
 =?utf-8?B?MWRMbkRZblpDd2hkYlU3dW1HTFRUOHJiKzltQU40OWVTZXNoWnZvWm5kTUlH?=
 =?utf-8?B?QVdiYjBhenZDOWFPUEhWWTBpaGhCVVNCSWxmRWY5VkhTWEQrR1AyRzVSV2E2?=
 =?utf-8?B?WU1HOXIyYmFiaWNIaFBKMm5IT3NYbUVoNldOMi9MbDE4ck9zRGtGMEwzYUp6?=
 =?utf-8?Q?yfCK9kAtx7p9x3YxLcJm6g9dlMMabUpeENgNQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <833E92CCC216134AB005A3FD67F94C55@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9549
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33dddbf5-b085-4d8b-52d7-08dceeb737cc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnlybjIyVUpFV0tpdnFaMEl3V1hqdW1oaGJDZ25MRmFidG5IN0VlMlRMVHBv?=
 =?utf-8?B?ZHRlbUNERENnQ0VQaWdKMUdQMUlDc3lpYUtxYXZlYitlYVdzMWQva2R0dmIw?=
 =?utf-8?B?Z3NYMHFaczU2Z2EzNVlmVXh1dmFBVlY1ZjFhMnZRT3lTdXgvcy9iRFlDeGNr?=
 =?utf-8?B?ZEtSbmtzSHAxTkZZWXJMZS9yRUo0VzdBbjF2VFpYeFpPTVZ2d1V1YlF6dk1Q?=
 =?utf-8?B?dGNiVlN3dnJERUJTMGQ0Nm1aOHFRSXlyM1hlK1o1QmVqMGVrT0VsSlJNNUZQ?=
 =?utf-8?B?WmF1NXo4alM4WXMxVEhGNmFXSTcwOHpkZjMvZFlwV1B2Ui9zRjV5YUFkZElK?=
 =?utf-8?B?T0M4NzBVWXQ0VkNtZnhJVVVDbmlqV0hsMjByNXE3SjF3RmtwT25LZFBhWllU?=
 =?utf-8?B?bDFmajFLK3B3eEtLS1ZTUVB3Uk12TXY0SnhJMjJZRDlTazE3TUlEZ3h4Y3Jx?=
 =?utf-8?B?cmhDQ2sySXFDd0pkdkl0QzV3eUFjZ1NUNGJkT0JTMkJWMWxXUmE2bkpVSFlu?=
 =?utf-8?B?dGVncllrSnRGbzllUE1UUENPRDlHREY2VjBrc3o3K05NVU5FbHEzdGM4VEFi?=
 =?utf-8?B?ZWMrbkN6UXd3UmhWSkJVOGhnb3dwL1lDNC9ZUExiTjd4aGtwSzIrRkg0OGVs?=
 =?utf-8?B?RlpyakRIa0dFQjRZcEFRWWYzZEJ6V1JhVzNVbmdiS1FhRzA2blA1V1FGQlFr?=
 =?utf-8?B?Mkh5QXYybnQyMWJ6SHduNDFQeFlGaEU2K1owd09uT3hPaFJkYmhURFVPeUpH?=
 =?utf-8?B?Ymp4ZkRvQm5rTlNxMHdMZUlxc3BMZ0xUMlFxanFjSzFwNk5XMjNtekZPRFFx?=
 =?utf-8?B?SWxDV21VYmQ3cGlzUlNWSXNYSG1uU3RRRG96dlFkQ21tWDhacVRaN0tPZmZS?=
 =?utf-8?B?dVd4YVVacXB2Vk9BeTV6ZndoeS8yUkZYVFVCNTNXdkd5Ni9BT0VtMzZkcVVs?=
 =?utf-8?B?aXVLQ0duMkpSd0dNbzVFUGNYV0M3K2JXU21FdytMT2R4MTZpOG5yT2xRUkFT?=
 =?utf-8?B?TzJZbW1XME82ZHVSalQyQUxXRFZxNFk5QldRejJNczg3c3pnZWVjVi9GUDda?=
 =?utf-8?B?cnN3OTcxTll6TVk3T0k3MXFLbWUyMjJFNWcwQWxlOTF0dUJQdlRMMis2RmMx?=
 =?utf-8?B?NEJjM3FxYytCVlcvRnJQSUFJR0tMelQ3eWlBa1RGd0s3b3JudDZBbEJTWU4r?=
 =?utf-8?B?YVdpYzlNbTNoU0hJelZjMkFRUlRsVjluTEZEOUhpSER6djdrak9Fb2dJeUlX?=
 =?utf-8?B?ZWt0eURMSkRnVFpuWU5qSzlyM3ZTLzJqTGVFMjFTSGV2dkoxNHlFZkJCZmRE?=
 =?utf-8?B?YW9lU2VkWGgxb1ZVTUN4MmJaRFBDRnFzWGhZZ1hZUmIrT0F0V1psOWwvZWcx?=
 =?utf-8?B?d1JvRFN3VWJ6bHBBc3MrNjNhU0RDcGxNQ0RZazJta0g1Vy9DYlRlaExzV3dM?=
 =?utf-8?B?T2JZMmFkTzI3eEV1T1lqbHBDNVJFNVFMS3JMbEZ0MEFtdnNjT3NPVTRhWS9R?=
 =?utf-8?B?WG9FQVpaTVZDSnh3VExSdzNjZmRtZldMSjlPdjd5U0h3dVdiNWhiNTdya0FG?=
 =?utf-8?B?aTF2aE9LN1NCRSs5dXd6SFZUNEZScmRMOWFNdGNSemF4ZUc1UXhoVjVtRWxM?=
 =?utf-8?B?U3lYdmVEMTNvSmNNZnhueUE1Mld0NW1LT0hCSkhOdzZBclRvcHpWUVVzNzY2?=
 =?utf-8?B?T3piQTNRMzhPTkJ2NkhTNnpjTmNqbTNyNFV3amF4b2s2WVcxS2ZKWU1sT3hm?=
 =?utf-8?B?YXVhTGhNWlZiWXdSOWpBVUxDaHZ2M21nbDd0SmhETFkxZXQ2Rmgrc3V1K3g1?=
 =?utf-8?B?ZzA3WUpuU2FwbGg3TFFQVFR2a2t4dDVLR3ZyZ3NLODJqMEhNT2RxMkMrYjFT?=
 =?utf-8?B?SnRMdE9DU0p1VnFMbkVWN2RCak1GQ0x4Q1BpVEVpN09oc0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 14:23:22.1346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4030b16a-ec32-45fe-18d9-08dceeb74149
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 14:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206028

T24gMTcgT2N0IDIwMjQsIGF0IDE0OjQ3LCBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPiB3cm90ZToNCj4gDQo+IEhpIE1hdGhpZXUsDQo+IA0KPiBPbiAxMC8xNy8yNCAz
OjE5IFBNLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
d3JvdGU6DQo+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIG1hdGhpZXUuZHVib2lz
LWJyaWFuZD1ib290bGluLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnLiBMZWFybiB3aHkgdGhp
cyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZp
Y2F0aW9uIF0NCj4+IE9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDA4OjM1OjQ5QU0gLTAzMDAsIEZh
YmlvIEVzdGV2YW0gd3JvdGU6DQo+Pj4gRnJvbTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZGVu
eC5kZT4NCj4+PiANCj4+PiBVcGdyYWRlIHRvIFUtQm9vdCAyMDI0LjEwLg0KPj4+IA0KPj4+IFNp
Z25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGRlbnguZGU+DQo+PiBIaSBGYWJp
bywNCj4+IEkgdHJpZWQgdG8gYXBwbHkgeW91ciBwYXRjaCwgYW5kIEkgZ290IHRoZSBmb2xsb3dp
bmcgZXJyb3Igb24gdGhlDQo+PiBhdXRvYnVpbGRlcjoNCj4+IEVSUk9SOiB1LWJvb3QtMV8yMDI0
LjEwLXIwIGRvX3BhdGNoOiBBcHBseWluZyBwYXRjaA0KPj4gJzAwMDQtYXJtLU1vdmUtc2V2LWFu
ZC13ZmUtZGVmaW5pdGlvbnMtdG8tY29tbW9uLUFybS1oZWFkZS5wYXRjaCcgb24NCj4+IHRhcmdl
dCBkaXJlY3RvcnkNCj4gDQo+IFRoaXMgaXMgZm9yL3dpdGggbWV0YS1hcm0vbWV0YS1hcm0tYnNw
IGZvbGtzIHRvIGxvb2sgYXQgSSBiZWxpZXZlPw0KDQpZZXMsIHdlIGFwcGx5IGEgcGF0Y2ggaW4g
YSBiYmFwcGVuZC4gIElnbm9yZSB0aGlzLCB3ZeKAmWxsIGZpeCBtZXRhLWFybSB3aGVuIGl0IGxh
bmRzLg0KDQpSb3Nz

