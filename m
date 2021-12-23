Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87054C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 15:01:19 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.107])
 by mx.groups.io with SMTP id smtpd.web08.33555.1640271676978326898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 07:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=sffUWOyl;
 spf=pass (domain: outlook.com, ip: 40.92.67.107,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaSTeLU6lBL9YFR3xkMqvGpFFjhVJndf5UyAUz7n47iLBxEpH+sKswx2BrT8jko4IKIw/94TVF2nkDomMiJqU5D9pF0w9CWqHXxvNZsvbecuPQjSMkzQ5unLRLSvPRpfAV7HFw68sZAaGAHF572r36iYCB4wIthsr/7zOdMD1YBEUhPDoBZ780HaKkHI0//SXUBcxoUtA48m0BtDyK1aF0y1ENaWGCpfBQwzLy+DjBJ/E1gQ0VJgPnbpl25nYqhqyb8VBlGOzPdwMUA+Hik/sgRJpQDpkW0PLWYkWNIWoFlITCg5exX4YGImZg9R5JAg40FN8FMXeTrdc68pqwrunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GATvsQaEEX/fpkzj6UkJnpkfnT47niD7OionZtNoGfk=;
 b=mBTQdLqU3ZMRIj4iut/XE99e4MhYhp4dTMPD62a9o9JQ42H9tv34gYrhxdf88une8hHFhqZ3QhZJuNG+xl333W/FmMBPJ9bReJMgHFkWbcBoMq2tVrR+7DsSqkpgAP8wIsKXj4y5UnTP5EUHtDzh6nTL6Ix671Pw07y1VGbB/7eSSB15k+Cyu8RJS30g37D7YO8O6N4KAT/9yo0KhJXZVjkWwZmrILzYDlVtZwDnkWmWQmRVA2aKYzrcD0Xgnt+CtzfOkF6fl8C+2Ct7R6eDH+qDI2RYNyv19lKLlpOX32Y/3yntv/3IeOcdANpOSRouIH/0Y5woq519uXsFdPkWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GATvsQaEEX/fpkzj6UkJnpkfnT47niD7OionZtNoGfk=;
 b=sffUWOylZ98LcQEc9HznT8Yi0OFVWG0OwF7IaqIC0981qppRWJ4Gv/2qeSz5UgRy+JWtWdORq5+OhTh1V3EN36/Ay7ixgiEJm4gcGLdgf7NHFY4/fwg4YdQcfTYc7RnS3ciqRYly/X7PWmc5EGZUC8gTEE28LYLdOUaFVP/DIIO+5Fs9OD0z5/zd2eh00Pful1ACQdU8/PjHcBFQ76Wy/dpN4KIAxme7SAPtDHknbGn5+6yrdgoF5D41ptgBHd86IvVIhrQBuZYeIPX2iXzKJJz+8YRe30I6jsah07WRaMzy/USPi8rx2nDj3xrkProt+8FRJKmH8BKOHEakO9hZzw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2772.eurprd09.prod.outlook.com (2603:10a6:208:124::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Thu, 23 Dec
 2021 15:01:15 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 15:01:15 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
 <AM9PR09MB46424FF6EC0BC8DA32B7B66BA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <a468b92caeabf9fc6307ee951e462e4adbd10bbe.camel@linuxfoundation.org>
 <AM9PR09MB4642704AE66377CD0DB6803DA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CALbNGRR365UQ7-sykFb9X1eSOSz=MefZd8t9019RyAnz82CiaA@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642BE7A48D9CC8336C3ADE9A87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 23 Dec 2021 16:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CALbNGRR365UQ7-sykFb9X1eSOSz=MefZd8t9019RyAnz82CiaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [AozEBV6GQesI6iKi0JhCieEhEyByO9vnnYDY2Im9qCrgqeKAgQlG7YUaxZDNvpRe]
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f3d245a5-a9ad-a53c-9449-81ad30009f67@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d872f86-5d72-4cf5-a779-08d9c62510d4
X-MS-TrafficTypeDiagnostic: AM0PR09MB2772:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lGjsxTg/eMcfuQsch1O/3l9cW20EzNumPDojGLlPkaEjerf4i4QE3Y3tZNMX85hEx7/9xIwKJAWP1HJuUtqgpHDuFr7VUu7gp2E7sA0ddj09OPWdlN/Grx2a713DOqqopo5HK5HnthFq/TpIN/xMFgFqJbzDtmCOiXmTBWk4nS1/j1Tx2JEFHbNQlQ9bF/Ha11732Jh/wS647socKjYnjoAZJnAJUzDCwsoMesqLiNmL9oLeGaYgLJMUkRsx9jgt91h1Yf/m2K3RSvPQ7SYOe5Lum2ckNrZIl7qtnRYFbSYPLPUbn8awUaC/IRVwa9xRPvFZsMrj15qlsK7RmDNkJFM3u9Jk0mGWo1WVCwn6qGtXe6wu62B1kfPwwilm4k0GYgPbHXTN9ZAEk+eS/XlJ2r938RDpabKpHfC8gQWnZjrbnRvoThpdHqKGtwhfvX2QYU0QN3tepeBgUDwBQqc6xsX253/U6kDUP9NszVPcZmi+vBck7SwltCoSveoRDBpiI2+NMt8tmmInPd1qgs26HHW3PKLgWi1Ck+3j0JshKtXj5rrNgXcCKllq67fEG7br/od0par5DkZQgi+yHztyDg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G7yYFGUlB25EgRN7gpJIC7BSKv0afwAv3MaOu1yAKm/dhfrkgJBVPpKUFc4N?=
 =?us-ascii?Q?sjjsRx5Ez39JjC0eCjO1rzrzBqUTS5/m1v+FijU4EZhZd4CJY696/KkxlQmb?=
 =?us-ascii?Q?vDJKer1IePaqtryRRmnwxqYfSUOcjWDc8fHxx0UT9//vnXE7cNqy2QiwJdK4?=
 =?us-ascii?Q?W/bewtGq/orQ2CgvMRD22irotnbHA5jGmy/k/kem3rolNhy0FkBicflSH2vN?=
 =?us-ascii?Q?LOqgXY7I2PPSCl8ZoATZtkHcczkGauczH99OV2CWfsLYX19wUFpVqTOk6NGV?=
 =?us-ascii?Q?iufrSLvN0iQra1P4utOjGUYiHvrFHCPW1/KADhLCqsaIpU9Na+INcPtOqXjG?=
 =?us-ascii?Q?fHEHeOv2R0VgWGoq0zcd6EA5HhN3YOuUVPhvUYVbIn80MJsLCjqg8kEZBBAh?=
 =?us-ascii?Q?tVJv1RaNbuEQG36OslXHSARfY/M/CJCO8/FojfT0vR5OXYg0Oy8Qg9GCmegK?=
 =?us-ascii?Q?cwLJmlu7iUIjIhQTpFLn0LNqZEIJpqKcmpngERnDwPLLiqStA0PoqArxZP8y?=
 =?us-ascii?Q?mujwkTPq8BuXTHCwWB4zADDBvBegsliJVO6w5MWu3U8+CE1/6ttaGcJ2PdDR?=
 =?us-ascii?Q?Uk4fzqN1rJdbvpcWzvHfNJ77649NpSwZYW5mftAjom7R4GB9rUp1La+c3tbT?=
 =?us-ascii?Q?F1g3Dz2oTNM9f+5MUQowBbdJyUdcBj3X/BrTE/7yp0Ib5roXDk5k4wHpiJC2?=
 =?us-ascii?Q?MMxHNpMxXaQc4PsHb5My+qG9VLQD4yOgZ2+LMiENyfPGdZ1aSoWUcr1Xm1zm?=
 =?us-ascii?Q?cFi8bUbl01UyJ12ZUxscBLVK23NVq7bGCRia8suF+g979VinqZdmEGldOyvc?=
 =?us-ascii?Q?szhd6cZqDOPdO/+x/G1NBg0XtppPjW6DUldk1bFFKzn+i7GkpCONEPey1Aab?=
 =?us-ascii?Q?OhvII0/59L6q/OVttzeBUyAe3H0nA5QGx9+gokYEys78/tgFraemsF8WLTUh?=
 =?us-ascii?Q?BXx4jhnjLNVsb8jKPiNz8ST2i+uSl5TYRY/POKGyemqC49goHhGberuqTwM0?=
 =?us-ascii?Q?qZGfjaHgL45EcA5Q1pt4vGOk4w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d872f86-5d72-4cf5-a779-08d9c62510d4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 15:01:15.0128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 15:01:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159987

On 23.12.21 15:52, Andreas M=C3=BCller wrote:
> On Thu, Dec 23, 2021 at 2:19 PM Konrad Weihmann <kweihmann@outlook.com> w=
rote:
>>
>>
>>
>> On 23.12.21 14:11, Richard Purdie wrote:
>>> On Thu, 2021-12-23 at 12:31 +0100, Konrad Weihmann wrote:
>>>>
>>>> On 23.12.21 11:49, Peter Kjellerstedt wrote:
>>>>>> -----Original Message-----
>>>>>> From: openembedded-core@lists.openembedded.org <openembedded-core@li=
sts.openembedded.org> On Behalf Of Richard Purdie
>>>>>> Sent: den 23 december 2021 00:21
>>>>>> To: openembedded-core@lists.openembedded.org
>>>>>> Subject: [OE-core] [PATCH] base/patch: Disable network for unpack/pa=
tch/configure/compile/install
>>>>>>
>>>>>> Use the newly added nonetwork task flag to disable network access wh=
ere
>>>>>> possible in unpack/patch/configure/compile/install tasks.
>>>>>>
>>>>>> We can't disable networking in sstate tasks due to sstate downloads =
and
>>>>>> also so we can report hash equivalence to the server.
>>>>>
>>>>> Since no tasks except fetch (and apparently the sstate tasks) are exp=
ected
>>>>> to use the network, wouldn't it make more sense to reverse this flag?=
 I.e.,
>>>>> add do_fetch[network] =3D "1" instead. That way you don't get away wi=
th
>>>>> adding some random task and using the network from it unless you expl=
icitly
>>>>> state that you will.
>>>>
>>>> This is actually a brilliant idea, which would also make it easier to
>>>> control this behavior from a user's perspective
>>>
>>> Part of me wonders if we really do want to make this "easy" for the use=
r :/
>>
>> "easier" may have sounded wrong - what I mean is that it would be then
>> explicit, with no network access being the default.
>>
>> So for instance a simple grep on a new layer could confirm whether a
>> layer needs network access or not - while with the opt-out method of
>> your patch things may be a bit more difficult to check.
>>
>> side note: this could also be put into the check-layer script (as I
>> think the official badge shall just go to layers that do not need
>> network access out of the scope defined by core)
>>
>> And yes I got a ton of additional tasks in the layers I work with and
>> none of these would be affected by the opt-in model.
>>
>> Either way, I really love to see this feature finally happen
>>
> Out of curiosity (will see fallout at least on libreoffice): Why is
> this a feature to love?

Simply said because it makes validation of changes way easier.
In before I had to build a change in a normal environment (w network=20
access) to verify that it actually builds, then populate some mirror and=20
rebuild the same change in an environment without network access.
Now I only will need one run to be sure that it the same recipe will=20
even build in 10yrs from now (assuming that a dl-mirror exists).

>=20
> Andreas
>=20

