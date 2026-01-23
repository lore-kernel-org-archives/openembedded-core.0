Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8194D778AA
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 18:08:19 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1713.1769191690973197631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DFTjVHnb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DFTjVHnb;
 spf=pass (domain: arm.com, ip: 52.101.70.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Gky/D0fi6W51PRtoO/WaSj1Gp0Fi45shKewg5bPyYdAff6hF6MiQsArN7A9uZyftIB9Brhv06m3URvVgoEgTZSv2Zfa0q8hbBFE23A0hUdKn3B6jI0V5s68pkNKwXK5ctJ+bQOheOrDe19iVBkWyMng8nwLa+oWDhCiDY5wCYPCRGZi1ZnngOTtMLnGoyB+OaOhghWv+FGirMxuLHsr3XUpzJqReuZ9KLYEqj9vMqsvXojt6nG6GwRr1uuuiqrMq44ksV/OunRVKAxW0hQswiYEewqvU+Y9nmrmZ28ZiVydYsOE5sM7GegidUN+SXZjk5uY29zpai2gXfvlMpf6dzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zDjuFCVbwMsq/MWj/cpY1f3QYD3xYpLiUWEUm2389E=;
 b=M3H/HunZBvalTuVwjx4TAzK4Hpg9pgMJiRda3gn7K8MSUHXcgdclSlc8PLMLSjQoEMFSlyf9/ok2Uuzv/wVF3V0mOGTTsT3Ltg4qfPup9QP3LRJhwVbmb8th3Ug9hJIwdT9dPcXFIFoBR3YlHXKcDMyOslFAzK4D167YahTpGfAFyX0UnNLMWQfU7mMG0T/TWDFy1xm2zH8u1kMNgwRVDQALjXi3Ql966EMZS8WaNo5oEO9G+tD761mAO17O8Zmd5nzKIuJFIJIQGxKa6UEJFumIudizdxX5l31iZFRf2kFXy5+7XoYJ4iMPdCmTxwSBzDblgQNvp0Rl/YV4VEjUqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zDjuFCVbwMsq/MWj/cpY1f3QYD3xYpLiUWEUm2389E=;
 b=DFTjVHnbFfr1HL9tUSaqtYdGVHgHPjNMFkvrio3jdCjazq1OTHP9WJzcZwwdfgKpUx1WFuLu3S4/C3r1acMyHz6VoSm9FBUE3gXqIBObTZUZZwUqo80yAr1BIVNsfhgrEBeEdn9Z3oxDQOB7Na7v3BU+X5ZtyfPx0V85axLBeXQ=
Received: from AS4P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::7)
 by GVXPR08MB11469.eurprd08.prod.outlook.com (2603:10a6:150:2e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:08:06 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::32) by AS4P191CA0007.outlook.office365.com
 (2603:10a6:20b:5d5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 18:08:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 23 Jan 2026 18:08:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJ/yHKqACG0K0e+jeaZh4Hs+tq3OjEGXpOYyf8zXyzLCmR9LWY1NtzSpwxo4t++Ie3+K+Ijw9JOmhT98mGxh5JcOpyn14H9yRDFNAsZA6oQ2VyoXb7TNAMr1zWITp4rtLIqnRz60WPINLCwzae4F3OpDrwPrF9LFxEPws5/REMwR8nb3UUnxxR1oqSq+C2HdseZ7ZJgVNt97PoTBiKayF6gj9FW/bxFQvb7dS8gKjGCJYWnMswD6N+BJJlcW2cDUw3TaPJmCms8yzL5WIVvig2y2+Et7hGSAfKUURpttEcyQRlKh/6Zv1N9YljplZd9CjO83m/gXjznSC154AUny1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zDjuFCVbwMsq/MWj/cpY1f3QYD3xYpLiUWEUm2389E=;
 b=eCnlDMJJYovgolv79PwCYToC1xci+zFe53t/6/nubo65+XClIUDFTixX+qsv0ldzsU37ot53/yAwCILkVibBMmUJ51gIq30zpajMdQE1fCTQWVdzBnDQ5tSd/0yOs+lXfGHxv4Hg5GGz6aVeewjQhT5JuHrf+wtdEQBEbH6GooLLnZqb2C5qQuFQFRD14xrPBn6vehDkqL64XfKejsgCTQJ5TgGcsKOgaqGdcEGNzuVT56sBpm/m281lZGMIqVyd5Fih0+aIeLAxd3X7pNYyu4f8MUbQYFb2ow8hSWG3pqr7xvkYH5FFBQ67sT2yidxNjj9/Y7b9tphG0nfEkfZCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zDjuFCVbwMsq/MWj/cpY1f3QYD3xYpLiUWEUm2389E=;
 b=DFTjVHnbFfr1HL9tUSaqtYdGVHgHPjNMFkvrio3jdCjazq1OTHP9WJzcZwwdfgKpUx1WFuLu3S4/C3r1acMyHz6VoSm9FBUE3gXqIBObTZUZZwUqo80yAr1BIVNsfhgrEBeEdn9Z3oxDQOB7Na7v3BU+X5ZtyfPx0V85axLBeXQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:07:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:07:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/8] Rationalise the pkg-config variables
