Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0795C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 11:40:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web10.5926.1722858046289963490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 04:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BMK4GFRU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BMK4GFRU;
 spf=pass (domain: arm.com, ip: 40.107.21.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d8VuoNf9lOziA500R4BXGqDGGtZD8dGyDuYLRTatb6cOXZkL27MEG8+Dqgc1+MHQdyDMONBV92BLm78ZpxHFGqnbbqSLMGhexswE7A5H0GQepOQLv35gJ9nPS00i1ww3yrSt5TFSqnXng73F9k8kfXuG3M0O09U6Fvt3ISrpSETGdBvIrp0U7Zp0ELPQDW85ksOcYD6zEjpwJNlntGBAlABiuGQGjRuxo0bVR60Y4LxLQZzIGmL8B6Wbcay5qs3Km7VnCbOZpLdbY9o2eaQ3IQO9h1NPocpiEgoBiVwtgNVecjqiDtQZqO+D1iG4JwvFOpiU3wGWnqyNGcDv4mcgoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiNpIMM9FcFIoZZlFPmYPj1+DXQhlKSRiktjpw9fdW8=;
 b=Mb4nVHLA5nz8n4ctqSy9toX8m4ZWFCdebHx+zEJixLYp52u4OAUtnYn4h+wB9I78X0jkjldDeyfBtLdD2ILjJYRjI5rXI84BVWPgs8KkMN6V5GUhyzgGRlb2ouMEglwFCKHKzhNNysaNv3lqBLx4DNbaomxUwzXYqdmGLgZqUBXiBZGyL2VZE8hyP42k/BQyhPKX8SyEx2R8Uew9zguL9hsoG3j6/a0/563ssFjnzuzh4SaZgiGdLS3KxBH8oXcpILSMa5zbbSMKNgCL0X37itxwDwRsxpxlXLvkuXjGIlT3rQQnqnbjjfn3t7Qcwb2lSkMlwRlHnXdKoiEXxVVK0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiNpIMM9FcFIoZZlFPmYPj1+DXQhlKSRiktjpw9fdW8=;
 b=BMK4GFRUrAabH1YRfl1N0Kb0wSSWvmzi4z9lVdueabJ0umc4gcVImJEhshO/Zdk2ESiYLd+EwC41p3sTxSxggmE193qRsPRV0BDrWHXcCchwluat0+P2XVDtTXCBwKx9xxGOYk34yQNoWilMg0qa8rx2xkJaeKrm68bu6JJ9YRA=
Received: from DB8PR03CA0036.eurprd03.prod.outlook.com (2603:10a6:10:be::49)
 by AS2PR08MB8782.eurprd08.prod.outlook.com (2603:10a6:20b:5e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 11:40:42 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::26) by DB8PR03CA0036.outlook.office365.com
 (2603:10a6:10:be::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Mon, 5 Aug 2024 11:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8 via
 Frontend Transport; Mon, 5 Aug 2024 11:40:40 +0000
Received: ("Tessian outbound f62a19c28806:v365"); Mon, 05 Aug 2024 11:40:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d0a9ad65898a16fc
X-CR-MTA-TID: 64aa7808
Received: from Lb453275a41d9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 25809826-ED3B-4C02-8B14-0ED1B693EDB8.1;
	Mon, 05 Aug 2024 11:40:34 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb453275a41d9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Aug 2024 11:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8F1sqAaVV2k69CAzHG3xtRBCdPZ7asb9lPRZg9wgSar/B2clEZH6DfZ3+LGCJiK3eW7LlYmj69/P+UjE/9u949HjVV1Z+X9NAv1oD5fiWqN7F/EYcjr6HoWMiYjzspgCRVAZH1OPUAXUwxRQIy3NBe3Of7r15XTAx4f0ptJ5ZskIR+jz9N/27Z9LGFDv7iDh125miVeVo0cfP7S5kUtPOQY4d4bJS1Q0HQtjMpMTzax6t0Cox05osnTDWwTohpfkR+NsYnLnT5Iufd9t2EAUcU0K0hfNw/PRj+bcCitC89D36dMUQq3w9TU8qwDk2rnYfbr80Nvnn02aNcwlfH0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiNpIMM9FcFIoZZlFPmYPj1+DXQhlKSRiktjpw9fdW8=;
 b=oq3bW8dQ35X5+//nAN3WIitu6M7cxJyeq4WhLxJua1oMFkOx9O+y/v4RtvOUo2FgPzFLj4/HkPjpYM8kGOmsChD/WPZnAt/cbhgxcc1h1lQTMV3u7lZ8DUXP7SMaPETWnD1M4ldO9+aU7u7Xq7emsE5VGz46iJHYxz5NfF3GY/1auBFjLgjOjmBueA5pMDtbYap4FZUcZG4Y+/KFNKQk198sHTzkvReORRilRvwOU8m0pyvbd73iL7HfTNMlmjZyyYAt87+7u9lRA9olcCcNgjbV72651AGktMnHPF8fSm4Lz4O1liO6ESI6Cc6Y2S3kG14pwlIVQYcJXKCUIUrMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiNpIMM9FcFIoZZlFPmYPj1+DXQhlKSRiktjpw9fdW8=;
 b=BMK4GFRUrAabH1YRfl1N0Kb0wSSWvmzi4z9lVdueabJ0umc4gcVImJEhshO/Zdk2ESiYLd+EwC41p3sTxSxggmE193qRsPRV0BDrWHXcCchwluat0+P2XVDtTXCBwKx9xxGOYk34yQNoWilMg0qa8rx2xkJaeKrm68bu6JJ9YRA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10969.eurprd08.prod.outlook.com (2603:10a6:800:250::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 11:40:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 11:40:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "marc.ferland@gmail.com" <marc.ferland@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marc Ferland
	<marc.ferland@sonatest.com>
Subject: Re: [OE-core] [PATCH v2 2/2] appstream: add qt6 PACKAGECONFIG option
Thread-Topic: [OE-core] [PATCH v2 2/2] appstream: add qt6 PACKAGECONFIG option
Thread-Index: AQHa415x6uH70yfEYUuSaDDhDAv9mbIYkcUA
Date: Mon, 5 Aug 2024 11:40:32 +0000
Message-ID: <67D06A02-501A-4362-9D7C-BC9C869E543B@arm.com>
References: <20240731152858.3340807-1-marc.ferland@sonatest.com>
 <20240731152858.3340807-2-marc.ferland@sonatest.com>
In-Reply-To: <20240731152858.3340807-2-marc.ferland@sonatest.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10969:EE_|DU6PEPF0000A7DE:EE_|AS2PR08MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a98276-5934-441b-1eff-08dcb5436ef1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y0lFZndxM3AzWk9yUHFmd2pKOTU0cHljOGRKTGZGUTJEUWRnY0lPMW5rZzNa?=
 =?utf-8?B?a2JZQVNBSHFwTDI2YTMyeGs0REZ4VzdBVExIQUJMVk55MUxHRGtIdU15ZTBm?=
 =?utf-8?B?ak5Wc2I2UGFUMHUrR2RYcyt2ck01ZmNVd3E1dlVPY3piNkQ2TU5sbjVWaFFv?=
 =?utf-8?B?QmRhZU84TnNveXEzMkU0QnFXa3A3bkxSa3JNWlpBZld2OGpONURKV1BlSC95?=
 =?utf-8?B?Zno1TkxqdEQ2QnRYOVY0Q1ppaXFZWGUvTFZkN2o4bHN1MDJVOXZsWFE5YzRC?=
 =?utf-8?B?QVowbUVyMzlSanJST2RyN2ExcDYxUkpSWnNvS3I2MmJDdHVFMjd2dnJhbUxt?=
 =?utf-8?B?R1FoUGhxK0R6NWJTcTF1L2R6Um9SU0ZhSC9QSEQ2aFEzOVpESVNGK0tZZ0Iw?=
 =?utf-8?B?NWw1VUdYS0RUSGIxUHhnRXNiejJLN28yc0lsR0FUdm9NZk1YNm5ydHdJRmpF?=
 =?utf-8?B?VHFkdVNOMktMZEdOWm5kUUQ0VDkzZlhUbjdHcjNxdTZvZW1WazZZNWhDOG1C?=
 =?utf-8?B?RmEwMkFkU2o2Wld1RXorOWN6bCt4VTdHb1JRSS84VE93MTZ4VlRvSkd3Umtw?=
 =?utf-8?B?VUpXQlg3bjRmMTVISlYwOVhQVlV4eFVKbERLQ1QxNk1GenQ3YWxnbS9LeENX?=
 =?utf-8?B?S0d2Z0FzVzhRVmlUcXRrSHo0Wk9uS0RrVVhlZHJnQ1FrSzFpWFZPNVJrenNo?=
 =?utf-8?B?QWFkKzZTTE8wWlNrWThYM2VUN2t2SDZjSWNrYk5WektlUXp2TVFlODJ5RGw1?=
 =?utf-8?B?ZHNMNDNnVDVVeFErTmc3T0d1b1pabS9XeU8wblN5MDBRQUQ4MGIrM0R1ZUFC?=
 =?utf-8?B?WWhIM1BqOEN3U04zc2N0ZTJpMUFlY0Z0eU9rR1J3ajJRLzkxS3h0ZmVoUXhD?=
 =?utf-8?B?aFNYMGlrRmJReG9lNmZ5MWxCMWxjN0hmY3lkUjdPbGo3WGVLci9lWUU1MW1q?=
 =?utf-8?B?K0x3SVNKVXZZSy9WQ2FDblMvWHVpMnlWRWFlSkFxWlAxcWozUUpaY01iQlU1?=
 =?utf-8?B?V0Vrd2ZRREJON1BnLzEwK0JocEQ5ODJaSlBxdEZQcTFjdWQ2Y3YxdWhQQ0Ns?=
 =?utf-8?B?a1oxTkF4a1JhckQvYlRvRU45a1pUQ1pMSDl3dCt4SnZ1Wm82ZUxVQ2pBOGlS?=
 =?utf-8?B?V1AvR29Wb0ZETTd4RW92UStCd3BuLzBITzQrOXlXSWVPN0J0UGRtajdhWU9r?=
 =?utf-8?B?ZXpVWGZad3hUa0FIQlFuN2F5VFlMbGlSK0ZydEZJbUx1MjV1eWJlZmErYW5s?=
 =?utf-8?B?TVJFNFNZbWM4cXprVXZQMGQ1eFlUSWhwdWczZ2JBLzJZN2xQbVMwdmpmNU9m?=
 =?utf-8?B?NTh6NjQ4dnBKTTFGbXVoRGU0UC9Vd09XQnA0V20vc2JXa3FTSzdKdnRxR1pB?=
 =?utf-8?B?cGdpakFKZjRYdk83NjhGbkZwaG5aaUFxMlEyak1pcGFSNzU5bkhadVRvRUUr?=
 =?utf-8?B?TldTd1RrVG4xaEp3V1lOUTh4T2NIWW9Vd3BqSkVydGVMc21tYUNVZ2JPUFNH?=
 =?utf-8?B?Mnl2dlZmMXB0RzJkVDZCQW4ybVFyVTJuVmNEMEkrUkE3Y3ZwR1N4bFFWalVL?=
 =?utf-8?B?MngvREprYUpyOUZCZjBSVmtGTGh1NndnWEJjb1U0cnZ5M2VQZFFMODdiQ1FK?=
 =?utf-8?B?S2o4Nkh5eVFZN0ZtZ3ZIY2c2WVBGUTRWVjFHSXd6MHppM2dyM0hmQzhNZlJX?=
 =?utf-8?B?dXJreW4xSklSZUxrZjk3NnV1MkF0R1lvaUdrcjhwUVJNUEpXMHo2TTlZbFF4?=
 =?utf-8?B?QmU1U1RHcnEwRmNyczBwa0JEdFBZcmtPQTJsLzZERGFSczhHSnNJUVB4am9l?=
 =?utf-8?B?MXZld1BoN05HODJWQVlTaHY1UmFzbDE3T2Z6eXZPeHZrMkJONFVhcUErLzhN?=
 =?utf-8?B?MVBmc0N2dFZSTkNyWnZoTkR3VjQ5L09EblgyTGRIWXJIbFE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DCA3B722E40154AAFD7D61C52AB590D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10969
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b1656468-ec10-4c2b-87c6-08dcb5436a0f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlNzQnkvK3pFUGpKcXpjZ3VUa0ozUFBoYjJWQzBES0Y0QUZXOHZjYWR3d2Fw?=
 =?utf-8?B?azdJLzBhRzFJTHFnS1VyMUpEMy83c1JuTGNOd0VtQ1Rld1NNOVBMSTQxUSts?=
 =?utf-8?B?Ky92Rm5WZGM5VUwxMVRwK0lBOGxCU0hONGdTWW1nRVd3Vnp6L1hOakVQMVlV?=
 =?utf-8?B?Q3RFbDMwLzlqQjRCbkZIMjJKS05wNy9oWTFjZkoxbXhnY1I0QVJuVnBjZUt0?=
 =?utf-8?B?S2RuMzN1eGVUVVMxR0VRSndVd2U1QTFHNVdzdGNzUXlpZnQrQ3JIdG5JMld5?=
 =?utf-8?B?ODY1SUY3R2VQVFBROU84YkxDNkoxVXN5c0hJN3ByaXJBdGFHWGJGTmJJdUpa?=
 =?utf-8?B?TTBVaGkxNElNSFZ6WG9HMStTSGFTK0lUbUFWM2dVQzI5QVI3Y1hrWWVZZlhx?=
 =?utf-8?B?ZE5IbTJsZWRXeFZ3ckYwMFU2V3BhRStJZXphazlZRlRQc2JZcXFJVSsrRFU1?=
 =?utf-8?B?NWZneTNocVFOeTlSZkM0Y1BCNTVHa0d2WjlFOWYzd2hEZWtvTTZ1OE1sMUp0?=
 =?utf-8?B?cjdlL3Z3ZXJFUzYrTmJOVTVac0xraDN2aVJ2azkzU1B1akx5TnA1WG42T1pZ?=
 =?utf-8?B?MEplVCtPdXZIbWhRTThDWE1NbGRBN2xHdXlDblR3eXpNd0pXa29hWW85Q0w4?=
 =?utf-8?B?UmQzUVl4Qm13by9xZlFUcDJ4T1U0V1Q1MmRvcFVtOXVzdnEySldWbDkyNzlk?=
 =?utf-8?B?Z2Q2M3BCWmY0NTFuakREc2srenM1T0UxY2JDSko1czlKNVdIdVRoVFBFTUZN?=
 =?utf-8?B?dkhTQTZGSHNCZXV4SGdQNkVBT2ZpTXlEekppVVo3a3UxaEFXWE00MHVUOE13?=
 =?utf-8?B?Ull4bWRBL05DcU4vS0t1MVZmTFB0cEZZTytlbmtXTVZLa3BkMW1tTDY1TDlZ?=
 =?utf-8?B?bW53VlgwcTljdUlZRzNFRWY5eFNGU2RBVWQ4dytlaEtIcXZTQVB2SDYwYm4y?=
 =?utf-8?B?clk1UU9QWUZPdUNlV1hCOXE5a1pIaDUwRTh1YXhrOVpId3B3cUxWdlVtbDh4?=
 =?utf-8?B?cmR2RzZXSXQ3Ky9Rb21xYkczbzJDYW85WGJpbVREYXVsanlDUE1QV3d6SHh2?=
 =?utf-8?B?ZTdKV24zSS9VUXAwM0YxR2RaM0pXbVFSRzJsQ0RtV0RZaFNVQlJZT3hSOGEr?=
 =?utf-8?B?bXIyYnJUeGhnZXMzRW9rOXlRWStrOGcraWtOWk9OeGRucVN5ZS9kajRJTFdh?=
 =?utf-8?B?ZklJTHFZQ3BLUEkvaHBWa1pZSy9KcE5COThFUFE0RE8raEFZUVpnMVZiWVZ2?=
 =?utf-8?B?dkV1Z0QvVlViRHRDZDdZTlczWDVTc3lNRmtVTkcvdEhGNTRhcjBJT0l6M2Iz?=
 =?utf-8?B?VVVwUWhoYmI3RUtKV2hQQUFRdnlDeEVKbWhtY1pyM2VSNVZpRG8rVlh4N3N5?=
 =?utf-8?B?d2pYU096bXlxdnJidFA1OHhud0JBRVRzVlh3czNzQy8zNWRtYS9QcmczMXdj?=
 =?utf-8?B?bGtoeDk0dWZZQzVKdmVNQUdockZzK1N6MVZjU2wySnREVFJrVzY0L2o0elQy?=
 =?utf-8?B?Z0ErUXhEbm1Mb3l1VWNPbFdOQXpVS1dsYTRpUW0xTWg1U2NyN3VSazFBakxD?=
 =?utf-8?B?enB5SnlLcWhsa1FMbm1DNDFObkZnbDA1RDQ5R2pNb0xGNU9icmhhYzVuWmtG?=
 =?utf-8?B?enNDTlNqdmFXS2RnbU5HdVptVzlUZ0VmNjY2NXEzWmdDc2JGZXFnMHdFOEtY?=
 =?utf-8?B?akM2SWE5eEJvNnFldGJyWlFwK0xlZ3NmdkhEa1lvbHoyQ3pYR0JGcHBTL3g2?=
 =?utf-8?B?YUhIY3B6TXY5VXFjVTVIVnJDcjZSbjBveXNFNDBrdFIvUGl6REJKQzNPTDlI?=
 =?utf-8?B?NXpNZzArVDQ3WUVnUVljM1dRVTI0a2Q0VVpYWXQ3WHFZRlBYSmRPdzVCZmNv?=
 =?utf-8?B?SmNLQ29zRUJQUGtMTEh6akNPSTFVdi9PcHN6enIrVzNiSk8vbXBSYnVKOHVH?=
 =?utf-8?Q?AgRqjqgqro4vojCnhF0YKZI/gsf4qUOU?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 11:40:40.8499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a98276-5934-441b-1eff-08dcb5436ef1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 11:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202991

T24gMzEgSnVsIDIwMjQsIGF0IDE2OjI4LCBNYXJjIEZlcmxhbmQgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1hcmMuZmVybGFuZD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICtGaXhlcyB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6DQo+ICsNCj4gK3wg
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL21hcmMvbW50L3lvY3RvLWtkZS9idWlsZC90bXAv
d29yay94ODZfNjQtbGludXgvYXBwc3RyZWFtLW5hdGl2ZS8xLjAuMy9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2luY2x1ZGUvUXRUZXN0L1F0VGVzdDoxMSwNCj4gK3wgICAgICAgICAgICAgICAg
ICBmcm9tIC4uL0FwcFN0cmVhbS0xLjAuMy9xdC90ZXN0cy9hc3F0LXBvb2wtdGVzdC5jcHA6MjE6
DQo+ICt8IC4uL0FwcFN0cmVhbS0xLjAuMy9xdC90ZXN0cy9hc3F0LXBvb2wtdGVzdC5jcHA6IElu
IGZ1bmN0aW9uIOKAmGludCBtYWluKGludCwgY2hhcioqKeKAmToNCj4gK3wgLi4vQXBwU3RyZWFt
LTEuMC4zL3F0L3Rlc3RzL2FzcXQtcG9vbC10ZXN0LmNwcDoxMTc6MTogZXJyb3I6IGV4cGVjdGVk
IHByaW1hcnktZXhwcmVzc2lvbiBiZWZvcmUg4oCYKeKAmSB0b2tlbg0KPiArfCAgIDExNyB8IFFU
RVNUX01BSU4oUG9vbFJlYWRUZXN0KQ0KPiArfCAgICAgICB8IF5+fn5+fn5+fn4NCj4gKw0KPiAr
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1zcGVjaWZpY10NCg0KSXMgdGhpcyBh
Y3R1YWxseSBPRS1zcGVjaWZpYywgYW5kIGlmIHNvIGhvdz8gSXQgc21lbGxzIGxpa2UgdGhpcyBp
cyBhIGdlbnVpbmUgcHJvYmxlbSBpbiB0aGUgdGVzdCBjb2RlLg0KDQpSb3Nz

