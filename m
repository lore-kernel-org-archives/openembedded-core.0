Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60891C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 18:55:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3105.1693421731682578505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 11:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rkxmOw+/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7606fd071e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UBxa1O005528
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 11:55:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=R/QENPxIVdI5RwWwZCf
	tkUW4u9i1G47C2hq9o/2RwjI=; b=rkxmOw+/YBE4CRhN1EYYcCwDLFaAQBDL9Tg
	zYWkUQywXaGnTbc8IcwyKYPx6Pej+zUKa0B2rX4iTS/hwZELA3/dWtv7dyPPrb5Y
	598p7SZ2qBq/rUEC9AlOiIck5/cv8piFO66KolGce0v/MGAaWrJRC3nWW0oeD2Xt
	wKoR4fddY74N1YkUtpobheL0YMiO7cKEhDbyDmkBfaOSxXs8y0xRuMHNWW9+GWG2
	i5L479uvXAUI3R1ZKdW+DLaMKYVQQp0jgo/ErXImpP14W68NIpPAo28EauwYTeMi
	EtQdJvt8dbqoWC1H0XB4t8h1vqxjvkngAyJJ6iLJ5MhsIp+ipuQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1by87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 11:55:31 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37UItU9E020397;
	Wed, 30 Aug 2023 11:55:30 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1by85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 11:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq1NCJusN3YQdb7rOo6xOPbnK5h886qrtR1zXZB8UGCjG8yG0ky7FoV6Nwexik5kQlod0hytUFSgB87xSVFMheEnobfiJEcg7sVuLBl48nRBfWBxnrTe79HiFpIvTv1e/Urde3XOJQFJa4OyL0VYELim04wPtXnBu4ZkQ9N51CRD0hGizKgWP/sAkGyAXNyLP9q1xCjXROtocy8vcsOIiqx/gec4Cjjfr8dzH+ceIV1AOoLU4QD5iuyayW4XC+FRhzo5JRdiB3lEAL8jrL5Dz76M/bOtSyszbstL1q4kwhot4Didqzjg4aPn8PIxJjh1y3zSma+VPHvKedDbvCTXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/QENPxIVdI5RwWwZCftkUW4u9i1G47C2hq9o/2RwjI=;
 b=at4zzjvXyCjjRW3egDbIJ9Ed3MdYfoSrus4mct1SGWq/TGmVa8GX2Hm97yVXxrxL3PUfoOV4T0llA+y1aZBVZC71V+4BsDw5c2g6tX7CSuPJ1oGMyae9HmOzC8hXinGQ8l72UxxvyQ52/+HKJFgCif5Ecy8safPe7H5/ePW84PcL13nJuofyt4SvJFD59ybvJZQ1PGbyZ/cLcdcg6xosezLXBu7MOKmyYNU2HmCQTYLz89q/fMUtekaSe/aSQ7Ls3K4DT26t+viALHBcup27LzzZNLKptbnLNT64lpKu3gij9r93Bm9YHUDqAjVwbNb9XXmVX2u5MOCL/uP+Gn5AZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5808.namprd11.prod.outlook.com (2603:10b6:510:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Wed, 30 Aug
 2023 18:55:28 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 18:55:28 +0000
Content-Type: multipart/alternative;
 boundary="------------R00JtJiOoPdtJdyjONXDwjs1"
Message-ID: <38935b1f-8d2c-64fa-8637-448f669ddcbf@windriver.com>
Date: Wed, 30 Aug 2023 14:55:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-Core][PATCH v2] rust: Upgrade 1.70.0 -> 1.71.0
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Shinde, Yash" <yash.shinde@windriver.com>
Cc: alex.kiernan@gmail.com, Ross Burton <Ross.Burton@arm.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230719063134.2831-1-alex.kiernan@gmail.com>
 <CBFA8483-1067-4E50-9FE2-18F4DDCE3640@arm.com>
 <CAO5Uq5QB7wLKtHvfbx57jE9=O195Q2afQGYrQkTgJQAV4=wx3Q@mail.gmail.com>
 <3848ca50-8562-d5f1-5178-69b55c8dcd8f@windriver.com>
 <CANNYZj_WLs2V=DtsaG7XH862Xn2rJnn+bZZBbVd+5J=Wh_StXg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj_WLs2V=DtsaG7XH862Xn2rJnn+bZZBbVd+5J=Wh_StXg@mail.gmail.com>
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c5dd20-536e-42e3-f4fc-08dba98aad5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wz2531b48LXqEM+wvjj8wWDIFkxC5Fk2UFvnHv4i/uI7jBeJ9CzdrOaIBo9pRu6nvMv53uWFSyhvn65xHU03UQsCDrL9rf85emnmGdpdBNteGxeDIsYUQMxlwWJHkbFkKST8XY2f1hHzXAi9s0zQcqkj/Ys6FGGWrNWFDxvbElo3oSdX8UMN9KIUTnWg/GW0IQah/64L+0qHpCaAZOdROp0G5xZaRwwqy70d3NbFpeoDsfV6remuz/IyKeo4cTK/j43UYdiPaPjpHgJDyeh7X7NR0s2cdOauWKU9kcVSCATZa1/FJgOX2PnxKb5RNMPFYkItNdvfznWKdCa01DFBcdKLGpovNhbyfPeVnnPxZvZCVK5Q9SU6MnHWmYB/BZr2291w6IqJSUyFEK2weV6AusK+qTJEKIJpLsxJqhSz89rDwIZH4Q1QnkuPxDZxYtKylt0X/zMqhm7cl3K6KSgTSgYJXPCnqOZ3Z5zrvjy/GAOOOr+ShoZ5riTQW5QiEI9z755Op3S+PxaBbfb3XTtUijisWUVJJxs3u/yHLb4R/M6hSCYLdFem5Hmpp+i2MjECbDtT6IuyL+Rjzn4UrNOYMLtko3+AAjacnp5PS+zaL74wj4GXmuH4tDJmkg9jX60crY4q6ezBJanvKrdB7J/fTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(396003)(136003)(346002)(376002)(1800799009)(186009)(451199024)(31686004)(6506007)(6666004)(6486002)(6512007)(166002)(31696002)(36756003)(86362001)(38100700002)(2616005)(26005)(2906002)(5660300002)(53546011)(33964004)(478600001)(966005)(66946007)(110136005)(4326008)(66556008)(41300700001)(8936002)(83380400001)(6636002)(66476007)(316002)(54906003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SE1HU3lzc0hqczYvV2xCbFU1dkNhdlZuajZybHUwNllLWUFadEtJbEVMYlEy?=
 =?utf-8?B?OE9Hbkw1aDJDTzJoMC93cmRrR1VDbW5vdFpEN3R0ajdYd3dLa2NtNlpTcjNt?=
 =?utf-8?B?NUJLRUY3Rjk5SVUxOURtMGplQjVVMkl6aUdYd0JWOTlab0hXb0QvZDMxeFhn?=
 =?utf-8?B?eHoyVDYwYzY1bitJMmJtVFAxQWo2bFVxbE9JS1JpTXpGNVl2d252MEI3ZExQ?=
 =?utf-8?B?OHo5aVRpUkhkakp3Sm9QWlZrcEtzREQwVVFUbFFTaUNJRlo3OXVQQUdVTURO?=
 =?utf-8?B?T1NERnNvSmxCdjNDWGlIZkk3UDdTRVMvRFVWakhQbVRTZXlEKzdacnNYRS9r?=
 =?utf-8?B?REM0alNQQ0FhSTkrWElMeWFWUU9HczlrWDhxSDRsbjRoWWU1bTJCMHVpWWcz?=
 =?utf-8?B?UzkrbW9zbWxwZExwNThMeldIdzNsOUtLSWxsYmlHdTRlRlpYYW11Z0paK0dT?=
 =?utf-8?B?ZFRLZkxsTG9FT21TLzZMY0VMa2FNRHpJZzlqWVV6VUYralhsbFlFY2I2MDlY?=
 =?utf-8?B?YTdXRnhyQ3BtMFlqaEJxQUhNc2tqY3lHVGd3Z1c0akozdXk2NFQrU2lrbFpR?=
 =?utf-8?B?L0ZLQ0hsOTBEUnRFUmNWZWpVM3lucTRiNnFhb2JQM0dQaHppSC9RWFh2Wm1O?=
 =?utf-8?B?SkxQQi9FdnpTd1FYbWJPLzRNUnhob1ErTzVGNnpNMWpNbTRWMTJjdGNUMlV5?=
 =?utf-8?B?dXJ6MU5GU0RsWXFpLzJKeDlIbHloRkdFa0tvb0hORUNwYkUrR3FiMTNIZlpz?=
 =?utf-8?B?UWhFdWRXSFJKVGU2eDFyM1NFcUd2NzBFRHE5azlpK0Z6L2Fmb0trM3laYWx5?=
 =?utf-8?B?NmVrRW9Xa2drZVZQblhFWHhGeFY2MkZqcDA5bTg4WVVtZzJYSy9sbTZBYjBW?=
 =?utf-8?B?akpoSjAyRDJsQUppYTBGRks4WUd2OWZVZkRuaXRkcDJkR2tkOUJ6cHFxNVZz?=
 =?utf-8?B?QjRPL1RoMlp1UG90UTdJbllTMUlPVmxBdkgyV3BtT1dGMnBQeDU1MVRFL05I?=
 =?utf-8?B?eCthRXJaUmgvV0tXcXRjVjA1WHhIVVRxbzg2cC8xbWw1TmdpZTVRNEo1VDZa?=
 =?utf-8?B?aDY3TG1JYURwR1BrQ2c4UFB4S0gwbVZCSEJDKzJIYTNBRzNieGsvUlQ5TjBI?=
 =?utf-8?B?elBNb3ZWVzIrUjBoeVlyZnltc0dVcU05WC9hSTJSTnJFZDhBcjlXelhxR1RX?=
 =?utf-8?B?Y3N3WU9sTXFCSVgvYWh6eVlLMGEvM0xjbnQ4VFdmRGFpL1BQODNxN1o0ZkFC?=
 =?utf-8?B?T2VyMDFmN3VUNm1HQjN2WExmSE9BbFlDczBvOFFhNzdob3hqVWQrWmhEOE5C?=
 =?utf-8?B?TW1JVUpwSVFpV2t5Mm12aDNqREtyT01FcFpUVTdmSGJjV05kSFRiRkU2NlpK?=
 =?utf-8?B?NlFXWUJhb1FPTlAxd0k2TVRGNHcwMXdOUWdFQkxReXhhU2FXRjhqRi9CWWlz?=
 =?utf-8?B?VGFZUUR1SmdSS1VpRWlmbkhUeW0rWGx2Qk5yMnhrRjAyTU84NGdpcHdrYU9Z?=
 =?utf-8?B?dGhCSlA5SS9YOVQrS2d2Q05hYS9wYzhQcDhON29hcUEwNjRPTThoZUNERU1O?=
 =?utf-8?B?OHhweGlPVTJPWWNNbGJscmR2Ty9tdnFKdUUwTHdiWlV1R244N1FiMDZnNXRI?=
 =?utf-8?B?K2pramxIQnpjTVBoZDhjMzVBSTkzS0pnYmpTb1dqN1lJNWlrUnJoZ3dLanRZ?=
 =?utf-8?B?TGo1RURUTmhPc1FBbjhHS0x1STJJZTJpalEzd1hXVjRpZGdVYmhqeFhqT0l3?=
 =?utf-8?B?TnNzWis0UTdoVDdFUXY3V0ZjZWErcjd0bG4wL2FZVFlYaUx3Y0VYNDJNZmxv?=
 =?utf-8?B?UnZkdHVpMitzV0hnSHpkanBhd0ZIU1A2eUljNFVuSnFQMldoZFRXWUtXK1dX?=
 =?utf-8?B?WEdPcHhEYzJKWFJhdnJqcnJjYUdBaEdKRGMybTl0WVczeG5ab2RZSDFabUFF?=
 =?utf-8?B?Y1ZwT3pqVEpONWFxSkg5SnZjc1E4MlJqNlhxZSt3cUo3TE9ZRGRJSWI5RXpJ?=
 =?utf-8?B?ODJwTkZzS0ZaVFV0Wjg5cnkwWEszTjQ4WGNnZGtBb1RUNXVFdEF6dFM1Mm9t?=
 =?utf-8?B?YmRERmtvVWhxM1F5bllYZXVCakYzQ0xKanNBOTlXRmpNUUoreWxvVC9PMEVh?=
 =?utf-8?B?S21PRi8vV1NWeTI4THV3S1YvZERFTDJteHNudlExR3V5WXh0WXh4aktEaDdz?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c5dd20-536e-42e3-f4fc-08dba98aad5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 18:55:28.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AR47VIKbwMv2s1M79MMXn5Wk5uK0ZRzlrLWq9Awz2MpY7yF417fGnd6eTcdBOwwRor8kKAmO7kPsQCEYi+ubycQUNcCN1ocSkhwE/vbgnBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5808
X-Proofpoint-ORIG-GUID: 0GuPDUKDbpXNI-T1_UVhgiGM275J1Nrn
X-Proofpoint-GUID: udQ3JipiX8Oy6rRcu7l3y6sGty0f9aRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_15,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308300171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 18:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186923

--------------R00JtJiOoPdtJdyjONXDwjs1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-08-17 03:46, Alexander Kanavin wrote:
> If you already have a patch it's better if you don't wait for new
> versions. New version may require significant additional work, and by
> then feature freeze is in place, and then we'll end up with no upgrade
> at all.
>
> Alex

FYI,

There were some problems with the Rust test suite after the 1.71 update.

The 1.72 upgrade is done, local build/runtime testing of that is in 
progress and Yash is working on the rust test suite using 1.72. He hopes 
to have patches this week which is late for M3 so we'll see if they 
squeeze in or have to wait for 4.4 to open up.

I've pushed Yash's rust update to:

https://git.yoctoproject.org/poky-contrib/log/?h=rmacleod/yash-rust-1.72-wip 


in case anyone wants to help out.

-- 
# Randy MacLeod
# Wind River Linux

--------------R00JtJiOoPdtJdyjONXDwjs1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-08-17 03:46, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_WLs2V=DtsaG7XH862Xn2rJnn+bZZBbVd+5J=Wh_StXg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">If you already have a patch it's better if you don't wait for new
versions. New version may require significant additional work, and by
then feature freeze is in place, and then we'll end up with no upgrade
at all.

Alex</pre>
    </blockquote>
    <p><span style=" font-family:'Sans Serif'; font-size:14px;">FYI, 
</span>
</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">There were some problems with </span><span style=" font-family:'Sans Serif'; font-size:14px;"><span style=" font-family:'Sans Serif'; font-size:14px;"> the Rust test suite after the </span>1.71 update.</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">The 1.72 upgrade is done, local build/runtime testing of that is in progress and Yash is working on the rust test suite using 1.72.
He hopes to have patches this week which is late for M3 so we'll see if they squeeze in or have to wait for 4.4 to open up.</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">I've pushed Yash's rust update to: 
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;"><a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-contrib/log/?h=rmacleod/yash-rust-1.72-wip">https://git.yoctoproject.org/poky-contrib/log/?h=rmacleod/yash-rust-1.72-wip</a>
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">in case anyone wants to help out.
</span></p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Sans Serif'; font-size:14px;">
</span></p>
    <p><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------R00JtJiOoPdtJdyjONXDwjs1--

