Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832BCECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 05:30:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2904.1663133391426406736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 22:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tBaimZN1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62563eda0f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E5ODtp010203
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 05:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=38M/Z+xESNYY6HwFfJYKei5paDng0LkgFJO3qmGd+Yo=;
 b=tBaimZN1h/lYDNGsPpjRU4VvMsrkMDfVheo2vJCvmpG09HNO0NgrD7hW0qtwzY2CSXlH
 fz2dhn/c7vGmB+LD/FEl+Zk8QkQxF33nmD4vPPfCbgSWldV4x1+jNj/sFQBi3TmUuevy
 kiWdX10kr2mh1EYZKSUv2H8/8pDe2HS7cmwXrPcdchNqo0HfMg1KSt0eUBpFa9Gl0jsl
 tIoMLZ1meX2iVLiLJdmeS6/7Dl3ziYEJTIy3vVUqq+cL6qJxzdUmjWANnt6uhBGwC+SB
 E8A+l7Tt6COrUpLCdZjQvmDVo3te03FL0f3QuJywNz0qHrdZVxgZeHUJ06Df3BqwSx1S 9Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4v7851u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:29:50 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E5TnfD021989
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 05:29:49 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4v7851t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 05:29:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apm9MdoyYoHBsz60hCEZGj6TbLxWAY2IpTY6zV/vb9LDk6Z4kBhsFWTjoSbjpuWm00/+QP4yCT9B1HcxiCRuwbQDaFp8hVbOQQw7aBafsL6bLKJlt85DmvxEwxGkNUfcimABBawOIspCxzKl5QoE/6aPY2yzDpz3exTQJVlQqjndyDjrMg2QSr85WvcmgAF4wJbaLK+oO9IAXaCl7mHZ1DScdinRgzZxMtdYDUvjWP0UeB7/qoa/8YxVKeOq84v9PpC5E/V3DZiXOa3Gt0jxg/TqVCb55FNKXziEIIFb7zLMaL8scm2cnLYyLBrLZtUWFeSxDUfuDaizLrwsiUOSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38M/Z+xESNYY6HwFfJYKei5paDng0LkgFJO3qmGd+Yo=;
 b=bcKMPB5O1tKvuBsHGgjJIdRWcSF5qKhu3dAcmCnIH06cJboYfShWSeLyCKECwfwtwADd1F5p2evmhvNKYEIYCteYa+oVyXQJuPLOl2oI/6hHi4IbI5cDKFdDve+//iYasAcYNSR+o7myIASltwLKjJ8dn/awX+/MQXqNKE1dfdHA8e63FY1FFj9xr/lGGNd/Ppq/Wpll90/SyiCjVwcbhLR4l7JStK+AtcGZ1u4jZ1G1Vh/D1Ap6ujEXfZjOrwPp/F38U2VZWKENYUDq6/hvZbIHtdgHhhVt7wgWDqqEGbBwTxklcmX0FYaw5+km7XkTZ7aZpmMovuaANhJndLlF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 05:29:46 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1ce8:cf77:de7b:2203%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 05:29:45 +0000
