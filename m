Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A9BCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:50:32 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22242.1792158625236640731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=gbFz5Gfq;
 spf=pass (domain: est.tech, ip: 52.101.83.59, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTN2jGlUmqxewCNlvfDjLctahrzR7IF/D1Ji3lModXxeSXDgXltzV1TNBIMzDcwMUjmiGmaKXA7ju2tWyEcNPZSQwCyMTZvx1lKR4L5kvgQ65GRQGmr/weXonjagv8nA2iwHcJttA5NKyyJN6ShmCfqpflBNqZ2lqTn4FNYs9GFw7gBADo72AsDR+LAPOHOhyJmGudXpEBJn0h2EOVpU3uf4HPuVMhRtnMnIyU9fxlTap3TcPZjaJAgYfO4Dk2NTwVOOfE9Wu87DHnW1a+A/Gx4vVYlTq1OYYHgFpvB141HJEsfVvo8842UAbCdzxUkYdZ1dPZ06jDmC5O56t607UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEs1EAQB44DnMgEHauxqCwM/y+cdmCmZpscSXc5n1G8=;
 b=iCM2P0n0wUYoB81feUxpa4KWvKMGqyM/YHs8VhAvkuwo4C55I579fTQchqqTZGKxbrIszfG7PzgDYedlJRulUfm4mafNyA/zB733hoAP/B2r1wtgneycZ+vNDX/T/mccDUh7PDLgOzHPcbtg/6/v47znjV2kjNcw+iydXq/tGUiWjIFPZcEOvF+UeDRFwBxG5mYMOtdZVFh1SypJwxa5597p9K4wFZuwSwRFzZ0OT9u7CW8T4+RIbT2HlBBGJb4mQApl+l0egO/+M1I04o/TUFAqAVnBIMm76BBPzxVIDNFcy7TDtPmc8VfvpAAYX8ZnTwpv2H1mZHhlZI1Vn5OvyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEs1EAQB44DnMgEHauxqCwM/y+cdmCmZpscSXc5n1G8=;
 b=gbFz5GfqY2YXVo+Wl7EdROJQPaaaTddpBL9831cxH0v5Kx9OsnXCQph2hNkRg6WMn7OKe+pzzXQdzDUzblcl7MumLYq2zfP/PangKbbTGstvD1oDMW7Fs159KwMiP7L2Zfl+1mXBjOVkYiaMbFTpJot7yvbQTOnykf4GKONcXeOSz9Dymfzs5FFXuopff8KCHFc5N3BfQ+ABJODF5J/xWpuk159+DJrW0em4OAVTd31w025FkD7LSeYE5Fr39ikXkR5d7EULrEjDD+d1ZfZeFv9eKtE0y6/8HLq9a8C+dTEk/3Z0xBEnanNVNJfadqM9DAxuasA9WgpZxb+1JEKD4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::21)
 by VI6PPF8447A40C5.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 13:50:18 +0000
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167]) by VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 13:50:18 +0000
Message-ID: <96469d21-db1e-47c2-a1f6-29d04a811ad3@est.tech>
Date: Fri, 16 Oct 2026 15:50:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3-flit-core: upgrade 3.12.0 -> 4.1.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261014153344.81727-1-jaipaul.cheernam@est.tech>
 <DM565EXJJ70B.2BI1H9TQXH6R5@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DM565EXJJ70B.2BI1H9TQXH6R5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::10) To VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:2cd::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P189MB3116:EE_|VI6PPF8447A40C5:EE_
