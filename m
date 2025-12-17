Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9048D64089
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 08:04:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9559.1765958677209428523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 00:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JxYWZ703;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4m1PO1051277
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 00:04:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=4RmDFLwevtewrHFKBzx9rhe7j9iVkIBqDJMLMgwigns=; b=JxYWZ703PI0s
	Ll+d1TE6ptXEkc92XTLP4KyhekyUvr1d4lGAmwP9Eac6LkJ+YLTdIO8EBbCArg72
	N3QutfIUIjSLAls9zmtfgUzXTbXc/AVZZlkSFdfNg0I2YnHvK83j6iDNKs4Qw0KS
	nKsquwhF/J84RugMWvkS2XjnDvi3ZkGCsIeViVUx4AEa9b8WHra+E0r3kfTOl3Nr
	yOyqTk7aqk4zWRyHtwFMVzdmKadym/Z+qMRpHmcVDuo3wL2k3hshOW33s5NQx8v+
	lX+JApF9dzdm4a6D3NyXQulDog7Q51qYBo7l4LnwzitNfr2FmRPTuk+F0BnbqUNU
	SGh+DB9lyw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j095d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 00:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Okdr+A6ygBpblISqYWfKq7raHfEkH1BypJR3xMHBJes3B6sRm1exWivjSdSCLohZx5rLwADw54vGEXij4K6WOOkuFTVcD6EZVIGORO0WjqEuaynrJPkkt6pwPGGv7eYIX4YxO5Ooyw8nNHCCjBEbJFDvxrX8akzouA0GghrUPtZIe0pg42A8gzcByWEC5B5p45ztWNaAcfSM0X3HjSAKcWGD1kERRK5DQmk+qmp6fE2ZMgN2ndLPpKyh6Xr0PK4zrkIYeLahEv6iNRmJYvfwWZTNlv9vEGlJAAv8iRpR79ujoXf2h2Bv2AH1iPyJtvA4a7UV7H3yQF6ArpTvzF5mLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RmDFLwevtewrHFKBzx9rhe7j9iVkIBqDJMLMgwigns=;
 b=zT94/KUhba5eL4vuJP0R7ZHOpFcNVUJYVsV5K5KkdjfUK1b/KbrkU0RYLqZx0bKXZZuDxipGmDS9hzJaMzaDJDMMdoC7+aTAmrBXdH17LydLNpr7g+yG6WQ1vVkR7DWa5wQLJORESpcuLNyfjcG+Ccr1xhipGIv5MKrdldandlVcPka03lS0BDDizjWuJc5bjxye7uevSLrmttqYZshHSv6R4KlkSXcekSfaQK8uAMI6Bg+cvCm44/99q/OAIrhFZdsByvNZw/HdfT+mWex4QpxvW+zhXKWGlc8dTjeQJpborYLDFuJHC7lckFfddQj5Mbn5wgrSA5prxvDIBqJ9OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.8; Wed, 17 Dec 2025 08:04:34 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Wed, 17 Dec 2025
 08:04:34 +0000
