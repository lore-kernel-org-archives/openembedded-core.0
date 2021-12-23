Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34696C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 13:19:07 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.13])
 by mx.groups.io with SMTP id smtpd.web12.32598.1640265546398542053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 05:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=FYNdPDw4;
 spf=pass (domain: outlook.com, ip: 40.92.68.13,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF6862QDtF8On9yye8t5JxTof/w9rpTwkRN9j6ac8XIPuxyNkxsH5OceW3z7fWZU0Q7s/iChCZRHcpoSQdsVxUKeLWyZipjeAID+KgJPkC2KVgHhII+XO4+GtTGkkWMR9waenfDKaDOzn8ewTMty+ehlw4ndNskmh5mbA+jBnEcPFKTIK/zJ1IOKpthTuttIuSxbhYswiTJ+TiHnKZCYjFFtLBPTKeD540w7yHjWbsZlBU3bCpE6cNcjk3Fj9J+uxWRyrUW51gg5GpQFcZI8fDqvs43atc3hjcgnvgq02NVJEKe7I0YmQoIH3b0xeuCh32rBQQxUwKqxVmA5od8M1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XmzIiJyNOAgwnhVysk+5zyticxLXm/Fgt1vVKqqKHo=;
 b=Ix2wvecnhfuXpzKo6UPaWrDoxhLDou2mPbmW6hJXuNJPpQ1zhHZFMI56mrv2HXAA0Z933lWlAg4Mxd1hJEZnpK7fnwu9dsgOLXB7pKds6cyT6LlN7NhXIdm3aRQMPuTXwwkdul5/4cBGa84pr2lsUjk1sf5krQZgWxp+3mnMulm8pLP6z+f+WQx0o5RhGqF2oxBQLXJgLVumIDYM0+nUZK8zpnAJgXVKQvmkB7kmj404KEZOND0k+JaU5IqvQqf4sEewEtNNUOcybPYgZ4Nf6CjA6yHCHEaiGZiosRdQNqHMaOTYtOspUcx3nqfgNX1pc/JlbURp/kUyvYXPER3EDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XmzIiJyNOAgwnhVysk+5zyticxLXm/Fgt1vVKqqKHo=;
 b=FYNdPDw4hZ71XmtKqbNt22P30I84xeiPPjhJ40sh1EyCyNMlD2nFONYXM8hkTD8vcDkDrq3LoY2xSYfxoBCacRB0DFS5ywxezHQfKplb6wqvRICzHDti3PFw/WTW8MbEpMmyp0WdTtSHfyYAX//tiMLB25nMbx8ezpIu4sMjLOy0Eo2Aj2h9t7rkF64Vs4BYbU5o0uxuDtirnI+DC5Kba0TFE1ph/uH3FR59XwWRXAI1Dwp+jngFwOmlj5lK8Ahk9EgXvZg2yIR0nFV8lAqTpijwiDaYkkyGGcUft4IGq95AeBprBeMxK9HJgwypPsLvUghKvEFdJbdkVJGK1dQRJg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2594.eurprd09.prod.outlook.com (2603:10a6:208:dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 13:19:03 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 13:19:03 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
 <AM9PR09MB46424FF6EC0BC8DA32B7B66BA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <a468b92caeabf9fc6307ee951e462e4adbd10bbe.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642704AE66377CD0DB6803DA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 23 Dec 2021 14:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <a468b92caeabf9fc6307ee951e462e4adbd10bbe.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [LVUqoOiZfDCo01+bpiA6BHmkRpIRA7ZaE35IF9RoQ4/vG+iYRO/I8Wx1tI5l5LF4]
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <98902101-86f7-7ec9-223b-8a23d0b74ffe@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62198a60-88c5-4e90-7fb3-08d9c616ca57
X-MS-TrafficTypeDiagnostic: AM0PR09MB2594:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7sJhhDr54sgLflxDummOnyQcVg4yUWBWxh76CIrjltxne+KHfokRRASyFJJCgGfU8xPMFlSHPcZFmVx6xQ7n5uYuZRf6akaXeIjJkao9pb/NVjqqPvWsVSsCAeq3BJ3wfCZYuooWMbX4b9JzpZzHIeKEYS9kesKIXHYuzfB8Mq+f8MYA+zGlnsSApTGLZb9Ywn1l2GcO0F6bMHm9md0UAAlXAizEwykLouZGmeZ6BjZfKJrkVS50SlbReVaifh0g1z5TQQO1PWdQb42PIZGnGAJcTmVcBohGLaOf49g9y4DCjODgxO2Vlgi0MIkpnoSikOlkI82G1wuE/tqg/SaodnLilSTHSrpce7ObDenO9cDgSNb3DLUbPA+lBK+/J2Hh6Mid3st4rJKu2769QbM1gr2QraJXz/Z0HNNowJX010Dlb+Iib2mfVjQBnD2vusdUWuZDE8045sreQVba4VJ4jEj3P0CXz8kmrbC31XMEjZhsVNXDjuiJB9wlC2OKHKynld0FdyiJZ6XkdKf7uDNWaKdSK7cM1WSaONomgbJLh9LG/4mxT8DNmEQKhjSKN4mUonBmqcX9VWPaPJdvpLAQhA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VEE3VXlEaUE4YUJZNFY0SmhWUFU3MjFDQ2huc2pBOFpLdlNoR1FtV2RIdytT?=
 =?utf-8?B?WnBrcEpFNVdxRk9WMk5iaWV2ZjB2bXVqSUY0NGxJQ1pUaDhpazNTNDR2dUdt?=
 =?utf-8?B?ZDlVY2tRMXdQTExoaUhnM0NidmRTM3Jwa21OcjM1eXQ3Z0VtZWxJNEFPK3dr?=
 =?utf-8?B?NUxvRisxZHpIcFMyVTVrRlV5YXJuZDZUY2VndDFaVlYzTlQ1STQwNjUraVpZ?=
 =?utf-8?B?YVlSMlRvUzdPOUJDNHlPaGZTMGNzVFJzRC8vTzFNTlJWZnRSQ0dYZXd3c0lW?=
 =?utf-8?B?N2cxNi9WRjZ6ZDVKc2E2ZTFGZXpkTUlTUFVGZWJVYVJLVUpHY2t5bU4rZGN5?=
 =?utf-8?B?NXpDSjR1YmFZQlVJLy9UdGFMN0RLQ0ZMakN3L1Zva2hjZkRzRzh5aDlxU3pk?=
 =?utf-8?B?T2ZsTXNxQ3VDUzBPaFFsbVB0aHo4R0p1Z0FiVVJMWWRSSDFqVjljOHBsVEdJ?=
 =?utf-8?B?MTN6MzgxZ0t1dVNtUFk4RHNvQ2hndjhVWFQ2N0R1U2J4a2d3YzMxQ2RKK0N1?=
 =?utf-8?B?ZnkzMG5FQ0Y0Mzl0VUhiWDFSWnE3RktQUmtOeDBsUzN4RFlpWTNrNWoxMjhz?=
 =?utf-8?B?VVIwZ1lJY2Jpd1FOTG5qcXRjREgyMmUxWlBqRzUyM082SFE5VDNlNDhhUk5i?=
 =?utf-8?B?Z3FxOXVkWDVwWEgvSXprU0swYnVNa0FTcko4NjNCOWhjZ2RQL0c5WmtBWUk3?=
 =?utf-8?B?c2hqLy9tS3dmWmpxNXAxczZhVkp6YngzaUd0Q1JaVDVTQTNFL3FhWXdSMGtF?=
 =?utf-8?B?b3R5L1JhYkloNGFDd3pQeDdtczJjWmlFS0tDdHpBcThJSUFxaE1QeHg5eXhU?=
 =?utf-8?B?MnJLNEs4VUIxcG5GcGFEOEs0RlhxNWp1aGdrNUJKWGtVcGdsWWdYVkNaL0FT?=
 =?utf-8?B?ZE9NV3hSQkdjTlE3N2RESXBZRzE5QzRkQ3dSUTJBMmF1T1Fnbi9kM255ZGhR?=
 =?utf-8?B?Q0pEMU9LYWJDMGFVanlaMGVKeDdCN3JzKzFXemZYcy9yTUtLekVvS1FIdHNv?=
 =?utf-8?B?cVBxVCtFRmJ2a3dGbUVaZlczcFJnODBQWmZQOGJ0YllBUk40WE52OXNwRFEx?=
 =?utf-8?B?MGJjNDVEN2FMQzBRN0ticExza1U2eG01UG1udEJIRng2ZUt5TW9RR2MxdTU1?=
 =?utf-8?B?MzVKaWQ5V05XT3l5MytidXQ5bzJwTEorZTdpdFhQNGlEWTk1OTgrRlAvNkpJ?=
 =?utf-8?B?TFR0QXpKbjV0NGxkU3pxMnpnWThlUGNtbGFzUUtxcmEzVnI5SEJ4cEdXNmsw?=
 =?utf-8?B?K2xjZWVzbmhDdkZ1TkJRcmhRVnFheThVV0ZUL01XY2Y2TG1oQkwxd0xmU0Vu?=
 =?utf-8?B?LzkwSUl4TjNKQ0hDOVdocTM3SmdyY25vZzhZNUJZNTB2Mk5Fak9BR0wzVFln?=
 =?utf-8?B?VGNKZTcwam03eWc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 62198a60-88c5-4e90-7fb3-08d9c616ca57
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 13:19:03.8291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2594
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 13:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159983



On 23.12.21 14:11, Richard Purdie wrote:
> On Thu, 2021-12-23 at 12:31 +0100, Konrad Weihmann wrote:
>>
>> On 23.12.21 11:49, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
>>>> Sent: den 23 december 2021 00:21
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] [PATCH] base/patch: Disable network for unpack/patch/configure/compile/install
>>>>
>>>> Use the newly added nonetwork task flag to disable network access where
>>>> possible in unpack/patch/configure/compile/install tasks.
>>>>
>>>> We can't disable networking in sstate tasks due to sstate downloads and
>>>> also so we can report hash equivalence to the server.
>>>
>>> Since no tasks except fetch (and apparently the sstate tasks) are expected
>>> to use the network, wouldn't it make more sense to reverse this flag? I.e.,
>>> add do_fetch[network] = "1" instead. That way you don't get away with
>>> adding some random task and using the network from it unless you explicitly
>>> state that you will.
>>
>> This is actually a brilliant idea, which would also make it easier to
>> control this behavior from a user's perspective
> 
> Part of me wonders if we really do want to make this "easy" for the user :/

"easier" may have sounded wrong - what I mean is that it would be then 
explicit, with no network access being the default.

So for instance a simple grep on a new layer could confirm whether a 
layer needs network access or not - while with the opt-out method of 
your patch things may be a bit more difficult to check.

side note: this could also be put into the check-layer script (as I 
think the official badge shall just go to layers that do not need 
network access out of the scope defined by core)

And yes I got a ton of additional tasks in the layers I work with and 
none of these would be affected by the opt-in model.

Either way, I really love to see this feature finally happen

> 
> Cheers,
> 
> Richard
> 

