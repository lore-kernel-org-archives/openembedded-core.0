Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE93FC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 18:10:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29593.1671473438555240602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 10:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qiv9dY3f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93526c764a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJHxCnM026415
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 10:10:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=hUFvNqdGPQ045zh8Ss/AMRL9ACWC59WRK+XP98LtvKM=;
 b=qiv9dY3foOzge/ta+2l33dxCdCD4NnjeoXCXiaW9kk/GFLEolJHYPYWFqsn/rqtOgMbh
 JYBdNx5qDsvYhr+YvQh5KCyQ/YY+jHRA7lReTh4SQ4WEafCnTK4qqLcsgH3U5qTrudFD
 pb6Ojp2ahHL+9IL97gxc3YW39C5J0+KOAzq0iZHRzUNdBmuhZcUebnpHXpIJhOFNW4uR
 OsjY4x7UjS2YygVNdAtjoSEIAHa1oXBbAaAOVIaqukihZgsCEdKm0GGQD1jijsGA5iw2
 EUasdwRsuIAHs/cpZHVx/5n36WmeUvEVatsvhjDcgZPUpakWNobbN3ouwxb40m/lkVBW TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q9d34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 10:10:37 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJIAbwd021849
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 10:10:37 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q9d33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 10:10:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTyHdOP96wKAMVWMGLxH+ajuEErtvV8PAwd6tspuAt5dvQguOPfk5iIAVvhVsrg067QReOHcj7doS6ovvimTNG3NgUuTvP+UjghLxjn1Iij2F5I7PNEQf3Za7DmK3GH73meUcTQgBGofG2JF3m2sGerHFy/Yizotl341PY3auohwxXehPZS2ysWZb8g1wcYdSf2F/WLKAwYbjn5z0pdAoAs3nfFK7uhgUooXeuMsKKVPi03QeWxplJxUmEdR9Wg5kOcUQ58VBLZCyjC3vDdJuUMr2Ct4ynFYXySp8+S4MZCxcMnUwL0wcNB9eOo2wzdwCEduXgEURvAduiTHyPGb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUFvNqdGPQ045zh8Ss/AMRL9ACWC59WRK+XP98LtvKM=;
 b=a5rnlunlIi0T8ygFlMNOZenSzaGWQpQzwO303TBGo57QK9+5tSE581h4ZiRoiNtRtTHwLX+TuZJRUIeiWIX7o+AKBYyvsZOfZHqclVNRRY6JOXSLgD6gIWs1c+pLFxDRmtNoA/RepuBPhjZiDgSuwwrH/tUdsusOH2xZxhpAYQlG40hV7MiCQ9ZVkdNDHonSyDTstWE6VTKFETIcbwZF17sZq5P78c2xDGIvoKJc+EcM0PBSZnMBQONaSLREps3Tr4o7tGwFAZ5kT2ylj3a0iubK/TaAGH8zrMrOB+N+MRDo+9VnOIpCRMx/zePrwYMgBs6CPSVWsbyRNj1NY+m15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 18:10:35 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 18:10:35 +0000
