Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C05C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 20:58:44 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.78])
 by mx.groups.io with SMTP id smtpd.web10.10773.1640465922433024922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 12:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=nRJCEnv8;
 spf=pass (domain: outlook.com, ip: 40.92.73.78,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYuMASG2+9CWKM6HfEoRehPn+o8pT/e9CD92U99BSNA0nJ/a+pw95TpChzunShyr3yEK7Hd5TNM0ptE2EEV0xQuYuFSs8CzhaY17P17CTpTYgtsBdyNKn8Af54wnCiZIhGqPmengKzA3oQa42s+OeEcR43ImjyFWekRfJ1WFFxEv6j3gxS7mFhsa439dfgqTVF5x9DntssTdWRvswZ4yeevfmiujxCfDysNNgQpp+4OERiN6mtqn6CraMiFG+s+3ekn3FM+YKyOO6k16vo1TKbdUPUSuQbJRCV3vUFVVK09ZwTBvDUd/rLDYhK6/7I8lUdOs/QgxBdVgdIX5oUhFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=su81i5rIJblNSepmw2iLIsr2NqjUCFnuauO6KL9DKGE=;
 b=CdzE5s+PY+vpazcjVdsPeGmKfgYVpllQj45K8ZzeZiMokTHHQx04HxZUvEQ+9TembkdX4Fb57FpIglWuwN3OuovdsTo6IUfnCAD4vkLy+4TpEBo2KZJ29DsFEzm+KZPu9MnGNfgJoUxnz6gGTLLosPv/KAdM78fTR5eYuUhsuBza/dmZA9/B3nSyyh7+ne1kxBUK6v7k70C6NiBoGV2zTHLjR4pxp1C7JQhzUMEnZWz4wnIF+c4raGkmCS9tdWsg7vEKirS+xxSCkYuUwFDK0PPMn90Gwr7OWza3S97FPMofgGRLRWs1Dh9M9IyRUM7r8hJT6i7YrWCxG5+owhnoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=su81i5rIJblNSepmw2iLIsr2NqjUCFnuauO6KL9DKGE=;
 b=nRJCEnv8tizmfGdl2bMaWnvC5Qa+rCK+ddLMkzUJahk41XajLGxUopfPacH8p6hRBpJ0LSa/R7oL6h0q6hVuWH+EIfaVwD2M4tpXCgElADIaQkXmqpjDDm8RWJSwpLvEjAn2qLstVHQ4Qs8Q5ejMglGE4gy8/9s0orhFEOqY40PB/OA/IBRIRGudBBnbfVt4htdy8//24NsCjg9QeY0V/RH3c6XzJfjTe/WxNRjfeUIUvtKwWyr7XAxgspLgQfrf3g7kd3MahsVku3UUHtHTPs0rAvYX0BV0UzzS9MiGOTB7aCz54HQeUFWC8R+yKYmXHrO8tIIghdWWiVgCyqK4rg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB5091.eurprd09.prod.outlook.com (2603:10a6:20b:30e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Sat, 25 Dec
 2021 20:58:39 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.022; Sat, 25 Dec 2021
 20:58:39 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642D66F272E78BBD4251AE8A8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sat, 25 Dec 2021 21:58:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [mUUF2s01BgNvV9A6j/yyW3oCbFVHMTw3hYM/AkyoNUrcHNPhz3NR1wiVkO6rLs8R]
X-ClientProxiedBy: PR3P189CA0036.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <2586d3ee-67ea-9852-608f-e5f72a6e33e4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0908c430-1065-48ca-a296-08d9c7e95379
X-MS-TrafficTypeDiagnostic: AM9PR09MB5091:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hvKiRcFrLtXI94saJ00R3FSoyCUfox5rOIoGhmRwTgCpGsEyS792/VIxrnuwvMVK11N6XCZ9I5sokjtt564UcfHBXKBKFoPhduS2aVzVzx3c3wk5kfqvx29OvebuHNdGz0bGjnxFHOk6Dx3kEuhAlc+RkIQ16KNLWblNuel97glCmFJTKfshsBEJfDQFqSQ992z9qgd+nRGkAf49d1mlsNpXKL7TDVy8clISGC/SBlvR3H7SCYdmtl45cmAdeY0+cnu+6uMQZ2JeZSZpCx5VarcYvryFS80Iy5DdfuRa5q17Aou1grNxUGbPM3WYq8AMy68g/hAwQ7s2Dx9865NSvrRCxRLEhkjfDIfW9Voj65b/iNmsG6C5R4V649Xiq453CokWMUEJxt/dSrORz42YLKtmt1qF6fhTOmz3eiYlFZ/U8h43CrTRwF1zxuWt6OFOl6xIxctKLAUSIPxiykl7k73NOL69TgWeRw9GVgeXyC5YYlmXN0vVIXmDvfLbp3yNaTvqMctRP9na6hQ6FJHEXlMx0tBdqpwuoQpB6OzYrdIFLqtwiIcEZVbEk0HUiGNaVL9w57TuNifhC7/2xy7drSOSVvFZWY1uVD6uoz4n1pz2+SceU03+Kr+PiLfLIbYT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlpldDluL0V4SjUvS0pOVStDQmNTK1JwdTBSREJsNEtQeWkxeG5jM2tFZ1Zw?=
 =?utf-8?B?T3V2ZDY1NzkzRVNZUkhCKytzL2FvTTFsUk9TUXB5RWI5ZGFuNzhGT1lpVUhV?=
 =?utf-8?B?WThaMW1FbzYzQWxDUVl1RDY5Nk5FY29Wd3lMek80TlpFVHlYbmtmYnVuUktw?=
 =?utf-8?B?dUtiTHFwUUhjaHFyMVQ2OUlucFFlcGJOU0VnM2ZuZDU5VEx4bGtESzhMaWls?=
 =?utf-8?B?aUlyQWwxZEsrekpaMXNXOTJlZks4d0g4R09QeDMzc3pOYkt3WU14bEl2aGtF?=
 =?utf-8?B?STVHcDJUNHdJRnVWY1NhWUpBdjVQMU8zMlRJVmxwVDNmclkzMElXZktoYWxs?=
 =?utf-8?B?QnJwdlFQcEwxT1YvVFlPak9UT09QY1U3RXhTbzhySlVUOG94Y3lPaU44RGFO?=
 =?utf-8?B?QjNTR2VhOHdNelUxS3VIanJrcm5TQ2dKb3dkcmNvTTIzaXNjN0p4Uk1iU1Uy?=
 =?utf-8?B?YjcxV3VMSVptQy9IRENuNHdjeWdIMUE3NTlpRU9jZXBTU0ZLZVR0UXhCMDdk?=
 =?utf-8?B?TXdmbzdVVmR6Mkp0VjBkSk5JakIvdysrUUtDRHZuWWJXdUVFZGxLRG9sTWhp?=
 =?utf-8?B?bXZWWlJ2RXE3Z0ZNZGdGQ3U2RDRjNy9GSWRxdjFUdTBKQ1ZaU3NJT0xLbFZj?=
 =?utf-8?B?WXovcUt4UUYreDhPNWtQaUpubEx0S2M3Szg0ZzVORDlUNTVxYkdhRkpzazJv?=
 =?utf-8?B?MWd2Wno1SXRtUXM4RG5CWnZhQ3U5TE5teHRScURjdERMZzBxeUVFK2VmNWRq?=
 =?utf-8?B?alMyTVZCbG8yQ0FMNFNweHFIVTVUQ2Y0WHFub0JTTnNRTUM4NXptMHA3RSs2?=
 =?utf-8?B?UDc0UVo4M2JadWtJWHZ6dEVpQzhwUmprMENIdVZ1SEZlS2hzOURzdDFXZGtS?=
 =?utf-8?B?aDNFdWxtUURaSUJFcS9nRlRXeFFZbDQwMVBTSWpkeGlaSjQxVkpWMkNlVzZs?=
 =?utf-8?B?aUJCUVNqWlBqOVhXanl5TEl3VXhGeW8zdGFla0pXTkNybXVHQnplUjlLUXh0?=
 =?utf-8?B?NldjbytXSU8xRkJyTnM0SmVMUzN3WGkrUTY0blVhTWZ3VUVFR096VndJMnUy?=
 =?utf-8?B?SEZzdHRkSGtrRWVybVc5b0tmQ056SGppdGkvalF4Um9wVE1XdzB6alZQL2hq?=
 =?utf-8?B?UE9vM1ZONFRBL0pRZkRudlhNOWlGTTMyYUgwZnRZLzJwWmgwb0NWSG4zeGxz?=
 =?utf-8?B?RnVramhJMjBlM1RtbGN4Sy9wOTE5bThhM2hlRGV6a1lqNjB0VEZmMmMvUUh6?=
 =?utf-8?B?cnNKWk92QnhrZk13NWNkWVhzY21mclgyUkNWVXJkbVZSS3AyRkk1OWNUMkQw?=
 =?utf-8?B?bUJUQTZnUTZBMk56SzdMMGFGV09yOFZNOW1EWHhZS2Q1bG1TV3lycVR2T1hi?=
 =?utf-8?B?Y0pRUk9JbnRvMEE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0908c430-1065-48ca-a296-08d9c7e95379
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2021 20:58:39.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB5091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Dec 2021 20:58:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160009



On 25.12.21 20:32, Stefan Herbrechtsmeier wrote:
> 
> Isn't the circular dependencies problem mainly a problem of the native 
> packages? In many cases the dependency only exists at compile time of 
> the main project and not at compile time of the dependency itself. In 
> case of a native package all dependency sysroots need to be finished 
> before the recipe sysroot itself.

Unfortunately it is not - it's happens that the go.mod already creates 
this circular dependency.

The classic example is that golang.org/x/tools depends on parts of 
golang.org/x/text (and guess what) golang.org/x/text depends solely on 
golang.org/x/tools :facepalm:

For go itself this isn't a big issue, as the compiler just pulls all the 
needed code into the compile workspace and build a binary out of it, 
which can be reused later on.

But for bitbake it's a big issue, as either you pull in

golang.org/x/text + golang.org/x/tools sources into the 
golang.org/x/text workspace, stripping you off the possibility to 
properly watch the revision of golang.org/x/tools (in terms of devtools 
and co) - or you simply end up with a circular dependency.

I scratched my head on this one for weeks, till I found a way to 
actually use the latest greatest of each go module each coming as a 
recipe of its own, while avoiding above mentioned situations -- and it's 
kind of a huge break to how things are done right now.

I'm pretty sure the same will happen in rust sooner or later.

And I personally don't see how to break it as I don't know any way go 
distinguishes between compile and runtime dependency - afaik they all 
need to be present at compile time

