Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C27D767C8
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 10:31:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14185.1766140305736591954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 02:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ca1Myvor;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4448d6c4c9=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ5boVp3548124
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 10:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0BreNxjTMSTi99Z/EVkKok2fQ8Flf74oxIElSp/NepI=; b=Ca1MyvoriXfG
	G1f9y1Z73K7x26/t/Db9xPZJY3VqWwRQeb3IeB9vMm9ASP1mjJYOCpX/CSNtPcOW
	5paQTEC9rlH0OvKUw2CEFKquXXfKR9MiuBOkHvtfgltQTKbTIaw1hBKc79YysV/z
	fJWZPxMmzv+s+4gN0CYRaGRZ3C5bnhjGBdqyZWdZlWDMFslSmt3mXF+oEbEZRqxq
	O5xdoGt+t5Q0eLLAUbn42arg39yQ88rBti79QO2hC+dHW06BbHoIcFqkRH3WZsZD
	XnW7D5zgLw5ua7LA9UGs3bhfjxsUEdBj2fjCZS6B359ap7zM6RH+N5KYPxS07Lq1
	Vpa5Ih0xwg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2x0q90-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 10:31:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQby0KjfBlLGgZFsXQlt70lGYpY9SgdiW0N2oVZg+asLGtFDApcMEKvVbWQ1X9OfpUCPIsqO5nhlFxqB2DjNJEZxGE9DY91ZqgLgixiVx8diBDwY622KQUHBnqo3j5oZSzbVuxS/u17uDOlWXFY56WfH7Xl+m7pVz7pMxDcn+SF8VMnjOeETNC9aKkoDl+k219Sb9NINfKdaVFSqqolcQswJkHwd3t2HFgCxfdejg7RYC7HTtjCWlGd9ruBbVBH9dWqhQJpRPX6c2AtCKnqgKdLo2utCbSwXuPD417t7fnczBPnhvw1JU8/6D0crGbZRv6cb/rCsspR71A1uoEr3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BreNxjTMSTi99Z/EVkKok2fQ8Flf74oxIElSp/NepI=;
 b=klscqez+BiLwxw05vaZmI1uiljsIx1wgAcM1l5znqpOKkmfNnMqzEN34Uo+YdDrfeh0fIQm+ukyo37UaKwi5/Gh+MdHXXYjhKrwYazhJUSO8zB4/8gNHe1MHAW633NbmMHyfIhQmkvGB1+sBnrdspBsg5LBrNIsVqf2L3czNhZyddRpvzDOcqhL8VCqUk92Sj10L7CQdcPjFd/6223/AfNa/qQjHgWhRBwvj9rpIZaRA4xuXGthbOMcClwZUt5+rURFrERybjVYQ22x4AKCKNS7svxtYyDqIVfNkP26AaAyO9F8cy1fRH2ZmiffN60FT18PzDYsakp0waSQA+bisiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 10:31:42 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 10:31:41 +0000
