Return-Path: <atharvanandanwar@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF8ECF6D39
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 15:23:45 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.92.41.27])
 by mx.groups.io with SMTP id smtpd.web11.10216.1727882617963783259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 08:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=ZjyYTLBE;
 spf=pass (domain: outlook.com, ip: 40.92.41.27, mailfrom: atharvanandanwar@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd9rn4+85gzJ60O5ZEUqnMn5zxhvydqxzVgnSkwSKVG6Iloom6mFIvdE76eJEOlyH5aKTZ05O8qJD0sPPwFF64kHE4uXPcWzEKUEZ2YaPesyankOxHcwSqYhTL4Vtj0yfRZU2eIIOV9jIxebPoIaKAvzsSm5CDCB1XgGo9fN3aCLB1sXQT247zngZz2IGhtv/D5fkrOcalIHMGrskS01dA2LajOvuRxe29/vZxzLyIU8i3qlfoEZe5/gEn4cdpJjQEDd6B+MNvLuEaz47XacKqX4l01zMvUqVp/3d78Wq3AF8T1MvjTC4THeX98Hs1DcEwKXu4qOTxHxh9wbkBCRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIHInRpwylRxvCYHCxB+w2RsibZOJcbnfU5YXMGjYxg=;
 b=HEHWKGjorPQH9BH0zCeAVQ6DpBHRKQavk5mPwMKrpQSFo0UWaxIqs8jT1kG1BsRDHVOqNKEERn5ISLpNsQ1BqoTrQmmweoZb9ULQOQeu98J7GrSTtQKlIdPCxTQ5C319KiWTku2mbFnvznptRbfWyGADUkckq8X8cRNDyF8UdIAZ4NiNt/SUBK1QeoA/+DrzkDehFAWn1TOMoaMfSlw8WZmb0mhOYTJJyfsUoLjPEuRNT2QloCB99Ft2ccmsR1RJHsIQKx2D39XuG1kI9VYt89KBUgK10lz2AymNLUbNV546BHJ6Mw/73lPgulrwm1BfoBLoZpw6H1ZKvdHRmqPqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIHInRpwylRxvCYHCxB+w2RsibZOJcbnfU5YXMGjYxg=;
 b=ZjyYTLBETO2BZ4x9QVzOOj8eygY7wvuu8A+vQUrntPtpR5XNBTS7m3U0D0wgaIhxmtJfguwMh51JPfzC/yenFgbh4lmf6AdhsBQrJ550jgMDB8ehU2lLCkACui5jHAhgxHaM7Gbv0moeMoS/U6/wmJ1KduK3vhHaaMnFbd8RMLzg7mVJWkx+2N78bRfZpLQoNXyr7rcEZNkUeeljP8A2ZSqW4+CQ98122+fElV662CQjlnM74oCwIIwlVlPXW0AMcG2SHcfxUkZ+SNVdNcsoQbAIkMiCybcdfy11+JXUNFnHHaNS1c3OWiBrMING/nlicS5rlPO6Hej6wrk6oEomTA==
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3e8::8)
 by SA1P223MB1069.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Wed, 2 Oct
 2024 15:23:36 +0000
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184]) by SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184%3]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 15:23:36 +0000
Message-ID: 
 <SA1P223MB1187ACF3BE5D4F805FFC582CCB702@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Date: Wed, 2 Oct 2024 10:23:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][RFC PATCH 1/1] buildhistory: print extra
 information during list pkg files error
From: Atharva Nandanwar <atharvanandanwar@outlook.com>
To: openembedded-core@lists.openembedded.org
References: <17FAABE53561CF44.32687@lists.openembedded.org>
Content-Language: en-US
In-Reply-To: <17FAABE53561CF44.32687@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0414.namprd03.prod.outlook.com
 (2603:10b6:610:11b::32) To SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:3e8::8)
