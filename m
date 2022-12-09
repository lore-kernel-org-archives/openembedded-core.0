Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49700C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 15:18:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web11.3959.1670599094376072847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 07:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=RfI7v7Pq;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.59, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkbuiSq8HkECxSXUnZeLznv2JlOpmRzVsyLxlpUdkP6ZIEHtLIXpqpRMrURxt2RH3OIqZHcjMy7UjqLFoLSJrOWpM6xQdvvtAJ/K4t2qxKKH9dK9ogAkEh05xBddbc7USAbKSuIFh3njHksh6Ell6CJ1evQCTca1xp8pHDAK76hPqEhKSeMu0/pmp/McVTRFv0G0aTcCxV9RTt7mvM5NDf7Lj/fE/NvLNZ1ltBs2xJ1D6N/elTISnZuwrgxNQASrXlHw1BGggqZCV30eaTjz42NsIak/jA32NSUwdrxz0y9sM+wFFy0t4nU63qxf4yDWbe/FYGdp8cQz/Z8OGJ3zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BEKOWueT/bU6YNy4qqyKHhmelnjSltn9mHOJsQcuG4=;
 b=b1X6jfqZRqL9K7qqUfu+oyH7khqT8UeNcmhszvW+Z4ZjwM/55oFKm0ZNoVywnDit8NaqxECZ3iQNJ10Hcmc8tG2te0b5IZsvOZ+rGXH9ca6V84Nkh82jgQQNPAgij/E3Ph3mlZo+rSqIjJAu1DojhVn7leK8TY9fdWZyMU496prxQ3I9kaMlP7qHpMLuE1CMlZ5lCBn/lHLXfTmVYJzX+aO+7GfTlty1tBHzZXdQ3uCuZi9BZ1Gs9oloyx7tQqvZ2L/QRUA+LTV8vDxsdYBBlU2fHRNR/tK900odIETvlESQweL6Nb5vi5016Fvc74y1OzrW2OoUpjs7NzG818tjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BEKOWueT/bU6YNy4qqyKHhmelnjSltn9mHOJsQcuG4=;
 b=RfI7v7PqhNWCJf+LPuA6OOGHWnoJ65X80+0gHT9lYgH0XR831esJ1nl0y+MYr0lndtn9sFlRh7o1wGvgDNvmjw05gg3mKl/24kS9lENTnRD1dGxNFLCPbjhcU1GbSPAh5GU3nIEdSeI+uIdTh8r6rM+ZHVn84iKW8d0J+XGt3B0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB7349.eurprd08.prod.outlook.com (2603:10a6:102:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 15:18:10 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::9167:8ae0:289:7af]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::9167:8ae0:289:7af%8]) with mapi id 15.20.5924.006; Fri, 9 Dec 2022
 15:18:10 +0000
Message-ID: <ae8477bf-4034-7fce-cc09-060019b94ee2@weidmueller.com>
Date: Fri, 9 Dec 2022 16:18:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
CC: Alexander Kanavin <alex@linutronix.de>,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Sergey Bostandzhyan <jin@mediatomb.cc>,
 openembedded-core@lists.openembedded.org
References: <20221031114719.2725967-1-alex@linutronix.de>
 <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
 <20221207002040.GB1080@xn--80adja5bqm.su>
 <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
 <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com>
 <CANNYZj8gX4ab+zOVN974vwL8UkJqO-gqkshxsdYVtPsHZfExfg@mail.gmail.com>
 <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com>
 <7f51955aada8f9e74322aa0ad15f21b9985d993d.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <7f51955aada8f9e74322aa0ad15f21b9985d993d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6969:EE_|PAXPR08MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: c6891b3f-f37c-4a68-4385-08dad9f89524
