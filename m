Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE4AC021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 14:43:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.71])
 by mx.groups.io with SMTP id smtpd.web11.51008.1740062609525220633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 06:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YaTpMD8B;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YaTpMD8B;
 spf=pass (domain: arm.com, ip: 52.101.65.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e9kBcmKjIvxTOtNxZTxXL82NzHWosg3pBeyhTOwUv+8kh3foxh9M7kUwQTp5BexLTvrQM4alUoi8IJxs3sicAMAFJylnXetnxJuCKkq4zG9RhT/PcLbLc6j0tWGXDi3lOrF/Gm6R5YvpLK9A4HSdiZ1oaznyeStWYmJMhpDlxVIltyiWaErG8kgxb35ga0fuEMztBqxMll/KKTj6GWSdTSOvYMJFq7xHxkiV83dPJqmbZcv676ibuZoWmcb7MIBWsko73lfYzTiToD8zDbNg7E4lY9WJT+jtbIABJ907S4diPIVbuVGsDxM41GPwd5gy6aSio7WPYke+kkdmeBky+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUDawMli32XsYdtskJBjKmbADKnwy5pr/a2YuFtwO+U=;
 b=iDzjWs89XX9V6KpklzZL7/LWC5PyFX0k9CKYqQS6yi+rPeoJzQK8HJOvDUcIatkMz/ajOS/j04EXBQt5DlEzUgDwhmPTbNLU+t0sPWRxCU9mC8l3LsJZFEb3/yCNEtzxMcbqJMK/V2kRnf9rMVJ7Gi/eUzQoqB7urNioxPq1XisDw0KS51WLW9n1o4fb9j078leaaoi/1UnsySTrvhK5pmwTKRXiX/E21X3AZyqf6g+d7qokQj1dA+MCkP6fSdYv3ZtCKihzFVAovSg4nEwnR6my+7LzyCp+v9u7oTUf+GvNU2dCYgSaMz7AY1KRnM6I8IEKHuoFavKsJrJpzusHow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUDawMli32XsYdtskJBjKmbADKnwy5pr/a2YuFtwO+U=;
 b=YaTpMD8B/i9eN3M6RE0eXT0UMDY+eC0+CQawlJRyO9vnwn84O3sNr/fptZq8XTeygqX6c/kTU51pjVa3uRpP42nvoWlHiNczsMlj6ew4ffIYEBGhvopcRmfkzuGeU85dXXsARMShED708AJG2oeQ/2cXQ9T2Pqm4aTi4+NIKbtI=
Received: from AM0PR02CA0165.eurprd02.prod.outlook.com (2603:10a6:20b:28d::32)
 by PAVPR08MB9625.eurprd08.prod.outlook.com (2603:10a6:102:310::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 14:43:25 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::b7) by AM0PR02CA0165.outlook.office365.com
 (2603:10a6:20b:28d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Thu,
 20 Feb 2025 14:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Thu, 20 Feb 2025 14:43:24 +0000
Received: ("Tessian outbound 8557fdd8a2fc:v567"); Thu, 20 Feb 2025 14:43:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: df1608e0e9705d16
X-TessianGatewayMetadata: TLoatdyChE91XnaL51tJDdMg3gEjD7TnXb5ACfC7HuGLcFXoiYdMLHkqZZvuJVGiJpw7RN4l4mYLxJ71Fu8xtyBM8jiT6hcInPnTO9sFDuAVM4bS55mqPn37xXqk84l4BAyjS4CJ/kxgdEfEzSMrQwJ3U80rwQey6wrSmlvPTZs=
X-CR-MTA-TID: 64aa7808
Received: from Lc41195cb5657.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E955A1FC-B659-4BBF-BB14-9DAEBEEC1888.1;
	Thu, 20 Feb 2025 14:43:18 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc41195cb5657.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Feb 2025 14:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQUO8K7+gTxRVOI2T0PV8XJhsQQnZrBN/ypMYNiWM82Z2kOqtQFA8gRu85CKdvdI05DQ1mYGnU7hXZzyzAoQ2Ui+KqeaT+EUpVftWYtTvVJekwZfTMrG/RMW9t3t/jm+OKf3NBpuUvKvZbor7V0eNJlCbIdCmTQynsSoP8BwzKNUKdhQqJ1VFDoUKQUPTSWYXnT0bAE/AcEN7Z7BmUeSEdXidL6NRuHagBdtA4Ywc2sAXLZdwTra1zaZEQSctCRKuW02qZoZTdBI4VqaYrVGxX+94j4Ueud9wpLVRS1O+7ZJpe5s+wSqBXBv7cFBQ07GEQvIORH7LY4wqJO4CPirJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUDawMli32XsYdtskJBjKmbADKnwy5pr/a2YuFtwO+U=;
 b=st816nlny3+3drrW6siPW2qUL86y2Au0oDrbA2DlHvG2YTJz8a1iaQm1d/IXMS0J13zIsL8CmuQoMZwqY1q17HH3DrrimtKQGL3qute7Upuz/SRJEtwUCB7AmOdFkJq3xXydcDT08/Y7k1DOzBEsm2ptiN7jePaawy/WOnvlbLAmkTkZ44Plr2F4bQgMYqB3q0sC4KmzGgTHud8z3PE/7V7BAjU3lAFBKgIik5iQJwfy/GIbi/HHVuFkd9gwLyra0xPbJ+bHheIdMw2Uc5gVTQD8jL4xEAWobadMqbRIGg0vr4TC56cTu7fomsnIUqPJUiAjFKUVrxHHpVojuVoWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUDawMli32XsYdtskJBjKmbADKnwy5pr/a2YuFtwO+U=;
 b=YaTpMD8B/i9eN3M6RE0eXT0UMDY+eC0+CQawlJRyO9vnwn84O3sNr/fptZq8XTeygqX6c/kTU51pjVa3uRpP42nvoWlHiNczsMlj6ew4ffIYEBGhvopcRmfkzuGeU85dXXsARMShED708AJG2oeQ/2cXQ9T2Pqm4aTi4+NIKbtI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB8022.eurprd08.prod.outlook.com (2603:10a6:20b:585::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 14:43:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 14:43:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v12.1 1/5] rpm-sequoia-crypto-policy: New recipe
Thread-Topic: [OE-core][PATCH v12.1 1/5] rpm-sequoia-crypto-policy: New recipe
Thread-Index: AQHbfisITzwVMVodA02FUgztZKNy87NQTymA
Date: Thu, 20 Feb 2025 14:43:15 +0000
Message-ID: <CA355874-B96E-49C4-A338-06225BDAA8ED@arm.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
 <20250213152144.4016665-1-zboszor@gmail.com>
In-Reply-To: <20250213152144.4016665-1-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB8022:EE_|AMS0EPF00000195:EE_|PAVPR08MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ecbef30-5aec-4e29-8a24-08dd51bcee3b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZFMwTEw3ZWwzRll0Q1JVTXY3d0tUTGxNaXJROXpqUXdPYVRLak5qeXhUY0Vl?=
 =?utf-8?B?d0dkVmZnVENKd3JJQW8xTExSUFB0WnVtc2s3TmwyOEFQaGYwTjJGWEdsQTlv?=
 =?utf-8?B?SXlwWStwUTB3K3NFQ3dERTltaU00d0g4N1N5dTM5UjhreWx6K0dYd0ZGV0Nt?=
 =?utf-8?B?MTVqd2RuY093cktmUVFFOFdvMzNHbFhrRHVqU3F1SXh3N0FjSnhRSjBHRy9h?=
 =?utf-8?B?cXBBejJCa2RLZGNIZjdYdy84Z2ltZnlYV0hmeWY5VklweVZINGRCVVg1dWdo?=
 =?utf-8?B?RS9WZFY0MnFwcnZLMjQ5N3BTcllmZXhVbE4yT1Q0UHJ6NXhkdnNIaHFnUjNT?=
 =?utf-8?B?TFRXQlVYdVYyeGpRd3grK1Y4UjVmajh5akpJVlBFTzYxTWdkcmF6ck84VFFY?=
 =?utf-8?B?R3hwNEdXWTVKcmxvTXFScW1rZjFSMHYrZkJGT0ljUjlodXhrYnNJZ0tyR3Zv?=
 =?utf-8?B?aGVnSW9TamxLR1c3ODY0OWhvMVpEUWs4WDJwRC9rWUFGWlZDYlg5T3dFaTIv?=
 =?utf-8?B?S2o3c1dXbkJnYmZGUTdlVCtESnpkR3N2UXh4NXJPSUVkUkpROXpQNHpOdlBM?=
 =?utf-8?B?WlFCUzBmaEczOGpEQm9GekVmQWVTS3dSU1o3UEdHKzlTNnB6R1N0QW9YY251?=
 =?utf-8?B?Q3JMb3pCV2Eza2JlVkF4U1hibjk5bENlR2x5UHUxV3BabDNGOUlNTUNtbk53?=
 =?utf-8?B?MStDV0RobDBtVjJWSUNpZFZrelI0MUxrR29yVWpObnRVSkJzUnk3ZHRrQ2h2?=
 =?utf-8?B?WmpyQ1dyOGlucWZkemYxMFZ6M2RTSHdLRFRjOXU3QWoyK2tMai94amszVEhB?=
 =?utf-8?B?SjQ0QVFPRGpBcWdBQXphYXNidHZUalpBVlZOT1g0N2dRQnBHSHBIU25ueTUz?=
 =?utf-8?B?VXlEcnQ4NlVSMGpibU1jR3YwcnhmUWRqOXg1RzZSZXhZSXdQVE9sOHN6MTlW?=
 =?utf-8?B?NmY0RkRQNnJyNGJNdkVvV0QwcklNVUdDWVhsRXRYU3FxVXR2YjE2TG5NeGE4?=
 =?utf-8?B?dlh2QUV3MVg4c1c2Z0RkaHNPdnJxRmg0bFZ5empQejVHaU51NE80NVFaSGpF?=
 =?utf-8?B?c0tRVzNmbzUveFIrQzNuQmorTkc4SkNQamREekg1MUlUZVEvRElPeXJ2SkJG?=
 =?utf-8?B?QkxlalJjYkxKWHJNL0ZFa0kwS3MzbFluYzd3RHNYdHBUejNPSTNvUnNVN2VP?=
 =?utf-8?B?YkFFYUFuTEFUSFNuYS92bE95Y09ubXVhU0NZdDRpdUN4cER5d3BmZFZlMkpU?=
 =?utf-8?B?WjQ2eFA4NlZJbDJVbjNzSjBIZEYxY240bThubDRISkpjanh2L3Nka2hCZUVN?=
 =?utf-8?B?QkRUMTRFamNReDFSV0lPL3JabC95VVJURUlTZjlLckc3bVRmNDF5Rnd4aVp6?=
 =?utf-8?B?cDNXR1pHb3lGV0NQYmovMjBvRDI3YjJMZjYvN0hIMzFiREhEQWdHZmFGYWlV?=
 =?utf-8?B?cWlONVNkZWFBUEdadzZMbFlVV2tXQ1dYTnJxbTY1NUtia2FOdkk4M1BUOFM0?=
 =?utf-8?B?VGpDaExuS2hwYlRSN2R2bndQbUhFWWxPaWtPVzVmdDd1Q3VYME5xS1k1NVNI?=
 =?utf-8?B?b21jT1d4eUlaR2xpWEh0aE1hZU1pUFlxam82RFBrMUxzTkhsS3VpdmNGNldP?=
 =?utf-8?B?TDB3OUtZT3BKbDFHa29Fc1hKWm4vbG8ySEhibC83Uk1vWVVrU2ZIdit6NGZ3?=
 =?utf-8?B?eW13cTVWWUt2Uzd6UzNTdmxPeWwvNDFoWmcwYmdaQjVkMzFTNTRQRGVyNktL?=
 =?utf-8?B?bEZESURzMnhpc0ZWWnV0UnY4akU4RmtDZlU0QW82TEhDRFdxQkRzbFpXaXNt?=
 =?utf-8?B?NlppTHRqTUtqVFBjcXl3Q0NHRmJsMHI0MkE0eExpWDArdE5vSjFOc2VJQlpr?=
 =?utf-8?B?VjNDd2NQT1VpY1FiTWdUWFROb2VjTnRJSVVtQThsSk5PL0ZMbXJSakFnd3ZG?=
 =?utf-8?Q?dPcAu0LohRhA2ESdsJcPML7ou2CvFBY6?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B8665B2CAD0F54FBC048C056A4117F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8022
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	77ea2ded-f1ad-4925-aac1-08dd51bce8be
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGxVS1JoUGJnbUNsZXVEVVN1dHppM0VZZFVTMXUwd3htYXFCU2xyR1dsS3Jq?=
 =?utf-8?B?QjZkTVNxZTdTbW9QUGtZeU9oNFl3bFY4R2QrcU9BaDliR0t5OXRPSm16ZUZl?=
 =?utf-8?B?OVpmRGxlMFZ5ZFozMFE5Tm1lNGgzZy9VUXVscHZQSHhwQU8wTklHZHV4Z1Ez?=
 =?utf-8?B?OThUNWMvWXhEMFg4Z3ZTT004WGV0bWpnMFhCWlEzMndLNjhLanZwTUNidXdw?=
 =?utf-8?B?cStEMDN1VHYvbUVOMnN2Ui90WXdsVGFRQ1Z0ZUx6S1RBUGUxM0FZd3c1em0v?=
 =?utf-8?B?b1lhbU1ZZElaM0w5a21YYUFvT2YzdXo2bnM4UVRnU0VOWFFtNFU5eSthK2Np?=
 =?utf-8?B?WEhvTUxOaThSRThLaklJejZGMWc2UitBK3hqbm9IcHlQQStPOGIwMUtkQXRs?=
 =?utf-8?B?YXlKRVlIRWRDeE13Y2M1UGFDZXdBUFdha0NMM0U5Mm5hMUVEUGtDaHZ5YlpS?=
 =?utf-8?B?NjZ3KzBOTElzMExpZTcxWTVMUnRVL09VcUQxQ09LemRNOTJDYjZrR2ZOTXNs?=
 =?utf-8?B?NjdtMDI4SHo5ZHR2Nzd3YXYxVzdwTmhUaHQyYW9aQnFHamxhajhrRkV5ZXVv?=
 =?utf-8?B?L0Y5bUNtdHlneWVuaXA3TkFYK3dXYlpCZ1RqdXdMY1lGV0dlUzVqVDViYnpm?=
 =?utf-8?B?dUtoMmcrMmJNRytMMUlpdmk3SVhHSnJHTy95UzdBWitSMit0K1RKVGFKbHNu?=
 =?utf-8?B?dzdrWVNqNWRWcHVuS29zT3BPaFhzMmkwYno5TzZUUU9tbG5pcEtxUGxhYk1W?=
 =?utf-8?B?L3ExWkZaNWE0d00wZFZrT21mcGhpdG1VQVJRNUJyb0l0NERJbVVza1U3bmZy?=
 =?utf-8?B?czZPVDc0OHhKVkZlTTE1WnpJOHdYN1VhNGgvOWJzTEVDQ2szZnhiY01xWGw3?=
 =?utf-8?B?VGNjRVBPUFBUUnpGckNRMjh6dG0xMU00UVNXSGpnamRocktnVVFJVldBcmxR?=
 =?utf-8?B?Q2U1cnhaeTc5ZTNtaWpZVlBCWUxqbnp2dkdwZG5TcG5tdHUxbUJmNEM5UDc5?=
 =?utf-8?B?MXN4SmhKWkZ3eEhKREdLU1JjbUg5S2hTOFc2aEEwN3A1RzFqZzkxdGhsV0VT?=
 =?utf-8?B?bFU2Ti9vVTI5dkdFbTJXWkRUcjlvMTdmK2l0WFhkWTdYT0pSOThkcHdXaUlw?=
 =?utf-8?B?YWZYRWlpejJGbHczSS85WDNiNUZIQWV6MllWdS85dWFCaTRSSzUxb2NUVjh3?=
 =?utf-8?B?Yi8wWXZPUGxKS0htVEoydENDS3BkNjJLbEFjN05uN0x0ZWlkZmtCNmprYXBC?=
 =?utf-8?B?YmdJM3k5cUJTbEdMVTRDdFA5bnZBMkdObkEvcVRDQnBLWHlYV0U2OHN5VWZh?=
 =?utf-8?B?d0w3NUpGYVhZb2kvcW8xUGtyQjRQY3ZBYUdZYWdkT3YwZGlteklEUVRTcUtj?=
 =?utf-8?B?a2J5Qi9JWmxyQi9kYVVReDNucDZsdkhycENZWVpBR1NRUWhqRFNyNi80ditq?=
 =?utf-8?B?Nm9hL1FvYzlLeVJELzBwa01jaGErRTFvN2N1ZG8vRXd5R29KS2xTRkY1V2hM?=
 =?utf-8?B?S3JHUjlZazJyZDY2ZTRWcFhqc0kyWEdjakhBK2xhekY4T1djdnZ5YmJ3ZkNz?=
 =?utf-8?B?RVJmeGc0TmRSM1JzOVYrZTB3K0hSQ0FocFRldVZTb2VmdlF1WGFubW5WcGNu?=
 =?utf-8?B?QnMrYWxOdmxJMkkzM2FhK2I1S1Ryd3dKMSsrQ2VjQ3BGb054R0VCSWtkMDh4?=
 =?utf-8?B?bjdOVlV6SnZaTEd6NHlwc0pHZjZ1bzVkTW45ZE9oSFIrc1V2V3lWZ2sxOXhm?=
 =?utf-8?B?K3JCSEFDcTQvSmYyNHR6OHcwZE1FSlZ6enQ4Yk56Z3BjQ2JYK01wVzNSSjZs?=
 =?utf-8?B?WnJaaGhSc2pnOUlERnFjS3dxVFE0NFBIcmRETm5RQktCNjFNSDZ5VVBRc3k5?=
 =?utf-8?B?ZmNYeHV2QUJFeHphK3VlZ0h1NzhrdWZHTFQ3K1VwbjR0a3VselI2a2toK3dh?=
 =?utf-8?B?ZTROYkIvQmRFeXlscEFkcDB4YkEweTU3bkNINjBEWk1VNkRVcXVJaHBuYTRQ?=
 =?utf-8?Q?X5vVITX2j8FgTRW+uogOHKWfB7pJQo=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 14:43:24.8590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecbef30-5aec-4e29-8a24-08dd51bcee3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9625
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 14:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211764

T24gMTMgRmViIDIwMjUsIGF0IDE1OjIxLCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArREVQRU5EUyA9ICJjb3JldXRpbHMtbmF0aXZlIG9wZW5zc2wtbmF0aXZlIG1h
a2UtbmF0aXZlIg0KPiArDQo+ICtpbmhlcml0IGFsbGFyY2ggcHl0aG9uM25hdGl2ZQ0KDQpUaGVz
ZSBkZXBlbmRlbmNpZXMgc2VlbSB1bmV4cGVjdGVkLCBhbmQgaWYgdGhleeKAmXJlIG5lZWRlZCB0
aGVuIHRoZXkgc2hvdWxkIGJlIGV4cGxhaW5lZC4NCg0KV2UgYXNzdW1lIG1ha2Ugb24gdGhlIGhv
c3QsIHNvIHdoeSBkbyB5b3UgbmVlZCBtYWtlLW5hdGl2ZT8gSWYgdGhlcmXigJlzIGEgZ29vZCBy
ZWFzb24sIHBsZWFzZSBjb21tZW50IHdoeS4NCg0KRGl0dG8gZm9yIGNvcmV1dGlscy1uYXRpdmU6
IHByZXN1bWFibHkgdGhlcmXigJlzIGEgdG9vbCB0aGF0IGlzbuKAmXQgaW4gSE9TVFRPT0xTPyAg
V2hhdCB0b29sPw0KDQpUeXBpY2FsbHkgdGhlcmXigJlzIG5vIG5lZWQgdG8gaW5oZXJpdCBweXRo
b24zbmF0aXZlIHVubGVzcyB5b3XigJlyZSBhbHNvIGRlcGVuZGluZyBvbiBweXRob24zLXNvbWV0
aGluZy1uYXRpdmUgbW9kdWxlcywgYXMgYnkgZGVmaW5pdGlvbiB0aGVyZeKAmXMgYSBjYXBhYmxl
IHB5dGhvbiBpbnRlcnByZXRlciBhcyBpdOKAmXMgcnVubmluZyBiaXRiYWtlLg0KDQpUaGFua3Ms
DQpSb3Nz

