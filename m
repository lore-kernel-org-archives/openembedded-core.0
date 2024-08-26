Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB21C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 08:51:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48307.1724662301026803863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 01:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89689f30da=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q5OcJj008971
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:51:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4176g8smaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:51:40 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47Q8pdtE019353;
	Mon, 26 Aug 2024 08:51:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4176g8sma8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 08:51:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQQ7hR3tcvRxHBKbd1FzH4Sp1J8Hkuo5GHL7Kvk4IjfwlGbxEl4GVxY+A/VdCZ/zUUoPOAp47lZj1Um2NS1OtRh/K4PTNmKEK3Uy0m8N9TCo9RHrHw9L1RwTtPm6yxroRGghG+gH9noPZ5hqU/I7RRYlm/VyBHPkBnI7xdLOMJvzkUsOud4ocGqI3kVes2dZC6RCgLd64PZPL/ZALC3vnQO00rfzLnyFabDOLs1YgWmHoOkeXdEPx+9kakfziP3NZcK4P5FYgZZswetgY+16tsNPcHl01FloU+ILyxjfiI1u6zXeg4ZTXzQ0vIzO46ugbrlnXD66biQI1qlkNW0goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzEhr668CD3wwUKyD270/LvDHfa3NL9BKDts3JqwAqA=;
 b=YfXwnwxEV4t/qx9wN/cArXfbbUmPILqcdcx6vhhZDHK8p7T3w0kXKLZy2p+X95VHYJy1bjIau81begLV4IMsKOPVIeNh7GMVcWjxTlWyOarCtQiO+cdA2WHmINgNZBuBwE1D7/XL3BSyhCxFWdmkbwlE0zfEAWPxrMya6prhgZ/Gofih4F1bsg2ArkxPPHRvXy5sq+6YEttKzojrwYdP/G2yqtkVkVaY7a82QWtXa0t8CwjZrtEEU/3DiKiZTHS+hrfBhPMmEYxcw1lHnC4kjTXLnii39S3i6iZHW9BrR7TUlbD8odJb88RcQ21t1hm8BfKMZfmeupZmbFvBsraRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 08:51:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:51:36 +0000
Content-Type: multipart/alternative;
 boundary="------------PpHj5YN9aBKydUD550NeX3Da"
Message-ID: <0b99cfce-0e15-4a0e-ac04-4bcdcf1054e3@windriver.com>
Date: Mon, 26 Aug 2024 16:51:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] VOLATILE_TMP_DIR: Extend to specify the
 persistence of /var/tmp
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        changqing.li@eng.windriver.com,
        openembedded-core@lists.openembedded.org