X-LD-Processed: e4289438-1c5f-4c95-a51a-ee553b8b18ec,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QhoqOqWDQ5xdRuSLKwX1qy35SQiVeWYR/bi+WpLbbI/gex7LbHbcgheSamalFaBlElFNoBEBT4VwWNxidPeJ2PlIZxgoDEsg3YUUUSWOJqhbe4XpWS9+1gunNK8PD0i2ebu5wH0GHeIPn7p0E3rUw59jIXDLo8A/xVoKCdUVwowt9OMmq1Ed8nl0IdNuDvA51E1AGGAm+DGAbMwSYtJUWjYAjantH1c+PHU6Wqy6ZWYRrnM+TkiKdn2w2Kkl2dyeDftXlJcjgvSatAI/Ma3+KEWzCRhGHV8MgRWuSEl4JBN8lMLnVzM//ldNiAh0Of2NrzfMxmjpLZYObNM55glQHG2n/tc+jRyezrso4fPyZLQCtSBaVICXFzR4E2zf6qJHL4F5huMqRVafbinsE1kdcX1FTYfaew7h53ZVOn2Y76VjsAqjVaU/zRThlMCL/2mrfRGM49upcc2W0ivh2PAonXoJpZxJ+ZJ5JpORa87gtbMMxnnHVK3fH7gMLwDgqGcEDpl/8Vd1u6pXCyymStFCKurfjTm1rraiVyqaRG9BH3/pBeWQUWbom1fTpU92QlbEcWzljXhP828XGGP1RrASWe6Oyhir/jdsi+T5oSI8mf6wgH911MlRfLNlo7I+EollaBH++gKX9tlrEmn/Bt6nQn0GaYVXG12N7xUny7ROOpplzKDw4LMzG6pfNTWtnIDVbw00FWWX2IMXrlBdqLxh0bdFISaMq60Lzu6bknxEv/m8kJf/bEg0hWcoY05OssY1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199015)(2906002)(31686004)(66899015)(31696002)(26005)(4326008)(36756003)(15650500001)(6486002)(66476007)(66946007)(41300700001)(8936002)(66556008)(8676002)(52116002)(38100700002)(86362001)(6512007)(478600001)(5660300002)(83380400001)(186003)(38350700002)(6506007)(2616005)(316002)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStVajZTVmxBQ1BtU0N4R0IzSitsZ2xFWUVsSjNweGcxUTNmd0tMR29pSlZS?=
 =?utf-8?B?YU9JcU5kcDVuaXI5aW4yOU83WmhHWmJtTGlNbmpZVjFOeW15cXhnZWVaZitT?=
 =?utf-8?B?bTUwdFVTR0pldGJRTEpxbXBJNUFTYmpNWUhQR2xETWc4K01DMzFpOTd2bHh2?=
 =?utf-8?B?MXR3blFibEx1TWVFeko5ZWJCcVhvZ3lRT2lpQ3J4eGpRSEx3cmJSb0w3cWNx?=
 =?utf-8?B?Y1RsWEZITkRodDBFSTJtR2pUcit5VWw3T1Y3UXVuRVNvakk0MVB6V0FQNjhv?=
 =?utf-8?B?b3VYMWZwa3o1QThtR0pBWHg4Y2tUcWQ4RnYrQVZuVm8rQmVTbEpMUDJ6eEtD?=
 =?utf-8?B?QWdwRFJPMHczR3M5K3F6c1JZckhZeklQclVNSUR1ek9JTFBnNjVHTElDWnJO?=
 =?utf-8?B?WUtQY3duVWMwN0txRXV0V2laK3MwMFIwTDIwZitSV2VoL2tuZnE0N3ZPbG84?=
 =?utf-8?B?Y05zNGFvaFNqeWp1UTF6OVRNUDMwNHVabnZiU1REcW52L1kvYW41RTFmVVBt?=
 =?utf-8?B?ZEVKTWllK1EwY1hURmxwYW9TMUtrdnAvOW5ob0hLeUYwb2FoVkN2alhQZzg4?=
 =?utf-8?B?bHJHWDRmZTQ3NzFlOHd1TXFEWHYyeVdiSkY3eHFuYnBMengrQnpFK3BMTmtx?=
 =?utf-8?B?VldVVWhkUGNCMElyQTN4SFY5Y2lNa0J6bmR2QXUvSzFvSkMzRXVtOEFGZjFZ?=
 =?utf-8?B?S1lrVmVZRndRMkx2d0NtTjF4UjUyWUNoQ1hYT09FQWQyTm1qc01xRGdtdWJv?=
 =?utf-8?B?K3czU0dHZzE4OWR5QTQvU0lDOUJWTUpkeDVGaXNuUW5rc1ZBcjJxVW15c3dv?=
 =?utf-8?B?K2J5VDQ5Z2lwQnQzb25ZeFdSTlRJc2pRNUk0QTRXYW1UeXVaRFNxZE5IRjNv?=
 =?utf-8?B?OXpKRFlMSllTUCtXSytjd3BqdlJCQytsQ0QzUmp4MEZ0d1dtdVVVS1F2MkRE?=
 =?utf-8?B?N0JXeWhjMlNuNi9KdElZMVo4b2U4NHRETFQzMkVEanFqZ01Ba0ZiajlwNm8w?=
 =?utf-8?B?Vm13c05pb25OeGE5OHQzMWF6YklCUUo3QjJuSi8xTlRxVldHa0VzdmRmNytP?=
 =?utf-8?B?cG81d3Z1RXdFYlRFb2hqdUZiK3ZtRmdVOGhBRnJkSzZrRm5LOGw3SU1FL3ZO?=
 =?utf-8?B?emdKcnNEbWFsRzlnU1ZUdUhFR21lYXhOWUIyUVpmaTRNV0tMeWpReDlYMEVN?=
 =?utf-8?B?T1ZvLys3Y29yYmpxeWtBV3h4NDE1YUV6UVZFT1M3M0RFZGVlc09XY0dCWGkr?=
 =?utf-8?B?aXJKTGh3dVhQR0lUYnBoa1NJZ1VqQ2Fza0kyVTNQMU56RWgvUWRuNmIxRXZI?=
 =?utf-8?B?aDdncmY1dHRoL2Y4cUIwSzFiUW1UbjRhNjNFMjNoU29xNDhFQTRLUHphUTZT?=
 =?utf-8?B?R3lpSlRJdFlNbWUza3h1cmJrd0dkbmlubHpFT3dEVFBKMi9FZDBVYmVXNHFT?=
 =?utf-8?B?djcxMDRYakRWc0lMd0hKQXFGOGhXK1c5U1hJOE96ZDVXQUQrdmN1QlZ5OVU2?=
 =?utf-8?B?VzZTa0xIN0tVeGgzSS9seUFRNll1ZEpaSjdHVTR3MVFpTkxHRUJGS1NmSnQz?=
 =?utf-8?B?b05BMlpsWkY1a2sza2d4UjJRTjkxOExqTGZGUkJpNjkxbnRjNHo3ODBLc21T?=
 =?utf-8?B?c09lNDhCS0RSYlBtQWkydG9sT3lVTUtGYmlBK1VuQUVvZWpPcmUxWFV2akN1?=
 =?utf-8?B?Mm1IWndPYnVXYUN4YUpvMXE0aS9DYkF4YVlCeTB4MmcxNkMxcnl0RW5xNzk5?=
 =?utf-8?B?K3FpUEdCejF6UFROcVpvUE4rSUJTWlVmazkrNXBkeEtNZGFrMzlZd1BIaTZv?=
 =?utf-8?B?Sys4TWU2WFo4U2kxSHFUNWNsTHNlL3B0YnFyTDZpUS9QSFNhTkRaZTcxQ1Vs?=
 =?utf-8?B?QmQ0a00rSWRwQzNqUEsvcTZRTzRSSDhKcTJzczUwZmtkOTNoWXgzczdzWHp6?=
 =?utf-8?B?TFU0NDNBU25ISHhiZnhocUtnbzVReDQzcDdqRmUzS1B4Z3k5KzJjaWs0SWRI?=
 =?utf-8?B?L2lBM3NXVHF2YUZWeW1ReEQ5b1M4ZWNLdGFMcEViTXoxQTIwTEtsSzJYMWF0?=
 =?utf-8?B?Q0xEN0lpdHJMTDYvc0xzenN6UkIrWGFCU2hkNmgzWHJMRnBpdTR2ZmZkakFW?=
 =?utf-8?B?RGYzN2VCUWZzQ0c1ZDlKMUJRY20rMDBlYU4zOFQ5RThadnpqeUROeWwvVXY5?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6891b3f-f37c-4a68-4385-08dad9f89524
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 15:18:10.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SpaqreMQnAAzTmgoyAEafMQHUcuUHDTJyaN/c9prWthVItJXxTIvdgI9DawmPVqi2Sp4skLtlu8rWcIXIathQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7349
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 15:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174461

