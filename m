Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0B7C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 16:05:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.117])
 by mx.groups.io with SMTP id smtpd.web11.21220.1710345898702831584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 09:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=fuiUGQbA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.117, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1dv3Mdv6nTVki8aLhPkFN094asDKkhEAJAcIKwS0tjUPL3gRHNNhWy0iH1GCwNkgvWc9io2esciCEwWz3m9LU01mSsXyqzIA9zjWWhrU9O+sHIwaM7NpVCYOChGvnYd170sgSkaS4an7Qh/RbWWK29+N7c1mhPD10ItSd7aDsRRr1C6nMH/BjgTUmMLafVJYApPHcvEFuNnHfRb3T/T6pRyGyHIOErlr5iixzgRJC6+GUJ3B1rxwwugAi0JEl+0br1WqzZUfdhC9891ExNv4wgrVUpPOtD95JZn05KEQz64EyD3RA82sY20kRnyR0qtg0AvKrWZswZWrO+61SvlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki06fw2nZyuAzsgLeUDeF3eSXNgiK3FhCpskSsH1MJ4=;
 b=iT1CSFdaiQ5YX8LaSuIDSDOJLnAn5ak3HwQtiiXAOYIw+BmWTq7+jmwUOyQiv/m+CwH9tQHMgYRUtYxIx+pGRzOMvMBNxGIVaGrChkzG/kkuXVHE6V7h6CC9ohbYkU/QOd2htJvKTpOl4C79WFVlukWZq6Sb47qiXeBwV8a06sD3aVBxUqC3gmqZmAGXyV8NWuRHct3+sBMEf2XKBlXnpxmu+1hb50z1ehR9SfeNXxihYDj0PjxEh6M7tsGGf7K+h72XzZl8XAH/+t+MZGgGDHflRB0tbWmiU5E8HFSxp+D2doAERfScxktydYoD/17epj9tsWlbWQHQpVZdeR9ejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki06fw2nZyuAzsgLeUDeF3eSXNgiK3FhCpskSsH1MJ4=;
 b=fuiUGQbAYhdtxcAAF16/3vEG3le6CXThhbZShHRe4Jl1fTTvxVmS3WnpoMESPsqqDx4/ic9N4KBHBzNelLo/k+yknko2xadH/pe2xPNWv2kaKkrx2O+S5syzs5XOhPuqUFBUZd4YMSJFYOqXjz+cyDM6fi7nY6Ip9276DmVegqc60in/gxXlAn2RbCyJ7tCjiO/I2EhKkP1v1kNxoxZQAwFvT3dt5O7QArcEm+4jMUwr4fpTWiQqN/AgORJcH4MUaORMxkQLApL/S7fPLTwL/ANU7KalrwGo/0vBsf+RSTUUDDM4k+vQIN0xuyexu71MO9gv+1VkO0mLoicYUAp7rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7672.eurprd04.prod.outlook.com (2603:10a6:20b:23e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 16:04:55 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7362.031; Wed, 13 Mar 2024
 16:04:55 +0000
Message-ID: <9975c0da-0ee6-4de3-98d2-e01afbc1622c@theobroma-systems.com>
Date: Wed, 13 Mar 2024 17:04:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] linux-firmware : Add firmaware for Intel
 9260 wifi modules.
