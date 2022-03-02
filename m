Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F697C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 09:21:56 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.97])
 by mx.groups.io with SMTP id smtpd.web10.5546.1646212914765559382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 01:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=bX3Wnr93;
 spf=pass (domain: outlook.com, ip: 40.92.73.97,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQeHof+qeRNJaM+4H2RuE2Mhrn7MwudwHPJWlmqXSQkpoBZIw7ta/QqgLcIPPj59Rtdc63HJqwrhD9yHorQcyza42/iPSIEXa0PJYUITgOB3ciDRb9xf+TpakwqLSFTSKBJi5WVptIYLJhs1pEcetrgfoam0EzXVEr6X9wgZFgT3KXwiv3PsfPn11Ded/IkTq+ni9yyWcHbQcmtCb+ZwO1NwaYFrh86TvcBwVVB3QDzWh9BBoDGT8ASfLfCHXDek9izvOHVxv2JazrtP2pGfOcTLML/jAP0e2rozykYMeuz1Ki3BeloqZijn4ESSiFV7MVyzbXojRDYqBLZhewx/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwDv3HTWQmvdZDCEDR04WTsFdWsNRqo2Od+Px6w82fU=;
 b=D1DW7ylXSeC7BtcOlkVbDu/iOBiSAjxlIdihe5JnaWXWGWLHzwO06jXdZoeGoc8x2LN11xdNXHPx4CY4jobPQzq6Wgf31v/v06bmSdx+cO4DHdHlgOSTVYjemeW22ZOIhki5yf9l6LaQKqh8qO/UxFjgw8lAwLo2Mtbsf+aHK8NS58/MI+O5fJm7WyFKmwa34X5D8XeHtTpwtl/uZKiwZzg6BFnqM5FSvml4/lc5lA4uWqKqLASNRz/T/XuB0KTZIDTEIV3aI064H1tHLs4zkbzIfBJciAaWExydgbbxozC7dn8r4KfR1RGYf5btYzopxhLSmli8y7OMctNCJ0ip7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwDv3HTWQmvdZDCEDR04WTsFdWsNRqo2Od+Px6w82fU=;
 b=bX3Wnr93L60ulKmsvTGJNEki1R+vY6HHGyc+ZJdRrem5Oxir2xE9wy9HeRCukJlT9rZLcOjIEKnb/25+6KAmPQvjTuxVgtLpbBwAGe3zzIggOgp5N8pQonZPpp/KrkCZLkeJmaBeLMPBgctlyYvNwmM4Hulm+OlYrNSTTLwxxG1FFRfxoGjnKqppO4toPAebhYcMW03W31E5cEYVBbT/QT42woWcuM8phLDQxEt2c/cwbPEPnFsib/o+iqoXSivxkY+xBfJ6JUk5cF9AS9I4Q//SOpj+lsb+nj+8PhQ2ta/rE8AZhE/jIF2i17NK49ks7OC0T5w2iRtWs3BlJD4jzg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2401.eurprd09.prod.outlook.com (2603:10a6:208:e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Wed, 2 Mar
 2022 09:21:52 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 09:21:51 +0000
Message-ID: 
 <AM9PR09MB4642BEA4F3119E5652ACD6E7A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 2 Mar 2022 10:21:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: Tim Orling <ticotimo@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
 <CAMKF1spreuzybUvdA-2o_J6Q4pFoFdSQMrc3LN89DWOs0BW7zA@mail.gmail.com>
 <16D881D0D78DCA29.25756@lists.openembedded.org>
In-Reply-To: <16D881D0D78DCA29.25756@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [S5ec2o9yBUVMrR8jvcMqm2C3SUZLutqCJmOPS/Hu6or9YAGwYXETDo2J0z1ACTS5]
X-ClientProxiedBy: AM6P195CA0088.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::29) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <a8c79765-f97b-ac9a-ccc6-5660894e8fd9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 823586c8-48b5-47e6-f469-08d9fc2e1607
X-MS-TrafficTypeDiagnostic: AM0PR09MB2401:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tg6TuFBDB8URrhutLUdanK04YcYsyld/QLSDJ+HMAKHTIr536EBW8axr+KMpp/tmvQ1ugpHS1zQmTSIFImVl0wVbS7eaAVkxP49fsHe6KR9RwNcjqnCpAof+qrDLNqEbx0ZBu+dAvNCMyCcrrnptngZCrSUL06dqcOWUrCTFqMJJNsRitXGuTm8iRaEmkAFY1GL1DWEchEwOR9aTbb6gWU4CTBzjvtesNwzvUF+rnFRZ2N3dcaU7x68czi8qWrIVAb9wkWi0gOBAUqgY9lAZAZFJg0HPYnhsC3m7XK01M/FzYLi1u+OfAbO4fYMguQjNhoJyF2R4hdrsBQY8GvJ1Gw8ui7xbSbV6u63ZvLYrEZUJ43vHv1KNxJ5kfwUlv+mhkyD9Jl5haZphERZl/CHcB+NIVZPoQGS4JzSun6yfn07Am6WADuVASoh8g7i5ldRdfVVWlF03P29qDUqxdBxMomV94Taey5XIcFhmeOlMlLWLTt0T3RT5HGaQ6aDUz27deLHPqM9coTz7LazX2MTr4shrAdov0obipT+W7ZgJhzGYuHpwzO1aU8eyNl4SjfVKk30/tVMpd73iOPHV3VfdM+ha6JnaJ2x5ytK72OIy79VUp0k+4opT+j5esVeFtG7ZgoFIqKRFInBJQTyFcYIZNPyPV9rDGA+T7Vy0IJ7wsoE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0RWdVZUTjdqeW9sQXFYQWlPQzRvSUtJZlF1VlFDb1pocUtvK0FYTmRCekEv?=
 =?utf-8?B?ZlVpODhmQzJLa2FGNEpBVnBWNG4wbk1EMWpHdStGNy9SWi9JWGhoc2ZyZjcy?=
 =?utf-8?B?clJKeFlDNjBXVFZoUmlQOGdPdXlhTzFXSnpEck80SWlScnU4WWpwSWFWWUpJ?=
 =?utf-8?B?eUh6R3J3NlJhOEIrc3RmUzE5U0FrYmsrWWI3NC9yRlJjSXliYlB0ZXMyaTFI?=
 =?utf-8?B?REVJam9rd3pqOWpWcTVpekd1OEhMTi9KamNQcjlMblcwdklrUDFDN1prYmdN?=
 =?utf-8?B?Z3FKZUR5RHdMR2ZFS3hFOGRVajFpNkNLaDlvS0V0TVZJSlJiWFR6MVZDMnk5?=
 =?utf-8?B?aEk0TEt3T3NQbnJqdFJxbU5VcG5LOTdpMEFodFlMWXYvMG40bWtpVWxIcFI4?=
 =?utf-8?B?ZzBxODhNZU1QNWxDTFBETHJRWHNKSlUzUTA4TXJ4YWNwNGx3ci9UaTZBK2hm?=
 =?utf-8?B?cURKNEI3WmozdGlTcm1WM24zMDh6TTFkcmcyN2tSYkF2U203aG1Jd0FpclpC?=
 =?utf-8?B?ZnhTdHZTQTZ5V0VHMEFkODNQeXVOY2g1SHhmUmZrd09oUjBkUkxUNGJLektz?=
 =?utf-8?B?VHZVYk5wSFVnSndFK0JXU3htM2FkL2xXSmc4TmJlbjdtdjgxNmpyZHhZL2Y2?=
 =?utf-8?B?NS9PQTB3ZWxwK3YwOGNoek9rTFVIZlc4OEZDenVVK0hWbEJCWi9WVnlUaGJE?=
 =?utf-8?B?WkVmVnlPME9xdWlRWGFPMGtaT1M2UWR3OWVmYjRZT1ZzeGI2bEdWcUJXRmNh?=
 =?utf-8?B?dCsxOEZaV0YxR1kxeDhlQWZZSGNFOWlNQTM1Um9ldTlRcHdLOUFYMkd2bjh0?=
 =?utf-8?B?d0t4NGV0WmpsVWRZbFY3M01rcEdQdHZWaXNkZUhGOEVVbjlrVmpTQ3A5RUZR?=
 =?utf-8?B?WlRrQjZPVjdqZlVxU1V2My9lenZwZkdPYmE5MGpFVmNrMWlmcUc4b09hTTJR?=
 =?utf-8?B?RnQySzI0YWJwWEF1UVI3OXA4N2RpY0l6b00vQTZoV1hZeHdCemg4MUFRejNZ?=
 =?utf-8?B?NHgwWFc2QWc0azFYK0ZMMFJCTi96SGZYMWVDaFRCUHBXWEwxQ0NkNnVQd2R2?=
 =?utf-8?B?OFh6b3h5WXpkL1lzcGJuY2VjWlR1a0FMR2ZmSnA5RlltUjZ6YjN3anF1cEd2?=
 =?utf-8?B?TDJ3cElwZVJlQmxLSzA1SkRjNkRJZWE1RzI0UmZnODZaVlg4dUk2bWRzejFp?=
 =?utf-8?B?b25kYlhMd1JKSG5GTUxQbm5IanJiaTk2dDdaMXhPRmN6T0g0MlRXOHUxQ3k0?=
 =?utf-8?B?cVMzaHFsVFRrQkc0MjNmSWx0d0VWc3RtMkRrTm1VVXRTaktXZ045VHdTN3gy?=
 =?utf-8?B?VDg2eUZTdGtPVm5RQWJZUFZYL3JvZnNnSExzaHZhQy9vNWxyK1E4alE2aUJm?=
 =?utf-8?B?Qm9IQnRrVGxiYmc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 823586c8-48b5-47e6-f469-08d9fc2e1607
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 09:21:51.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2401
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 09:21:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162601

