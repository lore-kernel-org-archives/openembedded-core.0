Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE70C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 04:16:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1459.1662610596824456851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 21:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fluyyhHO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6250d0c078=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2884Ga36013311
	for <openembedded-core@lists.openembedded.org>;
 Wed, 7 Sep 2022 21:16:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=p1Ef+BXU07+YuZgEr7YLfs4GQ2BNeDGu1r+Ffa4X62M=;
 b=fluyyhHO7RwjPabU7v8hZopfTLNx0XGFlHZgkyoGl2OSQsbNB717/2RXFFsMmCHdJdkF
 YxJheFGNQaSDfx88Vm9Kc+03D5PsIdH8/1pIo9YM8nu9WMdMXbCfAUAeK+KzcOY3fX/r
 7ssa+aI22/Cf9Lj4NG9GPKMW/1F1x8F8h0789yGDpv3bbuRLCbykEpKd7ecdzNcw3rud
 f/eDtRce2jY+KmkJ2ylhFzezI2M04PVGIqCDmMB3Jx+ShP+foP0nEbAWgBI+0hNG1VgK
 LqIYTan/U+Of7Br8Xxu4gmjPVT3tGInTlzCd9eWWAS20m0FrVLRSQzxFC1+JmmoBJUn1 KQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jeh32hc8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 21:16:36 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2884GVvG012451
	for <openembedded-core@lists.openembedded.org>;
 Wed, 7 Sep 2022 21:16:35 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jeh32hc8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 21:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTBrim6VZo+jMDtf8qnWKpFMxB6J0EToKG0iguZ9WfzuH/TRY4XUE2ggckbYu6zhCaIKx6LlEwtr4bg64tbh4rDg1tSLnewiqObK35yJ/3Rn/835CKy9hSR7rRLvy6unYrH3C8kFJbfgCX4LRgbYwrIbnB69Uw3X7P7KzM8viqBTPxAKr631mA0FQx4epnU2wRamc1IKT9Am7uLKCBSBDFtTcTZvn8neLvAv1IsdOugAifbnBm8FPJl+F0JDT7+MHFCq39YPigPoxQgquVsW0rQan82Ppy68KOJQPwQdgtB4sZuzb0pTVBRVeVcV9ZOCVh8F/iDAv3inwC+5FGSX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1Ef+BXU07+YuZgEr7YLfs4GQ2BNeDGu1r+Ffa4X62M=;
 b=iEK5+CRKfSwgztm64shAhapiOe1GkbbyaWGOnr+N3OrbgkebIwG8BeQcTzDvqlOPhrLT1H6sQBZj78ghuRMmarerpts4I8ZMmuM6YY9htzDjnm3qqJaa503srDcoFfsoUMABBIsL6iuSuWgmYuFe4jbYUgJfHGkJWqvfeTIcVvMWUeyRJuDjGetlkLJi5/hDakvYOO/rXMraLLvUaoMCuOmL2uC6VNp6sR/ffXQHwmQ5KPXDl88IvmqDZC80iigk5sYf7TLPNdf3jcbwhC5ShqBpg6rLXTL/EJMl9QSdTKa4MYRmqwN/y+Mg9llslvwY1L+WcS+M0bJHMqSny91rMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.14; Thu, 8 Sep 2022 04:16:34 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 04:16:33 +0000