Message-ID: <77ca9b65-fb7a-4b81-9c1d-75d6e7012470@windriver.com>
Date: Wed, 17 Dec 2025 16:04:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] socat: 1.8.0.3 -> 1.8.1.0
To: openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <1881E981E3AB9FED.1250271@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1881E981E3AB9FED.1250271@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::15) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DM4PR11MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: efabc73c-d187-4c00-6fa5-08de3d42ea64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2VvdnptMjNUUXVBdVJXc1Z4RWFUYzRPSy9NeUtNcTZWY000emhndzUrKy9C?=
 =?utf-8?B?SWUxOGpHTGdQR0NUWlJQZFFzT0tZNFRVM2l5MERCYWc3TlNuK1lCMVlwSDdt?=
 =?utf-8?B?SFVhcUlOMWZmdDR3SXd2VEJpd3FjY2xNOU9meGhRbk9uWEhuVHM0VUs0THor?=
 =?utf-8?B?MkVzT1VkdURFb2NjT3NqU25JMUpBZXJSbkRWdGNJa1Q4N29ndHNPRXJjcFQ2?=
 =?utf-8?B?M0pQdVVaWENpUEZoTFY2M0UwQWtaNWx0SjRzT052Mi8zMlNXUFBUamZpaE81?=
 =?utf-8?B?OEtiVXJNT0FMWEZ6Q1NSMExUMjJhWVVnUDR1VGpvTGN5M0hXU2pmOC9ZR0gy?=
 =?utf-8?B?a29hY1g0M1JhMTBuelpkRzlxQzVOUXVCNkFOTTFMdzcwcGxLUGk0MEZ6RDgv?=
 =?utf-8?B?dUNQKzdpWmxvVkRkRVN3bTBHcmV5MW9uTlZoTDh5TEhQcjBKUVYzVmVYaUNU?=
 =?utf-8?B?eFJNenk4ZHlKTE5PZjhlQmM4Q2JKL2gvN2VoaFNublZ6WjVRNkszQ01HY29N?=
 =?utf-8?B?TDBJVU8xL3JNTkRGQ0t3RFBWcCtoUitFUGRHNG96SXBNUWV2N2FueUpiODlo?=
 =?utf-8?B?RHpsdk01cW5GcjFZYW45aWkyWk5XR3FwWXkrWGxTVTgrUEU2OGRnbTlUbVFS?=
 =?utf-8?B?Wk9sS3dzbHNyWDg2U04vT01WZnpHWFBPbHdQbVlHUlRkSC9lM0NiTWplQlF6?=
 =?utf-8?B?V2hOdTlhSEJTOG1tS0R2NG95YTg3Zi96SHIzaDV3aFc2SDhMNlBCN3lmYzRT?=
 =?utf-8?B?bzlOMXNNL3VOVWJnRldLMFZXak9XaVhlZVpEekRkYTlqZHdoTGxONnlpeStQ?=
 =?utf-8?B?ZHplZmZ1WVRPcHNaSTNza1N6OVVoWWoxUnROMGY1ZHJYUERDelJ6K1FoaU9x?=
 =?utf-8?B?MUdHM2xTT3RHdi9iS2RZTWw1NHp3V0k1TzR1dUFnSHV3YXdjT2FQRzN0YXdH?=
 =?utf-8?B?MTE3TDdYdEJjYkREWDNsVDRqc25aZSsrbHd4dGlBNDhaY3lRZ05aU25tWlQ3?=
 =?utf-8?B?MUZWZW9yNU1nV29leUM5NUJnOHhoOTVUTllMMnROVlZrY2tLTlJrYmJEQ1VJ?=
 =?utf-8?B?VW15eVZIV0VpRm85R1UvZHdwUWpMdEJ3RytwdmJ6bmZBbnlwMkV5K2ZjcWVL?=
 =?utf-8?B?ZWJJVUNqSzNJcitFMjk5eVFXb2E0d20rTjl1cmtBRDkyZThtRnpuYkZ6UWs1?=
 =?utf-8?B?L3pjd0tXMmhOSFVUdnoxR1ZCZjFFa0M5UjlpeU14YmdtUTZ3Y1RHdVNpMVpL?=
 =?utf-8?B?NGNtT3FieEtpSHlEdUxTL3d2bVo1ckVoSFZneTFqdDRMWTJCbCtMWGNqWDRN?=
 =?utf-8?B?ckFxbnN0SDN5OW9peDl1ZEYwNjE5MS9aUzRTaStmLytVL3VRR2VTR3lLMFJ4?=
 =?utf-8?B?ZkM2UUN1Y2ViT1p5RS9nSnlKam8xOG5aVis5eVpYZVh3ODQ0ellYWHMrTExF?=
 =?utf-8?B?anlyWEpSVW5uc3lJdVR3YktZTTdjV010MmtoNDYzVVh1Qk9EaWt3T0txZ08z?=
 =?utf-8?B?MG1QQXhwZ2hEMHlGdEJHZUI3ZHlZcXZtYUE1b3JKY21ZRmFSUCsvbDBrTmc3?=
 =?utf-8?B?bzRvYjdTS2xOUjJjY2xIUHJGZ29jVVQrb0UrTWowZUIzQTdRS0g2c1BpeHli?=
 =?utf-8?B?bU9SWTB4WnZaRURERmRDT3pmLy9wbXNNTzF5MjRpeXY0RHhrTnUxbTB0bUQv?=
 =?utf-8?B?MVR4Tm9RenVVSVk4NkxqdlhVVC9zRFZyRzVYdUcwdzBIYjBkdGZmaE92UWds?=
 =?utf-8?B?Qk43YkRGdThNczFlZm5jdUE0aUxYNGhNWVRqQ2x4VUswQVFudFVSZlZzKzNt?=
 =?utf-8?B?bnJuc1B6TTMyY1FrSitOeUh1QTg3elNZTjdObkxNZFV6R2kxbEhFVWtTK3Yv?=
 =?utf-8?B?R2NNVEdYOUVmaDhDS282N0pqdWhOQjNjR1QreXlBME5Eb0VRRTJSTW51M2Q4?=
 =?utf-8?B?Sk1ucWJnY2w4dm9lbTNKTnNBU0p4MlVwUGw0U0FPcXc4Z2NpdHpZZk5Dc2dj?=
 =?utf-8?B?MkJaZVpxOTJ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0k1UnFCQWsyWkZHUVhYSlRxSlZwcm94ZGJLZmdrMHIyRmJIb2pPYzVhemRM?=
 =?utf-8?B?YXNYYmRhYUk1a0ZtWnpHZ2RqTTJXcCtMOWhuUjQ1Ui9KMHBMbnVCUU43RmZ3?=
 =?utf-8?B?UGU4ZmUrcmMrU1lvU2NZeFpleWRrdm5xaHBRcU5Id1hJZ0FUdTVvSzl1QTFC?=
 =?utf-8?B?aGZPNDZtcTNoc1hidFRTZWNmWDliSjlVRGVTVmkrd083bEJuUXFjUDQzZld0?=
 =?utf-8?B?Y0FqUGkxL01ZcmxkV0szU3JUWUh5ZDZwa3Y2YjBYbzBwZEdGOXI1R1piYkFq?=
 =?utf-8?B?ZXJZd3R5SGR2ZFREcWN2LzM3SWRZcHRpZDM3d1FHZVdENlBlWHQyaS9kSS9U?=
 =?utf-8?B?WUFlS0R4cE5SVmVZTHFBTzYvbFFBSTAyWEp3YVpsbDEzVzlTZXAxanhHMXNY?=
 =?utf-8?B?aGtVNmxCaitwc09JSUpKMXNTNkgvNmhtdVNnbzM2VnVLUFVTNnBMWStqUHE4?=
 =?utf-8?B?aEp6cmJDam5Gd3lFTjBuWkwyMy82REFmT1NhVEgwanlyOFY0Z1ZDcnFmcmgw?=
 =?utf-8?B?a0pPYWlCcm5UZ2UzSGl2QlZqUmNRUVBiOHRJNVk1T050dk04aUJHRjRkRnV0?=
 =?utf-8?B?SGxhb1NnRG9DYk9SVTdGM29mUkJCWU1FcHByMG85bzYxdFM2Z0JjTGR4WGtL?=
 =?utf-8?B?SC9TVnFhb0U3M24xYW41bjNOTXNoREJQOHZjV0NQMTg0UGFkQ2MzK05mb251?=
 =?utf-8?B?NWUxUVJYSFNHb0NYaVo5K04yTE1TU2o2YWlLYlEvUmpFNU85djRyZU1CSFBX?=
 =?utf-8?B?aG9SckZQZUNjN0lYcm4ybHZ5QzJ5S0RCUDdJZ3RZeTJjVjdaUWJPN2xhOXda?=
 =?utf-8?B?Q2hMZVFIaHgxTFRBc2tqMndpSmRINjVyQ2Z1WXlRQzdPZlVDcUVNWkUyV2xX?=
 =?utf-8?B?blM4VmFBZWxHMSttbWNDKzJCTW0vTVRTYXdqckZCOUJZN1B3azhFZ24xeVVa?=
 =?utf-8?B?WGpnSGkzYnA2RFVHdTJ0UFhXVU1GYUNFbmdkdURySDhhT1pzbkt4emVCK1g0?=
 =?utf-8?B?UzIzbjFZenFyb1BYZXRjUTRpN2g1bzFNeElyK1oxdXpRMENBQ1BaOWNIVXla?=
 =?utf-8?B?MFJLK1ljdlVOS1owTVI5WEdHQ2FIZmQvVzBNT083cnlmcUlHdVNoZGlMRUpj?=
 =?utf-8?B?T01URFVXeVVQZ3pVVUxFeng1eXE3NS9MUjU1aVBhNmNUKzZRTFR4SnB2cm9M?=
 =?utf-8?B?NFhBUWsxZmNqclI3VGhYVWJIY1RzbDBjQ2E4RUwrbXJPZWsydFc4Yk5QS0ZY?=
 =?utf-8?B?S3NKR3UySlBJSUNWOVhBa2xPMWxFWkRjaDlKVVJiVkJydENvU25wcFZNRmZx?=
 =?utf-8?B?TnFvZmtQZk5lY1NLU1pQaFJIdVRpZUJYbjdMQzJHV0pZd09HT1ZkSW1lRW90?=
 =?utf-8?B?ZUwzcnIxSWM1OStZVklFenhianZ1V21lQTJyUG14VHpqU2VKQXpxMFhOamlS?=
 =?utf-8?B?ckZ2WVpIR1ZqZlhUVTEzN01NVmx5RncxUFlwS3Z1bjF6cXR5T3h4TUlXTXB1?=
 =?utf-8?B?UTNmZlppSVl3TGk2a0dJOVZoS09STkY3NzZmRjFrUUYvU1VibVN3NElNeGxr?=
 =?utf-8?B?ZWo4RHliMm8vbUJoT1FHNWk2bTEvUk1QWDArRk1JS0xFeFJrYzV5dUxjbmpx?=
 =?utf-8?B?SkJUMGNMV2JNYkZ1TE9jQlhBa3k3eHA0R3pMMXE0b045K0RLZDJZZkVzWkdU?=
 =?utf-8?B?UThMSFBENWVvdkNyT3NFY1dCQU5GbGUxT1pjNEs1QlFXcVcrUlowWFh5N0ZV?=
 =?utf-8?B?SFA5dlk4ZGxPSVovelFoRmRlN2w0YXlWSmNrZmhBT2FXYzN1V0plS2R4Sit0?=
 =?utf-8?B?WEhEWi9ueFdmbWFHb1YwRm9WUE1OdjdkWHhOWFlhOS94SWIrZmI0aXVKZFNs?=
 =?utf-8?B?VFBrZmVRUnQ2TWhrc0JHaXBxSHZmcTNYUG5rTVNGQlU1NDBmQ3FDNm9qYS9N?=
 =?utf-8?B?VTN0Mk9CR2NMNExtYmZ0U3hjZ0JZSDVuSFRVNlRJdDZZcU1SUHpGWmdudnBB?=
 =?utf-8?B?T1ZpOEx0Q2N0RWhJcGM0TDFBdUk0YXZidjZXeFhpWmRIK0JlRGFucTY5aDhF?=
 =?utf-8?B?aWtRTEl2K2ZReHc2dHFWRGFYa3FCS1I2MVF2VEFQUFJVUjJDSHUwZFJxRXZm?=
 =?utf-8?B?U1dCbDNQbDBrVzBjME9Cd2RhcTBmNFkzaHUyWW9uWm5IZ3dpbkF1SlgyTU9H?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efabc73c-d187-4c00-6fa5-08de3d42ea64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 08:04:34.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4ZhUADHK9oEWsTGq8B4QGcMsIVW3qJp4tqIGJlTbuREo7Y+/AjX+Ku4bci/30PoI4+X6yC8/WZdglWvwu7YeOB1Idta2eDchzU5RbxAJAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69426414 cx=c_pps
 a=XYUUcOYeOu1iXYjTrsocvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=uPZiAMpXAAAA:8 a=rFFRleaeAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=i24X6R5KMYnqGRelo1cA:9 a=QEXdDO2ut3YA:10
 a=YLtI_f64H5IAZ6mI3Lwl:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4UJTSrn8wyvaJZU1LyEW_uHov2xUe4SB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA2MiBTYWx0ZWRfXzJ8tmN+sj4Zj
 fEheWLSBgCzb58MAqNGE9lK3eoWAob3tT7cNRo6Qk+oHbR+dAtUOC4W5yIdaPbP+o1bPPvbCLOv
 8gRA8QH70osVM/JOuXRwbOZUCNyZcVtyFy+SykNsynnIJmoYOLyMckC7CofwfwtI7Ce2jbNYuI3
 N6ersJNpT0d6Lj7iof4z+efcgZoz5NpcDMdEw2gIowXCGnUZz+yS4qMRKiHFKwuEKqSzu3LJYie
 5HGlaDsjkp85pahjfUrEQY7EGb7OwTop9fo+QdtYV9Mt0mZlDYRMXrySvkA2j20VEsVMh0h3nS4
 BDlgyJ1zc31nj9QS0plvyEMlQVSoEMBJdAE0D8QVbs7+z+Ny82RagrzfkqoyDmLNQ4+auFrfHOW
 glcPLyp/YEe1sthAKrhyLGUpfj1pWw==
