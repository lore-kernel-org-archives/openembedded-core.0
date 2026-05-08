Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48572CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:53:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.223.1778251995191778036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Yy56x5N4;
 spf=pass (domain: cherry.de, ip: 52.101.84.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnnIVcllPj3PDVp0/V6VbsL75nJaQBkicj9jQtzhK5AHU7/TbmiAMvEG6hH9J0fxyRVyAfwA9EgmNm479dnch1QgRvTMf/LY3zFVVItOw25nmJ+Htzeb1okbv4m53xE1V3OtKDZ5c9IMBMgp+LADE2uMTHlH+B98SuPFuESKjC6PYGlXFHvp+vI/6RlK/fJIw6nfkxo/zC/45rteW9dvi4lukMN9HZ5rd3KHNr9QyTZvzDP2OgblyaiELWYicyoVizilKjmRD1swWWul6i4upuRtyAl0wLhTTV0h3yt/I9koxmBqSpFibuTDpAMv0eFMWfKtITuVBn5CzjhlkqnnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4UWOqiX2s5AlunkOJhedQe98oTvDQcS4vk7FVTXtRw=;
 b=pI8owzp0cprjP0KMH/4UGZCTSBV39jv/unqjidm1bDH22uf6cXEJ3RYwn2FgpqNnybDVvfqEj9uxzKBA6IIBPsyciz6b23h6DdaC1P0TAFdDr4iQCZ5LogVyhU+uKmwBIJ2XqA5kIw65qx8on+o8JJxzO4wya49vhYuiXyOMEi7dww9LhqD11vyw8uF7Iu6DTtRe9OXeludneog9ZAmtgcbvSpikMn2H7ZewDx/qplqGcJVtAklUkN3NtwfzhB7dZLhvTxF9kHJAhKdTYVheiBhWuDIVhGGMSjYn/s3UBLt1KfdtDoMsl8/Ya3yUXtJTyiJ3E7nnsZrR5n0an7MZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4UWOqiX2s5AlunkOJhedQe98oTvDQcS4vk7FVTXtRw=;
 b=Yy56x5N4HfHOahVDCtQYSBZ3jSt/GLfJ41YmBwFiuSntx/G7lOzzLiyukcLHpbNVjGXnnbLPD+JvF/DCtTGRt8SMt5ZfNPj+uibgtce8HGR17nSkiy2t9LT/OIOLo4KO3So2vfWrH8PMTgExQuEPB8rBBponzlhtTIXABucCtcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DU4PR04MB10460.eurprd04.prod.outlook.com (2603:10a6:10:567::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 8 May
 2026 14:53:11 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 14:53:11 +0000
Message-ID: <4e742cbe-27ca-401f-85a3-05b0193ae1c7@cherry.de>
Date: Fri, 8 May 2026 16:53:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [V2][PATCH] gstreamer1.0-plugins-bad: disble vulkan
 when x11/wayland not enabled
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <20260508022311.3112415-1-changqing.li@windriver.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260508022311.3112415-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DU4PR04MB10460:EE_
X-MS-Office365-Filtering-Correlation-Id: 43db93ef-08e2-4af9-a5c3-08dead11864f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QNmeogmoqNRtVGq1Srasbsknrvqpmhwz1PUjaUvZREXjpVGHBQp1P21gbV4rQaMoPgpVxoiZIBVEXVaS8uo+7YaOemUzEnBGAiM6EYgelc5Qu/czy4GNfuq1hPJePiy7zHHSrBgQO9sZkXoKk04G9cT70Xnb5dszHhi6/j/TJJYR555c+SfOc+dAgow6i19rKFyYuUB0yOi0nlC/yxbdZQ3NsxUtkAe1OQeKNPgSgooXZenp4GbTf32QwpV+JRl9H9b0srE4baM35hNcW0Wf80b+f0d9vaR4MG2Bmb3e1lXxYQog29iLF7DbyKlBo8Fbsd1cLWxr3KMijUDdSwuAbWEdY0J8RBUUd38arqIdNUeUIZ3VHasGPAlBy2k8W+pzhlsw1O/UTvExR+Y7MRudqFzW07Y/tBdYKGmcMgizNpVhAqaO+MrF9XrBXxvRMyyYdsr063JpXONRh71jlCePiC9JeHd+tKnaopmnWaPdTOqH8S7E3VnuFYAFOfW4YIgyTg1wffvd8pESv+08KnBMg9vn/yE8H3oBlJVsDXqVThKtOElsNYdyV1pIUszRJ1fleuPjxSBIlRBYn7fqh1Zqy5M/wZWGP+yHn5H+nxo/EycHChHc0y6UPfPu9k9iFEXDlc1R+nZ1JC4/C2fLuTaNl1ExZMqk600J31I+K2KaN4xSLFUrcY/W5A7VoO+TEJ3X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3E3QkRzZ1YzbUloSE1OU1pRNHdRRk5YSTdTOWc4REFMc3pZaFdiOHFTcGtL?=
 =?utf-8?B?RlhMQ1U0SldVRjVtT3F5S2lsSFlzYUtTNUdsSUxSTVhENFNNMW5zeXdDdDd4?=
 =?utf-8?B?bUp6L2hzNVRjeVdXdDdrSTcrcHB6QWp0UEUwLzRBdWM4eGRzbEIvb2ZWVTAr?=
 =?utf-8?B?SVBtT1ljRy9QSEZWVDJJS2JZRmYyOTJyQnoycWVuWDNkQllVclhzOUsrdGdN?=
 =?utf-8?B?UklUMnRMZllJSmFFM0p6RkxTZFd0RmR4bGNBYStJZkZwMTVnNmFTZ1NWWlp3?=
 =?utf-8?B?aWVjZHh3RUJybGFaMEpHcjM4eCtaOGZvaDZndEFhSEhLL0Z0SitrNDN6SUxF?=
 =?utf-8?B?S1RETVRwZUV4enRSMzRmU0ExUVBSL0pxRTkzTEhuOVhhVjByWmVJaHZSRHZ6?=
 =?utf-8?B?a3VqYnk1ZnBGZnBCMTUzeUtqYTB0ZWdzRTBRZWUyUS9wbWwwbGlyakR3NnE2?=
 =?utf-8?B?WmEzeFFjemVpbFdoRkFRMHlVdlBUcjNWb1AzOWtBSDBZc3RtZm1UVTF2dDYz?=
 =?utf-8?B?RG1tWUlLUHpEOHlkU1hQdlgzMEhqL2pPUUl4Qk1jZFV4UjA5Y3VnbXcwbnBV?=
 =?utf-8?B?Umh0alpPZDYwUy9JTWl6UXBaaHRDeFBGbHBEOXpSWGl3R21PbVJrOGpqYkpo?=
 =?utf-8?B?NHpvZFJ3VUVZMlRUcTFkQ2ptdVI0SUNRNXZJMnNMMjFGZUZtRUpsMkVKajIx?=
 =?utf-8?B?a0FIc1U4dmxMUTV2WVlKeHVrT2ZmRjByTWxzYUs1bUppV2tJMXlHVkNpWUFO?=
 =?utf-8?B?N0VHa2ROQ293dU9iT1pVSFZZa2cyKzk4UXBUb2lqTFpDQkFvRWZ3eFFaNnU3?=
 =?utf-8?B?cTVKeGQrQUVSRW5zcm12N1doem11TUJVZFd6MWVIaWtUcEtnOU1BcUZUUVl2?=
 =?utf-8?B?aTVVOThBY09URWJlY2syTGk5OW5mNUJtdkIvUE51NGExUk4xNFo5WWZHVk5t?=
 =?utf-8?B?N2RXUkNPamlzQkp6dzFPSG9KVHNxUnlLYnVHS2QwNEgrdm53Vi94MU9XVEw0?=
 =?utf-8?B?R2Y3bVF6cEZQeGd1REVyOWdoMVExdGpFUzVISG5OeHhsQkh2VS9lNjM3V3pa?=
 =?utf-8?B?T29GaDJKelY3OG8rNXZYUGRTRjBwbFNLNGNrZUt2Y0M5MEJHWjRaeG1OUGRY?=
 =?utf-8?B?OVFLZ2VPTEdXWWxReE9wVFZ5MHA4WEVJNkc4SUpickE3S1dmbXl4Ny9seW5P?=
 =?utf-8?B?Y3hUUXMyM0Y5V1VmV0llMi9LS1hyUmp6eWdZR3BrSWtSdmIzVkVVbHFRTTlM?=
 =?utf-8?B?SERMem9VRjgzUUdkRjBPR2xoU2w0bkhGaUc1a3U0ektXUjU4OTVxakNNVnJI?=
 =?utf-8?B?UHpHQTRHNStqUTA3L0RaNlFBNitOTHh1MTJ6Skx6OCtXS0dQNmo1a2xWUURW?=
 =?utf-8?B?YnJtMkl1YVhmcVFPWnU1alNwRTZocHYzTmhiR0ZibXRpSmVnQTk4TDFKaWh2?=
 =?utf-8?B?cWhwY3hkcGloVmIzWHA4MTFxL2c0em1QSUhEUTJ3a2NNMWFlVktUOXRZazVE?=
 =?utf-8?B?ZGhFaUhFRmozZm56Y0RESG56WCtrMTBvcFZ4NTZHcXFOQ1VEVlF3MkVLa2Rk?=
 =?utf-8?B?OWJtYitPZEZtaXhPNkM3Sm9yMzZvakRYaVRyMXFXMlFWYmxHcUN0SDY3VFUr?=
 =?utf-8?B?N1h1MVRLYmJBMTF6cE0vK0NXclU5VTZuWlc3c3dvTkFiU3hEcXFJU0gvMmVV?=
 =?utf-8?B?YjJDUVlJL3EwSU9xaUE0RU5ldEVsbkE1UkZHZFlyUjQxL2pBN2lrMzVZNmNS?=
 =?utf-8?B?emI3V3I3SkMzMmRrM3EzQlRONTluWWZXNWg5N2FkRGFYMWZ0bk9BRGJJNjFQ?=
 =?utf-8?B?bUtyY2VtUE55UUdaZjV2MllrckxoaVNyZEZqNGpZd0R2NlExWk9kT3lrbzR1?=
 =?utf-8?B?WEQ4bmh5NE04V3pqSmsraHpTUTdabFFIU2grUWtUeEl0NGFtYUp1QkVHQktZ?=
 =?utf-8?B?eUdEU1UyTnJrbmgxY2syZWcwc2FFM0xIMVNDbmk5elZOTjYxdWZiVVNPZStO?=
 =?utf-8?B?YXB3QlV4d1BkM0ZjQ1hpN0RrcUtPTVFEdk5nZXNDUlFPWjlwdW1BTkhTaWZq?=
 =?utf-8?B?WGVURlBTVFB0bnJvQmRhempicmxKZ2lTVkd1K2p6d0FHQXFYeHdQZEp4b0lM?=
 =?utf-8?B?MC9mWkNzejNYMTkvQktsZW0zc2N6dHc3RUk2Z3FOVkF3VmRvaTFvNE9uTTY4?=
 =?utf-8?B?ZUpDOGVHL1JPUkhUckdSWFpCeEV3Qk9ZbnZoTUVXTWNWTG8zcUFGZWFUZWZN?=
 =?utf-8?B?MWZHNS9FUmI0OGc4aWVQZEtzMGY5b3A2VVBnVXpIQzBjeGJUUGZoeWE1MElX?=
 =?utf-8?B?YmIwZEJDNjVCRjNKMDlYRkRqVzE3b0JSd01TdVUvM0dhbXppVHlwZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 43db93ef-08e2-4af9-a5c3-08dead11864f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:53:11.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmq6sWosdaf/ZYwEu6Y5022/jbgZ58KQMG8JwDw4G741+8oRZoTg+i2fReKderiIb4TrTaVqumSEYB6CXbi/46ir2r8n+HoL9J9K5oTV6Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10460
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236723

Hi Changqing,

On 5/8/26 4:23 AM, Changqing Li via lists.openembedded.org wrote:
> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
> do_configure will failed with error:
> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work
> 
> disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb             | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
> index cdf3a20dff..c7f081e25b 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
> @@ -21,10 +21,13 @@ DEPENDS += "gstreamer1.0-plugins-base"
>   
>   inherit gobject-introspection
>   
> +PACKAGECONFIG_VULKAN ?= "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)}"
> +
>   PACKAGECONFIG ??= " \
>       ${GSTREAMER_ORC} \
> +    ${@'${PACKAGECONFIG_VULKAN}' if (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) != '') else ''} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan x11', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>       bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
> 

Should we really build gstreamer-1.0-plugins-bad without vulkan support 
even if DISTRO_FEATURES contains it? Seems odd to me.

If we can fail the build, then we could probably do:

ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 
'vulkan', 'x11 wayland', '', d)}"

Otherwise if this isn't desired, we could go for:

  # Vulkan requires a windowing system
PACKAGECONFIG_VULKAN = "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 
wayland', 'vulkan', '', d)}"

PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 
'${PACKAGECONFIG_VULKAN}', '', d)}"

Cheers,
Quentin

