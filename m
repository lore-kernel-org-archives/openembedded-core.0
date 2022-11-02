Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED743C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 15:35:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.7823.1667403321801940851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 08:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q5TGEg4I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=830590c779=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A2CVAmo026558
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 08:35:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=ssksSszcPc75+EHymDaqqR80ug8n19ChB18gCgzyY+I=;
 b=Q5TGEg4IcrTruSpihVu1RJswwrYgYN+sSVAU77ntC+2b/sFw3sLEO4ZnhFgyEjTkjNgx
 7k+SDMIxeg9gKCSaFsg2hyWb59GMBZpMsdYnJLbFoCKPOFFlGVfDnJtiWaVA77rsLZBc
 Ay3/fe1MvSW/upjrQn33NVeL4AeJ6OyNXyG1iN5g0FbQ0LWu5dp1KBf5ltfRNpTYO0AP
 AKuRm9mcKtQz79nFqk0OVZAMXv5aclFeAqLvNlPeONMk/ojouSIky0E3sDJ/suFO+Nek
 Ol2g7rOxvYv0FflEnYpSc4682kpYYCpfxaMEfu4NA5tyjqrmSwDcDSnOTHcZUKeYgrnX Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gsafv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 08:35:21 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2FXxFo030082
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 08:35:20 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gsafuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0JmJ2gZ0uJzPQa1rbLzOUTeQLXvC1W4X2JlT8MHtQjGkOig5aiiSqbxW2w3knQ+8Umy98vudUBAuMKdcl+ZjnP9E7GC/eq9j9Eltu2MbZn1h6RYFWKNhMxM7s8ngc9BGLAsXYL6BNsHRxluv0UL2x0WqjY6wvbtujhaTP7eNwJIUZ6XHaYy/0AC0sA1k1xdTUF9H+pHg6KdVSzbJwJu9SDtE8e5CK4Tio7Ap/hxzd96xX2Ymgc1Em2rYEgOcOnb7DV6YTnCAVIiw9HqUQfRjiSW6WagjlIPq2xmR5g7mcAyHlNfOagD7qoZVkegf9HCm/TlCy6qgZHYz5LM6xekfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssksSszcPc75+EHymDaqqR80ug8n19ChB18gCgzyY+I=;
 b=SAeuYvi++odMfvFaHyTEdyhW9s1yQWo6lOiQjEFSnRvg9Y7Im7g0ofdPHiBffFmQjvAgIsqUWZh3O9lMZrO7vCDQJLYpOm1qjeCFBGpbhlIuY14DjC7tgFLiXOTq5Cc4HRuxJvjC2+VlHH4kncg7Df2VYJgzUT2aa1C3nIETvD2ewpeBM80e1jMV6P7WXr/7f9jnzebvWl2jYW9U51Z1v/hkoeQrHWI0qMoSuG3SDMsMAbG8auPImnwmoseWJBWzZzdcIU+7gD99HuFgkhQP+tW3tYiaMZAEarzOHAZjnYrg9pRvrje7sjnN8OmA93fCLPpe6uYCBlOkBuF8L1SEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Wed, 2 Nov 2022 15:35:17 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 15:35:17 +0000
Content-Type: multipart/alternative;
 boundary="------------Dg36BIL4m7I0wLg09h0tQmHr"
