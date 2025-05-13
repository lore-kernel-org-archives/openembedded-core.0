Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B0CC3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 11:29:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.74169.1747135765952996527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 04:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=722802a532=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D5H7Ub007109
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 04:29:25 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46j233jsmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 04:29:24 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54DBTOB5015310;
	Tue, 13 May 2025 04:29:24 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46j233jsmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 04:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+D8mvOGOwoVRNIL12KcPSA3fZzJtb+yyeiWadYZkaPoYA4ZLbqH35sZBQyYvViLj582jepCG98g8Q1leXp2miwIDj+P5RKOwWy2lSeCr+FZGj1a1Olwd3HBSk8Re//pfSIJKvpEmhkbBJKEYMUXhN+4K1MFyp6N7GyUkOlZThqwNKMaG7vnaDtQORbU8nSBU7c9wLx5N3NFizc9NzQRDhyF/7nacBTMRcuPC7DG+B/diN/Hqug8I70W21Zgxr0j0+mHnsQXq2hivbTMFONgBAuYU074PevjOKPTLYuf6lN3H1KdwlfFosXwSnKDT5B5xKIUF2TBvVK2/w4hCm1kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MRq3jwixGUesn1nRW3ji6BijbOPlAEuPf+yGIfNmNk=;
 b=SwDxVgF/KzL/emnaPyft0ny6nF9jQPDnZ8x9e3MLmuOGNsS9UeDZXATBv2GZqQIDo4yB0I4xp38z5hkqPDbsdxdIn2n4oo+j62hu/4aHGoxX31yU0znujBfCxYFDO4WT4wBdqvmqn8ubSpGM3F6z/CFnpzL9Pz5WEb8wjg9llhMIHfHxupQ0lvLq72WjB+2uFNFrGtZbZ0G7AnKia8NhPmjqz7hyrc94eiRWNoypD2y/UNDRJif5LqKW606TlJhRl7wrbqxEGI9CrphXw2q0mOHtmWbv/AnI0YfkCvEML4KzEOFKRpCOa58qPdks0Q2Zs25fxx372tH5Jh7+T/PMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 13 May
 2025 11:29:20 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 11:29:20 +0000
