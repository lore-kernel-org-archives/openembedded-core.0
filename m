Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C09DC48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 12:53:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.52])
 by mx.groups.io with SMTP id smtpd.web10.40333.1708347230120551532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 04:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eUrJIrUw;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eUrJIrUw;
 spf=pass (domain: arm.com, ip: 40.107.21.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iWtF1lysW+J/kOResaz90gdc9FXYpwZWkAIUO2R6FPyEgJHrEm2l9tdOJ28bJ56HLg3GRGqLe5vIN5dTueadrJRdlqWDQzSh4v2wmKL2wNVOm8M64L/ejh1OEKPIY/PsmZXUMK2bOJWkXiUwuK7ZX1CmYta01l25MWau7PCaRPexsAlyBeaHJBZTK1TAOrIMzSX1Wq8ki2RqGlA/L5BMVbqanbpk7wf7mtIHLUi+Gp5YM2/6ZITO8AhPMmK8TX36/2LtqGElQXRyQzlmwRzPohJYm8TgTj95yLjXaXoItCFcwE8mf49WVkrjWEqnOF16pFimJG4ahZbGq9XtMoonGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQy2VHShHXMIxbawHszSZT6IQp/qBgEDzecWy4fVxfU=;
 b=AeYdKcBXP9C2wG1egaakBexrEpUbizTeAHXbmtzfovjeTJKBy6euZckN13YUEkzeSi4TPLDEAfF63McQfpZukhIt16hpsGUBrRK/ungLZm50K2SmyZsKVUIzYJMBPowG42sPp943kBqmUpZrBDMmt2XcB+ciyflJ8fFbrRKHi8/lmHyuyCeEYDtfhxSNRNsrWtY9A9+ojr/uly7dKp8TjxUIgZVx7BFq87iReZdeshBxagiB0Ib54H+q37mjzEo9AarBIP5ss+VAMd2AsvlE2XnvYJLWYI2RxcKGZqEH9kBMBlnM84wdV9QSV4pK/4vo+CV/bqZTfzv3R6vOOzYoxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQy2VHShHXMIxbawHszSZT6IQp/qBgEDzecWy4fVxfU=;
 b=eUrJIrUwnKRbjKVUvyifvp5oyYlFZl08yeXraOudpzXNzJ9VLrK2n9pbVMV4sO1HE2OShDCWisie5vBP+ZukU4yyU8/D3JJeppHo8H3nG7U6vMOwuf0QWyQeV4l5d8XB3UwUogW6vwBq2qlloqCmXjUn89XebZbjeUW2wiSXiWI=
Received: from AS8PR07CA0043.eurprd07.prod.outlook.com (2603:10a6:20b:459::12)
 by DU0PR08MB8470.eurprd08.prod.outlook.com (2603:10a6:10:406::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 12:53:46 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:459:cafe::c7) by AS8PR07CA0043.outlook.office365.com
 (2603:10a6:20b:459::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15 via Frontend
 Transport; Mon, 19 Feb 2024 12:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 12:53:45 +0000
Received: ("Tessian outbound e358842a0ad8:v228"); Mon, 19 Feb 2024 12:53:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96d6bf6f32009f6a
X-CR-MTA-TID: 64aa7808
Received: from 5f6bc7bff650.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6B90A417-3A3C-427C-A1E9-1573BFADC1B1.1;
	Mon, 19 Feb 2024 12:53:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f6bc7bff650.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 19 Feb 2024 12:53:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4M8gFCed8/wh1sw3Wolnk1K7/w4jMUJEPFJyOPQ4bQccMipsXm9DO0Ru74R5O70JZMXmKsrkeQZFFMbtqDr35RpiSHfpYChn0txgv2wzLeGwTFxENJOr//2OYDWEes+1Xlqz6eBgOMSEuDXfmRWSeYinvS+6QMrn9D5FllUv0jQ+Ect01GcBL6UbPGWQSoCnHZxz2WHHaREeaZjDDt/4UXXPr6CenR0rjg0Hy/L6PvbDYrAtQOeYLrvZiLmR5LMyILaXr9fYdckDUeLV3Ks25fl58lAAuspcYf4K6PD/qk67+4j5d6qR0f5zzUf9QSIjjzaDfJfgOBHLaMYP0qSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQy2VHShHXMIxbawHszSZT6IQp/qBgEDzecWy4fVxfU=;
 b=WDWmivvQFBx3OBS8vjoe3ON3tt/WEPNyXJItlPt38U0ZOaJG1zvdt7eMdpuDeDkjnDIHNji4jUmL37llFtvZDvnGwrLwRfzdRAslSen0NxPcr2orQGtNdtEmMUWPNyPAl3bR2z/wuDrcQ/K4y16vNs05Ab7oz3Psh5toj3MMsc2pEQu2mBbOpQ+0dmk96d8tEg9tHx593mKthVR8tmnmPS7MIooKy7/6D/hUCU1OGwnJ4jRhIbMwnjRAahhMpvScV9q6MomjvzJ1RZvHlEj/bl0OFrELoB1NQovIA7IjQ3bHrApmitJEElSeAoL3U+LyTptX0rkvxCehcsumrNiAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQy2VHShHXMIxbawHszSZT6IQp/qBgEDzecWy4fVxfU=;
 b=eUrJIrUwnKRbjKVUvyifvp5oyYlFZl08yeXraOudpzXNzJ9VLrK2n9pbVMV4sO1HE2OShDCWisie5vBP+ZukU4yyU8/D3JJeppHo8H3nG7U6vMOwuf0QWyQeV4l5d8XB3UwUogW6vwBq2qlloqCmXjUn89XebZbjeUW2wiSXiWI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9598.eurprd08.prod.outlook.com (2603:10a6:20b:61a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Mon, 19 Feb
 2024 12:53:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 12:53:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2 3/5] devtool: Make use of
 oe.patch.GitApplyTree.commitIgnored()
Thread-Topic: [OE-core] [PATCHv2 3/5] devtool: Make use of
 oe.patch.GitApplyTree.commitIgnored()
Thread-Index: AQHaYtMbmnbr1VdzLUeeGOG7hisRZbERn5kA
Date: Mon, 19 Feb 2024 12:53:34 +0000
Message-ID: <55B5D690-26D6-4B12-92A1-B753EA66D486@arm.com>
References: <20240219012832.3090768-1-pkj@axis.com>
 <20240219012832.3090768-3-pkj@axis.com>
In-Reply-To: <20240219012832.3090768-3-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9598:EE_|AMS0EPF000001B1:EE_|DU0PR08MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3758c6-3a68-4997-934a-08dc3149cf48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /KmtXnz5QoPdDieb9MGbZ5XYd3fJIyl6E5qneNkrE+BFKQpTuntOKlEzXxJUy7oilR+JdrEGX7d6+ysBHp3TED/K1LxMgq48Fh1XKl2FiTuy9lyFCKaqowImkv5Rv3G9LYhq5tWWHOSUQRhErpeo1Z5GRvId8E/CfJF01mcAp36rNMMPLcrsFeVY8thhoxjrxsQb1xfQyAHwHqyWjdCgIy/VsVzafjfm1LmyZSZi4eEVudd+qmAZOsY8UDm3RUn7qRRoPdKsjLkljEAWDVf16Owvfn9/VCoGu+eNo5O1rW5Vb1fIACoTNqNwjI3kzjnfi8GStQV+1oUNbDLt/w6hIiu1+8wSmsDpiG9mq+DM/LUO2g5yoV+QU0rSLXLxQfe1fwiR71bSzIfoTzbVXHBs5DL+4JKshC0GUDM3GMAXPubBvSCND6YgCrLHrBDiRud6mUNONId26ARKnX5TE7lYQ7KrWNxyoso6zsnz/S7qViobOqQNJWLDlR0UKtFHoWBuBRI87FUV/TBBqh4OKHHhelu40Jl8R6PJ5JPcWcn+cs+BgGHPqxHzRl90j2/lOXs0tiqnXEquoFOooJrI6eG7J1g54V7T5ppebJeTQiVxYd1KHfN/CT08vwZIJCI4Vr/O
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <98DA8FCDFBC1E4428BDA752EDB4DC39E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8ccdc7f5-9ccc-4b35-d89e-08dc3149c8b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	22PsQ+/bCV3mwX33mCJRQOcOEZEN+Iule4t8UcWXdxO4iDNOIDug3DWcRRwDt7JriNdhP2jeSvt028KZB11AIKF/KkOtFFNTyvuROY7MOd806vs6IZIgdcS7iLbY9x7AiyfP/6nBr8HebBdRkALp2wHxLxjnF5LbDPZEkrlqUu/rqSZBpvh/pymHkaIKNEOBPMo39iZ+1/6A/95HElnLPJDNPD5STMFxcKQcpQHwMgDLQF5yqfsK3pLBo1H5Nk4kK2woBoyd0fF0NYI9iWm2c9wIDKc4uPjBKr5/Zg8hp0h54sttPeKZyTRfeLOVOuuVRoq6kuAxwob2xkgz4Shopw2pNdcbGo40ToLETxNrPIfdjhgQaJrSU3hrLWn8/3mmudIrqsVd/Us9XHeeYVQ8XXqKA0N6krnn5VWcfaTjg9QXMguZ8c5GNcjVxDIBkgJWz0LWLVQCPl1nAPx06WuGyGcZ0YMNrXOUhZVNbocxUJYXBMfYriXErUn7kfgg4lXF762OpvqClRiwJY8Athpx92cqLhaf7c0gASef40IOdWO9F8uIsp56M/JhMMP1afvHvXIM7epFCUptvHq3L6QsJR6WOrdfcxXr9FzL5Ismp4D4EXoGB6Ij/zO2ZgF5B66Xjn5eUJ26EeRUzlrVUh6XfK4GnUKHZEDHLdy/roD7h3M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 12:53:45.9312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3758c6-3a68-4997-934a-08dc3149cf48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 12:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195872

T24gMTkgRmViIDIwMjQsIGF0IDAxOjI4LCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHBldGVyLmtqZWxsZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgbWFrZXMgdXNlIG9mIHRoZSBvZS5wYXRjaC5H
aXRBcHBseVRyZWUuY29tbWl0SWdub3JlZCgpIGZ1bmN0aW9uIHRvDQo+IGNyZWF0ZSBjb21taXRz
IHRoYXQgc2hhbGwgYmUgaWdub3JlZCBieSBgZGV2dG9vbCBmaW5pc2hgLg0KDQpJZiB3ZeKAmXJl
IHVzaW5nIG5vdGVzIHRvIHN0b3JlIHRoZSBmaWxlbmFtZSBpbmZvLCBjb3VsZG7igJl0IHRoZSBp
Z25vcmVzIHN0YXRlIGFsc28gYmUgYSBub3RlPw0KDQpSb3Nz

