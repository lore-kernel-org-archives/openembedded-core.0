Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9CAFAD41D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 06:04:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13558.1776924287880735161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 23:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8573dc5874=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3cBn0990568
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:04:46 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc07qy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 06:04:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvxPsjoPjPpvtf6ZamT+G3ws6+qhhIO8htgfwGqnCZHDW2hp6trc77p3zplt8EWz1Lm60CkHz2XQnN1LpFR6Dx6thWEzaC8VRble0CqqoN2YzjKvsMgBP25ij+r9ifSYRDUItR0Xu87x1wC/XjuDTumBWWqS6xyNp/whcVA0tNZgAC9gf0Ue9QcJ67FrXaWmsLXFdBPPHuFCJrs0mBC3he+5zpugcXbF9xfqWzGTm6zk28XgMFjGGe3J84Exi4ilgJCIu/9BCZFiN0CujSfJV2ADrlS1zYcJL1YzTiB+RGB7R9UGiPCT1WaaBbETnehtaHnmbkuk2fLmsMU20ab6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tEf4UzRU5JuFHHazOy6hoRTSwmwFI/PWHhkbSyVgN4=;
 b=jnYRWkXDOkx0OjIFr0O51V4uiu7qSeEa5EQ8bvjUxOrfnib8rlOID1Q9K/Ifcye+JwbaCYS4M/0yjP268EhV/tP30I4DTl6SIP02WvrmMtiwzuN19bEuubQ1Cf47ktrsvmTe1o0UEctb8fJRb8uFcR0oqJePNpFPQFQiRGp4AgNlkBT+j2REzZjPQ2R4zyxROfwvvzce3y4QMFLlkU6zGmr3P72rnrLsE0UX8tqa+dw5jF659nt9VgMkpUuoPcDAAN55JStQdwlfBIHUB9tMovrVDMiEvoNmrLNYOdClAVOdz2J5nU/J54BGOD3oBnEYwDDFzC1/hsvPEYxrT2fcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by LV8PR11MB8509.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Thu, 23 Apr
 2026 06:04:43 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6%6]) with mapi id 15.20.9818.017; Thu, 23 Apr 2026
 06:04:43 +0000
Message-ID: <95988640-2fa5-4e41-a980-2173af637eca@eng.windriver.com>
Date: Thu, 23 Apr 2026 14:04:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] grub: update search parameter
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
 <2c704d3b5aa8852a3d4e24143fdedb8f530517ae.camel@pbarker.dev>
 <20fd5dc4-ef85-49d6-931b-7a8ea3f94c04@windriver.com>
Content-Language: en-US
Cc: Paul Barker <paul@pbarker.dev>, xiangyu.chen@eng.windriver.com,
        arindam.nath@amd.com