Message-ID: <5f1ee894-b118-4d5e-8381-fe38709afc7a@windriver.com>
Date: Tue, 13 May 2025 16:55:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar][PATCH 1/1] webkitgtk: upgrade 2.48.0 ->
 2.48.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250509052739.3638179-1-yogita.urade@windriver.com>
 <CAMKF1sqMaiOGn+cQ1p8_XMCo+iGdso+kq+1wia8OTywmcJk5sw@mail.gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <CAMKF1sqMaiOGn+cQ1p8_XMCo+iGdso+kq+1wia8OTywmcJk5sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH8P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::26) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 231f58e7-931a-4935-e4d3-08dd9211673a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L0c0RExqU3g4TGhXZ1VTcDJXdWxuMHRWNkF6OWI4S1dVY3Y0NWpteUdNTlFD?=
 =?utf-8?B?OWpLam14cTB6dG1JVFRnSVh3cmNmTFozQktlV2FBZmxhckRxWVdrNmhqQ2ZN?=
 =?utf-8?B?UkNMbEFpYjJ0Rlc3bDVTN05vd2VUT3N0YnJhODRGSWlGM24rZVhDRVREREtP?=
 =?utf-8?B?NEN0dEpWcUZWZ0Zud1NjUUVrOFNJK3ZXQ3dDUitaSjZsN0s2ajJmNmpvMzVD?=
 =?utf-8?B?U2tSRGh5TUFHK3JYTG5mbmNvNEFYNkhIajBYbktvSU1kYm5nOUY3aTRKZlR3?=
 =?utf-8?B?REdER2pmNi8reTJ6YW1MT1ljejhuNFl6ZHFCUklSQU5TL2ZOMXNzUCtRdDFx?=
 =?utf-8?B?NnRtSEEvWThlMUxxeWJ4MHFra3lNbU1PdGUvdlBmQVdkVnVQakhocWpad3Qz?=
 =?utf-8?B?SlpzV1JUdktXU3FhdVZtOWEzTS9WRHBWV3lWM2dMaUkyZVZUSEhVNmxWNE5n?=
 =?utf-8?B?UmV5L0RwLzRiS3hwd3c0NlhXSmo2YklKVXZnT0ppR2Z1aEdpMFk0aitac2FI?=
 =?utf-8?B?eVVwZHJ6N0NVcUFsQnoydTNUMW1TU0JRYkQrbTYreHF2V3Qrd3QxOXdLQW4z?=
 =?utf-8?B?NXhkUHBuVS9OODBEc1Z6dkticExGd1VuQkVtNjUvT3U0Mld5a05BejNNV0lq?=
 =?utf-8?B?bnJFK0tNSUI0RWd5MnhLUW1mSlpWcTFaNWEzZ2tRbGlkQnRqK1N5S3dwdFpV?=
 =?utf-8?B?dW9Sd3hXbXUzWXJlQVV2cnFzeU5QL1l6M1pXQkFvZldMT21IN1ovditjbWF2?=
 =?utf-8?B?SHRrdnlCd1I0WnJOUitjY3cxckNYYVpFRFAvU0ZZSkd4c3hzc29iUlZCTFV0?=
 =?utf-8?B?MmZ0SXZ6QmlHMTZ3MG5TMWxXYXVXc2ZSWHRUUDZlSG5CODNiNzFCU242bkJp?=
 =?utf-8?B?a3ZLSjlsNWpKQ3FOK0pNK1NYYXI5dTQ4UVg3bFptY0ZEZjNYZFFJU3ZnRWtv?=
 =?utf-8?B?b0RPclpZYkVieUlrbXlTYStmcVpkTjNoOTFFcE9YZkdLUlBhRHBVVzdKSWxw?=
 =?utf-8?B?RFJKanZ1Q1RXYUFGNEtHdFRBeUFvUm03aDVDWC9NMUc4TWpXYVlKYktvSCtw?=
 =?utf-8?B?MVpIOXZlWkxUdWgyMDJUbUFnd05iYkl4MVYwWXFqanFGeDJjSzVzOFlKSDh5?=
 =?utf-8?B?cGE5QTcrSExTQU1Wc1VGVUFCN2xTSU42Y3I0VFphVmN2UDJEMWZhVTVnd0dG?=
 =?utf-8?B?SXFTVFVJMmtxTlU0ZVBFakQrd3dFdG5FQzBDMjdsV3BneHUxcGxXUDc1SVdC?=
 =?utf-8?B?NTIrbnlwL3FMRmR6aVZvQ1k5dHNTMElILzRLcDE1cnErMGF4SFJUUlJGTzB5?=
 =?utf-8?B?OWNyaUVLZ1VzUVIwOXZlbVM4YlVCWk15WFVlN2dyUFZ4ODhwdlFOelV1a0pn?=
 =?utf-8?B?ZUdhWWx2d21CeFlkSGZCbWlNeEFIVUFheE5aT3llL1VOdUt4aWRBeUhKVUpk?=
 =?utf-8?B?aSs3UGxZUzdQNCtzSjZLbE1VenExaDR5NFJjNFVETExJVVl2U3VBQkNlWXh6?=
 =?utf-8?B?bTJhNk1oeW03RVNienNINnBaYVVST2szc1JDWTBjc3hDUVlKbjB3RVR5Y3Bx?=
 =?utf-8?B?ZUZUUnJtWkN3YkppaVl4N29aWjUrazdzV2lOUUtZMzNpMk9QTkI2WXZzeDA4?=
 =?utf-8?B?NnYyOVdZOForUjcvcWI4UGxTL05Ld0JGRzc3WnQ3N0k3ajFhYzloRkZlWnBS?=
 =?utf-8?B?VWdWMHB1U1lPc1h1YlBPcTJuZlVWZ1g5Z3M0d3FlK3ZoT3hkcXZPSW83ODE4?=
 =?utf-8?B?UXhtY3BRWUw3ZzUvcXdSWnpST05nQlJVU1MxWUdQUlozVlJGQ2R2eklLMnBZ?=
 =?utf-8?B?dCtDd0ttUnBPUC9oWlE3TWNtRTVZYjFJUHdtRHIwNkhlcytBMlJpZHY4RFZi?=
 =?utf-8?Q?OAJ/sTS0bzJc+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkhWSVIwaUJxRFJtWGFiWWlBa1hHVUkyamZaY21EMDJTcHM2YVFhMlBnblZT?=
 =?utf-8?B?bGpJdlhoZm45R0VqblNTcTJBaWZWVWdLTFJEejVFa3hkT1JzTVJRdU9SQk00?=
 =?utf-8?B?RnU5R2lFMlNWRmxZNDVNTk4rRnlNb2Z1UUk3SHpIb1ZHb0RDQldxaGs2UWU5?=
 =?utf-8?B?c3gvalAzSERSVzBoaXpDWExlaTdiSXhtSllxbW1Xc0h3b2pXNUVqTU9kSld6?=
 =?utf-8?B?SXNHd3VFL3NPQ2c5bXdQcExSclR2VUpIYnh1c2QvVDBhZm5rTXFoNWs2UTBV?=
 =?utf-8?B?Y2NuOWd3Mlo0UXBpKy8xUFZYd0VRdUF6RDJFRG5vdC95M21jYzB0NmZTUlRH?=
 =?utf-8?B?dFFCdTVYRXpLb0pwYS93L1VnNmJkZE8wcnUzZnFpY2hQTUZBVFZQUW5UVVRV?=
 =?utf-8?B?V1RUWmtjNUVrYWs1dGdvUGdQeEdEMFJPOWJhY1VmaElBOU1zeFJib1JHYUZE?=
 =?utf-8?B?MDlHWklhZHA1dGVZQ08vTndYMEhuMkVML0V5V01ybmhHOVlPV01ycFBERmxy?=
 =?utf-8?B?TkFmUEY0My84eEN6SWNERVlzK0pTM090alN3NXo5eU9iNzk5c0VreVU5RjBQ?=
 =?utf-8?B?TzlWOGRTQnVMYUtOWnBpYnZiK3ZtNVFGdmJOYURyZDFTN0cwTmVJZFF2OE5k?=
 =?utf-8?B?dUVsRGovS29ydTBsWm15eWR3Y04rV1FLOWxZTG1ISHZpQi9FRWMzbWF0anor?=
 =?utf-8?B?eXkyRHFCZStGTWtlOEFDK3RnSGR4aTF0dCt4OEVUVXpmbmVSSC9rdzBzWkp1?=
 =?utf-8?B?MHFlS2tscGdOWVBiOVJLR2RMZ3JSczZzUGxqVWxVa21LalE2Y2tLWlZPSGEy?=
 =?utf-8?B?RElqV041MjgzYnJ6eWpWWGNaTGlFM3MwTGlqNTBESFRjV2R2RDc2UU1TMDRw?=
 =?utf-8?B?QWxBU2E4TmV2V1puSEYvTS9BdmRNMGJnZVlNYWljc0MzUG54SVBnN0ZPVnZm?=
 =?utf-8?B?TDIwRTZSUnhqdHZIWnJFalNhb1kxTVBRY0JjRzlqYnJZcUI1R3NjMXVLUHdp?=
 =?utf-8?B?cU9EOU01eUhVSVpERytlOHFac1RzMEt6WGlDK1hhbjVMeFpOQ0YrWWUrYVRs?=
 =?utf-8?B?ZEV6TkdXR1ppSlhkQit5bzByYi9uNUxvSEVYLzZGSGl6WEdTRWl1Zy9RNGZw?=
 =?utf-8?B?MDhYNW1VQ3NycUhnTHE0RFdmRlhNb2J1dkYrdWdrYmI4cnh4WFlVYStEUEsr?=
 =?utf-8?B?MnBERjQ0N1dWZnd0dWhIUERwK3N5Q1pod21vMEwyd0w4K2RhN0k2Zy9xK3o5?=
 =?utf-8?B?SXd6N3djRG9GVHpzZVhYeG01K2txK3drM2IzMVAwb1hYVSt3U3hKTUh5VjBX?=
 =?utf-8?B?WEVmOGEzSmRxVVdhc1UwaWF3TE82cXJYNU1xcFpDNVZNV09VV0dWZkVrVlBB?=
 =?utf-8?B?VGp2eTBWNTdxMGY1UE1pNURCc0U1TFhYaHk4TWxsZEVWVGN2eG1yS2xLbUxQ?=
 =?utf-8?B?cHNWSmI3czlpemY3K2hlTHFNeWFOL3kyWjFDcWMyamFKeHV1RlNYNS9vS0Nq?=
 =?utf-8?B?cS93SVNZTmw0MzJwVStzbEQ2OEJsWmlJWXhJN0pqckFINHZPNDk2RXJKbnVr?=
 =?utf-8?B?VWdkbUxvTDY2K2RPVk9JRGpuZmpVMVBla3JsMjF2U2tpSytKUU1KcW9wT1Q4?=
 =?utf-8?B?d09YdlRQbzF0L05rOVZVNzdkWE1LUnU4aDdUZkdERjlKZkFLalRZZlpySkdH?=
 =?utf-8?B?NDJ4eGJPelh4NHJxR1V4akk0MWIvVDQ5TU5SdGVRYkh5YUJxNWNCSi9CcGZ4?=
 =?utf-8?B?ZmxFRXhNMnNSS0VKUlNDTDRYaEFBZllqTFdsdWFKVVBGUGVSeG1Qc2Q4OUpq?=
 =?utf-8?B?RUltNTVTUC9YU0VPSzBBeFdjOFp4Vk1rV29ISjVTdWZtaXV6U29LMFRPV1Az?=
 =?utf-8?B?S2tRZktBeGQySWVheHd2Z2ZBb3ArRlhJYWwyaEVlTXBLQ21TdWx2QnNSZGdk?=
 =?utf-8?B?UmhISmplWHFDYmdGaitpNEJFbUhjVXZ5Z3NXRVprcncyUUhQaktLMkV6aG83?=
 =?utf-8?B?MUgyN3lneXdNRjh6cUtWMnlSbzBsMHhaN3FUamszU1lGWHNnS1BOZzJMTXB5?=
 =?utf-8?B?NnVFTWNlRjI5bmZHbHFFWE5jamFlLzUwVjNEV2o2aW50UzJnZHBBSzVXOFlz?=
 =?utf-8?B?UmJVdUJNcXpUWHJUTGZzUnllTUg1UVVOYjhwbTV0d1BYYXpKblBLZGJOZlBE?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231f58e7-931a-4935-e4d3-08dd9211673a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 11:29:20.2474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQd0JsM7EImJn5U7oSKCe8er6Jo8w3QZQ7ZEX68t7d8YQNAL3pFt/CEAuwttbCq0GaD26IHRkJPNr7/zImwUpb/iLEdfF2DFA/LgrujpVtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
