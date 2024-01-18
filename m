Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50869C47DD3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 20:08:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3430.1705608500055240450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 12:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JXDRMJS6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174791ccb8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IBB8cL018586
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 20:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=SX1xlygN6tuxy4HWy7L
	xngTA8bY1harzFw3rbRmbSAI=; b=JXDRMJS6gkvzctCoNs+Z6hLeBxSp4iP58KN
	Qw9j90Wi4WulCOY/T2uhbu1ZyyJ78TkWJHfu046DlBN6acKQRePAIq+m6mUvU1Pv
	MXW38D1xQOulXxK8VqtR7OK+oTS1F2XoBa37iD0+ykttfa7Bg/5AFjfSo/thqiHL
	spPigNkaKkJ6Iiv4y3Rhpec5cvvkCFJJQFnPsNXan5egaTOwhH1gwtB3+n4sgeZm
	VSzEtTgCrEI9Vs+HrmPbq0Vjs2sVkxRt7BI9lGHFcJJLTxiXcki3/T4bgGWU8i9u
	s+SmrRO8CcLAPZn1bEP/jMmi23RFUpF0kIo2qAAIucNKdKuIOug==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkhg667aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 20:08:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgU2QNnYYXvcJM5S37R3cTgrpBDobn+lEe9weltXg22dU/Y4pVG+t/m2WIH9cpuNmzoXnf4NHS77jsk5jJz2QpRCJEbiuR42yhBBDiF59t/zl8BqJe+7sj93bk4usvKl60Izj4evbBK/LU268ONvgB2j6AdGPQKaQ6DhUjGdhNajDaoVTE5098x5Cv3W7LbCi/tU45VJdXh8nKUQeBwoNxqPfW5ljixbqpAtGHtHNRPDBcviZ5DUukAn/G2W0yhCu9IXGL56npaSgd4KPdN38nkEDzy8S7BvNt0PmViKNaoSHqkUh3pOdJnAu/0D8r8W01lPkKZoL8bRmEYvuI1hCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX1xlygN6tuxy4HWy7LxngTA8bY1harzFw3rbRmbSAI=;
 b=iGjdpm+QKKSmFzYZ0p4LEwEDwhlHKDJuVA52ChYUqOCjWvmoFZNUj7rRnVtc+JWxmZUjES0tmCBOOdLWwR7HLic1iqIARyAMu6/P5dI5T+NwqF7SnhVMRfnJWRkf+Cd47VwO/QWVadHcVbgmpdODuaUnJuoP+wosRw9b1PkQ+miQPm6wUf04bN/g0PxR1/abO0K/8jqRdx2X12Xsa+RR2IClHBpXDiIQcjOGTiyFoRn8PANvILwmFjLNe98nURxo9qFLtPX/Qi2gw3T7oSZ2fpfP1K5bJd/v7cfPcczQ260GYjXr4tnbbNDmdoGH8XX9c6rO9Mm+jQf3ezVEYzlXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 20:08:13 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7181.026; Thu, 18 Jan 2024
 20:08:13 +0000
Content-Type: multipart/alternative;
 boundary="------------Q0ClMEisOJ9YffKOA62g0vSn"
