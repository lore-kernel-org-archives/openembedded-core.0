Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A246C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:59:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.70931.1705921135526485039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xg4w0WoJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17513ef42b=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M6p9l0007594
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:58:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=df/uV1CQ36QLV0YRn0fMdhL9h7EkS6GMFpoCybmvE/Q=; b=
	Xg4w0WoJx+N9K6G7K8kJP0FnAaH7QxB6WmhXxrxJwyERr4oHpfsZc2m+YlZMElFk
	zUs61IS2erqV6YofZv1VCxbuSz+0/fyU3iGLxznAdopgRvpmi9v44lmUyKK6xzlp
	jTI7tMWxqMe7muNgmAS/QVHhKWv3Ms1nGQS8MPm1hnF2uywwVFlLU5De4eqw7HqQ
	2BfcwmytIvtl5sY+QAIwUI0kUSqgdx3auLAlvwEvkin5AAWBtSaL0FHaW6IYpeT8
	NPAcQA4EoHvviq/calH7aM9syslo3ROG+bKMF0YQhj9YkDRJRtpexLRrrZfkLoYN
	pt5Nyv8+IM/YQUlKCGGq7Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejksehn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQ1pN1YyDyrrPemqX/noGCuYeDKrAPyut3GlrWIT+2EyDasvnpWUkgkrypS7DjIr4xgaii3/M+8FPiO4e5TGscGakPyL+eTuVobPaeFBmoCmSxAcjunNt7m2beU0UsUGXE2YPD9LUJvMZama6S5G1aiEbPhfIrKXcH0r/C1+TgqkBV6uYt3e4y+OmaZEwd/KYSq1uqEY+9ZyC9r+V4AO/pkIzLzLkePoA2LLL5TEWq+/5GyijGJscEqWizSshCjrFs9fRqixqhz+kiO75jt0beMp+S6WVhdpWSnBRpB6E3nhQwQQ1Kgkbr11JNF3mkxe1ytJQx+XkrcMxjfqySQYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=df/uV1CQ36QLV0YRn0fMdhL9h7EkS6GMFpoCybmvE/Q=;
 b=C5/DxxA7SLnI8+2JUkdDgYsrV9SUPTxA59VfbXTGl1m9Lulf+F22uGwTbpofr389OR5nJFbJ5IY2GXpecmawYaQC6GsbLxK+SnZvCwWQ8/sJxPX4JIswkK7Sfvc4p86kFwE+S/yUbzipo3vNEK4zlLVyNH6Oo7Ihe2d3o9tWYIlud8m/+J8DejXP0IA7Uv6BSD+fZ0lO2TfWD+FoO/0coOVpCSkZGF8JC7o5kEkxVXQmYsSLRGzcFgt2tyRa6jtMV60GvEajfcQwDnSdcrT1DKtwevjQL6rbjJX2MZaRcI5KGat6L618qZwmxZ6kyULivHN2DcWjbTvjJqkLNMar8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.27; Mon, 22 Jan
 2024 10:58:50 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Mon, 22 Jan 2024
 10:58:50 +0000