Message-ID: <ee2f9cd9-00e8-7689-0e54-f0b618518d5e@windriver.com>
Date: Mon, 19 Dec 2022 13:10:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] Target rust
Content-Language: en-CA
To: alex.kiernan@gmail.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAO5Uq5R6p-cWBUDVtULZou_1XSae4AnJRmEgr9pw6ORZ-fQpjw@mail.gmail.com>
 <56cb8d9eb90734fcb59851040f5ca9d7ed0d4f7c.camel@linuxfoundation.org>
 <CAO5Uq5SpDgXNzJ7cN0mzmXEq-FhL2=aP0SUQiJR6zQd08Bm0Og@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAO5Uq5SpDgXNzJ7cN0mzmXEq-FhL2=aP0SUQiJR6zQd08Bm0Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5bb871-892c-4302-b0ff-08dae1ec5324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ALo22+uoAxZr4SOPgoyy/rsfXVVQQ68ANiFCyUZ1MQVfn9EcibEtZxRtCmkppSpNt+XauS6Vv5pLfBX2lsYLfankeyeosEvZLeTy5LOnts9ttr0cFt/f1qHqUVY6tw2paCKw2y8oJaeGuCGinpD4JwHvUbAwB3lX3AhrleQ3GjFphOnZz2wQAuOh7EIbWpgcMkQDt7isKAyNxbRLG3CrGqt0lgv24IfZCcJGpdVogA3WLNYR2coaX9r/FS1oUkl0u9dcP0V/rUvvQkBmMQmhSZX6g2v2BQewsBscyEW9G3gIITR0yfx1A+X4Ur4af7fY0SvU1Vly4fmcGyLwXK0Yn5KVbUZSKRh3GUeJ3KV5PM9NtmPCXxkhG2q10tMQznkGg2OSyG1/51cwLcNsR1Oo7wcpWyXPomgARtzIBoPrSY66y5X11+FUgz1fWJtYsGIBMZwgx1Pr0PhQHQDhbhSFfp0U4rAR6/7awoEa77lCgQEDPYi0ev0xoY+jvMardnNNY9mbG3uVr3wKlPzNgdkmpccSkG4ZSWo7Z2UicYYSw+iIcm0XcImMZRDy0DkCOPh0Elp4NaAvujVGl0civX9/wqpwfVg+6qGZegVD5qtWuJDA3VqtM5mdP5JTbDBdt/LGoboToY1+cWbt+A8cvPL81fBnuzmUc077FpCPkFrhgH3BeXrcHCI2jpxOXJMml7KhBduL0Dy8c3IYX7qbUiMrNSW77FYAYZpasbgWNFM3ll3NLqkks6JLlnESYfg3FG3sbfjDHRsBo8pq3dIOoW2KSMQATjN8YZSEXSSRzugLTokNwnjcOmLaBie/Gr3mXmUF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(451199015)(38100700002)(83380400001)(86362001)(31696002)(316002)(66556008)(66476007)(6916009)(41300700001)(4326008)(8676002)(66946007)(5660300002)(8936002)(2906002)(53546011)(6486002)(186003)(26005)(478600001)(2616005)(966005)(6512007)(6506007)(66899015)(6666004)(31686004)(4001150100001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ym9ZSlJrclJaNk5ocExScnpyN3h2TTZuS2dCWDRaT21GTG93ZUc3WG9RbVdY?=
 =?utf-8?B?ZWxrWHpXUHZZamlReWRTS2hNSnY5cDBnakZ5S2RIeHhYWUt3TWtDa3UvemZY?=
 =?utf-8?B?V3E0TnkwUkIzU0lpcUlURXpuZW5ydHNTdC9LWVhiZGRyaHh6TlJ4NzVZTmxZ?=
 =?utf-8?B?ZG5UZFlLcU4zVTA5aUFQSWw5VW85aW8xYkdLT3MwOGRZWnFHWmtSUUVXYmVu?=
 =?utf-8?B?WkNQbzV2YVBCamxzRVhUbFduR3lZbHZHWHFJWEN4MkNvWEpKQ1FLQ2RKczc4?=
 =?utf-8?B?RlhxUFY5ZUJURVQ2TXVaTzk4QlVBbEw5R2xtQzVWZkk2WmVGTjJvbi83dzZt?=
 =?utf-8?B?ZUs4aGJPUzhhNHJhSXJSMHJnd2p4RFZEQitjdkl6MGFmZy91cktJWlA4YWY3?=
 =?utf-8?B?MVB5enFaUzlHUEJTdmtNakFhTGh4eFVkb3NwamlDVlJ0Zkd6WG9LVTdDV3pr?=
 =?utf-8?B?bE9RVDlnejg4alZyZDZWbmZJVlh6ZGMyaFZyQktSZ2dZS1I3dEY0T2t3NnRm?=
 =?utf-8?B?R3Z5eTlyRXllSHpuQ2RiZkhZUHgxUENwb25lQytjNDdScXFTZk5NbStMTE1O?=
 =?utf-8?B?bHpyWDdZT1oyNkg1c21IM2tLdXNrMFpqYU5aVkVrVk9ESXM0eDE1a055NWpZ?=
 =?utf-8?B?OURSdXJPSGdzUzE0NmNUdXhFNVNKUkh6ZlN4ZitKN1ZNZEZWTkRJYlZOUEpr?=
 =?utf-8?B?b2Q0NHJJMlJCNFgrM2Q1ZlN4MmZZL2VrYjJaODBHUXBTdmM3bUhHTlNER3JC?=
 =?utf-8?B?S2FCUU9JUHNCQktiVnplMjBoY0R2cDBETkt6anc2SzY4eXJzbWtaK2x4clRJ?=
 =?utf-8?B?cFdDTkZnN3ZPTEQrdHl2czhWMm4zZWtlRnBuUXU0VGFjdUFoNGZFZ1k5WHhk?=
 =?utf-8?B?K0NKTnBMZFc0NWM3QVBWUGNocDhHc29LWEZObWRwaEkzSFV1Tm4zMnBocjdn?=
 =?utf-8?B?Sy8xU2VpdTdKRFlTaGU0RWVINHpNcjJkc3l4ekM1dWtXUjArVExEU2l5SjNt?=
 =?utf-8?B?NVBNK09qSTZNenowditYRlRRbGVUNGViZE81aHp6SEF4RkdEcllWUkw2YjA3?=
 =?utf-8?B?UHZjaUFWSmRQckIzb1NXWng1ZkJzV1Q5NXNMNU8reHVNZ1ZXWS82cDRBalZ4?=
 =?utf-8?B?QXBock01VFhUeTVXcUVtbW5HQkRLUmdFUm1xb0p3K0tWU08xL3orbFU2cjly?=
 =?utf-8?B?NnN0bXJabitIQXJPS2NWRC95eHVhOVhnbHI4ZXJrb0xlRDlFYjRKeitCaity?=
 =?utf-8?B?VDZ3Z2tFcTVLeit4d212dS8wNXM2c24rMUk0SHRVNjZUb3d4aXU0SUhtclNI?=
 =?utf-8?B?Sk1JNUdpa01RbW0rY3BnamxGM0FJVzhsNmI2b1dNUnBjTVluL29hN2JNQktU?=
 =?utf-8?B?Nk42ZkFkLzZrYysvUzJERWNaalhiZXNyK2xSRGZDWDlTeGtFYjFxWHN3NXd5?=
 =?utf-8?B?QUVWSEVMM05pU1VDUnBWamlmRnZob056NzU5OGJWK1NxYXMvYlgvTjJHS3A2?=
 =?utf-8?B?WDlZMVRjWVVCT1JzWXRxZ3IxQ3oxOTRPMVRVNUNBakdJVWpSUExSOVk4aTIw?=
 =?utf-8?B?MEhkZ3M5NkRZZmlRMmY0UWRWRU51QjVGZGczS090SG5HZnVNbGdxTE1LS21T?=
 =?utf-8?B?NU1JUEVPTzhBSkVKUU5pWG13Q1dpZUxxakJ5U3FRODU4MFl2cDVCQ3dLQnBo?=
 =?utf-8?B?R21aZmszZ0VuK252WXdTbm8xVXV2WUVyNXlxKzRUWENjZzRXRTc1ck4xWHBG?=
 =?utf-8?B?Vnk0M3NCTHBYa2N1YUhLZkpxdVgrbXpPN05LSitzMmpYL3AxZEY5L2hoOW51?=
 =?utf-8?B?N0dKc1lXL0xsNHBWUFJBWmZ5QWtMeFF5d3h6OEFMSStvMDJmN25DRnpMYk43?=
 =?utf-8?B?U3VrcmFqK1dzc1ZSaWdvbG9sSUkzSjJjVEgrWGsxbXRFMUR2MHlDVHRWR1lj?=
 =?utf-8?B?Q1Jma2VXaHBMZGVUTXNzU2orQkxvZ3owY3NRSEE0MEV1ZUFyMENYVzBXTDV0?=
 =?utf-8?B?QVRxKyswKzFpVFltaGFPd3kzV0JtdE1Bc0xJZWdHZkdueTJsNWFPMmFxMG9E?=
 =?utf-8?B?M0g5T2hySjJTdHc2UVNNKzhLdHcxUUtmNWt1a2E1VXRNbzNYZEt5d0Nxa3ND?=
 =?utf-8?B?UmxaL1JhRFNEaW9pN096VGJNZ0ZtMVkxY3BSUGhJVk9pQ3lSV3ZFNER0V2VK?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5bb871-892c-4302-b0ff-08dae1ec5324
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 18:10:35.1197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xoTBBT9gFla+vhXgcn+81jr7Oy3IX1IsM/sw7nflxHlqT4mUyo1WYGHp4fHExMAFA0izaBdmkyNhT2I9GZCXgkRm2SMi1JR1X1CVbDnAf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
X-Proofpoint-ORIG-GUID: Bm2LaXRjJUOFv45o3gUHnsL-xu5mAq_r
X-Proofpoint-GUID: Tyx9-cpAp9k7_5CQpSYB_SOkMaLPsD1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 18:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174831

On 2022-12-16 12:09, Alex Kiernan via lists.openembedded.org wrote:
> On Fri, Dec 16, 2022 at 2:16 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2022-12-16 at 10:42 +0000, Alex Kiernan wrote:
>>> Does anyone actually use target rust?

Hi Alex,

I'm not aware of anyone currently *needing* rust on target but
when (if?) we support rust in the kernel, then we'll also need
rust on target since we have a requirement to build the kernel /
kernel modules on target.


>>> I thought we had some test
>>> coverage, but I'm failing to find it.
>> A basic hello world on target:
>>
>> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/rust.py
>>
>> but we could do with something more along the lines of:
>>
>> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/gcc.py
>>
>> adding.
>>
>> We do also have:
>>
>> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/sdk/cases/rust.py
>>
>> which are basic tests for rust in the SDK.
>>
>>> After the thread on stable/beta/nightly, I started playing with it on
>>> target and so far have:
>>>
>>> * we're missing the rustlib/<target>/target.json
>>> * we don't have gcc/binutils in RDEPENDS so there's no linker
>>> * no libc-dev/libgcc-dev
>>>
>>> I'm not sure how target dev tools ever get used/installed as it's not
>>> something I've ever touched, so maybe the last one/two are expected?
>>> But the missing target.json just makes rustc bail on startup - looks
>>> like 16b4ac3f558f ("rust: Enable nativesdk and target builds + replace
>>> rust-tools-cross-canadian") might be where it got dropped, just
>>> checking.
>> On target rust never worked.
> I don't know if it ever worked in meta-rust - a number of the
> fixes/patches I came across from that time suggested it might have
> done, but it was years ago.
>
>> I made it build and tried to clean up a
>> variety of things but I moved on to other things before getting to the
>> target toolchain/runtime testing. Patches to move forward welcome,
>> especially with tests. The work I did was to at least try and get
>> things onto a proper footing for the future.
>>
> I'll have a look at some tests, since having figured out how to make
> it work, I'd rather it didn't regress, even if I don't actually intend
> to use it!
>
> With the target.json patch I sent up, plus gcc binutils libc-dev
> libgcc-dev added to an image `rustc` on target generates working
> binaries.

Great!

Thanks,

../Randy

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174761): https://lists.openembedded.org/g/openembedded-core/message/174761
> Mute This Topic: https://lists.openembedded.org/mt/95707414/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


