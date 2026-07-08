Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7A8C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:32:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15230.1783535548827595954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XCOhUQZ9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GI0Hd313516
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 11:32:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pPZuyvwBxIAu7ZpoS7NpuFyxQXsm9qBJNioyPt2n/PY=; b=
	XCOhUQZ98RogY+wkJ1jUqdwRQr6q33OP4AUMEBMbLcRcqOmIQphi79VUAN7UUjiI
	EIPOKIknJ4jQlykTv7i5Rbm5Jt1bIlzCeSo0fGl6W/6VQ8LFvl2AK+eOXkpWM46c
	HNUrgmklWZzQGF/fV+9D1u48O7W14gWKKU9Qpa1bGXZ5qvcVXybLJgBKBamt0Ymg
	w3wBDn92LA5mM1yG517z8tzCwxy44VniDfjEVNyITmeZgGZZcC+Rfn1e5oiiHGia
	FhsXyUIqVpv83nL4ENPrsQb8JhMIhw3DqYZKEaDbjiJZdFNVD91CYsr0MfRnF+wH
	WJbC3BsOOcqec1jKDonEbA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe6g6q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCCZfviPqWPDVTIyZ/Rht8Kh3aP2Hoh7IBpGHULHgwaZuAjHsiP+UsTo57Kx7Vo22bQcGyiNyq28Z/4gdtBgzHPsfWcdOEV/hiDPZ0YWegwSOvXroK7CcnQDaTX1IS2KBZW8yLBFenryHTJ8Ip3c17mptm07sfhTq+7QT69Jp0/gwZeZihF9YX24uJBsNgjN1NqnQKIobcP6/T/awYTlBGlVdS6LS0N3cvkGNJiSfayf9uzRWWv150r0QfZ8wDLufR0R73fuel9HXnUvUKZis6IvXt3o6xVfoe0s/Ziwp6RKbMT8ECEDpufm3rCSipsIvSjfuWp+nSou//11zh7JwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPZuyvwBxIAu7ZpoS7NpuFyxQXsm9qBJNioyPt2n/PY=;
 b=LMCyHtCF2lEzjceUxdcSqAn680wd17GWeJ+FnCYj7zG9BN9PpoYi4HzwqVGDnKWXH/f3JwKRa1nCnSmcIGqWggF23hcQOYzGckVLdeskYtFVxXSK+B5bylnEQceqtELhz0Yo9UaOjjMcPSbggMlzSRY6WtZC7YRQur1f1CDZpTNXTFfQjTXH2d9SWy5gaLmrD0Ky+ipmcatmukZ0t5wkwW4oH407RJZMX8f+CLJd+71SRncP5VL65ojl+An361uWWUoMZTqCpWfmvwg2FrwRD0gQRnY4j9/YkROyf0nNuDJeXpYIBGGSmez5gcrB152f0Rg3jcAj2qJqCuuidgIN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 18:32:25 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 18:32:25 +0000