Message-ID: <4af7cd6a-117a-d952-7701-3c5000d81936@windriver.com>
Date: Thu, 8 Sep 2022 12:16:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] webkitgtk: Update to 2.6.37
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220903092100.3544874-1-raj.khem@gmail.com>
 <468d4b98-b086-c5db-281d-678c21522492@windriver.com>
 <CAMKF1sqBszEhk9GwnQJ_496Vpki5JftokgUfSJPBcYyp_TNnNg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: 
 <CAMKF1sqBszEhk9GwnQJ_496Vpki5JftokgUfSJPBcYyp_TNnNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:100:2d::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b547ff-296e-4770-ebf2-08da9150ea0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qd2dmbQdWJ/SeyJkGAZShV56wekLiz15k9/+11XsgqnHec59KgBTqGD17m2Y0Q2/anAw6Xk6fLEySxitLM5UpYc+opBV7s1pgdpu37cTSamLnT8GegKvmUmGrhzwun9ervWNB6VOCy95h3eOvdCRj2+z/VKgJG0XgewgsuUAP2c+7G+q5owg9taJaNykY/JLnm7YZRL4x2mDyx9/R/9fIy0zW+4273Pez4Q5RTdiWIv5WEEx2150yRKs46P2TlljfoOSKTk4dge76LR/7ZeNmS/xr9eyL1vyfGROjLNTYQBe5Uex75A7NpSo5U8WELAoxmIMv5eyXi0457emAaAidKKKyps0qMs1PMTQ5yNPcjMwHUmhk7wUsHqkB2yf+IyaqYTehx1AqUgQLjrZV3KUQPu5P86QSEvOvOoSkLpMoa7R4QoFqnS5ED9i6z5OBe/OgdlTj3/X/I3fGupYuVu53ETM4g9t5VNl3whtNsWR1EN8Imszit5Bbp7SOlIUTM0/S53mwHT1qDnE1pb+Erwf61/wWaykmH6xyiw7xXo4P9kft4Oe1WhoehyabOyXpyyJX+0AOQbKIu15bw2dTP7R51yXjitfEzChn35MBlQ9DhPGnKx1cmryGozM9iGSq04n4RaV2up0Gg29i7OSViucTZgavcpyHtjXua8psHOC8waGpeWFQN/luetVs0kPZMQE5f8bXU90tQzdKEHR3XL55gUlBCIzmccXyfWRJVa3DHu20StTfqTItPcW4ySCb8d04m4uYkdSMD5jijYj7hxwjJTQqeK+WPWwwSEqXkPV4PTA4SzvPEzgCLu8UWtidKVyGL5DjkPUhmjEZJ8cPFtmkGmmfUdtOnyMiqeaJLHtlwc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(376002)(346002)(366004)(136003)(478600001)(26005)(2616005)(38100700002)(966005)(6486002)(6512007)(53546011)(31686004)(186003)(6666004)(41300700001)(6506007)(316002)(66476007)(8676002)(2906002)(15650500001)(66556008)(5660300002)(8936002)(4326008)(66946007)(6916009)(36756003)(83380400001)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3VabmplejJSTGhMNEphUjJJeU1na2tVL2c1YlMwU0VPZ1BpelVqVEY0ZVFt?=
 =?utf-8?B?TitqQlN4MkhoMnFVSms3eWhWQmZCR2ZzME1YdXN5RUI5WVFmTTdwdVNPbHJR?=
 =?utf-8?B?L3JobjlHVjhOLzFaTEVYWG0zY29Fd25LTmRTRzk4WWxPS1Y1SVRlcmhFR1U5?=
 =?utf-8?B?NlNpSThkQXNpODRlRzAvZnFSc0U5Wnkxa3pLSkRWYk5ERnp3ZUJ5TS9FN3NL?=
 =?utf-8?B?R1JVN2ZwdnVURHBnZ3daSXRTRnlCNEZvZ0FTbG9zMEJZanI3VnoxWEw5RjhU?=
 =?utf-8?B?SldUT01qMTg3TmdvQnFQVmZ2VDYrZDVQSCtJdkhEbXdxdDI2YVRuc0pSS3hW?=
 =?utf-8?B?UjVGMGNNMkZPa3dCcWNWaTFWR0c4K2dMYWNMZFk4R0tka2w2cHlQaFdjdEcx?=
 =?utf-8?B?OHJxcUF3MVdXR1Buc3VhZEUrcUl5enp4OVZEdHBHR002clEwMWNGWWg4WUky?=
 =?utf-8?B?VWdyUlF6eTFwaHJQWllSVm1IeWZQbWwyU0haT2lYOGdZZlFPekVyUmdlWmJR?=
 =?utf-8?B?TlhrOE93bTBqSEZPR2xTRmZUZElXcW1mNzlPS2xtS2JnaHE2eWYwQTRCK2Vx?=
 =?utf-8?B?TDgrMXd1N29SWVVzZUVsc1pncU5zQis3Tk0rUmlja2JsQ0dmc2x6blF5S0o5?=
 =?utf-8?B?bVg0dWo4UDRnaXBFUWxuWE1kZHBSM2sxSGNVZU5jODNTMERtbDBJMTZURm9N?=
 =?utf-8?B?TXZDaUJrSHMxS0Z3RVVnNFQxUmtSREZtQ3M1Z3hWZURvVVhESjhYZlFCYVhK?=
 =?utf-8?B?V0NKTnBPZnpLTDhXczJ4YzBRQUZHejI4M1RmZXpBRkxBcWVmcDE3OTZmSDdR?=
 =?utf-8?B?elB1Q0hyTHB5UDdUZ0dscUxZU2pyYVBOTzM4ZGJ4S0t0eFVObUdlUVpRNzZr?=
 =?utf-8?B?Yy90dWlRc0grTmlkd1dOUjU4bDVJdGhBbHhLWWFrVG54Y1dZa2xuaWY5VXlz?=
 =?utf-8?B?SkpxVDBjSm01YUZQdWhWRHdTMTZDZTJwamdIekl0MW9IOGREMnRYdFJueXdQ?=
 =?utf-8?B?M0oxMkJqY0tkMmxkcnFmOERBZHpHcFYxQ0dKSEVwdVBPWngraUNsRDlwR1Zj?=
 =?utf-8?B?cEhQcUpsd3dlUmlqQUhIekY4d2tNcEFIK1MwUWpxWUp2eXJiOFB2ODlMdnlH?=
 =?utf-8?B?S2I1cDZYa3VmSy9Xb1BCN2xYbklwWG1GaHBmclBHamYrZ2tyWTJKUTk3NC9z?=
 =?utf-8?B?d2U2djFLRFQyaC9obXljZi9Va2hRRDI1c3hMYVZ0ZTVMdUVEUzZHeVQzWnU4?=
 =?utf-8?B?SU5TSXJESVIyZWpaaExGM3g4NFRLSHErU2c5SklpemdNTzVDNitrL3lPWXRv?=
 =?utf-8?B?amw3ZHAxVmY0MzRaTWJtUGZ1dGFzZEdrY0NJWVVENDFnN2tNUnBxcUxvZVcv?=
 =?utf-8?B?dC94NDB6MnBiQ1Y4dnRieCtUd3R3a1o1eTVmUkVaYmxXbDQ0NGJZa3ZwZXdZ?=
 =?utf-8?B?Vk5qRFcwUGRvMmo4QnlUZ2tXMWN0YStvNEFnRlgyMHp0YlBMczduTmZ0Mno0?=
 =?utf-8?B?WEphVDZScWd2K3VqMnVYUVJTNDg2cUErU0NqcXpsa1JhaUYvN1c4cjY2RXc5?=
 =?utf-8?B?cTVTM214aFFBTHRwYnpoTktTbnV1U1p2dkl2REgxU01JV2puRVMxanJpZjNn?=
 =?utf-8?B?UG1uZERrUjQweHZUbDBHbG5QWVI3REFBazhLWlR1Y2ZJRWF3N1Jvc1Q2bmh6?=
 =?utf-8?B?YkZ6Um9adWx2QTdZZklBb0VqZFVVK21wYThyQWdtQkNyek44L0hkTEZPQTlW?=
 =?utf-8?B?dkh2M0VKQ01qVlVRR0FwYzRUckd1c29jZHdTYzVvbkpKSEczQmVnS01qYXpG?=
 =?utf-8?B?czV5TGZZc040R2ZlcGZOclp4YWY0eHdpdGxJZkNtSjRlVEFlVWlrZ2JKSEYv?=
 =?utf-8?B?TG9YdGlaeTFJMEMwVmNPRDl5RzY0NDYwUHp3d2VIcmFjdVNWN0hUdEcxZHF5?=
 =?utf-8?B?T2U3VndKQnhrV2l1QWw3cmZrbDFJUjV6R0J2VzI3RUlacWNhb0dsUEdIb0R4?=
 =?utf-8?B?cW5CUURqMmZ0OWQ2YVlCYzhqckRNejBVYXBVM2t5cnUwcGVYU2NoWmx4RW9E?=
 =?utf-8?B?dXNBZ0FVZzRiQk5tKzk1STErYllaaGkrSTFhVGJvcnFaZkFseFBWWlBFWGk5?=
 =?utf-8?Q?D6qYdLgocujUF/zHM19VjGNK2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7b547ff-296e-4770-ebf2-08da9150ea0e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 04:16:33.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jQXuve8zBbn+ipa/x/VAVlXtcKuTvt9Wv2q0mSKdvyBsj7E7VWaAnvlVFEq7H8+atAopyq8yLBQAohPFS/1hPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