Hi Richard,

Am 09.12.2022 um 13:01 schrieb Richard Purdie:
> On Fri, 2022-12-09 at 11:39 +0100, Stefan Herbrechtsmeier wrote:
>> Sorry for the harsh tone but you ignore existing tools and add just
>> another tool to oe-core without mention any reason or document it. Do
>> you really expect that somebody will patch existing tools if main
>> developers ignore existing tools and provide new tool for their use
>> case?
> I'm not sure that is entirely fair criticism. We have some challenges
> with some of the new languages. Rust support was in a separate layer.
> We took some of those recipes into core, then ended up making
> significant changes to them. We never took the external tool.
>
> The hope in doing that was that we'd find a better way to make things
> work. I think what Alex has done is an improvement over that external
> tool and it experiments with a different way of handling things. I've
> had generally quite positive feedback on the approach itself. Yes,
> there are some issues with documentation and some people using it have
> struggled with some usability issues. None of those look like they're
> unfixable.
>
>>   Why should somebody improve an existing tool, extend the
>> documentation, add tests or even upstream its work if these same
>> requirements don=E2=80=99t exist for the main developers. It looks like =
the
>> requirements for foreign and main contributors are different and this
>> doesn't encourage people to participant.
> I don't see us treating developers differently and I am concerned you
> think we/I do. Any given solution that is proposed is evaluated on it's
> pros and cons. In this case the solution is quite self contained and
> allowed the approach to be experimented with whilst solving a real
> world issue. If it doesn't work out we can easily drop it. The risk
> from taking it is therefore low. Yes, I should probably insist on
> documentation. In this case it is relatively simple code which is
> relatively easily understood so I've been less worried about that up
> front.
>
> If it worked out well, we can integrate it further and document it. If
> it doesn't it can be removed. FWIW I have heard people saying they like
> the approach and that we should use it for some of the other languages
> with challenges like this.
>
>>   Maybe this is only my personal feeling and I apologize my harsh
>> tone, but the acceptance of patches should be comprehensible, and
>> expectations should be the same for everyone.
> I do try to ensure that. My "algorithm" for accepting patches is
> probably not easily documented but I think the factors here which are
> the standalone nature of the change and the easy with which we could
> drop it if needed. As such it is in my "low risk" category of patches.
>
> I'd note Alex has another patch which has been sitting for months
> unmerged as it is in my "high risk" to the project category. I suspect
> that one will not actually merge but I need to find the time to explain
> why, right now it is more based on a feeling it is the wrong direction.
>
>>   Should others answer to your comments that their solution doesn=E2=80=
=99t
>> preclude your suggestion and that they welcome patches? For sure it
>> takes more time to add rust support to recipetool but I think a
>> second tool without a clear reason in oe-core hurts more in long term
>> because its now unclear if new features (like checksums or licenses
>> support) should be added to this tool or if this tool is only a
>> temporary solution and should be replaced by recipetool in long term.
>> Furthermore, this class is marked as a class for a recipe but
>> shouldn=E2=80=99t be inherit by a recipe and manipulates a file inside t=
he
>> meta data.
> We do have precedence for classes that help updates like this. Both
> python and perl have code that adds tasks that function a bit like
> this, in those cases for the core recipe.
>
> Personally, I would ultimately like to see these operations handled by
> recipetool and I suspect natural evolution of the code may head that
> way. Both devtool and recipetool have used classes as a way to help
> them perform operations so in that sense, this is actually a logical
> development path for those tools.

Thanks for you feedback and the clarification. This helps me a lot.

Stefan