Cc: "Qi.Chen" <Qi.Chen@windriver.com>
References: <20240530090243.3927412-1-changqing.li@windriver.com>
 <7da981cc3652bd5ff14b288e1a7ecfbb56365661.camel@linuxfoundation.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <7da981cc3652bd5ff14b288e1a7ecfbb56365661.camel@linuxfoundation.org>
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW3PR11MB4698:EE_
X-MS-Office365-Filtering-Correlation-Id: bedb0c5d-5e1a-431b-eeea-08dcc5ac4a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFE0TTczYlNaUUJ2UnBCL3h2YVoxY0VsQUlHOXU2SVRTM0dHVE4rTk5tYjlX?=
 =?utf-8?B?OXc2YjhtZ2JYS2tXRUxuNkpDbVhLYlArWGJjWGIrTU83WndWTWZab0xLNWp2?=
 =?utf-8?B?NERUeU5VV3RqWU5Tak04OXF6djNSMldHSXNCZ0wyVTk3TEhNK05uTUt1dStJ?=
 =?utf-8?B?WWZHYW45ZGJyZFVSVTIwL09NNWIreXhjdXR3STBZdWZDQUZpK1JUWFZDeCtm?=
 =?utf-8?B?OXRKNFJuNHNXUytIZWV4dGVxQ3FPZVlBKy9KQ1dObVJFSlZzcUJxaHJMcW5r?=
 =?utf-8?B?eHZZODNzMTdtMzJ4U1oraFFyNUNUeUJwRUxTN2h5NzBRSmx2MlkwSU9VNXQ5?=
 =?utf-8?B?TlhuQ3dLVmMxYWUwcFRySlM5b2FnenZzbkUrRU14ZnZFOFkrSUdyKzgveDdW?=
 =?utf-8?B?a3pOUWdNZjVveFc0blgwempPT3VuV2gzY0RtS1RQNGE0TTRGUlk3dTdGVUF1?=
 =?utf-8?B?R0V0ZkZMMklWQnN0bXg2N3BWeUljRWJqZVhFT3FxK3UybGVVYjdOM09JVlor?=
 =?utf-8?B?TmZJQjdwazBkckxUYW9WcTVMbzI2M0ROREtmQS9BZFp0QzhEd29yc29zVCsx?=
 =?utf-8?B?ZVNlc1d5U2ZJRXhFdVcxN00xMGdYNk5KOHNWaG9uTnRadzZiQzJBRnBJVEdL?=
 =?utf-8?B?ZUd0VG56aE5qdGlvRk9PbksvZmVQNFhqU0hJT3l3MkFST0dnM29Kb2dFQjdF?=
 =?utf-8?B?alk3M1dmakJaTzRNNVJqYzhxdVdYOWROalIyTE5HdHZUakFBMWpva2NLVWR5?=
 =?utf-8?B?a2daZjFUb3J1MWlHRlJLWGxidG8rcGs5NGdDVmVTL0gxTW1FdFZpNjJsQ1lB?=
 =?utf-8?B?NXYvV2RTeExnanh5MzFjd3VCWVNReGZYU2pzS01nb2lReUNxVW9lbXpTdmlP?=
 =?utf-8?B?Y0hTUXhiRC9aYkVtNUxrTFBTQjk5RFRKeGlmSHJkRC9DWWVESExxekRFMlow?=
 =?utf-8?B?Vk5UWnRxdUJ6RTloYTJsSm5weWNoNE9tNm1iYitqWU95OVR4aGZVeG9UTVE5?=
 =?utf-8?B?a3JFTHcra255eFExeXlCdUdLb3pmTkxVOS9tYXd5bGxHSnFKcXZKa2wrT0JI?=
 =?utf-8?B?dEIwS2dZVkVsb05UcjE1R2hVaFB4MmhSZ1VYTjVVbm5pc1dvck5xeG8zNlNs?=
 =?utf-8?B?VjdlRWxsTU1NdWZlTFFvTHorWkdaYzBlTjZqSzFiSEZKakx2ZmhlNVBrSVpI?=
 =?utf-8?B?OUtwS0RNeXBqb0lOVzhBZ2lPZjI3NEdzcnpYRy9oWHBiNHFsZjdCazM3Mm1W?=
 =?utf-8?B?V3MxOXRNa0owbHM3dXVQTUxPTnZrNWZWNFplTEV6SmJFVWtvUko3QU4yZEMv?=
 =?utf-8?B?OU41YmJnVHJLTi9wWEZkUDFhM2hWNi9vMllKdDRnWE9pOC91S1hhVDU3S3JY?=
 =?utf-8?B?NWN3TUJOUCt3UXAvWTArT1h0RVltUlJUekRzdFAwVFNPc1VQQk1BeU8wRDg1?=
 =?utf-8?B?OEZra0ZEb0l5Y2pvOXgzdS9GU0ZQeWNZQnJFYjZORUZnc1ZhdVk1bW1zZURF?=
 =?utf-8?B?bHpXZGgyYjRBRm5HNm1nWWNQU2t5UTNyQW5ld2lqR0hTbmVuZ01pbEF4Ukps?=
 =?utf-8?B?SDEwYTdsOGV4S29KZ0FHMk5XK0dwOEZFNmo5SXBpTjZkNGpET051OG5XMTVi?=
 =?utf-8?B?UlZwM2ZNSUVueHFsVjdkMmRNblFqYTJSaVl4THc0YWszakcrQXNocnRsbFhC?=
 =?utf-8?B?ejVmQVMwdzBzemVlQlAzMDNPbmdrRHhWNVV4STNRR0V4am1jVWhzV0k0cVFF?=
 =?utf-8?B?V0Z6VmxVdnM4V3ViZSs5UDFsQmI2VnhpNFpMSHNiUEw1ZCswQnM2bHNTbDdr?=
 =?utf-8?B?NkFpY2hYZWpFczRvVmlRQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MU9VdXZ0SWVIUjAzaEIwZjNvdU5OUW1kUk1LMFM5U0VYc21QRkhzMlZaUGVH?=
 =?utf-8?B?S1ZxVkFTMkg2RTJ2dzJ3UWhURmF1SiswNlRZN0FMT0lvTDJmR0luMmJQRVRY?=
 =?utf-8?B?RWtndm5Lb0RhTDc1Q3VnQ2JwUUEzWmVnNmJVMEd0ZWk0V1hzM2ZvMHZ5Nm9F?=
 =?utf-8?B?STVZNFkwZnQvNnJ5UWJQUXlyQ01ZZVBXVUszYkhIN1FCS0VqYkE2MnlhTjZY?=
 =?utf-8?B?bHV5ZXVPQ0NlK2FicU9CampEaHE0NXJ3aGpINEkycU91c29oOFJpdGNKb2RW?=
 =?utf-8?B?ckdKcXRWZUVNeGhTTHFZVmRxN0JaLzMwSWxibmJaQkJ1TXpqZkZlcTgwMUpT?=
 =?utf-8?B?Q3JuTFdqcDRSejlxa3BaSmVMMTdYd2t0WGxPNG1hakxGK01VTEtabEFteEJW?=
 =?utf-8?B?bithb1RZL0ZUOWpZd1BFRFJSQ1c1YW10b1ZBdHRYTERvTm1HcjBVSXBGdHRF?=
 =?utf-8?B?QWtjZGgvUlJlWkV3eHQ4bm9pTTFyTkxGK1JDZFBNSlJsYlNpTXZ4bjlTUXJ3?=
 =?utf-8?B?WUlUbHVzUVU1MmFmSEhYRkg4ZjJWa2hSRm5tTi9HbERibEtuQmpKdzVLbjBU?=
 =?utf-8?B?OHRvOG5TRUdDQVR2M0tOV2M0b0JHekp1bFJPajFaeE01cW9sNlFJdllqNUh2?=
 =?utf-8?B?NUNjMTM1K3JWeDhPTkhOV29oTE8rcjF2Q3VqeHRxbWVaS1A3WWtwbW5aNlJ3?=
 =?utf-8?B?RG9jcEJhTGxvbUJuTzhLWlkxMXAzUGtVTG5JcTk1b3lDWlhNRk81QU13aUVt?=
 =?utf-8?B?b240QXJDMU9kYmNyY0t6MHpmbzNaVVRvMFVabmNmRkVWNUVYd3Q4d2pBZ1NB?=
 =?utf-8?B?RjlKN2ZSazhxeHZtZ0lvejFicGs2OXM3NWhJbUJ5dTRIY29nQWVvODJLSkk5?=
 =?utf-8?B?amFRNVdNdDB4VXMxZW9rV2t2ZDhLT29MZlpOV2JCYUk1aSt6WVVkREVCNWg5?=
 =?utf-8?B?V2E4bHZ3SWFLRHhqV2dtV0ljZjNIbzgwYzlKUUdRa3kxelBFektxaWwzZjBJ?=
 =?utf-8?B?V0d4RjBQTk5RRjRnb1BBaW5JOU8rZHp4YnVGSnpYSFdoVkxmVU1DMHhLN2Zz?=
 =?utf-8?B?OFJBcUhaaytzLzFyOWpTRDZVK2oxNkpCY0x6U1JmVmxPbkR1OVY0T2M4bURF?=
 =?utf-8?B?b2ViWDJ6d2VXMERBblV1ZFM4Rk1MbDQ1dkUrTXJUZ2dGUUVkM2JrNnk5RHc2?=
 =?utf-8?B?OVlWaUo2QWFxVlNRQTl5TCttdTAxK05FRm9CeU1PclBUUGY3QjR5dVNONnFa?=
 =?utf-8?B?MUVDeUtYOEpPekQyYWp3cGJVK0Vob3gwZTJaMWxEWDBQeDRMRTNudHlBOWZ0?=
 =?utf-8?B?UXRHNTBlbVI3MzIyU1ZLZHRocnZpN1R3STJSZzF6M005M2x6M0x2dUg2THFL?=
 =?utf-8?B?YXkybUJvN05HNjlCbmlQOVJWWVdBNXp4K1FJUXNpRXFReWJOeWZXSVNJK1NV?=
 =?utf-8?B?SEhoa3FTME5MVnJWYzZITzdtMUtQMkJMdjNKMXZ0dWZUT2dSQ2M2TG92WFo0?=
 =?utf-8?B?eFlLWEFiSHRIOWRNZEc3cjI5bVNZL09tYiswUENaVVNwMHBENmtOWVFzcGtF?=
 =?utf-8?B?OU1MUU4rS0orbW1yNktHWnRuSGFFcjZWWEZWUXVLbHIvdG1VdHI3bUhLY0U5?=
 =?utf-8?B?YnZCNUlieEVwMzlaUkcrekxDN1cyV3M0Z2Y3VXlnOS9wTExtMGhBYnZ1OWd6?=
 =?utf-8?B?V1cwWnlVc0hYZEJ2T04yZmlIN0N4cFhWQThJNmFnTGh1ZkpOSEJrZUt2czBx?=
 =?utf-8?B?OEN4WHlBYlIxajVxVG9RZzZTSGlBekdVcFpMRU5PaEhGd3lrYzUwclROL3NG?=
 =?utf-8?B?QlBSb2F2RnVOUXI1NEFzWGRCdTNwZmlYZXYwZVlSYjVaTytZdWJURWFjN0Ez?=
 =?utf-8?B?UVZjaVN5ZS9wZ2J4dE82aFVKcnhQbi9yZzNxNWdJNWR3QXJ5SHZmUkM2MUYr?=
 =?utf-8?B?QjVHUTFqcmYwZDh4Nmp5VHdOd3JwNENSYnRKbGhQK3VhTm91a3ZqQ1NyUm5i?=
 =?utf-8?B?RTg2TVdTVzBsMkxjRXduYW1qRTE3dU95QmdCUm5oeXd6dmZaclpxelM0QkdP?=
 =?utf-8?B?TzBuby8yU1RlbGNxNXpEQitjdTJkM0dKSDUrQWxqNmdySU5NUkd4emRPZDVl?=
 =?utf-8?B?MmNkN3FpdXdUL2o3dHdxanRTcUt1UmZvUkJHUCtST2RsSXBYdnF5NDBNdnVY?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bedb0c5d-5e1a-431b-eeea-08dcc5ac4a99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:51:35.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InkCL9MFJ3l/12q9rXp7OmpOVessjQWmXrAfaG6Lm9u/x8aSNwRRXQHRMjBA547ZNRydXG1raBvV7Yaf+rR5yaW/2yuuS4JNDigAR7VEuGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Authority-Analysis: v=2.4 cv=Gs4Q+V1C c=1 sm=1 tr=0 ts=66cc421c cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=MDc7rgqrMjFixTWXBUIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=kt83FnB3u0dMptfy:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: r2n0WR1gIjUyRxxIb4VnoTDmMNFucU_M
