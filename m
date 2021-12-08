Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F967C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 09:28:00 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.77])
 by mx.groups.io with SMTP id smtpd.web10.10087.1638955679319080701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=g3QQeb5O;
 spf=pass (domain: synaptics.com, ip: 40.107.243.77,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxXNVgkn4q2n7zAfYYsjeOglnfGyjy5s5tT2h1RMipga/ibU8qmqDOPvafSU4vfYgJ4WctL95oP46G+MEjPV12DBcKMFqy0wE2PospMsJw98WGkU0LS9mIhi9qLU0zRKoM/nvaZNw1QwogwUFOstR/I44i8JmP+EPE6yGak3LH18byQDUJaSHTZV3FXFiMTZKRDX8xAaUW8zhqMrGgTkyDFE1s0bqRF3iRs0OryRXZW8cEJitx9UWJi5GAYHHK32QxNt+yYW2Rk7vso7mcmGBV6PzSvnkfTqGogexUcOC9XcUd/yBA8VgN5oGfXkif6TiSYx3mfXJEWaqhcx8L+CTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z6e0gW3uccgE1Z2y8UxGJ6sxOHYUPg0e0HM7xoi3q8=;
 b=UeyVyJIG4bpfKj9T6FAOkJ4R44OaBb6ulSvqxTvBjqDKGS4hQy4sJBNeAFTXzgVGEN7LG4Xx6tRDtbblWfhFNa4Nm4pllB+P1BBFcQ9zl+jAL3udKJeGg8jlOtB1VjAoY1tWRiBLRPHZXDJVj4M7u6mXmt/7C6FggVuil4JZF1LcBRQYYm7hgF2F1sjmPG6bAm5zdaZc/JionQV812EEp7Y0zucaOsk9Skmo7I1kkxgzHRFTd95G69P1mBdK71+SkUxejkZnz7KsS6GNLU9aIN7L+WpvjlAmm7NYMS/iHIPaY8tN1jcwE0H8TDYr/eCCQ2EwSohSjHR3CYQlEm2y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z6e0gW3uccgE1Z2y8UxGJ6sxOHYUPg0e0HM7xoi3q8=;
 b=g3QQeb5OO0ojJFxBlGgCfVMwlj1SHz/YH2ePIVh0XibYj7OxfelO8+L3RAUX8dcoqjDH7ccEOq+YuNtT+LFau585XonwRBAg1gLJa/L0bPf3cjrtXjwd0cYdYN+bJ/kQUcGAkXxYNQwYRaMy3OuLtsb6f6hsiTJS+nHRYkXSlaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4746.namprd03.prod.outlook.com (2603:10b6:5:18b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 09:27:57 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::18a8:ed88:de67:d955]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::18a8:ed88:de67:d955%7]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 09:27:56 +0000