X-Authority-Analysis: v=2.4 cv=EojSrTcA c=1 sm=1 tr=0 ts=68232d15 cx=c_pps a=PZJ0/dUMjH0jBWORzn298Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=pGLkceISAAAA:8 a=z6gsHLkEAAAA:8 a=5XEKNrCyV9zsAaRDxiYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FkGh3qDytyf094M0uOEt:22
 a=NxI9r9ql2kHpUT0AVVEO:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEwOSBTYWx0ZWRfX2Jd4Tep26a6R k4/DdhH6g07/KTr3IXRD6NWAmAVqKwA9XenUggYoeBh696JUKv/KubD950chEpyWkiAoBWw7f/5 bqN+uZaXr3vFmbzY19bMgo8br1CPxCgDGLlV4z/metj/s/bMZ/6qM9gdVPadAsz9fNzFXqhr57r
 JDsv39KQ5IADE4nJuyEevFhGn3Gx/2B9cXJDiGN1BFkwEU3lvOhz9LFTxibUIDrvKxFbUbe3ReD GS/HJIECpobnURsO/ELpQC9K6Zoy8iQH6Y/ZC1CDn32s02AzzILa0pfXTov/MFRfNGOdQ+8WkUP 86VRv9izgmSnzA2gNmQTAYptqym+QVbBrLPnsTRmGj9SWq9+YGTEtuqKU6InV0MwCD7bbeYGimz
 y+sc9p06PE9aeU+0+ezM37LL++thOyNJvsdk9lcma08zrzm+EpDA819cminLGsAnwPgB7EAi
