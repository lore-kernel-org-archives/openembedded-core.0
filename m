Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A94E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 14:52:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12707.1733410340823007826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 06:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20694430d2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56m1kc006528
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Dec 2024 06:52:20 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7x04x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 06:52:19 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B5EqJH7032512;
	Thu, 5 Dec 2024 06:52:19 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7x04w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 06:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijQGV8F1/J/CmaoAJFtbJHr72K8y+3EQiPYPcWvzZPLtaTrXjZ3sLrZVzzKTQ9O9Xrr/Bl8dSQfETQoc8GCi7eIPHnTULHaRSOsh8NDpAYV3S9jlhfo4S/ah+KImda3q2WixVUPVl7fL/mXjef7OdzCdkSzZvXLrufjth1fjj7THrBtol02AgkU8GgXOD1fBhQVjvz/ajTQKtniEOyIyJRznyrvIynlV9uoK4r8NBIO/8iRaylF8jpuxAUmctGOXWPWH3C9NuZEwSq4Gp5aY60NRhG/OTCjkuGpQwd0ZqVtnCtCnN5dmEHcL7pUEildYu6T/C0Xp05z1SJyW0tbE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qPje2p8TQAksOuTj/gBeDEMdfteZF6Q7oVOczQx9YA=;
 b=PVnd4IFdG0XawIWESKmfPbJnNykBJdyJ0NMZXg+Tye7Ov+KIhvXJ6jIaYsHqinG12exjGdjYUaomnx5vIZr6ACjJI6e0VKy/PaYL+3XCteTi6JQod4mDBaA5YERJZTKdlKYLAUTbBYFmqokpAQdcM5VwfcBRHq5100PHhKf2WF5x/B6FQ8rDE2kniwZBFhqXWVylgZXMoJGIHJUukYsv8jNDj6TYMStAQubgFamTvDvlJSiER9pe3/7w9nAtYemEP4PsAkMnRp/qnS2JvdHzSDxiMKS7O6EgJf8NxUYBRXtAgOluHS0A5OzxF6yc3Qg/DTv9yqlwj8mkwOjugSaUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6661.namprd11.prod.outlook.com (2603:10b6:806:255::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 14:52:14 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 14:52:14 +0000
Content-Type: multipart/alternative;
 boundary="------------oP03AC3eGnq3AhcTmYIXUG15"
Message-ID: <c5abdeee-c3a7-4c69-854d-844a63bfd7c9@windriver.com>
Date: Thu, 5 Dec 2024 09:52:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 1/1] Revert "ruby: upgrade 3.2.2 ->
 3.3.5"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, Yogita.Urade@windriver.com,
        openembedded-core@lists.openembedded.org,
        "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <20241203101426.2227535-1-yogita.urade@windriver.com>
 <5623da37-3663-4bc0-9b50-a5efa34d72ad@windriver.com>
 <CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f9zhy7MsuO0T6h7PhBsPA@mail.gmail.com>
 <1841fe4a-9c73-4205-8146-59c124d6ce61@windriver.com>
 <CANNYZj-uEZOjVtepHHWombR3Ahxr1HkBq8RFiU0=v0a8xAG=GQ@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj-uEZOjVtepHHWombR3Ahxr1HkBq8RFiU0=v0a8xAG=GQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8ce7c6-21bf-4968-f8d5-08dd153c67e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YlpKUnJFM2Y0YzFOUWU0NDlycUtlT1kySUMvaVRoRmQxdWpYSWNQeWc2Z2Yw?=
 =?utf-8?B?S3NENEVtRVMzTjkrKyt6UXlQazIybjRKNVVrVE5mUmUvMEd4NGF0THF6UXVn?=
 =?utf-8?B?M0FnTUY4a2puQW84MVptVmZvTS9IclpaeWJRZFYwc2pieEFKUzdiMGJtM2xH?=
 =?utf-8?B?T3ZxNTZ1QTBPb1NQUGpGTVk2WVZpdmZPRTkraE1uTTlySStPVzJiUW9rMjVC?=
 =?utf-8?B?QlhHMFRLTXNmNVZsTGhUY3ZDZUJTcXd1ZmczLzhFOGhYV0YrYkZla2pmSDE1?=
 =?utf-8?B?QlFlSFBFdmFlVmswUWJOSjI3c2RJd3p5UnBRMlV6ODFuUkVYcFM0WjFiZmVZ?=
 =?utf-8?B?M2FhMGdGVFJNQzl0OGYwVmx1bEJickVvcElETW9CVUNKWVlGQXZtVXZ1VXFF?=
 =?utf-8?B?S0JSbDdTZ2NBYTdDZ1MrWU9nMFhkVDZSU0NSU0ZyY045TUQrVUxjQnVubE5I?=
 =?utf-8?B?cFJlQnExa2NFOWdYUStaaDZDMGhYNWdwTDViWi9pYitOd0c0TmdpSUxmaE9H?=
 =?utf-8?B?UkFmcjlzSWZ5ZGxYUTlyY1dUOTdTOTFQbFJaNk1tM0RGeWR4YVA3SjFDWVRk?=
 =?utf-8?B?OFo2QjFLOEd3bEV2b1lCYnM5enlGUnBZQ1dzQnZzZFQ4V1FBRlFMTEQ1WGZn?=
 =?utf-8?B?bWVFaEUxaHBETms0aWZGOEN0NXBuenJZWFBjNjYzMjZMOTErTThpRkE0alFI?=
 =?utf-8?B?eGVIVTlFUThoNHZiejB3M2t2MEExWVFqZ0JtczJwZ2tQdmZ0MmRQbEhvSS9p?=
 =?utf-8?B?dVBWMkRyNzZOb1Y4cVZkRDI3NXQwMnJ1eXVaQWRFV09FM0xFMGw1MkRBSFIy?=
 =?utf-8?B?ZFNuWk9WbzFJYmZlL3JUSDV4YkNmYjh1djlyTkZlV3ppT0RhQTVXVkgyL09h?=
 =?utf-8?B?ZHd4MFA3enI1WU1SMU8xTmVvT0ptMFJqRFpMcWxGUzFhZkMycVBsdmJqOTVp?=
 =?utf-8?B?dUhHcjV4dlZ5cmRlTkdUUEt5WWtLemlFYWxQN0hJem5XSXZ4R0NlakIvbmxa?=
 =?utf-8?B?UzRvcS9SNTZJT013UnNwTjZtZHhvZy9DWXN5R2N3Y3M2S2xvRmdDaGQzZjZD?=
 =?utf-8?B?eHRETnVpWk0zQnhlQmUrSGNxSG52RHNpM2gzNTR6dWIrU3NWQ1RybitwNWs4?=
 =?utf-8?B?amVnOXFnQ28yQVpxRitrYzRyWXNsamtYbk1FSDROM0RQMFNhZmh1bFY1M2VK?=
 =?utf-8?B?RGdnWHJKT2ZhZFJocmZtTWVpcnY5TE12Z3psQ292UUV1SXRHS0ZxZC8zZml3?=
 =?utf-8?B?OEtCaHhMd1FEYzlOQ0ZYNGxwK1VhcHBmTkljSHJvdzJGT011d25sUXovaVp6?=
 =?utf-8?B?S2E5TjNrRnVIWkNkR3RpVUJPM1NPQUtGNE1HOGhLTzh1ejBPQ3VJRjZLMC9U?=
 =?utf-8?B?M285TjNsQTVIN3B3T01lL21wYXhrV2dqYzhZc1Y4VVJiY2dJK1h5T0kxUk9o?=
 =?utf-8?B?RExkdjYyQnVFOUt4R3IxQ1YyeTkxRHFSSytmZ2U0V09PZ0lrVnJueHY1bjhH?=
 =?utf-8?B?MTFZWGlEWkxXWUpkdnk3aW5SR09YbmY1anpOZWg3Tk5NYStrWExhTlJQT2hO?=
 =?utf-8?B?S1I0OVEzeVpvM0dsZ2FhcXVIS0tPL1l3M3NqYWxjNXRDUTBRVUtSbk52VUli?=
 =?utf-8?B?cjVBK1NSdDNMWFVsQ1Fia2MrdVkzQzNkOEtYSXkwNmxud1k2NnhZTi9HNGdL?=
 =?utf-8?B?SjNkUXd1Vkx2S04rcWpqUzAwaGhZVnRXbVU0L3g5QXJRTkRQNkt1ZVJOcHRa?=
 =?utf-8?Q?YJiU8t/MuvNTz42UvA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzYzOFBiK2F6UFZHbm9tYUhUS3Q1SWQ4NmpCK050bGdSdVBMdzFDTVQrYTND?=
 =?utf-8?B?TU1kSG1KZi8rUTJNVCtyTFBwWHZOQk95Wld4RUpWZkY4T2NWazdCWFU4KzdK?=
 =?utf-8?B?Z1gxcUdUdnY1anRYZ1ZjMnQ1MnlXUmRTZ0hickFNTjAxYU9iZTErdEVTN09M?=
 =?utf-8?B?d3AxcDB2SUdwWVE1cFBiVndQUlVoVzVLcTRqSTZmUEFCSjJTY3oxU3VjQVZv?=
 =?utf-8?B?L3lzNll0Tm9kelpTVzV2TkZGejg4RDNMK28xZlAxeklDTDVRK1Bldk11R3BJ?=
 =?utf-8?B?NW1CWHJkN2UrMEhjQmowZ1JqRm45YjZCbDNHOThEeER6TldtVVVOMk1XN05t?=
 =?utf-8?B?d2VxY253eDNGSnRnVG1TV2I3U1BOdkZ3YlIzK0RkVWNYeFNNQ3FpUGRRYlc5?=
 =?utf-8?B?U1lJTnFmczc1eHV6eVNUaFplVWFGdlFVOEVEejdNNWdxS2pVM3I1L2hCVGor?=
 =?utf-8?B?WkNNa0dVTW5GUGRCVldsZmNFZ2hMcFpoSVg4UVp6UXFDblJqaExqZkRDbzFk?=
 =?utf-8?B?dlNRZi8wRUJFNnp0ZFdUMUxkRVd6VURuclBRaWVOd0FlK21QdW9YQ0FvbWZj?=
 =?utf-8?B?SmgvV050SGFrd3ZpUi91ejdGdjRKQldzSUtvNXE2NUFNZ2hobjA5YS9LZUpV?=
 =?utf-8?B?WFVocWhkUnBjaCtmWWxnK1NGZzVzUWhzSUFIOGJYWUpiN09qeHE0NFNxbEtX?=
 =?utf-8?B?eHY0MVE3c3BVdTBuWHNXV1pBeUgvWnZORlc3N0doV0RJMXZhSGtvcHI0UXJD?=
 =?utf-8?B?MGRPLzQxTzFuSkluTkcrV2hiRkI5bkNRQXlHSCtHTmdLS3U5L0dUWi9VOUVh?=
 =?utf-8?B?VEJGb0V1YWtBcTFQYVVlVFNGQU94ZFBoQm1sZEppYmZJbys4YWVLODAxajRW?=
 =?utf-8?B?S0NuK2RQeHo2ZVdWcy84ZDBjYnZiS0lMejc1ZDBQSzBjSDJLNzFxSGVxSDdu?=
 =?utf-8?B?dW9QSTIrMDB3OXJZSUgyaGNNclFoeVcveERTLzFvclVucjJCSUNDYklzNFhJ?=
 =?utf-8?B?bHE5THl0M0lScURxMEdWMEk5Zk5Xd0JZczh5bnRucVBLKzJxQXZEdkZlOTVn?=
 =?utf-8?B?ZnA4OVRmRENBSFZKeXF4eGlWYkJHVEhmdUNmRlpScjRJd0lFdjBPNW5iM0FM?=
 =?utf-8?B?R0U0QnJlbzM1dGJvZDI3QzBoN2tQQU4rMWxKZ0l2MjZnWW9RZ1ZKbWpVS0hK?=
 =?utf-8?B?ZWlUQ3N1ZHNiK3ppaWdHUkVpR2FWT29ybUNsYno5WkpWSFRCd3hZYXZsOWt2?=
 =?utf-8?B?cW5yTXljd3E0MTZzalRUZzRaTEhRcmE1NEQvZ0NheVpwdW9JYlhzNURIbnh2?=
 =?utf-8?B?MFk3bUZrY2MzdGprNTkyNCtVVjY4Q3RvVGQ5TG96MUtFMmlKWFNmU2ovaXJR?=
 =?utf-8?B?OVNwUVRWSjBONW0yanVrSkRDUTMvQks4alBZb1RrWXRQaUcrRkxWTlE1WVZI?=
 =?utf-8?B?cDRiSUlHdmlXVktOV0d3T3dSaGs0MFJBaFhKQ1hMVGx5OXJuMnlOM2szZVNp?=
 =?utf-8?B?Yk1WOGxrYXRDK1k2ZVVwNmt4S3crV0lHTVVWamdteFJvd2NNTm02THBncnBZ?=
 =?utf-8?B?NXhaYnRPZWp1dnVMTVVOVmtYb3R0RlRLeit3enNnZk5ZZ0Jielp4bVNJekxS?=
 =?utf-8?B?VVhheVZOV1J0a0Z6eUx2ZjAvdmFsamF3VDR4UC9VeTh5a1NxUXBPZnJ1eHdY?=
 =?utf-8?B?dmlTSEQrcFhjNjdUQWlLOGlhcTlta3hCazcvbjdFcS9BNUVUY29tZXR2a2xJ?=
 =?utf-8?B?WVV1ck5JeHY0WnM0RDhpV1dPT3Q0eDROZ1hQWmt2aGNIK0JKVk52cHIvWVdx?=
 =?utf-8?B?d2FHYkJ3L0EySFRYcmprSE8zeWRiMmFQbllxNmcvdWMvMHE0MEFpRSt2TGN1?=
 =?utf-8?B?dnhML3dEMmVFdFJ3cVVBVzVmZXNhcTlYL2k0eG92bU5OTzZ4aGc0dXozc2dB?=
 =?utf-8?B?VTZHelkramkrOHNvMElPY0EwcmxnOUsxRGI0VkF6RFB4Mm1DMlNVdk50WU5O?=
 =?utf-8?B?WW56WHBtTFBlWlFWc1ZoRVF4S0VwWEx3V1YwWjYxaU05d1ZyRlN2clJFdXl6?=
 =?utf-8?B?eEtmaVRhT05zMTF5aEc2RTdtVytQbzVBTFVNZzdsWk5kTGp5VWNwOThBK2RC?=
 =?utf-8?B?SmtUTWRQWk1QcWxMZXNaSkZ0VmRVT2U4Y0ZyOHc3QTFnaTdoajlTQjdCSlhE?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8ce7c6-21bf-4968-f8d5-08dd153c67e6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 14:52:14.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suqYOkJH1LQy5Sylh0K7bZU/KFOktB068i1gY2K9poAPLc/CFO/mTUlddZJmmBxNLZY2W8m7TAI84HCyWS2hQg4Ox0DzgM2V4E07GBYEvaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6661
