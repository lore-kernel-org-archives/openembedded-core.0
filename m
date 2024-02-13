Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A102C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 09:30:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8015.1707816646066024202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 01:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CYJAWwth;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27734e572f=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41D70EF1020439
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 01:30:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=y3Gb6kNAKq7yn+2IZdX
	aM4EqCIyTJtJsWpPLI3NaMEg=; b=CYJAWwthj+Piu/UkXAoL9joH+NIv14dxMgV
	tOGpyhA8zH9iaDZJo58rSTJXpyjdwz+PSZSlc9GmrG/qtXNwQpZvo0mjEdie63zb
	sD8QGiPqCNPs1XCiSUpVmRpNWbzHwjwE8gS6DWMGFAxreUpe+dFeXXgXvqsS8LyF
	MYzbK0oWYOia3zm0FSPfO5MBM6zOZXioMnr2R4DezMtbdzxMSOu83MRogGDa74EB
	1pzl/tvsBpwZpb3mPXX727UsiNB2Fw837je4UmTbsnSAVrA9f6l6cIeEphz+/swK
	XH0mamVdDMBLUtQNOa2EVHZjKbTZOdNI1A5klphPYwhfRspTfAg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w69hm266v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 01:30:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqPI9rHqF7pZ1kHgLHibgJ4XueiaGpzhERWpMVlq0roTlYNxU2MgUsvaNMG9VwOxsMPK++GyITe23SOr+madFK8fwJ/VJoDS4A6loWJc64+hlUH6WUfAyhSQ6Vrv8/2FsFv0MGaq3dYn0TM92CoM9/a/z1Ruy4iqvWlFyq9XUCj8IzEkESWaZjp0v311WAbklADXIjYdYgE0YQ7urraPf6FRFkcpeQxYrJupsZITeSxoxiXq/CMxIExAnsGEox2jIs6j133N+9pr+bgNhFvyWrSvRvQw2CE4XUyrABge5+TKdniyPJD+QqwBQopDc6BRhKEEu2HA5cg+D+2SYaLhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3Gb6kNAKq7yn+2IZdXaM4EqCIyTJtJsWpPLI3NaMEg=;
 b=XIX38JEDXdBJV9HcKNElTLRKDzJfkA5SjAv3mbCxAAAQpyiApowzViY+AjsE9BM8OwNxUFGFl+4dFCi0kaBphiuYPHfogtuB0MEmT+XGrBsxA0FlMTjL3gzUb30ihlHCQvoOvw3WaGC2jYQxJQdcPkNo3J2O6rNAyWhIfuMvztXrAYCrH/5ZD0ZztBK29LiZFWJjJMFYnbwmDfwgLDTW6vZTPa9KTmE1qZFogAEwVysAVRo4uYcRTzYLFABw/0rZiHLc+7bxxSVoJcAwjC0ZG3P0IG7OJn+HJDiQPRvQy8klo5K5gS8IN3+zhDoP9T065KCq/sAGmjZqILynY1g1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Tue, 13 Feb
 2024 09:30:42 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 09:30:41 +0000
Content-Type: multipart/alternative;
 boundary="------------Kr80wopx1eY3O12FeHB06pRq"
Message-ID: <1ecab610-2732-4dd4-a1be-14eb6b3454c3@windriver.com>
Date: Tue, 13 Feb 2024 15:00:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gcc: Add riscv64 as a compatible host to gcc-sanitizers
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        "Hao, Kexin" <Kexin.Hao@windriver.com>
References: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
 <df3c6eb1-2cec-490f-bb89-e06de070b62c@windriver.com>
 <fcc39c54-1961-40ed-88fe-9303c8280bf1@windriver.com>
