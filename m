Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D762D49221
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 12:40:25 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11778.1765543222566469004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 04:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RglfvWK2;
 spf=pass (domain: cherry.de, ip: 52.101.70.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbJOi3oO1csytWKAOWGUk53MX+RWFlL5TLg1ezmoLb4ItxxM/U0TmWLQvSwMWK5JuWdxeVgU1nqhQoxawPv6jDz5qA9YHt/mXzlFW1Rp0Nb86ZuPFY5/ie2eHBj3OkPPlv4dcf7ZnjtjiM5hW54rFD4BgyzZr0Llw04xTm03FizG7MdfKQL7QATkXguI/OoNvF5RYsbPmUWhocEnjBCrN8ZG85NVVT7CFyn8p/tf3cAv+kpFHekcwoJGrzK4pLen0YChuK+O6Xvi09qWOywHL0yhSx/aFcI9ZEAoUShxlD7VTqZUX8TNx179qqzZtxObWjqvqGQ9pwVgYtxguAJE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP+XX9miIAo7JObcKX/fqeKrdZiPZljQDpSHiQb6nyQ=;
 b=TQkNTIsDddgdGWhot0ZiRTsURh6A7IMIxflW+SDaxATUbPVDCM0cbi2c17+VsJTeqNV6GmcHuq/sDt5oLT7DvGDLTsPrEAl6GdVRocmS/EItjPKGma6TvMwbL01ObVn0/wZOdQOrVH7yV5Ad33fSZ8qgaO98JF31tm2/eD50nFXtwd2Y6SiwRzQGCpCXXO3JNwnI7V5zBlJCkzHNU9JDqce+Elfl+HLQ6w69czfnp6+0RWh3QoTy4qlsGehC825q23txwHIF9uY6tGeJRQsuH1NHBGoO4+5F4SAn2f3aQ+38zew34/XNfcHIo3qqkeZBUECUa72HwEFi7Z7U+T/OYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP+XX9miIAo7JObcKX/fqeKrdZiPZljQDpSHiQb6nyQ=;
 b=RglfvWK26HtElx/AHBhwdWHe+DbAChlmdVcQuopn9IC3L3d5HILh3nxnjuzqa4rmmGrGpNlAD9b8+bAEyR2d3DHmgkc0DcCL3dci1TMq10T6qEwnqqwEkhu6GvWstTUfX+OzkEVujsWbUR8c0KTfv/OJCqoFosIXb4PyeUXvSFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8669.eurprd04.prod.outlook.com (2603:10a6:102:21c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 12:40:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 12:40:18 +0000
Message-ID: <85c873ac-7ce6-463c-8a85-c7847ff842d8@cherry.de>
Date: Fri, 12 Dec 2025 13:40:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PoC 0/1] LLM enriched CVE entries
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
References: <20251205091632.1268768-1-skandigraun@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
Cc: yocto-security@lists.yoctoproject.org
In-Reply-To: <20251205091632.1268768-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: e4724b42-5829-4c9d-367a-08de397b9b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dGpDbGdUQWxlLzR5ZXVBeERWaEhDdG80STlCOU5ha1RqajBPTGJ0aERpelNJ?=
 =?utf-8?B?NzB5NDlvVkl2bXNxYndpbWk2WGxocW5IRGdia2tzbDNzaU5YR3lVWGtIMGJp?=
 =?utf-8?B?cklxY3F3Z1NwMjgvZ2xLcERoODJSM0RYL2pvUThEQnlNQzRZRHpYM0wvVXJh?=
 =?utf-8?B?UWhLN0hGd2RWUEtZVlJPVm9GR3psR0ZVVUZKeTdid3hOeEJMZTUzWjVIaHdh?=
 =?utf-8?B?NnluYTBrTDBOalFHNWlhUjM5dFJuRTBieWlxOE15MWR4ZFVOZVVLRnRTNWFP?=
 =?utf-8?B?bkNOTmxHL1crWGpPWmpxQnhOSVBZdG55Ym9heDFIQkp6S3JYd0JHdFlGU2xi?=
 =?utf-8?B?aCsvZ1hwUUY0Umorc1dCTi9oQnZYMmh0SDBFK3ZOSnhVYnpGR3FkS2tyak9M?=
 =?utf-8?B?T1M3b3pJSnc3VnNPN0ttc1lWZ0ZVOUV2amlDYWU4WVhxTVM5ekI2K2ZseHk5?=
 =?utf-8?B?SlFndDJDM1F6UExiUWQ1YUZYd2dvbDlVcEdFaldOM1hNRVJUMkFHbWNrV1pX?=
 =?utf-8?B?NHNYbURTWEVoT2swL2wyekllaG1vcjNiQlVmOXlFTll4MHFYODdmbVpwdUg2?=
 =?utf-8?B?elUwT0RKb2c2R1NORU9JT0NIMW00NXZ5RkQ4OGVsRHEzelN5dElrL3hyZ2F1?=
 =?utf-8?B?NnYzZlEva3hyT2dHL2RndXV5ZUxVRm5iU09YZjJtNG5lMGN3M1ZaYW01dm0y?=
 =?utf-8?B?VDl5cVVNNkpWVTNSYlBBQkpBOW84LzRsZ0ZET1BIUVJZL2w0RnpnNGZYUldl?=
 =?utf-8?B?RTZ4TnZqemdGYnhGVzcvZmJ4ZXcyNVNId0xnZFYvN211VGNQZWdnL0FaR25H?=
 =?utf-8?B?eWxjcGRYcnZFS0R3TmQ0ajVLdzFlVGVQNnpaK3NXZEVJY3M5aEE1alFGNU4y?=
 =?utf-8?B?RC91aXc3M1hwZTBXWVlrZWRnblBtUHhHd29WQjhrUkUrNWxpZG1YL3QwTXVP?=
 =?utf-8?B?bnRUdWhueVRoaCt2c0U4Q3JQMDVHUm13RmM5U0xhQ3V0aHIvdjMxNjZhM2Rm?=
 =?utf-8?B?TjZObEZuZW1mR0dEOFN5RCtCa1RvTC9ocDhNNUxTNkVTWDVjOVBwb0I5cEx3?=
 =?utf-8?B?c2NIdmlDOFpicnBMZ3M5cUh1SEp4TDUrNFpDRFJVY1NzU0ZTaEVERHM5S3Bw?=
 =?utf-8?B?bFFLU3NRcWhuRStNWmZDNU1McVlBWm84NkRlemlEdzZrbmZsVWR3UUVzZ21V?=
 =?utf-8?B?YzZ2UVJmVTBJUmlmRkhySlJSMWVpV2FEbFM0b25hRitZelJvc0ordHM1MDZU?=
 =?utf-8?B?RTN6dlJhWTBOU0t5MFB2YUtXNmhYVi9kekNIeWNqSERnZ09COFpkOVVYWmJP?=
 =?utf-8?B?TU1seVlhUlhhbUU1bFY5dk1EdmJlb1VCSzhCbXhnNUVXUlBxSkw1L2ZCWXA1?=
 =?utf-8?B?YzhzdTh6VXIrRDJHVVZpcUx3NEgxdUM2WGtnVnpaeXZyVkxlZC9GTTlPYnlj?=
 =?utf-8?B?T25PWlkzZWpMbVQxOXBNZW9GNS85SS9iZ3hLdFBvNGVrUXRUNnE3RzErM1o0?=
 =?utf-8?B?REIra1Q5MnhzZ0t0Q0lsL21nWG90MFRBL1RaTEdjdGtMbHloUTY4UUhqTmhx?=
 =?utf-8?B?Y1hjajlQdWNYU2t3bUxBUmsyM3ZEbzQzUEVQeU9mTUxTUFJqQkVpbE5Ja0VG?=
 =?utf-8?B?Y2JmVEthWjJLV294ZVl3VHFQa1pId2pVallyaGtTU2NQUXliVkkxRnUvYThE?=
 =?utf-8?B?K3h2cll2SWhESmo3K2JQb1BYR1JRallQc1pkTUZyZk04WmFzemc4Qk1LUmZH?=
 =?utf-8?B?d3B4ZkV6QUNGdmR6enY0UkEyQ3Z2T0NOZkw5YzNyRS9lM3ZwY2JvSU50bklC?=
 =?utf-8?B?N3lOdmhYdDE5MmhLWW9TREVVaHpVSFhqczN5bkZtanhGMVAwV3VnZ2Mxakwr?=
 =?utf-8?B?aFNDdXVhNENwTW4zRkdhL2ErVWFwQlNhRGN3MU5rdzlMWXZaQUt0SE9ubndh?=
 =?utf-8?Q?fdgFMMPPCmOu6NXEnl0rIukigdVpUTo0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHJsd0ZyQTU0WmNxQVV1VE5NeGZxdzJTVE4vRjdKNmp1YU9hcGN4UmIraS9M?=
 =?utf-8?B?LzVhZGNBV3Z4U09MR0MwRUFsUFhMaFFaL0NPWXZVTGhzMTcxZzAzZjNKalJM?=
 =?utf-8?B?UHlzN1RBaHluQ2pJMmY5MEppK2MrSVM2c09EN2l3dU81MkpxNkFDWDEyN0Zm?=
 =?utf-8?B?V0Zhd0ZldEo5dUxnSFV0QVhLWlQ1UE9mL09XWnhRVWcxdUlwTWluT1l0blpy?=
 =?utf-8?B?amxZL3pySlFGbC96ZTc1ejhlNW9NMW55MDloT2haYUdUMGxtLzRRZUlwSEwv?=
 =?utf-8?B?WllkUnFDWWM1U09wWkk5UFNObUQzKzdkME0rbldwUnNNSjlMMWhHMG9zZWFz?=
 =?utf-8?B?NlMvUlVOVlZlTkFrSlBEKzhGRkRDMm1vRlgzMHp1OEo3UWp4Ym1qTUdvVXNI?=
 =?utf-8?B?NFpaQlNIajVIK3lTRTdXa2RNVEtlQUNQQmo3TjNqaTBTbzZDR1ZMbGVUYTlS?=
 =?utf-8?B?UkdtektOU1pTbW5ycHNFWGJmYXRnUkpjSzVtZER3ekJTVERnd3QvckhrY0Nw?=
 =?utf-8?B?Ny9Jc2g3TUdvUnVON0oyeGxjdW05eHFqL3dOVmtNV1J5OWRSSmhEUG1LYXd6?=
 =?utf-8?B?ZHVYdjc4UEJUbDFKV2daTGhxeUt0U1AwSmVrd2dCWWdBQTRoTHEzdWE2Q2sx?=
 =?utf-8?B?L3J5MXF2WmxtOTZnRXRKT0R2K2RBZ0RGZ1ZURTFuVFRsR3FObFVteHRoUFRP?=
 =?utf-8?B?c2ExbXBYb1VxVkNZUUdSQk0wOGQzdkVDQWNTWFh2L0YvaTRRS3JVNFB0a3Bj?=
 =?utf-8?B?djA3b2JWYXhaZ29RMFFOdkRiQ2JlVmw5cGhkZ25kN3FMeldzQkJSTGJoNmlP?=
 =?utf-8?B?U3JCTUtFbmsrWUpPdUFKN2JZQm9OVDA5TGlRNk13bmU5azJNRTJxMStrREJP?=
 =?utf-8?B?Sk8xdFVObEV4QzJQMkNjQ2VLYlRCazZXUEJYSkRtMkxmaTZhcWRQM0VJemd3?=
 =?utf-8?B?NDc1ZThHRHcrdXpraHlGRHJpOXhmditDZnNKQThkTzNHUytLSHc1elJjUi9T?=
 =?utf-8?B?Qk0vSU1IN1hTN2V1MnVGS1djNzY1M3EvbnYvdEUyNUFjVnp3WnVoZEplZzhI?=
 =?utf-8?B?dFZ1ai9FaDdzMFVKbEJmWVpESytRQU90WUtrSmFLYjB2M29XeG0rZEJWdXJ5?=
 =?utf-8?B?SWRzZFdwVGtvMGw3MWEzYmM4WXg0bjV1KytmWTM4QWZiL2l1cHlYanZVMU8x?=
 =?utf-8?B?YUdLM29EYVNxMkNSKzJDMHp4bDYzSTFRY2JJNmNWTUVUUnZ2T1dhOEl6LzRv?=
 =?utf-8?B?Q3Y1Z0lkSTFYd0FUaVAzemhzYTN5REFtaUhVbDNlTkY5MXhPR1pQUVp5N0Ja?=
 =?utf-8?B?V1Z6RTBhSW1KSFgrZlZ5NW1XbWFEemhFWHlsdzUyU1hvZ0F4YXVJWGtPQ2Qz?=
 =?utf-8?B?bndycGdmTEhWUHAzWHVkK0JQeDA5bFJTNjJlcVhhK3VKbEpoNjhyeHZtRm95?=
 =?utf-8?B?cU50aVk5SVBiTUVKUEM5VXRZR1pDVlRmSXBVT3dxK01nL01pSytNSklFNmJa?=
 =?utf-8?B?WXpkcit3eEY2UWtzL3N5VXVTUXkveWFKQnA2V0R3bGJCazdGZm1qVWtJbmg3?=
 =?utf-8?B?ek9ZNkRxNWxkdHlmaTF1b2dvdDE2VUN3T05keFBVMlhNQTZvaVBLTU1RY20x?=
 =?utf-8?B?Qy83SkpIVkd1NmJaN1V2cmlCOXoxTE5ybTg4elEzRlJuM2VKSnRxbWNRcnlW?=
 =?utf-8?B?UlEvclVoejNOTThtK1cwb3FDaE51S1NkU281Rks3SFNsNHQ3YXFqUjU0NzR0?=
 =?utf-8?B?QnBrYWdjTXZmTHg4aHdiRW5xQjBVdSsrR3BKZFc5WnhCZDRITUwyUXJCaEh5?=
 =?utf-8?B?dTdHVFZaQ0hEdDY4dnltZEZZUVhRdERNQktycjQrWU11SENUTHJKNTRsS1NO?=
 =?utf-8?B?ajFpWGFwNFJuTmE3cklpZTFZTDlNRVlVMzlHRy9xZkNaZnBTSHhxL251M01D?=
 =?utf-8?B?VE1NSm53aGpHQ2hSRW5SdExUY05xZHlhZ3poYlN0bE9ZbDlEUFNJWXorQzJs?=
 =?utf-8?B?K3FFY2s1RVlvcjN3WjZSaTBaMTA3UDJVd2R5QTBCSmJzbHdPTFlkdzdWTjlo?=
 =?utf-8?B?dWxkeWRLQkpSblBNNms1czlyZkR0TUhKNTg3blordVFDK0h1cHZ1encwUDVs?=
 =?utf-8?B?RHp5Zk9yWmFsTi9hWUJibzJXV2VieW9mMldFdzZpd2EvUU1CVk1wRU1LZTJH?=
 =?utf-8?Q?VlpARdpVpsCAVyJDR66SQnY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e4724b42-5829-4c9d-367a-08de397b9b2a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 12:40:18.1097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwgjBKV3lm20kzSSDJY2dCnPK80eFTNQ5mhrN8HtExN1BXWrkd5Zg9iiyKQsRkRTFZBEAImrWuf3U50qkeRZk/1APRnNpfpLRoOnOUALxYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8669
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 12:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227588

Hi Gyorgy,

On 12/5/25 10:16 AM, Gyorgy Sarvari via lists.openembedded.org wrote:
> Hello,
> 
> tl;dr: This is a proof of concept about using an LLM to enrich CVE feeds.
> Links are somewhere down below to see the difference. If you think it's
> useful, please say so. If you think it's not useful, please say so too.
> 
> Motivation: the CVE checker associates CVEs with recipes based on the
> CPE information in the CVE entry. Unfortunately there are quite a few
> CVE entries missing this information entirely, making it impossible to
> associate them with any recipes. Looking at this year so far there are
> over 66000 CVE's opened, of which over 15000 are missing CPEs. Though
> older entries seem to have better CPE-to-CVE ratio, but for this PoC
> I'm mostly interested in the latest vulnerabilities.
> 
> The idea: in case CPE information is missing, try to derive it from
> the human language description and the reference links of the CVE,
> using an LLM. The intuition would be that a good portion of the derived
> data would be usable, and even though it wouldn't be perfect, it would
> catch more valid CVEs than without it.
> 
[...]
> This patch is just a proof of concept.
> I'm not sure if/how it could be integrated in the project's
> infra - especially the initial load is very heavy, and the patch requires GPU(s).
> 

I've no interest in the technical implementation of this, just 
commenting on the reason for this to exist in the first place.

This all comes from "CVEs without CPE exist". This is not a Yocto 
problem, and it doesn't seem right for Yocto to be the one fixing it. 
Someone should fix the database everyone is using. This suggested 
approach may be a way to fix the current content of the database, though 
I don't know if *we* want this in Yocto for helping and maintain it to 
some degree, or if living outside of it in a fork or something is better 
suited.

I don't know what will be the stance of NIST, MITRE or whatever entity 
is responsible for the database(s) wrt using LLMs to identify CPE for 
CVEs. I don't understand how they can even accept CVEs without a CPE: 
"here's a vuln, figure out which piece of software in the world this 
applies to" is madness to me.

I'm Cc'ing the security folks as that would probably be the people with 
the most to say about this and with some idea on how to fix processes or 
bring up issues with the impacted entities.

Cheers,
Quentin

