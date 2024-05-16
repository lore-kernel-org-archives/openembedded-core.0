Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5402C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:35:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.58])
 by mx.groups.io with SMTP id smtpd.web11.10342.1715855720623853748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=drNhY7UL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=drNhY7UL;
 spf=pass (domain: arm.com, ip: 40.107.21.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BplZAPHSAw1J7OCEjcYTiEc7/UoJdMtstf8q1LygxqHVWpUppJTc21ZKUFTq4kZ7fljj+VdswbcPTcdApSrta68WaXuqe8l7gkTmhrha2qvHP4k+fPkk1JyC1+KedhU6dsA7rZWZoY1svlCxt9j2cJhQkbqdKjGQmJ15XKKxFLDGQrLc+s6eOQpF6bo+ci4FRSeRtAlQMcNRbQWUsfy18jQ23CmInol01AUBvblWJyYxDdxD6CKSdjHsrsUR0dN/wHlRYikWOvldeeTZfy0By9fvGFfyYlcrJYzrwlz8YzZ8gLRwNXGW3LJ3nsFenwzd+PZjOrPtaL9Qwd5v7e7Mcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=andhs8DTG1W63XSJzA8K1wgJnFZfgvYP/Nuk9pN+FmM=;
 b=fe6liU691woM5DneuoRSDa0FKv4cS3AnBFeOhLCQXaDVGEblN16ICfmLlap4pShsB6CekBe0npXxMkUoIlVWRb6vxDqMzkAYmbvXSfR6Pi/gQJsZfEFz9M6Gsafkz+EqIFHoab2jCXcr1/ebfHoWB7qQzxuOeVz4PZxYgf+nM0Douw2fd2rmNgKO/SZTNRiuN/uL3WaSui2/sVwM3OwvIOh3vCYNEFb0G9C1nRkAKZELCGDzJxw2Ivt4w81+26ftySQW2w2yWr8Ax+neGxrPc79PyRCv2DxbAhnMfkj+ISMTMpRI3Xuv1GQZGNJM/b+trUZ8F7pDcpDC2bopgOC7MA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=andhs8DTG1W63XSJzA8K1wgJnFZfgvYP/Nuk9pN+FmM=;
 b=drNhY7UL+bSA9NozlZustZIz26bhyIkrDNMuubSnSAEPEoIJZeLiSeZfJ/jKevmPy6ZFjpjHw0otpTSrmsBCHu3fe9RO9fSmp+Y5CbCoiFzd+bQlCtnOaRAQqYNguFK8dgRWMpuScaZBREBOOg479cZjSvv29rFyahe4oGHQ4S8=
Received: from AS8P189CA0049.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::22)
 by DB9PR08MB6587.eurprd08.prod.outlook.com (2603:10a6:10:251::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 10:35:16 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:458:cafe::93) by AS8P189CA0049.outlook.office365.com
 (2603:10a6:20b:458::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 10:35:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Thu, 16 May 2024 10:35:16 +0000
Received: ("Tessian outbound b7675f20d34d:v315"); Thu, 16 May 2024 10:35:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 819ad8e5af972f36
X-CR-MTA-TID: 64aa7808
Received: from 51b305f8d213.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D429009C-8601-4D10-B3F9-606B78425387.1;
	Thu, 16 May 2024 10:35:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 51b305f8d213.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 May 2024 10:35:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik5cCkVq3m+6Q0ALd+/jTtX9J+dEB/toRur4yFjiZ3lIjow2ydWRH9WbYwLNpnCAZjzdIDRewmtpz7nxoh69xKgjM7YRkkWKp7wnbrmD5ybOQjB/wjp6aTG03h65JiiPcOAOlX3SbuYRt4JQXeBi6PWWoSBeHuCbnab0agjtIVM00van3mp+aD0EfgqHufEpHiitl8iHpGkVG7AD87EFXM+OjnqvTaYaLgfvko2CS4DrhETBhLaNiIXEtSUaEx/bsYs7S0kKCX8jiAeTNCVV90nILQnGbG+TqgrmtPDeVPakT4UP/mMtXVzJ1vUH8RoPdiI1z6D7oNGKtIMIrlPIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=andhs8DTG1W63XSJzA8K1wgJnFZfgvYP/Nuk9pN+FmM=;
 b=V9lYHnlLAjR/M0NqELTaofH60aI5WZGT5ysZeYxyqSGKO3AYdWJFQtUXi44v4gECWicU7jizRnxgaftsi/EdmZL5SIfTbeO3wz+EZB3Cmr4Jk/rBLLfEt8pUHUf7BYk/d/FI/D0d9sisaXZzlhOLCdGtF/4cBgowvYYlV49qCZlX+vkI5a6PGbXuvyB4HHHK8ImN3O2S8eq1TFvGWgpQwJVDburBjF0AYYveGYe3CGSwGf81QmX2lI/oCdrnB3FDddvFfx1FA4bcjBQHmPqeSm/OQ1MEPev4oQvnEAbqDCvBRl7YGWZwFLbYfWbxNsodlthERaR4Gzzmv/gBmQPBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=andhs8DTG1W63XSJzA8K1wgJnFZfgvYP/Nuk9pN+FmM=;
 b=drNhY7UL+bSA9NozlZustZIz26bhyIkrDNMuubSnSAEPEoIJZeLiSeZfJ/jKevmPy6ZFjpjHw0otpTSrmsBCHu3fe9RO9fSmp+Y5CbCoiFzd+bQlCtnOaRAQqYNguFK8dgRWMpuScaZBREBOOg479cZjSvv29rFyahe4oGHQ4S8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6495.eurprd08.prod.outlook.com (2603:10a6:102:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 10:35:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 10:35:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] python3-pyproject-hooks: upgrading to 1.1.0 FAILED
Thread-Topic: [AUH] python3-pyproject-hooks: upgrading to 1.1.0 FAILED
Thread-Index: AQHapu350DH2K9dxFUO7rUEhWTNmP7GZq4aA
Date: Thu, 16 May 2024 10:35:07 +0000
Message-ID: <38D84A81-1343-4955-B180-FDF71856F0A7@arm.com>
References: 
 <0101018f7d4fdf94-86670911-f6fa-4354-a366-de0f6bcfca68-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018f7d4fdf94-86670911-f6fa-4354-a366-de0f6bcfca68-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6495:EE_|AMS0EPF000001B5:EE_|DB9PR08MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a814dd-ac43-4a2b-0d19-08dc7593e05e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eUxLSUg3aSsyRlVQcTZNb0hyMmN5ZnFaMWcrOTBuVEhCR1B5NUJ4V0l0V1R0?=
 =?utf-8?B?M2MySUwxVEZIRjZnK3J1QnArN25yQlIvMll3ci9udy9lSEFJVVRiczBZWFE2?=
 =?utf-8?B?NjFFMFdHWHRGeUV5N0Z6cndGRFpmc0pEUTFMZGwvNFJzelBmeERJbFlYN2Vj?=
 =?utf-8?B?UXV5SlVGYXV3bkNxeFFndFdsdmZQUFVhQzVqdEh0ak02R2dpY2NmbEJVSzRI?=
 =?utf-8?B?dFk5VUpJZTBFemwrY2NNYjROSFl3NENNK055YWhOaWRsNnFWYllTOWp6dk5z?=
 =?utf-8?B?UlExdDZSUlFFb3E3Nzg0MmZ0WldwbkM5NDIxdDNXcS8zVzFUN3J2SHFTY1RW?=
 =?utf-8?B?RHY4TFZtRStuSytUUUdzZWlVdlg3Z21lcThMbytHZ3FueVIxeGUwTXJ6Wno1?=
 =?utf-8?B?VWEzWVN3UCtuZFFKSHZVOHVRV2pjTXBobGdhRzY3MU8yUVhPcGdycTZaQjJE?=
 =?utf-8?B?ZWhrbmpGdzJ5WEovWmZYaCtsdHZaeU01bU4vN3NmRTlkR05yVmZyWC9INDg1?=
 =?utf-8?B?T2RCdnVSOXVmU3hyanZxTUFYamFtcDBXQklCUUhzWmtDYVo4YmhMdGoyOU1N?=
 =?utf-8?B?R09VbzdSN21aSDZrZUp1VDRPdVlWZ0V2a29sOFE5Ylg4UkdFZEtBMHVrZzBj?=
 =?utf-8?B?WkVpNnFjMjlnU3o1Y1d0ZG1lQjN0UW9objd6MHVIekgwUlpkM1ZGVmJOSGI2?=
 =?utf-8?B?Y2sraU5pU2FEZGh5QUtSSnJVWDJIYU5xbWw2QjYwYjZqbGVJTXcyM0N3TUMz?=
 =?utf-8?B?Yk5SWWoyMTZYSHJuYUxoMk8xVTUza0hVTzZ6QmduVFZjQnZmRHJVLzcxcFJo?=
 =?utf-8?B?NFlDenhCcGRiZjN3SUxScWcwMnBLby9KdTYvN3BET0JGN1ZHQmlQZ3hjbnpF?=
 =?utf-8?B?VStLWEFsQ2NiQzgwenVSNnl6V2J5UFluUTJmbFd6MXFhb2syUU1uY3dQS1d2?=
 =?utf-8?B?bmdDSzR5Q2M2dVhMb3lYeXB1cmo0SEZZMjljM1c0bFBlK2xnd3pPcW5hbHRP?=
 =?utf-8?B?d3F4bERCN05yY2JCNjkxQjhiYkVOUW01V0tIZU5nTGUxeWJ6bWozbm5WYkJF?=
 =?utf-8?B?VU44a3I0a0g3S3RqN1Z1OG5VWGU5R1h6VXhJTzRRaFJCeTM4N1NFS2FyU0N4?=
 =?utf-8?B?eVFlWXR5UlA1YWlpUTZvU0RwcTBZTmhNSnplTzBZeDM4S0VVMWJhcmNHa05q?=
 =?utf-8?B?Ry8yVTNVRHUxOTBSS2JxcHVlUm83OWI1QjdBUTZrcStMZTdUYzZpYlVieTdz?=
 =?utf-8?B?cUNJTUx3VmZ2M1E5KzUwVHlDYUNEbzB0WEkzaVRnZzFTYnRUQlpkald6UElP?=
 =?utf-8?B?NW9TeDJva2V3MWdDN1dFblp2R2pWN0dDenNpVEZFYlcwNkxlbmxSZWFYbHM3?=
 =?utf-8?B?eWV3SG9tVUlwaS8vMldFUjYwTTJCcGJhNkU3c0dlc2wzUXhwQ2RrK0gwQ2JE?=
 =?utf-8?B?NWFBcG1RQXlEWDNTd0RMUkZWT2lOMStPNi81Qm54bEg4WVBqMUhMVE90Q0d0?=
 =?utf-8?B?MXkvT0lwU0wvYU9vY2tUL0wybkF4S3dvem11cC80K29kMjRaQi9acFZYSHBG?=
 =?utf-8?B?K3JDS2ZSU3R4cTFLbWk4dVJiaTVSYndlUFpGWVJ3SVNkMGhsUjVLOTk1UHZ6?=
 =?utf-8?B?NFBkaG1PZXZrNFVhVWswVUkzdCsvaVovd3BtZk9kaHlqOEs4TjZLL0hMK1pY?=
 =?utf-8?B?VDhEL2xHQ094OVQ5ckw0TVlnWmlNenhtUTFkRGJ4SGdZWnl6UUd6M0tRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EFFAE0B8158A142B4CEC7597D2157AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6495
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb42b216-d1ab-43de-439d-08dc7593db44
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|35042699013|1800799015|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MFhsRHFZa2lyR3YxM1NRSHMvbTlpNE5VU01HaXJQODVqUnpWbWxWMHBta004?=
 =?utf-8?B?bSt6aFBJS3hEdHAwSDRvMXdCckt2bVVxUEFEenFOVGlXSHErR2JYazdkVUsv?=
 =?utf-8?B?OG9GL3pST1g4bm5GSUhGaWhqeE9FZmUrbWV0K1NiK0J4eWJSTDRwNUtJc1pK?=
 =?utf-8?B?b3hKcTI3blVPZWdHYVNQTUVnTDFYT1JDSjY0RU9SYkErMGt2VW9HSXJYL0lm?=
 =?utf-8?B?WStZVDg2cmRMLzVVYlRubHo5anc5ZzRPUjZxTHViM2NSZkcvNytTR01oZjFB?=
 =?utf-8?B?OUorL3dvazBiTVBOaWVGcXRIcENaUHI2MTJaODdOajBVWXU1WktBWTd6Rkt5?=
 =?utf-8?B?UUxBQUlPS3VLVDRTM3IrangvTmwwQ1dvNk1zWHRFKy92QXRlWXNZU2VKUVN1?=
 =?utf-8?B?TG12bDl5V0xrVk4xSCttWHNOVDhaclUyWXJwcmlKQks5TU9lRFhEbWc1SnZM?=
 =?utf-8?B?Z1Z5QzM2Q0M3Rm82TVF0RkRyNkJid0IrSUV5VWY5SGc3dzhoTUV1OHZLUFlS?=
 =?utf-8?B?WHMzYUpTNmFQb0NaK2YrS0xMMWc0TDZXeU9SMzZUTWlBUW9wTUtvUDhhS2No?=
 =?utf-8?B?WVg1b1VObjhLcTVnNGkvV2F6Y1BnOHZ3eGlrbVdVZzJwemhuMzJJc3lrbHgz?=
 =?utf-8?B?N2grTGlSbXA3eXB6ckZEU3p6a1creWVqcWxhYjBRS1BEenN1dFJ3Rjg0NXIw?=
 =?utf-8?B?M0FqOUFQUjdJVWRpWENwbGxidjhUZXRRWXZCS3RnOHppekZxR3BZQWFkNkVE?=
 =?utf-8?B?RTFybWxDRjRQYWk1VmNWT2dJZDFMQUFkMFk2emUyTHBLYkQyNDI4MlE5UWt0?=
 =?utf-8?B?M2dyMW5oUnNjWGt5UHRkZjdTTXQ1QWFJMnF0YXZTNU9XaEduN2s0TWdJbDBX?=
 =?utf-8?B?R3JpSjNqUEJrM1RWWFR2bmVVM0F1WCtUWEZ2d3huWURPcTkyQ01uUi9RVWxs?=
 =?utf-8?B?NjJLV2VJY21GMHhLT3JmNjU4UEZJTUduLzM5T2dnbjgrelowQ05ITDgvZ3lT?=
 =?utf-8?B?WCtoelBOWHJpUTdSR016TzRhTUlBeEM5R29JK1JXVUJMV0lydy9Fd0xhUHhT?=
 =?utf-8?B?VWR5TmRoVk93Wis5cUo1QVN6WmVwR0J0cVZiTEtNWnZwWU1nTDA3bG93STJl?=
 =?utf-8?B?ZW1LQ2l6c1Q5cktPRWNMa3FNRzRBdG5vcFBvRVVDcFRBOFlFSUZHR2VpdDBB?=
 =?utf-8?B?T214YVkvWlY3c0dJbjBlcjExYjZVVHZrYVNDaTZoemM0ZGdGSDdjSlc1bnEv?=
 =?utf-8?B?T3dsNW9ULytUM09JQWlMVVhidW96LzV3V2VVbG5XZzMrdXhIWGl6eEVtaVhR?=
 =?utf-8?B?aWMrSjcxbnM2dXlsSFREMWl0R0p6a2pvczdXazdzYlpwK29LNXhKeTVkaU91?=
 =?utf-8?B?YUdIWldYakhQS2NleHVidVJUays2cFp6a2dSK2xrbGlWOHVGSlV0SkswUkw3?=
 =?utf-8?B?Y0ZzOFFwVjJ2WnBCdDdPTytWTS9WYXlqZ1ZwVmk4cUVKL2Y3UUoxMjM3T29W?=
 =?utf-8?B?VTRWN0xtUW9KczY1L290SmgzMEFKSFUvRGc1WStlV3dObWZEYnVmSmxCWldo?=
 =?utf-8?B?MXg2SlNWOUdGR1RTcWxMUDgzSVJoaWxmanNCS05FL2hCeGh6ZWxzR2htbUVk?=
 =?utf-8?B?aFl6cENuS003QmFKMEZObUNrQUtSK0ZqZE40VWFFb2pZd3dLUUNoOHdXMjdY?=
 =?utf-8?B?Vk0xR28yTEtOK3R2MEZ4NnRxYkRBSXl6cFlPK1lPekV3TlMwRW5kcWdFT0V2?=
 =?utf-8?Q?qcZiOBeMiDhcPq+0vAN4HJxlhiPsbwSpNHZF2uZ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(35042699013)(1800799015)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:35:16.3888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a814dd-ac43-4a2b-0d19-08dc7593e05e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6587
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199452

VGhlIHJlZ3Jlc3Npb24gb2YgTElDRU5TRSBiZWluZyBtaXNzaW5nIGZyb20gdGhlIHNkaXN0IGlz
IHJlbGF0aXZlbHkgbWlub3IgKGJ1dCB3aWxsIGJlIGZpeGVkIGluIDEuMiwgdGhlcmXigJlzIGEg
cXVldWVkIE1SKSwgYnV0IHRoaXMgcmVsZWFzZSBoYXMgYmVoYXZpb3VyYWwgY2hhbmdlcyB3aGlj
aCBpcyBicmVha2luZyBzZXR1cHRvb2xzL3BvZXRyeSwgc28gSSBzdWdnZXN0IG5vYm9keSBlbHNl
IHRyeSB0byBkbyB0aGUgdXBncmFkZSB1bnRpbCAxLjIgaXMgcmVsZWFzZWQuDQoNClJvc3MNCg0K
T24gMTUgTWF5IDIwMjQsIGF0IDE4OjMyLCBhdWhAeW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4g
DQo+IEhlbGxvLA0KPiANCj4gdGhpcyBlbWFpbCBpcyBhIG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBB
dXRvIFVwZ3JhZGUgSGVscGVyDQo+IHRoYXQgdGhlIGF1dG9tYXRpYyBhdHRlbXB0IHRvIHVwZ3Jh
ZGUgdGhlIHJlY2lwZSAqcHl0aG9uMy1weXByb2plY3QtaG9va3MqIHRvICoxLjEuMCogaGFzIEZh
aWxlZCAoZGV2dG9vbCBlcnJvcikuDQo+IA0KPiBEZXRhaWxlZCBlcnJvciBpbmZvcm1hdGlvbjoN
Cj4gDQo+IFRoZSBmb2xsb3dpbmcgZGV2dG9vbCBjb21tYW5kIGZhaWxlZDogIHVwZ3JhZGUgcHl0
aG9uMy1weXByb2plY3QtaG9va3MgLVYgMS4xLjANCj4gTk9URTogUmVjb25uZWN0aW5nIHRvIGJp
dGJha2Ugc2VydmVyLi4uDQo+IExvYWRpbmcgY2FjaGUuLi5kb25lLg0KPiBMb2FkZWQgMTg3OSBl
bnRyaWVzIGZyb20gZGVwZW5kZW5jeSBjYWNoZS4NCj4gUmVtb3ZpbmcgMSByZWNpcGVzIGZyb20g
dGhlIHg4Nl82NCBzeXNyb290Li4uZG9uZS4NCj4gTk9URTogUmVzb2x2aW5nIGFueSBtaXNzaW5n
IHRhc2sgcXVldWUgZGVwZW5kZW5jaWVzDQo+IA0KPiBCdWlsZCBDb25maWd1cmF0aW9uOg0KPiBC
Ql9WRVJTSU9OICAgICAgICAgICA9ICIyLjkuMSINCj4gQlVJTERfU1lTICAgICAgICAgICAgPSAi
eDg2XzY0LWxpbnV4Ig0KPiBOQVRJVkVMU0JTVFJJTkcgICAgICA9ICJ1bml2ZXJzYWwiDQo+IFRB
UkdFVF9TWVMgICAgICAgICAgID0gIng4Nl82NC1wb2t5LWxpbnV4Ig0KPiBNQUNISU5FICAgICAg
ICAgICAgICA9ICJxZW11eDg2LTY0Ig0KPiBESVNUUk8gICAgICAgICAgICAgICA9ICJwb2t5Ig0K
PiBESVNUUk9fVkVSU0lPTiAgICAgICA9ICI1LjArc25hcHNob3QtYjNlMTI4NGY3N2JiZWZmZTYy
YmFkYzgwZDgwZjYwYzE0Nzg2OTA5ZCINCj4gVFVORV9GRUFUVVJFUyAgICAgICAgPSAibTY0IGNv
cmUyIg0KPiBUQVJHRVRfRlBVICAgICAgICAgICA9ICIiDQo+IG1ldGEgICAgICAgICAgICAgICAg
IA0KPiBtZXRhLXBva3kgICAgICAgICAgICANCj4gbWV0YS15b2N0by1ic3AgICAgICAgDQo+IHdv
cmtzcGFjZSAgICAgICAgICAgID0gInRtcC1hdWgtdXBncmFkZXM6YjNlMTI4NGY3N2JiZWZmZTYy
YmFkYzgwZDgwZjYwYzE0Nzg2OTA5ZCINCj4gDQo+IEluaXRpYWxpc2luZyB0YXNrcy4uLk5PVEU6
IFRoZSAvcHJvYy9wcmVzc3VyZSBmaWxlcyBjYW4ndCBiZSByZWFkLiBDb250aW51aW5nIGJ1aWxk
IHdpdGhvdXQgbW9uaXRvcmluZyBwcmVzc3VyZQ0KPiBTc3RhdGUgc3VtbWFyeTogV2FudGVkIDEw
IExvY2FsIDEwIE1pcnJvcnMgMCBNaXNzZWQgMCBDdXJyZW50IDIwICgxMDAlIG1hdGNoLCAxMDAl
IGNvbXBsZXRlKQ0KPiBkb25lLg0KPiBOT1RFOiBFeGVjdXRpbmcgVGFza3MNCj4gTk9URTogVGFz
a3MgU3VtbWFyeTogQXR0ZW1wdGVkIDEwMyB0YXNrcyBvZiB3aGljaCAxMDAgZGlkbid0IG5lZWQg
dG8gYmUgcmVydW4gYW5kIGFsbCBzdWNjZWVkZWQuDQo+IE5PVEU6IFdyaXRpbmcgYnVpbGRoaXN0
b3J5DQo+IE5PVEU6IFdyaXRpbmcgYnVpbGRoaXN0b3J5IHRvb2s6IDMgc2Vjb25kcw0KPiBMb2Fk
aW5nIGNhY2hlLi4uZG9uZS4NCj4gTG9hZGVkIDE4NzkgZW50cmllcyBmcm9tIGRlcGVuZGVuY3kg
Y2FjaGUuDQo+IFBhcnNpbmcgcmVjaXBlcy4uLmRvbmUuDQo+IFBhcnNpbmcgb2YgOTIyIC5iYiBm
aWxlcyBjb21wbGV0ZSAoOTIwIGNhY2hlZCwgMiBwYXJzZWQpLiAxODgwIHRhcmdldHMsIDM1IHNr
aXBwZWQsIDAgbWFza2VkLCAwIGVycm9ycy4NCj4gTk9URTogUmVzb2x2aW5nIGFueSBtaXNzaW5n
IHRhc2sgcXVldWUgZGVwZW5kZW5jaWVzDQo+IA0KPiBCdWlsZCBDb25maWd1cmF0aW9uOg0KPiBC
Ql9WRVJTSU9OICAgICAgICAgICA9ICIyLjkuMSINCj4gQlVJTERfU1lTICAgICAgICAgICAgPSAi
eDg2XzY0LWxpbnV4Ig0KPiBOQVRJVkVMU0JTVFJJTkcgICAgICA9ICJ1bml2ZXJzYWwiDQo+IFRB
UkdFVF9TWVMgICAgICAgICAgID0gIng4Nl82NC1wb2t5LWxpbnV4Ig0KPiBNQUNISU5FICAgICAg
ICAgICAgICA9ICJxZW11eDg2LTY0Ig0KPiBESVNUUk8gICAgICAgICAgICAgICA9ICJwb2t5Ig0K
PiBESVNUUk9fVkVSU0lPTiAgICAgICA9ICI1LjArc25hcHNob3QtYjNlMTI4NGY3N2JiZWZmZTYy
YmFkYzgwZDgwZjYwYzE0Nzg2OTA5ZCINCj4gVFVORV9GRUFUVVJFUyAgICAgICAgPSAibTY0IGNv
cmUyIg0KPiBUQVJHRVRfRlBVICAgICAgICAgICA9ICIiDQo+IG1ldGEgICAgICAgICAgICAgICAg
IA0KPiBtZXRhLXBva3kgICAgICAgICAgICANCj4gbWV0YS15b2N0by1ic3AgICAgICAgDQo+IHdv
cmtzcGFjZSAgICAgICAgICAgID0gInRtcC1hdWgtdXBncmFkZXM6YjNlMTI4NGY3N2JiZWZmZTYy
YmFkYzgwZDgwZjYwYzE0Nzg2OTA5ZCINCj4gDQo+IEluaXRpYWxpc2luZyB0YXNrcy4uLk5PVEU6
IFRoZSAvcHJvYy9wcmVzc3VyZSBmaWxlcyBjYW4ndCBiZSByZWFkLiBDb250aW51aW5nIGJ1aWxk
IHdpdGhvdXQgbW9uaXRvcmluZyBwcmVzc3VyZQ0KPiBTc3RhdGUgc3VtbWFyeTogV2FudGVkIDEg
TG9jYWwgMCBNaXJyb3JzIDAgTWlzc2VkIDEgQ3VycmVudCAwICgwJSBtYXRjaCwgMCUgY29tcGxl
dGUpDQo+IGRvbmUuDQo+IE5PVEU6IEV4ZWN1dGluZyBUYXNrcw0KPiBOT1RFOiBUYXNrcyBTdW1t
YXJ5OiBBdHRlbXB0ZWQgMyB0YXNrcyBvZiB3aGljaCAwIGRpZG4ndCBuZWVkIHRvIGJlIHJlcnVu
IGFuZCBhbGwgc3VjY2VlZGVkLg0KPiBOT1RFOiBXcml0aW5nIGJ1aWxkaGlzdG9yeQ0KPiBOT1RF
OiBXcml0aW5nIGJ1aWxkaGlzdG9yeSB0b29rOiAzIHNlY29uZHMNCj4gREVCVUcgNSBbRXJybm8g
MjVdIEluYXBwcm9wcmlhdGUgaW9jdGwgZm9yIGRldmljZQ0KPiBBZGRpbmcgY2hhbmdlZCBmaWxl
czogICAwJSB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEVUQTogIC0tOi0t
Oi0tDQo+IEFkZGluZyBjaGFuZ2VkIGZpbGVzOiAgIDAlIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgRVRBOiAgLS06LS06LS0NCj4gQWRkaW5nIGNoYW5nZWQgZmlsZXM6IDEw
MCUgfCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wgVGltZTogMDowMDowMA0K
PiANCj4gSU5GTzogRXh0cmFjdGluZyBjdXJyZW50IHZlcnNpb24gc291cmNlLi4uDQo+IElORk86
IEV4dHJhY3RpbmcgdXBncmFkZWQgdmVyc2lvbiBzb3VyY2UuLi4NCj4gSU5GTzogRmV0Y2hpbmcg
aHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL3NvdXJjZS9wL3B5cHJvamVj
dF9ob29rcy9weXByb2plY3RfaG9va3MtMS4xLjAudGFyLmd6O2Rvd25sb2FkZmlsZW5hbWU9cHlw
cm9qZWN0X2hvb2tzLTEuMS4wLnRhci5nei4uLg0KPiBJTkZPOiBSZWJhc2luZyBkZXZ0b29sIG9u
dG8gZjQwNzVmNDVhODI0YzFlMzZjMTIzNTU2MjdiMTQzZGJlMTBkMGMzOA0KPiBUcmFjZWJhY2sg
KG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+ICBGaWxlICIvaG9tZS9wb2t5YnVpbGQveW9jdG8t
d29ya2VyL2F1aC9idWlsZC9zY3JpcHRzL2RldnRvb2wiLCBsaW5lIDM1MCwgaW4gPG1vZHVsZT4N
Cj4gICAgcmV0ID0gbWFpbigpDQo+ICAgICAgICAgIF5eXl5eXg0KPiAgRmlsZSAiL2hvbWUvcG9r
eWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvc2NyaXB0cy9kZXZ0b29sIiwgbGluZSAzMzcs
IGluIG1haW4NCj4gICAgcmV0ID0gYXJncy5mdW5jKGFyZ3MsIGNvbmZpZywgYmFzZXBhdGgsIHdv
cmtzcGFjZSkNCj4gICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl4NCj4gIEZpbGUgIi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxk
L3NjcmlwdHMvbGliL2RldnRvb2wvdXBncmFkZS5weSIsIGxpbmUgNjAwLCBpbiB1cGdyYWRlDQo+
ICAgIG5ld19saWNlbnNlcyA9IF9leHRyYWN0X2xpY2Vuc2VzKHNyY3RyZWVfcywgKHJkLmdldFZh
cignTElDX0ZJTEVTX0NIS1NVTScpIG9yICIiKSkNCj4gICAgICAgICAgICAgICAgICAgXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXg0KPiAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvc2Ny
aXB0cy9saWIvZGV2dG9vbC91cGdyYWRlLnB5IiwgbGluZSA1MDgsIGluIF9leHRyYWN0X2xpY2Vu
c2VzDQo+ICAgIHdpdGggb3Blbihvcy5wYXRoLmpvaW4oc3JjcGF0aCwgcGF0aCksICdyYicpIGFz
IGY6DQo+ICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+
IEZpbGVOb3RGb3VuZEVycm9yOiBbRXJybm8gMl0gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTog
Jy9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3dvcmtzcGFjZS9z
b3VyY2VzL3B5dGhvbjMtcHlwcm9qZWN0LWhvb2tzL0xJQ0VOU0UnDQo+IA0KPiANCj4gUGxlYXNl
IHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1
aWxkL3VwZGF0ZSBmYWlsdXJlcy4NCj4gQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQg
aHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1B
dXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyDQo+IA0KPiBSZWdhcmRzLA0KPiBUaGUgVXBncmFk
ZSBIZWxwZXINCg0KDQo=