Content-Language: en-US
From: Deepthi H <deepthi.hemraj@windriver.com>
In-Reply-To: <fcc39c54-1961-40ed-88fe-9303c8280bf1@windriver.com>
X-ClientProxiedBy: DM6PR10CA0034.namprd10.prod.outlook.com
 (2603:10b6:5:60::47) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cfe6ab-4e3c-4291-fb65-08dc2c76724c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9qoLqvQS+Q7S4Tz6JxVRMaxGkq0J3EdSmOqA6Ns2Xor9OWaj/kovakkiye4BLr0Yl4e5VQQh903Bsu+HOZUf1Kc7ixKXX25CLP8XhAJkNnKNT0s8JTaHJEx14bJSYyO93fkjbzwjmk+nlmGFZTpuduYVg8E2zrHWJKA6oNNP3DiuNKbXYcFSFoHS6zVrxhd6Y1VBD7OmYIiKEa4ja5zrA2mbQ/YVjB7InoKCehgf4HumltKDoytWsmm3x4rfbwuApbH3Iwdt1/qGIP28mOsJ83BozCYhclsY1qIKqb8Iy1y3yUtu/NEzGdY8XKK2s7Xm1Idov2T+uUrXlXAgZVFeU9H5IeRvq1ygezTzCR4uAaG1bnlOaJW7O5LhvzV6S2qAc6vfOlUm6VR5hzJgBvLUkMKTvFNtzuc41XmZmkYgy35xwLQlFI8EzcbvnpNikVeEnTu4iNfbVPGxQqykEcjMOHZR3xP4g601+4DpE76WotAUUksK3u013+7G0NnVTZOsdDyanHEwMx3f6gxljmRLbF/MK+fDByZKiAK3EmV8GMeRFYLsSmbYnAx7qeCvQfz89am/Ld5Fu6uy7x6BZJX9WgvQCYWlMEkIqrT4XU09Mrg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39850400004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(2906002)(30864003)(8676002)(83380400001)(107886003)(36756003)(38100700002)(31696002)(26005)(38350700005)(66476007)(6666004)(66946007)(54906003)(166002)(8936002)(2616005)(66556008)(86362001)(316002)(6512007)(6506007)(52116002)(53546011)(6486002)(478600001)(33964004)(41300700001)(4326008)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUtiNWRGb2x4YUJlY1pvckI1TUQ2SklxMm85eC9XUGUzdWxremhSdGl5UkZw?=
 =?utf-8?B?QjR5MGtnQTJQSzRzQ2R0NVVUc0pLTTBySldYNjEzQmQ3dUpmajdJdWdaNStW?=
 =?utf-8?B?TkRQbzJGVTF6Lyt2T0JSMFI2cUxRQTU4UjBEUE94U2FYME5IMzJkZ0Yyb1c4?=
 =?utf-8?B?bXJWNVBvaWc4b3ZHVzF0SmhqcERiVFBSOGVxeVBkaExxcDRzc2NHcmFUKzhD?=
 =?utf-8?B?dDM2SXFDSFFCNUlTNTFXV0pZY0t0ckY0aGczN2UzVmdEVFAzay9neWl2Qld0?=
 =?utf-8?B?a2xOZ2ViUHBNRGIxTUdPZEt0WktnNkFBZWhoWUlsYlRXZEcvWXg0TlBHcmRw?=
 =?utf-8?B?VWFTWU5xcXNyR2dIZWZySElIWlVnTlo4U2p3eVlxdFo3MkNsZXhtdHBVNlll?=
 =?utf-8?B?ZFlWQjJaajhDR3hlL2ExYkpYNHNwWmFvVzU5NHlRU3I3MEhaa3daTlZvQWlH?=
 =?utf-8?B?WXVMU1V6cmdVQ2IzNzg2VEM4dWZiSkdIK3NSZ2NQREF3ZDJuUTF3dGU1RnRl?=
 =?utf-8?B?aE5vRTNEdFpVR1RCc0Q4a2ZJNk9uZkJvY3ZqRWlLT21VZmwxSEp6NkdZdlBR?=
 =?utf-8?B?NkRoTkRER2xNQ2ZRZjB6Zm5mQjd4aTIvbDJwNHFCN3FVcElMWW1KcmZsRUhw?=
 =?utf-8?B?Q0NBU3hQM3pHd0NpU2FzeEt1aUJoYmJWRnlPeEpoWFM0Z0hyY2l4NTRQcXd0?=
 =?utf-8?B?aUpBR0xscVpJaDN0NWZhL3pCaGo3VFloNFBsWHlHRG9sWlkycFJ3RjRoM3hW?=
 =?utf-8?B?L3hzNm5YVUhLSVFjbm5NWTlRRHZzU3VMZk95SUE1TmVIS3gyQzJNR3FFaE5I?=
 =?utf-8?B?RWVXVUZTM3M1dlUwVUdOeTNPMzVJYmFKTUF0NzR1RytwYzdHOENxZW5udFEy?=
 =?utf-8?B?aFBxN0ZWdk5Lb1BLVXVJckJtVnF3U0VMSkFyd2QzZ3VOV3A0MWNBT2pqUlpD?=
 =?utf-8?B?VW1XamZWWmUwUmJGcDdjUlJsWURHeG1tSHNnMk1sWTJ4YnBKSXk4cld2WDIw?=
 =?utf-8?B?bkh6YmtrL2E2UzFNcVc5QU9uT0YvZmMxMktJYjhuVTcyLytKRUhEQjRhNGtt?=
 =?utf-8?B?Nk9KQWxWeC9NblpHdzBqbkVwOThDaWVOWUp5NDF6a3RGRDdZS0hEQlpYaEhL?=
 =?utf-8?B?MUZNK3hwaDRiNWVweXhFOWdPeHN6cmh1Z2V6aVlRalhmTTZZZ2tuZkJVeHBV?=
 =?utf-8?B?eUl0eEprd0NMNzVNNFJWeG9tcUFvQ2VnREt6ZkluS2hkVW94TndXSEZnd2Y2?=
 =?utf-8?B?N01Ma1F1eHNPMk0zZUpoNzBJNC9EQmMrUWU1Qk5lT04xSlFPQ21RYnZ3aEVN?=
 =?utf-8?B?aDkwREtKOXFnSkwrRGlpSG8rK2NBOGdQYVlRTStDMmRud2tjdy9yaTlEN0ZD?=
 =?utf-8?B?eFFKd3pQSk5HWkxqd1ZQZTlUL2paZTl3Q0NNY28yNkEwdCsxNm8vYjF1NTJF?=
 =?utf-8?B?UmltMi93TFduMy9aTG5NK1JPbFhRWVVRN2p5aktUL3RZY3FwaFJPeldsQThz?=
 =?utf-8?B?Vy9TSkp6MVhEa1Bud2dEQTNrZWhHcUVkSmdCM1lPQ0ZnOVpBWlNEUlVzbmlv?=
 =?utf-8?B?UVBXems1ZXRMRW9XeWNrSDdWV2hhRTFBTkdMNHZJRnhEd2F5eWpONkd5cXUz?=
 =?utf-8?B?YjA3TzdIdm0zeDhLbEVsU3Q1bitYQWd1a202Z0NsdXBGdXJoUUpvYkRGcTRi?=
 =?utf-8?B?M3dxYnNDdlY0WFRuNm1oRGtUTTdWdjE2UHFNQTdVQURrUlZqSkhmcXFzNTA3?=
 =?utf-8?B?SDd5R3RLeFk4STRWOXRrZWMxYXlRdjlCc1h4YVoycFJyMXBRWmsvSTd2S3pZ?=
 =?utf-8?B?Z2F1QURhWnRpQWRpM2d1QkpocmU5MVM3REpQeDltSHpNK2k3b2o2aktzREpu?=
 =?utf-8?B?eFVGSjA3WGdvN3p3ZmRzNXNGS1pkdHJoVU1VNWY0Ujh6SkQzTkZteFZNam85?=
 =?utf-8?B?azFiYnA2Nm9UNzhNZnZVNkNNWjIyYWpaaHo2N3ZZajhsT2FVWmJ3c0pLeXo0?=
 =?utf-8?B?dkhDd0Q1cFp5ajJPRDltVERoaFlqVmhMdXJqcUlFYTU3N1l1c1hzU0JITmU2?=
 =?utf-8?B?ZDRkYjcyQ3VTbUp2eWJIR3JPWXNza0RUVS94K1Q3ZFZiY1JpbFRYWmZuWGlH?=
 =?utf-8?B?ajRmSnd1Qk9OQVlTQjZnNXdZdTNqd0cyNnY5UFhhanl2bXd4ZTF4NDNWZURJ?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cfe6ab-4e3c-4291-fb65-08dc2c76724c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 09:30:41.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4GAurfX7vUyuREYx7ULnmTake+38vI0u9+kci2YViI281WNRPQ4U1gjGt8csI6QPHMdnkW20+aHrZ5rh0C2p0SOjm/KmrEVoBzHExmdQjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
