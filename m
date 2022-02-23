Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8401FC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 16:04:45 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.90])
 by mx.groups.io with SMTP id smtpd.web08.9476.1645632283351250557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 08:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=BLerTcuq;
 spf=pass (domain: outlook.com, ip: 40.92.75.90,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bL+PWaYvhgia0czYTo0p72eTvS6rIJbWdvKGdApiDfSQVSRD6pgLB+IVT1j8bajjpojzRqFUSlRJQP5HOTixnF7xUJjFl3pCk2C4CWvUDNcWjxRfAMXx4Rhtsfj3tqDEThl2Uetz35xBKihj8iYQkyCTEuASUj1cFAqbZit7V/lTNRy2ctQHrgW+ZfXteedRk88/lkVWQN36GMfpRHvadoXdzdEaBvI6uq7NTr4ElrD6zeML7trvc2uMWMBrSVUMPSm3+Jhsyu6BmpmyTxLZEzOXUuECdleNKKGyzKppYh0WJocO1Pl+F9fhwc6ixSti1+wP3Xd7j8i6sXTv+kB3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLQDjii9ls0SYZQKyMXUIgQkqdlPnov8+BMDP+5nyIc=;
 b=FI6lJYaA30k5/ixBXXEV9paLzJeuLqzpm7hUjKsfE62DKfV4FiwUZp65Be79omSdUNytOG7zLGnnfTjh/t2nMh9rbmhJ5bXb/ptH3RYAyDfJA4dzv59W022uuErJyPRAo98JHMxT0EFekS2mSI2p96kgzq7zHfZ+MBRdkXA7gCH/Mx5PFH7zK8JBQypQhevlFw4M3IYUEmc/VGbC8/Zl/tNM/gNuJZgC7bnWYi4mxIDKZMZjU5O2SpGrTzFDl2c49hLMX2n0IViFo6bOjvEUVGgB25Ws4JWWVK17cAbfNTPwlMe/mlrQcfTYLR87pUhJaqyMiGUVflAkZONUTJZGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLQDjii9ls0SYZQKyMXUIgQkqdlPnov8+BMDP+5nyIc=;
 b=BLerTcuqcCtRd433XAwGdMGR1hFXmaQzLWt0YruFeIxNpjlRq+YNx6A992SlGPeRR0LIYD4sNIUF5OVS8gEEGVpIkf+DfT0EZOkfOSr3k0xb7PQ3OFAnxPUDgNKW7yD8pusNTwJF8MmZ/kUhnvlCNbMfYf/OEuo94knO4cYMoIg8Q8s+Mt6puyyhRCmU0i+Du0PNFnIpb08oCovsJWtta4D+4QqTH9xvEF/fMVb4vc3A/5icAXpdj9zDrsAwD/QECz/rgUwk6Agt7koQUM2hyGDDtlBa4WajaFMYAL9yefTDdfY0K8rxpW6nyCPrhfU6GigkeIQXlHqFDjwCvHyFNQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by DB8PR09MB4121.eurprd09.prod.outlook.com (2603:10a6:10:12c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 16:04:40 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:04:40 +0000
Message-ID: 
 <AM9PR09MB4642B6942BDDAC17F60A142FA83C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 23 Feb 2022 17:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] systemd: move systemd shared library into its
 own package
Content-Language: en-US
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org, mingli.yu@windriver.com
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220223155954.11408-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <20220223155954.11408-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [BmXrIt6du06fS2fRtIPI2eKYE640svqHsM0PKONifdLOTwMU08c1ZoZS/OtUUnk4]
X-ClientProxiedBy: AM5PR0701CA0022.eurprd07.prod.outlook.com
 (2603:10a6:203:51::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <2cf87319-df83-96f2-fdb6-ca14413544c9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ba97231-1f2a-446d-c7a4-08d9f6e6326f
X-MS-TrafficTypeDiagnostic: DB8PR09MB4121:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LjFhvT8BbUlLTXpOg8MX8g8Eu7Vzns3Vj6i8N/XNX4gwNzlFgbrVq/KovKwVAQE8gNvUMp/HA0pjG1jw6A+YKSAKLM/Zxhq8+URJCLWTKUBukMm0LsJtb/2F3IQDxUAdyYDOU5JXA50+/L4NKl8QWK3i58fuHnhP4xbQV4JvVYMvJjrwdmru1TOcncN/fPGYsIMA1TF+hT6LwqoSk+6gxkZSUJkk+8dRmg8XIGG99ezOsLG600hscNcf4HCnddR/gPBXKRL1g8gtXkSyhpIpAwwB7JF7xFJPzD61IaHLaeZp4eKO73Jm3CB3gmkCtRHkPQyy8PnpeInD3FeMj4IAD8pPs4dIt5zrMTOIyMCBeZskH//6Ox/Dlro80Xo2mLEC6Vkf9Q8bZCAE9wvJ2g7HwszP8xXlXtYCHsJG3SN1ykyLM5QoYjnt94maRJ06PfUZCdFCoGTpV2NHilRiNJ3NeoXEifgxslJ2yArCHdqALBDmMhUvY56zhe2cC6ger5OjhpTZ6YUBWwQQIHisJHzDdSyxPldlaf0/MdhzdH2C3rTljbEJbrP8apWHqiu3ldv4NBpPninR67xeiTnE5qCMUsSUKX5zUkECW4L2YgxsmVRgTDfHDUKLBztEugO+tjVTJe4fK+TK/oqp8Bk14tjni++a3IHFDgjsleIFNs+1i7U=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHgvSnVtM1BaR0dpb2lhdjJCVUxLd0tiZ0tRTkNOeVp3cExNUHY2K0hZc3BQ?=
 =?utf-8?B?YkVudnU4cEJEWlY5eE9yUElxWmMwYnVsQXkxTkU0U0wzSXRNWU5laDI1OU9q?=
 =?utf-8?B?VEdVckZYbGRUdkZNT3VZdjFnUUduSnI2UVlha0xYaHo2SlFWNG1UZVloYU94?=
 =?utf-8?B?cTdZSVJqTjZxWWtFSGUxY1dqTGEvZFB3U3BKWDlyS2xMWTVpSUxlLzg0L05N?=
 =?utf-8?B?aGRyMjhkSHdGSFZERDdlM2VxZEIrM3hTdVJQcWtTbXI4TTNvVTR4YldObE41?=
 =?utf-8?B?Tk0yYjZjME1wbXQ1a1VZV0tjbVYyY3R2eTIwMHV6UnkwazhmU1ZORUNWQ1c4?=
 =?utf-8?B?emdvZlRBcExiNVEyMVF4TTVLWkNXeVB6K1dMajVxaStWU3hCbUs2bjVIVVAy?=
 =?utf-8?B?bGlmZlpoWXpCb3EwMVl0elFIc2pmcUh3bzZNak92aW92cEs2VkkxNE1lY2Uw?=
 =?utf-8?B?NDhhLzJ4TTVUMjgyNytWRzBZT0V2VkVTNk1pQjFnL3BmeGpJM1RtcFF3cVBt?=
 =?utf-8?B?RmtrK2RiL3RrWkJIcTVaTlo3YS8xTzd6WlNFWVRxRTM2ZWFBRlhBS3JveEFr?=
 =?utf-8?B?aFBsM0p0RE14UmUwTkFTZUNrYzVPMXdnYTdUaWdISFpoVjVzQWQzUllJNW4y?=
 =?utf-8?B?WUFHUUFMMVNzTXJZdzB3a2p2ZUVQQW5UTnlITmt4REJlY0FtMXFpUGk3KzEv?=
 =?utf-8?B?VEdzOW5GVU5sVkhIK2NGMk5sbzZHYnhLOVJVZWlGNmpSanBXOWxHSHlrOTVI?=
 =?utf-8?B?cVVRYTFVRHRFUTFPdzVpR2h2T0RKU0R4U0tBdGdESURDQkQ1MlhZUFVpNlBH?=
 =?utf-8?B?aHREVkJMcmFtZnY3T0ZVcFVUTXVZZTNXenlnVDFwT0dQVTVWVCtENkIycnFW?=
 =?utf-8?B?WU1KcTY5eHJlQWFVV0Nab3pPSHpRMWpjcDFUNHRjQ1dRaXhVSlhXd0hOWlpv?=
 =?utf-8?B?amw5WGpjazN2c3liU3lyWW5FTVo2SDJ3OFhkV3ZqeUlwazljODNOMkp0bWs3?=
 =?utf-8?B?WVVqMzFRQzAwZC9Na0JCSEJuZE14MldLekFmajBCQVJkQ3E0TVI2K0c4cm9G?=
 =?utf-8?B?b2QwN0IrQi96UkxLL2VGODFzKzZYZXBUakxIbldiRlNRTmUvckV4MGxVMHM5?=
 =?utf-8?B?SERubkNuazBET3JTMXdnY0ZWUEhDUW1VcDBieXVtYlgzUmttMUgxRGhYaUhB?=
 =?utf-8?B?a3dVQjBGMEtLaTNDRmlxR2duK3duQUhjUW1WVWRQNnFuUFBiN0UxOFZmS3lk?=
 =?utf-8?B?WFQ0amJXR3pRZVluLzdoVm9OV1VUdm1NdmNZRjUyREhRV29xTkNRMTVpenBq?=
 =?utf-8?B?d2FGeTlTeklBZ1JlaUY3UTA2bFhXTGMrYjJlMHVibW9aY2hEL1lQRzB2NC9w?=
 =?utf-8?B?VE9SSzZ6U08yZGc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ba97231-1f2a-446d-c7a4-08d9f6e6326f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:04:40.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 16:04:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162269



On 23.02.22 16:59, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Move the systemd shared library (libsystemd-shared.so) into its own
> package to prevent a runtime dependency from udev package to systemd
> package and thereby to a second init manager.
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> ---
> 
>   meta/recipes-core/systemd/systemd_250.3.bb | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-core/systemd/systemd_250.3.bb
> index 9121333f56..43ac66da62 100644
> --- a/meta/recipes-core/systemd/systemd_250.3.bb
> +++ b/meta/recipes-core/systemd/systemd_250.3.bb
> @@ -371,6 +371,7 @@ PACKAGE_BEFORE_PN = "\
>       ${PN}-journal-remote \
>       ${PN}-extra-utils \
>       ${PN}-udev-rules \
> +    libsystemd-shared \
>       udev \
>       udev-hwdb \
>   "
> @@ -387,6 +388,8 @@ DESCRIPTION:${PN}-journal-upload = "systemd-journal-upload uploads journal entri
>   SUMMARY:${PN}-journal-remote = "Receive journal messages over the network"
>   DESCRIPTION:${PN}-journal-remote = "systemd-journal-remote is a command to receive serialized journal events and store them to journal files."
>   
> +SUMMARY:${PN}-container = "Systemd shared library"

That doesn't look right to me - shouldn't that be SUMMARY:libsystemd-shared?

> +
>   SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)} \
>                       ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
>                       ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
> @@ -654,6 +657,8 @@ INSANE_SKIP:${PN} += "dev-so libdir"
>   INSANE_SKIP:${PN}-dbg += "libdir"
>   INSANE_SKIP:${PN}-doc += " libdir"
>   
> +FILES:libsystemd-shared = "${rootlibexecdir}/systemd/libsystemd-shared*.so"
> +
>   RPROVIDES:udev = "hotplug"
>   
>   RDEPENDS:udev-hwdb += "udev"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162267): https://lists.openembedded.org/g/openembedded-core/message/162267
> Mute This Topic: https://lists.openembedded.org/mt/89343939/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

