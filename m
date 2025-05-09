Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA2CC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 11:25:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12062.1746789899028645275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 04:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224021966=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497U6t2031533
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 04:24:58 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjy0y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 04:24:58 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549BOv0U026241;
	Fri, 9 May 2025 04:24:57 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjy0y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 04:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOqtMM5eZ7vomxqeHGuJDX4d4E0hbcfNoRO1m7XbD16rE2NWJtpp3l+QAJAZ89S2GZaET3OpE7gNykDsoC//B1FGa3mdpheHTvx6AKib42Njf9tvxNCnIYFq938IYxdpu+gqwUsWNwLc9kIAp5SwuKT/kI4GzTqqoAx0HBDMQi5bfwy5PDSUP8vhkrpVyanhd/nUz7VdAdR8Rmp9SKsxFXjr3PMBws+ILrAeRPmQV+emLyOLBL7yBAwP1P8+iZqyjrkfksJ+qW2J1xbRoKckkF4AJzGLCdFNuye6LIqoV5bkwtDrEAkL4Hc3eYvBqHyQ2WYAixlnXLbLzljrekd9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hI6pdF+iT6KS8Q7HtqNZIbIaCQPDnaWL2VhAsu1ALo=;
 b=J81MElUeMZM6BJyRfovZJb6S87W9Ncml0Vjka7PwJ078ZKvYS8pt91jfN5inpN1F25Bspf8YbbeKP7x5uetbMB7jx/XOLKrizmpFnKWVvsBYMdEnRhorff2gm5eMdGcTUi4G2qw0/S/uCZV9IK7rx1Isxxf4nazQW7txlYjLgpgba5F5lAF/SAW5gzogw95mezdYI76HQ8Buv27HVSzvVsmBc7lQZpuIZDdHLh8eAH9Di7WaUSyTmC0xij+qkvDdlnLaC60SYBh+TDDQ2b1nQOzXGFoqELqNPoatahJH7xfPhoEhTAipwd+jGILGabDuoWiDjGGsB9Ze9wGjc+TzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA4PR11MB9081.namprd11.prod.outlook.com (2603:10b6:208:56e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.23; Fri, 9 May 2025 11:24:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 11:24:55 +0000
Message-ID: <b7826686-6580-41ea-bc93-89a28798d7fd@windriver.com>
Date: Fri, 9 May 2025 19:24:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] openssl: add fips support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250509093740.1367372-1-yi.zhao@windriver.com>
 <CANNYZj8+SvOzz7D0a_sEi81vhi3up699eYoJ1pgBsW0xMHuhog@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj8+SvOzz7D0a_sEi81vhi3up699eYoJ1pgBsW0xMHuhog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR0101CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::24) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA4PR11MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b963b4-7eb6-4c34-0e45-08dd8eec1f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K1I4VkVpSThESDVnTEhLWTFubjNwZkV5MzdLN2J5KzhadGMycDFOY0RIZkVt?=
 =?utf-8?B?SkJUQVNyTDNodXBZUENmQ3RSZDMybkFMOUc5UTVhMVBZSlBWU0pzNkR5emxx?=
 =?utf-8?B?eTlnRGVEaXVOUFpUdWpJMHY2YkhtZVp0U1pzaGlrMkMyRGI5QmNDYS8yOWFi?=
 =?utf-8?B?T1ZXUEpLcVRPK1FQNE5maGt4cEZ6K1l2NWxaQ0NOVEZ5NUVQSEdEWEZxNWo5?=
 =?utf-8?B?VEI0aGpwSFo0ZzJkSEF3c0JjaExTUnhIR2cyWnNVQXIxdGwxdjkxM1c4NEZr?=
 =?utf-8?B?UVVGYmdBRVI4bFMxWFE1SlJZRktuWlN1SCtsNVdmRnRUWjlWTFZIcWhUSWpp?=
 =?utf-8?B?aXhYQ1pob0xscXNhNnlWN1BoaGVaRzE2QjVRdGZvLzVzaGZsRXhTZWkvdGhM?=
 =?utf-8?B?OGdCdHY2V01yTFhZK1lvcmFxR1d5bWhscUtSaEtJVHAvVjlpTG9McW9SbVBC?=
 =?utf-8?B?NGtjV3gzZjQwRy9iQkQ1WVRnS001Z2ZLU2thRDVFQzFvRGRBcVUrSGVWNnF4?=
 =?utf-8?B?RVViSCtIcFdkZmEzckFwUloyb1Z3UGtQdy82NTNuR3lOeGphejFMeTErdG1p?=
 =?utf-8?B?Z3VmdUw4WUgvdWR2dDFVeVNMZmFNbDdVQ0RqeVpjVHNvaTRuT1FvMlVtSGps?=
 =?utf-8?B?cXh6dk0zQVZKSS9JcXZ6dHVrczNzWEFQZTdMalZCOXpxaURCQUhCdElEd0JF?=
 =?utf-8?B?TkdKNitEVDJsSENSUHB4dTBkeEhkV1FXQ051MG1uY0d2cFN3Lzl4OE1kbkIr?=
 =?utf-8?B?VlAyTC9makVlZFFXdkVoUk5odU1zWjNQMnY0NWd4T09aK08wQTVLZVhGc2xq?=
 =?utf-8?B?MVkwUUNSbk5DenhJaUhwNDVsdnlSK0MvZ2VaSHRTMTdMS1c1NWZzeTN2VkVh?=
 =?utf-8?B?M1FqN0xIOTV0byttdzFtckJ1YkwwZWgyemVJNHd0MC9UTC81NlgrdEdsTWdF?=
 =?utf-8?B?MElxNzlxbjFoNVlyK3VMQlpPUzdNVWRHUUVLVldvc1VocjVvWnlUMTdobUZE?=
 =?utf-8?B?U1Fzd0lSY1NGQTFDVlkrZFNpRTJVc3lodGZLTk15bFBWWVhiZkhWNjRmZm40?=
 =?utf-8?B?WkpvalI1cEs1dkVMd2FtTStnckVjQVhONTdudzd6Yk55MXJ0RWlRTkl0OWh4?=
 =?utf-8?B?TEFjZ29Xc21RWUg0L29VNUc5QXg2L2dUb25wbHJuL2t1L3N1b1U4c0ZQSDJm?=
 =?utf-8?B?VmxLR3FJbWdGZUhpTXdEK0JPV2RlZWVRR1dKQ0w0NXhGV3ZycE1VeHFnN1ZQ?=
 =?utf-8?B?bDgvVmk1dVFNMHVtdDRTVTBZSjNlL1pzdDFvUlRIQXFWWkk5UWdRTDd4Vjhl?=
 =?utf-8?B?d3FRTW9wUU9UOGJna0dmc0FvK0xzbS9zcWRnWUQ0U3M3Z09kZ3g0UlBORlJn?=
 =?utf-8?B?dU5qeUFwSFl2NFVNNlF6eUhKeVpyVVM5MUJnVjZTamhlOXcyS2xkcWNVNDVB?=
 =?utf-8?B?Vk1WVkxRNksrZUJPRWh5SFZ5dDdxT2ovMEozdmZmM2R2TWx1V1JPQWkrRUhk?=
 =?utf-8?B?S2JETmZ1TnZtU0hvZTF4eXRBZlBlcElqZlh4c0xka1V2SFEwSm51UTk0M2xj?=
 =?utf-8?B?endxZXNNS1NiZnd2VnF5QUdjdmtJODMxSVBjVTYzWGdvVXNzOVlVWlR4NkFa?=
 =?utf-8?B?M0lwUGtud09PWE9zU0NNSkN1b2ZkbU5kQjNzS1NseENPNEY1bktlbTJlcTRI?=
 =?utf-8?B?NXdOcjVVQkIvaVZ5ZjJDM0JoK29ITERGdmtqbE5qd1d3SkNvVndaQ3BWTFFE?=
 =?utf-8?B?RWJIU3F2eXhsNVVFVjloMjFEYlJRUDNobjNLcFIxSWJHR1pwYlZ1dTFBSU1B?=
 =?utf-8?B?SkVpZUhyWldOMW1wUG82YWhpb2hrZ2VqOGFrY1dYQUlwUU9TMS9LYWpKVXV5?=
 =?utf-8?B?VmdiUG90eTRaYm1iRjVoV2dlb1IxL3BMMEtXejVTYUxYMm5zR0VrSENZMHAr?=
 =?utf-8?Q?Tb/TAbs9FQk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1BiMXU5OUcxVzJVM0JIVXFHNmZHZHZ5WDRQTkhrWGNzNXFmWUQvc2RVYWg0?=
 =?utf-8?B?WlFrVHdmTmlqYWZWbkUvRnFwbGpIdVFMRnlENXRDc3ZsVDA5ajVjQThnVmg5?=
 =?utf-8?B?cUdyYkpiblNsU0RFbXlaNTkxR3loRzlVaFQveWZidndlMjIwdnVweE01WDVq?=
 =?utf-8?B?eWJ2dXhZZE80MkNQV0w0dWNYVUNvYStyMnBPYjVPQzl1SkF3SVBXbEZlcEYx?=
 =?utf-8?B?akpDT3l1NXJOdUhud0ZOaDFiU1ZpdkU4eXJzVzR2YlhheWVLb21wbEFnKzVy?=
 =?utf-8?B?OFpHSTdNd2s0QS9QWjI5RWhhWVFoaWRNaitEcHAwSURrenY1L1hRdENKaUJj?=
 =?utf-8?B?QzhnOEJZZFd5M2dhSklXd0FnTUhSOUpjL0svL1hJWkZveTVFYW5RZ3VMNmVY?=
 =?utf-8?B?UHlPbjhZNEtYNTBxQzl1WCtnMWV2RURJblFGbkppUWZRbFRLWEhRYTZ5M1h0?=
 =?utf-8?B?cjNXaXczR1pIZW0zcWhyTEgxdlpEck81Z3g5bVFqek1Lc0VieWJQbk14blA2?=
 =?utf-8?B?bTJQRmlIRnJIanFwZXpJSi8ydC9TVDRldGJ6eVhHZEgxQS9lNUJFOVllamQv?=
 =?utf-8?B?MlFUUDNEcGpsQ0NBaUhSRlBCSHE2VG9MZXR0S0ZzSXZtYnJTUTZjM3FTU2pX?=
 =?utf-8?B?NnpHSXA2VVJmYXFjdVBHN2JDUHphWGd5Z2cyVExFY1pOMXNTVVpYdGJOdVF4?=
 =?utf-8?B?YjRlMzYwbE0wZVl0eFFVSHM3aitNN1JIWUJrSTMzRjlrY3RVcTRpVUtlSi9L?=
 =?utf-8?B?dTdLRVNLOEYxblV5VUw0RmhxbGxnNHVJZi82dkV4UG1ER3VkbnJldFBvTFgy?=
 =?utf-8?B?NUloaDdTbXF2bUtDVGxkYnd4d3RuaXJNb1VwVEpWRHhmMlVXaElvMWpNbkF0?=
 =?utf-8?B?YVZtdG13K0hJZjl2QmM5eTFRTFZPTU16Yzlna2JIemhFeFQwYzZncnFVYVdy?=
 =?utf-8?B?Nm1INjJ1dEpXa0h6cGRNbmNnSnI1QVczVDRrVEY5cUsvT3ZqUkxyaklSeEJq?=
 =?utf-8?B?ZTUrUHdKRTEzckd5c2tzWDY4c014ZitRSCt3aFdQR3Yva2FncmVEN2Z1Zjhh?=
 =?utf-8?B?bUlpKy93NHpvM2tYYkM4azhCSDhiajZzNklGN0wrY1JPK3hiTmRET3JVNnlP?=
 =?utf-8?B?MVd0SUxjdXhWNkRMd2hpSFB0ZDh5VmhPdEhFWk5oUEs5VG9hUG9ySXlMRHl0?=
 =?utf-8?B?MkdHZEh5YW83bWM3aFpWOFVUNHZKNjdUdjZJcWh1REh1MVhrK1FUaWRuSWR1?=
 =?utf-8?B?OEdGV25PbmxVWVRVRjFHVGE2aVh0MXd2NlV0T2JmOFR1TE53dXpaUzk5WWg1?=
 =?utf-8?B?RTF0bkhzdnBHR214R2VETmY4djIwb0pHRUE4VkxXM1RNb2psZlBFcWU1L0pO?=
 =?utf-8?B?ZE9NUUhTUUI5bFo4SWRKV3RFY0hQcGlMY2lUb3N5NGJVUWNqUW1BWXRRdVFD?=
 =?utf-8?B?SzRCbFVHMURrQXZRQ1Bmb1JCTGpIM0pVSTZuN21mU2Y0ZFFVOVdGNHFobUpT?=
 =?utf-8?B?ZUJFUEMxbjRENmpqRmU4MUFkUlJIUGxUanlRaklmaUpQeXF4VmtSZDIzRHdh?=
 =?utf-8?B?NEZTdUdPNExaSUZ2SngveFdaT1ZRZWNCVmZJNTdLcFljUDBldlBIUE1jSUJE?=
 =?utf-8?B?QXRnaFhHTUFVOURncndzME9lS1NOVzRaNTk2MEVYN0hsU2k0MEFwOURIblNV?=
 =?utf-8?B?R0VzbWRMOGJ6Z2NuRlZDZC9SMTFaQmJhL3NvR1VQTnFJUGVNM0sxcnVtU0VF?=
 =?utf-8?B?OFpWeGwxR0RuelNTWWtvd0NkK1hBQTRzWmxpRlNNMmR2dzdjaUVMbFlveWJV?=
 =?utf-8?B?SlF3aU9QcittdzNkNHJHMERUTzJaK09rZGpYa2d3SkJNY0FlQjhlN3BWeHRI?=
 =?utf-8?B?K2NhbjZTTFVKRFlVT0V0bit6enZXSWxmMmNBYWtyQ3ZOWlQydGJUTTk5ZDhK?=
 =?utf-8?B?TE9pekIyaloydHpZMUh2eitqdTdTSEJ5T3Q1T3M3SmNyVU9FeVRYc3h2UndM?=
 =?utf-8?B?R0sxWjZhVmdtb2x4Z2dSYkxOdzFwZkVnVUFaSVBXREp6U3VKblVnaE0xSU5t?=
 =?utf-8?B?TFBxeUo3Y1puSndNdWFHSkVuMXBoak9EMzdMTVpBSnFLWGt6Sis5SmE5cjJ4?=
 =?utf-8?Q?KuHfCdiT26ujTN4Xqh5cVI2Fi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b963b4-7eb6-4c34-0e45-08dd8eec1f7c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 11:24:54.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXvKCHKFrYBJQ8a0aoIaNJLfIpV3e+ownOZo2Okv+FVzqq4Yo79F0wg3UtWed41BnyVJjms4bpiQt7OG0UD0pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9081
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExMCBTYWx0ZWRfX1iQ+prgC3Oaz wZj1XX4PLd/sw892KGX21ndO0nvhHRDf7ETA3O1M9OhWlzWVGrcCr3QW7AxrPgzmwF1aRSwfSZy Kuts4I0bwUW366tImXnHOEKfbCrkvYogmCzj0yykS/QaBP4ZJnXHlXGkkoUr9/D3deLebXkR1Y/
 tZM/CSI1h464qy1aP6cZuBQX8y/SOnjTDVJx6pDXQMFf2lVktxwAAbkmdUn1gXYYYEgPrp4nWlr Uql4oMKpwVI3P3XtVSQ/g+5ktN6qDTmCav1b6Dy7iSbdjBAW6ljMlr9N0XgBSyKfWKoP19scqvX 2USvb9dqy82osLlEQhK3gUTec6IXjcXhQz6ncW5vNA/1s50ylk0+uRg+GHVBQe7Ys35S033QUjh
 j3qO7O9YKtG0eqvnKEZ8pbQjX1dacE6ld9KYmDv99ZWl8EOlEY8PFiw0xXfGKLWi42M59dL7
