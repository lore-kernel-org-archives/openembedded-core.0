Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03773C47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 15:08:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.24468.1705676911804739007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 07:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Orl3CEBo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JAatSg024404
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=49O3SZoVZShG6cI8DcE
	lU2Rt5NPiHu7izFOWiveulhA=; b=Orl3CEBokw4Tjou7tvW1E8DUMkj/jtUrG3W
	542YGx6rmnJmsfkpNGudnwBIDpzWYu9r8C6NFPFYEONbkaPoXvEtlEqNtHK1VoBs
	2VWRu7zAefUhvFBzgHNVoPkM/CM3pO9VoKIH4zQlLS2QbIndugmnZ5voEfQrJaX5
	6IwITcV3HgmQoJH1x01srLcNDs88yCpbQHoxT+H9ZasZW09cEjlCsYTG1ZEixjXL
	qFulOPkcP9pWoOJ3JVix72x15HosptUVYm+Sy5jgRg8zI9Le1ebF7OHT8m4tawH2
	JifpeilH2sRU+zRCcKdweOk/Se7RT5l6tHusgmD+xPTdY44fr7A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxf5y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:08:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6Sx73eiBP08/YsyKtmHdLNUlvtmmoigr8EfKgKNdc5t6BHCp2Xa06hnrgKWaFrfES/fzUTMGmMz+/AMond0VIkPOEbDvWNfmhZ3FhV/HS5P844C04xLqAIwOsa12JK4eBL/ib69Kct1OimeCHBe6dlKqHYEWUHfrTJsSRBcrcsAqDnWHhwhgd/pz0P29hipTh3Lu4srae2j1BjpN1/KhZxhkY2FT+IbxjCjO9tgdESzjW2v0uu6lOeD8ctS8gCILxDCBxeRhx5T9hvsZ0LNbZW9s8vPqrAqkKyVzqmTSAeggOGevGmGnsu/ce/Ionc8F+ygUSJFKfrSCQZ3nnEHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49O3SZoVZShG6cI8DcElU2Rt5NPiHu7izFOWiveulhA=;
 b=bUdt42XJki2bdUZh5gxdtKUKcbXi4yrynrMtSzXLEesB/a2i7FaxR3Jeg3bEbs8Xs2in3NoQUSyQAQQMFBYsSoqf/PYVL8048EkTXpyoApVbOUuicCTuiOfZhxJFu7PHD34nKFvy5uFHCGD6eyhALllljwVOPuUnqor7Z8RbNhTrXFmBZ7fZDtFx8HnIbiL8hmoI8x59D4HZX7av6SXC+EtMca8B3oTFw0XmWELYeD6Zx7HvZ+Ik4QGpfhHolnHHhz2M5RBOP94ZVZt02KOyghf7jSeLKeEWWo5eb7gMh1Luo+YDOBv8E2kF+7Hf1uqawlXZJEWC1hsKu1iv3ISTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 15:08:27 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:08:26 +0000
Content-Type: multipart/alternative;
 boundary="------------JbSL00NnDb8scupnl0N1Rk11"
