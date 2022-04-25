Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA107C55187
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web09.27452.1650878286610517487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 02:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=HrtRrbtj;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.62,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioci99r6giRz0ZmBnKiZtU7XRrMBFAkQZAk7WF2AHXtCIZbWAYWjfVkmOh/BrSsSWg1izHNhhDeDoTavpj5/Lvfp8lZJ+iIG5c+O48So0gmlrcLTq3Nc7sImP2Q8jQWayuaDSaykf/egMVpitCqYPHmmOCVvr66MlQasoUiJ3G/rVj9NTCNRrOBsD0ZRwMggDm2cjHlCSfILYtUIIDeGzdT/Ivr8H8DdQ/KScolwW32sNPgihr/v7uY1B3oMdRwgUzyluJvnPHOwGZ7ZK3IavfL+vS1yHkvQdRjyGZkIhIbo+sYsy4un3NqjF7enoWqlsMMOA/Qog7JnxYJ6EaX+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM6aGs9qP4bN3Dcvg0LVyDF6cliLlNfk29qLBEhhjmc=;
 b=gjPOaY4l/8/F3Q4hoahCqmutkjTSO2vLU6iQ0jxU5qVidMYhSeBgipdG7n55IGzAsnewmuIc7d5/f7oYUSFbWxrgoTa/d7wzoHBmcK6h71rNEtdHC9YhFRu44b8hZubETr7i7h6zW3PeWV5+XXkPSa/TcuefSB4THCETrftUMbKe+35kCNOuwTgALK0xRGpuh8Vg+D8VCXzRGLzawhwaJfHRxO0wWgHABjkACLAqRmuNOl8/pKR8tB2d6/TaQTxSZa/w29hOwoNGizrI7NVtL/3F/LRVWEH1MnWZiRjLXJY9PvzjERMci0dHsazmszZIPDf9kuGmOqj3L9wzRbiUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM6aGs9qP4bN3Dcvg0LVyDF6cliLlNfk29qLBEhhjmc=;
 b=HrtRrbtjt6wLeGh5EweOnVPOT168I43x8/KpF6jyTyCMiffWt26CL3jqUe2kYMHatrt2mHbsfkds+8ejhrxUPxFcLVle2kzYualLlEtUFsfgJ6jYSbJULUTXZZLXrHv2wgxmxAptjwsqFqi2tCpXPRUzeUiManOCn3mRVOwf4d8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM0PR08MB3025.eurprd08.prod.outlook.com (2603:10a6:208:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Mon, 25 Apr
 2022 09:18:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::54f5:855:abbd:9232]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::54f5:855:abbd:9232%5]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 09:18:01 +0000