In-Reply-To: <20fd5dc4-ef85-49d6-931b-7a8ea3f94c04@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4PR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:378::17) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: d0704742-1e96-43a9-f54b-08dea0fe3668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	9Hm1Mp5uEBAoXEGl9p9draCIamgzjCSYkF8+H87qR0s7W5Msc7WgIQdmZ1AxtOCon2JUs0MnIQA2Z1zMzjfJpNiCRH06xBKPshO8nntAx9BYeIxFUvoAbQB5EFTh/GzyP702UqTa/1irfPds++FQhnIaYp90XW+Z3yrscaQXKPAKe7tmmlzO75hC4WXlaA78mDgQZIiBbLHZtL0npcT4McWwo5XMrv3zJVkkxTB9ry+tt1s9xTxuIulrNV1sMTmx9BC8CRHjFVs+mNvG6AN94RUAYI+I5Y/126HWp9lmjQ54Ete9EwSxhjyu9YlTnLcYh/CyngbzUl7MmlrVKFLf5JrKe2HwWrRsvY5enckrGF8/WrsO7byUo4uZnq1BnnuMG57Xw+S1SuFgmxPnCXD3gJspp44W4cpwTDxZYGU1MJK7UcI444TNBzLkvIl9Wn7DyBTe65B3NILIiXLxkXXrLy4HFuPj9/4et3LgEPL6fbfUujE74GqugkNWBHkzOUdzg49PFRjFcjMqJy4RGJHnvFryPGzUvVopt+MDn6LgWEoSMamkgpph0rLJ/zYpGHFvKEZaFP2PbEOS7dIKRpUGt37iyQeM/wrLGZaqfK83kst3viIWbTqCzf7PfjeaIhBDPwYGyKMXoaUaRc3lMZ2IdjbH1SMDaeyA3eNjqz1jEkcV1ZaxKSisXV5KofNDogIe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enB1VVRuampxU3FHVmF0SHM2VFRGNHVtTk9VY0R5R2g5aHNKaWgzVUpJS1pF?=
 =?utf-8?B?YUt5NnhRNlZFVFpHNXpwdTB0ZjBMNGNhc0ZBbzBtUzEzenZRckNObzdDMDlz?=
 =?utf-8?B?b2lxbFhXblNpZGJISm9SMFJ1WWc0MGVIaEpSaSs4c0xlTDUzNHJzZ0tJR0JU?=
 =?utf-8?B?RHdwcVJnbTVyclZmK1hFZnhhWFhrcnowYmYreUc3SGtDMStOaGh2Zk1xVVJJ?=
 =?utf-8?B?eFJCSlZxd3BlbENjY1pLeTMzWXI5R1J6a3BPU3ZVdWRDL0xMSlQyeGlROGNY?=
 =?utf-8?B?clNNZ3BrN1J2NkRGYWxvR1hDOW94blc0dXdNekdkZUlUYi9Ia3ZsbHFRRkFo?=
 =?utf-8?B?VldmK01DTXp0VE0xUWR2OUpieHR2aGZJNHkxRHJmRjUreXo0amxJV0VuMTFI?=
 =?utf-8?B?Ny9mbCtMVnlVMXRtQW5Qc3JlY0k2Z2w1c1NoZnQ5VjFONWRRYWlNVzlIemYv?=
 =?utf-8?B?bGFhYVFpN1lIaGc3cDRUSEJlSi85U01oY0ZWZkhzTXkxZzBwUWtwMWVhd2Ux?=
 =?utf-8?B?bG0vZ3BVZjJiRVQwTVFaVjlMVlJtYWVmcDRQNVhLcE1lMzNQT2VlaitBWjQ1?=
 =?utf-8?B?VFZ3bDBMZ3pLNU4vT0xsYUZFNTVWR2JCSlIvbEx4ZTh1aDhHdWlCRnpVWnlW?=
 =?utf-8?B?ZWMzMWdaMm55RXkzWDVvR1RmNW0zdlMvYVVSZ0VKTndQazhsR05ndVV2MWZF?=
 =?utf-8?B?TUd5N2ZNMGpLcXluemNDU0JUc2FQN1cwL3lSRFN1VHZ6UnVMemlkTXl1ZFJW?=
 =?utf-8?B?QzFUUUNWa2h2VHVLL1oweklyRFpJd3NLaUtGVUZNSTFvRW5iUHhDTENOQlUx?=
 =?utf-8?B?RWp4Nk4xUHdMSmhnNklMb05uWFNyOER6Lzc5dmlUOFg0Z0N0NTZxUlBKeC9y?=
 =?utf-8?B?OTNkRmZkNlRlQzdOVkZVZFE1eVRLUHE3Z3d0YTRmYWl5NGp1a2gxeS9yb2JU?=
 =?utf-8?B?aERnR0Z0MHh4eXZCQUxwV2dyTWc4blNUbE9QUGZhYVNGN2hVNXNLU0dXNmJX?=
 =?utf-8?B?Y1UzR0x4SERzMTc3a2ZqeTk0SkxxN1Nkb0ZLakdrdnlKaWNjZFU0TXc5U2x5?=
 =?utf-8?B?TWVEQ0h3bzVCTUU4dlNjemcvc1JXcW1Ka1k2S3NTM3dFMUJ2U0dWZmNac3hq?=
 =?utf-8?B?NmwyUnZLbWZmS3FTQUtBclBTSDEvZDExdmFyVEZ2T08zK0xNS2FudGpXMWNN?=
 =?utf-8?B?QVhWWktieVZGc0Uvam1hN0gzd09uMkdmNkhucU9HV2JLMlJoS3pHZFl3MDZp?=
 =?utf-8?B?OWVxblhCdytsMTM2OEgrR0RUcmZwSzV5NCtrVGdyUEU3M2VUbzlMamZ2a25O?=
 =?utf-8?B?cEhEZHpQMXlMMzFmUWhMY2E2VEtpMkZaU2wxTUNmOXFmZkIycExuamNYR0JH?=
 =?utf-8?B?ZmhHWERWb3VTbGpvdHAwRzBIbWdScjJUQ01DUEhnSDZKZ21oWkhtalhmMEI5?=
 =?utf-8?B?eCtNZmZBM3dXQTFZSDB5VHp4ZnExaWZaaE5PclloejR4YnpaSkt1bThmeTU3?=
 =?utf-8?B?eXhiUnNhTkM1RUFuck5wVXhlYkxTSHEyY0tiN0V6b0NBMzJWU1dhOFNwRDU1?=
 =?utf-8?B?WENONm03ZmxhMWZ0ckw0ZzRoSHVlQ2JBOUVsRldVcEMxWDc3b0U2bEVHNG14?=
 =?utf-8?B?TlMzcGwxNnBEV3FvdnhDOHJ0ZGhkU3ZITmp4Nk1XL2NFcll2L21HR25pTGZr?=
 =?utf-8?B?VnA4SjB6b2pFeG9XVFN6S2dEeFppbUZqc3lHNVc0RngxSENEYkJPS2VKYXdK?=
 =?utf-8?B?enNFMzNLRlpya3dWWWxPZEhrN0hyYS9ZTS9qd3pWeGJkSmRXcWJlUU5lclFz?=
 =?utf-8?B?aVBiLzdDV2M5N0lHZ0hKVTRhZlEzbGhEZzF4ZU1rVVZraVkrWEtoc0lHNEVu?=
 =?utf-8?B?K3M5Qm83TTlOUnVBODF2QWZmNGQ1VUM3bE12UjhqNU5iWitQOC9GSlA5U1Z4?=
 =?utf-8?B?RVc3YzZmWUtiQjFFajZOWU5RcU1BdnpQcE9MTG5STXVBZVViaEtCbWsydTBp?=
 =?utf-8?B?WFo4bytJcmxXZVAzSmZualhCbnh6OStsSHkxVERocXhtK1FPNHdQQldSNlVE?=
 =?utf-8?B?bXZjWkRnTGZ2aGZsZkl0TytibDN4WW45dC8rZkdoWTBKSkVDb2gvNnltb3pt?=
 =?utf-8?B?czdYWFhyN0dwekZUeXNTbzg2YjkvVnRVUzFSWVZtVWNCSkVURmorMTlUOTJl?=
 =?utf-8?B?S24zZ3hrbnpIZGZBZ2lwUS9aZjVJOCtiK1JGalhQZ2FMb29kTWdNVFlPSk9i?=
 =?utf-8?B?TkFOcE1QdEFPZVhOcndjQnFYU1lzU2ZLR0NUWlRjVlJsTkkxV1ZvKzkvbzBj?=
 =?utf-8?B?cE5VT25mMk5ZSDRoNnhZRll5NlUyMVd2NVBwc3EvQ2tvTnJ3NlZydVJoczN2?=
 =?utf-8?Q?bjgxYJVTtS2pW9Fs=3D?=
