Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612C9CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 14:31:29 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22357.1782225078788535536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 07:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VLUTAz7r;
 spf=pass (domain: cherry.de, ip: 52.101.84.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXB+GiciP5VPFS4QTl+DsfZ0I7aW0APT+H4S4yO65Fb/60ar+uSlvjSiL+4qxB2XeNQ7z1JeKJhM3agVfcwk/9dZArCY88uoC2t3UtRk6983cmFDoRdI91VcYqqNn0PqGMYeZGBf1PcPd7CT3SpTHkOqv0wjUzXQ5GUDPwe5jw4+OWpIReIe7J75/ibiYOZ20PSdWzto5CnK2B9eLwkVCepYK7Jfh1tI5J+pzWmrOd9dWLFtxgcToBikaPGJRdmiZg7wTDN6o44VzxerI4ZN+CPR1W8IUzkrpdO7F9s3X/HYFOOEJhQNADcsMADlDdjj+ThuQu56+icGrYF15QqalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1CEZiFpwd+5tMmnhdPh/bBwsJW5WLxlg5PAzTYOmqs=;
 b=jPXCGuBzaGeTezMU5lNKj4QLAW4Z6wsOvZnNEf69X6XuEPLZXFdUNsh4Fbc8JCDkjWsdlTlLjRZe5UpXr+eCCqctGDU4FewDL/1AaXNKLh2moq3gZEYLX8VKXhNMKu3t0v3toPX2qOZ0Tt4Kiq6kl0j9SmAclZ7D6uXD9Iza1+LnBSlntMHpLH/OmdXU2DUfVNf0yc5i02dCowREU9r97Mq8IeUgC3HuvNADbxNK/IbEnQEz3f4mLiRzB/tZVqm0V2CM9oMjEstq9a2wM0JiQYYkscIjbT5bD9NtcBLX71wBC6gsBKDX7tti/wQOsCGP69kP6TSMI5YtHjV72LOysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1CEZiFpwd+5tMmnhdPh/bBwsJW5WLxlg5PAzTYOmqs=;
 b=VLUTAz7ro7JFEBf2puMOuvIwiKumyThbOHa2kXJCc44ES3JOSDIppIKoNVEE6AKoA5rZuNoGpqVwZ8IR41wKeMQS7y1+8cxmvUAnJNoh57/AJ6wTZaUDYXMxXNBlZES96Z3g4PYI9nCU0WCpogvAk/XE2KjUj5i8VPRZpzmAbCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV2PR04MB11934.eurprd04.prod.outlook.com (2603:10a6:150:2f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 14:31:12 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 14:31:11 +0000
Message-ID: <33b47f6d-4b50-4152-9970-db8a627a97c8@cherry.de>
Date: Tue, 23 Jun 2026 16:31:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/5] librsvg: consolidate DEPENDS
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260512135407.3056055-1-ross.burton@arm.com>
 <20260512135407.3056055-3-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260512135407.3056055-3-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0131.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:359::16) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV2PR04MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e982a79-eba6-475a-f12b-08ded13412c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|23010399003|18002099003|56012099006|22082099003|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	zRcWce7wJthf83iaQIKPABVzb7gb4LynvYdMHY9u4P48y+dNKnjdVfxwcDyYA4X1lEvqShoA18AlQlzELHYtgsDHXy1v8VZ7CSN7E1qIWmxum23/Wac/7AKISJcQ07+9F71iCiByscqyopz5ulJ4Sa07i49zHJQFUjaLbrQp8VXVBjQEa+PwoytlfxH9YAM9Ox5lZYC5ejy1lKluiGpIRCB9I114QGh58iK3OnfS7t3vc+A3FBrn1b82PJG6oWyloQp4Xry6z96lF1MvlcbKif5vd0N9c0SkBxSwG6IOCkKQFMoQ/spvB++/xKmYbUTj6EiPYSbZm7TkTnj/b47V03l52AWZtef0x003Fl3vN3UtI2fD2FrfJOrrM3PEWUwaQf8sGYaRCR9GsYs8TfrxhLz4ntJKtvAJQ4LRRv2YgNjHs6vOEOp8B8uZ6jhw3V0hq+BGrxRvg9Rcvhte4KEphjFFZMZ1yo4sA9SCsTxYZXF8ZnBMhyOK0tNl2jGJsPAIrxMJ4sKJj7oA4X3zRhe4FGXeblSCY4ga9lv8LNX7i4h8FR4b5cDP+zzqmlE/eer6cmCI2Nq2XJcSkipaTJ4L5AdErcst8VqVdMSPb2s1lxeyb+Dco7j+2WHPSLACGYQC2EHPug5gyOGVnlDgh8/2gSeTPLC9qQPTLFaP5QeOO54=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(23010399003)(18002099003)(56012099006)(22082099003)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzgzeW02aEZqbm0rSG9rampQbGlBS29RTmYxOEpQQXppOHNjd1dqdlhYeE52?=
 =?utf-8?B?K05CVG9mYlNaMjdtbStvbzBjS015TGxiaVVYNkQzWXR3N0tmb2xSNXk0bzI4?=
 =?utf-8?B?RWlOT0REQVJDUGRFZjdkbWg4djNUb0lvV05VcVdlekJOdlFQckJVemk0V2py?=
 =?utf-8?B?S1M3WFlaaVZaL2NNTHh3NmlSSzNnaGdEMVNsQmhuZE9vdmkrVGtiKzFYTDdB?=
 =?utf-8?B?QTYyT3pZaVZKTVdmYmExTXU2TXo0L242ZFcxYS82TEVieDUvR1ZqSEJ2Q2Ry?=
 =?utf-8?B?NjVtdFYwbEFQQkdwMEgxc3pWNmxuWWFTejU4NVNGVVdaV3BBc0pLZGdkTjVH?=
 =?utf-8?B?cE9OczEzVCtZSXpNeU1TdXUrS21KZ05Oc2FDczNWYlVCZUJleUZQU0tyTHNW?=
 =?utf-8?B?dEdSODVyT1RNdGVnNnl0R3BwQXUyY25qMGJibytXdW1uR3pFb0VFWkQyZ09a?=
 =?utf-8?B?S0k3V3FqdXZ2anNnWUlYdDRDZGlzU1FJYlNIaWVHeG5uNmNsUGhvNzhLdktC?=
 =?utf-8?B?SWJ6QUNoM05XR3gvZEFxdUxWbE9xbHdJVXNnSFlaY0xnaVoxVnRaTlRLbFcy?=
 =?utf-8?B?SEY0c05wVUV6UXJmVDZ0ZkpNZmFoYjlxSlpYWmRMOHhRK25ZbUFkWHhIbytn?=
 =?utf-8?B?SHRvY1pEajZ2bmtoSHF5eXZxU2tNdGlneExqc1RaWC8wRmwzbmxlS1RPTyt4?=
 =?utf-8?B?cjRpSnNZTE5NU0V0dFpRQ0E2azJPNVFscGkvNVhlVm9rdWE1TVZOK2RIL0hL?=
 =?utf-8?B?ZlkvMkJkWFk0VDVWNW9SblJQb2Q2MmMzZGR4VHFJWmF5dlhxT1ZTTjJGOVpT?=
 =?utf-8?B?VU44RndYMzNrL0Z2cGFEVjlJSU9sMTJxcjFhd0h2MFJsYjdYQ0ZLQjV6dm45?=
 =?utf-8?B?eG55aWlJdE91em5rRm9GaStJaVI0S2FER1g4ckJJbXVjdXFqOFFzN3A0c1Vm?=
 =?utf-8?B?dTZkbW05ckNTZ0IzbElTeC9zZjg3NnRZR1pJdXdHNkcrd0Q5TUNydkVIQURk?=
 =?utf-8?B?cDg5eEFtNXUzeUtPdDdRaVJOZERHQjdsTHMvbXBIREFCTUFXUndEelFlQ05B?=
 =?utf-8?B?YlRVMW9VMDNJVk0xeHBzTlRCSmpEVnphUW9QT0VqaWw0ZUJCNytVaEtSNHlI?=
 =?utf-8?B?RHY5bU1vTmozWFhLMG1NTTc2OU1LTGVlWE9Fdkt5UGY4NXVSVno0SUMyenUv?=
 =?utf-8?B?ZUl3aXl2NE01cThOUnFnVE1lK0YrWHRLSnBPSmhZeDg5cVdXNDNDSWkxNm16?=
 =?utf-8?B?REpFNnhmenZoMGhJQXhEek1lQWVXRnpWS0l6STdmeGFpUDFNc2lLWFo3Y0JN?=
 =?utf-8?B?RWdKcm54UFczLzJyTkdXL3E5NHlJVE5TUi9tcnZ0Z00vZGVKVmhQUzhKcXBr?=
 =?utf-8?B?NzFVUE9TYXBUL1MrUTU4cys0VHo0R3FoY2dvelFpT0RLU0pYNXdRYWlFTDZV?=
 =?utf-8?B?Mk9SMGMyU0pDNDRLaW15UDRHVE5NZWcvWmUrNlY3WWQ1bm96Q1JyZy8rVkls?=
 =?utf-8?B?NTFvTTVhS3RkNzZQKzBKa2NCOHZVRk9Hb3IwekZDRnNDaHBFOWlUT0U5MSsv?=
 =?utf-8?B?R0kvK2ZyZWxoeitwR09JUmZRck8wbFFBK0ZjeFNBQ0dObjhNbzNoYkNMQUdp?=
 =?utf-8?B?Q3JPLzlhckdjOExpS2lBTWVmZjRJd1kyd3JsQmpqOGhPWjRsSkZ5OXY4ci9T?=
 =?utf-8?B?RUJ1VUlJVEdMbFNuMlBOOFRMK0VwV0JuWCs0bmd4L3ZBdlBtWVhpLzgzclFo?=
 =?utf-8?B?aEx4OW9aQkdiSmVoQ1hyNUIzOTBoMGt6ZGZOWWRmZXRNc3hobHpTUDlvYzI1?=
 =?utf-8?B?NDVBVVVWZVVZTysvQXh5Vk9TZ0ZlVjl5SU4rYXBVNVFQT3g3NWlvQnAwREkz?=
 =?utf-8?B?VWdRNTNrTFBOLzB6b0l0OHp4dEowM1RYQWVLWUlRWTk0Yzgxc2Q4MHFkQnFa?=
 =?utf-8?B?NkFtQURpeEt5QVNXaXQ4MDRUOVJURXBmV2xENDUrSjZ3UEJHc0orRWtBbDFP?=
 =?utf-8?B?aHpSZDArd1MvSzRMeHNFdjRkdlJaQkdmSFZoMGU0eW9nblJ6RE91UGFXQUJi?=
 =?utf-8?B?MnI4MUdYTU9uVUY3WGlVVHVaRGNDbm9OM3k5dHE5ODF1cDJBQ013U1JaT0xT?=
 =?utf-8?B?QUptRCt4SFpabE91c1BYZTB4Vzloa2RrOVV2WDdJQmNWbXgrZ2k2cWx0OFJW?=
 =?utf-8?B?L2NPRzkyMFUvVVFoa2I2Sk9DSmFHU2Zrd2JReEg4bVRRbWlKZnVUbmQyZ2RH?=
 =?utf-8?B?dGUzYU1RKzIxQkNIMkIyWEQwdUh0MmlML2F1SjA4cGE2eXJqL0JFbXdnR2wv?=
 =?utf-8?B?ZVhZU2Q2S21ZeE9XZUJ1SXRaN3MvY0lOWWsrNytEVzJ3ZW9uM0lYZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e982a79-eba6-475a-f12b-08ded13412c7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:31:11.9500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cl2psYyKgNsvXbF5t2xHcGJ4d5gH67M4Vqh9051Ic/Q6Fn83+MonxydqOfvBUZG8WZ2amNLCjnXZ8j59pZUs/LWS2pYf6J/3262mOUDzXl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11934
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 14:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239405

