Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FED2C27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 02:45:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4596.1716950702307140459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 19:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6879a5a475=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T20SKc011125
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 19:45:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybb90bhcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 19:45:01 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44T2j0Mn005958;
	Tue, 28 May 2024 19:45:00 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybb90bhca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 19:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U19NFK9DzBOYphAYf7R/QyvMPMzpWt+ErfQM5YPcwF2x84hXl67iyQnMak9PWweO/xkX5j5ZhhvHBLhw+fZw3nt7HgzF5cbz2qUxMbOZ+4z2pCz53oJ9dz5DKARql7Sc8/R4x27PDgpb0fL0hw3NiN54LzdLfQmH2IkkqwbxwnM0mN6HprrOdeOBSGBZ6gVHr4ts5nus5XvYMkWj5PlvePVNtjQxXHpZuV7yzpGGCHU+FAxCpjN2b9o/ZVRmOwzpN0I/hMdqP+US62YPia6pRaEd+Dg5BkS9KGl+flOv2Ee/TdiRqrKShlwNpn/byheqoqd0y9k6nZxaEBtfiiiHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PygfburR6kqrzkBWyGYW4cbLN+MpkYuwXD+EY28Y6iw=;
 b=l36zT7Q03ViaFrNpXkolnDmHXsxyDY4JP0mAs7OsYEMMs5K1NsnVsthJAmQW5M9MU9ElqIZm/JXZ2XXjeMkNwLlnQ+s9H5smTtn+DFz6zZfv+ANescM4xkSM0d3lbUfpYSkVwRdvsRGcZgWyYyLu3GLUG4gRcDBcpk1pCcEkZ5OpwBXxzBxYEC/AOd/t+0pb3RslfPyUVaLxIf3d4ln7UPR3ZGOy6uksWwsXRvdf0lpmKoiq5xj5A7EdNPjVgBVOR/Cj8VpDNDwvo8qNn9sTtjuAWzjqGEn23/Gfq6y4DgExy8I4kfR2SyVLFDxiwEHYRQmViReh8La4IrS1ii/Wdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 02:44:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 02:44:56 +0000
