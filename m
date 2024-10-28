Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5330AD33986
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 14:02:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web10.52588.1730124169826356054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 07:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Y+B0ZD6H;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Y+B0ZD6H;
 spf=pass (domain: arm.com, ip: 40.107.21.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=alrwM+neXgEslPH6Z2FB8+W2IisgzUIF4nabG/SrmTWueQf6LGEmpl12c2FCxFTYSDYrjEIyNZf1duWJiQx1LwtTD9PKoQtlmqCH3gYT/Y3AIUglopNZdhhlyHXMMK6erGIqKPeKNpnFeOyIhK2THuog0X+fAZUDTDA3zlc2ycwCqAR+D+CRwVzJ+hI+2oC1Khi7PoBur94UFGD5+t+/CWOtUViDv1lRvnRdQkzFnuvMG7cRMukdNekhSi7O+HoZJQG4BXmr10EMFYlyB6XFNSKHsCITILhYzoKDZNDEig9Oqi9DgwOD0eYIuirEUfpigxJNqP0T/TAq3aWPFgeZRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbcVWhceIpDBeAJoqBfGeb8vV99FOy5M0ImQYsip4OU=;
 b=tchhHzXKImwIppkctBe96rkT158GIjRmhfmokVbRzmf6rZdGnAw6tKIhRWTVB6uZLB0AW+usxan0OtUqlCdS5kHAVZHP1KBEZhYbcz5MBJDQ+XltAWyTq19GB67GRuu+r4no/nVEVolLuU40pcYSkP/NdwVKJVMRbc8K/3KKm3+jccv75QhILSiycNiUUzjTQzfBI1mS9CY1tUWJHChmBzKIr0lY8pE5acewHb7mqnZ99pjV8vGmEmAPmxo9ZhWQyRpLFcmFCU0yk4nUJmkjO3Kod9giSu45oKyQNtPp/4re10m65xOZUP3/gfTlrPCMkQWtH2ZUkMCvPEpmXNiG0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbcVWhceIpDBeAJoqBfGeb8vV99FOy5M0ImQYsip4OU=;
 b=Y+B0ZD6HZSt8MtdoI4fesrwY46XY7FNp3dP9hED6uUfI5rc1WUYqOR4qLAJ2wynC3OuBj6MFv+8FFuHNJU/C+HnX1sIldP2YmvRp/pQPzrth9GCZB49JsxIwCM6r/NmC4nRLIxxCYHtPc5V3spSYgGk4Pz2mlbL5uWQGinU9V6I=
Received: from DB9PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:10:1da::12)
 by DB3PR08MB9111.eurprd08.prod.outlook.com (2603:10a6:10:43e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 14:02:44 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::f4) by DB9PR05CA0007.outlook.office365.com
 (2603:10a6:10:1da::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 14:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Mon, 28 Oct 2024 14:02:43 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490"); Mon, 28 Oct 2024 14:02:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 929a9ac0e2dc3b5d
X-TessianGatewayMetadata: 157OrYWXnLpMxGztZt1PzkZV47QxL7VwHoKYkdTQRmjQYuBEbm3Deh8rZ276PIcCxvAtyn1a2XIVL2UgLNvAhFd101WlFMxZPaKtugzmx8pFVBPh+yYAJF6G8q0KL6zqJzb76tBbkVPD5M/xdXt+xB4S40RvpZVSVf30Q198YVE=
X-CR-MTA-TID: 64aa7808
Received: from Lf8bd9068a92f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6369B376-6B10-4660-B950-C6B64CEFA62B.1;
	Mon, 28 Oct 2024 14:02:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf8bd9068a92f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 28 Oct 2024 14:02:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E81AU8e1gW9ML38h4h0PqHshg0Y7qEx7tLp/OSjDtJwgeIGZko7P4rANXg4j3hWNmcC8HUcBQxpjlbAJz5mkZfw1wcsQSxkMUH9JAnFt6EuhaBSws1BGvrSyBIVKyr2hPEMhe83f4LkkB1W5+YiRjk+am9w5Hi8lhVH4NxaErhJZA+Td8D3LcmJQAkjLqN7HT4fch6bITYJbECeKWW5FRqIf1fu7MQcV64YQ5FOj9b/mx/f0EC5q5DFfkPxpI0CKEeM/yUPg4L8X5EXYiFdCrBMZyhy7ggvIM74JlfB6w/aGMqrYOe+tvq1svFM81bNVfg8ptWOIgTFUiI6NAxPZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbcVWhceIpDBeAJoqBfGeb8vV99FOy5M0ImQYsip4OU=;
 b=BAwK4+YDn5KaaykaxhZCLyNxymlVlb14wybZkdF8sXBJJITfRmqUJPKlmB0fr+ikL+P5zWUWyN6MQAbCOXNodMiXuleN4L0/pVKgqD1atB3My5NctRW1SQU0VTHM+3Bg5mPTWBgKkR605wQbKDglqblnOBvqTEIOrfEu4eeGB+zs4vbkQwo5pdGV0xxYGYFd5bMJKb6cyYGfCyBazrJaRfeF16DyTEnLZ3sjVelZqngelndXpW1CW+vzL/ubrZoR41VI3rRl0nFBNuGuU4+AgKmINu0LRkOjuZtBFXdafj6Srhwg7OSvWCbLkiDQUTmHcWttcLohuVYjVe/fs6VyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbcVWhceIpDBeAJoqBfGeb8vV99FOy5M0ImQYsip4OU=;
 b=Y+B0ZD6HZSt8MtdoI4fesrwY46XY7FNp3dP9hED6uUfI5rc1WUYqOR4qLAJ2wynC3OuBj6MFv+8FFuHNJU/C+HnX1sIldP2YmvRp/pQPzrth9GCZB49JsxIwCM6r/NmC4nRLIxxCYHtPc5V3spSYgGk4Pz2mlbL5uWQGinU9V6I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10840.eurprd08.prod.outlook.com (2603:10a6:150:160::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 14:02:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 14:02:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 3/3] python3-libarchive-c: Avoid using
 find_library python API
Thread-Topic: [OE-core] [PATCH v3 3/3] python3-libarchive-c: Avoid using
 find_library python API
Thread-Index: AQHbJEuGQPZrPacdn06DwPyDX7cLMbKcO28A
Date: Mon, 28 Oct 2024 14:02:34 +0000
Message-ID: <05DF9D37-9545-46B5-BA96-81F6480A4F08@arm.com>
References: <20241022062721.4131585-1-raj.khem@gmail.com>
 <20241022062721.4131585-3-raj.khem@gmail.com>
In-Reply-To: <20241022062721.4131585-3-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10840:EE_|DB5PEPF00014B89:EE_|DB3PR08MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 134fae8f-5d43-4833-6aab-08dcf75931d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a2I4a2VrSXBFaGxDWG1mbjNmbm8zRkpnajVpS1FNQzJRQm5TQU1UNExjc3Z0?=
 =?utf-8?B?US8rRENuYXZoZk9mYk95dGFmTG1BV2NvWjM2bmVoVHZGVVFsbWJ4cm9JWXFu?=
 =?utf-8?B?STdpR3d1Rk5OUlVQbFdlMHBsMVV4c0tadHl0THJWcWx0bVlnNVh0bHl4andp?=
 =?utf-8?B?UC9wMXQ1a29PL05nWVduQStSZUJoL1RGd2tOSGZ0UUg0T0lxcm5jbW9iWDc0?=
 =?utf-8?B?WjM1UWJLRUl3N2NEL3N3bW1iRmxKVDJDYmVsNjBjaTY4ZkwxbC90T0dEKzdR?=
 =?utf-8?B?L0huYUtKSHN6ZThPQTNBMDBVSWdKQUREdVI1ajBxell4Z3JTc3k5cjVQWGxy?=
 =?utf-8?B?VUhkVGJEMndERlU5b1Jta3dhNEJUb1ovMmdTYUtWd3V1WlZsS0hNYVVkYU5q?=
 =?utf-8?B?UjlsUXJVRjdXT1QvUWNaWlk2d3Ztb0ZEV3NZaXFIOVFRTkQzekdXQmI5MkJu?=
 =?utf-8?B?cVdTb3NFeUpvU0xkV3pqbkk0MEhOc0RoQ3NLZGNialJqUXM0azFZdEhwdjZp?=
 =?utf-8?B?UW1MSWFLa09JTllHQk85MUUyUmMwaU9LQlp5aCtqaXBPUHY3dkw2OGwzY21B?=
 =?utf-8?B?Q2gwTDRraVBibDh3SUoxSlNKdDB0R3p0RVlWRitJRXE1RGJnUHdxZUF2YjFu?=
 =?utf-8?B?Y3ZFd0xBOVh4QXY3M2VZNUpSQ3A2UEx1VXlqR2JROGNoRkpQanpNalFiNU9l?=
 =?utf-8?B?UDRlYSt0QXM4ZnJIRlZyRW1vSHpUZzAvOHhJQnJwNFpUSWJXUlZUSHhMNkw0?=
 =?utf-8?B?NnRDTmZMa0JNdFJBd2ttUGpta1EvN0RkV1MrTWg3eWlsbGFsNjdaNEM1T1po?=
 =?utf-8?B?bGtoUWV6NVpFQzNaRjM0enBlTHhkR0hDVXhQa1M2V2xSTE5yWVlnc0hJRGVK?=
 =?utf-8?B?VGFPTXV0VExJRGtEb1F4SUJ3V1hEU3BudlpjZHJjb3N5bnVGNFAxWXlla0xu?=
 =?utf-8?B?QVVwZWZqcHpYM1JVbkZ5SW1LZzBTcVJUejExdFZvUHo2bkQ2SjdBZ2lqUC9Q?=
 =?utf-8?B?MFErbzdLSDdoZzhuVUQwV0FOTE5vMmFiVm5Oa0NvcVk0TU93SHk0SzM0SEl4?=
 =?utf-8?B?Y3FqeVl5UUsxbVU4amw2cHRrY1E4UkZvcUttOUhYTllxeVpNanVuSkxTcDky?=
 =?utf-8?B?dWIvNlpidWF0MVhCS25qYm1kdVZvSTFMaTFGMUM1dG14OWNlWU92RDVxbTBS?=
 =?utf-8?B?bEJBZC9WTmQ2dmJLVXNXQS9sakJ0am5kNWdlV0lEcHJXSkxlSVJHdXMyTjBj?=
 =?utf-8?B?d3lLeXEyQ3pMSjZXSmdYd3oxVW5ya21JN0xvUGxETERHL0xTbmV5MW9pU0NQ?=
 =?utf-8?B?MnFCQk1aNTNiY1l3K0Z1QVlxS2dJMTBXb2w4emZBRTNic09xb1VpNjFIVStD?=
 =?utf-8?B?ZDRzSXNyQ2tPZmJia1lUSWdHT0Y5cEFuR1VodSt6MGtRU20za1FlR2FSSC95?=
 =?utf-8?B?Vk5xelc2WjM1MmU1QnZXVzZlMk9iMjUzSnN6UGtjT1dQUkNscXV5eEhLM0dN?=
 =?utf-8?B?Ry9RTE4xSFJRZW1hRVh5anNhLzh5TWgzQUR6UmJSQ3IxUUdUR2FZeXZmM25h?=
 =?utf-8?B?QW5ya3dZM3h4NFJ6VkhYckl6UGpXayt5ZlhEZjcwUE1lZTFqdG1tR2xGT2Jp?=
 =?utf-8?B?TnppeWxWLzR0Z1U5Zy9IdERkdVVZcFdSbDFBTUpjdDN1ZE9zZWRKU1l2ZVdo?=
 =?utf-8?B?NStkMU51bkdaMHNCeXkydGQwUEExemtvYWIyM05maWhTMDRSell5ZUZvejJR?=
 =?utf-8?B?M3ptdnpOeFlCdmxJalhvdml0SXdMNnVTd2dzcldwY1J3dTIvZ0wzUnJnMkJW?=
 =?utf-8?B?ekJ3Rnp0Z1hSeTRlb1gzTmc3TVE1YU4wNGwyR3hhbEVWbXNwaXlZOUxyNGhi?=
 =?utf-8?Q?sFlkyviZC6TRL?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5E3B1E2EF645341A44AEDDD9F0AA8D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10840
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d232cac8-6d7b-4a74-a1c5-08dcf7592c5e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VDBISnhFdFU4WWxFVHEvdk9IV3c2UUpNTXI0T2J5YTkvSk1TOVp0RnRiR2JQ?=
 =?utf-8?B?Z0JCSE5uMGMyWFIwTnA1bExlc2dGOTByRVE0S1FzZzhGbSt2L2VCT3pJREEr?=
 =?utf-8?B?Q0JsdkdyUHZVRHY5ZlRZSmtmWnU2SXJsMW52OXk0NFgzeXZGUmpnVUZxTjMy?=
 =?utf-8?B?Z3ZGVFBWQStjSXdNdDhJZmsxbVlhdXBkRXVacDNFMDNPOXVkd2oyaDhhSnZp?=
 =?utf-8?B?SmtsTzlmNE5ISkN1MlMrUUJjek5FbXVvV2JGaWdUR0dTOW1oYjkvY0tlekhD?=
 =?utf-8?B?M2JaYjd3cG1kVFJiaktod0dVdjJYSlBYRytHcWVKYTZqYXNlMDNoVGRoZnlx?=
 =?utf-8?B?SEo0bi91c0dIcWFmY3Zkb1Foc1h2MXFReklzZEVPNzFmeTNiNWEvbzZQRHdT?=
 =?utf-8?B?djY4dHByZGM0eEI3V0dsMVlnZk43RHBxVHZ0UmlRYXExbWs2VFJER0oycUhP?=
 =?utf-8?B?dUJ5LzFVSXk0ZVFacGhnT01GdkxJc0F1bnhTS2RXWVFVTFFoVXJtUmtTc01r?=
 =?utf-8?B?RmFhNXNyYmszWHVUaUxVWHVRVkhaZUxqUlAza2FraGJCZGRYYkdSZmJ6TXJX?=
 =?utf-8?B?SVQ1UzhlWDh6TTJqRlo5V0xVU2JJejBzWGNjRTYyME1TUTVxU2xGTnAwSmpn?=
 =?utf-8?B?VDVSQ01DTjVCcVdULzUyK3d4U1hYMUR2SkRpWTRiTzdVc3JFRjNkSkkyZG0x?=
 =?utf-8?B?RnBHMkcrRjVXMHZRY05mclRtdEFmelBneUdibG1EaGNrWWlmazFVaWp5QXJG?=
 =?utf-8?B?cm1RQ3ZDUER5SGpRYjJ1cWFsVVVpaTVCVXRzY0tKSlFqZi9OQXc2ZFJOSVc5?=
 =?utf-8?B?VjB0UXVCNU5pazQ2UmN4T3hvSjl0Nm43UFZ2YkxqWmRMcnU3T2s5amVTbXRC?=
 =?utf-8?B?WW5nZXJqc2s4SExIR1UrS0EwTE1iT2JpTWxFWW43UVE1OVVQdkhHRW80RDBE?=
 =?utf-8?B?TlhEdG5hTGxHS2hncmtrNmF6alFSK1ZIM1dBK3lHbTBLaVNPSHZRNmxKZlRS?=
 =?utf-8?B?OWw1WkgwMGl4SmJBSlFpdzZoOXBXQlJJemxqb2ptd0k3MWdJRk5qRlJiK1pI?=
 =?utf-8?B?blBMaE9Rd3BleFlBeFFzeVBWLzQ3dFZ2R3VxSkpPUlJNSkI5SDFvbWZlRTBi?=
 =?utf-8?B?SElKejBpc1hicUZKSVRIUHRHNzBpUGJYMHlZREhhd0V4R0I4dW85OVlaSVJx?=
 =?utf-8?B?VmdHc0ZzTHZlTEZXMTJuak93b0MrczZYdXJrdW40czFOck5xdkRtTFdMbUdB?=
 =?utf-8?B?VlB3cC9mSEE2cHllaEdUU0l6QmVDQ1NHVEV3U0o2NlJQNXZEZkJGRC9iaVdP?=
 =?utf-8?B?ZVY3UmhMOXdCWThJN2RyR2U4MURuWklZRGt3Z3JzdFAraWJQdkVjZ1JMeE1a?=
 =?utf-8?B?SkFLc2NSUXlvSVR0Z0ZDbzV0S0lsd0NxaVVXZ2taeGZ0UTh5eXhURlNTL2dj?=
 =?utf-8?B?Mk91ZzFBZWZ3NndFc3YxS1NwczJ6RnNvTFlhY2N2SHJDM2I3ZjVWV1lURUhm?=
 =?utf-8?B?OXh3YjlVSTIwWVhaVzRJNktKYmxnR3VYNTJoWEVEd0RBRkZscDdPV2pISG5F?=
 =?utf-8?B?dUVlNHVQQVY1Y0xQT04vTVozMGtrQnlnU3IzbXdPdE1UbS9kaDNzaGo0MmNU?=
 =?utf-8?B?R0RtaGtydnZ0aVozZ2hMVFhPYjhjTjRFMlpHTmVHZmxkaytqYzhjOXJiUE9l?=
 =?utf-8?B?Y3JyT0NLVC8xODM3TUYyaVo2eTdxL0dIK2NRYXhNbWVNM1BuZlZHNGtiT3BC?=
 =?utf-8?B?TkVDUHNubjZWYnlWZ1h6TEsvSDRhKzlqdW5zSklPU2R0WFZ6eUk5cTY0K211?=
 =?utf-8?B?T2RoMG5CYW9DZGRCRlNPWXlRVFROSW1hcFFDNzRPSG5xY1NrNUZSeGZaOThq?=
 =?utf-8?B?cnlsbVdCOGZEcEl6VEs1YVVwQk5MSVVGQnJCT1hmSjYwaEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:02:43.9937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 134fae8f-5d43-4833-6aab-08dcf75931d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 14:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206447

T24gMjIgT2N0IDIwMjQsIGF0IDA3OjI3LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiBmaW5kX2xpYnJhcnkgQVBJIGRlcGVuZHMgb24gcGxhdGZvcm0gdG8gcHJvdmlkZSBsZGNvbmZp
ZywgbGQsIGdjYywgb2JqZHVtcA0KPiBldGMsIHNvIGVpdGhlciB3ZSBhZGQgdGhlc2UgZGVwZW5k
ZW5jaWVzIG9yIGF2b2lkIHRoZW0gYnkgY29tcHV0aW5nIHRoZQ0KPiBsaWJhcmNoaXZlIGxpYnJh
cnkgbmFtZSBkdXJpbmcgYnVpbGQsIHdoaWNoIHdlIGNhbiBiZSBkb25lLg0KDQpPSCBHT0QgVEhB
VCBJUyBIT1JSSUJMRS4NCg0KIk9uIExpbnV4LCBmaW5kX2xpYnJhcnkoKSB0cmllcyB0byBydW4g
ZXh0ZXJuYWwgcHJvZ3JhbXMgKC9zYmluL2xkY29uZmlnLCBnY2MsIG9iamR1bXAgYW5kIGxkKSB0
byBmaW5kIHRoZSBsaWJyYXJ5IGZpbGUuIEl0IHJldHVybnMgdGhlIGZpbGVuYW1lIG9mIHRoZSBs
aWJyYXJ5IGZpbGUu4oCdDQoNCj4gK0RFUEVORFMgKz0gInBhdGNoZWxmLW5hdGl2ZSBsaWJhcmNo
aXZlIg0KPiArIyBBdm9pZCB1c2luZyBmaW5kX2xpYnJhcnkgQVBJIHdoaWNoIG5lZWRzIGxkY29u
ZmlnIGFuZCBsZC9vYmpkdW1wDQo+ICsjIGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMvbGlicmFy
eS9jdHlwZXMuaHRtbCNjdHlwZXMtcmVmZXJlbmNlDQo+ICsjDQo+ICtkb19jb25maWd1cmU6YXBw
ZW5kKCkgew0KPiArICAgIHNlZCAtaSAtZSAic3xmaW5kX2xpYnJhcnkoJ2FyY2hpdmUnKXwnJHts
aWJkaXJ9LyQocGF0Y2hlbGYgLS1wcmludC1zb25hbWUgJHtTVEFHSU5HX0xJQkRJUn0vbGliYXJj
aGl2ZS5zbyknfCIgJHtTfS9saWJhcmNoaXZlL2ZmaS5weQ0KPiArfQ0KDQpDYW4gd2UgcGF0Y2gg
dGhlIHNvdXJjZSBpbnN0ZWFkOg0KDQotbGliYXJjaGl2ZV9wYXRoID0gb3MuZW52aXJvbi5nZXQo
J0xJQkFSQ0hJVkUnKSBvciBmaW5kX2xpYnJhcnkoJ2FyY2hpdmUnKQ0KK2xpYmFyY2hpdmVfcGF0
aCA9IEBMSUJBUkNISVZFX1NPTkFNRUANCg0KQW5kIHRoZW4ganVzdCBzZWQgdGhhdCBleHByZXNz
aW9uIHdpdGggdGhlIHJpZ2h0IHZhbHVlPyAgSSBkb27igJl0IGxpa2UgbWFnaWMgc2VkcyBiZWNh
dXNlIHRoZXkgY2FuIHRyYW5zcGFyZW50bHkgbm90IGFwcGx5IGFuZCByZWdyZXNzIGluIHRoZSBm
dXR1cmUuDQoNCkFsc28sIHRob3VnaHRzIG9uIGEgc29sdXRpb24gdGhhdCBkb2VzbuKAmXQgaW52
b2x2ZSBsZGNvbmZpZyBzbyBpdCB3b3JrcyBvbiBtdXNsIHdvdWxkIGJlIGFwcHJlY2lhdGVkLiAg
Q2FuIHlvdSB0ZWxsIHRoZSBtdXNsIGxvYWRlciB0byBkdW1wIGl0cyBzZWFyY2ggcGF0aHMgc29t
ZWhvdz8gIFdlIHNob3VsZCByZWFsbHkgZmlsZSBhIGJ1ZyB3aXRoIHB5dGhvbuKApg0KDQpSb3Nz
DQoNCg==