Content-Language: en-US
To: yannickrodriguez22@gmail.com, openembedded-core@lists.openembedded.org
Cc: Yannick Rodriguez <y.rodriguez@i2s.fr>
References: <20240313153922.154396-1-y.rodriguez@i2s.fr>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240313153922.154396-1-y.rodriguez@i2s.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca56486-33d6-4be9-0ccc-08dc437752d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pOQzUPhinmS4UQPPqJEXTzK+Y5bPsVMzpTGP905Iqx1ipn56ws/AaqWKjwqOxyx3Svj0z4stTHDrFFCkERoUc3tcbtlsmJlh2bkU1gjewDQXeppxUUaqTktDFocqf77dwfVHd3D265PZaFRQluVbDW5zEZvAMCme9BcM6BOD2UKvFwCKiFS4vzA+gS34GKwxbynBBaTLB04WxiQbKOOzTW8pjnEKGajMWXXR+E4lnroix6aa/nGuVm/az1y3DQzSCn7TXsvEfZ1wfHEgATTtBTm0+M8331HXSC3634RsZ3z3zoW/dwyvwSC76bU2DATZholxtOrUakBqFG58OmlhGmGEpdk58cafAl8ARVW9Lz07CsDn/izhTdyL4ROyObre79h01zYmDQfu54ocZL4emBAQgEbsDpyHSXDznp/5BSlqfTphwH5nrechLbghzrNvkbNdnQaUw6OPr4Vs6ai56UNw6m3Fc3XFlVyj4RzVKgYGHjx6QxY5mm+h3IJ/oCfHCRiCNAMKXmEXWHE53k1SxwY/IFlXF7e8sSshNhqwYcmzw+zVhXYWLcRz88Ke9pqjWb8ZAGcpmPIK4lwt+u3W+FKj5nu0BTEkUdz68KM4/4I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGNCRURuN0l1TEk2a21NUUQwYjZNSW9hN1FuQ1lEb2RpYm44a3BwbUowdG40?=
 =?utf-8?B?Um5oQ1dmOTVKb3pUU0x0MXpLR2p5K25MVXJvVXhraUEwYlAwM0ZaTGkzS1Zq?=
 =?utf-8?B?ODhnOThyejdLN3lVRG9SMjg3cTdGR05EN0FLRXAvcU5UR1ZiZzNyWkMrTEVV?=
 =?utf-8?B?QTMrVUs1cDNkK1J2TTgwMlZZbHluaERDenA0TmFJSDVQTjBZZ3VONUY3Z1JU?=
 =?utf-8?B?TTBHb3B4WXplMHJmSUl0ZU5CUWdCTFpETVU1RnplRVp3K1RDL3I2aWlBZTl4?=
 =?utf-8?B?aHBwZWcxQ2FQSHg1SWdOWnJqbndIUS9iTHdUSEIrVjBGeWZjcW9SUkhQVkpu?=
 =?utf-8?B?VVdjOFppa1ozL3pRa3hrVmxwcURsMGZMRm1lUFNXR0pLN1NpTVlWczcreUFs?=
 =?utf-8?B?Vk1FSmoyUFY0VlNUOXlaY0RCSEY4Y25FcmoyMVlrN1IyOE9lTXM2dDA3bElw?=
 =?utf-8?B?V3JsKzVnZWZTY0tRU3ZJRWF2Z3lmUlVma0E2MkgxRUN4dlBYT09TNVBRK0hL?=
 =?utf-8?B?QkNGSGx0V1Jkb2FaKzdrbHBwVXZ2QW5zS0RMWUhMa3JNU2hmK1JYQWQ2cEcr?=
 =?utf-8?B?VDBZT0RNcnJPZlhha1FrcFJtUDFORDVaVWFXcU5PRnduTUEyM29HUVN2bk4y?=
 =?utf-8?B?WVlYM051ZFlyTzA1bUtIdmNzWUZwZFQvSzBkcytjL3NnUDQ0dVFVL0tTVzBF?=
 =?utf-8?B?UHNVVzBLbXZibFFlZVlIMWU1YXhYYXRwaHVqQ0xVNHgzcUYyQlhXY2hlaWtm?=
 =?utf-8?B?NC9qWWR3a29SemVTN0s5bm5CV1dlbkZ6WFJUdDViU1ZqdTYwazNLZCtUUGtE?=
 =?utf-8?B?d095ZWFidk0zNzJHbjl5cE5iTjg5UjNERmVNUytDTWNUeGhxZkRqOUFMMWZi?=
 =?utf-8?B?bUxsT2J4YlEvNHVaTjl6MkZubmVHMGdzYklib05YdnlnZ3pZcFc1enZIUktn?=
 =?utf-8?B?OVJxRkZFT0NIdURwdVV4aTA0cHM4emNTWEo0NFF6ZlZhZ2tmSitLeTdUbjBr?=
 =?utf-8?B?QVRSeUdPbUNkd1NUd1B6VFlBamp6ODJtRlJ1TzFaSHI0MUpnV2NHajEzblcr?=
 =?utf-8?B?Wmc3eDFNSHp2QWl6aDczNlo1WittS0tqNEJCbEV6dW5VYU04amkremtWbjNN?=
 =?utf-8?B?dW0vWDFSQ2FOQ05NVFRlZVlMaEo2MTU0YVQwUE5pT21QYzBEMlRUNHc3MnFK?=
 =?utf-8?B?cVNzRHFVOWVoZktKZzBZRk85NzMzajYraGdwVUNweVVLYUJiK2hIV1VjQmxE?=
 =?utf-8?B?bzd4K240cDlpUHBlK283elVaMUVxUFVDWWxVVDlSVmdTQStlaXIvNjZrQ0gy?=
 =?utf-8?B?ZmNHaHlMYUgzQkpmZ09CSXRKU1Nkbm1iQzJrdm5ZNXozaGw5V2Erb3l1MGYy?=
 =?utf-8?B?UkRqUytHUk5ISU1OUkVmMzNza0RsaCtHaDYxYWpBSGlELyt3OFNpaWhJUmR1?=
 =?utf-8?B?dEt6S1dyTXYxUG5wZmU2bzZGSG1RNHNJNjV6emFmQzc0WEF0RjJNYWhYdFhR?=
 =?utf-8?B?WmEvMDdiN3Z4L2VZeW1KQU1LYWQzNXlyUzlnVDFCVE5JTG9acVZLWjZBbUl2?=
 =?utf-8?B?b2Q3T0JRQkRnMkdFb2FGWFo1OU5jTDVLc21RWDhiQk13ZGtwb2xjWkhDdkZZ?=
 =?utf-8?B?anNvNGF5RHVzS2JvcE83OFliUnprSUFybUFtbkJkUEtTcXJJVVYvV1dOU0E3?=
 =?utf-8?B?eGJ6T3BhM0xQbDRpa1d0Vlo2ZGNBSXNGRXI2bmQ3YlN4OEw4Y0hvczlHclRh?=
 =?utf-8?B?QXN4RlFwd0Ztb3ZJK0dCVEJQSFN0N29WVTBUcmE3NjlFRmR4NGRsSHdBY3BS?=
 =?utf-8?B?Qm9wdFpNTzZUUmlWaE9oUFZ5UkN2MGR5SFlkWG9Pci9DZldyZ2lCdWFXVG5T?=
 =?utf-8?B?NEU2dVlBMmducE1CWGl0clNVeEczTTlnSDVJZTcrY093dEZNSTNiNVBzWGNx?=
 =?utf-8?B?UVdoN2I2ZTFMOWtMaTVaM05KOU9xa0pUTEhXaDJPVG5URWo5RHg5L2FTcXZ3?=
 =?utf-8?B?UlVUYkxvTGk2RmIwTVdtN3Z0QzdVenYvWDhrSnlORWgyWXlYMy9BODRMeG5u?=
 =?utf-8?B?STcyQkw5cVhKMG85TjE2RDlDK0lxanJiaXNnMk9sY2xub214UTNZR0tUeXoy?=
 =?utf-8?B?R2gvQVg0NVRjUmg4T2xIWm1Ma2Y1ZTl1NE9NSXlNNWtWY1RoN0RFYzNsMGtW?=
 =?utf-8?B?UXFIblNNQ0RoVGRxOFpJZ25CRjNqYXNSejBKMmxWbjJIVk1QblJkeUpmWHVo?=
 =?utf-8?B?dXZucGJMbmlXNnpzVlBKRnZva013PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca56486-33d6-4be9-0ccc-08dc437752d6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 16:04:55.0852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh8kvO1Krvu4YzuYIn9/JkKbTcCxoKZrS8tnh4EgYG7ncndaLDPzPkmG+DKd/OUJBuE/aHEmattAOFL7GlreLDdNxRPBUAHuIoNThEghbIGPFDh1CbT+b/Mt/EPbhmNG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197050

