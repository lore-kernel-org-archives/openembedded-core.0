Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEC7C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 05:24:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42879.1684301074361964173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 22:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45010ab72e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34H5JtP2010519
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 05:24:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj1h8uk43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 05:24:33 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34H5OWlE019615
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 05:24:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj1h8uk42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 05:24:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8gqrcyY2K+VQBzoe+HZpHUMPTlBMh+GvqowWNTCQjOrQVZ6hWbVYcUY8+2j+RfWu5Zznde7bUBhycy8548/LnB/YrjUIJZm0aTKU2Zpp4/EkkUXhY6/pyqEi2wW00xTsSTLC+SO1OfQirzk+NurlkuPMyqlP7U0u2yAQHwv7TBROlMqXe1ltpuFKThYcVmFZ7+MWNRYCxEDAZ4h3ok8jzKb3EaLZUJO3siwKP/ejb4O+K96b1ahDga0kT2eg5PvnDKwYvx+qnHnyWggneBMtsDS1Vei2KHnEYTxxZLIi5hfXegpslqesHIw9lqzuTNgqV4kFkI9r6zMToSp4LOFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziCO9fJ7eL91Xe/4ghoWeVJUgkxN5HY1/WKKCTeXXW0=;
 b=JXvoJJ891wR4d37uTfUjkAmkJZzfx7UzEh+Ny31bZlC4/vBgvUt8c2ZcnGpxkiXGg6140LOvKAGdVEA8JNuQmdouvYVXDxE8JTfGfWFTrRIsKGm5Y2OhIMK9XVHFnLGDZt8YI9tW2erxHvrfxvek9+8Ak7M79dJtiLpFDQa4qm9wzo+HmbkRjZB0l7r7ACIJJ6oKUG8Ge9pmPdhi5lNLca0iyGC3NYIjfi83jzQo/nPTC4DJpMAVbqFNBHhiuaEC6eTnqfpyr7G0BOO0slC7uNNn3TT1YHmPflzKe3xWsD7MHyK+O6riW331y71FqG8fqofmvAOyjBILhb/rIh9tBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 05:24:29 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 05:24:28 +0000
