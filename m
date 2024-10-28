Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AF1D339A1
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 16:56:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.56])
 by mx.groups.io with SMTP id smtpd.web10.57152.1730134604817181052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 09:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OK6xUUGT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OK6xUUGT;
 spf=pass (domain: arm.com, ip: 40.107.241.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dbcgx6X5mujWKjiHqYeoMDcoxRvJMgMiKhP74PsJJ1nY6z0c9rsp8JbsKdoR8Ots38Lj17/jm+kGJ4QhDIpfo35spI2wwg5p6lglOifYNiRxzzxM7OnRG3bIUBpqha+z84mKdauqJqt0qqgxOq5ZVHzXZOuVg+/HPi+crX3RfP1vlFqxBknLwPZUTQI9WyXu50I6+d1AMY+K+GgX12VwlffO+D2Z5bJ3QNHwl/H5TlbxRTvPT/vm0JzOR7nDzhweNQwb4o/keEsTSybzC24l1mek5UOEw3Fn7e83j0zIVnxxYqNkCw8+SoOJqWCyNXcOqHrHVTaKuFJRZEJiHDkZmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agAtmoR7kaEZu+lzqCi5233qN73vCSpSDchvNFjasWM=;
 b=LijuHFM8dgB+Fi1nh2poPAverAP7ji0WHOMTDjjfhHBdopBooGxafwYH7u/MymFm4l/8yqiji2EA9p2PSZuMYgu3ESiDkhuu9QcPPxiyV1bkeHgYuuJiP7mGYfv8G3Fpxwdff0IywpmIpfqrU7ocumqY7LY6Iz5ct5EafJUWkSgj93jsVtCAhJs0Iqp9lmtIi9xhxQj68fE2pgpgMPiuZbWxdWaw15BPvhXks43K1Hr/kK8lutU9LiZRM17B937nBOsJbI6KPJVqA/yfjqVRkYefzjDp857+nICyQogQ8cApLJUa2V7J2XiSmweVbmYIWkQkXELDZC/lH+NfeDJkWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agAtmoR7kaEZu+lzqCi5233qN73vCSpSDchvNFjasWM=;
 b=OK6xUUGTol3PBZUXRzMWSnypcvqEk3llFX8MMwZR8qL9c+CC7a2fMQOaq0DfnQ5pr9ZyQF+fsOep57xK7+XPInR6sWDWPI8NczUfXlHtUXajexOcyWLF/R92r3IiQ04GOCJZqmnKedvvwpUyj3ywPKXRMo/BTY9tGtsWN7A3c10=
Received: from DBBPR09CA0048.eurprd09.prod.outlook.com (2603:10a6:10:d4::36)
 by AS2PR08MB9620.eurprd08.prod.outlook.com (2603:10a6:20b:607::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 16:56:38 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::13) by DBBPR09CA0048.outlook.office365.com
 (2603:10a6:10:d4::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25 via Frontend
 Transport; Mon, 28 Oct 2024 16:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16 via
 Frontend Transport; Mon, 28 Oct 2024 16:56:37 +0000
Received: ("Tessian outbound 57fa7becdebd:v490"); Mon, 28 Oct 2024 16:56:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fbab374ab692ca8c
X-TessianGatewayMetadata: Wgpg7nnbHbuRtSxfgLqv4LlpbWLHmQdw9KZ5RwA3vleiof2WEAGrJAg2a/wh5r/XrVSuU+y5iCxQV5FLQZCzHidrVkY5jJY9YRdXz3gTrxZPLTTDqe/97o781dVaEG1eSBk4aeW4kz7eJfR4sTl/5Gcxw4+ySNUMev+PFBBO304=
X-CR-MTA-TID: 64aa7808
Received: from L71d3c71eb456.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E055702D-8E17-4F0B-BCC9-247058929AEA.1;
	Mon, 28 Oct 2024 16:56:30 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L71d3c71eb456.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 28 Oct 2024 16:56:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hknQs9ah6S+5IOO7qpgUgR2NjdvHrQNGp2jLwZfPluRlstCKAZhUyUJmAdavBCL6OVTxrTsj3w7LiCntWU2+oamdwR9ijvOGvsKodO7eMqIW/p/RV1W9VygYV3rQMR8KExLHEr/PwCcUsSY2C0/AS+QXxRCs+VeJsGkWqOTpc0bN6w/9YgrG3RBQD9AtCIR9afdjvcyFbTqximKAeNEojcthPYlfK6WTGXclN/cZDXz4X+CDGxibV2PaitYPR3gjk5Nvkmg2j/olRAS5RUZrepUynNd1msOxhD3IsqKCRu+0LUnf+QPWiPdzqhuIiQhI0fGrU15nG/RvCyEiRJCRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agAtmoR7kaEZu+lzqCi5233qN73vCSpSDchvNFjasWM=;
 b=ufHgeWCZXismvT5InwZCsD0ct1wFo9cOak0m6KTg8B0eEW2ez+7ZaycqqXZM5/v2ddWc4PAnHZORFRyFzoNvpTPyJILXvHdilfYlLMmawKrpwNm7rRxCJy9KaOG23icCO90yLzHQj1bXBWoAMk4MGc6CpMPDhKdzi94+fUBGoMcBZDJgY6KN8VQ85xhDCUBwSNqP6OwiyL0KXe+j3fyHNDetaAYxJneM4WCe3As2CQGM8BBbMehB87VMiPXXBknUQI+qOIlJbhPfIy1vOhCTTI9SGKJ71B97oNU+KI0IFUTPfPDq8w+6RTF6BxkwEHdBV5Mat2CF9oSozAL2e9lRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agAtmoR7kaEZu+lzqCi5233qN73vCSpSDchvNFjasWM=;
 b=OK6xUUGTol3PBZUXRzMWSnypcvqEk3llFX8MMwZR8qL9c+CC7a2fMQOaq0DfnQ5pr9ZyQF+fsOep57xK7+XPInR6sWDWPI8NczUfXlHtUXajexOcyWLF/R92r3IiQ04GOCJZqmnKedvvwpUyj3ywPKXRMo/BTY9tGtsWN7A3c10=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9943.eurprd08.prod.outlook.com (2603:10a6:20b:546::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 16:56:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 16:56:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 3/3] python3-libarchive-c: Avoid using
 find_library python API
Thread-Topic: [OE-core] [PATCH v3 3/3] python3-libarchive-c: Avoid using
 find_library python API
Thread-Index: AQHbJEuGQPZrPacdn06DwPyDX7cLMbKcO28AgAAQR4CAACBOgA==
Date: Mon, 28 Oct 2024 16:56:27 +0000
Message-ID: <DC736C63-58DD-4B40-BCB9-F8F009BD4D47@arm.com>
References: <20241022062721.4131585-1-raj.khem@gmail.com>
 <20241022062721.4131585-3-raj.khem@gmail.com>
 <05DF9D37-9545-46B5-BA96-81F6480A4F08@arm.com>
 <CAMKF1spnEVQ+QnF_W85yXnjvC5Ysne3AwcN=6Oq9x7Q9vVSjFg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spnEVQ+QnF_W85yXnjvC5Ysne3AwcN=6Oq9x7Q9vVSjFg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9943:EE_|DU2PEPF0001E9C3:EE_|AS2PR08MB9620:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed63827-121c-421f-7056-08dcf7717cf5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eHhTZ2Y0ekdsZ1J1ZHU4VncrWW9kWmJhYUdOK3hMclRJNiszalA4T3JXL1FS?=
 =?utf-8?B?bm9ZanRNdFlnOVpOaXdSZHM3RkZMTlZzRlN0QzZRTEFGZ1Z1WUVpc2NTK2l2?=
 =?utf-8?B?ekxkSDQwbEJjdUwweHY3dlZVUzBKK2VUSHRGY1Rub2pnd1pFSGlteC9zSzVP?=
 =?utf-8?B?Y1hqei9DaFFXalBHbVIwMXdYWTFEWXRPMzhLSUJ0VHBkWHBreS9ybitXOUZO?=
 =?utf-8?B?WGpoZHAvMjRWM1NPODdIQ1p2MFowb0R3STZYMWNyK2FKTzFUYVpVaGtZM2lV?=
 =?utf-8?B?VEl5V2ZxaWh2MG42THFMR3k3RkJaalZjQ2x1czM3Y2lWTkpKRmRIdGVkRFl1?=
 =?utf-8?B?d2plYU1Yc0R0VlREVm9EeVdLVzl6Wm1QendaL0M1YmNjQkJTdTdkUisxWmx5?=
 =?utf-8?B?UGUzRGc3RVhtM1c1aG8vTWRkbkZrK0JwR0p3NmJlbDFBWHFNTVRFcGZuKzZH?=
 =?utf-8?B?SlpKMHdpek5wQVVUbzIzQlRrR1NpT0c4Y3JkaVJHZFhkNXJXREgwTGVIdjdu?=
 =?utf-8?B?eWgvS2h1ZEhRajNrMVZoNzdEOWN5aTZYVWRjZmJqMmZpRTJRbURsU3U0SXp5?=
 =?utf-8?B?N3JKU1ByeUNRdkRCbzBkSExkZGxDNHNORm1HUmJEMGloT2FjUStiWE9lVS9Z?=
 =?utf-8?B?VzlqcHphNEJFY1laa0lsa0Y1OTE2Qk9aSFU2U2NoNklJUlo0S2pkSTZSbTM2?=
 =?utf-8?B?K1A2R2ZVMkt6R21pRG4zZ3VJZkdOaVdNTUlpUUM2c0w2WU9oWlVCL05kY2Zp?=
 =?utf-8?B?SmdsaUI1MUVMaERkRXZNKzB0YW90N1F0RUZJNTRoWVlRSzNwclhlSklDdEM0?=
 =?utf-8?B?R1VMK0Q5MGw3NStYczFUM0t2SW1ueHhNenRiSVRqR2QwTTdHeWM4MjAvS01n?=
 =?utf-8?B?NGRkWEw0aWFCNUlCdWc3QXI4ZHBzVzNhNlhtT1BrKzIvMmkyUlRVdzg1bVhp?=
 =?utf-8?B?a0c3UEMzclRoYTg5UFd3NDhydGNkL3NvakJML3hjUnNkVkVUOWVFczEvOWU1?=
 =?utf-8?B?NmxBVXkrVGpmYXMvbWE0Y3dNSnNTbGpXZ3YvY29qZEJ6YUFpVS9RMG1oU3J2?=
 =?utf-8?B?L1o5TzRiN0doaU1uV25vakx4VUtFWXh0ZVpKTkt6T29xNjdKblE1UjBvWGhh?=
 =?utf-8?B?c1hmcFhnNkJxZG1FK3lscC96NUFISWsxa2YzVUlmMXo5em4zMU9qZWZ4U1VR?=
 =?utf-8?B?MTVkeEhrNVdwazQ1QmlqQlNlM0RKeDRhTXR3L2dka2I0UDZYdVpFUGg0ZXVM?=
 =?utf-8?B?NmQrQ3hCQ3BVSEdHY3o2T1BYSk4xaTZLbnpRTE5PT2Zmc3lIMHZuaEtONE0v?=
 =?utf-8?B?OEtJbjFhWllnVEdIYTR0RTNDR0dsRTFxdkdlanVOeEdPLzAwMjdzOVRQOE1T?=
 =?utf-8?B?ZUt0LzFnMlcyQWp2dlp5ZnZHMWdvZzRSVFJ0QWxIbk5YbnRRZHVmUlA4c2x6?=
 =?utf-8?B?cEZGUk1id0ZxZWIzSmpkS1dYRXFOaDRaNUtGV2hBUVhkUjJ4Z2ZGS0xvUmFv?=
 =?utf-8?B?NXNySHNWeCs5VE9HdXNTK3BhOTRaUUNGa1BsMkVMNy82VS9CVGxIY2diNnh2?=
 =?utf-8?B?SGdnRDlhcjJ0dHZEVWV2WDJkWEk2elk4ZkFDV2tDZGx5b3Bia21VQUFaeE8w?=
 =?utf-8?B?NlB3dU4weUNBaWNSc09SZm5iNUgzQlRKalpsS09GNk1JTDBDMHRxdTl3QS9i?=
 =?utf-8?B?RldtYmVaMWdWT2Z1clhJaDRrd0dFVWdLdU44RFRLMlZqOEVyc3d5T1RZbTZ3?=
 =?utf-8?B?cVltRUtUQWhpNEt0eUdIcVlaU2RGOGpHUngrSnNRZVNGOEpDcGhiRk93MkZm?=
 =?utf-8?B?M0M4QTkwdlhFM01Yb3h2RVpCU21qLzBnbWYxY3dXaUkzN2s1aVJ2aVpvejFL?=
 =?utf-8?Q?d9zymsBnyaGXb?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BFA2509EFC03445ACE5B4BE47C1CE2E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9943
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	13596f49-91fe-4721-c51a-08dcf77176f4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHB3NEkxcExWY0FkNHExTFovb21oQzNOS1hmaHBaclk1UDkxMDNjd05UeEFZ?=
 =?utf-8?B?YlAxcTNZOEhWSUpiRC9vVFU0eWgyMkpIMm9CNmhZVGoxcnBKTzc3enRBcGdC?=
 =?utf-8?B?L0VIbjBJcFVsSkdwUDUzTHVZRXUxZW9FamJpSlVlT3hPZllrbDVqVE45MjdE?=
 =?utf-8?B?NkswbEt3czJieHRBL0VOQXpESCtHTTluR2ZacHBEVlRuS3FIYklvYkt3emg0?=
 =?utf-8?B?Rk8vMm9jS0ZPREtLVWcrSHErMGtscmNaOXlQQkdnaS8yTFJyeUZMYnYzeEJ4?=
 =?utf-8?B?U2N2eUxWcS9uZWMvSytlQTBScTJ2Mmo2eFZQQS83K0xsb1p5WVJmZWtYb3Y2?=
 =?utf-8?B?Q0E3dmplTmVhbHhPdjZjQVdYazFiakZjN0JEUVJWblYxZG5xa3lrU3JZUmNm?=
 =?utf-8?B?Mmdad1hHU1gzVWxCOXJGSlV1QTlTRmEvU0dzTkJpQWR6STVyTWJ5TlpjSXlP?=
 =?utf-8?B?OHNEVndkRjV6NVh4SXZ4VlVvRFpQV3lCUHQ3ZmpNQmV0NElEVU56dzZoamNu?=
 =?utf-8?B?aTNyZlh1ZnpITXFhb2V5aWVwc1c4dGFvcU9JeklhQnNNWXhBOTBLb2FwN2l1?=
 =?utf-8?B?Sldac0VzVTYrbXVxOUdpYXhLK0VWaUh3azF0eEZoY05DM1RvTENiOGVJc3Ar?=
 =?utf-8?B?VC9GMjdpTTQwWHQ2c1YvVm83TVZ6WFU2T1lpZU9hUlV2Q3pnWkJNKzA0Y0Zx?=
 =?utf-8?B?NGgzaXJiSVdEd2tYSzV4YmVHLzlmUCtxalVFV2hlOW5rbnNtLy9kbUFOUkN6?=
 =?utf-8?B?R1dnek5mUVZJcVRncnNsN3NMeFF6amxGSkFYejhzU0QxbVFKdlZJaHNES2Rs?=
 =?utf-8?B?YlNHVmNUMWJSVmxZamR4TTIySm1wTU01RVdmTzUrYmJ5SXA0ZTlWMXZEM0pV?=
 =?utf-8?B?Z29JZjlVVnJqNUozR1doQTdaYzROL0tFbjhSMHNITXQrNDhvM1pkODBYTWRY?=
 =?utf-8?B?b1V6YlAzMmNWclRob2VmZVMvQ2ovVXk0VXJkWWFjaGZQcmJMUnBzWFphS2I1?=
 =?utf-8?B?bW5uaXd5KzkwV2FqMzQ3TmVMU1BHa3YyeWxSRXBMbUJvMjBHT3FpYTZZOHRG?=
 =?utf-8?B?UDE0UDNPQ0lwSnZNYzloUkVJVGhLM29aQjJWSGRIZ2FXdllLeG9nTGFBcThq?=
 =?utf-8?B?U0tzZE9HY05WUVozK2ZabjBPdldsM2xCYWluZUluMC9WaHM4cmMreEdqeHNo?=
 =?utf-8?B?NjNjWmRpRThUVyt1cllicXlCVkE4bDgyOEpFS2V1cGdFeGxxZHA0V0FzU2hE?=
 =?utf-8?B?TEFyQ0c5cFpiNDRsMDd0MUkzTk9Sb2RLR01FOWRUVS9rV0M2N242anRlaEZN?=
 =?utf-8?B?QnpGbW5KODAvU2lNUUZwZ2xhK2NWSDd3MU4reEMxVTgva3lmNVF3OXc3L3ZJ?=
 =?utf-8?B?OGlGS2h6Mi9RVVl5by9tV1ZHcW5WalQrSC90N3Q0V2h2bDBOOGR4YVhpaG0x?=
 =?utf-8?B?eHBWYnZSSW9RVDBjc1pwcXRNb054am9TR3A5Vm1JRkpWTWxabHNlL1plbHZC?=
 =?utf-8?B?K0ZRNURKRW15UTh1cGRXSUxQY3dMdmN2QURVbndERVhiR3FOeE1LSGVZdkcz?=
 =?utf-8?B?NlR3K0xaS3NHU1Y2a0Jvd00wUER2Nmg2QXBya2liMzBGT3pMR2xoWTA5YnB1?=
 =?utf-8?B?YlZuYlNnT2tLNkl4UVJXOWFjUnMxNHYrWHNPS0dxV3hyRDQrb1hqVVNtVDFx?=
 =?utf-8?B?ODF6cHNmdjcwSVZkK2xZOEswVXVPM1d6UDJJZ2JWK3ZyUHp5ZXMwS0xtOGxU?=
 =?utf-8?B?TGRUWTI1di9zUHA1dnVsU0hSbE9hVzFuS3Q4VHdBT1dSbTZpNzA4ZnY1ZnJP?=
 =?utf-8?B?YVBEU3FLZlNkNG9KOHp3eVNRbWU0eU9TWGVUSkMxS1dBOGx0UDdodnB4eE9t?=
 =?utf-8?B?MW02REIzM3ZCNFFYUWt6L1NPK0pzSkR4VTVoVEM0SWVXcmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:56:37.9592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed63827-121c-421f-7056-08dcf7717cf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206452

T24gMjggT2N0IDIwMjQsIGF0IDE1OjAwLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIE1vbiwgT2N0IDI4LCAyMDI0IGF0IDc6MDLigK9BTSBSb3NzIEJ1cnRv
biA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IE9uIDIyIE9jdCAyMDI0LCBh
dCAwNzoyNywgS2hlbSBSYWogdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJhai5raGVtPWdt
YWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiBmaW5kX2xpYnJhcnkg
QVBJIGRlcGVuZHMgb24gcGxhdGZvcm0gdG8gcHJvdmlkZSBsZGNvbmZpZywgbGQsIGdjYywgb2Jq
ZHVtcA0KPj4+IGV0Yywgc28gZWl0aGVyIHdlIGFkZCB0aGVzZSBkZXBlbmRlbmNpZXMgb3IgYXZv
aWQgdGhlbSBieSBjb21wdXRpbmcgdGhlDQo+Pj4gbGliYXJjaGl2ZSBsaWJyYXJ5IG5hbWUgZHVy
aW5nIGJ1aWxkLCB3aGljaCB3ZSBjYW4gYmUgZG9uZS4NCj4+IA0KPj4gT0ggR09EIFRIQVQgSVMg
SE9SUklCTEUuDQo+PiANCj4+ICJPbiBMaW51eCwgZmluZF9saWJyYXJ5KCkgdHJpZXMgdG8gcnVu
IGV4dGVybmFsIHByb2dyYW1zICgvc2Jpbi9sZGNvbmZpZywgZ2NjLCBvYmpkdW1wIGFuZCBsZCkg
dG8gZmluZCB0aGUgbGlicmFyeSBmaWxlLiBJdCByZXR1cm5zIHRoZSBmaWxlbmFtZSBvZiB0aGUg
bGlicmFyeSBmaWxlLuKAnQ0KPj4gDQo+Pj4gK0RFUEVORFMgKz0gInBhdGNoZWxmLW5hdGl2ZSBs
aWJhcmNoaXZlIg0KPj4+ICsjIEF2b2lkIHVzaW5nIGZpbmRfbGlicmFyeSBBUEkgd2hpY2ggbmVl
ZHMgbGRjb25maWcgYW5kIGxkL29iamR1bXANCj4+PiArIyBodHRwczovL2RvY3MucHl0aG9uLm9y
Zy8zL2xpYnJhcnkvY3R5cGVzLmh0bWwjY3R5cGVzLXJlZmVyZW5jZQ0KPj4+ICsjDQo+Pj4gK2Rv
X2NvbmZpZ3VyZTphcHBlbmQoKSB7DQo+Pj4gKyAgICBzZWQgLWkgLWUgInN8ZmluZF9saWJyYXJ5
KCdhcmNoaXZlJyl8JyR7bGliZGlyfS8kKHBhdGNoZWxmIC0tcHJpbnQtc29uYW1lICR7U1RBR0lO
R19MSUJESVJ9L2xpYmFyY2hpdmUuc28pJ3wiICR7U30vbGliYXJjaGl2ZS9mZmkucHkNCj4+PiAr
fQ0KPj4gDQo+PiBDYW4gd2UgcGF0Y2ggdGhlIHNvdXJjZSBpbnN0ZWFkOg0KPj4gDQo+PiAtbGli
YXJjaGl2ZV9wYXRoID0gb3MuZW52aXJvbi5nZXQoJ0xJQkFSQ0hJVkUnKSBvciBmaW5kX2xpYnJh
cnkoJ2FyY2hpdmUnKQ0KPj4gK2xpYmFyY2hpdmVfcGF0aCA9IEBMSUJBUkNISVZFX1NPTkFNRUAN
Cj4gDQo+IFRoaXMgd291bGQgbWVhbiB3ZSBkbyBub3QgcmVzcGVjdCBMSUJBUkNISVZFIGVudnZh
ciB3aGljaCBpcyBhDQo+IGRvY3VtZW50ZWQgd2F5IG9mIGNhbGxpbmcNCj4gYSBub24tZGVmYXVs
dCBsaWJhcmNoaXZlLnNvIHBlcmhhcHMgd2UgY2FuIGRvDQo+IA0KPiBsaWJhcmNoaXZlX3BhdGgg
PSBvcy5lbnZpcm9uLmdldCgnTElCQVJDSElWRScpIG9yIEBMSUJBUkNISVZFX1NPTkFNRUANCg0K
WWVzLCB0aGF0IHdvcmtzLiAgSnVzdCBzb21ldGhpbmcgdGhhdCB3b3VsZCBhY3R1YWxseSBmYWls
IHRvIGFwcGx5IGluc3RlYWQgb2Ygc2lsZW50bHkgZG9pbmcgbm90aGluZyBpZiB1cHN0cmVhbSBy
ZXdyb3RlIHRoZSBjb2RlLg0KDQpSb3Nz

