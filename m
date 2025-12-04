Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47EAD24449
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 17:06:07 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48851.1764867966222258758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 09:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lweBTcay;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lweBTcay;
 spf=pass (domain: arm.com, ip: 52.101.72.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X0EJL1Lkun86aKCk1DaQ+V04T09EQBUGXMMb/LTMX3R5qQMdcgQyZ4cmh0lS1TASflwd2OgN/dNTlQUJYfPw502k82OMTUmyUrBzQgymar4loTEugUqUxBSvXTOjzoFjRCD6aP9sNBygjE0rQjeN699DKdppsmEMsDVk0ya8nlddpJwXccA0JeOXaHNHfNMe7gP2Nvamk1COovqEb0Q7rN0fzUHsxwkU66kT3xaEDGqn80mo80+HSgm60e7RxCLYDTpH8HrcWd9NQCCFrhYr6TIO63hFGIYYP24XMcx9Ac1C2SCJq+OKLNuPnyqPH8QcvEx/+PHCOdN94HVU+MrSBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADBjehm/zbdii+QBtcPPnRIAyOmZq7AY/Caz5uMArSQ=;
 b=w8yxz0swMgMMP5DsISuYlXU/ZiK+qZNZFKXHLyS6stGqivZYrM0xU3/zIF27gaLfJQoeJdd11rQqVkyITIUdcpK5GwiUoAUC7v74qi+dz4hrHCLJOyV/fvExIjgLSNuU9hyYZalZtCJxuDbSicHdBO/URxNo6N4mBS9T92rxobl8fSVpWCQK3UzvkoqpvuKUW9H4uOyWF3RRVdVCkS/3UcUvXKws8gwa9H7poKrNh3ahhsrJ+CEIzrQBC41mMyY74vfl1W8eDKQMKQW73ZLXXuHg2oIaPFYW+Nl7sCiEtrnwgTIo686kmeU3my7wavR7ouHDbEr+iDggJmJ/rNRhRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADBjehm/zbdii+QBtcPPnRIAyOmZq7AY/Caz5uMArSQ=;
 b=lweBTcay8xsU/hKeHp7rWoltHqxhg9UHooqfEKN9EMHwlE+NDfQa103OmHEdhurAUwyVtU1XIBFPUKg0e6ShEBlVNVJKDy80Rm2U09Bu1e0mcZyCZ3c9/7BqW6n6MBL3wycmrUqqCQPH9s4fO+QsZNlYfttiSP29uvRnlyHVFbU=
Received: from DUZPR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::10) by DU0PR08MB8138.eurprd08.prod.outlook.com
 (2603:10a6:10:3ed::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:06:00 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::a0) by DUZPR01CA0054.outlook.office365.com
 (2603:10a6:10:469::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Thu,
 4 Dec 2025 17:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Thu, 4 Dec 2025 17:06:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahvPM7TOg0//j0wLWJ2Xt0r60vfwKNPIH2rizvwzzEMSzoesMlWrpCqkjZPUY37OUvQlI6bMh12ZAeA/PJ1EIpCY02rPCe6OjlZrmZGRnKVSJzXh8f63dVFYT6kUiaxIDaRP8Bm/hLYYOtC5/i+Si27OYwB8NbwYvsnLS0HpkVoS7JCAGv4Vny4MkKcnMUAndPwS3PcJg5L82ij4p7lMDwP38LBs7cJvP0YKNYYb6kDBeR3h5+ePqWce183VU1Fl9BWUgM7W0kkTPoeKmMrxkiCZiXPbZvPV4FvO//uGgW+E77+rxrtnCdN6Mh+d00A4LtH8LTCrIdXjGs8ONOuDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADBjehm/zbdii+QBtcPPnRIAyOmZq7AY/Caz5uMArSQ=;
 b=DitcYj/bIqmSdvTafu6bVZVxNxD9z+QmOjLaaRcJE5XhOB2ASPN/LMZscNVksxMy74ISKWR44cRzdrcP5oMComPSEtTKYy7kzqEP3JgBotWRH6WBpE2uTR1wEvgSEy5UAzzT6VnyZUTQtOefohWfyEiRoKlmC1l7j7L75hWBattV3MjFCyFHtJqyihaTxC0vk3DSIbtCVfVJT45H38i4HkWLxqkE/lUQ3R0XE51Bi/4U32shMhjz6tYBdXw5kMxbxBBOjwXeXUwWXpgNbbbVKyIRO5laMJH9Oy49sN0srDdh6/tLpsvwyjmLrB2pPSmHX9+kBTJNfo3usLHjnKwqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADBjehm/zbdii+QBtcPPnRIAyOmZq7AY/Caz5uMArSQ=;
 b=lweBTcay8xsU/hKeHp7rWoltHqxhg9UHooqfEKN9EMHwlE+NDfQa103OmHEdhurAUwyVtU1XIBFPUKg0e6ShEBlVNVJKDy80Rm2U09Bu1e0mcZyCZ3c9/7BqW6n6MBL3wycmrUqqCQPH9s4fO+QsZNlYfttiSP29uvRnlyHVFbU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8635.eurprd08.prod.outlook.com (2603:10a6:20b:563::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 17:04:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 17:04:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] sqlite3: upgrade 3.50.4 -> 3.51.0
Thread-Topic: [OE-core][PATCH] sqlite3: upgrade 3.50.4 -> 3.51.0
Thread-Index: AQHcXl5I5JAvkssPL0SE6KKkF9Fgp7URw28A
Date: Thu, 4 Dec 2025 17:04:54 +0000
Message-ID: <3D8BCDA7-7542-48C9-9448-18CE462889A2@arm.com>
References: <20251125225257.2579493-1-peter.marko@siemens.com>
In-Reply-To: <20251125225257.2579493-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8635:EE_|DU6PEPF0000A7E1:EE_|DU0PR08MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 4547a097-2b1b-465e-d69b-08de33576641
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?U3VhYThPQWRGOXFaNmErZ0s2RnhnaVlTbEZIcVd6dzNGVXAxS2d1a0RZa1k4?=
 =?utf-8?B?TVRVaXZUMnVLS3lCRW0zU09YSVJJb3R6YzdjQUtyQlhZcWROaTNDT3IrV3Uz?=
 =?utf-8?B?OTdsd1F5ZE11YlNaaU9rS1VIUU5PWGJrZTJNem9Yc2JFRHZlczlBNWxtdnZK?=
 =?utf-8?B?WmxjOExUbGRmeWt2Y01acmtMMHY0QXRJQ2NEa0ZNRy92azVrMkh1U01HRFFX?=
 =?utf-8?B?d05LL29VMWZUMHhTUXpXTmdvNHhCSGRpRUt1SEpTV1BmdmR5dmhzWjJaWVE2?=
 =?utf-8?B?NmxSdFpGdzl1VitUeDRtRTlQVGF1a3NJTWs0RmkvK1p3MzB0bmhhMURGYVBZ?=
 =?utf-8?B?a1htc1FuNW9rcGc2V21BYWF1bnM5algxS1RFOWdjdUp6ZTJ5aUFmS0dJUkFU?=
 =?utf-8?B?dHk5amhZVGowbnpBR0paWDBuL0dxblIzWUQ4bFdxbjI3b2YvbVk0VFJxbnpv?=
 =?utf-8?B?K0FaSlhaWXdoa2R2aDhaR1ZTVWNFMCt1OGxXUzlBNWxBelV2amtrK0oxVlVB?=
 =?utf-8?B?azBtRmJOY2pRaUw2WnhUTk9FVjg3NjB4V1NIdVRReGdod0pvMFJsSGgxSDBU?=
 =?utf-8?B?NmV2RG1pYkhvR2h2cUxDQk5SaE9aVUJrdWtJT0NCNGdScWVqeDVWejdlNGg3?=
 =?utf-8?B?ZzBrS0Y3Vlgxc05CR0RaM2tId2VXVVQyNi8rVTN2dXEwRStZWWdiV3JjV0pU?=
 =?utf-8?B?WHdEVzd2RTJDajJoWXdxdDllY0piU0Vhd3pQZHlsYjVIV24xYU41YlNDK3p1?=
 =?utf-8?B?OGlIU0NSZjlQZHgvQktvQUxKRVBvMXBlc1Z5ejRtUEVmYi8vbG1yY3N1ZEI5?=
 =?utf-8?B?WkN5cW1sczgvbDBZTjNOOGd1Q2NiZ0ZjN3VKNXh2Rk9aL0JWSkV3SEprVzZW?=
 =?utf-8?B?SFhzb3l2aU1ySUNRMmZmZFZuRS9pd0tEU2JhOHpPMTFDdUpnQkg1aHZ5eGlF?=
 =?utf-8?B?MFlBc3RWa05CUXJUZy92aGNVakVsMXRtYThxcEtMMTlNUUJNNmlyRzA2a2Vv?=
 =?utf-8?B?V0ZXMzFESEhGYlRVaFdtSkc2VWpyVmlTdGJzYnpoSmZSTklyNmhWQSt5dFpN?=
 =?utf-8?B?RWhhY2FBVnZKQXBIWUU5dmcyVStaNWR0QTFsM2dHUlpDd0ZyR01JQnkwUkQ0?=
 =?utf-8?B?eXIyU1ZuMGs1QzJJMFBXbWNHb2V3U1hqRUJhZ3VUVjhTSGlINWk4dW40MDZJ?=
 =?utf-8?B?dEJWOS9DWU5QRWdRNmVPTEpiRUlySzdaRXdBakJFeW94Vkk2M3FqUWNnZzk3?=
 =?utf-8?B?b2NCamJzN1p5ZkNFUVJzNDF5S28yZzgyR0pNd3NTQnJMS005aEQ2aEU4TTBT?=
 =?utf-8?B?THNlMjJ0Q0l2VU80VWN6SG5ES0ZmZzVQWkhTbDhUWWNxUDJhMXJwdFBGZ3hT?=
 =?utf-8?B?TkpYOHFGUmZIOWFCUlhGTGZINVlKT05XZEQ0NlEzOHFBRW81b1F5MWd0VnFG?=
 =?utf-8?B?UkpoVUhIaUhPSGFBRWx0SlVpcXJKNktuajFqWFdXMGdKMWxxT2dzbmJEeFcw?=
 =?utf-8?B?Ui9uTzkvWldhZGM1QnFhbTkyOXptb29LMVpESU1ET2pwZ21uQy9NNEpja2tk?=
 =?utf-8?B?Tjk3K0lCb1IwdWplcGw1eFFVU2JLaFhrK2NpZHVmQ1BVdGxtU1RwcW1aTmR2?=
 =?utf-8?B?Zlc0NTY1WGFta2I5S0wxNmx5RHQvZEZxbkV0dmlHZDlvOUppMTljL3BsLzBL?=
 =?utf-8?B?RnVheDBNbnlJV1dyVUlPYWZWN2RJeGNWZzFpUWlabFI3Y25pNndtZForZi9O?=
 =?utf-8?B?WUtNMjlxOUR0V3VLREVxTHRQYjQ0K3pkVkNmWE80eVRHaGx6aVpYaVFNOEl3?=
 =?utf-8?B?c3R1b21uWlltNktyMUgvb2lHbm1QcWRzcFF0aE16aEpKYjJ5dlU5RElkQzdP?=
 =?utf-8?B?K01GanViTGlGeXhUSk9mc2dCQnNKWU80cldFcC9ycENoL2drajJ5SEd0aGhv?=
 =?utf-8?B?TkRVWCtmUmYwaG5GckxJTnhYVzlYZkd6b09DbE04TFdYWC9mY3U4eFBzSXJF?=
 =?utf-8?B?bzVHc1pYcDRnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3EEAA3AFBF348408E049D772F50696F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8635
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a4f86c3-9afc-47f8-7eb7-08de33573ef7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|14060799003|36860700013|376014|35042699022|82310400026|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlJUNVR3K3NvSWtyZmdMU0ZLSDIrallDZytkazRpS1QzaTVhSEhnR1RjeEZl?=
 =?utf-8?B?N0ZBWjhFeC9MdlAyQUY0RGhyUm1BWTYwMW94TWhJWEZMZGlrRjZMYWV1cDVG?=
 =?utf-8?B?d21DTXE5MDVSenhHNndVV0RpZllQQSt4OElkLzJGenZsY1AzOEh5bFRkajlE?=
 =?utf-8?B?UTdGTHhqU24yQ2VLMVAvYm4rR0RhR3dkaTZkRWpGT1JDWlI0dGo3bUxZZ2pN?=
 =?utf-8?B?eWVlWmQzc1JvQWF6OHQzQ09JMW9tc3lWVVh1SnE1U3hjcXZtclYrcmMvUW5M?=
 =?utf-8?B?N0h3Q1E5bkxMbStwVFU2akNMd1lBY0FUK3V2d0VnZk9DSDZRb3hwZVRhQ0Zj?=
 =?utf-8?B?YnQ0c1NUZ1RBVnBEcFNTOUkzaVVhUVp2cEJaWEtQcGI3WE0reHpyZGlsRlBE?=
 =?utf-8?B?TmpBVHpDOXVUcC9scVRmTjNsaE94SFRBQ2tkVlU0MXRtOTlaYXdWUnJvanlT?=
 =?utf-8?B?K1FMVEE2RnNWT2JVc0RoNkFjS0JvTHRMbkxWaHlBaFVJWVhIZVVZQXZYVVV2?=
 =?utf-8?B?Y3lET3F3NXo2L1lWRko1NmRlRWt2cGltY21EbDFOMUt6bXRYVFROMURIVFJa?=
 =?utf-8?B?NWNiME53enR6cmRKdy9BRVlCckxMVzBnQ0NySmlvZ3p0TDlOdlk1a21KWjUx?=
 =?utf-8?B?aFpOK0JhRVdZanVxRENYaE9hU0hoN3Q2aXVvNFM0OG5CRTBKWVVsbmlkWmJD?=
 =?utf-8?B?OElqWmtZeGZiRkhZdWlhamtacVB4bGQ2cVhNRTlYU3IzazVqNE5Tb2VoZk5E?=
 =?utf-8?B?OVMxbXhSa3liVndsNWUxVGFhNVowczAwdmdRVUJyVm1IT01nbW4vL0Njd1hy?=
 =?utf-8?B?VUtXanM5ZzFXT0xZNFJ4eWJIUjJncFdtVTMxSFpNNThWWEhEd0hEalRMOW15?=
 =?utf-8?B?NGIxRndRMzQxbFlKNjdpMXNuM3JQdDdDam9xRncvdTBvQlBQQkt1VkdMakdV?=
 =?utf-8?B?OXdxWDcyc25DQzdVUzNObFo4VmhkdlVHWUYxSzlZZ2Q1TXNMbjZ0ZHZJQ25w?=
 =?utf-8?B?K2xEd01pNFF4UTk3ak12cVJJUFk2S2d2VFNHVGtTMklzMmFHeVBvandrUkJX?=
 =?utf-8?B?OG5Xbk9BR3pteGQ3UFNhTUNzR3JNMHhKdEZvcFMwZWxaRnB0b1hQRlF1cUZn?=
 =?utf-8?B?bWk4bm5OUTlFUUNpdHNSRmkxbm40OU1VTTExQUtKYk14am8xVm1lRWZZOGJy?=
 =?utf-8?B?K2l2L0RhcXo5eWhxT3BMRGR2RHF3a3NTaThTUDRkczJpbHduam1UQlZOaFNz?=
 =?utf-8?B?YTg5ZXYxa2lFaDRmR3VTYmpwZmZwQ1lwTDYzS0NZZ1Uybzh0MkNnR285SlFh?=
 =?utf-8?B?UFBJZmpJTVJWanN0c3RBVHFkckhkSlMwMWgreVh2ZUt6VEJMUjd5WlE0T3Y2?=
 =?utf-8?B?Wm1CVEw5Rm1xVzZNekozY21va1hiYzY3N1ZnQjhmR0ZZck5UNXFzZDBqZFUv?=
 =?utf-8?B?L0tNbWRBZmZWSjNWd1FSZE9VTGZ4bTlSWnNPTHJGK1VxZUF0Q2JpREZjT0g2?=
 =?utf-8?B?VWcreXI5RktURGYzbmw5WWw5cnJ5Q05kc0JFTmNZN0x2ek4xVnJVaThXekFL?=
 =?utf-8?B?QUpnb21KOE5kS0JINFROU0hJSmtvYmgxcVZoeFZjSnNnbGZrdjFoc0ppdEs5?=
 =?utf-8?B?dTN3QVJXRHNDak9lWVo1RS9nUGZMSm5aSGxkTWhlM015aDJWSTl2bVllU0pF?=
 =?utf-8?B?NWNUa0M1c0dJRUIvRVhoWWk2cGpOQUJDeVZ4UnMwZE54bWdsZkxnZFdkcDAy?=
 =?utf-8?B?OTc2bDBUN2xQT3hsWlUzTGhJa2F6MjlBNkxmZFFUOWt0S2JDYkZxYm9wOEJD?=
 =?utf-8?B?c3FaTkg0bXRCeG1EbkZiYnpmUlZubDlyd2NQc0lrSnZPQ25JS21mZXBPM3dB?=
 =?utf-8?B?MlVyOW1Xb1RVZU9oNVNDT2dNOWpVL3RNUXVNN0Y5WjhWYTRQNm9oNDFJTEZE?=
 =?utf-8?B?QmRnUStKMk42QVpCR2srM1VFcUp5T29yb21Cdnhlb0ovQlFBTUs3ekpUS1pK?=
 =?utf-8?B?S0Mwam9FV3FZRkx1S2pLSTJ3SEcwOWlXK0ZtNlRmZXpPa0dJOU1ObE9iUWUz?=
 =?utf-8?Q?W8i2nj?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(14060799003)(36860700013)(376014)(35042699022)(82310400026)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 17:06:00.3389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4547a097-2b1b-465e-d69b-08de33576641
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 17:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227306

VGhlcmXigJlzIGEgMy41MS4xIHJlbGVhc2Ugbm93LCB3aWxsIHlvdSBiZSBhYmxlIHRvIHVwZGF0
ZSB0byB0aGF0IHJlbGVhc2U/DQoNClRoYW5rcywNClJvc3MNCg0KPiBPbiAyNSBOb3YgMjAyNSwg
YXQgMjI6NTIsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwZXRlci5t
YXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZy
b206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gDQo+IEhhbmRsZXMg
Q1ZFLTIwMjUtNzcwOS4NCj4gDQo+IERyb3AgY29tbWl0IGluY2x1ZGVkIGluIHRoaXMgcmVsZWFz
ZS4NCj4gUmVmcmVzaCBhbmQgcmVuYW1lIHRoZSBvdGhlciBwYXRjaC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gLS0tDQo+IC4u
LiA9PiAwMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNofSB8ICA0ICstDQo+IC4u
LnJwYXRoLWNvbmZpZ3VyZS1zY3JpcHQtZmxhZy10by1hZGRyZS5wYXRjaCB8IDU3IC0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41MC40
LmJiIHwgMTAgLS0tLQ0KPiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUx
LjAuYmIgfCAgOSArKysNCj4gNCBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2OSBk
ZWxldGlvbnMoLSkNCj4gcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUz
L3swMDAyLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNoID0+IDAwMDEtQWRkLW9wdGlv
bi10by1kaXNhYmxlLXpsaWIucGF0Y2h9ICg5MyUpDQo+IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC10aGUtZGlzYWJsZS1ycGF0
aC1jb25maWd1cmUtc2NyaXB0LWZsYWctdG8tYWRkcmUucGF0Y2gNCj4gZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTAuNC5iYg0KPiBjcmVh
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41MS4w
LmJiDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0
ZTMvMDAwMi1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0
Y2gNCj4gc2ltaWxhcml0eSBpbmRleCA5MyUNCj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMi1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRj
aA0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1B
ZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaA0KPiBpbmRleCAyODU1MzcyYzIxLi43NzE4
MWZlNGRmIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRl
My8wMDAyLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNoDQo+ICsrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXps
aWIucGF0Y2gNCj4gQEAgLTMyLDcgKzMyLDcgQEAgZGlmZiAtLWdpdCBhL2F1dG9zZXR1cC9zcWxp
dGUtY29uZmlnLnRjbCBiL2F1dG9zZXR1cC9zcWxpdGUtY29uZmlnLnRjbA0KPiBpbmRleCA4NWZl
NDE0MzgyLi43NzE5MGE3MDUzIDEwMDY0NA0KPiAtLS0gYS9hdXRvc2V0dXAvc3FsaXRlLWNvbmZp
Zy50Y2wNCj4gKysrIGIvYXV0b3NldHVwL3NxbGl0ZS1jb25maWcudGNsDQo+IC1AQCAtMjc0LDYg
KzI3NCwxNCBAQCBwcm9jIHNxbGl0ZS1jb25maWd1cmUge2J1aWxkTW9kZSBjb25maWdTY3JpcHR9
IHsNCj4gK0BAIC0yODcsNiArMjg3LDE0IEBAIHByb2Mgc3FsaXRlLWNvbmZpZ3VyZSB7YnVpbGRN
b2RlIGNvbmZpZ1NjcmlwdH0gew0KPiAgICAgICAgfQ0KPiAgICAgIH0NCj4gDQo+IEBAIC00Nyw3
ICs0Nyw3IEBAIGluZGV4IDg1ZmU0MTQzODIuLjc3MTkwYTcwNTMgMTAwNjQ0DQo+ICAgICAgIyBP
cHRpb25zIGZvciBJQ1U6IEludGVybmF0aW9uYWwgQ29tcG9uZW50cyBmb3IgVW5pY29kZQ0KPiAg
ICAgIGljdSB7DQo+ICAgICAgICB7Kn0gew0KPiAtQEAgLTY0MSw3ICs2NDksNyBAQCBwcm9jIHNx
bGl0ZS1jaGVjay1jb21tb24tc3lzdGVtLWRlcHMge30gew0KPiArQEAgLTY1Niw3ICs2NjQsNyBA
QCBwcm9jIHNxbGl0ZS1jaGVjay1jb21tb24tc3lzdGVtLWRlcHMge30gew0KPiAgICAgIHN0cmlu
Zy5oIHN0cmluZ3MuaCBcDQo+ICAgICAgaW50dHlwZXMuaA0KPiANCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLXRoZS1kaXNhYmxlLXJw
YXRoLWNvbmZpZ3VyZS1zY3JpcHQtZmxhZy10by1hZGRyZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLXRoZS1kaXNhYmxlLXJwYXRoLWNvbmZpZ3Vy
ZS1zY3JpcHQtZmxhZy10by1hZGRyZS5wYXRjaA0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggZjFlOTNhMWM5YS4uMDAwMDAwMDAwMA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC10aGUtZGlzYWJsZS1ycGF0aC1jb25maWd1cmUt
c2NyaXB0LWZsYWctdG8tYWRkcmUucGF0Y2gNCj4gKysrIC9kZXYvbnVsbA0KPiBAQCAtMSw1NyAr
MCwwIEBADQo+IC1Gcm9tIDg3YzgwN2M2ZGQ0ZGY2NzMyODkxOWZhMjhlODlhMDY4MzllNjM0ZmUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+IC1Gcm9tOiBzdGVwaGFuIDxzdGVwaGFuQG5vZW1h
aWwubmV0Pg0KPiAtRGF0ZTogU3VuLCAyMiBKdW4gMjAyNSAyMjo0ODoxMSArMDAwMA0KPiAtU3Vi
amVjdDogW1BBVENIXSBBZGQgdGhlIC0tZGlzYWJsZS1ycGF0aCBjb25maWd1cmUgc2NyaXB0IGZs
YWcgdG8gYWRkcmVzcw0KPiAtIFtmb3J1bToxM2NhYzNiNTY1MTZmODQ5IHwgZm9ydW0gcG9zdCAx
M2NhYzNiNTY1MTZmODQ5XS4NCj4gLQ0KPiAtRm9zc2lsT3JpZ2luLU5hbWU6IGE1OWQ5YmIyNWU1
MThmNWQ3OWY2NTQ2MTViOTJmNmM1MGNmYjcwNGI1YWJlZTBmODIwOTEyNjQ0Yjg5MzY2YzUNCj4g
LQ0KPiAtVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3NxbGl0
ZS9zcWxpdGUvY29tbWl0Lzg3YzgwN2M2ZGQ0ZGY2NzMyODkxOWZhMjhlODlhMDY4MzllNjM0ZmVd
DQo+IC1TaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+IC0tLS0NCj4gLSBhdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wgfCAxOCArKysrKysrKyst
LS0tLS0tLS0NCj4gLSAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQ0KPiAtDQo+IC1kaWZmIC0tZ2l0IGEvYXV0b3NldHVwL3NxbGl0ZS1jb25maWcudGNsIGIv
YXV0b3NldHVwL3NxbGl0ZS1jb25maWcudGNsDQo+IC1pbmRleCBiYjgxMTIzMjA0Li40ZGQwNjUw
OTVlIDEwMDY0NA0KPiAtLS0tIGEvYXV0b3NldHVwL3NxbGl0ZS1jb25maWcudGNsDQo+IC0rKysg
Yi9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wNCj4gLUBAIC0zMzQsOCArMzM0LDggQEAgcHJv
YyBzcWxpdGUtY29uZmlndXJlIHtidWlsZE1vZGUgY29uZmlnU2NyaXB0fSB7DQo+IC0gICAgICAg
ICAgID0+IHtMaW5rIHRoZSBzcWxpdGUzIHNoZWxsIGFwcCBhZ2FpbnN0IHRoZSBETEwgaW5zdGVh
ZCBvZiBlbWJlZGRpbmcgc3FsaXRlMy5jfQ0KPiAtICAgICAgIH0NCj4gLSAgICAgICB7Y2Fub25p
Y2FsIGF1dG9jb25mfSB7DQo+IC0tICAgICAgICAjIEEgcG90ZW50aWFsIFRPRE8gd2l0aG91dCBh
IGN1cnJlbnQgdXNlIGNhc2U6DQo+IC0tICAgICAgICAjcnBhdGg9MSA9PiB7RGlzYWJsZSB1c2Ug
b2YgdGhlIHJwYXRoIGxpbmtlciBmbGFnfQ0KPiAtKyAgICAgICAgcnBhdGg9MSA9PiB7RGlzYWJs
ZSB1c2Ugb2YgdGhlIHJwYXRoIGxpbmtlciBmbGFnfQ0KPiAtKw0KPiAtICAgICAgICAgIyBzb25h
bWU6IGh0dHBzOi8vc3FsaXRlLm9yZy9zcmMvZm9ydW1wb3N0LzVhM2I0NGY1MTBkZjhkZWQNCj4g
LSAgICAgICAgIHNvbmFtZTo9bGVnYWN5DQo+IC0gICAgICAgICAgID0+IHtTT05BTUUgZm9yIGxp
YnNxbGl0ZTMuc28uICJub25lIiwgb3Igbm90IHVzaW5nIHRoaXMgZmxhZywgc2V0cyBubw0KPiAt
QEAgLTIxMTksNyArMjExOSw2IEBAIHByb2Mgc3FsaXRlLWhhbmRsZS10Y2wge30gew0KPiAtICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIw0KPiAtICMgSGFuZGxlIHRoZSAtLWVuYWJsZS9kaXNhYmxlLXJwYXRoIGZs
YWcuDQo+IC0gcHJvYyBzcWxpdGUtaGFuZGxlLXJwYXRoIHt9IHsNCj4gLS0gIHByb2otY2hlY2st
cnBhdGgNCj4gLSAgICMgYXV0b3NldHVwL2NjLXNoYXJlZC50Y2wgc2V0cyB0aGUgcnBhdGggZmxh
ZyBkZWZpbml0aW9uIGluDQo+IC0gICAjIFtnZXQtZGVmaW5lIFNIX0xJTktSUEFUSF0sIGJ1dCBp
dCBkb2VzIHNvIG9uIGEgcGVyLXBsYXRmb3JtIGJhc2lzDQo+IC0gICAjIHJhdGhlciB0aGFuIGFz
IGEgY29tcGlsZXIgY2hlY2suIFRob3VnaCB3ZSBzaG91bGQgZG8gYSBwcm9wZXINCj4gLUBAIC0y
MTI4LDEyICsyMTI3LDEzIEBAIHByb2Mgc3FsaXRlLWhhbmRsZS1ycGF0aCB7fSB7DQo+IC0gICAj
IGZvciB3aGljaCBzcWxpdGUtZW52LWlzLXVuaXgtb24td2luZG93cyByZXR1cm5zIGEgbm9uLWVt
cHR5DQo+IC0gICAjIHN0cmluZy4NCj4gLSANCj4gLS0jICBpZiB7W3Byb2otb3B0LXRydXRoeSBy
cGF0aF19IHsNCj4gLS0jICAgIHByb2otY2hlY2stcnBhdGgNCj4gLS0jICB9IGVsc2Ugew0KPiAt
LSMgICAgbXNnLXJlc3VsdCAiRGlzYWJsaW5nIHVzZSBvZiBycGF0aC4iDQo+IC0tIyAgICBkZWZp
bmUgTERGTEFHU19SUEFUSCAiIg0KPiAtLSMgIH0NCj4gLSsgICMgaHR0cHM6Ly9zcWxpdGUub3Jn
L2ZvcnVtL2ZvcnVtcG9zdC8xM2NhYzNiNTY1MTZmODQ5DQo+IC0rICBpZiB7W3Byb2otb3B0LXRy
dXRoeSBycGF0aF19IHsNCj4gLSsgICAgcHJvai1jaGVjay1ycGF0aA0KPiAtKyAgfSBlbHNlIHsN
Cj4gLSsgICAgbXNnLXJlc3VsdCAiRGlzYWJsaW5nIHVzZSBvZiBycGF0aC4iDQo+IC0rICAgIGRl
ZmluZSBMREZMQUdTX1JQQVRIICIiDQo+IC0rICB9DQo+IC0gfQ0KPiAtIA0KPiAtICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0
ZTNfMy41MC40LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41MC40
LmJiDQo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCBiODIyZDdlOTE5Li4wMDAw
MDAwMDAwDQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTAu
NC5iYg0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xLDEwICswLDAgQEANCj4gLXJlcXVpcmUgc3Fs
aXRlMy5pbmMNCj4gLQ0KPiAtTElDRU5TRSA9ICJQRCINCj4gLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL3NxbGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3
ZWQwMGM2NiINCj4gLQ0KPiAtU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNS9z
cWxpdGUtYXV0b2NvbmYtJHtTUUxJVEVfUFZ9LnRhci5neiINCj4gLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhM2RiNTg3YTFiOTJlZTVkZGFjMmY2NmIzZWRiNDFiMjZmOWM4NjcyNzU3ODJkNDZjM2Ew
ODg5NzdkNmE1YjE4Ig0KPiAtDQo+IC1TUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtdGhlLWRp
c2FibGUtcnBhdGgtY29uZmlndXJlLXNjcmlwdC1mbGFnLXRvLWFkZHJlLnBhdGNoIg0KPiAtU1JD
X1VSSSArPSAiZmlsZTovLzAwMDItQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2giDQo+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUxLjAu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUxLjAuYmINCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uMjU4YjJjNjUwNQ0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMu
NTEuMC5iYg0KPiBAQCAtMCwwICsxLDkgQEANCj4gK3JlcXVpcmUgc3FsaXRlMy5pbmMNCj4gKw0K
PiArTElDRU5TRSA9ICJQRCINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NxbGl0ZTMu
aDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiINCj4gKw0K
PiArU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNS9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MmUyNmRmZGQ5
NmFhMmU2YjFiMWJlNWM4OGIwODg3Zjk5NTkwOTNmNjUwZDY5M2NiMDJlYjljMzZkMTQ2Y2E1Ig0K
PiArDQo+ICtTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxp
Yi5wYXRjaCINCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVj
ZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGlu
ZSAoIzIyNjc5NSk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL21lc3NhZ2UvMjI2Nzk1DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL210LzExNjQ3NzIxNi82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVu
ZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJl
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1
YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoN
Cg==