X-Proofpoint-ORIG-GUID: nQvAQpeEsqm_UvbcdRXauvU4H-EVGihW
X-Proofpoint-GUID: nQvAQpeEsqm_UvbcdRXauvU4H-EVGihW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_04,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 09:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195379

--------------Kr80wopx1eY3O12FeHB06pRq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41D70EF1020439


On 2/13/2024 1:31 AM, Randy MacLeod wrote:
> On 2024-02-12 2:49 p.m., Randy MacLeod wrote:
>> On 2024-02-12 6:00 a.m., Deepthi.Hemraj@windriver.com wrote:
>>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>>
>>> The issue address-sanitizer check failure arises when attempting to r=
un a testcase compiled with AddressSanitizer on RISC-V 64 systems using t=
he SV48 and SV57 virtual address scheme.
>>> This error occurs due to the lack of support for SV48 and SV57 in ASA=
N, which was originally designed for SV39 in Riscv64 architecture.
>>> This patch disables SV48 and SV57 support in QEMU and modifying the k=
ernel to use SV39 by default.
>>
>>
>> Deepthi,
>>
>> Thanks for looking into the gcc-sanitizers feature for qemuriscv64.
>>
>> I'm not sure if we want to make the qemu change that you have=20
>> proposed and
>> since no one else has replied, I've looped in Kevin and Raj who may=20
>> be able to
>> comment on the change.
>>
>> Oh, in reading over the comments to the issue linked below, I see:
>> =C2=A0 "As a temporary workaround for this problem"
>>
>> so I really doubt we want to make this change. Changing thevirtual=20
>> address range for qemu is not to be undertaken lightly!
>>
>> Let's see what we hear from Kevin, Raj and upstream qemu over the=20
>> coming week or two.
>>
>> To me, this is a '(very) nice to have' feature not a 'must have featur=
e'
>> so if we have to wait until after Yocto-5.0, that's fine.
>>
> One more thing Deepthi,
>
> It would be good to add a test case similar to or extending:
>
> =C2=A0=C2=A0 meta/lib/oeqa/runtime/cases/gcc.py
>
> to ensure the feature does not regress.
>
Hi Randy,


