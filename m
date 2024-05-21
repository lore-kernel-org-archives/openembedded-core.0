Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127EEC25B75
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:06:54 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.95])
 by mx.groups.io with SMTP id smtpd.web11.17003.1716289606482234330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CX1Sh2+h;
 spf=pass (domain: cherry.de, ip: 40.107.15.95, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS9zWgVPsrnBoijAOoN1HJ1la2C9neqXOfV03gPHz5/G5SBJFL61/A6f1kLNdjaKITNkcZX8b26SgWfX1NYNHo6ZxBwg6IO/+LnvWZfcJ/P8z9IJELHInEVzyqv2yXTgKsSJHoVL5fQwZkAD5zyVHqTexiOOYNBGbQv3YT6+4dXJ9a7j8G/5OAebKL6WqEnTv2ak/3+E9sHgO98BUHbCmHcShR0oSIPx2HkzBkHmQupYwX1Dfvfz8M5tF+iIfEI5yzzvd+le2pX5FqCvO5Z42EtleZfromXpz5y4wWXAdCs72vsV9G0G6r3DA7PrGfe949W+u+aqNFxq4MILoT5/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2FvFM8++jgdlU+/VC9upkTLgIhXO4zHIfS2Ra9OD5w=;
 b=mfeiqYDYpNqxVc1kizmAjv1Ctn6xo1HOVLeKru/eP9/Nx3B4daMRWq8LTdNsu5sHDFcm3T41BiJ6Gno01rELMnSPwMT2hoKp6wId4mbgYLnHWDfRiRRftR2TzyT2u6clzcoGWNuzTDSJCyPZMAUh+NCoFvTgBULkWetp/oxTxpf3jn8Sz+0xCy/qbP86G4iFRUc5LoE64P3AqOcgGFVcI9UKS9k+sPDJoVu6VQLsB7ey2JYUFHQ96q1CFpeTzjCuvIbViethv0WeZdtjH36TPPA9nYGh5/8tDv8XtPogzGCOD9Vx7FiO5b7gGrcV5xFJDeVJxHajW5h1yoas5MvTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2FvFM8++jgdlU+/VC9upkTLgIhXO4zHIfS2Ra9OD5w=;
 b=CX1Sh2+ht0Z4CAGiAQmK8s0N9CNrJMuMWfrNZDjtszgPWQapXA4Aw2kjWMhUXk96N3ZbqHjhM7h0pA3wh4dD9i7QKSt18bNRL890ePNJVxEyNJdqK6/Q9vvlAd+ar1etRdZn7QDyBgET3Y7LInZS0b8a9Cbs2rcwiu90IzF8r14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 11:06:42 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 11:06:41 +0000
Message-ID: <36619966-0b21-43ee-8674-33ed12279a4d@cherry.de>
Date: Tue, 21 May 2024 13:06:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: Avoid QA check
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20240521103631.1122991-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240521103631.1122991-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|AS8PR04MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b50f61-c910-4d37-0b17-08dc79861806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWVKYWFlYVZlelBSd005dXdMN3llMXlCWXF4T0xKcytXY21UdDdzTFY0Vkx2?=
 =?utf-8?B?UWhFQ2xqUElSM1ZydGwycW9YYXJCUWtpbmxxcmhMR1kxQWFlK29tZEwzT1Ra?=
 =?utf-8?B?TzFzRmJidCtLYzJ3eEwvRllDbjVqdmhadFNUQ1hQcDZma0VTT0VobUtkMnpj?=
 =?utf-8?B?b1BXWUdCd1RoN0VPbmtHZGI3SjgxMExZbXZuaHZhcHQ1WWtvdXc0dHpRYVpw?=
 =?utf-8?B?R01RU1hyb0NrRE16V3UzYi9KWmg4enRjSWRSQU5qSTdVRG11Q1l1dkcvVXpt?=
 =?utf-8?B?dVA5eFdxL3lNYTdQZ0NTNlB4bmJ1cEFVWHdUMDBDMDdsNmpPeEFwSXJlSSty?=
 =?utf-8?B?d09STFdKV0NnZUhWOVVDZ2ZWeXZYNlljR2R6NW15MjlaK2lCQjZxbExTYm4w?=
 =?utf-8?B?b3ZxR3BhVXZyUk5zSkpKN3VyQXZVMytuMTZySDUzTzl0cm5VNHpiUDc3N1hs?=
 =?utf-8?B?Qi9HNkprL3c4WThRQ2d5aUZYK3BGb09QbkRhanl3NkFaV1VLL1JzT3dMTU5z?=
 =?utf-8?B?NHk0MVR5TEJ4NWpGVk1WVGw1RG1HbjJodFMyMzFjTUlNUFJOQmFNT25CYWtI?=
 =?utf-8?B?YnF6dnU0aVpxbjhYWlkvRHhhNURMZHhzeWhaWC9LbE04Uk96Mjk0TFYxMVFz?=
 =?utf-8?B?bVpnSktQZDNldmFvM0Z6RVF3blJ2N1VPOGN2bGxWN0t1c0pjMG9OdzhsQWVq?=
 =?utf-8?B?WDU0QjI2ay9TeVJNWkJmV1dXc010cmtHS0owL3BWSFhhRGkyMGpOVXpNSkpm?=
 =?utf-8?B?c0p5TUpodjVwTThWWUVkSU9OZ0VLYmFOeHJVY1ZheVNFMkw2OUpjQTFValNh?=
 =?utf-8?B?ck4wK0MrOGJPRnUrRVZpaUJ5VUxCSzFWS0JaL1RyS00vN1FIcTZCNkdMa09P?=
 =?utf-8?B?Uk5FWFVGRHdoN2h3c2VhZzlxUDRNU1gyb1cyRnNBM1EyOStUck1LcGRNMjBw?=
 =?utf-8?B?emZvb1hTbGxqT3ZRU3RING9TQ0I5ZjVDd1NzSmh1WGZKTlV0ZjF2OFdFVVIx?=
 =?utf-8?B?bnBIM1FvVUNKdmNZUjBTTmMzdnVzMUEwUk1lRzlIYkFuZU9nNWwxTlM0Z0lk?=
 =?utf-8?B?eUF3T0k0ZXZ0ZXpzQkpCTHJQUk1NYmlvNUI0YUNtYVJuUTdZZkFpM3pqN2xY?=
 =?utf-8?B?VjcwUkt4Y2IrY283a0F6dS95UEZHK3hoMDU5YmZJOHRhTndFVG8wWXdGUjFO?=
 =?utf-8?B?cHRudVVWaUFqN2g3bzdwSDdPMkFUYUIzbSsvbU5FRTNHT3FOSmFlZHlKQWVp?=
 =?utf-8?B?TERwQkxDTjZNN2ZXczY5SGQ1RGREMEpUUmgvaG1yVFBzSG5UMUc1Ni9WaStH?=
 =?utf-8?B?SmZVNHRoeEFhTjlrK1VhRXBMUDRkQTNWVUk4QU1oNTljNC9LbCtZYlV4Vkx3?=
 =?utf-8?B?Ym5NZ2h3Q25MbzFrMmdGTW1CYW50cWVLT2dHeVdwWU1jSVlWWDZJWHRmMGVw?=
 =?utf-8?B?UGFWTlRmdzdwMS83S1RRRzRLR2tQSVBPM0FLTGhBUEVUOWJiaGltQzR6d3lT?=
 =?utf-8?B?TXJ1RDBMWFBxMTNyTFZ1dVZWcWorb3FyUldvcW9BUHIzT3RtcWs2VUx0ZGZI?=
 =?utf-8?B?TklWWVE3WHNQR1cwTUhhWElxUnZNeDVJRUY5NlRRWDdNMkIwNTJubko0ek0y?=
 =?utf-8?B?VFhDQ1lCOThvbDE2UkJrWm92VEY1RWJVNXZ0MnBMVHJqc2JGUU1pcmt2d2JQ?=
 =?utf-8?B?VE5IRU9XWGFiTDVpeml2UXYzT0p0ajBzb0JwdkhDeHpQWmprN0RQRTFRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTRwb1RUNVVXaWw0eE5FZTZHdHRsdzF3WTZ6ZkhTUXdBOHhSYnI0U1dGb05V?=
 =?utf-8?B?SzVncGdTTlFFSVNVTG5NZ1BSVnpraWxOUUo5dGp1MTBHY2svSzR6YVdvODlr?=
 =?utf-8?B?WjhOWFNZTGZzV1dBRkhHenRxTDRtTFNwYkZMMkFvUmtZQ3gySFFmVzBOalRL?=
 =?utf-8?B?TEtJTFNoQXk1Z0wvdmlaQ1l1cnIzWHIralBsdnc1ZWZlQ3pOTHJVS1U5dTJ6?=
 =?utf-8?B?cGJRcjdiSnpUUGRIWk10WDBnckJndHR6WWhCVTEzU1I1T0g4UjJSdU5uZmp0?=
 =?utf-8?B?Q2JOUCs2QVVhVVAxN3FrTjJjTEpBUFpQOTZpZ3JRTzg4YTdibldrZUc0SmFh?=
 =?utf-8?B?TGhySjRFNGR4SDZsQWppNjlEQkl4SVJqZHg5c01xRDNiMVd2WGRKdlZodjZH?=
 =?utf-8?B?L1ZkN0VmN081T2I5VGhEWXU1N2tZWE8rWXN6VHFESXdqRjlubWozVHl3NmRQ?=
 =?utf-8?B?UGMvc0VOUWNrMTlmVEQxbjJwR2JKMlI3OEZkbjBTeFRtZFRoeE5KWHlTSE1x?=
 =?utf-8?B?TmpIVExTL3VpaE92WjJwUkgrYmFjZ1ZqMGFSVzAwUmR2QlRsalc3U1UyaEJs?=
 =?utf-8?B?Rk1tVE9NT3RGOFVBT0dtVWtHVDNUakpwYWRFUUJSTEwxeGdXVEtnT25wV05C?=
 =?utf-8?B?MGNBS3hnSVRYK3VlUkVPRDBXV25ReE9keU1lVTlOR2xzU2pVNEF1dWhsU0hU?=
 =?utf-8?B?NWtPOFZxbHliNzZwN2MvWlEvVFF3Z2MzT2lJcjh6RWhhaEp3MzZ1Ui9IcEFr?=
 =?utf-8?B?V25NV292SWU3UG1jQmpSTU5raEtIVVJ2MDQ1RWdKaWZmclBPTXhONmk0eUZ4?=
 =?utf-8?B?alEyWFkvTjJxKy9Hb3l6VUNhZWp3ZGhXZ0JIUzdLZjVEWGNsbXV1UXNQUVpG?=
 =?utf-8?B?dFIwNHdJejRLN1BsazZBTXFTN2QvV0VKYVNwKzBxMndhTCtsQVhvU3VsZW9Z?=
 =?utf-8?B?ejZNUDJUT0NoUEN1WDZaQ1JMcUx2RWk2YUY4NTdFOGR2SUF0QU9MRWpldFM0?=
 =?utf-8?B?aTJmdXlUb3JOR3pOSUtvZk9nU1YxOFpZdDNuNENXOExiblR6R0NXWW16K2hh?=
 =?utf-8?B?WlVzMnlaZ1Rva3FPWG1LcTd1ZHZ1eEZWNmFUWXNaaC8xM1pEaG40ditJWjhZ?=
 =?utf-8?B?RHV4Q0dtRnYyZDM4dFc5MzYyejE4cHE5QXQxM0Zkbzgvbi9qUWZmNHI5MFdk?=
 =?utf-8?B?RFh5Umc5dmVuREFCUzhmRUZGcXhQV0VXcGwzNkFOQjU3c050QVBEWGNQV0lO?=
 =?utf-8?B?UTZCZkxSMk1UY2trN2Y3RGpFNVR0cCt6cThjdVF1VGVQbTBQd3g0cXpIYlE5?=
 =?utf-8?B?R3pzRlhZUGZrUTdYVEt1bnZ3K1NlTFdOcEQrODZKWkJLZFNUbDRVZFVzWkQ5?=
 =?utf-8?B?MEQzVXN4WGJKeDNFbDgxa1F6TkxzSXVsaHhJck82VGlUa29vemVDSlUra0pP?=
 =?utf-8?B?ekFnNzkrdlQxVjFGeUJEUCtkUXdKOVBXdmxrRTlrWFBXbm5LNERDQW1ZL3kw?=
 =?utf-8?B?ZVBKNVZNQnVaMmE3Y3VETHQ1YStQd1N6TGhndkd3d0oxdzhoc3QrbzhjeWhM?=
 =?utf-8?B?ak5KTEZkOGVqLzJLVDlUMWJwVUJqNkJBM1Y2TkhiMXE1bG5nQ2VpV0JuSG9Z?=
 =?utf-8?B?WnRZM3R6ZnJ1czFWbUQyYTZsMjJQRGhMOWpqZWdtLzNidGNoTGFVa09JZzBx?=
 =?utf-8?B?dUdQTk9JOGFNMEVWeHNNK0FXRkF1N0ZZNjY2dnRoVWQvVWd3dUw4YUtPVG9n?=
 =?utf-8?B?WTRadzYrZHRVSk9LZ1FpeVphZlNzM1VQS1lDamhtei9yTDVBVmljci8yS1By?=
 =?utf-8?B?SDRLbG9KRkxGcDFVMm9UT0pOMGYyOWV1L284eVZYc0FRT1VhTTRKK0ZHeStU?=
 =?utf-8?B?cGNkQkxQbTl5djIycHEzb2pSVFhaSDhSV0NtNjRib0ZuQlF1Rm05YUJuT2Uw?=
 =?utf-8?B?TFRvTEx3YVAvZWNaS3JwTHNVK1NvdHhkci90cEN2MGhWQjBKR09OWU8yN0lF?=
 =?utf-8?B?d2JqRS9qT0RYSEVJNGJwK3JSQmZtVHQ2VEpuWWYrazhkaGdFVkhiaEFUYlcz?=
 =?utf-8?B?RDAwcVh5SnJUb3cramtqZksySm0zWWtpaEtuM1RpL090SUFEQm1FWGJnYUVv?=
 =?utf-8?B?K3pxdnQybjc1a2t6K3dqRGN1OFFqK1hMeXY4Wmw0djhvWVFPM1A3L0NqcHc2?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b50f61-c910-4d37-0b17-08dc79861806
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 11:06:41.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYmhixD2tbbzErZVqljcYdWbuRa83OJKjN4ETbU+edvW7wjT8auhx9t+/T8rs+4f7UQDQK/tkCvYhCrtahcHvsECIjCp3tRCACa06zMhRZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199617

Hi Richard,

On 5/21/24 12:36 PM, Richard Purdie via lists.openembedded.org wrote:
> The kernel has special handling of ${S} and it is therefore expected to be empty
> at do_unpack time. For now, ignore this QA check until the kernel unpack process
> can be more standardised.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
> index e8ff7311c32..f741a342d40 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -440,6 +440,11 @@ do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
>   do_kernel_metadata[file-checksums] = " ${@get_dirs_with_fragments(d)}"
>   do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
>   
> +# ${S} doesn't exist for us at unpack
> +do_qa_unpack() {
> +    return
> +}
> +

Shouldn't this rather be for all kernels?

meta/classes-recipe/kernelsrc.bbclass

sets S to STAGING_KERNEL_DIR which is in work-shared.

Won't we have an issue for other kernel recipes outside of kernel-yocto 
that we should fix?

For example, my kernel recipes do not inherit kernel-yocto, so I 
wouldn't benefit from this fix.

Basically, I'm suggesting we add do_qa_unpack() { return } to 
kernelsrc.bbclass instead.

Cheers,
Quentin