Message-ID: <f5240cae-7509-4ecd-bf75-02cc651f4dbb@windriver.com>
Date: Thu, 9 Jul 2026 00:02:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 0/4] Add Clang toolchain support for kernel
 builds
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com, tgamblin@baylibre.com
References: <18C05994AD7061CE.550146@lists.openembedded.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <18C05994AD7061CE.550146@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0267.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LV0PR11MB9792:EE_
X-MS-Office365-Filtering-Correlation-Id: b325ee84-f3af-49e5-4125-08dedd1f41a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|23010399003|366016|1800799024|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	lx9GmX17VXJT9Hustb99UH0vtF4sh5GFTj6rtz2qwop/a4OH32iBTXddQEqqMqSX7+VaUuDcKtVTdsdB/fyBuWwrMQ360cjEsamKMwakUcBcBlpVRd8vtRbUzoeivOI4QezyIax5LsCCEjrB6rw87hfRZP87QXh6nXl5zWeVoxRwKV4eAYCulOz98vhHBunWZ8Yo+nvGrmyRYV/GvmEdSI7EPipSl8Zkz6Apd4G+dgM0xdzTRRxPzh+V4SC7KjXO0i9Swc7MpC+foHKiDtUPqhmwj1YWP7coTSAhpuw+q5CSUTDEX/DpevwCPUF2keR9G/253RfZupGvOUDqvyPlYrSoBnbtQTschB6wUwO5LowqjMpofmVwr2y1egRvDEVzWh0lDif3xXHJCAJ2S3y+KDHrq6zv1H7xrdIY/9nNUCOz3o8ZD/CMKhS/5DY7VtfQvS134D7jINitsIq6vgIfnbryyaZV9CnVXY3HSuFHl5uKS/7nD/fQoAMYw76AZ1wIvHFNi4zk9bD88QotgIC4bEQlUBOi2rhjioy5t0JHCwWwmpAX6JVmmey7P6Ba7u/boDcxKLyultX37wdeZ0egCYocfwLowas9t9be60PfJAvztjkrSlz27nU6v48bRP3s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TVB4WEJWbnRLdThJN1RxR3BzdlZNZXBaS29jZEt5c2pRR0plVldYcnp1RkZW?=
 =?utf-8?B?cHZPenR2dy94R3ZHKy8wQmJ6UDM4YzI3NWZtM1Q0QStaVXkxS1hpdFFMSkcv?=
 =?utf-8?B?S2FLc3A0RmxvcnpBWTVJZnJKOHhXbGYydHNYU202cm1veU85SlA3MGlydjRJ?=
 =?utf-8?B?TTkvUjlsdVJjYTFLVXVWYkJwN2g4OWIxT2ZLbzZmYmVZUEhybldKb0d4dUNT?=
 =?utf-8?B?ZTJoanFtbXBETzhRMG5wRW1uaFNyeG1BTXN3clFXOHRHa1JYNm15L2pEVHhD?=
 =?utf-8?B?ZytCeWdzSU9vRzlSNmdvakVxTnZvK1dFVElIZjZ2MEZQa0xxVjJYT09DQ1JV?=
 =?utf-8?B?R3ZrZEE5Q1lKQUptbXVMcGYyM1BEaDZJL2VuYmMxMzZKZzZZWWxMWTk2TnFz?=
 =?utf-8?B?Y2lwUlpNa3prMjg3ems2ZVpKNzJraCszUE1UTkhRVHhaRGdNL2JtaUNNVXJR?=
 =?utf-8?B?b0s5UldvbCs5TDU0bFlHSkdPcVhRUGlReDUvMEpXUDhhWE9zZEY2b3FoMWMy?=
 =?utf-8?B?dUtpd2l0Qk14TnpoV0xHQVFqUzhYQWF3VjlLeFFLS0huRldkd0hEUStPa0dz?=
 =?utf-8?B?V0h6dFVxL0NZWE5EZ0ZkZTZYMnpiUXhtcmkrTzZkVm4yYTdYMjQyNG1hUCti?=
 =?utf-8?B?UTd3L3dGSllwRk5oYnhGOEdZNEt1eFlyNS84VEx5aVBNM3lNcEE0L1UwRXdX?=
 =?utf-8?B?WUFNZG1nN1ZXUDlFV3F4ZlJuOXJkZzNmdmJSMy9mM3ErMFpFUW8xMWJ5RW42?=
 =?utf-8?B?Wk5qMFFKT3hSRWlLNTk3Q3hJTkE3V1lSeUFFcy90ek5tWGpGWEVQbUYzdGlV?=
 =?utf-8?B?cVNJNWlmcElFdHFRSm9Jek9aQnZFUG5tM2FQRlQ2aUJqZ1RuV1NscHIzdUpN?=
 =?utf-8?B?UzdDb0JFbE05MERacm5ZUGdDSG1Idk1MMWZvQmVwY1EvVDByMkhRZ3c5QjBs?=
 =?utf-8?B?Nm9URFpzVm5YdFY0WWpSV0E4RHdZcmx0Wm9oU2hQZXdiSm5manNMQitqTm5O?=
 =?utf-8?B?NjQzTDZmNzVBODBXbjR6L1FxYlVrQ0R4elhrdFF1QjZCaExaUDVId25VVmZP?=
 =?utf-8?B?YjFsbG5qRGJCK01jQ2NQYjJHRVZudGxwWlBrWnBmOFJ4bEx0VS9YZGRMNExC?=
 =?utf-8?B?NThXMnRkb2J3NHVwZnFvMUJhV0llbnF0aHFwbDFUS29DUnEwT3hWWEVNZ2N5?=
 =?utf-8?B?YWR5QlYzVUI2ekY2Q1M2a085dlFRd1lST3R4NzZWOGFPZGlYS2ZWaUhIOElO?=
 =?utf-8?B?bnhnTysvQldjQmVvK2xiekV2aTJIR0lLVnN3QVovMVl2a2xjRzV1RHlOelFh?=
 =?utf-8?B?OUZ3R0FLUkpuS1pQMVVKamFNQnZsYkRiTjk4TmNKamlyQnJ5QTRpazhXUUdx?=
 =?utf-8?B?OU45Q2FMQ2FsZkNxdnBvbW1USGxlaSsyMnRMdXNJQk9YMmFPZFhmN0hpVEpM?=
 =?utf-8?B?U3V0ejN0U3FsY1dtK0VKZi9hR3pLMHNlSVRhbGhTeXQwNmQ5cFRQTVpQd0Fi?=
 =?utf-8?B?a1VReXVSV055U29mVndZTlYxN0lKZFNCdXlGRThLWE9Oenlpek1lK0hCYjJh?=
 =?utf-8?B?cldzUENFc2J2eDNueEV2VEdqRjhocVdNdFNXQU81MXpSdEdhUHZpN0ZQZXFi?=
 =?utf-8?B?MmhjUWh4QzhGcEpiazNjQ3BNOW5ZeU4yTUI1ZTJnUGo3RzI0bHNMcUdmTXpP?=
 =?utf-8?B?ckZjZWhGc1VYeExqYWM1RFFxYkgwSEl1cEk2S3VKZUNQVGNtTEIxOHFrczhl?=
 =?utf-8?B?d203Tno2OEh1MTNJZVlDb3drem4wdjVTa2hKQmxQOXFackFUVzNKT3pBK0hJ?=
 =?utf-8?B?MFNHQm16MHdMRjR3ejZTVFZWQlBKT1lMbU9RMWtHNEtxbVJlUVV3ODBxMXR2?=
 =?utf-8?B?OHVJcVVtWFUyV1NCR3FxRVIxZDY5aWx2VFpzRmgzWXJnK3BJUFFVb2pHUUFR?=
 =?utf-8?B?NjJIRGZTcGpXR29KOGhvb1J5NXVpbFNCcVpCODAwd0RyOUZEMkRUSGd2Nnlw?=
 =?utf-8?B?Mm1XSCtTeEUxdW9TVjlLaDUxWkYrMGUzUXhDZEpTaDhVWm9rTzI4T2FVN3JU?=
 =?utf-8?B?UlU1WlFTN2NwR0ZGT3NkeW5MaGNtZ2M2bHR3NUdRa1VpZGo0MlpmWjdLMllF?=
 =?utf-8?B?UU01WFdlV2oyNUNLOEtQSi9vckF6OGg1VlhSdWdOeWlqM1UwdDRmc05LSjJI?=
 =?utf-8?B?dkJFZDROaFhybWpPNlNxL1EybktkbzNKNjk2RHZyZHFHQm1jVmp3bnFVQWhK?=
 =?utf-8?B?TjlsWXEydE00aXlldDB3TVZ0ckxWbk4rL0x4TDFqNzBjZitKeituUXFvck4z?=
 =?utf-8?B?dkZ6b3YxcXcwelR4RkVJMG5QaDI2TGIwN0kvS1VPeHpDaVdPNHEwTFE2NVdj?=
 =?utf-8?Q?1SrnjAcUtygzVM+U=3D?=
