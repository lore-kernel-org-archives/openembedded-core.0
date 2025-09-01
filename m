Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5FECA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 10:00:09 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.web10.47704.1756720803979057584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 03:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eWU9/+MD;
 spf=pass (domain: cherry.de, ip: 52.101.66.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KicnBgOBppdmNp9QmHfaq2zxvRveK1h6rOTpq82RlsNGQP01dPqJWL/Ju9x4W0HIc/7SdYIh6Dl2jtYoe6H02V7oDdVGfIlMPipg7KgevBHhHQBF1wZxJsCchgui6vhBOeY0YICtVRDXf4cfdqCHgXxIIbC3qTdYYCXelqPx+1RukbQuJqyYyKjFn6CxvOJtOy4vfnIVPI2VNVnTpPS8bfxQYedUVpEwreVGQaGXSHSjtb46V5/UD+4+XF48OJqiHd5yzbwDDqGhz52rbRILjZv9OhUUPMdR0hQbDkqqU+29nvkUdoKn9vdt2+NpBjsz4an0iEMOeCXJd/5Hk3zKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGrWZqFmdilt8H/Vy+F8ycl5n5uNFNy6482+njVVDPs=;
 b=g5Q6xxt293SSD8HVlPH0VovzyjbrMCjoeUSwlmamw+buHVDN2+qsjOD3TNNNVa+fEVSVfim/jvau8KB4xxcBquPFrxyMEB6UIufWmWMiwJ/FM1bLlRxG+oG6eTaYSbLSYaUr2BXdwEwjFJopXHG1e66BCLgUrcFG9XaPaDwZSarrY7ONz3OCxEqfXBirMMBAIJ1USCix0GAA/gogbANXtNmgv1fM/xWQG/ToP00V0Ua9tJWPBi9ndUuWX7TmcyyE1mfoPnbCaUUNLs/1qiOA7WtWDvQ/QWAZee1nfkwPRuEK/R5QWL/1g5eFuz4DtgcZofPDKRV8/eFq98YyPRzUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGrWZqFmdilt8H/Vy+F8ycl5n5uNFNy6482+njVVDPs=;
 b=eWU9/+MDiUP4KLBTQcscyHnJfSQxVMBL56VkMr4y0raIrbE7f2kYM8EzLflipwm6U1KO6gniWlOm63bNs3wTxYOOnVIT6veyTtaweJdBnj/PUL330bg0sYlGRv8lQC4vKD8ODnvQ/zy+AxoBX2873hX6l+Jq9sMMoIBG8qBnIHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8921.eurprd04.prod.outlook.com (2603:10a6:20b:408::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Mon, 1 Sep
 2025 10:00:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 10:00:00 +0000
Message-ID: <de3c765c-494f-44bc-8fc1-c2aac5168100@cherry.de>
Date: Mon, 1 Sep 2025 11:59:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust-target-config: Add has-thread-local option
To: perxjoh@axis.com, openembedded-core@lists.openembedded.org
References: <20250825133004.3154972-1-perxjoh@axis.com>
Content-Language: en-US
Cc: Steve Sakoman <steve@sakoman.com>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250825133004.3154972-1-perxjoh@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f8a395-317a-41cd-a597-08dde93e5099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?djQ2Ym5VUWV4cFpjTWZQczQxalFFMkVKVEJHTW5nN3VPNXR1QUxGWUxHZFNt?=
 =?utf-8?B?QUcwaWVFSUkrUHYrVlZkZFpZbFJWVy9QcllGN3lydjhpUkphekZpMExab1Iv?=
 =?utf-8?B?WmRHTWlxZlVEeW8xaDlPc1lIZ2RzakdNOE9aVmdlcGlqenJ1QVJtN25zOFQ5?=
 =?utf-8?B?dDNhTlFKSzgvY1Y4S054L0VLd3hYTEdQYkRFVGR4aFRTcjhQYm9JcW13TVI1?=
 =?utf-8?B?UUlhd1Q0QTBUajJzb1ZwTmNteDdSanZPVGZBNzI4ZE80SzRxb2xUUzRTcDcx?=
 =?utf-8?B?cURYTXVmK1ZrQXZtZkJEZ01melZ0eDBsSGFmWERxdmNiM2gxOEhQcVc2U3Zh?=
 =?utf-8?B?Vk5MN004S3NHRElSbENrVEYwbFNJTjhSMFkwSFRvc3NmenY3c2JQdW9ZTjYz?=
 =?utf-8?B?NklkZUI4OHFhUDJ4bjNBVVpSdFZkMDlwZkY3aFhXMHpPUndzMDU5Szk1L2RM?=
 =?utf-8?B?dytCaEpSZllQZmNlZjJHWWcvbjZsUnR5M0dRdGx5cWFKMXBzRFpWTDZ6MVZs?=
 =?utf-8?B?enlubk8wL2I0MVAxYzJlWVdKRllENTVLQ2V0cnpRdFlRcDJQWHg3alc5L213?=
 =?utf-8?B?MGtTZ1dJZnBkaVUwb05MazNtZnExclYwMHIvaDZqR2ZGRW9aTTJkRDVDVjVi?=
 =?utf-8?B?R1k1QitVR0hsZmpMWVY3aG9GUW8vRmhobVFNZ1hvZ2k5RGdlNDZFUVY3Wko3?=
 =?utf-8?B?UTE2LzBUVUtaN0d5bmQ4S3pIN0F3Um00bGdieDBqUkhXVzdzWGFPQXpHeVdF?=
 =?utf-8?B?eHpMRnNuVjBJWiszZHk3YzgrMXhGUVp0L3RhS2ZDdzRPQU1uMnZsVGNiQUdp?=
 =?utf-8?B?RlBsKzVVdFBjbThqd2xncndTTjN5b2RCc3NWWXRHL0g1TWpYaUdjdE9SUHBu?=
 =?utf-8?B?VDlqSDhiRmVrSVhmRHF6NXZXbWRWR2p6dHYzcld0endmSThSLzdtUUI1bDAz?=
 =?utf-8?B?NS9Bbm11aXR2emlPcXRqS3FXNXJ3V21ZVUVJVEI2R043SzJpTG9vTnhLd0Fp?=
 =?utf-8?B?M0xrS0oyN0pPS1djRzNrVHAwbDFQQW5zZWorUUpZR1B3S05WOWE0RjBFYmYx?=
 =?utf-8?B?U3BPdU4zdlUyM0xScDg4L3BHcTh3a0tyVWtFSGtnMGpzR1MraitlbCtYOFNu?=
 =?utf-8?B?YzB6UGozaXFaZ1ZVSlV6N2hUWEh5MTZVZi9XdDRRaHlhdTI3L0R4MmprUkps?=
 =?utf-8?B?ZGFqbGRGWnp4eTcyTFR3NVhlM1h2blROZ01XVnVwOStXM0NmKzJzTFhDelhC?=
 =?utf-8?B?UWs3Mk5oZVdHVktxc2RGblVZaUNHNTZaVHZoUzdvUWF1c1k3UmhIVkRtUGM4?=
 =?utf-8?B?b2tGUHZ2c3UvTGYzZG9nKzJOTTVWNFI5YW9qOFpOZTlmbXFoK2E1dGZZQ1Z1?=
 =?utf-8?B?YTZKY1B2MmZPZTljaVVWajJac1dsSFhxamszYTFWRDZza0xFMEUrQlM1TnBO?=
 =?utf-8?B?V3FXNkYveVN0eVc3STh5aWFtUUhQZWJKMGNGUjYxVm1PbnJOMVJ1Y2ppYlp3?=
 =?utf-8?B?WDFEQkZmMVJjTW9WSDBNRHRBbUZRcGxNWVptNDJ2TVZqa245ZS9UcXp4SmhJ?=
 =?utf-8?B?YXFLTkIwOVlvQ3pYblZvVU5tQVpXYkdXbFc5c0lyRlF4aVJ4UUpCejJ2WUdY?=
 =?utf-8?B?WnNDd3lKKy9Da01ibk5EYjc4RHQwdzA3aFRxWExzeExGR0h6Mjl1UHEwODNR?=
 =?utf-8?B?QnlWWEdGcTJRcE80OFlTQzRQdThrZC80NXAxNDZkUkM1UHV3UytFUVl4YzJH?=
 =?utf-8?B?RVBOejBwRUhWYnVwTDF1MWhlMER3MU5KZm4rdW5yTXRjWFdYWlh5Q0ovZ0ZZ?=
 =?utf-8?Q?98R+6In491uWtcEeyIm0xMQojPCJREWoqE7Y4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFhZVlBnYmZOYXhQSmRRWFg3Rm1RUkF1TjhJQmpaMXR1ak04L1pkWEFkSUM0?=
 =?utf-8?B?a3Jrb2dLNklHNjcxaEFlcE5HNXJQM2NUS21VSWErV1BCZjdqQ1pUVUtZU2Fv?=
 =?utf-8?B?UGlESm9CbWtoWjNOME8zdDNSb1QzWlZFUHFYQ2dzWU9ReElabkFXZDdYTGVL?=
 =?utf-8?B?VWo3azBPZVlKWDBFeHlENFJiVUs0OE1mYU5UV00vR0xmWXd3S0o5Nis3Ykpt?=
 =?utf-8?B?VVlZOUFXaFQ2YSt3VVl1cHF2ZFd4azc4NHB6U211YTJTZGdZd0ZaWkhlOWt2?=
 =?utf-8?B?RDVRK2NpMllRdVdyYkl6bXdhMDFqVlR6eExpemw3MzlJT3lLbFpaTm1jNW5r?=
 =?utf-8?B?eUttYXMzeTFXSmRMMkZ2R0Y0OC9rUmIxUHNkU0MxMTlaa3V2RW43S0d1Tm43?=
 =?utf-8?B?ajNubWQ5RkxVZzRpNFlNQmZsVzBtN0J5TUpIZHlkMkRXSHkzVkVuVFBxTXNi?=
 =?utf-8?B?MXJFSXBDMzNIUmFGaGxNNnVlWjNSTDR6M0s1M3JnNmU0dkVLdVJBVk90SjVl?=
 =?utf-8?B?aTlVV2l0dlRRN3hBdEhiZ1Ftb2psYlFrSVJHV3p6TWgzbENuaE1ldnV6Y0Vy?=
 =?utf-8?B?N2w1d1FqYkdMY2RpRTFldHRYVXRWdFhRcWcvMWNSaGxreW80ZjFCaWVKSTN0?=
 =?utf-8?B?MVU0ZDN1Q0p5QmxlTzV4OU1uMW1TUjAyNmRJUml2YW1TU1RrTTR0RkIvMUMx?=
 =?utf-8?B?STNsVWw3SXhGNFRCZ0pndlF3VUU4dk5EazU2U0h6QktWQm4wRjh5U0tTUC85?=
 =?utf-8?B?clBSZDQxMUVUUnVrcysyQkF4emt3RndHc0ZmZGt1bWNWWitQR3IvZ0ZrUEtw?=
 =?utf-8?B?VDdkMjZXcEwzZFhlTFBMakFLK2t5WExLRFRCbnM3Ym1KVlgyaENuRFMxSHJJ?=
 =?utf-8?B?bmJHNUdJeXJpMnpGaHNXRUQvanB0MzJ5TkV4VkYwTHRwR3lLdXlwYUYyVU95?=
 =?utf-8?B?R2xWVWpsRGUwczN5amR5djRvdy9QbE9udjRNQzJldDUwSTMweituUE96aUJR?=
 =?utf-8?B?WkFWT2ZXSXBGRjJCU09qckFiZEtqOHk3Yi9GcTk0dnpoS1Fmb1BmL3pHV1VN?=
 =?utf-8?B?RncrNUd1WWljeDlNZ0svcjNybStHR2NhTjdtUlQwL2UwTHR0UGpQckIydmcr?=
 =?utf-8?B?dHFGSUFvQTdBOGRvODlYMW8ycWJ0a0tNY3gvclVpRVMvVmhPcVlHZkE0alZL?=
 =?utf-8?B?NzZLbnJiTW1PaGZ0ZVZwTmgvalZ6S0Zqb0s2WU00eU1TbHdGTW9XcmdxNVc4?=
 =?utf-8?B?SUNQb3lraWpzTHdzQzZsalFmdDlwUkN5aUtzUzN0WjNkZWhXWTRDd2JqWGJr?=
 =?utf-8?B?bHFkeWlSODBtNXI3c2Z2MWFMQ0xYTGJ2cWRYdHZSWXRvejU2dzVjaGdCSDBX?=
 =?utf-8?B?YWdKdWZRRzY0L0Q2NTBtWU5wYXloOGM5blRYUENVUkhMVUwwcU5xSzlCOXM4?=
 =?utf-8?B?YndxQTNXWXdibXVGdkhrVGtvckprbTFadmE0aDYvK1hoYmVsUTZXUkozMWc2?=
 =?utf-8?B?MFdiRzhiZWYrczFpQVR2TnR0R2FuVHQrb0MwWWx0SEc5cytmTm1RdVZZNERj?=
 =?utf-8?B?SzNCUS9lNVRqaUNFMzNiS2FYbzdWdXRZY0M1dzhlUXdLWmhtKzVJc1VDakFJ?=
 =?utf-8?B?STBvQ2djOVlsdy8xeGFuVnNrTStXSW1iUFY1ZXpNNVRsa29zVGhZRW5TM24w?=
 =?utf-8?B?RzJQUUMzQm1DQ0tHajM5SkFCTURlQ2pBLy85ZWlxL3diRStkeFExNXdOWTlL?=
 =?utf-8?B?MEFGR3h6bVVqdk1HcWFZTWFTM3ZmS2VOaWNEa3IwTGhuZWw1WDZrWHZlYVNp?=
 =?utf-8?B?U21RWkU4cThMWjllbnVVeUcwanlYMlVIK2xTR0Fia3EzTFdjbzVqZ2tKdGVB?=
 =?utf-8?B?QUVwdnFob3ZFbnQrYlFFWXhFeXErUE8vOWRsaVR6U1lrc28wWXo5c1A2NWxv?=
 =?utf-8?B?OTc4U3BXQTFISWhtL1IwT2pPblMwNkZ2YVU0VGJHWkt6cnh5SWZkWUhzcXF2?=
 =?utf-8?B?YXovNWo1NWpIYUtYajN5WmQyYlRrdzBiTU1GNjVEem9MM0p1dkUzZjRNRG9G?=
 =?utf-8?B?N1ltRy9GQXZyMGVOcW92azhrWC9ndFVXcjlabFdwRlcvT296WEVNTU5QSncy?=
 =?utf-8?B?NTlicktvRU0zMXVSV2Z4SHVsUDRJeUpZNC91eDdwcHpacXUxRzRlS21mYjJR?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f8a395-317a-41cd-a597-08dde93e5099
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:00:00.7581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0ecHXxPmoCjXCU8FrN6WBxIrnz8qUnCcsIKXX+I+X6/Aq/+/0gLB2K4ltZ63mrB1Ya3I37BqfNDdzmlPS0pUak/1KWo/8CkEpop4vaqA6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 10:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222653

Cc Steve for backport to stable releases?

The introducing commit goes back to langdale so backporting to scarthgap 
and walnascar would make sense to me? @Per x Johansson/@Steve, what do 
you think?

Cheers,
Quentin

On 8/25/25 3:30 PM, Per x Johansson via lists.openembedded.org wrote:
> [You don't often get email from perxjoh=axis.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The "has-elf-tls" option was removed by the commit
> 8e1614a906086fb46c5dd7b7f2dffab91194165c. However is should have been
> renamed to "has-thread-local", since it was renamed and not removed in
> rust by this commit.
> https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a0d36e011a87ad43045cfd3
> 
> Change-Id: Ia1fdf7698ebeef62a88052713645d5b499164353
> Signed-off-by: Per x Johansson <perxjoh@axis.com>
> ---
>   meta/classes-recipe/rust-target-config.bbclass | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index cac6e90a9e..0df6f0904c 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
>       tspec['linker-is-gnu'] = True
>       tspec['linker-flavor'] = "gcc"
>       tspec['has-rpath'] = True
> +    tspec['has-thread-local'] = True
>       tspec['position-independent-executables'] = True
>       tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
> 
> --
> 2.39.5
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222407): https://lists.openembedded.org/g/openembedded-core/message/222407
> Mute This Topic: https://lists.openembedded.org/mt/114881321/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


