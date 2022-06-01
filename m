Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928ACC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 08:13:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.82])
 by mx.groups.io with SMTP id smtpd.web11.5094.1654071191834528269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 01:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=nntDLAVT;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.82,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUfLz10PvHypcMlBbEJzlWYTKGW90xftrkSVuse2gdU1Iqut1Lhb4GseIZpU+aMWKvC1yiLGkRWEGPNsWzMLI/5VStlRAL9/5Ev1SfKosFNJpXP9fH5igEfO1846xgfxmrggIo8oTKaIsa+8EomKg5iNHrwXsIcqW4j3UP/JEjm0tdAUjRb4b8IX1lVA4shc02LD/rmab5lH8nJOGJL9PUYxdMd1O6zC4/Om2tzPXN+m6yGcSqt5J17O0pDpBHNIqFcCNkd6Y+piW1CdmLfY4FBMRJL/iQPeZJ+qEFoDh8LLm4zTYzjOJeNNXPvi06K0tiraXBywA3+pmxMIVwo4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbYSxb10VvPw6YbNryD8VIaDfqdRzO+W9wCz5KrqRu4=;
 b=V8lY8NZK/keHdqCOz0vDuWW+dqZW8NcQQKseNs+I6a+6x3yFWPm2++s29srqFi0jMM4o5OF0EeeUtkw6RRAAbdne2V9C2KhwUTnhlgheQxpP1Ld7vENQ/59Ql4eFNTu7a4pvE/orILgxgh5dz7n/o8Gowdv0tem3+fwQakZJGm1ECviwlN2oBjnl9xfvi3XilugFr6RdSqP+Z70z/8g5C5TwGOZy94ymXXK6l8S2LNgzRfMK2weSFGJDYzrOhHgDUHMae5JhCDaBqlDAipkCWmxD6AW1QgD0jNvk5e0RszXTm1aUI57snHXzS6iRfjblh5WzD8iBWYySEyCOWsBS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbYSxb10VvPw6YbNryD8VIaDfqdRzO+W9wCz5KrqRu4=;
 b=nntDLAVT4qYbZko2X/shYHC7G73eFrVi2rc/zk15kHENFmmGZiREz27t9AL/g+i37WdC9MTnFtYTrkttdKjObg6iG8PDcSYzG4Rm05vo9PP5zR7WU/DLyNNtOMbt8sp5FwNXqDK5nkn7qh0Ic1t0OXwXiU87rAzvNBo1NwWEwDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 08:13:09 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%5]) with mapi id 15.20.5293.018; Wed, 1 Jun 2022
 08:13:08 +0000
Message-ID: <b252408c-60b7-62aa-10b8-860ab0ed0a5b@theobroma-systems.com>
Date: Wed, 1 Jun 2022 10:13:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
Content-Language: en-US
To: Marcel Ziswiler <marcel@ziswiler.com>,
 openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>