X-Exchange-RoutingPolicyChecked: 
	rDw1af5zsk61wZkLGiKu7L/ncV5rtA3DGXcWx6soKhxNhz5nAEnsJlBHjGNXr9GpcwOqMGx/T3RF0f1TW9J84p3h4rYsqE217c3+p9wzq++Cf6p6bvLoY7yZKsX5Xu2pnlYID+ECv2c8l5AXrUkYMi9k3kaZHllLAce+aUcBeIG4tsGjwCL11xVjuwNlpgaLpvsYGctIzbqLrl/v1WCn3jtN7qqo/fDZg3SYe3Wzvd1knAdjNpX6r9v+OsmSL35nWqINb+YLr5NQ4MVqmU4PkB6xVFRKU1+8mz0EbJ5jviomhwzRh9Qo0GYAzOesExtlXWz9xvUdP4hWrBuURDpKxw==
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0704742-1e96-43a9-f54b-08dea0fe3668
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 06:04:43.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOlOW3a1DO9bjgnUZYMjY479psbekwctNCuC0zAR3e/22V+hVUeCm2cpA7bIzZXCjRZ+viZvUAoL0LH0H5LPpb6Z+3rjt5E+qIT86rUK4DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 9PhUajjHpawFIkzn96oUBsdDS-f9AArZ
X-Proofpoint-ORIG-GUID: Wxo-3eCWjemNONOrDgnqB4yaAMM3dCpt
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69e9b67e cx=c_pps
 a=FQqMf2dcfR2Kwex5s5bwow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=P-IC7800AAAA:8 a=6AdNy0EVr-gjGu2FS-0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA1NCBTYWx0ZWRfX/9c3ESQkntUD
 kouAymoan2AytANUJBOYsQX3iaJhBscM8G/TrDZAM7K5TED1pA1PFtyTxXx3QkmAxwiHBl7+Wp6
 qhfqXo23DNh7mWQ7cOZhm8BPFkBLBDBgk0R/N7xsWqZtZsZTcsUpXXfx1dgu0SPtqCNXkd/ykI4
 np0p7iTqbNyhRn26gB4er/yH/iMhwA48ZU6pFt3KvEh/Ih4qAoOvRGOkDbWb/4ACu+wE8MHARHo
 RsjViI6DOo041cYH8EnhzRmAgcHOOnRI+3l1cQ9rmUE4ln1lHN35EiTmIL7dsYPeepvRCEUhdXJ
 nOzyglNf3Hu3nI4lFKDrrFGk3Q43AnzhHFzSejRkE7bdtGQAf4vXKkb2hjizZunZcvZZKCDvKYz
 Dt/Vo5kSYam/mBt8XKOvBgeY4QrlL+HFuYnOIeWYYoEny34rYwlHPIIi4QbD3FaOeeeA5pAhjEW
 VKBN5uCduDKL9MblVww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63N3cBn0990568
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235738

