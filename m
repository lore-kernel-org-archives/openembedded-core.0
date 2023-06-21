Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02DCEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 18:40:24 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web10.6544.1687372817446050459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 11:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com header.s=pps11062020 header.b=ulinGwwg;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=55365019b9=charlie.johnston@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LI8LGn008582;
	Wed, 21 Jun 2023 13:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=pNgrAPe5A03MnTsO5I/F8vTJj1kwNii/WAH+n1OjQPE=;
 b=ulinGwwg2LcqKpw0hSs4t1v+dTydLgsd5HycyHv1bFBr7YHbf6zNuknTBufRU0s+p2XN
 Qz+9eKJs+ZSIVTuy3trANqyPDs35ZrrcETdfnYJ7FGT2uyoQvAeBXPDYmQ9wn13hl2FW
 GUxfEuYQUU5B7DDE88/FWREZAXRKel2GCP77rB3qV3a+GLDCf03DFzue4e1PrcgYs94t
 vuwER6zHG9RqK/zYcT2Rgv3PlLxp/8qf3SsvQCzfQiZIeyWhldgMddBPd0pTyBJHY8H3
 jQx3C5CRJEtNu3BAR6qNjSOZp3fUI/OZs56i0aulnAzNBy5lgkTySwQAoYO+XYB8IJHY 0Q== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3r99sy6u24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 13:40:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llu3RFS2Yuxb6dg+lGpcaDc6zklAoNhJvbRkIaEsSD13KW7y6MsATBZRp1Scp259eC2A3ds5lT1cF93XhTR8JCD/K4xGKWt1FqboH6UdXmEcv4k4tHp7dM7LrPt72UOSfS7cre97bKsg0eOQ69AHDPC43WDvnxndm6x8NpU6n+FKkt5r9iqWPeKrkY5YEqKrcB12lUYk9uolLhOVFnSx6tsRT16YL5FI2Ax4/20kLh3x5mCh+GW9FwAz+wKIh6nSgMlMQqLj8YgyvzFT5EJJQnXDtfeCJTcYRWKBeHvM03wyYEzSLWbPXslliOIgDz0D4ysHqdekT8eaWXBf0QjHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNgrAPe5A03MnTsO5I/F8vTJj1kwNii/WAH+n1OjQPE=;
 b=CwwGjcvEqPh9qaTl7BAUPWCJQcoRseOYI/KUt7Ay+wM+MIiaQb1CjzUSisLncRBB0HJgo0MYFkFM03xltJOa5nH4cjfequ0PbMuNP6PsTgpJstOgYRO5oKtV97s2GR1gF1RfeMc0ksWGWc8H+lDeBSE2PFExQUtnedhv46l+QkYLEhjxU0CYZoKt9fX4kODzUASDz4Zu8k++bNcgqjbBsasu78dZ+jIaIM0aiYQiM21Ze09kLUWS3MatBNjqF3RK2fqym3reqNvmFlXiiANzwrCw9fBYm54iZyOkF2hmvlAcJKHhEqQmkaTlqjCtLIz6j7SMqBrvpD4G/W5DAL+yew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNgrAPe5A03MnTsO5I/F8vTJj1kwNii/WAH+n1OjQPE=;
 b=IBe0Zn8ir7+G7mkf4b1bG8ssz52jmSNO6eIA70y2F4XYadb1sxtHtGagic0r02Jrvun5TyNg+mkM542Q4xHwI+KMsIdj1Ht8Fp/VhQaqKiEO42y12NLs6UR1R8ItyZwU8apXvHtPlScN6n6JKYb5kZEZgZKD7FuW6G1+2/9nnSE=
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BL0PR04MB6577.namprd04.prod.outlook.com (2603:10b6:208:1c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 18:40:13 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::f64d:f407:7c9c:4af0]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::f64d:f407:7c9c:4af0%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 18:40:13 +0000
Message-ID: <e5546e5f-6694-662c-eb52-3c9d28235b07@ni.com>
Date: Wed, 21 Jun 2023 13:40:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] Building SDK from Feeds
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.stewart@ni.com
References: <ec700d47-482a-2b83-9bae-8d0eed55da88@ni.com>
 <CAMKF1srpvsvaQGZrnUhNi-=1R5SLtWxVq5cxirCjPJCOaxmZjQ@mail.gmail.com>
 <7f54a675-add4-54a8-1b22-227841244e17@ni.com>
 <CAMKF1sr6hzNfFPd1trrx6kAeRf+Eqh2BTjCd-itCcXo++W30zA@mail.gmail.com>
 <CANNYZj93VVfmsAMgHvytGTkXwKvGzBMWLh+USVcreXJjWyOkhA@mail.gmail.com>