X-Proofpoint-GUID: GcTLivc5UcZz6utJwlWw-Q3KT1SRnmsa
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=6751be24 cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=2HyfR_PSAAAA:8 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=IjWvnfSUup5aPzayNhwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FXMi997C35jOfpqyPV8A:9 a=jVsigL1rSsNu06Mw:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=0zSPmqmPh2d1CTP8umvz:22 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dnx-o5DVEox3h8140MtCSmy8akLBdksC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_12,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412050107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 14:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208380

--------------oP03AC3eGnq3AhcTmYIXUG15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B56m1kc006528

On 2024-12-05 4:16 a.m., Alexander Kanavin wrote:
> The use of ruby is marginal to non-existent in embedded space.
Agreed, I was going to comment, that thankfully, the error is "only ruby"=
!
>
> In core it's only used in its native variant to build webkitgtk (they
> have some ruby scripts that run during build), and in meta-oe, there's
> openwsman that needs target ruby, and a couple other recipes that need
> native ruby. I think no one's going to notice if this is reverted. No
> one's going to notice the major version update being kept in
> scarthgap, either.
Probably not but for anyone interested:
depends:ruby =3D 9

https://layers.openembedded.org/layerindex/branch/scarthgap/recipes/?q=3D=
depends:ruby

depnds:ruby-native =3D 49, mostly meta-openstack

