Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8ADC44503
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 21:15:23 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1023.1783458914492635937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 14:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=v5SRscac;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=L9bOX9rV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667KiJSX240806
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 14:15:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	Ti9JSqIXVfa3dwtsYXVn1muCcNUHI8xlDOIgExa+zvo=; b=v5SRscachSeNhNTQ
	PxKFyJ5XOOAlSwsU3uuyzHlsiJMLSW8l0SaZAKeWZ5zjNm5l++hymPiJBbUmv87Q
	UxVs5PfWAr9zv6Lk+7mlB5JXC9iCP3dE3RaqfaDBQjRpadfgQnDjNvD7h+IrOD+t
	tugLRfIG9jv3CvveuAnnHoW4Kjq9H8CN49L2EvIVeNrfscIwG+HqVk2gUmVpVv0R
	fGImpXYFiswo9Rp6EMkXGeLUi6c9XWSpwtHDEvyyOUsVqirfX4XiRD7FymHS8pzx
	3vfeWHTcvLt/A89qdq9zD52vB1/KiF+0K/0XodutvRXRNfePiIP4WMpElNGVYrze
	R0J1uw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4f98rmg38r-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQUaD+0d9+bl6w0Tr2l5ksgQJyulvadj84yxcZUjYXgSXjFNs2XLysVAdkCX5UrkOgwOFMi1LCSp4g3Mo/BeDo+Q21dE8w75FUMUhcdpumBff10HHAigX+JU0TA1M2Z51shjooSRVcfYFzMb3IIXCCaDLPiEBDiq7RWKP/xcJwWzGNkuy74g8vmBsxX6Ay/z2nja/6LFQZZf4w42EJdONs+Xg16zM8v0B+hJPIUy0gQd92NME7IakMqXwF6nF6gE03PMEoIws72WVejt+rylxZeRs9YkJZ9Mer3pb0XyLX6tC0OUygycEZl2LiuxJstKeHQHiXg/xFxzKpQ537tdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti9JSqIXVfa3dwtsYXVn1muCcNUHI8xlDOIgExa+zvo=;
 b=onLSL/ZbbzN9DxaDgu7U71fhbbldrR0C5Qa5NCDpJ4vK1QhWi+RI1OeOqqgOqwab8cqM8+jFWGeyQq1JPPJZqbiyx46hLl3vbhlJ3gyPbMn5zG6s+CUGXGCcaOeQ52tSspAz9k9emBx6PY6a2j7ZLFHLasaweWQwCFlBK+8pbqhJ0prPFxG8uCTLrZNt/OPy1/Dc+teg6DmcvTXsDHQ0u/kDd/2GmaZ3WX3rq5AC2Gb1KWeUUvpggoy+rYjzXLq4HDzW2vtyb3VkhtEnaK4QbiV6eImPb6U5h7whnwRibPIQtytoVyIGW75h+9XcQ1SRIt1SJZW0ScPdCWGkcBoX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti9JSqIXVfa3dwtsYXVn1muCcNUHI8xlDOIgExa+zvo=;
 b=L9bOX9rVBXIPQy54/W3uCAwtRYKs9fs499F/1+WLGjYKqC/dL5y0/NcEJa3sBzv4UuiHkz43QRFya7KBiuUQOjCMfUgte0hZI5n+UUF2GV/j2zGu3MuW6EOkOF8nJ29wR02B38kFfYnVmzGAFD+F1+P49pZdJHiHh88n5nGHBWE=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by CO6PR17MB4900.namprd17.prod.outlook.com (2603:10b6:5:357::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 21:15:10 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 21:15:09 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [OE-core] [meta][PATCH 3/3] oeqa/utils/metadata: Handle empty git repos in git_rev_info
Date: Tue,  7 Jul 2026 15:14:56 -0600
Message-ID: <20260707211507.2585072-3-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783457902.git.john.ripple@keysight.com>
References: <cover.1783457902.git.john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0162.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::13) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|CO6PR17MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: d9beddba-f834-408b-7f81-08dedc6cd332
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|55112099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	yJQXEvSfqUVajRse9oR2fFEiI3gPjSYTRJ0oDlDwR15g6kfKVA7AYgrHCQz9hn/RVPnI4UjDHHR16LwlsF5QxTdEabpfpwJBICSmtHYOk3qEn+V8rlC0Y7Q2WvEY7OzjEZgzIKSldZw06nA4ybE2EFMCVSSeN4fB6UPFHviqFxA034w/sMrzmBa8ZDn2gBHzbgAsenLuSiiidLrUYu3BtzqRhOPFtt7aqkkdwtCEn7DGUwys1wJpof/p7zYWNh6RNXU2SY0/tEcnWl/cvBeyfDrpoi852NbM0gfzAdho5bbQesQ0UX4M/eiv1MYGEds684Q/p0pq2p/6tle7T8815OWT0gnI7b5MjbYHixqOY16xUYkl7ZEoZTTHk1BatNXwXt8M/W4ynLgmpwqtLhtljDwuBYMg5l2AB1VhTbMzr7uaZ6WZ/40zFFFct74eipObOLmnBq0cuscCFUnssBBTsIEyBBZDVo0s9uJzPlNkP6RQgtbVFxVVafKMHWQE4nfrI6pIfb9xIYL2yrV1h7JjYmM9rXElkt2olK5n4t3FoG5JleQti6UUzCaZHxkdeQME5hWw0XJ2W+iWgc//mk/E5d1MK0ZrDy/rU94CM2ZgEaYGHAB+e3Nocw2c4prUT2QFQch0iIoDLjtKoP5iPOqR+QrInat/kMwMz2rjUklf3II=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?63hBr1YbjP4Rq1G6NY7EDbEkFfTMwR3Eyqf02wYCNMw7UILwUvnbnDV/j8fb?=
 =?us-ascii?Q?5N7OhEZvwyyv84Uboai9d8nFBYtS4L4F1QEtXuEkEEHXqn9TvACSNg+/BkTf?=
 =?us-ascii?Q?usQFKqIHkUg37L4d9dNGdV/zI3x7azygeaAN03jfruenmCFnFQKGU9Gk96X3?=
 =?us-ascii?Q?BfnLVPU4V2uGIdD+VGg7xKxNhtxSRCmmhEB9Mu+QTi6NlwVXdh/P10sqL4OX?=
 =?us-ascii?Q?opfRRPsfBSE62a0R3NRGkXEYAI2TjWLEbOR9GZ7/zjvvVmYp2Y/ZvNYUuP2Q?=
 =?us-ascii?Q?EWajXO3Wfy6ZwZWh665HiECEEpDurYBK7kNirZz7r4r8XAAua1lRAnqC23QV?=
 =?us-ascii?Q?RfQk0+xbF5uvp7nEdJTl7FClwfOcWIODlt9B7QdNQXWRJQF1vGujP+g6A6c4?=
 =?us-ascii?Q?DSCqSmn9+nrSWHLi6IaVlnkLWRiBPyOwwKoIsJRPenfRgUoAnkv9MKD1/BBn?=
 =?us-ascii?Q?HvkQN1nYf3fNQzWajHp8m7cPzQly9X3bX20DJBPQJG2YcwU2RTxngrQ8s8/u?=
 =?us-ascii?Q?nq6SIS6BYupe5sUcsQDMJFnXY+YJu9H7U29zPp7Pgd/7XYQgoReZVL9k8Gr9?=
 =?us-ascii?Q?Qe5+czPHd05LlxzFoazCiIrLkuxnknedJ3cK4zlMzTWBGDq8LQkPz8+Ktf5d?=
 =?us-ascii?Q?Qdaz+ZjZ8LA29vz6Lx+FbgL+ZF/OUrvt1qT+16QPo6hmRCE64ZEXDcItjEpg?=
 =?us-ascii?Q?/kCtqPJSwiLR1y9B5K40GedpaQrh3JLq8hPlCs/o0aXCB37/fHyuPYFcOgJu?=
 =?us-ascii?Q?WtWjKp8hTv6wdJnjDUw2fvd2cWPEthu9xhN0QuXtxHCeNTrdNDAHEMyO978j?=
 =?us-ascii?Q?hqc+NisF7DEb5fVD03q7YnouZhU6lB1U3r+//9UwIiCaa+JUvZcxd+hXMxLm?=
 =?us-ascii?Q?T2qyQh1f/sofuC6j9ArDpFB2FJ8lCVOcDE8SRh2SJGjURSnfiVqk4JXt0fwI?=
 =?us-ascii?Q?WbjpBHvm3e3veZeAkxAopiLz88APetONHdLXb5VNYNBmJn/nq6dCFAYMIojH?=
 =?us-ascii?Q?nmz/3YYQ9iTeWEEcd9hltK0eoIo/3hPe2ZSctYAmV8J1Fi2r3tyoDgmPYkHq?=
 =?us-ascii?Q?CAwGovttwGfKpg6UEGT5OiJHh6Jm0LnLQ/FZjKKl10pSuPsWgj8n+OG4byw2?=
 =?us-ascii?Q?Y6nHZT/hdje/JQRbBNXx9jWPwt+2iZe3MAQqxmT9PDknrMEYAsVOeAsX24FG?=
 =?us-ascii?Q?2CW32+SPx5A+jjft6i7XZyRQquIs0JJMqWfCDPmHJ3eTiVWSIIsz8MuxJLIj?=
 =?us-ascii?Q?HmpgWkO4zk3BENMnEfpSENCH9D3CfPX7cfYhL3Uun/0rw3CFX6L7Qun2N++0?=
 =?us-ascii?Q?5uI4k1xv1EtpV5x8fXj23xYigPvMhRtWdjkNrFZHsilUSPgN/d7BAO2Fmdar?=
 =?us-ascii?Q?piU+MF/BPJX5+t0Br8YaMUbUP9EHY93RAphh7fEo60TSH+rGepAolYEpgNJP?=
 =?us-ascii?Q?4dF+gbULk8Lo93T+2ahNnAi3vSYnN7mHT7s+R7CwJeLGVPjmDZ6hSKnq5pu8?=
 =?us-ascii?Q?OjEu+QDRRNQjIU2nGkCJE0aIqCP5zOdbQ05U0A+KvDtNz3k7e02RS3qVI/16?=
 =?us-ascii?Q?JIaL7+op1UKJMjl0/WL/lwjMrkduI7GlnJ3lFQHmxEbOziG/UdwG1KVGEGle?=
 =?us-ascii?Q?lvgmM9kidvlcw0XZ3ZoxraQVTNT1ixvnbnrw6/UBOXCOLzqhdZavJlEJahnY?=
 =?us-ascii?Q?9CaVmCiAkc7P8mruuGd46Ecdvfm9byo2iLFB7JyvDG39/O/LvY8RGmH2hAUO?=
 =?us-ascii?Q?hbRk9Zh0Uw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	eyRtf6AQ9tKXaHb1nQzFoU2hR8Mb1MX+SntsJXhytyk8szev5AnGVrFbEohwsU16ZXN8yL947HJCYaTeCVJOCTCFF+C/UOszdqGAiDIn/rzAf7XrLsHbKsYw/yYfEmtW41hxdBZeA2dYzDY5D7rZPP1/ce+zmjqnNqfLefjtTYju6wYetzYh6M+qWAAYqV6cFaga7SzPn0NtcAMKA9G1futo717822xFjB3fVlJrfyVExWcipeaZDnU4izXWkTqPbTnVbLREBPAPmOu4/+RUZh1ePPCzkYU+1BIrW0Fzh5NAPCvFPtx7i6HSguPyPia3yFHq4Cx4z2vp1pf3y4hK5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nDWTv2XPeyVcW1Fmp/gMYZGJPa0VMu1LHtMhvufiIQXLboC4aOVuDiYSGrF5cwVtpUvTxHPuqsN1jbaCTqShZtoCsWbUG1/53W3CU8U0DuGxAiO4utirFtSNbtLg9/q+fO8AeZ16YJeXrkgrhNKOOWI3kyoijueMW1sKH3N6T8t+O9EWVLxdbG6EZRTx/9DPk4O37xQWui3yUTSmu71litgn4s2MHsLyTlt6l6H0k/5l9SOTFFUzpD8gV+e0L6+Ea7VOfft+/8vO4Lkj5gjlbPFDEGArNOlPzu7QDfuO1EmS/90yDpcwUWgvyBAFp0j+XnKswRR9HbEzBF0CsBlf1jE7q/wIjfPWBOvSQEBmyMClLCdq6YXpeHu5oHo5m3bxFjobx8ybNB4GP4kxOpEaABiVN1Ew0OPlavUfh/n44LzMbkL13G3bIQBPX4Pd4yLaS0j72yeVRhyIxC4CQjhqcXSHXSQL2sa8dNwMCKie4TbFU8Fxa9iNM0kjB4gp5784vCCVO5U0eEjJpkdn5W1iN/FSY8XDtGAAE5UnoInkZ6RfIPd3tcPB9jrKoXeohfTKp6M4vn0CZTt5V+TOMEJx+Zl1FiwDtDVZK/+zDzk/QS6g5Uxm//SDSadXTrHNVxqQ
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9beddba-f834-408b-7f81-08dedc6cd332
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:15:09.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ3a3qeQBVzwgs2/mvYGdw6FlLmlhm9fYz6cHrVaXeX1nYuzqoIoz+GWUhZFbmwxGGA42EvLiY6QibKmX8dJeNHtN6BsutlCy5rppM4K3U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR17MB4900
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfX0wqO6LI6jQCS
 WKEpUPWnUeuEHhhfdKM9IUCCytbEO33Bj1le5Pes5hyT+2jcoacQ80oqS5TYEw/1MV9TnbnZFmS
 hiDtGGqOR7YJs+3pwsiOIHJYmmgTtvMvo3TwDXXp7l2bv3ZGkPeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfX8dkS7pte789e
 +iT/BStz3QHs1bt2iR+6/a+5QPvwlIK3iy/eLDTLJ8bR5t8ffHviU3P/HxFB2JBlfRgugBNuXH/
 4wN9/YSFJti499AHUVLQu9E3zGbrMyxIuz6K8TcY8j+rfo7gdr2hAgdG2ArHZqtLnGxGIUFMHRo
 wcAb5+oGGvGpCJm+7tSepRMgTvBMIjo3fjo+iHIaHxzdg+pfJL76mZ3kTYPITvKvn6rf1UVgsQc
 /l+xIrOLtnY92flKF6jB9TTeWuE80zbDShU8fOgaoSQ5D5/Th2HC+gTSJccyH+ZsRBEVb2LvrIl
 MWMz2TK4G48QqsxpnZqsYkf8QWPBC3twHFkLuyoJz0d01AXiGG0o35H5OnypsX+BVHsaP4M+zRg
 1d0zmR+jnIfCZMZ+cmytMGZiSnWfGX/y39sIJMvhXZwn70M1WJSF2NRIuq3c8dFhatGeNbprsZC
 FjmOvJMzF/Tr1uR3nrQ==