X-Proofpoint-ORIG-GUID: NhdJfdgZwa4R_kbuAeR3teGf2TwCVzj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_05,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408260069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203740

--------------PpHj5YN9aBKydUD550NeX3Da
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47Q5OcJj008971


On 8/24/24 00:15, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 2024-05-30 at 17:02 +0800, Changqing Li via lists.openembedded.=
org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Currently, set VOLATILE_TMP_DIR to "no", only make /tmp as persistent.
>> This patch extends VOLATILE_TMP_DIR to also specify the persistence of
>> /var/tmp by following changes:
>>
>> * change FILESYSTEM_PERMS_TABLES to remove symlink /var/tmp -> /var/vo=
latile/tmp
>>    for the packaging process
>> * update base-files to create /var/tmp as a dir not symlink to /var/vo=
latile/tmp
>>
>> Here is an use case:
>> Steps:
>> 1. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
>> 2. docker run -it --rm poky:latest /bin/sh
>> 3. /var/log /var/tmp are deadlinks, and cause "No such file or directo=
ry" errors
>>
>> Root cause:
>> By default, /var/tmp links to /var/volatile/tmp, and /var/volatile/tmp
>> usually created by initscript(sysV) or systemd-tmpfile.d(systemd) duri=
ng
>> boot up, but for container, initscript/systemd-tmpfile.d will not be
>> executed, so /var/volatile/tmp is not created.
>>
>> This patch provides an option for user want to use container, set
>> VOLATILE_TMP_DIR to "no" can resolve above case.
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> Sorry it has taken me so long to get to this. I agree we should try and
> fix the issues you raise here but I don't think the patch is quite the
> best way to do it. What I'd propose is that we keen the new fs-perms
> files you're creating but change the tables variable to simply be:
>
> FILESYSTEM_PERMS_TABLES ?=3D  " files/fs-perms.txt \
>                                files/fs-perms-volatile-log.txt \
>                                files/fs-perms-volatile-tmp.txt \
>                              "
>
> The other references can then simply work along the lines of:
>
> ${@bb.utils.contains("FILESYSTEM_PERMS_TABLES", "files/fs-perms-volatil=
e-log.txt", "log", "", d)}
>
> and we drop the VOLATILE_*_DIR variables.
>
> I'd suggest two patches, one separating out fs-perms-volatile-log.txt
> and the other adding fs-perms-volatile-tmp.txt.

ok,=C2=A0 I will send patches follow this comments.

Thanks

Changqing

>
> Cheers,
>
> Richard
>
--------------PpHj5YN9aBKydUD550NeX3Da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/24 00:15, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:7da981cc3652bd5ff14b288e1a7ecfbb56365661.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu, 2024-05-30 at 17:02 +0800, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Currently, set VOLATILE_TMP_DIR to &quot;no&quot;, only make /tmp as persistent.
This patch extends VOLATILE_TMP_DIR to also specify the persistence of
/var/tmp by following changes:

* change FILESYSTEM_PERMS_TABLES to remove symlink /var/tmp -&gt; /var/volatile/tmp
  for the packaging process
* update base-files to create /var/tmp as a dir not symlink to /var/volatile/tmp

Here is an use case:
Steps:
1. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
2. docker run -it --rm poky:latest /bin/sh
3. /var/log /var/tmp are deadlinks, and cause &quot;No such file or directory&quot; errors

Root cause:
By default, /var/tmp links to /var/volatile/tmp, and /var/volatile/tmp
usually created by initscript(sysV) or systemd-tmpfile.d(systemd) during
boot up, but for container, initscript/systemd-tmpfile.d will not be
executed, so /var/volatile/tmp is not created.

This patch provides an option for user want to use container, set
VOLATILE_TMP_DIR to &quot;no&quot; can resolve above case.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry it has taken me so long to get to this. I agree we should try and
fix the issues you raise here but I don't think the patch is quite the
best way to do it. What I'd propose is that we keen the new fs-perms
files you're creating but change the tables variable to simply be:

FILESYSTEM_PERMS_TABLES ?=  &quot; files/fs-perms.txt \
                              files/fs-perms-volatile-log.txt \
                              files/fs-perms-volatile-tmp.txt \
                            &quot;

The other references can then simply work along the lines of:

${@bb.utils.contains(&quot;FILESYSTEM_PERMS_TABLES&quot;, &quot;files/fs-perms-volatile-log.txt&quot;, &quot;log&quot;, &quot;&quot;, d)}

and we drop the VOLATILE_*_DIR variables.

I'd suggest two patches, one separating out fs-perms-volatile-log.txt
and the other adding fs-perms-volatile-tmp.txt.</pre>
    </blockquote>
    <p>ok,&nbsp; I will send patches follow this comments.</p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:7da981cc3652bd5ff14b288e1a7ecfbb56365661.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard

</pre>
    </blockquote>
  </body>
</html>

--------------PpHj5YN9aBKydUD550NeX3Da--