https://layers.openembedded.org/layerindex/branch/scarthgap/recipes/?q=3D=
depends%3Aruby-native
>
> Was this update prompted by some CVE needing to be fixed, and nothing e=
lse?

Correct, just CVE fixes.

../Randy

>
> Alex
>
> On Wed, 4 Dec 2024 at 22:23, Randy MacLeod via lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>> On 2024-12-04 3:49 p.m., Steve Sakoman wrote:
>>
>> Sigh, I'm sorry I didn't catch this :-(
>>
>> I think my eyes saw ruby "upgrade 3.3.2 -> 3.3.5", I checked the link
>> in the commit message to verify that the changes were all bug/security
>> fixes and I merged it.
>>
>> We've already done a release with this update in it.  Perhaps we can
>> discuss it in the bug meeting tomorrow?
>>
>> Steve
>>
>> Yogita,
>>
>> Please note, that only PATCH level updates are allowed (almost all the=
 time) on stable releases.
>> See:https://semver.org/
>>
>>
>> All,
>>
>> Yikes!
>>
>> Yes, we should discuss what to do in the bug meeting tomorrow and repl=
y here to fill people in on the plans. If anyone has a strong opinion ple=
ase let us know.
>>
>>
>> I didn't even notice that the change was from 3.2.x to 3.3.y when revi=
ewing it.
>> It seems that I assumed that no one would do that!
>> We're all so used to the rule of not changing MAJOR.MINOR that several=
 people overlooked
>> that MINOR was bumped by one.
>>
>> For the 3.2.2..3.2.5 update, we have:
>> =E2=9D=AF git log v3_2_2..v3_2_5 --oneline  | wc -l
>> 242
>>
>>
>> We could even take 3.2.6:
>>
>> =E2=9D=AF git log v3_2_5..v3_2_6 --oneline | rg -v "merge revision"  |=
 wc -l
>> 20
>>
>> https://github.com/ruby/ruby/commits/ruby_3_2/
>>
>> It might be worth having a version comparison check tool to run before=
 release.
>>
>> Thanks,
>>
>> ../Randy
>>
>> On Wed, Dec 4, 2024 at 11:51=E2=80=AFAM Randy MacLeod via
>> lists.openembedded.org
>> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> Add Robert and Hongxu who working with Yogita on this, iirc.
>>
>> On 2024-12-03 5:14 a.m., Urade, Yogita via lists.openembedded.org wrot=
e:
>>
>> From: Yogita Urade<yogita.urade@windriver.com>
>>
>> This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.
>>
>> This isn't a minor version upgrade.
>> $git log v3_2_2..v3_3_5 --oneline  | wc -l
>> 6924
>>
>> Do we have any ruby experts to comment on the stability of the 4.2 bra=
nch
>> and the update to 3.2.5?
>>
>> They claim to be following a semantic versioning scheme:
>>    https://www.ruby-lang.org/en/news/2013/12/21/ruby-version-policy-ch=
anges-with-2-1-0/
>>
>>
>> Ruby is a fairly large code base:
>> ----------------------------------------------------------------------=
----------
>>   Language             Files        Lines        Blank      Comment   =
      Code
>> ----------------------------------------------------------------------=
----------
>>   Ruby                  7914      1480730       202190        82299   =
   1196241
>> ...
>> ----------------------------------------------------------------------=
----------
>>   Total                 9409      2188531       271762       197233   =
   1719536
>> ----------------------------------------------------------------------=
----------
>>
>> The git repo does have a branch for each release which would indicate
>> that they are at least familiar with the idea of stable releases.
>>
>> Other than the number of commits being large, do we have
>> any data to support the idea that this is not a stable release update?
>>
>> Yogita,
>>    What are the before, after and diff ptest results?
>>
>> ../Randy
>>
>>
>>
>>
>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> ---
>>   ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
>>   ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
>>   ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
>>   ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
>>   ...eproducible-change-fixing-784225-too.patch | 26 ++---
>>   .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
>>   .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
>>   .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
>>   .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++=
++
>>   .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
>>   .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
>>   .../ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb}     | 13 ++-
>>   12 files changed, 446 insertions(+), 25 deletions(-)
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C=
11-_Alignof-to-define-ALIGN_OF-when-poss.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Mak=
efile.in-do-not-write-host-cross-cc-item.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS=
-for-the-link-of-libruby.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Mak=
efile.in-filter-out-f-prefix-map.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.=
patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.=
patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.pa=
tch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.pa=
tch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_includ=
e_macros.patch
>>   rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb}=
 (88%)
