Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2624CC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 08:53:44 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.51])
 by mx.groups.io with SMTP id smtpd.web10.21177.1664960020296915434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=bpDuHoaM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.51,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XagDhLsACzzLG2c4XxSY7WnxNzBl5rMvX6AE/ceon9EebBiqG5fboYqMCiapMDedfxqVEfFN3teE8HfPDEA17yzFSS/tD78mMYHUG+W5RQYTgYfpjZtH4Dk3HRHqSGwjWZAr1AUU4dtR7/gVz30Hg6NP6fSJJAJSXvP1DPCeY2X+VVqCim6/nfa3xS0ZGX/4SuGYDgcvjGN4S7emyIzY2D91ki7wRo0VPD0nqqn6DHQbZ7q5X/4I0LbJCJGbnRFtos5ObKFxix3mIVKSjiBMUO/RvPzjixOr7iZnSuYD2q8fl2OyNfW+C7Y+xLKedhJNysmACB73qrSWSLlabH2ORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTq0KsLT14qQhkrHLVSZgn3DrrJtNVbHZvwr0PWtmCI=;
 b=HrcfT0KPsz30Px9ENhduqosxxAnrHNdfopv3dEqSufEwn0jiDoaFKrZpOIzsUj3yua3wV5tT2+YrUVSmsVqUeGQaxDsHzA46DfvHumjJ9XcNnLf5xG/bktiG1m2u2mV66xbyp6IURxZFFP4UI5+Fu3Dgj+NuRcy3ZZwygJvB8sewReORB0iYrw0jw9Lk4el9QbFzIJ95mAM5LOC9UukTVxXBnnlh8DHiY6V9AF79uohxceGzWaa4mCjF6w/pABL4Ia8KSQzZ+/5YPVYkPfL27A+Edmi11UsgsoUTLqk9WpxNx/S4EN5r/Xfoba16il63dMPfoCuCc/M5mkE8KDmpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTq0KsLT14qQhkrHLVSZgn3DrrJtNVbHZvwr0PWtmCI=;
 b=bpDuHoaMyiM+JRoNQeC+ScaD9kVlrGmG3ZDEzbmNn05xu/556/3C2l5Q2zzBf/p7o13UhvsuWWnno6muvtqxnpENC5uZQpL3BOkFO5twHYbto5iD+FUTGYY8XGQq6nAl06yJ69ig120A6C4K5hDurUT6Pv+XqlU8jluBV0XueZMi7EVNYkNvCcs4re7ZFVum9Zmx7v/y2monqdkpiuNurUmw+B/Ky95ZTrRrQjtTkaE/x2NPUQJdZx0Qgcs8jRIQH2gnO9Iw5N8dvA+ekXyWFzGnIUXfW8P9QeKhqTnKSqiop1Pq8dXLnlF1gfhqyiO5FdM0nCTahATETw5mwLohzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS4PR04MB9650.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 08:53:37 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 08:53:37 +0000