Sure, We will work on this requirement with 15338 =E2=80=93 address sanit=
izer=20
self test (yoctoproject.org)=20
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15338>


Thanks,

Deepthi.

> Thanks,
>
> ../Randy
>
>>> Upstream-Status: Backport [https://github.com/google/sanitizers/issue=
s/1707]
>>
>> s/Backport/Submitted/
>>
>> as you have done below in the patch body.
>>
>>
>> Only commits merged to supported branches or master/main, should be=20
>> labelled as back-ports
>>
>> Thanks,
>>
>> ../Randy
>>
>> `
>>
>>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
>>>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>>>   ...isable-sv48-sv57-support-for-riscv64.patch | 25 ++++++++++++++++=
+++
>>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv5=
7-support-for-riscv64.patch
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/reci=
pes-devtools/gcc/gcc-sanitizers.inc
>>> index 524ebd4ba4..8c98e9cf8a 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>>> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>>>   RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>>>   RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>>>   RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
>>> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
>>>  =20
>>>   do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata"
>>>   do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata"
>>>   do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata"
>>>  =20
>>>   # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are =
supported
>>> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loo=
ngarch64).*-linux'
>>> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loo=
ngarch64|riscv64).*-linux'
>>>   # musl is currently broken entirely
>>>   COMPATIBLE_HOST:libc-musl =3D 'null'
>>>  =20
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devto=
ols/qemu/qemu.inc
>>> index 2a81870151..56c988e7fd 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -36,6 +36,7 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}.=
tar.xz \=20
>>> file://fix_segv.patch \ file://qemu-guest-agent.init \=20
>>> file://qemu-guest-agent.udev \ +=20
>>> file://disable-sv48-sv57-support-for-riscv64.patch \ "
>>>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>>  =20
>>> diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-suppor=
t-for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-s=
upport-for-riscv64.patch
>>> new file mode 100644
>>> index 0000000000..7f3eab1463
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-r=
iscv64.patch
>>> @@ -0,0 +1,25 @@
>>> +From: Deepthi Hemraj
>>> +Date: thur, 18 jan 2024 17:52:45
>>> +Subject: disable-sv48-sv57-support-for-riscv64
>>> +
>>> +Disabling  48 & 57 bit virtual memory address in a RISC-V program, w=
hile the system's upper address limit resembles that of a 39-bit address =
space.
>>> +This signals a lack of support for the 48 & 57 bit virtual address s=
pace on RISC-V; only the SV39 scheme is supported.
>>> +
>>> +Upstream-Status: Submitted [https://github.com/google/sanitizers/iss=
ues/1707]
>>> +Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>> +
>>> +---
>>> +
>>> +diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> +--- a/target/riscv/csr.c
>>> ++++ b/target/riscv/csr.c
>>> +@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] =3D {
>>> +     [VM_1_10_MBARE] =3D true,
>>> +     [VM_1_10_SV39] =3D true,
>>> +-    [VM_1_10_SV48] =3D true,
>>> +-    [VM_1_10_SV57] =3D true
>>> ++    [VM_1_10_SV48] =3D false,
>>> ++    [VM_1_10_SV57] =3D false
>>> + };
>>> +
>>> + /* Machine Information Registers */
>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------Kr80wopx1eY3O12FeHB06pRq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41D70EF1020439

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/13/2024 1:31 AM, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:fcc39c54-1961-40ed-88fe-9303c82=
80bf1@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2024-02-12 2:49 p.m., Randy
        MacLeod wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:df3c6eb1-2cec-490f-bb89-e06de=
070b62c@windriver.com">
        <div class=3D"moz-cite-prefix">On 2024-02-12 6:00 a.m., <a class=3D=
"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:Deepthi.H=
emraj@windriver.com" moz-do-not-send=3D"true">Deepthi.Hemraj@windriver.co=
m</a>
          wrote:<br>
        </div>
        <blockquote type=3D"cite" cite=3D"mid:20240212110000.1687187-1-De=
epthi.Hemraj@windriver.com">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Deepthi Hemraj <a =
class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver.c=
om" moz-do-not-send=3D"true">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

The issue address-sanitizer check failure arises when attempting to run a=
 testcase compiled with AddressSanitizer on RISC-V 64 systems using the S=
V48 and SV57 virtual address scheme.
This error occurs due to the lack of support for SV48 and SV57 in ASAN, w=
hich was originally designed for SV39 in Riscv64 architecture.
This patch disables SV48 and SV57 support in QEMU and modifying the kerne=
l to use SV39 by default.</pre>
        </blockquote>
        <p><br>
        </p>
        <p>Deepthi,</p>
        <p>Thanks for looking into the gcc-sanitizers feature for
          qemuriscv64.</p>
        <p>I'm not sure if we want to make the qemu change that you have
          proposed and<br>
          since no one else has replied, I've looped in Kevin and Raj
          who may be able to<br>
          comment on the change.</p>
        <p>Oh, in reading over the comments to the issue linked below, I
          see:<br>
          &nbsp; &quot;As a temporary workaround for this problem&quot;&n=
bsp;</p>
        <p>so I really doubt we want to make this change. Changing the<sp=
an style=3D"white-space: pre-wrap"> virtual address range for qemu is
not to be undertaken lightly!
</span></p>
        <p>Let's see what we hear from Kevin, Raj and upstream qemu over
          the coming week or two.<br>
        </p>
        <p>To me, this is a '(very) nice to have' feature not a 'must
          have feature' <br>
          so if we have to wait until after Yocto-5.0, that's fine.<br>
        </p>
      </blockquote>
      <p>One more thing Deepthi,<br>
        <br>
        It would be good to add a test case similar to or extending:<br>
      </p>
      <p>&nbsp;&nbsp; meta/lib/oeqa/runtime/cases/gcc.py</p>
      <p>to ensure the feature does not regress.</p>
    </blockquote>
    <p>Hi Randy,</p>
    <p><br>
    </p>
    <p>Sure, We will work on this requirement with <a href=3D"https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D15338">15338
        =E2=80=93 address sanitizer self test (yoctoproject.org)</a></p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Deepthi.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:fcc39c54-1961-40ed-88fe-9303c82=
80bf1@windriver.com">
      <p>Thanks,</p>
      <p>../Randy<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:df3c6eb1-2cec-490f-bb89-e06de=
070b62c@windriver.com">
        <p> </p>
        <blockquote type=3D"cite" cite=3D"mid:20240212110000.1687187-1-De=
epthi.Hemraj@windriver.com">
          <pre class=3D"moz-quote-pre" wrap=3D"">Upstream-Status: Backpor=
t [<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/google/s=
anitizers/issues/1707" moz-do-not-send=3D"true">https://github.com/google=
/sanitizers/issues/1707</a>]</pre>
        </blockquote>
        <p>s/Backport/Submitted/</p>
        <p>as you have done below in the patch body.</p>
        <p><br>
        </p>
        <p>Only commits merged to supported branches or master/main,
          should be labelled as back-ports <br>
        </p>
        <p>Thanks,<br>
        </p>
        <p>../Randy</p>
        <p>`<br>
        </p>
        <blockquote type=3D"cite" cite=3D"mid:20240212110000.1687187-1-De=