Message-ID: <201700b0-186f-45cc-83f0-5eb40a1de1bc@windriver.com>
Date: Fri, 19 Dec 2025 18:31:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] packagegroup-go-sdk-target: remove go from
 packagegroup
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
References: <18829727D052ED19.1342979@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <18829727D052ED19.1342979@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 943f2fe3-b942-4c0a-ff66-08de3ee9ccaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cloxQUtRLzZsOEcyOVhYNnU3TEpTM3FOQUNtckFZRHRrVlhnVTN1VlhJYk5T?=
 =?utf-8?B?WHh5L3FBUmNtVTRnME9pUVNSNWlmZ0dFVUVuNUpZTlRsemI2cHdiejBnUk9h?=
 =?utf-8?B?d21vUGlwYWo3S00xOURkTWwxbkxxbDhHeG1EeW02NXA3eWlhYWJRVkV3SDJO?=
 =?utf-8?B?SGNJWHhKcXdyN0JWM3VNWEwwN0FIMENUb0lndSsvZnNwKzI1MmFOUkhxYm9K?=
 =?utf-8?B?NHVYRmE5anlYQXo1V2YwM1oyYjdscStoL0p2OE5DUlJObm1xZjU5anVoWXJ2?=
 =?utf-8?B?VGx0MG5tYVVjWEZWYW5uTEgvT2MwRVF5UGRkZTZwazA4c0R0MUhublhCQWlZ?=
 =?utf-8?B?bDlEWEhlRjUvaEdZeFUrQmRpcWVReEpTRWhIdGJqalpjdnhoNSt2dENiOTFv?=
 =?utf-8?B?ZXJyYmVKcjRRYXVETFJpS2JhTzl6VmhnUmxCZ1crNlpqVnRCdUZveEZ5UzFz?=
 =?utf-8?B?M0pNM2ZSN3VTbVRLREZqTzFzRDZxQytUTFdMa0NpZlRCTkEzeDgxbG5BZElY?=
 =?utf-8?B?dzBxc3BXK1NBaUhoelI5SXYrdmE5Q3UxVE40WTdkZitxdkdLeFAzVTdxbUVG?=
 =?utf-8?B?VXE3bXBmRnF0cEU2Q1Rjajh1dHkrTEQ1TXR1ZGNwNzVSQ0xCZXBXeEFUbkZT?=
 =?utf-8?B?SEE3dUZweTJZVzN4RldzMUo5Rm5YYnRLT0puOTZYTXR0M3ArR3NycXB2cmtk?=
 =?utf-8?B?MFk1cnBqTGxxbmU3b1BSd3FEWFdNTDg3YWVMbUh0b0czVW5KV1g1SlU5TTNy?=
 =?utf-8?B?eVhSLzhIeDAzM04zM3E5N2JrSkRaS3BVVXhXVXNMRGF3MCt1WjFBL3IwZWhj?=
 =?utf-8?B?V0JFblBxT2o4dFIxeVN3SFpsalZYMTRtVGYxYVdBWm1XTFdjcjBMb3AxRmMr?=
 =?utf-8?B?ODNtV1NMRmpmWjU3VE9wY1FYVzZmMFFiQ01ndVBNRzloZWk3WWp0YVlSdlh4?=
 =?utf-8?B?MnRUZTVZS0VXK2VHZit5Tm95YWQ3UmhkRCs3QWVWNlpyQVNTNVBpbThvODQz?=
 =?utf-8?B?enZRWVZpS1pSVEM5Y0diL0MyVW5TUnpCbm45UzJJdjk4emJERDUvaDdVeDMr?=
 =?utf-8?B?K1U3OU5ObHEvbzVlb2NnbEpmajEzMk1wMzZxeUtHWUZlN292RTNPYW5WSUlt?=
 =?utf-8?B?d2RnbGR2VzZJQlBFRWRGT3hzMDVEdXFqK0VXanpQMGpHYWNjNThxWlhueFR4?=
 =?utf-8?B?Q05NcDhlOEtlWFcvb1c3MXBLNVVSVTB0d3RpR2N3bzlORXR0T1BhbCtHR21i?=
 =?utf-8?B?RS9ycWlEYUJFbnVTNlJFYVF4ckVzRnVKenNYZUx6eUdzSGxSU09GekhLNjVH?=
 =?utf-8?B?ZFJaQjU5YzNESEZDVkRReHhqZSttdHBLaHFSK1BJNjlMaHBOV3hEclRGOWxJ?=
 =?utf-8?B?Z1pZWkJKV25UNmR1V1JIeEJDaFROUFJaTm10c3d2dTZ6eXNKcTlCckszWDJ6?=
 =?utf-8?B?RGJ2Nzl2dXJrbnF1ck1mWGJHREJudWtqdkxMMElMMTUwNTdlUlA3Yy9ERFE0?=
 =?utf-8?B?NHVJMDN4Ym80b2xxek9wL3p3Q0xEZ2RGd1V4YUdVUjQwTW1ZK3dDYkNwdzBq?=
 =?utf-8?B?SmpVa3I5eWFIU2QwRWVZUkdrTkt2TEx0Y3diSDRneVA0V0p5YTJEdTIvWXNV?=
 =?utf-8?B?cmlPYUlyaTRTTk04SWFiK0lUSk9CeG1naDdBWFpDTUpyRyt3eGhyYTlpbGVG?=
 =?utf-8?B?RXFMNERZeFFBNndMd0MvazdpdEI0ZE5RdDhIT0p3VjlEYlU2VHd4YUZVeWoz?=
 =?utf-8?B?ZTZnTmM5M202dnhpYXFxVklPNk1jOGQ4Q0FpM202R29HTDd3VWxHWHAwV2Qw?=
 =?utf-8?B?ZWpaWFJ6V0swMTcxWjV1Ky92Z0RoTzZ3cEhITm5LYnplUUNoc0lobVZKRy9X?=
 =?utf-8?B?Vzlqdyt2ejA3OEpDS2F1YW9zQlE1SDg0RldxdDBMR2NKTW9oWC94d1o5bjdu?=
 =?utf-8?B?dkszODlhVFAvN0ZKRzZBVU43UHpDalk0c3UrNjVEMjhDcDBxVmhIS203OW1q?=
 =?utf-8?B?Q0NoODc5SXdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejh6WnQzcWJTbkJIOThuekh3aW1OTVYvTG9sY2YzaTk1aWFOZlF1elN0SXcr?=
 =?utf-8?B?SDYwaXR6b2gvRHVWUEpHNU1YOEdRRk90QWg3ZXYzenRlRW1zVHFLdTE2bFY5?=
 =?utf-8?B?eTkxdDBaSjJVVkk5cFRMWCtBcWIzcll4dmxscCtvSXNIQ25INWkxWEd1UHQz?=
 =?utf-8?B?SkJSZEZvc3dhckYxMG8yeUs3bGFxQXZMM3NyWDVidmdwREpHUVZERU9ISnFn?=
 =?utf-8?B?RE9TYm5KWFFiMVdhWXZ6UDg5bDdzcngxZDk2YkxrZFJOYTJjZTZlK1hadjZa?=
 =?utf-8?B?UjJtSHhpdnM5Z2hOeldtZnJReGdCNzNLY1phdmVjd3VJT3RLQkNJZW1NVkRE?=
 =?utf-8?B?Qnd4d0M0WW41N2hFT09RelZ3U0krMFNQM3E4ay9pNjJCS3JpWExlRlRsdDZ1?=
 =?utf-8?B?ajEvNGRqL0ZlNWRydzRiUGczdjVWWUlDMlFGeEUrY2JiZkNYTlRubGdsbzRx?=
 =?utf-8?B?NFNDSHEvUXJvdlo3RkVPa2wyUW55UDhBaFphbUpiSm1VdUd3TGVJV1NZSktV?=
 =?utf-8?B?R3ZPeXJnSkViTnpTVDBIQXk5a1JhcUxEeXhocnllRExmMzVsdXNFaWh6NlJV?=
 =?utf-8?B?eE5kVUdOdFdaRXR3ZG5PbWJrbjVaTFFzZDVGbUNoZlZ0eWdvbXh0Ui9CajRY?=
 =?utf-8?B?R3NMOExVMUtiaVdGUnRZRFZEOHBhMzdMMTR2V2YwWXJvb3FSWW9aUWE5bFJh?=
 =?utf-8?B?VFJUYUdqcTB1ZkdHcVlrZmQ2eUlJT3BoQ1JrNkdWNFZNMGNqYkFvaGR5R2l5?=
 =?utf-8?B?cVpFWkhQOHVFSGV4cXp3a1BRZXRuYkdYNjBBaW81WUc1WWlKeFErVDJEaUhK?=
 =?utf-8?B?dFJlMmxzaVpVaTRxVU5KNVpRNmpUait1Vk1ORlhpeGFYRmt1aUtsSjlWZzI2?=
 =?utf-8?B?bkVwb0JHMnN0ZzBITGNiVGlITWV6SmI5RHQydGRtVW9Cc0JRR0Z2eDV1MjZn?=
 =?utf-8?B?L1hGSlBMSm1vamEyaFp2eGU4aXF1YmQxbjkwcW9PMWlzQjV4VGFtcy9nS21i?=
 =?utf-8?B?WUFvenE5Qkpobk9ZeUcyZnFqcnhzY3B6a1dkaTl6TkRwRzBDbEFHTzd1YkEw?=
 =?utf-8?B?cXEvQ1Rzd0toOFJidlBrK0VtQWQyWE5ON0JzTlJyQTI3QSs2TThVdFI3cDdh?=
 =?utf-8?B?b1lTSGdwdExJVnlVSFJhcmhnZE8yZGRBSTdjU0NObTBMYmN4dlplYllaT2I4?=
 =?utf-8?B?Zi8zbzYzcHJOaG11QndsQ2FwNGhsSE5JMklraWMzcWJieWFZUitMV09GVTR5?=
 =?utf-8?B?KzAwTzRmV1ZvcVEyeUV5WVVlS1B6dW5zam9kVjkxRHlidU1hdlRNcC9aTk54?=
 =?utf-8?B?N3RqMkJxZ1kxeU9WMHlGMnI1RGVzQnVXK3gzSmwyaWdub2pFUHBnMVNzamhO?=
 =?utf-8?B?VXBrZldndzlSK3l4YytLVmo5azZyTTZyU0xzWVdXOEJFYk1CT0dSVXBRM08w?=
 =?utf-8?B?ekZyQ2oyQ01aRFhNaytSa0xJT2lKMzAxemZSN05Hb0hTK2F6ZkVsZXZMZWNj?=
 =?utf-8?B?d01WR2d4V2QzYWk3Vm1kU2pkMFM3N3Z3eUlURnNHYiswbDRZN3FxYkFMdjlP?=
 =?utf-8?B?YUF3ZkQvV1lnNnMwRG1JdFErWGdQaEZnSE16TmxyNTdiQmw2OTZwSVpzRXUv?=
 =?utf-8?B?b1ZTRG9RaUxzWkpXeTRnYk50eXBCNUdDRkRsa1ZjYU9vdFlYemNLbGIyZ1Rl?=
 =?utf-8?B?ZG5BRU1JeEFaKzB4aVVXTmpManUxRzlVbm1JNUF1UFY1aGo1bU81NmM4Um5n?=
 =?utf-8?B?V3RSS293bVQyaWNGVllBZURSTVZoaHVOcWhqVk4xUVpLaytTVmwvRjJkakNN?=
 =?utf-8?B?ZE9tZ3k3MmVVcTA4QTU5TTcwZW4ydGw0NHJUNWZRclRDWHNTRE94ZXNCTkFj?=
 =?utf-8?B?QkVzZU9Ua1haSjcvbjE4WHVqRzExa1k5bFMwdC8rbHo2ejZOOHgzeE5CcXl6?=
 =?utf-8?B?RzlqMW5Cck4wd0dYaHk1bzZKMEh3YktMMzMvcWJjczZJb0N4YVdrSTE2OVU4?=
 =?utf-8?B?aXNTYWVJZTkxN2MzNnphOStPOCtMNGpnOERha1lJSGdGcm1VTlpVVTNpUm5B?=
 =?utf-8?B?Y3R5N3loMURobTd6b3daZ0haM2VvK0xiYzJ3anFYcWNhL3JneXlFSzhyRVgy?=
 =?utf-8?B?V1pUN2lJMkhPcWJ4L3JyQTB5VVd5czhPbHdscUNhRFk0aGhudHVqMUY0T1R5?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943f2fe3-b942-4c0a-ff66-08de3ee9ccaa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 10:31:41.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WJ/VffnywA76LjYpSsf7L/pVM4aApdMuxUXSgfS9NtcOFXv0VucqSD7OvBWp4haP7awlZwxgzXiy+Td6HqiTsAQjX2RX12QZEdYUtrGXOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3sJILk7QZ6sPbLjquzg4vedjZByJnbrn