Message-ID: <cd94ea37-4164-08e3-f7bd-2826006d2070@windriver.com>
Date: Wed, 2 Nov 2022 11:35:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Dunfell toolchain update analysis
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Cc: "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <4af9fc74-3b02-57ca-7aa1-d02a90f0f621@windriver.com>
 <CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: ae546ccd-1541-40b4-7233-08dabce7d81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SzwWbOfay5iTKFk5EXUs9gvgKxp6Flw/1F0JBR+gpR9nCw5TKkEEeas4UNHNDW0bDVkCIxZMo1wO2skyKowTs7dUpmjL3UhoJythMbThMxcLl4rX7733jPsxSjFVN/us2JZPZxXaSsMkVFq3RJjuEKewFZu70S2b0bpJlms4XMGZ4McHBuTiqkfUIdtibnPIRCtPe33jVURj10kAgzGvQ6MBEZ6Z0b67n9TL63D8gPLzCSmOfzMhlAIsPgZDL0bOLblINR4tFRP33R0tktxM8sm+TxOYJtw4/rzT84lHsGn9CYCAHfIAODMLhQZGyFt3AjrGXs5oVlEOIobPASFQUxx5Nv5tM6hJYHDlf0FPqHttKBjZ6/nLivxnHfLGmhcQJJ5gbWvBhaSPOWoafi7IbgYFtXjsGZAlkbLRxSjnp3zwpgKqfvfCpAnDxvgNwXWAPR1QCYrBvH5fI/YrFhRH05+wq5KPm8X0KRTRp1hQ5KYHhF3lGH3kYQKFOm8P4GP6PgjgGEH4fQpBrKUyQalXdnSxG6bGFQvzZ3SbhpHTsuIBTTmR8nP9QdGh2Dr4aGAiu23fWx2JVM2Bs7M/UJvJdOvusWa1d+raaTq1Hf4kgZQii67rRDJafMCfjfMqMqAuZ/mtB8uqoyWyGbVT5TZd1VGkIEvjwBnTJazdmpw9BDKdV0/YueV8RwmTpHehS8ZD+dyxbEmJEDGvvp4dBK7N5Ne1DGLp/1xPXOMPre4LzVpNcldeEqJftmF3F9cjujbFLZe6qr1boDwt5u2pSsBMx/0cMwlDBusO6lW9yRYg04Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(451199015)(36756003)(15650500001)(2906002)(38100700002)(66476007)(5660300002)(6666004)(8676002)(4326008)(66946007)(66556008)(6636002)(54906003)(6486002)(316002)(8936002)(41300700001)(110136005)(83380400001)(3480700007)(31696002)(31686004)(86362001)(2616005)(26005)(186003)(6506007)(478600001)(33964004)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEZCZFpqaG15d1lidGRGVDNiVk5KZktURW5DRFhsZk1zZ0U4b3V0dk84NTI0?=
 =?utf-8?B?a0pzblFJYndoUDMxVUpUYUhOdE1aSTZFbVN0S205NTg5L1lqL3pZeWpuTkx2?=
 =?utf-8?B?dWI2SkpxKzhzVW5yZEZKelp1WFNoWW42anRscGV0eVpjNkdwVUs4NXppSWVL?=
 =?utf-8?B?MHBIdWx4ajhlUUxidjFUQmR4RzNIMEFBUExTdXN3NnZzSGRjanEzblliZ1Aw?=
 =?utf-8?B?K1RFYTQwZkJLNVRBcEx4bmZKczJqaDlSeEo3b1QwbEtIUnhORXArb1l3bTN5?=
 =?utf-8?B?Q3k2WHpsZGl6N08rcDZFRk9xUzBNbmlzMHlONmFUbFJPK2hwRlZhRFVUVGRm?=
 =?utf-8?B?ZFkxQnBxY2JRZmFsUlNTZUdwMk83aXRWZGhQcEYwenFUdDJNNGtmZ1ZlWk1p?=
 =?utf-8?B?S3FDUENwOVhCT0trNUhOUjh5QnNIUy9ndHk5UDJ4anhpeElicThtWDQ0N2Zi?=
 =?utf-8?B?V01SZTR3d243cDBQeG8zNUpxaDQ0NnVUWnpoaHltc2dIWFVBYjhpakF4aXNR?=
 =?utf-8?B?MlE1UDl6RUtnVEpjV0ZHeHA3RVpzREU1NVZlUWRxdDhzSFJpK3B2cDlleUp1?=
 =?utf-8?B?WE1UdVVudlp1RGs1V0UwdFdkdVdDNUs3UGVNVGN1dlN0K0w2a0t2VFhIL2tI?=
 =?utf-8?B?MlFhTmxQekxRRzVKM2lTQVBOeVo5WnNUd3QrbnhxQ2ExTElSQm15ZWJoWkxh?=
 =?utf-8?B?eFZKdTR4OGt0YzNsVkExZ3FMNDJvQThjYmp2MTVNWDRzOGVSVVgvVS9hZ1dU?=
 =?utf-8?B?SUtZS0JmNm10b3hHbGRwemRtY0RSOUNjZGdPTitsN0ZuamFUSk0raUlkWTl0?=
 =?utf-8?B?citXT3JqU09FdUVGWXJ3cTlhM1psTE5JOFh5b2NTVEJRYURxVnNQelFQS1FC?=
 =?utf-8?B?bFZINm1RZDVsdDRPMVhxdFo2WDFKSjN6RGtNQmIxdU9ROVg1aklMUkZDNk1X?=
 =?utf-8?B?SlJoSm1sN0YxeW1HOGswMHJ0K1pMVjBEdmcxK3VaOFJoRGR6NzVkak1RbGtG?=
 =?utf-8?B?c1YyR2tBRnkrWE5JL0E5RUFyWjdacG9wdjhKRERCajZXMzhCdTZWV3hRUGRU?=
 =?utf-8?B?ZVRHUHIvUVcxUDVUVEs1Q1dLMlZhS3lUa0gzSklzb1BaemtlMDd4TmxONjdN?=
 =?utf-8?B?S1pzVFBGMEIzK3pDNjREMDJLZzlNQmJ1N0hlblJRR2xydTVWVmN0RUl3T3Na?=
 =?utf-8?B?bGtNRmhGa3JUcGZCeCtkaUQrWmlxcnc0S0RNdjNVV1VwMUFsbFptVXF4V3c0?=
 =?utf-8?B?QlBTOFNiUFNZYWxlUktpdFZHN3hCVlZDRHN5WHMxaTBhOHRyVThLMk9vMEhK?=
 =?utf-8?B?NmlXbHdzajUrQ3orSm1yeFNOZDNoYTgxY3phWGFkOXhaZE4vUWFTWVIxd1dJ?=
 =?utf-8?B?cXJoL3JNNGJHNmFER01Oc3lod3E5bm9vU0wxWnBMZVJWd2Y2T08vSUxxcUQ5?=
 =?utf-8?B?dVYyM25EMkRTMk5tOER1ZmR1eGc2VTkrZ0syTEJtekFveGg3bVQvMlZzVTdi?=
 =?utf-8?B?Qkd1TS9LOVVMd2U3RXJKVnNHaTErbjRXanoxL3VRL0M5Um9QUmc1Ni82Y0RQ?=
 =?utf-8?B?NGZVU1NEMHFIYkV5WkwrNXVONzdUNjhHMXYyMzFBeFg0ZUE1K1VGMCt0QkUz?=
 =?utf-8?B?S1BmTjNQUE5wSTNXRXlnUWVTcjlnQzNCTzFTMk0rSUtLZkR5aEI2K2IwUzJZ?=
 =?utf-8?B?U0ZKa1prVjRaVnNjam9lUFdxWlVsTlhqbG1DNWw3WCtmMWhVVHBrS2Nla0Y5?=
 =?utf-8?B?MWd1V2dSUWFJOFlRTmp3T1kyWVV3c2VlT09pNWZSK0ZOYW5UR2NXVkRkUGd3?=
 =?utf-8?B?NU90WGpSREIrMUlTeDdIMkl3V2R6Q0g3UjkweGhzdjdRcy85U285ZDVUZWMv?=
 =?utf-8?B?Wm1DMkFRRlZwbGRtd3ZDeTY0cWZYQlhCdDhUTytBby85UWk3OURjeC9xa1I0?=
 =?utf-8?B?YUJLSy9ic1p4RklhV3BFZ0lSKzdqOGJrU01qQy9na1lRdDNqcHhiZjJVaFZi?=
 =?utf-8?B?REtMSllwOVN3empGNWNDYTNBRDErS3dydzhQd0pBZVpSVFhBWkw1SEZIUmM5?=
 =?utf-8?B?ZldyaC9UQTNLUkwzYWdXK3Q3cmgyRldjK2hROUxJYUdrbTVSUTJXMmRMUTh2?=
 =?utf-8?B?WVpVSitvTTFYcmNyTUpmZGZPU0VsVlZvdWFmaytrUTlpODhUUjROemJWWmFQ?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae546ccd-1541-40b4-7233-08dabce7d81f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 15:35:17.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xE20kwj4UW3a89Oh0xZWN8BP1JIcmaZBu3fJ6LGN99HZAYAIstK6VuvpstwtHbc4WycJIUPRn7B56cIhI5KSbDQNQvmBikJVz6qwv3RpbCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