Message-ID: <c92cb41a-8d19-6d7f-bd6d-6a583096ac0d@windriver.com>
Date: Wed, 29 May 2024 10:44:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from
 2.39.3 to 2.40.1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240525050348.2443339-1-Qi.Chen@windriver.com>
 <20240528180621277ecf41@mail.local>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240528180621277ecf41@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc13597-faf9-43f2-37ce-08dc7f895315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V042TW5EUWZibjhjbGxBMEZkdnZ4enBiLytFd1Zad0VWdnN0TjhsMUlzUFA5?=
 =?utf-8?B?djhqTDRlTHhVL1E0N1p2NmlnM3dEdFBlMUVycVlKT1R1M2ZmajRvVzBVY3Fy?=
 =?utf-8?B?SU4yUnp1L2ZYNUJDdmU4YjdhSHBKVUtzQnl0djZXZGpmekxZdWRQbWh6NXFO?=
 =?utf-8?B?dlNSMEQzWUk1enZLR2g5dFVaODJHM1ZxU2JjZGFCU0M3S1RNcjRrRUhiRG5z?=
 =?utf-8?B?b1pidTdWZXIyd0RCYTVPTjQyK0RFK0FJd1JYbGxxM0FHbEU2ZUFFRytiSU40?=
 =?utf-8?B?ZVg3eVJKUXM1WTR2dC8xMkEwWUZ6dGNlNzFnSGorK3ZhVGtLMjR6bkdwaU1G?=
 =?utf-8?B?RzBOQU1tcnNTOGR4OFZoRGtUdHM3RVM0VitJbU1LYnZDTjZrNE5PZDFlOHFq?=
 =?utf-8?B?TzBCSVdsRnBuNjFNdStUMUY4SVdiR3pzREY0ZHNFdGprM0JGRElIZExrTWxk?=
 =?utf-8?B?YWFMTllmNjU1WHFVcE50YzhJMEpxTWVobEJZOUFXSHl5QzBNOVlLVVNYMDRF?=
 =?utf-8?B?K2xDMVBvZTB3TW1RK1FDenNadFhZb1lOMk9aSEZxNEZYb3k5WDRGT3RKMlJ5?=
 =?utf-8?B?TFZ4Q2hEUDhBYkxtb0l1NUpFRVVGSnFETG1UeFZTNzY0VjA4ajkzZzNFcThK?=
 =?utf-8?B?VlNVVlI2eHBGYXRieHRMdXB3bTlrL0hXVm5NR2dFZkM5MUVHdjc4Y2t4elR2?=
 =?utf-8?B?dDVOdVNabmRYS05COG9wNjU4cWluK0cxVTBkQTZ5Y3ZrRU5tNlhMWm1jeGdJ?=
 =?utf-8?B?QXBJMks2cTZBbSt2cHpGT051dkl1ZkJmdnlCVzc2VU52ZWM5c1RhelZZYVFQ?=
 =?utf-8?B?clIxaERHOHpMazd6TEdndW82UzRDRmZVY2FuNGg0cm1QT0o5THNEWkpWN2ww?=
 =?utf-8?B?alNYNUJ6V040MkxiR0lVL0duemdyOXZ1ZFBka2srMWQ2TTRhYmJ5cnRWSFdP?=
 =?utf-8?B?d0x2Qi9IekF2UUxzWEZOTHdWSnRlMTgxdzBsNThjQUlUYkNMVVNrcVpkTDVF?=
 =?utf-8?B?NndKRU5IQ3NEUEJGMk1lNkY3bnNiUk1WYXRTSnpiQ3c5NzRZV01uNVBScnFE?=
 =?utf-8?B?Z1oxQzBBSVdXQzdpT29GVllURW9DaWRHdkZnd0JXN2pwaCt4NEc1NGFNK3F3?=
 =?utf-8?B?SWVWdldORFh4OG9obHEvZzA0UlFURGxBajNSSUhXWENKVTY5SDFHcFFRaTBB?=
 =?utf-8?B?WTEzN0lzQ29IdzVhMGRRbWxRcGtLL2FNL28xQ2o5NVphMlo1RCtLRVZ6cUEx?=
 =?utf-8?B?UjJSL1VwdzZFeXJxVkp3d3gybVB5Sk9QbVdmR1U3aFBUckdGYWs3QWptelJS?=
 =?utf-8?B?NS9RRjRCQUZ0ejVubkdKVkRDSU43eFlnZnFRclhnNlN1S0J3Nk4yV0JBcUVW?=
 =?utf-8?B?YVlXRWtFRkFOU2U0TmFGVmpvQ0dDeUVubXU5bUxzVFVrMXRjL2czekZJSzNU?=
 =?utf-8?B?WWppa2lETzh3cTV4NDV2ZEY1TElHOTh0WnBZZVphVG5WMjk2ZDlSYk5hZExh?=
 =?utf-8?B?NEJFY2lsUU13UkZrZkpKM1VKUnRtUFByZEZCM1djUkVGUFcvMU9RSU5UNWJw?=
 =?utf-8?B?NjNyOEZjZHZRaEZZRGl1OGFlVFNKWTE2bmtrdkZIL0ZGRk52SHlWS3liTHFr?=
 =?utf-8?Q?2ldsc63DMBiJImOhhMof+Ce9JQ8Y49TWSDB900JjT1k8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTVFaHZGaDlXeGFmakNCbHk1azF1L2FYZHpyamJ3WnBSd0N4YytObkE3QmJr?=
 =?utf-8?B?d3JCdk13bEh1OU9HdnZNYm11MHo0enFFSkcyZGhDY0VZZ0trQ0IyMko0OUpo?=
 =?utf-8?B?bDhYYkdranVqVDgvV2JDRGhQQTJvK25KaXVPb0tVRDJ0d1J0elZ0clZkUjla?=
 =?utf-8?B?VFZnVVRNRWlSbkgwK0pkVFpOMTVFU1MzUjlKTEsvK0FXYzZBdjZENWFiSElC?=
 =?utf-8?B?VGRISHhFMTZvMlYxaUVreDY3dkVOeTBwc09aRUJDeE02ZHhETzRhdDBrc3VB?=
 =?utf-8?B?dUZOc000c3ZHU091ZjhTK2l6c2ljMlhsdTg0bXh6SW9Gb3NuM0wxVzRkZDRo?=
 =?utf-8?B?aEM0YUlhSlM4RmpYeUV5M09ORzZ3WXNFeVo5a2Y3WFQzeGdCLzFOWkZiRTdN?=
 =?utf-8?B?MzM5VkxpbFplMEhxaUlCTmkyS25mQ3Nibnd5dWZHTzVobm93aG9qb3RpOWZL?=
 =?utf-8?B?YUcvdk1YbjdQeGpKSXJyMU10cU01RTVsMVd0eWhTV3hPL0RRWFVuWGh3SWgw?=
 =?utf-8?B?TzNhVTNhUU1yMklvR1JGUmIyVCswcFZnRGdxMHRUUUN0akdaTjg0UUFMakEr?=
 =?utf-8?B?NlA2aVRqZnVGWmNlWTdTdmRtRGR4SHFRS2VDVlNFWE1ncmVoZHBtcFZyOTFV?=
 =?utf-8?B?eWtkeDFRZENrSDRQUVRvejlMVVRMMjBlSlpUSG1OQ2JwVTZ5NjE3dnpST01X?=
 =?utf-8?B?Qkh1WlpGVkVzdzFaMmlVVmRHbndKL0JBa3dOUFMxNFlxWjN0eWdTaEhZdmdH?=
 =?utf-8?B?Vis1ckpnamJFZVVSYzM3RklPNXVrWnFzVmUyN0cvTHU5SElEYjhoR1o4UE9F?=
 =?utf-8?B?Zkl6a0hhRzl2Uk5WR1JxQTB2ekEzdmNld1Q2RzdmSDZrR0wzU1BVRkJ1QURT?=
 =?utf-8?B?WnRFSFozOG9TUGI0bjlUM3k4TVdXR3JrTFIwNUEva2xva09HS2MwZEp2M2ZQ?=
 =?utf-8?B?bHNJNEphSEpIRnJwK1BZRGJtTk91VGRwclJjRm5SckVaRVZsdTBWaGp0UElB?=
 =?utf-8?B?UGR6NkxDWmhmU2pPR2U1cEIxYXdKKzVEMkxjWjIvbW1RNWo0MHViOEVvYTI3?=
 =?utf-8?B?dzFGSWM1S1FWZElqRk1QLytOaU9LNlBtem8yVDJnMG1oYzNCRXNpVVNubUhB?=
 =?utf-8?B?YXorSURsbTBzc3h1TlhpSnVFNDE4YUYvT0JRTE8rZ2ZFN0sveFlaSU4zUFNE?=
 =?utf-8?B?OGpnc3Uyc2NWRGhTQ1IwaWxlallWTCt5ZGQ4MUR2YUV1NkZjcVFoVFZQKytR?=
 =?utf-8?B?T3JVQVFKOWhzWklLUUg5V0xEVkVEMk52SDFGbGI0OTM0bi9xMDF3WStGMU9Y?=
 =?utf-8?B?QnBUVUQyN1pab1hXaFl5RGtWMXlBbTZNS1RucnBUS3ozbFhEVjFXYXgvRGds?=
 =?utf-8?B?eEJVM2Z2NWRJNHpuWHdkb3ZTeitzZHdXRlNzeGxlbkVISEVjV0tTZTArd2RY?=
 =?utf-8?B?WWZ4dXNLRjlFTi9VQk4zT3YvSm8wdCtBNXd6bUFML3JiYldlSkE1cjgxazI1?=
 =?utf-8?B?QVNjYkUrTW9sbU5NOHBwTWVMdU44MTl1bkZzQ0V6VlMvZFZxQ29LS1AyTXdj?=
 =?utf-8?B?Y1lRSTIwR2NPQk05ZnBZRmdzdmlZSGg0c2xWZnNCNjN5NnJKOCtkM3AwQXo5?=
 =?utf-8?B?RG1JN0F0VXVuY0Z4elh4amMvYmF6NitsTnhyYnplRGk0YmQ2dG56ZGdBcjV2?=
 =?utf-8?B?VEhKQ1VXcFIzU3ZWcXRSMDFqMDZVYVhXQ1dmdEkwRTAzUTlSZGVJTWQxVWwx?=
 =?utf-8?B?WGlmeW9WMWJ2aVV0RElRemhOa1UvM1dTTUpBRDJHbXBwazdocnNYM1c1UHBx?=
 =?utf-8?B?UWZXazJDZmZDMldPU3lOMTBTR3BFbWJ5WC9ScTJvbzlRaW5hdnlYWmdSNXBx?=
 =?utf-8?B?UjdSaEo0V1hzaWRKbWJjNjhjR0dzRHlWSFVCRVZMOVFCL0t3bHVtV1pvZ0Fp?=
 =?utf-8?B?aGJ2Vm9MSXNrUDladXBreG5LTWcxVUJ0VGRFWUZqSGNPSUJUME9qY1pVVUI4?=
 =?utf-8?B?cVdtWlkxSGRTTkdNVlBOT1IwQ3g2bHlKRnBQVUtidjdXbkc1VmtFMXFzYVNw?=
 =?utf-8?B?a055bVlWWEx0T0hwcExhTXdEaS9saDEvSU1zTjRaZ3RvREQ1UHI4V1FwZjUy?=
 =?utf-8?Q?cXFFv7E98JrU3OoFXhDYI/Msv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc13597-faf9-43f2-37ce-08dc7f895315
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 02:44:56.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjDTdbN7ye8kK1f1roMapRfkO9glODQFk6C0ksDbQ3Kj13GyFBtkTC5CHsrhb0ODOyoI+vPvDoy/HJxiqzzyrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
X-Proofpoint-ORIG-GUID: TrASKnkMmEYSjy_FOKSGJXfIebqiGIV2
X-Proofpoint-GUID: tmtQZa4bQNHPDtdl1-c7NyVA5Bxw4XPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 02:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199980

