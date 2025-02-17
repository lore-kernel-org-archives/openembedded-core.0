Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4319FC0219E
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 10:32:19 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.81])
 by mx.groups.io with SMTP id smtpd.web11.48173.1739788336789702599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 02:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KgLa+sTF;
 spf=pass (domain: cherry.de, ip: 40.107.105.81, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pI+ChwHqTsvupOtLM0o2EKikzLiM0vkClfN36rNK1/1gLWsv2asNGPQGYpMuiq6XqohFIFjf3mp134dWQ5hmEB3XuiHjHGATT7TZeZ1NuwtMF6r5yqvjTW5AYgsKlmwgupVzH5dcDMW36ZXoaYGfNyo41DcrFTMixTCTJtQAx99NucFERvEd2G3q1EYMsAEM4G8hF6xPak+LQZKhpTFd5hR7wbYDSvdCehoZLzPNxIJf6aFW5ZEbAskIdpcWv5Xo/OXIKxWO9g5DOvjNzPFF0+zsi21MFPn6rb3h7YJXAQ7efc+dFKxEs2BebVWY8VT5/bsKuXzWEcw1RjKFwHtbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZWz57O7AAeo7ha7sIxbvUZ8PvS0eFGHSkLy6TKSQXI=;
 b=wcvI1Cc0T6QYWStNgn0MvNBE+8U3aWxbHDeuUoRVA9lXNNqpiVCY9cp5jwNUWHa+ZVPYDHy3103qaTUn8l0aiJmOu3hrVAMV6k1rIbXQEh+rE0/qxvg+aIDqlRkOlnnKehP3BdijkitNpHkXDAkSTnjbPJlzg0g7F8St9/+q8TKkMwVcofhUNAD4HfRncw2W6x8RYSBCeoM5FGJjwDxyV4vcQMj7b36Gf/kT4JVhACRcdVG7i/O59Fwn/pMt84jBxfQ0X6CUgmHG06FQxQ6AEGS82d8X1ZIM0t5E97IlcpH0ibINvUcg3CSHaLep54Gav5l+zZRsXJodw5M2dYPFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZWz57O7AAeo7ha7sIxbvUZ8PvS0eFGHSkLy6TKSQXI=;
 b=KgLa+sTFnohQaN9XE5/xPfMpMUvQe8Touacc9C8PaytyCt0fFG/TDlh8oXQczLDREJscekhNVeSf7R9+2UrnTWhbT6nzfl4iUcUEdPyggrI3mMxWPZC5DTtzygrl6sNc87p8rFNqr225PgVHvz09eupLhPoJH0n+Tck3Q9IvBCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9472.eurprd04.prod.outlook.com (2603:10a6:102:2b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 10:32:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 10:32:12 +0000
Message-ID: <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
Date: Mon, 17 Feb 2025 11:32:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf
 provider
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
References: <20250215165545.1929-1-alex.kiernan@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250215165545.1929-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ce4444-08d4-42ef-27c2-08dd4f3e572d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2hXZUlEOWd2cTFDUW02QWx3R1BTRFRCNlFCU2k3OGVUQVZKbnpPSjdkWHhY?=
 =?utf-8?B?YS8wYURWRUtsdHppUi93TFZMa3dieFJ1T3RuMjh0dGFTY1FNdUh1eG1NbTJM?=
 =?utf-8?B?WS9UVjVVRGVSR092TlFacDFEbXNqQm56NDR4Q1kreDE4RTcxUmg4MndxYndB?=
 =?utf-8?B?aEtTYThwQjRnelBjWXA3NHdEQ0FHclM5STFwSjNSM2NRWklibkJPNjJJaW15?=
 =?utf-8?B?NTJyK3J5TW13QVNRS1c3QXJtYnU5WjdYaDFCV3BPSVJvZnBNaEoyc3U5cy94?=
 =?utf-8?B?dzJoak92ZnNMbjQxK1gzZ0pRakx0RWJrc1hXVVNTeFZ3VVNWaUNjaVc2UkZz?=
 =?utf-8?B?N3NHTXI1VFdQUUVzYUpqQ0E1c284dTNoZ2ZneUpFSm52T3hndUUrUXVlNkNW?=
 =?utf-8?B?QVlWWXdGckh3UlN0KzN4R1ZHQWtBbkxpNXJCTzJqUW5IdE9nL01DNUlkREVP?=
 =?utf-8?B?TFJtc3JGcnZGSm1zZFZEY0RSblc1cWM1dThhcGxsSk9jcTBUMkpUZnlSTE9S?=
 =?utf-8?B?eXhCZEJJUkRSclVpeDRKZGlHZlJ3UEZobklQTmlpY2ZidFdpMUVySW9HQkNP?=
 =?utf-8?B?M1dSRE5ta05FSUVtVGc3cDFNckx4bkh6czR4UkU3cFNQem9PSDBhNis4K2dS?=
 =?utf-8?B?enZrM0pQbHhSRisrWlJMa2Nxb2p4bWRJQVRtcWZZamNCL1R1dnFPbnNMYUov?=
 =?utf-8?B?QWpEY3Zpa3NrdXNmajVhNWJKaGljeDduVnFCbkJLQ1dvYTM2WnpFaEJJcEI1?=
 =?utf-8?B?NVdoNm1kZkpUZGVYZWdXUWdhZ1grdlpWMHRZTVpVR1Fsb3E2RHRFaXdQOVY3?=
 =?utf-8?B?eFhId2w3SVB2V05aNDhqa3A0MFZ4SGgvR0JWNUdnNnR2SzRWREZXY1NRRlIx?=
 =?utf-8?B?UlF1QU4vbzNQOWZQbGhSUlJ6ck1sMXUzcVpnSzFYVllnK3hTNENCREJtM3ZK?=
 =?utf-8?B?M3JhUnk3RmdLeFNkVWNXWjhERWlSODlmcE9iYzhPUTdrcUxQN0NjSW4xNGRh?=
 =?utf-8?B?ZzhobzJXNWxiUG9mNEZFK1d5ZXl4OUp5ZmdyU2VSUkplRGdzOEtuUUN3VzNJ?=
 =?utf-8?B?azBldk5FdUVKanNEcnVzV3NoNWtqS01GU0tXRWJxNVl2R1NkYkdIWFdXK1dH?=
 =?utf-8?B?bno4MGFoV2hvVFVTVWlpQ3JSUytxbk5DWDZDdmN1eC9OcHZncWdyMUd0WWpD?=
 =?utf-8?B?b3Vtd2Vwckl1Vjh1UlQ5UUJQaU90K0JDazd1V2JLY3JyY28yRDR5bE1yaGsz?=
 =?utf-8?B?OU55Mll1VzZpcUw5dW40dUtNTkJxbGVIaDY4ZmdnMVRodkY0SXl5RFlKeGFu?=
 =?utf-8?B?NkRjVEEwRG80U2c5OWNxZ0huZkQ4eHhobituMXJGS0w4MXplQTdzdDBEQVBI?=
 =?utf-8?B?K3dMYm1wMGs5N1RQcVJsYko1ZFFhYis3SFVLRmU3aFh1S2RzcHltQnRzL0x4?=
 =?utf-8?B?cXM4OTJ6KzJlc3QxRlVEQW9ibUgraDF0QnlBWFV6UVNxY3VLeERtcXI5K3Y0?=
 =?utf-8?B?R2FzUmQ1NVZ0dTR2VkU3WnhIdjRTVFI1aFlOdVV3RE5LSWNaNEhPNGdiN3N5?=
 =?utf-8?B?RUFtNElwdmUxNnRXczRxOS9UTWE2Ykt1MVpGQTUxZ3IrVTljZXg2bkZYejhU?=
 =?utf-8?B?Nkw3VXRSRkNWRE9sai83bkhWVVBwNzBoMGlEMTZXYVdzbWRQVWE1TXA0SnBx?=
 =?utf-8?B?UzFpenNndnE1dWRSc0FDbG9rQ3lPc3ovVDBEbzByM1Yrb2w0SUJFUS9NL2tC?=
 =?utf-8?B?cVJ3a01aM2lNZ0JWb050Z3dwTjRDY1M4SXFGZ2JsWm9YL3BqUnYwMlB5KzBa?=
 =?utf-8?B?WHF1UlVlc0UwemhDYnkvR1dDRXhQSnNOVm5Cai94V25EeUdUK3NGZ0lKbEFG?=
 =?utf-8?Q?Rbz0TCgF4qJxq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXpIdlFFTEVVZm5WTmh1allFZzB3b3E2ZnZRSlRUZHlybU54ZlozRTgrc0pi?=
 =?utf-8?B?dnNrNFNMcm5VMS9LaGhUY1ZncERwclVhTForZTVISlY3VlIzWVcyWkxlQ09T?=
 =?utf-8?B?Mkc0bFFNWmZYUGZFTFZpN0ZxeVNzeHlHa2dweFAzTGNIc2pTaWlKanVZUERi?=
 =?utf-8?B?Njl5QkFSdmZ6NUFFRHBoMDJWQWdqRElHeUlOQzh0RVBVZFBJL3BJSjBRWGpm?=
 =?utf-8?B?Mitja3diaE80WjFLemowd2Q5UDJFV1lRUUVtbFF5TzJJK0hjVURweWZyZ2VW?=
 =?utf-8?B?ck5WMzU5NUswclJCanNSYUo4Z1JNS3BscVp3SGtRemJQUEYzZnR5dDZQZEJw?=
 =?utf-8?B?bEVNZ1hTbHAyVGZybWdJWGE3MU13aHFzQUR3ckpOQXpNeE5WK3BPZTA0Wnp4?=
 =?utf-8?B?aXFjRlhKZWpHaTBaUG9SZ2ZXcFBOV2Y4bHFFMzdRVmhsWWtQWE9ibUp4Z3Q4?=
 =?utf-8?B?WXowVjZYWmF1VE1MZ1IvOFNrdUF1OGVtS3hHYk5WWlBHUFk2b0E5RE4rMUJ6?=
 =?utf-8?B?NktCU2FJSkpCTlMySTZhcHd6QWt6S1lSK3hlVHZvS3BIMU1peEpKNkpwT1FL?=
 =?utf-8?B?YVFPVHB3OFNUNDZNQVBRMFdEVVFLeEhkcEZrQjNVeTJoOE01WTNJSWhxdVpE?=
 =?utf-8?B?VXVvVE82K1ppcnlGdzY1UjA5UEhRYkRWTzZKVGsrdWpUOE1ySHQzOXhlTlh0?=
 =?utf-8?B?VThjOWg1bmsyZ2xzdXRXMEtWRi9ZWUlnbXEvZkxMZEZuWFh0WkxWdXFNbzA1?=
 =?utf-8?B?TkVpMEFTcTU1RUJhZ3d5UlVRQWtsUWN6bG5YK2dkSExaRmdpeWM2R1FzeVhM?=
 =?utf-8?B?bEtHSlE2Rm9FRy85bnZqdDM4SFY2SEFCSkliZkwzZ0w5U0o5T3JJSnJybDJh?=
 =?utf-8?B?Z2hoZEV0RmdYU01IcWNxc2loOFRtMVlrUEF2SUpJNnFNTGRWU0JDWDM1TjZD?=
 =?utf-8?B?SStuUXNTTnMwWVp0eERFQStQckdmdW9aWkdqU0l6L1Y3WnNRcjdZV0Z4MW0y?=
 =?utf-8?B?a3RwZ2JRajBkN0J1R3pUQTc4MXV0RkVpS2FZQUxIdkdwclFBU05icnpxN1VC?=
 =?utf-8?B?OXdrRzdOMWxmRVN2TWQ3T0xYOWNwYjlocVpOUFN1dnVCWXluR040a2RIaHll?=
 =?utf-8?B?aWVwWlhiaXhaZU84Q1VWU0hKT0VaRGc1RUJZK2dsTW1tTVJCUVdZaXBJbFl2?=
 =?utf-8?B?NVRQSEp0YlB5NG9jNXlNMElYcnVVbXZLNXFSZGtUSDQ0dXllUDh4TjE0SkRU?=
 =?utf-8?B?VVZWV3Q3cHJGNjNXaFU3ZEFkaUFyamNjVEtxZ1NkOFBOc0cwYlJodTUxOTV5?=
 =?utf-8?B?RHNRaU9tdjJpdXZKU2ZWakQ2UHZvcnJRLy95RENiRlpkZjExNG1FVjBmNEhC?=
 =?utf-8?B?Vk52OVVoeUZKc2llb3paYWw4UXdFRHo1WGZza3B6aWdIbmdTZktqckswbHJV?=
 =?utf-8?B?aWhOWW5XdFMzWnAvZWluQ2taVHgzYXl3ZTVyY1F4VGg3Q0NyRUdyMU8yN0ZH?=
 =?utf-8?B?NlNoa0lHK2RRNUUxc3hqbkpObEdueDZIZGJmM3dFZVlwYVZKZjVMd2JSbXdT?=
 =?utf-8?B?TUxaOHhhN3ZBcHc1UUhlb05CQ3N0YlBoR0dmOVZpS0lOWXkzYkxJUGNmUEta?=
 =?utf-8?B?T0hEc3FZblJKQVVKVXVRTGhSV3daWFYzOWk1NDUvTXJaQkxLcDNLbzFDVFcr?=
 =?utf-8?B?b3FDRzg0ZzVyZktwNjJzSkRkNVJaWkd0RURtSUgrT1kvcWx5RWF0b1lKU1Q2?=
 =?utf-8?B?eEkwcnZST2dVeWlWUlY3eUc2cy9jUmpTZlVMVUZwVjlXczVTdUNVdnVOM0hk?=
 =?utf-8?B?c1poRk5zUXlSc283eSt1cnhscmNwaFVvcjM1WUVHalNyMVJZcUQ4VC9VREo4?=
 =?utf-8?B?UUpXSXNBc29RMlpYMHZxS3hIRENsdjV3cXNIZ0RBZjh4TGg3UjcraDQ3RU9i?=
 =?utf-8?B?Q1QxZGp2VnMzb1F1S200emJMZy9UY3g0czNtMjdOai83OWxDeDVablNBYytN?=
 =?utf-8?B?Slh5NEJBNVBYbkJ4MzJDaDZnTHNVNFlRR2d4K2pZYWJKcnVLTDJWTTVqbVhC?=
 =?utf-8?B?NTJDcURTdks2Qi9yaWhiU1U4dG00VU9HQlNYU3J0eFRBNXZGRWF1WmRtMTll?=
 =?utf-8?B?anRKamE4UE1MMWVjNjBOQ0kwYmFncVJ1RWRjZk5YTlB4WnNMZzdYdTk4a1Vp?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ce4444-08d4-42ef-27c2-08dd4f3e572d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 10:32:12.8636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qahRlvTm3pnADYOp6/8HJGCtcTgaMyFMcGetzgrldTS82R1KrWY+oUWYsWlGePp1rFPfdjdGr+9UyRzTAbMDxW5r9dJWrlicw46U4xS5Ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9472
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 10:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211536

Hi Alex,

On 2/15/25 5:55 PM, Alex Kiernan via lists.openembedded.org wrote:
> avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
> provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> which of these will provide service via packagegroup-base-zeroconf.
> 

If I'm not mistaken, this seems to be fitting RPROVIDES usage?

What if we had something like

RPROVIDES:${PN}-resolved += "zeroconf-daemon"

in the systemd recipe

RPROVIDES:${PN}-libnss-mdns += "zeroconf-daemon"

in the mdns recipe and

RPROVIDES:${PN}-daemon += "zeroconf-daemon"

in the avahi-libnss-mdns recipe?

and then we simply RDEPENDS on zeroconf-daemon?

Does that work (haven't tested myself)? What do you think?

Cheers,
Quentin