epthi.Hemraj@windriver.com">
          <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Deepthi H=
emraj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@wi=
ndriver.com" moz-do-not-send=3D"true">&lt;Deepthi.Hemraj@windriver.com&gt=
;</a>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-sup=
port-for-riscv64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-=
devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D &quot; liblsan&quot;
 RRECOMMENDS:${PN}:append:x86-64 =3D &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:powerpc64 =3D &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:aarch64 =3D &quot; liblsan libtsan&quot;
+RRECOMMENDS:${PN}:append:riscv64 =3D &quot; liblsan libtsan&quot;
=20
 do_package_write_ipk[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
 do_package_write_deb[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
 do_package_write_rpm[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
=20
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are suppo=
rted
-COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64).*-linux'
+COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl =3D 'null'
=20
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 2a81870151..56c988e7fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://download.qemu.org/${BPN}-${PV}.tar.xz\file://fix_segv.patch\file:=
//qemu-guest-agent.init\file://qemu-guest-agent.udev\+file://disable-sv48=
-sv57-support-for-riscv64.patch\" moz-do-not-send=3D"true">&quot;https://=
download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fix_segv.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://disable-sv48-sv57-support-for-riscv64.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-fo=
r-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-suppo=
rt-for-riscv64.patch
new file mode 100644
index 0000000000..7f3eab1463
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv=
64.patch
@@ -0,0 +1,25 @@
+From: Deepthi Hemraj
+Date: thur, 18 jan 2024 17:52:45
+Subject: disable-sv48-sv57-support-for-riscv64=20
+
+Disabling  48 &amp; 57 bit virtual memory address in a RISC-V program, w=
hile the system's upper address limit resembles that of a 39-bit address =
space.=20
+This signals a lack of support for the 48 &amp; 57 bit virtual address s=
pace on RISC-V; only the SV39 scheme is supported.
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://github.com/google/sanitizers/issues/1707" moz-do-not-send=3D"true"=
>https://github.com/google/sanitizers/issues/1707</a>]
+Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Deepthi.Hemraj@windriver.com" moz-do-not-send=3D"true">&lt;Deepth=
i.Hemraj@windriver.com&gt;</a>
+
+---
+
+diff --git a/target/riscv/csr.c b/target/riscv/csr.c
+--- a/target/riscv/csr.c
++++ b/target/riscv/csr.c
+@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] =3D {
+     [VM_1_10_MBARE] =3D true,
+     [VM_1_10_SV39] =3D true,
+-    [VM_1_10_SV48] =3D true,
+-    [VM_1_10_SV57] =3D true
++    [VM_1_10_SV48] =3D false,
++    [VM_1_10_SV57] =3D false
+ };
+=20
+ /* Machine Information Registers */
</pre>
        </blockquote>
        <p><br>
        </p>
        <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------Kr80wopx1eY3O12FeHB06pRq--

