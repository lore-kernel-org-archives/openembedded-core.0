Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86017D21694
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:26:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.0])
 by mx.groups.io with SMTP id smtpd.web10.12119.1728995165309494551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=b8cITHQ2;
 spf=pass (domain: cherry.de, ip: 52.101.65.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh7mUwMDsAXAwGoFKY526PBWrecu75J/Yn+CDgQ0P6YLQBnMBOuxVwihiGMcfN2JOvKiOtq/mc7SyQxLvKlpdYT9AGawXjI1+GDWtZDyZWo3sflFWVSK/OZEmMLd5ZS2PIn6U63XpYVLXFgmg4S0OdewDARGEqe+8g6v/uZCmas73gAuDsGRancMb/EdMB6Vbj3jikP24TMLalvcfNoPF+bKppXcjsBycC8v06kOlirygceLpdH8WrJqRxbhZF24yNCr0kepz6AcwuhAIUMM10dyrwPzfPE/AQ+YEh+VZbv+SHZKTNrE8/qUgh4KZCpJRJ0FCx8yA3av7fypF1Vkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBEdSUY8C7PFM7JPPpCY7e7DzYvOZskulfrf2HGqpAA=;
 b=l0ZD2EABMCWm4DWUAIYS9g/t4DMD3crlnFZFIbaC4kWzbMPw5oft7/2PvqcjQM7XwUqXiqz+ATId9X03Qd/UgCc+06sRIysFy+4V4+bGbqnFWoM/X6p1q6xOFqFjh7C66TBrhMPnkdCvGuELqBIJSDvIhuWiLaKYKATJ9g6ELkJOEScYaVfJ6SLyN+ToaA5uwXK7g48fLHhNz/pVg/YDs04pl+EVCwy/UMm8OB7K/vlsMgwBWe4I/gE7baRXtpi8ItIzOEhkAHL0+Uh/Xgkg5nIHFkiDmNY92qengGoatCNyrqi/EdTYn/zy6EISi9wrjhqB6FTY5t4DUW5EFQc2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBEdSUY8C7PFM7JPPpCY7e7DzYvOZskulfrf2HGqpAA=;
 b=b8cITHQ2+i2ilHENviOIvYh+R2T4v/EJ+lEVvtqr7dJ+N3DColYiKBzc/bv/72H7zzUBw/s7VnOFyS8SbTKPsdnitJ12VqiqvdWI0lW0SdoeZsCHEYNPjLZCO4/SRuEy+0/djiIyl0AIj+QfJrMiamTg4KYV5EKh0zPYLQT01ZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9779.eurprd04.prod.outlook.com (2603:10a6:150:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 12:25:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 12:25:59 +0000
Message-ID: <d9438df0-4bd4-4f62-a4e1-5fa21b7e957f@cherry.de>
Date: Tue, 15 Oct 2024 14:25:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RESEND] u-boot: upgrade 2024.07 -> 2024.10
To: festevam@gmail.com, openembedded-core@lists.openembedded.org
Cc: marex@denx.de, Fabio Estevam <festevam@denx.de>
References: <20241014113549.1594444-1-festevam@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241014113549.1594444-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0129.eurprd07.prod.outlook.com
 (2603:10a6:802:16::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9906b9-a3c2-4e30-e51a-08dced148684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2xTcThOSkpJbkJZY2xEcHBrQzhSMlF0TjBvaEkxR0ozemlEUFRDVTY4RWdM?=
 =?utf-8?B?K1ZlanFzKzhXdFpZYkxzOGU5aG5acHIrYTlpNi9abGZCQndmMnRia25QM0ZC?=
 =?utf-8?B?YXBtRU9zbUdPb0l5Z0VibFhMYjVFdmpPaU9ML3VHUk0yaDZPZkhxUGdRTlZU?=
 =?utf-8?B?Ly9PM0xvbHNUTzJHL1U2TjFZZjdCWkZ0bDBXSVBGR2Vub3pmZllVQ1N2b2lE?=
 =?utf-8?B?YUpia1JlSlZ2S0ZYNWRGK2lDTC9mY3EyVGdVLzQ1YldaTFZ1ZVJGS2xwTk1s?=
 =?utf-8?B?LzhQa2NSc2ZaMEo0NUZGb25PUUpWcWRZaHRRYVpTZXdWcTZaa1NqNkdrclo0?=
 =?utf-8?B?VEhiWUJOWFdCeElWZjR0TFUvNHdSODkwRUFCbTJFMXZIY0tVdlBnMk1lTVEz?=
 =?utf-8?B?UUo1MXNHRjdhVnZpZ2lHSXhaNEQ3NWMyVllCVDRZdWZUOE9ES3drdjRzUllG?=
 =?utf-8?B?eVJxbHZvMjhEbmNtdXpEWStuT2plZ3Q3VVFKTXN5WTE5d09USHhkc2JGS0dL?=
 =?utf-8?B?c3hYMVZ1NTRkMnlYUldCNEI2Tk9mM0FySTZ4ZGpybTNqdmUvdStKOWxXdERG?=
 =?utf-8?B?d2NIT1h6SUd0ZXVjVU51ZitkY0tyQVdCTUZMVEppNDBtOUkxVEVSN2pCR3VE?=
 =?utf-8?B?SHVZUmZyaU5nNVpkRC8vamJWeFlUcXN0WWxqczdOWmtBNEZiQTIvMnlpdk1k?=
 =?utf-8?B?VUdGbDFxNFJKYkNjMVozeHM5aExUU2lzeUQ0MTV6NXRyQUlETHBiVEVKQTdw?=
 =?utf-8?B?UG5TeHBzejFLVExFbXFYcmdqK0xYVG1LM3V3WnZVVzZaV0kxYWVENHNtaDR4?=
 =?utf-8?B?VGp2Z01IRjFLZGhWaWdTWHZxMkN6RkIwL2g3WEhvUzhsWHQ4bmtMQ2pJQlVv?=
 =?utf-8?B?NlVqUVVGb0JNTkJGOGpiSGZzMlJPbFJQRlA1djVzMlVtVzg5dm9BOTZib09N?=
 =?utf-8?B?Uk1tWllPeWNoamExODlwQVhqcG9iK3ZrdFBvdWtoNVczaUNPcDdnSlc3NEtQ?=
 =?utf-8?B?MVhaTFVHTEovZW15Zm9sTWdaU2RhRDc3YWF5YmNzNWFjRS95ZjZIeko4Q2dk?=
 =?utf-8?B?bkdCK1RJcUkvVzdMeWFwaXFLSS90SHlkalZhUjBpSDFXWDFqTjRPRDRUbVlC?=
 =?utf-8?B?T0ppSzJIdFh1YUFBdVZnaVpzNVFZZU5oYXFtckpMY25pOEVxZHlBcnhEOTdB?=
 =?utf-8?B?NmlkWElTNjFsNDRmYmY2bEdkS01iNVpGcm1wK25ndFFnQVcrVEIyNDVkOHBa?=
 =?utf-8?B?UDZsUVdIYzYvRWFveHdPbE5GMitYRWR6eVRPRHpzRHZzbUFGUkkxV2t6MzVx?=
 =?utf-8?B?TzlibGNQcnR3RXdiejFWNHZPaGV5RTVuTnJrK0RoS3dZUTV6SFBFSmxtV1No?=
 =?utf-8?B?a0RvcXA5V0tDODdsN3NaMTczbU4rYzVDTnY2eXRGUWIzM09KQ3A4NWcwUEdI?=
 =?utf-8?B?bWlWeVVFQlY3RHBUcDNXQXVmODlRZjk1TTJhNDhIMUlETkgxMmJNeG03WTNJ?=
 =?utf-8?B?UWFoamdMS1g5eTVkT2Q4WWdtb3A0ZXNvUGdxb3ozMmwzTVN6bHVoenBJYVhO?=
 =?utf-8?B?T3NzVENnYjVOVUhHZlRvZkp6aGowNXlvaURhZExPWDc4a1pBa1pqTXBRWVZV?=
 =?utf-8?B?R0dXaERudk1NZ2NtTnB6MDZUZ0ZHUGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlBDMHpHd05TYmpCWWpENGVFT005N2J5cWtJNUF0Q2NGR1FNR0k0V0NXN0p6?=
 =?utf-8?B?VHRpcWhpS1M4WWlVSFRrclZLUnZhOThhM3lEQVpKcGh0cFpLcnJ5cGFqamV3?=
 =?utf-8?B?ZEpxMTZYR0NhbEU2MDgwY0FLVkpIaktUeWREd3hnY3QyNW1BVGZXdEU5UjdY?=
 =?utf-8?B?QUV2eENIYXliL24xZTlNdlRXa245cTRWWTA1cGZDWXRTdFc1UDR5UDdUZ2Iz?=
 =?utf-8?B?K0hpQ2xoR1JBOGozT1J2bkh1cEJUdzYrM0ZVN2x6a3VnU2VjSk0vWjltUTZU?=
 =?utf-8?B?Lyt4eGpVbFRLa2JxaGZMdWhhVDg5TTRFUlpFeW85U2xza0c2dnJjaUhxYVdL?=
 =?utf-8?B?OWRGeWUzUUFJTW1TZlJVTkhZOENVSVZ0VDJ0STFFWDR3Zml1UEVIcU9hSzFr?=
 =?utf-8?B?NktqeXdjd1FBRHNxZ0MxQXM0L2FET1NMeVVxdXFSOUF5ZTFhU3F5ZFFFaFhF?=
 =?utf-8?B?RjhWRnVzTGtXVW5ZS01NUERKeUR3YjMranRZdnkzaHRrWGdLZ3JVZ0x5dWJB?=
 =?utf-8?B?TFZxVUhtS2VuMnZkaVo1Z0ljSUI3cS8vNUR0aU9vTklsWTA4bmlxZEo4S2hi?=
 =?utf-8?B?d0JVUU9WWWZEb21sR21uS2F6UmIvUXRacVI5cGxiQjVBM1VQYmlKU0dBZGVW?=
 =?utf-8?B?RmdIY09ySEx1VlJDbG9IRGk0emlyd01ZeHA4c0MzcEhIN2hTaUd5ZjhWOU96?=
 =?utf-8?B?YkZzWkZuU0kyUFNjbUR1SmNzSE5scUZhWFFzSXFHOWNzVkorZFZXVDA2bGlm?=
 =?utf-8?B?Vk9TSE1ERGFNbjl1SnU3LzhRbWVVWmFsNzdoczNBd2JBbFZzenA1SlhRQWoz?=
 =?utf-8?B?U2ZFRCtnMUwvZnJVakNrL0dvaTVSd1B0UjZsQ1NDbEpxVkJaTDlra0pFTHQx?=
 =?utf-8?B?djkrUENyN2dOb3hrbm5JdU5QY2FrdWtMREhNR1pOSDJRS1FYdU9KdlNhb3BT?=
 =?utf-8?B?QU8ybnh3S21RVThOclJieXc5YjU3WTRnN3NMYzB6T3hqYjM4bHZST01qVk1Y?=
 =?utf-8?B?cEpab3J4YlgzVGlBdUxDS0NrOVdxRURzWVBiaW5qVnB1OXhJbmJLYkM3aUFl?=
 =?utf-8?B?ejNwMlF4cmp3N2hxYmVQa2gwb0NHMThEelVTdDlBUzNSY3NaZExFVTdTa2Jh?=
 =?utf-8?B?U2gyZXJPVndSdDZNZFd4NUZVeWZXSUF1MFd1bkcwcnkvTi8xWHZuUTVoT2xo?=
 =?utf-8?B?c1p1TGQyaklaMSthem5mM1Z0dXdTTXM4QmJGejNmT0RPWm1UdXZXRlFrbk9U?=
 =?utf-8?B?TUJldFJObkNQdEwwNUJuaTNNYjdDQ3hpU0hTM3Z4UEVYRWF3TTFkMWZkL0VP?=
 =?utf-8?B?T2Ftek5VVC9iWEYwZ2FTTEN1OGhCTCtSd1QyeXlyU1QxeGlpRERZUWQ1Mzcx?=
 =?utf-8?B?dDc3ckxZK0JUNlRhMUdtY0QrMmZYS3ZwUkF4YmJZNjM2SGlkMTNZUDh4T09L?=
 =?utf-8?B?ZGxMc0hJeXpDQWpzblNMbGVGbGFtVWgyREFmWWIxanNwMTRBcm5LK3JFdlBy?=
 =?utf-8?B?UjJ5dGFsd1ZFbVBKbHVYK3EwakNhUmhLdnpDQVBCd0pKTGZFMnp0amtwUHRz?=
 =?utf-8?B?MytEUW0yY1cwcU94YVNJN3VHTW5nYWY1aGdSVjlRTFdlLzJWYWxwblU3a09U?=
 =?utf-8?B?OWVhTXo3emhGYmZNcnhERVpySXJmdG5nc0tXc0ZLOGJaMzRISzBvVEVibHpJ?=
 =?utf-8?B?UWdoSWVUU0NHZmlqZHZGNVlPb0IxbERmTWNuL2c4aHdqS1oxeWZzSiswaHpK?=
 =?utf-8?B?MVliakRQU3RTTVUvZm92VGhvYU41T2h5NURGQ0JCN1ZrR3F1K2RLS1dnWml4?=
 =?utf-8?B?SUZMU1MwMVd6ZlByc2VoQkFCdkVhbkxNMk5lU3I4bFVCSDhiVnRxU3gxZU1E?=
 =?utf-8?B?elpxNG04TE9yWnJJR05jQW9LZkZML3hReVpma1lPeEdoZ3RIWlltNFZHQ0Qw?=
 =?utf-8?B?QU90SjRvTDFwajJHZ3pUVDlHTHNSMzdwY2lSeDQ4eDlGNU9ZaU40Q0RwMmpQ?=
 =?utf-8?B?b3BscDM3a041Z25hUzBDZ01RRnNibDRMb2xGN1VJQ2J0QlR4Zm02VHNtZ3ZN?=
 =?utf-8?B?clZQbHdpMXZHNjJRcHdmb2ZQYlJlWnhNbGJoQ0o2eU5YaVhvOGZMRElHcnpq?=
 =?utf-8?B?eStIVytCM09YK1NrTUNEa3JyOHljWjQ4U25CWWNhWHlycWJraVowb1JwQjNm?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9906b9-a3c2-4e30-e51a-08dced148684
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 12:25:59.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5owabvLWmFItOszNTMNsHomNOFjZtBoABB+EyDj1bBAzuz5s1eleYq/QNyygNxVuVwYhau850/DVGSXU+aWafHaTp5+6l2EMPy7ul24FRTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9779
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205912

Hi Fabio,

On 10/14/24 1:35 PM, Fabio Estevam via lists.openembedded.org wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Upgrade to U-Boot 2024.10.
> 

It seems like AUH is trying to do the same and fails, c.f. 
https://lore.kernel.org/openembedded-core/01010192901b0371-284b1cb4-52f7-451c-806a-9e474e608d04-000000@us-west-2.amazonses.com/T/#u

mkeficapsule tool now requires gnutls it seems?

Or has it always been failing and it's just that I read it now in an AUH 
patch?

Cheers,
Quentin

