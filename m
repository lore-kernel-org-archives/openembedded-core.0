Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1DBC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:30:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web10.51308.1743085819529206944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cmdX6BV9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cmdX6BV9;
 spf=pass (domain: arm.com, ip: 40.107.20.85, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VHBxy0frCx9y24wjY/vgPvD6A/qgb6N6E0f3akqByOyel0mMyXdLf9AzyubWu9oFo1w0RNy28j9n9WvzZ2qeCOrv15FYvIegXAO4upwwMa4iVrtexEJJD0D41X9jKkBa8hLW9We2SlLYO7JbcKW7dcECIayHijgfKOprLP/3Htu6toc6QeG3ofGhWUid0fMd1hwayWx3jmCHPrP2+ChgKb1Ug5t3ynIOkJrkT9f3oFIij7BVjx6MtAlLhOQhFznjCIk534PBJPdJ68Q9UAg8OoLTaoxT9HR9PW8bbnhpffkGLYATHNlXby36tyINumNBl6Box+Kxka7L0Vwp3Yxw+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1cJ91EnWXFMvW6jdt4lQivntlQqzAlC7qwP0izkdAk=;
 b=thdrAGbEZiEAMiUFzia9WWZ8HI9q41+bnBivUyE/lyzt3if93J/THYSR315zcNRPtUwmRVQp0U7AyNZY0fPovupG6X9rqQa273uvqG9+7ddRpC85MIXV1f/DcIMttV4yKudbk35OJlI6dHFarmHGHoWpkfhc4Gt3iyN9/vo9v3u09BaUoWwR5Qg3yExbylFmXoUMj+vPl9pjA8SIoX2ykNKDhWqPa9miUphSWS+3WQTKCc0yAA2UI3zpi1giPE0fhjvywP4jhoPdA3UqI2JBqTuXh2YPOJtluEb+DPo/2SBsxjfwmywtFnqAFcYh9iUSzAjzVluQ8yBZzMQ9xRUNeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1cJ91EnWXFMvW6jdt4lQivntlQqzAlC7qwP0izkdAk=;
 b=cmdX6BV9I2WyVbMQP8DiG8X6C6Xe1RjqfUKiUqaCUKubigUnLpjQcAqrU++YUk4chjTmbBKlESB2EjYFMa7edwfZIb21PL+1npjowdbGmmbWvGUNQAKLA3MhPM7Y+TCtoZ8yFjrOSUOu5TvH24NLRDN8aSDeHdNw1RqRb9epfQU=
Received: from DU2PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:10:28d::19)
 by PAVPR08MB9556.eurprd08.prod.outlook.com (2603:10a6:102:311::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:30:16 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::b5) by DU2PR04CA0194.outlook.office365.com
 (2603:10a6:10:28d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 14:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 14:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DL6JqeU7L5nWsovjCqj5M82xYa6V062poJ0pXaHAjdLRt1j6m5kW8R0EHWukMQ7WRUhgwJeAK5UY600f5J9zdcSxxK1pqpI1xpSGOBjn9hGElHBn5YLnERwGR4exPMnt1foOWXpV9SVksT6kysDdtDWLix/EnOWijv19VL05NiZOYL7n6NWRcWMYrlD1aQimDrtRI67PUN1gIL+h6Vy5xD/8EG+Mv4LKgdRbfPEqS2hk4+aI7XL+FQWGg4ArLt6RBI4AL8zJs1w8wPmFzQjmyZO3dwtCsd5rh2HkBFoPahh5xReDVuh8qq3vX7B2iYNngZtFTF8vqnEf6DFiUwbbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1cJ91EnWXFMvW6jdt4lQivntlQqzAlC7qwP0izkdAk=;
 b=dXzLbi84Zf0wwUMF6ESGy8FBJg7uvMuWQLAUO/ZFA+pbdP8N9zTtwVklw34uqaAUBTp7rf9Bci+T8mHrqa4CLBhQcV7rJXj8f1clJc6pnRJGfvLrHduPRJ2TD28/G/Al1x4Tu+WmvwfDQepLMP605lss7IcaW7kPyygnHBMWi7TCIIlxSQtDEbK3Bajq9DkEDtXOuqJ8DbvfxOJ8LIL7BEavrTmXxuEBz8XzbeiKO8WpWE1AqJqgj3A/6fjZKz0NPtTsyLMCFdGLeSnuZt4MxfEv/krOWDmSi/sVApmbVy/JlT/gfZ+yAB25gmb+sKIVKrOgfX/KGWGUyixNAHt2pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1cJ91EnWXFMvW6jdt4lQivntlQqzAlC7qwP0izkdAk=;
 b=cmdX6BV9I2WyVbMQP8DiG8X6C6Xe1RjqfUKiUqaCUKubigUnLpjQcAqrU++YUk4chjTmbBKlESB2EjYFMa7edwfZIb21PL+1npjowdbGmmbWvGUNQAKLA3MhPM7Y+TCtoZ8yFjrOSUOu5TvH24NLRDN8aSDeHdNw1RqRb9epfQU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7496.eurprd08.prod.outlook.com (2603:10a6:10:36b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:29:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 14:29:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] llvm: import YOCTO_ALTERNATE_LIBDIR patch
 from meta-clang
Thread-Topic: [OE-core] [PATCH 4/8] llvm: import YOCTO_ALTERNATE_LIBDIR patch
 from meta-clang
Thread-Index: AQHbnx/uLvIXMEkRwk2gy9/fCWeKd7OHCw8A
Date: Thu, 27 Mar 2025 14:29:43 +0000
Message-ID: <330A44DD-3537-4BB7-9D9C-279AE88921F7@arm.com>
References: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250327135520.3920189-5-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327135520.3920189-5-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7496:EE_|DB3PEPF0000885E:EE_|PAVPR08MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: d0be940e-d10e-4098-9382-08dd6d3be43f
x-checkrecipientrouted: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WkozNTFtZWIvUEpqN2t5c3JwLzVLb3NYTjJZdVdCcnhQZ2JWMWQ3UWdmRVRm?=
 =?utf-8?B?TzM5eEtPZ0hkb3hzbHFId01xY3RTOGFTNTk2bnB4aGI3cnFRcS9OekpRbVRl?=
 =?utf-8?B?YTBySCtnMWJRV09aWDhWQlJIaGx5cmJJa1JFdmtzampxWnQxdHVZMUJCZHZY?=
 =?utf-8?B?dGF5djlYSFVRWFRGeHRRNjlnZFp2NlR4YTJ2WWhaRlA2cFBoM3B2ODhqUCt6?=
 =?utf-8?B?NVVaemEzYzRLa1U5RmlEWldyMXNFSFN0QzhUQzBzemIrYUpZaDRjTVQ4YVRl?=
 =?utf-8?B?dlBZZFJUV042dktMRHBUbkdyZ1cvM0JtZ2NPOW0zYnl1UytEditScXJJdDJV?=
 =?utf-8?B?OXRKNldpZlQ1NERETUJvQnJPTm43MXFpK21HWGtVdXlKYnpuMEFiMFNqUStC?=
 =?utf-8?B?ZGx0dk92Y1VOZ1pLaHFYLzhWVGpkeXBEbG54U1Nka3RXSmpkbjVJeXBXVThG?=
 =?utf-8?B?VWVGNnppM2xNVE1GWm9LNnR6ekhxQVppRVhHenc2VzBJR2VHV2hHbXlYOFNY?=
 =?utf-8?B?ZFdZZDhjZkpKY0lJTlN6clNsMC8wcnlrd1g0Rkt5NkUxMmxrblc5WG1sS0xw?=
 =?utf-8?B?OEZ3dnBVcmhvbFhXT3NpZmtVdy9naWt3N3FZckhlcU4vSnVXdU1aNjdZT3JD?=
 =?utf-8?B?N0hOQ2w4c3MvUExCQTgrSUs3T0Q3VGFvUjFDUFZLa3lqdDBvcFMvWndLck1s?=
 =?utf-8?B?QVhwY3ZLMEZWaUEyM0VQUUltMUdXQnpoeHVRKzVtUERaV2hUcGR5Q01XL0ZX?=
 =?utf-8?B?N2ZybVN3N3hoVFpnQm5CU05WMWNQUUJQQ0xtVmU0N21iNVNkWmFoOWEzOUhZ?=
 =?utf-8?B?SlJ0akFtdWhoYzJkVVR3MFVnb2JZNmRHMUR1bkJOT2hKSGxGTVFac3R0bm5t?=
 =?utf-8?B?NktJSm9sZll4cFQrbjBUazlKWXl6QmE3SVNHRmRKSUZPRGVmVnR0UW03RW13?=
 =?utf-8?B?Rmo3MDJ0OU1Id2ZNSFNoVFVoWlpzbm1wR1VDUzVRVVVzRFpnY2MrdzJLbVB5?=
 =?utf-8?B?M1U0aGgwcVZuTUJWOUg4VFUxRldoaWs1MzJ3UjBSdCtkd2p0TnFsTkNhREVz?=
 =?utf-8?B?c0ttcExmTmJpYzRha2EybXR0Q1dNc0tJN3RTSVhzMTBsdWlGblVoajJ6Z3BN?=
 =?utf-8?B?RmJTRnlLcklHcjArdnNBTmozSWIrVUZJcjVJQ1Z6eVh0RDA5VTB6T2Vtanpn?=
 =?utf-8?B?VTBmY1RsalRMUDdzWGFqQkpPbENxTTNMUDIzWmpsZ2VpcXJZN2ZoalFzbkpz?=
 =?utf-8?B?Q0Q1WnlIc09VYXEyUlkrdmgvMUNUVWJVSkpFSHdBM2NjZkRIQ3VBNVNBZ0NI?=
 =?utf-8?B?eEpHSS9VZkNhZEFqakNIZkhlYjdpQUxrUUVTd3lPS29sdHRaYXQ2MmttZTFO?=
 =?utf-8?B?c3VNU3cvUjlFME94UWF5ZCtZNlBjNVFFZm42ZkdQcXVaMFFWeVlXUGZ4K2hZ?=
 =?utf-8?B?RTIrV1o1cWI5cG95a3dYQXRlUi9WSFFXOFN5ZDhWT1RmUkNMdEN3WG10dU9V?=
 =?utf-8?B?SFd0ZFoydWFrMFh4NTBwR1lYaUlpaVZRQWp4YmQ3aU5PWVpRYWhBUWl5ZDlH?=
 =?utf-8?B?NFJZQVNRQ0xmWnQ4dXJiZlN0NjkxclE0dW13TG94SVNnWHdlSVo0WFhaT3NG?=
 =?utf-8?B?T2JaNW8wYlVBakMzenNldDMvdlI4ZWpHZzF0S1p4VzB6bVlEV3RjUVhLSlZN?=
 =?utf-8?B?RGY1NzNtdDlYTndUWWorcncxcXJaQkI0SzN5MFZrVDBreWxGS0srdUlhZnlW?=
 =?utf-8?B?R2RkZ2crT0VhaVRMd09zWFlScy9FYlppd2VhYnRRRW9RdTAvb1p6cko3aVJr?=
 =?utf-8?B?LytiRG0yVmJudE1KcDF4WHJ1bTFIVjZDZWQ4M09nRkc1VEdpZlZhSnFCWDdY?=
 =?utf-8?B?Z1VoZDFMMW5SWC9zQ0N1Vk96MzQ5VzhNUFBwWk51UlRhb0ExMUxYK2hOWnpw?=
 =?utf-8?Q?LuilMDr7b+ld7FLcBpBg0ld7HXJ/LBsb?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBF5BCF14EB51441B06D21EC4C4B079E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7e4b69cd-0a9b-4598-40fd-08dd6d3bd10b
NoDisclaimer: true
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3F0U090UERIeEdNV0pCdEhxTlpFdk05eG1qS1pFVjNYaHZ1amFzZGRRQ0Zm?=
 =?utf-8?B?NWI0OU9GWm5zeGFwaG1tdlBOWVdlYUJOYnNnWVYzNlpQVHlOMnZLZFVWY0Vs?=
 =?utf-8?B?WUw3ajUxTjhJN1lpWUdpZEdPV05ETWpWWDR1TTFzbVh6eEJuWHhNQW00anJq?=
 =?utf-8?B?aStSOEZreUJJRDJ3SDh5eFlUbFFDZzFNYXNsZnNTWVRYRlZpOFY0ZDRiSkdC?=
 =?utf-8?B?bEdPcUluTTIrRUFzUWRBZWhEY1BpamNsbUwvdlp4aXZyR1hvMW0xU0phcTBT?=
 =?utf-8?B?Mk5xclY5TXJlRFV4UEpZQ3VVSExOVGVzWDNoZ01OWU9IOTVmTFBNSndudTc1?=
 =?utf-8?B?N21qWm1OeUdQTFNXMW05eFVHenN5azBoNU5QNXh6YU55RXRwbGVtZGJFbU5T?=
 =?utf-8?B?b0hMRkpoYTFkMUNxYWw4MCs0TTdTbHhkT2k1eW9BVFZxTmcwN2F6ZGRVaW9q?=
 =?utf-8?B?MnVPUUlLcS9ucWVhR0V0U0drN0E2dDZKSHZ1UUdnNTNlN01GSU1zNnBKMmpa?=
 =?utf-8?B?OGgrWGRaQVBDWW9hTm9Xc1RERzFiMHpFb3Q1Z00wWGVERmowMlV4Y2tkOFQr?=
 =?utf-8?B?c3hITml4K01Ud3ltYVBWcUdaQ0diN0sxR1MzU3YyalJzLzNMSCtod1pVc1Mx?=
 =?utf-8?B?REJ3ZXNtREVLQ3VjNDBMRUxDdU91Mjg4VVN0QUpWVmhDSkFtZG4wNjgvcFN4?=
 =?utf-8?B?OHgxaEwzbjJwL1hqYzRPSzlkUDVJVjR2MlhEaFNNT3NiRGJnblJ2K1JTY1Vl?=
 =?utf-8?B?ZXkzYTRBekp0T2RBQzZpckJSdVgveXRtYVFNR3JHeXN0cHd3STQyUWF3a1Ro?=
 =?utf-8?B?cnozczJIQ1hXT2hRT0tJNGp2VEowSDUzV3pQY3pyM0tJZVZadVI5Zk1uK0Na?=
 =?utf-8?B?NitERlBVUzVEV3pkOGtSRmk5bVVwa2NYcXJIOVY1WmQvL0g4aFozVDlFbGJz?=
 =?utf-8?B?cS9FSFhSMS9GS3QxdUJjZlJ4M09maXZRYlVROEt1WEVMS1dKUW9CUXlqU2Vn?=
 =?utf-8?B?Vk5RbThRc1BQaXlQTGdneEFYNnEwb2xHWkJVSVVpNTdsQzVlUzZRY0lkWFA4?=
 =?utf-8?B?Y0tRSXp1RW5ROHdxbjVuQjVLOTNRS2tvcFZDVDdUVWtxbE1lU1NyaWFlZzZS?=
 =?utf-8?B?VXFCaEI4VE9veFpQWnIvcEM4d2tWdnhGWUphWkxpZHdyb1hhc2R1Nyt4cWxx?=
 =?utf-8?B?MURDSEFndnlzREtSSmswdTJNTG1pUXl3bGtpaFlIZVJvZm5pUGt4SWZ5Rm9G?=
 =?utf-8?B?MEY0WmhOWDZra1BYMUtJZ09BRFFuclhjMGlwVWpLbC9pdkhDZnRScTA5eGsx?=
 =?utf-8?B?djhRVjFZeGhXTVBURllubzdwcVY5UHNSZnBRTXU1NnRwVlQxUmgyZGdmYUVT?=
 =?utf-8?B?S1U1eDYzSkVmSG9WeFluNnNiVFNiQWxRZkUxSDBQWk9VT05nNGFxY2NORXI0?=
 =?utf-8?B?Z3hvUENvOUlUV05VSlV0aEE0RWExM1ptZ1ZtRUhzNVFrRnJUWDgzVFpVblJX?=
 =?utf-8?B?RlZSSjRiLzVXbHBmdm84Vk5CeXBDckVuaGF2Sk51M29xcC9vS0VEelRGbFhk?=
 =?utf-8?B?b3N6UHpFU2JMY0pBenNYNUd6KzAwVm1JUWZNL0FNaUIzRUxqWW1OSk8wY2VS?=
 =?utf-8?B?OTFzS2lobmhzQUJhVlp4NndGcFVvOEx5Y2ErK0tEQ2pKNDZ1RlhmeHVUa0E0?=
 =?utf-8?B?WWJPUStCNXFEL3JrNUFaTmhvbm5iYWQrU3VRVGd0TGx4ZW5uSDQ5Kyt1cFor?=
 =?utf-8?B?Z0NYZGliakEyQVBzTTV1RGdPUEtmVGFkUGxFQ2l4S1JncURDVjlKYmo1MVlx?=
 =?utf-8?B?RFgrWXFCR2ROcW1vVTd5aWs3cUdRZWZvaGlTbjQ5eWsvR3F4allFK1FjSWZy?=
 =?utf-8?B?THpmWUxkVDlVQjNDeFEvelczMHRsRU05ZGorbWtIYW15dG9JRVY0SkplNWdU?=
 =?utf-8?B?M0lzMWc3elAzeUVYMlpMT2xwTlp2dEdDbm84QmZLVXhsb2Z3M1R4YWlqcGNN?=
 =?utf-8?Q?1ZcIiZXXO+4oVxJSF9rNl4f6sIXoAc=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:30:15.4942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0be940e-d10e-4098-9382-08dd6d3be43f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213751

T24gMjcgTWFyIDIwMjUsIGF0IDEzOjU1LCBEbWl0cnkgQmFyeXNoa292IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxkbWl0cnkuYmFyeXNoa292PW9zcy5xdWFsY29tbS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBDcm9zcy1idWlsZGluZyBvZiBtZXNhIHJlcXVp
cmVzIHVzIHRvIGJlIGFibGUgdG8gcHJvdmlkZSB0YXJnZXQtc3BlY2lmaWMNCj4gdmFsdWUgZm9y
IC0tbGliZGlyLiAgVXBkYXRlIHRoZSBjcm9zcy1lbnZpcm9ubWVudCBsbHZtLWNvbmZpZyBwYXRj
aCBmcm9tDQo+IG1ldGEtY2xhbmcgaW4gb3JkZXIgdG8gYWxsb3cgb3ZlcnJpZGluZyB0aGUgLS1s
aWJkaXIgb3V0cHV0Lg0KDQpJcyB0aGlzIGFjdHVhbGx5IG5lZWRlZCBub3cgdGhhdCBtZXNhIHVz
ZXMgTWVzb24gYW5kIHdlIGNhbiAoYW5kIGRvKSBleHBsaWNpdGx5IHRlbGwgaXQgd2hlcmUgdG8g
ZmluZCBsbHZtLWNvbmZpZz8gIFRoaXMgaXMgb2J2aW91c2x5IGEgaG9ycmlibGUgaGFjayBhbmQg
dGhlIG1lc29uL2xsdm0gY29uZmlndXJhdGlvbiBzaG91bGQgYmUgc3VmZmljaWVudCB0byBkbyB0
aGUgcmlnaHQgdGhpbmcuICBJZiBpdOKAmXMgbm90LCB0aGVuIHdlIG5lZWQgdG8gdGFsayB0byB0
aGUgbWVzb24gbWFpbnRhaW5lcnMuDQoNClJvc3M=

