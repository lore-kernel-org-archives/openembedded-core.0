Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E29C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:39:06 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.96])
 by mx.groups.io with SMTP id smtpd.web09.7860.1642171145137639890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 06:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=YWycqKu0;
 spf=pass (domain: sancloud.com, ip: 40.107.10.96,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LY15PZyCjlyKQ3aQdlfm7bOYQcsdgIoXE+Jk4iLkCJgwKWRorJd1KV89igKWwJ+z7nz1mvO+98pUbsEsdY0xN41FfAiyV7CoDKt/twzg77H2xMDkfGD7afxCwRZWWn+1dft6itXciyVEC3v8ByOBLDjg/ucKYb6Zw5ioUbBuzSPeA3I9FRtigxYNdl9HTzKpbW1kZOuMa9UmMGuD1e4BLcf/abvZJN+FfIFDYGZGDHANrBTw8Zv+DQylYARUJsjnqSBlg+2qftEDC/RUL37rNh32hvNoVnyu4+bTW9FVyoKyeM2SCtad1/AM9kZpJL67SrMP6/bZX4x/kSk1xnhssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE7EuuH3d05z2zznrrwjhtilOQpmeP60D4KcQAPgKBk=;
 b=hTaMOZPEq8oRelr+zQYMFtO7EYMRYPR8PQbBK25tNfkfUQpZYX1bXmoOxF7LFw+aZmoEAHguCwfRaNtCHbtx3LvtN/7PE4KKNWMeECRI9UG7q4CWjUqXoD1qLjHKP9Qika0B6gVVVRQL0IMx5Vu/ruth3f7BxXmlytTGGOxMSRsedNgcpz0P7qK4GhJJqXqgnunco7ZzsC/e2dqk/TgoUKft3quMk3QXG+ku+vHUWu9b66xkEnUpHob8eNxFO+dvKx8TpI3sq32YmisAbW9VkycSBQwJ0uO2E2xUE8mXS9sbbHMGrpfuhFijOUVLFGamCss6Hawj/gssfMTi3QLQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE7EuuH3d05z2zznrrwjhtilOQpmeP60D4KcQAPgKBk=;
 b=YWycqKu06Ohc6UxPA9/VAG4lHlEJ4nGim4tiWHoFMRiq69xftghiQTzJ4rRxPCl7TdOOq3rdrzBWOMy0zggKGoF7lMcZOE3mF8jfVZZSFhwB/yhBdTMAcWzhH+3TUxDj8KGA+9tJF9bdMEOVWJgb0yLIho7MU55C2fsnr+lNuek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB4339.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 14:39:02 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::4ce0:d9e3:cb2f:7992]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::4ce0:d9e3:cb2f:7992%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 14:39:01 +0000