v4 is out.
I tried to make it work with the dist-dir/bdist-dir option, but 
apparently this isn't respected by setuptools in all of the tested recipes.
That's why I went with applying cleandirs on 
${SETUPTOOLS_SETUP_PATH}/dist, that should do the trick as well.

v4 is tested against all core python recipes, all the python recipes in 
my layers and a reasonable subset from meta-oe

On 02.03.22 09:06, Konrad Weihmann wrote:
> My bad - one of the brackets in the name guessing slipped...
> Will send a v4 soon
> 
> On 02.03.22 06:20, Khem Raj wrote:
>> this is causing 100+ packages to fail see
>>
>> https://errors.yoctoproject.org/Errors/Build/142116/
>>
>> I suggest to include meta-python for wider testing of such changes.
>>
>> On Tue, Mar 1, 2022 at 12:14 PM Ross Burton <ross@burtonini.com> wrote:
>>>
>>> On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
>>>> where the wheel file is called
>>>> pytest_runner-5.3.1-py3-none-any.whl
>>>
>>> I'm thinking we should tell pip to install the wheels to a directory
>>> we control and then just install *.whl.
>>>
>>> IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
>>> it's clean on builds.
>>>
>>> Ross
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162595): https://lists.openembedded.org/g/openembedded-core/message/162595
> Mute This Topic: https://lists.openembedded.org/mt/89472354/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

