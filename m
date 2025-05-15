Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1FBC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:33:04 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.51])
 by mx.groups.io with SMTP id smtpd.web10.12661.1747315978783369380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Hxo93Gqr;
 spf=pass (domain: cherry.de, ip: 52.101.70.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsdsPIok0wddpNKi1twABFoBQw1a9bH534jhfi5Z7/5F4ZO0yKvF+3FVa05rtxNaPQR4NEEF7NQbOrabn6VHFLoplwi5wS7Li+VRKERlWskWACj8EmQsPjY/BUOdsmeF4y1rV5f9qRANPWU3tjvEsW4n2gAD4YUSyFO1PgMZg4aN2nvu1OjxFA2BWqrp483Y2LlN43TsTCXsqmyVdabwPm68e8c/Jic1Ir01tPCzqZujLMrXOAxmtqoRwRV+7dBD1rVWadfNN5KV2rKADFbG7Yh+0vpy/0UY9PmLiHN3fWb3KpR4cAWnF0yhIsPU6vgAYbZtyKsWeydhoX85+QM2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7D0sh2X+gnpXNKjf6BMw40s8hHadkuNGkp4tyN+Bck=;
 b=NhlFXGBv24rb6iD5ejG2LX48oxBPRQj/cw7Vax8GLuC/BnksCTdFcQpvUk9uOTHcBr/8K3akbfzMuTHR7gyDijP0NJUmgYbrDgI965v41WqArggCEiSkd1EQbjr1s7PulU7PqZjuLph7GHaj6XMRnJDsWmT9opsriQHAfvroQuDql1P/Z6ijN/nBlVE16hXF9x9E/xD0o9gMbTTtSKa4+NnPdCmqsVXbTUCCRLIj2HsQZMe5jIJgpgbjD/psbusgQmYDb9XSSI+yLF6BsA074X/ZnOP/jc9a5lv6P5MWvIBYiC85D0R+s3dWA4uM13ifbrf+/fMoQ0DvIWxpjmYSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7D0sh2X+gnpXNKjf6BMw40s8hHadkuNGkp4tyN+Bck=;
 b=Hxo93GqriEfFisaASztLmd00W7uN48sXsotRuJAGmeAEJMJe/XBB0wahg8XRixxJIh68x3uyjUN7ENkF1fV119l+7wi9tSnjFiTo2IzJ72MggM3MsBWWhnLrq6z6eaqBcS0S43ppjFtrXHC50+fzHxopLLNTyLU7/RR7sPXqX+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GVXPR04MB9993.eurprd04.prod.outlook.com (2603:10a6:150:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 13:32:54 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 13:32:54 +0000
Message-ID: <50889349-4a1c-4978-a4e2-b7bf1964b881@cherry.de>
Date: Thu, 15 May 2025 15:32:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
To: Daniel Turull <daniel.turull@ericsson.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
 <20250514125706.495571-2-daniel.turull@ericsson.com>
 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::12) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GVXPR04MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: dce579f1-6551-4248-fb18-08dd93b4ff16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QWtDcVc4VFJkNGxXem1CemZFUEgvT3pWNTNOM2htUWtuNk10TjFGNjVCQnlw?=
 =?utf-8?B?V25Vc1A2YjlhcW52UzYyeW5JZXFNQTN2OURuZnFQSzFLdHZubmhhdThzNlIx?=
 =?utf-8?B?cXRsZ2g0ZFNPc1NSaHc0Z3JueSs3c3RiZVRmNktLSTZTb0E4ZHp1NFdsQm4v?=
 =?utf-8?B?b1RqdEI2Tk5jaTA2UGRHbnQwZWJmamZhS3NSOHRwUFRvbHFaai9UV3k3Z0x4?=
 =?utf-8?B?Zmp1WFdzK3Z0dDdnTVJIRFA0WnU3TDlaeEhaNEZnNDVwYk5IWjZtMEVmMDB6?=
 =?utf-8?B?SUxzWGhJR1RTRDlKN1d1V0M4S1BFUXJoS2hHcnNzNzZ1TXQ3RC9IbnEvQitD?=
 =?utf-8?B?eHVrMlIzK0REbG9mWW0zc3BIdjBEcG44OElhdU45MUN5VEF1T3RIckhvVHZG?=
 =?utf-8?B?dUlSS0s5a1Q3aGRtWUd6WGtaRHpmTlVjSGNrT1k5MDBoTlN0djljUHQzWkJu?=
 =?utf-8?B?V3dBOXljSHlyRWkvWWhHTTFSWjdDN3Ztbk9CSUZCSGNmSll3SkdZd0tWaGVv?=
 =?utf-8?B?c0pGbnZHNldIc29qaGI3ZTQwc2JSRXNsVWkxSGt5Uk5DYVkrNHp0ekRSUTR0?=
 =?utf-8?B?bzdlVnd1NzdrQjZjQXpMdzJid2FOVHNwOVZrampKR0RQbEVZSWRnR1hzRXFD?=
 =?utf-8?B?dDhtdHJ5MkFRRHdkemdWZTBBY2x0OXJOMS9QK1RXVmMzNFNmMzBjc2dVYlNJ?=
 =?utf-8?B?SVl4dTVyZkxWWjk1N3NaVE45bGgwbkN5Y0JqV2pBSUNiaUJUMm01Wk1FM2pF?=
 =?utf-8?B?RGgzU1Mwb0NiY0NsK1Y1L29yNmh0LzZoeVhETTJBUUxYaVJ5NiszWDRobnBs?=
 =?utf-8?B?YXQyUlExMTdVc2RUdjJxN3pYb0RuY0xWUklGaEJJTTcwZFBmeHpYWXlhSHpp?=
 =?utf-8?B?K3pPQy9VQlBIVWJ4NjdUUWhUM1g4NkNqUXp5QkZ6UC9DaDJQSWJ2SDVGUnhP?=
 =?utf-8?B?UFh0Z0dyS2gzSjNvOU9TTWUxRnBFN1pHUE1qOFl2RSsxemVqZTJQS2hGbmFH?=
 =?utf-8?B?U0k4VWRrTE1ra3hRb3FJM3BOQ0xzcStQV1pKc0czWDlkNUN1UjMweTU4Z0Rq?=
 =?utf-8?B?RmJLMTF1U2Q4cWZZVG01eEFDQmVKQVhOeEpiMWhQLzB3VkdoY1I5MjBFNy9E?=
 =?utf-8?B?b080dTZHbTdVTyt0TDNFMDhZUDdnNkpvemx1bzdSVUJPWS9ZMms2V1gyK0ZM?=
 =?utf-8?B?TlZ0aDhEMFZxcVFzZEFvbUU1WlpsdUtoMVpuYkRURDdpUXhxdXBScE0yd3po?=
 =?utf-8?B?TlArdnNtdS84Y05hMDlFamtlZjN3bFh4UmN3UVRBNFplWFFuTnlhVlhGVGJj?=
 =?utf-8?B?S21zNEJFZjVRTVdwRVJCZkxmbzJ0YklUOVk3QW44aDdrU3JMUXRWREpqZU5W?=
 =?utf-8?B?S3A3bEpzMjhKaU5jTSswVkRBb1RvQTN3Mnl1ZmczWjRFY2lTM0M5Nk5xdS96?=
 =?utf-8?B?cnhXN1hML29BeU95SWI0STZYMUpvRlVrM3pNcmF6LzVBU1VKWDdhUmFMdzlN?=
 =?utf-8?B?Tk0veG9PNDNCa3BUdFJnSWt2OFpPeXNEYnNHVG1vNzA5Zm1xakdUbXRSRnR5?=
 =?utf-8?B?ck9mUThZanpqZC9iWkpsWXB0bjRHeW82aC95WkM3Y0gwWEN5eW1IcXJsUjJm?=
 =?utf-8?B?NlB0Ykc3bDJiYmhyTlpiRkVxRG4rTmtqcUcrRmdOSE9Ca0VJQ1VHTERNSkds?=
 =?utf-8?B?VmtQV3QvZmZaamkwVHRodC85RzZoRE9LK04wbDRaRllaZGVLUkRENkpwMGdD?=
 =?utf-8?B?RERFcU5McExSMTZiTTNsNHNsYmVRb2E3N0huMFBnUjNYbkZXaHJpc0YrUTk3?=
 =?utf-8?B?S0pRU0pLMkMyS3ZoVklVaXpuMXhzMXdYOExGRmZsMVpla3hVRW92aUcwZHBL?=
 =?utf-8?B?V2p2NmVQQ2RGUVNXeTBFUUlUb1NpRmJqb1diczVxaXVXMXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDRQVWZ4WURKK0E5NlhSNzRrbFlHMXpsWUxNQTJRM0ExWDFQY25DaHluSzNZ?=
 =?utf-8?B?a2NERmFrQ2ZMay9CZmRqM1lFRTBGZ1UwSW52OXZiSjEzZkVrRDZ5bENUMERD?=
 =?utf-8?B?cjlyTlVPeG9YM202MXByamU0Zy93YUxQY2pSOUo4RlQwMytwejh2Nm1kTVBN?=
 =?utf-8?B?NUZMN0NSc1NxcHY4S0xDYlM3VlgrRmREU01xc09TQXFNcTJQcndBK3ZBdXBm?=
 =?utf-8?B?MEcvWFRIU0JSRnJkRUdZM01OeGVRemJ5YlgxTDdMR3o4eEF4blJQRGpKblgx?=
 =?utf-8?B?NERSNFhWVGp3N0VVUW1JYUNvdW1DekpwdXI1dzFISERtNUYwMkNaa2ZKZEFi?=
 =?utf-8?B?Nk9aRTd3MGplZ1ExazFUejQyRWQ3MlhiMWtvTDJQY25aWEdIaVhUOGtPQUhE?=
 =?utf-8?B?MTRvN3p6Zzc0Q0NFdFdkZDMzMEVsQThoTU1IR0JtTFJ0OXBNNERFSExaS2dR?=
 =?utf-8?B?K2xGNTNMUm5BUVhvMzExMVMwN3VTK3ZWQUMvTjFtL3pVbFdNQnFtT3dRNjNC?=
 =?utf-8?B?ck9aZTlKSlUwaG1qZk54S0QzNFdaOXd3c0pmeDJNMFhIZ3FXM2h4UWZ0b2xS?=
 =?utf-8?B?REY0eUJVRWdxZTczcUFBR2t3TitxaXRjdW0zbnN5NVZKS0tIbFZKTG50aWdq?=
 =?utf-8?B?TGNBMXdaSVp6N0Z3M3pNdSsvUlJOejBSMTJDY3UzMURrNmZvM0VSQmhVOHlx?=
 =?utf-8?B?VDA1cUZURFl5YVpxTGdzTkpqWDJvZU8yUmRsWDczb0M1UVBPYWFTMGFWNWpm?=
 =?utf-8?B?Q0hUVjZDK1VmNnRKakE1RTVQT2RyVlJFTUdkK2o1d0VacEZwcXp3MWRGb0hF?=
 =?utf-8?B?QlBrb3U2ZGJlakxwVCs0WDlDZTBjZnIzR1R3UVpaMFlRZlJIM2ptQmV2c1Ix?=
 =?utf-8?B?SFpGOFNGOFA1eGdHMDhHZnBOOUltOFJ2R1pMWDVRcnIxRHdiUy9IYWNjZ3h5?=
 =?utf-8?B?RmgvQktwSmFlcEJPQzBSeTZtcWphbzA5N2ppOHRyNHV1amFiWDRaVmFIQXVF?=
 =?utf-8?B?djFaRmRFTmFESFJ1MHJPOWlKbWdZK1pnMUxISnY5cnlwaFFXTVhidUVLSGUy?=
 =?utf-8?B?Ny8wTDFIdlZHRTlqNWhDVkpLVkFHdDZyKzZzRVFEc3FYbEwzU2gwWUE4QTl3?=
 =?utf-8?B?cmRSamtwVmdzZDkzTG43TmhXWVVwakRmVERhMXlUN21hajZGNnBnTENIRUcr?=
 =?utf-8?B?VGYrV3o4eUN2ajgwWEhVeFNrWTB5WHRQMTVCcHdEYXQxTjNOSXB0M2czUmdX?=
 =?utf-8?B?RHJzY2NYeFVlTnlJWHFHQm1IaUNodC9xVDlON2RGaktkM1NIdHNHRFZHNlli?=
 =?utf-8?B?SnhtWEhHNk51VUFDQlRhVmJEb1g4elZlZk8ya3JBSTE3d2o1TGt4SVZzWmNV?=
 =?utf-8?B?NFJlT28yV1dpOGRJT3BKMCtCRmdveElnWlY5Z293R0ZPWm92MS9KTDFWdytV?=
 =?utf-8?B?eHcxb0EybUU3MEUxVXFZWnZtbHZoUFhmQXZ2czNtSGlvYUk5b21FV0U5Uzc1?=
 =?utf-8?B?YVNkYVp1NkhLNHNMT2RXY2lUaElXSWJzWnkyTmlJb2FPNDdKV0ZLTGEyWk03?=
 =?utf-8?B?K042N1BqeWw0aEpVQzRLVU5sNExVWGdTRjhNN2FXb2NmWWt4Z1NHNThZUk5M?=
 =?utf-8?B?QjM0OTZuNUMzRjl4MUQzTG5FTnllMEpneENlN1NBZnRGU2F3eFBBU09tOVI4?=
 =?utf-8?B?M0VtbXczc21Ic3htclV2WDNrcS9kQmZHbXNxR3VKZXducVpOUmtyUmN6MzB2?=
 =?utf-8?B?UG5OOXJpVXJwWnkzWFFwNXdaVUFxOUUvRzFQWjlUcnkyNnZYemFCM2FTYnF5?=
 =?utf-8?B?dFdZU0duMGErZmJiVVJrSGlheDN5UmdpakRCL1NFSUZTR2c3UXdUVWdINkNt?=
 =?utf-8?B?TXlVNFdlbUljdGQ0bnV4Rjd6TzBGOE4wazNrY095ZzFZRXhCaTZicm5mdjda?=
 =?utf-8?B?cjU5WGltSWwxdE16ZXdCWGRNQUR6SklhUVRjMGIvaHZmeFdGM0QyU0ZzVlAr?=
 =?utf-8?B?NGJGY2tic0Q3cVlmR28wb2pybzRIUVI0OHY4d0pXN1U5MXJuM2hjejBxd0Vj?=
 =?utf-8?B?NzJkb3E0a0w3cGMvRHc2aEhFc3NVVXo4cW41eENKWWRhb0lTVld1TStNa0o2?=
 =?utf-8?B?WXRHM3VvckYyQzRVVUMzZGVEbjV0Nm9xbDRITTc5NXJGY201ekxXMERCaThj?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dce579f1-6551-4248-fb18-08dd93b4ff16
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:32:54.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQWMRKbXVO6v0jNMih2e0S/oolta/Ql+2iB0Zn0jLEk6W1/OLZjH6lhnSh+N82LmR+gpGNUVHhEl0PNiNySMpLRFKG0tu0BVhWF5+w7tO9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9993
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216675

Hi Daniel,

On 5/15/25 3:12 PM, Daniel Turull wrote:
> Hi Quentin,
> Thanks for the feedback. That's a good point for the header files and the rust files. I'll need to find a better way to extract them, since scripts/clang-tools/gen_compile_commands.py only extracts the commands and includes only the c files. So unless we don't have better info on the files used, we should not exclude any header file. Do you 

I would then suggest to include all files by default and only exclude C 
files if they do not appear in the output of 
scripts/clang-tools/gen_compile_commands.py so you cover everything and 
allowlist only things you know are safe.

know any better script to extract the compiled files from the kernel?
> 

No clue, sorry.

> The current code in the spdx class is supposed to only ignore the c files that are not compiled, (so been conservative on what to remove) but probably the script that I have in [PATCH v4 3/3] improve_kernel_cve_report: add script for postprocesing of kernel CVE data.
> 
> Needs to be updated, that if the CVE is not in a c file is not ignored, unless we have the header files in the list of compiled files.
> 

Anything that is NOT a C file should NOT be ignored (except if you have 
a tool that allows to know which non-C files are compiled in). Anything 
you can guarantee is never compiled in, then you can ignore. For now it 
seems you're saying gen_compile_commands.py only returns C files so 
that's all we can filter out.

Cheers,
Quentin

