Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8927C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 14:18:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web11.44164.1670854725886990810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 06:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=vXSW9LSp;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.85, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNcvvmtYIJ+5k+27gRBCjUberXfBRfXgieFl8f2cQbWBlwbg0wa717jp1obN7iJbpn6Ge7rQ1jch7AL6p8UMvlKeQWLKYTLddgs0o/dYGVMch6iCI1x7oazoBpHBnJlneTkG5GdZVgpCcCsIOuabuRl1t31feng7v4gOVHCGDYiR1a3p6KDC4t6gSPH/G8sS7RNMGduM4vXz3jKQIKg6kcAznzjUZY2GWUGF9b768RLeVNHZmhsk05hiZkhYz2LDQA0In5ExbRidBGWVdr3d/9i6TW9r3MMzvbgAENBsVzfXlUwbwcPwiWxSxxDnM4WHHDmUqTLF3VHFyQ3t7bkYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d76OebKb6HX68xGfXNxaYFF6n+9sPEfR3+DoViiWoqM=;
 b=RB/+rC0F2rzS17W5S1Hx3r5m5oRgxqFxNITSOid7sxAESkJBx3lcA+ceiMxJTu8NDCXz45l4U1KMpzhK+XsDKFkXXTENUGzpi1ZzyquHsJhVus3eEeeHJjf/YjOrHtLqI00J1jf0OOcBPInZ0ppuu8GUOl++PCWgsyXFh9G7jWusc3TjUicXnDSojy6tAvkPG9LNPIOgozWGGFdnIk3kzHYw/SQGgd+zHwf+1mp87Is1XIo7etYZDUuVM3zkUPv6RdQS9UZw9rjAfmKLvAt4J1pXZS5lyRHmdI/l+ETBu1j1jjDH98OO6fs0TtrIyoXVaqO+tHiPs10t59amYrJyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d76OebKb6HX68xGfXNxaYFF6n+9sPEfR3+DoViiWoqM=;
 b=vXSW9LSpXLr5IwbM7J+PvlRGE9cCh7HOMVmQdyLjZKC1NZVge1fS5xnit6mF11B/IS+1bvr2qTa/nBF+Ydg8Uh/fCB1m/bCAuCpUcD0iQBpyvjiKZeX2REWpVQR1SL0ocVWIy9Xf2S88CR8q2Tg1r5PN9Hh7vlfOXiIoGVrjCuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AS8PR08MB7862.eurprd08.prod.outlook.com (2603:10a6:20b:52a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Mon, 12 Dec
 2022 14:18:42 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::9167:8ae0:289:7af]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::9167:8ae0:289:7af%9]) with mapi id 15.20.5924.009; Mon, 12 Dec 2022
 14:18:42 +0000
Message-ID: <9c58f13f-b7b6-aed9-1718-766d0537e356@weidmueller.com>
Date: Mon, 12 Dec 2022 15:18:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
 <CANNYZj9uXz1PV40B4zBReLzVimYaXoBjVr3Kbn5KnV9qxG=Yrw@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CANNYZj9uXz1PV40B4zBReLzVimYaXoBjVr3Kbn5KnV9qxG=Yrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6969:EE_|AS8PR08MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8bcb2f-7dac-4308-2c4d-08dadc4bc568