>>
>>> < snip >< snip ><
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208361):https://lists.openembedded.org/g/openembed=
ded-core/message/208361
>> Mute This Topic:https://lists.openembedded.org/mt/109897713/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------oP03AC3eGnq3AhcTmYIXUG15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B56m1kc006528

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-12-05 4:16 a.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-uEZOjVtepHHWombR3Ahxr1H=
kBq8RFiU0=3Dv0a8xAG=3DGQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">The use of ruby is marginal =
to non-existent in embedded space.</pre>
    </blockquote>
    Agreed, I was going to comment, that thankfully, the error is &quot;o=
nly
    ruby&quot;!<br>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-uEZOjVtepHHWombR3Ahxr1H=
kBq8RFiU0=3Dv0a8xAG=3DGQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

In core it's only used in its native variant to build webkitgtk (they
have some ruby scripts that run during build), and in meta-oe, there's
openwsman that needs target ruby, and a couple other recipes that need
native ruby. I think no one's going to notice if this is reverted. No
one's going to notice the major version update being kept in
scarthgap, either.</pre>
    </blockquote>
    Probably not but for anyone interested:<br>
    depends:ruby =3D 9<br>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembe=
dded.org/layerindex/branch/scarthgap/recipes/?q=3Ddepends:ruby">https://l=
ayers.openembedded.org/layerindex/branch/scarthgap/recipes/?q=3Ddepends:r=
uby</a></p>
    <p>depnds:ruby-native =3D 49, mostly meta-openstack<br>
    </p>
