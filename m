Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91ABC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 23:51:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10655.1698796291279277031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 16:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WF/e5hOF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9668d672bb=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VN1Vsu012233
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 23:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=TrGkP8guY7nmQiM5sYL
	+kP5crS3le9LRDwCP28J3vac=; b=WF/e5hOFrQe9DyqK4jN3Io1hCOz44vgUZ/0
	XgBri8igvlb6cW6rM324dEv2LcEQB8MDAQWEDVQZd+PXTss9ILDNyY/ebB4ziO01
	EGxmuc6lc0fcSdCfm9upqnFaqWcRSrRlGxYvxP6vQzCWHu+LkPf9SkOjKQmwmoHa
	cNLpgaKz+3nbGz+PupJGM9PLzPyjE4KhP37aJDKUKHkdpA4iTeLtnYf4WdJ2SWyP
	dJkYJJ8M859s/nXIow7sA5ByoKjEOIJOS2LOBckY+/mawuiHr9kQp9gt2tsxCUFU
	md+LjzM7MwekBILpAbB8rMb7gX0B8I60Yo3sjkAYxBNdPvTRPKw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0s96c91b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 23:51:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv5eNM3WgHvhWKMCvdwLzDd6ncG6N0hPQSl8Dv0/gKDkGomPPYEIBJjWk26mg0Cm2oKKDqz3WNyDE+QESuuliVLmOEgfWELx3R2z7o5YoMHNtcEO34pq0dZB0S61u/V1BACKQQM64w8El9TkNaa8Q/JoQkwuRhfX8+zt/wS7yNOVV80XIATDpqMwG7J3vSu0jJI6I10/LKF1sa7gfozUZqokdtNe+alNPxkz7mMOZDCwQu2LiFBrSulnm0f0yEwtnT17DrGz0WZGfs6co+svHdw9Pf7btwyRJYCUAoXU0Q7XbS6WteGFwRAM23Wkaa8CE9suNgS9eWZmoczxvCAJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrGkP8guY7nmQiM5sYL+kP5crS3le9LRDwCP28J3vac=;
 b=mAd7uGnshmc8SyXo5M/gC5IX93IliOI3hnS5zUQrw6GtFEVZckBO/aQ7ODYcsgsjzE1/E5JVViopFpReuIQYJt/YpSc9MDrm4aEjCcvpOS+DiZCEBhlntNbP2QQAlgx2e0v3FLQo1UFnhquuNiNQ7bsNofF5rbMxLU9usLaBU5uLcm+kiE3fR1Aoi4a1mLNc1RSdbkNIP/sERx3hV5s6YdK78vqL6NqurSIZBveA1co5I/0BKpAmC97ZQx/8AsQ1QBYKi7pENRdLA0gwoGDerMo79gS2VONefNNotxvfl69gw61eio0VclEF1B91PUsotZQ0+nJ5KYH0ZdXWfKizcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 23:51:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 23:51:27 +0000
Content-Type: multipart/alternative;
 boundary="------------j5qRGhIy0bW8r9ROB3eteBvd"