Message-ID: <ec56df62-485f-9814-bbec-6d58e272d822@windriver.com>
Date: Wed, 17 May 2023 13:24:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
 <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com>
 <175E6CB55C617FA5.27409@lists.openembedded.org>
 <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
 <312184e0-32cb-ab57-50c0-7a8c5519a0c7@windriver.com>
 <175F5136C3E93ABB.30531@lists.openembedded.org>
 <CADkTA4M5ZodLTjZ1EF0CFt4zzvywrg9rW-CZkexV_1pNgAdwgg@mail.gmail.com>
 <70bd8fc7-34b3-a435-cd88-2c39987cb547@windriver.com>
 <CADkTA4Pk5y-QHZ_d7UJwqn_Q6rCCt_y2EGpr7WpW-Lt+SByJNw@mail.gmail.com>
 <175FCA67A69FDE7A.26562@lists.openembedded.org>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <175FCA67A69FDE7A.26562@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d10baa9-8ad8-49b6-12b5-08db5696fc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NQWJ/Z3PkG1R9mXMJckuMXlQTxmvBDQJP8e+YdpNiv/XOpkN+z3n+0dHHyvoMfqEfXNW3DqiCOsBfRiECmjCP1Kq5nrxwqdYT4+9qYFTTzw2k8m+MhVqQOY0e5iOPcA7022/e+QKQw7zQ2XqFhlhWEbpbYWMfhwv8IYt1zKQUQ6lz/1//KqCK8d29dHzPSEJPYf4RtGiszn7rps0V46rLfAYBxfCqJex4S/4NEc5Xgw3xQiQgELW2lU8MekuOy4AmnHR9SyZKxaBWYyOzCu1/0pOMy28vMXoSbkSITrQPwJ5UUNUCS6aeJZXdypZRWcWmwRBdau0jglw3QGI7kpv0z1GjES5XIYRcDkFR07D3WOxsMbis2uSTSjEdDdh6RNb4Ntc98CN+69ZpVShcEZUCtfkoFCfILcclAnTfb5H4qBDSF5/z4/UIfM5s9YCXHHOscEbZ/fqASGSQ+Ad+Hafmri2hPT5zUDITRSYfJ2/DiaeW9KJrlwRHhFjytPbjLgCdg3s/9jxW/pWXztGsjdtz4juM/ioyE5zPEmpI42vFW81ho0KfdwpE1BVQR085M5vltaXPO3PjpAmWfEsjW4M6es28Sj+RuoKeAH3sJUWswKWBtwFsoHZQ5hYhJClHUZX7nghmfA5DJfAoKR//+THtw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199021)(5660300002)(8936002)(44832011)(83380400001)(966005)(9686003)(31696002)(6512007)(6506007)(53546011)(26005)(83170400001)(38100700002)(186003)(8676002)(18074004)(478600001)(6666004)(6486002)(41300700001)(316002)(66946007)(66556008)(66476007)(4326008)(36756003)(6916009)(31686004)(66899021)(2906002)(30864003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzlZZnE3UzA4ZnRIdXNNY3RmQnJHTExTMG92UmZuMXR2VG5KTWlOZDFWMkJH?=
 =?utf-8?B?dlZZUEVzZy9hVGx3dG1BVTVHVW9OMjk0dHcvUDYxWk9qNnpMWjRkTkhYVk1w?=
 =?utf-8?B?Nk9JazdhNlk1cWxLbXNJVjVPblpJU05pUEhNOUJ0bU1hR0x0WlIvMStBYklw?=
 =?utf-8?B?MXpTQjZGMFNtVG9FcTVrVXEra1VpMUtjOFZpUFZldnlLMWU3aFJHU0oyNUx2?=
 =?utf-8?B?ZWRZWEJsZVVGbGNQNEpXT25XaFdjQ2tNdXF0UGdIM0lsWTJBdS9NZHNFLzA0?=
 =?utf-8?B?VEdJV3dHYnFKdFFiVCtKS3F3WTlYcEs4dnNZNWtlc1h1N2xmOFc2ZjQ0anlH?=
 =?utf-8?B?cUs4NWhiQjdvM0plQlp5RlNPUlBwQVJwR1NUQUZ3RGJHRnJldks3d21oZjh0?=
 =?utf-8?B?Nk1QN2FZTTdPbjBZSXJKWE55NW4yRzBSd0pFaWlPU0lIV1l3ZC9mN3B2cFVU?=
 =?utf-8?B?V0xXcmVoODdzK3FWRnEzck1DS0dqdHNBNDNFc1VMeWYxb05oWHVYbjVWaVpK?=
 =?utf-8?B?TmZQbUNMVkE4UU5UcFdQdUs3V0xRb3J2Zy9DZmhZVEZRemkrVXZTZ3NiNkl2?=
 =?utf-8?B?ZktyOUo3ckhwS3JaU2x6bnpaS0tCZ2l1ekI4UUtjdUg1emxPaEdBK0poSTEw?=
 =?utf-8?B?amczLysxb3J4ZUUyeEJyRFB2MS9TWVpSamV0UW9yT3ZjVzYvKytWNThwZmpz?=
 =?utf-8?B?eEp6YkFiZjlhWTRUNDJvY09wOVJHalBGODJNdmJva1E0S09YSzQ5S2lkVEhv?=
 =?utf-8?B?Wk5OU3RmSkhNODIwN0UycWJiSENMNkNFL2hDNUduOGU5WE85aklQTENjdGlH?=
 =?utf-8?B?SHg3MEt5T1JHeWs1a2ZDMCtVUXJ1RzU0ZnFqODlLQlNlamxPN29lRExRNjZ6?=
 =?utf-8?B?dFNNZk1BVjVlZlpTVm5XU1VrYmpuTGxyQm1LRVRpVlFNcFhIZWtkeGw2bStx?=
 =?utf-8?B?NVhITFpJLzc5U1Bwd3c0VjVoMGZ1TnYvV0NMOUVYRmJBelh5TjVMWnNUdUlx?=
 =?utf-8?B?amVRN2VpbGcwMTIzcm42SVdsR2FVYnhOeHlYYnREQ05JYTRyUHJXWjljc05P?=
 =?utf-8?B?THQ2Z3VMWVFGNDhHMVU5akV2akdOZG40WTFnMlA3UGdrK2dYcWxYcHlZQ29I?=
 =?utf-8?B?YlFoWEdMYkhlVGs3akp4UDNNZkdMdkFyN3h1eDJSMjMyZjdkUThTMHpEbjlJ?=
 =?utf-8?B?MlhiWVVOV0FiM1FPSVl0ZVl0SklCR2g4Ukt2OFFVZUUrR01qRlk5UUI0OWZw?=
 =?utf-8?B?ZUxpVXViK1ZPUTlsUVlrZk4xVzdMRnhnV0dlVEF1bTZWUWtYRVNYdHBwSDF2?=
 =?utf-8?B?MDBaNGlodjZpZW15RE53d3NGZXpMRkd6UmJjbjBieVFMZW9pYVFrMkVuUG5i?=
 =?utf-8?B?VHZFeTFUZC91SndYUG1GUWc5a29CTmhZeWlhM1Q5YWJIWE1VdjM3RS83dDJt?=
 =?utf-8?B?MkJVZHZ6WGQ2Y2o1eG5EKzcxcGFYWkxtOW5uZ3dPdGVhUUxaMkhPMCtET0Jz?=
 =?utf-8?B?c1pMdGd6VFVPOW80dGppMEU0RWV1NEh1OG1aMzdzOExMc0pxVGVEbGQ5akls?=
 =?utf-8?B?MHN4RUNtRFJDL1pkSGZDVGR5ZjhORFl2aFd5eEdsU0ViaUdDVGFoR2ljT2xq?=
 =?utf-8?B?cERNQ2gwUkRQY2tzUWMzZUdMbjBtRHhjUkRLcmRjcHhCdElGZGNNelQwN1F4?=
 =?utf-8?B?d3A0bkxIQjZYbzBZYk1yNzdnc0d2Qmw2ai9SV2hzZThOblNwQkVvSXd4UWF0?=
 =?utf-8?B?TXYxNlB0RHA5TjA5dkFqclYxa0Z6VWltcExZdVhBSFNKdm44TEpIbk1oY2RM?=
 =?utf-8?B?VDhHL3BWU0J0U09wYmRpYzA4SGkxS1VVS2d2Wm40bklYdGhnWVVkTWliRFd3?=
 =?utf-8?B?eWs2T3ZvMWZDN1hha2NHM09UQnUraldLTjBLWGJ3c09VWnZIZ0lOSlVSeGMw?=
 =?utf-8?B?UzhJV293SHJoK3Bqc3FQUnVQVWJldWtVZkQwNVpHdjc4cXQ0YnByMFdSWXRH?=
 =?utf-8?B?ME1OTThzVWJvc3krUGxZQVJOUW16SVhSMDJKUUZ5ZDJ2Y3ZJSXIyeU9YTGUx?=
 =?utf-8?B?aFQ2QmlFZGJJcG82UXVURG9EQnNWOWVGaEFtL3pYOHBQTmd4TEtiSHpiVDlx?=
 =?utf-8?B?NGRNSE80QTdabWk5RWx2bXlKbzR0c1l1OUEydlNrbndrN1oxRmUyVlFtU2pM?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d10baa9-8ad8-49b6-12b5-08db5696fc83
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 05:24:28.6508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7Z3+g6Vholf+xa52Xl9tfgtj0lPFoEx7U3lGhjaaVRl5qWV9nZZKOmFJlJK4m9aOc7y70qBzqKyh85lsFCAAYeHK/eSajbsng8Utm+QcDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
X-Proofpoint-GUID: 1HDL2DN7bbriO0MHHwQZlP61_BZuoGaw
X-Proofpoint-ORIG-GUID: PhVLUxN6z0BlIHmSCepEi7Ixi9hWi05d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_14,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34H5JtP2010519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 05:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181443


