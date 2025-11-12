Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66A0CCFA18
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 02:56:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3815.1762916172525442133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 18:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KbN6CMaQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34113e830e=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC0UYcV3047100
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 02:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yIoJJWO1Uo2XC22aZFGMvZ0azbBZ3CBAvfLPOYliL+M=; b=
	KbN6CMaQFr7im43Gn7Pxo0Mde/hxmpxB9ScYk9uh+l+9MwtfBg1pCwXAuT8Lborw
	hDS+ABmqChXEkTdo7dWuyu7sFa2qGv50na9OLhu4PVw6rT2UT0Vv7T6CndBIog/V
	uKNuwsTdPtKm8qPmPHj+c0W/JC29h2UT+988L84g7X+x2QxiZZmCXFvonC+uSQn6
	rPdNsbo0hcS6GPx1KfOKmDGcRsWgg5sWTBDZ2jfMTkApv9834iSD8pkNQ5E3zxSm
	M69eYnPEL435JcXX3qQlz0saNdnQvMowPoTmc3oB+IF3wx4tbIW6cjL9L8KhCJCc
	xJffVQc8KsCHDJUStE5gBQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x4er2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 02:56:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2OrNBDqfAOuqAoxFhmf1g73LPeoxhh8xiA7Fr5qZh4iv6wt/FOF1medGQjCAh6NX1MY6Pe79UgddoNP+ao8cVhs2Ty8D7p9baPOoicWg6CViuUBvvXctElJCuGfLYf7jJA4OwkjOKXoJGfIxt1xsbiHhU1KzQ8C9jgLP+BuwQ3ei6UU7rCL8bkPeSJZTbpqFCnY+UeP3YH7/qjexNLz0lmv0C7aiYUhantQJjSZ5Ck0oIl5fXpKVvQfKmcHX6MD5Vn4seB/7hpL8P8bOYg8+tYz1VCAvll4MPrlJOC9y7hZed7DGkG1zzkpPlKrfAJHt+qeeJhkFa7albkzBT7bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIoJJWO1Uo2XC22aZFGMvZ0azbBZ3CBAvfLPOYliL+M=;
 b=CVL/EWRJ2TmtJfSXBXuqqlpPSYVE/epTZ4YlIFuXgB8DD7W7fY8dgBMxYKSnHkL9QN8QvM8onSMfrk/heWjin5a44tFSi+O/aO2s7G/uSqow7UZr5vEQp0nIzdMJFFhqF1CqSZ0uZLMSz/TlDeGFCYVF8H5f40QiVfECWLDekrw5MHWwqP0f5ZjZlkDJO2+8Vv9apwybYdesE0+BiMJZMCPqXRhSfvQ4Uob7MNDTgd3y0HEO2hIJQNTk39QIbcc3k/2jf852dLcX4Q7blSEbfOSgDuOIi9zmAut8o0bnAge5YFnpNY5/D9LV37MiUsQfw/pfqofCQLKUIAnt9VA9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 02:56:08 +0000
