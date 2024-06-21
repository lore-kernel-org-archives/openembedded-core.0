Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED32C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 16:17:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.61])
 by mx.groups.io with SMTP id smtpd.web11.77553.1718986618184019442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 09:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aW+QoROT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aW+QoROT;
 spf=pass (domain: arm.com, ip: 40.107.6.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Lu5W6FyGWrfN1rjE8q7S0L5I1vFGBcbmaM0MKVr8W5SogZRsWYXbo6ZvXgjsgIecJxl0Wk/OCoKZSCj0/gVZz1o2Z0qAcakWJ3vJHv4zyfi9hN1duyBOvdbd9VJAAP8jd8SH9x0sH+JmiFNxzwvFbpGaGQ7z7AIOAQtJPCYBX9Comqvl0bGYNN64Bj+B38Hc14X5PIbNWVgrddpNqvpY/55rk3xDTRuxR/R6ypvmXZKIoVjTKHW6uhW/RWrHIlOcMdO+eJVygCrOOOFGjG0DcV8sQNDXBQpfST2KwXHrNyKx6FTULxzhw+zfqhpbOWJue8ctPqhw2ZXIrjcYbwz1Ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esk6DhN6+evr/bvKH7jSLKnxBXFyibobewgYIqCJJK4=;
 b=Y8M03ufbVXXgtd6ZG85ESabWbrRhJis1d5IW8ST0wMivJF1n8nit/VwRCcR5qBZrlNH1dnXUgCO1Nlto3m+x7hhkIvEwwJSNhjZgPc2q/ERP8yLysth4Ow8vsOFF18zgUJY8pf9K8RLyoVmEpOodOXUP+L7JNJYZN9C+8qVm7DdG2f5zlAnfzw1bmb253UkqX3ACe+IDFYFEtqGS7DZS2TbC1un7PRmTMN4qVD4B4jhrvlDZTWXT+hEpYkllFzeHNTM74T66fuyLUmU0sNbOptRMOjhQ/dZyMcGEb8wUs9+7Z320N7vzeQAwOK9jA6UN1dNp4SErZqJKdzr5T6MPKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esk6DhN6+evr/bvKH7jSLKnxBXFyibobewgYIqCJJK4=;
 b=aW+QoROTMCrrO5kIhpCd5sFqXRLr4dZhGNQAeqbFptZnsyiZ8Q5r1X59EyJAMWtB01YDOQCrrM8VRFt7Nako+TAV7yBsom0sA6UqRbKD3WuoVer/Z8TwiVn/6k4UPx3vXrESFkyVO9EMHmL72ayEQWOEm0+hs7+wFYKwgrsbNX0=
Received: from AS4P251CA0015.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::17)
 by AS4PR08MB8022.eurprd08.prod.outlook.com (2603:10a6:20b:585::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 16:16:54 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::f5) by AS4P251CA0015.outlook.office365.com
 (2603:10a6:20b:5d2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.36 via Frontend
 Transport; Fri, 21 Jun 2024 16:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Fri, 21 Jun 2024 16:16:54 +0000
Received: ("Tessian outbound fcd698738a24:v339"); Fri, 21 Jun 2024 16:16:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a298313516366485
X-CR-MTA-TID: 64aa7808
Received: from ac72390cbb4c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 95FCB13B-C7D5-43B5-9435-ADD4AC35D888.1;
	Fri, 21 Jun 2024 16:16:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac72390cbb4c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jun 2024 16:16:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHukRb9BVjzSvpEch5WYHxCuEhHMZJGJ3Hmo8KqkZxshQIa8psR0/rUehocGEyuDSfCQeq/rwUzCriT1ItZbgHaUlfKGdK7yMO0ac2pQkCoGbzlSDiunU9seTek8IR0zWVdIcx3WM0H95Ppa1BVIv1vTCG4q/Gacsz23P8iEdkrBz8WS8vnDBezxqsajtsfX6DDscyDeM5ykQ4EyxD3m9YFRfXIDUK/P1Z+wBq7zXlUUvzzWG4jK7QxkFF2XLN4ghkfLqV8PlNZrgMCPfbhnNiTOzEJIB3XG2nVVRuqopugBaQeA0XydNSvriQPWJpYZqplCn2ufvdfUH1BbAtfyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esk6DhN6+evr/bvKH7jSLKnxBXFyibobewgYIqCJJK4=;
 b=SpLsvVLTKn9VB07qBeaSTc5hLPCo9saEyEcYsXdMtSS4pxDPAY1Jm+qyBU3lQHXVmNbh8+2zF9xYeAIFzBrhbugMwG0RXBx2JFJ8wMUEJz0SFAqWCSFZw+rgKyus74I5JUacs/AOUPBqDVxaxpnq+1BTC1e9e8tya3dkxfcGFBRpEJsZyB3UdDT4FrpDNF5v9y7y/jV4Jvft8/OEeGubCab6nbWLgPdCnaX7TFtIpM6JO8YMs5+JEHtfziMxiB4ApyO30Cg7d6qwwa1Y9uDM/0DVo2FFMKpsgg2Ed4HD5IawHSceJAMLrgaT1iyha7/6z1Lu6zE4DDxY1pLIpoH4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esk6DhN6+evr/bvKH7jSLKnxBXFyibobewgYIqCJJK4=;
 b=aW+QoROTMCrrO5kIhpCd5sFqXRLr4dZhGNQAeqbFptZnsyiZ8Q5r1X59EyJAMWtB01YDOQCrrM8VRFt7Nako+TAV7yBsom0sA6UqRbKD3WuoVer/Z8TwiVn/6k4UPx3vXrESFkyVO9EMHmL72ayEQWOEm0+hs7+wFYKwgrsbNX0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6679.eurprd08.prod.outlook.com (2603:10a6:20b:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Fri, 21 Jun
 2024 16:16:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 16:16:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@syslinbit.com>, Samantha Jalabert
	<samantha.jalabert@syslinbit.com>
Subject: Re: [OE-core] [RFC][OE-core 2/3] vex.bbclass: add a new class
Thread-Topic: [OE-core] [RFC][OE-core 2/3] vex.bbclass: add a new class
Thread-Index: AQHas1rULLCf5rXyRkSNcPZp79FEKrHShgwA
Date: Fri, 21 Jun 2024 16:16:43 +0000
Message-ID: <181943DB-2E43-4328-B4EC-B90E0A1F9CE8@arm.com>
References: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
 <20240531130128.1258909-2-marta.rybczynska@syslinbit.com>
In-Reply-To: <20240531130128.1258909-2-marta.rybczynska@syslinbit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6679:EE_|AM4PEPF00027A6B:EE_|AS4PR08MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a6b4f4-c684-4856-b5ae-08dc920d90e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UmRURFZlSlljeC9BSXhKZkdEcFhIckxuR08zNUVhZHErVXlHSm5oTnNNb3k1?=
 =?utf-8?B?a1ZreTU2NGR2ODM2RGNDejBhL0l4VVp5TlVmVmQ3YXAwTjM0S1B6TVFEU05r?=
 =?utf-8?B?OWVSb09SZXZZcjZ6TlRiMUdJNEt2bTdDMVA4QXRKUXZKS3FLVElGWU9sdEtu?=
 =?utf-8?B?VytUaXZrYXpNVTZMNVpjbk1ndG1iOGp5YmtIaW5DcHZOalVCSTU0VS90eFE3?=
 =?utf-8?B?R0JyclNCOXplQUt0aEVCK29EVUdDRnRBdVlmYW5nRWx2ZkRHMGFpTFUxbEVQ?=
 =?utf-8?B?Qk1nL0F1ZE9YdVVRNmxIQml4VVZnMjdrL2ZlK3kxQ29TTE8wZzYzdm82QnNa?=
 =?utf-8?B?eDd5T1VWczc3TTgrODN5a2x0QjA0d2xuYlRjQkx3SXA0MThnM1lqTE1wNThm?=
 =?utf-8?B?eVk2NWF1d25ldUJXM1hZSmxxclhYeUVCVERyaldJYVNBd2RRc3ZReENwdTNF?=
 =?utf-8?B?L0VQMzhoUHo5NTJvNUk2STdRVHpWS2hiOVNmOURCWTZVMXNOSHV0ZVJ6TThV?=
 =?utf-8?B?MFgwL3Jvc293aWNGLzdaRHhqYUs2ZzMxQ2h6c0d6SDlaSFo4UGwxYXU5S0FD?=
 =?utf-8?B?amkzeURnT0wrOVhPL0d3YWxkVS9FdStIYSs4cTFkWnIvTSsyR1YxUC9iRWUy?=
 =?utf-8?B?dFg3ZHVsMXBnQUs2MUd6TFRMRm9KU2hKZnlqZWdYM2cyU3c4TUV1OVZnTVlG?=
 =?utf-8?B?VjFiRkRsdEN6eVdyUTdtWURRVlNyMWs1UE5LNk02TnR4YzhQRzVuMjkrRHRx?=
 =?utf-8?B?ODlBT2hYWnB3OVI0dEVNb3BjWEpYWi95RXJBd3V0ajVQL3RpNUhyc0s3Mm4y?=
 =?utf-8?B?elRBUUh1TnkwVjFSOHhrd3JMdFJOY0dIcy9SRkh6VENxWnNWaURGVVdoaXYx?=
 =?utf-8?B?QjlSTmI1dFhYNXVNS2hzTkxTQnprRjBXdFliZU5Zb3RuYm15N202RzJQYTM5?=
 =?utf-8?B?eUU4aDY4OXRpRlB2MVpiZ2tUV2l6b1UxS2hDRWFReWtZWGVTTlNmNkV2Mmxu?=
 =?utf-8?B?U3VKS3FMMFUxWWFjS1ZqMXlHK1FvYTF0RFczdmdjbUIrTGpoVm9sWVdUSi9i?=
 =?utf-8?B?dkptUjAvTEhYdEs3bVJ1Wm5mYUtiU2RHSTNEL05PUG9HVjd2TTZpdk95SFAy?=
 =?utf-8?B?elUrU1F4R01tQm5kVWJYUXpyeXF4aHF1SjB2dGZEd3ZQSE1RelY1dGVrM0dp?=
 =?utf-8?B?T0tXNmNlSm0ydUR2amowdk4vZmVka01YTnpEdkR5aDAyZHoreS9xQUxsTzZr?=
 =?utf-8?B?SzdUN1d4NjQ2WUlnWnQ2K281V0l0SlJ1MDFnSmdxdVZKQWtNVU1CdDlsT0gz?=
 =?utf-8?B?QnVZRm80MWpjVEVwN3lYYkxuRVlKSTFhYVFJRDdwRUVZQnFMcDRXOTZnNnpk?=
 =?utf-8?B?TDJFZHYreUhUYVBybU9lN1hoNG5jN3h5VzB2cWZLL05xSEx4KzJ2NzJpMDFr?=
 =?utf-8?B?bENTMU84Qi9uQm03dnYremI5S1pWdjQzdFc4dnFveXI0T1dWT1hTOE45REpE?=
 =?utf-8?B?a3k1QzUzVnNJbTdmUjFjeTZ6UUp4LzZuZld1Ym5QeGlVZm5pMHZxNGZuMExK?=
 =?utf-8?B?aUlHTFhKMWd0UHJwWFAvakVsSGRhYW9USUYwWmYyZmEyeHQ4dGtMU3VsSklv?=
 =?utf-8?B?ZnN6TGhHYlpvYmQ1Rmo2aDQvZUlFZDk5STArMHNDZHFXUjc1K1VsVjlyMUZj?=
 =?utf-8?B?YnQ0bUU5MWNySTd0NEt0V25uQ3dmTjRwdUVJb05ub2lDQW5SYmd0MElSb0tI?=
 =?utf-8?B?dVIrdi92VUtGWlhZMW1yVXAreUxuRmp2d21ZaHVHY1lZc1NHZzhEV2dOVFg2?=
 =?utf-8?Q?MtyiuozvZcHunu7kIl1SQHma0AgpEkhjQz1xg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6F9D21DB91E4349AC9D3FC864B2015C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6679
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3fc0c5a8-fe05-4a3e-f953-08dc920d8a59
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|35042699019|376011|36860700010|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1ByZ0ZDYjJXWnFKSHpnTTBhYklqbU8wWXRRK3hoWkpZcW90OG5OLzQvR3cw?=
 =?utf-8?B?cXpTSjZHUWJtUnVkUUVzR3doaXFMcm5mQXVodnNCMmpMbTVwMUR5MnZ4SE5P?=
 =?utf-8?B?NnE1OTRYVXFKMCtuVkZuYTUxRHozd1R6V1ExUGtRZmlmN1hZSUdKWUpXaEEv?=
 =?utf-8?B?T3grc0ZsYU00eFc5TThaRDEweHdvRGFXRHVqM3pzVVJxMHVoVnFBZ0pFUExk?=
 =?utf-8?B?Y0VaMWdHUXlVc2lFVmEvVHRRRERWUzI2K3JscXd2KzU0Nms0QUszUWJtYW55?=
 =?utf-8?B?THRZeHpHaGtOWFJFODIzUnA0YlpDb2JzYVRpYTVZM3llOTc2OVFHWlNEOXFz?=
 =?utf-8?B?YVVlQk5nN0J1YUR2TUk4cFlacWJoaTg5WHVrWWpGOXk4bWFxSHZmTTN1Ulpq?=
 =?utf-8?B?emdtNitZeEJmMmRuSmREdEx1TjgxeVAxNmhucURJbGdOLy9rbktiVFVjUi8w?=
 =?utf-8?B?M1NhRURKQ21WU0xvZ3hVOWZ1VitDeHI4bGhUZ3MxOTVpRDdSTWNZSjlxTmtm?=
 =?utf-8?B?clhYWDNoVUlVUmNmeHNvMDF4bWZPamYzdlBkVzFhQk05QldtVStSZG9YZGhP?=
 =?utf-8?B?NnlxY0tHUzdVSHpBYjFjR0ZtYStRWjRHZFlDY1puQ1MzaTh5bFhqSSs0MkZV?=
 =?utf-8?B?ZUZmRnA4YllaR3pucE80VHNlVnVZWVhXNDBLd1JTMWRiQjNsWHBUV2ZrTGpU?=
 =?utf-8?B?N0g2VGhPbmNyZXJLd2VOL0ZSZVR2VnNFLytZdjdIc2RvWVhoRHZUZFBKYjk3?=
 =?utf-8?B?MzA2TGNRcUE0Y28rQkxSUWdENVRKR0xlN2h1RzJXalJCWGVIdWlEaFlubkkx?=
 =?utf-8?B?YWk3Mk5NczJWdVUvUXQ1ekMzYWIyVTB1aU9mMWIrZUFYVDN4b2Vtd1JXUURv?=
 =?utf-8?B?cHNTT3hYRHZlYVF3N3lkZXM4eFQ1ZmgzQ3ZYclJnVmFDcVg2MUpJSmFwWWtL?=
 =?utf-8?B?QkY1OGc5d3AvV1cvb1h1OWx2KzdhM3llRTRxSW8rSU5XN0taSmxxWnNkd1BW?=
 =?utf-8?B?bU1BMXpPblVyZmdIcUtwR2w5YUF4RmZHREgycVQrQWxmc3B5SGVvOFJaemtL?=
 =?utf-8?B?cklLMkNJdGxCVkZUL0VNUnVpbWhIT0NpMEtLaHFnalhDK0ZFVkltMjA4ZFJr?=
 =?utf-8?B?d0NONkVQakQ1Y2lUN002cERIV2haZkU3cU04SW96cDMzWkR4TXBEU0xpMnpR?=
 =?utf-8?B?TEVURDFLdG1kbVpNWnNaaGpROU9SY1lWT2VKQld2aHRYOVNsRElZUmpyUkVM?=
 =?utf-8?B?dVpFNUtDRGtvSFp1aDNnZXNXdWhHaFc0VkRFNmVNejdTeTJPK0FHNWpQQVpH?=
 =?utf-8?B?dWNzUEdpWUZBa0VBa1VNUXFmcmJLa0JRYjBLOG8zd1A1Ukt1MTlnSmFpM3BB?=
 =?utf-8?B?U3hvbGZQOFltVnY3bDhxWS92WlhUcHdvZGJWajNEckErOFowRmh1enVBdjdi?=
 =?utf-8?B?Z2QwVDRBL25mQzdLUXlJc3lXZlFQN3hlRk84QVBQMFdDc0ZPME5zZEs2Q1ZH?=
 =?utf-8?B?aXh0M2NZQlYyK01KZDJSdmw0VEpMOVJVU0xZQjJETWJ5WmEreFp2NnBBdVdB?=
 =?utf-8?B?K1JXb1lyVDhOSlFtdHp6YTVHRExFM2hBdFlSQnF6WURaK3YyZzBhODZQUElm?=
 =?utf-8?B?ZzFPVjZ3NTQzQk52U2tqNzE2ZlR0aGNqY3BhOHZBWFlEcHk3TWFVdnM1ank2?=
 =?utf-8?B?UWJIWGJiaFlma1JxQzBreFkvaXdDMUpsTjJINnJ3ai9JM2hSSU5sMUVmUjVK?=
 =?utf-8?B?bWFmZmQrNEhPdy9jOEg4Q1JOblBVSFJLR0ZTWm1aN3ZlNVhtK05YUlduSU9L?=
 =?utf-8?B?Wmwya2w3ZXlvaXNvK2tTb0N3c3pESE9meit2a3psVHR4WFhJeEUwZ0kyMnNo?=
 =?utf-8?B?TzBhTVNiNldWME5JTnlmUFplTWxyNjNYd2JrSENXVWN6eVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(35042699019)(376011)(36860700010)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 16:16:54.2568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a6b4f4-c684-4856-b5ae-08dc920d90e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 16:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201031

SGkgTWFydGEsDQoNCk9uIDMxIE1heSAyMDI0LCBhdCAxNDowMSwgTWFydGEgUnliY3p5bnNrYSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cnliY3p5bnNrYT1nbWFpbC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IFRoZSAidmV4IiBjbGFzcyBnZW5lcmF0ZXMgdGhlIG1p
bmltdW0gaW5mb3JtYXRpb24gdGhhdCBpcyBuZWNlc3NhcnkNCj4gYnkgYW4gZXh0ZXJuYWwgQ1ZF
IGNoZWNraW5nIHRvb2wuIEl0IGlzIGEgZHJvcC1pbiByZXBsYWNlbWVudCBvZiAiY3ZlLWNoZWNr
Ii4NCj4gSXQgdXNlcyB0aGUgc2FtZSB2YXJpYWJsZXMgZnJvbSByZWNpcGVzLg0KPiANCj4gSXQg
Z2VuZXJhdGVzIHRoZSBKU09OIG91dHB1dCBmb3JtYXQgb25seS4NCg0KVGhpcyBhcHBlYXJzIHRv
IGJlIGEgdHJpbW1lZCBkb3duIHZlcnNpb24gb2YgdGhlIGN2ZS1jaGVjayBjbGFzcyB3aGljaCBv
dXRwdXRzIHRoZSBzYW1lIEpTT04gZmlsZSwgc28gd2hhdCB0aGlzIGlzIHJlYWxseSBtaXNzaW5n
IGlzIHRoZSBncmVhdGVyIGNvbnRleHQuICBGb3IgZXhhbXBsZSwgdGhlIGNvbW1lbnRzIHN0aWxs
IHRhbGsgYWJvdXQgdGhlIGN2ZS1jaGVjayBiZWhhdmlvdXIsIG5vdCB0aGlzIG5ldyB2ZXggY2xh
c3PigJlzIGJlaGF2aW91ci4gIFVuZGVyc3RhbmRpbmcgd2hhdCB0aGlzIGNsYXNzIGlzIGRvaW5n
IGFuZCBob3cgaXTigJlzIG1lYW50IHRvIGJlIHVzZWQgaXNu4oCZdCBvYnZpb3VzLg0KDQpDb3Jy
ZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0IHRoaXMgY2xhc3Mgd3JpdGVzIGEgSlNPTiBmaWxlIHBl
ciByZWNpcGUgKGluIHRoZSBzYW1lIGJlc3Bva2UgSlNPTiBmb3JtYXQgYXMgY3ZlLWNoZWNrKSB0
aGF0IGNvbnRhaW5zIF9qdXN0XyB0aGUgYXNzZXJ0aW9ucyBpbiB0aGUgcmVjaXBlOiB0aGF0IGlz
IGFueSBDVkVfU1RBVFVTIGFzc2lnbm1lbnRzIGFuZCByZXNvbHZlZCBzdGF0ZW1lbnRzIGZyb20g
cGF0Y2hlcy4gIEl0IGRvZXMgbm90IGluY2x1ZGUgYWxsIGtub3duIGlzc3VlcywgYmVjYXVzZSB0
aGF0IGNoYW5nZXMgb3ZlciB0aW1lIHRoaXMgaXMgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIGV4dGVy
bmFsIHRvb2xpbmcuICBUaGlzIGV4cGxhbmF0aW9uIHNob3VsZCBiZSBpbiB0aGUgY29tbWVudHMu
DQoNCklzIHRoaXMgYmVzcG9rZSBKU09OIGZvcm1hdCBzdGlsbCB0aGUgYmVzdCBmb3JtYXQgdG8g
dXNlLCBvciBzaG91bGQgd2UgYWRvcHQgYW4gZXhpc3RpbmcgZm9ybWF0IHN1Y2ggYXMgT3BlblZF
WD8NCg0KVGhlcmXigJlzIGEgY2h1bmsgb2YgY29kZSBpbiBjdmVfd3JpdGVfZGF0YV9qc29uKCkg
dG8gd3JpdGUgQ1ZFIG1ldGFkYXRhLCB0aGF0IGFwcGVhcnMgdG8gYmUgZGVhZCBjb2RlIHRoYXQg
Y2FuIGJlIGRlbGV0ZWQuICBBbHNvIHRoZSB2ZXhfY2xlYW4gZXZlbnQgaXMgZW50aXJlbHkgZGVh
ZCBjb2RlIGFzIHRoZSB2YXJpYWJsZXMgZGVmaW5pbmcgdGhlIGZpbGVzIHRvIGNsZWFuIGFyZSBu
ZXZlciBhc3NpZ25lZC4gDQoNCkFsc28gSeKAmW0gdW5jb252aW5jZWQgdGhhdCB3ZSBuZWVkIHRv
IHdyaXRlIHNvIG1hbnkgZmlsZXMuICBXZSBlbmQgdXAgd2l0aCBhIGZpbGUgaW5zaWRlIFdPUktE
SVIsIExPR19ESVIsIGFuZCBERVBMT1lfRElSLiAgQ2FuIHdlIGp1c3QgcmVkdWNlIHRoYXQgZG93
biB0byBERVBMT1lfRElSPw0KDQpSb3Nz

