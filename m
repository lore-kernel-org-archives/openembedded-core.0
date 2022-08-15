Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F42C25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 00:35:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.11220.1660523754990759392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 17:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jGNpF9ac;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5226248fcf=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27F0Vraj022061
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 00:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HzOZMz/fLB+XTdbWfrEh/ZagKxIogBlcoToMNkbXAPA=;
 b=jGNpF9ac7lwMyUSOzoAUFD7c1z1biJBlki1gvmEZyKEaEXkx20aksUxghXbZX/4+mkDM
 yqAd4bXB97WJxUO6pFPpr5n4YSQUoFO2E7Ye1BAqD4n/6PPGYpB6FzPt0D6ERW5pNPuU
 NR+Wz4UPPNyETxaEqETHx3wHI1b+rH/6NdkJ6cGal9Eg2uPlRXyHPawmzkjBQFsQT68s
 xQaoFWAkkTuoG8aQSR2nJ6jsG2TVKHiwrG5MmUnlXiG64UXTOGgEXLHd7UTKRCQO0mZ0
 04HJ9XTe0RYBIKlqMIK1vQocr23wqhJuLUEy+v0r4ksOUGCCiOSTQhXbPAeo3Nwu9kPs +A==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8h7sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 00:35:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxMYHJKVMKeZ+WrHINkMWML+Y62eTIQ9teJTINE99kEm/bdkCwtqCmkNuAGkdtXou4rYJnpiU2PIYsO5BYBI7wbWp5paPDDDpcNt+XQ+l78TrDBgAky7Jvblhw2FWYrvyzSebfmc/eHUTlfOCyS48OYMlULUdBn1eYzkysvskkVz+bn8cwBTPHjuKErSb3+SRxOWuptF725QUlv1bMysGUy6uXyE3FRO2BAftdVOhDfA6vlTuYbeJvuHukXKlVjyiCaf9ci/WqnLGcBI2uYuIdLQRsOcIFeq3XvvtT0E+B3bFuoq2NHO1eQxVWn4/r3yf3WEOe07PFuzbuqzctmuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzOZMz/fLB+XTdbWfrEh/ZagKxIogBlcoToMNkbXAPA=;
 b=boZU0dSYhEHNVssePPy9U+s2Pp95EowIUsydQqR60Dyee831BSYnAHDUWayvFiCeEwEDMxV633SK912K0HLBEYuuLIM58bD70sxmGu2Yj+L8QEBABaHqimNnSw1W2TBwRPSGrdZ1gsezr0HTmJJSrvpbEzyYXlBV56I1fLFySr/U/wFT/H3tab+AwS3ErTgNltau9tUmSsXbbne2/o3q0/foWwNUg/N40jdX9P/jOweRsW9UQlhg0itPqPntAx014f26y2bgNHsEtU+HWh2qbp00gWs4KeaDHoxkCuhWGN9j2EG1Czd2mNbSIguPWjB5uqDIcHKsQHmo2a4Wd70SUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY5PR11MB6485.namprd11.prod.outlook.com (2603:10b6:930:33::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 00:35:50 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 00:35:50 +0000
Message-ID: <8ca96140-85dd-341f-c615-16be619bfea0@windriver.com>
Date: Sun, 14 Aug 2022 20:35:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] rust: update from 1.62.1 to 1.63.0
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <170B5D557FC1DE54.3142@lists.openembedded.org>
In-Reply-To: <170B5D557FC1DE54.3142@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fed72708-8c84-4496-d299-08da7e561a3c
X-MS-TrafficTypeDiagnostic: CY5PR11MB6485:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0OAMSpB8Udq7etMyouQyg/9supeIEloxSaqdtRqGzcTPwAE9JZ58SUgB93VT6NGb/FTJRi1AvWuOOf9KXQ/rtVAcjQuRwj/+zgg0gHItfENAzOLQF3VAA210t0Or8NtNlErP9r7n09QLMR458u1l4MbP1wzpRHbEZeFvS+NdINmYRR8Ako5el9sEAZG9PJSW78jm83WzmlCnqDbnvnYJGYKmPPWV6tby5bTEol8yulYIcE198CQIj+5eJ/G1rK65aqoX73f0vOlE+JrTwA7PFsKPf7dLY5TEf7jtbgSBP5XolkmU+3dhofp0hO+RKzt8a1ekpziz/BNIoawGGSgUKJGDb6qXk/fuI3mNZ5g2aPoDdWMv7P13MH3gd9X4BUt4iOe4P4Z1Kv7u7if9Y2b0y6XQEbBgwWU363G015ZNDZtYqEgsw/P/mtfanzo2UNCXuLF9nGh68tKk16uInS+S3Hs3NoeNG6+yBaTNkYKHcuHAgB/aGJ9EGzcdNEXEiJPW1W7gvYP6ml36q4OoUzsLx3ZfQM37m7XULwZRx6ZkFvEg9y0+n+IqYevkJPtpqlZ4U5EaF63TaecQGOrRDcQpelLkv+EptLiKHCWg9FUBg7OpajRKlrvFdjd8P++NI6qbvVgAS5xQ28ufxTw/MMUg8Y0EYbAKKAsJeBMOxY/XEHN+opiS4FAN7QlgjIB0Syc1ByI4avt262/ErwOlksv95+h8baiU4xZRQErmMBOR43PbuecsGoZV/hYKcu0OYEckawqFpafwUgpr78RNLbhwJmupm+0fBjYmFrnjISDGXU31p+XE9wHqnJnoT833vpemL626DVf6WvLfhWuefjVRkwl5qtDO0bY/1+NMOMa2iMnLRF6kwpDyBMiQKYa2qihWxGvur47JClEXkRfXXTKkd9Pi8DHmivlzyh/zpiEsNnbYrfVEYcq7VaNIpoSyLeOA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39840400004)(376002)(346002)(136003)(366004)(8936002)(5660300002)(38100700002)(38350700002)(66946007)(66476007)(66556008)(8676002)(36756003)(31686004)(83380400001)(2616005)(186003)(478600001)(53546011)(52116002)(6506007)(6666004)(6512007)(26005)(15650500001)(31696002)(86362001)(2906002)(41300700001)(316002)(966005)(6486002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU54eXM3ZGxMYmQ2R053Yi9jVmU3YzJjVmpqTmVIamZqNVg5SzlNMlJFeXZt?=
 =?utf-8?B?SXo3MWowcVplVGFFTlZkbWJSaU1pblQrRUtsaFRzNGNzKzB6eXZTckZJSGI2?=
 =?utf-8?B?SW5YRThkSWQ2YUZQNk5UVmd1dGtsTFhRMTdPMmNNSGdHK0dFU2VPT2d3alQ2?=
 =?utf-8?B?Ujk2STJOWXM2bGI4S2RXOEthd09Ha0JTSi9zODBJdVluWXJBazRNajJSVG5D?=
 =?utf-8?B?RXZ2bjA2RzdUQ0NwNXNuWHltem0vOVZSZlhhK2VnNmlKVGthejNvNUhQWFpR?=
 =?utf-8?B?dnc5Tm5IQ2NPMFE1VHFtVERCNllwVm5ZajdLNGZ0T2c2NFFlZGZ3VHA0UXo2?=
 =?utf-8?B?eTdsUDBhc3p2Qkk0OVJjSlkra1NOWThaOHlnTzYvNlJFSkc4a0xlcGJKeW9w?=
 =?utf-8?B?c1M2c1lrR3ZGbUFmZjlVOTR3Sm4yczJYWCtpcU1KcGZrRmtBcFRWYyswaXh0?=
 =?utf-8?B?YlpxeVJNMjBKczZQQTNtd0dDVHVVYnRxbWV4c3ZaOHUrV0xXMUY5V0dXQVVS?=
 =?utf-8?B?WXVDRlJQQldVNTlHTk8zVFNxNFJDWHRmYzF2LzlSU1Q5OXhyd3BXWkpaYXQ2?=
 =?utf-8?B?Z1kzU0NkRDFoOFJiNktQa3UwZ0FReitFdTE4cjgrQ3J3VVRWMFdZM3hMVnpj?=
 =?utf-8?B?OEY5dDFJdm1QaDBKeitlM0szQTZTcHlVUUxIRDBQaWV3Mk5UTDkwREFnUm5p?=
 =?utf-8?B?MFNNM0dGYlhpQnF2REpZbjBUVFRnQkUrV1pKOHRmS09zakMxWElTb01PMVJL?=
 =?utf-8?B?TjdLVlVBcXRoMzNWdG9FWENLN0t0VG5vc1JjaGF1OEJsRUhtM1FqcG56VHFH?=
 =?utf-8?B?VnUxNHNVcDBlZ0l1akpEZkJ0aVc1dmhycWwvdy9ZbkJVS1UvUm1ScTVFZDhw?=
 =?utf-8?B?YTVoU1BSQ2IvL0tWTVg1N3ZSODRlMDY5VnptaUtCekpWZzZKQjFGYlh4dUMx?=
 =?utf-8?B?VUdKczBlT09VOEE5Z3Y0VHcvTCtic0NRelNCQ1lySS9wVHdxMUVlNVpQNCtr?=
 =?utf-8?B?ODQrM2NWbTlaMEZDSUhuSVJ5dHBOUEVYeWJJazJhRmg2bVdPeXBkcGJrNDZV?=
 =?utf-8?B?TDJ6Zi9abjJWOWQ4RzRFOExrOEFpUjFBeUhWYUswZHc0UGZWQVRNMFFnSFcr?=
 =?utf-8?B?OHZEa1VYYTlHRnhyaUhXUVZRbnhESHU0NlBVTmNudHBKZDFjOGUzd2p3OGhB?=
 =?utf-8?B?YTcwUGpuU2VEalFKcHRCL2NCaXcvY0duNDJJSmprejIxa0xKMUl4ckMrZWxr?=
 =?utf-8?B?S3I4MkxQdFJHaGVJSlY4Tmp2WE92UVlFWUR2ZktrcDB5dUdXdUYxb3g3Q1pl?=
 =?utf-8?B?QU9HL2VWWkpTcHA5dmM1dkIxSzdnZXBDOTZkbFNRUHgzcnBpNVJVSm1nRWZu?=
 =?utf-8?B?STRoOTdSNnlWS2RjcU9hOTNQMzJQV3ppWEZBWmswMFpsZFdNQllVeUNnZCtW?=
 =?utf-8?B?RDBHc3BiRnhiUUJNODFIeU9raVNVbS9WSVcyenFiYStHOW9jTjhzc0ZIOEJR?=
 =?utf-8?B?bVptOXVWMk9qT2ZiSlJUd210cEVzdW1WRkNyNG4vSzRyWEl0SUNnUWdOcGlQ?=
 =?utf-8?B?ZjZRQzVYN0hUVDRvNVM0VFd5THo1Q3k4SFd6U293TVFNd05icUViNlExRlpl?=
 =?utf-8?B?Um0veElaYjdGVzNIYkUyNjl5SHkxb3JkS2RLNUtRUDhUd3hma0Y1SUQrOTlp?=
 =?utf-8?B?MjRKMHl4aWIzemdyYmFERVlVWXorcEtIVUZJaU1yL0Z6RmJrVWhYeHFCcTQw?=
 =?utf-8?B?QWNoY0V0YXZXeWpzOVhTUktBQmpOSVJGeWFCTGZYd2cxZWxoTHcybSs5cVZN?=
 =?utf-8?B?VUkvMXJ0TldKMnhGL2NXVC9nam1DSWpWRXZTc1oyNSsyVzkzZWZ5SjhZNWg3?=
 =?utf-8?B?K1RXRnVqWStlbnUxWEtYdG9TTU1TZXcwVlUzQVpVSFZqWmwxcWZGVkZnUUFQ?=
 =?utf-8?B?Qys0cEFUNXk2VmIvY3Y2UXRBWGVHMWRaMU9CZiszdWl4WHVvWDE5WS8yWEdz?=
 =?utf-8?B?UE00L1F3Sk5mRno4UXZubmNaVDk5TDNhOWxRMU1ZTFVabVBaZ1VHVkZGc0Z4?=
 =?utf-8?B?SHJFT3Q4aTk0ZlIwcVFPQXMyekNjTHZQY01xbGM2R1pGNVJ3dWs0Rldtd2c3?=
 =?utf-8?B?eUtReUJZbGxnZ203RnBURXV2T0tyamVOV1paWkt3RzgzblgvR1VQL0UrQ3d4?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fed72708-8c84-4496-d299-08da7e561a3c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 00:35:50.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FWXKqVUQWyll4FZWINNI0FbxhHe9dIl76YpcxYeBFcrhNEBihJd9fT1bckX/cUGznR0zf94RXvHTCb4tMpOJ9I7neAazg0sY48lI2lKitQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6485
X-Proofpoint-ORIG-GUID: 8ifsAyHD_1O_BYUpghkVbVv8cAdzedb7
X-Proofpoint-GUID: 8ifsAyHD_1O_BYUpghkVbVv8cAdzedb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-14_15,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=926 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208150000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 00:35:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169340

On 2022-08-14 20:31, Randy MacLeod wrote:
> Release notes:
>     https://blog.rust-lang.org/2022/08/11/Rust-1.63.0.html
>
> This is a standard upgrade aside from the path for the
> stage2 tools binaries (clippy, et.al.) changing.


I didn't check what the build status was before but
so far I have:

BUILDALL-QEMU LOG FOR rust
START TIME: 2022-08-14_13:30:45
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.6 LTS
HOST KERNEL: 5.4.0-122-generic
===============
BUILD RESULTS:
[glibc]
FAIL: qemuriscv32
PASS: qemuarmv5
FAIL: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
...

It's still running.

I'll send the complete output tomorrow.


../Randy

> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc   |  2 +-
>   .../{cargo_1.62.1.bb => cargo_1.63.0.bb}      |  0
>   ...ibstd-rs_1.62.1.bb => libstd-rs_1.63.0.bb} |  0
>   ....62.1.bb => rust-cross-canadian_1.63.0.bb} |  0
>   ...ust-llvm_1.62.1.bb => rust-llvm_1.63.0.bb} |  0
>   meta/recipes-devtools/rust/rust-snapshot.inc  | 24 +++++++++----------
>   meta/recipes-devtools/rust/rust-source.inc    |  2 +-
>   .../rust/{rust_1.62.1.bb => rust_1.63.0.bb}   |  4 ++--
>   8 files changed, 16 insertions(+), 16 deletions(-)
>   rename meta/recipes-devtools/cargo/{cargo_1.62.1.bb => cargo_1.63.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{libstd-rs_1.62.1.bb => libstd-rs_1.63.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.62.1.bb => rust-cross-canadian_1.63.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-llvm_1.62.1.bb => rust-llvm_1.63.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust_1.62.1.bb => rust_1.63.0.bb} (92%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 31c9dd5065..52d0f7a79f 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -27,7 +27,7 @@ GOVERSION ?= "1.19%"
>   # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>   # llvm version being used, so always bump it with llvm recipe version bump
>   LLVMVERSION ?= "14.0.6"
> -RUSTVERSION ?= "1.62%"
> +RUSTVERSION ?= "1.63%"
>   
>   PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>   PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/cargo/cargo_1.62.1.bb b/meta/recipes-devtools/cargo/cargo_1.63.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/cargo/cargo_1.62.1.bb
> rename to meta/recipes-devtools/cargo/cargo_1.63.0.bb
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.62.1.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-llvm_1.62.1.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
> index 3bd7b07cef..b9d7edd672 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -1,25 +1,25 @@
>   ## This is information on the rust-snapshot (binary) used to build our current release.
> -## snapshot info is taken from rust/src/stage0.txt
> +## snapshot info is taken from rust/src/stage0.json
>   ## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
>   ## The exact (previous) version that has been used is specified in the source tarball.
>   ## The version is replicated here.
>   ## TODO: find a way to add additional SRC_URIs based on the contents of an
>   ##       earlier SRC_URI.
> -RS_VERSION = "1.61.0"
> -CARGO_VERSION = "1.61.0"
> +RS_VERSION = "1.62.0"
> +CARGO_VERSION = "1.62.0"
>   
>   # TODO: Add hashes for other architecture toolchains as well. Make a script?
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "270b07aa5f2de52255a117e1e587138d77375ce0d09a1d7fead085f29b3977e9"
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] = "21c4613f389ed130fbaaf88f1e984319f72b5fc10734569a5ba19e22ebb03abd"
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] = "9461727d754f865ef2a87479d40bbe4c5176f80963b7c50b7797bc8940d7a0a0"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "addfae87b6b1b521d98a50fdc5120990888a51bb397100062e9c558267c67c77"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] = "e7f71f4ef09334ddc9ec8cbf2f958d654e36f580c95f8fec6d5c816ce256dbd6"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] = "815c63119a9cf0282ff240c6444b6f867238763ee3dea182f10837ae7dbbb1d4"
>   
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "57d60a519dbce12146849f7e72d55f3cffe9cdcbff8d58e90bb62d3c016bb5c0"
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] = "c996de6391e3ea94629fbc09b03bce186fcde345159f43ec95a82c500adb5e94"
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] = "a055e6cfd9b5f8938780db6179d2ef92990c714ce64278337d7edf3d29c8ab62"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "dd5df8a92af3e5d49a1122b9561821ebd72a9317884a37ecddae041e652a7563"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] = "0fa320a19d41dcfc592bc006f5e9eda8e3b972598a26c96ad64eedd868516df3"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] = "475038ecacca9ff586cad2082d5d950544b0d581a2a287facc7d899aae488813"
>   
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "36c0ccff14c80419507561db050f9533f0abd43fc50f3ddb859c10df74b1c351"
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "dc54893d747e4f3330515caa75e404f78c6c5475a1216d1428f5e7ce1c2e9602"
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "09817011ff1ef4b7006387c7cabb6a059731792a9372533dec7d87e7f014444b"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "d6678b7c971f3adbe7f820adae669d03a314468441e2907747c76eca98e0be92"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "b66d0bc6dbfdc0d4b826f787ec4e772dea8e3d2015cecbe2105632d468c28dcb"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "016257f1641693008068bd086fec66d68550d1778f6aea9d06c9b263fca392d5"
>   
>   SRC_URI += " \
>       https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index dbcef2cbc2..47bfbe98a7 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -1,5 +1,5 @@
>   SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
> -SRC_URI[rust.sha256sum] = "02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e"
> +SRC_URI[rust.sha256sum] = "8f44af6dc44cc4146634a4dd5e4cc5470b3052a2337019b870c0e025e8987e0c"
>   
>   SRC_URI:append:class-target:pn-rust = " file://hardcodepaths.patch"
>   SRC_URI:append:class-nativesdk:pn-nativesdk-rust = " file://hardcodepaths.patch"
> diff --git a/meta/recipes-devtools/rust/rust_1.62.1.bb b/meta/recipes-devtools/rust/rust_1.63.0.bb
> similarity index 92%
> rename from meta/recipes-devtools/rust/rust_1.62.1.bb
> rename to meta/recipes-devtools/rust/rust_1.63.0.bb
> index 81923c3331..3081cd5ef3 100644
> --- a/meta/recipes-devtools/rust/rust_1.62.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
> @@ -43,7 +43,7 @@ rust_do_install:class-nativesdk() {
>   
>       install -d ${D}${bindir}
>       for i in cargo-clippy clippy-driver rustfmt; do
> -        cp build/${RUST_BUILD_SYS}/stage2-tools-bin/$i ${D}${bindir}
> +        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
>           chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
>       done
>   
> @@ -60,7 +60,7 @@ rust_do_install:class-target() {
>   
>       install -d ${D}${bindir}
>       for i in cargo-clippy clippy-driver rustfmt; do
> -        cp build/${RUST_BUILD_SYS}/stage2-tools-bin/$i ${D}${bindir}
> +        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
>           chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
>       done
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169339): https://lists.openembedded.org/g/openembedded-core/message/169339
> Mute This Topic: https://lists.openembedded.org/mt/93027065/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