X-Proofpoint-GUID: qp0NB3sNFbYkikmJe6Is6JWtGVYhQkJr
X-Proofpoint-ORIG-GUID: DH-0TeHwdclVltY1mMKl77ygLSx4eGAD
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505130109
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54D5H7Ub007109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 11:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216418


On 09-05-2025 12:43, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Have you built it for qemuriscv64 ?
No, I only build for qemux86.

Should I test for qemuriscv64?
../Yogita
> On Thu, May 8, 2025 at 10:28=E2=80=AFPM Urade, Yogita via
> lists.openembedded.org
> <Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Yogita Urade <yogita.urade@windriver.com>
>>
>> Includes fix for CVE-2024-54551, CVE-2025-24208, CVE-2025-24209,
>> CVE-2025-24213, CVE-2025-24216, CVE-2025-24264 and CVE-2025-30427
>>
>> Changelog:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - Limit the data stored in session state.
>> - Remove the empty area below the title bar in Web Inspector when not =
docked.
>> - Fix the build with GST_DISABLE_GST_DEBUG.
>> - Fix the build with GStreamer < 1.20.
>> - Fix the build with video disabled.
>> - Fix the build with clang 20.
>>
>> Drop 0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
>> and 0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
>> which are part of upgrade.
>>
>> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
>> ---
>>   ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 -----------------=
-
>>   ...or-no-matching-function-for-call-to-.patch | 77 -----------------=
--
>>   ...ebkitgtk_2.48.0.bb =3D> webkitgtk_2.48.1.bb} |  4 +-
>>   3 files changed, 1 insertion(+), 155 deletions(-)
>>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pi=
ck-292304-main-7ffc29624258-.-https-bugs.we.patch
>>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-EnumTrait=
s.h-error-no-matching-function-for-call-to-.patch
>>   rename meta/recipes-sato/webkit/{webkitgtk_2.48.0.bb =3D> webkitgtk_=
2.48.1.bb} (96%)
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-29230=
4-main-7ffc29624258-.-https-bugs.we.patch b/meta/recipes-sato/webkit/webk=
itgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
>> deleted file mode 100644
>> index 5cbb1035b2..0000000000
>> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-=
7ffc29624258-.-https-bugs.we.patch
>> +++ /dev/null
>> @@ -1,75 +0,0 @@
>> -From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 200=
1
>> -From: Adrian Perez de Castro <aperez@igalia.com>
>> -Date: Tue, 18 Mar 2025 07:39:01 -0700
>> -Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
>> - https://bugs.webkit.org/show_bug.cgi?id=3D289953
>> -
>> -    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
>> -    https://bugs.webkit.org/show_bug.cgi?id=3D289953
>> -
>> -    Reviewed by Alicia Boya Garcia.
>> -
>> -    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc+=
+
>> -      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MO=
DE
>> -      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTI=
ONS.
>> -
>> -    Canonical link: https://commits.webkit.org/292304@main
>> -
>> -Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c=
105443d41e5ce3de3a4cac2ed8a07ebd134459]
>> -
>> -Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
>> - 1 file changed, 19 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsC=
ommon.cmake
>> -index f6cf5ee..3178674 100644
>> ---- a/Source/cmake/OptionsCommon.cmake
>> -+++ b/Source/cmake/OptionsCommon.cmake
>> -@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
>> - ")
>> - check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_=
LIBCPP)
>> - if (CXX_STDLIB_IS_LIBCPP)
>> --    set(CXX_STDLIB_VARIANT "LIBCPP")
>> --    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
>> -+    set(CXX_STDLIB_TEST_SOURCE "
>> -+        #include <utility>
>> -+        #if _LIBCPP_VERSION >=3D 190000
>> -+        int main() { }
>> -+        #else
>> -+        #error libc++ is older than 19.x
>> -+        #endif
>> -+    ")
>> -+    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB=
_IS_LIBCPP_19_OR_NEWER)
>> -+    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
>> -+        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
>> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=3D_LI=
BCPP_HARDENING_MODE_EXTENSIVE)
>> -+    else ()
>> -+        set(CXX_STDLIB_VARIANT "LIBCPP <19")
>> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=3D=
1)
>> -+    endif ()
>> - else ()
>> -     set(CXX_STDLIB_TEST_SOURCE "
>> -     #include <utility>
>> -@@ -239,7 +253,7 @@ else ()
>> -     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB=
_IS_GLIBCXX)
>> -     if (CXX_STDLIB_IS_GLIBCXX)
>> -         set(CXX_STDLIB_VARIANT "GLIBCXX")
>> --        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
>> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=3D1)
>> -     endif ()
>> - endif ()
>> - message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
>> -@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
>> -
>> - if (USE_CXX_STDLIB_ASSERTIONS)
>> -     if (CXX_STDLIB_ASSERTIONS_MACRO)
>> --        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTION=
S_MACRO}=3D1")
>> --        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=3D1"=
)
>> -+        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTION=
S_MACRO}")
>> -+        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
>> -     else ()
>> -         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS=
_MACRO undefined")
>> -     endif ()
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-erro=
r-no-matching-function-for-call-to-.patch b/meta/recipes-sato/webkit/webk=
itgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
>> deleted file mode 100644
>> index 5b83d9e7eb..0000000000
>> --- a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-ma=
tching-function-for-call-to-.patch
>> +++ /dev/null
>> @@ -1,77 +0,0 @@
>> -From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 200=
1
>> -From: Fujii Hironori <Hironori.Fujii@sony.com>
>> -Date: Tue, 18 Mar 2025 10:25:47 +0900
>> -Subject: [PATCH] EnumTraits.h: error: no matching function for call t=
o
>> - 'enumName' with Clang 20 https://bugs.webkit.org/show_bug.cgi?id=3D2=
89669
>> -
>> -Reviewed by NOBODY (OOPS!).
>> -
>> -Clang 20 couldn't compile EnumTraits.h.
>> -
>> -> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid =
explicitly-specified argument for template parameter 'V'
>> -
>> -An invalid enum value can't be specifed to the template parameter `V`.
>> -
>> -> template<auto V> constexpr std::span<const char> enumName()
>> -
>> -The upstream Magic Enum C++ has a template variable `is_enum_constexp=
r_static_cast_valid<E, V>` to check a enum value is valid.
>> -<https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136=
a384c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634>
>> -
>> -Imported the template variable.
>> -
>> -* Source/WTF/wtf/EnumTraits.h:
>> -(WTF::enumName):
>> -(WTF::makeEnumNames):
>> -
>> -Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/425=
97]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
>> - 1 file changed, 20 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.=
h
>> -index 0d33e39a..95e6318b 100644
>> ---- a/Source/WTF/wtf/EnumTraits.h
>> -+++ b/Source/WTF/wtf/EnumTraits.h
>> -@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
>> - #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
>> - #endif
>> -
>> -+#if COMPILER(CLANG) && __clang_major__ >=3D 16
>> -+template <typename E, auto V, typename =3D void>
>> -+inline constexpr bool isEnumConstexprStaticCastValid =3D false;
>> -+template <typename E, auto V>
>> -+inline constexpr bool isEnumConstexprStaticCastValid<E, V, std::void=
_t<std::integral_constant<E, static_cast<E>(V)>>> =3D true;
>> -+#else
>> -+template <typename, auto>
>> -+inline constexpr bool isEnumConstexprStaticCastValid =3D true;
>> -+#endif
>> -+
>> - template<typename E>
>> - constexpr std::span<const char> enumTypeNameImpl()
>> - {
>> -@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
>> -     return result;
>> - }
>> -
>> -+template<typename E, auto V>
>> -+constexpr std::span<const char> enumName()
>> -+{
>> -+    if constexpr (isEnumConstexprStaticCastValid<E, V>)
>> -+        return enumName<static_cast<E>(V)>();
>> -+    else
>> -+        return { };
>> -+}
>> -+
>> - template<typename E>
>> - constexpr std::underlying_type_t<E> enumNamesMin()
>> - {
>> -@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_sequence<=
Is...>)
>> - {
>> -     constexpr auto min =3D enumNamesMin<E>();
>> -     return std::array<std::span<const char>, sizeof...(Is)> {
>> --        enumName<static_cast<E>(static_cast<std::underlying_type_t<E=
>>(Is) + min)>()...
>> -+        enumName<E, static_cast<std::underlying_type_t<E>>(Is) + min=
>()...
>> -     };
>> - }
>> -
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recip=
es-sato/webkit/webkitgtk_2.48.1.bb
>> similarity index 96%
>> rename from meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
>> rename to meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
>> index 6eb80da1de..41fe8209ce 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
>> @@ -16,11 +16,9 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${B=
PN}-${PV}.tar.xz \
>>              file://no-musttail-arm.patch \
>>              file://t6-not-declared.patch \
>>              file://sys_futex.patch \
>> -           file://0001-EnumTraits.h-error-no-matching-function-for-ca=
ll-to-.patch \
>> -           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-b=
ugs.we.patch \
>>              file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.o=
rg-show.patch \
>>              "
>> -SRC_URI[sha256sum] =3D "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4=
769f34cbfdf0eebf88e"
>> +SRC_URI[sha256sum] =3D "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b0=
16a93f71dbfa1eb258f"
>>
>>   inherit cmake pkgconfig gobject-introspection perlnative features_ch=
eck upstream-version-is-even gi-docgen
>>
>> --
>> 2.40.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#216185): https://lists.openembedded.org/g/openembe=
dded-core/message/216185
>> Mute This Topic: https://lists.openembedded.org/mt/112893933/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