Thread-Topic: [OE-core] [PATCH 0/8] Rationalise the pkg-config variables
Thread-Index: AQHcjJLLBrJzG6f/MEm0kwbCd6iDeLVgDPQA
Date: Fri, 23 Jan 2026 18:07:03 +0000
Message-ID: <AE6986B5-2283-4DF2-9745-E489F9811E8F@arm.com>
References: <20260123180448.2997378-1-ross.burton@arm.com>
In-Reply-To: <20260123180448.2997378-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7573:EE_|AMS1EPF0000004B:EE_|GVXPR08MB11469:EE_
X-MS-Office365-Filtering-Correlation-Id: 500bf3e5-f025-453e-5d10-08de5aaa5b68
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MHRMVnB4UHRRbnRROVE1L2I1bXcyWm5vMm1oYkZkaEg0eE03WHA2dS96Y2NM?=
 =?utf-8?B?akZzQjBNRy9nbWl3OEhFQzU0YkwzZjRyckdKZS9aY3J5ZGxleXZSd1hSYnZj?=
 =?utf-8?B?UmdsOGl0U3dlUXNaSDZkbU5Ta045VExvaFBHTlQxRHF5dnFwK1psWjNPSE1a?=
 =?utf-8?B?THlwMFR1TWF5dWR2WnBMNU1aOCszcFVSRFJJbXpLTlFxT0h2YnlIRXFzdnZ2?=
 =?utf-8?B?N2dHM1RmU3BKQm5pUldiZjl3ZjBpeEVianRYbUFwbVVyOE9rb0VGUFNBUUdR?=
 =?utf-8?B?NG9tZXRhSmdxWk9BZFpMNk5veENOM2twRExEdWtxamFGNTdWS2l1STBtcnl3?=
 =?utf-8?B?VUFiM0ZuVEdNYUZHTDJENGZwSmZ4ZGpHcXNMTU9sbFJkRDc1b2k5eXlZT2kz?=
 =?utf-8?B?WU5hSkdUdzJPbFVwRk9kOWFkZjJkSWVNOXd1QVN1czZQanExWDd0K3ZNNHpM?=
 =?utf-8?B?dkJrcWZnTGl5UzZYdjY2N0FXeVdjSjlTcXNYSStWSnBDL2NVdjJvOTNhS0Jx?=
 =?utf-8?B?VGFONWEwUGRhV3pzcHNCc2IyTU1NZ1g0U1h6YXo4VXllblZMeVdUNWlCVTJR?=
 =?utf-8?B?YjhIV3grYzJucGYxZUd6OUxZTEFYOElKWUU3R3UrR0EzRXJ4dEJyS000WjRm?=
 =?utf-8?B?ZEZVMy9PSTBkY0JlSVJqbjZDSnk1QVRQRlpKQktrMnB3UGt6MjVxbTU4QVJ1?=
 =?utf-8?B?ZGN5TFgyQ3ErS3QrYzRobzBxelhCUzY3WUhhRFlPNUxDRXR1cHJWS2FyNkl3?=
 =?utf-8?B?NjhTakFQMWpqU21TeVBWai8wMWRnU3BLL1VLc09xN1RQNzFFQWpWUGJndktX?=
 =?utf-8?B?ZWFoY0pKT2I4V0VSVkl6dFF5dGNwZzJkV2dVR292ejVFZWlVK0xkZFBOSEEx?=
 =?utf-8?B?Y0dDTnlKTndEQVdyR05lVDZ4TjVOY0R2MEJqU3FxaGlvMi82L0lpSUhLTzhL?=
 =?utf-8?B?eXR4WFlrcFBZSkJNUEV2UnVVTWJGQWFYam1icEp4b1ZFWGdDeDkvS0I4Vjk0?=
 =?utf-8?B?UzE1VmpvL0RZN01zaW1FeXJhUXIyR09qT3JLbFRrYnVCVzdqRnBKM0hZNE9u?=
 =?utf-8?B?VjFWaDZzMjRTRTJzNDVaMlNoK0xkb3VzU3VDOE5Sb3lDOVBpaDFvYlRVdkZC?=
 =?utf-8?B?YW4wWkRRYVpSbnhoWDVLZEhOZFVCZUJuVTVMd0dJVWt0NGFpQ0Jtd3Awd3Ro?=
 =?utf-8?B?M245a2dPVSsxOXJ4bXhLNnp5emJhb1N3SDZjMW9ObjYrWStHMzkzb3RURFQ4?=
 =?utf-8?B?QTJNYlhqdnNoTmRjVGRMTDZrZ2pRekVEVmZOVUNsSUtva1A0TVpaWUNRODlY?=
 =?utf-8?B?YUNSVGxMUldLYlZ5UlFaR051dkpoSSs1VmRZNjY2VkdiaTdSTnZsckcvWCsr?=
 =?utf-8?B?ZVVjekFLTnA3R0UzNU5rUDByWGZoS1p6SmpCL3pQcGhmM0F2dUd2a2hXb2Jo?=
 =?utf-8?B?N0JiRDE0Vk5pWFpZTXVPY3NsR0JScjVOWU5wWjNmNFpUa3UvZTUxSHljcWpJ?=
 =?utf-8?B?SDlpWlgyVlZJWnhCMUhYbXg0YnArTnljNXFRNE9xbW85emJQZGc1WUI4RTFV?=
 =?utf-8?B?RFJIL1I0aFZoQWY2TFZTOXFiVzR2VU5INVJQcGxENXVmM3dYYVZ3YXNERDJR?=
 =?utf-8?B?aTNXQUlwV29aVGtDWWpYRHR1dTdDMU9yeG5lU20yYVE5SzhNaWlKaGU3cnEv?=
 =?utf-8?B?VmVFWlFaZUZKYmkxK001SmF3WElDclFyWk9Uc2xBSzhKd0x5WTJibnRPTXVx?=
 =?utf-8?B?REJoQTVsb1NHSGp1d0djSC96TGlXcTdoamdpUE5adGZtZUtlU1dVekQzYVM4?=
 =?utf-8?B?QktJTzB0ak15YUlxT2lrSEFlakY0aXhuL0x2RG82amlPYlhOemo2NWkyeEs5?=
 =?utf-8?B?dGFHMktnUFhxY05OTmJUUDZTd0dnblVCL3RVemEweWRBZy9aWTVRbDdZdjJt?=
 =?utf-8?B?Z0FhYmNRWTVMd2QrOTRFeEVnTnk0UjVLdFJWNUgvc2RFTDYzSGd4U1BhaFlw?=
 =?utf-8?B?ckplK1dKd3hycDFJNXVNc2c2MzVtUjdrUitjRWtVWUZYbjdneE1wR1JJbkNS?=
 =?utf-8?B?bkRzcXliZmwzMjlwV1FLS1Rhbi94a01hdkhRN2lwc2xuUk9xVUlrU1QzclJN?=
 =?utf-8?B?enhxUUdmMjgwMXZIamdZb29LUGJ0MmRUdFFJYVNER0VvSU9VVFVOVlBtcmc1?=
 =?utf-8?Q?PKdRfFs8+rQ+fC24hWpuLqM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BC4B27329E7D2409A11C579B798587C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7278fb8d-d652-4a30-cd9f-08de5aaa360f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|30052699003|376014|14060799003|1800799024|4022899009|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eGF2UVB4Z24zYjUwMlB1K2swL3Z2V1VXeHVXNWlzKzZNeWxVOU1DRFNKeEVx?=
 =?utf-8?B?RUMzTE56ZjZ2L2djNlZXM3NzMVFnbXpoNnE1dFMyS0pFcjRFL01ZM1VYa3hh?=
 =?utf-8?B?WkdURGhjMHhoZ3hQTlZ6bHJ1YzUvN3Q0MDZwTm41aC9Oekc2dnNhTzhjcFJH?=
 =?utf-8?B?VW15SGpHbmxybVFyUHhqQVE2OGh1K3VwVDMxNmQ3eUkrWWptUUlEQ0pQRGp3?=
 =?utf-8?B?VG84SC9NRFJxZkdibTk4WkFvdUhTc3FrMFJVRXpiUlQ0YXI3WXk5Q1ZnZ3Rm?=
 =?utf-8?B?ZjJHbUFreE02THhhckt0VU1pcER3UjRVYndjZlY2S21QRWRtU2tXNGw3TjF6?=
 =?utf-8?B?MU1GVHBnak5FUlZQSzRBdHBEOGtMQThuK0ZsWllmNjBCNDRRcmM2TnExUlhy?=
 =?utf-8?B?WXU0WTVQT2JNMlYvWmlveWJUL05TelFZaTg5QWtSbU5qVG03SmwxdFBzdk1l?=
 =?utf-8?B?THh1bGVULzQ5YkFKcTN2Uy9ORHpGdGY5YUtGUVgzVnk4QzJhYjE3VzlYK2F5?=
 =?utf-8?B?YUMrY1JUVVlEeVlFMThXSDVLQzlzdzdHNWpLMXk1SW9wWWNFM3JkN1FGTk91?=
 =?utf-8?B?S1k3aVlRSlVrN2REV0V3Q3pJTVRiVUI1QkNwLytjRFVHNFhVQ25uWkFYQUU2?=
 =?utf-8?B?dXdrL1U1a3ZDNWJjSDZmUzl4T3VxWW1rL1dveXdTd21oOGIwcmhVaTQxT05t?=
 =?utf-8?B?bEphdlVxenNJOStZeVI4YVFvMEFkQkc2dnZJa1d3UE9CTzNkWmNRNFI5dDFm?=
 =?utf-8?B?KzJRdmhwbkJhMjFHSEhGVFN0Nzd6L2JHU2h2WWZQRzg4VVo2YjIzMWJkcVZJ?=
 =?utf-8?B?MzI1VjBuUmF3emF4M21WbjF4S25GcVFrbkNYT0tPYThoWDljSGs0YjNIUDZD?=
 =?utf-8?B?MS9PSVFZT0QrU2wvMkxwV0l3UHFRS3hPcVA5UkVFKzFlS0lsYnI3VW9YRXdV?=
 =?utf-8?B?TjE3VUVtWVBVRzhuaUF4NkJmcmUySnBCQkJ4SnMyQ0tJVTNYNktrOUZOQlJ6?=
 =?utf-8?B?bTVjRzRNcWQrUmY5d0hZUENXanh0bGJLK0RrMjVSYUljbVNselpqSnYvQzM3?=
 =?utf-8?B?dFFyWHI1cU9vd0pQcGtuWDFzMmVRTS8xa3AzbEw5UC9VZkl1TFVKUXBQVnVa?=
 =?utf-8?B?TVlrNkNORWxCdmc0dUkvNkhjZDUyRFh0Qk9kNjJpQnNzYStneEU0QnNvRVhN?=
 =?utf-8?B?YVZEWUU2R2h4d0M0R212TUhvZEZmRXBycmRmU2NrNzJ6ZzA2TExzZC9NN21w?=
 =?utf-8?B?YmhOUStDTTUzQThXSDdWcDhNeUVuYmJHb1V1VHZ1MVZJYVJHM3U5SktzZkZI?=
 =?utf-8?B?R0lLbEh3OUhRTjNiTURHOW8wMkNNOXpET1Y4QStWVkFhVS9yWm5tZWJ2ZG1y?=
 =?utf-8?B?RC9XcWdlS2dSZTZ0VkM5Q1lzZE9ZOEhuYmVweVJhQm5NdkhpR3p0d1FxWUN4?=
 =?utf-8?B?K1dNaDI2MTYxZjF0T0pZOHdLdE9GYjZHU2N6cTROU05yWFpYU09JTEhkdTZV?=
 =?utf-8?B?WVRDYVp2bkNrT0M3RnJGcW9OdkR1QjFHeTNwUDEzMVZXdWphSllyakhYc0RV?=
 =?utf-8?B?M2RsRWpCWHNINGNPL2dxaGZ4eEZSNHlsL3JkMXh0MCs2U0JnTDJQaDJpZy9z?=
 =?utf-8?B?aTVwckZhL2Z6Q1hxMWpJN1p0UGZaYkpIQWEva3BJaXF2Q3VDdDNUcnBucDZa?=
 =?utf-8?B?OWV3Z0UzQ1dZODdFVTUyazFtN015T1h2WE93WU5rcktXVTJHSUFvd0hRQ0dK?=
 =?utf-8?B?bzR0Yk1RZTg5R3JiZ0ZMcTJnZitsRDdaS0lLVGF0SEphTmJ6SG1pTDBBM3BU?=
 =?utf-8?B?ZTFwM1ZVSHNqK3BDRzBidEYrRDEycHRLelB6Tk4xNkQ2M2doUFJkOEpKV2NX?=
 =?utf-8?B?MWRQNExxTHpvRXhoZ3QxaHBFL0xIZXo3NDBMZFM0ZFJ5T2Z2ekgzbUJoRjdQ?=
 =?utf-8?B?LzZ4TXZlRk5nclBtbUQrclRVL1hHWmR5OU03YVAvYmhLVlJiUFVvdFBIYUlJ?=
 =?utf-8?B?citoeWNqNjlKVWx2YmRJeHB2U2pITjZMbDBBMHR2bGVNczEybDd2UU4vWC9G?=
 =?utf-8?B?VWI5eUZzNWZxV0dsRExMN0QrbVhKZGJ5eVJGMXBOK2RUOG1wYjliTFFKTTBu?=
 =?utf-8?B?bzZuc3lVRERia0wzUjI1MUlNOG90dVBJTExsQUp0VUhpTytpWFo3dHJLM2ha?=
 =?utf-8?B?RDkybWJVUlV3NEV5cUpOR29PNm14SHAvODJyWjhOZUg0TXh1NlFZcFJUNDV2?=
 =?utf-8?B?WFkrQU4rTDZFSjgrOHV1TGZEcmRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(30052699003)(376014)(14060799003)(1800799024)(4022899009)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:08:05.7374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500bf3e5-f025-453e-5d10-08de5aaa5b68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11469
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 18:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229912

