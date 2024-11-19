Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55479D62077
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:13:21 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.86])
 by mx.groups.io with SMTP id smtpd.web10.26873.1732036392332439233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Cxta+ZsF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Cxta+ZsF;
 spf=pass (domain: arm.com, ip: 40.107.103.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=loYaq6WM/nh98FwHHkWV625Mo+gWdsHwO+yMgQeVaGv6q9ZUVC60BslPwjKt2vHI20m/D2xjvwqWBrcTV29VFQHnvk845dzCrCx8Um/qFz2Ld+KQGnsAKlLSLR4ZwgosBqgcOH8tVtmjWKQTFDTHUG/V9bOmGEry7+Ub4kILz+MQjiltYupy83iM8m1h2LDW8AuyWi5vjZ2Grumur6rc2bzhTODVUihf14k73A0wZdrimDkaO+GDlNdcdBemcZM+V7McY5KMQi9wnz296x+pvzsmilXdO+RDrOHvMIDeoSL1I+p3oYZ1mbxo56nnKc2s67xXduqqx3PR2Snhw4dKJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yFcEotl8Xw9sTIHU3/KIXvZRnuaX4qhDVX4/1O6X8o=;
 b=a4dRczlzvtxa3s7hQkUbw4jlcTLZ/WesyXKe9OM7SNWR8Lvr4Y48crkT1SoiL9CGesyVuGbA5lbjiZywO6F/EoDQtCWqsfzmS7125Aq4vOZoWx9sSlxn4687Uueot1pVcY/5TDCI3KkdJBi1EfcIrsep491nlYn35lSEi2PVRgyOzqd7Y4kWqw36PeAZQO7bhmVB0NFD5Bmhi0V22Os6Ea7yuaj1/MkQ43HEiK+PVrandZuUZTETqJaoWtPbp+Ck8GcG+PxnVTg+Fegt6U0UnAYjxqJfEA9IP4g8WLecbi40q/nXCQNWAJEu3P03/Kl5h53/YtvvlC+n911bRT1zjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yFcEotl8Xw9sTIHU3/KIXvZRnuaX4qhDVX4/1O6X8o=;
 b=Cxta+ZsFwKCXdSAOs9HiaULVc4FmvDaLdIKZy1AgxEPEXTqF5A/kODvpCqJbwU4ntWjEvU+15um90vxJxyzCefvL/iH5frwznB1GD76Smqs2RuNiu7Bviu1mp9hSmXjGn6XfrR0x00QvhZS1VWyrbGpgTvouLiqnFVTiqg2yUDU=
Received: from DUZPR01CA0260.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::8) by AS2PR08MB9500.eurprd08.prod.outlook.com
 (2603:10a6:20b:60c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 17:13:07 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::35) by DUZPR01CA0260.outlook.office365.com
 (2603:10a6:10:4b9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 17:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Tue, 19 Nov 2024 17:13:07 +0000
Received: ("Tessian outbound bf1c175f6cbb:v490"); Tue, 19 Nov 2024 17:13:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f6221ba99086d54
X-TessianGatewayMetadata: P+HrSa2JMMhfL4118OLIOmtXIrViFtFkM/YJ3Ldcp8Ah65iRCdmpv0zKfeNP4hw4bkaR6+xcRx/7qz+hAPbcYu2Q7KRZubdBSDC3nJq79o/zrUwX8qAGEiaXSX5h16yTBvTtDVrEyaQpOa/lP6R/v1kcSIsTArurIcBRsJQkXuc=
X-CR-MTA-TID: 64aa7808
Received: from L00dd8916c46b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B8BF8BC0-8F0C-4C38-9319-8ECD6AE1653E.1;
	Tue, 19 Nov 2024 17:13:00 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L00dd8916c46b.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 19 Nov 2024 17:13:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imO86XBQEHF7i6wqKkolFMwcK86/Fx52ol/B59J3jskmRi4aLmdplNSXlSYGvh/AH/DQvXvlop7njxcFqGrPh4owKzxuCbzu2LnK26a+Cr9lUO0YbSDBAbLUbT5steU/ZmBn8LgflvL8/1Wch7k6iHM48CfmpzCAXm+SJ4E6zvU59sRxN36YgmgZedFSmIwKGz/D4LzprS2XDWWJDHUley79QvXF1NHiWo3BHwVsKlBPFopLO6f11e3tPYy3VGv/AqM5YKEkj8VKbRCbI6tT4Jhp4zPBPd9hpJ0iYKPAI3DDGNX4hLuMTLm4eioItS5kqSjLiT7Gf9HMSs36IeFflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yFcEotl8Xw9sTIHU3/KIXvZRnuaX4qhDVX4/1O6X8o=;
 b=Vq65PVI21di/U12k7aJ/4lVQ10qpjoW36EI/NRO/lITzh9uSkzZXe5aqlRYKYJpn2NoDoatQbz/xeViPSYjSaCu3OERelh1aKZ9MOZmzj9m89K/RJ7xpAcOXfpYd5BPC+OadR4fv4SYr9bNRpZuw7M3DI/O5+bQYS7aVX1tvTFjWWt2/D0q6JM5eTjiUGRmqVil6GxT5RvSqeJeDlILUU7VBCLkpTwHrW+Bvm4iFV1CKUHZZpo28zv5F07cwYJBLYfjFa5iJg4Vva9LRy5Yfl9VM2iBEUQ6KlJ+u2kl9cn/AULrmcH56l3+yBI87aCGsoNZCECg3bBEGcJSGN6p0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yFcEotl8Xw9sTIHU3/KIXvZRnuaX4qhDVX4/1O6X8o=;
 b=Cxta+ZsFwKCXdSAOs9HiaULVc4FmvDaLdIKZy1AgxEPEXTqF5A/kODvpCqJbwU4ntWjEvU+15um90vxJxyzCefvL/iH5frwznB1GD76Smqs2RuNiu7Bviu1mp9hSmXjGn6XfrR0x00QvhZS1VWyrbGpgTvouLiqnFVTiqg2yUDU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8360.eurprd08.prod.outlook.com (2603:10a6:10:3d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Tue, 19 Nov
 2024 17:12:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 17:12:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "denis.osterland@diehl.com" <denis.osterland@diehl.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] linux license
Thread-Topic: [OE-core] linux license
Thread-Index: AQHbOp8Ko1ikr2YEWE24t6HT0tx+mbK+1z+A
Date: Tue, 19 Nov 2024 17:12:54 +0000
Message-ID: <5F908BF8-831F-449D-A694-5A01D2AF39AF@arm.com>
References: <936e97ca5ec7458a9c2559e6f46ce90c@diehl.com>
In-Reply-To: <936e97ca5ec7458a9c2559e6f46ce90c@diehl.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8360:EE_|DB1PEPF000509EA:EE_|AS2PR08MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea3fcc7-fa63-4e02-0367-08dd08bd6f9e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Qzh6SjI2bnVjbTllenNYWEp3UlprS3BOWlpmOXE2RUFDb3BqZ3RwQ0k4bVZF?=
 =?utf-8?B?NGE2MU1DS3ZtUzNhRkpid2VsNWNFVVE2bjA5R0tWZXFialdZYi84RHd0alJt?=
 =?utf-8?B?SVUvK3dGNDF1czJPU3g5TXFFVFRuSDVTWEFzQVRpOFRXb3BYd1RpdS95MlJT?=
 =?utf-8?B?WkRldkUwRC9XTW1MUnl0OTZFTkhoUHZwbFQ1NGdaVXBHSE5QTVBacWl6QmNZ?=
 =?utf-8?B?RWJpYzIrOFNsUEY2SVBUL3U5V1VOaFJseG96ZmhLcWxxQko3U1d1M1JKSFdr?=
 =?utf-8?B?aDBUSWZqSGR4STJObHBDelZuTTBBWEFmUllYRVFtSldBdzBNeXhDQ0IvZFJv?=
 =?utf-8?B?NHJYVEtBUXdBbTJoay8rK3Aycy8zN2U1VEFrRVVyUVJBdmxZNUtiOUVmTHNV?=
 =?utf-8?B?Q3ptVEZhZitZZStJN0V0bklqMFFSSTBIUytYRnk3ajA0SVh4NkphZG94ZjNl?=
 =?utf-8?B?b2lpYWZxQnRGOWJaWCtzemVpTnBmZmV2Sm9yckZZcE9xMjJwZFRiZExJZnpP?=
 =?utf-8?B?NlJydHBuSWQ3NnFycjFkZVNhdHFYUlNORTU3R0pGdHJmUTBUV1k1bzFUZXB3?=
 =?utf-8?B?bjJrMzhTa1A3WHZiQldIZ3AyT21kU3NjaHZqYzV2K3l4UDEzVDY1cFJ0SnNq?=
 =?utf-8?B?bWVPR3dKdGVFN1ZQblo1VnhzZjNzS05GUVBJdXAvTzNiWTA1dmtRbmh2YUJ2?=
 =?utf-8?B?eC9yenFwTmJwSEhLMFB5SlUwU2krRHRORElJRE1XSFIybXViTUlVbG9ad3c0?=
 =?utf-8?B?OHEzTXFheDNJc01tL0RhZitYZm9aWlFTS0UxZTBPczV1Rm8zYXBKZHl1RXNL?=
 =?utf-8?B?NmtHbkNXNTJpZTk3MXVYMjBzUzZFMUxLVUMzdEM5RnZZdjhFd3U4Sm53K0Fi?=
 =?utf-8?B?dEFkWkNkbWZVL3RPdmNTN1hMUEZiVlVWNUxqQzRRTHdwdnpqWG9XSHUzNE80?=
 =?utf-8?B?czJKMkVrL2FsT2V3dWhLVFlOZE9zb0xGa2ZJQnNibFJ5enVHdk5qbHh6OW9R?=
 =?utf-8?B?QlFSTHJUWDR4RDd6UFd5Z1phZXZRRlR5YlJnWUZMZll4UDhOYlZtWDBWZEpk?=
 =?utf-8?B?UXpaSzlmQnpqYkkwUEVoUW9YeFhUT2dMaXpONzBIS3VvQnYraTlHSmJTUTRX?=
 =?utf-8?B?dklBZmQ1TXY5c0F5RmJueURoUTJuckpJdGZ4SEx3V254aTdlTjBuaFFXUmtG?=
 =?utf-8?B?VjVpRHBzcHA5ZGl2TXI2UTU2ZVZRN003MDdGRmRieDU0OHJXSjdjeis0MGdq?=
 =?utf-8?B?NmtXSWNUemY4cDU4dWM3K2pLeFFzdEhqeWErY1B4TDdjUlYrY0ViaFIrOWw0?=
 =?utf-8?B?WDRQK2Nsa2NhSk9MTVZabmRxVkppY1huRVFKSVNmYnd0TWphSkZQckdONDBt?=
 =?utf-8?B?T1Z5WU0yOHM0MGVjUjNKVXd3RDNmbGpUalR5eHRHTTQ4OEhCS1VTUkE1VFpi?=
 =?utf-8?B?cjJQTWp1SWlsMEJPWUhHa0tRY1pDMkVMelpTaFpnb0taQi9wcXZKb2xQS1Aw?=
 =?utf-8?B?ellReWRGL095aU91c0FyVVZ6SUUwdkZaSS9vRUZTWTB6N05JbVJnZG1DbkhV?=
 =?utf-8?B?THNEdmJoeTZENFlHOUtPcytoOGgwdEQrYVY3RHZQNWNzcnJZYUlMV0l6WDRW?=
 =?utf-8?B?YVgrNmMxTU9ySTBvbkxXL0J4QW02eXIyVDhZbXFPTXNBT2NRVDBQRm1HVTNl?=
 =?utf-8?B?SWFIY09jdHoyVDZRN2ZpZlNiVC9NdGFxeUpoT2VjckJITXZBd2wvVXBna3ln?=
 =?utf-8?B?aW82aFNTdmo2bm94WnpTU1JCSEkzVW44ZHVLdmRCOXV3QnJwaDNKdnl4UDNI?=
 =?utf-8?Q?0+t5wz2eLc0klFx3FJybKI62z6YE6zxSNw2Ys=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2A978865341B0449E719B40676218FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8360
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e551fd77-0f36-4a34-1bbc-08dd08bd67e5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|376014|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aURpZVlPL2toT01maHpYSkc1c2UzdlNVSHdkbE80Nm9LVml3anJ2bXk3MENN?=
 =?utf-8?B?WCtNdzBDeUk3VDNPd2FvWUI2ak5aWlc4RWk5Tk81WGJ2ZDRRbkN3SmhabFJI?=
 =?utf-8?B?UDIrQjViNDduNzJ0Z2F2aWQycFl2bzF0YW8zTWhpZWVueEV5c0RpMFRnby92?=
 =?utf-8?B?VVJVYjByUEt3OCtub3ZpMXJweUJ2Vm1MeGpnQk1qZnFrTHlKMVg3cVFabUQ3?=
 =?utf-8?B?OVNXMWNrcnNaZm10MlhlTXZSNTd3cUVQNHNKL0hEZHZvdE5hcFF1bS9nSEll?=
 =?utf-8?B?a1pmM01XbHE4WENPd2hnOE5pYTJ3UU1YbUN0cStMQlFINGZUVkNxa1lhY04z?=
 =?utf-8?B?UE5LN2xjZkwwWmM0NTVsMUJ6bHU2ZjlmWGxyODE2Q3ZBUmNFSFlBbjdQSllv?=
 =?utf-8?B?c2ZPZ1BEdXRvdjFVZGUxdDhrN1RlSno3dUpXRE05ODV3Z0tFYmJZa1Vra0Na?=
 =?utf-8?B?ZDhYdFdWNUlrVTVKbDBGbnJCdzExZDFOMkNCV3pHak1FOXlGREsxOXJ6Y2F6?=
 =?utf-8?B?R3JYL05JTDJKdjRjY1h6MUNwSWg2UDRJL3BxSHFlTnZyeENoaHdVZ1NjNi9F?=
 =?utf-8?B?VFVqa0xOV2Q4aGZFTnpnV1pmaWhlNFluZHMzU0hRVTdmZ0pZN0dqUTFiL3dP?=
 =?utf-8?B?WnAxV1Rtc3NUZm5FVTExWlloMUtTM2orWnJVRjVOcVVnT1JJSzAvZDVkckNl?=
 =?utf-8?B?aVpLMTFwZ1hjZGxGbE1tZWN2R29CNVhlKzZjSzB5TFluSTYraVlEZTZPWjlQ?=
 =?utf-8?B?ZEpmMW12bzIzY0kyQjhzaUhVUkhrRkc5c28yYWloSUwyeWZrK0R3WHA3UXZO?=
 =?utf-8?B?aHF0TjFORHlTaFZhVjJ5NW8rMUYyQmlNb3VuQzFjNWdIT1VPWFk0TW1Gai9u?=
 =?utf-8?B?M29FSmlYM1BhWFl6U1ViQWp4Rm94ZDYrc0krakloZ1c0WXdmMXduWWtGeFA3?=
 =?utf-8?B?RkNOSkUvYnNRbGtvTFk1WGlVSXYvSTIwbzIzMGkyeUNqMVlXMWNYZUFrWTIx?=
 =?utf-8?B?WWlncXFrMFphM1VsVnlMNE9idjJheSthZ1JrWmRXTkVvZTFoeGNYaml0OG55?=
 =?utf-8?B?aWtUYy9zVk5McDlQdnRDbmRmSVdpNi85akt5Y2V4Zlo5VDNEcHZSRXhKU0t4?=
 =?utf-8?B?K3VvdGJtbVN3Z2hGV3ljRTBwY3ZIamJpUlRzZXQ3VUpWcDhmWGxEMGRNR3lu?=
 =?utf-8?B?ZjZmMytaVFB0SXdVODcvbmZ3bjhyeDVLVndtWXRlRldRT1JBVjcvUXBCYlZR?=
 =?utf-8?B?VG1BYWtGK0kxdmR6R2toTHlpRlJOaHRiSFNGcDYvaEwxb2NYckhUS3FaLzRq?=
 =?utf-8?B?NjlqWlBxVjRRNmJsM0dJcnJjZFl4dWVCcmd6blVoejdYcnBIUWFweGozME15?=
 =?utf-8?B?VHkyeVQ2cUpVaCtJM1NSbERUNUN6di84TWhjQkd1L0o0SEFNOStzM2pTalVM?=
 =?utf-8?B?Mm1YNFVxOEErVTZOY0J0cFNBSWFSbm5ZdDY2WElnQi9zTDJGTmw2ZHJkRDky?=
 =?utf-8?B?Q0oxUzBEOFRrK2I2OXNPZnN0d3phRFByaEMzVSttZWQyNm5RNEFnaHA3M0x5?=
 =?utf-8?B?NHMwY2J6RXhwUWUyenE3TWRxYzZ0dHhFOVIyTTNEUmZsdkM1Y0JGWUF3ZG9Y?=
 =?utf-8?B?OXdmaFJiK3hHbWNCRlgxRTNPSkJIUEhwYUg2NDc4KzNDMjExRVlrUWlDY1FX?=
 =?utf-8?B?L3c1NlpEUFJLRld3N0d5TmhGM1R4dWNKRTFBSWNGRVp1ZEhtR0svT3IrdzUz?=
 =?utf-8?B?QkNSUjBQOXYvcDRkdHp5L2J6TjFjeHArM2h5UTJHb3F0NDBGclU4ZW1PanVk?=
 =?utf-8?B?Q0s5VklhOHkvL1B0ckRMTy94ekZuNmZ3OU55RTJGWHp4bWQ3c0k2NTcwTHpu?=
 =?utf-8?B?Y2JubTFnZXJ5U1FoSnl0WnYwanJSaERGWmtQaG1GQTN5Smc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(1800799024)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 17:13:07.0477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea3fcc7-fa63-4e02-0367-08dd08bd6f9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9500
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207397

T24gMTkgTm92IDIwMjQsIGF0IDE2OjIwLCBEZW5pcyBPU1RFUkxBTkQtSEVJTSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8ZGVuaXMub3N0ZXJsYW5kPWRpZWhsLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gQ3VycmVudGx5IGxpbnV4LXlvY3RvLmluYyBjbGFpbXMgR1BM
LTIuMC1vbmx5IGJ1dCBMSUNFTlNFIGNsYWltcyBhIHN5c2NhbGwNCj4gZXhjZXB0aW9uLg0KPiBT
aG91bGQgaXQgYmUgR1BMLTIuMC13aXRoLXN5c2NhbGwtZXhjZXB0aW9uPw0KDQpZZXMsIHByb2Jh
Ymx5LiAgIFlvdeKAmWxsIG5lZWQgdG8gYWRkIHRoZSBsaWNlbnNlIHRleHQgdG8gb2UtY29yZSBm
b3IgdGhpcyB0b28uICBDYW4geW91IHNlbmQgYSBwYXRjaD8NCg0KUm9zcw==

