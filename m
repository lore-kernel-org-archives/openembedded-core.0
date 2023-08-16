Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF952C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 07:55:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.135])
 by mx.groups.io with SMTP id smtpd.web11.155991.1692172541184057127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 00:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=JFsMTuuY;
 spf=pass (domain: prevas.dk, ip: 40.107.21.135, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3VRI+f4L2xCCSQVHCK4iFKUCU/ntX3j2JkjVXe0lGzF/+82vLBe35lZHDHGpQ35qwQ4583MIbevISFLRCes9mSQW+sAw5iNoKi+xq6uXRJ+ejxtquzBfQNa+eXCjkBS6ztg+6+DtJDaWkYop8l1GSI3CrSi6RIRqI7xwqajLQR+G5SJ9bmp3yqSXIMvdybTrx7KmukLKe4AkBz2MG5C/In+XN1HNLbGgi5DW+ByeHJ1LSphcuOH3g8UHVzDTmAH/LMv7dF3Rdl+Wq8SnUibR5gjfPYeZr9QU4ZvEV3JO+ooo8YlwWmipUzFXKpobn7DfEtrDFh1QhJXA0ysijTXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lcmmcJJAItA5FjlblOqDFE/LQa3QKcAKWXoztDXEK4=;
 b=WG7VEoK6huJ43eZuPOOY3j2ULFTW8LZ3kdspDobEu/zxQbAWVz2Kku+5Qimju6O9S0xB3jWiviDK0+TQy873bwOpoxTzHaEssO3vfT3uHLssR//174YCRSmFs9euks4wckoAai/SjF1re8w1WKSxFBXT+0DB7+y8MeF3quslnmwUgeAuYm2OQ8QXjFgGSYyk+FIUUltm4nXzYa9+cFc6HnPt4+SI0qUL7nAFG+aMqdrLmU6OFM9aGYUbhzdGz7fJ62ewmLzz/32+vPqanVuCHYu0VvcP0nQoav6NXzR8HgY58Sr6Yh6VYnlaanmqogwM79bixMw/KscbMP6AOXTkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lcmmcJJAItA5FjlblOqDFE/LQa3QKcAKWXoztDXEK4=;
 b=JFsMTuuYNVB8nBmCAJBvWhTJykNhri+Dy87YhJWj9Ya2M4QcjBFpkys8axfaoXh4Q3W70nl4Cu6LZLO1LAtmVgo8uQxgB1dIvOkOwPznxlHFFxUlLQ3u5LEaaNm7g5WtwdG89s2fjsDuDzRB8vEa+HRwKi/mbwshdgVDPDhZZOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AM8PR10MB4017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 07:55:37 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c3fb:2416:2628:ca95]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c3fb:2416:2628:ca95%6]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 07:55:36 +0000
Message-ID: <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
Date: Wed, 16 Aug 2023 09:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
Content-Language: en-US, da
To: paul.gortmaker@windriver.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
 <ZNt45UVb0Ps/kKLM@windriver.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <ZNt45UVb0Ps/kKLM@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:205::22)
 To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AM8PR10MB4017:EE_