Message-ID: <32be4bdb-1838-483a-a56e-8c9f85421bba@windriver.com>
Date: Fri, 19 Jan 2024 20:38:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Rust oe-selftest enabled.
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
References: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
 <20240119134352.3163178-5-Yash.Shinde@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <20240119134352.3163178-5-Yash.Shinde@windriver.com>
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: ad280540-e7a5-4dca-88b6-08dc19007c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WQi5sKZzqhImQPyEwvG99Als5V1r9+qk5w5I/pjZA8EcWrbSlYY3zi/pLOJzGHH/1G7Vqesx1EYtWv+RYfnDtsIO280gRzrH8k+YhdYtAjJ2oSSfLpzQ95BwGke3Z8/yha8ilKD99uJAlmNRAXPyZKe9ytYn5R/12xbGrLrmqw+Yg1mBEwciP2j97Viz0DEvqOxQsNduBgEUBfYCXwv/Ztig2Uu4xZhZImnevItsCh10VACaU2Ha7ltw2mS7n31+CqhZpLfr5iGOObnVhgedy+lqrZgn1Z8goiqU2YqbYuZoP2oM5tuisOG4KeJB++RPHjqSVep9xiD823Ter0SdMFLdUnER6IkN2dsFmzE0rp1cVh4kXirT5bdMginvH1y/M1x4X7N2ghqlFmOjv4OsNexBB5sFi0/NncmFl8P60FpOYrmmDPpjjsPqOyLoMCeHKgGTOGL8nj2Y7QsIKqUkdzLDO7MZiXGdTn+M25o5F/Tr9zOy8av9onyd8loRRdKL8gILfZsQMkiOfBxESHCdnWhMg/0XmD1YtWuH5xWjzZQlmN0RaMqz6ucZEYw/aOjO6MLIKqkfq7MUsusGHuMks3mJkODhkkxjbJyJIgje5q679t3EZK8aloXceNV7NtQYh1HCskxVyOy+DdpJTo+y3zsHsw7CStw3WfWks2+nVGELep6pqpVfvmcDdrVhPG9F
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(39850400004)(136003)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(31686004)(966005)(6486002)(83380400001)(41300700001)(478600001)(166002)(38100700002)(26005)(6666004)(6512007)(33964004)(53546011)(6506007)(86362001)(316002)(30864003)(2906002)(6916009)(4326008)(36756003)(8936002)(8676002)(31696002)(66946007)(66556008)(66476007)(5660300002)(107886003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjZPR0NTdVpBOGtkNlUyUFlzdDNCTWNVaVNXT1g5TGVxdVV5amNSTld5UWR3?=
 =?utf-8?B?SUFBRjVKTTBhUGFIbUlHZVJSVDFxVkxZSTJmdHRUR2w2SjkvR3ZXK1Q3ejVM?=
 =?utf-8?B?UytDSW5aU0c5R20wOEMwRzNwaEpmaUF5QzNHMXZPQzlkL3Bsc0RaNkJYejgr?=
 =?utf-8?B?MmxjdXNGVkIwbEYrVEpQL1hDakNOTXJUTVRPRmdPVitMYkdVak1GSi9TYUdu?=
 =?utf-8?B?QlExd2pobDAwWEs5eTFaM3lLUldVRUZiNUVkUG1obTJIcVlLV0pPQWg5RVFl?=
 =?utf-8?B?MzVMN3BsMzVzUjE4OXpwUVNGbjU4WEtVc1Y4cGs3WG1GZjIzZDNvQWNuV3d5?=
 =?utf-8?B?STBsNHlrMVB2TDEyV0Vvc2RHRjNlOFFMcE0zVWpBcXlRN2dwUkJEd0xWL3Fw?=
 =?utf-8?B?WGNPOUtVSWt4Qi8veWNwbmx5RWR0RUt0L1hhak55VUtVSkVZZjdXbkEzRjgw?=
 =?utf-8?B?OE9BTmpIL3FUcmFVSXJTRTVvWTEwUlpHNytMYzYzZzZ5ZjNkVnZPV3BBaWk5?=
 =?utf-8?B?ajNqV0gwcUVwdy9RcXRFWXlGdEVZMTUwUmd2MElCL3VRSVVaVTFSTERkYS9H?=
 =?utf-8?B?U0xJUisybXhGd0NNYnN1NGpVTWdJR215MUJZbFUzTDkrK2hvbUFRODNTUFYv?=
 =?utf-8?B?azlrL3MrbTBHcmJIV21GK2pzbndaUE1LcDVCNEd2N2J3bG5aZUxOMGJCUkRa?=
 =?utf-8?B?eFo5eTZkOWQ1UTBjZHI3ZXpyRlJ0MG85Wm1CK0J2dC9EeVVtbm81NWJGVEVo?=
 =?utf-8?B?T3VpSy9vVmVuRGJlTmsrS0FDVU5tQWJWa05nb3hCYTE0aVVGT3J6R3RyMmFk?=
 =?utf-8?B?cmgrMDhiZGxkektwL2p4ZHFEK1FqclNXc2k0SVhqamV0MzZjWGZpbGUzL0l4?=
 =?utf-8?B?UXFsYmhHNUZwNGJBc3N3S1hnL3BDVHppZzZTYmEzWFJIN2s0ZzNwZ09SOEd3?=
 =?utf-8?B?RWt6bHBYTXY5MXBOblpZcEJlMUZZTFRmYzBKKzFwK0crY1pCYVc4SGFSRWpz?=
 =?utf-8?B?Wks3blpETllLNWVNcjdyU2k1SE5JQ0JIYVBIZU01d0tzUkxJdTBiSncrTllr?=
 =?utf-8?B?OHdXQm1tWlJHcVVVZVhEYThQcjYrTUVLa2g2ZWZXMDAwTE8wR05UUmxBdEtQ?=
 =?utf-8?B?a25VY2c3K0hwN3psQk8vKzRrcVNGQ2t5MGRvV3FmQVlVSkVDaUFub094ZlVJ?=
 =?utf-8?B?ZXRmdlBUNUZIazlXY0oweE1iZStlMmRNSWhUTEJhYk5KZGxEN2pPQ2xnT3F6?=
 =?utf-8?B?MzhrSExyOVJmWmVnWW4zUURBcVE5cXMzRU5UaENjVDdKWS9GenJhbHk5UnI4?=
 =?utf-8?B?MmZzUUd6bVQvdUZyekROVUxIaTNZQXNyM0FTV29vUFV4NFZWVFgyNWJGcGZx?=
 =?utf-8?B?Z2Y4VjhVM2haL2xvbDdXQmVIOVFzTjJFOUYzNmFKS29qajVMVmJlZUgrMTE4?=
 =?utf-8?B?cFZzdkwyZlUzOFRUZDZxV2l3NTdpRlFuS20yMmtLRkJRSU9QM1hFak1SdVFx?=
 =?utf-8?B?S3RzTWVlVHI5Z0tLNVNjcCt1Rjh1K25tUDcvUCs5dXdKRVg4YXVWT2tKVGZ4?=
 =?utf-8?B?SE4vaGRMdk9pVDFJYUwzYURSTXI1NTg2STVMR1Z0NVRLcVJpUjlyRjhXYkIw?=
 =?utf-8?B?eWdRVXJESnl3MmQzbVNpSWR4V0dPWFFxOWVQNDBkY05NbzdMYnhkaC8vMXRF?=
 =?utf-8?B?MlVnbkdTZmlBd0VDMGFRdGd5Q0dBVFBjRUpUM0ViQVczK1lpN2RFb3dCcXFL?=
 =?utf-8?B?NUlRbXRSSGY3c3dOQnV2YlFvOExPVVVVcFdweFZoWExYTzkvMlAwUnI4dG55?=
 =?utf-8?B?TjFyT1NIZ3Bad0JiZkR5ZFI2OTYrcHlLYWN5M2c5SlZmWGUrWDYvQytoQ2U4?=
 =?utf-8?B?cDRtSmRUT3RPMlFwSDFnWXNRK25sdW1vMVMwakJQTDkrbE41Q3pxay9OQTN6?=
 =?utf-8?B?TGNqaVBPcGVzQjk4aVRncnFyQmI3aG41a3M1VjF6bjQyU3d6V0NwZldwckNG?=
 =?utf-8?B?N2dSSHVYYXhGWWZmTTRmVmovVFI3ZDJtcENNaXd5TXU3N2ozZTEydUs5MUt5?=
 =?utf-8?B?STRXaHJ2Q3RZdzBxNFExRjhhUkw2MFdKWm5DQW9iYjhtcmh0enVkMURidjZY?=
 =?utf-8?B?OEgrNmpONVNpMk1HK0tsUVVlak82c3lGSit0Y3RMSWZHUWFjZ1ZJekp5SWRN?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad280540-e7a5-4dca-88b6-08dc19007c65
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:08:26.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNM6RkQg098CD210YczhKOGy4JZjz3221r6iF6efI+iZXX6mLPyPJ1wcS85qCmyC2/c7VLU0A7NoQnPmyng27o0XG9JoGkHrXvQ5I7/RLoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
X-Proofpoint-GUID: q1t3tXa8L7D2_NjdxDAehJXAMVZt-PwZ
X-Proofpoint-ORIG-GUID: q1t3tXa8L7D2_NjdxDAehJXAMVZt-PwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194052

--------------JbSL00NnDb8scupnl0N1Rk11
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this series as it contains wrong commit shortlog 
format(https://lists.openembedded.org/g/openembedded-core/message/194050). 
I will a send v2.

Regards,
Yash.

On 19-01-2024 19:13, Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Tests which are failing from below modules are added to exclude list
> 	tests/run-make
> 	tests/rustdoc
> 	tests/mir-opt
> 	tests/ui-fulldeps
>
> * Redundent test cases whose parent dir is also present in  exclud list are removed.
>
> * Newly addded tests are sorted and updated.
>
> * Overall exclude tests count in exclude list is now reduced to 114.
>
> * The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py       | 165 +++++----------------
>   meta/recipes-devtools/rust/rust-source.inc |   4 +
>   2 files changed, 43 insertions(+), 126 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> index 6dbc517006..7d0efb1b01 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -40,7 +40,7 @@ def parse_results(filename):
>   class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>       def test_rust(self, *args, **kwargs):
>           # Disable Rust Oe-selftest
> -        self.skipTest("The Rust Oe-selftest is disabled.")
> +        #self.skipTest("The Rust Oe-selftest is disabled.")
>   
>           # build remote-test-server before image build
>           recipe = "rust"
> @@ -73,156 +73,90 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>                               'src/librustdoc',
>                               'src/rustdoc-json-types',
>                               'src/tools/compiletest/src/common.rs',
> +                            'src/tools/jsondoclint',
>                               'src/tools/lint-docs',
> +                            'src/tools/replace-version-placeholder',
>                               'src/tools/rust-analyzer',
>                               'src/tools/rustdoc-themes',
>                               'src/tools/tidy',
>                               'tests/assembly/asm/aarch64-outline-atomics.rs',
> +                            'tests/codegen/abi-efiapi.rs',
> +                            'tests/codegen/abi-efiapi.rs',
>                               'tests/codegen/abi-main-signature-32bit-c-int.rs',
>                               'tests/codegen/abi-repr-ext.rs',
> +                            'tests/codegen/abi-sysv64.rs',
>                               'tests/codegen/abi-x86-interrupt.rs',
> +                            'tests/codegen/align-byval.rs',
> +                            'tests/codegen/align-fn.rs',
> +                            'tests/codegen/asm-powerpc-clobbers.rs',
> +                            'tests/codegen/async-fn-debug-awaitee-field.rs',
> +                            'tests/codegen/binary-search-index-no-bound-check.rs',
>                               'tests/codegen/branch-protection.rs',
> +                            'tests/codegen/call-metadata.rs',
>                               'tests/codegen/catch-unwind.rs',
>                               'tests/codegen/cf-protection.rs',
> +                            'tests/codegen/debug-column.rs',
> +                            'tests/codegen/debug-limited.rs',
> +                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
> +                            'tests/codegen/drop.rs',
> +                            'tests/codegen/dst-vtable-align-nonzero.rs',
> +                            'tests/codegen/enable-lto-unit-splitting.rs',
>                               'tests/codegen/enum-bounds-check-derived-idx.rs',
> +                            'tests/codegen/enum/enum-u128.rs',
> +                            'tests/codegen/fn-impl-trait-self.rs',
>                               'tests/codegen/force-unwind-tables.rs',
> +                            'tests/codegen/inherit_overflow.rs',
> +                            'tests/codegen/inherit_overflow.rs',
> +                            'tests/codegen/inline-function-args-debug-info.rs',
>                               'tests/codegen/intrinsic-no-unnamed-attr.rs',
> +                            'tests/codegen/intrinsics/mask.rs',
> +                            'tests/codegen/intrinsics/transmute-niched.rs',
>                               'tests/codegen/issues/issue-103840.rs',
>                               'tests/codegen/issues/issue-47278.rs',
> +                            'tests/codegen/issues/issue-73258.rs',
>                               'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs',
> +                            'tests/codegen/issues/issue-75546.rs',
> +                            'tests/codegen/issues/issue-77812.rs',
> +                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
>                               'tests/codegen/lifetime_start_end.rs',
> +                            'tests/codegen/llvm-ident.rs',
>                               'tests/codegen/local-generics-in-exe-internalized.rs',
> +                            'tests/codegen/mainsubprogram.rs',
>                               'tests/codegen/match-unoptimized.rs',
> +                            'tests/codegen/move-operands.rs',
>                               'tests/codegen/noalias-rwlockreadguard.rs',
>                               'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
>                               'tests/codegen/noreturn-uninhabited.rs',
>                               'tests/codegen/repr-transparent-aggregates-3.rs',
> +                            'tests/codegen/repr/transparent-mips64.rs',
>                               'tests/codegen/sse42-implies-crc32.rs',
>                               'tests/codegen/thread-local.rs',
>                               'tests/codegen/uninit-consts.rs',
> +                            'tests/mir-opt/',
>                               'tests/pretty/raw-str-nonexpr.rs',
>                               'tests/run-make',
> -                            'tests/run-make/cdylib-fewer-symbols/foo.rs',
> -                            'tests/run-make/doctests-keep-binaries/t.rs',
> -                            'tests/run-make-fulldeps',
> -                            'tests/run-make/issue-22131/foo.rs',
> -                            'tests/run-make/issue-36710/Makefile',
> -                            'tests/run-make/issue-47551',
> -                            'tests/run-make/pgo-branch-weights',
> -                            'tests/run-make/pgo-gen',
> -                            'tests/run-make/pgo-gen-lto',
> -                            'tests/run-make/pgo-indirect-call-promotion',
> -                            'tests/run-make/pgo-use',
> -                            'tests/run-make/pointer-auth-link-with-c/Makefile',
> -                            'tests/run-make/profile',
> -                            'tests/run-make/static-pie',
> -                            'tests/run-make/sysroot-crates-are-unstable',
> -                            'tests/run-make/target-specs',
>                               'tests/rustdoc',
> -                            'tests/rustdoc/async-move-doctest.rs',
> -                            'tests/rustdoc/async-trait.rs',
> -                            'tests/rustdoc/auto-traits.rs',
> -                            'tests/rustdoc/check-source-code-urls-to-def.rs',
> -                            'tests/rustdoc/comment-in-doctest.rs',
> -                            'tests/rustdoc/const-generics/const-generics-docs.rs',
> -                            'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',
> -                            'tests/rustdoc/cross-crate-hidden-impl-parameter.rs',
> -                            'tests/rustdoc/cross-crate-links.rs',
> -                            'tests/rustdoc/cross-crate-primitive-doc.rs',
> -                            'tests/rustdoc/doctest-manual-crate-name.rs',
> -                            'tests/rustdoc/edition-doctest.rs',
> -                            'tests/rustdoc/edition-flag.rs',
> -                            'tests/rustdoc/elided-lifetime.rs',
> -                            'tests/rustdoc/external-macro-src.rs',
> -                            'tests/rustdoc/extern-html-root-url.rs',
> -                            'tests/rustdoc/extern-impl-trait.rs',
> -                            'tests/rustdoc/hide-unstable-trait.rs',
> -                            'tests/rustdoc/inline_cross/add-docs.rs',
> -                            'tests/rustdoc/inline_cross/default-trait-method.rs',
> -                            'tests/rustdoc/inline_cross/dyn_trait.rs',
> -                            'tests/rustdoc/inline_cross/impl_trait.rs',
> -                            'tests/rustdoc/inline_cross/issue-24183.rs',
> -                            'tests/rustdoc/inline_cross/macros.rs',
> -                            'tests/rustdoc/inline_cross/trait-vis.rs',
> -                            'tests/rustdoc/inline_cross/use_crate.rs',
> -                            'tests/rustdoc/intra-doc-crate/self.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/basic.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/crate.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/hidden.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/macro.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/module.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/submodule-outer.rs',
> -                            'tests/rustdoc/intra-doc/cross-crate/traits.rs',
> -                            'tests/rustdoc/intra-doc/extern-builtin-type-impl.rs',
> -                            'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',
> -                            'tests/rustdoc/intra-doc/extern-crate.rs',
> -                            'tests/rustdoc/intra-doc/extern-inherent-impl.rs',
> -                            'tests/rustdoc/intra-doc/extern-reference-link.rs',
> -                            'tests/rustdoc/intra-doc/issue-103463.rs',
> -                            'tests/rustdoc/intra-doc/issue-104145.rs',
> -                            'tests/rustdoc/intra-doc/issue-66159.rs',
> -                            'tests/rustdoc/intra-doc/pub-use.rs',
> -                            'tests/rustdoc/intra-doc/reexport-additional-docs.rs',
> -                            'tests/rustdoc/issue-18199.rs',
> -                            'tests/rustdoc/issue-23106.rs',
> -                            'tests/rustdoc/issue-23744.rs',
> -                            'tests/rustdoc/issue-25944.rs',
> -                            'tests/rustdoc/issue-30252.rs',
> -                            'tests/rustdoc/issue-38129.rs',
> -                            'tests/rustdoc/issue-40936.rs',
> -                            'tests/rustdoc/issue-43153.rs',
> -                            'tests/rustdoc/issue-46727.rs',
> -                            'tests/rustdoc/issue-48377.rs',
> -                            'tests/rustdoc/issue-48414.rs',
> -                            'tests/rustdoc/issue-53689.rs',
> -                            'tests/rustdoc/issue-54478-demo-allocator.rs',
> -                            'tests/rustdoc/issue-57180.rs',
> -                            'tests/rustdoc/issue-61592.rs',
> -                            'tests/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs',
> -                            'tests/rustdoc/issue-75588.rs',
> -                            'tests/rustdoc/issue-85454.rs',
> -                            'tests/rustdoc/issue-86620.rs',
> -                            'tests/rustdoc-json',
>                               'tests/rustdoc-js-std',
> -                            'tests/rustdoc/macro_pub_in_module.rs',
> -                            'tests/rustdoc/masked.rs',
> -                            'tests/rustdoc/normalize-assoc-item.rs',
> -                            'tests/rustdoc/no-stack-overflow-25295.rs',
> -                            'tests/rustdoc/primitive-reexport.rs',
> -                            'tests/rustdoc/process-termination.rs',
> -                            'tests/rustdoc/pub-extern-crate.rs',
> -                            'tests/rustdoc/pub-use-extern-macros.rs',
> -                            'tests/rustdoc/reexport-check.rs',
> -                            'tests/rustdoc/reexport-dep-foreign-fn.rs',
> -                            'tests/rustdoc/reexport-doc.rs',
> -                            'tests/rustdoc/reexports-priv.rs',
> -                            'tests/rustdoc/reexports.rs',
> -                            'tests/rustdoc/rustc,-incoherent-impls.rs',
> -                            'tests/rustdoc/test_option_check/bar.rs',
> -                            'tests/rustdoc/test_option_check/test.rs',
> -                            'tests/rustdoc/trait-alias-mention.rs',
> -                            'tests/rustdoc/trait-visibility.rs',
> +                            'tests/rustdoc-json',
>                               'tests/rustdoc-ui/cfg-test.rs',
>                               'tests/rustdoc-ui/check-cfg-test.rs',
>                               'tests/rustdoc-ui/display-output.rs',
>                               'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',
>                               'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',
>                               'tests/rustdoc-ui/doc-test-doctest-feature.rs',
> +                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
>                               'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',
>                               'tests/rustdoc-ui/doctest-output.rs',
> -                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
>                               'tests/rustdoc-ui/failed-doctest-compile-fail.rs',
>                               'tests/rustdoc-ui/issue-80992.rs',
>                               'tests/rustdoc-ui/issue-91134.rs',
> +                            'tests/rustdoc-ui/no-run-flag.rs',
>                               'tests/rustdoc-ui/nocapture-fail.rs',
>                               'tests/rustdoc-ui/nocapture.rs',
> -                            'tests/rustdoc-ui/no-run-flag.rs',
>                               'tests/rustdoc-ui/run-directory.rs',
>                               'tests/rustdoc-ui/test-no_std.rs',
>                               'tests/rustdoc-ui/test-type.rs',
> -                            'tests/rustdoc/unit-return.rs',
> +                            'tests/ui-fulldeps/',
>                               'tests/ui/abi/stack-probes-lto.rs',
>                               'tests/ui/abi/stack-probes.rs',
>                               'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
> @@ -233,31 +167,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>                               'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
>                               'tests/ui/drop/dynamic-drop.rs',
>                               'tests/ui/empty_global_asm.rs',
> -                            'tests/ui-fulldeps/deriving-encodable-decodable-box.rs',
> -                            'tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs',
> -                            'tests/ui-fulldeps/deriving-global.rs',
> -                            'tests/ui-fulldeps/deriving-hygiene.rs',
> -                            'tests/ui-fulldeps/dropck_tarena_sound_drop.rs',
> -                            'tests/ui-fulldeps/empty-struct-braces-derive.rs',
> -                            'tests/ui-fulldeps/internal-lints/bad_opt_access.rs',
> -                            'tests/ui-fulldeps/internal-lints/bad_opt_access.stderr',
> -                            'tests/ui-fulldeps/internal-lints/default_hash_types.rs',
> -                            'tests/ui-fulldeps/internal-lints/diagnostics.rs',
> -                            'tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs',
> -                            'tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs',
> -                            'tests/ui-fulldeps/internal-lints/query_stability.rs',
> -                            'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',
> -                            'tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs',
> -                            'tests/ui-fulldeps/issue-14021.rs',
> -                            'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',
> -                            'tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs',
> -                            'tests/ui-fulldeps/lint-pass-macros.rs',
> -                            'tests/ui-fulldeps/regions-mock-tcx.rs',
> -                            'tests/ui-fulldeps/rustc_encodable_hygiene.rs',
> -                            'tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs',
>                               'tests/ui/functions-closures/fn-help-with-err.rs',
>                               'tests/ui/linkage-attr/issue-10755.rs',
>                               'tests/ui/macros/restricted-shadowing-legacy.rs',
> +                            'tests/ui/numbers-arithmetic/u128.rs',
>                               'tests/ui/process/nofile-limit.rs',
>                               'tests/ui/process/process-panic-after-fork.rs',
>                               'tests/ui/process/process-sigpipe.rs',
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index 83a0dbc15f..e02829e6b3 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -10,6 +10,10 @@ SRC_URI +="https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n 
> file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC} 
> \ 
> file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} 
> \ 
> file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} 
> \ + file://cargo-path.patch;patchdir=${RUSTSRC} \ + 
> file://custom-target-cfg.patch;patchdir=${RUSTSRC} \ + 
> file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \ + 
> file://target-build-value.patch;patchdir=${RUSTSRC} \ "
>   SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
>   
--------------JbSL00NnDb8scupnl0N1Rk11
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Please ignore this series as it contains wrong commit shortlog
      format(<a href="https://lists.openembedded.org/g/openembedded-core/message/194050" class="moz-txt-link-freetext">
        https://lists.openembedded.org/g/openembedded-core/message/194050</a>).
      I will a send v2.<br>
      <br>
      Regards,<br>
      Yash.<br>
    </p>
    <div class="moz-cite-prefix">On 19-01-2024 19:13,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240119134352.3163178-5-Yash.Shinde@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Tests which are failing from below modules are added to exclude list
	tests/run-make
	tests/rustdoc
	tests/mir-opt
	tests/ui-fulldeps

* Redundent test cases whose parent dir is also present in  exclud list are removed.

* Newly addded tests are sorted and updated.

* Overall exclude tests count in exclude list is now reduced to 114.

* The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 165 +++++----------------
 meta/recipes-devtools/rust/rust-source.inc |   4 +
 2 files changed, 43 insertions(+), 126 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 6dbc517006..7d0efb1b01 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,7 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
+        #self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
 
         # build remote-test-server before image build
         recipe = &quot;rust&quot;
@@ -73,156 +73,90 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/compiletest/src/common.rs',
+                            'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
                             'src/tools/tidy',
                             'tests/assembly/asm/aarch64-outline-atomics.rs',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.rs',
                             'tests/codegen/abi-repr-ext.rs',
+                            'tests/codegen/abi-sysv64.rs',
                             'tests/codegen/abi-x86-interrupt.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs',
+                            'tests/codegen/binary-search-index-no-bound-check.rs',
                             'tests/codegen/branch-protection.rs',
+                            'tests/codegen/call-metadata.rs',
                             'tests/codegen/catch-unwind.rs',
                             'tests/codegen/cf-protection.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
                             'tests/codegen/enum-bounds-check-derived-idx.rs',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
                             'tests/codegen/force-unwind-tables.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-info.rs',
                             'tests/codegen/intrinsic-no-unnamed-attr.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs',
                             'tests/codegen/issues/issue-103840.rs',
                             'tests/codegen/issues/issue-47278.rs',
+                            'tests/codegen/issues/issue-73258.rs',
                             'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
                             'tests/codegen/lifetime_start_end.rs',
+                            'tests/codegen/llvm-ident.rs',
                             'tests/codegen/local-generics-in-exe-internalized.rs',
+                            'tests/codegen/mainsubprogram.rs',
                             'tests/codegen/match-unoptimized.rs',
+                            'tests/codegen/move-operands.rs',
                             'tests/codegen/noalias-rwlockreadguard.rs',
                             'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3.rs',
+                            'tests/codegen/repr/transparent-mips64.rs',
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
-                            'tests/run-make/cdylib-fewer-symbols/foo.rs',
-                            'tests/run-make/doctests-keep-binaries/t.rs',
-                            'tests/run-make-fulldeps',
-                            'tests/run-make/issue-22131/foo.rs',
-                            'tests/run-make/issue-36710/Makefile',
-                            'tests/run-make/issue-47551',
-                            'tests/run-make/pgo-branch-weights',
-                            'tests/run-make/pgo-gen',
-                            'tests/run-make/pgo-gen-lto',
-                            'tests/run-make/pgo-indirect-call-promotion',
-                            'tests/run-make/pgo-use',
-                            'tests/run-make/pointer-auth-link-with-c/Makefile',
-                            'tests/run-make/profile',
-                            'tests/run-make/static-pie',
-                            'tests/run-make/sysroot-crates-are-unstable',
-                            'tests/run-make/target-specs',
                             'tests/rustdoc',
-                            'tests/rustdoc/async-move-doctest.rs',
-                            'tests/rustdoc/async-trait.rs',
-                            'tests/rustdoc/auto-traits.rs',
-                            'tests/rustdoc/check-source-code-urls-to-def.rs',
-                            'tests/rustdoc/comment-in-doctest.rs',
-                            'tests/rustdoc/const-generics/const-generics-docs.rs',
-                            'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',
-                            'tests/rustdoc/cross-crate-hidden-impl-parameter.rs',
-                            'tests/rustdoc/cross-crate-links.rs',
-                            'tests/rustdoc/cross-crate-primitive-doc.rs',
-                            'tests/rustdoc/doctest-manual-crate-name.rs',
-                            'tests/rustdoc/edition-doctest.rs',
-                            'tests/rustdoc/edition-flag.rs',
-                            'tests/rustdoc/elided-lifetime.rs',
-                            'tests/rustdoc/external-macro-src.rs',
-                            'tests/rustdoc/extern-html-root-url.rs',
-                            'tests/rustdoc/extern-impl-trait.rs',
-                            'tests/rustdoc/hide-unstable-trait.rs',
-                            'tests/rustdoc/inline_cross/add-docs.rs',
-                            'tests/rustdoc/inline_cross/default-trait-method.rs',
-                            'tests/rustdoc/inline_cross/dyn_trait.rs',
-                            'tests/rustdoc/inline_cross/impl_trait.rs',
-                            'tests/rustdoc/inline_cross/issue-24183.rs',
-                            'tests/rustdoc/inline_cross/macros.rs',
-                            'tests/rustdoc/inline_cross/trait-vis.rs',
-                            'tests/rustdoc/inline_cross/use_crate.rs',
-                            'tests/rustdoc/intra-doc-crate/self.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/basic.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/crate.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/hidden.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/macro.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/module.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule-outer.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/traits.rs',
-                            'tests/rustdoc/intra-doc/extern-builtin-type-impl.rs',
-                            'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',
-                            'tests/rustdoc/intra-doc/extern-crate.rs',
-                            'tests/rustdoc/intra-doc/extern-inherent-impl.rs',
-                            'tests/rustdoc/intra-doc/extern-reference-link.rs',
-                            'tests/rustdoc/intra-doc/issue-103463.rs',
-                            'tests/rustdoc/intra-doc/issue-104145.rs',
-                            'tests/rustdoc/intra-doc/issue-66159.rs',
-                            'tests/rustdoc/intra-doc/pub-use.rs',
-                            'tests/rustdoc/intra-doc/reexport-additional-docs.rs',
-                            'tests/rustdoc/issue-18199.rs',
-                            'tests/rustdoc/issue-23106.rs',
-                            'tests/rustdoc/issue-23744.rs',
-                            'tests/rustdoc/issue-25944.rs',
-                            'tests/rustdoc/issue-30252.rs',
-                            'tests/rustdoc/issue-38129.rs',
-                            'tests/rustdoc/issue-40936.rs',
-                            'tests/rustdoc/issue-43153.rs',
-                            'tests/rustdoc/issue-46727.rs',
-                            'tests/rustdoc/issue-48377.rs',
-                            'tests/rustdoc/issue-48414.rs',
-                            'tests/rustdoc/issue-53689.rs',
-                            'tests/rustdoc/issue-54478-demo-allocator.rs',
-                            'tests/rustdoc/issue-57180.rs',
-                            'tests/rustdoc/issue-61592.rs',
-                            'tests/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs',
-                            'tests/rustdoc/issue-75588.rs',
-                            'tests/rustdoc/issue-85454.rs',
-                            'tests/rustdoc/issue-86620.rs',
-                            'tests/rustdoc-json',
                             'tests/rustdoc-js-std',
-                            'tests/rustdoc/macro_pub_in_module.rs',
-                            'tests/rustdoc/masked.rs',
-                            'tests/rustdoc/normalize-assoc-item.rs',
-                            'tests/rustdoc/no-stack-overflow-25295.rs',
-                            'tests/rustdoc/primitive-reexport.rs',
-                            'tests/rustdoc/process-termination.rs',
-                            'tests/rustdoc/pub-extern-crate.rs',
-                            'tests/rustdoc/pub-use-extern-macros.rs',
-                            'tests/rustdoc/reexport-check.rs',
-                            'tests/rustdoc/reexport-dep-foreign-fn.rs',
-                            'tests/rustdoc/reexport-doc.rs',
-                            'tests/rustdoc/reexports-priv.rs',
-                            'tests/rustdoc/reexports.rs',
-                            'tests/rustdoc/rustc,-incoherent-impls.rs',
-                            'tests/rustdoc/test_option_check/bar.rs',
-                            'tests/rustdoc/test_option_check/test.rs',
-                            'tests/rustdoc/trait-alias-mention.rs',
-                            'tests/rustdoc/trait-visibility.rs',
+                            'tests/rustdoc-json',
                             'tests/rustdoc-ui/cfg-test.rs',
                             'tests/rustdoc-ui/check-cfg-test.rs',
                             'tests/rustdoc-ui/display-output.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',
                             'tests/rustdoc-ui/doc-test-doctest-feature.rs',
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
                             'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',
                             'tests/rustdoc-ui/doctest-output.rs',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
                             'tests/rustdoc-ui/failed-doctest-compile-fail.rs',
                             'tests/rustdoc-ui/issue-80992.rs',
                             'tests/rustdoc-ui/issue-91134.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/nocapture-fail.rs',
                             'tests/rustdoc-ui/nocapture.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/run-directory.rs',
                             'tests/rustdoc-ui/test-no_std.rs',
                             'tests/rustdoc-ui/test-type.rs',
-                            'tests/rustdoc/unit-return.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
                             'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
@@ -233,31 +167,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
                             'tests/ui/drop/dynamic-drop.rs',
                             'tests/ui/empty_global_asm.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodable-box.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs',
-                            'tests/ui-fulldeps/deriving-global.rs',
-                            'tests/ui-fulldeps/deriving-hygiene.rs',
-                            'tests/ui-fulldeps/dropck_tarena_sound_drop.rs',
-                            'tests/ui-fulldeps/empty-struct-braces-derive.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_access.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_access.stderr',
-                            'tests/ui-fulldeps/internal-lints/default_hash_types.rs',
-                            'tests/ui-fulldeps/internal-lints/diagnostics.rs',
-                            'tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs',
-                            'tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs',
-                            'tests/ui-fulldeps/internal-lints/query_stability.rs',
-                            'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',
-                            'tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs',
-                            'tests/ui-fulldeps/issue-14021.rs',
-                            'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',
-                            'tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs',
-                            'tests/ui-fulldeps/lint-pass-macros.rs',
-                            'tests/ui-fulldeps/regions-mock-tcx.rs',
-                            'tests/ui-fulldeps/rustc_encodable_hygiene.rs',
-                            'tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs',
                             'tests/ui/functions-closures/fn-help-with-err.rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.rs',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 83a0dbc15f..e02829e6b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,10 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC}\file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC}\file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC}\+file://cargo-path.patch;patchdir=${RUSTSRC}\+file://custom-target-cfg.patch;patchdir=${RUSTSRC}\+file://rustc-bootstrap.patch;patchdir=${RUSTSRC}\+file://target-build-value.patch;patchdir=${RUSTSRC}\">&quot;https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
+            file://cargo-path.patch;patchdir=${RUSTSRC} \
+            file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
+            file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
+            file://target-build-value.patch;patchdir=${RUSTSRC} \
 &quot;</a>
 SRC_URI[rust.sha256sum] = &quot;b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e&quot;
 
</pre>
    </blockquote>
  </body>
</html>

--------------JbSL00NnDb8scupnl0N1Rk11--

