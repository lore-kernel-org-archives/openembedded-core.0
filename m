Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E71DCD4F38
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:08:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14638.1762999732421880221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pj2jYwml;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412475fcb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD1Z46i3404246
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:08:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zElwtf7C9zW6nghc1yclMHZAV3lm59+pfHQ/VXkpaA4=; b=pj2jYwml0yOF
	g5sGCggtL3d2M/s9qxK56DZJfLA+QrdzY+VOjfQfujOGYg7Nqp1Lq12XDDuo/U3b
	/nlMhPLyg8Up6U+ybalbEamSIRTnJnlj1WTfSY3eXYsGCiHreEYUNa9mrLZXS9RL
	WjvaQWE1r5R/ob+JTqvDMCwzELg+vvObsWsdL4Q7OS1uKCNxzhVglOA+mUVre06y
	a4r3k8aw351Y3KBJUPwDnLX5k1mOk7n+q7AyLJmbdhCA4x6qzFWwrKDiVfPhGGFe
	WXqPVoJiCxDR2CoXOatqCae2nFWdZqWkqZMhc9k1qX8bs7B2COl/4aYCmFId9GJy
	4amlXq3DNg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jp6c7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5EEc5h2p8iePZYPL6EDVqEtoszkU+fEqs8ANPQvvbF5bemaTT3t1ykG/bFtYamE0GLEdi/DpLeHma1XVNkZDy57wrZ72/3r8ondB5BoW9Huw5P9C9D6so7gNNLtcKIHKODk7j19di7BiKzjIE487W/RNQUQC27c/FKA2Hk/3MRflr+o/19pEG5vlOqTHefLfptvjTGPUBlICwyGfnwPnj6A/MlOSvkAO4yEHRHrq7a3Ey7RcmcJK89VxMvHzgpCkx5VajTcylMUBrQhvYwS+fmH6t/cWLfIIjmwWw6zgdFZqqaN8GOoysuPlEft2gwcqvyEdlHuTAVI/ppdY+vrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zElwtf7C9zW6nghc1yclMHZAV3lm59+pfHQ/VXkpaA4=;
 b=VCADaucEAhNBVcZYGJIxLR5CyCxOLgaH4DsRXxkiYtMvSTpxgc+Eo4FPxkpqyj9QxaOJjOs92F068pm5dBVgmk8RVl6t8rCtkiMPXo80mN2v/HmGoPVhxQpUxCt3j94cbtJ7CfG0sivQF1IqpHXGFUY665XgpSmlHLrXTxm9FBjilLl3koCuiiO3jf17ub1QIgRUcmhkL1WllPyZz6iOWRr+uTjzAK0hAoyCwWYMG9tpAK7qiiWsnhzUC6XNDug+wDEM869v53PBgYWnUCw0ABPSw0BENt6M8+wh5B4ZdHNZu4JtvGa/OoD/BvLX4bnT2VlCJsogBw7sn75OUO4PuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9)
 by DM4PR11MB6383.namprd11.prod.outlook.com (2603:10b6:8:bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 02:08:48 +0000
Received: from CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::ee49:f99d:deec:b1d1]) by CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::ee49:f99d:deec:b1d1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:08:48 +0000
Message-ID: <13812ae8-8dbf-4455-af7d-b5f42c4d59fc@windriver.com>
Date: Thu, 13 Nov 2025 10:08:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [v2][PATCH] valgrind: Upgrade 3.25.1 -> 3.26.0
To: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <187722FB6FB0528E.931287@lists.openembedded.org>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <187722FB6FB0528E.931287@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:4:7c::31) To CY5PR11MB6440.namprd11.prod.outlook.com
 (2603:10b6:930:33::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6440:EE_|DM4PR11MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: f22ad9ee-3674-49fa-8cb7-08de225994d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnQvdkVMMnZFRkFUM3dmWTJyMUJWQ05sdjhpdVp5NHF3eENxcExkdmdDUlg0?=
 =?utf-8?B?bEdXKzc1WXAxcjlOVXgwU3ArTHdzV3hQQ3BNM3NrNnZZT3dSWXFPaXA5OEVG?=
 =?utf-8?B?bnlNL29rM1RZamZaQ2xjaHFSUnpEcnVOYmJpQW5FUGIxTnRNcm0wbnJoTzJ5?=
 =?utf-8?B?SmlwYU5ZR3BwUU9JeklXS3pvb2NvOGIwNkoycjRlRG5uaDFONmtSUnpieWxO?=
 =?utf-8?B?bThRRmFVMS9hZERQYU1VdFYrUU1YVWdoelJOeFJVaTQxRWVQT2ZNOGI3Qlp1?=
 =?utf-8?B?NWZFZCt3TG9qcEpkWnA0Y1Q3bC9rOHpwMnlDNEYxcWZoUXVrWU9xbk1WQlND?=
 =?utf-8?B?U1B1QzVhVVFHcDM1ZWU2UkVmbXNQclB4cmdRc2VnQ09VV2p6bjd3Ym1JaGdx?=
 =?utf-8?B?YVdJZFhDN3lyYzVma25HUm03ZGJERE81c0NKeDkrZzE5OGhEMmZwOGVLM3N4?=
 =?utf-8?B?bDlSaHBtenoyZk1TNlRJMmVDc2h6KytsVCs1WG50ci9wVGNzRU5Jdkd3V3Ur?=
 =?utf-8?B?RUpSazMrRFhHTWkvMWhKdDFtOUdGVlpGSEFlSDc1VTkrcE0vZHc3QVdxNzFZ?=
 =?utf-8?B?cjI5SUxmNzdvR1VPeTVTTjJ2cGRFWDNFWWhFK0Q0RUN6YlZGZGtpQlJoYy9n?=
 =?utf-8?B?NklGWmpFNlBoS3VOdWNXNGNYMmdabjI0ZFZmKzQxZ2ZVNDhlYjg2V3djTFFE?=
 =?utf-8?B?bGZiQkllYmpMUU91Rkg4ZUo1MEdxbU1yb0JkK0k2MTd2cXR3WHRrcndGV2F4?=
 =?utf-8?B?d2FFZVJtVm5YcGRtRkFONzIveDg1WThzM3J6Z212RkFuYlpiVXdsdGpEbTVW?=
 =?utf-8?B?V3dGM0gyV3RTM29yUklTYnhzV2hERzNTYUZJZG1HaFdMdmlmQ3pIdnY1bTdv?=
 =?utf-8?B?Vm5FQXl5TDZVUTlsOHVLdDZ0NkdTaHlzUXFCZmRpOEpvbkR2dU9Zb0EvTDFh?=
 =?utf-8?B?Nms4b0xLUFhYZEpIWlhoTExnTUpZekFvcWd2WC9LZWxtUUZrNjBrcitVYjcz?=
 =?utf-8?B?SnZIVXZYU0M3VklNaGRDWm1TR2hUSTljTjVFWU5Bd1NadUxmSHI4RDcrdExN?=
 =?utf-8?B?YzlxN1pERWhtQ2lCTjJPbnFGRXB5K1A0citmTU5TSmk1MjlaU1oyZUo4UjNK?=
 =?utf-8?B?L2tYQ0cwTzJvMUhVRHQ4a0tCWWhFNmNQbkVzSU1Ka0RnVzNsaXN3bUFEQVBS?=
 =?utf-8?B?ZENRS2ovQzRwWWlrV2kvcmJhWFpkL3lkei9jaGpsL1AxMjZkVVRNRVdqd2lH?=
 =?utf-8?B?eGhheWl4WHRzMEtCc1kvTjkySjhRRmhQWlFXVmlBU2x1Y1loMWVtRGFza1FO?=
 =?utf-8?B?d3JlUy80ZlRVOWw1am1JMUdhNVExa0kyK0N1Nzg0dFl3K2FnM2NUZ1lOTHR6?=
 =?utf-8?B?MFFOQ2d5NERtb1lvSDk5azk1MVI5aVBJUFFMdTZSZUJFY20xdys5TVlhblMx?=
 =?utf-8?B?ZFlPN25KbWl2SzFMd3I3d1lvUkI3RnZZdG1JSktHL084VHZTNXNPUHBQYTRH?=
 =?utf-8?B?bTYvdWdCNGpCZUhQOC9nS1FXZUQwdUcwcEtyR3VLQTcyOTNLczI4K3BWaEFm?=
 =?utf-8?B?LzBISVBqcys4cCtsNFlMbFA1KzMxWDJMS0t5NGV1OEJpUE56T1Qyd2p5S2Zm?=
 =?utf-8?B?bU16TytUUjdaMWlOdHp1cmlwV2JaYS9yaGR1aVhjZ3BHVFF0V0ZINlB5S3h4?=
 =?utf-8?B?QUpOSXlrbWM2dTVmaVVlaHV3UHc3RVgwZmRrbEMzbVBvZ1daZ2gxRzhST291?=
 =?utf-8?B?MHFaeDlYVm1GaFpoRkxKMS90SjVSOGdvTFFnTVNtMXB4ZDc0Z0NxUldJa0dT?=
 =?utf-8?B?WTBhTUZKSnJZR0VDdU92ajVyRHhoV3o3akFCanNUbVo5WVRnSzAvYWFjVlhz?=
 =?utf-8?B?azN3cU5EaUhJWEdxV2VoZkhPVlZJdDJwL2RTdG9IZXl0cVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6440.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHhxYjFGSjJEZDB4N1BueG5DMXVhQVNrbHprZWlZTm5jSFNxaVNQVEp1TGNq?=
 =?utf-8?B?dFJaeSt2MWZFRGhLSktRKzBRKzdJYVR1NnJWb0F3Yno2QlRTd3J6Z3FvQWpI?=
 =?utf-8?B?ZzFNTGdSWFhVZmh4SzVSK1prM3hBQ2hTUmV4VlNJV1BJWmlZekV5U1U3ZGZh?=
 =?utf-8?B?SFlRZXZETnAyVCthdU5UL2NFanVnMGVlT0g1RWpMSFBjWThwenMyNkEzMXc2?=
 =?utf-8?B?Ny9tL21MZ05mM0lkWG9rRkhHenBpYklWMUZkS1VNUll0a3hRdWVBSVhFcmp4?=
 =?utf-8?B?TGVCRWlIODBFOTBqdzFoc2NiMENCZGJIQ2JsODVwbGYvb1R5eVhnbTlmaE5s?=
 =?utf-8?B?aEtzODNkMGRDekg0bFZBMU1tK2VMTlZZNWsyNzdiWWQzVVZlNHpJa0RWSVJP?=
 =?utf-8?B?RkFobkl2UllmbEhwT2hwNVZSNzBwdXdDYjJsT1N0WFJMeTdHbWpxOHcvUHNV?=
 =?utf-8?B?amdyNFFqSTR0NEpFT3oxVGlHQUFkVmQ5K0IvczZDTFBJamllTitkWFZnbDRE?=
 =?utf-8?B?ZjNBbVp2QmNteVVjeGxCaDZzVDNVcUJKZnNhLzVhNEdFalhyazdzVlE5WEVR?=
 =?utf-8?B?aHpYdUJXc0V5WEJqeEkyY0NyejNaR0FGN0w0UlVYUXdPTlJ4R1EyaytZam1p?=
 =?utf-8?B?Wnd3OWtTWVl5SkpLb3UrdnNGY2pJRGpQN0xGRFBpU2NUOUV5RU1qR1cwTEdq?=
 =?utf-8?B?SW5xRjhCZnQxakdNVThsYi9yM3hWUXgwMFkxN0x3RGE4Q0ZRQkVOV09mbGlZ?=
 =?utf-8?B?dURmY1ZiZ1d0cUtqSnluYUltTzM2cEFvSjFjM0pZUXd0elJGbFZKYzA1MFpi?=
 =?utf-8?B?VXdZQ2RyZUV1eVR5blEwRk94M2dEdUhYNHRHK2hVOWxOcERxbHhpbzV1V0Fy?=
 =?utf-8?B?UGtGenhBNUFWQ2ZFS1lsV1dLVmN0MEIrbDNFdlB0em0xS0tmLzQ3b0lHNTV4?=
 =?utf-8?B?Tm10Tmw2U0pOTmZFVHF6UmtNZlZNaUxXbndpNkYwZlVtU05vN3I5OEJ2UDFL?=
 =?utf-8?B?NGtVWjhERkdhNUpmRG85eENQd2ZhbndFbm9mUXd6czBTL2RSeVVkaXJCUkt1?=
 =?utf-8?B?S0FyRXg2alc5M21JM2I0cW8vSjVpOGd4a1Y1ZzlSWUdMcXpyVjB5aE90aGdo?=
 =?utf-8?B?RVRlYjZzc3MzOHlXbG1mWjROUDJFc0JOUGxDYXVxaFMwbXVzV0FVYzFuUE9F?=
 =?utf-8?B?cmxwNk9YWlVYSkhuSWlJeWZQRW9TZlJrMVBLY2JQQ3gxa3JiMTNla3FoZ0kx?=
 =?utf-8?B?MXdXZzhodjdEdW92d0hBWnRNUGhQSzJzWjBnRS9yc3kvWTBMaHJzeUs3UnZU?=
 =?utf-8?B?MnRjTm9KZzBsN0xsa3NFRFFRc2M1U0FzK0RLd0NFOGRVMFNDQ3ZMU3BoVmYw?=
 =?utf-8?B?L1ZOSnFTQ280MytkalFIaHg1QXA5UXczTk1LNWw4N1pseEhkandvTDNzRDMv?=
 =?utf-8?B?ZCtvOFJlV05MdUFWTU12LzczOFJPUkp6KzVudXdlWWpwN2g0WTRUb2tuT3VV?=
 =?utf-8?B?YVpJcTJxRlhnTUIrZ1g5d3U2RVVrbDIvVjl1eGtMaDR6Rzl4QmI0RkNobk5U?=
 =?utf-8?B?TXdwVDRUbkxacGFJQnlhd0szdEVTUUhaVEM1QWJiZ25RNlh1T3VmUW1BVE1K?=
 =?utf-8?B?VnJ0SVlXdzlscFUrZDNrUVZqYVNNa1o5R0QvRDhBNWFLNFVKYWZyN3ZGTjNn?=
 =?utf-8?B?ckpXSDBWWkt1UVdlVHZJcklFN0xXNDl4MTFseVNHT1hqcHJ2K1FEVVhxSnJl?=
 =?utf-8?B?bVpObWJIVTl3VmI0eGJVekRReGZHajBsNzRtYVRBQ1g0OWNhb2FEQVdIV3NO?=
 =?utf-8?B?Ni9oOUt6VS8zNnZ6dVFVMmZUa0dQenYwM1RMNE42Y1pYZ3BZMnNYaTZ6RW5G?=
 =?utf-8?B?THJZbkl3azhZazAyK0Y5RmNES1FrTXpvdkVSTzByeFJQc01aVW1ZditlcDFa?=
 =?utf-8?B?RE5sdHNvQ0J0bzBiM01JWEowYjFBQ0FtK05SeHRvNVBmN2JON1Fjd0JUWjYy?=
 =?utf-8?B?NVhjWGtZNER4UDc3Qm9naTZ4YlZPdUhFTmFmVEE4UlVYRFVNVmdESGpkVDJy?=
 =?utf-8?B?eDQ0d2JRdEw0M3U0ZDQxdnZMSG1jY1BGWjVWY0EyeXRORzA0Zm5qT3oxWE9w?=
 =?utf-8?Q?yP2bWdrXd5f5v00xehcEJXpmP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22ad9ee-3674-49fa-8cb7-08de225994d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6440.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:08:48.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1y6thh/W7cLViGyVNBmSMNe3Kp5zfxIFuqzSh7TmIWmlAKXfyXb2VuQxfnUsjFLz5UcxqFNBmwrnCW54uH2Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6383
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAxMyBTYWx0ZWRfX9jiwkQ5uSxiP
 6D2D0mgidnlA4XnGpE1VKDY8NVkyqT/A3y+cMBP3CUlRKRcZDR/63uD5ohYfWlqN3FIlY0CFeJ4
 N5yeFL0LfHc2oHYYxNS1XRA5YXiCymBktaSNN8qldGV3F3gx6/Ll+stCI548/Db6WNQ1VqHjW7A
 NBO3f0edchifEiAFNJcYWzlG+1++xj0wRtQuNlm+NUbfBVH/bJOP+OMpj8Ii3g8DZvpG48T3lzk
 EUxnXomEKRYiYQBGT3yYcYSDG6kYc/KmFzL98whbER2yGaxO9q6hdEyreVwDoulTcQ/EgjpIPns
 QaNDJ/wOTT0xLv0Ivc3wliTaj7BpPl25KYW7umgdprxgPcav0HV6Mpf2DNB0R4BTF3EmQr+bt9h
 9Pz2HF7KFo7WiWM/MVq5F4fTdWO9zQ==
X-Proofpoint-GUID: wQ8hlMUuchu3Y93PqhKfgADjdqBld9Fc
X-Proofpoint-ORIG-GUID: wQ8hlMUuchu3Y93PqhKfgADjdqBld9Fc
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=69153db3 cx=c_pps
 a=5RlqQmsqPSmFSsyCuDtDZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CCpqsmhAAAAA:8 a=3fyaaF4VAAAA:8 a=vMm7aj2tAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=2dQnMmcJZFY4nzRM9CQA:9
 a=QEXdDO2ut3YA:10 a=QVpHfkqoFdcA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=r6sWxlpsa93XciTrHfvA:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 02:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226221

The valgrind upstream responds there is another slighter fix for musl 
build failure with "getdents_filter.c:18:5: error: unknown type name 
'off64_t'; did you mean 'off_t'?".

Will send out v3 to include that proposed fix.

Thanks,

On 11/12/25 10:57, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> License-Update:
>   License version and the copyright year updated [1].
> 
> Remove 0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
> as the logic has been already included in the new version [2].
> 
> Add patch to fix off64_t not defined in musl.
> 
> [1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=3392155359822c0d4e8bb371862e92425054d02a
> [2] https://sourceware.org/git/?p=valgrind.git;a=commitdiff;h=2fa8581c4974db57de80de915d16ce299eb9aa84
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...tax-for-pushsection-directive-in-inl.patch | 31 ---------------
>   ...c-workaround-off64_t-not-defined-in-.patch | 39 +++++++++++++++++++
>   ...{valgrind_3.25.1.bb => valgrind_3.26.0.bb} | 10 ++---
>   3 files changed, 44 insertions(+), 36 deletions(-)
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
>   rename meta/recipes-devtools/valgrind/{valgrind_3.25.1.bb => valgrind_3.26.0.bb} (93%)
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
> deleted file mode 100644
> index b59c5442231..00000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 2089383a0e3a50f527337ea05188b3e302069888 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 14 May 2025 09:29:33 -0700
> -Subject: [PATCH] Use portable syntax for pushsection directive in inline
> - assembly
> -
> -'@' does not work with clang inline assembler, but '%' works with both
> -gcc and clang. Therefore use '%' to make it more portable
> -
> -Fixes
> -<inline asm>:1:41: error: expected '%<type>' or "<type>"
> -
> -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=504222]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - coregrind/vg_preloaded.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
> -index 5bec51d..e4c2dbc 100644
> ---- a/coregrind/vg_preloaded.c
> -+++ b/coregrind/vg_preloaded.c
> -@@ -55,7 +55,7 @@
> - /* Note: The "MS" section flags are to remove duplicates.  */
> - #define DEFINE_GDB_PY_SCRIPT(script_name) \
> -   asm("\
> --.pushsection \".debug_gdb_scripts\", \"MS\",@progbits,1\n\
> -+.pushsection \".debug_gdb_scripts\", \"MS\",%progbits,1\n\
> - .byte 1 /* Python */\n\
> - .asciz \"" script_name "\"\n\
> - .popsection \n\
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
> new file mode 100644
> index 00000000000..3bd7e6b0a74
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
> @@ -0,0 +1,39 @@
> +From 11d28de950d804c7ab74f9f9ef353d9ba7c96a88 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Mon, 10 Nov 2025 11:21:36 +0800
> +Subject: [PATCH] Bug 511978 - getdents_filter.c: workaround off64_t not
> + defined in musl
> +
> +Fixes:
> +  getdents_filter.c:18:5: error: unknown type name 'off64_t'; did you mean 'off_t'?
> +   18 |     off64_t  d_off;
> +      |     ^~~~~~~
> +      |     off_t
> +  make[5]: *** [Makefile:920: getdents_filter.o] Error 1
> +
> +Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=511978]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + none/tests/linux/getdents_filter.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/none/tests/linux/getdents_filter.c b/none/tests/linux/getdents_filter.c
> +index 361659f51..d2c627f17 100644
> +--- a/none/tests/linux/getdents_filter.c
> ++++ b/none/tests/linux/getdents_filter.c
> +@@ -13,6 +13,11 @@
> + #include <sys/syscall.h>
> + #include <sys/types.h>
> +
> ++#ifndef off64_t
> ++typedef off_t off64_t;
> ++typedef ino_t ino64_t;
> ++#endif
> ++
> + struct linux_dirent64 {
> +     ino64_t  d_ino;
> +     off64_t  d_off;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
> similarity index 93%
> rename from meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
> rename to meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
> index a8b0be5767e..6f7d67df0ec 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
> @@ -3,9 +3,9 @@ HOMEPAGE = "http://valgrind.org/"
>   DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
>   BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
>   LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=41c410e8d3f305aee7aaa666b2e4f366 \
> -                    file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
> +                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=9ba449d120f6845e6a432073278d6e3a \
> +                    file://include/valgrind.h;beginline=1;endline=56;md5=993563aaa122558df9c5d743de074d04 \
>                       file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
>   
>   SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
> @@ -25,9 +25,9 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>              file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
>              file://0001-docs-Disable-manual-validation.patch \
>              file://0001-tests-arm-Use-O-instead-of-O0.patch \
> -           file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch \
> +           file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch \
>              "
> -SRC_URI[sha256sum] = "61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af"
> +SRC_URI[sha256sum] = "8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7"
>   UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
>   
>   COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226194): https://lists.openembedded.org/g/openembedded-core/message/226194
> Mute This Topic: https://lists.openembedded.org/mt/116250876/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


