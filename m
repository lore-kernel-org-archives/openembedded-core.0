Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F6EC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:40:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11825.1788522012167202024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KgKmUvyb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3707c58deb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AJWaq415170
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 11:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=05CzPrI6gag2ZR2+/rtMO+7htTG2DvV/+D9lYZVebnA=; b=
	KgKmUvybklgS9Tb9g4UPViTdI8cwIJEWVYtsGHq/jVxbkS/wvx1W5xyJg6ygd189
	4vK0sBHvYmlE/11JR1a5n/w+CR4OOh2BLxqKmfkyt44fTDWpwGL99S6bbRXZnmC4
	RPDjnQ9YPerMtE//k951MqdRyALc7ibZ3JqrviD1LMuTP7/zlbzIo/TkenwTKTNM
	HwJSQEqX4ngEhwrYt8q86vbuv/19EE3Q68WbeGSB1BYX0G/vAxdgREk/1Sk7J/UU
	6LkYXubBmx5+F3dvHIXB0lpZzKJG3B0rmieO8Yon6bHjSgPRy6/Em7CYlqacqb+F
	851KrLE6RNEwIi6PZhuCiA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020094.outbound.protection.outlook.com [52.101.193.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5nyjamk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:40:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCkzMxzKQJRmIShzT4KFE01og9V2OgQ+Mr5BFnwE1ipGIUkuF0JCX7lq0wOHsht98v8Kns4IFSgyI05bze1enMCwYUIRso3dDH0Ok8hO5ZXIVYVwza9psNMvYear9U3HpPZvvPObslS0kZkBtmuz9lOhcOpIPh3oabsWIHVADsSXi8c1kRS6N+zv7R5dT7TJ/cwge1OrOWmcDpVf42nv72hYcxh+9+eB9/UXn2UpB88R4o612JqC2CsuF2BGkNMnzS2PEdAKnB3i65Hmh8MEbmsROFdhnRylYRjBitvAARm++mjZiqJQbrAAEtnUYovmxUVXkqOLSZbiBqWyEhBPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05CzPrI6gag2ZR2+/rtMO+7htTG2DvV/+D9lYZVebnA=;
 b=L8AUsPwUY/aXLS6kahYaXRIg21aS34WaqHpBtFInJPTQMCaEqhz3veS8/ogS1O6jY0o5nUIv+KLpqJ3q75bvUpkUgQsm1C+MmA3BllmHewWflHmOcfV7hGpbeDcMWophiWcYoZIhPsi0ETRyi0eRkkK7CwETZsVl02o6F1JAAMwYCElv59Ts+fbVyX/Dn8/i3ttPlTp0Vrfz7dMNJKO2Z8POAdUV6BDhUdm5LI1RXSpBcw/u0LPF9sOt8cjXa+xi9ZlsETilkq53cF5JKPdX6snq0NBSOFkZ9Y+Wq+81x624Xv2QveyKau2ytSnIFByB+R1FzNgorhOhn9t8mjCXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA3PR11MB9253.namprd11.prod.outlook.com (2603:10b6:208:571::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:40:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%5]) with mapi id 15.21.0360.006; Fri, 4 Sep 2026
 11:40:07 +0000