Message-ID: <f8cf2e82-9bbe-c90b-5fc2-c2fb5b8f87d6@theobroma-systems.com>
Date: Wed, 5 Oct 2022 10:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH v2 2/5] classes.rst: document
 openssl-native.bbclass
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
References: <20221004152750.978712-1-mikko.rapeli@linaro.org>
 <663d2c74-59ba-032d-88a3-dfe22237136f@theobroma-systems.com>
 <Yz1Dx2rm4AfhsjNo@nuoska>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <Yz1Dx2rm4AfhsjNo@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0802CA0035.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::21) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS4PR04MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: 020bb7a7-e117-4a6e-32cc-08daa6af176f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0FuO6t9Jb8I7IKK+jKTqXAIq4AD8RFcjfxcpT5Wn0xEFfhFIN7JJjxqdRTAcFBqvXGfKva3eZVnv5vpdHOBTdHYi+MROHXCHWvQG8+TeJ8MMCNfIRvsbIfJkp0OmAdM4a83N/WeDo48OxtEwH+tzmsIxHhzmL0q4+5oNlIW42DpchxDpudnG3ee8JRUfBI9XwAmyLwF4NWxLijWCz07wG9ohI2BNEt/k0ILzQIzJMkvGHpmDsCPCDu7Jv/vBKf7GsdU8fBvxLS3PfRu2AFtjGvwbEW+cIF7O/c/6kEiBi893U/jv3T7qp0kb+1Qlre7Uis+tLDIMkhzwdEbi92DAthPtcPhvVSLSKZ1jZcMvaetfRkOn6IQoJ4SRdStE2GSCp6N3OrKSP0a4oluZYI+qSaV5wYcBM/bADVrLb3NJ9nMMvQ5d4vFLrcisrWRqMP8AA1Hnt//tr7rnbvBi0OhiSrImn3/v3WJmaPQiMMQHAdlFRyXN/xB9d6hUb8Re59kLXFjxqhRelUahdgSQ1icAs1VZQ/BzdPVVUiVtDq/SvN4Ues2bZNLQttZww5B7ijPbckFTZljYADGwwTImLWHRyPoMN+xP+U1uL3hx196GBQYz9jsc/6+t6aN7QhPh51VwXXeGWNJyZKu8w3rYbun8ji3zAccxyST6WHuPjpDKZNHZmN47jts/CYUfhL/dSvDI09RClQUeIc0GPuwm//dmGwQ47/RZwx3qPl2LPmf2HWvSZvDa/mpMLFCSOe8nX0Z5CV++jflG21tvVK6bvk4KJ0U5W9kwWDlYNr60Vb1l+34=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(396003)(376002)(346002)(366004)(136003)(451199015)(31686004)(66556008)(6506007)(6666004)(66476007)(8676002)(6916009)(66946007)(4326008)(31696002)(86362001)(36756003)(38100700002)(2906002)(186003)(6512007)(6486002)(478600001)(2616005)(316002)(41300700001)(83380400001)(53546011)(5660300002)(44832011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dDZaNHVzc09tQ0JjeW9WWUxvUldEbGhwUDY2eElhT1lvbEY1bU12dWtaTXBW?=
 =?utf-8?B?UXVUM1libzdmLzRKVFdRYUNhaWZaVDJMblJjOEx3RXFyVmI2eHJ6cC9yUE5l?=
 =?utf-8?B?bnk5MlJRdkxxQko4ak1SdzdhNHU2d1J6NVpvUUlzaDFXUmdZd1hPVERQTXBa?=
 =?utf-8?B?RE0xWTloTHJSakllYWYxSlFGLzhtR1lqMUFHdWw1QjB1d1VYRmhNT2JxdXVD?=
 =?utf-8?B?bTlaeVZaUGhQUnZFT1FZTk10M0w3OHJTeWFHZWF3VTlWQjNKaEsxaHdSMFg0?=
 =?utf-8?B?SmtFQUo5eGRvZTZ4cTQ4NVlTditJQUdmYWFmaW5vQ3FzMVozRElyK2o5TUZR?=
 =?utf-8?B?VHVnbHVFdE5NVTA3ejcrbHIzOC9kVCtYSjlwbE43K0tER2dHS1lsNklEalVT?=
 =?utf-8?B?OXJCdGwzTVFRbVVheTB2eTBOZzMreWFMNDF1d3JFRzBwUVZKNWtlN0Vvendk?=
 =?utf-8?B?a21ia0N6YmRWY0hnSXpVTUhQclBnS0lzRGFkNitjV3drKzgyUjVWK2RuRmdJ?=
 =?utf-8?B?c1RpVU4yOUp0VXFnTWdNM2RrN3dSYk1DTFlBYmdZMkI4R0lKZnVWbUx2a2JD?=
 =?utf-8?B?OEJyemF2VWxMZXkvZktMVCtScHdKZnBJU3Y3NDVNbkNTU0k3a2lpMUoxNkZJ?=
 =?utf-8?B?cEwvUmZBMDFYVlJ1NDV2aVppSUdiSi9CNy9SNWRibmNpMUphWDByVlpNY3hm?=
 =?utf-8?B?T1pmNTZmck5HWS9ZeHpvN3VFOGpRQVZnQ3gxbzQ3T3JIQWpVckgyVWthdG5n?=
 =?utf-8?B?N1VsMGhKd2ptVjUxckVIUzVsT2U4RUYxRk0va2EzSHpuWHN4Zkhkc09jdGVD?=
 =?utf-8?B?eGVLTENoWnVkcUIzU2NMVkVTaDBwZEsweTNMNEt2dGxWOWRTT0lYT1ZXRURu?=
 =?utf-8?B?KzdmKzQ5TFZzVit5OFNDSnRKK3FyWTZNaU9wNjVGK0tla2hyUk12YmkwU3lj?=
 =?utf-8?B?YWREcGhmb3hBZ1I3ZDJnclVMcGduQ0duaG9Sb1o4c1JtT1o5bWtsZ1NINHp6?=
 =?utf-8?B?TW13WjRheUJhR3NqZ25wQXl4MWJRaXI3NVJIbTErYWJCdlQyWmJ4SGVaSDVu?=
 =?utf-8?B?NnlMNGlDMXkzcEdCZzVzQnVBbWh4a2x0OHVFdkg0UTY0cWlTMzNIc2hydkRs?=
 =?utf-8?B?ckttUlRuNFRQYXJvVHprNHdsU2N0K0ZBNFFaQjZvaUFvanpYbkIrZEpONTV2?=
 =?utf-8?B?THBjRzErbkNmQmxGbzBCdmpRMjZ4STFSNGF3aUNBVXV3TzR0ZVowMEtGY0Vn?=
 =?utf-8?B?OVRQQVJPWGVzS2J6a2JWUTBXOXBNcm1sRkp4SVY4Smt0czd5MFV0WTNNRDd1?=
 =?utf-8?B?UHBYM0owNkMraUhYeWhJYzg2ZTcxekMyYjlNTDVScU51dnR2TVY4U2ZVdzV2?=
 =?utf-8?B?UnR2cnpSN1hnUzFTWlljWW1nNTdtSjNZeGVSV2FHMVV1NGt4cFM4ZmlQYW9w?=
 =?utf-8?B?bmdOQk13OE9LV1RBNVI0Zzl1TnQwcmpjeTlVazNnU0JxNkVCSEszYmpXUys2?=
 =?utf-8?B?VVdOZWVwMlcrRjRIcUh4M0VTcFgwcVFFSFE1MjRMRFdSRXFNeVJ5ZGtaaXlv?=
 =?utf-8?B?TzE0a3JYK3NaejVOdlhYYlBkWFVGVlZaZDNQTVE2MDJ1RHlqSi9pUGJKMHNL?=
 =?utf-8?B?eU8rbEVpdWgzNDhVak5Tbk0zV2NiMW56OU1OZzlNTldXY0w4dEZuNmRMYm84?=
 =?utf-8?B?ckprS24zdVpMc2FMRnNXN2FKZzhvbVZFTTIwdUxzNHJGcm1ZOXhLc0tqZG9F?=
 =?utf-8?B?cWRWYnp6djFrWHUwdWlFc0JEK3ZHTlF4Sm1oZ3cya2trclRveVhUVUZ6b3Y1?=
 =?utf-8?B?bG1TK20yY2lBV2JEb1YvTW0vUnBqUmxXQ25SVnNMQ3lVUU0rM3BTSjhrU2Y3?=
 =?utf-8?B?UVlOSlVKMTByS1NMdzgxUmx4ajZ1d3FSLzV2SlYvaDRBV09TUUZNblRyMEZG?=
 =?utf-8?B?eGc1amRVc0lmTHcrdVVvK3EyYjh5MFpPcTlsR1lFcWk4cWh6bFNJcy8zMWNG?=
 =?utf-8?B?eHU4M3ViU3J0OENlNUsveE1VV3JFUEJ3bERQdkxuTGhEaWJYMUd4QjBoeXZt?=
 =?utf-8?B?aWdCUElVL1pXRGMyL0JWNlFpcFp3c1JlcUVGV0RGd1F5cXFGaTlMdDNOSkJ3?=
 =?utf-8?B?UFh3bEZwa010N21SWlFiUHNlbDJSak9xNWUybWI4NTEvTHFwNmpIVGlPNGxX?=
 =?utf-8?B?Q1gyazEyZStIRVhhNnkxN0N0TTVCdjB1Q2t2aEI5aDU4ZjBCYldORWtyTXlu?=
 =?utf-8?B?dTRLbGVxRHdXM0lnbkl4NmxFL3V3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 020bb7a7-e117-4a6e-32cc-08daa6af176f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 08:53:37.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EKD+d1VH5xHaxE7hmBqZSkhBotHl/SE7gyN9U6sgIKp+7guMIUZMZqZPWZoGDed1AGq+eS1y5V1haNQLnm86A6rb6PeR87PoEqUQf1zpcWT5k9EHD1FPZLh5Kw7H+JM/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 08:53:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171452

