Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EDEC3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 13:50:39 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.104])
 by mx.groups.io with SMTP id smtpd.web11.25160.1719928227774054856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 06:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aVa70WEg;
 spf=pass (domain: cherry.de, ip: 40.107.249.104, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpTWp063HASUPzw9Z3CAIF5Uxg13aAxtI+q3BuSlHvNvm1cw6iggThszs3/7nha+JiuL1VQwRqGs4h2MsmLojfxj05o2w9YLObappCQQlqQO7JYIKFWN1nWPcO4+S75UEJNP/uXAERxfK1BVKru2TAq9znauzgs4YpGKKvNT/DlCNgqE2cqDGLjZhTMyZ2V/2MIM7bVEEUsFMdXVtkh7iofQjoBb30tN1fcyxgxPnSIUXPM1v1w/8wI+UqIO5SP8MaJPkU+qZqSTd0oPvkDJNcsHolguaw0avLgeQXUVL5Wvvv1jLgt3S10bPLO7ul6q0I48E+Sg9B3YCEAt5ZrRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MoAFwc2ovC3m3SG4sURMSucJLP+jCdHV1qLeCF8EtY=;
 b=cApHyHFlJlcKn0td7a5tm8WJLCb6rsoKCy1bkMSNEGeHa/Z6tggkeD37Xav/o1tuY6OqzYEgsWHdr0+xjbiPqt4lEBeQA9j39AedleLiMhMtbEtlKF8wNfkHokA0k7mM5k3mrbs3IPS8bs2Dcpko/Bkb/53HoVTVst5znP+zJ9vSqZCxgspTYsjwKYFuacRsOobvXEEnWUfsJZxcKfrEK36lJM4Q4eXgpcQ9fc9KzsgLhMJ4B0oZnoWPpSBIV4P1oJzpfSY1lWmr2PyBo+vjF43xBo83enJdkHcMnXjykbf9+ECcffxOMQ4tjhhc9NkSP73nWo1FnbG3NeuhCYr5WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MoAFwc2ovC3m3SG4sURMSucJLP+jCdHV1qLeCF8EtY=;
 b=aVa70WEgtgbIg9bDvatzdKXBBRPgdE2pIIWzCeX/31q+u3eOHG/Xg2cqm5HekheW1Ve0Wslx2kOSGyBeb7Xj9WKX9l1OpO061xbm9Pad9xhG1DOa7GXCBAC70nvbhR5o0VU/NzOgX3DzEX0Yb2I+Uq0Pt+kZIVZJoQRjhES2Pd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by VI1PR04MB9763.eurprd04.prod.outlook.com (2603:10a6:800:1d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 13:50:11 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 13:50:11 +0000
Message-ID: <343b74d6-91b7-4492-aa0e-21f96b50a98e@cherry.de>
Date: Tue, 2 Jul 2024 15:50:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: Fix potential index error issues in
 do_deploy with multiple u-boot configurations
To: florian.amstutz@scs.ch, openembedded-core@lists.openembedded.org
References: <ykBT.1719908195834561903.8Nny@lists.openembedded.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ykBT.1719908195834561903.8Nny@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|VI1PR04MB9763:EE_
X-MS-Office365-Filtering-Correlation-Id: 645f0486-f302-437e-298d-08dc9a9de450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1ZJbTBOQmM2MkF0U0FkemMzdlhPWkttN202TUtxVGNWcGtBUXpFcEUzcU53?=
 =?utf-8?B?VlRHd0wzaG51LytoenN6ZHBGV2ZFdXRTSXRrTVhDRnVBVjRhcEFWcXlSdkpR?=
 =?utf-8?B?eDdpSnRNRjQ0a0hxSWtQeUVOL3oyZldnREZVekk3M1FuMFA3ajAvMTg3eW9L?=
 =?utf-8?B?UUZJVFZpUGUrU1FZZEErQmVuU3d0YXdVeVhIOVREUkpDMG5EcUdENHZycS9P?=
 =?utf-8?B?bUNaYTRFTlVySDd5TDVwSjQxZ1dNbTMrWVlpbkNmQVdvTVVWVXNOcndoK1BS?=
 =?utf-8?B?RklhWFEzWDR1T0QwalRiNXo2VVNOcmU4ODQxL2p3eFp3MVE2bmxNQUdBZnJQ?=
 =?utf-8?B?bXg1Z1RrNWpvVlJuVDZWMUNHZHQ2ZVZwQmtVTTFKQjZscEY0Zk5TTGVPVlpE?=
 =?utf-8?B?UDVqOCtVT1hKbEZhSnhCOG0yOURYeThxcm02N2doSTJUcEpyZldLb0NHN1lU?=
 =?utf-8?B?MCtMclBXOXk5b0NSbEdsNnlkekZKKytmR3hNRTNhVmFncDJUWUtnQjFVaWxs?=
 =?utf-8?B?bnpJRUZjZ0c1UENqdlVicUpydkhtYUM3NC81T1FVTzFZRVRGTmdaWVpuRGd2?=
 =?utf-8?B?K1oyZHg5dnhwVG1yNmY5NkljT29XTk4reERQbkxyRFgyQWg4TU5PTTZNM1lF?=
 =?utf-8?B?NHZjbTk5UC90UVpBUkw1d0MyeWJFT3ZyZncrU1VtM2RsMmtIZUNyZ2V0VFBY?=
 =?utf-8?B?dmlGV1NhYktmVC9xb1BTOE5hemJJM1BsdWpsTmRjbkFrT0pFVkxvK1ZXdWRG?=
 =?utf-8?B?SGp2YTNsOGNKeGxiMjRzOEpKODlPZXVDZHNjUW41MHRiMkNBUDZoZER6R0tq?=
 =?utf-8?B?cnhJVUxoRUxkQXRRaWVHVXZOMnVEbXN4SE8xcklreWdHV1FPZ0J5T1BFV1Qy?=
 =?utf-8?B?eHRndllkZ0NhTVpWOTdYOTBvd3RVR3RqbXV0S09KQ1loZlp3RERWM3FFd3lJ?=
 =?utf-8?B?RWxtdnVmRk54QmZKRFRiUUJqRnRtWFRtd0hhVk0zdFZrZkZsMU5SSGg0VU1p?=
 =?utf-8?B?bUxBenFxaXRCb2xRMyt1aXByN3FZcXJNdmpVcEdiQ2J1YVFUY29ZTkNpRTE3?=
 =?utf-8?B?WHk2UThxVkdxa2tZSTNOclNsRWRnZVF5VFg1ZnpsdncwOXJvTzJhWE52NlZi?=
 =?utf-8?B?Zk14ZHBGdmRicnhlVCtmRjBMV2RtOGdBOTVPZDREWHN3RUhlWmRVZXZsSlNm?=
 =?utf-8?B?NUdXQlFWc3FXZzdFWmtpSzNOM2RVbTN3WGxaOGthUXdtU0JlUDlubjdsNGM2?=
 =?utf-8?B?aTR0T0l4QVNuL1ZzZVFjWGxlamxVd05tSGlBKzRvSnYrckdSdnZWeW9FRU9L?=
 =?utf-8?B?bDNBdVI0V0Fxb3dHU21xeThET0NXY1pHbHZERXJ5bHdUeGJOd2o3ZEVBQnFZ?=
 =?utf-8?B?Y3lqMUFNR3VETlRCSmVidGdWZW40Q3ZmN3JVeFJJb3FFQkkvVnRQT2ZtR3ps?=
 =?utf-8?B?TWxWNUUxaGFOZ1ZUbjhNbnhvZnNjWHpjRjR5aDExWmFmcS9ncnA5bkxDb3ZV?=
 =?utf-8?B?bnJtNmxPSHNOSHdNUXlSSnRRZEF4SVB0UTBsSVFTelJ1Rk9TVkgxYVN1Q3pK?=
 =?utf-8?B?Y3RuL25KcThHNytsY3ZxWDRCNDBTamZNcUQrT0t1cDVxYjgyYXFOZllCalBW?=
 =?utf-8?B?bUNYUHBVdHJ5MjZacWpCQ0tWR0FoRHA4STlHWTY4N1p1MVJYMkEvVXlSZGZ6?=
 =?utf-8?B?aldUcmcxc1ZLeE50R2dhcUlPYjMwN292Q1pUMzFqdE1tNFVKdHVqZS8yM3Rx?=
 =?utf-8?B?MlcvZ1RuaTJ1dEdEMzdOM3ZpZ1N4RENvZFovSDJUU1FETHJTTFpoMitUQlpv?=
 =?utf-8?B?M1JqRWs2ZUtKSHRRTTIyUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzBkN2piZWUwMnVyNnI5Nm1tSkU3aUhGKzk5bmdlSVV1UjRMcHF0SzEzYk11?=
 =?utf-8?B?aVFjaXh2ZjdnTkRsWlU1SWFrdSt3dkxMd3BEYXFoNjRZSDNUL0hNOTNnL2Vy?=
 =?utf-8?B?bUxxRWVhNHJGYWd4YXBrVVI0K3J1OVVFK0tmekxZeHdJOE1LaUJlN0FVa0xu?=
 =?utf-8?B?MnBtakx3S3VQV256Q2o4Y0RQR2RBTWxTeDdYbmFrM0RXL2t5VGVBb0ZmcEl2?=
 =?utf-8?B?eElWTysvaVZyVkN5MC9abFNPM3F5K0pKQnNiWE9TUjV4RjhaRzlYSnNyeWZV?=
 =?utf-8?B?YWxta0JOeHFpMWZuQTZBa0dVUkM4bEk1K1lHeTBocnJiNXBXamhqa1k1dnYv?=
 =?utf-8?B?QTkzUnZpcmJadjBsL2NiZkdSY0JxeTZXU2xVNkszcEpXSWxUbGdnd3d1emx5?=
 =?utf-8?B?T1Jhc09CTDhBNXJnekpxUk55eHczTHlCdjVuVU1NenJXWnRISVlaQlJrYnVP?=
 =?utf-8?B?dGNDcEdWTk1ydGdaRDFQeGRMdTBKdjZXOWgrMUtZcGYydklvTlp0QjBiRUUv?=
 =?utf-8?B?a1RXbUluaUpQQkN3d0pqUnRKZndnN1VKQTJzd0FLRkYvc1dZMHB4ZnZRSnNE?=
 =?utf-8?B?K3NUNS9vTWdoQXBzejFsNFFicytNZmkzVzhTNXpXcjJjVlVrb3Z4MXRETVVG?=
 =?utf-8?B?UWlHUFJ4WTh0UjNmQnhFWjg0dnNjRHd2WmlVSllSSWFCalRFVzNCWXI2YXVK?=
 =?utf-8?B?T0k3L0tVTFFrRlZhOWl6ZmEyVG1lRkovWWlkSk8xS3NTd1ZXcU5MTG1VSTdN?=
 =?utf-8?B?T3BCSldMYlc5N3BleklZY1hCMHNVTFN0T1AyTHdnNGRrWG5NSEh5TVV3L05u?=
 =?utf-8?B?SDlDY0owcVZodW9nVDhudzNGam5hMTRjb2pxQ1NOQTgyNlVWZFo5aE85bXpG?=
 =?utf-8?B?V0hFNWZrd3pUVHk2TGtTUVpiYzc5ak5FT1pqNlgyTmQ0YTdhR0VBeVRuSVRy?=
 =?utf-8?B?cEIvVHZOTkcyWW45NVJ3UEM2bnlEeGlVbHUzM2xYaGNXU05jdzU2NnRraS9n?=
 =?utf-8?B?bXY0Z0cySXdaQnJuZjlsRm1Sdjc3SE5JUy9RaU1TMWJFZmhxdmxobTR3ZFh1?=
 =?utf-8?B?VCtSaURvUDd3a24zY2lUNVF0ZFVPcGhTcnpwSnhlNVpOTUJ6TGpaQTBBd2wy?=
 =?utf-8?B?R0xFK1hnZ1BxV2xIeEJKcEo1SDV1Uyt4eTlZRG1oQ3psTk5OUlB2UGowZGov?=
 =?utf-8?B?TG1iT1lpVEpCNTJFVmdpSnN6ekRlTHR0Q2FoUzY1T0FkaDVnc3prWVJEa2Ev?=
 =?utf-8?B?MWh4Q09IaUZZRkdzRXRqMDhJMFF5dlFQbXJqaU1OclJhcXdMUE9JYStHZWFJ?=
 =?utf-8?B?cHQ2Rm8yYmQvditpSjh5T1dnTkMxTXJIQzBMOU5VQVIxQWRWNWNPK2RzUVht?=
 =?utf-8?B?RjR6dHJHRlFzaWpQTEgrM0NINEd5TUVLRVdHYSsyRURON3krQm9wTFpEVFVv?=
 =?utf-8?B?dndRakd6d1ZlWmNlc2R1NGNza3MvVHovTjM3Q3VnME5YR213bnIwc1BzQ3hl?=
 =?utf-8?B?R0dYK3ZVMmdZVWlFQTlrcGp4TG44TmphMElaSUVUWllFR3VFbi8rOFZBbGZ2?=
 =?utf-8?B?K2luV3VnQ3o1NEdhemtJazJURjZ2RTNnRFZ6TGp2VzZsanhaUGFPOG54WEM4?=
 =?utf-8?B?MkdmOGhxZTlnM2txV2Z1cURnT0RnNE9rTTZ5ckNKL1EwREl5ZUU5VTFDRG5V?=
 =?utf-8?B?aDNwby8xc1F1NnZDM2Ezcno4VXpoMklKb0VTWTdaaGZQeENVUjBJYWVWZW5K?=
 =?utf-8?B?d2FPeVIyWURlQjN4SjJnSFo4U2ZQSWRpZTF2ZjhwaTcrS2IzRGVMenkxMnAz?=
 =?utf-8?B?ZkFLcGFHTTA0dUxqN2d0TS83QndSUW1PbUdvWlRJN2Rjd1I1VkpWQTFxcnBX?=
 =?utf-8?B?Ty9SWnNrSVVrTk1wQkE0dnRPc2VlemZKanNQNHNkSkJZR3ZDZldSeGVMWWpZ?=
 =?utf-8?B?STZSaUZZbVExamlSK3dUcW8zMk9qRlp0eGJiaGdzZWdtcmtNM3VUWFE0SlBZ?=
 =?utf-8?B?dE11Ni9OTktTUEh6M1hWVnVEMngvRlFZODhTYktNdDl3c2ZNQzNHanRsTlFK?=
 =?utf-8?B?eGJoWSt1bkRKYmVuR2JVNDljNjZMY0lNOHJIUUR1bGljazMvQ1o4S3V2SExF?=
 =?utf-8?B?dWVCMTlrUjRlL0NLY3NJcW5iNXNUQ2hIMlVxZ0VnMWRkcm1XUFdnTkRkRlNV?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 645f0486-f302-437e-298d-08dc9a9de450
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:50:11.2382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xCIWGTWYqNHxDE7kOkMHCiGAI4dmKOSyVKfR3ei29nBL//iI7Pu3zuxlE2Ruuw4Uya1NnsBXnXOwMvts9ErZ8rzCUInmk5Y4ZWyzQNOeR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9763
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 13:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201425

Hi Florian,

On 7/2/24 10:16 AM, Florian Amstutz via lists.openembedded.org wrote:
> You don't often get email from florian.amstutz=scs.ch@lists.openembedded.org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
> If i or j have not been unset in do_deploy:prepend functions, images are not correctly
> copied to DEPLOYDIR.
> 
> Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 54ea2e9e50..70fb192d6e 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -209,6 +209,7 @@ RDEPENDS:${PN} += "${PN}-env"
>   do_deploy () {
>       if [ -n "${UBOOT_CONFIG}" ]
>       then
> +        unset i j

There are a LOT more of those missing in do_install, do_deploy, etc... 
could you please fix all of them? I imagine that we can also remove the 
`unset` after the for-loops if they are done before the for-loop?

Cheers,
Quentin

