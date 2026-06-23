Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58868CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 14:22:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22147.1782224574612487233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 07:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iLSwvpaz;
 spf=pass (domain: cherry.de, ip: 52.101.83.41, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXLwBlLNbiTt+autFxyc1Qlv0q5sWt3SKXwu/jGmCdsZRK89rLsSciIttnyyY31EyB8GIlfuz/lGWmpqpztDn4Uek8zUz2F2lSp0zh3aL7ASoNOZUE3ocCYrblRUUGTO33kYFB6mfzZgB1UpILH444i/YGZDqPNuXmV8DNWC3j1mEKrjs6hvsrjNeYZM2ueOE7AnY6vtrfI1KeFTqPJE7fh7F91DnRzeHNOOaXdOsvVEgMphBDEUGjAr784eb+tYtUOqRFzD3nOE1X8uZPc2OQGnwxXvqWOxYkgEya6EQCC91lB0z8Ket0ufxzGVig2Z+IuidXw/TPeglB2aArLtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qEjT1HwsHEpcwwCFZbuS9kNOqecycVZWiZEeOHnfhs=;
 b=V0dxDjJ+GShN620z/vCWP0BPS0bkK3F8rVE1Kd072ug+otL6gJakdfzcrUs5fZmOvi+DAUQkeVTZQZAmheGYGXQEl2viY55L62kzCDookzEL4OtKnpjOVN7XygTdXLZKJrwEr20F5AY4RADQo80CNR6QCcZI+bZfr1EWwchXmOmocfBzO121aNeeM13AJRq3xjMLbDtvCMo/HVLdtqTtv6QcgLZHfX9Cr3OPwuUpoP/NP6vEn/0rc20hmQoWJcG3vaCdUUE+bvUboAqBHKONUClnr/I7DNSYOvC/LxjSNTvhgTLmp8PmKlaZ9e2/FLIWSnmRSw0/ZXx2E8lPkEWeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qEjT1HwsHEpcwwCFZbuS9kNOqecycVZWiZEeOHnfhs=;
 b=iLSwvpazOqdf/ee126dKEvgoImLmbEysQkCDQuu3dvZNdw0vEAeLw+OkltZf/p+gZXS9wnAzYMDxbg65v1kEvHmRXZsc/cdxY4wBySzjud+XFC3xRnuTsHYy2E4OFX2zD6c1wdagjKU0jj024jL/AxhBO/YVA3cYgJW4xFFYfq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI1PR04MB7008.eurprd04.prod.outlook.com (2603:10a6:803:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 14:22:49 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 14:22:48 +0000
Message-ID: <3ab79332-a44a-4408-99d1-c884f5b40313@cherry.de>
Date: Tue, 23 Jun 2026 16:22:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: fix INSANE_SKIP package name for mesa-gl
 builds
To: mathieu.dubois-briand@bootlin.com, antoine.gouby@gmail.com,
 openembedded-core@lists.openembedded.org
Cc: Antoine Gouby <antoine.gouby@toradex.com>
References: <20260623-mesa-fix-insane-skip-v1-1-97856536ea8b@toradex.com>
 <DJGHNTGT2MED.PW12J0XM4EPW@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DJGHNTGT2MED.PW12J0XM4EPW@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA3PEPF00000519.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::672) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI1PR04MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: cf59e160-a5b3-432d-0e97-08ded132e705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|4133799003|22082099003|18002099003|11063799006|5023799004|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	PrT3ui+xThXgcmCiSim3pr5TnFCc0ULZ9/XVqpQcOLTCaqkbD1P28UQUfH4tbWAjhIh1WDfcjc+xQmbpk44ea0FWh0Krb+dQFFfyqa2umjfLElDhIyn1is/j9d3cbETNdJcLaTP4hu3WLLFc+DLUQhNE2ex+Sq/FghmamOQ41yRtyvH5dqivSyAQPcPea5oNyjhoLVO4y5c+AW7uR5xpd0UBANkNJ2+o2Jx1dzbIvi2D4KFUy4++Gv6XQvEHq+ME8KA9eolDLWhbvfnQ5DKL2xoJNI61zM21KFFFFCIZ+/nkzA8NOklbrMCZme1Q7oMpP+TYQibIaqNur6f0XNN8ehy/EJe3GIhk+PHo0w5oUjxDroQFXeZVGohVAvT4RGQUDk3YkQPX6jqkBXiJ7mqH3mzZ7jEF9m56FqliziD8mDo3nQmgOFBFD88HnEKI+JX1Qt4w9ZIy3ouogrcqO+2Q3R7gNfnjb7Eff1rW/OOiw3xjyFCok3Ow0bwzA2TZK6bBwdRybLQy/j70DunRveynlaaSSPcBWl7HKWNtK87Wzs5zrW+eM7jZy2b/bBIak15iCwh1uQP3SUVr3Au7gSIhNUQ8h4UvwiI6sLwTbx9YgwcANlfobZL/qSsODFr4kl7q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(4133799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzNiSzROSndzOXhRbGlFNDZ0Sm44VGdBNVhibW9KV1ovc1B6U1JEM3FrSWU3?=
 =?utf-8?B?TS9ZUXA2RXkvRHhnTzdNaWd1RmxmSDN3U3VBcXQ4blByTUdiNUJhZXJGQmhk?=
 =?utf-8?B?cHBoNFd1VnU4R0JYUmlCY2FIY3pjVWNoZFFPT0VVZ2hKL05CVG1URW1Ma3pk?=
 =?utf-8?B?SlNDVTFTSGRzSVVQdGl0NzM1M2N4OWVDSGQzZm1NOTEycGcvKytDOGVSUjBt?=
 =?utf-8?B?cVZGaVRJYzlNT2o5aWlqMDJtbUtzMTVTaWpHUHYxb0ZtTksvejYrY2FSKzhi?=
 =?utf-8?B?U2d5NmgxWS95M2Q5MU4wRHphbld6SUJTMHVLL3MwVWNHUzFvVVpHTWdsa3Z3?=
 =?utf-8?B?SG9JRTY5WkRRb0ZvVzN2bnBGa2N5MWk5bW9HOTdVaUo5WmZIMyt1OG9MQTh2?=
 =?utf-8?B?THVWOHFRYW5KSkMwV3lrMTJDQ1NEc1NBV2ZZMjR3cTNTQkhRemlqVXBwWno2?=
 =?utf-8?B?akVIREpveGljdERwQlgzRzhSakQyNForUFhUdnYwYzRTVWJWNVlhZlF1TFlE?=
 =?utf-8?B?RDNHUEFWQ3ZDTG9ndGgrTU56ZG93UGQyeUJ2aUY1Q3FWQi95OU5YK0txRjBR?=
 =?utf-8?B?NEZFbEU4N1lHWTVTYkpsQit2YVZhS29vbUZlbkZSSm5FMmlVZU0vQmN5c3Ry?=
 =?utf-8?B?UmF2c2gwSENMRVhpUGtkTThFK3RQNkI3TTY2STNOYnRlU3pvNXR4Z1dOd2Uv?=
 =?utf-8?B?d3BUaDFUOUhTK2tUcDdTTDdQQVgreEsvZE9kQXRGNkJMSmowOUltQ0Q5UnQ4?=
 =?utf-8?B?SURPZFdrQWg0NU5XSUlFd2ZUZXhTVlFORldSbDRkaU5UQVpYYjFVRnE1ZWM1?=
 =?utf-8?B?VVdNMlEzblM5RkRuZXU2NzVobE1iVEhqYVh5Ym8rdnJ1TGdBV1pmYm9hQzRs?=
 =?utf-8?B?cUVTTW1xSXlkTzdjNFhKa1NJR1FlUXl5Z0k3QUpoVGZscDFtbnFyMml6YThU?=
 =?utf-8?B?NW94R2drcXM3c2I1MnRSNno0eEFaUTVtOHdoZ3hNNHJPWmlaMGVOcmdUSFYr?=
 =?utf-8?B?VXdGR09GY1I5MEdhcHNBa0dsL3FZUkhpZHkzM2QrU3Y0dVZSYm1LNUVReHRa?=
 =?utf-8?B?RnhQbGR4UWkwMTZlNFFpaXJGM1ZPeDFvWVpwc2poeGZhR0hJOWNBUDJsMmZn?=
 =?utf-8?B?UFUramRIbXMzcUdQVUxyRmNIYms0MHI1SlEvSzVkQkt4WlVNVmwyME9XWXZ2?=
 =?utf-8?B?bFk5b1AxaFFlMzZPemgweWFIbnhLV2lIUGc1S1ZjVlNveTNhTzFGZTVTb25N?=
 =?utf-8?B?VlNKY2lMVm1pRjVRc2lKcFE1d3ZjeWlsd1MwZ3FmRWMxc2YrdmtNdDg5MHpW?=
 =?utf-8?B?Ymp6UGIwdUpzT3ByQzdrbm9Edkg1Z3NJSWNNR0huWCs3a2toaXpOODNScE93?=
 =?utf-8?B?OVlsTDBiZFdTb2dPMEFSQm5ZajhLRjVONTUvNGp4TFByb1UzOVZNVktzamx4?=
 =?utf-8?B?QkduTVR3b2Z1RXhLd3hhU24vcWRxb3czSVpPMmNzMFVDM1R0UUIrLzVLc1Zy?=
 =?utf-8?B?Wi80NWpYTEMzODRZaW4zRkt6ZEhwdmhzaWM2eWJpS0NuRU5XT0xNWE5pRWhM?=
 =?utf-8?B?UXN5elVXNWdjQmpHWjdnUXNGSWtsUFdoYjlxdzA1d1A2NDhPeXRoTjdTR20y?=
 =?utf-8?B?QmtVUGROMmVqV2c4TXFWdUUyY1piMkg2RGVTK0pkNXVYU3lTcnFqaEYzM2xm?=
 =?utf-8?B?WFNUejIzMTk0Z0w0VjYySkNSTmpjYmFwRzJvaWpWWW9KUGpRUE8zcWFlM0Nj?=
 =?utf-8?B?K1dpL3ZpU3grVC8zTk9KM0RaMGtOcFVRWnlsMFhUemFmSEZSWnpWU0ZxV1hn?=
 =?utf-8?B?UHdxQlYyRUx0ajZMQURWYkZHQzVaaDNDTWtpS3pHRldndzQwVGRuWmdMTVdV?=
 =?utf-8?B?eHBGQkV1c09URDA5Wm9Zckh0eUIvdHZrRVRNZWVzb204NDV5L0VEMFFMNHhE?=
 =?utf-8?B?eENvN0FsaXdpSERHQ3ZLUVFPbUJpRWxaZlJhZndZaUsrVldBd0VvV0tKZEZM?=
 =?utf-8?B?ektvWm5KZlNqa2E5QVM3ZXlyTm8rRDhEWFFjcUFUSGtRRkxZb3IzbVBqRFFL?=
 =?utf-8?B?SWY2aFNacUoraGRlWkg5c2F0N0lvcHBHcnhJMUNRTHN1RHhVZmhRZ3lXM0ZK?=
 =?utf-8?B?SjM4aDRUUjlmaDdBK1lPeEF6TENUaUZvYXhucloyL2p3UW1ueVBOZm1rcjVh?=
 =?utf-8?B?NE9PVTQ4Y3RtRXd1YTlPaEdoc0dhdC9xSVk5dEExaytDbm1MamptaDdNeWQr?=
 =?utf-8?B?RjNxaHYzdWFkYUpldGx3WTA4WUZVakMreFR3M0licHEzMTd4YmhXeitlNmNs?=
 =?utf-8?B?OE5nRkY4VkFTWk1kZGpKVDJsT1Z3WitKcVRPcUFud3BVMUNTYU1OQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cf59e160-a5b3-432d-0e97-08ded132e705
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:22:48.8509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HgpxhF7KeAReWe128blG5HiG/ljlEHmqQ95aOcXTkxUjAWC/QcPPdqCkspM0f99zVoBjySTLyPuFI7aoGELMF49WduSdFcuwnOhDwqUino=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 14:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239404



On 6/23/26 4:12 PM, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Tue Jun 23, 2026 at 1:21 PM CEST, Antoine Gouby via lists.openembedded.org wrote:
>> From: Antoine Gouby <antoine.gouby@toradex.com>
>>
>> mesa.inc is shared by both mesa.bb and mesa-gl.bb. The variable
>> INSANE_SKIP:${PN}-megadriver expands to mesa-gl-megadriver when
>> included by mesa-gl.bb, but the package is always named mesa-megadriver
>> (hardcoded via PACKAGES =+). The skip therefore had no effect for
>> mesa-gl builds.
>>
>> This was hidden until mesa 26.1.0 removed the with_gbm condition from
>> the dril subdir build, causing mesa-gl to now install DRI driver
>> symlinks into mesa-megadriver for the first time.
>>
>> Use the hardcoded package name, consistent with the three RREPLACES/
>> RCONFLICTS/RPROVIDES lines right below.
>>
>> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
>> ---
> 
> Hi Antoine,
> 
> Thanks for your patch.
> 
> This is now producing another QA issue about these symlinks, in multilib
> configuration:
> ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/panel-mipi-dbi_dri.so' [dev-so]
> ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/crocus_dri.so' [dev-so]
> ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/ili9225_dri.so' [dev-so]
> ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/gm12u320_dri.so' [dev-so]
> ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/rcar-du_dri.so' [dev-so]
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3975
> 
> Can you have a look at the issue?
> 

Likely simply

INSANE_SKIP:${MLPREFIX}mesa-megadriver += "dev-so"

?

I'm wondering if we also need something for PACKAGES_DYNAMIC for 
multilib as well (and RREPLACES, RCONFLICTS, RPROVIDES, etc....). I 
really dislike packages which don't use ${PN} in their name, a lot of 
headaches are avoided by simply using ${PN} but I guess that ship has 
sailed already.

Cheers,
Quentin

