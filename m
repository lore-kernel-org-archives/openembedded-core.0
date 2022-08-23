Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F32C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:25:31 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.57])
 by mx.groups.io with SMTP id smtpd.web08.30570.1661253924922889300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Ty0OW4oU;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.57,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzpRm9kptojJn3Ce3NGluq9P/XMA/HY/93sp9IaCAlenRr/E5ErXd3SwMoV3kvfxNJD9TQ8GTFqYEsq5zBswgwzfjToqt9wEyLrKHBA03ztrCGYSAeF8txL3P30COgSr74iFNebBL0WwoVL7B4aTXYOIBGLDSGEC47DWm0NxN3aYwYP9Jj0YYw+Wuvv9z9apYTQj5w43IKZamtAGdBOBtIcaniMLMFiM0pjDhIfXKMU5kFTibvydaTR36QM87hzFQWupw8h9lVFHfDEJF8CWqTlj9EhDE+06LREX7Klg+jOB7lGR+LJK7mrXlI92sQcLB87HL99SzND5LnNioLTdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGG9/4qe9W0gu/httiJClc5LHbODda72rF44o1qek3c=;
 b=SsXlnF5RC3jfoOJUwjTW8SQ+u5ANN8F/gAIVqNnvltKt5SU3igzgydTHtqjxXN6SaS3pIzH8l+N6B2UT2fPn7MmUTnDAZt1Kzx2KKDDiLLDsrF6xqrnLrMUpOaukA8u0u6qYEgnX9Xg67FXsXbOD4ZP/E9A/WO0y+q3jPB6/nN1jP6ipPHfjY2ILwkQ38XsLL+y2TmiC+nntCYNSGMqok4MvsBa60rbektWT2mOi2hhfD2mrvGruQH7IpaT72BAWhc9NcWeFUgw3iHmbv/pc+jIW5CI1PSDdnDsNQmpa5bedznkZzU8+FKxau+RWLoDZ/P08I0glg+xWag2GyGh6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGG9/4qe9W0gu/httiJClc5LHbODda72rF44o1qek3c=;
 b=Ty0OW4oUkNVfICHRo8nZg5PCyxTqrkFsbuvPNYv/ACO/kJnUcgJqrLz+Jc43Cc6xP3tbvpfHCxXtA/eNk9OiMqbNeqZqCjjtPMfkdO09yUgrm4jZOspv9LqPro2eK/99SKSDRGylspvervylmRrzGY3Elly+qu9tfY45O1nLHj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Tue, 23 Aug
 2022 11:25:21 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 11:25:21 +0000