X-Proofpoint-GUID: lrnqhKAcAI0yy8o2jnuPxNTvjewIEs_2
X-Proofpoint-ORIG-GUID: Ny_vyczVsTiz4nMySJfpDnh71N6V6fpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_13,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 15:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172594

--------------Dg36BIL4m7I0wLg09h0tQmHr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Add Sundeep back after accidentally dropping him from the list.

On 2022-11-02 11:00, Steve Sakoman wrote:
> On Wed, Nov 2, 2022 at 2:24 AM Randy MacLeod
> <randy.macleod@windriver.com>  wrote:
>> Thanks for the info I requested Sundeep.
>>
>>
>> Steve or anyone using dunfell,
>>
>> Do you have any concerns with the updates shown below?
> The glibc and binutils updates seem fine.  The gcc update(s) concern
> me a little bit, but we can test and see if any issues arise.

Sure.

The next dunfell build/release dates are:

# YP 3.1.21 build date 2022/11/28
# YP 3.1.21 Release date 2022/12/09

so let's get started.

Sundeep, send the updates with, or followed by, the test results please.

../Randy


>
> Steve
>
>> Hello Randy,
>>
>> I checked the Dunfell branch for gcc, glibc & binutils updates.
>>
>> gcc-9.3 is currently used in Dunfell and gcc-9.5 was released by gcc.
>> glibc-2.31 is used by Dunfell and latest commits in this branch are listed in attached file 'glibc.log'
>> binutils-2.34 is used by Dunfell and latest commits in this branch are listed in attached file 'binutils-gdb.log'
>>
>> Can I update all these 3 modules as mentioned above?
>>
>>
>> Thanks,
>> Sundeep K.


