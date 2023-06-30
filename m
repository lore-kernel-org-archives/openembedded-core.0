Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86B3EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 09:17:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8157.1688116675505050105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 02:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E8CqTRA6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65455f103e=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35U51TtP029762
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=cr45OmsPAjNMrVucYINjr3geblsXsQQMctK5e0ZyGt8=; b=
	E8CqTRA6YbeArfRfct1oDpF8B9Bc9LIKjFg20tt+dl2T+uKvcAIiApoMm9vWjs9+
	7RrgrQVQVVVCjlEw6YNaP7cBvgM7DCdWmTs80B9v5fz9iDqw0YTc6pNdsc10H+64
	y+fp961BEor/hsgfpdDoYiB4a/T5ZumuUyartfWuxaaIHYyzh2WU7fs6GrMKzrzs
	QjmswPH/qRntxl/Yer02Bh58neXaPavEQJLLY+2A6PmeMVFoOvwhcSoZas2NEJuA
	PsN0wqMSx3t1Y8yso6HeuZgc4PYv3qqguckSZejZqbz3JR/rg545rmRlG7lpLhvU
	Bur3WNHCZ4SgZc4wxDHb1g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4dpp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:17:54 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35U9HslW031142;
	Fri, 30 Jun 2023 09:17:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4dpp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 09:17:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIA1joLwRCNHcX1pb7W+3umdiPNenYsy04F2bLaysOMYhlZCjKIiSdkaEHWjdiNR9DalWMFZMiFKlZ/RiFHpccOfFXQIoma8oHg4ljW64iRPbtqcIXA71X/dcus+VH19AvMKKkUbppBzOWVNMOyeu/IR/pNqIWOX8m4hkUe3nfbv0lmJamnLA8XSMLVJ1ijUYAxjDizzIKzOB51bpHhONVpmbZqFwQMRmZrGOa7U689D2FMBJvDHA1oc63rolYbdu1synFCYQCTIOK0NTxPRDGyuX9S4wCUoiCDGwgCLNrGpIkKwl3BayF3j1hsJyG5zEe3nUUGDOrFe4MUAw35OUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr45OmsPAjNMrVucYINjr3geblsXsQQMctK5e0ZyGt8=;
 b=Mzi0w4NYK5ebWDqx76NY6ulWpe8BbW+QDWgzJWRXr1MObcfQbntXCKnniTCywqh/+LNwRJBPbWYiUiHB3OAuyutv7o9D7PcOQQMTRu8uLcm3a3s/M99nsBgqWRggS1X9dShgmZx/TikZC+R/5Uyuwlh0FgPOiCXqcDcJRnmtJn6iJQZ8K6og9DlCRQS0ScVaAGpqshcSvYPdao8Ww6nAQVNjwfG+YqcuqMr9zIImat+9Oioq+fodcFLx0pMMViFa0cqx0CiGrDW9bfz+4uyp99my0ZF0Z0H/LSxUxZ1XsPMZBuQy01WjvMnLOhpnse5VPRqfYZBgJYWGZdHGXsdA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 09:17:48 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 09:17:48 +0000
Message-ID: <40e1fada-5473-47ab-541b-7d4894c0847c@windriver.com>
Date: Fri, 30 Jun 2023 12:17:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH 4/4] mdadm: skip running known broken ptests
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
 <20230629141836.3431391-4-ovidiu.panait@windriver.com>
 <CANNYZj_WmTwU_6HFL3=drWrepbXu3k6wxmkwzNawDV8_75m2kw@mail.gmail.com>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
