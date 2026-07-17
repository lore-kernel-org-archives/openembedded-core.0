Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1839CC44515
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 21:33:11 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106.1784323987830227813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 14:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=ppfeb2020 header.b=syrUpSDC;
 dkim=fail reason="dkim: body hash did not verify" header.i=@keysight.com header.s=selector1 header.b=Bbx1I3Go;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HLWl1O2855073
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	2Og1TEDjR4VHJ471/N5JKmR6ov7fRAt/v7p7t5EqyIE=; b=syrUpSDC/PBSsLDs
	JCJEs/fqjBTGhvJubwsMEX+1lxT9E7txa4TP8MD12vhFvUCvAAZFXPjhGr3OTsN3
	NUBAmocmpvn6ch872ozDWbWgZG2yMpeZp5jFgKL7T4nzRXtH569YdF3l10s1zjHG
	UNCvkI7ho6/NnWDnILWmvJjY+vJzmBZJFK+NaZJcuLFNi3+KuxdoRMw3+B87aStr
	NbKM5sYkv+FTmHwpKB4IMYWeiahlQivcWfzb/iIpUldBzyjdKt82Ki6U7U+A4NXF
	yyajIQwmpt9nGzWbrDoOzafc+niNcPmPOTlABjcXqSjl0YXchUfgRJWQ3t1N490i
	Sxt31g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ffgmwac26-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK2BtPUBbu+v1vdgbjrAhFsCX9+YpFOjtUXhZ2Zr0wv04UCq9Giioihw+rx+kpsDiMu9J7zFUBFzRsP6ypAQ/BRTre1HKkcXQfMG3QBafot4h5ig4NP/Lyvph9A5D6k4j5bAox/v920H3FnIlBTbmS/qg8CJMUPJ+0+/gc0raU7Ymc8HvGHOcglvULjHiAN9lJxiWHnA+qefOORilcTNvAZ28XAvOWTkkZX1yUulu3CmX/qmEvGlybwp3sCZj7cGig7oTfBi0dnJSCv9qJ6F+DMxIb/Bk3qxtN8nonwqLQfoflJg/RQEQrUDzRFdo4nYeWWecPs3lvbNltZYWyYgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Og1TEDjR4VHJ471/N5JKmR6ov7fRAt/v7p7t5EqyIE=;
 b=Yyjyd+S7lxKuKuZd5GQ4RIOFPp1c+jvLM1wkQSmAsgNEVZ9Wg4GDGpZRkDpMY5ai3Cy5AeTJZCdBm4rtpfd4UJKifDGHg9szO4xFKYFqONEcdNO+1ZpT/PtzOVc4CDOV59Nvi93mZnCU/WXFQhBWun+Nnx7o78evnJNvWaMVugRtVUuXYsqte60ekUTljrrVtgKaqOrbXcgYAyEtabJEn9BZKhE34k5yKgfr//Rud0oqGtMBblB7IOgaZHi118Pk7okw4hLlFrrZhewaXOX3gN+KE/2b0nPDz2W5P6w4i7MJ0A7fiArL4Dbp+u2WfyaZkDButpxEwv8RMFlc3DbxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Og1TEDjR4VHJ471/N5JKmR6ov7fRAt/v7p7t5EqyIE=;
 b=Bbx1I3GoHbIYT/N2d9cy1p0GTsgIOA9czFzJkYjqhrb0kMs2866h11Q+2myWRJpLwsD292Kf+5WgW0fdkhPlmg9wzgNEzxCUP1uihtu5Zg3bem/emoP8/KPBcdrLJE3layTuBsjTPXuOaDjHk0LRUfhzcZq0iVHJANCMZG6KWh8=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by PH7PR17MB6034.namprd17.prod.outlook.com (2603:10b6:510:1fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 21:33:03 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 21:33:03 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v3 2/3] oeqa/selftest: Add go-vendor.bbclass selftest suite