-- 
# Randy MacLeod
# Wind River Linux

--------------Dg36BIL4m7I0wLg09h0tQmHr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Add Sundeep back after accidentally
      dropping him from the list.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2022-11-02 11:00, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Nov 2, 2022 at 2:24 AM Randy MacLeod
<a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Thanks for the info I requested Sundeep.


Steve or anyone using dunfell,

Do you have any concerns with the updates shown below?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">The glibc and binutils updates seem fine.  The gcc update(s) concern
me a little bit, but we can test and see if any issues arise.</pre>
    </blockquote>
    <p>Sure.</p>
    <p>The next dunfell build/release dates are:<br>
    </p>
    <p>
      <li style="color:black;margin-top:0in;margin-bottom:0in;mso-list:l4
        level1 lfo11;vertical-align:baseline"><span style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1.21
          build date 2022/11/28</span></li>
      <li style="color:black;margin-top:0in;margin-bottom:0in;mso-list:l4
        level1 lfo11;vertical-align:baseline"><span style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1.21
          Release date 2022/12/09</span></li>
    </p>
    <p>so let's get started. <br>
    </p>
    <p>Sundeep, send the updates with, or followed by, the test results
      please.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Steve

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello Randy,

I checked the Dunfell branch for gcc, glibc &amp; binutils updates.

gcc-9.3 is currently used in Dunfell and gcc-9.5 was released by gcc.
glibc-2.31 is used by Dunfell and latest commits in this branch are listed in attached file 'glibc.log'
binutils-2.34 is used by Dunfell and latest commits in this branch are listed in attached file 'binutils-gdb.log'

Can I update all these 3 modules as mentioned above?


Thanks,
Sundeep K.
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Dg36BIL4m7I0wLg09h0tQmHr--