X-Proofpoint-ORIG-GUID: pxRFCxRxekqRWhxGU7R1VuM_h8sMhpSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 08:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228003

Please drop this patch, upstream socat@dest-unreach.org replied with 
suggestions

V3 incoming

//Hongxu

On 12/17/25 13:27, hongxu via lists.openembedded.org wrote:
> Fix compile failed with musl
>
> License-Update: No change, update README to add new lines
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../0001-fix-compile-failed-with-musl.patch   | 42 +++++++++++++++++++
>   .../{socat_1.8.0.3.bb => socat_1.8.1.0.bb}    |  5 ++-
>   2 files changed, 45 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
>   rename meta/recipes-connectivity/socat/{socat_1.8.0.3.bb => socat_1.8.1.0.bb} (88%)
>
> diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
> new file mode 100644
> index 0000000000..47ca6b97b0
> --- /dev/null
> +++ b/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
> @@ -0,0 +1,42 @@
> +From baf05d4c74d35a98d65328b89627d1806bfd84a5 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 17 Dec 2025 11:31:29 +0800
> +Subject: [PATCH] fix compile failed with musl
> +
> +...
> +|../sources/socat-1.8.1.0/xio-netlink.c:33:59: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
> +|   33 |         struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
> +|      |                                                           ^~~~
> +...
> +
> +The warning is due to the fact the NULL macro is defined (by most modern
> +compilers) as ((void *)0), as it is intended to be used only for pointers.
> +Assigning this value to the void *msg_control member of structure msghdr
> +causes the warning.
> +
> +To remove this warning, use 0 in place of NULL;
> +
> +Refer https://stackoverflow.com/questions/64535635/assignment-to-int-from-void-makes-integer-from-pointer-without-a-cast
> +
> +Upstream-Status: Submitted [socat@dest-unreach.org]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + xio-netlink.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/xio-netlink.c b/xio-netlink.c
> +index 533d78c..cb31c43 100644
> +--- a/xio-netlink.c
> ++++ b/xio-netlink.c
> +@@ -30,7 +30,7 @@ int xio_netlink_mtu(
> + 	struct nlmsghdr buf[8192/sizeof(struct nlmsghdr)];
> + 	struct iovec iov = { buf, sizeof(buf) };
> + 	struct sockaddr_nl sa;
> +-	struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
> ++	struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, 0, 0, 0 };
> + 	struct nlmsghdr *nh;
> +
> + 	Info2("Setting interface %d MTU to %u using netlink", interface_index, mtu);
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
> similarity index 88%
> rename from meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> rename to meta/recipes-connectivity/socat/socat_1.8.1.0.bb
> index b5f5d72f9c..331133d6f9 100644
> --- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
> @@ -7,13 +7,14 @@ SECTION = "console/network"
>   
>   LICENSE = "GPL-2.0-with-OpenSSL-exception"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f"
> +                    file://README;beginline=252;endline=282;md5=338c05eadd013872abb1d6e198e10a3f"
>   
>   SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
>              file://0001-fix-compile-procan.c-failed.patch \
> +           file://0001-fix-compile-failed-with-musl.patch \
>   "
>   
> -SRC_URI[sha256sum] = "01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095"
> +SRC_URI[sha256sum] = "91f222ee65559036600c2505b999acebed48b899f0e2e53ae1c9c31d6986b6a4"
>   
>   inherit autotools
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227998): https://lists.openembedded.org/g/openembedded-core/message/227998
> Mute This Topic: https://lists.openembedded.org/mt/116822826/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