Message-ID: <d6b2c431-88ff-27b6-1b64-f857b6d7e146@theobroma-systems.com>
Date: Tue, 23 Aug 2022 13:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH] configure.ac: Improve check for magic
Content-Language: en-US
To: Mateusz Marciniec <mateuszmar2@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
References: <20220823110239.667405-1-mateuszmar2@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220823110239.667405-1-mateuszmar2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0027.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::37) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29f80109-f45e-48b4-d4cd-08da84fa2a95
X-MS-TrafficTypeDiagnostic: AS8PR04MB8708:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fv/ShIsFYxNprZ3TYN5xR8T7pHnvOEZwd/r98xIX1kl0NwVtKvX+pSt89/fERm8BH4W9YkldfKQMM//koI75jm2TYy8d4nWf+Hc/0G9RXAM/ZVZgZ/WB2oYLc8jc+WAEG4a15B+uu57IiyFY3gYIjVos80irMq3QksMH5mEXKGlIumC4hwnhR5axqG/p+x8V8mg90NKHzROzNe8vqvp6trwv9lCZDeNPgrpp+fig6aijvBryk6Q8c9n6aa4ROOTlhIEvFj8oz5HUgypnaS+ltId+as5S2tpjjCZX5+sV9zqr/wAkcYYkzFP2VjbQzOyjCvmi/3IKnRe1G5XDRVCsPnU/OQmFUacPIY6G8xXrWngkSGlzO25wlRY2PSdmT6Rkx5a20u0RCon/JgucMbBAnjml8XHjLPGiNuFxZe9TQmwsiaUwp2UaV5FpuZp3hARDvcmTo1zLHNB3RZPMaxp4j7tKs5FxPt9XFSK+0RTGBHnvJMc0W0k9dH7rQXFG3MOXg9rYfXNMoLJqU0iproh9dRE+/TT110HMY7Ldwxey7gfWUEzczuswsj49HtfW+33/1xgIeXeVwaB1UmkJq1c/uBHrWgzGj+4tWtds5iqoBbZkfwcp/ftd7fZQhT10+tKs8hjUz7CbWbAlLqHXi+gH+jqPI1dKeIjcg4GZbehOtJTgL/bHHXDooVcprVaWJUrchfHRhX/pDZbKKmbkvkiMlQ8db6zoqNmZu1FPNb8w0xSFwKcEDMGDi8TI8toIDGUfOS91F42WlGLep3UexxmopGPneuPjoFtCthKcUCMsc+F6OdfnQoX5LpCNcKcYbgwJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39840400004)(136003)(366004)(396003)(31686004)(38100700002)(36756003)(316002)(8936002)(186003)(4326008)(6512007)(8676002)(53546011)(5660300002)(26005)(44832011)(2616005)(41300700001)(86362001)(2906002)(66556008)(31696002)(66476007)(6506007)(66946007)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aE5BZGRlVEF0TGRHNEdOeGczeXdYeDE0WVNnZC9peEE0aVp2ZmQ0RWdXa1NG?=
 =?utf-8?B?OGtNSU9Bb1JFRURGK25yQ1hJV0RDSWV4bG94ZE1DTUdoc0xRQThiNmhqWFdY?=
 =?utf-8?B?Q0t5K0poN1I2cDN5S09Cd1hROWxjSHl6T3JBYjVsVGV6cW1JbDBybUlwNFh3?=
 =?utf-8?B?azlYMUhTWW9PNzc0TnZQMSt4T1FmZG9pdnFNUnUyM1JMOUxsWEU3RnFRaFY5?=
 =?utf-8?B?OFpNUExaTmdBOW9DNVlRS296bEtpREZpd3BuV3YrKzBnWldLNHB0Z0ZYdmxp?=
 =?utf-8?B?UjZSTXJsTHNmTVlPemZxejhCbjA0bFMrbFdqaHlDTXZGSldOZXJQZ05BOTlu?=
 =?utf-8?B?UXV0eThvN09aWGFOcU4rSFNMTTdSUk4wbzAzeDNCY2QzcWc2bGJOZEZQbzN5?=
 =?utf-8?B?Q0xwZFQ5dVFKZ2VUcUhXcHdSTGZWNmRlRmFERmh4ZXVsZUptTkFmdDQ5YjF3?=
 =?utf-8?B?MHhvV2JDS1FaMld5dUtTSHR5dkp1azBnTkZicGRtMzNpM2FJVXpXOWd1K3Vy?=
 =?utf-8?B?NGwySU9OK1BQSXp2VW9BdEloc0Z3SUdkWnV4NHJMNUhpb3Y3MlZLaFNabUps?=
 =?utf-8?B?ZHpZcFR0R0FNTmZCcXJscjJKMGpuM2NVZ3A5YmtIbHl2cU1Bb0E1bEJsZktk?=
 =?utf-8?B?N2hQZEJmSVR3cG93c3J5bk5tejBGam1QWFAvVzZXdDZOQytxczhnMFNJTWRY?=
 =?utf-8?B?ZVo4R1RJS1lBbHcwK1JCb1dsMFQ2V282ZXMxQXNQOVQyOTlEYVcrZm80c2lY?=
 =?utf-8?B?bU1NcnY3bVZGZkludWVvVmd6VnhJb2Izb29zMzlFL1M3YW5lbDRnc216QVd6?=
 =?utf-8?B?N0xTRlhuWDh1R3A0dDQrWFQyWHU5QnlCZENvMXZvQlN3Zy91dnJnN09hVnpp?=
 =?utf-8?B?VDJWdEZWWC80U0VUd1lzdVpka0U4NnFYbTlGaHBGcGtsZEdUQ0FKRWIzYzVR?=
 =?utf-8?B?UnE4TVhTanVuclFNYlZzUEYrZE9CN1R1RTRLTUJxZjZrZlVtNjJTOU45SHds?=
 =?utf-8?B?K2hETk5qN1g3aGJDaTZIUWFGRzh0SWZRVm5jaThQSWlLV2lRTysvT0xpV210?=
 =?utf-8?B?aythelpZbG5MTTltMlZaNjZzWDN0d1NraWxrUWUvMDlGZUVVMm9TR2ZDWmNJ?=
 =?utf-8?B?S3VJNlVNN1p4ZnB0ZXI4ZWlRSlc5NDFHZzdSa1ZVZ2VWVExBb1VpNEFYamJx?=
 =?utf-8?B?cnN0VUxEVXNPN29ZeXdwTjFYUFdhU3JvVmZyZUtwNC91S0hncUM3aStIVFE2?=
 =?utf-8?B?TFVJKzZFODUzZ0Njcm8vSncvQTJ5Kzg5YkMwaFBBTm5xeE00WlJZRlBPQWhS?=
 =?utf-8?B?Z3doT1F3UzNSUWdoWk42dm11OExnVGQvOUxXajduU1hYK3o4b3hIc0w3Sm9R?=
 =?utf-8?B?dnFObVFXdmx3eHhWVTV3b1l0aHEvSktIUkpYU3V2TDhQL1o3YnlhRW5IMXlF?=
 =?utf-8?B?T2FpelRPWXhKZHNqS2tQbW1meWRJMEVVQkNpVXYzbmZGWG01VlJ1akswMlY3?=
 =?utf-8?B?d2tiVVJZbytOQlFxbDFoUk92VUduNEZhL2VHWG94VFNQcTFGZTZjd0oxbTR6?=
 =?utf-8?B?MExTeXRTVTlyNWs0bU00TWpiT0pwWjRxeVFrTEk2UVcyRURSOGVpRmtRT2Fz?=
 =?utf-8?B?WUZwY1Z3ckJ1WXBuRXQ5MlRZOGZJVi9HbUhNY1JJYVk4WUxzNUhHYXhIQVpB?=
 =?utf-8?B?VEc0OFd6clJtVGIydjhmNk42dW14a0FSbnRFQ250dVdlM2llN2UzQVNCNk9I?=
 =?utf-8?B?RWVBUC9CTjFQdTFGaHVNM0xldFAwYW9sdFY5ajZia0V0RFlEQkFIL2ZCU1VG?=
 =?utf-8?B?ZTQyMGNEOE4xRzltSjFGclpEYjFBNld6UHZ2cWlLalVLQ01QSVJEOGJjaEFU?=
 =?utf-8?B?QkdBYlFUTE0rTE1ZZThaLzhPOU8wcnpNVUxaTk8rRllXNURCYjVudEVteWU4?=
 =?utf-8?B?Mys5OXpuYmZWd2x1SWN0TDRXbXRCTVZaYmtiQldnZkNJR0FXOXZxb1JQdU8y?=
 =?utf-8?B?bk1taG5ZOVcrTXUzdkdLRmN4R1kwVkx5ZXRiTTdBTW56YTRneE5PR1Z4cml6?=
 =?utf-8?B?SHJta1FoN2gydmhzYjV1VXhiV0w2Q2dxL1gzdG5IRmxFTCtRQ2lTd1FFcFBG?=
 =?utf-8?B?YWhhdjU0RERpRFhKZ3dnaUpJNVZjK295cVZVcFRSYUp3aldrM1lSdlpRcXFx?=
 =?utf-8?Q?/aoSlVOWctEutBVRhi6HSpM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 29f80109-f45e-48b4-d4cd-08da84fa2a95
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:25:21.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4Ghq1SB2Sjb0bf9uckqaC9ElrbmVM9V6wNqkWTuZDMF02tT7X6/8LS2zIV0HIirORiePz68XDnUZI7hQypI2NxPfRRSL8g05Dok9xWx0tkiFZ2nFwCykCEkNRVXbka4A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8708
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 11:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169703