Date: Fri, 17 Jul 2026 15:32:50 -0600
Message-ID: <20260717213253.3454786-3-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717213253.3454786-1-john.ripple@keysight.com>
References: <20260717213253.3454786-1-john.ripple@keysight.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: CY3P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::15) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|PH7PR17MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: bf99fa6a-4a31-49cb-4ff5-08dee44afb6a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|13003099007|11063799006|56012099006|10067099003|18002099003|55112099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	OLB1/ejlAnKOrEMBeiqy0oG53Wig/CewkPRClXBvmdONohyKWWQqVNpB9cxxQaLCgV8gG5kXj7R63jGRk9f65kF+HKc6Isxcw4h3dHbmr87ltHel/EcPbx5DYXJk5OPkMN9dnxecuihWl7zdTp70H7EFk4wYP1Xbxh1rN0P9QbHoFL3/W9osatoPqJcCl8q2CxNnFa5TRV6YosnbH6kUh1mFyRZmW5hT1fzmoi5cxmfgTeVvYU6bRUAKoreQNFVowxRjPK38HkCXtE4qiLfhACSxKIOIaG+ijxhRprszcqkhJPyt4O5QwXtCo/VROh1k/bXJLj96DmBh2VC0Eg41xuCigSCDEDJR/EgV3C1m6Ld88cf8j26UqOH43K5VLDyrvOpMUcqCzjLaQbi8ePJha9pTIJbtf1nKJjJKldtiUYfGahReEfOw8py8O0rxRP2BTTITjf2rihGCsVoDewbDi8KuznFIPTdPFZhxD3Z0LObKfuH5m/i+Y/4Rp1na3nNkVpFqrbLMCm/yG0szK/yk4xRlmR78bgxpR6s6PwXq/RxY1jBZ9Zd2Fem+TlpICBkF7lJwTKn5kNn0ZcqbOT2OMemUAibByV8FrjC3SxIOgwM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(13003099007)(11063799006)(56012099006)(10067099003)(18002099003)(55112099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alA3SHVKQkluajg1ZTVqcFRhQ1d3NUFjTHIyZjFIeUU5TTNiMEY5K2tFSDJS?=
 =?utf-8?B?ZXZDV3cvaW9tMUVkcHF2Q1g1QzZlT1VXeklRaTdFcDIya3cwdlIxWnB0RkJ5?=
 =?utf-8?B?eHRuWitYZEhLRGpsNVc1akVaNTBuZDlub245Qm9Jckd4UFpHOHNkaXVFR0RC?=
 =?utf-8?B?NTV0YTQvNExIZ2licWI2cWxLMmtUK3RQcS9BbDFLc251ZlZzMzFNNzlSb0pH?=
 =?utf-8?B?WXgvNjZZSDdvQW91R0JFVlJyMFhLaE9iOXV5M3NXTTBDemhmUHVUUy9nK2ZM?=
 =?utf-8?B?dmR5L2dNWklndTVWWjRlTXY5N004ai8xZFFUai8yS2VHRmtXZ0RxZURqUVVs?=
 =?utf-8?B?ak01SlJHazMrd3NpclpoemI3bENQQTZpRmt1bzRicndCUi91S0pUdFhxbklK?=
 =?utf-8?B?OWxWUGxjOEhiWWlpQkNKcWVPekFpaG82a1hLRFB3MkorM2lxVXI4L0hOTFVm?=
 =?utf-8?B?UFpTK0xGdkVtRWI1NG9mUmxyTHF3cXdFS0dwQVpGR09ERmRQUXFxaGt2Rk9N?=
 =?utf-8?B?SUo0RHNNZlB1MXJ5MlNqdTY2cThVVGlaWGVQZ1FQMTQwR1N0ay8rSDFZSzUy?=
 =?utf-8?B?bEZxZHh1elhGNDJYUWRnYVpYeTkxYXRkcGwwMGZ0a3VrYUJvREc5c0Q2akhm?=
 =?utf-8?B?bUgwVTRhalpybnV0TVdsczlzVHN0Umc0QW5zelpPS2NjZEZ2VGp0REVDSmJD?=
 =?utf-8?B?c294Rzc1TjJUanNYdHlzQnF5bThlN1VsRThKYUxiY2J3ZUttV2NSTzRtQ3dI?=
 =?utf-8?B?VCtENFVhU2dkZWVOdFYzQ0NvL0E0UzlPeGFheUpCVUQzTDZPWFlCOTdjbzZU?=
 =?utf-8?B?ZTEweW40QW1uS1BTSW1mYUo2cFV2QUhwZWZaaWJpN29ERjFkZFVHQVU0NlI1?=
 =?utf-8?B?Sno3MDhDQy9sUi9rUGZsYk9CL05QbmpSdnp1WVFBalJ4cXZBK3UxRWdteVp0?=
 =?utf-8?B?R3hsMTJGUzkxNVQvdlE1eVNBK1l1N1g1TnJ6MTh5M0JoR3gvUDRhOHZ5ZkF0?=
 =?utf-8?B?SEFMa2p4L09hb0QwbWVhaW50ejJ1WlVjcFNhb0UyZjFyeUtzZGNVc2VST09Z?=
 =?utf-8?B?MloyVHcybE1Hdnc2ZElIYlRWelNSNVVzTTVEMGYveU8rejRVNVZMYzh4Q2V1?=
 =?utf-8?B?blRhZ0pSVGRmeURhbWJFTkxvNkt0Qi94VldJekZsTFJ1NmQ5bkc0d1RkM3du?=
 =?utf-8?B?NDFyMHVIM2RkdHhLQlcvT0NWdk1FN0k1WVFxN0Z4TlFwVWU0UE1CS2tiaXU5?=
 =?utf-8?B?c25mdWR3M3M0azVqbUZrdTFneXBGcUwxVVJKa2xFRzZyOU04VDBFTVNmWjdG?=
 =?utf-8?B?dUh0cVdnTDdkOUNWTE5haThwbG45eWxaL0Z0Y3VXZGJVQm5iVU9NMm9nZ3FX?=
 =?utf-8?B?b1BONTcvL3VOWXJlVjRhSXduWHAzZzRpbnIvZWlxWUJwSFFNUjRzVzlubVAx?=
 =?utf-8?B?bnlqanE5M00xVU1sWENuWW5pNmRWdmlyYjdQV3U3WElHSHBRNHc3VENsQzZt?=
 =?utf-8?B?dHFoT2JYdytaTk5KdjdkZzhhb2pWR2FpaThrRUFVR1Y4OUdwdjdUbHc3NHky?=
 =?utf-8?B?NThZb3YybS9ZT3AydExSM2tHcDlORUxpbDVvUlh5NnNyUnhNWDZiMkZOaGJz?=
 =?utf-8?B?YUtnQ1J2MFhtWmRhMGdYTkdZVzBLb00wejV3UEdIZGV1S0RsS1Rlc0FQQmZm?=
 =?utf-8?B?NzIzeGVnZjJEK3dzOEZSUHBZOWxYbEI3WnBUTWh2Z3dSai9nQTkwZlFYdmVi?=
 =?utf-8?B?ZDYrZmh4YVdRQkhkSTlRWFJSNTZGdVlvM2VEdDNCNnJnUFdNM3hHM0Era004?=
 =?utf-8?B?SUVKUTRoSnBhYUxxdllJU1N3RDd0djZHajl0bTJPU0RGaUdLcU9VRXlreXU4?=
 =?utf-8?B?SHJBYTF5RzJ1N2RMZ05RV0plS1NPeHNiSFUweXg3MWlqb2hSNCtGVjNFN3dz?=
 =?utf-8?B?dGdydzJhNHc1eDdpS2xlRit1YS9UZHlDRWE0Tm93QUtRN0RVb1ZSZzRsSW9j?=
 =?utf-8?B?bzNUeEZIQUVPdytJcFppODZRRkJmWmMrbm1HUG5QbTk3UjZuNVBaTWphRVhi?=
 =?utf-8?B?bzFwckV1WXZVSUNGWmZGWVUveUpkMVB2bXp2UnFWZFJqYUt5K01SY1FCdUYv?=
 =?utf-8?B?bTJTdkhrL3QvU0FqRnI3N25VTUJvZXllOE0vbVcyVTZxVUFEbVMxSGx3TmZi?=
 =?utf-8?B?NjdxaDFsS3Q2OEZDSE5nL3BUS1hCNmF1MkozaWhZMHB4SkZ4YWxJbkZmRFlC?=
 =?utf-8?B?M2hyKzRXVStsMkZmWjN4MmRaZUh2OUFmeWZ1Yzl3OWJkd3ZQamhUUFQveTRt?=
 =?utf-8?B?M09xcXU0ZnhyYnA0ZkVOWE01Y3diSHVkb0w1bHdsd0I0NkE3ZGc5dz09?=
X-Exchange-RoutingPolicyChecked: 
	noCK83bYeeRQ+s2Ypon0tvKjESv9KSybbo+1yniWzOEMZIq4RQFFX/31PuUPGxLyxzkdkvplzRXU/zgDpaaESATTm12r0z3zY7KCGlrVDow3DKSMY7fW70aS0pM3RrQ6Syz8mm3AyCmz6fhfUDAeJnXhGVGDWNlPQ/WkbpIeG90vP+SphIDfoYuUa7OBWaWNOmZRPc0pO3HtmSXVe9g2A7Q789sMMVqf0bWWfFfZb9tZUKlNBDzdwjcd9TJskOZIHydilxge6cD2SOsBME21BWuplKj2iLOuGpr1b7kV43zdKV01uWIjF9Y4P0AtgHRPq46pI1V2YJcr7URYC668Yg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	G/9hn9I5lzjNYxeqeFramHRLf9yd5MinXyzxVgQfb5sA9xdE7FoG2DGn5qJPVGPy81OE1v7J6cNYi4lC4/KT8JKdEd/5KU36FfyhJE1CNTea3yZDu/e24eC63XaAwRJxKNDqdjioQ5w6pG0L4VjkrPbm0O1IkcRWLS0wM9xBGUYCWG51vlBpmX1uTuqney406p5ix7r207DrUvhhevZaGaU3EA53SutN7tv+Gqr0HmToC/H8rU1wUcn+pBWSW80Ifzm3zfenfq4X97WEK6+BJbbww2g0PUclTLsl6DRi3m7nkp7Ajk9Sxi5IggVC8L02ZTIini1gtLZmTM946g21VRApVaEZrXSSL8ty6GZyIiZl2gyZxpyGiUnZiuKp1LJBvbNnWlAgSXOsxIHmgaSkJazwa92MmVBnEVSye8Ncus95Kq5EPCLdjeUOCZ8R1LvyawwytRi89dEoU/4bf4D3tuE11nWZOlWSanzniVDqbFBJ8u5udgIFSNW82Ha3LNqSN+jPciULkpxfNoCRfhK8+TSqC/9bf07psg/Ez12N69PMR9KY+Rf8zySbKZE7juGHxq7thNQEN/it4PxpcDCn1aBxnDbBarN6m/bxkn1BgZTuepF9ZIhVp7VjjPwcuU4X
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf99fa6a-4a31-49cb-4ff5-08dee44afb6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 21:33:03.1407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /C77WuRy05PynyHlsBm9pOpNSYVZdIBXKVBO0E/KQ3o8xplkq/uFg/iwkPQP8nwppBSsnRe5v3BjHcHTwszlBfEiflOKn7egTRkWy/3/YJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR17MB6034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfX9p2rTJSx8yev
 6IMZwfcsUkA31F6wmCuuHHAITC2SSu8+X+9+fBlmn7DFVUgBBRXd5iMFBGpf20fpzvGv+qm3jjN
 +xHNP2EwDONXy64K5YENJrxVJtVT2TrLcc1by+vvd6VEUD6GqRYOUrDU0t55LYc1Z1uDFcezukz
 qg1G4A4UFZuj3/L9JTvdDOq3elrEN2GrJcba+kmO/7iD41/0CIh1B9dSYM/uXygnkdbd33kBs/u
 tUcF4libgvds7AMLxnAvMbC78HoGwznfjY9H2LXlrgViyLycSKn3KlUH7oxSMv8IoNHD0ylILuE
 5GRbyxm35BSZ+I47Q4q96UDmWfnIcHiFN9rYqPGhg62f9UXc2ZVh6fJBvSfu6qh/PNg8PZ0JEc7
 VPbgOJnlHC0UhjBfgsar1+Bj1dsowJegGhBcmD6uAHSx2TLOSD4VhPWJ2ZLKQli0hiDzm/qaw6O
 1f0KjEAYzP3zRESvElQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIyMiBTYWx0ZWRfX53Pa/faRCmfd
 6GPuRLPvhx9HFE3hD0GsI4o2mHQbEPA1miyHJLeEFcKl7zytDGaFpknKXwI5il4lsd3aqtApyLw
 NksectE92H51a8hF6zduhAZkXzulA6Ap48Wq5RScTKDsDJtr+okR
X-Proofpoint-ORIG-GUID: QgUD8PWXuLq0Gacb8aEzi0fzpBT27lwQ
X-Proofpoint-GUID: QgUD8PWXuLq0Gacb8aEzi0fzpBT27lwQ
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a5a9f93 cx=c_pps
 a=BRu7lVsKyHj15bVqb/Fc8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=at2XMroQgvxonBsO-bql:22
 a=F6MVbVVLAAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8 a=iGHA9ds3AAAA:8
 a=5cgIs88SztoUVwLlgL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6mxfPxaA-CAxv1z-Kq-J:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11849
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170222
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-003cac01.pphosted.com id 66HLWl1O2855073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 21:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241224

Add govendor.py with two test classes that cover the behaviors fixed and
defined in go-vendor.bbclass:

GoVendorSrcUriTests (offline, ~10 s): unit tests for go_src_uri() parsed
via bb.tinfoil; verifies the basic URI shape, path/pathmajor/subdir/repla=
ces
encoding, and that non-git VCS omits the git-specific nobranch/protocol f=
lags.

GoVendorTaskTests: runs do_go_vendor once against the real recipetool-go-=
test
project and checks that external deps land in vendor/, *_test.go files ar=
e
excluded, pathmajor=3D/v5 falls back to the repo root when no v5/ subdir =
exists,
modules.txt is reproduced in vendor/, a local replacement (./is) appears =
as
a symlink, and the S/src/GO_IMPORT/vendor -> S/src/import/vendor symlink =
is
created.

Exclude the govendor test recipes from world builds since they are only m=
eant
to be built directly by the govendor test suite.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 .../recipes-test/govendor/files/modules.txt   |   7 +
 .../govendor/go-vendor-src-uri_1.0.bb         |  17 ++
 .../govendor/govendor-real-test_1.0.bb        |  29 +++
 meta/lib/oeqa/selftest/cases/govendor.py      | 179 ++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 meta-selftest/recipes-test/govendor/files/modules.txt
 create mode 100644 meta-selftest/recipes-test/govendor/go-vendor-src-uri=
_1.0.bb
 create mode 100644 meta-selftest/recipes-test/govendor/govendor-real-tes=
t_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py

diff --git a/meta-selftest/recipes-test/govendor/files/modules.txt b/meta=
-selftest/recipes-test/govendor/files/modules.txt
new file mode 100644
index 0000000000..f64f5245b5
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/files/modules.txt
@@ -0,0 +1,7 @@
+# github.com/godbus/dbus/v5 v5.1.0
+## explicit; go 1.12
+github.com/godbus/dbus/v5
+# github.com/matryer/is v1.4.1 =3D> ./is
+## explicit; go 1.14
+github.com/matryer/is
+# github.com/matryer/is =3D> ./is
\ No newline at end of file
diff --git a/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb=
 b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
new file mode 100644
index 0000000000..b24b992bb1
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Selftest fixture: go_src_uri parameter variants"
+LICENSE =3D "CLOSED"
+
+# Parsed via tinfoil for its GO_SRC_URI_* variables only; never actually=
 built
+# (it has no real SRC_URI, so do_go_vendor would fail).
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit go-vendor
+
+GO_IMPORT =3D "example.com/testpkg"
+
+GO_SRC_URI_BASIC     =3D "${@go_src_uri('github.com/foo/bar', 'v1.0.0')}=
"
+GO_SRC_URI_PATH      =3D "${@go_src_uri('github.com/foo/bar', 'v2.1.0', =
path=3D'github.com/foo/bar/v2')}"
+GO_SRC_URI_PATHMAJOR =3D "${@go_src_uri('github.com/foo/bar', 'v2.0.0', =
pathmajor=3D'/v2')}"
+GO_SRC_URI_SUBDIR    =3D "${@go_src_uri('github.com/foo/bar', 'v1.0.0', =
subdir=3D'sub/pkg')}"
+GO_SRC_URI_REPLACES  =3D "${@go_src_uri('github.com/baz/qux', 'v1.0.0', =
replaces=3D'../local/baz')}"
+GO_SRC_URI_SVN       =3D "${@go_src_uri('example.com/svnmod', 'r42', vcs=
=3D'svn')}"
diff --git a/meta-selftest/recipes-test/govendor/govendor-real-test_1.0.b=
b b/meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
new file mode 100644
index 0000000000..8086922e10
--- /dev/null
+++ b/meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "go-vendor integration test: recipetool-go-test"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D4e3933dd47af=
bf115e484d11385fb3bd"
+
+# Only meant to be built directly by GoVendorTaskTests (bitbake('%s -c g=
o_vendor')),
+# not as part of a general world build.
+EXCLUDE_FROM_WORLD =3D "1"
+
+# Native variant lets GoVendorTaskTests.test_do_compile_succeeds exercis=
e the
+# real go toolchain without requiring a full target Go cross-toolchain.
+BBCLASSEXTEND =3D "native"
+
+inherit go-vendor
+
+GO_IMPORT =3D "git.yoctoproject.org/recipetool-go-test"
+
+# modules.txt for recipetool-go-test at SRCREV:
+#   - github.com/godbus/dbus/v5 v5.1.0  (external, fetched via go_src_ur=
i)
+#   - github.com/matryer/is v1.4.1       (local replacement =3D> ./is)
+# Use go mod vendor to generate the modules.txt
+SRC_URI =3D "\
+    git://${GO_IMPORT};name=3Drecipetool-go-test;branch=3Dmain;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
+    ${@go_src_uri('github.com/godbus/dbus', 'v5.1.0', path=3D'github.com=
/godbus/dbus/v5', pathmajor=3D'/v5')} \
+    file://modules.txt \
+    "
+SRCREV_FORMAT =3D "recipetool-go-test"
+# git.yoctoproject.org/recipetool-go-test main branch HEAD
+SRCREV_recipetool-go-test =3D "c3e213c01b6c1406b430df03ef0d1ae77de5d2f7"
+SRCREV_github.com.godbus.dbus.v5 =3D "e523abc905595cf17fb0001a7d77eaaddf=
aa216d"
diff --git a/meta/lib/oeqa/selftest/cases/govendor.py b/meta/lib/oeqa/sel=
ftest/cases/govendor.py
new file mode 100644
index 0000000000..8be2712060
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/govendor.py
@@ -0,0 +1,179 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# Comprehensive tests for go-vendor.bbclass:
+#   GoVendorSrcUriTests  -- unit tests for the go_src_uri() helper (offl=
ine, ~10 s)
+#   GoVendorTaskTests    -- integration tests using the real recipetool-=
go-test project
+#                           (network fetch of git.yoctoproject.org + git=
hub.com/godbus/dbus)
+
+import os
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+# ----------------------------------------------------------------------=
-----
+# Class 1: go_src_uri() helper function
+# ----------------------------------------------------------------------=
-----
+
+class GoVendorSrcUriTests(OESelftestTestCase):
+    """Tests for the go_src_uri() Python helper in go-vendor.bbclass.
+
+    Parses the go-vendor-src-uri fixture recipe (meta-selftest/recipes-t=
est/
+    govendor/go-vendor-src-uri_1.0.bb) via bb.tinfoil (config_only=3DTru=
e) once
+    per class so the function runs inside the real BitBake class-loading
+    machinery.  All tests are offline and complete in ~10 s total.
+    """
+
+    @classmethod
+    def setUpClass(cls):
+        import bb.tinfoil
+        super().setUpClass()
+
+        recipe_path =3D os.path.join(cls.testlayer_path, 'recipes-test',
+                                    'govendor', 'go-vendor-src-uri_1.0.b=
b')
+
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=3DTrue, quiet=3D2)
+            rd =3D tinfoil.parse_recipe_file(recipe_path)
+            cls.bp =3D rd.getVar('BP')
+            cls.uris =3D {k: rd.getVar('GO_SRC_URI_' + k)
+                        for k in ('BASIC', 'PATH', 'PATHMAJOR', 'SUBDIR'=
,
+                                  'REPLACES', 'SVN')}
+
+    # --- individual test methods --------------------------------------=
-----
+
+    def test_basic(self):
+        """destsuffix uses expanded BP"""
+        uri =3D self.uris['BASIC']
+        expected_ds =3D 'destsuffix=3D%s/src/import/vendor.fetch/github.=
com/foo/bar@v1.0.0' % self.bp
+        self.assertIn(expected_ds, uri)
+        self.assertIn('go_module_path=3Dgithub.com/foo/bar', uri)
+        self.assertIn('nobranch=3D1', uri)
+        self.assertIn('protocol=3Dhttps', uri)
+        self.assertIn('is_go_dependency=3D1', uri)
+
+    def test_path_override(self):
+        """Explicit path=3D sets go_module_path independently of the rep=
o URL."""
+        uri =3D self.uris['PATH']
+        self.assertIn('go_module_path=3Dgithub.com/foo/bar/v2', uri)
+        expected_ds =3D 'destsuffix=3D%s/src/import/vendor.fetch/github.=
com/foo/bar@v2.1.0' % self.bp
+        self.assertIn(expected_ds, uri)
+
+    def test_pathmajor(self):
+        """pathmajor is encoded as go_pathmajor in the URI."""
+        self.assertIn('go_pathmajor=3D/v2', self.uris['PATHMAJOR'])
+
+    def test_subdir(self):
+        """subdir is encoded as go_subdir in the URI."""
+        self.assertIn('go_subdir=3Dsub/pkg', self.uris['SUBDIR'])
+
+    def test_replaces(self):
+        """replaces is encoded as go_module_replacement in the URI."""
+        self.assertIn('go_module_replacement=3D../local/baz', self.uris[=
'REPLACES'])
+
+    def test_non_git_vcs(self):
+        """Non-git VCS omits the git-specific nobranch and protocol=3Dht=
tps flags."""
+        uri =3D self.uris['SVN']
+        self.assertIn('svn://example.com/svnmod', uri)
+        self.assertNotIn('nobranch', uri)
+        self.assertNotIn('protocol=3Dhttps', uri)
+        self.assertIn('is_go_dependency=3D1', uri)
+
+
+# ----------------------------------------------------------------------=
-----
+# Class 2: do_go_vendor task integration =E2=80=94 real project
+# ----------------------------------------------------------------------=
-----
+
+class GoVendorTaskTests(OESelftestTestCase):
+    """Integration tests for do_go_vendor using the real recipetool-go-t=
est project.
+
+    The govendor-real-test recipe (meta-selftest/recipes-test/govendor/
+    govendor-real-test_1.0.bb) fetches git.yoctoproject.org/recipetool-g=
o-test
+    (commit c3e213c) as its main source and github.com/godbus/dbus/v5 v5=
.1.0
+    as an external vendor dependency.  The project also has a local modu=
le
+    replacement (github.com/matryer/is =3D> ./is) that lives inside the =
main
+    source tree.
+
+    do_go_vendor runs ONCE in setUpClass; individual test methods inspec=
t the
+    resulting vendor directory without re-running bitbake.
+
+    Verified behaviors:
+      - External dependency files are copied to vendor/
+      - *_test.go files are excluded from the vendor copy
+      - pathmajor fallback: when the /v5 subdir is absent, repo root is =
used
+      - modules.txt is reproduced inside vendor/
+      - Local module replacement creates a relative symlink in vendor/
+      - S/src/GO_IMPORT/vendor symlink is created pointing at S/src/impo=
rt/vendor
+    """
+
+    GO_IMPORT =3D 'git.yoctoproject.org/recipetool-go-test'
+    RECIPE_NAME =3D 'govendor-real-test'
+
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+
+        bitbake('%s -c go_vendor' % cls.RECIPE_NAME)
+        cls.s_dir =3D get_bb_var('S', cls.RECIPE_NAME)
+        cls.vendor_dir =3D os.path.join(cls.s_dir, 'src', 'import', 'ven=
dor')
+
+    # --- test methods (all inspect cls.vendor_dir, no bitbake) --------=
-------
+
+    def test_external_dep_copied_to_vendor(self):
+        """godbus/dbus/v5 source files are copied into vendor/."""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        self.assertTrue(os.path.isdir(dbus_dir),
+            'vendor/github.com/godbus/dbus/v5/ not created')
+        self.assertTrue(os.path.isfile(os.path.join(dbus_dir, 'conn.go')=
),
+            'conn.go not found in vendor/github.com/godbus/dbus/v5/')
+
+    def test_test_files_excluded_from_vendor(self):
+        """*_test.go files from godbus/dbus are not copied into vendor/.=
"""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        self.assertFalse(
+            os.path.isfile(os.path.join(dbus_dir, 'conn_test.go')),
+            'conn_test.go should have been excluded from vendor by *_tes=
t.go pattern')
+
+    def test_pathmajor_falls_back_to_root(self):
+        """godbus/dbus v5.1.0 has no v5/ subdir; pathmajor=3D/v5 falls b=
ack to root."""
+        dbus_dir =3D os.path.join(self.vendor_dir, 'github.com', 'godbus=
', 'dbus', 'v5')
+        # auth.go is at the repo root of godbus/dbus, not inside a v5/ s=
ubdir.
+        self.assertTrue(os.path.isfile(os.path.join(dbus_dir, 'auth.go')=
),
+            'auth.go not found; pathmajor=3D/v5 fallback to repo root di=
d not work')
+
+    def test_modules_txt_in_vendor(self):
+        """modules.txt is reproduced inside vendor/ and lists the extern=
al dep."""
+        modules_txt =3D os.path.join(self.vendor_dir, 'modules.txt')
+        self.assertTrue(os.path.isfile(modules_txt))
+        with open(modules_txt) as fh:
+            content =3D fh.read()
+        self.assertIn('github.com/godbus/dbus/v5 v5.1.0', content)
+
+    def test_local_replacement_symlink(self):
+        """go.mod local replacement (./is) creates a symlink in vendor/ =
to S/src/GO_IMPORT/is."""
+        symlink =3D os.path.join(self.vendor_dir, 'github.com', 'matryer=
', 'is')
+        self.assertTrue(os.path.islink(symlink),
+            'vendor/github.com/matryer/is should be a symlink for the ./=
is local replacement')
+        expected_target =3D os.path.join(self.s_dir, 'src', self.GO_IMPO=
RT, 'is')
+        self.assertEqual(os.path.realpath(symlink), os.path.realpath(exp=
ected_target),
+            'Local replacement symlink does not point to S/src/GO_IMPORT=
/is')
+
+    def test_go_import_vendor_symlink(self):
+        """do_go_vendor creates S/src/GO_IMPORT/vendor -> S/src/import/v=
endor."""
+        link =3D os.path.join(self.s_dir, 'src', self.GO_IMPORT, 'vendor=
')
+        self.assertTrue(os.path.islink(link),
+            'S/src/GO_IMPORT/vendor symlink not created')
+        self.assertEqual(os.path.realpath(link), os.path.realpath(self.v=
endor_dir),
+            'S/src/GO_IMPORT/vendor does not point to S/src/import/vendo=
r')
+
+    def test_do_compile_succeeds(self):
+        """The vendored tree is valid Go: the toolchain can actually bui=
ld it.
+
+        Runs against the -native variant so this only depends on go-nati=
ve,
+        not a full target Go cross-toolchain. The SRC_URI fetch is alrea=
dy
+        cached in DL_DIR from setUpClass, so this mainly re-runs
+        unpack/go_vendor/compile for the native variant.
+        """
+        bitbake('%s-native -c compile' % self.RECIPE_NAME)

