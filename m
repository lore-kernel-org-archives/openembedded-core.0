Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C80FC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 18:30:12 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.81])
 by mx.groups.io with SMTP id smtpd.web09.3949.1667327406432718467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 11:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=q7BJU405;
 spf=pass (domain: seco.com, ip: 40.107.13.81, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSv5woqEOL1j3EIDjFboC78nGDJDPNC+tJcP2Y78BCn86WRo76nd5JYfu0kBrVAw/3OKDFSvI0GOcfSl3koLYM2KnS7aqkrTGFuvWTauBYaly+gNXfrWFymXgDuPKkLEvutaowvp5jQTJiHoBKaBKlx+GAVWxPLu9O6sC63Mwx/AY3U1xiIWSvc/3GiHyw5CnXsbDomncKnPpf0cWAD+2pwp264ZAjwPgTtxFUwmL/CusoPZ8MntJNWR4LvdqUpshRHb6PFpIc9JQjU2bH9q5JmF/klZW4NPpRMOF6p+hzTSPTf2A0NXoI6k+jidco97SyV3XpN1RwNC59Oxd7lxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N3ulTmRKnNXlFIbr06zn+bg/cPlFC8u819nrMffVN8=;
 b=H0hwZ7H5778XAHnDlDNtzEqozz8LrvRj9h/tjHi9SHEctEiFboyX2MP+HAUM9rJFVnlRhoN4QimhmtUII6oLEsKixNXh7thCJMbOsHqvt35qDWuX7SVXeC3OfeCQwMfH034ZZmdesbZJQeJrzkLpqT8cQTQNowiQL1Kk+V38/fLvx0fN3JbFyMF4sYe3M0OyVNc2WyqEh0XhvcxVhy3lQECzbRReEEyc1AfTY6zAfyyJrxJAJP0yrve8iJJdcgFaXpy5HR6O60OHBga6M6PwZpuOgsunev5Z1Pdc9FAbeOqtKQcrWZf8bAPPMNC9IViKID0G5d6v4dCoBRZ+Ypuzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N3ulTmRKnNXlFIbr06zn+bg/cPlFC8u819nrMffVN8=;
 b=q7BJU4053gFgvCD20s3s9SzP2NSxYnICc3xVeCnDPCbU9tbzZv7Jg9rWfriW8AH+icvw4eadHIKKPx3mnCRZkyXuAx1pQoQeC8Uq6qc/YvJbamMTT1gckRnE25Nr/8NqXN+a4FR2pch09u9b2377U/Og8ja2zeWPrtEmzDxzSLTTydUMaIRwUW/DHdymrhuHnsVPK9xsGF25kdbxNmB5mJCai7zInCSf+X+rJ96IPeLAllc4wHu0dGUr/GzPaZuzsfuqEK+wtmRdQ7GbefPb6opaqSz2VQlHtHi7AK/RX8c6too3H4JnyKaAEoMqdhi4RVN2FFVjYs0ERU1A5zrJkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PR3PR03MB6393.eurprd03.prod.outlook.com (2603:10a6:102:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Tue, 1 Nov
 2022 18:30:01 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::9489:5192:ea65:b786%7]) with mapi id 15.20.5769.022; Tue, 1 Nov 2022
 18:30:00 +0000