X-MS-Office365-Filtering-Correlation-Id: 308fc75d-5fa6-4170-3ea1-08db9e2e2d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sl8rhW1VJ/C8ZPl0baMUUU1yoFZp+AYJR10txDnFfGGCQauJ9eRofsKhV03wdDIVW/ojrPDTzsuztBWcLfn8iL97M+coAsDk8lS1GKM6uBtB4X/soVC90R8bDVHAHbDTxrJc6wpvmq+BrbseX0Z8sNoP0hhMr/sDi99KkfsrkKkeZnP9wQJKDUUENpTqxA7HrMby3yFa4tYtLKH4QcXGWtOaPvi31pAcKxGRrAgc6sPwt8Wg16N9gURG5oWQ4iTx09dNvoEvXpxmmqzgSsUBFPVdXWqVI6ZIM8YagtrVP3LbPmhqSmzlgE90yx5E6x7ZnIKkOyEcn7qA1W2YiKVES3AuLmdTcDnWof6Gq07GNvIFHanjO9E2IGoVewAhMrZHzTZJAjm8FhaKOho85EszgOG5KZy+c/AGWffYHojTNAJCLGv6mGOxTtuW1uyE749UAdCGAoqxMxVcTfYvjJeGiT7f78OlfozlkhQR8be0F0nbhVkARHMjw2UvWQmllGm6ZaMCcKzRkQcWZi8eVdYuinfRCm55PlqLZoxbBPmd6SmjFEdiv++KK9cPvo8VhjazCFTjTBlBH+/6RGZL6Cw5TMu3QRGUPjiEtU/42goUhSuQ1c4WmkrQx7kZ9Sm9BMD3Ewq61GyTzZoH6t1yTSiyVqTFyhzGCDTKDl4aVrLtcpU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(54906003)(31686004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(966005)(26005)(6916009)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(8976002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0JDK3FPVXF0VFpTcm55U2N6MSs5Z2g2dk9idGlCK1FQK3FJR1B5QXZZWjhU?=
 =?utf-8?B?ZjVCYVJOMlpzQm5WNmpWNm4ydGVNSmNjakdsWEtJbU55T2VkNk5HT2lQbjBC?=
 =?utf-8?B?T2YvUFozZFc0ZUtud083RktlazgxZWtoNGdwem4wUGV6QVdoUUhGSU9SZHhW?=
 =?utf-8?B?TUhqMEYveGYrRVdKNFBoUU1tWFcrcE1oVk5wUmFsZDE1UUxqTTF0VFVHcWlM?=
 =?utf-8?B?M1lod2w4alBxYnMzNUJlVnhubVJZdmwrWUdvR2t4RFBTQUVBaXcrdnh4TXJa?=
 =?utf-8?B?MU9QZ2dXWExvRDZSUWlHVEZVNGRab05PUXMzcjVGM3QxZ2VrUi85VlFoSG50?=
 =?utf-8?B?c2ZGcWxiY0diZUJLWmQwR3dad1l0WTlnaCtmTzh2K2lSNHVFRUFDMmlLSUph?=
 =?utf-8?B?ZGk1MzYxQ3A2bUgxTzc0QURBbWhHNGtJQnZVNjZBbWYrOUhhK1ZmNVBmMzds?=
 =?utf-8?B?SVdJbE1QUVBSSUFBVktieU1IQnBTdVROL3ZtMG5hV3JRaUNjU0FXeVFvUlZs?=
 =?utf-8?B?VzJKNS9mVFY4cnEvOHZDRDIyYk13dVFCdmRwY0xMNDI3VzA4elc5QTNvRDRo?=
 =?utf-8?B?bmlPR1QzL2FIVGdQc0l2dzNZbDZxQWJyTFZaZGwyU1ZzRW5vd1JNOHZ5d0JG?=
 =?utf-8?B?RVlIVnBJUWk5cEtqMlJwdGpUQnBuZWVoZWxhdWZuRFBMVU9YMmZEdlRFMU1p?=
 =?utf-8?B?QTdONVBTT3Jtc2VLcUs3bUlzTzRxYll2MjZWOEhwemxXMVFNMURQSTlDV2Jj?=
 =?utf-8?B?M2NkdzlWWUlwdWtFVnpQRnI0d2szek5Mb1ptSVZaS3hSaEVyNVNKOW8zQWFt?=
 =?utf-8?B?TDNYQ29MUmxhWnpxODY4aTlTNHFQdThJV0t4djkrYlF0MmNvT2IzbmRFRGR3?=
 =?utf-8?B?aVBNWDk0MVQyOXlyQTNoK2hEek5RZGtWNTN4NC93T05Wd1pxek5QNEM1VDVK?=
 =?utf-8?B?TzZnMDFEY1NlcGp2TUs5d1pRZG9pM1RpalY0THNLMXlwWDNVd1VDaWxqYkNB?=
 =?utf-8?B?Z3hEa3MyNTlBdEV5TVhvOVFjSVBPVkYvYlhZSjVUU0h4Q0FwODBmTEFicVU3?=
 =?utf-8?B?T2N6YmNack9HMCtDbEsvSGlvdjFrSWdvMU9zUDl1R3c1MndpMkU1dXUzTFZI?=
 =?utf-8?B?SmpxazlnL0ZvZnBsWW53MTY3blJGVm9FVE9lTm13dEEwYXNqS1RUazlXSFpw?=
 =?utf-8?B?TVhKRnJMNENnWi8waVFVUnVvK1JYZTNQYS9SQ0NaQitxM3dXVVFVbHc4c3hi?=
 =?utf-8?B?U0l5bVMxb244a1F5TUkxMzBWVXRUZkJkNkdna0pZdzZNN1FObkRKVk9STVh5?=
 =?utf-8?B?SjVBL0YyY2xVbkIxMGowYnFuZHdZa3Y0Q2lKMm9CY2svazZlZ2NqbUU5OHhv?=
 =?utf-8?B?WDBaelRSWjFTUXd2UWVnZzdnSlZYVG14S2h4K0ZBaEZYK2JVcWpSZzFtMDZ5?=
 =?utf-8?B?U3Q4RFU0c29LTWlRNmVsUmlBeDhJRXRiNEtRYlMwcVAwNDVhK1BFL0UrWnV0?=
 =?utf-8?B?RHBOLzhTeWRCd1hNdUhIbk9Wd1NZejJXTVBZdk5OR0JFdC9EYW04REZodUxK?=
 =?utf-8?B?M3dmc0FqZWpSeW1vTCs2VUVpMjRrMERLaC8vL1lScytKVzJaZ0t4UDUrSUoy?=
 =?utf-8?B?TEM2dDN3Y2xJWVo4di8wZC9UYkk4bmVwQVpMdTg5TnlkUmN6em1ldzVkVDZx?=
 =?utf-8?B?MURnUS90aW5oVy9IbTlkUlZuUWI4blNJVjQxNHMxaWQ0ZWlTUkk1cUREbEtC?=
 =?utf-8?B?TTU3RWVHVVJDV0RSQ1pGR0ZoTHRLWFgxUTdFTzNOalo4dmJiU2dob25wcGdE?=
 =?utf-8?B?Vm1VR296d3BxYm5vRVVXRzc0UE5BQUZCaTZZa2lRVk5UVktmN0pHckRUdklu?=
 =?utf-8?B?YWlIRW1rOXM1ZS9HazFWTW9WaStYaHQ0OGtRTVdwS2lRcTZrbnFweG10c3Zu?=
 =?utf-8?B?c0x1YytibjhUSjkvOFhTb3ptTEt4c3RXeFBDY3REeWFjaTkvYUN2SnJYSFB1?=
 =?utf-8?B?RXBkNWQvQzlRbzBqNlB2VFlCc2drUTlZck1aR3FieU5na3h1aVcwMzloNWJQ?=
 =?utf-8?B?dHd4TnZpSlV0ZXg0WkFiLy9kVWc0U2JLMHlLQXNKNjBmSjNYQ0RUaks1b2Fr?=
 =?utf-8?B?bTJVMGZqYlRCbGtUUmJQL0xZWnZyNzdTaWZLSlRIWWxPM1pGZFAvREZBT1lT?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 308fc75d-5fa6-4170-3ea1-08db9e2e2d2f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 07:55:36.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CUpIY/i01XWIGfmILPsAxTgHyo0aXjm+/j+tz4zN54K4Qxs7HrGlZPL3mefRCIk1jy2mD0MDLEYXylBVpQ6eT+ftbSz/ssintgGK6EWe98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 07:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186117

On 15/08/2023 15.08, Paul Gortmaker via lists.openembedded.org wrote:
> [Dilemma on changes - merge or not to merge (e.g. 6.4)] On 14/08/2023 (Mon 10:54) Richard Purdie wrote:
> 
>> Remaining are:
>>   * an error upon boot on preempt-rt on qemux86-64
>>      (e.g. https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/7616/steps/36/logs/stdio)
>>      We'll probably just have to ignore it in parselogs as it has been??
>>      around for a while and nobody seems interested in fixing it upstream.
> 
> Just back from vacation and I see an internal report of 10-ish at boot

it seems to be rate-limited to 10 per boot, so it should never appear
more than those 10ish times:

static bool report_idle_softirq(void)
{
...
        if (ratelimit >= 10)
                return false;
...
        ratelimit++;
...
}

(it's all non-atomic/lockfree, so ofc it could just happen to get
emitted 11 or 12 times if the stars align just right...)

> 
>   NOHZ tick-stop error: local softirq work is pending, handler #80!!!
> 
> ..on the 6.1.43-rt10-yocto-preempt-rt kernel, on real hardware.  So it
> seems we can't blame that one entirely on v6.4 kernel (or qemu).
> 
> We used to get (late 3.x and 4.x era) pretty common "NOHZ: local softirq
> pending" messages even on common/popular distro kernels.  But I haven't
> seen those for a long time and they didn't scream "error" or have the
> alarmist three exclamation marks either.

FWIW, we're also seeing exactly that "NOHZ tick-stop error" message on
6.4.6-rt8 running on a couple of different imx8mp based boards.

Rasmus


