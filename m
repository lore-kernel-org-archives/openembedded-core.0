Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40835C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 19:01:54 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.41])
 by mx.groups.io with SMTP id smtpd.web10.1585.1646247712897357818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 11:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=jjZ7VpFv;
 spf=pass (domain: outlook.com, ip: 40.92.70.41,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMBTbNaFYu2BWko+gDUwbyNmLCWIiq35Sp7rTtUxBIbQK38xgFFOAatqA+Vi6sPRN345Jy5qWqeAWM+QEGLboCfBmRkbeT9yuPcilinV3xzE+RJ0WBpjhOG4h4eR7lrHTLtNeS/uwkX358kPbeT86bGfCg3nzFux1AGepO9t/BO6bH20xcS+khxGpCsFlhDxyr1N2M8S2jUalocpA8INIFwUMK8KFlPFJwNnYA5scP5FckWfCGmae6Qa4FA6N6LxgkBzaaSWFq7cXqXh+q/Wkmf4mNTTRI8776zkVemr/ObKSIi+P8Hxp2nEUERQijKJkq3gPhjf3eD5OW3010Zx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Amkdc1iuBqGFOMUPQaZK1p4el9PXqiNG4xLRGFiCgs=;
 b=fYVB2ZBFH1uaY23vgvtB9OTmVq20mbgol3Vx+jz+KkmC5l57rX4fPQMUgNR2BTAEU9KWz+lLeolAWqnVsRr0PdXBIMCwK13amGyOV/yX5nSwaR8HBvFsx0PCVbD61K7Z12uQzIr58jPnlf7ys8SktXc+E+kbE0vjcH4dzrp7M/tE2uTsE5U+QzArGdcWQqUI8Dvzk1J8f/Eq5rWiLyVeJCjlJJE6zFz2gB+LmHYyi9tHXng9DXxOVSczv8hbyPhzA2pdggxw7Uez+ls5AbQtU2ocFCE4Ugt3VNtaBo6Py4XWmbAGsj5z6MUgcHByI1o7hig8NsB8gupAmXi/2+MbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Amkdc1iuBqGFOMUPQaZK1p4el9PXqiNG4xLRGFiCgs=;
 b=jjZ7VpFvAw6kP7fyJkdndKh1akR8g65LYgBJx9Nz+mMwO7zjRFwBY0lT3d0PmYOVUrjGBbBUMTwpfo3wY4hlKKZOY5DbhbWf6ISQycjNN4WtQmV3heU3UdMUFVd/Ai1/xyATgPFuJ1sYglZ+1enRSTf9aOsCj823CQIUQsF1pnnskF9000JBg0wZzfwmndlE2o4rs4LAd3UVXgpCPeuzVaOrGKKkjuAnZfBv1CvNm3jL6+KV6qnoXKEU+hfe0nRdpl/Ckg2UceJLGJ1drPOm7jbnwlvteXB/KldUSxXw91BXtPvbNFaY1DdEqVQLuLcUDVUpxOI0qtyNFHCD/nlixA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AS8PR09MB5221.eurprd09.prod.outlook.com (2603:10a6:20b:358::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 19:01:50 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 19:01:50 +0000
Message-ID: 
 <AM9PR09MB4642589C438F3ECB0598A6A0A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 2 Mar 2022 20:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, Tim Orling <ticotimo@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
 <CAMKF1spreuzybUvdA-2o_J6Q4pFoFdSQMrc3LN89DWOs0BW7zA@mail.gmail.com>
 <16D881D0D78DCA29.25756@lists.openembedded.org>
 <AM9PR09MB4642BEA4F3119E5652ACD6E7A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1srTWtYeSO-0vcJ5=RM0xz+5BOoRse-vbyDqSJ6kk-MYqw@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAMKF1srTWtYeSO-0vcJ5=RM0xz+5BOoRse-vbyDqSJ6kk-MYqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [ZIRfJ+HhUltNOmEXMn6/TcZnl3fYK6Fll4juidriBoHVIa/q75vZ8vMe4mUWNVGz]
X-ClientProxiedBy: AM6PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f34cde12-af35-9bc5-acf6-c14f55b9bf6d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d94b08d-7630-4270-e559-08d9fc7f1af4
X-MS-TrafficTypeDiagnostic: AS8PR09MB5221:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5MWuX7BzxOw8qfmTS3nw8ovD0CJkzz0h/dndVmTCz61NVMB0If9k/Bpn8xRrCzVmO5XIvx4NVqrbJZ2c6EW7SLoJJTrARaZpWtsBzCXwNQXr0SJvoIDbcrfJb5b2I8YSaKKtit7XEOt+VprelbKFcOrN8zOmckkZ8S7CLCCoyYTun28L9Hd9k95Y6WUuLEU6k8NFcomJPzM//t8ylMM0EBrX3p6aHBR117uo/g0AqEi9Hy5ensKqBIFWwxL7ge5mY4q4UA35UvPQEYymg2HwrEvHSHplMYwuP7pH6oAjDUh5N17/XC04rFqpmVdK6fQCGBd5yg5AdSYNiK/xHOimD1r+bqTfHdQyAwGTOWdbHGvnf2TtQugBSJHU5dTZ20lnwTQTPA8Cyyoo7mkYA3WFaZ/Gqpqs/xayJGlywFHF4fyZnIH3el8cAFiyT4KwCzoaNM4/4Pskv/RHECs6TYvLLK+CduUuAs4xa48b30NnTzc87Rg4L5baCTI7dMcQqKls00C5zN2tA4EXQ2KTI12yy1IQMMnT29+msyHdqTwv5jHr/XByn/t1/f3ZPuHPcL5EsE9V/A/19wsqxExe2FvTCt6S4R3jpkzDjOoZqNkS4N8Uc0B/OFkXE2WIwMPxnQIArVaq2n67IoU+RYfoUr0nbA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTRMNDhBUk5mazJ6aHI5MUxvUVIzUXFGQjA4UVNTOHZCRW1ZK0hZaVFEcTJz?=
 =?utf-8?B?MXduQWhEZHh1a1J0bnY0bFNFMWlqL3Y0T1Z4d1NibXlBTGVMR2MxUnBSUlNt?=
 =?utf-8?B?cWFrcXBKVi90SndINmF2MHhWS204TFJTOVRHbS9uZDhRT2M4d2tOM2VJQ1dm?=
 =?utf-8?B?blFZMFFVOHpVbExoaXU3bkJkOFJzdS9lZ0praHFiR0hCazFNcnZwUVAyL2xm?=
 =?utf-8?B?Q3B1eU5HWkVleDdKZmJHaTdkNXZDSWNTL3FrTWU5d0MzZnQ3Uzh2MVFENUxY?=
 =?utf-8?B?QzY1K1Q3MGtpWTZ5cjVLTjFSelV4czNBOWg0eTNHM1pRaEZLWWl2OVlXeUd5?=
 =?utf-8?B?VG5KbGt1b0hhak9sTVAzV1hUME92QVlsWmh3eko4UVhvWWxLaExDWXpMR0Vt?=
 =?utf-8?B?cWFCUU1Ba0Y2L1NQdjNZVlJnT0RhNXM2UUg1eEEreURCY291U3pKYzM3bm5B?=
 =?utf-8?B?WTFRbXR0QVFIQXFZVERmQ0lBRlU2aWFuSW44Q2lrUXYwWjNMcHg0cjJQLzFY?=
 =?utf-8?B?cy81dzQrUDZ1R0tWY1JxSUxQcDdpZEpBTHdtMG00UnFHWUFCZnFSWU5BSVZS?=
 =?utf-8?B?blIzSnkrN0pkWDN1WC9JU28yRjlhellMT1Q2bGlOOUliZDJpV1gwU0Z5NkxQ?=
 =?utf-8?B?ajhXRU55ZkJrQ3haRFRJVDhqUDVHaTRDcUZyaXVSZmdGeFoyRFNsTU9RZjUv?=
 =?utf-8?B?bUZuY093M2ZPYWNBSE14RTRzT091RkVHeTZqQ1BSVHU5bFZtNWF6S2NmdlRx?=
 =?utf-8?B?eEJEb3BwM283eU5JSVQvaWRRZU5oaFhxZy85RnA4K0lEWjN3TkdETVJ0Y1FB?=
 =?utf-8?B?cTV3Y2R0aG96TUU3aGgvdXc5TmN3WkNQeTIzUHFiWjYrd0ZBREh5eC9Ua0ZB?=
 =?utf-8?B?L2d1SkVId2s4SDVPTitiS25wTkhuWjZPZExrT2pIZFU3QUp6bm16SllFWkhI?=
 =?utf-8?B?QVRkVUJGOWFPSlBidzhOL1NXRVZqWWxPem1QM0Nnam9RbUExUlkzMTE2em53?=
 =?utf-8?B?bDRlckRaNlByRU1ZMllLYmFmUGEwNytaRXgxZzdBVXg1WGQ1Q2xnaldLY1l5?=
 =?utf-8?B?eXFQMVlDcUxlRWIrU1djYWRQOENLdEFOYUxFUzE3MGZGVDZWcjJ1M09XWlRk?=
 =?utf-8?B?YldQY1VjeFhoZUx6VkVvY3NRZUNtVC9yYklSS2x0RGVKcGg3Y2ZSamgyY3R5?=
 =?utf-8?B?OEdHNWRkMDFSc053NXRMNkkwM0IwWmRKNlAvcHZXQlkyZlFnOUxQdFZHNXN1?=
 =?utf-8?B?aUdmeHNxMCszd0RCd3hCaW5qNnllTmRlQmxwTUZvUzBiQzE3NzN4OG9ZUUN2?=
 =?utf-8?B?OHB4VVVoL0tJeFNPbVdYTnBlQTlCOGxhQkJXYm1DeFFhU2dWWTA4LzBCUVR3?=
 =?utf-8?B?WkFrbWFNZERhOFE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d94b08d-7630-4270-e559-08d9fc7f1af4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 19:01:50.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 19:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162620



On 02.03.22 19:45, Khem Raj wrote:
> v4 is definitely better than v3, I see one case it could address as well e.g.
> 
> python3-pymetno produces PyMetno-0.9.0-py3-none-any.whl, so if
> guessing code could address the case-sensitive piece here would be
> good.

I'm torn on this one, I agree that it would really nice to have in terms 
of a seamless transition, but it would require either some bash/shell 
hacks to disable case sensitive filename globs or some "after compile" 
renaming - I'm not sure how to tackle this.
If everyone else agrees I would vote for "after compile" renaming to a 
fully lower case filename - any thoughts?

> 
> On Wed, Mar 2, 2022 at 1:21 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>> v4 is out.
>> I tried to make it work with the dist-dir/bdist-dir option, but
>> apparently this isn't respected by setuptools in all of the tested recipes.
>> That's why I went with applying cleandirs on
>> ${SETUPTOOLS_SETUP_PATH}/dist, that should do the trick as well.
>>
>> v4 is tested against all core python recipes, all the python recipes in
>> my layers and a reasonable subset from meta-oe
>>
>> On 02.03.22 09:06, Konrad Weihmann wrote:
>>> My bad - one of the brackets in the name guessing slipped...
>>> Will send a v4 soon
>>>
>>> On 02.03.22 06:20, Khem Raj wrote:
>>>> this is causing 100+ packages to fail see
>>>>
>>>> https://errors.yoctoproject.org/Errors/Build/142116/
>>>>
>>>> I suggest to include meta-python for wider testing of such changes.
>>>>
>>>> On Tue, Mar 1, 2022 at 12:14 PM Ross Burton <ross@burtonini.com> wrote:
>>>>>
>>>>> On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>> where the wheel file is called
>>>>>> pytest_runner-5.3.1-py3-none-any.whl
>>>>>
>>>>> I'm thinking we should tell pip to install the wheels to a directory
>>>>> we control and then just install *.whl.
>>>>>
>>>>> IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
>>>>> it's clean on builds.
>>>>>
>>>>> Ross
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#162595): https://lists.openembedded.org/g/openembedded-core/message/162595
>>> Mute This Topic: https://lists.openembedded.org/mt/89472354/3647476
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