From: Charlie Johnston <charlie.johnston@ni.com>
In-Reply-To: <CANNYZj93VVfmsAMgHvytGTkXwKvGzBMWLh+USVcreXJjWyOkhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: DS7PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::9) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BL0PR04MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: 1564b812-6ee4-454c-ed3d-08db7286f343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WFNoCg0ZPbJKIWTPRju4PD1lD0qVx65zctYl5If80ffrGmrrdOkB63Ar4adZ1TDvBGv+O0eDPdH+/mmJt+nMI5+RoEntRAu6pqRe5u+SLnpXTgVzt3jZuWcUwvTSnRgG0vFrFHa+nD03bAaaZHzJD1aMucrZNMDTarFQJa4T+VgOu2U1B8mr25z1HXKU5A3TzpGms42mPu1YhyQoGXefFo9nSAq5yXzWsxLRE9Uz5OigEae3civ4BslSfKfnJFZqFNLSYgY44gvtQIOkVnrOfWQ1KQog9K+iC35Ztie5F6xWaAALPD8EO0sTU6JsSRb5H3cdjGiET5/+zZdwpDBlgMCxbyFUwhOVFzGUB/klcyUNBzwIbII4poDY52i9EqWz3Z4r4nd0xJez/hHQlFBCOcp9gizclyRIGwHLRqLkRL+v6XaOeb/6UEAyaZDegD8iSGeEaw6pXavYk1KJWzQErpGIlwUaNGgo5+d6iRkDHJiyuGtEYTR3Tl+NWseCy+58aYL21wwLd3MpohNZMTNwQFa/LRph4ZGV/Lw1k3ZkPW3VznT0Qlj07bss9tX82o70T55/GDydCZV+HKrUgKCTT/UutH/UQTuovQvzSzjunoFaGxi/8YrBIbmWXxL7pm/C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(26005)(6506007)(966005)(6486002)(2616005)(478600001)(110136005)(83380400001)(186003)(6512007)(53546011)(2906002)(5660300002)(44832011)(36756003)(31696002)(86362001)(66556008)(316002)(66946007)(38100700002)(8936002)(8676002)(41300700001)(4326008)(66476007)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ty9ON1ZoaURNNlZ6MjZQUTNuaGFEM0JWMUI3Z3dzNTNRU1FHM2ZlQ0NaaXlm?=
 =?utf-8?B?ZGpGbC90SXE5YnBBeFVHUWNaWUxBbzhKZUVQZDlBbGMxU3VMbEl5Rk1hVi9R?=
 =?utf-8?B?QkxCWm1HSGJWRnlHNHFnSm54OXNuSkcxZXJYbVB0ZFJDd25tdXQyY0FqSHRx?=
 =?utf-8?B?VFRRekZLVXZtS0krMXlIbC93T2x4R0xZa0lGQzhlcDJxMENGQ2F1Vk9ZaWRU?=
 =?utf-8?B?SFZFTWFwRFcyWFE0OUJsSWNXT1VxSFFMd2lnTnUrZlh6dENZTjF0Z3JXT3FL?=
 =?utf-8?B?Rkc1R1A2TVdQWkdaUC9XUG10V2tKZlRJYW9JZUo1YWV4NW9QOVY0OHpwUEh2?=
 =?utf-8?B?REtmYWV5Y05NSVliV2JmdzlKWURiaFpvU25hRnpVRFpmZXdSbDlkV1ZQUW1u?=
 =?utf-8?B?aFcydnRSYm1wL0pXWmpMKzk3ZloxLyt6QXZPVDYzSktqelE2OUNTdWptRnNV?=
 =?utf-8?B?Ukw4SGZlWGU4TGhuZlZxR1hwZE16c0MzOE4xTGNIQkFsTXR0WXZJZ04xOGJ0?=
 =?utf-8?B?OVdTbzREMHVUS2lYR1hxQjFqUm11SHBJV1d6MzBISk5GenNuK2l0SlZUZkJp?=
 =?utf-8?B?NEpEWDQ4VCthVmxqMURHVFRGeTdsWHh6UWJxNGg1bVNjbXRyQksrQXEwa0M3?=
 =?utf-8?B?NjRwNkpiRHRBbzhkZ0RIVVdOenlCU3dUc0lNY0V0SHlqayswNnZLbGhRYTB2?=
 =?utf-8?B?VWV2UHBySGdRMXVrdUlMMCtFQ0N3YzlhSGQwZk5Nc1VnbDJiZjZ4aU1Hcksx?=
 =?utf-8?B?cTF4NzMxNG9LdnU0a0M0Y3FSUHJjVGp4ZGdOendWczlqRzhrT3ZzaVVZdWFs?=
 =?utf-8?B?RmJZQ3BZdGNvMUUyOWVBRlFWYkI1YjBLWXdwZkl1NzBraS9UbU5SNHlaa2FO?=
 =?utf-8?B?OVV5a3hEWHpYK2xJTi85SWZOcmkwYThCRXpUMndiVk5tOUFYaGlRaU50M3hW?=
 =?utf-8?B?SGZONWlRMTl1WDlmeitqN0FhOUt0N3BmNHp2bExwb2U2QldsemZZYnNBOWZp?=
 =?utf-8?B?MnpYU1lncjR5M0lvbW82bElOa0J5Y3I5UDRXejUrUG91Ym92RmxsTHpMaTN2?=
 =?utf-8?B?Vk5jZXRxRFJCNnltY0lMeXpHM3Znd29CblplVjE4dyt4Wkt6cWwxMUEwTTE2?=
 =?utf-8?B?UGxZMXZaYUdSZmJDek0xYzd4RE9ob0NZSUo2L1lzK3lDdHZBaTZELzNYd08w?=
 =?utf-8?B?ekNmU1RLTmxoVHlDbGwyclg0U2x4Z0pYRnphWWZhQ2dSQ2hiUytoZFR0ZzZF?=
 =?utf-8?B?cTEyM3o5Z0IzOFEyNWNScUVJbmREZFczVEt3dnJjZFdvREtVN2hxazJTSU8x?=
 =?utf-8?B?S0tEdkk2anpwOEQwVlRyeDhlUllOelJXTzRjSWlTdmJ5UG5Sa1BNTHUvUjdJ?=
 =?utf-8?B?NEloNE5COTM5SzBOTlBFZUdrdTcxTzVFOWlZSHZlZEx4NUJBd0twTngrMTdx?=
 =?utf-8?B?c2NONzJIUCtWS0k0clpxNVAybFE1TUVSUzJmVlNpelY3aHo5UElZN2lMRVdH?=
 =?utf-8?B?NXlOd243WE9HNVYyTWxOaVRXeEM2L29HbHNzcm1Rd3BDaVVlNEtaNFZGKzNr?=
 =?utf-8?B?MHI1eDd6SVVEMWo5R0hFdStJZVYweWdUYzY5N2x0RUE1dCtUdVFQYmxmN0hz?=
 =?utf-8?B?ZlRaNlRRQStUZDBkNS84S2hoMU9wQytzbHJ0RDUrUjRxL05kNStVOUhXTHAr?=
 =?utf-8?B?S3FYK1ZCb2J6YnBmSHNjK0tSdCtONTJXc25uWFBES1FScVFpQjJRNXN3dUdQ?=
 =?utf-8?B?VnRLWDhGYkVMV1ZNVlRzRWY2MTVPVjVtMXV5eUlWYW1HTjRwdXJUbmZkOEZH?=
 =?utf-8?B?UXpWcW92U2dLc2xUNEM2elpFTThDcmtsWjZULzFWaGh0Z3pIVTRLajhZODBK?=
 =?utf-8?B?MDdWMlYzWmJLeThRMGZjc2JYOVJOOUl0NHRTeXNOK1BuTDRMNjFSWjdLcHNB?=
 =?utf-8?B?MXRIamxaaElNd21tMnVKczFqRS9YUmdoZ2N4eHo0YlVHTkN2Y1pRVlpaTStw?=
 =?utf-8?B?ZW41ZWlxWnVSVW1nc3k5dEl6czBXbjNyaXFMcHpvOWEyRHdOZjdsZWtkb3BG?=
 =?utf-8?B?NEd5d29rOFhLallWRGswVFU1L1J3amVUNzlDYzQrQW5mQkJtdXpmaVNUQlBY?=
 =?utf-8?B?TlZEVEc0WEl5Mi9qSzFLL2hyb2xIRVlpQXVBa2h3a0lDay9zeFZURithWEhX?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1564b812-6ee4-454c-ed3d-08db7286f343
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 18:40:13.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aB+wSRORlCg+dudiYhmY608pC8TzJYixKApbLX4FiVOTarOAEhB6WUxqMcfQgWvm3XPSrIey8alZButFD61vyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6577
X-Proofpoint-ORIG-GUID: vPZJ-HfjPaCVu7SGx857B0zjtMQR525T
X-Proofpoint-GUID: vPZJ-HfjPaCVu7SGx857B0zjtMQR525T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 clxscore=1011
 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306210156
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-00010702.pphosted.com id 35LI8LGn008582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 18:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183197

