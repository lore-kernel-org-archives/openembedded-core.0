Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E532210987A2
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 15:57:54 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16396.1774022266610666734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RjkHl94c;
 spf=pass (domain: cherry.de, ip: 40.107.162.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUvOWrYbrfMUosTFtaaFkR5yeWRU5rci3Ko83eIE1T9qatGmvy31EfkicxHZLqIbKZz4crXFWZa1x0kiifPNnnfliJ8A3TQvDcU1DiQyA+G4oBBD9dk7EblYahTIjMBZt84s3A+rAFRoCPzjAZS0iQZiCWIOdUGTmKoJ0fLqlH0PTcAQ9lrCnuduB6RhYOo5X/R3lhDb6mOpEmzeb6TTkR9ZtCOIcJ8eMAHPuDygkaNHDAEfpWMObbjh8Z5SZ2fnlbKvpJW7keq6VOKsI+Wwy9QzQiC1OYTBL6GqBODAlopll5UoMzu3qrdN0Cq/+LcIHRwAG5+KtihA4cy/hI3dkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9i09Nk5K/JMTenTc+NibNGZl75vZvqRvFf9MvEOmVA=;
 b=jgWYaUrqMzKECwD8j+2hTj33f42QaEI15/HKmYINOMqxL4Ni82nHCdxMhBuwGNLZ2XF2WOa2k0Bw+jzLyHlSbUbygZ+yETxl2PMVBBrMfVUbDAGWcEWPxTDhyos4C9FmDSTkdyVAJ9BIBvTLqpJ2gh7T4xMn53VQQ3eHbkxUKpNm7Wjp+yA8E7IMwuqdV0XwZ/EpjarWbewSJtDhkOKwnw6ezahPNbN1cvfQR20U9VvR3QuuoVLit+sfqR7rWC9pZnNuMzwiSbVeNJpXkWl0Br5MCAHOvxJyYTd45rPIk89+q6E8rAqbghAhTdz6fJNqY9av6sY9X/TJbhT+uliHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9i09Nk5K/JMTenTc+NibNGZl75vZvqRvFf9MvEOmVA=;
 b=RjkHl94c9FLujO2AkEefHw84kyOGITcz89WE/Rib6clzDtjdTQSBWHRBHs74C1en4EtWP7PsWPJHG47GN0XkFlzfnzwbEJaO0iF0oW8WBkojvcxlO5YOYo9xSS09HJ5OpOkbKDNtqcCLrAixYGBWYceHQ6rividyvyH6wtabWoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10146.eurprd04.prod.outlook.com (2603:10a6:800:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 15:57:26 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 15:57:33 +0000
Message-ID: <1a009ba8-4538-4dd5-a61e-5656852f56b0@cherry.de>
Date: Fri, 20 Mar 2026 16:57:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mesa: depend on mesa-tools-native for less expensive
 libclc dependency
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
 <20260206-mesa-tools-native-v1-7-166935b0e379@cherry.de>
 <yj4junqgkdaddl3upgyn7pzeqvlbr2q4a7zl6llrv2kzlbznlr@62bryfzytptx>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <yj4junqgkdaddl3upgyn7pzeqvlbr2q4a7zl6llrv2kzlbznlr@62bryfzytptx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0003.eurprd02.prod.outlook.com
 (2603:10a6:803:14::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10146:EE_
X-MS-Office365-Filtering-Correlation-Id: df65a015-c66c-4759-de68-08de869965df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Vp8g8vg9YXJqN90ilKgDSlsBb2v9TZemLeuPPe0rVZbNNsv4pUryC01eRR4fDJJFWKtu7nEuuL0FZnUiXTANdQKU+Zann3Es6d7sqOVdPLq0CX6B6oOcA+cDcKJhPVF82Q1BBsGf2Tl7W/63rXk1+iPBgrhWf1YMP6d7th6DdbF0IkgB3iZeAUwTWVZLJTxD0HNu3r2/xa/+X0L8OQ5ZvB7tZ4PTtjQVhLCFbiPSAfQZ1C6k0BqXKsZU1b3wsVJvicLxmpzQur+aN0uA8usD/rPKIPQxIdIoajmk2WqcWvDcW0/Q9bSl0bE4P1U+EKuKyXZLUX64yvLUZLrhNmo+VqsAI8a+lXeJmz+BzrwRh8SEx44scvi4o8qwhgBeL1cqA8qxDlc+UuIilrPrDytyNkNFiyeJWQow46CE0jwtNGw5udGnoOjDUBUEZc+oRCCjYFP1exnm6kr19pdqf01cH/WZuo6x/gzoUJ/qZ4MC/+qqxYcOjprYSZqcLmbfORynEN/xHu/G6tm+QSA+g1RtoLTyVh5vzVDHi7U3MuoclJjOTfmTa9oMnxdfw5nYLZFRf5qgfQaCp+YDSijkBwAAeGI/Llwtz0NmhmP7/cqC87KlK6OIm+HmFGZXAZ7hO7mjGGRvNaM7Exz5M3sEwm/uPBDeuJdwjv2Wbq1v87ZwselWaxkXxXyUm65Vrclrw6FYkjm7K0Wd5cBnFN56Kvzp2K0QHWtZm5usYRb1eAE0gpU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0dLRHpVbFl3MUxkVHpjQjdBYjlZRWttWmkvR2tjaTB6b1g4NHd2VHJMcnRo?=
 =?utf-8?B?a2hobUJNaCtBZ1g5NjVpdVRiUDQ0bTljMHcyWUMrdkY3bnpYclZCbGh4TUJq?=
 =?utf-8?B?ZWtDRE4reDQwb01pdFZ4Nkg0ZDl1UWpoMjBUV3RBRHhZL3Fxc2orNEduejJ4?=
 =?utf-8?B?VEY5S2FEeUhpcU5GZmRwUTkyWnVyRTJtRHp5bzZwdzF4S2VMNko2a1ZIRFlq?=
 =?utf-8?B?aVN2V0dLUTBub2FIZU9YdkhkU01pZE9SUHJYYXVrNXpDaHF2T1hXQU5oaGZv?=
 =?utf-8?B?Ymx2a2lSelBmK0o2T0JiWE1aTmJGdG1xRkY4NytZdXQ1WVoyWEJMSCtVdmE5?=
 =?utf-8?B?VzBtcmdncWJWb3RLSmlkSFBXNEw5SjNmY21VNkgxWXlOcE9kblQrb1F6bVk4?=
 =?utf-8?B?NHVsVzk3c1JYY3BQaXZUd2YwWFBQREpTM0NCakgxa0g0SzNCcSs4WVpOVVNG?=
 =?utf-8?B?VnNrMWtHZjIzdFFOb2JZZFlnUTVRblVuUk52SmNzWGMzRkp1SEROd1ltR3d5?=
 =?utf-8?B?eW1sNnVIR3pYR2JVVkVRQkdDRlZkTlcwQXlnWEwwYjdzS3VRVXQ1UEZOQi9Q?=
 =?utf-8?B?MFB0R1p6Mi9xK1pEaEFMSk9DZ09XK3pnT3o0QU83N2Zoa01XK2ZUNWtsVnR0?=
 =?utf-8?B?alk3MkdRWTQ2QWVlUWR0YXpYSlFwbFVwQTI5UHBWVmlBeno2VlcvcDc4SUJa?=
 =?utf-8?B?WXBjZjVaWVc2aUI3T2pXSHlueGgyQmlZbGk3V1R5Z2d1OU1meTNNTFAxTUpw?=
 =?utf-8?B?KzlZWW1PNTJmbHpyd0NUS3N2eU96VlZnYk5McnZwQ0EzNk9acDd2cE83b014?=
 =?utf-8?B?bCtiSzlzZEJCWmdNZkM0WUp3aDJHNUNmQ0FpZFhXWVZNOWQ1L3ZlTCtVbU5q?=
 =?utf-8?B?MWZyaU5UZ1V2S2I3Y29oNGFJejBTL0lCYlZvbmU1KzZPc0hCK3J1d2RXa2gx?=
 =?utf-8?B?UkoyMHp4VVJqNkFMM0U5bUdiN0lkRW5KN1VpQzBNYTdlSjZyTWtZK3U5bDVL?=
 =?utf-8?B?dkhDN0hZUE9RZXVWUy9tbnZka1JBOFJyZnVkWkVVdkhEVTVaN0tFQ0g4OC96?=
 =?utf-8?B?KzN3WkZCOTNWcTlPUFIvSUhKT3lrSzlXOWNzNHM1a1d0K0Z6dmxrL3ZGamJD?=
 =?utf-8?B?ZGFmNXd6cXU0VThaVER1YUh6amdEb0NJcDVJNmFyZWhmRTlLa29xNHRsWnkv?=
 =?utf-8?B?aVZRLy9nanRPVUNLUTVOMUtNZnJhK3FiY1EwcS9QU0RlODkvVGtrd0Y3VGRl?=
 =?utf-8?B?U3lvNzdxVDQyVDZmWjM1L2dBdktWNmh6Y1ExK3N4Q3AyZnpFTmF4UDRjRk9C?=
 =?utf-8?B?OU1iSzVBNWJ5RjlsbHgxcTZQNmtJM2FiSmJEWEFwWXFhUDIxdkZTaXNsUFlw?=
 =?utf-8?B?STZOY0lMRHB0T1p0emE0WXI3UUlyUE8yMnArMDdhSWcyZ040Tk0zN0tGeHhV?=
 =?utf-8?B?dFB2KzlMRENwelFTYzN0ck40ZWtMdUkzdTBWc2g4c2I3ZUU5ZEQ2MWgxZEUw?=
 =?utf-8?B?MXpEbXdCamtISnhMbEdFNTBoU2NieW9XaC9aZkluOGhHY002dVpBLzNmdjh2?=
 =?utf-8?B?Q2VjajlTU1hDV1VHcWhnT20yQjB1UEJ1OGlUWVdHVURTWDM2ZjVOUWhpaVl2?=
 =?utf-8?B?WDRockpXRkJoTzQ0eEhmZnpwUEVJQnk3RnJuUlAzL3FVU3dMUUpjbms0Smkr?=
 =?utf-8?B?enNrSVByTlVpam91TUtpS0k2WTJuaEk1YXc4R3paVEt3U0hLSmlKenpsR2pS?=
 =?utf-8?B?WE01aTF3NElqWExITllUN2JjMXQxWDd0Z2ZYS0UwazRwaFVPVzIycmtkMCsv?=
 =?utf-8?B?WWtFV0NpdnFPbTRNLzJRSmJ3djV3VWRQazFaQXNmM2lFL0kvbFdTWGMxM2Mw?=
 =?utf-8?B?QjNsU0xQOUlXUXFhZVdIak8rc0lHWW1yekNQckJLRWZ1RTRVbmxRTUtNVUNp?=
 =?utf-8?B?VWtWOSs0S0dXSHRqc29jVHdRQWwzc3Zqb0V1TzRpd1BOM3RKMmxsSVlaTC9W?=
 =?utf-8?B?Z0V2SVdMSEszMEN4Mzl0NFRteGkrUXBpSmZxb1RVdlRhSDJHYkVwK0VLWTZr?=
 =?utf-8?B?TGlvelhobWVzTTdOeVJDeStSVWxLaU0veXp6UUVoTDl1K1FMcVk2OW1zZllp?=
 =?utf-8?B?NURpV1JESmRyT2dWM2tSeFdJRnFSSFlpNityV1Y0MGVlRXJ6cTBuSVJKRUFa?=
 =?utf-8?B?eVN5UHMxTXNlR1ZjQTdicG9CWlhJOGpTWXphTXhwakFaL1RUWW1ucjU5SlhH?=
 =?utf-8?B?Tit1a2pWUWk4dkoxakVyc1gvTnJHNkVLWFZzQzlRdHNxaHlEUUxIT2pyaVlX?=
 =?utf-8?B?RXJuMm90YmlNdWtKL3ptYmFhek9sbmhMY0ZOTE9sNnFlRDF4M2FKQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: df65a015-c66c-4759-de68-08de869965df
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 15:57:33.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uOv3dEELqFPEvFc8frCgXDDyYzegGZgu3NnvB2EkzdSUPoziVaz/ZHjstyk1FK9HOLbW7nhgMYzZB099ECLw7EfTjgMrX4hV4F/ZiTkbVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 15:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233616

Hi Ernest,

On 3/20/26 4:26 PM, Ernest Van Hoecke wrote:
> Hi Quentin,
> 
> Recently our do_configure task of mesa started failing with the
> following error:
> 
> | Program pco_clc found: NO
> |
> | ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17: ERROR: Program 'pco_clc' not found or not executable
> |
> | A full log can be found at /var/home/vhe/build/tdxref/master-extint/build/tmp/work/aarch64-tdx-linux/mesa/26.0.1/build/meson-logs/meson-log.txt
> |
> | Last 10 lines of meson-log.txt:
> | int i;
> |
> | Cached compiler stdout:
> |
> | Cached compiler stderr:
> |
> | Compiler for C supports arguments -Werror=pointer-arith: YES (cached)
> | Program pco_clc found: NO
> |
> | ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17: ERROR: Program 'pco_clc' not found or not executable
> |
> | ERROR: meson setup failed
> | WARNING: /var/home/vhe/build/tdxref/master-extint/build/tmp/work/aarch64-tdx-linux/mesa/26.0.1/temp/run.do_configure.144042:173 exit 1 from 'exit 1'
> 
> Reverting this patch fixes the issue, but it does not seem to be the
> commit that introduced the problem. It only started later, presumably
> something changed in pulling in libclc or a similar issue.
> 
> I can bisect it more later but already wanted to ask if you or someone
> else had any ideas. Thanks!
> 

I suspect you need

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb 
b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 50d2f5cbb0..0fff6ef1dd 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -3,7 +3,7 @@ inherit_defer native

  SUMMARY += " (tools only)"

-PACKAGECONFIG = "tools asahi panfrost"
+PACKAGECONFIG = "tools asahi imagination panfrost"
  # llvm required for libclc
  PACKAGECONFIG += "gallium-llvm"
  # Doesn't compile without wayland-scanner if PLATFORMS has wayland in, 
and,

and possibly

diff --git a/meta/recipes-graphics/mesa/mesa.inc 
b/meta/recipes-graphics/mesa/mesa.inc
index 14dc7b6c51..44d3d17a52 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -137,7 +137,7 @@ VULKAN_DRIVERS .= 
"${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', 
',broadcom', '', d)}"
  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', 
',freedreno', '', d)}"
  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', 
',gfxstream', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', 
',imagination', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination 
libclc', ',imagination', '', d)}"
  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc 
gallium-llvm', ',intel', '', d)}"
  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel 
libclc', ',intel_hasvk', '', d)}"
  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost 
libclc', ',panfrost', '', d)}"


It would help if you could provide the PACKAGECONFIG you're using and 
ideally a minimal reproducer so we can look this up more in depth on our 
side.

Let us know how it goes.

Cheers,
QUentin