Message-ID: <68c2ad8c-192c-d7d2-c1e4-f30ba994a1ff@weidmueller.com>
Date: Mon, 25 Apr 2022 11:17:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2] bluez5: Add fix for startup issues under
 systemd
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20220414205205.2264840-1-richard.purdie@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20220414205205.2264840-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0167.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::22) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71089816-936b-484d-ded9-08da269c7ef5
X-MS-TrafficTypeDiagnostic: AM0PR08MB3025:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB302538338579A86F47CF0DAFD7F89@AM0PR08MB3025.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ITunB+VTnuOFlOItp7c8ScmU3rrmZIVTUlM27aqldkOq7NpgDYxIZOWY0Gl9nKCTmTJpw8UnR2SMI3MLGCBXjyoHWpyvxpOqnadadI1aU/3b6Oa2te4wk0CDmDw9lcfA6NDY9yu3NE5owjA5r55mSVfJ2dHHyEoasg/YfhryiYKxsgUkhRv0YwxC5XYYnV1RXcjNAPy5XX8z7N18T9xwhPq7f5t7nQ/0R5QaV2WPpf5KF9hycwL+KTMJY+mA+caa5ybmM6gD/jUtqLgmY0Jc3X8d9BTDDaqmId9JdIWgj8v987HUarqrpxgHs2M1DjlJbI1qcA2aXW475NIKkDkRixXl2At7kEtu5W92fAAihnYX/JuAA5DozFwSJGHwEymCBFolV1sf4TrtlOkXmkrSLPkf55+rziPLicHKK4MuD0ht0A23o3tcLXMtvXmU5f5QehIeovmHHXiCVhIsMorleTi8Zj6GtumHY+3nuBll4tRGASYwf9E9eCXs0JVSCnyWheoQLt/kTT8JCFLA9pt1GQwN6+BDRj/KdECxnn242S3c3FQI5vRgz8iujh2iY+eFvO22kPmcMC4MTnqLV+TyTeJGMUPqYh20DQjarFah6AqXhcnHtSJYkTid8DVfT3SWLudNGUXn4+eCnrKTboTHnBEHMG6N7eKXesBbmoFLG3kQffK9XF4unVfIh9G954z0hZhOis2o8ZNNbEURzS6+2VVcNV2Y2WcB8EmaXVZd6UcGXr8xxdn4UNXW+kCg8sIYldMKzoF2+vxQB7jr9fsTamEvuVJmTuTGe1TvCU5Gr6ogl464fvVY2W/lq+O3O04ftdVmyP/IdCHVCFM6vRSwmtd83rW1lDK9jg0F07MMpqA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(38100700002)(38350700002)(508600001)(36756003)(52116002)(316002)(6506007)(31686004)(6486002)(966005)(83380400001)(2906002)(66476007)(66556008)(66946007)(5660300002)(2616005)(86362001)(84970400001)(6512007)(31696002)(186003)(26005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFZoeVlpbnUvUCtSNk5veHRFcHpzZE8weTg0RWZpcmxSVzZFbzFRWWpMY0t1?=
 =?utf-8?B?ckNuNEl2cDRKQ1FMZUNsSjVra0t3eitxa1hkdUlDMDlmcTMyZlNaODFyY2Jw?=
 =?utf-8?B?RTBTMUZ2Wm01NzBXR0FJMzl6L2kwRVJ2WjF6cFk1MndCNXRBUUp5WlBabUVP?=
 =?utf-8?B?WkFlMmV2c0NnT0h4SFVHV05YZVUrVTY2RW1hR0N6cW82aXpjNnFOOXp1ZmNF?=
 =?utf-8?B?L0lzU2NXYklDd0g4dG96QlRFWjhINTA3bXYxTkpuZTdHNkkvYjRyNlFxRkgw?=
 =?utf-8?B?dXM3OWE2cnFnbzRuR01Da1kxMkF4Nm9VTE9wc1BRbmdMZnFWQW1BV0RsRU1W?=
 =?utf-8?B?aHU5citkRmRiT2xnRGtBMW80ZTR5K1FxZ3BCR2R3dS9lZHJmallCNHM5SE4w?=
 =?utf-8?B?WGdxV2NhYXV5Q1hzcUlKTHBYUiszM3hJVE1KNDFrYkk0Wm1tVEV5ZzlCN0ZD?=
 =?utf-8?B?QTJhb3g4RnBPNlYyVTZhQWluY2t0OVc1RUlBclpjNlkvaisva3JXelZxRUFn?=
 =?utf-8?B?Qm16cWxDUVkxcWJrV0k5eURoYnV6ek9YQzZPMjlUNmc2d0Y2OVh1ZGVlV3RE?=
 =?utf-8?B?d0FmQStmZVcvN2pYVTNjZFZaQ2tSTm4vMTdXa3A1R3NRbzlFTDkwbjJRdVZm?=
 =?utf-8?B?OVA0OWJiaHVBTzQ1cmZSSHUwMndlNVVmeUQrWm9SMnZhYkRpYllxaUNvRm1l?=
 =?utf-8?B?TWM1ZjBZUGVDSkRHSHBqNGpvS1VzdWRaUEMvUmV3QlRBNDFCYnkxZy9RNnNo?=
 =?utf-8?B?WlJIdlpScUxlSVVTR285MWVDQXp6VHRoVlJmenJudWFLd243Vk5xdzlsY2RE?=
 =?utf-8?B?YW43aHJrM0VSSW1HaVNEK0l5TVlUb3lTSlQxTkFWNzNzU1Zwa0lLeXRlYm5y?=
 =?utf-8?B?d1ZrOEU4VTh3aGxkMnU1YnZHSnNCMmJmVGlwNXp3ZExUdkJVdVZKMmVWdmtn?=
 =?utf-8?B?Rmh4Y0I1M0NKeWE3eElZTlkvZW5lM3luZzMwUVVhWkl2aDZYQzFIQnFxQjNy?=
 =?utf-8?B?aS9PTWlJalEzMzNVUzM3endqMk4xZ05sU1NKZ2pMRFVuRi81UklrUXVrdHVK?=
 =?utf-8?B?ai9EQmdzV1RGRExENEwzWTN5VGJpc3V2QXhyZXUvSjlzUElJMjZjL29PbHBH?=
 =?utf-8?B?b1ptaEVOZVRqWmdWQkZkMzFBUHhGSlN1QWp6Qm5zOU9RRWw0cHQ3WWgrbXFt?=
 =?utf-8?B?Ym40U0p5OHhJZkFKR3FZTlY0RkltWVFZM2RqdCsvakIwc2MrUHhvdWtETjB1?=
 =?utf-8?B?TnNlQ0VwOFFuRVcwM3dFQnBrQ0xXdG1FWEs2RUdtOVpva2lZeVJlQzQyR0RW?=
 =?utf-8?B?T3JNRlhPMWx4L1pnU0w5TWdReGNqc3RIQjZlS2ZzQ01pRUJxNm96bU80R2or?=
 =?utf-8?B?SmtZcEdGemUvZENVSWF1ZklvV0hQeEo3cGhDS001ZzNTdXoxaHVGOEo4VnB4?=
 =?utf-8?B?THphd0g2OTdHVUVxT1JyYnBnSjgyM29nbklNYktmSWQ3U3NzZlZITXJGb0hw?=
 =?utf-8?B?UGJONkFZRnhKNHVuVlBTUHRqMitNSy9pcmx1aXlCUUduL1cydjVmcGJtK0lY?=
 =?utf-8?B?YVZqMU9CMnFYWjY3Mzhsa2FJNHE4VmxFMkY3SmJCMGhVdlpGNmpDeTZvcWtU?=
 =?utf-8?B?c2hWVXp3STZOb0F6M2VCOUdsTWlNclY4bFhwL2w5K0FFeVhxMWl1U3B1TFFj?=
 =?utf-8?B?Wi9pa2lNWWZJaE1aamhkVzQ5d1BBNllXc0VrS2lubUg4WEt1dEMram1qOHlZ?=
 =?utf-8?B?SU04T0RRdFBYM1pCcWhDV1FnaERjZjAvMXd3Y0RqSkhaUU1yTUx2MnhNckQ0?=
 =?utf-8?B?aWw2OGw3K2NZVDZ2b2hua2Nrc0lSZFVKQVlTcG82d1hCRUQ3UEdlcFFVRm5p?=
 =?utf-8?B?WGhVQzdibzAwV3NrYzZCaWY1cDg3S2wzWGdaZzhhTCs1enBhUjh5ODY0cUhj?=
 =?utf-8?B?aVo5MVVKUUZFRk5DT1dpSCtnYTRNamNUTHVRK2FCNnBxb28yR1psdDdvTStS?=
 =?utf-8?B?WVhMOE1PbUVnNFl5MmZ5aHdJc1ljU1JXOGFpREFQazh2QVlpYUM2N2tabDFQ?=
 =?utf-8?B?Y1N4ZG45akZXaVZncWhhMlZJVS9ibkx1RnR1QlJqbXBoNUhpS1U5ZU9KQUR4?=
 =?utf-8?B?SFVieWhGM0lhb3hBTEZjM0NUVW9MWFVXaW9zdXJxQm9XR2s1b1hNZmU1L3RS?=
 =?utf-8?B?L1huUFQrRGVIb2N0bXF5YVhaZmkzdFBRY3l4eVVER09VWTBoeDdkTlBKVUZH?=
 =?utf-8?B?ZzZ4OHFCa2Rkc3J1N0hoR0lVL011c2VaSTdvS3VMZEhHaGJ0by96SEJjVWl0?=
 =?utf-8?B?WCtUMTYyeENmMDIrV2EvZ1hNcS92VWRtQVc0eEFWeVZGRUxsZjh1ZnE3TW9X?=
 =?utf-8?Q?1z5wywBBhzaUETZo=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71089816-936b-484d-ded9-08da269c7ef5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 09:18:01.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ONm8tdIxPx6zVxN+Rqqb5E3R0Lxvov8jpVxu8Gd/ab/zP4z1kmsFqK5Azw9EaUSXHI9gAmSZS5rr7b5u43UrcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164813

Hi Richard,

should I update your patch or only the Upstream-Status or will you 
prefer to do it yourself?

Regards
   Stefan

Am 14.04.2022 um 22:52 schrieb Richard Purdie via lists.openembedded.org:
> The systemd bluetooth service failed to start. Add a workaround for this whilst the
> final fix is discussed upstream, https://github.com/bluez/bluez/issues/329.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> 
> v2: Add ProtectSystem=strict
>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>   .../bluez5/bluez5/fix_service.patch           | 30 +++++++++++++++++++
>   2 files changed, 31 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 79d4645ca89..22dd07b3480 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -53,6 +53,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>              file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>              file://0001-test-gatt-Fix-hung-issue.patch \
> +           file://fix_service.patch \
>              "
>   S = "${WORKDIR}/bluez-${PV}"
>   
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch b/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
> new file mode 100644
> index 00000000000..96fdf6b299c
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
> @@ -0,0 +1,30 @@
> +The systemd bluetooth service failed to start because the /var/lib/bluetooth
> +path of ReadWritePaths= is created by the bluetooth daemon itself.
> +
> +The commit systemd: Add more filesystem lockdown (442d211) add ReadWritePaths=/etc/bluetooth
> +and ReadOnlyPaths=/var/lib/bluetooth options to the bluetooth systemd service.
> +The existing ProtectSystem=full option mounts the /usr, the boot loader
> +directories and /etc read-only. This means the two option are useless and could be removed.
> +
> +Upstream-Status: Submitted [https://github.com/bluez/bluez/issues/329]
> +
> +Index: bluez-5.64/src/bluetooth.service.in
> +===================================================================
> +--- bluez-5.64.orig/src/bluetooth.service.in
> ++++ bluez-5.64/src/bluetooth.service.in
> +@@ -15,12 +15,12 @@ LimitNPROC=1
> +
> + # Filesystem lockdown
> + ProtectHome=true
> +-ProtectSystem=full
> ++ProtectSystem=strict
> + PrivateTmp=true
> + ProtectKernelTunables=true
> + ProtectControlGroups=true
> +-ReadWritePaths=@statedir@
> +-ReadOnlyPaths=@confdir@
> ++ConfigurationDirectory=bluetooth
> ++StateDirectory=bluetooth
> +
> + # Execute Mappings
> + MemoryDenyWriteExecute=true
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164413): https://lists.openembedded.org/g/openembedded-core/message/164413
> Mute This Topic: https://lists.openembedded.org/mt/90474022/6374899
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

