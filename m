Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3EFE77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:34:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43903.1736415263570648822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 01:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31047a590b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098MmnS019564
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 09:34:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fv3sj96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:34:22 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5099YLAv025356;
	Thu, 9 Jan 2025 09:34:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fv3sj95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:34:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yz5tGrKxXTtJPfJBfJkFmVy+/39VOCqgSWloNMiqIGzQWhjDMYcGAbvW65f3JMPVy8/BjqlhaMPSALc7PveSAvNLiIEKeC4/frHIHPiFXiwVsntKitR8M33Ch8AEQyJ64gMeT+To89azMAfTiSYBX3aTG9STrkQxL50ZBzIEsqBm3OGZ1KqoggdadwKMGM+5Tm76Xb6SM0RkLgf9WGEk1n6/ZmeTTg5MMziplXYYwWA+UVkAl5fbQBJq8FL+3gw1DIHo8hF47UuPmJvCVkGiWOn33pnDErqkibSnsXZUq4PBXviOn2IQU/cubSNbxYVewJ9w6jBSY78ymaXeqDiNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyuHfEVjGGGnBPQ7r5B0N2APdmLnmPTyziyo0nAqS5A=;
 b=ydHDPqpdg9Offy7Q3axlm2sdVII48eGh+gd4mrP4u2U0ia1qxTkoBxAfFLkWHHbRfyjNG5UjmQlvgffsPrBRWsMsmFcK5AL3UaaEUl34xh7i0DjA4PApAslAIFDODSMG5rqbHyLW3xCoZiaXyhqktE7ZlagdRbitsX1Il+AQSwi+k4+q96BVjxQtbCHat4EzT8L5VPOy8XjS8J4I0yz6WCrj74dRfFnKjdds/vM3ba9vSxgLotIhfFk5xCvL3u3nX6KfwE7DmxL9JTnITFdmdYEnv++xfqIFq2Yv+Z7gp0QTJ5XA0kwcVABZZg4dKUfKs6Lw+2VePOeQH+MQOalfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Thu, 9 Jan
 2025 09:34:19 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 09:34:19 +0000
Content-Type: multipart/alternative;
 boundary="------------qK3EwTioXiJHWIH2a3Hb43cc"