Hi Ross,

On 5/12/26 3:54 PM, Ross Burton via lists.openembedded.org wrote:
> There's no reason to append cargo-native to BASEDEPENDS when it can just
> be added to DEPENDS.
> 

But isn't it already in BASEDEPENDS due to inheriting ptest-cargo which 
inherits cargo which sets BASEDEPENDS:append = " cargo-native"?

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-gnome/librsvg/librsvg_2.61.3.bb | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
> index be72b1a1491..61ef01c3fd7 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
> @@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-or-later"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>   
>   SECTION = "x11/utils"
> -DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native cargo-c-native"
> +DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native cargo-native cargo-c-native"
>   RDEPENDS:${PN}-ptest += "rsvg liberation-fonts"
>   BBCLASSEXTEND = "native nativesdk"
>   
> @@ -31,11 +31,6 @@ SRC_URI[archive.sha256sum] = "a56d2c80d744ad2f2718f85df466fe71d24ff1f9bc3e5ef588
>   
>   UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
>   
> -# librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
> -# so we cannot use cargo class directly, but still need bits and pieces from it
> -# for cargo to be happy
> -BASEDEPENDS:append = " cargo-native"
> -
>   export EXTRA_NATIVE_PKGCONFIG_PATH = ":${B}/meson-uninstalled"
>   export RUST_BACKTRACE = "full"
>   export RUSTFLAGS
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236885): https://lists.openembedded.org/g/openembedded-core/message/236885
> Mute This Topic: https://lists.openembedded.org/mt/119274858/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


