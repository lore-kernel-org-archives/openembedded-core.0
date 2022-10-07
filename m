Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F889C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 15:20:55 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web11.5973.1665156045556516588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 08:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=Pb4HQ8r1;
 spf=pass (domain: seco.com, ip: 40.107.7.48,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crGQdvy6gQ+WYyu0n1BzHKruAUYY31HqMhAVm2LieSFSKlPim2L+88ITpPE2Li/iK6yxNtAoHY0dRY6kXlfCd0G6WWcwQ4hc76P6pPlpnD+sbtufpDr5Ff3Z/snwzrfAOu/SnpnNonwvAShdFRlZejQ+UtLELpwdE0pN5io9HEsACAAM67eKxLetCiHB6Uh4yd45gZRysNUsj5iZC4GI+RXqT+L5o1G3EGQqs6q2O04BJ5/TDQFhP03+eS9C3CgkMsHkgVg6frw9kIWXcHhKK89261HO/5Y2Ao/stMq7Ct1WT6iEzlUww/wnylsYVFo44T4UClyJq0KsGsI3tKpdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhNxUNlCbiG9wkWiLyU7i8qxBazYFCtDfWqnTgttrXI=;
 b=nCbOXKsv5j26FBZ+7qqP8uIOAI+85wFwDjPv9P7uStGbQIeklEgymzXoRC6kfFWbI6Rg8Xttu4sZX6oMJAhhs7CuPnKxYLzYhxB9bBK2jT2m/GaCtrY745q9atAroppWUl1BfzP2Fsjk7URxdmEVXoTtw+DkCoJZPB1zZcePmgEZwHZ5FKD+nelRNzPVz5I3ja8A+KBQYsmpA8ITxPN7/Sym0Dz1x4YQDURF0XRTWR3spFHoGmAJdXZfvjot8Pn2cJEZ+vwgQRPZng+WAaAeiS2obgthyF2JWGVLiLF3fOEKm5XHHNQz37L2IcKxehhn8NYLLfP4TBL9mxO5nI1UWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhNxUNlCbiG9wkWiLyU7i8qxBazYFCtDfWqnTgttrXI=;
 b=Pb4HQ8r1Wg6pYU0SompAEgmx1WAm+dMKyhAQuazPkHKOL14H8N5vpnlg/XwWBeDciZrOOI0wcqmTQlqgmKZtq7mnsjLhwHfdsZSvvfBd/k+s+meDPpiBhDnLPl052U8X5P7Gz8z0uMANIFsyOA9+iKKsClvJdPYMkjGhBmnrWNh500tI5cXao36cbXAVhOgItI+3cKDTTAdHCyYJMfDCyM9bSgi/xxgOeaT6WSfr0uAcUUhxRBHZS0GhQEatp3TRQ00aa97F1MNhT3U9J8nlr9ifR8Ec11vzzpPn4diARkVhYtq8PtntfU3VGBMecvJR2chUe8XjdiIrdKhYGQ3Ufg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM9PR03MB6932.eurprd03.prod.outlook.com (2603:10a6:20b:285::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Fri, 7 Oct
 2022 15:20:41 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 15:20:41 +0000
From: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [OE-core] [PATCH] dbus: Fix incorrect path for container sockets
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20221006210210.1744501-1-sean.anderson@seco.com>
 <e610bcc9-7ba5-5977-6548-b624ac9724c2@seco.com>
 <9a8a5af4-1928-ffe0-2815-b9efd24c6bd5@bootlin.com>
Message-ID: <eb564c8a-2bcf-a571-867b-20206c4b87b3@seco.com>
Date: Fri, 7 Oct 2022 11:20:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9a8a5af4-1928-ffe0-2815-b9efd24c6bd5@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0015.namprd22.prod.outlook.com
 (2603:10b6:208:238::20) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM9PR03MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcc5b0c-2ab8-4ed8-6c26-08daa8777ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1RfUmuXNlYRtYGGKAir7I3+fsFT4h6VSYwKExW1JIz9uDTFBz7RVcxvYbEEsT7Ow69Yz+srdXSWSvx8hVMxNY4kJMT20z3nvOQm8XqGAnwGPMJfTsLvafcAAPY7Wz9dq7k+Hx0PWHY5QFq0tiW5bybn6Q7+mZFmMcSXDinz9/Ct0TfBH/ujwxdZ65qlUDpuTriUCDPEt5QhLDlRZbOZvtM5/3iv2N9F2GNRVtRii00od7pvNByW3+csZE+/HAelHIeEHgc2zfmPP1B810zqo0IwNKHlPwk2UttU8hHUQb/B12x0HvGZol6JQ7AunhsYaVP3P4/y1/FY4GeKiqsi5ClIKXnNadAK0m4tWsDP82TcMi2yeRdZiDVZLxwwE4MbMYu3W1UFW3ouXJjIbBsAiQbEKNIgSaWdiDS642a5DCR13Nmi1eof/RO31U3cEqbQRAi1PLchHcZ1CKcE6aILfDSdZJ9HgidpTt1+hj3qRghC4cGJ+ULE/M2hGtbNpfMLdSJ7HsEcOSLh582QdqGVdHTD/z53NGL0C+7E/mF/coZ/eLTq0kRx74FAAsG6+O++skSNQZrYIyGTZym0bn1K5RZPAg98u0dwvRQW30v5gkzz4D5EpoAm2c1icq1Vpk/lduIgV9BQJQsTStl1hRDQ29ohIVCZM+6EGSxBXzCeGHLmD9J2R4GNFHdufXHS5BNbEOpGn1h4RiQezMre/FlvaoJZ1ABuG2kCx7kxD0thdN9x+aK3H/WcdUjU8snh0R1gAj+pklnVbYbACcHVk7Vx6rzCC7upCGldCz2ihuSFg6S5moysfuDjddk1QiJlLAY/hkkvcjL7BiLIfF9Qpcty8wOhNlBrjPD3EgrlR5tc9ImM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(39850400004)(346002)(396003)(451199015)(186003)(31696002)(86362001)(38100700002)(38350700002)(54906003)(53546011)(8936002)(316002)(5660300002)(41300700001)(44832011)(66946007)(8676002)(4326008)(66556008)(66476007)(52116002)(6916009)(6512007)(26005)(6506007)(6666004)(966005)(6486002)(2906002)(2616005)(478600001)(31686004)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkVTQnI0eVlBN1ZqS1g2alpycXRETHNmOXFycW16SUowa0lEOHFaZTh1dGU3?=
 =?utf-8?B?MlRiOWVZejcwMk0vSzJUcnlUbXd4SXpJVy93Yy9uYjcyekJOeU03VkxJQ09E?=
 =?utf-8?B?aXhCNmZlWnRpY05MTml5Mkp2cVNEKy9xRlREUFFQazM4RFB2c3d3bUJUakt4?=
 =?utf-8?B?S2RUVXM1NmtZbmRtbmFjcXhRS2F0NVJzeXQ5L0tmVzJ1NGsyZS9kQndJelRV?=
 =?utf-8?B?MmI4MlloQk11VW9hTk1wU2c5TVM3a0c1ME5JdlpFQTZSNzZxeW1GL3JXYTRD?=
 =?utf-8?B?dDlFYThiNklXbTg2dGcvMEYxS3RtMXdLdk8zZFVsU0k2T0NXQ3RoTFViYzJX?=
 =?utf-8?B?MytZTFV1VzY1SFprenFUenBDU1Q4RnFTTXdFcWlqeWdvNFpDclc5dldVUEJm?=
 =?utf-8?B?U3pKcVJnTGxTUHc5b3UrUEIzT3JWbHBFNWRqbVRyYUV5QjdVR1pJNFNld3Vh?=
 =?utf-8?B?VnhxR3Z3T2hMamRmTVdiSmFMSVp5STJjUWdYQXVCT3dDL3VVcENxeHRKTVJm?=
 =?utf-8?B?SDdPQjEvcldRYkRyak53bWErcllEZlVmZjMxNG9FRTk5SjhaRFJ2ZmJFcXZ2?=
 =?utf-8?B?Q1hQWmpYOGIrYzZ0TkdNR1VWU3R1RXNCdm1EM0ZjUS9FSDZKNHVnNFZVc2Fl?=
 =?utf-8?B?K0JIRHpDWWFxbGw1UU1Ed3RMWGNia3RwNnFEanFuTmZ3NUhEQTQ5YTVKVkky?=
 =?utf-8?B?SFRvb0tHbTMrV0N3c3prRDhqS3Z3ZDBucm9FMmY3OWlRbjZxZ2l5ckRXeUFl?=
 =?utf-8?B?WWdKRjlWU2ltVVR1dFhJeHB4Q2p6V1VyenAwd21lNGFzdXZ0cDdsMGNtQm5N?=
 =?utf-8?B?eUlPOXJnTno0OHhhcnRLQXZqZ2tSZjBHZW4xMnl2Q3ZYVUJsWkhtR3htNHFJ?=
 =?utf-8?B?bmUzV1hOMEVsMVN5ajRpNytsSkx1NGFNR0FSck5CSnNyek5MbGNaWnZjNnhz?=
 =?utf-8?B?M2dHS1JoUC9mbnEzYXRiaG9mR3BIa2dMMWRiZUx1cGFNQzdiY0lmak9NSitE?=
 =?utf-8?B?c0FSUzlWRGh6RmJHdXZ0RlEzckZYelJ5cDlBcjY5SC9aYVYyQUxHTnJMdjk3?=
 =?utf-8?B?bTRvTGpPaGtsUTFjaXR6V1NaZnN3UG9JSnpuT1dPZDVUa2JXYlRZc3plMkFN?=
 =?utf-8?B?cnhVUXp4OGtRM3VHTXEyQ0l1V01YbEVqSFJwMmp4K2JzYnB3UmlhU2xSTU5v?=
 =?utf-8?B?SlBhbENuQmFEQVVHMzZLY2FCYnNUTHdhdFhycUovRVlxZkdLZU9rYnZPU2F4?=
 =?utf-8?B?ZnI4N053NnBZdXRPeDY5ZVRtNmdSS3pncTd6YnlUUklkRmVxWGlCVllpSit1?=
 =?utf-8?B?ODZGbERTdXZReUxJLzNtZy9uY3VJOWNRaTBIc0g4RVZqeUFobW15OWMwK24x?=
 =?utf-8?B?UGxHVjRNUnlxWlpzNTdtQVljWHdRVVRvN1RiRDNQUTdHc0cwUDRESEtMUkV6?=
 =?utf-8?B?UTNObVdhankzbHNhbzMzYzBJbjVWRWlrdGRMV1o5Vjk0QnNzSng1NU1oREM4?=
 =?utf-8?B?OXQ3SkNDUklIMzYxT2RVNDA0cWtWU3BTUkxFVWJjd2RVSlhxRHcrNUZwc3Qz?=
 =?utf-8?B?NFpSYTFKc2FIamRsUU9QTElhcHIwNEk5SldVajQxcFpnNFpOLzE3NEw4STFZ?=
 =?utf-8?B?MWc5WEJkWkJXK3gxbStJazJSQkIxcndybUc1dXQ2Y0pVZ2Y3eVJYMjFhaU9n?=
 =?utf-8?B?eTl1RG0vbmZrRHFVeTdJdHN6Vzk0ZU1yQjNNN3NjbVJMNTBvR0hqM2hoZHRZ?=
 =?utf-8?B?TVRWcExGUjcwcEl3TWZuRTMvUGJhVVZJVFZPd1FDRUN5SmVoVTR6bEo5SDJm?=
 =?utf-8?B?NUxHSkV0SG5kcmxnZUtkSS95bkI1TWJGWnFKR1hWWFhJMnNtR3NVL1djelVS?=
 =?utf-8?B?VzFhMmlvMWFaUDgrQ2dtRnlWY1VNaytxZVVtUnBuOVZLaUdDekdzbnY1Z1VQ?=
 =?utf-8?B?dmphbWRaQThmc1lXcTM3RFRBVFdhNmVERjNYVUZoZ1dtMUlSRk1yTWFiblRO?=
 =?utf-8?B?UkNha1U3czJWU0lQcERzOVloWjlyTndqZWNkNGY2dlhhbWY3Q0k5bWZEOHJE?=
 =?utf-8?B?MkxGem5RaWNaMmszb1VET2FKVVhIOGd6YVgrWnZ2YXgybHZDQWgwQTV4MGJ6?=
 =?utf-8?B?WmpxQkZxWGZQZjRTOU5WcGc0ZURlc1dETFJxeGg1QWlKcElmRDN0aXlYRGZU?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8dcc5b0c-2ab8-4ed8-6c26-08daa8777ed4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 15:20:41.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 B9yGhirO9enz5/sZjP0CtkWqUHTtFcejO6Hk9pIbs4eZR9WXcgZMIjaoORQOwturJjhdAwmYkIsad33lsfFG/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6932
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 15:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171529



On 10/7/22 3:23 AM, Michael Opdenacker wrote:
> [You don't often get email from michael.opdenacker@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Sean
> 
> On 06.10.22 23:03, Sean Anderson via lists.openembedded.org wrote:
>>
>> On 10/6/22 5:02 PM, Sean Anderson wrote:
>>> I noticed the following warning from systemd-tmpfiles while booting:
>>>
>>>      /usr/lib/tmpfiles.d/dbus.conf:13: Line references path below legacy directory /var/run/, updating /var/run/dbus/containers
>>>
>>> The offending line [1] is
>>>
>>>      d @EXPANDED_RUNSTATEDIR@/dbus/containers 0755 @DBUS_USER@ - - -
>>>
>>> We do not set runstatedir, so it defaults to /var/run. Set runstatedir
>>> to /run to avoid this problem.
>>>
>>> [1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/master/bus/tmpfiles.d/dbus.conf.in#L13
>>>
>>> Fixes: 4df1a16e5c ("dbus: Specify runstatedir configure option")
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> ---
>>>
>>>   meta/recipes-core/dbus/dbus_1.14.0.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
>>> index 0046b9fda2..9fb1f777bd 100644
>>> --- a/meta/recipes-core/dbus/dbus_1.14.0.bb
>>> +++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
>>> @@ -21,6 +21,7 @@ EXTRA_OECONF = "--disable-xml-docs \
>>>                   --disable-doxygen-docs \
>>>                   --enable-largefile \
>>>                   --with-system-socket=/run/dbus/system_bus_socket \
>>> +                --runstatedir=/run \
>>>                   --enable-tests \
>>>                   --enable-checks \
>>>                   --enable-asserts \
>>>
>> oops, ignore this please
>>
>> I didn't read the patch I put in fixes >.>
> 
> 
> There's also a problem with the way you send your patches. I used to
> have it too.
> 
> If I apply your patch through "git am", the author of the commit is:
> Sean Anderson via lists.openembedded.org
> <sean.anderson=seco.com@lists.openembedded.org>
> instead of
> Sean Anderson <sean.anderson@seco.com>
> 
> Because of this issue, the maintainer has to manually fix this field
> when accepting your patch. Worse, if he doesn't catch this, that's
> harder to fix afterwards.
> 
> You should be able to fix this by running:
> 
> git config --global sendemail.from "sean.anderson@seco.com"
> 
> At least this worked for me. See
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email
> 
> Don't hesitate to send a test e-mail to me first if you wish.

As remarked on before, this is because the mailing list is rewriting my
email address. It should be fixed to not do this. There are plenty of
mailing lists out there which do not have this issue and still work with
DMARC.

--Sean

