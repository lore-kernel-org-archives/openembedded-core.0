Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56638C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 01:43:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2667.1637286214664272405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 17:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Okh/kq4p;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6957fdc888=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AJ1JHGV010257
	for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 17:43:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=CRNFa1ouYYUUjlNJ5P/pdH9bRXE+T3qGODxz90iOGYc=;
 b=Okh/kq4pAIsoH+wQKH9EGpIMEFNKjPFHhcqBJxQWF50KiqasHMOUvRvVURAQQSgIG+Nk
 sV6JgA1wgET7dK7JhU75ISztd8jCqM3j7rejLSFhoh5GKn4+oFDnuabo1MMDv9mB5EKe
 ace15KslRxyyS36E8qohM6LUFMg4a+6T0YaWXLqAVoiJlhaeawSAJd3aSh3ZUHNI0BrA
 bkC7pAFfvTjg2w9dOAlFIu693fTvJGpDTR4sLFSaM6Wf3LRzsEBrA2CZFXxCyoZEHp1a
 c8DpLlbfh/BxVZmucQkjZHKnRPB/l3MfrJDjM+kiBu4ASSgA9+IPSy+dKrC4V+5oS3jW aQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ce02h833h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 17:43:32 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AJ1hW8i027265
	for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 17:43:32 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ce02h833g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Nov 2021 17:43:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmOREY/3dEHLwMu1mtYOJfoUL6/u75CUxt8Wb7QXEudH71rG97SAMog0DsWLPkqyDpIZGHZnUzeK3Lf8E6wP7E5KZQ7rEdvo1CL6Hy8+zNz/e7s86MWOIlxOZuI2S1l0FYGZjeMjFde6jpJCESMwmfdu580scJPPXZ3ZNPGyJvgA+792tZYYG+k9vKFhAe5GgseAUhfzB8XrqiLRgtFqIC7GUr2nygAktkPvX9dcjXbZtrjw/AWCjcqfl8oRYBszMc5rqWdTCLnUsB4M1aYWppQxRbSRWAa2g1njavJmD+52n/W2i1f4zwxM/8BhddL/uI636VYkm43Zvj1HqIPyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRNFa1ouYYUUjlNJ5P/pdH9bRXE+T3qGODxz90iOGYc=;
 b=cjoaXW0lSoyQWqta4JgffG55STpGAzyZQP0dtoPpQVNnEqCn7RroawOCBVusz+FH6fqba7X3s0+1ZYolC2+Y8xKWqfACO2dSSXdGZS/ET0flL6315zPZpk9E6UGyJvQosI8hOQA8Uv+pOjtcpWHUQGSwDFZVjFdpiNVPmXBEQpbX+bJsI7Jp3xJL06NounGqDkkoWnGR/W3VAZ69weOCLYogvyVizfH1ZfNjHk4RX2regGPCtkod5oEqlrlc+mhdGQ2UHkc0fVXFcs04pHHM9NGRQsiim1JxtnI7LciSlccjat4C/5nKSI8VeiJk3glCH/yj7le9+p46Qm0HLS72dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5570.namprd11.prod.outlook.com (2603:10b6:303:138::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Fri, 19 Nov
 2021 01:43:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4669.011; Fri, 19 Nov 2021
 01:43:26 +0000
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
To: Luca Bocassi <luca.boccassi@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2f667850-b6f6-e7e8-5aef-41b2d0e64b5f@windriver.com>
Date: Fri, 19 Nov 2021 09:43:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4816C31014FA7FC831A4DAA3"
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0189.apcprd02.prod.outlook.com
 (2603:1096:201:21::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from [128.224.162.187] (60.247.85.82) by
 HK2PR02CA0189.apcprd02.prod.outlook.com (2603:1096:201:21::25) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Fri, 19 Nov 2021 01:43:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c13fca4-58eb-49f5-1f77-08d9aafdfabf
X-MS-TrafficTypeDiagnostic: CO6PR11MB5570:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5570B170246F7FCF61C8C19EED9C9@CO6PR11MB5570.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TbOvUFQkT1y4JjjksyjY8cZr/LsiFlLPVMP3wj4p/EfdzMkM3PlRpOIdyMc3VeQaoCHz58/oKV8C9r9T32wsGi/qh0JyUQ/cw/3v2VnbJUIN1g6/IcjaONXZ9kJHTgp27sNRH2vilFGCnuxVbJo7PnqjkyYO2QFm/AEMjl51TQ2ZMs1HewxfOWJQ39mMk0DyA1Fds94zb/T34OXcR50F1unXqWmzxlxlf2G+XmY9LZbEJ8XRtGmxA3esDX0p7AwAeXU0hWfS+HND2ZD4jYFiIJAFL/eFyIc9R4bAgQLl3AAyZZx11ckWKOwLUOeuv8yzrxKs+lQIaklcV1YC+yckJQdJXlr72sZVO7KWEGiiVqYJrMJO1BdMVooExxIe0xVCxkEW7ZHr6e2b1zRP478fndRJdqJAPYwPkS1qlMgW/jz8EP/6s+HbIzPGErzDm6hKC3CJIoV2vB2t9fm0+Hx3N2TzkxToIfWWNHSyyUdK3eaE9g8qbwaU5b7Ay+93LvmajeNSVrO0V9mNsWyaDzLCx3ACgGS4Ug1KP2Z0IwQBHg9VmplsdrAF2fTjZJQrsUDQyTLTrIyopyiOV8E7ySVOgE/sYkEbouTq3dvcxBNzOIXJOea0C5x19jP3hHcdovrURWrw7XehRIZ3E1rb0ejcg9b9VVs8TFE4i96uC2GcJnTsnv/bfLTneveZobXlR/O1cq1wwh0AUhumdI6a2R9I6uiaoKRUuWHHaMQaUDUwBbYHfjrGwYVztkFc1Cc7hzpio6Srb7bVzQEE1Xw9Fb9zp5yftgiUwSIaJF5SWJGmjdo8rMQZwYASmRXPHsMSwdpqOcGMs/OLnX5cZrjQBczdXwfbu2U02uAkq+8IulBlDaCqH3hc8holsI1p3Q+LAK9CKnIPW73fk1fzOqhZxZWN19lP5fWS+Ykvg+pq2UYu5Es=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(53546011)(8676002)(33964004)(186003)(6486002)(45080400002)(16576012)(508600001)(38350700002)(4326008)(8936002)(52116002)(966005)(38100700002)(2906002)(316002)(6706004)(31686004)(86362001)(26005)(66556008)(5660300002)(36756003)(66476007)(66946007)(2616005)(956004)(6666004)(166002)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFhBdjZYNXM1TFk3cjRjWnQxWjl4c2J2VFY2c05sekhGb2x2MlJIY1VTVDJj?=
 =?utf-8?B?SnNkYWJNZGhWdnFnU0R4RkZzbEcydEVxZ1orVFZSQ3JDZXdQeEgvTjNvYVE3?=
 =?utf-8?B?MGJGTFkwdWMxR3dYM0g2aG4xNGlVNUVSMVVYdU1zY1RDcHlHdi81WllqNVRZ?=
 =?utf-8?B?VGdjQUlHOG1QYm10dkN0SE1oaWV3R2NwNU9lcm9odXZvS2VKcDFYaGJ5bGll?=
 =?utf-8?B?Zmx3aTRxU2tJeElxZ2o4ZGszSDlMUWkrWncrR1h2MmJQbnpmOW1FSng3MTd3?=
 =?utf-8?B?SHh2N2lIVmxXS0wvL3FEclJjOEJyTHk0b0kxci80UDhXK3FmU09KYlljMnBR?=
 =?utf-8?B?emhzaVdTVUNWL0RGUmpYQno1a2VXeDRKbkNEbjZTSFo1RkRjdGYvbnR6Mi9E?=
 =?utf-8?B?QWRjUkR2WmJtcTdIVTMrZmhJeXFGNGRsMlZkV01GVTlYRmhQVDJ4V2RWTFFj?=
 =?utf-8?B?TmEzL2hpRHFmNmhGSmlWTDdlVnJFeHd3amxJMVdzdWxna2UyZDFYVUhIQk1Z?=
 =?utf-8?B?T2R3aEJxdktXV1hCS0xrYXM3MzFiRmIxQnErc29rTzVibXVLeDRYeFF3Mm40?=
 =?utf-8?B?SzdoRnNvMnUrcWtpbzgrZ2dtT1RrNEMweXRGaDU3cG15Q3lWNXNxVE1ISEl6?=
 =?utf-8?B?YlQ5c0FsREpyMEdVTU9PSUVzNGJRNVhkcElDelhTdzdveTd2VzA1MkxUSUFn?=
 =?utf-8?B?VXJnQjVrWFN1enc1dGNmVForamtBYy80V3J6aDJ2YjVJVG1ScWxxbmZHRlhR?=
 =?utf-8?B?TVJQVHFDeFRndjdvNHI1Q0xCck9LUkdSUnMxUDEzdytyMW80YVE5OG4yM0Za?=
 =?utf-8?B?YlhQVHNmUGdhZnRtQnlhSXBqUk1ZVnE5YjBxbUt0ZGZXZUF6eFh6MzROdXY1?=
 =?utf-8?B?VlNwbFE1YzMvV2tId3lRdFdXWU15T0R2ZGlZeVZTY2RJSDNiMTNYMkxQWGE2?=
 =?utf-8?B?NytSZGF4eTJVUy93MUh0STJVVjVKY1RtUmRNNCtjbmI2MThKZGlYODA3dlU5?=
 =?utf-8?B?aU1ybjJBOWtCVzhoU1hxTVZHWkpKQXh0UXBDdFdwYWwwMUQzT0NiRDJZOVA2?=
 =?utf-8?B?alpEOUZzS2JUa2pSd2gvR2JhWWlvUi9nUHRNc0lCdFIxT2MzR3RZSGViMDBo?=
 =?utf-8?B?c0xmY1V3clQyeERFQ2xzSGpGcHp1Z1dWbXRIUzFRQjdvcWF6aDFmRWpiTk1M?=
 =?utf-8?B?Zm51WlpOUGFJMy9HNytKek9qbFMvT25XOVEwSm9rdGF2ZGM2Z1h3UFgxbWtv?=
 =?utf-8?B?aXZXc2YzSTlDQUxQOFQ5S0xGU0JXbHpIUkozRUNDVUtOR3p1VUhoazIraFkw?=
 =?utf-8?B?Ynp2Tytjb0dyRWpQVnRwRWNNV0w3cExoUW8xZDNwRW4zVk5jbjdPMGNZdXBT?=
 =?utf-8?B?SnlrMEplVThSWnFZL1hBMnRaSTFyWGc5ZHVQVjhScGhXTnFHNUVuQm1vUDdD?=
 =?utf-8?B?MnZ6dzVJRmxTd3RYRnFmemxneEROSGE5N0lPS1MxbmZsNFhvVXNYclhEakg1?=
 =?utf-8?B?ZWhGS2hWcnRjOTlvWEUrK3RGQTdkUmhYVFlEUHlEaGVqRDhhWUNvQ0d1c0VV?=
 =?utf-8?B?a1NIOUJCN3lybEJUbnJabGh2ZmxONWpMYW1JTy9tbVhWSUZobjhJeThZUlBa?=
 =?utf-8?B?NGZybFMwZXRvMzN4M0VvYTlMbVo4SHRoMXhXYUVPb1JuZVZKbThkeTRQbG95?=
 =?utf-8?B?OURTZG5BV0NDUlRQREVENGtEVllNZC9ZcUM0RWxLUXc0QzVkLzIxa01zandS?=
 =?utf-8?B?YTQwbUlrbEhleDB1VVVyOGVUWk1RTEFLY0RMTTdub21VM2tIK2RzTks0dTVJ?=
 =?utf-8?B?eFpES2hRUXJhMEhPcSsrUWtsaE1IOW5VSUpSZG8zRGZoVWhSRHAxRUUwQUx1?=
 =?utf-8?B?SmdVdGo1dHF5Z1ptbWdoSWs5eWQ5RjcyS3BvWDgxTVNyTkI2R2FFOWZablZK?=
 =?utf-8?B?ckpzV2t5Ymhvd2tNazdIZUI1dlFjWnllTWNua0NRRC9DUWpnVkdTT2xRaldE?=
 =?utf-8?B?MmFBb1BZbjNoSmhQakZwRGZMcndtd1JCUzljelpEVnJJU2Jiazk4aW5ybThT?=
 =?utf-8?B?bWtJN0VEU0FkUEtzSThlZC9melNuMlBrQXR5VlI4N2t5aWVma2hsUUdDTHdZ?=
 =?utf-8?B?V0loa1o1Wncxa3c4OURhNDJncUJCNkJrREJQazZ0bUZPUFVpVCtLUTBybTRL?=
 =?utf-8?Q?dP1oeZV25x7Ujjt+jvRShCQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c13fca4-58eb-49f5-1f77-08d9aafdfabf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 01:43:26.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m5i1WEWGqYiT3WTArfUcznrdtdnIrFIKgtGPo6Fg+ZzLi+qo4Wko9eOieD9UTQUdlhxg6fEIIJ8IVoMgrlzF5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5570
X-Proofpoint-GUID: g8w-91mhFeMWsAdzuoKGzsWpV7iOy-__
X-Proofpoint-ORIG-GUID: zVdvnrN_7yxQOh3nM7h-hh-shdbdF7Cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_01,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 01:43:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158488

--------------4816C31014FA7FC831A4DAA3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

If the real useful part is only about systemd-analyze in case of 
nativesdk/native, I'd suggest adding systemd-analyze-native or 
nativesdk-systemd-analyze instead of extending the current systemd recipe.
This is because systemd has a whole bunch of dependencies which 
basically make no sense in case of native/nativesdk. Looking at the 
src/analyze/meson.build file, I guess it could be built independently.

Regards,
Qi

On 11/17/21 8:31 PM, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> systemd-analyze in the next release will gain the ability to
> run the 'security' and 'verify' verbs offline, on local units.
> This is very useful at build time and/or in CI systems to detect
> errors and issues before changes are deployed, as a static
> analyzer tool.
> This series enables building the systemd recipe for the nativesdk
> targets, so that systemd-analyze can be included in the SDK and
> called by users/build systems/CI systems.
>
> Luca Boccassi (8):
>    systemd: skip chown when building for nativesdk
>    systemd: skip postinst in nativesdk builds
>    systemd: remove /var in nativesdk builds
>    volatile-binds: remove /var in nativesdk builds
>    volatile-binds: add nativesdk
>    kbd: add nativesdk
>    os-release: add nativesdk
>    systemd: add nativesdk
>
>   meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
>   meta/recipes-core/os-release/os-release.bb    |  2 ++
>   meta/recipes-core/systemd/systemd-conf_1.0.bb |  2 ++
>   .../systemd/systemd-serialgetty.bb            |  2 ++
>   meta/recipes-core/systemd/systemd_249.5.bb    | 29 +++++++++++++++++--
>   .../volatile-binds/volatile-binds.bb          |  7 +++++
>   6 files changed, 41 insertions(+), 3 deletions(-)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158384): https://lists.openembedded.org/g/openembedded-core/message/158384
> Mute This Topic: https://lists.openembedded.org/mt/87118013/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--------------4816C31014FA7FC831A4DAA3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Luca,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">If the real useful part is only about
      systemd-analyze in case of nativesdk/native, I'd suggest adding
      systemd-analyze-native or nativesdk-systemd-analyze instead of
      extending the current systemd recipe.</div>
    <div class="moz-cite-prefix">This is because systemd has a whole
      bunch of dependencies which basically make no sense in case of
      native/nativesdk. Looking at the src/analyze/meson.build file, I
      guess it could be built independently.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Regards,</div>
    <div class="moz-cite-prefix">Qi<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 11/17/21 8:31 PM, Luca Bocassi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211117123201.111905-1-luca.boccassi@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Luca Boccassi <a class="moz-txt-link-rfc2396E" href="mailto:luca.boccassi@microsoft.com">&lt;luca.boccassi@microsoft.com&gt;</a>

systemd-analyze in the next release will gain the ability to
run the 'security' and 'verify' verbs offline, on local units.
This is very useful at build time and/or in CI systems to detect
errors and issues before changes are deployed, as a static
analyzer tool.
This series enables building the systemd recipe for the nativesdk
targets, so that systemd-analyze can be included in the SDK and
called by users/build systems/CI systems.

Luca Boccassi (8):
  systemd: skip chown when building for nativesdk
  systemd: skip postinst in nativesdk builds
  systemd: remove /var in nativesdk builds
  volatile-binds: remove /var in nativesdk builds
  volatile-binds: add nativesdk
  kbd: add nativesdk
  os-release: add nativesdk
  systemd: add nativesdk

 meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
 meta/recipes-core/os-release/os-release.bb    |  2 ++
 meta/recipes-core/systemd/systemd-conf_1.0.bb |  2 ++
 .../systemd/systemd-serialgetty.bb            |  2 ++
 meta/recipes-core/systemd/systemd_249.5.bb    | 29 +++++++++++++++++--
 .../volatile-binds/volatile-binds.bb          |  7 +++++
 6 files changed, 41 insertions(+), 3 deletions(-)

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#158384): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/158384">https://lists.openembedded.org/g/openembedded-core/message/158384</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/87118013/3618072">https://lists.openembedded.org/mt/87118013/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------4816C31014FA7FC831A4DAA3--