Message-ID: <094d6ad8-56a7-837c-b2f2-be82c79511b6@synaptics.com>
Date: Wed, 8 Dec 2021 17:27:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <20211204071323.2480163-3-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from [10.70.52.41] (192.147.44.15) by
 SJ0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:a03:33e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Wed, 8 Dec 2021 09:27:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0170a1-491a-4a8c-4bc1-08d9ba2d04c6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4746:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB474653FBE8CC401989550866866F9@DM6PR03MB4746.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XX5U6IFUgMxc5eScREXR7D/dQhsdengodUUAeV4ANIC8B3Zlg887ZaBXUbmirIo23mzgxHzxlIWNioAxu+Zsfgc6hDEw+1rr2GV+eedVOKZJiMrKmZa5p7XQhLsfMR8y76OjSuib9pVqWrt6lz+0xYUx0OoAzxCQz50BNr7yBI3DE3MhQSn5oA3T5K+YF5+nuPvx5XDpDdgbW1EcLL24VMbQ0x8/cRyCZNSKL3dUrQEKYKNkOm/B4ch2fji2JBVlhvZUV9jnXqFeIqk8n7Yu7qZdUuGfFI+mkQwMQISZZYDmzCZJTKWzIO4aACtMGPgnkBrkFjVOdSjC9C8h+WUAekNvR69Uqg0ZpGe+zuY6FzY886OpGaV1+TgnV60Q/+Sl3ivHnvUdOw+GPwHUM7ymh7TmJ0BxgTswZtuoQKpPNnkTt+EtPLeRWmJXrA/Ev6H3OUuBOEQ3zDA3SWmeWSLzkZCo/PXRXss7wLw9LG1O4CEZa+g8eTC/sj9sulADMeIlxGsj2GvP4WEMNdAh/2HHcNfPWZp2LCtm2Ij3YfY4eVYLoReWJ4RuDA5IYaripz3r92d2J+FeHeONk5cLkRUhbHkyYDOuUx0JAYK76gnC07fm6J8ehHd6sjXYcT5SpACJ+Tf8H/Aomrx2j+dHkO+E28qCv15mKah3EQq7IgVhkMaaAFU4UZJlY4j/8JLGYe2CrYWpmUYaKNvBlReK//umDIlOlDnPtF9X6/Q/KBD3+xiOxQZMZwFbQ+mL9QC+W+Q+STLZVCY+MUgfEFW4miuu9597kuXWuaV60IMEYhwnet0dSwihzmGbDkIk8dRM53NhPy2hT8EsJj2ZwqRsZ+vATAD0ICJlbl2fO75DDtT+d6YiShdvhSECPg2G+dbWyIYJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(4326008)(6486002)(6916009)(38100700002)(38350700002)(52116002)(31686004)(31696002)(5660300002)(66946007)(8676002)(36756003)(186003)(8936002)(26005)(66556008)(66476007)(508600001)(956004)(2616005)(53546011)(16576012)(966005)(6666004)(316002)(86362001)(2906002)(54906003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEY0OHpvYkhmTnB1aUoyUTltVUNkVjNwbGJVeURYZ1lDcmZubDRLNVRXcjRG?=
 =?utf-8?B?dWhKTkxhVFJIRno0MVlUUWtoVWJoR0JlOEl0dWtnMUozUnFyeFdtaDNFOXBD?=
 =?utf-8?B?bGtKNXA5SDRIT210SWM0SEhENVQ0STh4aW1JSUlTYUROWmRyTlBJV29ma2Vu?=
 =?utf-8?B?L0xNUWRobGdIeTk0RXZVSHh3UHc4dEZuSTN6aWNtY1FkNWduYldURE5jOHpO?=
 =?utf-8?B?UksyT3dvMG1jYnF6Y1ovTHdhbEJaVjJ6NnJyV2RNbXVTaDR0R0VlVGEwNlAr?=
 =?utf-8?B?bzJsVHY0Z2pieXBvYkN2SUdQdzUzVmpmK0pDVTY3TlNMR1lzTVJyZEc1Risw?=
 =?utf-8?B?N1FlU1RsR1hreE9Nb1QvZTJSaU40WmtHaG1RNmRuY2xnQXI5SU5JNDViL0lU?=
 =?utf-8?B?YVBpQmk4S3lCcUM3bFo5ZzRiZEZ0b01tcTVXd0hJV0N3L3V1ckF0NTYxSkRv?=
 =?utf-8?B?TTkya2t4bGUzcG5raWR5bWxTOEwrMVljT2VBa2EwdS9SZlVQcmtoYkZ4c0lh?=
 =?utf-8?B?bEhZei9PaFVmcW1zelBBV1AzbVM5VzFQVlB1VThCQlhoN2tJODMwbk5MRGY3?=
 =?utf-8?B?M2M1YVA2MDl3Q0VKc0RWTkFHd2xXWk1NT2NnTDdRK2dKU0hjTlZUZHkyZzcw?=
 =?utf-8?B?ekx6TmU3UUJodEhac1B4RHZvRUZJc0xRblUvRmYzQmFJSXVKMUxSRHlBZEpo?=
 =?utf-8?B?Ums1RnpvTmNaZGpmNHdicEdIZ1RtZ3RhSm41VHJhbk5meENLUnBoQ1REMzZO?=
 =?utf-8?B?ODVndnZxVHBycG92ck1Fakl6cmhyUDFrSjg4a1RUU0xzVEJJUFdxSzd5NFF1?=
 =?utf-8?B?NEVLWTFLNlFLZTlTTWoybGRRNWNhQ01KNlM5MzNMVVl3d0FwekNFOUNWVTZO?=
 =?utf-8?B?ZGI5ZUd1YlMzYjA3U2tzK2F4QmhnMitlM3JDSlg5aHlZaW9sNGhKTGErVkQv?=
 =?utf-8?B?ZU1rdTJhY1BlZG1IcnJVMlNneXBNNk9HdWJxUWIvalBvazVOL0hHdkpNQ0VW?=
 =?utf-8?B?Y09rbmNjaW5SdXBka2kwWjNjV1pOTmthVGh0Y29rRXRCWVNMbzd2WkJpSm5G?=
 =?utf-8?B?bWY4dDhMQUYrbmh4RWRoSjJ4M3h6a1FvazNyTzdBODRXR0pjU2FmZXI2Y3hs?=
 =?utf-8?B?SFJqWEp0dVB2VnNZeXFOa1piekRYczRnVW8vSE9XUDcyTVBoTHl1aWdxSmM3?=
 =?utf-8?B?QVYwL2pOMG4vdUdRZWpTOWcrOUhZdlV5K01iTkxHSXgxektIYlZPWnVwRkM2?=
 =?utf-8?B?ZE1GaDRrQnRJcGMzUkVveXNnZ1hteWY5R2hSMkFYR0lnNW05c0RicFRUNVVT?=
 =?utf-8?B?SG4zVittTmZQeU1lTUl0RE52Y0tNYlpzU0hidXR6dHZnSWkwWmtaaVVGZkFj?=
 =?utf-8?B?MldqVWxIc0JRTVpaUTh5NVpKT3R3bDY2OW03VHM4N0xDUWpyZWdtQkNyZmlk?=
 =?utf-8?B?ZzNZdVYyMlYzaVB2Tkxab0FzRHVyZXY4Rkc1Nkoyc1p3TEFONHRuSzRIYmZH?=
 =?utf-8?B?eXgxQ3Y2clFKODhkcnl3Y240dkV6K1Zwall5WVZXV05hMWtzeHN3MC9SdU44?=
 =?utf-8?B?Vk1tLzZFTlU3cmdwdW56SzhHeHhtZmY3OG9Xb0haWHU3UXREOUFQWDVNbzQ5?=
 =?utf-8?B?SFJZd2Vpb1FuMUdTdUFqVzFBRlE5Y0pOY2F3S3ZOamt1endnc3JCTHRvMUdB?=
 =?utf-8?B?RXZQblJPSWFSRHo5MFFDNVhqR3hpN3pEdnp5RzJIWGM5Q2srV1BPTUJIbklH?=
 =?utf-8?B?MUQ1VFlBVmh6YzNaaEhvcFczdHFHeUxXZERMeXVINkZnTk96NDVrMnI2QktJ?=
 =?utf-8?B?cTBXaHM0dXl6bFJHL1loemZiY0FCblk5eXVNTXZCaHl2WEg5TklyNDMyaVRH?=
 =?utf-8?B?bzN0aDJLcEo3djh3MnRaUVJPMkJhbUwrcHlYMUNFWlMvWmw1Z013V0xlZW8w?=
 =?utf-8?B?N0ZnazNDUzh5bEFCc3BUL01uY1JST0M1blVDVFFLRUgxOXQvc09mK0VVcDJQ?=
 =?utf-8?B?VzdQTkhCaVU4MjNiR1cvSTk0TjRZZDFjanpxOCs2Y3cwWGM5Z3ZFOXpUanNv?=
 =?utf-8?B?TmR5eUROMmxSQ0NtcThGZEFncVZPRkpROXZ6TE0yVURsMEVQS0dzOFJQQm5M?=
 =?utf-8?B?REp4N2ZSV1JBTTlzUHhtZk5pVnNBVVpWVEZnTWsyYlp0NVoydXptYWNzeWdW?=
 =?utf-8?Q?rlSl1z/xnsoOf0Uf/N1l5IQ=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f0170a1-491a-4a8c-4bc1-08d9ba2d04c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 09:27:56.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 woY4yGB9DbBs3T0b76GWOfOhGnv9nWqSO2OKF2LRx9CSTPe5Eut+m8IuFeU0DUaWTxUCCBpBrAseQLS4Z5BbkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 09:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159351