X-Proofpoint-GUID: V6A6736bTTMYXPur9cs8v0uNGWTogBfA
X-Proofpoint-ORIG-GUID: V6A6736bTTMYXPur9cs8v0uNGWTogBfA
X-Authority-Analysis: v=2.4 cv=HuFG3UTS c=1 sm=1 tr=0 ts=6a4d6c62 cx=c_pps
 a=pvbKGUK/Si0pumwNLfsG/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=mOSSRekXLlsqcmK058qe:22
 a=F6MVbVVLAAAA:8 a=EdBruz6J0uSETTZaZQgA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11840
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 21:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240410

git_rev_info() calls repo.head.commit without guarding against
ValueError, which gitpython raises when HEAD points to an unborn
branch (e.g. a freshly-initialised layer directory with no commits).
Wrap the commit-info block in try/except so metadata collection
continues rather than crashing with a non-zero exit code.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/lib/oeqa/utils/metadata.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index b320df67e0..c8df17392d 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -85,12 +85,15 @@ def git_rev_info(path):
         repo = Repo(path, search_parent_directories=True)
     except (InvalidGitRepositoryError, NoSuchPathError):
         return info
-    info['commit'] = repo.head.commit.hexsha
-    info['commit_count'] = repo.head.commit.count()
-    info['commit_time'] = repo.head.commit.committed_date
+    try:
+        info['commit'] = repo.head.commit.hexsha
+        info['commit_count'] = repo.head.commit.count()
+        info['commit_time'] = repo.head.commit.committed_date
+    except (ValueError, TypeError):
+        pass
     try:
         info['branch'] = repo.active_branch.name
-    except TypeError:
+    except (TypeError, ValueError):
         info['branch'] = '(nobranch)'
     return info
 