Hi Mateusz,

Your commit title should have the recipe this applies to:

util-linux: Improve check for magic in configure.ac

for example.
On 8/23/22 13:02, Mateusz Marciniec wrote:
> Check whether magic.h header exists before defining HAVE_MAGIC.
> 
> Despite library availability there still can be missing header.
> Current test doesn't cover that possibility which will lead compilation
> to fail in case of separate sysroot.
> 
> Upstream-Status: Accepted [expected in next release after 2.38.1]
> 
> Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>   meta/recipes-core/util-linux/util-linux.inc   |  1 +
>   ...configure.ac-Improve-check-for-magic.patch | 39 +++++++++++++++++++
>   2 files changed, 40 insertions(+)
>   create mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 416550a6b2..3868b1c41d 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -36,6 +36,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>              file://display_testname_for_subtest.patch \
>              file://avoid_parallel_tests.patch \
>              file://0001-check-for-sys-pidfd.h.patch \
> +           file://0001-configure.ac-Improve-check-for-magic.patch \
>              "
>   
>   SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
> new file mode 100644
> index 0000000000..0748e4cfb5
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
> @@ -0,0 +1,39 @@
> +From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
> +From: Mateusz Marciniec <mateuszmar2@gmail.com>
> +Date: Fri, 19 Aug 2022 14:47:49 +0200
> +Subject: [PATCH] configure.ac: Improve check for magic
> +
> +Check whether magic.h header exists before defining HAVE_MAGIC.
> +
> +Despite library availability there still can be missing header.
> +Current test doesn't cover that possibility which will lead compilation
> +to fail in case of separate sysroot.
> +
> +Upstream-Status: Accepted [expected in next release after 2.38.1]
> +

This is a backport I would say, please use:
Upstream-Status: Backport 
[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]

I assume the Accepted status would be for projects not using software 
version control (e.g. svn, git) where it's difficult to extract a simple 
patch. What comes to mind is ncurses project for example.

Not a biggie, but having at least the link would be very nice though :)

Cheers,
Quentin