Message-ID: <4a855ad1-a4c8-4141-9ee8-7b2f5ec0a0a7@windriver.com>
Date: Thu, 18 Jan 2024 15:08:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Enable rust oe-selftest
Content-Language: en-CA
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240118105723.904877-1-Yash.Shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240118105723.904877-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::11) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: b9230a48-c76d-421e-8649-08dc186132cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wwqtCQUTJfdh5k4fVrv2UdOaqld255smFsRmXyNb+4WoDqtQ4OiTx6RtCDsdgsZm/MXyPVnO2HSkVLD2/aN8tWI5/Ayvu+PmESstVdNP/TQOrYphQH0g242UHX1eoGwXfwipT9mCbEEipoepzSmel2Kglmgk1scgyLXAB/0mTlh3+X2cZuK1UUAkyOa8m3uIRG+7YRru8q73VLLUdbnx/ua9x3V6Mt3dmHY2NnQr1lOJoN9KUzJ6xfTuZ3eMGiYhkx4axVo+mHp0+NjHVHXohyXGDKAI3EqiRluSVG1V+6NSOlVMZ3gSv+IkgBHhJHcAShzYbUSQFxY7c4IWxs0SV6SLbNGLW259GozCZNg/v4ac1e2u9gRZEuT+n7C1FW48jJKZFg1f3IzaQBMF1CRUNK4MxsK6vsLB0N2KiSktr+7X3L92hvDBw/33+9Xtiq+L2qPT8ONT2kRvXqaEgMX0DMGlPUYZZBmTCMIcNQyruEv0JEXKbkZa2gbLIG63MCsQjVYuU1dnZ4xxhyUvU0AOJObf3h8HJZqgoGINb3nbgcIF1ePRprdhdGtLBJ/cmzudHLqUQc2IuEfDIjdxtQ5KhjD1UEx2XeZEXiC3gXv/V0hgT2UgztWEVZF5/rdEcxZRFNC6gwKQH9jXarhuitYCc9qAwLvTC8kZ/P9vkxu4IJL5pJi2tRs2QYAaAAxKKFV1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(376002)(346002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(478600001)(31696002)(30864003)(38100700002)(86362001)(41300700001)(36756003)(5660300002)(2906002)(166002)(316002)(66946007)(966005)(6512007)(66476007)(6486002)(6666004)(2616005)(83380400001)(33964004)(6506007)(66556008)(8936002)(8676002)(26005)(107886003)(4326008)(53546011)(31686004)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHBFcFVKb2p5ZnJhUjg0MVE1R2NGRi9FcDA5SGNxS1pGNXZ1bXBKeUhMNXpi?=
 =?utf-8?B?WHJhUXFDUHhFT2taL2x2V05zSHZvUHVBY1ZQWDlpSXVkUkNpb1RNZUdtUFZV?=
 =?utf-8?B?WEE1UzNiYjBrY2xtaEpQdzZBayttM0s2UW43dzBKR1czcDYwR0JsSERMYzY4?=
 =?utf-8?B?RnhQbG9ONjY5dVJNaGxxditvS1VnQ2tKME9oWk1qdU9NU2gzT1lUdHM5VEtP?=
 =?utf-8?B?UjMzYVAyVkNWNnN6MmRXVmZ0M0dsNEZUQlNKVWlzOTZCdFFVOXZqNFFDeUtP?=
 =?utf-8?B?UGZIQ2JXTkRCaWpvNVZ0eWRnUGVHbkxQVU9XSnVUWEdIUXNBelBHR2NvbUxh?=
 =?utf-8?B?RU9CQ1VkME9uWHFOa3NwYmR3djFncTQzSGd0VlJvbExPK3RFdFN2a29UUW5T?=
 =?utf-8?B?NGNiU2JueDFHUFY1TkNZZlE3eXZCdFVNRFBYcGQ2aXowRGtPWlI1c1dVT3BJ?=
 =?utf-8?B?VjVOSlp0WU9nQ0hEeWx6QnNMMnZWQmY4bm5jamloS1V6ZkgydjY5TXhiaVUz?=
 =?utf-8?B?bEZibWlhM21nNHZBVGZvSlViZU04aDBEZkhYdWxoNWh0QXlWVFlOVURzYkhF?=
 =?utf-8?B?RER0a3ltZUp0ZityQVV5bVczUnlYWjR4cGVnQTVpd083dTNxLzYvb2NhakRl?=
 =?utf-8?B?TFVSQUhNQ01uUktOR1VrZHF5M0Q2YldEUC96bkE1ZUlWQ0pIM1dweDI2eDdv?=
 =?utf-8?B?cEx4MGZQNVdpNFN5U0Jxdjg0VzdEci9UK0pDU09IVHVlRXRaY2RSNmhmekl0?=
 =?utf-8?B?Z3p4V0J3THQxZHNlRW1tczdaZWxhRkUxaGpMU0ppSk9sbEY0aTI4MmIvUmRm?=
 =?utf-8?B?UktvcmdKM2JYZ3FhbXNRVlpQK1VSbU53VkRjWkwwVlIxYTRoelZDcVhaS0gv?=
 =?utf-8?B?SnRWRHN6V1FNclpDcFFHNEZOOWFxcmk0YzArZWVsS2xHT1lWMGJQSXUwZXJ5?=
 =?utf-8?B?aXUvcFlXa3A2REY3c21qNEFzQkJZSWZXR2FOSFhCQmFkNURFRnZ1NWdkYmEz?=
 =?utf-8?B?RDhiK0lxajJSOWl6SWMxNTB0SlRLUUg3OEh3WVZqTERFTjRBQnY1aWlnTlpP?=
 =?utf-8?B?Yjgvb0ZrVFQzNituS3J5MzVoVVplakRWeHFraGQ2V3JEeVJIb3M0QjVOdTBF?=
 =?utf-8?B?Skh4L3I3TWN6S0VES2tWdlV6OUNqUnRnMDNhUHBIT0dJa21kZTRGN040MytE?=
 =?utf-8?B?MmtiYjFVUWZqRmEvSU5BQ3lmbVJIRFpHWDZzSlpwbDR6S3A4VGpGeHI4Qzls?=
 =?utf-8?B?Z1N1ZmVialJzdWNEckhvb0lXSjBTY1NUS295OVpiMHJiVTRtb2dSbVBUbWkx?=
 =?utf-8?B?VnZUbFZzd3hqcUNlZE9hSktQbC83K1NZL2MzM0NEYnI1V0hmS2FQTktldnJI?=
 =?utf-8?B?M2hWSS9aRzNsamRFMTk5RjlFUmFzeFo3eUQ5Rm1rRm91QnRHditRd3ZudTZE?=
 =?utf-8?B?Mml4WFVTeEptQ0prNXRkZ0ZJWXk4Y2Y3a2lHME1qbkRFeXFwdWlUK09heGMx?=
 =?utf-8?B?cHpRNURVdERnTU9rODJkR2pwY1k2SnlKbExLWTBOaXE4RXBodjlnYmNVWjEv?=
 =?utf-8?B?YkFzWWJ6Q2lROHUrQ3NzTTZpQTZ0ZS80RHZxQVB4UElxWFhmQWJ0WEFwQVBu?=
 =?utf-8?B?eFhkc2VOZlNVQzNOZm1LTzZxeE9mWEhnakU5R3c2clFWeU9XR25rTjcvMXVO?=
 =?utf-8?B?QWtwcVdzdTBuZ1NQaFNJNStpbkpheEROZXhISmpSVE1UVW1aNEo5L3oxU216?=
 =?utf-8?B?bC9CTGM0bjBLVkVTOU43Z21FWm5HeDVOdzMrZWdtVml6QXZRdkprMnNITkNx?=
 =?utf-8?B?VWhKcnlkNHd3eTVGZGdNSzRTTEhkMHpKZGtUYm4zL25WSW9RZzRpMW1yeUtl?=
 =?utf-8?B?NUZ5M0sxRnRWM3NiUlJYT0k1ZzVQWHA0QzZYajltT2RWK1ZkZjJzMnBjbnZq?=
 =?utf-8?B?UmcxMG05YUNTeFE3dlZsMEhzNUZYblBaVHJTVnh4dUVaUHp5TlY0VCtES3JB?=
 =?utf-8?B?M2RSUWhKaU5jWHIxQ1NMYnBlTjV1VGs4ZVFWYTg4b082emFDbEZXamhSM2Ns?=
 =?utf-8?B?bm9PVEllMVlwOUZYcS9jQ0pleUZpaUV6QUZtcGlWWUpPUDVlUG9rY081cHZu?=
 =?utf-8?B?Wk9TU3RpQTRLaExWVFQ2Ukg2aS9nRG1GZ0R6MVBZVjk0UGMxK2JVSnI4bmh6?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9230a48-c76d-421e-8649-08dc186132cc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 20:08:13.0262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjUXDj0U6E5+/zhlEimK3kNH4IWRTF637SK8Qj6tkrKUQQ5RWNJa0VOyGmXcRPUd75kBqVGmha1NoacuAS87F5A1chBT5ARZ528kTFk/bYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
X-Proofpoint-ORIG-GUID: VkBwllC66To-2H2b-O6vXTpQ6yilpVoE
X-Proofpoint-GUID: VkBwllC66To-2H2b-O6vXTpQ6yilpVoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_09,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 20:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193998

--------------Q0ClMEisOJ9YffKOA62g0vSn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40IBB8cL018586

On 2024-01-18 5:57 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Enable rust oe-selftest for rust 1.74.1 version and
> add target_cfg.patch to handle target configurations
> for custom targets.

Hi Yashe,

Yay, getting the rust test suite working again great news!

We talked about this in today's YP bug review and decided NOT to merge th=
is
until after the M2 build is taken care of over the next few days.

That gives me a chance to review the commit and ask some questions! ;-)

First, your commit log should be expanded to explain what has changed at=20
a high level
to someone who is just reading "git log".

What you have is a good start but I'd like more info on what changed in:
meta/lib/oeqa/selftest/cases/rust.py

There are lots of tests added to the exclude list and some seem to have=20
just moved.

Please explain why you did this and if there is any way to avoid the=20
"noise" of moved tests in future updates. Could you also report on the=20
number of newly disabled tests and try to summarize in the commit log=20
what these tests are doing and

Ah, I see what you have done: 1. sort the exclude list 2. add the newly=20
excluded tests. Please do that in separate commits so that it's easier=20
to understand. This will reduce the size of the "Enable rust=20
oe-selftest" diff for meta/lib/oeqa/selftest/cases/rust.py from: | 103=20
++++++++----- to: | 37 +++-

and let people easily see that most of the newly excluded tests are in=20
tests/codegen .

That reminds me, do we really need to list directories in that exclude=20
list or only list .rs files?

If I save the list to /tmp/jj, you can see that we could reduce the list=20
by 34 lines:

=E2=9D=AF rg "\.rs" /tmp/jj | wc -l 203 =E2=9D=AF rg -v "\.rs" /tmp/jj | =
wc -l 34

If we can do that, again do it as a separate commit since it should not=20
affect the outcome of the test.


Also this backport link:
https://github.com/rust-lang/rust/pull/119619/commits
is actually 3 separate commits so it might be better to apply those=20
individually
so that we can know when they can be dropped by running:
$ git tag --contains <commit-id> on each commit

Also in the patches, please add you Signed-Off-By line but keep the=20
upstream author's S-O-B line.



For anyone interested we did talk about the number of Rust tests that we=20
are excluding and of course our goal is to work with the upstream Rust=20
community to reduce the number of excluded tests over the coming months=20
but for now, it's just nice to see the test working again!