On 12/4/21 15:13, Alexander Kanavin wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> This replaces the specific gtkdoc wrapper setting
> (which was rejected by upstream in https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_mesonbuild_meson_pull_9627&d=DwIDAg&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=CAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=d8BltpV_tYTB24NoB22HJJW4KZkMUZszeTnLXy4O-MA&e= )
> with a generic, officially supported and documented exe_wrapper,
> which is enabled subject to qemu usermode support
> (just as is done for g-i and gtk-doc with autotools).
> 
> gtk-doc support is adjusted so that this wrapper is passed to
> meson's gtk-doc module, which passes it to gtk-doc.
> 
> The adjusted patch is re-submitted upstream.
> 
> The side effect of this is that meson is now able to run
> target binaries in a generic way when it wants to, so this
> may affect cross-builds - hopefully in a positive way.

Unfortunately, the meta layer I made for android native would be the 
victim of that.

| DEBUG: Executing shell function do_configure
| NOTE: Executing meson ...
| qemu-arm: Could not open '/system/bin/linker': No such file or directory
| The Meson build system
| Version: 0.60.1

I am not sure how I should make qemu usermode be compatible with the 
Android environment. I just add "qemu-usermode" into 
MACHINE_FEATURES_BACKFILL_CONSIDERED in the machine configure of the 
meta-android-ndk.

