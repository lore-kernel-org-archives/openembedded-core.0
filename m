Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B829C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 09:49:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5786.1646214594274272607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 01:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eoaA+uAj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0060efda98=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2229lqKZ007391
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Mar 2022 01:49:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=7qhosE24LQbvMwvX9aYJ1IKDqhsEw4wpFuSzDu7iIVA=;
 b=eoaA+uAjgL6VrvXO3P8SxAEKD0VCmen82Fj1UfmxsmHo9szqu8EjSqHhJk4u93yklY46
 iKtuJvZGQja64SuTFs3udDIYjJlbG2olnP8GHwz7Yd38Qe3CcssCyt7ca3OJgAQ7cplF
 vGxpvcGC2oUL6bzA9lwxj2nS7gYGocBYZzkwARXynLgRcBRPiPMT3hfOzVuSqqBrN+JV
 Y7RYGg1/lqXV5uXlQva0zHxF6Zn8yr1J1VBSrCB92OvIQgaSitEq/Rm8Fx+0Qs+UJnzi
 8ENXlaACseOiWq9bcvnycQcV0CZP0wwHIxERoWbkoq3KgzJOTy3T4LhnpeRzy5d73PfJ cg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh7ukha6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 01:49:53 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2229eu5L018326
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Mar 2022 01:49:53 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh7ukha6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Mar 2022 01:49:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTA99RYsn1ZWH06FT9CjPRVwyjgGLPm87zKY1hfGAp878+6oqETpUpgC+Z+zX/tHu5UUwJSSJtVE87AI5gLknI315bam1uRYgfBN9A/hFJ+oPZ1xqZcQbh54r5SaWeFAW8kwHp667d2lYBYNoLAk/24Djhh4l2kOluZHoZG/R2i3t+cyL7fVvgYeRFwUs4yY9Ib2WYJe4zCuj/M3rdg4znvc3x4q49NBnrNVJQLhcwXriiKWrRXI9VAVNruUywYDh0wGvuhHVHgP/5YeEaVc+a3XekITLniiKz/piCuHy3ZbsTAK87T962cZQerSySLINUxayul3xprdOt2psjQkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qhosE24LQbvMwvX9aYJ1IKDqhsEw4wpFuSzDu7iIVA=;
 b=YBMtqVUoP5VxELDSnzjCWhK9AHLQjN22Yw/oJIpvWcFQm4dRbQN3pkseXXH8od7hNVanOQa91jK+YJqlFDcM/Zn6s4kfxxI6fsUeMsGREv5/6zeJhyOVt0QY90PNvAzW6n9x+bpBFDFxqx6ez6e8fKW2MWLNQG8naKsHTxiTYpQ12msUnoWfqTKeE6tM/1OI+6Zwz75M0ztjd57/QhtUHJrJOH/pgffv2bOaW9Nz/Op2757naUkI0bua9eWBQwFMNORGi2bf/brqekXW30VLm1QARdt1c+WL+kAJ6u2e60uyepEwJe6vjxqmPpw9am0Sg6dC67I20owzAZDMWCuv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by SN6PR11MB3182.namprd11.prod.outlook.com (2603:10b6:805:bf::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 09:49:49 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439%7]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 09:49:49 +0000
Message-ID: <0c5c55b5-e8e4-b41a-21be-4279e99e0596@windriver.com>
Date: Wed, 2 Mar 2022 17:49:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 2/3] perl: Makefile.PL: Fix _PATH_LOG for
 deterministic build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1646204967.git.liezhi.yang@windriver.com>
 <d4b25c6c4a2a48da96da92bd03fe060e0cb37547.1646204967.git.liezhi.yang@windriver.com>
 <CANNYZj8Qd9uDCKQ2M_X35O__2MeiSJEP9A1J9TJzZsi+y6OCOw@mail.gmail.com>
 <88666595-4acf-5d7e-eb4b-23cd28b9929d@windriver.com>
 <CANNYZj-MEo1k9sH+qkN=kewT0B52scf6ZRWPsj-rvBO+dHxxnA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <CANNYZj-MEo1k9sH+qkN=kewT0B52scf6ZRWPsj-rvBO+dHxxnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0202.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::24) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86f12d34-b083-468a-0052-08d9fc31fdda
