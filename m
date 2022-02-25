Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE090C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 08:05:35 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.58])
 by mx.groups.io with SMTP id smtpd.web12.4444.1645776332547458123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 00:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=xv25BAcE;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.58,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsLMUQRKzF9yh1yCzFgOWAfWMQv00eLUGWndGweLsmetl1QWRBxT16duxzYNZG8ypGKs106eBkJYPZ4lc4k0BTaGG92IVVdkfh/2gdK8s0d43G1+ZQy2TUoNTvAEdXzUH7JZWIl+rLtG0AuTXbP1s3fwLBJryhMbEt0kOZAwi5cx5OLE9/opTSHcXmsq52P5MQx/pzBZe8SWXCWG/vCm6G1GsjTvjQSFjvkmHm4dry1QHs2VLxk1v3haob99lfBJ/tRNX90gPjdcTQI4q98rKJLzLEAaxCdFES/CgvAjjTS78EbJrsjAMGul2u2hNPvJ7pCemtStOKPkmkRQaopgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAXzmBGIFl3RRCbkRPGQMzabTN4EvjTgafJecPBg2Nc=;
 b=WV/vUVe89FJaNtttrpQhdTqIpmFRbryQglQIXzsw95q/ah/zCVvw84EdZpB0mcQqXFSDxGSFWnLWGqR6cm0iAnYYAcMUSCz6W3E6eMkX30euXyXhprngDsvKgOMM0tBIOj8o0NsPdXi+gSBIfnbsximh1oUp+cn+WAQCO9rNKC0XrCFKv+m2ozTukABXUtqAy/0BpuThtfEGIqJfc2nDjSzBAaZxsKPd5kT+rqTCpoU9V8BIq8jV8qmNOkl2TUmVR54V2H3xsKkzcF66PGdDD3wjyOr9wH6eayg+42ALvzofj5H/GdzVOKx9AiYILvdfKEAIbvSkNZoMBaacpumIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAXzmBGIFl3RRCbkRPGQMzabTN4EvjTgafJecPBg2Nc=;
 b=xv25BAcEGF53OmQrN771gwTYfXlHfulvP3zvNf+Nv/+kQtbkquvQpvEvQ8gSaYqcNToFznQTuC0YBRwpKCw1L2KxK8ApGXUIPTpZJqMp/v0a6yCJ8liSO2P9KypE1AIuH6OOJjiUwthEjUK1emG1bnYaZm7E+N052VKslwxC/LY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4858.eurprd08.prod.outlook.com (2603:10a6:101:1f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 08:05:29 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0%4]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 08:05:29 +0000
