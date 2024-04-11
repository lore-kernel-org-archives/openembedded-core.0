Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAFFCD1292
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 08:17:05 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.114])
 by mx.groups.io with SMTP id smtpd.web10.12558.1712823416330195915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 01:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=DVigjNIG;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.114, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gajJ5cG8j2yh2oEw5X7RE7P+aiXl9G4/ljGezXIS9/wZPSTVr9cZvpvgVMY8JrSba/NkZG5ubbvsM8mSHGGsyFQ1N0FSS+EfEVvJDn64eNafjRMeBQehJdq4/lxgczjWAZ+9h82cQFo8CZe/eQ08iF2TlzIzRJYqcew+0pwYwIg4MhT0hBZmjsuz69lnG/jk42CDR8hoA5k/AiuqaO3yD8voFalk+0FUUz2VU2MyGoKwxkKtE+I23e3BEruFeWbMp29QrLeE7gQDr9jNrppjjGjoupU3/UV0pBzVcL1enpJ+r692IEWm9m912Iqd1l/QXptdp/L4uP8Qkk8a87sV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgCm3M8Qcx++hjdput5+MZX42+EB5ZgPXRdphSZVu1U=;
 b=A4OwkCeIektR1Y0VDiV6Y3NqG6FAaMpMYsgU+CudAV3TQtT0jpOeq21ht/E+KT1m3lADSTcrnZmGZ0qRJabNg3dQ7oAnA4Bh9vDHJIr5RKi3MqLfi0TCrzdjq0EhGAG0yWsqjfleALu2ih8wP9la/nD9QrmfRRlms74oLRNukELjlYMzUWyllhc2Tafg6VJLFHFSBR/4M+7aRs5F9EvMbNytb14G2Z4tzHB5huu73bCQlP0UAHZtzn8aIboHP6lAnuFHIWgh+q+2pBbsCrzDnA9rMeyVZjYGYDFaOqmfdSXV09SaMxkfqYHjwmk9ruE+JNKMGx6DSSECw9ESOg+EIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgCm3M8Qcx++hjdput5+MZX42+EB5ZgPXRdphSZVu1U=;
 b=DVigjNIGRUtaO8IiIR3fdnEx87uzYT77tlhvyiYGiCkJB0cX+io2rpdz35u7knQeI0JS43JXTYyA4qkWUY2FvH0uhjRyxmSnfM0hluGKOjSn42BoMd0V9LmPGJssMzIg/WII92J3MpF3v3xBGHrlmDfCgJuV5iBA7k53QW2C1GHfdzDv2ELEmkGv/vbRq4QiszwXhe45jhOr0a75A5GbWIguu6MEwjK1lS4d1/CzYFt3+0EqjvH7VfoO3qvv/tPioBp0rs3VuMQuhf7pMkKcmwn3Xy0KnqcEaLlKG6Hsb25gD53a3PsjwLGbZon4PUCvNzg0gG83oOZygMR5QJPu7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by PA4PR04MB9712.eurprd04.prod.outlook.com (2603:10a6:102:26d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 08:16:47 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504%7]) with mapi id 15.20.7409.042; Thu, 11 Apr 2024
 08:16:47 +0000
Message-ID: <c87416af-73fa-4ced-b04d-5c18936b9a1e@theobroma-systems.com>
Date: Thu, 11 Apr 2024 10:16:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] kernel.bbclass: check, if directory
 exists before removing empty module directory