Message-ID: <bbe79a18-0e94-44ae-81a6-bd8088f84da8@windriver.com>
Date: Thu, 9 Jan 2025 15:04:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: Fix for duplicate libstd.so
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
 <20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: b7afb2f6-c634-49dc-3386-08dd3090ca9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TmpkNU1ra1JtQkcxUSt1Sm9XaXI1UEF4aHhMbGZOOVYybkpMOWcrYTVKZTE2?=
 =?utf-8?B?TEVNUVlHZys3TDI0ZVpoNktwazlJeEIwVUw5WGpZREhNUUJDajAxN2xLMURF?=
 =?utf-8?B?V1lFTURkK3lWOUtqdlVFZkU0Zm9MVmUwd25McGtWeHEyZXI5ck1FQXNUV2do?=
 =?utf-8?B?VStzQjFUaGl3RStaemF3TDlTVERleDROWnlMQnhzL0xBcy92ZHZpZG50Sk1n?=
 =?utf-8?B?bDQyUG9EN3RNQ211Q2VzbjIvQnFJVEpFOGxkV0JvWUQzTXRSRCsvakF0QTVo?=
 =?utf-8?B?ZmxXM3V2OXR6OWlUbldUeUlOT3JlSXBsSktxRXE3VUFNWGswK1BiN1BFQlV3?=
 =?utf-8?B?eWdtdnR4ZVZKamJ5bDA5OWxvWEFkVTJtbXRES1ZlRlhpc3NYK3hQQkxqbjRm?=
 =?utf-8?B?RUd3NS8zWXhBNFczZXRYaUI3YWVpVlVnUkJzbWdJdDJDQmZscVBoT2ExbzJ0?=
 =?utf-8?B?WWVFRUFFUVpHUzgxNFJHdnRFMHl5aDNOQnpVMVlVZE9PVGM3d1VtNytKK1dq?=
 =?utf-8?B?azFkc0Q1UVNsSXRwS2JVc3JrbTdDK3FzMlVUTXN2TTdqQWlpUXNpOWFYZlAz?=
 =?utf-8?B?bitwdTZ0V1dYVGRpa1FWOElxOFhNUDIyLzUyVnJpUkpvRE56V29RWVJIaDBG?=
 =?utf-8?B?Z2FIOEYyeVY5VWw1akliZGl6UEpIdGc5VjU5RlNJWkR1a1FGSE8wdXBlMFpy?=
 =?utf-8?B?TDJYVkVtVlZrRFFBdHlZb1dZVkJlb3hDMTRGMTRYaVZuL25GeWFMTDEwa3Z1?=
 =?utf-8?B?Mks5UGFjeG0yajd3WlBUakllUTV3VGlvV2hoSGpUVEU2MjhpMDE4ZEJ2bE1P?=
 =?utf-8?B?M25SZFk3TDBFblNnYjduK01ySmZYVDdiOXR6bkxId00xRVJGQk56WStIRmpq?=
 =?utf-8?B?bFR5b2hoS2VTYnN3cndHbkRlSURVdFBrQmpLV2o4b3g0M21MOGc4VzRrOExt?=
 =?utf-8?B?NGFmQ1lzaSswaDl2QytZNzdKUG9oRVl1UllTYU5pamdxZFllSGQ5OWYvcnFo?=
 =?utf-8?B?WlBSRG5KU2lGZXRJdS93MEdCM2xRSVp3R2x4NnlyWjdodUpNY3hzYzlEdTNL?=
 =?utf-8?B?Q2hUdW9NQ2Y0RlhLNGRMQ2NXZ1A4WW9vTENBKzVhWU5iSXFJSlBvZ3dsVUJk?=
 =?utf-8?B?SzJkWHRnYTF3dHIrUDU3NkJFL2R5Uk4zMEw1cS8xcG44VzRxcVBMenI1dVNh?=
 =?utf-8?B?amtkL2YrWnp6dXRTUUZxM09qazNmZVlyaC9Rc1RRU1NpRURNRUlJaUQ3ZWhj?=
 =?utf-8?B?L0N6TDBzNTVNNitRdzZTVCtrdWtlMUhodGs2Y3dCbjJOUHQ4SUQ2ejFRZW14?=
 =?utf-8?B?cnUrYkV0cGcxV3g4WTg0d2dXblpNbXJqdzcvOUV2bGx6ZWoyVzlYNUZzNW9Z?=
 =?utf-8?B?Q1ZtdlZSb0lFeXZEZEZwRjBrT1VxQkJVMGJOd3hObEg1R3owbVp5aFJYaWEz?=
 =?utf-8?B?eG53WUVNOHdLaHNYQnZOUDhzM3VodFpaUVRlQnBsS1BkOENPaGlNM3NSR2M0?=
 =?utf-8?B?MnZlUkpxYXNrTUV3bVJhYUF6aktNekovVXAyU0dOTTRnVkJkVmkvd1VrTkY1?=
 =?utf-8?B?czF5dUVEMTBmUHV3ajFLQTRrdVdUNUo4NUtzMW8zKzVxd1RPQUR2bjcxV3di?=
 =?utf-8?B?SFdhcHBsL1J3VEZ1RGpoZzB3OUJFNk1yOFUrWG44MSs5TURtQVBGMm05Nk5m?=
 =?utf-8?B?YkxnT1plTTBnQkZoVVArZkk0Sm1yam1aTERaZkluWHd4NGx6eTVUakY2ejR4?=
 =?utf-8?Q?S1kFwFQrYWn6ofZDdaYmbGqyn3ronQt7IYirzSi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ajUzSmh0dGZockJ3Z2thcGxxOU9FL0pYVk9nV21zcTBQbi9rb1NZRXlPVFlO?=
 =?utf-8?B?OUJRZGpFc1ZZajZueFBFVjVtRWRhb0hxWkNxdUxkYWRLbDVSTnk0OE03amlO?=
 =?utf-8?B?VkptVU9UZThQaElJYTdFTG9tdEdXOEdyaFQ5TUlhUFFTVnluZU4vZUZJYTJS?=
 =?utf-8?B?QzRWU1JralE1SGpud3VWVVdXbllNUmVqT2pHUFc5UXh2RkRaOGtqbnhwYXJZ?=
 =?utf-8?B?YStxK0JJeUdGYWMwL2FDZitncTJmZjNNTFdxQnRHSGZJMVZqUkVwN2JxZ0kr?=
 =?utf-8?B?VWh2V0REQlI4NmpjbVp0MjJvdms3eFA4SHB1aGlGaHBVeHcrZ1I4ckdrUzVi?=
 =?utf-8?B?TDBKUW9oZVgrbGNJV0RxdVVFZjEyZHFsOSt3RTZ5VkcwdWJ2eTRCRG5TMm1i?=
 =?utf-8?B?VkgwWHVyV09YSlg5d0dtV0xWQTB4ZENJbnRwN1g4dS92eW1VTldpMWpiRjlT?=
 =?utf-8?B?ZXJ0SmQ2azN4VTZnS0FhLy9YOWtBQytXYjdHdjd5T1FhSG5ZSjQwVVVZN0Vi?=
 =?utf-8?B?OGJsTEI5eTF5Wm5iMHVUYWEvc2FBZitwUjUrV3lxMFo1aHZNRld2N0tzTUZ6?=
 =?utf-8?B?QU9RcDBsenN5SDBvcHlSSklOR0g2UnJsWWdrZTZ1aGtXUDd5RXNncmVxcUNj?=
 =?utf-8?B?dTBKZEl3L1M2NFBJZkI4ZTZEaVBMSy9PTFJXQi92SjR2MkZlYVZhRWkycUdp?=
 =?utf-8?B?MFNkZVFjMzh2RUdYalk4TXZMeEdxalZwanNXaFYzWlBsSG9pdGhmdDhtOXR5?=
 =?utf-8?B?RjAxTUhuRDNqS3R2ajBpdmd3WjVGdVhlc2FMdEpYeXUxbTYyQXJsOVZNSHhL?=
 =?utf-8?B?R2FPZkV2a0F3MmZEeUhHWVlURmp2NW1IbWdOakY3U0ZQTlcwdnlEYklyOWxx?=
 =?utf-8?B?OUxYcUpBMVloWGNwWENKZVdxRlN0VExLbGZiOTB4a1Z5cEJaZ1UrTDZ3Yno5?=
 =?utf-8?B?N280UTN1aUhBbFRZYVE1bUVoemFLZVFGK3pNRHBuOU10a1JRTS9ydG9LQjhz?=
 =?utf-8?B?U01NNndFR0lWYXpNc0Qzc1JtdklNaW1SK2p3LzgwaUx4WDRKcGJXVnk1WElz?=
 =?utf-8?B?L3I4Vk83Nk0xVGpka2JBRFpVRi9UUlJBT2l3bEtLVGhnNHFVcG1BRlAvdWw3?=
 =?utf-8?B?Mk50V05WUklQWGNjaW8rdVprTnYrR2YzclZZMWlLSXkzNG4zSTNmQ216Z204?=
 =?utf-8?B?cnJ0WllTQ2o3ODQ3SFQrRHAxbzZpMmJGZU5uSEtkRisxc25ad1lsMGhCMytB?=
 =?utf-8?B?UmZYM0NVdlNTbzZoUmZvckpMLzdHcDJkYnMwYW1HMlRickwrT2lqWnVIQ2Zk?=
 =?utf-8?B?UitMWXVPWHgvaWZPRGhvdWhDSXNXd2xuaDU4T1dLQ0N6cHhhQy9kTmlkOTFj?=
 =?utf-8?B?TVpxWWRvSnJFeGlGSnViekJidEd5RkxPNVBvTldoM3BXQS9UUUYyaVA5QWJB?=
 =?utf-8?B?c1crcHI4em95Z0UzTTVTZnFIV3daNGV0MmRJV3pDVkNIdytvS0gvRzVBUnZt?=
 =?utf-8?B?Umk0ZzZ5NzVxNG90VVAzclJWK0NSODRhdHVaRHgzZmRXTVlEbW02bEpxVTVW?=
 =?utf-8?B?aDFkZHhMa3NmMmxyQmpsQUpnaGdJMmFhV3ZGT00wdHA3Y0hzQ2o4MldmWjNl?=
 =?utf-8?B?SkVMOXl0WjkzRC8vd1ZRYWpRUmVZVUZWUFl5RkZiS3VnN01YRDgrVG92RUs1?=
 =?utf-8?B?TnVsVFB3c25JSmFpREFRa0o3alloOFhHZE1Ib0p3Tkl4WFZuT0xnd1ZZdmFS?=
 =?utf-8?B?K1dFZ3NLY3lpcUdqSCtXWFFZWHErWWh6Wk5hNXVNUEFHMU9xQjRPV3pWYktT?=
 =?utf-8?B?V1dOakJPdXhYSmJCVHFwN1Izak9SMU1INEg0MVU1UjlWZ1prbTA4MnBZanFh?=
 =?utf-8?B?ZnJjck5JQzBlZkNCSW5iRENQclVQVEpHWmtnWkYvL1ZXU3JjbFRLbjJMRWFz?=
 =?utf-8?B?TmViUFNUem1xQVcxYVlKNG9NazNCM1h4TEJuVjhhNSt5RDRrRFdPeitTUG9z?=
 =?utf-8?B?SWdhdWRVQ0VMSUsrVXYybWMwTHk4THVXRUZ3aW9OV0k4bFFaL0FUa3VibDJa?=
 =?utf-8?B?dFc0Z2hBeWRMT1paZkdoNWx4TlB3Vk9jNUo3R0lYTzcwTE5KR0pZMHVpRzAx?=
 =?utf-8?B?d05acFVLU24vdkkvd3JnSW1nSWtjOEhrQW40Tm5oc052UHJraDBjRHNIY0U1?=
 =?utf-8?Q?pQJv987jn51jIe4Ea8FD4Lo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7afb2f6-c634-49dc-3386-08dd3090ca9a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:34:18.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH3p3C5/AI1ilE9pz/LMxV+mwaVeoldUp0xg2oXjHddLQdFVs5Su4wuwI5xCRmizfP2Qoa1YXIDss9yv8m31neG5T4s7sZTtFIgcc3wIflCYWr3Q7A5lDcpzL68kQEbq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-Proofpoint-GUID: 8eY1jp5WpbfClweOsLYqU9KGxkL7XmAY