Message-ID: <a0b45f0c-e85a-a39a-0194-cac78767fc84@seco.com>
Date: Tue, 1 Nov 2022 14:29:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] [PATCH 6/6] u-boot: Rework signing to remove
 interdependencies
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, akuster808@gmail.com,
 ticotimo@gmail.com, RAJ.KHEM@gmail.com,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com>
 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
 <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
 <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
 <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
 <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
 <c4d27774-ec17-e171-6470-1730441b5b02@seco.com>
 <CANNYZj_z52Y+nkU-uJFYPJVRj2a1CgT9xbHqs+rj0c3TtuPH6Q@mail.gmail.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <CANNYZj_z52Y+nkU-uJFYPJVRj2a1CgT9xbHqs+rj0c3TtuPH6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::16) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|PR3PR03MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0852b5-cc68-4d41-118a-08dabc371600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0kHwQhHSR9w87/CezQyvY4LBVWePIra4A8FhL1HZS4Os4SuIR+zBCDqMs9Cj4iBQ8c+C8uDMhVAUdJE9hfCbMQy8GLfPA+9CHqIwHFaJlQ3n6hRbLCpg8/9s8MBNP+HPLa32TE3hJ0cePsXGowP0Cr/VYx4dBMoBFydP/LD5qYoFCb3Gz2Cab3n+CQ+DZ/D/ur0+0OXvoYnEG9Xmmm1NxElj48AX4bEqqUsx2idhMpX4RgyBdF8tcJgbDQYeraG3bFqKRBnQyP0xV1RjFPLaebn9ZcyttPYbt0Wy0nKga+KSncAWdY7CYNlqZQJpCXlRJDoQElZu/4FbsIlC32Rf6dTO7jnQRNyBax2CluKTGwUZWJyhZ4ZWXdXJjZAafIokcaszTVqI9gptqHPyMZk3I3FcAM90HF5xV7W43QjdMQo9tae5l1Mhsp4v6pNNo8os1vXK9rmaGV73y5He6IUfpwHiSRWhVAbOQ1WUv7JD2ckuOgYmboCPMBvk+s3vCuCDp+q0Wc0Y9I0H7UsTvq13DHJE7aMM3EJc9xHxAzAq+WNZh36Guxy3Ob9J1wvPugolkRSOGHoQHo5qXpoiSJeSneYDsefFP0k6QsCwxaYfCaR82LVjV3M2MHkWeodWwFXRDNhvCke+w7Qb9n/ySZLvpDrjJim7XdulknbTWEmH/bwPzEla9A/1PnNleQLdIP3pxPl+8/FhA4Ef/y1riIP5dLFiloSI18v2cTnuuAUuY+0F8XB36wS2zMimjiWFmmXq2qac/UfwfltOwZX8MZY+sPEXKz+EdQ2SGwGHUDJi8aoLc6il8I0O0pRQAzVal2JZiYM6ThykTuP5hyBIwma6TQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(366004)(346002)(39840400004)(451199015)(36756003)(31686004)(66899015)(38100700002)(38350700002)(5660300002)(2906002)(44832011)(83380400001)(31696002)(86362001)(6512007)(26005)(316002)(478600001)(186003)(2616005)(966005)(6486002)(54906003)(6916009)(6506007)(66476007)(66556008)(8936002)(4326008)(8676002)(41300700001)(66946007)(52116002)(53546011)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjJVUGxOa1g2L3RDd3c3clNpVmp0OERKblgvSndFeXorUllSZlQ4Q1pZcVlO?=
 =?utf-8?B?dkNvVXRLc3Q1ZkNoUTBjQTJDbTBJRytsMDJWTUs4ZjFQZFYzQ05ZT2VvOUhG?=
 =?utf-8?B?T1VVaDRRUnZGTk9BcUdEVFpLeWJUK21kUG9qUkF1UEdDaHo2UmlwWWdEUmlK?=
 =?utf-8?B?MjVjUlNWM3R6RkpZZFJJcGNubUxDVWpFbzV1czkyVGFLbEtwa0FrdythNlhW?=
 =?utf-8?B?QlRlWGtidC9iN25rZ1c5UDl5VlU0WTl3Z3BpSVMvREttaGJtbCs1QWM2dW00?=
 =?utf-8?B?RnpKaUIzcFpzdWJnNUEzZ0tsK01INnN1bkcwRzZMSGg2d2xtV2hHcXY4cFVT?=
 =?utf-8?B?NHJpMk9JYzA0Q3RJQmhPTnJWejJjUi9Eb2pGLzIwV1ZnamtLV1FKWDZ2YXgx?=
 =?utf-8?B?dS96RGgzeUp3cGp1cjVxTiszamtrMGo2VmpNVGd0Vml4dE9HL1gxRzVyRE11?=
 =?utf-8?B?dXBJbEpDMFZlOHhYZjJ3TXlMbFhMbUN5N2orL0pKd09DaEVvS3ZhTlNZQklx?=
 =?utf-8?B?cHdPbXUxL1RobU95bXNJVzhDa3V6bzRnaWNUMnZ2UGs5aGpCTHFlWkpJZldj?=
 =?utf-8?B?QS9sakI5TU9xRHdFanVZc1A1SVdnM1QzMUhoQzg1cmdGR0tSUjhIWis3TFlL?=
 =?utf-8?B?R21kekpnak9GZXZ6aUhKVUR1Vk9ubUJ3UEFTcUF1NE4wZG94OGY3Q2dGT2pk?=
 =?utf-8?B?ZWtsZUM5bG5aRWw3TFJtNk9YMGtLb3JvNjFYbkFlamlpWkNqS2JVM2JaM21n?=
 =?utf-8?B?NS9TTzVFRGR6dWU3Rzl5WnFJejJqclBXcmpMb1NxMWNNOEdSeVJKOVRxbDh6?=
 =?utf-8?B?cXA1ZHVlRVp1dGtOUS9SRW1BV1Fsd2hzSmhtWEVBUHVqWjBOc0sxRlBCTTk1?=
 =?utf-8?B?L2tLQU5OMHV2UEo1dUptSTBLajFkSW52RHBEOFhaM2tNU3ErbFpvOTAvcnlz?=
 =?utf-8?B?S2lEUDUvY2dVcDhsMWdaTUZwMG1qY1I3MDMyOVdSZE1ROUxIdEVvRGdobnpM?=
 =?utf-8?B?MzRIekQzUnd4WTVLUFlGTmdoaEhqVXhrZ3pzcGhZUnY5MDl3akNGbm9Dd1pz?=
 =?utf-8?B?SGdwV1o3czVRN2cyU0FxczlJRXB5azJ1cTczWWJwelJCM3RQVjBFdGg0OVUz?=
 =?utf-8?B?QjZzWFA2NnhaWmVWSUdsMXVUWitaTkFWYlFtMlpmSGhzY3BZNm0wckxzMkc4?=
 =?utf-8?B?VzJVMURReE1TZzZ0RC9abTJ4azVSZXJiSzFTREN2cnExWG5oRUlBNjhkdjJH?=
 =?utf-8?B?dDU2SXJrY2JNVnczZHNGTExXZDVRZENkdEFGRi9EbzlockFUeW93b2NCdVla?=
 =?utf-8?B?bnNGLzRHQ1l1M2JKYXdzenJ2UDE0VXk5dXZSclFOWGdHRUxYUDFNSWlBR3FF?=
 =?utf-8?B?ZGF4OTEzRllsNXJCRVFCVmtuR3h1WWhZRktuNkV5b1VEcVVibUNoNDdzMy9m?=
 =?utf-8?B?a3pUYWZvdENwT1FmSmZ3Zkh0Ky9hOTdxYTNYTmR6bEtvT1VqV3ZTd0hMNjh5?=
 =?utf-8?B?U3MxSUdVQ2tzN0dBTzQzbWVtTHl6eHIvSWJML3c2RzVFY3NXMnNHeW14eFc1?=
 =?utf-8?B?K2o5TDdJTDlMTUdrVHNUOEhNbklQTnBLTUVDK2VEMGdtOFdaQTdRY1BVYmoy?=
 =?utf-8?B?enBDT2l1cElrYjlHU3pvZGFTYnlVdC93R1F3QTlSK1ROeElBQ0VSMWRiWTF3?=
 =?utf-8?B?S0lMSElEUHhrZm9wR3JLcHhiZEpYYS80cUpEd293Zi9HUGpMSEsvU2JIVHd5?=
 =?utf-8?B?aGNDNmZHUlEzRnhCd1NTZlVFMDlXZzlJNy9sK21CZk42OW1xdTZEYWR3alYv?=
 =?utf-8?B?d0hiRXIzaUZJWmlieEdSUDZZS2laclVjOE1mU0ZSb002RVc5aVVQUVdyekpN?=
 =?utf-8?B?RVpJSEM1RktQSlFVbmtXNkpjK08vYlN0RjBBZGZ4clRYa2NaY3N6WWdQMnVB?=
 =?utf-8?B?dmgvQU05Mnc5RHY5REc5QWdNWDhvU3F4dEtnL0cyaTR0UVZjMDh6RnNiV3Zr?=
 =?utf-8?B?VnNYRC94TkJVVlArQWJJNU9kazh3eHBpTGxDOHlBR1htTzZzNk4rS1gyRWpL?=
 =?utf-8?B?d0d1OGY2d1ZTVTk0c1Q4K0ttaG8rOHVHaU1pNmFpOGlQNTRlSG9YRm91S2tD?=
 =?utf-8?B?cWZJKzJJSmRoVEhwb2kwcXZ0VXAraThFbWZEYzFlZTYzUzVZK3J5UkJBTnVN?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0852b5-cc68-4d41-118a-08dabc371600
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 18:30:00.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8If7wThCavvYp8pDgbKaUk/p4OMych4osr+SrMtuA9nwmdY/P3FpK78VLf6fjrh2+MYa3DY1Sa+MJ1VLmwrFnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 18:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172380