Message-ID: <87262ad4-ba0b-3d22-deab-ffff56ca1b84@sancloud.com>
Date: Fri, 14 Jan 2022 14:39:00 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211014202630.2927426-1-richard.purdie@linuxfoundation.org>
From: Paul Barker <paul.barker@sancloud.com>
Subject: Re: [PATCH 1/2] kernel: Rework kernel make flag to variable mappings
In-Reply-To: <20211014202630.2927426-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 801090bf-0e5e-4655-8bb3-08d9d76b9b5e
X-MS-TrafficTypeDiagnostic: CWLP123MB4339:EE_
X-Microsoft-Antispam-PRVS: 
	<CWLP123MB43397A378B7F1042758D900493549@CWLP123MB4339.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nsgaXkOL9EQjRN26w/thj2TLwbO+KC5yrGP17xcS/uL7640xGbAtg1uuTTblJg+j6eSDqAOlyWe5XEUOJWkwuDaqdkDxvz2BR0xo1OFSMwLjzVfhhzvptzEOmFsBeyhdkggtOSwAsMPBpUgJRzomLzQoOXFXodc1iLbE6+GG/7+HPKa9PpMa5GD46M5cq92FXjjt1AbqY5LXbmAbL1uchzcY4CJHNjp8SjGtfw+f0nbvuBqJ84ZSBmYcFPwrhZyGQ4hbUqL+Jf3ioFdIbiDtoVYKE7Ovno4Z0+Exh7ZsAWd5jNuJAPyxdGD5C1Yesse0DPS3o40921tpFv3Nj+9PNxLO0kej95XJIROOMSQts/urUXsrJr7KxxOEadj3N6TOOJ7Os+MiQjxsCr/yXtgMhA1bdQb9FU4QNJz4tZZeQYzZmGiqZtJ5pKqjY9YIatcgk9GHuPl7qAQMrk0gc6hOVUR9kf6lu+z9kLqp+vdN7yJ+51MvVNQUrVJtNnjqDhgXzYXKyMqxCRbL/bdAUkhc175QRoJLUktSz3viDpXBVY9nLfBGTKXMnOQisOteQW4dWNKZWfqTwcL9JZTeEgCZNykvyiM6goaHtjh9VnXxplZzlUpAdU739D7gMAIvDZE9oye14cHtJSsfnbisnnHC1xl9SZjXL3cWr3SorvnRmx5NMR7DsYYoR3Q+P7KraoMQZctCMCSS+AoQE0y2faHXC1NyD7tNKiUSs+aYxYnDx5n6OZIcFMWmBGw9DHdwN0J4dM3pELLvmSh6uC+yypJrARQ2B642pcNOYozXdi76gg5qT0ABgxX1N/GTYow0BYpKeZaQ6aGCvTRzS3bLPn9g6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(376002)(346002)(39830400003)(2616005)(316002)(44832011)(31686004)(508600001)(83380400001)(66476007)(6506007)(36756003)(53546011)(966005)(38100700002)(38350700002)(26005)(66946007)(8676002)(2906002)(31696002)(6486002)(6512007)(5660300002)(8936002)(52116002)(66556008)(186003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ODJReGg3RzVPaHpqOUVOekxnd2thQWg4WWlEWXJJL0piSW90NG1kemc3eW4r?=
 =?utf-8?B?K2JCWVZYSUI4SWZ4bWdGZm5lMnNzeWFSOUFiZzRkd1FOd1JBM296OTI1ZzNj?=
 =?utf-8?B?VUt6K1ljeWFDaWNydkZ3eHcya3JvQnovcmVtQllvSGttaWJ5ejFUQTFPRnFD?=
 =?utf-8?B?MWlGQWZ5Y1plQ24zMkk0d1RlZUdnTi94T0F0Rnl5RUF2SzMwWVkwUllkWERk?=
 =?utf-8?B?WGIyVXBMVDRPSEVQK2NBdDZ1UGVoWDdrNHNQY3ArU3NUNXVvTHF4SjBOUWtu?=
 =?utf-8?B?L2srSloyWUR4bmhtaEVjN09teEplTUcxUHFNZkVEa0dCMjV0UVhYMytSa0cr?=
 =?utf-8?B?eXVxYWlhenVxSFlqMjltdEZ1MUNGcFU5YTNjU3JtaG9ZZnFWRUVMUFp0TUw0?=
 =?utf-8?B?OHYzbm82VTlWVXFLYUZxZkhyYmR4SWI0N2lreDYzS1J3RVJOZmdoRWIwUmpv?=
 =?utf-8?B?RFVzUXRkSTFiRXFPdVR6YmFTMEpiVEVybXIzU2lXVDZZQzVyTXQya0Z5bi9M?=
 =?utf-8?B?c244K3JoT3ZWNW4zRXk2bGl3bDIvMDhVVTQ0dk5KRDRFa2JJbjNEYkdaeERS?=
 =?utf-8?B?dmZKZTM2czFiYUxlejVUQlhqVElWR1lNanExY2JTNlhhazBmcVg3eDNDZmNP?=
 =?utf-8?B?TVd1VmRnS2ZlOGhhR1Y4N0h0M3NvRkZyWE5SdUxJY0M2VWcvc0FWR2Z4NGtW?=
 =?utf-8?B?RFgrYWpWSklXak4yYnl6RnNjVDNsdGV2M1IxRE42eVpyekREdmFKbTBYWG1D?=
 =?utf-8?B?T0dIZExLRjdQdjNkdStxQzlHZjJteGJ6OUdST3VPemdyVitnL1BrZ0ROWGY4?=
 =?utf-8?B?L0J4NjJYQ2RhWnVRYUNFd3hTZnRSQ3JYUTdpcnZQb2hBYW50Qlk2S0lBOXph?=
 =?utf-8?B?Q3JZWkYvb0N2S1owWnZzM0pMRjRYQmMvR1JIZWljQ2VCNnNIaDhMclVrM1Rq?=
 =?utf-8?B?bjJlakxUWlNJQ2hvNVdVUE5DZlpyZTRoSStzWWxtd3dtS2pveGhMMWRlMWJN?=
 =?utf-8?B?TjVsQS96LzEvcGczV0tHRWhveTU3YlBVdWZHZEtVT24xd1A5azFZeGRvMUhs?=
 =?utf-8?B?SVMyelgvUmhDdGF4N05yR3JyN25rU3JCQU1iZDArL0VVcEsvOTJaR2xvdC82?=
 =?utf-8?B?TXQ2d0Jramw1K3RNSmI5M3Y4MytIZm1CNG9YZ2F3OUQ4MjhEb0NNbEtaeEZX?=
 =?utf-8?B?VGw4SFFSbmZaeVlkalNIb1FWZmMvM1ZGMjNNMHR5dXhyWUNWQ1N1VWNBQzh1?=
 =?utf-8?B?WFB1aXhzeE1FQ2IrbHJxVUczWE1mbDI0Z0xwM3FHN1M5SWdzekFzRVZCdHlG?=
 =?utf-8?B?dnpuWnROY3dCOTluZDdjYmIzOXlCQ2gwZUNnUkNhMDlNNDB1eE8wYzVQaWVU?=
 =?utf-8?B?SVJaSzZvbjNFaDZ3VkhMT0FDY0hSemQ5eE5vK2NMM1YyL25FRVdaNlFEVGdG?=
 =?utf-8?B?am8rVGZFNzVPR05jRzI3MjMzK2lGSW5JSDVpRG9qWXc1YVgydmxQOXRlSEpC?=
 =?utf-8?B?cThPKzJPNGx0K3JoRU9DdkRzNy9DL04xTk56c1NKaHhFbjlOR1JJcHJYak9D?=
 =?utf-8?B?OEJkVEVjdWV1QVdlYUZuYVEzdUVzY29qazNpQkVoNjdTWndrR3VzbEJxMWl0?=
 =?utf-8?B?QXJxbm9jaTgreUpjRUx4UittbEc0R3Q1U3FZWXJmNnFvbGVDa0JHNTFXcjZX?=
 =?utf-8?B?cTFYOXlnYTBYSjQ4UWxnUTFTSDE3ZWtqdzhab0xDdDZ0R3JDVEV3c1VMbUMr?=
 =?utf-8?B?MjRiQlRhdm1lcG1DSEMwckNCMXpmM2R2YkE5UWtpTGRTN2tQaVo3dHlKY0Jh?=
 =?utf-8?B?RjcxbFFEcDJFd09LOGU3NVMzTEVRR29aOUY2TFA0WVB6NGRTWFJSVWU0ejV0?=
 =?utf-8?B?OHNNVTZ2OTgvU2JGZzNsZ0R5dTNnNzFRdktpRUsrZkFmUlFEcXoyaXgyMkxY?=
 =?utf-8?B?Rnh4UzFvV3hhMHBUNlZOSFh4UCtlQnhrMGJSbks2RHgzbjZXbkJ2ai85K3lE?=
 =?utf-8?B?T1J3cDhkUnhUYmxhbXcrdjE3ZXk0V1VyMDluM3J4YS81dnRWaGhXY0Q2VU1s?=
 =?utf-8?B?N1d4eGFHVXV2a1JOUUxRd05sMlJuM0F2NEFGeVBER2NzeXYxa1FHUzFNR3JU?=
 =?utf-8?B?OEdTM25zZWVWK0JwcDhLM1YrcWJndTU5MlVDZW1zVEU0ZFdwQXJVbUhSZ3g0?=
 =?utf-8?B?M1Z5SldBdWIxVVVhcy9NT1dDVERGMjk2WUsrU2ttWlAwTzNydkQ1Vlo0VFA1?=
 =?utf-8?B?aVVhZDFQK09qM2xFbEl5QjNUT1RnPT0=?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 801090bf-0e5e-4655-8bb3-08d9d76b9b5e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 14:39:01.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 byTbXPKs/Kc/SfA9H0ur7RGbETof63zvYbfNmhGVQtwGbNyQ2eQbOFjU+drHGys0eh9liqzSzEGv4hN0GxtVAtcoZM1LR+aIc+ivjLmXncA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB4339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 14:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160569

On 14/10/2021 21:26, Richard Purdie wrote:
> In 2017 we added changes to pass the BUILD_CFLAGS into the kernel
> via BUILD_CC. This isn't really correct and the upstream kernel now has
> places to pass build cflags, ldflags and more. Update our kernel
> make flags to correctly use the kernel's variables. This addresses
> concerns raised by kernel developers.
> 
> If this breaks some usecase please report it so we can work out how
> to fix it properly.

FYI, this change back in Oct broke the build for Linux 5.10.y, 5.4.y, 
4.19.y & 4.4.y kernels where CONFIG_UNWINDER_ORC=y (which is set by the 
in-tree defconfig for x86-64). The build failures sat on my backburner 
for a long time due to other commitments but I finally tracked them down 
to this commit and looked for solutions.

For 5.10.y, 5.4.y & 4.19.y there is an upstream kernel patch which can 
be backported which will address this. See 
https://lore.kernel.org/stable/04598430-7383-b725-2f5f-3f2b16aaca36@sancloud.com/ 
and replies for more info. Hopefully these branches will be fixed with 
the next round of stable kernel releases now the backport has been 
requested.

For 4.14.y there is no trivial fix upstream. The backport I did for the 
other branches depends on the KBUILD_HOSTLDFLAGS variable being set in 
the kernel Makefile which was added after 4.14.y. Personally, I'm happy 
to leave 4.14.y broken in this case and workaround the issue in 
meta-linux-mainline by disabling CONFIG_UNWINDER_ORC for this series.

I don't think any changes are needed in oe-core, the info is now here in 
case it affects others though.

Thanks,

-- 
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.co.uk/