X-MS-TrafficTypeDiagnostic: SN6PR11MB3182:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB318286FD7237FB0ECCEF6D3DFF039@SN6PR11MB3182.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7jSYhqVC5XrQ5qDO6tLmoke/YVOR/tNTPJFOAPF1jWle5mOymG/Pk3dLdXl/aIx7HcK3czkUm4Hq2tiqQvUaqueY8b8m3vvmBMA+7LqswE2AC0bUsZxwijy3TSWLR7Yh9dqarjQ6laPv6GzlQeAitHwCCrKRc5o2S2zPg58KxHzQN61DLFg+gV/Flygc49GTZ+seF5ET0zogu0L9nbT5gMxiB/zTUR4GJHAyShl8f0GQn0W5+egMu9lviahrGVeJ8FC3K9OiynXxWYZQnyEFI2wKG/Ic7MH8P7jpUprZIJtrEhJyE/b9KfY9wiAcRdDz/sWFTeRlYl+TS47WnjcrxXfilEl8mZ+G/MHuGlOeSp5WA4x1ykp4ufT1uc6rC6tnmgA2DPrdDJP5nXDbip43y15HTlswWGWD++lAhi5zJGlxTKwFPBu4rckE6fH0Z1c2Z42YcVttIcSAUioEwczrIGwLICzWYdbSeZ/SQ92Khdru9DjqI6IdHqD3l60/WOMmOvTEswZL6TVhLPVTridx/Vcutb3ODj4uAyKmdZSzx6kq6Q80b+om5FxmM4v0ZO/Y9XeOIbqXuwJT15OqKjawLrHsWrwvEpQ+4LJdP2iLTX5jQGYLG9UNcKEId2ErVqxt0fo3EQPcO1Kfo9MxB8sXt+c3mSQFgH6viqbg/3LNisx4shhgRZqoos0BNRozSxXaeGzVm48lM0oHMba4c9Xhlz6QcRNGVA4DCrITdrFIHyyekmLfds+yANTmcf9XhHxMUgEVYB9bJzJZGOV8f2jBRN6T+yf7UwMHGE6oaqj4OGnQA2uJX4eBTLpAVCzxCzsFT80relXTHqop/XoeOBoVhFbl8w9dddlwNM656XipfHjO0FGDWvh+P4nmWQD4Yk6O
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6666004)(6506007)(36756003)(53546011)(966005)(31686004)(38100700002)(52116002)(508600001)(83380400001)(6916009)(8936002)(2616005)(86362001)(316002)(6512007)(31696002)(5660300002)(26005)(38350700002)(186003)(8676002)(66476007)(66556008)(66946007)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDRrU2g4QVZBcGhKamhreUt5T0tmQ0k0VGVOQUJtSmcySXhKd2c5WUtHS0cz?=
 =?utf-8?B?bTl1S3hrSi9oaEZBNTZtRE5wZ3FQbmV4RmFNTW1BUVpncVBFdmxqWGZGY0Fq?=
 =?utf-8?B?NzZSNnlUL2tPSzcwZ0JyMGxFREdKZlRYcXQveDFJUjBPUTE3NW13QVdid2JG?=
 =?utf-8?B?anc0T3o4RUFhWXBxZSswTUVoOUVkSGJUQ0psa21WdTl4ME5qU0N0MlpENTll?=
 =?utf-8?B?MDV2Sk51ei9VMDNMTFBGMlJPVDhtWlc5NGJidHkyRitpeWFQN3RjZlhpMnB3?=
 =?utf-8?B?eHh6V2ZNWlpydldaNWRTQjFkRTVLUlRiQW9vSi9mTU1jN0tMM3k5TnJXMFE4?=
 =?utf-8?B?MnVQUGRqVlM0YnN5ZG9jVjZRL3dxWUdnQWJMejQzU094VWprWlR2TFZkS0pw?=
 =?utf-8?B?NThoM3lsWWptZ1UvZkpERVQ1QjczQkNZME9PTzE3MGJKa1JxUWQwdHFJTUNr?=
 =?utf-8?B?a2pWc0orNFJWUWl1ZzZadTVnVHowQ1RrTi9SWlpZT0oxKy8yUlNpVnRxWVhu?=
 =?utf-8?B?d2luanpoa2dzdjNiU2c2YVhlU0RGcXVBN3l4V1dmcTBaR3NPSldMbnpHUGlv?=
 =?utf-8?B?TVU4OG5BQ0g3UE1VOFkwcUZ0c0FDZjAvOXV5VVZDZnZRNWVUQVQ0c3dORnc1?=
 =?utf-8?B?TDBTa3l4eDdFSldSWnZMM2M1RkE3cjZNcHc5b3JGZUJVUWFQYVBpK0laaERC?=
 =?utf-8?B?eEJHYk1DY0pvMGxGTms3NFR2V0gzdXIzbnFqdFd0OFZEVUZXSzBpNldFdjF4?=
 =?utf-8?B?TityVzVTbjRsdE1tYmFQOUNFdDNsMnZLMFhPK05lZnA1RjJ4ZmFJamcrUHBa?=
 =?utf-8?B?SVF1VzJQMFAxTTJhY2pGT1ZCaDFqYjkrNHVxZkIrWWdHdzluUmVqTldCcDJy?=
 =?utf-8?B?bFBtZ1BNd2J6MVB4a1VMNGhrbUl1U0xJQStteUg5UjNNZzJWUEMwb1U0TnF5?=
 =?utf-8?B?dWtQZHRMK3BMLzNPZm9iZVdsYzdEMkEwNUczZ29FZlVDeUZ1YXBkQjk2WThR?=
 =?utf-8?B?TlZiS25ESkZnMHlEK1ozTDVlMGNHZnR0NG1MZHQvS2p3RG1KRDFZdEx5ejVT?=
 =?utf-8?B?MUY1QU1YVm4rTUhlUEFqRjk3QUtZck1BVWxkaTgrVnQvTzZ4VU1HZHl2enBE?=
 =?utf-8?B?T2ttbDREazk0ckgrRHIzOTVDeUg3NUlMd3hRRlY2TERuQk9MYXlkbmh6WCtp?=
 =?utf-8?B?amppK0tzaW1DMkZrNUo0SFZHODBmRmxWUTFBRnBXOWdwalZYb0N1UXNWMG44?=
 =?utf-8?B?TWJSWldKYU5yQmRLR2g2TDk2RnlrcG5NMTBiMXhPTldGMDlpUmtETUhQMm9G?=
 =?utf-8?B?RHlDS3M2R3RSeW0zMFFsL2NWd3ZVS3hCZm1QM25KelNvdGRXMnJxREZ0bXYw?=
 =?utf-8?B?ZkxvM3RNek10VjFsamxDVHpPU2xZUlg0ZlJmQ1JJcSt4MjgwVTVhNkx0OHlQ?=
 =?utf-8?B?SkFhNFhGbXhhRnBGcDZEWTdBLzN6TE5LUDNKcFB6QnVsVE5iRkFJZjhoNlND?=
 =?utf-8?B?ekoyVFAvd09taHoxZ3grRUY0NFFYQ0hvUGN3bzJITmxRQ1Rib2tERHg1dWow?=
 =?utf-8?B?eTdReEl4YzdUaUV0L1YrYVFpQ3M5MzlBSWRiL0E2bXlvOVRscWFMVGd4ZDJZ?=
 =?utf-8?B?Vit3RGt0ZnljNmNLLzZnQmpUZk1CMjI2c29pTVNTMzFQU2ljMmIxUU1oeXBP?=
 =?utf-8?B?dEVtWXVhZmUwUlhRQUhEaGJlSWZTelcrcVRiL3NQQjdzdGZnMlJ6Z1gxWVMx?=
 =?utf-8?B?NXkvVEFYbXBGVWdwcUxwdmp2YlNBSlNLcXRhREZRSGVQNS9hY0ZzVk43Yk0x?=
 =?utf-8?B?MnVSYXNJRDQrTDN0K3VTNWpZTlRGcVdLUDVjTGZ0RUhLdFdtY3I0Tjl0bXMx?=
 =?utf-8?B?bXh3czNUQTZMdng1ZTlHamw5eldCYTNYbjRaTjg3UXVFenRNY0VYMDFGTU5R?=
 =?utf-8?B?bEZmOEhoSC84d2FNbUcxVFlhbUkvS0NVVHJrQkdSbURpYmtqNzJlUENMYXZN?=
 =?utf-8?B?UmlvblE0eEZvaTVzTmVKWENKZTBKbFRMMUVCcGcwQkNwM0pMZUowUE5COUpT?=
 =?utf-8?B?ZVllajlnRGhqVzlmSG5qT2pEekhPRUNYNFVadHgvTW12WS9FWG14ZE5TZ3pa?=
 =?utf-8?B?VGgrbXJHQ0dCSCtUMWxqVzdiM0kxanlsZXJ4OHJkMVBEU09hYnBEcVFkTHY3?=
 =?utf-8?B?VFJSb3RMNzA0VjJjYmJ3THlIcGdpaU1VTmVJSkcybjE3U1VOdll4UStNZHVZ?=
 =?utf-8?B?eDRFQnoxMzlIekNibi9LSFJHMUlBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86f12d34-b083-468a-0052-08d9fc31fdda
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 09:49:49.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hLnanzTGD0QHmR5JsEQjglB5zmxk5dSNG+HGruolfw+JMgP4rkG7iZpwzyccJSzZ+yezKny/Xnac9JIXR+e5XzYA41rxtnXn63ebdez+Qb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3182
X-Proofpoint-GUID: 3UDEVH0uitqhPQZVv3JEQt0btJlYhpkt
X-Proofpoint-ORIG-GUID: NarfGRV2SQ1pmIAiWMboG8rLimW-iO9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=977 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 09:49:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162602