X-MS-Office365-Filtering-Correlation-Id: d32b2814-4a32-42b9-4734-08df2b8c69b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|10067099003|18002099003|3023799007|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	E6vI6aVrZJM9fx1vVXYy0EHyum9WHF8LgQSuI88jsmje2m39KYgJV2IZGGR5FkL53k6BkfsFK4auj/DdfPO4ogFBCnLMiFK5hP7yGYhrFftfQfzsajjH6SmCulaQHvnavVlbIZ5G5uAPx6PEQtEAdYHmYZh1TZFt1qvT4z72x48pApCV3ad0gQtqKtI0dIlKoexFoJThEfXXDfGNTf1+afyzCJ6gSQOoKsGJzr+2S95pgWTOUOVWBnaUEIwrNBEW+Q2fuPqEmJ63LYfNfEfj04c9BPyls4dwQStthT2IG/UtcvO1+OY39lxVOXml5PO/UcWT7hUAacJmqFWocWi9S3JASfco7Wa69XrGT+qfsLjymunrmuK74nH0Q67cDhhIKUYZ3XZ8gowcPFHgCz0/hLwXxMCRyVOj7AhVYsOFf3ws28+4Be0gn3X1fRXPLLmEhlR0QSJ25/k03cfSK65lfywONArjaVWF8ImhMR5L7u4kYUJWLt/u71CwXVyXCzp97NzbC5Q5Q9oKLOOo7pizQhPTsTz3UQY5Grn2V2Vfx5r1SqbOOTRq6uXowIXT6e8JoW2/eStwLWBZnfsigD4hlZ6kqkN2Li/bZeIb8fIJlF0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P189MB3116.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(10067099003)(18002099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S05ybVpudDZrdVYzWUx2bDdTT0V2MWNvZURHU3FtSlVla21RdG5xclJlY2NG?=
 =?utf-8?B?Tm4wWG94WmRUOUZQaVltNk8xKys5L2ptTTVBL1AyenpRYlVMdk1sRERaY0NF?=
 =?utf-8?B?cEVwUFZnNUFESXpJSktid1BLU2RvVWxuYjMzWGtxNWpDT3l2a1hsdEdXaW1o?=
 =?utf-8?B?RXdmaitXVm5va3hpN0tlVkhpcGRqNnhmanRROENzNUhhWHJ2djR6Z1Ewdnpn?=
 =?utf-8?B?d1VMY2dyWE0zZUdzeUNVZ1VCNkF6NStFQVJibnF0TVh1UHY4alVxY1pzR0xS?=
 =?utf-8?B?WGxFTEp3TjlnWHM5MStmVlkxdk9VeU1OcjJpQ2M1Y2JTcVVZbHYzTk9EK2U4?=
 =?utf-8?B?d3JEKzgwdjErUUxHby83ZWsyWTVIMHNsdWxtQnpqUGt4UFZudkErd3J6L3A2?=
 =?utf-8?B?TG82SDdPaERDVXVBQVJQM0JmdllDd3pYTmJUSGRCbVhDMGF1NnAxMURLUEF4?=
 =?utf-8?B?RkFsMTl1R3NCNDNXMlRjSHR1ak50MFU2bGpsV0JnZzYxZXA3bEJUY3R3MVV6?=
 =?utf-8?B?aEhDSTY2WGdZS2daZXp0SG9xNkFmV2ErT3hBZUliaytIQUQ4eHhKZTUrK3U5?=
 =?utf-8?B?VklUKzBtR2tWdit5d0tOSmdZakR2NVlGcjViOGtsSnptalZmb20wc29RM29q?=
 =?utf-8?B?Z0t5L1dUbzJMK3NqT3hERG1FNndlVG1nN3BUUHk4UXliMVJTYy8zOG5EQmUr?=
 =?utf-8?B?MVFxem44UlNKNHJGVWluWW51UXlYMnFxbHFxK2F4bUNtcmNPVVRCV05JU1R2?=
 =?utf-8?B?OWNGbEhYSVBIV2NJbWkrb0RHOXUwZkxsbnpEWDdPdzFmZXp5ZnpyZG11akJq?=
 =?utf-8?B?ZmlHL2hEYmtvc0crTnBjTElET2ovRXVsTEFMdDhUbjFPY2xZemEzc1g3WENx?=
 =?utf-8?B?TFJlWHhYanlUMDlGWmMvSVoxUzhhY3Vkc3hHTkIxQjJ5MXRsbFRGUXZkZ21D?=
 =?utf-8?B?dXI5dy83aUNrMDNkRmg0RGp5UnZ6QVZWRk9uMWV6YXhKVXBuaUdpOXV1N2Q0?=
 =?utf-8?B?TXR5dHpKRjA3NUcrRUVqS2ViUExlaysyQjZNT0thL1hhVEhwZC94SEdGRjZv?=
 =?utf-8?B?L1hqSEpiK0YyTGlBc1djbjRPOVV0VzUyeVJ2ak1PZEZ1cmNTZXIyV0cyZ1Yv?=
 =?utf-8?B?dXNKMUFtMTVMd29mTWRQRkZQcTZUY3BZdVhyY3kzb1UvSG5FOXJuM1NMU0Fp?=
 =?utf-8?B?a0FWWG00a2R0Z21vVUdWMVhmWFhqK05SZkV6N015M1AzV1RXVmFRTUNGMnFF?=
 =?utf-8?B?TE9wSlhGRlBMekNXS1dlT1JkU3I1cDJMSGxrL283UkNYUkdjQnpGSkRGS0ti?=
 =?utf-8?B?ZURneStEQWphQVZLZGF4WlQzRmIrb3k4YS9YeXVtZnZ3dUFkL2QrUVdVc3BI?=
 =?utf-8?B?aHhkYVhkUGZiVU0wcnFuQVZvSnpXR0R0LzJPbHBaNVFUR3FmRys4bDY5Skk1?=
 =?utf-8?B?U2dPZDR4QUd1RnI0UC9QOUsrL1N2K1ZTQ2xlL3JUQTA3bGdVZ0V5RGw4QW9R?=
 =?utf-8?B?dDNndHkyVDVmMU13TXF4S2hFRlQ1TVdtd3djMUpqeWRUT1liMVhyT0F0ejla?=
 =?utf-8?B?eGM0V0FaOHZFUGhSM3FLYU9GVEt5b0w4UlhrSEFwY21VWTlkUk9OZ2h1OFQy?=
 =?utf-8?B?SElyaGw2bG5MT1o5SmIvcXNkNXY3bHJwdEV6andaR3hCeTE0QnFQc0JjaHFH?=
 =?utf-8?B?cEs5ZGxuc21hN08xaHdCTm5YT05Fa0p5dHJXZ0Y4c085RmdUakpXMWtqQ3Uy?=
 =?utf-8?B?ZlZDdWJSdU8xdzZ6WG54NWZ3TEMxc2U3eEcxZ3FnZWt3V2ZHVkRNd3BNRCtl?=
 =?utf-8?B?Yy8rM0l2UVFQdWx4MGF3RzJxNTlYS0plTi9lZWd6MG1aL2xGR2c0dkNqdUZC?=
 =?utf-8?B?YlVhdVp1Mis2SUFTVWJaTUlSTlF3YWpZckc2bDZuUk9XZFlIMU9ZOXM4bE91?=
 =?utf-8?B?UDFGRHlqZWVadzJsbHdTNHZISmw5bDc3NE5GVjUvZ2diOURVQkZrcFBnYW16?=
 =?utf-8?B?MG50VUNnZ2VSeDU1VXkzZnZXRTZSUlc5WEZRQmtEMjJBQklzY0xmR25sdDRM?=
 =?utf-8?B?QXVqcDBCM0FBbEJxbUpoRWl3c3RMNXNXWmc4S3plRGkyYWlScXk3cmJJeHJ1?=
 =?utf-8?B?L2VsMlh6czhjVVo1WlhZTkQwd00wVlE5dUFwKzJDb1RWQTRhQ1lpTHlwYXdx?=
 =?utf-8?B?WVR4dTVkb0E4NmFMczkxR0k1REQrSmZONWlqTFhCazh0OWNCejRsbitBWm5n?=
 =?utf-8?B?U3ZLUkIvRnAxblI3dk9WZWNKNDdoWDFZRGtXZHVPV0h3M0FINDhJWTZabDN2?=
 =?utf-8?B?eWN3OXRUVmRyUDRkemVDc2k4SVRMdGphUjNrbzNZU2VTR2dqNGt6Zz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d32b2814-4a32-42b9-4734-08df2b8c69b9
X-MS-Exchange-CrossTenant-AuthSource: VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:50:18.0077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztAdW+VVoYzf3M0rvvVAfLFc4HFwuawLkjkE3NiBBgl7AiLGxspMAjPpjeI9cMI6o2kpE7gtQSGj0mx8MgS+tWM4Mhnw5EndhZ5ELZbU8U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8447A40C5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248027


On 2026-10-15 07:39, Mathieu Dubois-Briand wrote:
> ERROR: python3-typing-extensions-native-4.16.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-typing-extensions-native/4.16.0/temp/run.do_compile.73236' failed with exit code 1
> ...
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-typing-extensions-native/4.16.0/recipe-sysroot-native/usr/bin/nativepython3):
> | 	flit_core<4,>=3.11
> | 		wanted: <4,>=3.11
> | 		found: 4.1.0
>
> ERROR: python3-pip-native-26.2.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-pip-native/26.2.1/temp/run.do_compile.83903' failed with exit code 1
> ...
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-pip-native/26.2.1/recipe-sysroot-native/usr/bin/nativepython3):
> | 	flit-core<4,>=3.11
> | 		wanted: <4,>=3.11
> | 		found: 4.1.0
>
> ERROR: python3-docutils-native-0.23-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-docutils-native/0.23/temp/run.do_compile.2356' failed with exit code 1
> ...
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-docutils-native/0.23/recipe-sysroot-native/usr/bin/nativepython3):
> | 	flit_core<4,>=3.11
> | 		wanted: <4,>=3.11
> | 		found: 4.1.0
>
> ERROR: python3-jinja2-native-3.1.6-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/temp/run.do_compile.22559' failed with exit code 1
> ...
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recipe-sysroot-native/usr/bin/nativepython3):
> | 	flit_core<4
> | 		wanted: <4
> | 		found: 4.1.0
>
> ERROR: python3-unittest-automake-output-0.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.4/temp/run.do_compile.3224' failed with exit code 1
> ...
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.4/recipe-sysroot-native/usr/bin/nativepython3):
> | 	flit_core<4,>=3.2
> | 		wanted: <4,>=3.2
> | 		found: 4.1.0
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4853
>
> Can you have a look at the issue?

Hi Mathieu,

I will keep this upgrade on hold as newer version of dependent packages 
are not available which can support python3-flit-core 4.1.0.

I will check again in next weeks .

Thanks !!

Regards,

Jaipaul


