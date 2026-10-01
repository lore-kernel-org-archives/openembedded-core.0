Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5525ACA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 15:48:01 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14408.1790869677611393400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 08:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=L5OuzlfM;
 spf=pass (domain: est.tech, ip: 40.107.130.58, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgj+vJXrNc6HfOGYJb2uL9Yk1DL1ZjLoiqFttGRIovi2Izx+nRp+63p9znMDXscrTIJMEbKVxr1T+CpZ54BgCyZIQ/btWUIwHrhoyzB7PfbRtLDnpLUR0LHtePy0fjeIj2kx4c2gqiTVtlfWQj1SlwsY6q2vk/8XI764O43SjmLdkYMFtZ1uXfXFkcaQ1npcRV/nXPhA6UZfd11oWnTGY2uV092ofsq6YgdRCxx3OlwWTRIeUvXSzewn+/dLL7XoVu7a9PEm/kBUF4CUdc96dekNhL7YvYRWJ5x16A43KxTIErPZW9SvmCrUFi+Isu9Xb5lOLZ5eDczf5+MuGkTpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir8xgK0FmDs7Ilmr75S8DeIER9uzL1Emtw747+VkYy0=;
 b=I61eIP/AJtjQoX/uNeFYk+tqoVKOu04A77m1ZODEYgXHaKm6k/PwWa7dd1BSTp9elL7Kz4DXuD3fKOM5A6IzJJOFjC4BLd+YrmFUvU27OECQi4bOBvLrTPisA9bv3V6gS6HOtu9kdnsZWlJ2WShFADcO3MSSElWrdTdYxXTJrERxXifgQrK9sLMsZE67gqvEaT7m8MdPPzRnFup9brVowtF/BhSpWC5DQUNCwoJl/s0k9BAEunbXjm9QvFkh/BFTn/YpjaKATKwEUgKwU6W9gXma4OsGNdAskGyervY1RV0xN/rP1wpLK3p+DaDvI0W1TvWilR0QupQVi42tZmy0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir8xgK0FmDs7Ilmr75S8DeIER9uzL1Emtw747+VkYy0=;
 b=L5OuzlfMPYWjvgtHEenmHS5YFqqJNR1VcVqwUTuZvo8eZgJ1peLcDFC9EBACuazBSWPOMLZnIjlRdUUFm9kVB2CqzZODFNKOZNNUc2XpVIE2Hpm8QmjSnWznXBx97ktC/R0gGOom7nzv93WzRGClq6MckCnix+cpKL45JLnX4ATIW/ocYLBxdcT4kwZDh1RWStirvwWv34bqkvkwU5vPZPLWirHwwLHwXe877MPk1cbm7t4WF72C1AwagaDYU+Ewil9obUQn+xXnZ+dm7H7v7rjWEBcyBqgoeerIt4SAx4Y9JTgJo+ReERU4nmfDQIPO2bAr7EZJgngUL864Mq9KRQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by GVXP189MB2008.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 15:47:50 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 15:47:50 +0000
Message-ID: <693a4702-0920-4cb2-8669-1aae65b5e07d@est.tech>
Date: Thu, 1 Oct 2026 17:47:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: add rust-analyzer support
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
References: <20261001125630.760962-1-benhur.tessele@est.tech>
 <6ded5087cc73adf490441e55b296d3130da129f6.camel@pbarker.dev>
Content-Language: en-US
From: Benhur T <benhur.tessele@est.tech>
In-Reply-To: <6ded5087cc73adf490441e55b296d3130da129f6.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::14) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|GVXP189MB2008:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b65a931-b9d5-4554-756a-08df1fd358fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9NgyfOKiU0bUlz34oEPie7I32KEtvkkp4ojck3ec8ntYiOQ0ytBe4DpAsUbr7JmVeuC+eUxTEFWNiv+zTinaqtuFnYp9eNydc6mRj77VlH//+ghGy/e57EBv56LuanFoB7Al4O/uJNoBahEwAttbUY8qXdz8Mra+pJ5G6ACDXotRt0HHtpnf3pyma/AHT4K2TbROTTn4BSe0j32d9jshWW+eltUCnAfqVkHh2drdqIdpx1rIGLvqYfRI4+WqcgM9pjmmNSG42a5wmmXjmfHrxRCxZD15fWSjlYLq9FtTjg9TrzBKRWHp67Ha2CJ29o4vEWU5p5svWSijT0nvjziq3ih3xtIRC3s+vTAOXST7JqXNZe8XoI6eG/I5n9T1dY0D4enoAs1C7eoRHY6zI8XXK/0BZk9hEhoY6XNWwgG7LfwPrlc4nsgJlcSXpCa1HohSJrBfI0IRxGreMAPAry+cwnFlJXYBM57iRI+kFH8Oeq6ATddzppyj/h3uD7xU16btUqBpkxWpDy6lJLukpj6YjFtqqRgHNqbhm+3WBAs1wZsF9eWkJ4+Zx5JI3FJoW/mth9uU0TA1YNrmbq6kU06KjiE9t8ZVpApVr7uqZ00m0eLhffZhoH0QLVMMs8ehwG+8QQQ1CP8+BmSjWHTJShjjdjpTcqpEO9s9hM5AYqRkzp4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wk04bHBaRXVuTDMzdCtIMDk5akRGM1h6bFVnTjN4NmFST1kyWGt5U2xXd2Rh?=
 =?utf-8?B?dUh0V0tPNGZKQXJJKy9JU084NjZ3Z0p4bTJ4Tzh0U1VnYTBld2x1dUVsNndW?=
 =?utf-8?B?R0ZvRkJBOGc2S01yNEY2NmM1bXhkNU5yTjRDbjFDbWpNQjBYdFdOUkZrckdt?=
 =?utf-8?B?ZmZkUXAxTlFWU3lDYzBxdS8vR2hhOW9SQnBSUHAyYTk4OEhvV1R4YUhoUTdr?=
 =?utf-8?B?dVprRnhkQVJvTEhuclFVL0Zrb3RwazVRN2p3dUZpdVdieU1kTFpVdVVWZThh?=
 =?utf-8?B?VFBKM3orUGJlcW8vNDhqS3pESDNTOWJaWGZUSzlTNmQvT0I5Rk5uamNqeHBk?=
 =?utf-8?B?eDVLN2NMbE96SFRaNDI1ZFRzSXk3WXNHOUEwaFo3ZXF5M2ZuNXpRaTBYcElq?=
 =?utf-8?B?cTFKNDFRT3lRbE8yaEpkMDZIc2FaNXJLeGhkZGFQbGtMRkN4Wms0N3N6VUs1?=
 =?utf-8?B?eVFENmVDdi9OS3VSWG9WaU9LMnBvc1hUS0xxekRMcUNzWWMwTm1HbVVRKzBI?=
 =?utf-8?B?V2lzTDd0bDZBV3c3WkNTdXB5UnFzemQ2eHVQMno1MjRlVHE0MkhDTVVucnJs?=
 =?utf-8?B?dnh2U3hTSmJydW8xenRpNTJNUDRlbFAwdG1DSWlYNVhFWnpQakVKSEl5NlJm?=
 =?utf-8?B?Z0p6SElyTTJteVoySmR0ZXJBOHZlblB6MlZ2V3lsOUVVSy9sT3VkaGNTZ3U3?=
 =?utf-8?B?NU1CV3F2WWg0eUJRajZhNEJzR1ZyWjZsZ1ZNWjcxOGNuY3lUS3BKelRPRzB0?=
 =?utf-8?B?b043SGNkSUhqWklDeUY5WHlzMUZEclZhQndoelcwY1ArMmsrZWVrRkMyaGhW?=
 =?utf-8?B?TUpZc0hWTkZlS3hqYk42SlFxZnJwYXdsRFRROWUxQklnQTdQbWUwMkhqR2p2?=
 =?utf-8?B?VHlmRzQyU00wb25INXlKcExlN0duUGNvRVEzZVY1cHZLcGdYWVhmbEdZY0R4?=
 =?utf-8?B?R2Z4c3hPRFBQNmVaS1A5ZmdlQjZkRm1xN2RDS2xFRVVXRjQyRUhXOFY2MUQr?=
 =?utf-8?B?NS9LbmI1SzFhQU4rQyt4WERFb0ZJLzA1MUNORjl1a0V0bWw0dm9WTU96Nm9G?=
 =?utf-8?B?dmljVDFYZ3BNNHNTcmFOUWUvNU9haTJEYnN5ZzRVd3h5SXFkOCtwcWUvNWoz?=
 =?utf-8?B?dVBhOW9HbDd6U29aVktvcWhNTGcvc2VpVjlSNEh3ZDQ2b2xKck1DVE9VVlUz?=
 =?utf-8?B?QXRkcTRYbTFRSnBqbGhlNG43azRhbjdJdjR4Sk85anIyQ2Vack1Fd0xjdE1l?=
 =?utf-8?B?MWRSS1RreFUzdkYzRW1OMW4yNkwra3RhVHAvb0NnWU9nV1FiUGlpaDNvTUhi?=
 =?utf-8?B?SlNaVklUSFVVSDBwVXBTZ2VtclhqYUl4bTl1ajZTYkdkSDlxMTNZL3czUkdK?=
 =?utf-8?B?U0lqRzZnbCtGUmtFSzF0cndrWEhvd0xsSTYwOW42TWUrZ2c0Yk5mbWoxc1NN?=
 =?utf-8?B?MGd5b0lOVTBlNUNWRmhWaktFTHExSEY2dEg4RjYwaUsrbEIyaTFYbE9Bbk0v?=
 =?utf-8?B?UHJWN1QvRE1jVDA2UHlBSnhZTmoyODBwVUlJRlMyWFVrSVFPbXkwV1BSYmM0?=
 =?utf-8?B?aWZtNmFhSGEyUXg3UVdHR2lRWjlSemsvTjMyVUl4T09UdXJhY3RxbmJBeGV5?=
 =?utf-8?B?SG40cHlXYnRCZ3JYTWxjTjlrcU9BTWkyd3Q0V0E1dEVKOXRCQWZKYmI5b1Nr?=
 =?utf-8?B?SDRrZ2RUb244SnpMR0dDMFZpOStwZlJDOTUzY1NRTDd4Tm0wZ2tkbDUzMjE1?=
 =?utf-8?B?SE53a2xnRmZiSEZ2emVySUxqMjUwaFdiL1JzUFFPQThGd21Qd3FYY1F0UGJU?=
 =?utf-8?B?QytsZEhZNUJ4SmdneVFsODdsY1dWZmlOUUNqaW93bDRXM3AzaDM1elNGUnZz?=
 =?utf-8?B?MnlWb3kwZ3NtbU0yVDlZQVJOS2JRUFVLTlZzSCt6ZFI0d0hxekVkWkdLdndN?=
 =?utf-8?B?L1ZGemJ0bE1RNXRKUms5d3RTbUxKVDdJZTdidGhNWjBQOXUzR05Zc3dsOElB?=
 =?utf-8?B?WG5BQmxlcDRCOE5KQ3N1anZaWXhQMmpTRC9INDlodDhWWWZoL0xuc2ladWpW?=
 =?utf-8?B?MmwvQmJiM21rSGFSZnRZTTRlbGZDN1RONXVIV3NTaTRrMVZhQzBhR2pFNVdI?=
 =?utf-8?B?M1cyOERpVGhvQ21aRHBVR0M3U2FYYkdFZ1RnaGpuOTFvaDhSVVdHMHNDWXBi?=
 =?utf-8?B?bG9nNHQ2NEVTU1dmYzdGZmFRaW52UlBjMFBFSkRrQWMrQnROVGlodVNsRlps?=
 =?utf-8?B?dmxwZ3plQ1Y4dEpMVEY2K00wM29XR0FZYmlmUDYwVEVnODhod211bVMydEhP?=
 =?utf-8?B?MXQ1K0ZVUlZoaGluWWpqUldzTGQycUoxZllOZlRFWTUzMkdhY3JEQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b65a931-b9d5-4554-756a-08df1fd358fd
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:47:50.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXcNATY7d+lXeF9BYvlETMLefO3a6MNBayZh4jS25j31sSwtBE/UVUhNJtFEO7mHPbpqbKVLrhhwrp/NvoRwiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247042

> 1) What's the intended use case for rust-analyzer, particularly on the
>     target? I think we need at least a brief reason why it's worth
>     enabling this.
> 
> 2) What impact does this have on the build and package creation time for
>     rust?
Hi Paul, thanks for the relevant comments.

1) Short answer: I don't know. I agree with you seems odd, but I just 
followed what's already done for the other tools (clippy, rustfmt). I'm 
more than happy to remove it from target is that's the right approach.

2) On my build environment (poky/qemux86-64) there's a build time increase.

master
|- do_install: Elapsed time: 524.36 seconds
`- do_package: Elapsed time: 16.49 seconds

with my patches
|- do_install: Elapsed time: 619.82 seconds
`- do_package: Elapsed time: 17.16 seconds

Best regards,
Ben

