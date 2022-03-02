Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60D6C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 19:09:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.89])
 by mx.groups.io with SMTP id smtpd.web12.1740.1646248195510329794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 11:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=eQ+0hP20;
 spf=pass (domain: outlook.com, ip: 40.92.90.89,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVeXEk3NE47mtiqIEg2VnUQuIoMzwx874K8wyxm5pqO3zBmfvy8QHPp59ywA6/kpT0HwyW+cbjDIDDe8XDLW8+TD5LvnoTBT4OLC59PwW/lIVLcYj7OaAGxco6ZzF6qobFVBvYdMeDKI2r8ZKkJS7mA6WjZ4o30VXfnd1ZruoFEPZ/vv2AUxE3VZXPGuV15n8/6xydNBMrSbSc0hZcxazgS5uh1fiWX6wfKetCyVmaV4+sUarehMASr75pLbvP94sDO/UswhJfSGmuuyr3IHKNB/XulNngwOF2pDNXCXS8Vo5o298m5dpkFBqwJvjHoVjGgvMGPRdho0DBbknNHxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptOVnno7VsLZzYP/gykH5hPSRrxpVrd0J20Ba7jM/3U=;
 b=izAo4hhHs5EsBwy8qPGcti066SH/T+79+w39nB1/Ytvcvj5At0po3uxGRHwEejyPeOZBldu0qdw5hbFK5gtXyvnYvp+bsloNiEh0mea6nY7cXAvYZ6s/YVNKyKBZMqbIgEUTUdTPGNIizZHCdQ41yFBFmANnRMGazz19sDvRacElmeGGQPmekZ+xi7+PM3umGtLj2GVNRXqSeXBfkNcZIoUuk7vJphnRib7S6LxWV1nM4F5kS6A9WmERs5faVBjFqmvGUU0m94Wua/YO0LwIXz4jT8BAjkMqFl0Mi3/eEz2PteKvzda/aouefAkGOl2OjFzN0UMD0qtxktvS7UKg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptOVnno7VsLZzYP/gykH5hPSRrxpVrd0J20Ba7jM/3U=;
 b=eQ+0hP20nxvIjnD9Lr1Wda1ihdS58AzyKZ6mACyyHEAIyG0bnxVacTRCCRinWMYTXRuNEG55xQSuhjx9f4JF8T4JlQA8Ev5Sacg//12oDxs+6tShnCTkZ0Jl4T5Zs591nV7mcuwr0CFH994lO61e5ZNX7gnJ6XnYgkddFSEmjs9/GDY1s2xsqErT7Q2/BWbgXGlhSWxXeC4OrmXzQntfVKeX9sI/P01WmCdhI4c+OuKGSufrQYIw47kEtVj6ldsRaG+z8KOLLyP/dAL/yrI81tpBTyVTmBMRIlsioz3XN6EPrkhgb4sZq9bU0SoOJYiPqI7zhwACC1aes7q14EvN4A==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by VI1PR09MB2832.eurprd09.prod.outlook.com (2603:10a6:803:e4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Wed, 2 Mar
 2022 19:09:52 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 19:09:52 +0000
Message-ID: 
 <AM9PR09MB4642FAECF239BE5BB230AB63A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 2 Mar 2022 20:09:50 +0100
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
 <AM9PR09MB4642589C438F3ECB0598A6A0A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1spJpdP13hcDD3KdENAjE_qEDn2gGDCzQxBw+v-ycou53Q@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAMKF1spJpdP13hcDD3KdENAjE_qEDn2gGDCzQxBw+v-ycou53Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [ksNtL5usPoycsin/nj67VxrNoOCeVUmg/HUuTKz4qo+vllj2uIrvS1H9RA3kcKVW]
X-ClientProxiedBy: AM6PR10CA0003.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <eb144ef3-2e81-2727-80c1-e3e21b616cd9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 458f9953-ded8-4989-ac02-08d9fc803a92
X-MS-TrafficTypeDiagnostic: VI1PR09MB2832:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k4uJ/j8silai32dss/t62X7zietK5MtA55W/q3JXcR4tpOfJ85PUKi83Esh/aRbsjdWmJItdP2NRpaBukDlo82kN5qJ/8PKQj/QX0Z7bYk6EGy5+Sswkl/itl2ue05EqUHiW/pO4O676TPBrVJolIXsIeNMD7SJ8uS5AtsFrXkQzK3LM5lu+//B6jwYObVpdUe9f8V8Zqe/fSyIsqOz6qe/QAFwRkp6UkSG6xujO2BhHR9vUfCbogUGA3DWfzDpRgIVTJGpZ9ja9Nd63knQ3sY8Kr7GWZnYlPn1QuTpiDNDj+RSZtAoVrfQhOfXCwQ4vZlRH1dpym7471fgr0whc1bNd1jNAVLktAihK95UwIQvTyl6C0WPLFMR8q091vWtCEJ9RewTzbAX9RxzH0UDaJhikAxBLQ0UeSxUBs/J9mIiQz20sIQkvm9o/GPwjkOrBN3+Gw29kvpa+h4zTtxXpfA6GBZLqWPZ9JYNjqg/3+o5wwOdvdC9uadIyUTK5ZPxW8mgfpD3I81HjBS0W3Rd2jMWHX9/7Ww8K/KELjF8C+cb81yB+XFkQvSD7Q512e6ModaMTRK3LeQoqx+RncP7ekcjnonzUjmy2JOINN69MUJJYqE7OalmiVUEI10IQB1pg5a0eeM19KT3Iu1Brn2Erow==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDNVcndiRlJZZ2g4Z2R0VS9panMvOFZZc3U2YTVubDk3MEJuZFRxN0N5dFU3?=
 =?utf-8?B?akR3aUdxL2QxVmJvZHpIMkZxL1h5enBWVExrN3dseTc2YzF2emU0TGY2YXdD?=
 =?utf-8?B?b0twa3NBRTEyZ2R3MzMrN2Q3YnNiUUpackpaTzY1VTY5WXZQalhucjdBZVpV?=
 =?utf-8?B?SE9aSGp2UWNxenloZUt3aDVTNk1rdDIyaG5IQ3piNGV1aUY1NnJMWHVPOEF2?=
 =?utf-8?B?VVB1QytCb3BIT250djIzT2NWREpFYjQ5VWtIaStLY2U0K0V5eEo1NjZSb0lj?=
 =?utf-8?B?MDNRQ0xlRU0zdWMrVkRnOGdpU1NDWS8rN2lsT0JheXhUdmV2MjhGRHpxUlJS?=
 =?utf-8?B?WVdwUkNwYzZBVHFCOUxLTFhvK1ZibmdWSW40aGVGRllyUllJQk10azhQMXdm?=
 =?utf-8?B?OXhvUDZ3SDBjL01HeWhIa05KVE1ZdnREMThpNGUvZldnZ2N3OG8rcFBucUc0?=
 =?utf-8?B?clpEOTVBVkhMMS9yNE1kdU1SbXZqZlZONkYyK2x6ZXBpd0FuVmNSSG9qbFFK?=
 =?utf-8?B?WDF2VmY0U2dKR2RSM1g4NVVNZVJvbFNldEorajZwenE5YzFwN1RONG8yT21r?=
 =?utf-8?B?cHZWS1pCY21iN1RaZ1pER1pOZzZydktUK1Z1NisrOTVhTDJWVkE2YmdlRWtr?=
 =?utf-8?B?b2tudWhqYVFUeGIrazVPZ0xmR1UrYkQ2ZS81VExDNitUUTFNQzh4WjlPdEZy?=
 =?utf-8?B?MDhTWjdnMXV6a3FhaDNtZXNmdVNuSG9rZmF4ekVFbDVybjB2Z0dKY2I1M294?=
 =?utf-8?B?RGVVblIxSGQ5WjJSTmk1VWhKM29yNjhVQURzdjRmc0IrK1Axd2hJM0lVYXpC?=
 =?utf-8?B?S1pYWmxsRWRFNXgwVnJ3Y1BXbXlHTkpMQTJaNjJNS0cycVRyZTBUNHFiZFZv?=
 =?utf-8?B?bGROLzZVTkY0RFNLRUVFckY2NXAzcStSSExXYWsreUFXTTV6N3MxUkdxZytD?=
 =?utf-8?B?NGRka21XRjREWEtoSmdtaVZlL2xIdFhTSGZ5NUVLYkc0OUNoZEVVTjFFOThv?=
 =?utf-8?B?RW5qanlKMU1SRDFlcTlRZVRrNzNhQXpFS21kZjk0MDVRLzVMYWFsVVZPdHJ4?=
 =?utf-8?B?dTVmdWt2Y2tWSUFqczd0RUJsRm91dkZaU1kyWEZrb3c4b1JsZURTUTVQVmkr?=
 =?utf-8?B?alNhNXRKU2FZakpFUXphSnJOYUlGbEYzcnJhaTVxcnl1Y0NtMDdUdGo3WnhS?=
 =?utf-8?B?MWpnWndHbklBY1hoaGliZjB6bGtIOGhWLzc4ZEhTOUY3S1lmL2RUWHI2MWtW?=
 =?utf-8?B?MjFESE1ySE1SSzVHak5weThWbTRicUhhSUFrWk9jRGt6U25UNnh2L1FaZ1dJ?=
 =?utf-8?B?T0pMVVBxdXJFVFBVWE1PeHkxVTdQMUpVN0J5TFVsWGNCZWd2YlZSdzNsWHhI?=
 =?utf-8?B?N3UvTFViRzQ2L1E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 458f9953-ded8-4989-ac02-08d9fc803a92
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 19:09:52.0527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB2832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 19:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162623



On 02.03.22 20:04, Khem Raj wrote:
> On Wed, Mar 2, 2022 at 11:01 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>>
>>
>> On 02.03.22 19:45, Khem Raj wrote:
>>> v4 is definitely better than v3, I see one case it could address as well e.g.
>>>
>>> python3-pymetno produces PyMetno-0.9.0-py3-none-any.whl, so if
>>> guessing code could address the case-sensitive piece here would be
>>> good.
>>
>> I'm torn on this one, I agree that it would really nice to have in terms
>> of a seamless transition, but it would require either some bash/shell
>> hacks to disable case sensitive filename globs or some "after compile"
>> renaming - I'm not sure how to tackle this.
>> If everyone else agrees I would vote for "after compile" renaming to a
>> fully lower case filename - any thoughts?
>>
> 
> I think the suggestion that Ross has is a good one to install the wheel file
> intentionally to a known location using --dist-dir and then use a more
> relaxed regexp to package it.

As I mentioned in the v4 patch dist-dir doesn't work for me - somehow it 
isn't respected by most of the python modules.
So my idea would be it remain on default "dist" directory, but run 
something line rename 'y/A-Z/a-z/' ${PYPA_WHEEL} after compile - also 
minding that in PIP_INSTALL_PACKAGE.

I'm happy to see dist-dir/bdist-dir work, but so far I failed to see any 
successful run on my setup (Ubuntu 20.04 btw)

> 
>>>
>>> On Wed, Mar 2, 2022 at 1:21 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>>>>
>>>> v4 is out.
>>>> I tried to make it work with the dist-dir/bdist-dir option, but
>>>> apparently this isn't respected by setuptools in all of the tested recipes.
>>>> That's why I went with applying cleandirs on
>>>> ${SETUPTOOLS_SETUP_PATH}/dist, that should do the trick as well.
>>>>
>>>> v4 is tested against all core python recipes, all the python recipes in
>>>> my layers and a reasonable subset from meta-oe
>>>>
>>>> On 02.03.22 09:06, Konrad Weihmann wrote:
>>>>> My bad - one of the brackets in the name guessing slipped...
>>>>> Will send a v4 soon
>>>>>
>>>>> On 02.03.22 06:20, Khem Raj wrote:
>>>>>> this is causing 100+ packages to fail see
>>>>>>
>>>>>> https://errors.yoctoproject.org/Errors/Build/142116/
>>>>>>
>>>>>> I suggest to include meta-python for wider testing of such changes.
>>>>>>
>>>>>> On Tue, Mar 1, 2022 at 12:14 PM Ross Burton <ross@burtonini.com> wrote:
>>>>>>>
>>>>>>> On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>>> where the wheel file is called
>>>>>>>> pytest_runner-5.3.1-py3-none-any.whl
>>>>>>>
>>>>>>> I'm thinking we should tell pip to install the wheels to a directory
>>>>>>> we control and then just install *.whl.
>>>>>>>
>>>>>>> IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
>>>>>>> it's clean on builds.
>>>>>>>
>>>>>>> Ross
>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#162595): https://lists.openembedded.org/g/openembedded-core/message/162595
>>>>> Mute This Topic: https://lists.openembedded.org/mt/89472354/3647476
>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>