Message-ID: <3999b5e6-95d5-1176-6040-55faea11a3a5@windriver.com>
Date: Wed, 14 Sep 2022 13:29:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] webkitgtk: Fix build on 32bit arm
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220908214554.1117287-1-raj.khem@gmail.com>
 <99ce1274-dcd0-8392-fc88-9f1122870049@windriver.com>
 <CAMKF1so_7GfQBYtTu8V4c5K=wnjq64HR=AYHhjSa7Uc7KkX7_w@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: 
 <CAMKF1so_7GfQBYtTu8V4c5K=wnjq64HR=AYHhjSa7Uc7KkX7_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::23) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6ef62a-d324-46a8-ff71-08da96122247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mFRndSmyeOxKPW4H7MVkOXB0NLZVh3V2o7GQacw63Pgmh+s22cadWMFJ38ZMwA0hVTR1G1ih/gYijAADmNjv1YxKgZRGxCnESFaiu5sLyrZ94xxagAlxTMWDPqnO0SvpIQmV8thrPQKbEhCyDAGXUNYUST+FXlEYps0yxxH6THi4spWbxYUb4uhFNOb2uttVaopjJ9m1Y7HxePSX8Rf4m6ap9s/UaW2VwOGfiqliAwi+moBBpEZQxCROuaim0K1kCev/vtjvNCpuY0QPM1oztceaVMXiqkCIY80owjwb6Sqh/lDWdTL6lGKeG9MQgXo03nKKhVTpmoUAF59zj7KVW3gpKtQMmj3FYldZule42jcvlJv7gGXAPIxFR0QiYtJ+05gEzcXUBJoWWwWnCe12Q+YNK5WA49DhzMFIO6gal7BNCg6wlNGqxAUxg30n0fMMBeqyfPAgDPs8SvZKa7eChdjeckMAdg3tQR2DFrUHI8qLfTUz3RxZ58vrAR+26Sa6EoHsTquC/dBtco+GanhLeipNNObHGv72vx/0Pp1XdEEF5sNbAf3bJOFXGWPTGYEYR7/sGR6hdwtCjj4lw21RWOKqoAJU+4ySRJ7m/V++KR1z0bfLi7ADppXap75KK0q4yZN/DANIJ2lYdLMrnAWooftjMCPgfypHAjcv4uVaYl1UHgwJd8wHVvzvFI0PS1OT2XOU3aGoFYkbHqnGZiJ+jE2V2KbtRyxhamajSq35Jt488uFtps1FdEnuP4n7CKA+ruuOItADjl/Pf97XG+bqV8rq6ZOcUP56vOJSA0PBo04IvMQxTD4aqOU7wux1E5baTNm+l2ZtLmvJIkHla1pOliXoBYyxqD5q0bnOaf2e/FM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(451199015)(26005)(66946007)(478600001)(186003)(966005)(31686004)(6666004)(8936002)(6486002)(86362001)(66556008)(38100700002)(53546011)(2616005)(66476007)(41300700001)(6512007)(5660300002)(83380400001)(316002)(2906002)(6506007)(4326008)(6916009)(36756003)(31696002)(8676002)(30864003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGs3VS9TZUpKZ3BRQ1ovVEV2NUNpR3BHOFYrK25VMFNBdm1EZW45UzA0d3ZU?=
 =?utf-8?B?dGcvZ0VXMHJBVVEvQWRhRmFFR3dvcFFmaytBdHhxVmV2MVVNbWdtRVNLV0JT?=
 =?utf-8?B?clV6dmRrUE5DY3Z4NG5rbm9RaGZBcXF5NjZYZG05cnJWWHd0VWVDT1EraW9I?=
 =?utf-8?B?SmJDUWFmcVJsRlVWeDh0SnMycjJyOUhDNFE4KzhmLzdqb0I4bTRaTlhZUU9u?=
 =?utf-8?B?d0F6UVNRQ05NaUxSeklPTVlEK2NMS0RFMjcrbmU4MlROQVJCKzNFbUJqME9a?=
 =?utf-8?B?bVFBa09ScURNMXdYdDZvT2NmVEZPaS9Ma0NYWUI1Tk1rb3dhMFpoc0l4WXpT?=
 =?utf-8?B?M2xJUGZ6YTZFMnNHUmh4bDFmQWJzNFRFcUNUNUd5ZHpMdzlZVFdWR3lnaW1I?=
 =?utf-8?B?WUEwM1NuZnN2ZnpFb2IxcUQyRWYrL1lUeXVxWEhGU2FaOXJuSDU2QzRDWFpL?=
 =?utf-8?B?NTVXVy9Fb1paME9nYXZZZWhtOGhSalNENEF2KzJ0Uk1ZTHMrYUlJQU5uUEQy?=
 =?utf-8?B?NVlKVVgwWjFEV2hPbXVMY3YrWHZneXd3MzgvS2UvZ1IzTWxjZncvUkN3VjVP?=
 =?utf-8?B?aWo0aTV4TGppWjNndmVOQlg1WWRCSm83YkE1MlhaQmZqM21lNTh0MXhrcDhP?=
 =?utf-8?B?WVRBMlF1bXBQM3Nac3Y4aTF0cDN6bDl4OExQMTdEdFRpZVZBZFFBYlpxYU9J?=
 =?utf-8?B?ODRGY1NPcTk1ell6UVJ6bTlJZ294Mm5BVjgyVFVkMlRCbjM1VWhBL2hhWFdF?=
 =?utf-8?B?QnpYb3dtK2ZFWXBzOUMvdkhORjJsUUI5YUtFbm80MnpGMWVzdGthSjhiUW1Y?=
 =?utf-8?B?Z01jcm5sMjA4eTBEYlpIRkNlK1dFVU1oRktURlZ2TnErVzhsL21GY3BCaElQ?=
 =?utf-8?B?S2hMb0xnUWdNS1pUZXkzeExKK0dxdGNBVGZycDh4azkxR0JIZHZKdkxQTFZq?=
 =?utf-8?B?dGl2dUNzTmdBcFZHSFc4SmozQU91NWlySXVCMlBvQWJSVGhGcWVwczZQVFkv?=
 =?utf-8?B?ZzFUT0RLS3F1dlVzTUZaaTAzTWxRYjh1Zzh1V2lBWnhtaGtrOTZ4T1VZanJW?=
 =?utf-8?B?V3pWSGhaNHIvNzdma0ZuL1dncVZDUHFsUk1qTjlFb2JEWkwyZjd5cHcyNlpY?=
 =?utf-8?B?Q3UxNnlGZFFQSkpvTVdzUkRwZlJ4eXY1WVFaUmNwWHZubmlsWi91emNpQ2pu?=
 =?utf-8?B?VGt4VzYrc0lLeWJ2RW1NR2s4NEVSNTQrRFhtYW9OeFpsRmVXQnU0M0tOZ3VE?=
 =?utf-8?B?OHpxdWlaSGpkNnhxc3VsbmFoUUd6c2xmMjF6bXNHT1VaS0lrN3A2d2Uxaksv?=
 =?utf-8?B?K2JxZWkwWnluVWxNSnBzaTdXQXRSeTVybmZSMzlpRzU0dTREbEdQV1crREQ1?=
 =?utf-8?B?aFFJbENHRktydXk5WjVaNWQyMVYzMGNaVjkxY3FMZy9oNGNzejhxQVArOTM0?=
 =?utf-8?B?bG1IZG92ZW9hU09QclJYbkVneWU2QnJlTnhSRkRzd1ZlOGsrdHBMSXV5OCsw?=
 =?utf-8?B?REs2aWNwcmYvWkRTVEx1VUpzTVdRYmVzandjbGZQOUlMTnNLMzI5SkxPV3Qw?=
 =?utf-8?B?dERGaDJQVDJYVkk2R1BWRm11aHhSVkRJOXJNMHJSTVNEaFpoV090TWRGZ0Yr?=
 =?utf-8?B?WUYrZXNjaS9UbTJzTk9uMjhEbVF0Y2FyMzE4WXlXdVBvbmIrUDZ4YVQ1Tm8w?=
 =?utf-8?B?b3VjUzVqazIrY1Fxa0g0MlZLLzhMaDRqY1Y5elB2QXU0OWh6aGNZWkU2cUg1?=
 =?utf-8?B?aENJdk55cG9YeWtqdkZyTFZlbldWUjB1TUQ0aXVWMituM2g3YlFrWUExOVh4?=
 =?utf-8?B?d2dxbXB5ajBwSnpWOEFxMllHOE8wVGVySjJ3ZUdOb2JpM1Bxd3c4ZDBHVVd0?=
 =?utf-8?B?SFVrbnBSWmRKUS94VE9wRkVKZno3RFlQVHpGZjkzenRXR05rTWhSVWVEYWU5?=
 =?utf-8?B?a0dIY0Z0Vk9mSDJTTCtIb2JLM3c3eU1SeWFrZ0thZHBtK3lvclptTjJaVE82?=
 =?utf-8?B?U0RaclErMGJtMVZEN0JNbThwTkppYnZrUEg4UHRxalVnaE1ka3FJYTBLZjJS?=
 =?utf-8?B?TjIvWjVaRWdlZ1FPV3h3K3BGa1h1R2dhRXAza2lHdWhFbGtSWFBqTDNFM0ZZ?=
 =?utf-8?Q?X14z7Xd+3WqWmf3/BFQyPaf9s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3b6ef62a-d324-46a8-ff71-08da96122247
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 05:29:45.6161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YX41tEMi+iL+QgfzVYXf0hvvAFbCIqMMl9wOUizfH/mehAnxSObsOWvSTeAsGhGLcTTPiG2bVtM83fhETOHuVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
X-Proofpoint-GUID: ifQiyeUMe02Czy3J1zDt2Du9gFzFNMq5
X-Proofpoint-ORIG-GUID: CRuAmlZwtVFhKEpW2QJ8RrrtXGYSdwCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_02,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209140025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 05:30:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170632



On 9/14/22 11:02, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Tue, Sep 13, 2022 at 7:25 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Still failed on beaglebone-yocto:
>>
>> /build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
>> ebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:38:8: error:
>> standard attributes in middle of decl-specifiers
>>      38 | static alignas(16) short s_FELightingConstantsForNeon[] = {
>>         |        ^~~~~~~
>>
> 

> What is your -j value ? please give 4GB per core of memory for
> webkitgtk to build.

Not specify the -j value explicitly at first and it still failed with 
the same error even specify the -j value as you mentioned.


/build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
ebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:38:8: error: 
standard attributes in middle of decl-specifiers
    38 | static alignas(16) short s_FELightingConstantsForNeon[] = {
       |        ^~~~~~~


Thanks,

> 
>> Thanks,
>>
>> On 9/9/22 05:45, Khem Raj wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Cc: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>> v2: Fix commit msg format
>>> v3: Apply suggestion from https://github.com/WebKit/WebKit/pull/1233#discussion_r915217428
>>>
>>>    ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ++++++++++++++++++
>>>    meta/recipes-sato/webkit/webkitgtk_2.36.7.bb  |   1 +
>>>    2 files changed, 297 insertions(+)
>>>    create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>>
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>> new file mode 100644
>>> index 0000000000..32f92f7ff5
>>> --- /dev/null
>>> +++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>>> @@ -0,0 +1,296 @@
>>> +From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
>>> +From: Adrian Perez de Castro <aperez@igalia.com>
>>> +Date: Thu, 2 Jun 2022 11:19:06 +0300
>>> +Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fast
>>> + path seems unused https://bugs.webkit.org/show_bug.cgi?id=241182
>>> +
>>> +Reviewed by NOBODY (OOPS!).
>>> +
>>> +Move the NEON fast path for the SVG lighting filter effects into
>>> +FELightingSoftwareApplier, and arrange to actually use them by
>>> +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
>>> +
>>> +Some changes were needed to adapt platformApplyNeon() to the current
>>> +state of filters after r286140. This was not detected because the code
>>> +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
>>> +not get used much these days: CPU(ARM_THUMB2) is more common. It should
>>> +be possible to use the NEON fast paths also in Thumb mode, but that is
>>> +left for a follow-up fix.
>>> +
>>> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
>>> +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
>>> +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
>>> +(WebCore::FELighting::platformApplyNeonWorker): Deleted.
>>> +(WebCore::FELighting::getPowerCoefficients): Deleted.
>>> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
>>> +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
>>> +(WebCore::FELighting::platformApplyNeon): Deleted.
>>> +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
>>> +* Source/WebCore/platform/graphics/filters/FELighting.h:
>>> +* Source/WebCore/platform/graphics/filters/PointLightSource.h:
>>> +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
>>> +* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
>>> +---
>>> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +
>>> + .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
>>> + .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
>>> + .../graphics/filters/DistantLightSource.h     |  4 ++
>>> + .../platform/graphics/filters/FELighting.h    |  7 ---
>>> + .../graphics/filters/PointLightSource.h       |  4 ++
>>> + .../graphics/filters/SpotLightSource.h        |  4 ++
>>> + .../software/FELightingSoftwareApplier.h      | 16 ++++++
>>> + 7 files changed, 57 insertions(+), 36 deletions(-)
>>> +
>>> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
>>> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
>>> +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
>>> +     return s_FELightingConstantsForNeon;
>>> + }
>>> +
>>> +-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
>>> ++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
>>> + {
>>> +     neonDrawLighting(parameters);
>>> + }
>>> +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
>>> +     "b .lightStrengthCalculated" NL
>>> + ); // NOLINT
>>> +
>>> +-int FELighting::getPowerCoefficients(float exponent)
>>> ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
>>> + {
>>> +     // Calling a powf function from the assembly code would require to save
>>> +     // and reload a lot of NEON registers. Since the base is in range [0..1]
>>> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
>>> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
>>> +@@ -24,14 +24,15 @@
>>> +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>> +  */
>>> +
>>> +-#ifndef FELightingNEON_h
>>> +-#define FELightingNEON_h
>>> ++#pragma once
>>> +
>>> + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
>>> +
>>> +-#include "FELighting.h"
>>> ++#include "FELightingSoftwareApplier.h"
>>> ++#include "ImageBuffer.h"
>>> + #include "PointLightSource.h"
>>> + #include "SpotLightSource.h"
>>> ++#include <wtf/ObjectIdentifier.h>
>>> + #include <wtf/ParallelJobs.h>
>>> +
>>> + namespace WebCore {
>>> +@@ -93,14 +94,14 @@ extern "C" {
>>> + void neonDrawLighting(FELightingPaintingDataForNeon*);
>>> + }
>>> +
>>> +-inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
>>> ++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
>>> + {
>>> +-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
>>> +-    FELightingPaintingDataForNeon neonData = {
>>> ++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
>>> ++    WebCore::FELightingPaintingDataForNeon neonData = {
>>> +         data.pixels->data(),
>>> +         1,
>>> +-        data.widthDecreasedByOne - 1,
>>> +-        data.heightDecreasedByOne - 1,
>>> ++        data.width - 2,
>>> ++        data.height - 2,
>>> +         0,
>>> +         0,
>>> +         0,
>>> +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
>>> +     // Set light source arguments.
>>> +     floatArguments.constOne = 1;
>>> +
>>> +-    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
>>> ++    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
>>> +
>>> +     floatArguments.colorRed = color.red;
>>> +     floatArguments.colorGreen = color.green;
>>> +     floatArguments.colorBlue = color.blue;
>>> +     floatArguments.padding4 = 0;
>>> +
>>> +-    if (m_lightSource->type() == LS_POINT) {
>>> ++    if (data.lightSource->type() == LS_POINT) {
>>> +         neonData.flags |= FLAG_POINT_LIGHT;
>>> +-        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
>>> ++        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
>>> +         floatArguments.lightX = pointLightSource.position().x();
>>> +         floatArguments.lightY = pointLightSource.position().y();
>>> +         floatArguments.lightZ = pointLightSource.position().z();
>>> +         floatArguments.padding2 = 0;
>>> +-    } else if (m_lightSource->type() == LS_SPOT) {
>>> ++    } else if (data.lightSource->type() == LS_SPOT) {
>>> +         neonData.flags |= FLAG_SPOT_LIGHT;
>>> +-        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
>>> ++        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
>>> +         floatArguments.lightX = spotLightSource.position().x();
>>> +         floatArguments.lightY = spotLightSource.position().y();
>>> +         floatArguments.lightZ = spotLightSource.position().z();
>>> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
>>> +         if (spotLightSource.specularExponent() == 1)
>>> +             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
>>> +     } else {
>>> +-        ASSERT(m_lightSource->type() == LS_DISTANT);
>>> ++        ASSERT(data.lightSource->type() == LS_DISTANT);
>>> +         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
>>> +         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
>>> +         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
>>> +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
>>> +     // Set lighting arguments.
>>> +     floatArguments.surfaceScale = data.surfaceScale;
>>> +     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
>>> +-    if (m_lightingType == FELighting::DiffuseLighting)
>>> +-        floatArguments.diffuseConstant = m_diffuseConstant;
>>> ++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
>>> ++        floatArguments.diffuseConstant = data.diffuseConstant;
>>> +     else {
>>> +         neonData.flags |= FLAG_SPECULAR_LIGHT;
>>> +-        floatArguments.diffuseConstant = m_specularConstant;
>>> +-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
>>> +-        if (m_specularExponent == 1)
>>> ++        floatArguments.diffuseConstant = data.specularConstant;
>>> ++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
>>> ++        if (data.specularExponent == 1)
>>> +             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
>>> +     }
>>> +     if (floatArguments.diffuseConstant == 1)
>>> +         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
>>> +
>>> +-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
>>> ++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
>>> ++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
>>> +     if (optimalThreadNumber > 1) {
>>> +         // Initialize parallel jobs
>>> +-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
>>> ++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
>>> +
>>> +         // Fill the parameter array
>>> +         int job = parallelJobs.numberOfJobs();
>>> +         if (job > 1) {
>>> +             int yStart = 1;
>>> +-            int yStep = (data.heightDecreasedByOne - 1) / job;
>>> ++            int yStep = (data.height - 2) / job;
>>> +             for (--job; job >= 0; --job) {
>>> +                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
>>> +                 params = neonData;
>>> +                 params.yStart = yStart;
>>> +-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
>>> ++                params.pixels += (yStart - 1) * data.width * 4;
>>> +                 if (job > 0) {
>>> +                     params.absoluteHeight = yStep;
>>> +                     yStart += yStep;
>>> +                 } else
>>> +-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
>>> ++                    params.absoluteHeight = (data.height - 1) - yStart;
>>> +             }
>>> +             parallelJobs.execute();
>>> +             return;
>>> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
>>> + } // namespace WebCore
>>> +
>>> + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
>>> +-
>>> +-#endif // FELightingNEON_h
>>> +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>>> ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>>> +@@ -25,6 +25,10 @@
>>> + #include "LightSource.h"
>>> + #include <wtf/Ref.h>
>>> +
>>> ++namespace WTF {
>>> ++class TextStream;
>>> ++} // namespace WTF
>>> ++
>>> + namespace WebCore {
>>> +
>>> + class DistantLightSource : public LightSource {
>>> +--- a/Source/WebCore/platform/graphics/filters/FELighting.h
>>> ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
>>> +@@ -35,8 +35,6 @@
>>> +
>>> + namespace WebCore {
>>> +
>>> +-struct FELightingPaintingDataForNeon;
>>> +-
>>> + class FELighting : public FilterEffect {
>>> + public:
>>> +     const Color& lightingColor() const { return m_lightingColor; }
>>> +@@ -67,11 +65,6 @@ protected:
>>> +
>>> +     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
>>> +
>>> +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
>>> +-    static int getPowerCoefficients(float exponent);
>>> +-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
>>> +-#endif
>>> +-
>>> +     Color m_lightingColor;
>>> +     float m_surfaceScale;
>>> +     float m_diffuseConstant;
>>> +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
>>> ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
>>> +@@ -26,6 +26,10 @@
>>> + #include "LightSource.h"
>>> + #include <wtf/Ref.h>
>>> +
>>> ++namespace WTF {
>>> ++class TextStream;
>>> ++} // namespace WTF
>>> ++
>>> + namespace WebCore {
>>> +
>>> + class PointLightSource : public LightSource {
>>> +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>>> ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>>> +@@ -26,6 +26,10 @@
>>> + #include "LightSource.h"
>>> + #include <wtf/Ref.h>
>>> +
>>> ++namespace WTF {
>>> ++class TextStream;
>>> ++} // namespace WTF
>>> ++
>>> + namespace WebCore {
>>> +
>>> + class SpotLightSource : public LightSource {
>>> +--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
>>> ++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
>>> +@@ -36,6 +36,7 @@
>>> + namespace WebCore {
>>> +
>>> + class FELighting;
>>> ++struct FELightingPaintingDataForNeon;
>>> +
>>> + class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
>>> +     WTF_MAKE_FAST_ALLOCATED;
>>> +@@ -132,8 +133,23 @@ private:
>>> +
>>> +     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
>>> +     static void applyPlatformGenericWorker(ApplyParameters*);
>>> ++
>>> ++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
>>> ++    static int getPowerCoefficients(float exponent);
>>> ++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
>>> ++    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
>>> ++
>>> ++    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
>>> ++    {
>>> ++        applyPlatformNeon(data, paintingData);
>>> ++    }
>>> ++#else
>>> +     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
>>> ++#endif
>>> ++
>>> +     static void applyPlatform(const LightingData&);
>>> + };
>>> +
>>> + } // namespace WebCore
>>> ++
>>> ++#include "FELightingNEON.h"
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>> index 47e52e25da..76b119c9c7 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
>>> @@ -16,6 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>>               file://reproducibility.patch \
>>>               file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
>>>               file://fix-gstreamer-include-paths.patch \
>>> +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
>>>               "
>>>    SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
>>>
>>> --
>>> 2.37.3
>>>