If you update these things convince yourself that the changes are=20
functionally identical, I don't think there's any need to re-do all the=20
testing that you have done.

Thanks Yash,

../Randy

>
> The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py          | 103 ++++++++-----
>   .../rust/files/target_cfg.patch               | 144 +++++++++++++++++=
+
>   meta/recipes-devtools/rust/rust-source.inc    |   1 +
>   3 files changed, 214 insertions(+), 34 deletions(-)
>   create mode 100644 meta/recipes-devtools/rust/files/target_cfg.patch
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> index 6dbc517006..216c73e5d1 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -40,7 +40,7 @@ def parse_results(filename):
>   class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTes=
tCase):
>       def test_rust(self, *args, **kwargs):
>           # Disable Rust Oe-selftest
> -        self.skipTest("The Rust Oe-selftest is disabled.")
> +        #self.skipTest("The Rust Oe-selftest is disabled.")
>  =20
>           # build remote-test-server before image build
>           recipe =3D "rust"
> @@ -73,38 +73,71 @@ class RustSelfTestSystemEmulated(OESelftestTestCase=
, OEPTestResultTestCase):
>                               'src/librustdoc',
>                               'src/rustdoc-json-types',
>                               'src/tools/compiletest/src/common.rs',
> +                            'src/tools/jsondoclint',
>                               'src/tools/lint-docs',
> +                            'src/tools/replace-version-placeholder',
>                               'src/tools/rust-analyzer',
>                               'src/tools/rustdoc-themes',
>                               'src/tools/tidy',
>                               'tests/assembly/asm/aarch64-outline-atomi=
cs.rs',
> +                            'tests/codegen/abi-efiapi.rs',
> +                            'tests/codegen/abi-efiapi.rs',
>                               'tests/codegen/abi-main-signature-32bit-c=
-int.rs',
>                               'tests/codegen/abi-repr-ext.rs',
> +                            'tests/codegen/abi-sysv64.rs',
>                               'tests/codegen/abi-x86-interrupt.rs',
> +                            'tests/codegen/align-byval.rs',
> +                            'tests/codegen/align-fn.rs',
> +                            'tests/codegen/asm-powerpc-clobbers.rs',
> +                            'tests/codegen/async-fn-debug-awaitee-fiel=
d.rs',
> +                            'tests/codegen/binary-search-index-no-boun=
d-check.rs',
>                               'tests/codegen/branch-protection.rs',
> +                            'tests/codegen/call-metadata.rs',
>                               'tests/codegen/catch-unwind.rs',
>                               'tests/codegen/cf-protection.rs',
> +                            'tests/codegen/debug-column.rs',
> +                            'tests/codegen/debug-limited.rs',
> +                            'tests/codegen/debuginfo-generic-closure-e=
nv-names.rs',
> +                            'tests/codegen/drop.rs',
> +                            'tests/codegen/dst-vtable-align-nonzero.rs=
',
> +                            'tests/codegen/enable-lto-unit-splitting.r=
s',
>                               'tests/codegen/enum-bounds-check-derived-=
idx.rs',
> +                            'tests/codegen/enum/enum-u128.rs',
> +                            'tests/codegen/fn-impl-trait-self.rs',
>                               'tests/codegen/force-unwind-tables.rs',
> +                            'tests/codegen/inherit_overflow.rs',
> +                            'tests/codegen/inherit_overflow.rs',
> +                            'tests/codegen/inline-function-args-debug-=
info.rs',
>                               'tests/codegen/intrinsic-no-unnamed-attr.=
rs',
> +                            'tests/codegen/intrinsics/mask.rs',
> +                            'tests/codegen/intrinsics/transmute-niched=
.rs',
>                               'tests/codegen/issues/issue-103840.rs',
>                               'tests/codegen/issues/issue-47278.rs',
> +                            'tests/codegen/issues/issue-73258.rs',
>                               'tests/codegen/issues/issue-73827-bounds-=
check-index-in-subexpr.rs',
> +                            'tests/codegen/issues/issue-75546.rs',
> +                            'tests/codegen/issues/issue-77812.rs',
> +                            'tests/codegen/issues/issue-98156-const-ar=
g-temp-lifetime.rs',
>                               'tests/codegen/lifetime_start_end.rs',
> +                            'tests/codegen/llvm-ident.rs',
>                               'tests/codegen/local-generics-in-exe-inte=
rnalized.rs',
> +                            'tests/codegen/mainsubprogram.rs',
>                               'tests/codegen/match-unoptimized.rs',
> +                            'tests/codegen/move-operands.rs',
>                               'tests/codegen/noalias-rwlockreadguard.rs=
',
>                               'tests/codegen/non-terminate/nonempty-inf=
inite-loop.rs',
>                               'tests/codegen/noreturn-uninhabited.rs',
>                               'tests/codegen/repr-transparent-aggregate=
s-3.rs',
> +                            'tests/codegen/repr/transparent-mips64.rs'
>                               'tests/codegen/sse42-implies-crc32.rs',
>                               'tests/codegen/thread-local.rs',
>                               'tests/codegen/uninit-consts.rs',
> +                            'tests/mir-opt/',
>                               'tests/pretty/raw-str-nonexpr.rs',
>                               'tests/run-make',
> +                            'tests/run-make-fulldeps',
>                               'tests/run-make/cdylib-fewer-symbols/foo.=
rs',
>                               'tests/run-make/doctests-keep-binaries/t.=
rs',
> -                            'tests/run-make-fulldeps',
>                               'tests/run-make/issue-22131/foo.rs',
>                               'tests/run-make/issue-36710/Makefile',
>                               'tests/run-make/issue-47551',
> @@ -119,6 +152,26 @@ class RustSelfTestSystemEmulated(OESelftestTestCas=
e, OEPTestResultTestCase):
>                               'tests/run-make/sysroot-crates-are-unstab=
le',
>                               'tests/run-make/target-specs',
>                               'tests/rustdoc',
> +                            'tests/rustdoc-js-std',
> +                            'tests/rustdoc-json',
> +                            'tests/rustdoc-ui/cfg-test.rs',
> +                            'tests/rustdoc-ui/check-cfg-test.rs',
> +                            'tests/rustdoc-ui/display-output.rs',
> +                            'tests/rustdoc-ui/doc-comment-multi-line-a=
ttr.rs',
> +                            'tests/rustdoc-ui/doc-comment-multi-line-c=
fg-attr.rs',
> +                            'tests/rustdoc-ui/doc-test-doctest-feature=
.rs',
> +                            'tests/rustdoc-ui/doc-test-rustdoc-feature=
.rs',
> +                            'tests/rustdoc-ui/doctest-multiline-crate-=
attribute.rs',
> +                            'tests/rustdoc-ui/doctest-output.rs',
> +                            'tests/rustdoc-ui/failed-doctest-compile-f=
ail.rs',
> +                            'tests/rustdoc-ui/issue-80992.rs',
> +                            'tests/rustdoc-ui/issue-91134.rs',
> +                            'tests/rustdoc-ui/no-run-flag.rs',
> +                            'tests/rustdoc-ui/nocapture-fail.rs',
> +                            'tests/rustdoc-ui/nocapture.rs',
> +                            'tests/rustdoc-ui/run-directory.rs',
> +                            'tests/rustdoc-ui/test-no_std.rs',
> +                            'tests/rustdoc-ui/test-type.rs',
>                               'tests/rustdoc/async-move-doctest.rs',
>                               'tests/rustdoc/async-trait.rs',
>                               'tests/rustdoc/auto-traits.rs',
> @@ -133,9 +186,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase=
, OEPTestResultTestCase):
>                               'tests/rustdoc/edition-doctest.rs',
>                               'tests/rustdoc/edition-flag.rs',
>                               'tests/rustdoc/elided-lifetime.rs',
> -                            'tests/rustdoc/external-macro-src.rs',
>                               'tests/rustdoc/extern-html-root-url.rs',
>                               'tests/rustdoc/extern-impl-trait.rs',
> +                            'tests/rustdoc/external-macro-src.rs',
>                               'tests/rustdoc/hide-unstable-trait.rs',
>                               'tests/rustdoc/inline_cross/add-docs.rs',
>                               'tests/rustdoc/inline_cross/default-trait=
-method.rs',
> @@ -184,12 +237,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCa=
se, OEPTestResultTestCase):
>                               'tests/rustdoc/issue-75588.rs',
>                               'tests/rustdoc/issue-85454.rs',
>                               'tests/rustdoc/issue-86620.rs',
> -                            'tests/rustdoc-json',
> -                            'tests/rustdoc-js-std',
>                               'tests/rustdoc/macro_pub_in_module.rs',
>                               'tests/rustdoc/masked.rs',
> -                            'tests/rustdoc/normalize-assoc-item.rs',
>                               'tests/rustdoc/no-stack-overflow-25295.rs=
',
> +                            'tests/rustdoc/normalize-assoc-item.rs',
>                               'tests/rustdoc/primitive-reexport.rs',
>                               'tests/rustdoc/process-termination.rs',
>                               'tests/rustdoc/pub-extern-crate.rs',
> @@ -204,35 +255,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCas=
e, OEPTestResultTestCase):
>                               'tests/rustdoc/test_option_check/test.rs'=
,
>                               'tests/rustdoc/trait-alias-mention.rs',
>                               'tests/rustdoc/trait-visibility.rs',
> -                            'tests/rustdoc-ui/cfg-test.rs',
> -                            'tests/rustdoc-ui/check-cfg-test.rs',
> -                            'tests/rustdoc-ui/display-output.rs',
> -                            'tests/rustdoc-ui/doc-comment-multi-line-a=
ttr.rs',
> -                            'tests/rustdoc-ui/doc-comment-multi-line-c=
fg-attr.rs',
> -                            'tests/rustdoc-ui/doc-test-doctest-feature=
.rs',
> -                            'tests/rustdoc-ui/doctest-multiline-crate-=
attribute.rs',
> -                            'tests/rustdoc-ui/doctest-output.rs',
> -                            'tests/rustdoc-ui/doc-test-rustdoc-feature=
.rs',
> -                            'tests/rustdoc-ui/failed-doctest-compile-f=
ail.rs',
> -                            'tests/rustdoc-ui/issue-80992.rs',
> -                            'tests/rustdoc-ui/issue-91134.rs',
> -                            'tests/rustdoc-ui/nocapture-fail.rs',
> -                            'tests/rustdoc-ui/nocapture.rs',
> -                            'tests/rustdoc-ui/no-run-flag.rs',
> -                            'tests/rustdoc-ui/run-directory.rs',
> -                            'tests/rustdoc-ui/test-no_std.rs',
> -                            'tests/rustdoc-ui/test-type.rs',
>                               'tests/rustdoc/unit-return.rs',
> -                            'tests/ui/abi/stack-probes-lto.rs',
> -                            'tests/ui/abi/stack-probes.rs',
> -                            'tests/ui/array-slice-vec/subslice-pattern=
s-const-eval-match.rs',
> -                            'tests/ui/asm/x86_64/sym.rs',
> -                            'tests/ui/associated-type-bounds/fn-apit.r=
s',
> -                            'tests/ui/associated-type-bounds/fn-dyn-ap=
it.rs',
> -                            'tests/ui/associated-type-bounds/fn-wrap-a=
pit.rs',
> -                            'tests/ui/debuginfo/debuginfo-emit-llvm-ir=
-and-split-debuginfo.rs',
> -                            'tests/ui/drop/dynamic-drop.rs',
> -                            'tests/ui/empty_global_asm.rs',
> +                            'tests/ui-fulldeps/',
>                               'tests/ui-fulldeps/deriving-encodable-dec=
odable-box.rs',
>                               'tests/ui-fulldeps/deriving-encodable-dec=
odable-cell-refcell.rs',
>                               'tests/ui-fulldeps/deriving-global.rs',
> @@ -255,9 +279,20 @@ class RustSelfTestSystemEmulated(OESelftestTestCas=
e, OEPTestResultTestCase):
>                               'tests/ui-fulldeps/regions-mock-tcx.rs',
>                               'tests/ui-fulldeps/rustc_encodable_hygien=
e.rs',
>                               'tests/ui-fulldeps/session-diagnostic/enf=
orce_slug_naming.rs',
> +                            'tests/ui/abi/stack-probes-lto.rs',
> +                            'tests/ui/abi/stack-probes.rs',
> +                            'tests/ui/array-slice-vec/subslice-pattern=
s-const-eval-match.rs',
> +                            'tests/ui/asm/x86_64/sym.rs',
> +                            'tests/ui/associated-type-bounds/fn-apit.r=
s',
> +                            'tests/ui/associated-type-bounds/fn-dyn-ap=
it.rs',
> +                            'tests/ui/associated-type-bounds/fn-wrap-a=
pit.rs',
> +                            'tests/ui/debuginfo/debuginfo-emit-llvm-ir=
-and-split-debuginfo.rs',
> +                            'tests/ui/drop/dynamic-drop.rs',
> +                            'tests/ui/empty_global_asm.rs',
>                               'tests/ui/functions-closures/fn-help-with=
-err.rs',
>                               'tests/ui/linkage-attr/issue-10755.rs',
>                               'tests/ui/macros/restricted-shadowing-leg=
acy.rs',
> +                            'tests/ui/numbers-arithmetic/u128.rs',
>                               'tests/ui/process/nofile-limit.rs',
>                               'tests/ui/process/process-panic-after-for=
k.rs',
>                               'tests/ui/process/process-sigpipe.rs',
> diff --git a/meta/recipes-devtools/rust/files/target_cfg.patch b/meta/r=
ecipes-devtools/rust/files/target_cfg.patch
> new file mode 100644
> index 0000000000..b6a80e004f
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/target_cfg.patch
> @@ -0,0 +1,144 @@
> +rust: Fix various failures for Rust Oe-selftest
> +
> +* Ensure cargo executable is fetched
> +
> +* Fix the incorrect target on stage1 ui-fulldeps tests
> +
> +* Enable RUSTC_BOOTSTRAP on panic=3Dabort mir-opt test
> +
> +* Detect user-specified custom targets in compiletest
> +
> +Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/1196=
19/commits]
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> +---
> +diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
> +--- a/src/bootstrap/bootstrap.py
> ++++ b/src/bootstrap/bootstrap.py
> +@@ -954,9 +954,11 @@
> +         if deny_warnings:
> +             env["RUSTFLAGS"] +=3D " -Dwarnings"
> +
> +-        env["PATH"] =3D os.path.join(self.bin_root(), "bin") + \
> +-            os.pathsep + env["PATH"]
> +-        if not os.path.isfile(self.cargo()):
> ++        cargo_bin_path =3D os.path.join(self.bin_root(), "bin", "carg=
o")
> ++        if not os.path.isfile(cargo_bin_path):
> ++            cargo_bin_path =3D os.getenv("RUST_TARGET_PATH") + "rust-=
snapshot/bin/cargo"
> ++            env["PATH"] =3D os.path.dirname(cargo_bin_path) + os.path=
sep + env["PATH"]
> ++        else:
> +             raise Exception("no cargo executable found at `{}`".forma=
t(
> +                 self.cargo()))
> +         args =3D [self.cargo(), "build", "--manifest-path",
> +diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
> +--- a/src/bootstrap/test.rs
> ++++ b/src/bootstrap/test.rs
> +@@ -1489,8 +1489,12 @@
> +         // NOTE: Only stage 1 is special cased because we need the ru=
stc_private artifacts to match the
> +         // running compiler in stage 2 when plugins run.
> +         let stage_id =3D if suite =3D=3D "ui-fulldeps" && compiler.st=
age =3D=3D 1 {
> +-            compiler =3D builder.compiler(compiler.stage - 1, target)=
;
> +-            format!("stage{}-{}", compiler.stage + 1, target)
> ++            // At stage 0 (stage - 1) we are using the beta compiler.=
 Using `self.target` can lead finding
> ++            // an incorrect compiler path on cross-targets, as the st=
age 0 beta compiler is always equal
> ++            // to `build.build` in the configuration.
> ++            let build =3D builder.build.build;
> ++            compiler =3D builder.compiler(compiler.stage - 1, build);
> ++            format!("stage{}-{}", compiler.stage + 1, build)
> +         } else {
> +             format!("stage{}-{}", compiler.stage, target)
> +         };
> +diff --git a/src/bootstrap/synthetic_targets.rs b/ src/bootstrap/synth=
etic_targets.rs
> +index d2c65b740da..45baf56f46b 100644
> +--- a/src/bootstrap/synthetic_targets.rs
> ++++ b/src/bootstrap/synthetic_targets.rs
> +@@ -59,6 +59,7 @@ fn create_synthetic_target(
> +     let mut cmd =3D Command::new(builder.rustc(compiler));
> +     cmd.arg("--target").arg(base.rustc_target_arg());
> +     cmd.args(["-Zunstable-options", "--print", "target-spec-json"]);
> ++    cmd.env("RUSTC_BOOTSTRAP", "1");
> +     cmd.stdout(Stdio::piped());
> +
> +     let output =3D cmd.spawn().unwrap().wait_with_output().unwrap();
> +diff --git a/src/tools/compiletest/src/common.rs b/src/tools/compilete=
st/src/common.rs
> +index e85f6319936..c45c0b3c652 100644
> +--- a/src/tools/compiletest/src/common.rs
> ++++ b/src/tools/compiletest/src/common.rs
> +@@ -479,6 +479,7 @@ fn new(config: &Config) -> TargetCfgs {
> +         let mut targets: HashMap<String, TargetCfg> =3D serde_json::f=
rom_str(&rustc_output(
> +             config,
> +             &["--print=3Dall-target-specs-json", "-Zunstable-options"=
],
> ++            Default::default(),
> +         ))
> +         .unwrap();
> +
> +@@ -491,16 +492,33 @@ fn new(config: &Config) -> TargetCfgs {
> +         let mut all_families =3D HashSet::new();
> +         let mut all_pointer_widths =3D HashSet::new();
> +
> +-        // Handle custom target specs, which are not included in `--p=
rint=3Dall-target-specs-json`.
> +-        if config.target.ends_with(".json") {
> +-            targets.insert(
> +-                config.target.clone(),
> +-                serde_json::from_str(&rustc_output(
> +-                    config,
> +-                    &["--print=3Dtarget-spec-json", "-Zunstable-optio=
ns", "--target", &config.target],
> +-                ))
> +-                .unwrap(),
> +-            );
> ++        // If current target is not included in the `--print=3Dall-ta=
rget-specs-json` output,
> ++        // we check whether it is a custom target from the user or a =
synthetic target from bootstrap.
> ++        if !targets.contains_key(&config.target) {
> ++            let mut envs: HashMap<String, String> =3D HashMap::new();
> ++
> ++            if let Ok(t) =3D std::env::var("RUST_TARGET_PATH") {
> ++                envs.insert("RUST_TARGET_PATH".into(), t);
> ++            }
> ++
> ++            // This returns false only when the target is neither a s=
ynthetic target
> ++            // nor a custom target from the user, indicating it is mo=
st likely invalid.
> ++            if config.target.ends_with(".json") || !envs.is_empty() {
> ++                targets.insert(
> ++                    config.target.clone(),
> ++                    serde_json::from_str(&rustc_output(
> ++                        config,
> ++                        &[
> ++                            "--print=3Dtarget-spec-json",
> ++                            "-Zunstable-options",
> ++                            "--target",
> ++                            &config.target,
> ++                        ],
> ++                        envs,
> ++                    ))
> ++                    .unwrap(),
> ++                );
> ++            }
> +         }
> +
> +         for (target, cfg) in targets.iter() {
> +@@ -545,7 +563,9 @@ fn get_current_target_config(
> +         // code below extracts them from `--print=3Dcfg`: make sure t=
o only override fields that can
> +         // actually be changed with `-C` flags.
> +         for config in
> +-            rustc_output(config, &["--print=3Dcfg", "--target", &conf=
ig.target]).trim().lines()
> ++            rustc_output(config, &["--print=3Dcfg", "--target", &conf=
ig.target], Default::default())
> ++                .trim()
> ++                .lines()
> +         {
> +             let (name, value) =3D config
> +                 .split_once("=3D\"")
> +@@ -624,11 +644,12 @@ pub enum Endian {
> +     Big,
> + }
> +
> +-fn rustc_output(config: &Config, args: &[&str]) -> String {
> ++fn rustc_output(config: &Config, args: &[&str], envs: HashMap<String,=
 String>) -> String {
> +     let mut command =3D Command::new(&config.rustc_path);
> +     add_dylib_path(&mut command, iter::once(&config.compile_lib_path)=
);
> +     command.args(&config.target_rustcflags).args(args);
> +     command.env("RUSTC_BOOTSTRAP", "1");
> ++    command.envs(envs);
> +
> +     let output =3D match command.output() {
> +         Ok(output) =3D> output,
> +
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> index 83a0dbc15f..d9a370ac2f 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -10,6 +10,7 @@ SRC_URI +=3D"https://static.rust-lang.org/dist/rustc-=
${RUST_VERSION}-src.tar.xz;n=20
> file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=3D${RUST=
SRC}=20
> \=20
> file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D=
${RUSTSRC}=20
> \=20
> file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;=
patchdir=3D${RUSTSRC}=20
> \ + file://target_cfg.patch;patchdir=3D${RUSTSRC} \ "
>   SRC_URI[rust.sha256sum] =3D "b98c09d968529212fb29eec7d6d3e9bdaa869810=
679b7fb86a1ca69469d75f5e"
>  =20


--=20
# Randy MacLeod
# Wind River Linux

--------------Q0ClMEisOJ9YffKOA62g0vSn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40IBB8cL018586

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-01-18 5:57 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@wi=
ndriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240118105723.904877-1-Yash.Sh=
inde@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Yash Shinde <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yas=
h.Shinde@windriver.com&gt;</a>

Enable rust oe-selftest for rust 1.74.1 version and
add target_cfg.patch to handle target configurations
for custom targets.</pre>
    </blockquote>
    <p>Hi Yashe,<br>
    </p>
    <p>Yay, getting the rust test suite working again great news!</p>
    <p>We talked about this in today's YP bug review and decided NOT to
      merge this <br>
      until after the M2 build is taken care of over the next few days.<b=
r>
    </p>
    <p>That gives me a chance to review the commit and ask some
      questions! ;-)</p>
    <p>First, your commit log should be expanded to explain what has
      changed at a high level<br>
      to someone who is just reading &quot;git log&quot;.</p>
    <p>What you have is a good start but I'd like more info on what
      changed in:&nbsp; <br>
      <span style=3D"white-space: pre-wrap">   meta/lib/oeqa/selftest/cas=
es/rust.py</span></p>
    <p><span style=3D"white-space: pre-wrap">There are lots of tests adde=
d to the exclude list and some seem to have just moved.</span></p>
    <p><span style=3D"white-space: pre-wrap">Please explain why you did t=
his and if there is any way to avoid the &quot;noise&quot; of moved
tests in future updates.  Could you also report on the number of newly di=
sabled tests
and try to summarize in the commit log what these tests are doing and=20
</span></p>
    <p><span style=3D"white-space: pre-wrap">Ah, I see what you have done=
:
  1. sort the exclude list
  2. add the newly excluded tests.

Please do that in separate commits so that it's easier to understand.
This will reduce the size of the &quot;Enable rust oe-selftest&quot; diff=
 for=20
</span><span style=3D"white-space: pre-wrap">
meta/lib/oeqa/selftest/cases/rust.py
</span><span style=3D"white-space: pre-wrap">   from:          | 103 ++++=
++++-----
</span><span style=3D"white-space: pre-wrap">   to:            |  37 +++-=
</span></p>
    <p>a<span style=3D"white-space: pre-wrap">nd let people easily see th=
at most of the newly excluded tests are in tests/codegen .</span></p>
    <p><span style=3D"white-space: pre-wrap">That reminds me, do we reall=
y need to list directories in that exclude list or
only list .rs files?</span></p>
    <p><span style=3D"white-space: pre-wrap">If I save the list to /tmp/j=
j, you can see that we could reduce the list by 34 lines:</span></p>
    <p><span style=3D"white-space: pre-wrap">
=E2=9D=AF rg  &quot;\.rs&quot; /tmp/jj  | wc -l
203

=E2=9D=AF rg  -v &quot;\.rs&quot; /tmp/jj  | wc -l
34
</span></p>
    <p><span style=3D"white-space: pre-wrap">If we can do that, again do =
it as a separate commit since it should not affect the outcome
of the test.</span></p>
    <p><br>
    </p>
    <p>Also this backport link:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://git=
hub.com/rust-lang/rust/pull/119619/commits">https://github.com/rust-lang/=
rust/pull/119619/commits</a><br>
      is actually 3 separate commits so it might be better to apply
      those individually<br>
      so that we can know when they can be dropped by running:<br>
      $ git tag --contains &lt;commit-id&gt; on each commit<br>
    </p>
    <p>Also in the patches, please add you Signed-Off-By line but keep
      the upstream author's S-O-B line.<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><span style=3D"white-space: pre-wrap">For anyone interested we did=
 talk about the number of Rust tests that we are
excluding and of course our goal is to work with the upstream Rust commun=
ity
to reduce the number of excluded tests over the coming months but for now=
,
it's just nice to see the test working again!</span></p>
    <p><span style=3D"white-space: pre-wrap">If you update these things c=
onvince yourself that the changes are functionally=20
identical, I don't think there's any need to re-do all the testing that y=
ou have done.
</span></p>
    <p><span style=3D"white-space: pre-wrap">Thanks Yash,</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">../Randy
</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:20240118105723.904877-1-Yash.Sh=
inde@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py          | 103 ++++++++-----
 .../rust/files/target_cfg.patch               | 144 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 3 files changed, 214 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/target_cfg.patch

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index 6dbc517006..216c73e5d1 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,7 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCa=
se):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
+        #self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
=20
         # build remote-test-server before image build
         recipe =3D &quot;rust&quot;
@@ -73,38 +73,71 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/compiletest/src/common.rs',
+                            'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
                             'src/tools/tidy',
                             'tests/assembly/asm/aarch64-outline-atomics.=
rs',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-in=
t.rs',
                             'tests/codegen/abi-repr-ext.rs',
+                            'tests/codegen/abi-sysv64.rs',
                             'tests/codegen/abi-x86-interrupt.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.=
rs',
+                            'tests/codegen/binary-search-index-no-bound-=
check.rs',
                             'tests/codegen/branch-protection.rs',
+                            'tests/codegen/call-metadata.rs',
                             'tests/codegen/catch-unwind.rs',
                             'tests/codegen/cf-protection.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/debuginfo-generic-closure-env=
-names.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs'=
,
                             'tests/codegen/enum-bounds-check-derived-idx=
.rs',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
                             'tests/codegen/force-unwind-tables.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-in=
fo.rs',
                             'tests/codegen/intrinsic-no-unnamed-attr.rs'=
,
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.r=
s',
                             'tests/codegen/issues/issue-103840.rs',
                             'tests/codegen/issues/issue-47278.rs',
+                            'tests/codegen/issues/issue-73258.rs',
                             'tests/codegen/issues/issue-73827-bounds-che=
ck-index-in-subexpr.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-=
temp-lifetime.rs',
                             'tests/codegen/lifetime_start_end.rs',
+                            'tests/codegen/llvm-ident.rs',
                             'tests/codegen/local-generics-in-exe-interna=
lized.rs',
+                            'tests/codegen/mainsubprogram.rs',
                             'tests/codegen/match-unoptimized.rs',
+                            'tests/codegen/move-operands.rs',
                             'tests/codegen/noalias-rwlockreadguard.rs',
                             'tests/codegen/non-terminate/nonempty-infini=
te-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3=
.rs',
+                            'tests/codegen/repr/transparent-mips64.rs'
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
+                            'tests/run-make-fulldeps',
                             'tests/run-make/cdylib-fewer-symbols/foo.rs'=
,
                             'tests/run-make/doctests-keep-binaries/t.rs'=
,
-                            'tests/run-make-fulldeps',
                             'tests/run-make/issue-22131/foo.rs',
                             'tests/run-make/issue-36710/Makefile',
                             'tests/run-make/issue-47551',
@@ -119,6 +152,26 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
                             'tests/run-make/sysroot-crates-are-unstable'=
,
                             'tests/run-make/target-specs',
                             'tests/rustdoc',
+                            'tests/rustdoc-js-std',
+                            'tests/rustdoc-json',
+                            'tests/rustdoc-ui/cfg-test.rs',
+                            'tests/rustdoc-ui/check-cfg-test.rs',
+                            'tests/rustdoc-ui/display-output.rs',
+                            'tests/rustdoc-ui/doc-comment-multi-line-att=
r.rs',
+                            'tests/rustdoc-ui/doc-comment-multi-line-cfg=
-attr.rs',
+                            'tests/rustdoc-ui/doc-test-doctest-feature.r=
s',
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.r=
s',
+                            'tests/rustdoc-ui/doctest-multiline-crate-at=
tribute.rs',
+                            'tests/rustdoc-ui/doctest-output.rs',
+                            'tests/rustdoc-ui/failed-doctest-compile-fai=
l.rs',
+                            'tests/rustdoc-ui/issue-80992.rs',
+                            'tests/rustdoc-ui/issue-91134.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
+                            'tests/rustdoc-ui/nocapture-fail.rs',
+                            'tests/rustdoc-ui/nocapture.rs',
+                            'tests/rustdoc-ui/run-directory.rs',
+                            'tests/rustdoc-ui/test-no_std.rs',
+                            'tests/rustdoc-ui/test-type.rs',
                             'tests/rustdoc/async-move-doctest.rs',
                             'tests/rustdoc/async-trait.rs',
                             'tests/rustdoc/auto-traits.rs',
@@ -133,9 +186,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
                             'tests/rustdoc/edition-doctest.rs',
                             'tests/rustdoc/edition-flag.rs',
                             'tests/rustdoc/elided-lifetime.rs',
-                            'tests/rustdoc/external-macro-src.rs',
                             'tests/rustdoc/extern-html-root-url.rs',
                             'tests/rustdoc/extern-impl-trait.rs',
+                            'tests/rustdoc/external-macro-src.rs',
                             'tests/rustdoc/hide-unstable-trait.rs',
                             'tests/rustdoc/inline_cross/add-docs.rs',
                             'tests/rustdoc/inline_cross/default-trait-me=
thod.rs',
@@ -184,12 +237,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase=
, OEPTestResultTestCase):
                             'tests/rustdoc/issue-75588.rs',
                             'tests/rustdoc/issue-85454.rs',
                             'tests/rustdoc/issue-86620.rs',
-                            'tests/rustdoc-json',
-                            'tests/rustdoc-js-std',
                             'tests/rustdoc/macro_pub_in_module.rs',
                             'tests/rustdoc/masked.rs',
-                            'tests/rustdoc/normalize-assoc-item.rs',
                             'tests/rustdoc/no-stack-overflow-25295.rs',
+                            'tests/rustdoc/normalize-assoc-item.rs',
                             'tests/rustdoc/primitive-reexport.rs',
                             'tests/rustdoc/process-termination.rs',
                             'tests/rustdoc/pub-extern-crate.rs',
@@ -204,35 +255,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
                             'tests/rustdoc/test_option_check/test.rs',
                             'tests/rustdoc/trait-alias-mention.rs',
                             'tests/rustdoc/trait-visibility.rs',
-                            'tests/rustdoc-ui/cfg-test.rs',
-                            'tests/rustdoc-ui/check-cfg-test.rs',
-                            'tests/rustdoc-ui/display-output.rs',
-                            'tests/rustdoc-ui/doc-comment-multi-line-att=
r.rs',
-                            'tests/rustdoc-ui/doc-comment-multi-line-cfg=
-attr.rs',
-                            'tests/rustdoc-ui/doc-test-doctest-feature.r=
s',
-                            'tests/rustdoc-ui/doctest-multiline-crate-at=
tribute.rs',
-                            'tests/rustdoc-ui/doctest-output.rs',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.r=
s',
-                            'tests/rustdoc-ui/failed-doctest-compile-fai=
l.rs',
-                            'tests/rustdoc-ui/issue-80992.rs',
-                            'tests/rustdoc-ui/issue-91134.rs',
-                            'tests/rustdoc-ui/nocapture-fail.rs',
-                            'tests/rustdoc-ui/nocapture.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
-                            'tests/rustdoc-ui/run-directory.rs',
-                            'tests/rustdoc-ui/test-no_std.rs',
-                            'tests/rustdoc-ui/test-type.rs',
                             'tests/rustdoc/unit-return.rs',
-                            'tests/ui/abi/stack-probes-lto.rs',
-                            'tests/ui/abi/stack-probes.rs',
-                            'tests/ui/array-slice-vec/subslice-patterns-=
const-eval-match.rs',
-                            'tests/ui/asm/x86_64/sym.rs',
-                            'tests/ui/associated-type-bounds/fn-apit.rs'=
,
-                            'tests/ui/associated-type-bounds/fn-dyn-apit=
.rs',
-                            'tests/ui/associated-type-bounds/fn-wrap-api=
t.rs',
-                            'tests/ui/debuginfo/debuginfo-emit-llvm-ir-a=
nd-split-debuginfo.rs',
-                            'tests/ui/drop/dynamic-drop.rs',
-                            'tests/ui/empty_global_asm.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui-fulldeps/deriving-encodable-decoda=
ble-box.rs',
                             'tests/ui-fulldeps/deriving-encodable-decoda=
ble-cell-refcell.rs',
                             'tests/ui-fulldeps/deriving-global.rs',
@@ -255,9 +279,20 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
                             'tests/ui-fulldeps/regions-mock-tcx.rs',
                             'tests/ui-fulldeps/rustc_encodable_hygiene.r=
s',
                             'tests/ui-fulldeps/session-diagnostic/enforc=
e_slug_naming.rs',
+                            'tests/ui/abi/stack-probes-lto.rs',
+                            'tests/ui/abi/stack-probes.rs',
+                            'tests/ui/array-slice-vec/subslice-patterns-=
const-eval-match.rs',
+                            'tests/ui/asm/x86_64/sym.rs',
+                            'tests/ui/associated-type-bounds/fn-apit.rs'=
,
+                            'tests/ui/associated-type-bounds/fn-dyn-apit=
.rs',
+                            'tests/ui/associated-type-bounds/fn-wrap-api=
t.rs',
+                            'tests/ui/debuginfo/debuginfo-emit-llvm-ir-a=
nd-split-debuginfo.rs',
+                            'tests/ui/drop/dynamic-drop.rs',
+                            'tests/ui/empty_global_asm.rs',
                             'tests/ui/functions-closures/fn-help-with-er=
r.rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy=
.rs',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.r=
s',
                             'tests/ui/process/process-sigpipe.rs',
diff --git a/meta/recipes-devtools/rust/files/target_cfg.patch b/meta/rec=
ipes-devtools/rust/files/target_cfg.patch
new file mode 100644
index 0000000000..b6a80e004f
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target_cfg.patch
@@ -0,0 +1,144 @@
+rust: Fix various failures for Rust Oe-selftest
+
+* Ensure cargo executable is fetched
+
+* Fix the incorrect target on stage1 ui-fulldeps tests
+
+* Enable RUSTC_BOOTSTRAP on panic=3Dabort mir-opt test
+
+* Detect user-specified custom targets in compiletest
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/rust-lang/rust/pull/119619/commits">https://github.com/r=
ust-lang/rust/pull/119619/commits</a>]
+
+Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+---
+diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
+--- a/src/bootstrap/bootstrap.py
++++ b/src/bootstrap/bootstrap.py
+@@ -954,9 +954,11 @@
+         if deny_warnings:
+             env[&quot;RUSTFLAGS&quot;] +=3D &quot; -Dwarnings&quot;
+
+-        env[&quot;PATH&quot;] =3D os.path.join(self.bin_root(), &quot;b=
in&quot;) + \
+-            os.pathsep + env[&quot;PATH&quot;]
+-        if not os.path.isfile(self.cargo()):
++        cargo_bin_path =3D os.path.join(self.bin_root(), &quot;bin&quot=
;, &quot;cargo&quot;)
++        if not os.path.isfile(cargo_bin_path):
++            cargo_bin_path =3D os.getenv(&quot;RUST_TARGET_PATH&quot;) =
+ &quot;rust-snapshot/bin/cargo&quot;
++            env[&quot;PATH&quot;] =3D os.path.dirname(cargo_bin_path) +=
 os.pathsep + env[&quot;PATH&quot;]
++        else:
+             raise Exception(&quot;no cargo executable found at `{}`&quo=
t;.format(
+                 self.cargo()))
+         args =3D [self.cargo(), &quot;build&quot;, &quot;--manifest-pat=
h&quot;,
+diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
+--- a/src/bootstrap/test.rs
++++ b/src/bootstrap/test.rs
+@@ -1489,8 +1489,12 @@
+         // NOTE: Only stage 1 is special cased because we need the rust=
c_private artifacts to match the
+         // running compiler in stage 2 when plugins run.
+         let stage_id =3D if suite =3D=3D &quot;ui-fulldeps&quot; &amp;&=
amp; compiler.stage =3D=3D 1 {
+-            compiler =3D builder.compiler(compiler.stage - 1, target);
+-            format!(&quot;stage{}-{}&quot;, compiler.stage + 1, target)
++            // At stage 0 (stage - 1) we are using the beta compiler. U=
sing `self.target` can lead finding
++            // an incorrect compiler path on cross-targets, as the stag=
e 0 beta compiler is always equal
++            // to `build.build` in the configuration.
++            let build =3D builder.build.build;
++            compiler =3D builder.compiler(compiler.stage - 1, build);
++            format!(&quot;stage{}-{}&quot;, compiler.stage + 1, build)
+         } else {
+             format!(&quot;stage{}-{}&quot;, compiler.stage, target)
+         };
+diff --git a/src/bootstrap/synthetic_targets.rs b/ src/bootstrap/synthet=
ic_targets.rs
+index d2c65b740da..45baf56f46b 100644
+--- a/src/bootstrap/synthetic_targets.rs
++++ b/src/bootstrap/synthetic_targets.rs
+@@ -59,6 +59,7 @@ fn create_synthetic_target(
+     let mut cmd =3D Command::new(builder.rustc(compiler));
+     cmd.arg(&quot;--target&quot;).arg(base.rustc_target_arg());
+     cmd.args([&quot;-Zunstable-options&quot;, &quot;--print&quot;, &quo=
t;target-spec-json&quot;]);
++    cmd.env(&quot;RUSTC_BOOTSTRAP&quot;, &quot;1&quot;);
+     cmd.stdout(Stdio::piped());
+
+     let output =3D cmd.spawn().unwrap().wait_with_output().unwrap();
+diff --git a/src/tools/compiletest/src/common.rs b/src/tools/compiletest=
/src/common.rs
+index e85f6319936..c45c0b3c652 100644
+--- a/src/tools/compiletest/src/common.rs
++++ b/src/tools/compiletest/src/common.rs
+@@ -479,6 +479,7 @@ fn new(config: &amp;Config) -&gt; TargetCfgs {
+         let mut targets: HashMap&lt;String, TargetCfg&gt; =3D serde_jso=
n::from_str(&amp;rustc_output(
+             config,
+             &amp;[&quot;--print=3Dall-target-specs-json&quot;, &quot;-Z=
unstable-options&quot;],
++            Default::default(),
+         ))
+         .unwrap();
+
+@@ -491,16 +492,33 @@ fn new(config: &amp;Config) -&gt; TargetCfgs {
+         let mut all_families =3D HashSet::new();
+         let mut all_pointer_widths =3D HashSet::new();
+
+-        // Handle custom target specs, which are not included in `--pri=
nt=3Dall-target-specs-json`.
+-        if config.target.ends_with(&quot;.json&quot;) {
+-            targets.insert(
+-                config.target.clone(),
+-                serde_json::from_str(&amp;rustc_output(
+-                    config,
+-                    &amp;[&quot;--print=3Dtarget-spec-json&quot;, &quot=
;-Zunstable-options&quot;, &quot;--target&quot;, &amp;config.target],
+-                ))
+-                .unwrap(),
+-            );
++        // If current target is not included in the `--print=3Dall-targ=
et-specs-json` output,
++        // we check whether it is a custom target from the user or a sy=
nthetic target from bootstrap.
++        if !targets.contains_key(&amp;config.target) {
++            let mut envs: HashMap&lt;String, String&gt; =3D HashMap::ne=
w();
++
++            if let Ok(t) =3D std::env::var(&quot;RUST_TARGET_PATH&quot;=
) {
++                envs.insert(&quot;RUST_TARGET_PATH&quot;.into(), t);
++            }
++
++            // This returns false only when the target is neither a syn=
thetic target
++            // nor a custom target from the user, indicating it is most=
 likely invalid.
++            if config.target.ends_with(&quot;.json&quot;) || !envs.is_e=
mpty() {
++                targets.insert(
++                    config.target.clone(),
++                    serde_json::from_str(&amp;rustc_output(
++                        config,
++                        &amp;[
++                            &quot;--print=3Dtarget-spec-json&quot;,
++                            &quot;-Zunstable-options&quot;,
++                            &quot;--target&quot;,
++                            &amp;config.target,
++                        ],
++                        envs,
++                    ))
++                    .unwrap(),
++                );
++            }
+         }
+
+         for (target, cfg) in targets.iter() {
+@@ -545,7 +563,9 @@ fn get_current_target_config(
+         // code below extracts them from `--print=3Dcfg`: make sure to =
only override fields that can
+         // actually be changed with `-C` flags.
+         for config in
+-            rustc_output(config, &amp;[&quot;--print=3Dcfg&quot;, &quot=
;--target&quot;, &amp;config.target]).trim().lines()
++            rustc_output(config, &amp;[&quot;--print=3Dcfg&quot;, &quot=
;--target&quot;, &amp;config.target], Default::default())
++                .trim()
++                .lines()
+         {
+             let (name, value) =3D config
+                 .split_once(&quot;=3D\&quot;&quot;)
+@@ -624,11 +644,12 @@ pub enum Endian {
+     Big,
+ }
+
+-fn rustc_output(config: &amp;Config, args: &amp;[&amp;str]) -&gt; Strin=
g {
++fn rustc_output(config: &amp;Config, args: &amp;[&amp;str], envs: HashM=
ap&lt;String, String&gt;) -&gt; String {
+     let mut command =3D Command::new(&amp;config.rustc_path);
+     add_dylib_path(&amp;mut command, iter::once(&amp;config.compile_lib=
_path));
+     command.args(&amp;config.target_rustcflags).args(args);
+     command.env(&quot;RUSTC_BOOTSTRAP&quot;, &quot;1&quot;);
++    command.envs(envs);
+
+     let output =3D match command.output() {
+         Ok(output) =3D&gt; output,
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index 83a0dbc15f..d9a370ac2f 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile=
://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=3D${RUSTSRC}\f=
ile://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D${=
RUSTSRC}\file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat=
.patch;patchdir=3D${RUSTSRC}\+file://target_cfg.patch;patchdir=3D${RUSTSR=
C}\">&quot;https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.ta=
r.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchd=
ir=3D${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch=
;patchdir=3D${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-r=
elat.patch;patchdir=3D${RUSTSRC} \
+            file://target_cfg.patch;patchdir=3D${RUSTSRC} \
 &quot;</a>
 SRC_URI[rust.sha256sum] =3D &quot;b98c09d968529212fb29eec7d6d3e9bdaa8698=
10679b7fb86a1ca69469d75f5e&quot;
=20
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Q0ClMEisOJ9YffKOA62g0vSn--