Hi Yannick,

Thanks for the patch.

Typo in the commit title: firmware and not firmaware.

Also, to be pedantic, you're not adding firmware for Intel 9260 modules, 
you're moving the different pieces of firmware to a separate package.

On 3/13/24 16:39, Yannick Rodriguez via lists.openembedded.org wrote:
> [You don't often get email from yannickrodriguez22=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Yannick Rodriguez <y.rodriguez@i2s.fr>
> 
> 
> Intel 9260 wifi modules  is a serie of wireless modules that need firmwares to function correctly. The linux firmware recipe does not have a package of these firmwares, and this commit add them.
> 

Just to be pedantic, but linux-firmware has a package for it, it's just 
happen to be a package where all the files that didn't match make it. 
Which means it's several dozens of MB big, which isn't really nice :)

Also the commit log is usually wrapped at 72 characters, but I cannot 
find where we put this in the contributor guide... if we even did put it 
there.

Since this 9260 is a combo chip with both Bluetooth and WiFi, what about 
adding a separate package for the bluetooth part as well?

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?h=20220610&id=97339b3a1d3bf3e4c40d679896a27a25fa83765f

seems to indicate that we can have a
${PN}-ibt-18 package with all firmware/intel/ibt-18-*.ddc and 
firmware/intel/ibt-18-*.sfi?

Looks good otherwise,
Cheers,
Quentin