On 5/29/24 02:06, Alexandre Belloni wrote:
> Hello,
>
> This breaks all the qemu*-alt build this way:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/7875/steps/14/logs/stdio

Hi Alexandre,

I checked the error. This is a problem in systemd 255 that is exposed by 
new util-linux agetty.

See https://github.com/util-linux/util-linux/issues/2896.

The fix in systemd is: https://github.com/systemd/systemd/pull/31202

Looking at the contents, I don't think the above fix is appropriate to 
backport to 255. So we have two options:

1) Modify meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt to 
include the above error message so that the parselogs testcase does not 
fail. We'll then remove it when we upgrade systemd to 256 in the future.

2) Hold this util-linux upgrade until systemd 256 is released. I'll do 
the upgrade and check this problem again at that time.

Which one do you prefer?

Regards,

Qi



>
>
> On 25/05/2024 13:03:48+0800, Chen Qi via lists.openembedded.org wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> License-Update:
>> ===============
>> GPL-2.0 is changed to GPL-2.0-only in README.licensing.
>>
>> The following two patches are removed as they've been there in new release:
>>
>>    0001-login-utils-include-libgen.h-for-basename-API.patch
>>    mit-license.patch
>>
>> Other existing patches are refreshed to avoid patch-fuzz error.
>>
>> A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to build Y2038
>> safe lastlog pam module. This is a new functionality added in 2.40.
>>
>> This 2.40.1 version has the problem of unnecessary remake, causing
>> intermmittent errors at parallel make. The do_compile:prepend is a
>> workaround for this. Upstream issue and PR are:
>> https://github.com/util-linux/util-linux/issues/3061
>> https://github.com/util-linux/util-linux/pull/3064
>>
>> do_install is changed to do_install:append, the legacy codes are
>> removed. They've been there since the born of oe-core. I tested
>> with ccache, there's no error.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...2.39.3.bb => util-linux-libuuid_2.40.1.bb} |  0
>>   meta/recipes-core/util-linux/util-linux.inc   |  8 +--
>>   ...ls-include-libgen.h-for-basename-API.patch | 60 -------------------
>>   .../util-linux/avoid_parallel_tests.patch     |  5 +-
>>   .../util-linux/configure-sbindir.patch        |  7 +--
>>   .../display_testname_for_subtest.patch        |  7 +--
>>   .../util-linux/util-linux/mit-license.patch   | 45 --------------
>>   .../util-linux/util-linux/ptest.patch         | 11 ++--
>>   ...l-linux_2.39.3.bb => util-linux_2.40.1.bb} | 21 ++++---
>>   9 files changed, 29 insertions(+), 135 deletions(-)
>>   rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.3.bb => util-linux-libuuid_2.40.1.bb} (100%)
>>   delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
>>   delete mode 100644 meta/recipes-core/util-linux/util-linux/mit-license.patch
>>   rename meta/recipes-core/util-linux/{util-linux_2.39.3.bb => util-linux_2.40.1.bb} (95%)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
>> similarity index 100%
>> rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
>> rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index d506783f9a..0f5f838e84 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -6,7 +6,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
>>   
>>   SECTION = "base"
>>   
>> -LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
>> +LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
>>   LICENSE:${PN}-fcntl-lock = "MIT"
>>   LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
>>   LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
>> @@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
>>   LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
>>   LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
>>   
>> -LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba \
>> +LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
>>                       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                       file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                       file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
>> @@ -30,7 +30,6 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba
>>   FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
>>   MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
>> -           file://mit-license.patch \
>>              file://configure-sbindir.patch \
>>              file://runuser.pamd \
>>              file://runuser-l.pamd \
>> @@ -38,8 +37,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>>              file://run-ptest \
>>              file://display_testname_for_subtest.patch \
>>              file://avoid_parallel_tests.patch \
>> -           file://0001-login-utils-include-libgen.h-for-basename-API.patch \
>>              file://fcntl-lock.c \
>>              "
>>   
>> -SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
>> +SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
>> diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
>> deleted file mode 100644
>> index 6258710e1e..0000000000
>> --- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
>> +++ /dev/null
>> @@ -1,60 +0,0 @@
>> -From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Sun, 3 Dec 2023 19:59:46 -0800
>> -Subject: [PATCH] login-utils: include libgen.h for basename API
>> -
>> -musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
>> -
>> -include libgen.h for using the posix declaration of the funciton.
>> -
>> -Fixes
>> -
>> -../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> -  847 |                 shell_basename = basename(shell);
>> -      |                                  ^
>> -
>> -[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
>> -
>> -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ----
>> - login-utils/su-common.c | 10 +++++++---
>> - 1 file changed, 7 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/login-utils/su-common.c b/login-utils/su-common.c
>> -index b674920..3297c78 100644
>> ---- a/login-utils/su-common.c
>> -+++ b/login-utils/su-common.c
>> -@@ -26,6 +26,7 @@
>> - #include <sys/types.h>
>> - #include <pwd.h>
>> - #include <grp.h>
>> -+#include <libgen.h>
>> - #include <security/pam_appl.h>
>> - #ifdef HAVE_SECURITY_PAM_MISC_H
>> - # include <security/pam_misc.h>
>> -@@ -840,17 +841,20 @@ static void run_shell(
>> - 				su->simulate_login ? " login" : "",
>> - 				su->fast_startup ? " fast-start" : ""));
>> -
>> -+  char* tmp = xstrdup(shell);
>> - 	if (su->simulate_login) {
>> - 		char *arg0;
>> - 		char *shell_basename;
>> -
>> --		shell_basename = basename(shell);
>> -+		shell_basename = basename(tmp);
>> - 		arg0 = xmalloc(strlen(shell_basename) + 2);
>> - 		arg0[0] = '-';
>> - 		strcpy(arg0 + 1, shell_basename);
>> - 		args[0] = arg0;
>> --	} else
>> --		args[0] = basename(shell);
>> -+	} else {
>> -+    args[0] = basename(tmp);
>> -+  }
>> -+  free(tmp);
>> -
>> - 	if (su->fast_startup)
>> - 		args[argno++] = "-f";
>> diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
>> index 85ad7a5575..8ea00dbb95 100644
>> --- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
>> +++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
>> @@ -1,4 +1,4 @@
>> -From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00 2001
>> +From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
>>   From: Tudor Florea <tudor.florea@enea.com>
>>   Date: Mon, 14 Jun 2021 14:00:31 +0200
>>   Subject: [PATCH] util-linux: Add ptest
>> @@ -9,13 +9,12 @@ Revert run.sh script accordingly to serialize running tests
>>   
>>   Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
>>   Upstream-Status: Inappropriate
>> -
>>   ---
>>    configure.ac | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/configure.ac b/configure.ac
>> -index 890212f..870e817 100644
>> +index 651ef2b..2a8012e 100644
>>   --- a/configure.ac
>>   +++ b/configure.ac
>>   @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
>> diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
>> index 75adeca188..74abdc2038 100644
>> --- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
>> +++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
>> @@ -1,4 +1,4 @@
>> -From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00 2001
>> +From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
>>   From: Phil Blundell <pb@pbcl.net>
>>   Date: Mon, 24 Sep 2012 07:24:51 +0100
>>   Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
>> @@ -9,16 +9,15 @@ fix the test, the [ ] syntax was getting eaten by autoconf
>>   Signed-off-by: Phil Blundell <pb@pbcl.net>
>>   Signed-off-by: Saul Wold <sgw@linux.intel.com
>>   Upstream-Status: Inappropriate [configuration]
>> -
>>   ---
>>    configure.ac | 5 ++++-
>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>   
>>   diff --git a/configure.ac b/configure.ac
>> -index 36c24b4..890212f 100644
>> +index 23594ff..651ef2b 100644
>>   --- a/configure.ac
>>   +++ b/configure.ac
>> -@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
>> +@@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
>>    usrbin_execdir='${exec_prefix}/bin'
>>    AC_SUBST([usrbin_execdir])
>>    
>> diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
>> index 815ae9c915..871b0b2d30 100644
>> --- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
>> +++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
>> @@ -1,20 +1,19 @@
>> -From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00 2001
>> +From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
>>   From: Tudor Florea <tudor.florea@enea.com>
>>   Date: Thu, 3 Dec 2015 04:08:00 +0100
>>   Subject: [PATCH] Display testname for subtest
>>   
>>   Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>>   Upstream-Status: Pending
>> -
>>   ---
>>    tests/functions.sh | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/tests/functions.sh b/tests/functions.sh
>> -index 5a562a3..098145e 100644
>> +index 5fe5ba0..a6c703e 100644
>>   --- a/tests/functions.sh
>>   +++ b/tests/functions.sh
>> -@@ -437,7 +437,7 @@ function ts_init_subtest {
>> +@@ -450,7 +450,7 @@ function ts_init_subtest {
>>    
>>    	if [ "$TS_PARSABLE" != "yes" ]; then
>>    		[ $TS_NSUBTESTS -eq 1 ] && echo
>> diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch b/meta/recipes-core/util-linux/util-linux/mit-license.patch
>> deleted file mode 100644
>> index afbec98f18..0000000000
>> --- a/meta/recipes-core/util-linux/util-linux/mit-license.patch
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00 2001
>> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> -Date: Thu, 28 Mar 2024 12:16:57 +0000
>> -Subject: [PATCH] README.licensing/flock: Add MIT license mention
>> -
>> -Looking at the license text, flock.c is under the MIT license (see
>> -https://spdx.org/licenses/MIT).
>> -
>> -Add an SPDX license identifier header and add to the list of licenses the
>> -source so everything is correctly listed/identified.
>> -
>> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> -
>> -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2870]
>> -
>> ----
>> - README.licensing  | 2 ++
>> - sys-utils/flock.c | 4 +++-
>> - 2 files changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/README.licensing b/README.licensing
>> -index 4454f8392a..535ad34813 100644
>> ---- a/README.licensing
>> -+++ b/README.licensing
>> -@@ -12,6 +12,8 @@ There is code under:
>> -
>> -    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
>> -
>> -+   * MIT                - MIT License
>> -+
>> -    * BSD-2-Clause       - Simplified BSD License
>> -
>> -    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
>> -diff --git a/sys-utils/flock.c b/sys-utils/flock.c
>> -index fed29d7270..7d878ff810 100644
>> ---- a/sys-utils/flock.c
>> -+++ b/sys-utils/flock.c
>> -@@ -1,4 +1,6 @@
>> --/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
>> -+/*   SPDX-License-Identifier: MIT
>> -+ *
>> -+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
>> -  *
>> -  *   Permission is hereby granted, free of charge, to any person
>> -  *   obtaining a copy of this software and associated documentation
>> diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
>> index 6221de7182..7345926b88 100644
>> --- a/meta/recipes-core/util-linux/util-linux/ptest.patch
>> +++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
>> @@ -1,24 +1,23 @@
>> -From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00 2001
>> +From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
>>   From: Tudor Florea <tudor.florea@enea.com>
>>   Date: Thu, 3 Dec 2015 04:08:00 +0100
>>   Subject: [PATCH] Define TESTS variable
>>   
>>   Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>>   Upstream-Status: Pending
>> -
>>   ---
>>    Makefile.am | 1 +
>>    1 file changed, 1 insertion(+)
>>   
>>   diff --git a/Makefile.am b/Makefile.am
>> -index effbb02..7d2bd1e 100644
>> +index 50ab8d0..7e2340d 100644
>>   --- a/Makefile.am
>>   +++ b/Makefile.am
>> -@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
>> +@@ -64,6 +64,7 @@ tmpfiles_DATA =
>>    dist_bashcompletion_DATA =
>>    check_PROGRAMS =
>>    dist_check_SCRIPTS =
>>   +TESTS = $(check_PROGRAMS)
>>    
>> - PATHFILES =
>> - ADOCFILES_COMMON =
>> + BUILT_SOURCES =
>> +
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> similarity index 95%
>> rename from meta/recipes-core/util-linux/util-linux_2.39.3.bb
>> rename to meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> index 2cd7750afc..5985ddc7dc 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> @@ -90,7 +90,7 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
>>   # build host versions during development
>>   #
>>   PACKAGECONFIG ?= "pcre2"
>> -PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
>> +PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)}"
>>   # inherit manpages requires this to be present, however util-linux does not have
>>   # configuration options, and installs manpages always
>>   PACKAGECONFIG[manpages] = ""
>> @@ -106,6 +106,7 @@ PACKAGECONFIG[pcre2] = ",,libpcre2"
>>   PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>>   PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
>>   PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>> +PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
>>   
>>   EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
>>   
>> @@ -117,6 +118,7 @@ FILES:${PN}-mount = "${sysconfdir}/default/mountall"
>>   FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
>>   FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
>>   CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
>> +FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so"
>>   FILES:${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
>>                             ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
>>                             ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
>> @@ -147,18 +149,21 @@ SYSTEMD_AUTO_ENABLE:${PN}-uuidd = "disable"
>>   SYSTEMD_SERVICE:${PN}-fstrim = "fstrim.timer fstrim.service"
>>   SYSTEMD_AUTO_ENABLE:${PN}-fstrim = "disable"
>>   
>> +do_compile:prepend () {
>> +	# this is a workaround for the unnecessary remake problem. Issue and PR are as below:
>> +	# https://github.com/util-linux/util-linux/issues/3061
>> +	# https://github.com/util-linux/util-linux/pull/3064
>> +	# When newly release tarball contains the above fix, the following workaround could be dropped.
>> +	[ -e ${S}/libsmartcols/src/filter-scanner.c ] && touch ${S}/libsmartcols/src/filter-scanner.c
>> +	[ -e ${S}/libsmartcols/src/filter-parser.c ] && touch ${S}/libsmartcols/src/filter-parser.c
>> +}
>> +
>>   do_compile:append () {
>>   	cp ${UNPACKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
>>   	${CC} ${CFLAGS} ${LDFLAGS} ${S}/fcntl-lock.c -o ${B}/fcntl-lock
>>   }
>>   
>> -do_install () {
>> -	# with ccache the timestamps on compiled files may
>> -	# end up earlier than on their inputs, this allows
>> -	# for the resultant compilation in the install step.
>> -	oe_runmake 'CC=${CC}' 'LD=${LD}' \
>> -		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
>> -
>> +do_install:append () {
>>   	mkdir -p ${D}${base_bindir}
>>   
>>           sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
>> -- 
>> 2.34.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#199864): https://lists.openembedded.org/g/openembedded-core/message/199864
>> Mute This Topic: https://lists.openembedded.org/mt/106294633/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>