To: heiko.thole@entwicklung.eq-3.de, openembedded-core@lists.openembedded.org
References: <20240411080548.264541-1-heiko.thole@entwicklung.eq-3.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240411080548.264541-1-heiko.thole@entwicklung.eq-3.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|PA4PR04MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cf757f-0fd4-49fe-186e-08dc59ffbb32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eR6BcwcRyiHE4JpmnSL/g4I/aJ8ozvZiY8e+Gh+S8oun+WP7ZMA4fd7ptTj39xj98hUCEsnWhFPrMnFCHVAF/NWMfBYwi8CDPEfkb1VrxlGZv/vDat0t1xmdl0aOPkCCKmfCHZnE+aVvsDhxycmAwX/CKiOBxE5eSiqWXbXgXG2CWiC/rKGhUPsdO2/Oc0BIQTXAWFEj7VJl6cDWkvmiXvr8CWBe4BEqR3K3kkBxTvEK/hGSM8I5YJaqXX/F12tXiK57orQUQnLNTciJ4HCkEfA48s43x+vIbrYJqXp/lvUAKCvspQFJ30SpYOoZmT93rZ17WRumK1UY98KemxwCwdZRlkAgb74Mri99CSPjTaO/XtIys5V3Z5d+ujkrP1tt1lJQDcCkXsQa04QMi8lonf1tbdLXOLi1oKXHqc9Avd2HUc9Yp1oZLES2AbdqsuiBVxKHBWTEpmWKQc/a0+DUz+pmxF392d8Dx6jK6TZByZrKkKqUvnpBhGzrbnfTZxhK/pj00XxS9AvZXV6mxXvjPEOgcAlerR6elOA0VoJh33ZZYUAuOe5tbnduwYOVcm4jauZhg2w5uHyzsjAL7RxEZiN4mSgxg7fEcBPuWRUDs8vfOHdPW0OP1gdC24FWfGkBkrk78fefFlSrr7sdF0UdXwB0mF4TbKzTD/Ly191ysN0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEJncWR0TUhlL0FtRlM4MWJ1bFB1VUhoMEd4Zi9raDcvMW1PTUJmaFZKeUI5?=
 =?utf-8?B?cVVreWFlVXJhTEJHNGJDMWFSbmdDZ0Z3WGpGR295M3l0M01GczFXbkluS0NG?=
 =?utf-8?B?WmZ4ZU5sN1VocVRTL2NtTVNueTJvRzJFL2F0Q0ljaDNCanhheXErQ3pQdFJZ?=
 =?utf-8?B?SFZXL0Fpb29xeENFLzduY0VEcEFUNFEvOWRRTE0ycDM3ek1EbnYvb1o4Qm5a?=
 =?utf-8?B?QXN3Yy9UaVcvcVlkd2liZFhrc1lLOElBY1J6N1g2S01TWFlTV285SHJXRzJt?=
 =?utf-8?B?eDFlT0ZBUlBzeHFIeEtOVVlxeEJXdkE4a1hNamxRY1puUEt5N0RyZlZNY3dq?=
 =?utf-8?B?T3FCS3VPUk9wV29FZWlCUzVFblRoQ3I3eThuVVdlRXZWSnZodFVYRHJWS2xz?=
 =?utf-8?B?Sm82Y3ZIWlkrRmJ2TWFBOGxBOFh5Q2k3THNyK1ZzRUlFWWlxSDdTN0d4TVpF?=
 =?utf-8?B?KzQrTDlTKzF6ditKU1MyT2RyYU1aaTZ4eGZpWjJoN1V4MzdQSVhmQnNsZWZv?=
 =?utf-8?B?ZWVxYVpaRkRTY0VwQkJsR2dXbjdGVEtpNDVIb0VzVlp6R3daUEQxYnNFc2pX?=
 =?utf-8?B?MkozZm5rdUFnRGtxd3dtMHlrd0JqTGgzamVkSGQ1RjdnMStoRmx2NzN5di9I?=
 =?utf-8?B?azhHbEx6WlV3RDJ2aFcyWktFNVhIa2tsTytRYWVRdlhacndCV2ZnMXlsenBy?=
 =?utf-8?B?S2MwdlhhY0wwRE0wVjRKRDdZb2ZTQWpSV0JrS1BjMmV4UWlvSEJlejZWN3d5?=
 =?utf-8?B?SUhjUHA3Z29uclRkL0lFUmFibXc0VTVBZHdOekp4VE1qNVY5K3pMcVdSVldO?=
 =?utf-8?B?WHoxeE9aTEJ4TXJpWTZCaTRHaWFEV0J1WnFTanRYMmw1dy84ZkFPaFlUVldW?=
 =?utf-8?B?U2FLd0l0MHV1UlFzRk5qWklZZzJ3OUhhWEdsdXpFRnl1M3ZwQVl6NEw5cTRG?=
 =?utf-8?B?a3RXeDh2NTZhR011YnVWckc3dWlobk1ySEdWL2NDejhmZm5RNm01QTdYMGpr?=
 =?utf-8?B?QldZRWJ3U2hTR0p3V3VaUXR1eUdPdXVlR3kvV21yMUdMWjdjVUlkektONWV6?=
 =?utf-8?B?bHFudENnTTgrOFU4dWMxQStZUW0yektsRktkYTRGQjk4WGZsMmJicEtsQkpz?=
 =?utf-8?B?UEM4bXUrWGpKZHNXeDNKMHNBQmJpZDlhZHJuOVBsSkM2UWlFY0xWT0E3bWZQ?=
 =?utf-8?B?MlJsOU91cFNFWmtMSFYwWnpYcUR2a1VkR1RmeXprbENZNHpQNTFpWCtOVHc0?=
 =?utf-8?B?SmRKZEw0ZjJFaFlHaE4yQzJlN0UzM3VUVEpLUTcrNVNka0NOVFc1WWRTbUg5?=
 =?utf-8?B?K0lzRXdQUGZuZVU2dHptVUhiNmNta01sM2pKVXowdk1hakwrVzFEQ3REc3Ur?=
 =?utf-8?B?ZE5vQTRjS2o2dmtTVmF4VjdjSWlCeGtud1BJTkdJM0VjQnYwUTBnV1pJS0hi?=
 =?utf-8?B?ZnpDTXhsNTZOQXM1bFowb01kTWZCYVArVFA2K2RyVUtPSURQdVNnWThiSUNM?=
 =?utf-8?B?UHdHTTBQZkF3aVZXV1JobytjNGJIbEtnQ2Zhd2Z3UlBzVStoaUhjN0k5Wi9n?=
 =?utf-8?B?TG1BOGNmallmWEdXUWtnVDdRRTZTcy9hUEpRT0paVHh3MFliRFliaXBBNjky?=
 =?utf-8?B?bWFhVDZPb21vbUNmeXAzQmJPV1FzaEFHVFZuVzBqcU1MbTNabmUzUUJIYXlz?=
 =?utf-8?B?dCs1WENoYnVIdU1UNE0vaGpkM092RU1SMXRwVHJ1R0tIZ2ZOaTRvc3lKOU9N?=
 =?utf-8?B?d2tDaXFINnRiZWNUak5EVjkzbUxmeUtMRWtVdkxZQWVoVHJ2UWZoZzRjVkJa?=
 =?utf-8?B?Y2kwUnY1NHFSQmhkNWtzcWFmaWZyWUc4NXhEWkxLNGI4VlJKMmo2RDdIbmpB?=
 =?utf-8?B?QUs2bkZpd2lOWDg1dDZKUDZBWUE1Tm1HcmZPVzNqRG85S0VQdnBSaFdOaEpa?=
 =?utf-8?B?Zmc4RTk2NXR2dENWcTZudDh3akNrZzNUcWl2cUY2NVJzdEpLZUxMeUE4TnZ0?=
 =?utf-8?B?dzZtdDlWeXRvQllFZUEvczM1OHVIOEUrVGw0TVA4a21wRTVIcjlrekl0TVpn?=
 =?utf-8?B?UlpjL2Z3TSt0RCtxSVZrdVNXczlhZ3Rib3N1UHJLUk9PZjNKQnZDbWNGd3pY?=
 =?utf-8?B?dm5IRlFSMG01Mm0weEZFRTBVUWxSTlVXby8weUpxYXZKQ20vUXJGL2V3MVBs?=
 =?utf-8?B?TGZSMmRaNVRhenlIamZ5bXBORnVpUElhc1l2TW1wTGhrZEk5L3IyalNqWENP?=
 =?utf-8?B?eTdTSGE0Zjd1SW1QL2dwRDFyK3F3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cf757f-0fd4-49fe-186e-08dc59ffbb32
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 08:16:47.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AB//anQhuRQOnxMttSWtPkvCYMXrjd8dX14hLk05IHUUZzmwxTur7WPWy5PzRkFTrGK4iZ9bAG7gd/HiE82H3hwXkXJs7sdq1k49VsRSHsJcHyx0T2YegGv7twiMlbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 08:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198119

Hi Heiko,

On 4/11/24 10:05, Heiko via lists.openembedded.org wrote:
> [You don't often get email from heiko.thole=entwicklung.eq-3.de@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> If the kernel folder does not exist, find will result in an error.
> This can occur if the kernel has no modules but, for example, custom modules are created.
> 
> Add check before deleting.
> 
> Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
> ---
>   meta/classes/kernel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index dbd89057f3..988a489396 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -452,7 +452,7 @@ kernel_do_install() {
>                  rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>                  rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>                  # Remove empty module directories to prevent QA issues
> -               find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
> +               [ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete

What about using

rm --dir --force 
"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"

instead?

        -f, --force
               ignore nonexistent files and arguments, never prompt

        -d, --dir
               remove empty directories

Cheers,
Quentin