X-Proofpoint-ORIG-GUID: A_WAI0kp8dSev2YYSKwnTJwNTfImrNEn
X-Proofpoint-GUID: AG0B4WmYvJkLqSk0VXgXvNZiVCI4Lt6u
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681de60a cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=3AZC1M-wvOpxSgEcp5YA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 11:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216198


On 5/9/25 17:56, Alexander Kanavin wrote:
> On Fri, 9 May 2025 at 11:38, Yi Zhao via lists.openembedded.org
> <yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
>> * Add pkg_postinst_ontarget for openssl-ossl-module-fips to ensure the
>>    config file fipsmodule.cnf is created on target.
>> +       # Generate fipsmodule.cnf on first boot
>> +       if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
>> +               rm -f ${D}${libdir}/ssl-3/fipsmodule.cnf
>> +       fi
>> +pkg_postinst_ontarget:${PN}-ossl-module-fips () {
>> +       if test -f ${libdir}/ossl-modules/fips.so; then
>> +               ${bindir}/openssl fipsinstall -out ${libdir}/ssl-3/fipsmodule.cnf -module ${libdir}/ossl-modules/fips.so
>> +       fi
>> +}
>> +
> This needs to be better explained:
>
> - why is the standard fipsmodule.cnf deleted in do_install? If
> upstream installs it, then why can't we simply use it?
>
> - why re-generation of that file has to happen on target? Can we use
> native openssl instead? Or run target openssl with qemu usermode?

The "openssl fipsinstall" command will do the following things:
1. Runs the FIPS module self tests on target
2. Generates config file fipsmodule.conf containing information about 
the module such as the calculated MAC of the FIPS module and the MAC of 
the value of the self tests status

We should not use the same fipsmodule.cnf on different machines. So it 
will be generated on the target.


//Yi


>
> Alex