References: <20220531213206.7119-1-marcel@ziswiler.com>
 <20220531213206.7119-2-marcel@ziswiler.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220531213206.7119-2-marcel@ziswiler.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::12) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56728b9d-53b5-42c9-d06f-08da43a69011
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB81792209AE0EEE80A85AFFF1C2DF9@AM9PR04MB8179.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nbtn/ZXEk/lcXcuFryzOEv2jRtGLnBJZqABFywAati7RkyFRKdI78zBHgH2423KcsEcaIOrrufcMGbK7EgcOO9CODK11o8KTy9VBfRBCSYm8NYliHyHs9JdWkXh3gZ+VkPL0Sy2IDkXsm1WN6Lpo44LrMLfik4Um9u1xQwm8FgvPpQvLEYY4cP1LiOam0/58LD9aSWkjy7BP47DGachC4FwSapcOkk6hf6w5Gp0MVbhTBbzeeX/UGT/WidRwKdKO1LgdnBhUTn7zthe+n2eWHNFgGxMEdLbGkmuxT2tuyLprhVQLpl5fRyWlAwJMC+tmTr6VxFB08CvWXAKvN9KWJOEibiA/VkCcK1KVik0zFPXUM1UkoVnQwCJlRzrob3md3WMDNs9TnJVw8gJlhPu/4vBKcJ9kpBwiE1FFnttvYBKUPXziXhmtCbiudSLAynKgZl8xx0tDnxR7ZZnwdIoQQlrGSLQlBxwZszu0jCf1fj0h1A5DNABVBGAzMuyubT0f3DHIpozIpB3W6PjWgo/+IcKeLIKFlWeoznC8hwcGxcFz2EKmvaUwDUCSETvBuXHFvGXJi7j75DaVTNiXhKFuFyhgiRsidtnO+89ghrAMQApisreQDmHRl00JFez23UeLQU17hCFxzuPl+3cV6ZkE5axwEy5kQQP4TawfG2k1K9NLk5C1pwiYQ3Tki8fSa1fEE+twv7/+EAGT76ndH8Ni5POKbO9yvuXNVwYA2umItWLZ5zi8QIpo3KlZmcdxyWNuUvdfOYVtYHFoZwcwkZvzXQYblq3Ly2XHMhpGECssJJv91EMQlmnjgrwRlLT+99i7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66476007)(44832011)(4326008)(316002)(54906003)(508600001)(66556008)(31686004)(66946007)(6486002)(966005)(6512007)(6506007)(53546011)(186003)(5660300002)(36756003)(2616005)(8936002)(26005)(83380400001)(2906002)(31696002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T25PTHA5UzluWlVjV2drenJRdzVXUmNNTkQxVGpTc3k4Q2Q0SnNlWjNPMlU3?=
 =?utf-8?B?a3RpN2F0ZmpvbFkxbFFkQzJwSDNnc2RvWGVIcWJKTkdHRy9qQjcycVAvNmZn?=
 =?utf-8?B?Rnpzanl3dDlEZnNNaXVSVkRLb1VqcXRVOEpPYzF0ZUVTQ3VkYS9adXlmVkIy?=
 =?utf-8?B?L2RBZVhHVmtTNmhVVDJVVy9qaHhmVmNnYjNocmVLZVJtVEJEK0x2dVFEMm9l?=
 =?utf-8?B?dmRob2tEbmdLY0FRanlBbWlPQVB0WXNzTk9yR2JVdkNiaFRDWTVDV3NWQjFW?=
 =?utf-8?B?cXR0KzAzMHpaTEorTk5CZWVzeWk0bmp5TkdHbElBeTBWSGp2eWJEZGIxcTJy?=
 =?utf-8?B?WWM3N040VzNETEZSQ3BGc0FMazBBcU54NnpSODd2M1JuVXd5V0FKSGdRcHFV?=
 =?utf-8?B?N0p3Sk8rdkhxK1llblFYVGdXVFFUT0t0WmVCY2x4RXMyR1ViMGRseG82N1d6?=
 =?utf-8?B?MENDYVJ6WjNmRFgvVmVjU2lYUXB1N29XUHBiVFAxUHBJSUtjVTF2dWk0UHZE?=
 =?utf-8?B?Sk84RnZiTzJFZFNlZjBkcE50VGkydkw3Uks2cGpmcnJOOGRkdjJIdCtwKzhh?=
 =?utf-8?B?TDNFakhqTkllV25YRTlGV2ZVNWptOExiMGgzendSK1BkME9zRXhIb1lwbGhn?=
 =?utf-8?B?UG9qaHVLQ0ZEOTEwVTAzdUdLWUlVY2liSHp1K1l5RWRZSVhmWS91REhpYm42?=
 =?utf-8?B?Y0YxUGFqelhWRUdnbkY0K28yckU5cTc1T0hsS2xOdytkVFlWV0VmWkl1ZXBI?=
 =?utf-8?B?OWpSRFh0SmdpcEc0SU9wZ0pSSWxrVC9QMERMQXp6eXBKTlFnMHl3VWNTQ3N5?=
 =?utf-8?B?NCtUQVlEVFE3cHRSdFZ4c2xNdFR5ZjNpbmFqWEw4YnJleHRQMVAyUGNNQUtw?=
 =?utf-8?B?dk90Q0tBQXJRZklORDIvRXhZQ1pGQWlSRU80eGVtVnZqbE9YU2VzeE9LSjNJ?=
 =?utf-8?B?OEpQcTI3UWpTY3VlOFh1Ylo3eTVxbXQ4bG5RYTkrdW5iaGVPb2phOXg0cERF?=
 =?utf-8?B?eW5tZ1dTV2RQNHgyci9oYXBnZVNadE9tbVkvQjRXTWtiQkJ3bEpJRG1mZTh5?=
 =?utf-8?B?L0NCbjhUYTFsQlplWFFOcHUwRmlvNTZTbTFENkZadGVqc3F1RG1mNDR2VTNR?=
 =?utf-8?B?QjdTTjlob0xlUHdhS2Y5WVB2OTBuSkVMT2UwZjMwU09DTndsSGFDUXdQVEZF?=
 =?utf-8?B?d0RyL2dBam80amJxcVByUU5oMzAyVGQ4NXBkMXBDM3grcmVPZ1ZXMUhtUXoz?=
 =?utf-8?B?bEdhd3dDYVVkTC9NNFY0U2tHeldaVHkySW1RNmltS00xRGFOR0I5QityQm11?=
 =?utf-8?B?aFZ0V3dVek9SMm5ZKzEyRk40UVpzVUtqUkUxVmFpT3ZacHNmZUhsZ0p1dHI2?=
 =?utf-8?B?S0lJWXVBVDA1WWEzQWR0SEVKMEhtREpydmJTS1dIdkMvcEgzUHE1ZWNiUG1q?=
 =?utf-8?B?a2JqR3ZkVmNVSTA2VzdEa3I2alB6N1dzSTdSSmdkQVZWU3BDR3NRU2RqSWlF?=
 =?utf-8?B?eDZzMUROREs0ZTByREtWUEpSOGxGSjVGZ09HM0tkUjMzNStJQlQ2WjY4bjEv?=
 =?utf-8?B?bm80QVdLeUg2RUsybTRHei9Bb1JEY2xTS3pqeGdKQWRSdGZVcnEyYXhYVUNV?=
 =?utf-8?B?NFdQek5lN0dRdlozTEk3N0xuSUoyWFRXQlE0VHdQZ09VR00zMURwTnZKR010?=
 =?utf-8?B?V1VwcUhwQU9oTlpiaVJhZFFtSHk3N1o3cGlBc0VJdFZ0dDRUTEZaQXRNWkFy?=
 =?utf-8?B?K3NjRENqSVR0M1JWSFpWbUtnYTJsRWN4cWdpNGJ0ME5uaUZLNXo2cTFhb2hG?=
 =?utf-8?B?emhsclQwRFAzUGtXODE2TTFaZ2xQM3FhWHVkbWo3OWNOQTIzbm9tbHRDMmgz?=
 =?utf-8?B?dmFuRGFvdkwxWTM1bHZ3UTg3Vzd3dWVXZUdnRjZsYlZzYnpSbkhFbXRZYUJ1?=
 =?utf-8?B?d2xIKythU05BYm9XSTRqYWZXWkNrZU94MFh2SWRjUy8yYkwwUDRIV1NOVG9w?=
 =?utf-8?B?bTVFVlB0YWdkKzdPM3Zqemp2ZEg4V01sWVgyV1liZE14N0hzUG9NMjFWRmZq?=
 =?utf-8?B?TUhtUU1hR2FXc3JpczRHZlU5dWVmTVhHZ1VvekhscTRncEpsRTJJNDJUaGdZ?=
 =?utf-8?B?SXpsVUVTSXV4b1RZekNKRHZJSWJOdWtlZjNtQ3pEV0pDQ0lLTW1vNEp3U095?=
 =?utf-8?B?TDRQWVJmdjE0MUlBbE5kYUV1OUFWSWNKclp3cUk5bXpiT2lURkpzSlNPRlZG?=
 =?utf-8?B?eVlERGxaOHhBSXR6ZDVESjFzcURuRi9jVWlhRlk3MXF6T1lsVmdZR0FFaU1U?=
 =?utf-8?B?RWhDc3duSHVKK29tNllhVnp6WEVZdllsNXh5WkpRU3BUY3lBcms0NmdGOUVD?=
 =?utf-8?Q?yNAlSrLP0fotNZNK4XGneQCef/22p26gCvCbJ?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56728b9d-53b5-42c9-d06f-08da43a69011
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:13:08.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nSNUs32IoePxmKYuZNXGKEYgUkej60KFiU4iOGd8s7mjZ3QTsKxVex/lO4Dm4/6oYZJDNrdp9lpPe2whsugzrZOQu58LPV3Ao03vKU5IldlyjtGQWFvhuVf4DfFu1x6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 08:13:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166363

Marcel, Peter,

On 5/31/22 23:32, Marcel Ziswiler wrote:
> From: Peter Bergin <peter@berginkonsult.se>
> 
> In order to enable configuration option aaf (AVTP Audio Format)
> used for AVB the library libavtp is a dependency but no recipe for
> this library was present. aaf support for alsa-plugins was
> introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> 
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> Resurrect from mailing list [1] as this is still not upstream.
> End-to-end tested on Verdin iMX8M Plus.
> Will talk about it at the Embedded World Conference in the TSN & Linux
> track next month [2].
> 
> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_all_20210604090216.553285-2D1-2Dpeter-40berginkonsult.se_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=j5mDhOeNcVWNco5eYp6S60KnL4GmuLwFOeDnKizzUfY4ScAsBe2IQUQckKzHOrVn&s=1nRYQeY7NOzqrW7qZafcgBMa2RIx8BtF-kVsHpEX-5c&e=
> [2] https://urldefense.proofpoint.com/v2/url?u=https-3A__events.weka-2Dfachmedien.de_embedded-2Dworld-2Dconference_program_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=j5mDhOeNcVWNco5eYp6S60KnL4GmuLwFOeDnKizzUfY4ScAsBe2IQUQckKzHOrVn&s=EnuuWrWZcXP5wNN4T2S7S57HMhsQNkAZRpv0q1iyMW8&e=
> 
> Changes in v3:
> - Rename recipe to officially released PV of 0.2.0.
> - Drop PROVIDES of avtp which just works around alsa-plugins refering to
>    it as such instead of libavtp. Will update PACKAGECONFIG in
>    alsa-plugins instead.
> 
> Changes in v2:
> - Updated SRC_URI specifying mandatory protocol as https.
> - Updated SRCREV to latest.
> 
>   meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> 
> diff --git a/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> new file mode 100644
> index 0000000000..563debde3c
> --- /dev/null
> +++ b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
> +               specified in IEEE 1722-2016 spec."
> +HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_Avnu_libavtp&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=j5mDhOeNcVWNco5eYp6S60KnL4GmuLwFOeDnKizzUfY4ScAsBe2IQUQckKzHOrVn&s=CDG7OGmgTZNqph7uuR6Au6HBdZZmu_0lUYUC1dYWjsg&e= "
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
> +
> +SRC_URI = "git://github.com/Avnu/libavtp.git;branch=v${PV};protocol=https;nobranch=1"

We don't have a single recipe with nobranch set in poky, so I think we 
should keep it this way. I assume this was needed because, there's no 
${PV} branch available in the git repo (it's a tag).

Technically, ${PV} is a tag on github and not a branch. We don't have a 
single recipe with tag set in poky, so I think we also should keep it 
this way (tag= requires network to check that the tag hasn't moved 
between builds).

What I've seen some recipes do instead is to use github archives. See:
https://git.yoctoproject.org/poky/tree/meta/recipes-support/re2c/re2c_3.0.bb

Re: alsa-plugins which may require it in a PACKAGECONFIG option, it's 
not really a reason for inclusion if not enabled by default. Otherwise 
we would have one big layer only with all possible optional dependencies 
and their possible optional dependencies, etc...

Cheers,
Quentin