In-Reply-To: <CANNYZj_WmTwU_6HFL3=drWrepbXu3k6wxmkwzNawDV8_75m2kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0304.eurprd07.prod.outlook.com
 (2603:10a6:800:130::32) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: b0aef009-8347-4dca-edef-08db794adf2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+TVKqNgN+cQUAcAt791133sUD0sfT67fk6TfhN++RAkfRtXpZc6D+SvBHXTyYFdo4lQg8yaHn6HasWQXpICSvJOOcEMEeki2hAcukk5K18X+BjzKIN76XiBugJf7JKtBoLSFQRhQd/bpQU+973c3Qwv9UYGq+zGnoq/c0shySIlhOFi8t/OasmxRpOscb59cwhvnIvnaGVDQGtp9J4Sfc0f/8wsRBnEHn5f/Ng5VRWqju3sh2SWmhLvHtnBqjOueN7LzVsN9+VLFSaz7BBmJ0BybP2jA9CemLbNOIbd7PYkezxEuWh0siS8boYiiAGxQmcRPZsUwEpaGfOP5rQ+NX7DJj4Y0npLZgsnz74N5XQw5lr5ERW+bfn8HZMKZrZxayoZKlzTbukrcHwM+OdarTfJ4fpgQwbELGEM42Y6HXk7MJM7qg2qEMY3Mwk3imMUIOOCZPgyxBAPhXztUDf4utJAyJt2TdmqkaX6tFHeTx3LXXmfj7t+eFBWZLebg7Vb4ofBuhQ8PkjWuZThGIvhaBZ640dQ2aJ9G6YC/SJmGMHS+m6n/j6ICZSFqjYFmCrbIZz88Ek9bAH3UKEMvg4xmDu5m57Hvil52YF+C4osvhSC+/UhG77p5IOUAr6h456yh2bG1VgVZDztnBrjbWOz/N4Db7iJPksRNJRUL3T9EkPhia4FKYJy2dCjNz6KqSGt9VqM+Q4wwg7y/JTsBLel3XfWdu8O7eYTYdZV+zd8SjKU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39850400004)(376002)(396003)(451199021)(83380400001)(30864003)(2616005)(2906002)(38100700002)(36756003)(8936002)(8676002)(5660300002)(86362001)(31686004)(18074004)(966005)(6512007)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(6666004)(316002)(6486002)(478600001)(186003)(66899021)(31696002)(44832011)(53546011)(6506007)(43740500002)(45980500001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emxJWFpWN1dDZ2hqZmpxZjNkZ2lGNUYvMWtWbERTTTRieXFROFdzQWk4Zjcy?=
 =?utf-8?B?eGU4VEozRG52WWxzeFNEdm52d0RGVCtMYkJqTjE4Z25nZ2k4S3UvV3dTaC9V?=
 =?utf-8?B?UVVUd2F3NXoyOTRpRmxhMXR6STR3TjBlV1M4TUxlMFA0S2VDZWMwYXpJRFl0?=
 =?utf-8?B?a2lZU1NnbGtQZ3k2cGxwYXRzTDlZbCtqdm9UZWRhL1k4cGZPelFYeU9rSURQ?=
 =?utf-8?B?NjdDS1piQ1NmajFna3BwRHdmMCtVUm8zWHM4NWd4dGpoUk9mOHliUkdxa1dB?=
 =?utf-8?B?RDZ1dElOUWhVTjQzSGRJaWExa0l6VnpCK2twdWFoVVZITWd1OXdXK0Y3VzI3?=
 =?utf-8?B?YlNsdldyYm9uQVIyTDAvUXFLYzgraGJYU3lsd1plZldTbkdPSHQrMjRJWUVO?=
 =?utf-8?B?TXA4Y003alBXV2lONXZyeFJnVzJHVzZqaHdyS0xnSFR5ZGJ0SVYzMjBsYlFy?=
 =?utf-8?B?amNQVndOOXNwZHpZRnVaVEpWd1dWZWhQSWY4UXcxbVZHbVZjTHpCK3dIYUdX?=
 =?utf-8?B?TXF3bTRoaXNodkE1bGVMOUxnZjJCUVQvM0dpV004cUY3WlMxR1h3QjE3MVNw?=
 =?utf-8?B?VXM3QzNBYTV3YW0wUzZTLzNlSThIT25WNEVvRzRyVDR0Zk56SWpzU1JWaFFp?=
 =?utf-8?B?OVF2dXFVN2ppYThXMHQ3UG03WHdBODBFMm9TN3IvdWtSQzNwakR0czFJTXZH?=
 =?utf-8?B?R2hQSFYvbWlJTkhkY2JUczRJUFd6MTRUWXFwV1B5bGNJZmYzWVpZNlp1LzhQ?=
 =?utf-8?B?Wjh4OHZFdnlKb2VLVURZSzIzNkExMklKU2xleUpBZWpwM1BzTlJiV0dXZmgy?=
 =?utf-8?B?bDhReHZKVjJPRndYMHJLMERTeldtMDdmNDJRMi9oeHpKSUN2R0I4RXVkSUMr?=
 =?utf-8?B?eTNSOUNpR08yTStUWWZCNUU3MTNpN1pSTmRwSlk4MlBZN216Tmw0TG9tcUFR?=
 =?utf-8?B?bUxSTjVZcVkvQW4wMnlZb1pDZXN2L2RnbjRZYUlxbE5zeG5hWUZjd1EzMmly?=
 =?utf-8?B?VlVqLy95VWxJVXQzdytYdzMyRmxKaGMwOVVDOUZmS2ZQNHFtYndaaEtna0w2?=
 =?utf-8?B?Q3BWYkQ0U2xwQWp4OUcxWDFReU9jdmhsU0hKaXRzeTIrSmpLUlVTOXFQS2NG?=
 =?utf-8?B?dXNidGFOSmlibHVRNU11bkFaZHRBaWF1TmxobS9PZW9odStYTkRzUk8xTnpO?=
 =?utf-8?B?KzQvV2t6VXhUWGlQREhnU1ZEREVUclFZWWhhNUNqSlppWWdrREczYjhGd2dX?=
 =?utf-8?B?ZnF4dE5xT3RLUzNHNGs1aWVnS1ZFV2FRbXVMRGVPZmhZa0FuK244RmJ2cnUw?=
 =?utf-8?B?MUNXSmkwaUsxWWtJZjFOYnk4TlBubkZoK2I0eC8yUlpUS2swNGZHakJBWlAw?=
 =?utf-8?B?R1dsVUpBblBKUFZPUmx2NCtVV3BEZGc2bkc5TWxaRkF1MXVwUTNhQS9DK2dN?=
 =?utf-8?B?dHp4TXh1YlpWQ2xocS9WMklYSS85UmxGNlJpb2wxYWVmaHluRkd1MFpocS9L?=
 =?utf-8?B?eU1ZanFhZnpDejVsaHJ4T1h3QWIzZ0R1MEFreGNzV3NKbGV6N09NdmFQTnp2?=
 =?utf-8?B?K0JKblk2VjNPRm1mNmFVR0U4MVNPSVM1UzRoSmhTbFdzSGlDYXBlaVZrc3k1?=
 =?utf-8?B?WFl5OUVZNm9rSi8yejd2OFFsSHhkSlp6VnZHcno5MUUrQjZjT01uSThZQnFT?=
 =?utf-8?B?ZWlobm5Md0UwOVNORklnZmFRT2U2dEpuS2djb0ZHWEhWbG1PRTk4K3BzSUtz?=
 =?utf-8?B?aWpmeVdCUmx2MUJVSm9zL3pzVWZadzhZQjhOeXMzREpYaU5PR1QvdngyWUFL?=
 =?utf-8?B?UEs1eDd3R28wWVljNnErb3hWTWI4UFBKNlVkdnJXRGVsNmV1blFJeDhiRmcr?=
 =?utf-8?B?cnJPZXBNL3JzclVqL3dlSllyVkdkREE1QTV2OS8rZExFRGhvZ2xqZVp5U2dh?=
 =?utf-8?B?ZWRDYmdtbVhSbXlOQkhMeW5JeWUxYkxMRzE2eW5rd243ZERBR1g5bVRpNFZl?=
 =?utf-8?B?UGIwaElMcHRSVnQ5YlhnaXVCaWFaTnpLYXh6VDRrWVd1c21KZXpyK1BPS1NX?=
 =?utf-8?B?VnNQTjdkV000MWFtUENqVWo2T2JkMnAzSmVhRUxMZGFFc1d3b2JQWGhnYlVp?=
 =?utf-8?B?SW5qMHl5V3pNTTREZFpsTU9vcXo5TW1ZRG96ZS9WV3IvbkFhOXAyNlh2dThN?=
 =?utf-8?B?dlJOZ1hyWFlZY3dCM2tSekxBYVRXcHJ3UUljRjNNMEJSSHpCb0RwVFcwOFI0?=
 =?utf-8?B?elRucHI3Q3V3RURoY0FwMEJRQmd3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0aef009-8347-4dca-edef-08db794adf2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 09:17:48.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOs/CGtDwwROKfOy3rk5sh6pTyFj9mkA894Os+r7ZagGS9qW/1WIP5HawDuXs4FktPR+i7Rjh7h18JJO6ijiWi/qSWW1lQeyiSkVh4cfMhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
X-Proofpoint-ORIG-GUID: F0SPZUmudJEfnCnTB0D60s3mytLwoqVJ
X-Proofpoint-GUID: fyCSAO2gX730q4raagJEygm1Rqu0REFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183690

Hi Alex,

On 6/29/23 17:54, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Thanks for working on reenabling this. mdadm is currently taken out of
> ptest lists because
> #    mdadm \ # Tests rely on non-deterministic sleep() amounts
>
> Is this resolved, and can we re-add mdadm to SLOW or FAST lists?
I did multiple test runs with a qemu-x86-64 image and kvm and the 
results seem consistent - always ~12 min per run, no failures:
# ptest-runner mdadm
...
PASS: /usr/lib/mdadm/ptest/tests/21raid5cache
DURATION: 724
END: /usr/lib/mdadm/ptest
2023-06-30T08:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

I think mdadm-ptest can be added back to PTESTS_SLOW.

Ovidiu


> Alex
>
> On Thu, 29 Jun 2023 at 16:19, Ovidiu Panait via lists.openembedded.org
> <ovidiu.panait=windriver.com@lists.openembedded.org> wrote:
>> From: Ovidiu Panait <ovidiu.panait@windriver.com>
>>
>> Upstream marked some testcases as "KNOWN BROKEN" and introduced the
>> "--skip-broken" flag to ignore them when running the testsuite (commits [1]
>> and [2]). Backport these two commits to get rid of the last remaining ptest
>> failures.
>>
>> Also, add the "--skip-broken" option to the run-ptest script.
>>
>> [1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=28520bf114b3
>> [2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=daa86d663476
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>   ...Mark-and-ignore-broken-test-failures.patch | 128 +++++
>>   ...dd-broken-files-for-all-broken-tests.patch | 454 ++++++++++++++++++
>>   meta/recipes-extended/mdadm/files/run-ptest   |   2 +-
>>   meta/recipes-extended/mdadm/mdadm_4.2.bb      |   2 +
>>   4 files changed, 585 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
>>   create mode 100644 meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
>>
>> diff --git a/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch b/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
>> new file mode 100644
>> index 0000000000..c55bfb125b
>> --- /dev/null
>> +++ b/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
>> @@ -0,0 +1,128 @@
>> +From feab1f72fcf032a4d21d0a69eb61b23a5ddb3352 Mon Sep 17 00:00:00 2001
>> +From: Logan Gunthorpe <logang@deltatee.com>
>> +Date: Wed, 22 Jun 2022 14:25:18 -0600
>> +Subject: [PATCH 5/6] mdadm/test: Mark and ignore broken test failures
>> +
>> +Add functionality to continue if a test marked as broken fails.
>> +
>> +To mark a test as broken, a file with the same name but with the suffix
>> +'.broken' should exist. The first line in the file will be printed with
>> +a KNOWN BROKEN message; the rest of the file can describe the how the
>> +test is broken.
>> +
>> +Also adds --skip-broken and --skip-always-broken to skip all the tests
>> +that have a .broken file or to skip all tests whose .broken file's first
>> +line contains the keyword always.
>> +
>> +Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> +Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
>> +
>> +Upstream-Status: Backport
>> +
>> +Reference to upstream patch:
>> +https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=28520bf114b3
>> +
>> +[OP: adjusted context for mdadm-4.2]
>> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> +---
>> + test | 37 +++++++++++++++++++++++++++++++++++--
>> + 1 file changed, 35 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/test b/test
>> +index 8f189d9..ee8fba1 100755
>> +--- a/test
>> ++++ b/test
>> +@@ -10,6 +10,8 @@ devlist=
>> +
>> + savelogs=0
>> + exitonerror=1
>> ++ctrl_c_error=0
>> ++skipbroken=0
>> + prefix='[0-9][0-9]'
>> +
>> + # use loop devices by default if doesn't specify --dev
>> +@@ -35,6 +37,7 @@ die() {
>> +
>> + ctrl_c() {
>> +       exitonerror=1
>> ++      ctrl_c_error=1
>> + }
>> +
>> + # mdadm always adds --quiet, and we want to see any unexpected messages
>> +@@ -79,8 +82,21 @@ mdadm() {
>> + do_test() {
>> +       _script=$1
>> +       _basename=`basename $_script`
>> ++      _broken=0
>> ++
>> +       if [ -f "$_script" ]
>> +       then
>> ++              if [ -f "${_script}.broken" ]; then
>> ++                      _broken=1
>> ++                      _broken_msg=$(head -n1 "${_script}.broken" | tr -d '\n')
>> ++                      if [ "$skipbroken" == "all" ]; then
>> ++                              return
>> ++                      elif [ "$skipbroken" == "always" ] &&
>> ++                           [[ "$_broken_msg" == *always* ]]; then
>> ++                              return
>> ++                      fi
>> ++              fi
>> ++
>> +               rm -f $targetdir/stderr
>> +               # this might have been reset: restore the default.
>> +               echo 2000 > /proc/sys/dev/raid/speed_limit_max
>> +@@ -97,10 +113,15 @@ do_test() {
>> +               else
>> +                       save_log fail
>> +                       _fail=1
>> ++                      if [ "$_broken" == "1" ]; then
>> ++                              echo "  (KNOWN BROKEN TEST: $_broken_msg)"
>> ++                      fi
>> +               fi
>> +               [ "$savelogs" == "1" ] &&
>> +                       mv -f $targetdir/log $logdir/$_basename.log
>> +-              [ "$_fail" == "1" -a "$exitonerror" == "1" ] && exit 1
>> ++              [ "$ctrl_c_error" == "1" ] && exit 1
>> ++              [ "$_fail" == "1" -a "$exitonerror" == "1" \
>> ++                -a "$_broken" == "0" ] && exit 1
>> +       fi
>> + }
>> +
>> +@@ -117,6 +138,8 @@ do_help() {
>> +               --logdir=directory          Directory to save all logfiles in
>> +               --save-logs                 Usually use with --logdir together
>> +               --keep-going | --no-error   Don't stop on error, ie. run all tests
>> ++              --skip-broken               Skip tests that are known to be broken
>> ++              --skip-always-broken        Skip tests that are known to always fail
>> +               --dev=loop|lvm|ram|disk     Use loop devices (default), LVM, RAM or disk
>> +               --disks=                    Provide a bunch of physical devices for test
>> +               --volgroup=name             LVM volume group for LVM test
>> +@@ -211,6 +234,12 @@ parse_args() {
>> +               --keep-going | --no-error )
>> +                       exitonerror=0
>> +                       ;;
>> ++              --skip-broken )
>> ++                      skipbroken=all
>> ++                      ;;
>> ++              --skip-always-broken )
>> ++                      skipbroken=always
>> ++                      ;;
>> +               --disable-multipath )
>> +                       unset MULTIPATH
>> +                       ;;
>> +@@ -275,7 +304,11 @@ main() {
>> +                       if [ $script == "$testdir/11spare-migration" ];then
>> +                               continue
>> +                       fi
>> +-                      do_test $script
>> ++                      case $script in
>> ++                       *.broken) ;;
>> ++                       *)
>> ++                           do_test $script
>> ++                       esac
>> +               done
>> +       fi
>> +
>> +--
>> +2.39.1
>> +
>> diff --git a/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch b/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
>> new file mode 100644
>> index 0000000000..115b23bac5
>> --- /dev/null
>> +++ b/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
>> @@ -0,0 +1,454 @@
>> +From fd1c26ba129b069d9f73afaefdbe53683de3814a Mon Sep 17 00:00:00 2001
>> +From: Logan Gunthorpe <logang@deltatee.com>
>> +Date: Wed, 22 Jun 2022 14:25:19 -0600
>> +Subject: [PATCH 6/6] tests: Add broken files for all broken tests
>> +
>> +Each broken file contains the rough frequency of brokeness as well
>> +as a brief explanation of what happens when it breaks. Estimates
>> +of failure rates are not statistically significant and can vary
>> +run to run.
>> +
>> +This is really just a view from my window. Tests were done on a
>> +small VM with the default loop devices, not real hardware. We've
>> +seen different kernel configurations can cause bugs to appear as well
>> +(ie. different block schedulers). It may also be that different race
>> +conditions will be seen on machines with different performance
>> +characteristics.
>> +
>> +These annotations were done with the kernel currently in md/md-next:
>> +
>> + facef3b96c5b ("md: Notify sysfs sync_completed in md_reap_sync_thread()")
>> +
>> +Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> +Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
>> +
>> +Upstream-Status: Backport
>> +
>> +Reference to upstream patch:
>> +https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=daa86d663476
>> +
>> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> +---
>> + tests/01r5integ.broken                     |  7 ++++
>> + tests/01raid6integ.broken                  |  7 ++++
>> + tests/04r5swap.broken                      |  7 ++++
>> + tests/07autoassemble.broken                |  8 ++++
>> + tests/07autodetect.broken                  |  5 +++
>> + tests/07changelevelintr.broken             |  9 +++++
>> + tests/07changelevels.broken                |  9 +++++
>> + tests/07reshape5intr.broken                | 45 ++++++++++++++++++++++
>> + tests/07revert-grow.broken                 | 31 +++++++++++++++
>> + tests/07revert-shrink.broken               |  9 +++++
>> + tests/07testreshape5.broken                | 12 ++++++
>> + tests/09imsm-assemble.broken               |  6 +++
>> + tests/09imsm-create-fail-rebuild.broken    |  5 +++
>> + tests/09imsm-overlap.broken                |  7 ++++
>> + tests/10ddf-assemble-missing.broken        |  6 +++
>> + tests/10ddf-fail-create-race.broken        |  7 ++++
>> + tests/10ddf-fail-two-spares.broken         |  5 +++
>> + tests/10ddf-incremental-wrong-order.broken |  9 +++++
>> + tests/14imsm-r1_2d-grow-r1_3d.broken       |  5 +++
>> + tests/14imsm-r1_2d-takeover-r0_2d.broken   |  6 +++
>> + tests/18imsm-r10_4d-takeover-r0_2d.broken  |  5 +++
>> + tests/18imsm-r1_2d-takeover-r0_1d.broken   |  6 +++
>> + tests/19raid6auto-repair.broken            |  5 +++
>> + tests/19raid6repair.broken                 |  5 +++
>> + 24 files changed, 226 insertions(+)
>> + create mode 100644 tests/01r5integ.broken
>> + create mode 100644 tests/01raid6integ.broken
>> + create mode 100644 tests/04r5swap.broken
>> + create mode 100644 tests/07autoassemble.broken
>> + create mode 100644 tests/07autodetect.broken
>> + create mode 100644 tests/07changelevelintr.broken
>> + create mode 100644 tests/07changelevels.broken
>> + create mode 100644 tests/07reshape5intr.broken
>> + create mode 100644 tests/07revert-grow.broken
>> + create mode 100644 tests/07revert-shrink.broken
>> + create mode 100644 tests/07testreshape5.broken
>> + create mode 100644 tests/09imsm-assemble.broken
>> + create mode 100644 tests/09imsm-create-fail-rebuild.broken
>> + create mode 100644 tests/09imsm-overlap.broken
>> + create mode 100644 tests/10ddf-assemble-missing.broken
>> + create mode 100644 tests/10ddf-fail-create-race.broken
>> + create mode 100644 tests/10ddf-fail-two-spares.broken
>> + create mode 100644 tests/10ddf-incremental-wrong-order.broken
>> + create mode 100644 tests/14imsm-r1_2d-grow-r1_3d.broken
>> + create mode 100644 tests/14imsm-r1_2d-takeover-r0_2d.broken
>> + create mode 100644 tests/18imsm-r10_4d-takeover-r0_2d.broken
>> + create mode 100644 tests/18imsm-r1_2d-takeover-r0_1d.broken
>> + create mode 100644 tests/19raid6auto-repair.broken
>> + create mode 100644 tests/19raid6repair.broken
>> +
>> +diff --git a/tests/01r5integ.broken b/tests/01r5integ.broken
>> +new file mode 100644
>> +index 0000000..2073763
>> +--- /dev/null
>> ++++ b/tests/01r5integ.broken
>> +@@ -0,0 +1,7 @@
>> ++fails rarely
>> ++
>> ++Fails about 1 in every 30 runs with a sha mismatch error:
>> ++
>> ++    c49ab26e1b01def7874af9b8a6d6d0c29fdfafe6 /dev/md0 does not match
>> ++    15dc2f73262f811ada53c65e505ceec9cf025cb9 /dev/md0 with /dev/loop3
>> ++    missing
>> +diff --git a/tests/01raid6integ.broken b/tests/01raid6integ.broken
>> +new file mode 100644
>> +index 0000000..1df735f
>> +--- /dev/null
>> ++++ b/tests/01raid6integ.broken
>> +@@ -0,0 +1,7 @@
>> ++fails infrequently
>> ++
>> ++Fails about 1 in 5 with a sha mismatch:
>> ++
>> ++    8286c2bc045ae2cfe9f8b7ae3a898fa25db6926f /dev/md0 does not match
>> ++    a083a0738b58caab37fd568b91b177035ded37df /dev/md0 with /dev/loop2 and
>> ++    /dev/loop3 missing
>> +diff --git a/tests/04r5swap.broken b/tests/04r5swap.broken
>> +new file mode 100644
>> +index 0000000..e38987d
>> +--- /dev/null
>> ++++ b/tests/04r5swap.broken
>> +@@ -0,0 +1,7 @@
>> ++always fails
>> ++
>> ++Fails with errors:
>> ++
>> ++  mdadm: /dev/loop0 has no superblock - assembly aborted
>> ++
>> ++   ERROR: no recovery happening
>> +diff --git a/tests/07autoassemble.broken b/tests/07autoassemble.broken
>> +new file mode 100644
>> +index 0000000..8be0940
>> +--- /dev/null
>> ++++ b/tests/07autoassemble.broken
>> +@@ -0,0 +1,8 @@
>> ++always fails
>> ++
>> ++Prints lots of messages, but the array doesn't assemble. Error
>> ++possibly related to:
>> ++
>> ++  mdadm: /dev/md/1 is busy - skipping
>> ++  mdadm: no recogniseable superblock on /dev/md/testing:0
>> ++  mdadm: /dev/md/2 is busy - skipping
>> +diff --git a/tests/07autodetect.broken b/tests/07autodetect.broken
>> +new file mode 100644
>> +index 0000000..294954a
>> +--- /dev/null
>> ++++ b/tests/07autodetect.broken
>> +@@ -0,0 +1,5 @@
>> ++always fails
>> ++
>> ++Fails with error:
>> ++
>> ++    ERROR: no resync happening
>> +diff --git a/tests/07changelevelintr.broken b/tests/07changelevelintr.broken
>> +new file mode 100644
>> +index 0000000..284b490
>> +--- /dev/null
>> ++++ b/tests/07changelevelintr.broken
>> +@@ -0,0 +1,9 @@
>> ++always fails
>> ++
>> ++Fails with errors:
>> ++
>> ++  mdadm: this change will reduce the size of the array.
>> ++         use --grow --array-size first to truncate array.
>> ++         e.g. mdadm --grow /dev/md0 --array-size 56832
>> ++
>> ++  ERROR: no reshape happening
>> +diff --git a/tests/07changelevels.broken b/tests/07changelevels.broken
>> +new file mode 100644
>> +index 0000000..9b930d9
>> +--- /dev/null
>> ++++ b/tests/07changelevels.broken
>> +@@ -0,0 +1,9 @@
>> ++always fails
>> ++
>> ++Fails with errors:
>> ++
>> ++    mdadm: /dev/loop0 is smaller than given size. 18976K < 19968K + metadata
>> ++    mdadm: /dev/loop1 is smaller than given size. 18976K < 19968K + metadata
>> ++    mdadm: /dev/loop2 is smaller than given size. 18976K < 19968K + metadata
>> ++
>> ++    ERROR: /dev/md0 isn't a block device.
>> +diff --git a/tests/07reshape5intr.broken b/tests/07reshape5intr.broken
>> +new file mode 100644
>> +index 0000000..efe52a6
>> +--- /dev/null
>> ++++ b/tests/07reshape5intr.broken
>> +@@ -0,0 +1,45 @@
>> ++always fails
>> ++
>> ++This patch, recently added to md-next causes the test to always fail:
>> ++
>> ++7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex
>> ++held")
>> ++
>> ++The new error is simply:
>> ++
>> ++   ERROR: no reshape happening
>> ++
>> ++Before the patch, the error seen is below.
>> ++
>> ++--
>> ++
>> ++fails infrequently
>> ++
>> ++Fails roughly 1 in 4 runs with errors:
>> ++
>> ++    mdadm: Merging with already-assembled /dev/md/0
>> ++    mdadm: cannot re-read metadata from /dev/loop6 - aborting
>> ++
>> ++    ERROR: no reshape happening
>> ++
>> ++Also have seen a random deadlock:
>> ++
>> ++     INFO: task mdadm:109702 blocked for more than 30 seconds.
>> ++           Not tainted 5.18.0-rc3-eid-vmlocalyes-dbg-00095-g3c2b5427979d #2040
>> ++     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> ++     task:mdadm           state:D stack:    0 pid:109702 ppid:     1 flags:0x00004000
>> ++     Call Trace:
>> ++      <TASK>
>> ++      __schedule+0x67e/0x13b0
>> ++      schedule+0x82/0x110
>> ++      mddev_suspend+0x2e1/0x330
>> ++      suspend_lo_store+0xbd/0x140
>> ++      md_attr_store+0xcb/0x130
>> ++      sysfs_kf_write+0x89/0xb0
>> ++      kernfs_fop_write_iter+0x202/0x2c0
>> ++      new_sync_write+0x222/0x330
>> ++      vfs_write+0x3bc/0x4d0
>> ++      ksys_write+0xd9/0x180
>> ++      __x64_sys_write+0x43/0x50
>> ++      do_syscall_64+0x3b/0x90
>> ++      entry_SYSCALL_64_after_hwframe+0x44/0xae
>> +diff --git a/tests/07revert-grow.broken b/tests/07revert-grow.broken
>> +new file mode 100644
>> +index 0000000..9b6db86
>> +--- /dev/null
>> ++++ b/tests/07revert-grow.broken
>> +@@ -0,0 +1,31 @@
>> ++always fails
>> ++
>> ++This patch, recently added to md-next causes the test to always fail:
>> ++
>> ++7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex held")
>> ++
>> ++The errors are:
>> ++
>> ++    mdadm: No active reshape to revert on /dev/loop0
>> ++    ERROR: active raid5 not found
>> ++
>> ++Before the patch, the error seen is below.
>> ++
>> ++--
>> ++
>> ++fails rarely
>> ++
>> ++Fails about 1 in every 30 runs with errors:
>> ++
>> ++    mdadm: Merging with already-assembled /dev/md/0
>> ++    mdadm: backup file /tmp/md-backup inaccessible: No such file or directory
>> ++    mdadm: failed to add /dev/loop1 to /dev/md/0: Invalid argument
>> ++    mdadm: failed to add /dev/loop2 to /dev/md/0: Invalid argument
>> ++    mdadm: failed to add /dev/loop3 to /dev/md/0: Invalid argument
>> ++    mdadm: failed to add /dev/loop0 to /dev/md/0: Invalid argument
>> ++    mdadm: /dev/md/0 assembled from 1 drive - need all 5 to start it
>> ++            (use --run to insist).
>> ++
>> ++    grep: /sys/block/md*/md/sync_action: No such file or directory
>> ++
>> ++    ERROR: active raid5 not found
>> +diff --git a/tests/07revert-shrink.broken b/tests/07revert-shrink.broken
>> +new file mode 100644
>> +index 0000000..c33c39e
>> +--- /dev/null
>> ++++ b/tests/07revert-shrink.broken
>> +@@ -0,0 +1,9 @@
>> ++always fails
>> ++
>> ++Fails with errors:
>> ++
>> ++    mdadm: this change will reduce the size of the array.
>> ++           use --grow --array-size first to truncate array.
>> ++           e.g. mdadm --grow /dev/md0 --array-size 53760
>> ++
>> ++    ERROR: active raid5 not found
>> +diff --git a/tests/07testreshape5.broken b/tests/07testreshape5.broken
>> +new file mode 100644
>> +index 0000000..a8ce03e
>> +--- /dev/null
>> ++++ b/tests/07testreshape5.broken
>> +@@ -0,0 +1,12 @@
>> ++always fails
>> ++
>> ++Test seems to run 'test_stripe' at $dir directory, but $dir is never
>> ++set. If $dir is adjusted to $PWD, the test still fails with:
>> ++
>> ++    mdadm: /dev/loop2 is not suitable for this array.
>> ++    mdadm: create aborted
>> ++    ++ return 1
>> ++    ++ cmp -s -n 8192 /dev/md0 /tmp/RandFile
>> ++    ++ echo cmp failed
>> ++    cmp failed
>> ++    ++ exit 2
>> +diff --git a/tests/09imsm-assemble.broken b/tests/09imsm-assemble.broken
>> +new file mode 100644
>> +index 0000000..a6d4d5c
>> +--- /dev/null
>> ++++ b/tests/09imsm-assemble.broken
>> +@@ -0,0 +1,6 @@
>> ++fails infrequently
>> ++
>> ++Fails roughly 1 in 10 runs with errors:
>> ++
>> ++    mdadm: /dev/loop2 is still in use, cannot remove.
>> ++    /dev/loop2 removal from /dev/md/container should have succeeded
>> +diff --git a/tests/09imsm-create-fail-rebuild.broken b/tests/09imsm-create-fail-rebuild.broken
>> +new file mode 100644
>> +index 0000000..40c4b29
>> +--- /dev/null
>> ++++ b/tests/09imsm-create-fail-rebuild.broken
>> +@@ -0,0 +1,5 @@
>> ++always fails
>> ++
>> ++Fails with error:
>> ++
>> ++    **Error**: Array size mismatch - expected 3072, actual 16384
>> +diff --git a/tests/09imsm-overlap.broken b/tests/09imsm-overlap.broken
>> +new file mode 100644
>> +index 0000000..e7ccab7
>> +--- /dev/null
>> ++++ b/tests/09imsm-overlap.broken
>> +@@ -0,0 +1,7 @@
>> ++always fails
>> ++
>> ++Fails with errors:
>> ++
>> ++    **Error**: Offset mismatch - expected 15360, actual 0
>> ++    **Error**: Offset mismatch - expected 15360, actual 0
>> ++    /dev/md/vol3 failed check
>> +diff --git a/tests/10ddf-assemble-missing.broken b/tests/10ddf-assemble-missing.broken
>> +new file mode 100644
>> +index 0000000..bfd8d10
>> +--- /dev/null
>> ++++ b/tests/10ddf-assemble-missing.broken
>> +@@ -0,0 +1,6 @@
>> ++always fails
>> ++
>> ++Fails with errors:
>> ++
>> ++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
>> ++    ERROR: unexpected number of online disks on /dev/loop10
>> +diff --git a/tests/10ddf-fail-create-race.broken b/tests/10ddf-fail-create-race.broken
>> +new file mode 100644
>> +index 0000000..6c0df02
>> +--- /dev/null
>> ++++ b/tests/10ddf-fail-create-race.broken
>> +@@ -0,0 +1,7 @@
>> ++usually fails
>> ++
>> ++Fails about 9 out of 10 times with many errors:
>> ++
>> ++    mdadm: cannot open MISSING: No such file or directory
>> ++    ERROR: non-degraded array found
>> ++    ERROR: disk 0 not marked as failed in meta data
>> +diff --git a/tests/10ddf-fail-two-spares.broken b/tests/10ddf-fail-two-spares.broken
>> +new file mode 100644
>> +index 0000000..eeea56d
>> +--- /dev/null
>> ++++ b/tests/10ddf-fail-two-spares.broken
>> +@@ -0,0 +1,5 @@
>> ++fails infrequently
>> ++
>> ++Fails roughly 1 in 3 with error:
>> ++
>> ++   ERROR: /dev/md/vol1 should be optimal in meta data
>> +diff --git a/tests/10ddf-incremental-wrong-order.broken b/tests/10ddf-incremental-wrong-order.broken
>> +new file mode 100644
>> +index 0000000..a5af3ba
>> +--- /dev/null
>> ++++ b/tests/10ddf-incremental-wrong-order.broken
>> +@@ -0,0 +1,9 @@
>> ++always fails
>> ++
>> ++Fails with errors:
>> ++    ERROR: sha1sum of /dev/md/vol0 has changed
>> ++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
>> ++    ERROR: unexpected number of online disks on /dev/loop10
>> ++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop8
>> ++    ERROR: unexpected number of online disks on /dev/loop8
>> ++    ERROR: sha1sum of /dev/md/vol0 has changed
>> +diff --git a/tests/14imsm-r1_2d-grow-r1_3d.broken b/tests/14imsm-r1_2d-grow-r1_3d.broken
>> +new file mode 100644
>> +index 0000000..4ef1d40
>> +--- /dev/null
>> ++++ b/tests/14imsm-r1_2d-grow-r1_3d.broken
>> +@@ -0,0 +1,5 @@
>> ++always fails
>> ++
>> ++Fails with error:
>> ++
>> ++    mdadm/tests/func.sh: line 325: dvsize/chunk: division by 0 (error token is "chunk")
>> +diff --git a/tests/14imsm-r1_2d-takeover-r0_2d.broken b/tests/14imsm-r1_2d-takeover-r0_2d.broken
>> +new file mode 100644
>> +index 0000000..89cd4e5
>> +--- /dev/null
>> ++++ b/tests/14imsm-r1_2d-takeover-r0_2d.broken
>> +@@ -0,0 +1,6 @@
>> ++always fails
>> ++
>> ++Fails with error:
>> ++
>> ++    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
>> ++              is "chunk")
>> +diff --git a/tests/18imsm-r10_4d-takeover-r0_2d.broken b/tests/18imsm-r10_4d-takeover-r0_2d.broken
>> +new file mode 100644
>> +index 0000000..a27399f
>> +--- /dev/null
>> ++++ b/tests/18imsm-r10_4d-takeover-r0_2d.broken
>> +@@ -0,0 +1,5 @@
>> ++fails rarely
>> ++
>> ++Fails about 1 run in 100 with message:
>> ++
>> ++   ERROR:  size is wrong for /dev/md/vol0: 2 * 5120 (chunk=128) = 20480, not 0
>> +diff --git a/tests/18imsm-r1_2d-takeover-r0_1d.broken b/tests/18imsm-r1_2d-takeover-r0_1d.broken
>> +new file mode 100644
>> +index 0000000..aa1982e
>> +--- /dev/null
>> ++++ b/tests/18imsm-r1_2d-takeover-r0_1d.broken
>> +@@ -0,0 +1,6 @@
>> ++always fails
>> ++
>> ++Fails with error:
>> ++
>> ++    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
>> ++                      is "chunk")
>> +diff --git a/tests/19raid6auto-repair.broken b/tests/19raid6auto-repair.broken
>> +new file mode 100644
>> +index 0000000..e91a142
>> +--- /dev/null
>> ++++ b/tests/19raid6auto-repair.broken
>> +@@ -0,0 +1,5 @@
>> ++always fails
>> ++
>> ++Fails with:
>> ++
>> ++    "should detect errors"
>> +diff --git a/tests/19raid6repair.broken b/tests/19raid6repair.broken
>> +new file mode 100644
>> +index 0000000..e91a142
>> +--- /dev/null
>> ++++ b/tests/19raid6repair.broken
>> +@@ -0,0 +1,5 @@
>> ++always fails
>> ++
>> ++Fails with:
>> ++
>> ++    "should detect errors"
>> +--
>> +2.39.1
>> +
>> diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
>> index fae8071d43..2380c322a9 100644
>> --- a/meta/recipes-extended/mdadm/files/run-ptest
>> +++ b/meta/recipes-extended/mdadm/files/run-ptest
>> @@ -2,6 +2,6 @@
>>
>>   mkdir -p /mdadm-testing-dir
>>   # make the test continue to execute even one fail
>> -dir=. ./test --keep-going --disable-integrity
>> +dir=. ./test --keep-going --disable-integrity --skip-broken
>>
>>   rm -rf /mdadm-testing-dir/*
>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
>> index 033766dc89..0d0e8f5922 100644
>> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
>> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
>> @@ -36,6 +36,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>>              file://0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch \
>>              file://0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch \
>>              file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
>> +           file://0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch \
>> +           file://0006-tests-Add-broken-files-for-all-broken-tests.patch \
>>              "
>>
>>   SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
>> --
>> 2.39.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#183634): https://lists.openembedded.org/g/openembedded-core/message/183634
>> Mute This Topic: https://lists.openembedded.org/mt/99851485/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

