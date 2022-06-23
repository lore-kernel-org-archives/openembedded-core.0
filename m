Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3A3C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 16:54:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.74])
 by mx.groups.io with SMTP id smtpd.web08.215.1656003244222736126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 09:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=tYD9Dloj;
 spf=pass (domain: vaisala.com, ip: 40.107.8.74,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1IHVk0cOjYq+Vp2DHTPz02WOu0P1+KRFTOZDUP2fV/J+UN/QDqs53Oc4TUmpMaBvaSrRUzf5wlSXOFteeFgyc5OLyEEng4awIbrr0kM6qzBV+MYZijzi29o3eKOQ8wmziGzbdWLd2EwnR3+rkYB3dTQfVFVyzIrx1OziKBq5Hb8IJzXDg7+kBIbOvJ9FZVJlfDrxRiqgnxzFu4rQJ3HBZjYt1ACASDG0sQkIe008/XRBYUniDXwaEyaLp9HDl1YbYGrF2+Q5DvtSUY8/bQr+228F8KDcmkaWPsNPhXk4PLGkutfwXDW6mu/Zjki2ZWuWo/ciAKd60NDyON4ugMdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssHonmAXubnMCfdDqTEc01ofjXX4+urXiz/1pgmyhzE=;
 b=Bb9m4oFnXl9YGJsSIZ8H+izTcOD/OwvXJo/cktbbY4hl8wvUzU1vo6wva4tjtEWZfeJyGgzrIdYWd35nPXsCzEeUEdCJp5Nw+bgLJkMR3nHtEB3PRB5o/MoyMujtmFaiI9vyBEv8Te8GM8SwehrYH7ixg05BJiPUOEm/EvMqj8l/uYoOspqhSNM/1xlAbYufgwKT6Edg1BhzYmSw0GaMMHRDTyijkS85i5MTuT57DSYtQlMrDzm3ncjPLgo9yjDjR9I/2kdNYRMkGB6J1lDHCyQb5YXQKvT8dA95SjhvirY1BnTanvnO9mCJCuQrBKndpndcG9eC7wF/wOvEJjOepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssHonmAXubnMCfdDqTEc01ofjXX4+urXiz/1pgmyhzE=;
 b=tYD9DlojLoNZvBTvuhZfPoqH7dbwiiYd54tdAqUsUtoTJj6asbQd8KblCmcGLeS2qI4049EsDxWtcKQAY0FiO6NG/JAGyg37CNSI49RL7rDaJGGYu85QTvdkhBy6K33BXtPxUDIN41SF2f5SXPu6Tlq0EL52E6J2JyKwJ5FGP402xIe+qmiJ5YBBXUsoWa9Ui2u8Mbi0kyu/7dtJmnspC4ibhPHKf7ZkUGPjceMXhY52M/UqJGA3T1txCBavt9MIt/3eUOnJzlAEt3YkCWp3UoYNSRaaJN4tlAcZoQAUkqT+AxF600JBh7971V7IyGCtUoXeZNEz7Y5WolzV7oT+bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by AM9PR06MB7171.eurprd06.prod.outlook.com (2603:10a6:20b:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 16:54:01 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::e8eb:88b1:5255:642d]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::e8eb:88b1:5255:642d%3]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 16:54:01 +0000
Message-ID: <d12df769-ced9-c31d-e3fb-e07858c852a1@vaisala.com>
Date: Thu, 23 Jun 2022 19:53:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH 2/3] strace: Drop redundant oe_runmake parameter
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220622191615.10168-1-niko.mauno@vaisala.com>
 <20220622191615.10168-2-niko.mauno@vaisala.com>
 <20220623113024.5a49c120@booty>