X-LD-Processed: e4289438-1c5f-4c95-a51a-ee553b8b18ec,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCDHi2H+53TalGNjbyahVLQLax0zi+DtgI2N57A9B8GfLmdQGFONkU82rochMn8BDZV2pBN4Ba3pwUHpCuxTjh/bekkNYG1Ji/rNRJbYAn4p/EAhBGcW3bHLPXvwC+B8RU+DYTb94e3vbPZddCdgLPrY3wig0ai17MzWN8MO6+PsIhSboOvxRWLz7lwXiT6T+ycQ2FK2NTPXpY6XN1PhcVbD44v/eu3If800F6uB7+SWtEqUwd+Q1vWR6xrcCPGEGyyP/p3nrGfYMprvKhdZkKOK4cO+m9LfkUXT7OZdwtXllitiOzo9Gatytwv5H8OQr/kRMdevEjZd2xHUQ+ePOFKwT2ao3ekgHeuxo8aP5dLJR4cYDp0IGXtmZZ7fzR4M+5kL7gqt9VrBfrNvNhXk5PFzDmPh3HqigIFJ4Yk5fYjlTK7nO9ry/ZlM98wEWR/dFyiprxotu4BKWKiyaiWHSW3YBtixCDA76J9gS5VwspcUewdpvjZmJVdUBh+st5wWMORY36rvfOXV+20V1DXHvsAwSWXgCX56D3fdcvVk4QsnpnBkS3j+wXu1Q6BNSw/1JanJXFN7Ybhx91VvRNjk61TL0aqHOwHu6cuy8AlEXfwKvARlM+HQ7eahBKNyElseBOcMbUkEtcH+1SeX6+OXeIjH1cqrylfCs9WNe+2kjafOVJ/9Zk3IcrCOnz6dzFCaeGtbRAlGCEvsKYpCJHtyhz/d75HQhL4rWtmuHEsDqlih3bfMnHAdsB0NldFIFbpZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(66556008)(66946007)(5660300002)(41300700001)(8676002)(4326008)(316002)(31686004)(15650500001)(6916009)(8936002)(54906003)(6506007)(6486002)(52116002)(478600001)(38350700002)(38100700002)(26005)(186003)(36756003)(6512007)(2906002)(2616005)(66476007)(83380400001)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGdxZzR5TjFtaWNFTzhFR2l2TzNvUk50aEF3MjNvazFReGF0ODRqTGdTSmhj?=
 =?utf-8?B?UENkY0VITm9qWjVlTmk4YVB1YXlqcEJoWEVkYnE1WXduRnlWdy80bW5HQytH?=
 =?utf-8?B?SElOWnQvRlhQTkt6dit1ak15TGhhZmdwSURvbGU0UlB3WUtaQmlrMmw5Sngx?=
 =?utf-8?B?R3VDczY2UDE5M3pPVGpxUUNEb1dHRklydnRtNDVncDk1YmR0Mmo2bjZVK0dU?=
 =?utf-8?B?TVRaRGVLNGRGVnlYVjJub3RSbFBEV0xPL2tYazNTZjRyNHNOcXlHQjAzM3F4?=
 =?utf-8?B?QmVPSnJLR0loL0s5cyt1RmJZNmt3aUZYVngyUnoxYUpvbFQ2eEVJaUsxOVY3?=
 =?utf-8?B?RndESnErMVlGL0ZrY1RhODZHbmFNNWNhVTZkTVhVU1ZmbFFuVmpVaWQ5MHB1?=
 =?utf-8?B?MjUwcGpaTEV6cWYrY2RpejBXdWxkUy8zL1VDYnNsVDVpenh5UDVVVUVqS3VU?=
 =?utf-8?B?M2dFbHpjM00zVERadVdjZ1Yyb0ZxUk55TmJSbVZnTjN1SW5FZWFoTHVJcFdk?=
 =?utf-8?B?K3R2MnJCWnBQenYydlNaRDRsa3VUZk5PUFo0Z2ZMQVcwYTkxdzlkR3ZNS1VB?=
 =?utf-8?B?c2MyTUVWNGhKa0Fydm5kbmorTHFXdkhQNnVMc1hVUm1wNWJDNXQ1bk1ZT0hX?=
 =?utf-8?B?TVh6WUliUDVObXk3a2pSYVNORU1NSDhHZWhoT1c1dUVPN3grcnRHOEV4cVV2?=
 =?utf-8?B?anZROEJ3TUFlSW1Za1d3ZnlibGt2VHlidjJsS3NrVDJJVHJUU254YlQzQUxY?=
 =?utf-8?B?S2FrSEZGc0lqMVNqemVkMEVyYWhyZ1Z3dmZNWElJVk5HL1BnZk1UNVdzZGxs?=
 =?utf-8?B?dHNqcVNSWGZqcGlFcUY5NVI0R25yMDA4WktkQWFlQkw4Tzk3Zno2ZEhLQ3RR?=
 =?utf-8?B?bXV3RHN5M1JUb3NWdnJPa3JPY3doMFVVMUFBT0dYOXN5dyt0RVdpa1lSb3N4?=
 =?utf-8?B?YkVaL3dNaHBFQVBmWWNrVUhJOUNESU9UanU1UWZ0ZTlEUXRQVnJPbkdIYVkr?=
 =?utf-8?B?N1V6TTdNOEZPWVd0SlpzZzJWWTdOR1NaWUZjN3hsa1cyWnlyNDd4Y2Z0RDdC?=
 =?utf-8?B?eElPcWNqNTZtS3dSaFpBdkRsemZtMG5BMWFEc0Vicys5bGhZVmNjWCtxZmNj?=
 =?utf-8?B?cE1WMmJZYkN2QXdpcW15MHV4T24zbGo3aHhVbDAyeG5vcEtwUndiZnQ5b3VN?=
 =?utf-8?B?UW1YL3NjMVREa3dMWW9SOUtSUVlJZXBERUFNSGNKT1dMTFFybFplcEx3NUgv?=
 =?utf-8?B?U0FBM3pwcDBoWHRnRjQ0eW1oaDQySU4yWGZueG9NSGkyb04vTHRyY2JqcElw?=
 =?utf-8?B?Z2xNWmgvb0s2dS9Xb2xmUUxjRXJSekRzZmFrNnE2cjZaZmM0ZTNPN3RMRmFY?=
 =?utf-8?B?RGs4ajkxWGZkYmF5QVUxL1NvYm1YWjRzRzBrWW1qVmxLRG15aDc3SUFaUUo0?=
 =?utf-8?B?NmxVMENId2M3RXU0b1lkL1RWYTE4YS9rdFBTcFl5Q1M4cWVsZ3FNeHBmTlNn?=
 =?utf-8?B?dWMxS0RnYUdEZjMvSjU3ZkwvUytRTEJtakl0RTR4MUtLWXBlR3BuNk5KRjJM?=
 =?utf-8?B?ZnN4L2VIRzY5Y2NoK3QxV3RMNUNJL0JqQ2ZYenE0S3Vmald0V1E1OTdhTXdw?=
 =?utf-8?B?bkthQTVzOEVQUHBJTUxqWE9KSENtYTlJVHRPYmI2UjNkZ1R3VkxxMnU0QjRq?=
 =?utf-8?B?WkVQdDhGMEY4aitWRDNQNnRRdDhlYUc1cVU0bU9GWFMwZFRPWXlqWUd1TWZy?=
 =?utf-8?B?RXB3S1duVURFUEU3a25wRmh5cFh6SU9lR0d2TytSRnErQlAwd0d4NW92S0xN?=
 =?utf-8?B?YU5RZ2VGZ28zOVVJemYycTJPbTNhS2FCRzhGUmpmeGJpTHBVeWQ3UEh5aWVB?=
 =?utf-8?B?V1dnVlFkdEZRdmhpdGVEb3A3STR5Q050VXlRUThqRDZyT0FYOEZUakRuenUw?=
 =?utf-8?B?WUhsWVYwUHdmY2NGVWFwSTMrK3drZFNzZmFva3M3dEtTUk8zbDdjY2lIdUxD?=
 =?utf-8?B?anhzbEpWSGVhRFVHZnNYeTRtajA1S01ySmNOZXROVmdlVmZvTnh1ZlQ1QXps?=
 =?utf-8?B?aXhld2w1YzhrZWFRdnVMRHVRbkg4Q2Zhd0NPK0RGSWEyb3lSbHNBQ0NLUHVl?=
 =?utf-8?B?S0w1MWhHUzA0M3k4c3dHeDBKTmZTZk82TTczeEg3L3FCaFhiVlN3cGc2eFQx?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8bcb2f-7dac-4308-2c4d-08dadc4bc568
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 14:18:41.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfdNaBe4wPWWTnEVTfgs0Vh1r2yGOXONwSUT73eaggXjFm3QBkumaXtt4+1qqOGq81TN7DTflDzrw1TeG+seRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7862
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 14:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174492

Hi Alex,

Am 09.12.2022 um 13:09 schrieb Alexander Kanavin:
> On Fri, 9 Dec 2022 at 11:39, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>> Sorry for the harsh tone but you ignore existing tools and add just anot=
her tool to oe-core without mention any reason or document it.
> The reason to add the class was to be able to update existing
> rust-based recipes without having to manually update long lists of
> crates in those recipes, which is a rather urgent issue, more urgent
> than having rust support in recipetool. The class does not replace
> recipetool, in fact it can, and should be used by devtool/recipetool
> once someone finds time and motivation to sit down and add (currently
> missing) rust support to it (class functionality can be executed from
> those tools via tinfoil.build_targets()). I do not have that time, and
> I am not getting paid for doing that either. Oh, and we do not have a
> maintainer for those tools. Would you like to volunteer for that?

Yes, I'm happy to maintain recipetool. We need to go on with our npm und=20
go support anyway.

Regards
 =C2=A0 Stefan


