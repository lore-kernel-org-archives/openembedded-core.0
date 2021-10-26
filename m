Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66634C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:24:24 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.49])
 by mx.groups.io with SMTP id smtpd.web09.10665.1635247463167148549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=n2bpxQ2M;
 spf=pass (domain: outlook.com, ip: 40.92.75.49,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGG9rFQq/g5hzySElQqVFtyQ3GUjitRHTzVxK3ouqf1+NK091rpa600JIy9BDxPMHyX6aj4xKkk8tjeK45Zg8DqDJ6SzVYyjvT3DnH2vrTHkCA23BiKM1upQB7S2eDTJS6kE9gxPElYl48dJLM+t2bLreFKYLd0Uorda24KazI1fWfpuvs19971J19LvSa0bXF0UJ/hAgBx1E2R7yWSaAPkcZKbiLQYP5GUVEXeoM2lJgUK7nxjYcPVYN08yT5GF2EAbIa2sBGUItZUTOtHg03umHCnW3JSsdtSllRDyjqCfM1S9DIXgk0l1n+zrGzmdf/9yFMVLgB7PQsOBnBK/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCansmG6SYSwjO7AzIz9t9veE1z3y6oHo3ae6O8VjV4=;
 b=GqmEW/e450LPl07NKGhqCS+14ZyKQlWDdN1QN5hk3HmoufX8HoF2uq/hmWGA5nS3kkPXEf5pmXA84q2DLas0tRiKcNM5MWhKR6pb/yB+Yg7Q+9ABYaVUJSsdUjxUrA0opCtg8pzHcRnNk/bVd1gzymU0bRPAWccuEd6bPgyWwdBt210H9InZzCVtElRY9pOqwfRLzzNj2EK81OFYakdRVbBHlPk5mpYa5n9EbEaREpRl448g2PiFWWMQUeju0kMkDQTS6Mb/374gaKE3BpIVzNp5TsJtwgE1y0HHE13RyiVwvTCs+tFRWiPSkuIUJISSIFi3oI2vcl976fE1vgSSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCansmG6SYSwjO7AzIz9t9veE1z3y6oHo3ae6O8VjV4=;
 b=n2bpxQ2MwU/P9jGrVQ7nLr9aYLumk36MzjFBgphYO7jroa7xw8eAKqCyZKV1TAuyn4jcWCcExIjBlO9SaccIGpCbu826wQ68wN4sOwr1myHEgpTY3BQPRc2hm9gYJZJlI93NCwQCv3YtMg8+/Lj72xSDterezEu5pPxUoIzSXeYkJdQ5Ez2tvksjF58FnqL+w69aVq2aqnpCivW5/N+7/IJaXMknoQ1DSl9KnbtlxFZE2dgGNt9XhbZHa7uejCclku4DJKS8M7mi6uIy7q/ubV9iWCq5yZ0E/O0iOzh+PtwHyFTjsJ7uon3Z7LhD9cfNB6tBjxxE+LA9P9c/QG47IQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3921.eurprd09.prod.outlook.com (2603:10a6:208:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 26 Oct
 2021 11:24:20 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 11:24:20 +0000
Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
To: Martyn Welch <martyn.welch@collabora.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <e133da623f5a357c570efc036daa84098dbc691c.camel@collabora.com>
 <63d5cd9f7264871df79099b1831d5a8a85ca34b1.camel@collabora.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46428E00E810D2C55427FBA7A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 26 Oct 2021 13:24:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <63d5cd9f7264871df79099b1831d5a8a85ca34b1.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [HfMZxm5xaF+xv0VHNyNZilzwcx+9wfQU95MtprUaqAtzZExOIbuyC4mpC1onaq68]
X-ClientProxiedBy: AS8PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::25) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <be1f609e-1c36-e8e5-3ef3-ce8eceb34901@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AS8PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:310::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 11:24:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9be4d99-4a95-4170-1143-08d9987327a3
X-MS-TrafficTypeDiagnostic: AM0PR09MB3921:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oFsfQqxpZG63K8dZT0HWRX4KMVVWTCNiBfzRT3duboXG5XyC7QQUOXo7TyAN4YntntbwdlbuLINYJQHtcnx7C6l53/ro7jMxehgMe+m81c49RVp6hLvQHBdBVXIJ3wd13ZOi7A6EeHPCR6avFvru44DE4TOpRAuoDM76m+g7TAExXHPi0fhZGL2tHGuUBkT+edGQo+Gt36F3rBkb3zcWIRor4UO86KgAeeDcoNT+ngjiY7hnyzmSe8PVI1myzo58cneki5iGQmnBPvPeCrmJCUWCJiexhp+0NVHi1QBQkBkwRlkXkK/lwEVeKbW1TBMQHtIzkny6JBimpYVAUpIFZdQYbcUNmUGhAPSYq9rOgVpOK+e3s+ZSVcZGC37Lf5E3JAGh3mpsO9ynFORx9iHFX0CV92xL7s3M2mEVuTi0GBtlzegjTFhdj4MYgTdkHF+TH019Dwh83kX/nvLLEC15FI/bJRQwQ2j5/PhbOcflgEXsg8OPx53vNNnuaNKwWA4or4Q0v/OsJJIpHMXKBDayh7jOSZEWxpfsDFoe8Vsmif1Js4egJd4pd8SKpuzspnBFYa1mSGrjCe70Y3EBJBXuYz2Z+GgPxvjEcvyzQdHj9p7eplmmU8nyxoFPVbKrKapf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b6AA+5VvcOkoRfPtV8zSqbmLG0B49SxuzFqMGNOX49xqKTI940BwYp7OqaJnLXSbqYJFZ3mY+tjTg1ROY7ipsLLNzL5A4D1q7IxZqgQSYcsQ+6HdgDh0DcPanGalQLAwxnhavixitvCuZ4/JX9RWbUX7Z2lmY5YOeYKY/oWyjLh0G25U0FgbK0d/zvBX6X2po5j5qcaDcBpML07IR8KBm8xbMs55kG3E7n7maOWp/pqHmM5wgKoNUEbJQi39O4Kivrdfk/VSTkk95WcyAGklqEQuNEwaTEch0UHW80P+AyXbYdIYVgXhubwRTX6m9AWSba64NTQ6q6rKKLD+mKPB9LuR3cy2Eshfi9Msn+Mp43qteYqZkuocZukfEubpp9jufVE0GxnmZMHtOCtsgk8TLm3MP8sE9dcb+SDnDskodnIpWVLuZ8Ejsu5lUMZdWkscHHm43pBr1rov9+CO3mDaB/yRWhW8rGBCeu4bXoblt3VpKXMrFI0gXGWBtGCiItIU3wgWDLUuOrsvNlt/I2gUhrO0wud6KnQ48RP+5xkUxbGM4/+YJiH7VjlxyN6E4OWqAmkjk464v1IijElwgcf/X3vT7vBSMSN9khZDKYqA65iL2//2yVRO1dyw5M+owH42JXSTTxL44ifB4alVt1yM3aiwDEmP7b569cymoiPVsGZaaWUkrDOsNWWC8he1iwErgGDAwGaptdNBe0NrZORg4umRjGYGPLzHbcE22is0uYz+IbwXhAxjXcZCqEHynDvPgCEVQpr6sXYVj5zKC5kCEA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a9be4d99-4a95-4170-1143-08d9987327a3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 11:24:20.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:24:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157389



On 26.10.21 13:21, Martyn Welch wrote:
> Note to self - remember to reply to list...
> 
> -------- Forwarded Message --------
> From: Martyn Welch <martyn.welch@collabora.com>
> To: Konrad Weihmann <kweihmann@outlook.com>
> Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
> IMAGE_QA_PROHIBIT_PATHS variable
> Date: Tue, 26 Oct 2021 12:12:11 +0100
> 
> On Tue, 2021-10-26 at 12:56 +0200, Konrad Weihmann wrote:
>>
>>
>> On 26.10.21 12:50, Martyn Welch wrote:
>>> From: Martyn Welch <martyn.welch@collabora.co.uk>
>>>
>>> Add a default IMAGE_QA_PROHIBIT_PATHS variable containing paths
>>> known to
>>> be mounted in the default fstab, which are known mount points or
>>> directories which should be populated at runtime.
>>>
>>> Suggested-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>>
>> That can't be true - or the initial idea is very very old :-) pls use
>> Alex's gmail instead
> 
> It's a very old patch series, originally posted in 2017 (as mentioned
> in patch 1/2). Just noticed it never got applied...
> 
>>> +# IMAGE_QA_PROHIBITED_PATHS
>>> +# Ensure images aren't including files in places that will be used
>>> as mount points or that are
>>> +# reserved for runtime data.
>>> +IMAGE_QA_PROHIBITED_PATHS ?=
>>> "/dev/pts/*:/media/*:/mnt/*:/proc/*:/run/*:/tmp/*:/var/run/*:/var/t
>>> mp/*:/var/volatile/*"
>>
>> I like the idea, but wouldn't make more sense to do that on a package
>> level, as here the user is more or less left alone in guessing where
>> the
>> file actually does come from
> 
> I like that idea, however it would make to assumption that there wasn't
> any tweaks being made as part of image generation that would end up
> violating this. A quick check suggests the "build-appliance-
> image_15.0.0.bb" image does this kind of thing in the core image types.
> 

As Alex just wrote, I might be beneficial to do both

> Martyn
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157387): https://lists.openembedded.org/g/openembedded-core/message/157387
> Mute This Topic: https://lists.openembedded.org/mt/86599458/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