Cc: luca.ceresoli@bootlin.com
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <20220623113024.5a49c120@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0050.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::13) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f178e61-e60f-43d2-e7c1-08da5538f8d5
X-MS-TrafficTypeDiagnostic: AM9PR06MB7171:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tClBWoFzYBwEsJbA1ostHcl/PcsltwqeRYHQBOunHRZLPjJIWoN3F2aMMPfwJ+mXO3+BUkKT4gu0HoYJh7jHcrSzwC3LyZRdaKR7hGwNtoZ9CmC5lWm/eebVnea9JpGFL38xWFr+haU/0P2E4jAnxXQ5vTOTR5z0FNWs/yP1J1EREed97WbxgkVZ2MES4duaOkyMWRrsCdnxXpJP53vBm2S0cHiVadn+WJ4+vv/Kb40yokolFG/WIzGqlccotGbuhucwgTx5NVR4iVgARUQyFYh/ShRqdkeeYdLxKwDXWm9fBMDxPmbo6KeRSCRHY7S5v1UDEwjwjPB/k3uOmnUs3ERB8d0RYE+D59tJEqlVas4a/qIsamUMJL6Lpw5eu+3sSg3gv9pvf1ZWCED++ilRNjF1bU8D+uS5Aek4PlpVIP4gSqCn6ATThGvwBrPaHmFGRq7iSv2AQnK3ugGtGERcv45YKwFqMzzBMUcKSYmCMfhfFwIw3QsUNE8+pbtPV377c6G2ENDU4v6n15o+ORRskqhjznpzF4Gh8wPXR+Rnhs8VZy8wAKwUpUXcqS296JUjizzGON3KftMhwtmOlpSJ9AQBQj8CSFCEekq7cPypMftW4UP6EoSv9LcpXXhE7a1K+2x7bKi0kUHbcLmj1b72R29LcgVuaHPHHRVHyklQ2Vu+4m3sGoMOfGF4j2+5MEheFiYbTvH1yuEqdlbcLg4rhHaZqv9rBTjDdr3z8rCK4BF6//gb8vsV348cVBzBiofGH3YmLcesMSAHMDyD5PD+s2/X6auopbkcoMMQkuglenI1918+RINskBOxlsQ+aDV/g/aQQ2AWxVOW8v7ujMkk9sZfeJXkR+1fQMwHtzxjBiE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(966005)(6666004)(316002)(31696002)(6506007)(6512007)(31686004)(26005)(4326008)(8936002)(6486002)(4744005)(53546011)(8676002)(66476007)(86362001)(66946007)(478600001)(5660300002)(66556008)(83380400001)(36756003)(2616005)(186003)(44832011)(2906002)(41300700001)(38100700002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ymx6TzB0OWZ4UVd5MWVLTFh1R28yd3J2NkIybkFlaG91MXZjd3RUUnVLMVk3?=
 =?utf-8?B?OW5sNElrY29xMmJDNFAzb0xCdFdFTlJMc016V05YYXhXRm8vQ3ozZU4xa3RV?=
 =?utf-8?B?S0oybEtSVVc2K2pCUFo1cStFNnhaY1Y5aU9oK1p2YXBiMHNVVGwwY1NpUU9Y?=
 =?utf-8?B?SjdnTVVoR1hqVEhqaWRsckI5TTRidTVMV2oydHczdzk0SUV3NlU0SlMycjVx?=
 =?utf-8?B?endVUW1KbVI5SjFIRndFUklrTFp1dTVlT2ROMVVyUmxnMFlmaUhlb3JyMThZ?=
 =?utf-8?B?MzZWdmRWSEdkT2IxcmdBemhLRWxuM3dSWkN5Rkg2c3NPcDRzZkM1eFc1d01L?=
 =?utf-8?B?VXRQTnV5eWRDOHpJLy82REZlVENpWjlqb2psS3dxV3JTZ0RwVVFSaUtZU1JD?=
 =?utf-8?B?QXpRd1VTYTdhc1Ruai9COEFVbnVMTnZmaHZ4aFFkbzV0V0NRV0xhM3o3UDhT?=
 =?utf-8?B?UWpiM29uVnFRQXpqaFBSRmtFRjF3T2dJcVVEZHNOVW9ZbkJ5MjRHTHdKVnlV?=
 =?utf-8?B?WUVNU2RHUFQrbEYvRVpPZmphOU5pOGdMZ21jeXdma3AwQkN6cGZwYjhLOTFr?=
 =?utf-8?B?VndwR3BDaUZvMVpjMjFoaHA2SFVWOFNLRTdMbk9WUFRaUzlrZ2RUaFFubU03?=
 =?utf-8?B?bWtrZzZPZ0hyc3JEN1RkOVBmNXBSK2p6N2tLTWtRWVcyczBhaG9MQk1JNnpn?=
 =?utf-8?B?OE54em9VanRSQTlxMDJsOGZ1cmF6UkpWUHk5YkMyQmZsT2hOakNXam9lSnd4?=
 =?utf-8?B?QUc3T29EbXlDWUtpMmdYVHJSZ2ZSZHJZRWJFbzN6c1lTOFFtTDNyN0VCUTRm?=
 =?utf-8?B?THUwSlovZlBMV2FGVUt0RUVqeDdZWFozdFV1ZjJtaHdhenZOVGxZUUFoNlBo?=
 =?utf-8?B?bnRDbmdLSGtKS0FybEF3OVZKZjExcU9mLzFOYTdmb2NSOW9KUFhkVlVwYklP?=
 =?utf-8?B?djVLNHkwNXRuQmlDTWlUZGZnTnFlckFnSURrMWc5THdLUlFtNmU0eTFoNEhO?=
 =?utf-8?B?Q1dMT3phdUw1a3pHQ0lBVUF4L3RPdXhLdHI2c25ndXZxbFhub0FwYVZWQStQ?=
 =?utf-8?B?WUw5YktuR0dIOW9IUFVlK2xBaUlBUjdEYTgxTVprQVpKaTdzK2QzUGx1aEV2?=
 =?utf-8?B?RGtlU1JPVmZKekpIL0diUStKZXhmNVJxbXhxNy9XY25GYkpReEdzNmhHZTRr?=
 =?utf-8?B?dGlWMjVvbjZuOWQrZHFnZGJ2MHdWSy9EK241ZjQwVEQzdG10dm5oS1VnRGFL?=
 =?utf-8?B?aVZYOS9XZVFEdmk0aWluSE5pamF0dEJwL1M5YSsweHV0YlpjOUErTnhPVEVT?=
 =?utf-8?B?KzlGVzQ1Nk1ObmwvOFFxVlR5TWovdEsvUzZGeUREL093UmhUNThFZ0JQZkpM?=
 =?utf-8?B?Y0pKbkI2SUlqSDE5SjVTWG9XeDlIeEJWU2RMbWdsNnlRcDBUZklES2x0NmJR?=
 =?utf-8?B?Rm9OWjgvUTZ3UFhwOHB1REFoZ1dGWFNHelUyeXZyR2Y0cEJqemxxdW9YMGY5?=
 =?utf-8?B?VmQzWGFvYU9HazJabUNMM0t2eGl6MGJNVzJvZVptb09XcXMyWWVrc1IybFlR?=
 =?utf-8?B?SzJPbCtBbElxQ0RUME0yQ2YybmRpSWhzbE5FSEVhYWp1dnJBQzVoRFc5Mjhy?=
 =?utf-8?B?WEZoQmdSeUhieENWNXNqNVFOWExsd3JONUYxVWNmUGxMNmFyVWwrUTdVZ3ZJ?=
 =?utf-8?B?dFh4c1dqV2F1TzFJem9sUmtaU2hNY2FFdkNyMm9SUWdIOWFZQ29qWXNPTnp2?=
 =?utf-8?B?QnFQY2Z1Z1NnMkpVcldGMWgrOWhQbVBQd2hIWXBoUzFaZGV0VnAwOFV4eEZO?=
 =?utf-8?B?cDg3bWd4SEt2OVBjeHVlTG9PS1V2dlNLK2xZZ2RVaEhDODdISWJvY1lSUkpE?=
 =?utf-8?B?Ui92WVlDT1lObC8rOVJKNVgybW1DNWZjK1B0QVZPZ05Ydk5JQzRzTUt0M2l6?=
 =?utf-8?B?Tk5RWW5WSFlCeUFDVTIyV3dKVTVMTmNVRFcvem80ek02SE9jNUZxeDFFN0o3?=
 =?utf-8?B?RXRURWhmVTFRcHVQS295NGRxSHJyNkFjbWlYTVYvVVEyeENSNEF0aUNDdFA1?=
 =?utf-8?B?enQyTXA1U3hHV0tPaE1BOWtlRXZDYlRDRzlVU3o5cmthaENGR1o3WVhxZkFz?=
 =?utf-8?B?dkNQc2ZKcFlVUjVOVGJybFN4eVVBNXhybDVSdk1MSmxTRWR4U2JuNXhDT3Zs?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f178e61-e60f-43d2-e7c1-08da5538f8d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 16:54:01.0299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vM72KMa3LkSdmeLr1hQAUMVsHFHSpCvdGcK0cpZgSQroHXzZfkZVa0q/SfCefVYN32PBs6zZ9U5pNMhMYrjnow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 16:54:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167280


On 6/23/22 12:30, Luca Ceresoli via lists.openembedded.org wrote:
> Unfortunately this patch does not apply as strace has been bumped to
> 5.18 by a recent commit. Could you send a v2 series with this updated
> please?

Hi Luca, new v2 series sent with updated strace version: 
https://patchwork.yoctoproject.org/project/oe-core/list/?series=5032

-Niko