X-Exchange-RoutingPolicyChecked: 
	AihQDw1yCt7n/gClky7xeRbEkCw654//9j0W7pCZEet1lhrQVEYeeiDAAyhSUVWhalPQ2Cve6uzp3ADCJhvh9qvoqV6+Y+sVT8SJiIyVRVwQ5nixui9Mm5CZbQGKYcaxDXb5YO0+jwlIHkyZ2rXUIiRgPKCuvtb/s9hjzMMzIZyNDM/V1WW/YvGIFE4Xs2U8NcBzbx/Rrgia3rHdKZk/LRt1nPB+OrotB9Agv5bN/Ot6qD8KeZwDS42SRWxL4yYIbVP+Djv5bA5Seld1Gsfn7WjsGU+jY4NvbNzIM+E/BC0iSEEoI1qe9Qyi3MEMjEzyHajlEr5IlYFfKqxCnGyqgQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b325ee84-f3af-49e5-4125-08dedd1f41a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:32:25.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkLLoznus/Wo5y4+Blr2X9ho/MbgwzA5hvKd44NNsW9EmkuHKA0k13qDxLKo5/54EDOpB3r3cZHJmpuC2sU5hRqA1tiVop0gJgAH7praxvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9792
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: N_v4_Ei6ZQBnJN1USMz6obbY07Riukdq
X-Proofpoint-ORIG-GUID: oCuHaN-CtkAMTO88WlY2qgX6yLCDSqMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MSBTYWx0ZWRfXyKtOyA4CdIe1
 7ToVmm911CGGTKE1pEymRVmerULhYAZCUItwHBmvpESvutObnbIn2CE20Ll4G6et93fFF3cyPjc
 TElzM7+e0xZRw0QCOHoHASMeIQ5dc6PiwlnEXpxuHTcIg0Jax/L+xs4srpUs/XGWGfIEHCDogwh
 /9cbG9G5s89HyAlFes447efSstuWrFupC6cvC1SpP39ZsdcIvPEOxfMf+RRa9GUbD4IVSszYoo9
 JWOyWiO/FmoRx5sWVHrtcN3aQwik9aarJrlf8CanIO2iyT/z/8Jj6L/ZDKBT8bITrEBTLtAGP0Q
 IZ277IW5+AdqZ+7RJ4awKNAnaUlGN+70aCCmT2ruvSI++K3bj7GbZ1XyDTaaggoh1H4vIJCYCZl
 d9Ya5IBVl+eI3HgUgvH8Y+b0YtYmzHJtZns4uzlRTb2XggNMZvSKj+zapRpoLaXWnK0rtmW9ZJT
 Qils4hCKdcXF5fO6K/Q==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4e97bb cx=c_pps
 a=f2s2IY/meXrRFjAxVkB89g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_IcUviSV1oEswueFtcsA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MSBTYWx0ZWRfXysRzhbUjQYHN
 +19rc33HaS92qlylJ2nEoB6sMgoHr2nraCnYreEUbP3AvOSWBUefHocSC9HHRwQDbpwIf85+Azm
 3FYyFRQRfRAw9KWqX86r3gtJtac7qWPGWPAs5VUCapjO7lhmaDO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240506