I should report this more early but I can't spend much time on this 
android project.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/classes/meson.bbclass                    | 30 +++++++++++++++++--
>   ...sues-that-arise-when-cross-compiling.patch | 27 +++++++++++------
>   2 files changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index a7981e481f..ffec5f3269 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -1,7 +1,12 @@
> -inherit python3native meson-routines
> +inherit python3native meson-routines qemu
> 
>   DEPENDS:append = " meson-native ninja-native"
> 
> +EXEWRAPPER_ENABLED:class-native = "False"
> +EXEWRAPPER_ENABLED:class-nativesdk = "False"
> +EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
> +DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
> +
>   # As Meson enforces out-of-tree builds we can just use cleandirs
>   B = "${WORKDIR}/build"
>   do_configure[cleandirs] = "${B}"
> @@ -36,6 +41,9 @@ MESON_CROSS_FILE = ""
>   MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
>   MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
> 
> +# Needed to set up qemu wrapper below
> +export STAGING_DIR_HOST
> +
>   def rust_tool(d, target_var):
>       rustc = d.getVar('RUSTC')
>       if not rustc:
> @@ -62,6 +70,7 @@ cups-config = 'cups-config'
>   g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
>   g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
>   ${@rust_tool(d, "HOST_SYS")}
> +${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
> 
>   [built-in options]
>   c_args = ${@meson_array('CFLAGS', d)}
> @@ -71,7 +80,6 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
> 
>   [properties]
>   needs_exe_wrapper = true
> -gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> 
>   [host_machine]
>   system = '${@meson_operating_system('HOST_OS', d)}'
> @@ -106,6 +114,24 @@ cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>   EOF
>   }
> 
> +do_write_config:append:class-target() {
> +    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
> +    # can run target helper binaries through that.
> +    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> +    cat > ${WORKDIR}/meson-qemuwrapper << EOF
> +#!/bin/sh
> +# Use a modules directory which doesn't exist so we don't load random things
> +# which may then get deleted (or their dependencies) and potentially segfault
> +export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
> +
> +# meson sets this wrongly (only to libs in build-dir), qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
> +unset LD_LIBRARY_PATH
> +
> +$qemu_binary "\$@"
> +EOF
> +    chmod +x ${WORKDIR}/meson-qemuwrapper
> +}
> +
>   # Tell externalsrc that changes to this file require a reconfigure
>   CONFIGURE_FILES = "meson.build"
> 
> diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> index ab4d5969d9..b098c4a123 100644
> --- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> @@ -1,29 +1,38 @@
> -From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001
> +From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001
>   From: Alexander Kanavin <alex.kanavin@gmail.com>
>   Date: Fri, 4 Aug 2017 16:16:41 +0300
> -Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
> +Subject: [PATCH] gtkdoc: add support for a binary wrapper
> 
>   Make it possible to specify a wrapper for executing binaries
> +in cross-compiling scenarios.
>   (usually, some kind of target hardware emulator, such as qemu)
> 
>   Upstream-Status: Submitted [https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_mesonbuild_meson_pull_9627&d=DwIDAg&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=CAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=d8BltpV_tYTB24NoB22HJJW4KZkMUZszeTnLXy4O-MA&e= ]
>   Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> 
>   ---
> - mesonbuild/modules/gnome.py | 4 ++++
> - 1 file changed, 4 insertions(+)
> + mesonbuild/modules/gnome.py | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> 
>   diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> -index dc2979e..c9ff9bd 100644
> +index 1c6952d..5a6ff94 100644
>   --- a/mesonbuild/modules/gnome.py
>   +++ b/mesonbuild/modules/gnome.py
> -@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
> +@@ -35,7 +35,7 @@ from ..mesonlib import (
> + from ..dependencies import Dependency, PkgConfigDependency, InternalDependency
> + from ..interpreterbase import noPosargs, noKwargs, permittedKwargs, FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated
> + from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo
> +-from ..programs import ExternalProgram, OverrideProgram
> ++from ..programs import ExternalProgram, OverrideProgram, EmptyExternalProgram
> + from ..build import CustomTarget, CustomTargetIndex, GeneratedList
> +
> + if T.TYPE_CHECKING:
> +@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
>                args.append(f'--{program_name}={path}')
>            if namespace:
>                args.append('--namespace=' + namespace)
> -+        gtkdoc_exe_wrapper = state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
> -+        if gtkdoc_exe_wrapper is not None:
> -+            args.append('--run=' + gtkdoc_exe_wrapper)
> ++        if state.environment.need_exe_wrapper() and not isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):
> ++            args.append('--run=' + ' '.join(state.environment.get_exe_wrapper().get_command()))
>   +
>            args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
>            args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
> --
> 2.20.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159150): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_159150&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=CAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=45V6_TRrNONJsAD5I2vogAQnnZusJBFo0xgaXn91aC8&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_87494764_6350696&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=CAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=r1-DZP8UnKe5blruwC2xC0yCg4vPMbgdQB7csVRG5FI&e=
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=CAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=aCJ012s9D9DQ3yG-GuuQFs_6APt34sTiwSp8typpm6Q&e=  [randy.li@synaptics.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Hsia-Jun(Randy) Li