X-Proofpoint-GUID: 2IDu0LNmZBuJcBLGbeHmN0ANK-HjHx37
X-Proofpoint-ORIG-GUID: 2rMYXvc-UrXDx7ErJzWTHJm4FZBkgbNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_02,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 04:16:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170447

Hi Khem,

On 9/8/22 10:19, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, Sep 7, 2022 at 6:43 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>> Fail to build on beaglebone-yocto.
>>
>> /build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
>> ebCore/platform/graphics/filters/FELighting.h:72:41: error:
>> 'LightingData' does not name a type
>>      72 |     inline void platformApplyNeon(const LightingData&, const
>> LightSource::PaintingData&);
>>         |                                         ^~~~~~~~~~~~
>>
> 
> there is a proposed patch upstream. I have taken that and applied. The
> patch is on ml.
> while you are at it. Please test that patch out and report if the
> issue is solved.

Which patch is supposed to resolve the issue on the mail list?

Thanks,

> 
>> Thanks,
>>
>> On 9/3/22 17:21, Khem Raj wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>    .../webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb}        | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>    rename meta/recipes-sato/webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb} (98%)
>>>
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>> similarity index 98%
>>> rename from meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
>>> rename to meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>> index 37b977f9ba..026e24ae39 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>> @@ -16,8 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>>               file://reproducibility.patch \
>>>               file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
>>>               "
>>> -
>>> -SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
>>> +SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
>>>
>>>    inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
>>>
>>> --
>>> 2.37.3
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#170267): https://lists.openembedded.org/g/openembedded-core/message/170267
>>> Mute This Topic: https://lists.openembedded.org/mt/93436476/3618448
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