Message-ID: <e9d4b6fd-03c9-4538-8b9b-52f006d9cf99@windriver.com>
Date: Tue, 31 Oct 2023 19:51:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] strace: backport fix for so_peerpidfd-test
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <179355FD3F4001E8.25237@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <179355FD3F4001E8.25237@lists.openembedded.org>
X-ClientProxiedBy: PH0PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:510:5::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c9a94a-932f-4302-aab9-08dbda6c4bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tJBe+0RdsPeGPrJ3lQmQtJsNpk7RomRh4ITMqCkH/vsH4NxHfjoVw4izaEJywQu12R8AbduWrVRJr2w9WALferjjYJ/Q6NSO0K8I9n6QL43eBOisl2YhRvCOmf4O1vhhRSYXKJnCCeaIzktfLCEES6lB+GFYmQayvj7ir2HrWRGZUuCIC4NMR8CH1TXdSywqty13ldoRd9mNN0iU8I80oLTttnUjbWGcWkvnQMXccXaRw9Z3ml5UneALJ5KjPElSKj7GT1ALUDPeUhOOisXWrx3B2Nmj38E5Y+GvL9sJZCsAqrGQ/NpjGfWsi3UMVPbm5V1KSdi201ctjY/n+MHch3xXXJMaKqklDrmWq7R7Dp+MdttMJG0t42KTo1U4ZdgLNP9NBNnKbTwl2LRIja5PzvtO605XsOHiO87RyluLgXpELdYJRDfuVwVm6TpVCNWE43VC7pDWpCQFPbO7wELsaAkWuZCCh6gMVoS/Nrr5pxDrUOPwMkNNpqIck7ibrxQyy1B90AWXKmYdA/mk+E5coi4HVpeTbzKbY+tsydTx3BNnkuQ3lmOU82V4YYra9TAvFbWHh8nL9WgWWmLXxGjHvXYtGdy7pN2OrbBfuzikddJzBUaYT+1kSTo1T3xtLvonn9YhcK1WfYRJaJxS/p3CaZXSP4cMdoxk+qOztC9FosU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(346002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(66899024)(83380400001)(41300700001)(66946007)(5660300002)(2906002)(4001150100001)(36756003)(31686004)(31696002)(26005)(2616005)(86362001)(166002)(38100700002)(6512007)(6666004)(6506007)(33964004)(53546011)(6486002)(478600001)(66556008)(6916009)(66476007)(316002)(8676002)(8936002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkNBQ3Z4R3NBR1FiSzh2cVc4ZjZEb1JFdWIwSDRKbUlWTXVjRzhuNVFMektN?=
 =?utf-8?B?dWl5dkhmY252TnpnK3dJN0tWTzh4aUtwL2QzR2l3OFBtS20xVGhyb1hGTDlj?=
 =?utf-8?B?ak1TdWpQaW5EQWVmOWNmLzlENFFwbHBBUkwxbUNOeWQ2c1BxTG5JV1BYSTBn?=
 =?utf-8?B?ZjcyRkZGY1JxWTZMMWZJaXczeG1pc0krT2pKMnV4cE9Tc3hxZFJSeUlMaG90?=
 =?utf-8?B?RzB3dVpHbkVtb1JRbCtJQVlBanVVbVM1WHRiZE15ZXh3SEhQMjhIWi9ucGpk?=
 =?utf-8?B?bjlhMFFzRzVjMURrd2E4VGdiN3lXcGgwWG1TVHZYZ3lBZGYxNjVnNGZqZFhW?=
 =?utf-8?B?OCtxU2dkMGJiN2RhZnZpRUNyUW42cHhNSEk1Zkp4S00za1RvWE5ybHRSL1NN?=
 =?utf-8?B?aDZJTHNaOExIaHkzcUVSV0RNMVQzOGwxZll5UUdQK08yZFloOHJsUVAralRz?=
 =?utf-8?B?RjRIeEs5YVd2SlNCb3hDUENadUdQcnZPVWlZV3JCaHpad2JKeVZTZ2UzVzJi?=
 =?utf-8?B?eVUzYW1XVjNxajNiOFNZOXU2K2RVbEN0U0FHNVlmcmlzK3R0MGFSMjh4R01l?=
 =?utf-8?B?Y1MrZU1CY0xNbVMvMnhsZ1pZSW1wU3Y1RURxSVdWcmxZUjNDT0VSdDNGMTNN?=
 =?utf-8?B?dzVvUGxKVGQ3YmdZOVFnMmhsTEcxSm5OQy9zR3BGVHBhalkvajFWbXIrR1g2?=
 =?utf-8?B?MDRWUVRGSEgydWN1ZmphWVFUOXdlQlpYTmZ5VitRNlFPRjVQOTI5bllZU1hz?=
 =?utf-8?B?WiswZy9LWUk0RFRjRUVRUzZhZmlGdmEyZEpoUW15TWJncllDVVJpcjhzOHA4?=
 =?utf-8?B?NUFHZGwzMDY0bThoL3ZVZndnOVFKbjdPb2FBQ09zTVd5RFM4Q3JUVXNYNWxt?=
 =?utf-8?B?MnEzaGliaE54MHN0WEFwcGsyY1pZdmRDK0libU5JTUd5cHh0cWtyYnN3azMx?=
 =?utf-8?B?T2xva202WjJtdWQxeGFYQk9nSTZ1VWI1bHEwS0xoMElPM2wwU3ZMR1VyN0xw?=
 =?utf-8?B?SDNVc1c2Z015dnZuWnVuaVFSL2JOR2c0di9YelZYUVRxQVQxWC85N2pSM3RT?=
 =?utf-8?B?OUI3VVoyMWcwTVJLdGtubWxBczYzNW9FUUVyRkl1cEVsa3Y0a2k3aEhGTGpu?=
 =?utf-8?B?QXpCSUFVTkUxWDkvSmNBOUFlSDJqek9aYTNpZy9SRFk5amZISnJRenJJWFI0?=
 =?utf-8?B?d05Pd25CdEZhK0RxdllVTlNHaHpVNXZBRWpiSXY0VTJ4RTgzWmZrbHJ6ZjBi?=
 =?utf-8?B?dTV5di9FV3VXOUZpV1V0UnB5bXNkenh1Ull0aGJqZWhBYWlzZ0VLMzlmYlJY?=
 =?utf-8?B?SFFZejVLZENuZU0yeGZUWlI4V3VvTWFweG1HdlpIa29MbWNxZTVMNHZkMWhT?=
 =?utf-8?B?VjdlcUZYVFVWK2dKcW1pL2F6d1FvdzVQQjdkRkFqcTFvby9qN3ZpbTZXQm1k?=
 =?utf-8?B?cStBcG1FRXRZKzcvNVJybk5HZmRETUpqOU43cGZzSWpKOHNMVzFxK2piNlFl?=
 =?utf-8?B?dmdvL0RpRk91cXJXeUVqZCtIcVg1Yk1mK1BYWGNBQlZmN3FROC92TVJjVXll?=
 =?utf-8?B?eFhscWtlZUFnZGxuYVN2QWN1dnRWL2pxSkJLWTJzM0FQcHpHQTNVWVdOTm9I?=
 =?utf-8?B?cDNZK0VWOW9lTlRjdURKVDR6R2IxT3Y2NXRVd0Y5Z0tOZjQ4MXJXUUo1Y3FL?=
 =?utf-8?B?UjlNZHZqb1FHQ1ZVK2h2MGFBMWtqUjM5OFVrWkQzeElPZU1yaXV5by9obDN4?=
 =?utf-8?B?RjhiM0xwUzhlaFpzdUw4bm5EU3B3bTRxdDM2aXV1cE1ENjNaTW91d2NvUWFV?=
 =?utf-8?B?SlJ2eEs4cnRGUExVZHpuL3JYUms0YWpzRkwxVVpLWmJubmhBNzU1ZFNqMmJV?=
 =?utf-8?B?KzRTRGNwb2Rremxkb0pHUEY0ZzgydzBTMHZIZ3pLYmhqZlR2QTl0VUVKNHhS?=
 =?utf-8?B?VnFqSjFQekUvM2dDbXNSR2kxTVQ5QmQrdTd3eFIwNjBRZHRta2pKckpZY2Y4?=
 =?utf-8?B?Ty9HUFRTQzRNZ2tvZTRES0VGdkpuWGthb0NiaHJpWTdvVHNTVVBKTmdIMjh6?=
 =?utf-8?B?L05Ielp2MzBPbGxzdUpTczJYeUc5RUhEUk4zazBQYXlST05PVGxqMktvRmh6?=
 =?utf-8?B?YnoyY01CdnlvZVZWaVZLRjNYaWhWVFBUYTNXblVrcC9MSXRZVENlTFZrc0RS?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c9a94a-932f-4302-aab9-08dbda6c4bfc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 23:51:27.0865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VENNj05/jsWKQk2jyDt/ITykFXHHuR2uJRW1y7QkEuEF8AAUSf3nryGL2qOUYY7gyMnerfbXO1b0DCCSD8ueCtLGWXBEDOmYIrDGFMsaG+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
X-Proofpoint-ORIG-GUID: 0LzBusKDggIbQjpFCIPrxQC-tgpuW474
X-Proofpoint-GUID: 0LzBusKDggIbQjpFCIPrxQC-tgpuW474
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310310197
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 23:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189891

--------------j5qRGhIy0bW8r9ROB3eteBvd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-31 7:47 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Backport the fix for the so_peerpidfd-test:
>     44cf51a38 tests: fix so_peerpidfd test
> and drop the patch that skipped that test.
Note that options-syntax.test failed with the default qemux86-64/kvm memory

size but works with 1024 MB.

../Randy

>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../skip-test-so_peerpidfd.gen.test.patch     | 25 ---------------
>   .../strace/tests-fix-so_peerpidfd-test.patch  | 32 +++++++++++++++++++
>   meta/recipes-devtools/strace/strace_6.5.bb    |  2 +-
>   3 files changed, 33 insertions(+), 26 deletions(-)
>   delete mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
>   create mode 100644 meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
>
> diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
> deleted file mode 100644
> index 5c73e1f10e..0000000000
> --- a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
> -From: Randy MacLeod<Randy.MacLeod@windriver.com>
> -Date: Fri, 6 Oct 2023 12:08:23 -0700
> -Subject: [PATCH] skip tests/so_peerpidfd.gen.test
> -
> -Upstream-Status: Inappropriate
> -
> -Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ----
> - tests/so_peerpidfd.gen.test | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
> -index 64ad3a2..f89da9f 100755
> ---- a/tests/so_peerpidfd.gen.test
> -+++ b/tests/so_peerpidfd.gen.test
> -@@ -1,4 +1,5 @@
> - #!/bin/sh -efu
> - # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
> - . "${srcdir=.}/init.sh"
> -+skip_ "Test fails due to apparently trivial log format differences"
> - run_strace_match_diff --trace=getsockopt -y
> ---
> -2.39.0
> -
> diff --git a/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
> new file mode 100644
> index 0000000000..62f73d3643
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
> @@ -0,0 +1,32 @@
> +From 44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d Mon Sep 17 00:00:00 2001
> +From: "Dmitry V. Levin"<ldv@strace.io>
> +Date: Sat, 14 Oct 2023 08:00:00 +0000
> +Subject: [PATCH] tests: fix so_peerpidfd test
> +
> +* tests/so_peerpidfd.c (print_pidfd): Fix expected output.
> +
> +Fixes: v6.5~38 "net: implement decoding of SO_PEERPIDFD socket option"
> +Resolves:https://bugzilla.redhat.com/show_bug.cgi?id=2243631
> +
> +Upstream-Status: Backport [https://github.com/strace/strace/commit/44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d]
> +Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> +---
> + tests/so_peerpidfd.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/so_peerpidfd.c b/tests/so_peerpidfd.c
> +index 33988edec..dfad1c434 100644
> +--- a/tests/so_peerpidfd.c
> ++++ b/tests/so_peerpidfd.c
> +@@ -37,7 +37,7 @@ print_pidfd(int *p)
> + 	if (rc < 0)
> + 		printf("%p", p);
> + 	else
> +-		printf("%d%s", *p, pidfd_suffix);
> ++		printf("[%d%s]", *p, pidfd_suffix);
> + }
> +
> + static void
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
> index d6475e8db9..d1536b1e8d 100644
> --- a/meta/recipes-devtools/strace/strace_6.5.bb
> +++ b/meta/recipes-devtools/strace/strace_6.5.bb
> @@ -14,7 +14,7 @@ SRC_URI ="https://strace.io/files/${PV}/strace-${PV}.tar.xz \ 
> file://skip-load.patch \ 
> file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch 
> \ file://0002-tests-Replace-off64_t-with-off_t.patch \ - 
> file://skip-test-so_peerpidfd.gen.test.patch \ + 
> file://tests-fix-so_peerpidfd-test.patch \ "
>   SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189890):https://lists.openembedded.org/g/openembedded-core/message/189890
> Mute This Topic:https://lists.openembedded.org/mt/102309591/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------j5qRGhIy0bW8r9ROB3eteBvd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-10-31 7:47 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179355FD3F4001E8.25237@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Backport the fix for the so_peerpidfd-test:
   44cf51a38 tests: fix so_peerpidfd test
and drop the patch that skipped that test.</pre>
    </blockquote>
    Note that options-syntax.test failed with the default qemux86-64/kvm
    memory<br>
    <p>size but works with 1024 MB.</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:179355FD3F4001E8.25237@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../skip-test-so_peerpidfd.gen.test.patch     | 25 ---------------
 .../strace/tests-fix-so_peerpidfd-test.patch  | 32 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.5.bb    |  2 +-
 3 files changed, 33 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
 create mode 100644 meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
deleted file mode 100644
index 5c73e1f10e..0000000000
--- a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
-Date: Fri, 6 Oct 2023 12:08:23 -0700
-Subject: [PATCH] skip tests/so_peerpidfd.gen.test
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
----
- tests/so_peerpidfd.gen.test | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
-index 64ad3a2..f89da9f 100755
---- a/tests/so_peerpidfd.gen.test
-+++ b/tests/so_peerpidfd.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
- . &quot;${srcdir=.}/init.sh&quot;
-+skip_ &quot;Test fails due to apparently trivial log format differences&quot;
- run_strace_match_diff --trace=getsockopt -y
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
new file mode 100644
index 0000000000..62f73d3643
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
@@ -0,0 +1,32 @@
+From 44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d Mon Sep 17 00:00:00 2001
+From: &quot;Dmitry V. Levin&quot; <a class="moz-txt-link-rfc2396E" href="mailto:ldv@strace.io">&lt;ldv@strace.io&gt;</a>
+Date: Sat, 14 Oct 2023 08:00:00 +0000
+Subject: [PATCH] tests: fix so_peerpidfd test
+
+* tests/so_peerpidfd.c (print_pidfd): Fix expected output.
+
+Fixes: v6.5~38 &quot;net: implement decoding of SO_PEERPIDFD socket option&quot;
+Resolves: <a class="moz-txt-link-freetext" href="https://bugzilla.redhat.com/show_bug.cgi?id=2243631">https://bugzilla.redhat.com/show_bug.cgi?id=2243631</a>
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/strace/strace/commit/44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d">https://github.com/strace/strace/commit/44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d</a>]
+Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
+---
+ tests/so_peerpidfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/so_peerpidfd.c b/tests/so_peerpidfd.c
+index 33988edec..dfad1c434 100644
+--- a/tests/so_peerpidfd.c
++++ b/tests/so_peerpidfd.c
+@@ -37,7 +37,7 @@ print_pidfd(int *p)
+ 	if (rc &lt; 0)
+ 		printf(&quot;%p&quot;, p);
+ 	else
+-		printf(&quot;%d%s&quot;, *p, pidfd_suffix);
++		printf(&quot;[%d%s]&quot;, *p, pidfd_suffix);
+ }
+ 
+ static void
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
index d6475e8db9..d1536b1e8d 100644
--- a/meta/recipes-devtools/strace/strace_6.5.bb
+++ b/meta/recipes-devtools/strace/strace_6.5.bb
@@ -14,7 +14,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://strace.io/files/${PV}/strace-${PV}.tar.xz\file://skip-load.patch\file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch\file://0002-tests-Replace-off64_t-with-off_t.patch\-file://skip-test-so_peerpidfd.gen.test.patch\+file://tests-fix-so_peerpidfd-test.patch\">&quot;https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://skip-test-so_peerpidfd.gen.test.patch \
+           file://tests-fix-so_peerpidfd-test.patch \
            &quot;</a>
 SRC_URI[sha256sum] = &quot;dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#189890): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/189890">https://lists.openembedded.org/g/openembedded-core/message/189890</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102309591/3616765">https://lists.openembedded.org/mt/102309591/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------j5qRGhIy0bW8r9ROB3eteBvd--

