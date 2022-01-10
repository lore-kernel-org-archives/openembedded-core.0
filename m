Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C8DC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 20:39:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.28])
 by mx.groups.io with SMTP id smtpd.web12.37562.1641847184754630371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 12:39:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=FzXiZEM9;
 spf=pass (domain: outlook.com, ip: 40.92.74.28,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4WW95x56qL7nepAgvyzGD2LMEgXb1ZaabeBv9JTXJaJyC0re3Tz6DfXV1+KnpITUyohPeFpcGLJCnzaNhDUOx+BIHNTNCrUL8sqEtRaB1DWK4kymHpVqXytkFihe/6WqLXEPBjTzD0fKsuZplOdJvTDp843AmvdxT9Gk6usNJ8mP4qcjc3ElYfY/Q4UtmOZyVApuMkG+V+dZQeTjpMRNApMCHmImj6+AWg1cngIMdh0a82k/s61WncgywKpTu9S3QfSosF8et9cUMoFlT7zI64VaqepBH6ubiUQ/2j6ymcl2l19r1nN5FU3OySLo1FDau5N1x6D0fv/8NIW9gEzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3ZL7+AJwgeHIWkH8SWhoZhiNdX5muzsYfHxe4hMu1M=;
 b=F2PyGWRk94q0qXWKENhIU33d+9eYZHsmQJch0IIYo0R+uISC5v+vlMNkE1WG6hy/gI8yQGjLrFmqAdIYKyJpWRsJwSWz9VkAloTeNnKG64m3FcIrJLfK/gBXL7DidxQtborf6/rZ6HwWFd/G8AdkheKJOTvvju7IgGgGsOk6FIrDYoZiKZ7K14vVJjrrsRKABkLbnd7ciKyIxwBcJ7MOUaizRrp4wj9Q0DoGxsPdbV2X/gttA6ZOlsBDrSgvrWhPvNL1fdt9rqAGQsTNY4ds2npxwfRnn53/7Nb7keetjZqzmRpBHrkqpI5UxKwV89G+9qz486SzZbs20V/nsGUkvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3ZL7+AJwgeHIWkH8SWhoZhiNdX5muzsYfHxe4hMu1M=;
 b=FzXiZEM9zE68KBWBgLeIAOAlNi7okZ6WXmswbKH7IMUTdPZINmSt6DUA6FNcrzoBWb2EmaO38wYStPM29BTXrkLkC40KLJGA7GXRTFKprqCz6sG5IHzZ1uCVA0+55TKyS33fZ0O8RFziOLwsLFlatfpUpclJEMCs6SWpgFnoCupv7dDJU36Vd1eo3hxJcpqtb+Wn6AKLmx9as7M7M0mSPelPrXqAZqly9OfMe4H8HcCDxHcAlQhcGeQKW5831b2vzGSI6+WKXTUgr9HDVJxWcAOTCFV2ZU+EQddBDWwWTOAnL5YoOynGHWTwb4apGifrMR1nXhiONISE6wGCYcvMEg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3971.eurprd09.prod.outlook.com (2603:10a6:208:194::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 20:39:42 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401%3]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:39:42 +0000
Subject: Re: [OE-core] [PATCH] rootfs-postcommands.bbclass: Change the
 default.target location
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220110153733.29006-1-pkj@axis.com>
 <71cf0c9e5896ea005d3cfb75a67e8982f2a9aff0.camel@linuxfoundation.org>
 <a15707912cbd4ec39883439a542dccf7@axis.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642F07A1884299245535502A8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 10 Jan 2022 21:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a15707912cbd4ec39883439a542dccf7@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [c+pwilB0TN4CQodpMlVU3ofVHAnKEXpsUfx424O4xTnxaE1rlWeJtO5S7pcgxNl8]
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <62aae45f-667f-3156-8f78-e6624248f99b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d16ea62c-bfbe-4b48-8904-08d9d479547d
X-MS-TrafficTypeDiagnostic: AM0PR09MB3971:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jys1/e9M0VfjwoyHBarKeXL42ZTjbo6ZQvp3jeIzGxjDezY7SAPQSpt1rr9cg9PY8Qqfjg1RIsxICDx0L09v5Xt2svjkvP6uD2R+CgT9Ox8jVIOMBqxgBTOBlC8zKzwOBYzyHHqxVk2vwuKbcrrb3tU3BtMJ3r+GggSNg7jbHZlX365Mjx8IS+W10XtSZsljE9HjX5pJPzoTVU13AMF0i6mclrgewuq9FT/nhfEP4062Nk1NvPbXyPCgBOFzC7dcIHqtaSYcQPmUgCLx1oq472JPO50VvTPiS+u2lcqfUZFK5CTt126jXFloU4TUslAlJjtDjM8uwqlrbmNRnaLAdegf8FwwOO9nwy86kT7gntcmqFXlfuwG/ZKJiPG6H17O1JTpVkQk5/QBkDe4t9vslarI2hPYMFcmYa1YdMt2zgZCM+g1OQqswp29P2JxOmyd0gEjg7wP3MJmup7DRl+MjEBcDO9VPA0I2j1hnUDLHUVTT9XpMU7XW+vkxgtFplxQOw5lRJhEpd1Mq9S8Lbp5ColXJFNz7aHlc6CGy9kpeQxs3tSc4NOyTvayxpNjqsj8OHJwiNYGnS7ucPGz9Cw5nirVteeOY798Iql0OxU5hreq8G6xv1KH24Xeh7JmCACIp/oMDcxQdJuh2kM6hcYqBd7HkQs2glYYuTlue59uaI8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2s1RDRZR1VONTFmMlJVZVVsaWVEWlgrQjBET2x1aE1XREZ0MStnRHRWNDBM?=
 =?utf-8?B?ZFQ4eFJWVlNCRk9vKy8zSnNEZkt6OGUyYTE2eFdYdzNTZmlGWGl1WTRLZCtm?=
 =?utf-8?B?TWJyL1V4L28xRExuSWx6TjRkOU9XUFlNR21jZG9nMFhsYXhLdVROMVBrQytE?=
 =?utf-8?B?MXl2dkEwOVBUN1FNdURwZ1ZXK1NRazB1WVN4WDRWS3RvZWhVK2lVeFQ3eThO?=
 =?utf-8?B?TGxEM3Jza0ZqUkJnMFpEQmgybGd5cTZDLzhKalZvc0dJUlZLZTR1WkYwR1Fr?=
 =?utf-8?B?R2RaTG9zTlVvc0hXd0hrM3UxaWNMVDVQRm5Wd2dsWmUrMCtUUmNmQzFHSE9Y?=
 =?utf-8?B?TDhjb1IvbVpkZmNjWGlPbVZrNDdjMXkyeG4vNEhWSDhTVEYwOXJkcFZtaFQ5?=
 =?utf-8?B?RzFlTXg5T0ZHK25MSERPcW1qN3RhRmFNdGpmdzNqUGNNOVQ5OFoxeHByWTYz?=
 =?utf-8?B?RXlIYVhSQXYwTmd2c1NEWXZDeWRXb2x4a1dsaG5FV1dUanVJQmdnZVZQbElM?=
 =?utf-8?B?U1Bla054OXAvd1FubzF0am8vUXNmWk93MkJJOFNwRFUyTmg1UXRDbjNOSUZm?=
 =?utf-8?B?M2NFbFFSNDlldHpJUTdnaDFrZXJUa0E4R1M2ODBXbVJtVWVLbmJqajhYTGVY?=
 =?utf-8?B?NjR2VVB6b0VHUVFkdmJoQzNlZWFpZGhpWFBkZEhreDZHeDRrT1NKTnJWT3h0?=
 =?utf-8?B?L1JwVWZTcFhLT0UyeGVuOWN5Vmc2UU1CNTlFUXNKRWJNN2VaNzRObzRMRmRj?=
 =?utf-8?B?aXZCYUNlV3JoRTBaSkhQUG05VzhwSTd2S2RaWGxFZnhldXRzd0xYelZITTJD?=
 =?utf-8?B?YWlwUE9oaEhFOHRxRmdVa1lKMjlJb083eVhjK1R4VHU0U0ZOMlREVWZXZmMx?=
 =?utf-8?B?WHVTVDNlM25jTXNrUll6cDZpTFhSWTJSOXRLdURiWjJmTjdMRXBJMjhMZjdW?=
 =?utf-8?B?MEJTRHN3MkgvMTg0U0szWHNTME1zbDFDdzJaeTdLM2lNNlZTUUxZY2VjRkFG?=
 =?utf-8?B?ckxBcFFsR0YvQU8yNWord3FmdDVSa2U1Tm9PQXAwU0g3cjNvOEIyMms2SHpU?=
 =?utf-8?B?dHBHQ3M3Z2V6amF0b3lFdzM5dWlYR1ZRRlcvclVaVkVWSHM5NnpLeGxORjAw?=
 =?utf-8?B?SCtXY1k5WkdFYnI0ZWN1aHA3TUl5Y254SEVUZXBYd245OVZFR2wyQjAyTFJ0?=
 =?utf-8?B?Z1BKY0VvYUlCQ2ErU3hmZVcxZmhudUVldFp3NWtKNmsyb2VmdHBUaHE1KzBp?=
 =?utf-8?B?cmV5ZVhjMnl5b3BvWE5wdGd2a2tSSC95OW5UcjZiM01NVmE4bTc3S1JBZ0p5?=
 =?utf-8?B?ZnpqQVNBVlMyS04zRnhtVktBcDBaeGV5UzRWS0FQY3krVGJuN0tSWHgwUkF2?=
 =?utf-8?B?dUdEOXRVSFJJL0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d16ea62c-bfbe-4b48-8904-08d9d479547d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:39:42.6405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 20:39:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160378



On 10.01.22 21:33, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Sent: den 10 januari 2022 16:44
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] rootfs-postcommands.bbclass: Change the
>> default.target location
>>
>> On Mon, 2022-01-10 at 16:37 +0100, Peter Kjellerstedt wrote:
>>> Rather than adding a default.target in /etc/systemd/system, modify the
>>> one in /usr/lib/systemd/system.
>>
>> Why?
>>
>> (the commit message needs to say why as well as what it does)
> 
> I thought it did (avoid having two links where one will suffice).
> 
>>
>> Cheers,
>>
>> Richard
> 
> Thinking a bit more about this though, I am not sure I can win. We have
> had a corresponding local patch for many years, and it seems natural to
> have the link only in /usr/lib/systemd/system. However, for a system that
> uses package management (which we do not), it may not be as natural,
> since then updating the systemd package in runtime would restore systemd's
> default.target rather than the one that was installed with the system.
> 
> Would you accept a patch that instead introduces a variable for the path
> to the default.target link, with the following definition:
> 
> SYSTEMD_DEFAULT_TARGET_PATH ?= "${@bb.utils.contains('IMAGE_FEATURES', 'package-management', '${sysconfdir}/systemd/system', '${systemd_system_unitdir}', d}"

IMO that would look overly complicated.
Just pointing out that, with your patch, people can alter the default 
target by placing an appropriate link in /etc/systemd/... to override 
the default choices would be enough.
I guess changing things in /lib/systemd for an image makes more sense, 
it only has to be named in the commit message

Honestly I don't think it needs another variable to achieve the goal you 
had in mind

Konrad

> 
> That would make it reasonably sane by default, but still allow it to be
> overridden if you have other ideas for your system.
> 
> //Peter
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160377): https://lists.openembedded.org/g/openembedded-core/message/160377
> Mute This Topic: https://lists.openembedded.org/mt/88325758/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