X-Microsoft-Original-Message-ID: 
 <ec774325-b66d-48f5-adc4-751d8f940d25@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P223MB1187:EE_|SA1P223MB1069:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ffe5a0-6d8f-4a7b-48b1-08dce2f62f18
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|6090799003|19110799003|8060799006|5072599009|7092599003|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 
	g436Cy1GX30h+YVqFwpO5NTBfFk7Cy8CkWK25se/kD1O3FJonqyDJDrDY/6t7X1ignCVQgVSAIESIJqZFrSrK42kon6SYv1iOfARCM2zJViR3DDukn2sogYXWVlqW2JU2sDevBxHdQPSsNToZztueaGmxTIyJIzsy+bV8ehxlCF+5e3SqlgeaDT+BSGWOH4biiU71/CsXiNAO+SD9TuB6TVNBffhBsmrtgt9s5RXIBDLLhRvRYJQHW44/wQjtm09EmEpC/aLh03pKa/gJct2aDoQR270SEN9D0fC19vIu2UdNTl074VPfIi2GnNMrOHrFiaxXdnci+HSCp8yjPkvy7ueSj+QadLFVheoDviD1hZR/O6nvzUAixwaLdyNuVy329eJaqRXmUpTdIu3ZSGQJhV55FyZhWTo9jK2SXjipDgKqBuTcLvxoCbIA2yTnZGsoOtY9Z/XIptjLxIPwwrq1hcy+4bMXnmffHjXR8J6gJaHjJzC2wuDIJi76z38JtABSgxngLOUZzhfZs3R6RCH7KdMvIcQr8rhvLJDRaL7aAFjcpm2HIJStE766HYqNRq8H86r3N2nKjId6IxNA9wk5pyFChCgBuqFgZlmZX7syUbfNi9JyIJ7MJxfCA63XDfDFqo1w6wuR2YkcACDh3Dp4sx5iZxM9KjCsdrnuEub9R338ni0XKnqCA0Rm3mgipcDqTp1w+d225CTWzf/ygrTq4NFiQdX7uCxctScD+8nNVkrhPao63QdDUncILaDRuounr833CRKOTrH+aGhYhJR/g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2ovVk5VcUtsdUdrRGxwQ09CV0t1RThuQXlsK3JXaU4xSHhiR0tyTmduTUxo?=
 =?utf-8?B?eTgybHlGMk1BZWUzQUZyUHorWjlSSGlvTzRtbnpsaHgrbE9IV2podkN3Y0FD?=
 =?utf-8?B?N3VsTWJpMy9GNHd3K1l5TkdmblB0eTg1ODZ6bGxVS0V0eHJ5ckhIamU3bzQ0?=
 =?utf-8?B?a1lzUisxSDBuWnFGRHM2WGRYR3BaWm1JWEFtQWdpMGpXTGptYlUxU0pFNkRF?=
 =?utf-8?B?UGE1YnNyU1lveVNNczhrMUZLZHhKaDU2S1VyWVNXVDNGYm9nMEFtVGN5cnVa?=
 =?utf-8?B?d0U1bldQMnpQa1BTSVlINTFFWG5xcEFoSzBmQTdKU2NPdlMzNWcyOVQrcmlS?=
 =?utf-8?B?L0VrdUl6VzFGbW9ESk1MZFFTZzlBR2hjMTFxeC9kNDIvZVF2UnZIVXkxNXFw?=
 =?utf-8?B?OFkzSXFxei9KZExzYzRQV1RnYUxHdHBrOWoxelJCRjV6LzFONXJZTHlobGZE?=
 =?utf-8?B?cXZGNUROYVB6WHEzejFKL05HVU9mNWVwTVJaYmxPU280SmZYblVyU1Q5ZUZL?=
 =?utf-8?B?MEdTVWh1Nm5aTVB5R2hIRXBjQ1p1dExTRE4zcFN5ZHQvODBGTDRXN0R0MXg1?=
 =?utf-8?B?MXJiUFYrT2ZBYkdBSnMyYU4rZjlRWDdtL2FGQU5FMng3UTZJeXBPTVMxMmFY?=
 =?utf-8?B?UWliSzkxNituSkUrNjc0aktOK1YrcWhSd25kNkdtMFJsa1d4dTN3Y1M2S2VT?=
 =?utf-8?B?enZ3U3lmQWNIRTQ1dXNoQkJCYk5XUlhYaTBNNHY0cHZ2NkFHUHZJRUVGcnhH?=
 =?utf-8?B?NVYveFp4bVR0QkNxbnN3czdHUHdxSTBQd2xTcHNLWVA3NkpBWlphS3Nvckht?=
 =?utf-8?B?QjdZeEpjS1F2d1N2MXVnU2NzRTBzZ1pDaDBncWQvSFFVbXE1SGNneGkzR1dy?=
 =?utf-8?B?QmJESUUrR0lqT25ZZlFhTUI1c3JxTVE3ZVUxN0d0ZGRoWTRrVzJ6RlBEeVVY?=
 =?utf-8?B?UHdGTzJ2M2ovdTgrR25raEhVeUZxeUhWVE9lOHV6RStiOE5WTjBvNUNEV1Bm?=
 =?utf-8?B?TkRWVEhrRWlIaHcrT2JLTXNpTitsb3hvS1BDcnFYT0IwQjhLYThiY2tBMjVT?=
 =?utf-8?B?UkU5bWVpRzllL0tlTG4zaW5adXdCWmxRRHMvd2ZjeWVEU0psKzVHSGVjdFU3?=
 =?utf-8?B?R0x5ZGFLc05LVUpDUXNaSkVvd09NdkNtenVYWnJ5MUc0clhlV2JINkYrUGhX?=
 =?utf-8?B?cWl1ZGdIMWRlNmdKTStxaVZMVVEya3BYZnVRQ1FHRXh1Mzl2d1FpWTdzbnF0?=
 =?utf-8?B?Y3RuTG5qdUI1ZFFDV0FITk1pckZzakRQeHBJdmhPazcyTzNzS05Nc2tLa3o5?=
 =?utf-8?B?RG5CVFVXNTgxTGhIK3pqMG5HV3N6ZUI5a0p6aVlYcUtCYS9KakIzNHpzWlZG?=
 =?utf-8?B?VGwwVnpja2RyTFF6OFM0TzBsbGFlTjEzM2Y2cVlWZWxKV1RVYUx5QWs4Q1Bs?=
 =?utf-8?B?Y0RBYnA4L1Z2UGRWMHZLa25naFBmZ1cvVkVmR01yc2FRVzN6dGtnNDJqRmd3?=
 =?utf-8?B?SWw1MTI4VEJKLzM1Zml4L0ZDLzNTMzg1OFNMR2psRXRSeUFFOUw2dVVObkVH?=
 =?utf-8?B?ZDlZV1VDZzU3N0NNT1pmT0dNL1hjV3ZBd2RxWnBycWYvb2FURjlVTVo2V3Zi?=
 =?utf-8?B?QlRCWW9PWk1aUzJRdVFyVjI4T1B5Qk4rZmRqbU83WEZVeVc0Z2FGc2R1RGVl?=
 =?utf-8?Q?kcxq4koRvVVYrlABkYID?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ffe5a0-6d8f-4a7b-48b1-08dce2f62f18