On 11/1/22 14:02, Alexander Kanavin wrote:
> [You don't often get email from alex.kanavin@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Tue, 1 Nov 2022 at 18:54, Sean Anderson via lists.openembedded.org
> <sean.anderson=seco.com@lists.openembedded.org> wrote:
>> If you use a tool like b4 [1] it can automatically generate a summary thank-you message.
>> As an example, [2]. This keeps the number of messages down and is not terribly
>> burdensome for maintainers (since it fits into the usual patch workflow),
>>
>> You can set up something like pwbot [3], which integrates with patchwork
>> and your repository. It produces messages like [4] automatically when it
>> notices they have been merged into the repositiry, and marks them as
>> "Accepted" in patchwork. This is even lower effort for your maintainers.
> 
> You are very much welcome to set these things up for the project and
> maintain them.

Well, b4 is something you'd have to integrate into your personal workflow,
so I can't help with that.

I believe in order to set up pwbot you need a computer with

- The git repository you want to track on it. The easiest way to do this is
  probably to run it on git.openembedded.org itself.
- A patchwork API key (to modify the patch status)
- A working email with smtp access (to send out the emails). This probably
  means a local sendmail (or other) server.
- cron (or something else)

Although I would be happy to help set things up, I'd need some help from the
people responsible for maintaining these existing services.

--Sean

