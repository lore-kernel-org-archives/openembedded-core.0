Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6001C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 04:52:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.96])
 by mx.groups.io with SMTP id smtpd.web10.43176.1719982317935865519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 21:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=G2cK0PcC;
 spf=pass (domain: outlook.com, ip: 40.92.91.96, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWOGA5dNsIlT8vf5rsvQPj+kkxNN/e5wtsH8qKNwP+232SDfXSmYhBELY1+hxOpbAOJPS/5hIAi0qSq2ovdIrujykhiVfCOm+Hbc7DoF/emQM8oeFulIjdWhPcTc6llghYhSo6uhN3X4OUmSABoT/cyI/Awapa3bFdN9vLjvvtWwm7FvitvtxrGBb+11zaOOdMBBbyLYqok6FdBsb/IsJuWhZVtCPeUXFgNMOBjv0arcycPfw7HcmDlWOvca5mI10DpgPamRyLR5i8eCrbUFN6i3PooIW5tsjaJxpcaanKrvoK9iNltM9vMHVPADBVmTnzqiv7FpXxV6F93PRFNm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slCwwKd4FJL/ajSi83lg4+Dj4Oh5b+GANT0whIK1gbA=;
 b=DrZyr8LDMSfTKSEp7Nfj6Hs+ejnlWVI2UVpvWPKfQZSHg2F/+3NqUY6WTphQUQE6Mzwmu81o7MsifIWNC8KPOwXDBGO9ncHFu/I9c/gMwE8/Fm64hODLKswExIKwg/qnwxuWSLmV3B0OrBGXo/OftOP/sde3hgEoK0HN+/H21AMIE2aknOwXhE4tf8DNSWEvpmHkWTZ3TUSnr77Bmh/+VQLx0EWzM12j6RYKocuVMVqWdt5Rq+we+bCY3GRyrcIKbbAzdAyzu+9+fI8MzuQTod8WdoTSsVssbI+RtL/2iS8Nc5bLfAaxrHBVuIDK3kqwhc87kyIo85jfW2Bi2boJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slCwwKd4FJL/ajSi83lg4+Dj4Oh5b+GANT0whIK1gbA=;
 b=G2cK0PcCohKc0Isn39LNNbrKCx094sV5OFCAB0OQcbLpbU6e8ZmjxKaiRZlsg4aA5MxrnlNjbjWgUUB7tpxtgIq9BQdzWxEDs1xcgyz+Crej+6hJ3ZEfrfk+IQdjCIdGPIHV0FnGcv0fcURMIQaHGxFyON0lGKw/KXnpQuEFKzyJs8LhAKGmKvsXhvj12Z83afE8z4zYRnlclSEJ2K9iEJP8rGO/P6NkAP0Ql+LbtA/0P2W401y+M2vWXu2vXQLN4f6XN7fopggB0+SiJUsMzbRdeRiRs4vxtf7JUi+j9oHrELdXSmh2cY0FYmZrgbFsueYbP49wGLrl6/Qt4kCdGg==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AM7PR07MB6963.eurprd07.prod.outlook.com (2603:10a6:20b:1bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 04:51:54 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 04:51:54 +0000
Message-ID: 
 <GV1PR07MB9120A60DC46BF6FD4D358E90A8DD2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Wed, 3 Jul 2024 06:51:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] image-bootfiles: new class
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
 <ZoPFJ4vZsZMUccHv@gmail.com>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <ZoPFJ4vZsZMUccHv@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [KJB6gBAwxiYo5B/OyglX/yy2l6F+7qwU3eep6DQBUQ4JJR9XwDaQ0B/RBwwDUiaH]
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: 
 <fe19fbf2-55b8-4692-8c8e-a0d17be981ad@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AM7PR07MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc2f4e8-ace8-42a9-0e39-08dc9b1bdc73
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	pSNs+fCxjDiIXIyA2HvOiSTOuHGiXlpYG6iMzgxu223iOYq+Qqqsh6Zqe/5NRUMVC1LzEDZomsnoZwvJQ8if76zGTm3tFXi4k22IdXGvTfuUgzDnO4l27RytkAvoohvTEmxJP/NINqtfUmICEuLMHnYa3VmSluOZKiz51hPZrEtQIwdNobz+ROfAIO12YFeIZvJFO/NxCT//UutPqr2GKt0KQFHi0thLZSMWR49HXslz3h5sMzzJnOpK8A9FPNNQT/3hc7pUZjtijObdxtaO8Y7FYQkgiq+slvM4Mxkip5PAj2EXzRaWVA0YYqJyM371N3ZcSLXTTZDraH+ylHErpTTCOFwRg2eXUf63bAsO6vfHHdYFadLIDcJEOjBZXYcTH6jCvKw4CwFmvPW6gtgLGIW24QiJBJ7a31/NHWFoCNiqiCK89h+UBLmdIuqq60hzSmfwc7D4l63MEgfpqKAzWcubYscC89JqDqwFTi1rjhHOO+VFhvUMd9S+a8pjQu7Gj9yppmSM1mcsu3d2ERBgrrxYN/xH0EESWtkX/QdJW7WWpSyBiABmZE6IzBrrKRTrnxOG9r8Z4fh21nYnfDNSub0ptQN0i+NJ0gdTWcePlI4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3h5VHUxckN3NVVOT2dnN2haenlMMkxKdldvL3BKL3NMMjhpUDN4WVMrNTli?=
 =?utf-8?B?ODZpRTV6dlBKOVprTm5kdmlrSnBWMzdVZmU0cG9tbVB2S3JJSElTalU1Y01x?=
 =?utf-8?B?OWRBSm9FenIvMW1IZlhFdXBJMVAyZjVyVjYrYXNUTDVpTjNvai9uQURMc0Vu?=
 =?utf-8?B?aFFVUmhMTjFmOGxjaFJaUm1NemlxbHBBUjVGQXJwRjVldFdzUlZyNVhqczhn?=
 =?utf-8?B?dFBEeHR5V1ZsNzYrUW1sL1hjSEk5NFFYYkV5L1l2Q2lYQmNhWkVxMHJmejNa?=
 =?utf-8?B?d3ZzcVZLL2RyaGV5M0xOM2djMytEWkVLdXNzeXhidFpsV1FueEZma2wrNStu?=
 =?utf-8?B?YlVldmhSUkZtei9BYXBYWkdYZ0RKN2VOWTQvdVVrbDJSNUFvNUFyWnM3QnNy?=
 =?utf-8?B?aVQrOU9LNE1hZFlMQXh2cWljZ3phNFdLM2k5Tmt5amd4TFg3QkU4Q1hYUjNl?=
 =?utf-8?B?WlkrWDdvQnY3S1RhNnZ6RE1rSGxLVHg1ck9sK2xiVVg5K1FtZXVJajFXMFRD?=
 =?utf-8?B?Uy9iNElNWEtCNnB6ajdOU0Zzc2dRWFhtNFN3WXRzSWJWbFZYSzM1SkQyVTNN?=
 =?utf-8?B?cmRCdENMOWJFVmIrMmkyZ2x1dXpUaU1ocG9ORXpBRFJldVBCNldWTjlub2gy?=
 =?utf-8?B?emdZM0dGYWFRNGZWV3p0enh5Q0dIZThWYi9RUnBpdEtWMjhUNVovZzZiSjUv?=
 =?utf-8?B?SUJQbnlteHlQM0hBcHRiWmZ3QkdHZWdVSE1JVTEzYXozVnEvMUdQRGUrTjNF?=
 =?utf-8?B?Ly82RldnKzRFS0Fvck1xZTd2bXVhdHQzSGM3NmQwQU9TVm5VMG8vazRrbU00?=
 =?utf-8?B?QXNycDI3TGxEY3V2a2kweGY0VnlyNFdyT1NFS2NDTU1jT05VOFZRUm11cldX?=
 =?utf-8?B?Y0RKZk84aHVZSVZpRGQrMmtUaDV6ZlJiNVpFbXM3TEJSVVlaQk1JK0xiaEFm?=
 =?utf-8?B?cDB3NWJJZ05mdFEwcDc4RWxMWnBqbDJTWXhVSFBNMkhMblN4RE9pQitEbDRO?=
 =?utf-8?B?alpKTmNuc252NE42eUhFQXEwbm01L01scXdSSmdPN0plUGZndkRHQ0xGWUNh?=
 =?utf-8?B?TVNnWWVLNHdaUS9VcSt2R3ZsNk9mMytZRFJvQk5vSXJrY2RCUHVZU1V4cTdF?=
 =?utf-8?B?Y3pwM2Fkc2YyV2NWOWVCNnFoVXVIWWd4ZlI1VjhEV04yZlJYOUFPeng4dm1J?=
 =?utf-8?B?clpUVXZHdkZ2ZFZkMFhzY215ZVpGd0FvZmtFOUlkaGdpTVN4TW5BQ1A2ZmpR?=
 =?utf-8?B?RWtwRHNkN0hic2pqcmxacG9oZll2Tk85clVyOVhVMzRDMzR4L1k3dkpPS1hh?=
 =?utf-8?B?MEpySkdBSlEvWXZKUURyUGhLaWJIMGFlV1BYQjIvalRPZFZveW54Z3RLazZJ?=
 =?utf-8?B?YnpmU3gyYVJ6eE1neWkxbFNlYUNhRzQ5UnNHdldMVVMzU2VTc1h0dmhpVzJL?=
 =?utf-8?B?VC9mYWlqODlTODRWNGlZMEJubnErMmhjNnJqaHArOHpybE1Td09Nd1FySDZW?=
 =?utf-8?B?Vm5CNXBGV2xHMFNPREJiNmNjbXNScUhEQ2VFQ292Yk0vRHlQZDhpUklObEdJ?=
 =?utf-8?B?VFBvQ3grZWsxQS9ZWWczUmY5TkhVMDQyTjZBOGk2dkg4bTZGbFVuWDllVVV3?=
 =?utf-8?B?c2tNMWZNQUZVUjhmSTQ3UmdFczNVRy9MSzdqWGt0bWp6Mk82UVdtdGw5WmVD?=
 =?utf-8?B?WW9XSjdYZWRoRTlEYWViNjNZbUN4VlNpaWs5amNkSGpzQXRkQVUyOGx4bzJ4?=
 =?utf-8?Q?V+vH1LRYti2O+/emi0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc2f4e8-ace8-42a9-0e39-08dc9b1bdc73
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 04:51:54.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 04:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201452



On 02.07.24 11:15, Marcus Folkesson wrote:
> Hi all,
> 
> 
> On Wed, Jun 19, 2024 at 02:38:51PM +0200, Marcus Folkesson wrote:
>> The image-bootfiles class is used to put all files listed in
>> IMAGE_BOOT_FILES into the root filesystem.
>>
>> IMAGE_BOOT_FILES is used by the bootimg-partition wic plugin to put the
>> files into a boot partition.
>> Be able to list files as "boot files" in e.g. your .conf or image files
>> instead of install those in every recipe is a good thing.
>>
>> It is not always desired to have a separate boot partition for boot
>> files. Sometimes it could be good to have them as a part of the root
>> filesystem.
>>
>> For example, if a double copy strategy is used for update the system,
>> then you probably want to update both the boot files and root filesystem
>> at the same time as there may be dependencies.
>>
>> v2:
>>      - Removed the documentation from the patch series (will be submitted later)
>>      - Break out the parts in bootimg-partition that is used by
>>        image-bootfiles to a common library
>>      - Make the destination directory in root filesystem configurable
>> v3:
>>      - See changelog in patches
>>
>> v4:
>>      - See changelog in patches
>>
>> v5:
>>      - See changelog in patches
>>
>> Marcus Folkesson (2):
>>    bootimg-partition: break out code to a common library.
>>    image-bootfiles.bbclass: new class, copy boot files to root filesystem
>>
>>   meta/classes/image-bootfiles.bbclass          | 41 +++++++++++++
>>   meta/lib/oe/bootfiles.py                      | 57 +++++++++++++++++++
>>   .../wic/plugins/source/bootimg-partition.py   | 39 +------------
>>   3 files changed, 100 insertions(+), 37 deletions(-)
>>   create mode 100644 meta/classes/image-bootfiles.bbclass
>>   create mode 100644 meta/lib/oe/bootfiles.py
>>
>> -- 
>> 2.45.1
>>
> 
> Any more thoughts about these patches?
> 
> Thank you,
> Marcus Folkesson

LGTM

Reviewed-By: Konrad Weihmann <kweihmann@outlook.com>