On 5/17/23 09:35, Xiangyu Chen wrote:
>
> On 5/16/23 20:55, Bruce Ashfield wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Tue, May 16, 2023 at 4:56=E2=80=AFAM Xiangyu Chen
>> <xiangyu.chen@eng.windriver.com> wrote:
>>> Hi Bruce,
>>>
>>>
>>> On 5/15/23 21:11, Bruce Ashfield wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the=20
>>>> sender and know the content is safe.
>>>>
>>>> On Mon, May 15, 2023 at 8:34=E2=80=AFAM Bruce Ashfield via
>>>> lists.openembedded.org
>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>>> On Mon, May 15, 2023 at 6:04=E2=80=AFAM Xiangyu Chen
>>>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>>>> Hi Bruce,
>>>>>>
>>>>>>
>>>>>> Sorry for being late..
>>>>>>
>>>>>>
>>>>>> On 5/13/23 09:16, Bruce Ashfield wrote:
>>>>>>
>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>> Do not click links or open attachments unless you recognize the=20
>>>>>> sender and know the content is safe.
>>>>>>
>>>>>> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
>>>>>> lists.openembedded.org
>>>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>>>>
>>>>>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
>>>>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>>>>
>>>>>> Hi Richard and Bruce,
>>>>>>
>>>>>>
>>>>>> Thanks for your suggestion,
>>>>>>
>>>>>>
>>>>>> On 5/11/23 00:25, Bruce Ashfield wrote:
>>>>>>
>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>> Do not click links or open attachments unless you recognize the=20
>>>>>> sender and know the content is safe.
>>>>>>
>>>>>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
>>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>
>>>>>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
>>>>>>
>>>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>>>
>>>>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the=20
>>>>>> make would report some
>>>>>> errors due to pahole and elfuitls is missing, since this is a=20
>>>>>> debug option, so conditionally
>>>>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone=20
>>>>>> need enable CONFIG_DEBUG_INFO_BTF
>>>>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" i=
n=20
>>>>>> local.conf to solve the pahole
>>>>>> and elfutils dependency.
>>>>>>
>>>>>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS=20
>>>>>> with this
>>>>>> option documented somewhere?
>>>>>>
>>>>>> I also think the mention of devshell in the commit message is
>>>>>> misleading, this issue happens regardless of how you enable the=20
>>>>>> option.
>>>>>> There are also other ways of enabling this than local.conf, you'd
>>>>>> likely not want people doing that at the end of development.
>>>>>>
>>>>>> I'm curious on Bruce's opinion but to me this at the very least=20
>>>>>> needs a
>>>>>> commit message rewrite and I'd question whether the docs elsewhere
>>>>>> would allow someone to discover this workflow anyway.
>>>>>>
>>>>>> I missed this entirely, thanks for replying to it, or I never woul=
d
>>>>>> have noticed.
>>>>>>
>>>>>> This mechanism isn't appropriate for these dependencies. I only=20
>>>>>> added
>>>>>> it to work around pkgconfig issues (which we can more cleanly=20
>>>>>> solve in
>>>>>> newer kernels=C2=A0 (see what I've been doing with make-mod-script=
s)=20
>>>>>> .. so
>>>>>> it can eventually be dropped).
>>>>>>
>>>>>> We are already enabling elfutils-native conditionally on a
>>>>>> per-architecture basis (currently only x86-64).
>>>>>>
>>>>>> If we need it on more arches now, we should enable it in the versi=
on
>>>>>> specific recipes, or actually, we have moved far enough into newer
>>>>>> kernel's that it could be in the .inc now.
>>>>>>
>>>>>> This commit's background was some kernel debug options needs=20
>>>>>> elfutils
>>>>>> and pahole native package, since the issue happens on enabling=20
>>>>>> kernel
>>>>>> debug options and not all people needs it, so I conditionally add=20
>>>>>> the
>>>>>> dependency in KERNEL_DEBUG_OPTION.
>>>>>>
>>>>>> If possible we can enable it in .inc because newer kernel tools=20
>>>>>> like btf
>>>>>> are support using pkg-config to locate the libelf instead of=20
>>>>>> finding it
>>>>>> from /usr/ folder, so we can use elfutils-natvie instead of=20
>>>>>> installing
>>>>>> elfutils package on host PC.
>>>>>>
>>>>>> Similarly, we should enable the pahole-native dependency on a=20
>>>>>> per-arch basis.
>>>>>>
>>>>>> As Richard mentioned, what's the reproducer to see the errors ? it
>>>>>> must be more than devshell.
>>>>>>
>>>>>> Yes, this happens on devshell and normal world if some kernel debu=
g
>>>>>> options are enabled. We can reproduce this issue with following=20
>>>>>> steps(I
>>>>>> have found the issue with kernel 5.15):
>>>>>>
>>>>>> 1. enable kernel option CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO and
>>>>>> CONFIG_DEBUG_INFO_BTF
>>>>>>
>>>>>> 2. build the kernel image, the compiler would report missing=20
>>>>>> libelf.h
>>>>>> and gelf.h which contains in elfutils-native(this step not=20
>>>>>> happens on
>>>>>> x86-64 due to it has been enabled).
>>>>>>
>>>>>> 3. enable elfutils-native by manual, the kernel source code can be
>>>>>> compiled successfully but failed in final step due to missing=20
>>>>>> pahole.
>>>>>>
>>>>>>
>>>>>> If you can follow up with the steps to reproduce, I can take on th=
e
>>>>>> refactoring and broader dependency cleanup question, since I can=20
>>>>>> test
>>>>>> the wider matrix at the same time.
>>>>>>
>>>>>> Thanks, my local setup might missing some corner case, this is=20
>>>>>> another
>>>>>> reason I enable those native packages limit in=20
>>>>>> KERNEL_DEBUG_OPTION :).
>>>>>>
>>>>>> I've been thinking about this, and I've come to the following=20
>>>>>> suggestion:
>>>>>>
>>>>>> I plan on moving the elfutils-native to linux-yocto.inc, out of th=
e
>>>>>> version specific
>>>>>> recipes.=C2=A0 I'll also drop the architecture specific nature of =
the
>>>>>> current DEPENDS.
>>>>>> The need for this is much more common now, and all of the=20
>>>>>> reference kernels
>>>>>> in master are new enough. The elfutils-native build dependency is=20
>>>>>> not
>>>>>> significant
>>>>>> enough to worry about adding it for all architectures. If it does
>>>>>> become a problem,
>>>>>> there are options to make it conditional again.
>>>>>>
>>>>>> I can drop the HOST_LIBELF_LIBS work around in the=20
>>>>>> linux-yocto.inc, as
>>>>>> we can now properly detect libelf via pkg-config. I didn't need=20
>>>>>> it in any of
>>>>>> my testing. Again, if this proves to be wrong, I'd enable it in a
>>>>>> different way now
>>>>>> (using what I've learned from fixing make-mod-scripts).
>>>>>>
>>>>>> As for the pahole-native dependency, there's been a "developer"=20
>>>>>> kernel-type
>>>>>> for quite some time. The design intention behind it was to enable=20
>>>>>> options like
>>>>>> this, and not make the "standard" or "production" kernel's too=20
>>>>>> large by default.
>>>>>> So the dependency could be conditional on that kernel type ...=20
>>>>>> but we don't
>>>>>> want to break other kernels just because they've enabled that=20
>>>>>> option. We also
>>>>>> don't (and won't) get into the game of looking for individual=20
>>>>>> options in the
>>>>>> .config to enable something, since a) it is too late b) it is a=20
>>>>>> moving target.
>>>>>>
>>>>>> So that leaves the following options: a) enable pahole-native=20
>>>>>> unconditionally
>>>>>> on the arches that support it (x86-64, aarch64) (and also move=20
>>>>>> the pahole
>>>>>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specifi=
c,
>>>>>> and simply call it KERNEL_DEBUG, when enabled, we could=20
>>>>>> conditionally
>>>>>> add pahole-native (I'd also submit documentation for the=20
>>>>>> functionality
>>>>>> c) something I haven't thought about ...
>>>>>>
>>>>>> I'm moving on the implementation now, but will adjust course if
>>>>>> there's something
>>>>>> I've missed.
>>>>>>
>>>>>> I have my implementation done, but I'm wondering what your=20
>>>>>> configuration
>>>>>> was for testing pahole ?
>>>>>>
>>>>> My reply will be hard to read, as plain text reply to the html=20
>>>>> doesn't
>>>>> give us proper
>>>>> context indenting.
>>>>>
>>>>>> I have tested on a devshell, with oe-master branch, the kernel=20
>>>>>> version using 5.15
>>>>>>
>>>>>> 1. enable pahole-native and elfutils-native in linux-yocto.inc as=20
>>>>>> a dependency.
>>>>>>
>>>>>> 2. enable CONFIG_DEBUG_KERNEL=C2=A0 CONFIG_DEBUG_INFO and
>>>>>> CONFIG_DEBUG_INFO_BTF under menuconfig
>>>>>>
>>>>>> 3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning=20
>>>>>> PKG_CONFIG_SYSROOT_DIR
>>>>>>
>>>>>> 4, make
>>>>>>
>>>>>>
>>>>>> If the test environment using bitbake, then we need to remove=20
>>>>>> PAHOLE=3Dfalse flag in kernel EXTRA_OEMAKE in=20
>>>>>> classes-recipe/kernel.bbclass, otherwise, bitbake would report=20
>>>>>> missing pahole error.
>>>>>>
>>>>> That's the same as my patch series (I've also changed PAHOLE=3Dfals=
e to
>>>>> a conditional in my series).
>>>>>
>>>>>> I'm seeing the following in qemux86-64 at the end of the build:
>>>>>>
>>>>>> | Unsupported DW_TAG_unspecified_type(0x3b)
>>>>>> | Encountered error while encoding BTF.
>>>>>> |=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsy=
ms1
>>>>>> |=C2=A0=C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsy=
ms1.syms
>>>>>> |=C2=A0=C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.S
>>>>>> |=C2=A0=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsy=
ms1.S
>>>>>> |=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsy=
ms2
>>>>>> |=C2=A0=C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsy=
ms2.syms
>>>>>> |=C2=A0=C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.S
>>>>>> |=C2=A0=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsy=
ms2.S
>>>>>> |=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux
>>>>>> |=C2=A0=C2=A0 BTFIDS=C2=A0 vmlinux
>>>>>> | FAILED: load BTF from vmlinux: No such file or directory
>>>>>> | make[1]: ***=20
>>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/scripts/=
Makefile.vmlinux:34:
>>>>>> vmlinux] Error 255
>>>>>> | make[1]: *** Deleting file 'vmlinux'
>>>>>> | make: ***=20
>>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/Makefile=
:1255:=20
>>>>>>
>>>>>> vmlinux] Error 2
>>>>>>
>>>>>> I haven't looked into it at all yet (but will do so over the=20
>>>>>> weekend)
>>>>>> .. but I thought
>>>>>>
>>>>>> I haven't seen this problem yet(i'll pull the latest oe-core and=20
>>>>>> meta-oe code and try again), if possible, could you share a patch=20
>>>>>> with me so that we can test it together? thanks.
>>>>>>
>>>>> I'm on oe-core master, with qemux86-64.
>>>>>
>>>>> I'll do a bit more work on the patch today, and can share it if I
>>>>> can't figure out where that unsupported tag is coming from.
>>>> It seems like it is a known issue, I found both a lkml thread and
>>>> debian bug from October 2022.
>>>>
>>>> Your 5.15 kernel wouldn't show the issue.
>>> Yes, this should not happens on 5.15 kernel.
>>>
>>>
>>> Today I synced the oe-core/poky to latest master version, removed the
>>> build dir and run oe-init-build-env again and switched to use default
>>> linux 6.1.25 instead of 5.15.
>>>
>>> Some kernel config has been updated, there is no CONFIG_DEBUG_INFO, I
>>> used CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT.
>>>
>>> So, currently my local setup kernel config is enabled
>>> CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and
>>> CONFIG_DEBUG_INFO_BTF, in order to make a easy test, I enabled
>>> elfutils-native and pahole-native as DEPEND directly in linux-yocto.i=
n,
>>> and remove the PAHOLE=3Dfalse in EXTRA_OEMAKE.
>>>
>>> my oe-core rev: 35e5d29a7d654fc79bdb898d0f1fb277270dbfd5
>>>
>>> my meta-oe rev:b7aa66d734b911737b61610c1c47778e14b15c55
>>>
>>>
>>> When I ran bitbake linux-yocto -v -D, I have met the same issue,
>>>
>>> | Unsupported DW_TAG_unspecified_type(0x3b)
>>> | Encountered error while encoding BTF.
>>>
>>> It's bit strange that the I removed my local OS(ubuntu)'s pahole and=20
>>> the
>>> code can be compiled without error:
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init/version-time=
stamp.o
>>> =C2=A0=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.btf
>>> =C2=A0=C2=A0=C2=A0 BTF=C2=A0=C2=A0=C2=A0=C2=A0 .btf.vmlinux.bin.o
>>> =C2=A0=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kall=
syms1
>>> =C2=A0=C2=A0=C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kall=
syms1.syms
>>> =C2=A0=C2=A0=C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.S
>>> =C2=A0=C2=A0=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kall=
syms1.S
>>> =C2=A0=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kall=
syms2
>>> =C2=A0=C2=A0=C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kall=
syms2.syms
>>> =C2=A0=C2=A0=C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.S
>>> =C2=A0=C2=A0=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kall=
syms2.S
>>> =C2=A0=C2=A0=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux
>>> =C2=A0=C2=A0=C2=A0 BTFIDS=C2=A0 vmlinux
>>> =C2=A0=C2=A0=C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 System.map
>>> =C2=A0=C2=A0=C2=A0 SORTTAB vmlinux
>>>
>> Indeed!
>>
>> What's the toolchain version on your ubuntu install ?
>
> My local ubuntu's default pahole version is 1.22,seems some data=20
> structure not line up with new kernel, the yocto pahole package is=20
> 1.24 is working well.
>
> $ pahole --version
> v1.22
>
>
>> It is likely
>> either our toolchain version or configuration in combination with the
>> kernel version that is adding the section that pahole can't
>> understand/decode.
> Yes, perhaps this is a limitation, we have to use PAHOLE in=20
> EXTRA_OEMAKE to tell the make using pahole from the yocto native-sdk=20
> instead of local host OS's /usr/bin/pahole when building the kernel.
>> If you want to work with my patches, you can find my branch here:
>>
>> https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
>>
>> (you also need the linux-yocto bumps on that branch as they'll contain
>> the kernel-cache SRCREV bumps to pick up the fragments for BTF, etc).
>
> Thanks, I will sync the branch today and feedback later :)
>
Hi Bruce,