Hi Richard,


Since the behavior was found in OE scarthgap branch, could you please=20
help to cherry-pick this

commit: 42b530581f72 ("grub: update search parameter") to whinlatter and=20
scarthgap branch?


Thanks.


Br,

Xiangyu

=E5=9C=A8 2026/3/31 10:57, Xiangyu Chen =E5=86=99=E9=81=93:
> Hi Paul,
>
>
> On 3/5/26 19:49, Paul Barker wrote:
>> I'm not sure that this can work for all use cases. The grub
>> documentatation for hints says "First try the device HINT" (i.e. it's
>> explicitly a device), whereas the documentation for cmdpath says that =
it
>> is "an absolute directory name".
> While the documentation defines $cmdpath as a directory and hints as=20
> devices, grub=E2=80=99s internal implementation of
> grub_disk_open (grub-core/kern/disk.c [1]) is designed to handle this=20
> exact "device+path" format.
>
> When a hint like (hd0,gpt1)/EFI/BOOT/ is passed, grub_disk_open calls=20
> find_part_sep to locate the partition/path delimiter.
> It then uses grub_memcpy to extract only the device part (e.g., (hd0)=20
> into the raw buffer for the disk driver.
>
> The remaining string (gpt1)/EFI/BOOT/) is passed to=20
> grub_partition_probe, which identifies the partition and gracefully
> ignores the trailing directory path.
>
> The current syntax ($cmdpath) results in double parentheses ((hd0...))=20
> if the variable is already populated.
> In grub_disk_open, this extracts a malformed device name ((hd0 which=20
> no driver can open, triggering a hard no such device error.
>
>
> Ref:
>
> [1]=20
> https://elixir.bootlin.com/grub/grub-2.14/source/grub-core/kern/disk.c#=
L192
>
>
> Br,
>
> Xiangyu
>