SGl0IHNlbmQgYW5kIGltbWVkaWF0ZWx5IHJlbWVtYmVyZWQgSSBmb3Jnb3Qgc29tZXRoaW5nOg0K
DQpJIGRpZCBhIGJ1aWxkIG9mIOKAnHdvcmxkIGNvcmUtaW1hZ2Utc2F0bzpkb19wb3B1bGF0ZV9z
ZGvigJ0gZm9yIG1hc3RlciBhbmQgd2l0aCB0aGlzIHNlcmllcywgYW5kIGNvbXBhcmVkIHRoZSBk
ZXBsb3kvaXBrLyBkaXJlY3Rvcmllcy4gVGhlIG9ubHkgY2hhbmdlcyB3ZXJlIGluIG1ldGEtZW52
aXJvbm1lbnQgYW5kIHRoZSBweXRob24gYnVpbGQgY29uZmlndXJhdGlvbiwgd2hlcmUgUEtHX0NP
TkZJR19QQVRIIGNoYW5nZXMgdG8gUEtHX0NPTkZJR19MSUJESVIuDQoNClJvc3MNCg0KDQo+IE9u
IDIzIEphbiAyMDI2LCBhdCAxODowNCwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPHJvc3MuYnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBIaSwNCj4gDQo+IFRoaXMgc2VyaWVzIGNsZWFucyB1cCBhbmQgcmF0aW9uYWxpc2Vz
IHRoZSBwa2ctY29uZmlnIHZhcmlhYmxlcywgd2l0aCB0aGUNCj4gZ29hbCBvZiBmb2xsb3dpbmcg
dGhlIG1ham9yaXR5IG9mIG1ham9yIGRpc3Ryb3MgYW5kIGxhdGVyIHN3aXRjaGluZyBmcm9tDQo+
IHBrZy1jb25maWcgKGxhc3QgcmVsZWFzZTogMjAxNykgdG8gcGtnY29uZiAobGFzdCByZWxlYXNl
OiBKdW5lIDIwMjUpLg0KPiANCj4gSG93ZXZlciwgdGhpcyBzZXJpZXMgZG9lc24ndCBkbyB0aGF0
Lg0KPiANCj4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgYXJlIGFkZGluZyBtaXNzaW5nIGluaGVy
aXRzLCBvciBmaXhpbmcgYSBidWcgaW4NCj4gbnVtcHkgdGhhdCB3ZSB3ZXJlIGx1Y2t5IGVub3Vn
aCBub3QgdG8gaGl0Lg0KPiANCj4gVGhlIG5leHQgdHdvIGFyZSB0aGUga2V5IHBhdGNoZXMsIHNw
ZWNpZmljYWxseSAiY2xhc3Nlcy9wa2djb25maWc6IHJhdGlvbmFsaXNlDQo+IHZhcmlhYmxlIHVz
YWdlIiBpcyB0aGUgbWVhdCBvZiB0aGUgc2VyaWVzIHRoYXQgYWN0dWFsbHkgY2hhbmdlcyB0aGUN
Cj4gdmFyaWFibGVzIGFuZCBjb250YWlucyB0aGUgcmF0aW9uYWxlLg0KPiANCj4gVGhlIG5leHQg
dHdvIGFyZSBpbXByb3ZlbWVudHMgZm9yIHBrZ2NvbmYgdGhhdCB3ZSBtaWdodCBhcyB3ZWxsIGFw
cGx5IG5vdy4NCj4gDQo+IEZpbmFsbHksIGEgY29udHJvdmVyc2lhbCBwYXRjaCB0byBkcm9wIHN1
cHBvcnQgZm9yIGEgd29ya2luZyBtZW51Y29uZmlnIG9uDQo+IGtlcm5lbHMgb2xkZXIgdGhhbiA1
LjE1LiBJZiB0aGVyZSBpcyBhIG5lZWQgdG8gc3VwcG9ydCA1LjEwIHRoZW4gdGhlIHNtYWxsDQo+
IGZpeCB0byB0aGUga2VybmVsIE1ha2VmaWxlcyBzaG91bGQgYmUgYW4gZWFzeSBiYWNrcG9ydC4g
IFRoaXMgcGF0Y2ggaXMgbm90DQo+IG5lZWRlZCB0aG91Z2gsIGFuZCBjYW4gYmUgZHJvcHBlZC4N
Cj4gDQo+IENoZWVycywNCj4gUm9zcw0KPiANCj4gUm9zcyBCdXJ0b24gKDgpOg0KPiAgcGtnY29u
ZmlnOiBpbmhlcml0IHRoZSBwa2djb25maWcgY2xhc3MNCj4gIHBlcmY6IGluaGVyaXQgdGhlIHBr
Z2NvbmZpZyBjbGFzcw0KPiAgcHl0aG9uMy1udW1weTogYmFja3BvcnQgYSBNZXNvbiBwYXRjaCB0
byBmaXggcGtnLWNvbmZpZyBsb29rdXBzDQo+ICBjbGFzc2VzL3BrZ2NvbmZpZzogbW92ZSB2YXJp
YWJsZSBleHBvcnRzIHRvIHRoZSBjbGFzcw0KPiAgY2xhc3Nlcy9wa2djb25maWc6IHJhdGlvbmFs
aXNlIHZhcmlhYmxlIHVzYWdlDQo+ICBwa2djb25mOiBzbWFsbCBjbGVhbnVwcw0KPiAgcGtnY29u
ZjogYWRkIHBrZy1jb25maWctbmF0aXZlIHRvIHRoZSBuYXRpdmVzZGsgcGFja2FnZQ0KPiAga2Vy
bmVsOiByZW1vdmUgcGtnLWNvbmZpZyB2YXJpYWJsZXMgZm9yIG9sZCAoPDUuMTkpIGtlcm5lbHMN
Cj4gDQo+IG1ldGEvY2xhc3Nlcy1yZWNpcGUvY21sMS5iYmNsYXNzICAgICAgICAgICAgICB8ICA3
ICsrLS0NCj4gbWV0YS9jbGFzc2VzLXJlY2lwZS9jcm9zcy1jYW5hZGlhbi5iYmNsYXNzICAgIHwg
IDMgKy0NCj4gbWV0YS9jbGFzc2VzLXJlY2lwZS9jcm9zcy5iYmNsYXNzICAgICAgICAgICAgIHwg
IDQgKy0tDQo+IG1ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLmJiY2xhc3MgICAgICAgICAgICB8
IDEzIC0tLS0tLS0NCj4gbWV0YS9jbGFzc2VzLXJlY2lwZS9uYXRpdmUuYmJjbGFzcyAgICAgICAg
ICAgIHwgIDEgLQ0KPiBtZXRhL2NsYXNzZXMtcmVjaXBlL25hdGl2ZXNkay5iYmNsYXNzICAgICAg
ICAgfCAgMyAtLQ0KPiBtZXRhL2NsYXNzZXMtcmVjaXBlL3BrZ2NvbmZpZy5iYmNsYXNzICAgICAg
ICAgfCAgNiArKysrDQo+IG1ldGEvY29uZi9iaXRiYWtlLmNvbmYgICAgICAgICAgICAgICAgICAg
ICAgICB8IDE0ICsrKystLS0tDQo+IC4uLi9wa2djb25mL3BrZ2NvbmYvcGtnLWNvbmZpZy1uYXRp
dmUuaW4gICAgICB8ICAzICstDQo+IC4uLi9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29u
Zl8yLjUuMS5iYiB8IDE0ICsrKysrKy0tDQo+IC4uLi9wa2djb25maWcvcGtnY29uZmlnX2dpdC5i
YiAgICAgICAgICAgICAgICB8ICA0ICstLQ0KPiAuLi4vcHl0aG9uMy1udW1weS8wMDAxLXB5dGhv
bi1zeXNyb290LnBhdGNoICAgfCAzNCArKysrKysrKysrKysrKysrKysrDQo+IC4uLi9weXRob24v
cHl0aG9uMy1udW1weV8yLjMuNS5iYiAgICAgICAgICAgICB8ICAxICsNCj4gbWV0YS9yZWNpcGVz
LWtlcm5lbC9saW51eC9saW51eC15b2N0by5pbmMgICAgIHwgIDggKystLS0NCj4gbWV0YS9yZWNp
cGVzLWtlcm5lbC9wZXJmL3BlcmYuYmIgICAgICAgICAgICAgIHwgIDMgKy0NCj4gMTUgZmlsZXMg
Y2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pDQo+IGNyZWF0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1w
eXRob24tc3lzcm9vdC5wYXRjaA0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCj4gDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIyOTkwMyk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjI5OTAz
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEx
NzQyMjc0OC82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