X-Authority-Analysis: v=2.4 cv=Qbdrf8bv c=1 sm=1 tr=0 ts=69452990 cx=c_pps
 a=XYxO6LlR7Df2C67LKP0s0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=T0LHDNxguRApsiA5NxMA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: J8xFk4kJSZRJtDRcVAODL6mg1U74VSjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NiBTYWx0ZWRfX6hcXT8aeRKbK
 ZAJh1rwNnYi4Ns1qLjiqaj+HyL144idiVXawKeowdY+kmQA1ujk1kmOiWbgfOAJquy4U5ow7oFJ
 J0asl1AcpwH2EpqOiZ4rLTCDwOR/UlAhaXihoYSF4dk8dx+dSe3QWR5b6NHppngySko+bhKFVkf
 /+alg+IMD/zVQkikHek0ykxQt8NNUgRafzUREYKhDBujTQedI7F2EdRmpfY39d5vHAV01I9AGh/
 kf9saK1AOOKYwQjpZBSJ6qvWLuj1u1g0kuKDtB8kzkmrUHNcMHQF73iQdUusvPkgzW4oDfH9mgN
 D3ckH7v0Zj4T66tMXBci6U+a/5TDVFxDozkCkoPnsxz6ooYzM0ELwDq977Z6Sr7F34nEqtw9Dxx
 rpe4u+jt5sINTmq319gHbkgKwRYCq3sj1SnJtQiKJCZx4FvsCDoGZ6Wg/oO20NvmZKsfmSJAuKY
 RMTKDmKyaTe++A6rm8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 10:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228208

Hi, Khem

go is added by you in this commit:

https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb?id=14db3e42faf28b8157a04435ea74e86b5e7d440a

Could you help to double check this is necessary? Thanks

//Changqing

On 12/19/25 18:29, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> This is for fixing the following error of 'bitbake meta-go-toolchain'
> when multilib is enabled:
> Error: Transaction test error:
>    file /usr/bin/go conflicts between attempted installs of go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
>    file /usr/bin/gofmt conflicts between attempted installs of go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
>
> Package go only contains some tools, it is not needed to be installed
> into sdk, target go tools is not expected to be used in sdk.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
> index c03918acc8..52dba3d2ff 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
> @@ -3,7 +3,6 @@ SUMMARY = "Target packages for the Go SDK"
>   inherit packagegroup goarch
>   
>   RDEPENDS:${PN} = " \
> -    go \
>       go-runtime \
>       go-runtime-dev \
>   "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228207): https://lists.openembedded.org/g/openembedded-core/message/228207
> Mute This Topic: https://lists.openembedded.org/mt/116857356/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