I used the zedd/kernel branch build a qmemux86-64 kernel image,=20
everything goes well.

Shall we set the PAHOLE to native-sdk in EXTRA_OEMAKE to make sure=20
kernel make use pahole from yocto not from host pc?

I tried to attached a patch as below, it has been tested on my local=20
setup, from log we can see the PAHOLE point to native-sdk:

-O2 -pipe=20
PAHOLE=3D/local/upstream/poky-contrib/build/tmp/work/qemux86_64-poky-linu=
x/linux-yocto/6.1.28+gitAUTOINC+76f7fbdf33_c5c0c7ccfe-r0/recipe-sysroot-n=
ative/usr/bin/pahole=20
-j 20 bzImage

and the image build without error:

 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.btf
 =C2=A0 BTF=C2=A0=C2=A0=C2=A0=C2=A0 .btf.vmlinux.bin.o
 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1
 =C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.syms
 =C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.S
 =C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.S
 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2
 =C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.syms
 =C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.S
 =C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.S
 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux
 =C2=A0 BTFIDS=C2=A0 vmlinux
 =C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 System.map


 From da4cbdb517f28f1b4254376c4f1d091a5ebca76c Mon Sep 17 00:00:00 2001
From: Xiangyu Chen <xiangyu.chen@windriver.com>
Date: Wed, 17 May 2023 13:15:17 +0800
Subject: [PATCH] set the PAHOLE to native-sdk when KERNEL_DEBUG =3D True

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 =C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc=20
b/meta/recipes-kernel/linux/linux-yocto.inc
index 04a8105e17..90be616363 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -66,7 +66,7 @@ DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86",=
=20
"arm64" ], "elfutils-nativ
 =C2=A0DEPENDS +=3D "openssl-native util-linux-native"
 =C2=A0DEPENDS +=3D "gmp-native libmpc-native"
 =C2=A0DEPENDS +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",=20
