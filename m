Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFEEEB64DE
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 12:22:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web10.21998.1725970956240806279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 05:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Sg48SF9J;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Sg48SF9J;
 spf=pass (domain: arm.com, ip: 40.107.21.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=l/RcbEFxSJzNEiqOSR5KZJN3LXnGqxOyTIh3jD7K1va2stG0UtT2L2eDoVYEJ4S7HhGknCmR19ilEyuNJZ7hJSci61P3414MBYCixScnPJSsBWzK7PduFt4/UJEK+75inCNK8u+tVUL6iibF7uZxPFbKnfPT+c2g/bhTKpmEs75WkZYCEDWbPQLG3VFzdLCq5YXfqib1zKt4Yc/F+LwpI+I4PYSyqg5rjwyciUX6c7BNw7Z5bp/AcoWNNUBhw3wr9TLeRILRR/IJmC8gQto7BZe8MyiQmeQPzpJJFnJ70JYuV0zFO4UDKXTdIowsR4xMBw86GjleRCBNAC8Vyiz9Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuPjZHipbLxcDex2AeacfeuhbCAB13I6KQzRzb4LKT4=;
 b=MfuZ9kUL4EgaVrgO8QRHGkQvG3dA9vFTG7qC2ltSHpDeZDDPzFWIKFJ5uFhMIIbSIPMxb8JRnUlsO0BFs7zxJdzgCFzBMyiJWx/XUKYsoSzI/NxCHWgOIcX0sFvjdRtWKrqQk1tSYMaiXkraM1k11rcQnvPMsXUIFHXeesIRusMhw6RWDpw68IWD5bkxRGNNzJY0MnhvklM73fC8JSEGNl+MlYd6f+44rA2CIxVAdoFGCajsJ8oJRi9/lT+taUFNRJuAc9RtEScJfn9Jh5otV9rINFEkJFz//NsVXT0TvSfaKQvXGZpB8uRHsaGXdGemnE3aygq+XgZQcKNTLy9HXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuPjZHipbLxcDex2AeacfeuhbCAB13I6KQzRzb4LKT4=;
 b=Sg48SF9J5s7VXFk9lWH5fMRpAB4ymwwscxIg782PdaUIpaQUA1NChxyV1tMURO1dQ5Le+40Z6Dfc+NRqDPSdSb3VrBjHnUFPZi6OWpZgg6QhhIums5Kb4tzIV0g5b0PzktRy6x/LsJo/tq5X7bhMxvPfO+vv02uIU024f7ZkiY4=
Received: from DB8P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::13)
 by AS8PR08MB8276.eurprd08.prod.outlook.com (2603:10a6:20b:56e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Tue, 10 Sep
 2024 12:22:25 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::a1) by DB8P191CA0003.outlook.office365.com
 (2603:10a6:10:130::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Tue, 10 Sep 2024 12:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 10 Sep 2024 12:22:23 +0000
Received: ("Tessian outbound 98d42a42832d:v441"); Tue, 10 Sep 2024 12:22:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: db09c335b4a03464
X-CR-MTA-TID: 64aa7808
Received: from L3f1a6e92cfcc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF0172D8-9BA7-4828-9617-BE3AAAD5E4A0.1;
	Tue, 10 Sep 2024 12:22:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L3f1a6e92cfcc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Sep 2024 12:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7V4gVB1gUt5kBK4KgROVos/9QKSxF+I6jTS/wO7OM2Hy8eRMcSKHc/mhn2ahWfaTgsT6fWe97z6SZis/fgbmh6TpzIs5F9EVYYiepC+soTaQ7h9aSixyL1vHOxzUdVhYyluBE5Z/Ov1ifdIdsJ5s4vOooe4EihYBhiQv43DSOByLWTjapU3JNorZv8+TxwRiyrnQfcWO6gEnS1jat1ramvTCUf5NhJOFKX0yGX16JLTppF92Wfu48mAEjopDYYewtaNEKD0lLmupXP95s7WVns3hawr5HxslahQK6tI1NYP/P5E6FjppA60WH9eIKPH3a7SRZnBQhlv5nICkkKlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuPjZHipbLxcDex2AeacfeuhbCAB13I6KQzRzb4LKT4=;
 b=ZRJwWqtFr7/KJDVwCzo4ergXT8V9JXrmCoCf4veE33aR4p7RxMmCMjkV3VeyUWQJqXSkKg4cHXQ77+esICX3qvZ7RB+waam73murUjcWH8rpvjRUti63WwJ5tLLVi6xlJ+piZwm6yfnqKNhTM5C/66jJNkg2J91/yO43nQK2mxdETc1Bt5fjlnY2cTTDnVCrL75add4RTX+B+Ylil9rrMM6Of7ynGABO/tHqedqGUVCNAHct/cE61wK5hlfBYPAFjEHJvNnLI4HcKqdc4nr9DJualLtZzNv1VP2xbGynAxzPUfK3I+KG+8IaZW3VbPlEpPHyaX0Cqj26lHLHfP8hBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuPjZHipbLxcDex2AeacfeuhbCAB13I6KQzRzb4LKT4=;
 b=Sg48SF9J5s7VXFk9lWH5fMRpAB4ymwwscxIg782PdaUIpaQUA1NChxyV1tMURO1dQ5Le+40Z6Dfc+NRqDPSdSb3VrBjHnUFPZi6OWpZgg6QhhIums5Kb4tzIV0g5b0PzktRy6x/LsJo/tq5X7bhMxvPfO+vv02uIU024f7ZkiY4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8393.eurprd08.prod.outlook.com (2603:10a6:20b:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Tue, 10 Sep
 2024 12:22:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Tue, 10 Sep 2024
 12:22:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] vulkan-samples: Disable on 32bit ARM
Thread-Topic: [OE-core] [PATCH] vulkan-samples: Disable on 32bit ARM
Thread-Index: AQHbAxuysPQXOq/OiEemebfifbVVebJQ8dgA
Date: Tue, 10 Sep 2024 12:22:09 +0000
Message-ID: <59590CCB-55D5-46F5-86F2-6689B3BDFA68@arm.com>
References: <20240910005158.1797671-1-raj.khem@gmail.com>
In-Reply-To: <20240910005158.1797671-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8393:EE_|DB5PEPF00014B91:EE_|AS8PR08MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 75de2415-0453-48bb-b601-08dcd193397c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bXJ5ajIyT2t6NHhrM0h2cDg5SjBrOEFQVU5ZRzJpMFgyNGtxaTBJbzR1ZVcz?=
 =?utf-8?B?Tjd6dk5WZ09LQzMzMmkyNVh0Q29zVlVNdGJPUDE4ZlIxVzJBRkdDMmQyWE9v?=
 =?utf-8?B?NXQ5M2h0c1IwVWM4cURCT013RjFCVFFHOFhOYytEUXhGdXJhTVZJTzRpUXNE?=
 =?utf-8?B?emlPa3RLVWc2eG9hb2NVWFRGSWFybktaQWZhSnVqaE5NNzh3VWZTeEpSdTRn?=
 =?utf-8?B?UnR3aThFMUdaTWtmNjVKSll0U3lFaXk2RDBWMXA3YXllbnV2cnh4YWQ3VkNp?=
 =?utf-8?B?Uzl5aFJ6ZW82QittV2h1bk1JOVJjQWlCbnZaNkZUdUFubzhJQVFZUUFVaGgz?=
 =?utf-8?B?TDdGR2xzcVNHYVplN3VSSG1kb2llQW5PVklxdTNJSVRYSC83d0E1a2tuOFhs?=
 =?utf-8?B?b3RLdWF0cjFSdi9MVGJOU3FFSllBQldvYlovYXVnUEYvRDFZZUNJZ1Q3cFAw?=
 =?utf-8?B?Z1dMNEk3ZjBQZXhQSWoyR3RGSkF4eEU2bGx3NGk0ell3dUlmQUJaNERBWnBZ?=
 =?utf-8?B?UHk0MTRoVzlPdkFsRUoxRGhVbFE5OTFQK1hZZ3JIZThzWjlTQXFqQ1RtYUJq?=
 =?utf-8?B?SEZjWGJJYmZFeXRueWl4SGVEQyswMVRHRjhIdmM1ZjF0UnZZQ3JBaFR0WndU?=
 =?utf-8?B?T25VZVE0bWV3UXQxNzhFT1Y2VCtMd2pyQlVZbG9FcWpiUGg2RVd5eEFDa3Fj?=
 =?utf-8?B?OVZXYStJRG5wQzlEbUowNU1mZ3F3bTdib3Qzd2JDbXpZLy9EZm9vLzZ2WTRC?=
 =?utf-8?B?R0t5bFZBT0J6QXpjMnR3d3h5SzdTSy9YazVHTzlXZFZYd1VaVit0OTlDMG1y?=
 =?utf-8?B?UnRXV25KODBSRnRwZ3Q2cGt2WU9EanBuUU5MQWpNd1phS1ZUOE45N0JZdURn?=
 =?utf-8?B?OUlUeS9icXFoYThBbVNvQjk0OXNjMmowdExZMEpHYm45cCtDb3Z4UXdNS1Bw?=
 =?utf-8?B?TzIwUUNhdmJjQm1ITlBqOEpTZ3JySkRHa0JNTFdkTzMwV0RsbkYxbE9sc0Ew?=
 =?utf-8?B?RjR4QXhBSWdWYlJUczlXalBITWdCblRqU2hITVkraTVONy9iUFhObzR6UXY5?=
 =?utf-8?B?cTZaNFkvQlFYSVh6dFJaZEVCM1Q3UXV2OGpjeG11dkhhOERkUnJlaVV4ZVpj?=
 =?utf-8?B?N2tERkFjdnZaVmxLZncvWFUrSm9Ka2duZmo0VHMyWTViYm9Cc2plTDI4SStR?=
 =?utf-8?B?ckZ0bzJjRGNMMWpaTTdXWHMwTW9jM0NRNE91MmJRdEl6dGMxWGlkeStTbzRR?=
 =?utf-8?B?OEtWVGF6RXkzRmR3a0Ivd0hWd2pJMEtIRDRLdm5Gd0ZMSzZUMVJwRWF1emFC?=
 =?utf-8?B?emw3QU4xKzZHRW1yNXRzaWsrYmh6bHhJcW5NL3RkaFNpWm1LOHE2OXd4Q0pj?=
 =?utf-8?B?YXptV1J5MXFmWUJsT2E5NFRZZDBnRGkrNHZwbEVnTmluc1FmcmNQWmQ0d2tQ?=
 =?utf-8?B?aXZ2TkllUFhMV0lJK1BJWmt6OE81Y0F5WTM3c1FMZHdtVjVhbkljeXgrWXB5?=
 =?utf-8?B?Nm1DY0xHem5PV2liUS9hUFA5Uzh2NTZiaUNQMVlRY1JQTGpKQjJiaHd3ckpR?=
 =?utf-8?B?dWhuSGNOSWo1Z3hScGhlNnpCdmZkc3JCZVUybXFuY29kV09WRlMxTEVCcTNn?=
 =?utf-8?B?Njlmb0R4dmMrSUg3THA3YjR6TS9PKzVLa0IvdGtaaUc5akFtSE1tUDlRVHZF?=
 =?utf-8?B?aHFxKzZuK2MrK3IzMVJFMkg2cXIzeVFyYW1DbU53ejVFWEkycVRHWFRCWFIx?=
 =?utf-8?B?bENZK1VYMFBQQkl3QzROd1RhRkVmODBMb3hyajdyQksxZU9wTHlDUDl1MmJT?=
 =?utf-8?B?RzdzSkhUejFoRVJ0eEdxRkxwRHJsSzZ3aERQcmhCcGRmY3dXSVlRdTNxYWpX?=
 =?utf-8?B?d2R5eWlDSCtYZ1lnN3R5cHMyVEQ5b1dHbTNWTDVJZk5qanc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED5B9F76422FA34594FC84CC3933CE4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e03c4352-b07b-4fe6-52a4-08dcd193312e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkJweWd0N25jNnA1RjEyQ3NoU0lkTndHalVjTU1YZTVia2k5QmgvMnVEbkk4?=
 =?utf-8?B?QXlFSXJINEJsaUVpSXhWczgyemVPbVlQU2RuUG1aamFDdWZ5Qmw3aUQxSXhV?=
 =?utf-8?B?YklJZEVaNDRGaUt3T3R2YmMrYVRUbTFMMkNCdHphc2NqalE5Qk9QN3FXWnpH?=
 =?utf-8?B?V3RUbnR0ZEJ3NW9HTCs4REljeDdUZkhyeDg3R2lQU3pScEVKRHFZeWZxNUcw?=
 =?utf-8?B?dXV2VytQcWdTVzlJYnZUSXJmTkxlZ3lpMFZZMjBWbDVsaHpaN2pnLzhOaU9R?=
 =?utf-8?B?dzBBUE5OYmlvRklkMUcveWIzYnFIWWRrNWU3QVd5U0dscTBqb2x1S3dpOWtx?=
 =?utf-8?B?Uk9QV3JHZmN6WTZLOEF4UUgzL2RYOWZRZzlySmdaeTg2enVuaTRjS0VRL201?=
 =?utf-8?B?U2tNdm1WUTNGYVNEWHZWWmx3QVYveEhlSk9WNVhFNzJZZEozY2JCSlk5b1Ro?=
 =?utf-8?B?WTZyWkFrUjV4SFBtYmNyZnlDd1pCVFlLREUrUmIrODUzNlpXUlVsZmEyWnk2?=
 =?utf-8?B?S0xhUmkreUVyYzhSaS9ja2JrZ0ptVCtFUjROeUtHY0p4S0tsWHZ1RzJsR1Fq?=
 =?utf-8?B?dFp5eVZzUGFaYmtjeVVoZnpad0g3UlRLV1BUUElaTHN1V2ROYnhGQzl5b28r?=
 =?utf-8?B?cWlYN2NaSk9oTkhxL0x5VW5xUFd3T05aSGpVa1pocENnUkxKeDBpVE9CNDN4?=
 =?utf-8?B?RmlmalRDQWdmYWRza0xmZ25oTXdybjIwZWJVd0dGbld4SDZWeitCZGFYVmhq?=
 =?utf-8?B?eGVsU2VMNzJtd3JMNWkwOU1LUDdXekFNb3RFNmFySmF1ZjBvVjMwOUFVQTl4?=
 =?utf-8?B?WlJWMnh2elVlbEpUMFlTeHJQYlljbFNRbERLdldkaUx3MVJOUi9maVN6OWVH?=
 =?utf-8?B?VjMxZE1sbWhwZmRtM2lNOFdlMytoVTk4TXFMbktzL081Y3VyQ0VjNUU4aldl?=
 =?utf-8?B?SmQvRGswV0JSL3owaExrRXZPUEhzQkhlVTYzUVpQK1VzUlJ6M2ZOR0hkeEp3?=
 =?utf-8?B?ZmNFUUpsVXN2MkZGS1I2TDlHTEY4UW1zMGhRZVhQSmc0QXBwQjR2aU5RZ0tM?=
 =?utf-8?B?WUx5Q0pzMmpraUovQnpKeUxaNHpGZFZWSGI2RlM1WVZpUkZFKzJoclpkbFd6?=
 =?utf-8?B?d3JUbXIyZ3hnV1dCdkx0bHFLMlhKZWo4NTlsaVBUYitWMEdnVzNiYlFScnRM?=
 =?utf-8?B?S0lWZkpWQXBuODhZMlJQaWttTU9Yb1R2NkRvNTRCQlJiTWVrSlgvZHRmaXJG?=
 =?utf-8?B?Q2hVNzhvKzJ2TFgzRFAzWUg5REZ0RFF3NFRESk5YUVQ0aUZqYUgrcTRiVU4z?=
 =?utf-8?B?elZCQVdnaGtxdCsxMjJIcHd5MWFhaHFwUnl2dnJLYUpmSmxzeEN0Nmc0M2U4?=
 =?utf-8?B?YXZ4LzNMM0U5NXd0SWJ5b2t2UG5SY3JNSE9sL0x5L2lsYW9HbEFRbTNDaHZV?=
 =?utf-8?B?VFUxaGluMUdmUEt1RGZXdEt3cDhlUTJ3eHhTVmJJM3FvY2YyVkRJbFN6MVdZ?=
 =?utf-8?B?VktDem82MWNyaHNCNWRKdjZEUlYxVWZHYTdoekkvMTlQdEZveEdlM1FKRjZl?=
 =?utf-8?B?NUl3UFVYNGZBd2ZxNGlObm1rZHhvRGhJUjI0RXRoOVhEaWJjWjNXNVFIbFEw?=
 =?utf-8?B?bXR5L0pTcVR5aklUS2FMT2N1bzUrTXJtZjRjdUx0SG1UNHVvWGV1aTJER05o?=
 =?utf-8?B?cDFMYld0aS9Bcm5XNGxRR2ZzeEtaVmhQbU1peGFpVkZhTG0wb3Q5b0FDNHpB?=
 =?utf-8?B?a2N5TXlwZitMaXJJQWhXYktyVXRxSTRPQ09DaFZCSzJ4T3E5dVBFT1NWUVBE?=
 =?utf-8?B?WFJ1T0JsaXliUXpMVHR1Y0YzdnVFakZFMkxHQUYyN0ZwM3psRjZCUVRhTlF0?=
 =?utf-8?B?YzNWN2NDM2NwTGY3RU9SRWxiRDdZUHFOTmQ5eDVvMVJaYUx5Z25oZVRyeGp0?=
 =?utf-8?Q?9g9URj0m9mZV/xr2FoH7z0O/3JRXyBkZ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 12:22:23.4483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75de2415-0453-48bb-b601-08dcd193397c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8276
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 12:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204348

T24gMTAgU2VwIDIwMjQsIGF0IDAxOjUxLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gdnVsa2FuLXNhbXBsZXMgZGVwZW5kIG9uIGF0c2MgbW9kdWxlIGFuZCB0aGlzIG1vZHVs
ZQ0KPiBvbmx5IHN1cHBvcnRzIHg4Nl82NC9hcm02NCBhcyBpdCBzZWVtcywNCg0KSeKAmW0gd29u
ZGVyaW5nIGlmIHdlIHNob3VsZCByZXZlcnNlIHRoaXMgbG9naWMgYW5kIGp1c3QgbGlzdCB0aGUg
cGxhdGZvcm1zIHRoYXQgdnVsa2FuLXNhbXBsZXMgYWN0dWFsbHkgd29ya3Mgb24uDQoNCkZvciBl
eGFtcGxlLCBpdCBhbHNvIGZhaWxzIG9uIDMyLWJpdCBwcGM6DQoNCnZ1bGthbi1zYW1wbGVzL2dp
dC9naXQvY29tcG9uZW50cy9maWxlc3lzdGVtL3NyYy9zdGRfZmlsZXN5c3RlbS5jcHA6NTI6MTM6
IGVycm9yOiBuYXJyb3dpbmcgY29udmVyc2lvbiBvZiAnc2l6ZScgZnJvbSAnbG9uZyBsb25nIHVu
c2lnbmVkIGludCcgdG8gJ3NpemVfdCcge2FrYSAndW5zaWduZWQgaW50J30gWy1XZXJyb3I9bmFy
cm93aW5nXQ0KDQpSb3Nz