Hi all,

Please ignore this v3, some unintended changes got included in patch 4.
I'll resend a corrected v3 shortly.

Thanks,
Harish

On 08-07-2026 08:48 pm, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> v2 -> v3:
> - Guard against TOOLCHAIN being unset: use d.getVar('TOOLCHAIN') or ''
>    instead of d.getVar('TOOLCHAIN') directly (suggested by Bruce Ashfield).
>
> v1 -> v2:
> - TOOLCHAIN:riscv64 now explicitly falls back to "gcc" instead of ""
>    when rust is not in KERNEL_FEATURES, avoiding an empty TOOLCHAIN value.
>
> This series adds LLVM/Clang toolchain support for kernel builds, defaulting to GCC
> but enabling Clang automatically for riscv64 when Rust is enabled.
>
> -Convert existing GCC tool definitions (KERNEL_CC, KERNEL_LD, KERNEL_AR, etc.)
>   to use the :toolchain-gcc override, so they only apply when TOOLCHAIN = "gcc"
>   the existing default behavior is preserved as a no-op.
> -Introduce parallel :toolchain-clang definitions using clang, ld.lld, llvm-ar, llvm-objcopy,
>   and llvm-strip, making it possible to build the kernel with the LLVM/Clang toolchain.
> -Automatically select the Clang toolchain for riscv64 kernel builds when Rust support is enabled,
>   since upstream kernel Rust support on riscv64 requires LLVM/clang (per https://docs.kernel.org/rust/arch-support.html).
>   GCC remains the default everywhere else, including riscv64 without Rust.
> -Add lld-native to DEPENDS, since the lld linker is required when building the kernel with Clang.
> -Fix a config-check failure under Clang: do_kernel_configcheck was erroring out with
>   kconfiglib.KconfigError: ... Sorry, this assembler is not supported (from scripts/Kconfig.include).
>   Resolved by setting CLANG_FLAGS = "-fintegrated-as" whenever TOOLCHAIN contains "clang"
>   this flag is picked up by the kernel build system during config checks so the assembler test passes.
>
> Harish Sadineni (4):
>    kernel-arch: Add clang toolchain support
>    kernel-yocto-rust: use clang toolchain for riscv64 when Rust is
>      enabled
>    kernel-yocto-rust: Add lld-native to DEPENDS
>    kernel-yocto: Set CLANG_FLAGS for kernel config checks when using
>      clang
>
>   meta/classes-recipe/kernel-arch.bbclass       | 23 +++++++++++++++----
>   meta/classes-recipe/kernel-yocto-rust.bbclass |  3 +++
>   meta/classes-recipe/kernel-yocto.bbclass      |  3 +++
>   meta/recipes-kernel/linux/linux-yocto.inc     |  4 ++++
>   4 files changed, 28 insertions(+), 5 deletions(-)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240489): https://lists.openembedded.org/g/openembedded-core/message/240489
> Mute This Topic: https://lists.openembedded.org/mt/120174988/8054390
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Harish.Sadineni@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