"pahole-native", "", d)}'
-EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "",=20
"PAHOLE=3Dfalse", d)}'
+EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",=20
"PAHOLE=3D${STAGING_DIR_NATIVE}/usr/bin/pahole", "PAHOLE=3Dfalse", d)}'

 =C2=A0do_devshell:prepend() {
 =C2=A0=C2=A0=C2=A0=C2=A0 # setup native pkg-config variables (kconfig sc=
ripts call=20
pkg-config directly, cannot generically be overriden to pkg-config-native=
)
--=20
2.34.1


Br,

Xiangyu

>
> Br,
>
> Xiangyu
>
>> Bruce
>>
>>>
>>>> You can find a link to the lkml thread from the debian bug:
>>>> https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg18=
73553.html=20
>>>>
>>>> I'll clean up my patch, since this isn't something I can fix=20
>>>> immediately.
>>>>
>>>> If you do track down patches in the latest kernel that haven't been
>>>> sent to -stable, we can backport them to fix the linux-yocto builds
>>>> with pahole.
>>>>
>>>> Bruce
>>>>
>>> Br,
>>>
>>> Xiangyu
>>>
>>>>> Bruce
>>>>>
>>>>>> I should check with you first to get the details on how you were=20
>>>>>> testing pahole
>>>>>> functionality.
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>
>>>>>> Br,
>>>>>>
>>>>>> Xiangyu
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>
>>>>>> Xiangyu
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Richard
>>>>>>
>>>>>> --=20
>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness=20
>>>>>> await
>>>>>> thee at its end
>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>
>>>>>> --=20
>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness=20
>>>>>> await
>>>>>> thee at its end
>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>
>>>>>>
>>>>>>
>>>>>> --=20
>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness=20
>>>>>> await
>>>>>> thee at its end
>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>> --=20
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>>
>>>>>
>>>> --=20
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> --=20
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181426): https://lists.openembedded.org/g/openembed=
ded-core/message/181426
> Mute This Topic: https://lists.openembedded.org/mt/98753313/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
xiangyu.chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

