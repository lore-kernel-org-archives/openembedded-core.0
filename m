Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B34C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 13:59:59 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.97])
 by mx.groups.io with SMTP id smtpd.web10.25138.1719928790950940921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 06:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Y0bYgx3F;
 spf=pass (domain: cherry.de, ip: 40.107.241.97, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdE1Z5i6e2BnGT82xxALUPMVTNdRhzhxXTyNP5Hbjg6FyL0XMD9NQxJcmpaM6ZcJItWRWoxhJcHW8goX53R80aVW9KzG7TPW1kvSNK0zZEHE+qKSHspb4z3eS82NKLZPYTsMudpylm8XXF5tPZ/uCfrQyt9FyaLR6G2wp8yKtfeolhA2p6xFxle8LhvJuMQpSAalw6rR4qDEgihh517a1za6SA48VGX+JrJug1I8uUdpfe/ULWTzZQjN1FBkLsJ9MNaWdmzQppkZ0xSS3PANMHNztMnErgGBoYRqHjQJqJHD2j6SSV+SrScpJrb7sKzNTaIG/BmdMjs4yEV1ks2htQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoZwDpV8fwKZJV8sKM8vU1KLt4QEBtTDZDuQL9K8M7U=;
 b=m9NK9V/0a88efOwIwha35LnYcTo0Ic/+Do+htQ+hZSCr8pwhGLnujFAkTnHJowTpMymwL7mgMP15QWjeqLjk15AjqCyEVnCQdY4QyhZ1QLq6EACnjx0HTCkyLEWVoFErObaa68BfmdS0z+7hlhrAn02JtNXfMM73eYWh7yPldFag4itNRJfpC/HmJGHGpUQ+petIy+6CSifNiXhYlGU9Z8ycBrk1fUQzEiNcmZYTsG+BWtIJr11h/OwHdmA/ryvDIGvL+QdFRl1WbuCx6/XPI+0KS3iQYrk9ZyKjRNplYH6eyTvhxRLcgWSZ8NhS0cGjGMznRz64s8eoiEo6xmxFRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoZwDpV8fwKZJV8sKM8vU1KLt4QEBtTDZDuQL9K8M7U=;
 b=Y0bYgx3FqoOf3fHBrtenq+ePbeJqKvx23+Mj8ZJQxrwUrquu038Qm85kNZCbNHmkH0l3/GAuvDRwmjdyHvMbSCOKUEu43XvmViCqpyQdo4Qrg0cGbdLCG00Vy5nN7thXffy24exUaeFfyfyWxdwL1tvlquF3X7SithwX3xU0Rtc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by PAXPR04MB9280.eurprd04.prod.outlook.com (2603:10a6:102:2b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 13:59:46 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 13:59:46 +0000
Message-ID: <48424797-ee2a-4c04-a8f2-002b20999618@cherry.de>
Date: Tue, 2 Jul 2024 15:59:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] uboot-sign: Fix index error in
 concat_dtb_helper() with multiple configs
To: florian.amstutz@scs.ch, openembedded-core@lists.openembedded.org
References: <JEms.1719908080585714390.toXE@lists.openembedded.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <JEms.1719908080585714390.toXE@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|PAXPR04MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d028b09-4a4a-45c4-0d6e-08dc9a9f3b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wkk3Z2FRYWVDcFdnK3NLVmZKRFoyb0ZNTzJCblNMSG5iWTNuSU9wQXVRT2Zh?=
 =?utf-8?B?ZmYwUXpRc3hXekxkOWNLdDk0UGZXRks5TUhPSE5rb1g0Z1dKb1lVUGlCNTBX?=
 =?utf-8?B?U0s3T0RDTmxjV1g4VGp6K2JKckhBK2h3dnRweHBBMXhNQzJIeVQ0bkE5cE9Z?=
 =?utf-8?B?UWdmcEs3OEZ1MVpyQjZONklWcTZtU3JzUFVxOUQ1NG9JMXl0N012ekV4aGoz?=
 =?utf-8?B?bTd0bWsvS3ozSGNjeFF4Qm8xNktHM2dTNHpXMjg1bVR0NWExbzNLZUJ5RUFi?=
 =?utf-8?B?R1Y3dXZHNE55d3VzdEQyRFhyZW9pQ0VOS0ZEd1FuU3ArZU4xaU1BMy8wdU03?=
 =?utf-8?B?WTkwSG5zblc5cllaaWZ0UzY5VEttVmpCVlVnK05kZElOUFA4MG5qNkJGZVNL?=
 =?utf-8?B?b0UvaU1JRU9maFR5ekJBb09tQ0RMbGRRQ3Bqd1M3c3hSRjhyeHBkSTlRR0Qr?=
 =?utf-8?B?dFJoNFdRaC82TS92UUd3ZU5IZHFFc2dQN0pkZlZNa3kzWnZVWE12ajd5MGFK?=
 =?utf-8?B?WTA1cGgwTFgwT0dFZXhsT3dlSHVRR1VjOVhBNXdXNW5vZ3M5OWdkdERxZ3ND?=
 =?utf-8?B?aHMzdGNqQlFZQTREbFp0UzN4SzY0UHFJdFNqaGdOWUJXL01qRC9mVG83ZkdT?=
 =?utf-8?B?ckM2RVoxd3c3U0djcDA3NmVtVVg3d0s5N3VFeGVKWFBlaTIzK1VBbGhEd3ln?=
 =?utf-8?B?YVZqb3JFV3pDeG1DS1NTUGdZTmU2YUpiQncxNXgzallzVkkxU3o1c3RmV0NO?=
 =?utf-8?B?ZmYzMXZLWWV1amR5enNmN0lNRXJ0KytRaTRXMW5RQzZEODd0VmFEMVdUS3F0?=
 =?utf-8?B?aVpnUmRnMGFlblhrNTE0WjZmT1JtV08xR1Nkeklpdi9Ta1d3ekFqWmU1bDlm?=
 =?utf-8?B?T1ZSb1dhMU9VZ1BGOWhWWkc2dWlTZU41V2lMeTFwRkIvM3VxdmNzWXFaTVQz?=
 =?utf-8?B?VGFZMWlPejhIakd6ekY1K0NIV0JNdXZRQVYyT1dOK05WS3FXUXJ6RFczQmQ2?=
 =?utf-8?B?djlyYmpOOFF2bjJpVXhCZStYYzhWZzNrV0x6ekZKcHhTUURLK21XR0lxOGNi?=
 =?utf-8?B?OFFycGtmOE94NkwrRU8ycnV6bjRJam1JcS9jRU45TTk5VzJsRi9EN0pMc29Q?=
 =?utf-8?B?U3ZaUDZsTEFhdDdBQm1OSndQdFcwa1JXeFdvQzlpZTVlN0ZNdXFvdm4ycGdn?=
 =?utf-8?B?ak8xMHI1bUZKQkdodVpZSWNMUzJJMDJYVzhSOVhMUGtpV1ZOYS85NEt4K0pK?=
 =?utf-8?B?dU03cmlkVXluR3RLb1I1UDdMVnBQbE5LTzh2MlFPa3NCVXZUYVg3ZkpuL1Er?=
 =?utf-8?B?Mk1vb2h6eTd0THZ1MXhpTSs4RFFWZVNBYjVFaGJqdEVxdDJ4TkFvNUFaMmwv?=
 =?utf-8?B?NHNqNUgySVMxQldnRnp1T25nTkZuenhoa21tOXFGUWUyUmxYYzlZcjhERDlq?=
 =?utf-8?B?bWd6dkloYUl5LytxTlFQQVpsV01ZOTI0WHlGQW9Sdi9admNTMzdmWUZ2Qmts?=
 =?utf-8?B?SzNsWTY0NG9NVjNROVFZM0llRWJzaHdrOUhlTnFCSHdKRFFkb0c1eGlTanJt?=
 =?utf-8?B?cXhkcE8vS3g2SlpVWjNnckJnd09HQ0NUdnhzOGNRK2lUcHB3Zi83TUVJdElR?=
 =?utf-8?B?OUNQcjM3Rng3bjdlaVJYNE1ubFB6dWxGejNON0tWZDBhZ0htTGpLWWx3bFZm?=
 =?utf-8?B?bEZvbWVxbUhjMERnMUh3UytKaVVadnI0TlBtT3lkOS8zYW5JTm9INW9objdx?=
 =?utf-8?B?OHVyeTlaQkNmeTY4YTVKU0pkZXBBUWhEendTV2w4eWtUb1krU0xrUk5ob2Fr?=
 =?utf-8?B?MWRvWHRTWlJlRnVvT0Yydz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjJ1T3pZNk5CNk0vOEVPOVRVelo1UVFxV25LVlczQzZtS3JIU3R5M1NtZHpD?=
 =?utf-8?B?M0VnTXhVM2NiZlVPdjFlTjA3WHY1NDFFMEJIcWcrbWxkWERRS284TjBsKzA3?=
 =?utf-8?B?eU9FaE1sYmxKNm5wQzRlVHc5endDY0t5RXlqUXRjcVRJZ0JPMmJPSUFXeWZr?=
 =?utf-8?B?NE5DWml6bFhCcWRpNHlkRlJlMVFBYUI4bDNrZ2t0TFliYk12d1E1VWR0NEc2?=
 =?utf-8?B?MEFmU0RGZ2lkZUhWM25uL0s2UWdKNnUyL1hueElIT29FWEFrRFArb2wrSS9o?=
 =?utf-8?B?bEl2YlBPeUM5d1BETEt4aXFiVWd5VUNLS0c0dzNaNHMxaHRFc2JFNkhvM1I3?=
 =?utf-8?B?ZDFLd2ZNY0d3UFk3YmQ4eDlZaEpFMGwwK1BQRXlCcUowMU1WWEx2S2xDWXpU?=
 =?utf-8?B?WUVEd0x6alA3TmpiVkpGd2JJYlJKR2xRbHhUMHdKc3JxNmZsTE5seVllbDNX?=
 =?utf-8?B?YmVYT1IzNEtjNitoaHVsWFdGRUFta0k1djg1alZYbkVrdGczZUZxU0hseCt1?=
 =?utf-8?B?Znc4dzJ6aW9POStBT1NIbHplYThaRVJHb1NMK1BPSHRXMldJYWN5cDRqU281?=
 =?utf-8?B?bStvTlNqQzRPZlI2Q1NCZUU2MHVWczVFNVNjNDhJMHlyYVFNbTQzbEpnV2hi?=
 =?utf-8?B?L2NMRDVraWVLNkhQbHlLeWhObHZ1WURsdUJmYWdTZm51aEJDc1d1amp1NTZw?=
 =?utf-8?B?NndhRm90aHlQU3M4bk5zWDZoeDV2ZjFzU0pRT0dxUi9RSzhJSHBFYnFsVGh4?=
 =?utf-8?B?YTI2WmZPVlVPZ1BaTkRrdVBPeDBjSEZocmJzdXBhSkI1SCtpOWRNM0NhZ1pR?=
 =?utf-8?B?ODh0dkVtV3BNekhCdHM5clBzV0pOTDJXclo5UndXaU9IZ1ZIWWpFdGw4ZGVK?=
 =?utf-8?B?cDNqQVFObXpxR2RYUmVxY0dsaEl1QU5tUEh3OFpOR0xhYTBKV21TNlJ1RUpY?=
 =?utf-8?B?VjVYSThSNGs0ckkxY3IzSTdMQ3JmTHNOUVpLVDdVeHVJOGJJSjdPWlkxbU4w?=
 =?utf-8?B?dXVKaDZ5VGtFK2djcTh1b3dpeGh3MmU2aHIrUHFRWHBrUUdFNytpRVlPL2FK?=
 =?utf-8?B?NjBzdGgzVUdkVHBPSGZ1cEtHM1FqNDFpWnJaWkVWb2hvSElYd0crNWVUc2Uy?=
 =?utf-8?B?cUJtMTJnY2tWNXh5K3lVVXVTcnJuYU5EU1ptQTZHem5LMndwYjh4Ujc2YlVX?=
 =?utf-8?B?K1Z6dUNlNnFQdE1UNGNRWkQ2NUhTek1jUEp2c2s0Ynp6bndwUjdPQm1QRkdZ?=
 =?utf-8?B?ZXVkcHVsRmM4YTBaRWJNaU4rNEloR2RMamUwb3paZ3JOTWJiSGFua3NCZGpO?=
 =?utf-8?B?dHBKSzBsdnhoeEdDa2J5OG92SEVsbWtldjd2Uy9aWCtWQkdiUHRnVC9jMGta?=
 =?utf-8?B?c1lKbjlFcjZ2aUEvbTVnYjNMTitQdWFsVC9oenRUOVdFTWtmYmsvNWl3Y2Zo?=
 =?utf-8?B?RWZzajBnOTZwM21hdHdXTmd0MFNVVEhQYkFkbXhCcHZTVTc4bXd0dG1BaFRJ?=
 =?utf-8?B?ZVB0UUluZ3gvbDJIRHpLNy9ma2o1cUEwcWxRdFd6enBhY2ZHb1NWc0Z5bFFP?=
 =?utf-8?B?TFh4NFNhN0JRSER2OG1pc05IK1Rua0g2QWdVcWhuUE9reXd1RFluRWJhR3BY?=
 =?utf-8?B?ME9oWWJqQjFWWFM5MGhPYUJkS0NPbnJOSUVvTzYyMDUwUlp5cUdNWnl1eTVq?=
 =?utf-8?B?M25qSXlrMXU3RHB1ZVJRdnlMM01IekY1VFRrNnhodHVkQ0FVS3R0ejNnbmJa?=
 =?utf-8?B?dllwc2FZUmhvL1ppU1JIYXIrZTJmK2haNitpamE4TGtjRWFFbkZHcnpGeEN4?=
 =?utf-8?B?ZnZIRVFrWUJyQldWNFpLYmJFcWVsNG5VRUI4clZaNWJ3S1ZRT3FZc1R6dnVa?=
 =?utf-8?B?cXRLRnlBZzBPQ0NhM1VmcUhVejliRlRzbCtZSG9CVkRoaWhtbXNIM1g3eUxn?=
 =?utf-8?B?U2FPV3l1bmdyUFBXM1VRamFpNitDUi9JK2FWQXVzV2NUN1dPZjVscVlsMHMr?=
 =?utf-8?B?VDVMMm9heUs4OHhqNldQYll1UWNtaG5tZmRac0FWUVZ6amVsdXhDMWlIVzNO?=
 =?utf-8?B?MUFQSVcwM01TdjFUOWwyN1BKelZBY2RZNER2bE5Ka1dicW1aU3EwZStGZXFI?=
 =?utf-8?B?WnNDaS9WMzRJN3p6ckxQOEUzY3R4T1RBdzZaTEs0ckI1cy9YNlJiazgram1M?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d028b09-4a4a-45c4-0d6e-08dc9a9f3b46
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:59:46.6034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZUMi573tDYK45SJWS7ppQfPHz3wQwCWTxVvfIGCrr/vek8G0nEhxkU8z9Z/QLJt9XbcnRuxula8a4sr7q3YCy1yGHjdYXoEM6cvqcexf8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 13:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201426

Hi Florian,

On 7/2/24 10:14 AM, Florian Amstutz via lists.openembedded.org wrote:
> You don't often get email from florian.amstutz=scs.ch@lists.openembedded.org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
> Since j is not unset after the inner loop, the image will only be copied
> for the first configuration.
> 
> 
> Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
> ---
>   meta/classes/uboot-sign.bbclass | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> index 6bb4ddc600..5b75c8a3b0 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -137,8 +137,7 @@ concat_dtb_helper() {
> 
>                          if [ -n "${UBOOT_CONFIG}" ]
>                          then
> -                               i=0
> -                               j=0
> +                               unset i j

What about only unsetting i and j wherever actually needed?

I.e.

unset i

here

>                                  for config in ${UBOOT_MACHINE}; do
>                                          i=$(expr $i + 1);

unset j

here

>                                          for type in ${UBOOT_CONFIG}; do
> @@ -148,7 +147,9 @@ concat_dtb_helper() {
>                                                          cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_SUFFIX}

Breaking here would make a lot of (/more?) sense, we're otherwise 
looping unnecessarily.

Cheers,
Quentin