X-Authority-Analysis: v=2.4 cv=NIUv+16g c=1 sm=1 tr=0 ts=677f981e cx=c_pps a=PdgAl9AEy1hEU2ikvxmBtw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=kGOnjv2drARvhHCg59MA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=2mSRNuGl8nca-0i0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: b8rJ6R8xLDuPTnCJDm7x-t3QWznPBUwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_03,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209620

--------------qK3EwTioXiJHWIH2a3Hb43cc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28-12-2024 00:26, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 27 Dec 2024 at 07:54, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>
>> The `do_package` task fail with below error due to multiple `libstd.so` files installed in lib dir.
>>
>> ---------------------------------------------------------------------------------------------------------------------------
>> ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
>> ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)
>> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
>> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/
>> librustc_driver-fc36770e343ef852.so)
>> ---------------------------------------------------------------------------------------------------------------------------
>>
>> To fix the redundant `libstd.so` files are removed from the usr/lib/.
> What installs the redundant files in the first place? Shouldn't it be
> adjusted to not do that?
During the Rust build process, multiple copies of libstd-*.so are 
generated, as Rust copies the
required files from the stage2 build artifacts to the target image 
directory. When these build
binaries are copied to the image, Yocto's do_package step encounters an 
error. To resolve this,
the redundant libstd-*.so files are removed during the do_install step.
> Also, as noted elsewhere, you cannot hardcode 'poky', or special-case
> based on TCLIBC.
Updated the patch
https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_3_rust_fix_for/110513058
> Alex
--------------qK3EwTioXiJHWIH2a3Hb43cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-12-2024 00:26, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 27 Dec 2024 at 07:54, Varatharajan, Deepesh via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:deepesh.varatharajan=windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
From: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

