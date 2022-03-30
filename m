Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618DCC433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 16:24:04 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.54])
 by mx.groups.io with SMTP id smtpd.web11.513.1648657441010957826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 09:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=rQ5uMtaj;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.54,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eECjBXSs/7iVHhbqXZFAUYtTnSL3sFVQNKHBrecHJ41cXOR0WQSusc6d8rrlP5oYFCEerhRGR0AqAi1BuSCGbyj2hYktnjFW5Nqlm8u6cR/wfE+ywF5BdpybYTZHORpCa+I7Krz0xIfkcFlJ3qQj5IqtHrFw83hlHj7cnUB8J5gbhGlNnwOYELE32vC05t+ApVc6r53NObbg2f3Lc7Y3UCLsDnY198jpBl36p7SkaHKHu6s5Calgr84bMR/45f1ojLZF33uHkVLOu5BHQD94KrOogBvCu9z9Gog86fOffwUO3F+VwVAbkkRdz1U9fNWxe56y+f52NoByrXN1N7FWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk1tyWfomquIqx5/bksUZhaYsLIzAY8yqxRogZL2+FI=;
 b=JmvmGd8nTGzuLUJTzcV7b7ji94RRAQuyDgxvJfYpIwIdpcot497+iJJmwn3rKRvveccKbLUx2BS45TzEZ/hqY6XGE0LXj6Qrv6Fc9Xiy4ww04kGSocZ89AXF4i1+SoyUSonj2jm0zprCrqje7hvOMWk4vGX6JtanUCkn6JCQ5vo9qEsJAa4Q2KG3NgKt6mzDMSpa0qB9x6qTct7Zz2z47E8yix0J/G1QqbH9BJWJS7SlNICIOZL9gt3+XoHaKp/HtAW1HI18SaP2vYi4JvN7VA2OdWrMH+7z26oRtpF5zNSkIpfBqa7FdHrCRwfXt+3tNEC+t6eyxoeqq1dnv/QggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk1tyWfomquIqx5/bksUZhaYsLIzAY8yqxRogZL2+FI=;
 b=rQ5uMtajK1lFBG6YE4VhC3YTAh99UnE6WemvgjIXaK20+gk4xnTP+cznYi3OSjFqVT6Hxjv2q/Db4WVzxr/kaJTG5hbMajd06JdnXASCff8Dvl5dpJzLj8lUoNZ4/cLJP6+Bzebtz9V4oNcTVgFyNdrQkOVOAdiZUZWqhP8vqCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM9PR08MB7101.eurprd08.prod.outlook.com (2603:10a6:20b:41a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 16:23:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%9]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 16:23:57 +0000