X-MS-Exchange-CrossTenant-AuthSource: SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:23:36.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P223MB1069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 15:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205203

> Printing a useful error message while failing should help users understand why
> we fail with this error. As the current error message doesn't directly link to
> needing to inherit nopackages.
> 
> Previous error message:
> | DEBUG: Executing shell function buildhistory_list_pkg_files
> | find: ".../meta-toolchain/1.0/packages-split/*": No such file or directory
> | WARNING: exit code 1 from a shell command.
> | DEBUG: Python function buildhistory_emit_pkghistory finished
> 
> New error message:
> | ERROR: meta-toolchain-1.0-r0 do_package: meta-toolchain: ../meta-toolchain/1.0/packages-split is empty.
> | ERROR: meta-toolchain-1.0-r0 do_package: Possible reasons:
> | ERROR: meta-toolchain-1.0-r0 do_package: 1. Recipe doesn't install any files. Inherit nopackages to fix.
> | ERROR: meta-toolchain-1.0-r0 do_package: 2. do_packagedata task wasn't executed.
> | ERROR: meta-toolchain-1.0-r0 do_package: Execution of '../meta-toolchain/1.0/temp/run.buildhistory_list_pkg_files.1003324' failed with exit code 1
> 
> Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
> ---
>  meta/classes/buildhistory.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index ce3abaa69d..0e9d5464af 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -621,7 +621,13 @@ buildhistory_list_pkg_files() {
>  	fi
>  
>  	# Create individual files-in-package for each recipe's package
> -	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
> +	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d || true)
> +	if [ -z "${pkgdirlist}" ]; then
> +		bberror "${PN}: ${PKGDEST} is empty."
> +		bberror "Possible reasons:"
> +		bberror "1. Recipe doesn't install any files. Inherit nopackages to fix."
> +		bbfatal "2. do_packagedata task wasn't executed."
> +	fi
>  	for pkgdir in $pkgdirlist; do
>  		pkgname=$(basename $pkgdir)
>  		outfolder="${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
> -- 
> 2.34.1

RFC as I'm happy with Reason #1, but Reason #2 could use some help.

Thanks in advance for the feedback!
--Atharva Nandanwar