Message-ID: <b31714ef-7a03-4c2a-ba65-6ca633ec623a@windriver.com>
Date: Mon, 22 Jan 2024 16:28:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] rust: Fetch cargo from rust-snapshot dir.
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
 <34274d69-cab5-4e74-a167-4a72a50d9e55@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <34274d69-cab5-4e74-a167-4a72a50d9e55@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: acb54a5c-0cf8-462e-9944-08dc1b391d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ED+DgZkW9sQVizzmR77A9/b2JEmKayKZwdsKy4DKB6ySNot9YZ+eG3PLoLG7FLcKKnzyXj+vywInCgHN0weyxnFPNS8LlEzECPuqCtK3bEf0yRqN45nFjbOc/BcMGn/F8mNGa/8O9xVEaor0B1MWL32qtBFKRYHHTKqh8J8dtIytJnq9e0pyWwdIq7KKw4HRdyQkM0nVPk4deDxt7D7slA3SZZVBz8HpyRfox59M7MFAuK3Bl8Az2e7DpR9kVNzeM2FtFRNsw/BRGdYKHKuEJQYvgL5CfTDO2Ycjo91Zeaw70ruM0CGxD2oJUopGZTdsLnNRExe0xkOAYy43ZXNYlI/EwWiUs/CceXwU7Tb0jC64ku2u4EikeMT84GTL/dezCUizmL/NYqGQxUmWOUfyX3kuljwZpOWxHShvXSWjc9ShEVzrWWEbTpo6c4cHWmdbOjNRY8CiDO9X9BmmA2ZF5/uCPJPCm3TcEiRLoYV0QCUckRgPVaRM3xWFGLM4zpaeTAEYqqo4echXYMyJ8DGq3hs/rJTKayOn997imtDEtGrMLwW33Y2T2wmaHwuB0b1dZENHX1yUynEFuqSjZUHyg+mkCnllUi9HGug3lH415/5aswQgu3sZxwuycO72ohseaQOqXGBNeGni2WSpvoxrypK2nUovaGD4Lc8NNTsVCVeKdR87q9VCnwqrak9ZpD+y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39850400004)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(6506007)(26005)(107886003)(2616005)(6666004)(53546011)(6512007)(83380400001)(5660300002)(41300700001)(66476007)(8936002)(4326008)(8676002)(478600001)(316002)(66946007)(66556008)(6486002)(2906002)(36756003)(86362001)(38100700002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTV2NTVpNzdUcW5BeWVEYXNFOVd0RjRHUjBJbXg4bUE0emlKY0w4SWFDS04v?=
 =?utf-8?B?M0FTREdnRnZncERydlROU2E2SDRRVkc1Mm5RakREY2trRVhSNExyeWFxNStG?=
 =?utf-8?B?blA0d1hidDIwOFVGdGc5U0RVcXV6MFRqK0tzc1ViekhoL2pnL0pLM2Y0R09Z?=
 =?utf-8?B?RERkREpyTlNQKzdsRkxVRnhSaWloUHlXRENPZnA0WU00OVJOMEhpYWQ0SFpK?=
 =?utf-8?B?REpEMjFVdFpBTzBuN0xFYXdjQkJYMzVlWmk5eVAxbFp1ano0QTF3V0VaVUxL?=
 =?utf-8?B?aEt5VUxrV1BWeERaQnFyNzVzMzJhQW1pWjVqQnR6bHVLcGwrbXE0UXk1K0J3?=
 =?utf-8?B?Tm5jdHhjeFhBeVIybHNVLzN3TE5Gc3NWc2twMGxzWnloelZXVXowOHJuSFVZ?=
 =?utf-8?B?MkFQclpWeXdKNEx5UmdlbTBIaHVzSkQzZ3lwak5LTDdnWDRqYVdqSStjakJH?=
 =?utf-8?B?WlZuTWl3T0hmVUZGOFJDYlREN01DM0pIMUlhaWlvSEJFc0hOYVFGdTBiMHVL?=
 =?utf-8?B?NUcyN3p2MncyT2IxYkdvNnZObjBUR2RPL0ttcnkvMk1uK1FlOGE4ZnZXNlZ1?=
 =?utf-8?B?QjAzVXRXZDkxSTV4ODAzN3psRlVFbk5WdHJLZUlhSGtlYTlXekE1R2J0T1Zl?=
 =?utf-8?B?RU5GcDY4K2ZUVk9GbW5BS2F0STdINzdiMFFncFJUR0ljZmRtMmZHanBoRm9u?=
 =?utf-8?B?cUpqeUNGSFBkRmhnR1FuUjViN3JONXhiZHpaZUxDbVpuYmtqUGZzV051ZUtN?=
 =?utf-8?B?REtMQ2pSeHl4cURwOXlYV05MQkNDSXl2ZFNwVlpZcEEweHJIMGxFcXlaQ3hI?=
 =?utf-8?B?L1U3T0ZSUU5PVTdZL2ZkRGJXTmcyYTMvV3pJQWJnQmsrNmhxcEJTTkNCN2Yr?=
 =?utf-8?B?U3d6dm5SeDI5SXRLM0c0dHpYWmFvdzFodjdNZEpra0JFR0FRd2k3Qk9rZU1n?=
 =?utf-8?B?MThHdnJHQUdYVUUwbjROSFlFaEcxc00ySXU3bGl4S2JHQ1Z6VXBCK0Z5a0dl?=
 =?utf-8?B?aDE2eTk1Yk8xbzdkdXVRdm8rbVlJaEFzeUgzZkdqZGJpQkZsSi9OU1Y0S2hI?=
 =?utf-8?B?VVU3cUl5NnAwMXo5dktRU0lKS2hsTmtQeElBNEt1a3VuM3ROd0pMMTBuTDA5?=
 =?utf-8?B?RXpxTHE3dW9MNVZTajhhQVFmVHRaQ2NIT2hSc2xXaEhrS3U1c3VKVjBLazll?=
 =?utf-8?B?dWloY0VZMGZjUENSY2txc1JQczR1TGhPVFRTM01SRklQd0FaL25pWGpIczZU?=
 =?utf-8?B?cDh6aVdIODRuR2w4emRvT3JLcDFvbXE5RmRxeERlK0sxZjhGNVpGYmZ0cUoy?=
 =?utf-8?B?RVlUUERmbm96U2w0eTBmelNtRUhtS3ROSW96UFVicDUvWEFVZ0hTTStKUEpV?=
 =?utf-8?B?czc3bTRDNUI3WTZYRnd1WnUvRm1ydE5KR2V6Y1lyOTQ1VXB0akgwUzZCUzc3?=
 =?utf-8?B?SGFkbkJOWmhvRXhhY2dsL3NsYTNXZ0xmdFVTcjN6MVFuZ0liWUlqcTd3QjJR?=
 =?utf-8?B?ZVNsdy9Pc0pTWlcvRXdYcUU4YVhTY1hvdDAwSFdWbTV2SnRna0pnN2RNcldk?=
 =?utf-8?B?dXNkWGhqTWdQZHZid0ZXWWMyM1RQSnZpOHRCZmNnQ0FMREZLcGNUN1RWbDcy?=
 =?utf-8?B?eWdoUEtMZVlxdUNVV3VRMXAyYzBtbDFTclkvODMxWWh1SUpZaEFHTGwrYnd5?=
 =?utf-8?B?cnk3Mkt5dHRzekZGeVZoVmRWRXpqd3JGS014OGVYV3lYSVQxRkVia0V6bXZo?=
 =?utf-8?B?ckw1Ym9Ib2dTNk4rK21WN0pSWitodGo1ZkJCei9URE5HUU9obWlXM0NKNG5k?=
 =?utf-8?B?Tzc3VnN1VWJ0cCtLUzBwQlFlUWl5U0hJMUJPYUhsMUhWTlZRVjR2MnFHbUtN?=
 =?utf-8?B?T25hellwZk9veXFkbXhqdFJFbmNIN0xjWlFjUTIySTZDTzc0cnRxODdFaklz?=
 =?utf-8?B?Mk5mblp3dlk0cTFsZFNrZ2NaNktFams3S1N2S0ZoZVMzd0JFUFVsQXI1WmVp?=
 =?utf-8?B?SGhURkpxZ3BjaWc2aFJyeG5sVTVUNU41L1IvTEFudTRRZDZvOXhlS1VGSVZP?=
 =?utf-8?B?RHhGb2hySllmZDFwSXppZEdhTUIyQnpDMGdTUWg3NVdWSzlLNzFwc3FCZUVw?=
 =?utf-8?B?YTBiNEd0ZVR4ZmE2d05wdmo5a20yQTcyVE8zWFRTTlpWdi8vcmxUdWkvaWRs?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb54a5c-0cf8-462e-9944-08dc1b391d48
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 10:58:50.0078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5s5VYIBakIW6Som/aU8cazs+f+vH1ACwKG62fSs/e2egQ06lnflnLYNKZrWJbZBuw+WkVrpRbJ+/d6JUedC5CtS0bAwa1LC73mpS+l6X54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
X-Proofpoint-ORIG-GUID: d9jIpHOaK8ntDV-ouPcqvaNX-xLyjTQV
X-Proofpoint-GUID: d9jIpHOaK8ntDV-ouPcqvaNX-xLyjTQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_01,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401220078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194141


On 20-01-2024 22:33, Randy MacLeod wrote:
> On 2024-01-19 10:09 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Fixes: Exception: no cargo executable found at
>>         `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
>>
>> Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.
>>
>> Patch sent to upstream-https://github.com/rust-lang/rust/pull/120125
>
>
> Good!
>
> It's a bit worrying that the PR pipeline failed a number of tests.
> Do you want to revise that and push a new commit there and do a v3 here?
>
I will look into the failure in the PR but for now we need this patch 
for rust oe-selftest in Yocto.

Regards,
Yash
>
> ../Randy
>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
>>
>> diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/recipes-devtools/rust/files/cargo-path.patch
>> new file mode 100644
>> index 0000000000..547df353d2
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rust/files/cargo-path.patch
>> @@ -0,0 +1,37 @@
>> +Fix the cargo binary path error and ensure that it is fetched
>> +during rustc bootstrap in rust oe-selftest.
>> +
>> +======================================================================
>> +ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
>> +----------------------------------------------------------------------
>> +Traceback (most recent call last):
>> +  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 157, in test_cargoflags
>> +    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
>> +  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 154, in build_args
>> +    return build.build_bootstrap_cmd(env), env
>> +  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py", line 960, in build_bootstrap_cmd
>> +    raise Exception("no cargo executable found at `{}`".format(
>> +Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
>> +
>> +Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/120125]
>> +
>> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> +---
>> +diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
>> +--- a/src/bootstrap/bootstrap.py
>> ++++ b/src/bootstrap/bootstrap.py
>> +@@ -954,9 +954,11 @@
>> +         if deny_warnings:
>> +             env["RUSTFLAGS"] += " -Dwarnings"
>> +
>> +-        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
>> +-            os.pathsep + env["PATH"]
>> +-        if not os.path.isfile(self.cargo()):
>> ++        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
>> ++        if not os.path.isfile(cargo_bin_path):
>> ++            cargo_bin_path = os.getenv("RUST_TARGET_PATH") + "rust-snapshot/bin/cargo"
>> ++            env["PATH"] = os.path.dirname(cargo_bin_path) + os.pathsep + env["PATH"]
>> ++        else:
>> +             raise Exception("no cargo executable found at `{}`".format(
>> +                 self.cargo()))
>> +         args = [self.cargo(), "build", "--manifest-path",
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

