Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AB1C0219E
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 10:34:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.67])
 by mx.groups.io with SMTP id smtpd.web11.48190.1739788450488067302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 02:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TlXX20ml;
 spf=pass (domain: cherry.de, ip: 40.107.159.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbxm9RtZ25tMg29pQxIAtcz1w0MEgR0W/L/8bi+w979LNUzBLttkRMwYuFuhoNRhCmaQBdxEjluPYMVTgwgy0OaA0HIQPW1HwjknF6gHdfLlacOl/XVdOC3hUru9/Sq6GCZ/FQAXd/Qb9cDeLSxpw9tQUVNwPh3DF1J6HcMGax1rTOgzRlLy7a7ddcWJ7Bj/nVzw14ZRdug0MayAMDYkBOTns6PhWotRb3dIJG9tadwJdfthT9KNx2Jd55T+8TapYtSRqIZw67tOM0hQuK6KmumD0jDprKa27wVVrOfl9D7kUyf8c57Ib69nGgYD6E68wh7+O8cgAJcV/xPgf1Ho0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0wGBKLDM7hSIN/NLh1u8BIUwtzefWOiGVM+VcBQjdc=;
 b=HD40A41tSqhsFxaRpaqjTCyDgAHl/yLfYipchr00akiKme7B4rMKr4uBXMNsrCcbiczf1+L4fWarxck1brIlJztf5MvVxlTJm4oazRSfmSH6XsnTau9e2auYeK508DNzHVFxcWt3yfEA/zGgOmKSotyzV4C95vlhv+BcUvkTgAj3GJhQ4lWoAoES4kk4GdFGXpenE6OWb2p9kzJFjZgLqbVNV71P0caeOV5RxxkZNN+/3OdXwbElqqAd9IN8cVO1GARgjcWgqYOlgJkO6Wt7iuyC5+MVXPZ1K79WyA92BcfvJYNFYkDkwYIAiX8FG1L3gP8iXwM2Ax9O6IC4p/a9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0wGBKLDM7hSIN/NLh1u8BIUwtzefWOiGVM+VcBQjdc=;
 b=TlXX20mlj2sDAS4r3UUVYqR7Bv7ISGIyqbXtd4XCmFJGkTzySHF+mkpYYnZVu0HfZ/VEm6vZZe+47Lyk6ukZqf/Q+CAKahBXwJxS4FnDzUyoeVtdptp53TnYadJ56L5LdW/7iq64E7dVGspKupKC2q0uYQexJG+IjznA98U+kzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Mon, 17 Feb
 2025 10:34:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 10:34:05 +0000
Message-ID: <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
Date: Mon, 17 Feb 2025 11:34:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: rogerio.borin@toradex.com, openembedded-core@lists.openembedded.org
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
Content-Language: en-US
Cc: Marek Vasut <marex@denx.de>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf4f3da-7f42-4e0f-220e-08dd4f3e9a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dm02THFQbTd6aFRoNGQzTXZKM3NLdXFPdGYxeFFGS2VBcW5FOVlhbzI0ZHVr?=
 =?utf-8?B?dlRKOStZNjR4UXNqU2dWV1V2ckZzdFUvd3JlZ0VwOTdueUdjZkN5Vk1zNFFG?=
 =?utf-8?B?c3BNUnUzQlhtdC9WWDdHOElmZUh3UDhkS0Vta1d1clBKZ09Fd0ZCM0I0bkhh?=
 =?utf-8?B?MTRQVEhDWUFVbnJJdUFXWXMwZ2ZtQjg3L2orSlRrL0pXVUkzdFNxV3l4Nm53?=
 =?utf-8?B?a1oxK3BsbW5zYnlPcCtaRVA2TEFOek9qSlJGTTRSS1dkdmtMQlRVaVl5d1ZU?=
 =?utf-8?B?UmQ0RlVBSmtsbDhOWjUvQStIY093Q1A2RENjdGJ0bW9acDNEZlBEM0c1QXZW?=
 =?utf-8?B?UnNrbEZadURiTVR3UWR3eWltOWo0WEEvZ2NLbEFoOEhXRUx2TGxXbVFxYUxZ?=
 =?utf-8?B?Q2krQWZjajBHNTlnbGdYVDIvSHZKRi8zZWRkUitIUGRJM3FhSys5WU9zak1a?=
 =?utf-8?B?cFBlempFZVI5Rnd6WXJ4c2hTUENDMlpLRUNoeXpvT0R0MHF6RHNHNERYOVEv?=
 =?utf-8?B?N2ViM3kxQ2lZTXZIVHY4NE1waThnV2F0K0NMTXVHdkh3a2lvTmNpWHVqQ2RF?=
 =?utf-8?B?aTVpQnpST2krVStBMkJ0blVlU3dLRDhiNXdYd1E5K2dhQU81dklWQjF0Mm5u?=
 =?utf-8?B?QTlCclQ4YzgyR0JXZjhJaTduam9qbGFBWEJYMVBPZU9jY1BBU2l6czUrZ2dC?=
 =?utf-8?B?a1ZFYXhFL01Mdmd4cUtEKys4SmUvU2lZNXltMmFabHphdUh2WkNlaHM2RFg0?=
 =?utf-8?B?SEQvTGhPcU1wL2FKT2gxMng3RlliZ2J3TmEvQ0Z5N3RMMzR2MkxpRzZwTEwz?=
 =?utf-8?B?K3N4cWZIaUdrMW5jKzBXZ1VxQ3pkbVV1UU5yK2ZYVEwzemQ5anZTajdxeE52?=
 =?utf-8?B?UU9mK3BQU0k1YXBna3BtbTRlU0ZveVQ4ZW5CRDd4dS9ZOUNVVUxKYTBwWTZR?=
 =?utf-8?B?alBkVEFvTGdLek0yMm1FakhWdGk1aWJsV0Eva1BYSjNUZHF3ckdqM2VDVzNa?=
 =?utf-8?B?aTkyWHVPWE01Rm5zSk1BTit1YW5vdVdwb0tFWFQ1QkpuSEhSdnYvRlZiN2Nh?=
 =?utf-8?B?UjU0Z2Z6bFJoVGpJUTlqQnFDTUQraVhBWDFscGQyTVFFVDNDck1ONFEzcyth?=
 =?utf-8?B?R1lJME9NczhXK25hdFlabTNsblY3ZUtlWjlZVVVVWWtneGJvTkJ0Sm8vVFpM?=
 =?utf-8?B?dTlpNVk5TEp1bTUya0xrL3A4RVdwVjNBZG5POVJnRVRyN0NCcWtSVHNxbFMv?=
 =?utf-8?B?K0NYYkoxeDcvbmFDVkNOQSs4THpUZ1RXUEI5S3djczhaN2lHQ0VKT3FMU0c1?=
 =?utf-8?B?RW9vUjkzSU5SaEVWMkJGQVNHU2ZjczhFbGNvOEhFcHNPRDFDQjJKVG1BNkpB?=
 =?utf-8?B?RkRXZ1Y0NWYyTjFFcDFtZWxaaHB2SHBZNGwrWE9NSUxUUUpiaHNja05PbjVN?=
 =?utf-8?B?K0VyWU00S09rWlZkaUU5Ky9TVUZYZDlpekd3ZU1lY1hZZkYwOEJVdEZVZEpT?=
 =?utf-8?B?T3NreFBZVmNHUVlJT0hRMktYUnlnL0xVOTlncWVLOUN3QjNJU01vOVhRYmQr?=
 =?utf-8?B?cUFmQ2JCVCs2T3k5TWQwWnRacDF0bVhXREpsTkxFb2VtSFU0VEFsM21ZVDlB?=
 =?utf-8?B?YUc1OWJmWFEvQjBtdnZERnN3dlo0VmEyeTRNSE9yNnNQZkpvWk4rUkdBUVBu?=
 =?utf-8?B?M3ZZSHhXeVBNU1Fnd1ZJdDQ4NHY0c0xIdWJpQk0xeUVZeCt6Z0syMXFaNHRx?=
 =?utf-8?B?MGZEWHFWcEVKZXFUd1NueExENzlQbFJVVmN3aDB1ektObndJWEJWT0RzZW1i?=
 =?utf-8?B?M0dwVHVTRzRHVHFnYUU3Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTNjOGdwdEhveUNuRTZRUFVacVFRRTc4cU0yditZczJYbFJOc0haUmx5Mnk4?=
 =?utf-8?B?MFlxakR1TFh1QjZqS2ZjQjVad2pqSkRRVzNabmdteGl6alFyZEd6bjhkT1la?=
 =?utf-8?B?YzhhWG1vSm00cmxhWFlPaXBIR21XNXZPQ1RmWHJjRUJEWVN4amRrSitpb3dE?=
 =?utf-8?B?eGJGOWhNbFpZZjJtcEViVnNxckpJQjZ5KzcyWVRqV3U5MUhKVktoSWwzYTdZ?=
 =?utf-8?B?QVAxdVdLUTNmYTBTbmdEUEVPa2R0c3pxMHZDT2dGU29RQlQxUENPa2pqdmR1?=
 =?utf-8?B?amFOZXdNUXdSbGVJZXJOR3h5aWpDNENoV3BGSjRsNmxjc0tOS0EzbjVFYXJT?=
 =?utf-8?B?OUVXNnlaaVdYMU1ZZ1p5NGVlSElCYjQ0Z3lIcSswb09pb2JTMEVEL1RIWTBm?=
 =?utf-8?B?QkJmVmw0YndYSkgwKzk1WGIyTTdwQkFSYTRxTkFHTkJBZncxc1Q0R0hucExy?=
 =?utf-8?B?OFJNOEx4ZXNMTG1mUUwyaVZ6dWNwVW1Tc1M1WkJQS3ZoM0REMVhOR09OYkZZ?=
 =?utf-8?B?V3kzaGVQblFRVjNrcjQ1N3A0b1JJU280ampCeUVqaEdsRXZYVHJZbW5UQlU4?=
 =?utf-8?B?TE9ZU2ZmUC92R1pVWmU1bDFXa3JMbjBGSno2Y0xrRXM0eHlUcVdoWUU1M3lu?=
 =?utf-8?B?dXNYeUJFSHJ4dWtKWjgyd3VaRmdSbHRhT1h2cG15KzdsSU51aXhBKzJYVEhZ?=
 =?utf-8?B?RkNiS3JxMVpoQmZDRFRsMjBvdUQwSFFmVUF3eFdKMkZRUUVTV3JIUVhQbUVI?=
 =?utf-8?B?VUZRcUNQRjJsTVcxKzE4UFpOcG9FT053bUVTYkI0dzhPNUlSTHRJaVZFaUln?=
 =?utf-8?B?eW9HNC9sMWhFcnFMaUFNMVBPeEpjTThhMXFlTVNoNTVEYlFQT1Nocm9tUzNP?=
 =?utf-8?B?RFVTcTdIbS9tVWhNUUs4b1oxWXFTVVA5YVY2VFNwTVQ5VGIrQ1pNS1RXb0Q4?=
 =?utf-8?B?RGJWbDhlM1I1NmNSWEl2OXFpR1lGM2dOZU5zSVZyOWZDcGtUUkhVOXp6Nkdk?=
 =?utf-8?B?MktDM3JleWRsbG5DZVYxWGFYVTNEWHhpbXEyajZweFdjbnNzL2c4MU85L0Iz?=
 =?utf-8?B?M0tYbDZsaGJpQjV5U1N4UDVxYkVBaWQvTVZGZTRhd2Z5MGo2ajRLb0FSa0s2?=
 =?utf-8?B?eDRSbjZFWnF1bTRzSWJLSEx0aFVobG5iaVB1a05IemN0MUR3UDROemZ4dUZ4?=
 =?utf-8?B?eXJQWGZmbG54elJUNHVxSHFjclFvQU1lRk1EdzltVC9GNCsrWkEveXMzZTZu?=
 =?utf-8?B?aHpOQk02QlE5cVArUzIwWDB5MU15TlJORElFNmlaanRjb0V4d1lmcXYwTjlw?=
 =?utf-8?B?SmhMQmVaMWZVdW1Tc2tpVDJ0ekVsckRZUVpvSXVDRmNTZU45TEtzaDJlN1A4?=
 =?utf-8?B?ZDE4bll2bm9HbmN3L3JhYXV4RndYOTZaZ2tJQm5GTE9FZ3VwVHlzNVdQMy9Q?=
 =?utf-8?B?bXFxOVhqdStONmplOXV2RGpEa0RmTVlsVit2UDQxMTJsY1ZUM3IxSlB3Y3VB?=
 =?utf-8?B?Qzc2RnU3Y0pXQ3p0SFpIbmxqMHJsZGpMYWNuOGFLNWhidHZqeHpPNElnalRl?=
 =?utf-8?B?b0IrZ004VlkxUDM3TVRXSG93QjYzY3A2K0Y1VFI0WHk0dS9tK0hwVElmdmpr?=
 =?utf-8?B?WndvZ3MzMTE2Zmx5RExRL1lNUGliWVdjSENVMitYM3JTZTRTQ3ZDN2wvSnNX?=
 =?utf-8?B?UGVTakNrWFJBQVgySFhxM0JWdHdrM3Iza2NqWjBtOE01cnhtWjBmUXBQbzB5?=
 =?utf-8?B?dDBCVktZL3JORytBQmZRYXI2UXYvYWZLM2F2V3lRR0x1Z0E5dHQySjRWaW1B?=
 =?utf-8?B?TVZFRmdkNGcrT0ZuS1U4VUxqOFVFUHRPMGF5THBDTUVhYkc1TG02aG44bGNy?=
 =?utf-8?B?ZGkyWkREZFlEWEsyck02M21PZm5YNTdsdnpFeDl5Y2Z5Q2ZUWWVSbndBYkhV?=
 =?utf-8?B?OHIwSW9tZHFNYzlPMWJaN255SXUvL3Z4d3J0SjU1ZDZucm9ldEV3eGgvdFY0?=
 =?utf-8?B?K3crVkczS0MydWxZZzBCbTdLems4V051a00rSFMxYnJDR3pyNmFSQjErdGRU?=
 =?utf-8?B?bThYTWtBN2ZmRzI1dkhvWTVGVWo0N0FLQVV6MCtseVBodUpXenM4M0hHL0pK?=
 =?utf-8?B?RXdUQUowblNrRDRobVpkRHpWZjF3QUlUakpXajVVSFNVRk5TUFcyOWRxZ0Za?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf4f3da-7f42-4e0f-220e-08dd4f3e9a2f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 10:34:05.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IV73wei/ZBNEnHmuk77UfG77gLrwLdIqgG+94fcVx0uyqj8cUt6FxtnQhNwJ7K5dD8CIcIQUt4FW0joGK1WsvyqKEg+kQCOGe3ssY4cFc+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 10:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211537

+Cc Marek

On 2/16/25 7:36 PM, Rogerio Guerra Borin via lists.openembedded.org wrote:
> You don't often get email from rogerio.borin=toradex.com@lists.openembedded.org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
> Hello,
> 
> At Toradex we're using class "kernel-fitimage" to produce our signed kernel FIT images and we've found that the recent commit d7bd9c627661 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled") broke our builds. The logs of a failed build show the following message that I found noteworthy:
> 
> log.do_uboot_assemble_fitimage.841485:
> ...
> Couldn't open RSA private key: '/secboot-data/fit-keys/dev2.key': No such file or directory
> 
> The odd thing was that the build was setting:
> 
> UBOOT_SIGN_KEYNAME = "dev"
> UBOOT_SIGN_IMG_KEYNAME = "dev2"
> FIT_SIGN_INDIVIDUAL = "0"
> FIT_GENERATE_KEYS = "0"
> 
>  From the above we see the individual images signing is disabled but the system is trying to access the key file for the individual signing (dev2) regardless of that. Checking the code in uboot-sign.bbclass I found this line:
> 
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/uboot-sign.bbclass?h=scarthgap#n116
> 
> that is responsible for that access (inside function concat_dtb()). The code is always referencing variable UBOOT_SIGN_IMG_KEYNAME regardless of FIT_SIGN_INDIVIDUAL being set to "1" or "0" even though there's a condition a couple lines above L116 where FIT_SIGN_INDIVIDUAL is tested to decide in which mode to run the signing tool. To better understand the behavior I created dev2.{key,crt} files and retried a build which worked. However, checking the contents of the final u-boot.dtb file I found that the "dev2" key node was present but the "dev" key wasn't. Then, checking the contents of the final fitImage I noticed the configuration nodes were signed by the dev key while the individual images were not signed (as expected). But that means such a system wouldn't boot since the required "dev" key is not present in the U-Boot DTB, from what I conclude the FIT signing is broken at the moment.
> 
> So, first of all I wanted to let you guys know about this issue (hoping we're not doing anything wrong with our builds).
> 
> As a second point, I wanted to confirm the expected behavior regarding variable FIT_SIGN_INDIVIDUAL. According to the documentation:
> 
> https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term-FIT_SIGN_INDIVIDUAL
> 
> when its value is "1" the individual images will be signed *in addition* to the FIT image being signed. From that, I understand that the configurations will be always signed and the individual images may or may not be signed depending on FIT_SIGN_INDIVIDUAL. I kind of confirmed this behavior by checking our build artifacts on kirkstone: with FIT_SIGN_INDIVIDUAL="0" the U-Boot DTB has only the "dev" key and the fit image is signed by that same key; with FIT_SIGN_INDIVIDUAL="1" both keys are present in the DTB, the configurations are signed by the "dev" key and the images by the "dev2" key. I understand this is the correct behavior, right?
> 
> I'm asking because looking at the comment at:
> 
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/uboot-sign.bbclass?h=scarthgap#n106
> 
> it gives me the impression that FIT_SIGN_INDIVIDUAL would select between either signing individual images or signing the configurations, which doesn't match the documented behavior. I believe the code in concat_dtb() also seems to assume only one of the keys (dev/dev2) would need be present in the DTB. So the fix would involve a review on this as well I imagine.
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211507): https://lists.openembedded.org/g/openembedded-core/message/211507
> Mute This Topic: https://lists.openembedded.org/mt/111218371/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