The `do_package` task fail with below error due to multiple `libstd.so` files installed in lib dir.

---------------------------------------------------------------------------------------------------------------------------
ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/
librustc_driver-fc36770e343ef852.so)
---------------------------------------------------------------------------------------------------------------------------

To fix the redundant `libstd.so` files are removed from the usr/lib/.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What installs the redundant files in the first place? Shouldn't it be
adjusted to not do that?
</pre>
    </blockquote>
    <span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">During the Rust build process, multiple copies of libstd-*.so are generated, as Rust copies the</span><br style="box-sizing: border-box; overflow-wrap: break-word !important; color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">required files from the stage2 build artifacts to the target image directory. When these build</span><br style="box-sizing: border-box; overflow-wrap: break-word !important; color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">binaries are copied to the image, Yocto's do_package step encounters an error. To resolve this,</span><br style="box-sizing: border-box; overflow-wrap: break-word !important; color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span style="color: rgb(222, 226, 230); font-family: system-ui, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(36, 37, 38); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">the redundant libstd-*.so files are removed during the do_install step.</span>
    <blockquote type="cite" cite="mid:CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Also, as noted elsewhere, you cannot hardcode 'poky', or special-case
based on TCLIBC.
</pre>
    </blockquote>
    Updated the patch<br>
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_3_rust_fix_for/110513058">https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_3_rust_fix_for/110513058</a><br>
    <blockquote type="cite" cite="mid:CANNYZj-8a-wb6PUbqm=6MUj6jUVWJYcwcZ6X_TbkDkH9s1Q8DA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
    </blockquote>
  </body>
</html>

--------------qK3EwTioXiJHWIH2a3Hb43cc--