Message-ID: <ba9f25de-6240-4854-9ee4-83ebaa89de49@windriver.com>
Date: Fri, 4 Sep 2026 17:10:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH] kernel-yocto-rust: skip recipe for
 riscv64 when Rust support is enabled
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260811115855.4033577-1-Harish.Sadineni@windriver.com>
 <DL605KBROWS4.DZGC5ES0FPEB@smile.fr>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DL605KBROWS4.DZGC5ES0FPEB@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA3PR11MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: 871f05d5-3b7a-43ac-e825-08df0a7944a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|13003099007|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	2RZoyViSe6ocPz818HwVcVXjSDTVF3DZdc/gHMZWRvcpdyrVmR7YNQxsb/WD3ReRDn0KGtfGTUQ3MyjaxJEF3xc78+wSRCMx4WfpetDTrL+oYCduDGzVIFiDb9bTMQi2kbivOSNSDQwwAwwSrx25PrfHMG00/5B6K0fdnY4z/ddMvR9rLyfYtx+SUttvDq8paNkzvwTtxp8kZmOMQnFPBvB2e8AZ3z0eHaaEYahU5W3Gasxknw2BUqcaYdaXJEyPs83RED24UaLQ6mJfVTtXIJhU5Xp0kqBowWSFE3r8hUMUVbNjYx7Euznuv8EIvg+NUUsBKWybDp2KcOKUVFSoFmfrNk78JlDHN1ZvqidaeVzCIi3i1EnJrm7Ayg92X+JRudOyI2omSFUnlbc26Oj24bk3ccO6wRcfCYv5v0oTsSfvunp54+47GJus02kmwVlaRQhSjv2v6sDfBBmw/dtftCPAtkyRmqnpGCF1vP+7qLK62EsVG+lHAXhvn0AMXLdNh1NZCqBnOAkUA8BA37DuikZpqwd1ZrMs4ze6W9+xg3IaHRS1kcqRQ2e2J6vxT7jO/LYbbx9Syf+aJLaLC42u72AsolwfYF6KUtQ4zOYa/dU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(13003099007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDduVFFVSGlZb0d4aCtRZjRETXZlajcrdkF6L0I1UmR5ZnR2cVg3eUFReVB0?=
 =?utf-8?B?UWtIa3B5U3A2UVhPcndJUTJIZXBhU3R5Uk16dVNXN2UxTkYzZUZoYUp3K1lY?=
 =?utf-8?B?M1BmNnhxTXBDY3FkL0RUdHhHZjd6bFNxelVQNk9MQlEyeGRuVUpFbzdvSVNI?=
 =?utf-8?B?MU55bnpiQTVMbEd6bE9JSjZPeXFmUk9nbW1MakdjRDJ1MnUvUWJVQ0Raakpr?=
 =?utf-8?B?clNFcXR0SFBWNTZBMEdTNklPdUgvdTJPSmxla2FGV0ZFSzhIUW9RL3dhUTlV?=
 =?utf-8?B?KzJUbXY4RnNWVzMvT0QwUml6Mm5CYzFPUTh0elBodWFDSFM1NzhGRllOTjlx?=
 =?utf-8?B?NEd0VWdROXM5TVpSQ1dGalFFSDdaU2t3V1lUYjhWb2VsaU5obmR4V3plbEZY?=
 =?utf-8?B?MVlmWE80K0VBaXByUWdaeUhsdlNjMWE4aWhTZXY4OERzdUJqUXdiZ2VOZjlq?=
 =?utf-8?B?UFl6K2ozQjk5ajdJZjFJSFdBcWszeVNCV2NaT0tmSGd4WmZqcmZzT1l2Y3lH?=
 =?utf-8?B?TUR4VGd2UjhNZWgwY2s1cGxuUFhTQWMzb3BjYTZNU05pTmkrZ1hTQzk0VEFQ?=
 =?utf-8?B?dmJmbE41Vk5RSDdIaVNIODZZTGp2blhod3F6a1owY2tDazJoYVZtU3JwNHg4?=
 =?utf-8?B?MC9ubGxXaUNOdFg4MFlURlArL1Y5MFg1VXp2SnpRTWdZREFyL0oreExoMzRp?=
 =?utf-8?B?dCtwQVVJOFZWMldQNmdyRk1HLzZxNlFIcUltZ2puQjJYWkRXMzVKclhnNjFi?=
 =?utf-8?B?WUNkM3FTM3FMR201USs0S3ZRNmVSNUFpQU0ya1IyUmJHeUd1UFQ4SWdsKzVw?=
 =?utf-8?B?Z21ob0hodmQ2bkdYZGN6cG10V0k0Q1N5bDZNKyszeHJsT1V4Sm9MdSsvaGUz?=
 =?utf-8?B?Yml5b25lVEFDWjV6Q2ZmUVlEV1lhMWZoUGl2VEo3Z0cyaDI5ckpWY29WQXNM?=
 =?utf-8?B?ZVA4eVByQS9Fd0g0djM2RVQ3ZTBYY1VqdUEvSGlHN1ZsYzBVQXQ1T3Z3b3Bz?=
 =?utf-8?B?T3pnemx6eEd0OEpHVkZrZlRDMkthazQ4Zkt4ZEpiQXBXY25uVDluVThiZ0FS?=
 =?utf-8?B?Si8rNDN6VjdmSG9LYVNrMlJaanF1NW5QV1doS3FuOXJQbm1xNkEzNUg3eEhJ?=
 =?utf-8?B?SWlMdHVkcjh3SlhoSzZLL2k1WU96R04xU3VxYkFUN0lKQUdiNU1lMkQ3M3BB?=
 =?utf-8?B?S09SSksyUkNYdzh5SFNYWDRLSHJIQkdpN3JBY0FtMVRNOXdQZWg4TFBQcmZ2?=
 =?utf-8?B?WFBCVkpodnQyQitUaGlsL2FNcXZ0TWswalkzT2ZPbmJVTWtrbWJIQzRIZzJT?=
 =?utf-8?B?dS8vdDZRSG9jcXBMWjV5SHd4empmd0szMVZLeWVEZTc2WFA5V3hJNWJJVURp?=
 =?utf-8?B?YTZvWUZkZjdQSk13L1ZkWjdKeW8zL05RbmlQa01hSDVpRnp4amN1dDBzU0xx?=
 =?utf-8?B?RW9ZTUEyZnVTR0I5bndhZHdXKzY5WVNrcUZhN1pWVmpvVUxkMjVKRGFBUnRS?=
 =?utf-8?B?WlVwVEZDNHdabk4vVkNJaCtSZzRaeTRiWTJscmdRNVRmWkM2ajZ2M3ZlNlQz?=
 =?utf-8?B?ajZKYUM1WlIzSmtzYjdmY1hib1BFaHZJdnplK3RwMUxQWFpHb1ZPa0FySWFr?=
 =?utf-8?B?YXNrK2x4b09NcXdjQ3BPcExmMG5PdkJhRHl4QkMyYW1DR1BsRVBXNkFJamxN?=
 =?utf-8?B?N2pJVldYR2FVOWt6aEwyRkxZVTdrQVRSSFdSZWFsT1kvNFk2Q1FBMlBtVDM1?=
 =?utf-8?B?VEtEbHd0VWI4UVVsbXp2NEx3dHRXVE1ia3krUlpsWkdnT0VDY3czNzcyVE51?=
 =?utf-8?B?RXFqZGFkREZyK0hEMjFSOS9kYnk4NW5oTlpmNDN4LzdVcWwyOStrM1Q2cFM2?=
 =?utf-8?B?U09iSEQ4YmZGdkplOVFTTWI3MkJBR254cnJQM1pVdWV4TGs1VVNLcENxN2xP?=
 =?utf-8?B?UEJyOFJkU2Jka2xCR0ltS05UYTErTFZPSWtUTy96c3R4bmRBVGRQemNIMGU5?=
 =?utf-8?B?UGZ1M3Zxbkg1dTBqYWRoL2tQcDUxeU1EK0pQWmRGYnYvdjcwWmFDb3ptaFcv?=
 =?utf-8?B?UnlxenpTaExoNlpVaG93cjFCeDRaNFoyQ28vR0wxWUdjSFpUV2Y4TkNOWXd6?=
 =?utf-8?B?N0d3VlVqdklzejZZT1RFMFVLeDB3NjZzMmpFUERlK1c3WGdLT0I0dmdPYmxG?=
 =?utf-8?B?NTg3WmV6d2wxTngyc1NaUjVWTjZhZS91MklRRDFMQjV2YTZOWHlDSHZHWnJl?=
 =?utf-8?B?NU5HRy9sYms2bjVTaXgzUElXN2NyTE41YU8zVytGTDkybk5jZHZzVE1NdWlQ?=
 =?utf-8?B?ckZDdERBNko1NEdDNFFtSzQyOHlVeU01dm9SdnA3eXc5cmtvaDJFVy9wWStp?=
 =?utf-8?Q?W26zwfO1Q/og9+EE=3D?=
X-Exchange-RoutingPolicyChecked: 
	eHmdL3OSqL61VSU1xfMrMq5OxHxOH7IBq+DvVrMEAbaIIOGR53Hg8SKoUglcb7NQDY4BuFynQsgfVrRF2Vi6MxVDotPQS5k77IR2ED+6flO66qoOeUMz9tK9uszUBt+D8vqlCu/yMOdyCFi92vc4brherAJ7utwjVpxkoMigxkIeNbRcbg6dJzD4xRN9/0O5To7NqShjFzMPBXyn7hRnB0FpwdgWSfTZuiq8jDytH7y2i3QPey2gqbdgpp/8iry8h8KYjlAJtz99KOV0UBhUcb7megGXrAlv4CBgwFRkxMPrTWompwQLRkqderLEJpeAKdRPikJm/b5m+MSUNOJx5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871f05d5-3b7a-43ac-e825-08df0a7944a7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:40:07.0759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEU9SKL05jwD1To+gMz1xQevV4JwHZIuQSAropMIUExQ5PPVnST58hJmvOVmpHEewBRHNyjVWBE30pjVLNDvuG+919E03gHEMObQiacp2+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9253
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: XKJe4hyYFzm4R1jEVca-7vg2XiPpw4jr
X-Authority-Analysis: v=2.4 cv=LvuiDHdc c=1 sm=1 tr=0 ts=6a9aae1a cx=c_pps
 a=R0VBx4CaF46Y8RBs4q2Lkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=VzLtzqT8AAAA:20 a=Q4-j1AaZAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=RSAcSJ8HTIuc__QHzRYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEwNSBTYWx0ZWRfX2XZBV9FN79v6
 pToV0UmLDYToRkoHBxKma0SyC5jchMFI6go8vlzNOdJBf7WoAGUyWNMq6MrHs+kHzLIkefaESjk
 6GrApIWIamC/qBVNGRQ2YjEUD0k3HwPrbKncAOWrR6X0sN0RSqu8J1UYQinWn1X7fHxkqNCLiIR
 fDnXHkOdgwLhxAzO5dcy+ta1LYKIZHwVGV6IFcedBAszBcD3vM8FxAf58RZ+Ml1hlLitN6CpvNg
 Vr4GkiNCg/EeWlRkiMfU7Y665SPGucQk4e7LloBL27KEw85f1ADwbCTOGzl3BgYG95fr32+/Fpc
 zhhpLtMyZZikFxOIhNfiCM2JmNbrzT3z9N3qyGv1wrAWuiepi/8pMBd5unXFki/1oMea4DDvaVX
 ivav09P79htB9aDBV6bEVtJrFZtskO7RozZeKS0XDbtgtE9kauL2wusAqVW27kJp8guPvshOEW7
 LPTwP0YNBmTmsRgWSqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEwNSBTYWx0ZWRfXxFHqqxy/iWN7
 YTXAwb4twSrxVuxBWyt5qPrYQaw4ls5+sAKfnBVFwaUGIzqhu/SMH7TjZE7QTQA6Mso2QAzirI5
 XLuQRSR5xR3mJA75xhyWyxN7MFCjqzxZPney2qeM2Lfo+2t2rNvM
X-Proofpoint-GUID: L-u4WppSEgXez3Ro7309YDWFWSYhHf4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 11:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245090


On 04-09-2026 03:04 am, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Aug 11, 2026 at 1:58 PM CEST, Harish via lists.openembedded.org Sadineni wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> Kernel Rust support on riscv64 requires building the kernel with Clang.
>> Since Wrynose does not provide Clang toolchian support for kernel
>> builds, skip the recipe when TARGET_ARCH is riscv64.
> Hello,
>
> OE-Core/wrynose indeed does not but meta-clang seem to do that:
> https://github.com/kraj/meta-clang/blob/wrynose/conf/nonclangable.conf#L369
>
> Wouldn't this patch needlessly prevent user from using meta-clang to get
> a RISCV rust-enabled kernel?
>
> I wonder if we need a patch more like master's:
> 2b228490b7e (kernel-yocto-rust: Add clang toolchain check for riscv64, 2026-08-05)
>
> What do you think?
Hi Yoann,

I understood what you meant, If someone uses 'linux-yocto_%.bbappend' to 
build the kernel with the clang toolchain [1],
this patch would prevent them from using rust in the kernel. Is my 
understanding correct?

If so, I'll implement the same clang toolchain check as 
'kernel-yocto-rust: Add clang toolchain check for riscv64' for wrynose,
and just adjust the error message accordingly.

[1]https://github.com/kraj/meta-clang/blob/wrynose/README.md#kernel-build-with-clang

<https://github.com/kraj/meta-clang/blob/wrynose/README.md#kernel-build-with-clang>Thanks,
harish
>> This avoids attempting an unsupported kernel Rust build and provides a
>> clear parse-time error explaining the limitation.
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/classes-recipe/kernel-yocto-rust.bbclass | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
>> index 49f2bfc1ae..6be97c2db8 100644
>> --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
>> +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
>> @@ -25,3 +25,12 @@ do_kernel_configme:append () {
>>   # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
>>   # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
>>   CCACHE_DISABLE ?= "1"
>> +
>> +python () {
>> +    if d.getVar('TARGET_ARCH') == 'riscv64' :
>> +        raise bb.parse.SkipRecipe(
>> +            "Rust support in the kernel on riscv64 requires kernel to build with clang, "
>> +            "Wrynose doesn't have clang toolchain support for kernel. See "
>> +            "https://docs.kernel.org/rust/arch-support.html for details."
>> +        )
>> +}
> Regards,
> --
> Yoann Congal
> Smile ECS