Message-ID: <84856081-3938-5456-b62c-8b4f06fe2001@weidmueller.com>
Date: Wed, 30 Mar 2022 18:23:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d9889a46e5523848d3b770302623bc95e75c37d5.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <d9889a46e5523848d3b770302623bc95e75c37d5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::16) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bb74dd6-1c2f-404c-cf27-08da1269b0ef
X-MS-TrafficTypeDiagnostic: AM9PR08MB7101:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB710110C4B93230443A428614D71F9@AM9PR08MB7101.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5XkI+fUHphAOsWzhzeR/dUtRzdBIp2KdA70Ae9uybl3Q8o8EVvoHs/5Gfey/XqqIcCnQOBjQhofuhSNSEI2wkmjhdqamQy9iebBmr/sy2n5OQTyNzIKkg/0yYtU8e8GEGHcgvt0D6UQ+cxRRRJYa+xx7NUQQVEiY6bhctCiBTt5J4Jfh/5VDpJuAe9DHYTzKU7mFEBC18Nqc6TglUxLyjZBG+C3kA18gJVF7CMARBDwpomX2rjqn0aA/s5t2OkyojoTpe0TM26Rx9da0znhiPitey3fBXsyTiQue35Avlf/ZBVeQbzMHwratzjd273qltsQg+JMYnJbhCNlRJBAFLzMs5WV1YQXgI5jDQloXh8sYpF+wuA3F4sfMBMT1JPScOXNqS2P1b2tuSXju1l7ms8Kj8WJwIcCKk2a+0Jo7M/FqUurKWdCc4/E/9aNFZ6N+UwCz/tzyH2zRTml84zx6YxfBHsn7SOcDgAHW5Nq9gGOV7z6YGcytXmSFON6boaazjAttEdSFQJM18AlGHqGBwseox81znuAXf9h0E3GwlrsNp6+7jQM4cfu5j0w0kERJhK7vDlcvRwaNHtGma2awLAiEGF/z3aNmV/S9E7CzJztwMKKetvQxZUv9bBrLDsWGeB7+CreuxpC0W2Je0ehSH2jggfMvX3t7GhHTEUopqWN4IgDhtUIJXFBuOOP//VbhbP4qNLQg9Hd2xiX4XIfjYjju9jbEKYinNt18DkjiCohj/9h1IdmiXiaM/A9DMab5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(31686004)(83380400001)(2906002)(8936002)(8676002)(316002)(508600001)(4326008)(5660300002)(66556008)(66946007)(66476007)(6486002)(2616005)(26005)(86362001)(6512007)(186003)(52116002)(107886003)(6506007)(31696002)(38350700002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzdhclM2Y3l4b1MyQ28wVFEvMUxESEE5QkorMXhSY0RMNTJuUkwraUxrU25D?=
 =?utf-8?B?Uk5jdnNFUXpJbHlsUWFkUHljdUc4d200bWI3ZTN3RGRzUDZRZGV2QlBqVXpX?=
 =?utf-8?B?M0FMY0JqS3hraXcvVGRrWVhmSmFleUprcWZLQzR0NWh2SkhpelBxNnhScmdK?=
 =?utf-8?B?QmYyVGtWZUNLWjJRS3hrcWdiLzhVZmoxdVpQc0JWZVFCOS95RkdpTkFkbHRI?=
 =?utf-8?B?b0JvQXBISzRqV3hEN1BWS2VLR2EyYTZXa3hsQ1hFMjRsb3dqcFFKMmRGS2o0?=
 =?utf-8?B?b3RGbHNVUlNnZnI0TkZ5WXBEYlRIaXo5OC9vclM0akgxcEM5QlIxdlZpQ3VR?=
 =?utf-8?B?MEN2aktOdjNOUjRjVXVDUmRnQ2tTc3dEekE3RUJpK0s1bUJla016ZFlvdW9M?=
 =?utf-8?B?Zk5mdFkrR2tDM0duMnVqM3YraXp5WHFGODcwdVhwTHptYnpHQXBsS2xreExv?=
 =?utf-8?B?eHF4MU9CbUFmV1dqMVFTYlkzRldZWmxoWjU2ZENrNmhFMGFqb2F0eC8zTktC?=
 =?utf-8?B?SXExY0dNVElTUWk5aFlhVEtQZFZUZlZWWHpJb3JjSWRJQldqVFNNUFB0b3Jh?=
 =?utf-8?B?aTdjNEgzUFEzeDBKU3BNZ1d3WElvU1g0b0NHQlVQZzZ2MWNPWUt0Ny9XVlZZ?=
 =?utf-8?B?VFFqWjYrZEorZTZTV05tVFVyLzNYaG1QUXNkZzlMUi9KVnFTMTNHMmNlTVc2?=
 =?utf-8?B?cW50Ly9hWEJxczYyeVllU2ttTVFQaGtoS1Zpc254TWF6QzI1bUZuVTBFcU9a?=
 =?utf-8?B?cGFkb1NrZlNRN25xdzErQWdtSk1Pdzc3OWt2VFhFZHVnZzF6WG5EeFEyMU9v?=
 =?utf-8?B?UjhtZ1JJMDBROXppSndjaVhtb3BGUkxaQWVFYjR3aW5TclE1ZExkdDY3OVA1?=
 =?utf-8?B?US9UcHdpalFUYmpNSFNzekphS2l6cGszUTRLSGQrVjY5b2tQTDZDazBxanoy?=
 =?utf-8?B?dUpJcDFrbmtNakVtOTVRQlBQdTNtdmZNRmFRWUk3UVkxY1VsNUlCb29rRFRZ?=
 =?utf-8?B?SHRDM01ZUmFndG1XNjN6RE9jZ2NUNkJmNnNxMHo1UWV1MTU3T2tZUFBEMVkv?=
 =?utf-8?B?MzZSNFBScUViRjNXYWV3c2VJMmJoSDZrZkpyUnQ4WlZZZjcrcFkyK2loVTF1?=
 =?utf-8?B?NWhqOFBDZnJtakxhUGp5Ny94RUpoekpUNnFaSnFnUVJkWHJ5RlR4S3d0L0ll?=
 =?utf-8?B?aXE2bGxpQ291MWloM3hCVzByaFZGTjBtdVFKQ3doUlVseDgwUFpWUS9NeUtD?=
 =?utf-8?B?ZktIbHhzYnZMWjdZS0hkd2JlWFFzNDJod1Noa0E3VGxjK2hYQW1DSkVYK1Fk?=
 =?utf-8?B?T0dOL0grU0t1a0hYWG1DVkhZTFNnemw0WUZsSi9aM21XSVk2ZTBnVHVxei9O?=
 =?utf-8?B?ZmNNd3VqdVYyQUtGekQ4R2tsRTE2TDNnK2xERE80S2tOa0FtMTlPaGxhNWp1?=
 =?utf-8?B?b2l5Q3JncTUxU3hoMFMyemw2bDhCNDFvUWRSVTZBMFBzYmdCR0JsOXB3MTNZ?=
 =?utf-8?B?OFp5OHpuUU04c0ZIblJzbjRjandYK3krUEZqVndqSmc1RGI1RVdZcUdNT3pl?=
 =?utf-8?B?YURtaUdZRDhGQnNZUnNlZC9kd21PeHk2T3hldnY4dXVUbUpvR2xTdzZ1SzZm?=
 =?utf-8?B?U1F3cDZ0Y0VQZTMwenh2OEZoVEN6Mjh6SmtLZktHamJONFdzNE5pRm9YMkox?=
 =?utf-8?B?RG9GL3MzL1VJK1MrNkJWakFqTWZIT2RSdGNnSUhoa3B1K1VDOGZQK2ZMS084?=
 =?utf-8?B?V0tKdUtrOTZTS3hvckQwYUdqcXN4MWFuRGxvRHl0bmZ0Vk9WTnpaT2FDMS95?=
 =?utf-8?B?ZWRRQVdRYlN4Ym9rblYzR3dtanViMGJxelpvNi9EQUhyTTZLSGdUMkRhdE05?=
 =?utf-8?B?Tk9xT2NNdmxIOUFKRk9LUmlENWg3aUhPZEV0a2hBV3lpbFBuTFZjT3dtNHRk?=
 =?utf-8?B?aHd1d1gvVU5oK2NPc2FoellRTjBpQjRtTHNDcGVSNHJRejNSUlF3ZmE3OXFQ?=
 =?utf-8?B?TGVsbXpTM0V3eFNKUFZkMHRVMlkySWNleWxNaVNHZDRjbnRMWDVTVHZWcFZS?=
 =?utf-8?B?QU9XK3FkMEFvYU0xZlg2aGtNamQxa2w2SGZLcGxnc2Z1V0t1L2JWV2xXZUtW?=
 =?utf-8?B?LzMrZjZDSlBNT2ZXR3dJMGhpQWRvb1FHbTVmRTF2UzNMTStaTU12bElDeE1M?=
 =?utf-8?B?OHd2dmVpS2VxbThVdVRKcUVqOHpXT2VSaEJVMFpJNUR5U2Q4YlJVRGdUZlhX?=
 =?utf-8?B?QnBvSjNhb1lQSzRCNFpwYUZURzA4d3BSZXhlSTRJQ3BkT2pPYlZQUTJyUzY1?=
 =?utf-8?B?VTZ5Y0RwRk1KYXNoRmJpVE1KSHIyckdRdEsvZFlkRm04NDRjciszYzFmSDBS?=
 =?utf-8?Q?369zzQebua8mOAds=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1bb74dd6-1c2f-404c-cf27-08da1269b0ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 16:23:57.7450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IhzgkDf3iZ6m8HyYubfH2zWZw//1CpltTqGY0ZrHg7nEXdF3BgvXf5qcFYVsqsLQomMnXYfZO1Bg2KhnUreszA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 16:24:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163789