Here's how we configure building from feeds in our distro:
https://github.com/ni/meta-nilrt/blob/nilrt/master/hardknott/conf/distro/=
nilrt.inc#L156-L167

Alex, are you referring to the the improvements you made to meta-ide-supp=
ort? I hadn't seen those yet as
I've mostly been using kirkstone. I'll have to try that, I'm curious if t=
he way it populates sysroot might
be extendable to pulling from our internal source feeds on top of the sst=
ate-based build.

Thanks,
Charlie

On 6/21/23 12:13, Alexander Kanavin wrote:
> Just to note, there's now an additional option of setting up an SDK
> environment from sstate cache using bitbake, added about a year ago.
> No need to build and distributed gigantic shell archives, or maintain
> package feeds.
>=20
> Alex
>=20
> On Wed, 21 Jun 2023 at 19:04, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Jun 21, 2023 at 9:58=E2=80=AFAM Charlie Johnston
>> <charlie.johnston@ni.com> wrote:
>>>
>>> On 6/21/23 11:52, Khem Raj wrote:
>>>> On Wed, Jun 21, 2023 at 9:47=E2=80=AFAM Charlie Johnston
>>>> <charlie.johnston@ni.com> wrote:
>>>>>
>>>>> Hello,
>>>>>
>>>>> I'm trying to build an SDK (or even just meta-toolchain) from feeds=
. For context, there are some dev packages in our feeds that aren't in ou=
r OpenEmbedded build that I'd like to include in the SDK. The normal proc=
ess I use for building an image from feeds is to build the packages from =
OE locally, build a package index, and then build the image using those f=
eeds and our internal feed server.
>>>>
>>>> How do you do that? do you have a customized image builder ?
>>>
>>> We use BUILD_IMAGES_FROM_FEEDS and IPK_FEED_URIS.
>>
>> Do you have some documentation on how you do it ?
>>
>> I see. I think you need nativesdk packages in feeds as well to start
>> with. It will also need
>> dev and staticdev packages
>>
>>>
>>>>
>>>>  I'm having trouble figuring out all the architectures and packages
>>>> that need built to do the same for the SDK.
>>>>>
>>>>> Trial and error got me to a few of the dummysdk architectures and p=
ackages, but is there any documentation on the required packages to build=
 the SDK that I would need to include in a feed? Has anyone tried to do t=
his before?
>>>>>
>>>>> Thanks,
>>>>> Charlie Johnston
>>>>> e. charlie.johnston@ni.com
>>>>>
>>>>>
>>>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#183195): https://urldefense.com/v3/__https://lists=
.openembedded.org/g/openembedded-core/message/183195__;!!FbZ0ZwI3Qg!rf1gi=
_eNAVFuC1y6eKRZVEma755kRRubI98-8onFX0JwkIa21g7pkRCeSNTv54BbOqYuD3ojEwENtg=
fWGtr51cu_$=20
>> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedde=
d.org/mt/99680369/1686489__;!!FbZ0ZwI3Qg!rf1gi_eNAVFuC1y6eKRZVEma755kRRub=
I98-8onFX0JwkIa21g7pkRCeSNTv54BbOqYuD3ojEwENtgfWGodz7O_P$=20
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.or=
g/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!rf1gi_eNAVFuC1y6eKRZVEma755kRR=
ubI98-8onFX0JwkIa21g7pkRCeSNTv54BbOqYuD3ojEwENtgfWGg7UWWQh$  [alex.kanavi=
n@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