Received: from CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::ee49:f99d:deec:b1d1]) by CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::ee49:f99d:deec:b1d1%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 02:56:08 +0000
Message-ID: <5d3b20a7-6406-431f-9ddb-31fa332b41a6@windriver.com>
Date: Wed, 12 Nov 2025 10:56:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] valgrind: Upgrade 3.25.1 -> 3.26.0
To: Alexander Kanavin <alex.kanavin@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20251110095650.3192469-1-mingli.yu@windriver.com>
 <CANNYZj_pfYkrDkxxt3Vg22jyO=x6JmNT4RMnoeJ0eZn=FPymRQ@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj_pfYkrDkxxt3Vg22jyO=x6JmNT4RMnoeJ0eZn=FPymRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0097.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::13) To CY5PR11MB6440.namprd11.prod.outlook.com
 (2603:10b6:930:33::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6440:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d78d690-e878-4591-8997-08de21970762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGdwSUhnVkMrMUNvcHNmUmJyUUI0U1BTYTVFeVhXdkpKVTRDelFnZHhEMGdD?=
 =?utf-8?B?ZGs4MEVJV1hyYy8xeStVK2UyMEFYbXhsMmZ1eGJuMG12ZWIrS2syWEY3SnV3?=
 =?utf-8?B?Qzlrb0MxSk1BVml1OVg1ck1BT0JydTBHR1hyKzd5bVptbUtvbHYwQ2ZySU5w?=
 =?utf-8?B?OCtUa29UTnJoY2l0K3o3ZjdwMnNCV1ZxSnpOY1pHYzljSGxPZ2FOZ3BDQTJy?=
 =?utf-8?B?clZPaWJYSU9zdEtpVm5OcHdWSE9MdWxrYm1Pc2Z4Uk1yVytRTmNhUytGYnZa?=
 =?utf-8?B?dEFTaTV1WWhEYTBPbC9qY3lXSjN5d2UrSkdXbndLeC9wR1drdmZCYzA1K0xB?=
 =?utf-8?B?ZTIzdnFYZzhWNEZIRlVWVEZWQjNZV1JmK2F4ZVVMM1ZZeVppZlhUN1dBQXlm?=
 =?utf-8?B?QTdaaVBJNHlCc21keURxMlhzaUtYem0vQU1GcTl2NWhNTUtOb1N5dGZsTVJR?=
 =?utf-8?B?WjhiWVVrTVVWZll0Vm5SYnBoYnBuTmk5TWJZZDlob1FPMjRrQThHNHA0TW4r?=
 =?utf-8?B?UXQ3a201S1IvSis3azdHZXNtVEY0T05NSFd4M3h5SjhicFY1bS9ISmZ0Tk9R?=
 =?utf-8?B?RzZPNlorVUl3MmQ0bDY2MTJvd2hCcS9hc1JrOGxjazFwNzNFeVQ2dXdkejlJ?=
 =?utf-8?B?TDVRYSsrVEt6M1A4M2hqaVM3cDVVM2lZOWVXc2pheEdScTF5VjYySjdSNTJj?=
 =?utf-8?B?bGRkckwxelErM3BOOTZUTE5oOUswVFVGOUhmK3VFUUtHZWlkc1NlSXNocHkr?=
 =?utf-8?B?cEpzUHJNOGxZNU1MZWJJdi92WjhzUWZ3cC9rRFFSQ0lIYzlzVDdFU3cxYjZs?=
 =?utf-8?B?YW5BSEYvbDB5VklsQ0YrWTdJOHVkc1VuU3hOOW81RjZwTDE1bGhKTkZHWDQv?=
 =?utf-8?B?NmtSZG9rNXRkcEVzMTl6d2xrT0pCS2VlYmNoU2hnbnpFVVpyTlI0VjhhcFc3?=
 =?utf-8?B?V0RSb1o3ZE5wS2IyWlNROVZtRldVS1ZsMk5MMFU2a1VkTWlxVExJWkhJNXgr?=
 =?utf-8?B?SndrYnJyUXNUYVNWbHBGNW1KdEhDSks3RWRhUWhrOXFleUk5bkhEbm9HU2Zo?=
 =?utf-8?B?OEI1SUNtSmpOakRJa2I0cU1jVFl2ZkhiMnYrRDFlazNBcEREQWVxSVU1UWdY?=
 =?utf-8?B?azBaYm51SC9hRHd6c1RUcWhtRklWMExOTWpUV0FxSmRsQ1VlZHpHNDFiTXpz?=
 =?utf-8?B?RGJXbjl3bTVFMFhDbjNiNXFYRVVPTWFZNC9ONk5ZNnpOdTdMTm5zKzluMWNm?=
 =?utf-8?B?dXdKajRYb2RpanVPMkNJMHRyc0RDc2xudDV5eWNjN2V2YU1FbG1LRU9OOFVy?=
 =?utf-8?B?RnpvaUN1ckdEY2g2ZFFMWTRGSVZtei9SM2huS1VJbUp0MjV1Qnd2SHFBVGl1?=
 =?utf-8?B?OStZcVUvRjNJNmdPN1NlK2ZqVmxyeklPUTZCcTYwb0x3V0lhZ21GYXB4aEhJ?=
 =?utf-8?B?cmJPejl1eFNRWmliZHpBRUdtZDBGbE1nVERhOFBMdlh6V1lqcDUxUlFyZ0lP?=
 =?utf-8?B?QUV4dHVFREM1cDRzc1RRNzcwaERpaW5zNm5TblBrSWFlNFRwb2N3QUIrOVFz?=
 =?utf-8?B?QXJMTURqblhQZDlUZ0VRN3YyT0hOeGNFVXUrRHpEQURqOEhMQ3BVTU41eFdE?=
 =?utf-8?B?OHJMUHd2SzlzY3JxQU05VVhPNTZ0SVVrY1hwa2t4NGVlbGU2VnhsenFmNVUz?=
 =?utf-8?B?SVZhNm1RUStwT3JUV1hKRHhFTkhyczBVK1h5akhDbzlUUXg1bURKblQyanZY?=
 =?utf-8?B?YUpRWTdjbFgvbUFoOHFvVXlheXp2WkFwTkczUDVWZGdXNVowR25TUjFROFdE?=
 =?utf-8?B?MHYvdG9KT0psMURCbFBzYTBpVEFIdk1YOFpnZG9NY0swS1BXZlN0dHg0RkRS?=
 =?utf-8?B?UXM5bVVic0QrUUJWQWtJV1FzcExKWjJCQnAyb1lPUGxHRTR0aTkxTUg4M05M?=
 =?utf-8?Q?v5rzPeGf7PMEFDz2eFd4NWD1/2wGQqks?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6440.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cS9qcHB6K0YxQ3NaK1JSTlFIelBjRFZ5MHZlK0UyR1QyT3RtY3RhbjZIRkw0?=
 =?utf-8?B?eTUwWjMvUWxqa25lZmVBd2FPUkJqekQwK3ZZcDQxZHhlb3FBSHFvM3g4L0I3?=
 =?utf-8?B?YjBwdzljNHV0Qm9sMTIxV05SSHdjREpway9TeWNEbzZhalN3Q3gzaXo4WW5H?=
 =?utf-8?B?MG43TU5xbUxEZDUwMDNOcWFJTGlDczNISGhMRGg0cFpXUWVnSGFuS0gyOE45?=
 =?utf-8?B?RE5BMTFkNXR3aG5STzFhMENrOER3clFBRmdtbzRMOVpaUkkzL05Pc0hvT3Za?=
 =?utf-8?B?RUhWVFVYaTV1RWE4dVh3TXJyNFNSaHhmU1R6UlhLT21hLy9Fdk5FU0pkWWNn?=
 =?utf-8?B?WUJrZnpvVzFSYlZBQkZrZURRbmJhdnJBUEFRYytIVzZwNHI0eVh3YkdGdGsr?=
 =?utf-8?B?SWtQdlZ0WmQ3N2NkZXRZWjZvcEZlQ2FrTGdobElPMDJkVFFTUTB2bzNTWWJK?=
 =?utf-8?B?YTViaDVWWE5NdEROMFVyaTIwOWwvdWJ1YVRCY0RDSzcrcmIvbFpTM0p2Y1cx?=
 =?utf-8?B?QWxydkNxWlVGQ0FRWXkrOXl6bjRlVEFjeTZBWG5XZjhnKzlQWnZvYllrT0tZ?=
 =?utf-8?B?d3Z4N1hibWl6NWhFZjNEUUF1QnFXN2V2Ti9Nb0Z1Z3NyRkdFWGpuVDB5UHgz?=
 =?utf-8?B?RHlGNkp1dWpSWU5kVWVnVFhGdFcvRWZvWUwxY3A3K25BSktpTkEwdDNWYlls?=
 =?utf-8?B?b2FwZ21WMFdMdWRlbEQ1TjlWbmJqU2JrZkxsNHJ4K05SM0ZzcDZRaW5XdUcy?=
 =?utf-8?B?MUhobm8zOW84N3MyY2sxd1A2ZXhXTzN0ZXFSbXlTbFJOcmxuSmdsZnd6U09a?=
 =?utf-8?B?RkpCTCtuWUwvRzQrTzZ2a3QrWXh2VEtLYUNqazliREVJbHpnZGlkaWZmWUho?=
 =?utf-8?B?cmNZTVY1WWltTTdlL3g1bUp5YVVuaVk1YmxZdlIwY0M5YkRGTTMrTXBmWHI5?=
 =?utf-8?B?OWtJRlF0VjQ5aHRNKy8yUW1mdlV1MnlUV01qZFIrWnJ0K3dPeDNRVURnOGti?=
 =?utf-8?B?cEkrSzFkclpPRkdyU0kzd2Y5Umw4a045TGRKeE44QXZ4S1FiQ0lTYmxBWnlL?=
 =?utf-8?B?eDQ2QnJielRwRTB0a2NJWDRlemxoQngrNDY5OGVlSUR2RU1FZHNjeXZKMUhO?=
 =?utf-8?B?UzQrQ3MwMlpoZW9QckxMMEoyU2tZd3h5aW5MbWtla1VISlpZMTVkTjVnN0h2?=
 =?utf-8?B?c2laby80ZEF0bDEvbSt5QmlvUUVsMnBZQk5TL1Vla1dqWlltd251SjlqWU5Z?=
 =?utf-8?B?YmlBdVR6dDhXVW5pcERSUHVXVGJkMWFnVHhNUUJjbUY3cTBHYzJKZnRwRmlv?=
 =?utf-8?B?aDhqU082c0RIRVZHSDh1dGhtU29rYzRyRi9GRVBXQ2laY3FsbXZyWmtMQ2Rj?=
 =?utf-8?B?V0VrSkpJeThwVDB3bm9aODByVUd0YlNnbUI2aFBkeUN0T25QREJoWHdMNmIv?=
 =?utf-8?B?cjk1ckQ3NnRLbFpuMlAxOWZ0TnRRSEpxandtZEJROW9JQ1ZBYnZnTkRwaGo2?=
 =?utf-8?B?ejNMOWFVVkdCakJrK1BsQ2xZdFJIcUNOcTlORUxpNnY2cGpvKy8zUDZNRzJR?=
 =?utf-8?B?b3haK2lsMkZ2eTRBcVhOb0hkaHVobVNBVllwUkhyUWJtUTI4ZHk0ekMwMHJZ?=
 =?utf-8?B?YU9mL1pQamFTaFBPNklDMFovU1Vud0FDUitnN3dnOWJOS2Q1UnZhSytvSDVq?=
 =?utf-8?B?S1M3YUhCQVI0eks2QkREZ3NseWNtOFlEZ2tPY1B0cjRIT2VrTERHUnplcnVv?=
 =?utf-8?B?U1g5QUwramt1NVFrZkR2dmNFcExxTktNNEdHd1FraUxiNkZoVnBVRUw4Umty?=
 =?utf-8?B?NmhuWTZPY2Mxb240and5VzVxb1NQTzJLdnhvMUJMcnhXSzVRNTlHOGNEaXVG?=
 =?utf-8?B?QTNlVFJYeXUxc21WOXdJd2VXN2xIT1FkZFJueW91eVhwV3V0TStvOFhqaHEw?=
 =?utf-8?B?SStqY1BGNG8yZU1abHJQR240V2FlcGRoUmIxemJTT0svQmRLcGxFbzJJb3RR?=
 =?utf-8?B?cDNOb2l2SWMzbkx6SUFnTTBsZFZhSklmQkM0VzMvdll2UGdXckZKNEx5SkM3?=
 =?utf-8?B?NjJlT3orNC8vZnVlUk15dnY2QmZkd2NCbDhVbytzS1YwY0Y3MmtYeW5RNEV4?=
 =?utf-8?B?MWcwdS9XZDRsN2x2b1hRSXZrYUtCM1NqaXFsdmdWZFVRbkRHTHd5UFpSbFZl?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d78d690-e878-4591-8997-08de21970762
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6440.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 02:56:08.4687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBfAO25kjUeuf9mWFyoWAB+itjbqHK439N9KZc7+9k7+LNJcr7stGMgZ1S9OzLLqtSvtd331weKochD0f8k+zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAyMSBTYWx0ZWRfX/jZOKvhjzuSf
 mRr7K/QaveZkyhNMiO4xoOnzEQ+pzIvYWExJn9YxbByQHZHtrOHdEZJBQ4orrlXcxPPIGteuRI9
 8+hCmkn+6UsovGt3TKmY4hZsh9UlWk+zvPIlQlxNju1eoVKt2B4lhvKG5xoz65ejPcPFKBrZCw1
 bvs/TqHUhCXtGScu+uNaFLYCRSKb7cbMCv0As/DbQJzR8EvMgJtM5sxUJqVu3Ir+kVGwAZW+Hl2
 bMJBz2WLsLDChOFmxZW5WuMf12LRLKnux/tYiWlYJANePaA41feyDI8scZhr5leQiHY3BmEsqJO
 RBL2OWofWxBgedanao5ZAT2KSc9b9Hkq3fsHRRmqwBTEcmO50hMsfJLZjTNrdJxKWYznYl7Ai8V
 pLpRpbs1hkTilRt+5IEtfjI9LZcVbA==
X-Proofpoint-GUID: 1mqWh-3kKbRmPw1uEMny1q62SeZD5ws3
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=6913f74b cx=c_pps
 a=ixAZ6W2pdOuc7GYTaWtIWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=1B2Gv8ectHr7-70E7TEA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: Xx9UsP0ptYcY2JKuasBA_ffF2RJQhVeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 02:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226193



On 11/11/25 18:25, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Mon, 10 Nov 2025 at 10:56, Yu, Mingli via lists.openembedded.org
> <mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
>> +Subject: [PATCH] getdents_filter.c: workaround off64_t not defined in musl
>> +
>> +Fixes:
>> +  getdents_filter.c:18:5: error: unknown type name 'off64_t'; did you mean 'off_t'?
>> +   18 |     off64_t  d_off;
>> +      |     ^~~~~~~
>> +      |     off_t
>> +  make[5]: *** [Makefile:920: getdents_filter.o] Error 1
>> +
>> +Upstream-Status: Pending
> 
> Pending status should not be without a reason that tells why it is not
> sent upstream yet. And the newly added patches should be mentioned in
> the commit message.

Thanks, will sent v2.


> 
> Alex