Message-ID: <1594db98-46b6-7358-0649-a61e59b0b714@weidmueller.com>
Date: Fri, 25 Feb 2022 09:05:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH v2] systemd: move systemd shared library into
 its own package
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, mingli.yu@windriver.com
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220223161722.14256-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <af819494e57fe7da1b44786b004488a72f3f4c48.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <af819494e57fe7da1b44786b004488a72f3f4c48.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0138.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::43) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1423132-cabb-4ff6-14e0-08d9f835965e
X-MS-TrafficTypeDiagnostic: PR2PR08MB4858:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4858D43C389FF029DF66CAC1D73E9@PR2PR08MB4858.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZQWepa8U4rJ6zqAeY+4HNzLPGeK3tFOF93AcPWqcScQgmCWIcW28naQ/nzR0vq3r4CHPTR67omPObyJHiZsr3XDbJNAaGRACw4jX7eEXvEsFdaRXM1STO0NF+u7j1wdbaSIWI+WwMXmWEXrp4wXAOaDanMZG5cRkJ34TQVPUO6Et4+h2cl8farFMpn+fQUzU+87Mn/H8HdASoibQ6D9xovXyejTdudpsYKNvs/VoSwUeCrSPIEklyAedKAJgcgAR2jsZTHlbZsaOqZKDoTzxLMog4Xs71d8RmNU5VXDv8jVFWaWhACKoKy4upi6owH4IL9GPij5VxGUVi1n70YJ1bwH3LfKDEH095ek9HGBazIXQbZ6Xy3UrQAnQE19y3eqVUkjcN5M9D/WisRQF60bTpOeRRa8oj5uoVFYnaPndbfZt0zT0JrWyhY1JH5DwUQkKz+CeHAfrtbBYDYyg3PKjAP50DNXxJBz2BkONMvnb4GqmI6X8GKIQ2CCc36wFB7wTpVJjQwwyDhxpbPbNyQIQGFm1LNE19HlhxhpQiAggwC2YL22qAN9uofLy3D2uf/X6SEI7lXsevBA8CuYGesv2xSWIKW/iCSeW6BAn5yNUQFDcSmJhDhcGIHhtD+s+JquhgtW0x3/Qgs3cBJNUMn0auA/IWANOCMlaXoZgAO9sFe8q8L0ULCvWtipH9PoErSETNuJq1zN60tA8r10WtFnsX9WMk46E4iSl5ta16HinsCmV45YUNTvsFzUNj3spLfivcm2GIxuciUxhhgTMvOrxgwCmXqTlttkeI7SufeIl00MXskH8+BCVkz2ZCdHwzMkWjsQDM1J2VI6TI1FKvBjXrtZl0GQJzR5eHfSk9rPhz6A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(83380400001)(31686004)(36756003)(2906002)(4744005)(66476007)(2616005)(66946007)(8676002)(38350700002)(6486002)(966005)(8936002)(4326008)(66556008)(86362001)(316002)(31696002)(52116002)(107886003)(508600001)(6666004)(6506007)(5660300002)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkxpQ1dyZ1JWWkZoRDBWK0Z2OXowNFFpVXhmdWJNK2QxVEFOeWpTbUJNaHBz?=
 =?utf-8?B?ZmhtV29laWwrUkJBYU9MaVJlaE12UkFnSGF3RnlHbXpqRWk3TGtzZk1LbjFH?=
 =?utf-8?B?TXE1MHVYd0ZRc0s4SVNyRE15VVRSSENySmFtRVZXUlFFRlpxVnE0Um5CQ05Z?=
 =?utf-8?B?UEEwb0w2OE4yakdSdWR4bWlGOU5hQUQvUkJERUFNc0p0cFdWSmp1Q3JuelZ5?=
 =?utf-8?B?RDRqcXRnTnNGK0lQWVRUblBzS004V3ZLL2NuTHpzditHdUhTMks0bmtZUFRK?=
 =?utf-8?B?N1lNaTVPTnRXd2x1d0gyOURMK3BVQnRQOTdha1cwM1JCQWdoeXVWdnZYeVdI?=
 =?utf-8?B?VlJ3cFhsektMZXl5amx3bVJWODNpdmh2ZnVyUFBYSHdVZ2x0YzZnUmNHbllM?=
 =?utf-8?B?SzQrM0lvY2RKNnpkN0RJT2tLTkV4Q1RLV2NUVHBMQzNNTWtEQVA5ZWFCbEt1?=
 =?utf-8?B?YitHekdIOTNVMjNRcjNPT3RMMnN2aGpnOVNROWpWYS9kVkdJOGJnWWM1STNa?=
 =?utf-8?B?VUNEcExoSE0rMlI2QTF5TEs4Q3FkbFBPOU44bEZodmZsK2V6RkhTNk9NTzYw?=
 =?utf-8?B?d1dqd2RkbDdyeSsxaFdrSVZzOTlQSVpYS056RkpCa3pYbDNVRHorc1M1bUtO?=
 =?utf-8?B?V284UlhZcFJEZGF3OCtnUXVaaS94bjUvdWtiSDZOVWFveG1wek54QkFKaEZB?=
 =?utf-8?B?dFoyZVBqVjQ1dE5zR2lpT1EvSWdKQ3dxSzJLdEEvTlRTRnRYajUwc0tqZlpv?=
 =?utf-8?B?QmVqL2lGSVR0NmpDeHh4SHV2WHhpa2YyWDZFK3VrMzBpdVlSUFg0K2dHWkRv?=
 =?utf-8?B?MlZMdGVWakFOL2dYWEc3NDVuNDNmb0ZwV1M0bHFPYUFjWWZSQ1NkVW1odC9x?=
 =?utf-8?B?MVV6NXRqakFFRjRHYitwUGhTb3pXQ1RNZUNRVXpYeSt0RTBCeHdxbm80SWZx?=
 =?utf-8?B?RnJXZlJabEp2SDF3MHlQS2JDeUJaSnpKMWhaWm5rYTMyQzBlbFVWSHNNZ1lK?=
 =?utf-8?B?a2J1Rmt1MTdZcng5ZU4vRitvQy9LQ2ZEYmNGeHE2blpyYmVUMWl0dE9mQXds?=
 =?utf-8?B?VEFJWGdyL08zTW5xREllQVg4RUZoYllyNHpVTk9zckdSeEMxdFhLOFd0WVFC?=
 =?utf-8?B?bEtiVWtkVmRKSnZISUNLTkJwdTBsOHJJNUpYN21hY1ZqeUpTZWE2WDEyWCsy?=
 =?utf-8?B?bFBZYTVUT3YrSGcveHg0N2E3eTkyRmxBRlZNTUoyMzJHaVlWSndwQXcxZlpY?=
 =?utf-8?B?cE5Nc0lHTE15UlJjMTRWdzlrRVluWkR0TVM1SzZONUFyMW9ETGxhcEdjbEpx?=
 =?utf-8?B?QlUvNUMrYWp5T1B5R3VjT0UzMFhOejA0OWhDQXRtMmcrQTd6QzIrVUs2Q3N4?=
 =?utf-8?B?aDFaQ2pmR2syY3VmZUZJKzBFMnp1UFhLem5lRUl6TUd0OUphK3JpY2lnajVv?=
 =?utf-8?B?MmFJVENadWpRYnMrMEJpRW93MlpoeE5GN21PV294VDZCcy9kcThiV0t3UlJR?=
 =?utf-8?B?NFM3TDZKWW9lU1ZRdDkzOVdEcklyL1hrRnp2bDFpMndpVzJGUStLODhEb3hD?=
 =?utf-8?B?a0pWdEdPT21IVzZ3NERFZFlnZmZ4bEpxQmFLcHlQalVVcm42TjZIWUZGR21H?=
 =?utf-8?B?dmw3R2h6RmxodkQ3SUlHMkszTWFSL0xrYUk1L05qbEJTVVpOQWY3NEtJNVl5?=
 =?utf-8?B?dVdUMGdpVFFtcVRaUHkvQ1RjQUtQS3JkV2RpVTlIb3RyellacU52Ly9vWlly?=
 =?utf-8?B?OFU5SjVaTjJFdHFwWnhXOFp0bmRzOXVRanNzdnA5bEQ1TW14ODltVW5oanMz?=
 =?utf-8?B?MlVSZzcyUThMOFZwSk13b3h1WmRUT0lnUkFzazc1OE53ZksycjJuc1Y5N0J4?=
 =?utf-8?B?UCtnN1lPUlFDVUlXZzVZZjdXSG5rWGtSeGRqSjNWOXI4M2Z5WldFQ1FtT2Yy?=
 =?utf-8?B?Q0NEYmZnMFpmSG9FNnQxcEdDUkREUCswUm96ZWNNZnRRTWNZR0NYMUJEUUl0?=
 =?utf-8?B?NlVLQzR4RGZqandmenhjMGs1cjJTMFdlV1VKckpzVnk4cUdiK2xDR3hYdGhW?=
 =?utf-8?B?eEc5SDRkS3FvRnlFQ0REVThjdDh3VHVvL1RSN1VvMDEvNHp6anpxVGhXb213?=
 =?utf-8?B?dmFOYlBDVlNsRHY1R2s5Vk9GeTA3QkIwTHJPWjdQYTdpa012TTNGdXRVTDho?=
 =?utf-8?Q?lJD4cq9qSE/fZYEHTboC+So=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1423132-cabb-4ff6-14e0-08d9f835965e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:05:29.0745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ErzkMZ/lpAiyJe2/El+4gOe5ZkLoWQzKkn19pp7YxsmXTMgbiLNeosgIlEmAns3x0OrGebghTIUs/XbtAOXNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4858
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 08:05:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162341

Am 24.02.2022 um 22:06 schrieb Richard Purdie:
> On Wed, 2022-02-23 at 17:17 +0100, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Move the systemd shared library (libsystemd-shared.so) into its own
>> package to prevent a runtime dependency from udev package to systemd
>> package and thereby to a second init manager.
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>> Changes in v2:
>> - Fix SUMMARY override
> 
> This did trigger a warning on the autobuilder tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2657/steps/11/logs/warnings

I will post a patch to add `INSANE_SKIP:libsystemd-shared += "libdir"` 
to the recipe.

At the moment I have a problem to reproduce the warning. I don't see it 
on qemux86-64 and have to retest with qemux86.

Regards
   Stefan