<a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded.or=
g/layerindex/branch/scarthgap/recipes/?q=3Ddepends%3Aruby-native">https:/=
/layers.openembedded.org/layerindex/branch/scarthgap/recipes/?q=3Ddepends=
%3Aruby-native</a><br>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-uEZOjVtepHHWombR3Ahxr1H=
kBq8RFiU0=3Dv0a8xAG=3DGQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Was this update prompted by some CVE needing to be fixed, and nothing els=
e?</pre>
    </blockquote>
    <p>Correct, just CVE fixes.</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj-uEZOjVtepHHWombR3Ahxr1H=
kBq8RFiU0=3Dv0a8xAG=3DGQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Alex

On Wed, 4 Dec 2024 at 22:23, Randy MacLeod via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 2024-12-04 3:49 p.m., S=
teve Sakoman wrote:

Sigh, I'm sorry I didn't catch this :-(

I think my eyes saw ruby &quot;upgrade 3.3.2 -&gt; 3.3.5&quot;, I checked=
 the link
in the commit message to verify that the changes were all bug/security
fixes and I merged it.

We've already done a release with this update in it.  Perhaps we can
discuss it in the bug meeting tomorrow?

Steve

Yogita,

Please note, that only PATCH level updates are allowed (almost all the ti=
me) on stable releases.
See: <a class=3D"moz-txt-link-freetext" href=3D"https://semver.org/">http=
s://semver.org/</a>


All,

Yikes!

Yes, we should discuss what to do in the bug meeting tomorrow and reply h=
ere to fill people in on the plans. If anyone has a strong opinion please=
 let us know.


I didn't even notice that the change was from 3.2.x to 3.3.y when reviewi=
ng it.
It seems that I assumed that no one would do that!
We're all so used to the rule of not changing MAJOR.MINOR that several pe=
ople overlooked
that MINOR was bumped by one.

For the 3.2.2..3.2.5 update, we have:
=E2=9D=AF git log v3_2_2..v3_2_5 --oneline  | wc -l
242


We could even take 3.2.6:

=E2=9D=AF git log v3_2_5..v3_2_6 --oneline | rg -v &quot;merge revision&q=
uot;  | wc -l
20

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ruby/ruby/c=
ommits/ruby_3_2/">https://github.com/ruby/ruby/commits/ruby_3_2/</a>

It might be worth having a version comparison check tool to run before re=
lease.

Thanks,

../Randy

On Wed, Dec 4, 2024 at 11:51=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:

Add Robert and Hongxu who working with Yogita on this, iirc.

On 2024-12-03 5:14 a.m., Urade, Yogita via lists.openembedded.org wrote:

From: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yogi=
ta.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>

This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.

This isn't a minor version upgrade.
$git log v3_2_2..v3_3_5 --oneline  | wc -l
6924

Do we have any ruby experts to comment on the stability of the 4.2 branch
and the update to 3.2.5?

They claim to be following a semantic versioning scheme:
  <a class=3D"moz-txt-link-freetext" href=3D"https://www.ruby-lang.org/en=
/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/">https://www.rub=
y-lang.org/en/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/</a>


Ruby is a fairly large code base:
-------------------------------------------------------------------------=
-------
 Language             Files        Lines        Blank      Comment       =
  Code
-------------------------------------------------------------------------=
-------
 Ruby                  7914      1480730       202190        82299      1=
196241
...
-------------------------------------------------------------------------=
-------
 Total                 9409      2188531       271762       197233      1=
719536
-------------------------------------------------------------------------=
-------

The git repo does have a branch for each release which would indicate
that they are at least familiar with the idea of stable releases.

Other than the number of commits being large, do we have
any data to support the idea that this is not a stable release update?

Yogita,
  What are the before, after and diff ptest results?

../Randy




Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
 ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
 ...eproducible-change-fixing-784225-too.patch | 26 ++---
 .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
 .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
 .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++++
 .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
 .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
 .../ruby/{ruby_3.3.5.bb =3D&gt; ruby_3.2.2.bb}     | 13 ++-
 12 files changed, 446 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_=
Alignof-to-define-ALIGN_OF-when-poss.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefil=
e.in-do-not-write-host-cross-cc-item.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for=
-the-link-of-libruby.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefil=
e.in-filter-out-f-prefix-map.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patc=
h
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patc=
h
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_ma=
cros.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D&gt; ruby_3.2.2.bb} =
(88%)

</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">&lt; snip &gt;&lt; snip =
&gt;&lt;
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">
--
# Randy MacLeod
# Wind River Linux


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#208361): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/208361">https:/=
/lists.openembedded.org/g/openembedded-core/message/208361</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/109897713/1686489">https://lists.openembedded.org/mt=
/109897713/1686489</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------oP03AC3eGnq3AhcTmYIXUG15--