Hi Mikko,

On 10/5/22 10:43, Mikko Rapeli wrote:
> Hi,
> 
> On Wed, Oct 05, 2022 at 10:31:25AM +0200, Quentin Schulz wrote:
>> Hi Mikko,
>>
>> On 10/4/22 17:27, Mikko Rapeli wrote:
>>> It sets various environment variables correctly for openssl-native.
>>>
>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>> ---
>>>    documentation/ref-manual/classes.rst | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>>> index 11e0d472e8..5fc30f9233 100644
>>> --- a/documentation/ref-manual/classes.rst
>>> +++ b/documentation/ref-manual/classes.rst
>>> @@ -1672,6 +1672,17 @@ one such example. However, being aware of this class can reduce the
>>>    proliferation of different versions of similar classes across multiple
>>>    layers.
>>> +.. _ref-classes-openssl-native:
>>> +
>>> +``openssl-native.bbclass``
>>> +==================
>>> +
>>> +The ``openssl-native`` class supports using the native version of openssl
>>
>> The :ref:`openssl-native <ref-classes-openssl-native>` class supports using
>> the native version of ``openssl``
> 
> The text and syntax was shamesly copied from the other class descriptions.
> Sould those all be updated?
> 

It's being worked on by Michael AFAIK (he sent a v1 of 30 patches last 
week). In short, we want to have all mentions of classes and terms 
(variables basically) using a link (:ref: for classes, :term: for 
variables), even within the section defining the class or variable itself.

>>> +built by the build system rather than support of the version provided
>>> +by the build host. It helps setting environment variables for engines,
>>> +modules, certificates etc correctly. For full certificate checking
>>> +users should also add ``ca-certificates-native`` to :term:`DEPENDS`.
>>> +
>>
>> I could suggest:
>> """
>> built by the Yocto Project instead of the one provided by the build host
>> distribution.
>> """
>>
>> I find "rather than support of the version..." confusing.
>>
>> I think we could also replace the "It helps" sentence by stating that any
>> recipe requiring openssl to be run on the host should inherit this class
>> instead of just adding openssl-native to DEPENDS. Maybe that could even be a
>> new QA check?
>>
>> I would still keep the last sentence though.
>>
>> What do you think?
> 
> Yes, I can send a new version. I copied the text template form the other
> class descriptions so maybe they need to be changed too.
> 

Mmmm, would you be able to point me to which class descriptions you're 
talking about? Not sure to understand what you're suggesting here :)

Cheers,
Quentin