Hi Richard,

Am 30.03.2022 um 13:51 schrieb Richard Purdie:
> On Wed, 2022-03-30 at 10:16 +0200, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a base package version (BPV) variable and use it as default for the
>> package version (PV) variable. The BPV variable contains the base
>> package version of the recipe read from the recipe filename.
>>
>> The base package version variable supports an expansion of the version
>> from the recipe filename without the need of an immediate variable
>> expansion:
>>      PV = "${BPV}+git${SRCPV}"
>>
>> It allows the inclusion of include files inside a recipe file with the
>> same version in the recipe and include filename even if the package
>> version is different to the base package version in the filename:
>>      require linux-yocto-${BPV}.inc
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>>   meta/conf/bitbake.conf | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 7705415a4f..d56cf811ba 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -232,7 +232,8 @@ ASSUME_PROVIDED = "\
>>   ##################################################################
>>   
>>   PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
>> -PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
>> +BPV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
>> +PV = "${BPV}"
>>   PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
>>   PE = ""
>>   PF = "${PN}-${EXTENDPE}${PV}-${PR}"
> 
> I'm not really seeing a compelling use case for what is a fairly core change,
> you've not really said why we need changes and what the big win is for users.

binutils_2.32.bb:
   require binutils-${PV}.inc
binutils-2.32.inc:
   PV = "2.32.0"
   CVE_VERSION = "2.32"

cdrtools-native_3.01.bb:
   PV = "3.01a31+really3.01"
   REALPV = "3.01"
   S = "${WORKDIR}/${BPN}-${REALPV}"

gcc-cross_8.3.bb:
   require recipes-devtools/gcc/gcc-${PV}.inc
gcc-8.3.inc:
   PV = "8.3.0"

gdk-pixbuf_2.38.0.bb:
   MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"

util-linux.inc:
   MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"

Does the binutils and gcc-cross trick works inside a bbappend? The other 
examples could benefit from a variable.

> I'm also quite worried that this behaves quite differently to BPN. "base" in the
> case of PN means strip off prefixes and suffixes yet here, BPV doesn't actually
> strip anything off PV, you're just expected to set it differently yourself as
> the user. The different usage semantics will likely confuse people and that
> confusion isn't worth it IMO.

BPV = "${@oe.utils.trim_version("${PV}", 3)}"

This would make it inline with the BPN but disallow the usage of the 
variable inside the PV itself.

Until now I don't know the oe.utils.trim_version function.

Regards
   Stefan