On 3/2/22 4:48 PM, Alexander Kanavin wrote:
> Yes, but you do not need to submit the patch for inclusion, only to
> file a ticket, and ask upstream what can be done about the issue.

Thanks, submitted a ticket to upstream and add the url in the patch:

Submitted a ticket to upstream: https://rt.cpan.org/Ticket/Display.html?id=141612

Upstream-Status: Inappropriate [OE specific]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>


And updated the patch in the PULL:


   git://git.openembedded.org/openembedded-core-contrib rbt/deterministic
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/deterministic

// Robert


> 
> Alex
> 
> On Wed, 2 Mar 2022 at 09:47, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Hi
>>
>> On 3/2/22 4:42 PM, Alexander Kanavin wrote:
>>> Can you file a ticket upstream for this please, and include the link
>>> in the patch?
>>>
>>
>> This patch won't work for upstream, only work by cross building, let me check on
>> how to make it work for all cases.
>>
>> // Robert
>>
>>
>>> Alex
>>>
>>> On Wed, 2 Mar 2022 at 08:13, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>>
>>>> It checks host's path such as /dev/log and uses it, this doesn't make sense for
>>>> cross build, and it causes undeterministic, for example, the contianer os
>>>> usually doesn't have /dev/log which leads to a different build result since
>>>> other host usually has /dev/log, so make it always use the default value to fix
>>>> the issue.
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch | 34 +++++++++++++++++++
>>>>    meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
>>>>    2 files changed, 35 insertions(+)
>>>>    create mode 100644 meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
>>>> new file mode 100644
>>>> index 00000000000..f6bcbce6856
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
>>>> @@ -0,0 +1,34 @@
>>>> +From a73fff1fcf0def4ce93964f1b63fe3ad0967259d Mon Sep 17 00:00:00 2001
>>>> +From: Robert Yang <liezhi.yang@windriver.com>
>>>> +Date: Fri, 18 Feb 2022 09:44:26 +0000
>>>> +Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
>>>> +
>>>> +It checks host's path such as /dev/log and uses it, this doesn't make sense for
>>>> +cross build, and it causes undeterministic, for example, the contianer os
>>>> +usually doesn't have /dev/log which leads to a different build result since
>>>> +other host usually has /dev/log, so make it always use the default value to fix
>>>> +the issue.
>>>> +
>>>> +Upstream-Status:Inappropriate [OE specific]
>>>> +
>>>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> +---
>>>> + cpan/Sys-Syslog/Makefile.PL | 2 ++
>>>> + 1 file changed, 2 insertions(+)
>>>> +
>>>> +diff --git a/cpan/Sys-Syslog/Makefile.PL b/cpan/Sys-Syslog/Makefile.PL
>>>> +index d09ba69..d44e58c 100644
>>>> +--- a/cpan/Sys-Syslog/Makefile.PL
>>>> ++++ b/cpan/Sys-Syslog/Makefile.PL
>>>> +@@ -130,6 +130,8 @@ else {
>>>> +     $_PATH_LOG = "";
>>>> + }
>>>> +
>>>> ++# OE specific
>>>> ++$_PATH_LOG = "";
>>>> +
>>>> + # if possible, generate the code that handles the constants with
>>>> + # ExtUtils::Constant, otherwise use cached copy in fallback/
>>>> +--
>>>> +2.31.1
>>>> +
>>>> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
>>>> index a97da872032..8a1db7ed359 100644
>>>> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
>>>> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
>>>> @@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
>>>>               file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
>>>>               file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
>>>>               file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
>>>> +           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
>>>>               "
>>>>    SRC_URI:append:class-native = " \
>>>>               file://perl-configpm-switch.patch \
>>>> --
>>>> 2.31.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#162590): https://lists.openembedded.org/g/openembedded-core/message/162590
>>>> Mute This Topic: https://lists.openembedded.org/mt/89496472/1686489
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

