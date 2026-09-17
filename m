Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ACFC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 16:42:00 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44295.1789663318272471952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 09:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ZxQJuOYy;
 spf=pass (domain: est.tech, ip: 52.101.70.12, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM7Yct8Q2Nj+EVsKGM1gzrs03Hz/OrwCsrDZFfx6PY0pv4+c/McXVZbD2NZ7txCM2aJw0M2mdp337TZCWYvNkRbZrhUdUQCHPkPEnCz8UomPIo5KYMpqicJvoXcm9iVV3A0V17pq8Mc1uXdX6j/EWSQHf5As6NB5IOAWoDU7OqEwO8QZSZN18J8hvU9fIvRndBB2iT2oa0/5/T9CvfSpJ9h4nbTTJF5/+B5uOlBT4mNFIZZwxL5eDpzJjxHaY3PsxH/3GxmlAy1C+YXTJIWTOiJJ0+jIymr+4ScITrGE25M9/QwJhoSWWW6oJy4hO59m+uXth5ODVnzfojDMh76j4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKJw0tLLKyLE3X9RqPtexFUm6eoPYM6ZTNhaEDr7Vdo=;
 b=ErVe0jPzvzP5NEXPCv2r60Q29SPJxr6DwkHaujlu1Qwck9ZnxYqz/vxHpfL/T+QTDIeWYeu4Ncq+YTaji42pnXrqJ8MEqfbHj3iENY+GDmxCI0sHtw2e5b9KI5jghZQndnAeJLvLyepLAbADwX9cy5WjqsZGaxriMrTTVZDoPLuh2HAuwMC+tIrZTeW5AbY0cZZGVtwLx3h004EDc3vk6tSA5EBv4/dkVNhDQtlh23yr0v65eJAJHumKdlSOaKdgfrguLWvBpzFtPWdVuZDfmkz1xhRN65TFoSGLmx9NU9HK47ShoSYRjo29erBQ4+B+i0bgNyN+6E+E7ykgrZHWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKJw0tLLKyLE3X9RqPtexFUm6eoPYM6ZTNhaEDr7Vdo=;
 b=ZxQJuOYyhL2QD/lCQngQ3r2tEK4gHRuAJpka0CSCjL+l6J1vrfEjFd+jklKh0EVu3qUV6dIezlb4C/NtEyABS0AArxCAP+pMrzFDbnLvMqWUFVUav8qkJy8gGzowVh6pI2jcxx2nQW0aTYym8r5P0GswRaKoGJwZfZug2PZLppopt0/4eD7ZjMQEYyDjBvYwhJnXGaZA8YhV9RqD3QwfgEYkq0uV/HD6OOQMQJJXC3MjPRHgEzI6Q6rKJHtdniKwjFRARhqxiHWq1pmbKKC40h+sMI/6F1oFCX05QsB2wUOQ5x/zVzcKe0Z9OLgSTOHayeAQemntV2yTu/afuGPxTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0934.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Thu, 17 Sep
 2026 16:41:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 16:41:53 +0000
Message-ID: <b65aa821-f80e-44da-b9d3-703e4eb30233@est.tech>
Date: Thu, 17 Sep 2026 18:41:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH v2 6/7] libpcap: Fix CVE-2026-18313
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
 <20260915191623.42107-7-jaipaul.cheernam@est.tech>
 <DLHLPNY1MXSH.3FU70J9S1LKQX@smile.fr>
 <d8bfee70-6f8d-4f2e-a854-e644609a2d6f@est.tech>
 <DLHP9TW29FBH.3BUNJA3OD49Y6@smile.fr>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLHP9TW29FBH.3BUNJA3OD49Y6@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0302.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0934:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d679f9-9c30-4005-8b8b-08df14da945a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cbTwmOpcDdpyT+5DzlNz9SKsyqKA81QgnfqoIk8R9ZA9E5axVaXegSt6iv4SSexgwXKzQOuua/6PPWx7thufTXg706YrHGzrPvG8xTG5Xk5FH3qsTnCxRg35a4oIv7TsZVzAyEthDhQtVLmJZVE8XbAK5mjpb8V8pur+ODJdpZVXb6CaTlKjqmvNJojX5r8Oft3tfVX4SAyLMM2KVrgNW0MNzL1H1rwWgwhNOmnXmd/EROXfVdpidpd8rZnW0kqM+mOTMkxXKQmV3vjL3mtQfuBcaGUkP7+VxkxV26lcSrOjmFRQvc6sQMxNIi8nk7/pFe60l9F0Q55ZvMK8806sZ9NW5oAWJvhnR9Vk2vAc0a5VJHqJLbqjSoaL1h2LgfO+PDlFLTrWPQ9JOJ6qdqcUhEkeril4DoliBuLfV1bMKeeFUWVBAiV7CasKXxBGkTK9CZHF3ZQDm+hMZcDc6vPjM71YMR5mNgPsiHldvZLWUW2NfPTyR3ZeTRDLZ89m6k+ZfqdLMnJM69NIG3L0hsfJ+r+B/gbQvGNMniboWmWzYRTucN0cnqQSeMinrqGOXPT4PSsBlquRmfEvgwgdV4GV+IvYMBoJf24tQJ5KeZSJBQq1SGXNgABwQE9DCmtyyYRyXFBadq1jCVEW/cYJ4hnLlFdvZxF22CGvOp86HP41V78=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXA0Ky9Mc1o4U1cxaW5XeVh5ejVDMGVhSFN5b0x4S0thMFdDdXdXeDFQOUZN?=
 =?utf-8?B?aGpoaGY4eTRVR2h4cnA3VW5DOTFRR3FjNG54UjBmdVk5alBtY0d3U3JaSEM4?=
 =?utf-8?B?eUZIT21IOWQ1SVh3cmNQcWcwWnRtQ08vTk9XOElPejF0MVBqZDhxbnlZNkI3?=
 =?utf-8?B?V2Rndm82UHFKRDY1cjJhMTlOQXN4MWhKcTVxSVI1UHRYRlYwcXlFOS9hMkho?=
 =?utf-8?B?QUlLUDlZYm9wQ3c4VzRkMTZ3VjVybGVOVUhxYmRsb0FsQ0RORGJQazJReHdY?=
 =?utf-8?B?Zi9hcEdrV1R1blpCbTE0c21mMXlMMXhGTzRleXVBbzltQ3c5RGxkUGMyQ2hC?=
 =?utf-8?B?dG9hMEZzM01YVDVXeW1WNm9rRk0vbGVSdWdKTTZKUG9BZ1RtNHNSdkZQMmFw?=
 =?utf-8?B?bmdhSWtqZEJRSVlhZTJUek9nUUlHamUwTi9ycmMrNWxKYytnQkNHUEIwMzdL?=
 =?utf-8?B?VDRpZ0tpSFRWaXJtSkNOaU1pN25ITVhDMjVOSFlMbWw5SWV2VGo5ZmpNSzJy?=
 =?utf-8?B?eGtzbUQ3QjYvdG00c25LclA4S3ZId0RIUVdDak5kcXBhVi9TLzNOQUNWa28z?=
 =?utf-8?B?UEwrM2t1aEwyVnlaRHl0UHFnVHluZWswdGV6c1NVbW1sMHJpa21EY3htMUZM?=
 =?utf-8?B?M3FsTWVxWDQ0dXJyelNsQzVHdmxVbCtVTVJ1YTVCSlBQQ2prMEV2UkdOdGVu?=
 =?utf-8?B?NDhHbm43ajQ2NEV0dW10RjJhbTNwUjRTL2QvdmZQbHRGNWUzTTlITUI2Yk9z?=
 =?utf-8?B?K1ZZZHBjcnlrNE5ocEN2STVEcVdyT2tRSU5NU0Jqd3VuaEc3b1pCdC82dHky?=
 =?utf-8?B?SlRScG9qb3lEeTVVM29GcHBzbDI3ZXZraEVCS0VQV2lQSkloY0xXYys1TnVP?=
 =?utf-8?B?ZVlFeHpQbFhzWXkrL05LOUVNdzZhM1lUNU1JeVNHRGo3akVCMUNFSklwL29I?=
 =?utf-8?B?YWFHenBjVWQ2dXVHS0tZVlFMMGRrMHdPT3liSzVocFJWdzl3cW4vSnc3MUpr?=
 =?utf-8?B?amdvVFFEOUxKaWhJR2ZnOWR4bG9OZkRtZWUvWVFsOEFrTEdnWTZLY0p5bE1u?=
 =?utf-8?B?TWtMeHRCTy9iRkY1UWo1M3JEaUFxUWR4VnUyZzBVL3lzVjZTUWpPcUxFZ3ZD?=
 =?utf-8?B?ZHliRnB3WitvbFU5ZmV3MkE5Y1hqSEtuVWVTNnRmUHZQVWhrREd4NlpHQm5q?=
 =?utf-8?B?aGNBQXZ2N2NuQ2RBTG5sWjZQUXVETkd1NjAxM1J0djkxZEtRMS9aMVJtVHE0?=
 =?utf-8?B?MzVOa1lvanVHQ3QvSXJ0aHlqdnRlU3V5b3hEeUFUS0w2QitUekhvdWJOWHlL?=
 =?utf-8?B?Z0lxT3dweU1Rb3F0eFE1OEhESW1NbVRQWWc4NkRNK2pvSDQ0aTBRZzlnUE00?=
 =?utf-8?B?OXY1eHhlVGg3Q1VmdlNMVXpOQ0tRckV2Y3h0VVpHbVJIU2dLVEt4YTF1ejdv?=
 =?utf-8?B?c05LT1BQbjJ5YkhZS3R2eGZVRE1hSk43U1lmUjZoQVp4Q2s4RktubTRaR0gr?=
 =?utf-8?B?WjBjaHBzajhJVE9zV2tndGM4Yi9iSDE2WWRzYXJkbmNtUDBrMVJlalBiNXBo?=
 =?utf-8?B?MDNJUVBjbVNNV3Q0SE1VWHhFMm5GeXF5OWppQ3JDSzViVjVhUFhmU3lrZ0tS?=
 =?utf-8?B?OExtYXo4M3ljdytzYUVYMWJWeXlIVE5sUVJoNktQRDBsMXZSeE9CRnlSTlFT?=
 =?utf-8?B?b2grNU83cEprYWRCOU5QMlNXcHpEVm1NcDNYUFNIcFdyRDd6RDRxWDcrMlQr?=
 =?utf-8?B?RFdiR3Z1ckltenFubWxEMUxaYzVJYU5KeDJtTm9DbjZpM2xuSmNmUi9ia0F0?=
 =?utf-8?B?TjRob29YQ2FaT3d4YTA2THJTdWNzZWgwcmxzQTlZMUpjS3p0RWFSMjlJZlpr?=
 =?utf-8?B?c0JFRjJxUUp2VVZSWG12cTJnOVVBUE1qdTZDbkV1TjdLLzlPRWZZekJHSGJu?=
 =?utf-8?B?akFuNFZMWGYyQWxEeTViMUpjSU9kWUs1REZFUTA0OXZRUC9IUGpIbjhON29p?=
 =?utf-8?B?V2MyVHJOR0VkcFViUGdzdUkyZ2hPZU1hMytSNVdTMHp2L0dCUWkyTXdhWUdP?=
 =?utf-8?B?cVJIRWs0ZGRzenUxNG9rcWp0QXk1NTQyQ1BjUHkrVWVsR3F5UEJmVXdXK2xH?=
 =?utf-8?B?N0pXd1ROYmxBWTZFb29EM3lNOUNrSFQvVjNvaCt1bFkvR0VkMGRZa0RSejBq?=
 =?utf-8?B?VzJJTytwTFZabVp0Qmh2aUIzN096cGFMTDlzWFI1T1piMWNuT3U2cGd1L0k5?=
 =?utf-8?B?UWJidFU1S05TT3B3UTBiK2hXTUxkSHplUG1iZXRyL2NCYnd3M2phOVQzL3BM?=
 =?utf-8?B?ZFIzOEdJQ1VLTkM5d3hHY3FiYXAvWjFtMHZQdTlYRFgvMmxOVFExQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d679f9-9c30-4005-8b8b-08df14da945a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 16:41:53.5613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xL8V+d51pT6XpuOasUy/N6Am9+TEEqmPpYzINQaapPRbr7ao1E2qYAgHVTeQxiarXseaaSzlDha67dws19NHjztbjEUtZnUA23SZlFTVbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0934
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 16:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246079


On 2026-09-17 17:34, Yoann Congal wrote:
> I'll soon start working on scarthgap so if you can send that quickly,
> I'll take it in my branch.

I will send new series tomorrow, so please ignore scarthgap series.

Regards,

Jaipaul


