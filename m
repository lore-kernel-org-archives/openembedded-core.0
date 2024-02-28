Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5E5C54798
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 02:38:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4611.1709087902550605495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 18:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kI8E48Bd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2788efe6f1=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S1F2rU012788
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 02:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=C4FfVvtQOCTdT4ESgJ9HhFYFg3anpyaT0O10CI/dnR8=; b=
	kI8E48Bd9K6CwTROGLQHcbIxySJD04zF0AS633DuiDuTkxHL5uj7yJDWGXvN7ngy
	pk3WAKcLn+RZ0IjGsvksR8mDTrsA+USvgrVwSHXO7DZetTTjieWsk07CNcGBSgNv
	X0vL5wIuJVLTYDK8srd0ACTLiiJvPSS7DUnWWmHfJm8UXNGNIfd1Zy2rVMS4oVkm
	lLxn6tTsfeoUahep1fAM6kHo5Vrb8bnK1U3P8VZfXTwjXKOW8dMg16HtkI2+RNhK
	hUjPLbuNic4ZX2yBlWRIKCgHPeYhcs6+9boE5dJUDT92MEWSBshcH8jPQ0JWYZXu
	UR2nSWniiANbq4B6eqELXQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx3vvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 02:38:21 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41S2cLM3000976;
	Wed, 28 Feb 2024 02:38:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx3vvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 02:38:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7AlDecYWKzML3AdnW//AHw+o3dSX0yTYwbUSV3pZcMn2xxOUqY80ZTgfEcX9veo3tN83tvqS/muDxg94N1xtXIxayvpmxpJPG7m7QYt7kBZvHNqPtFQf30kohtVl+da8IFj+oLLy82g42HX/G6SFYOeIrLoX2NEIXp4t6tpu5oFtYP9X6jYTqLPIMWyvhqbHYEgStLhkJfcB9/CnXCAVb2V1EvDKDidUeOQKHOwSfuxdjsiGDwiOWXfFKta1iXaW09Y5U8sM/iubzidG0yv09XbogAQcQNUIQWurJioqLaZoa3Wl92DUavrFgZ3BxyQ0CWpFpfywryPrmbhTIqLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4FfVvtQOCTdT4ESgJ9HhFYFg3anpyaT0O10CI/dnR8=;
 b=cl1LI2u1D/CNPQBEOxgVMlsg0HMcMrxC6Hy2zHf2UM2XiQ4NFHl1EFEpAh0HPuj/JxlTQNdkJYYoROO2DI5B/p87E7Xg+LggpbJ0V+1dIisFrNq7VETxPaOt8IDQ1r5cH2f0eXp6MJh+tfjKU0KdWm3Fkc4FOKCvyDyPdIge3QG3XXOBE2JjIMXncwTtJfNnrh/edm1mVVuupKU4kEfAoumBt5FEph7UaxsS4cBbAEuMQ68vsLczqaM/tlqyQMPuONT6DbxzcGEgsS24LmihikxHoWe8pViX2jh9fOSN0/QMc4id2A+cZBIwC6LnymbliQ6Zta2Dgf0sMXDzU/anmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 02:38:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 02:38:09 +0000
Message-ID: <b7618e7f-42c4-eba5-6d86-0e273133439e@windriver.com>
Date: Wed, 28 Feb 2024 10:38:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
 <20240227100709.1154-3-jose.quaresma@foundries.io>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240227100709.1154-3-jose.quaresma@foundries.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: bf18cf4d-2c4f-41c8-98f3-08dc38064ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kXCto+xjxiJ6sWmy6BdSQpu6DVHeFYeokjueCfdanMT0kqJdZTDw125itJNnwadVirB1xhi8b3uAd2yrIiiDZi8VFh6DdfuZczm+edVVbNUSIccp6ldHPWxN9c3s6b8sMJeJ1PDF8snpbrZF51Y1ENHEVB4FBTRhGmXPTHg+qsKjEE2cMkqoxdX0gjmJxSM1RBHKpIBBdfaHwM88b/IKw4jWhFCNZfZwnLDK8rfSGfI84nD2JRkjtKojTl6mGw4lZ2T1W9i5iQqQ5l56eyX9U+RzS5EiamwuvsdZyon4HQkpHUmIrRVudDtWxfHIV1Zi2pR4QLk3UZd0v2cOHHzNYyanPPfcs/kQQNioz29DBGyKtzujDhesJDtt7RFQKLFGoxnaRKFWb9wreKX3piGow1SeqRr9UfMeiuciz0k+eN6/pQRS/r2wQoeZY9+qcaRmpJrQmVXhGqM+mp+PK9gVsU0KVt89XO44RUOeBzdGLJpvHQcOWBdxFt0hnayRwQB8fgeCcYv+f41iYyUbxpwWNsdYwRNn1dTFEcpnprkC3pQbgS/1+gSNsRlJNlZzwJCv2p1B0EJasSQSmS1V5kfOprqIEg7WU9fJmaZzbGLWO1oXeq9XFj2Dr/sC5DlZci2Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eW1jWERjdjY1ZlhxTEhtcWJuR0VSdncvcW1sdUhTNDZBUTJrT2psZmt6bkJm?=
 =?utf-8?B?R2lEa0FtTENzKzRvRnFwaFBBbjZtSFJmYXp6TWVNYm9VNmRiTUJSby80TTFu?=
 =?utf-8?B?bkZKTUtzakVJNCt2aWFhS0lvOEhNM1ExYjBFMVRmRlJGek5mUzZVZldTc3V6?=
 =?utf-8?B?aDJXb0hOMHYwU3hDdTJXQkYrQ0diMWo5Qlk1OHMyS04ydkVzbVh1S1FrdTUr?=
 =?utf-8?B?Wk9TVitaQXBuRWJSc2gzbTJIb1VjektKcng3T2F2dEs0bzNBeStpN3BxNjEx?=
 =?utf-8?B?MGFvbFlMV0ZjQU1uUkd3cnRnaml5dEZTdHBrRWNUc0YrMDJyR2NOYnloSitX?=
 =?utf-8?B?YzFLUWVzbDd3bFFpaFNLS2hkelVKRVZ6R2hCQW1mc3BmWG5JN3VFaGdaZlUr?=
 =?utf-8?B?U2lFaTBMbVpFb0ZtQTFnaEdDM2hTcWtsRWljbkVOMWsrMTQwWXZiZ0NJVzNZ?=
 =?utf-8?B?NWJmcGYxT0lqajJVTFh0Q1FzTGdhUHJkUjVySGI0d2crTkJuYUFJMlZSdTBT?=
 =?utf-8?B?ZXp5dXlMbTJQSGZsZUluaHI5blhyYzZVQ015MTM3aThGZ3c2QWQ4QTFzWUUv?=
 =?utf-8?B?Y1VMMlczK1NKWmpUVmo3ZkYwdnpNYW1rdGRMcDZLbFZZNS9xM3lZWXRaV2NW?=
 =?utf-8?B?MGU2ZTRNYXkwZmxmaGRzOVJtbGR3NFRYWDl6UkNLbTA1bjlKbzZud1FmVDd1?=
 =?utf-8?B?cTlRQW1wM01IbnhlWCtNeDF1Njh4eTBBS0diUTYybElIdDNCQThUak9NWDJP?=
 =?utf-8?B?bWhIL2pubXJ4eUxoYnR4WG13U0J0M053VFZpQU1pOUhDRHJzZmVjSWNLUXZa?=
 =?utf-8?B?V29OQnk1RC9kRlRTS3JjcXoxQ1U0LzZTelM1ZzJVUWZEMDdZMEtoRzFjdEUz?=
 =?utf-8?B?U2pSWUV3OGJtd01DMmxEdGNIN2UvczE2YlJJaG5BSWF0bHltNWRUVTZBRUlY?=
 =?utf-8?B?SlJ3UVhERTFSVGwyZlJGMXFTVm5OZW1yam5uQzV4Y1ZObmltTE1jSzJSY3hy?=
 =?utf-8?B?aTdYelVmUml0T1pLZ0J6eUEwOWVOMnAvbHBtYkg5VFIrbEt3K0hMcWh6SWQ4?=
 =?utf-8?B?Q0RmV0cwRlhhWmJ0YUJNaTVHRFU4UW5RczFsWm14K0pGa2VUVE9oUnN1enRT?=
 =?utf-8?B?bWtoUnZtdFVNYWsxazNWenFmSEloRGNKTGNobUlzamVmOTYzZllJdGtoVXVp?=
 =?utf-8?B?WmJUMzBqM0VmajM2N2lJcTJ3QWtrTzdNK3hlU3BmQzN3bzhjS3NYSzVEVWkw?=
 =?utf-8?B?K1NlcFRsY3BoNVRPcHdYRUZWSjlsclhCdWRXbVBBK253ekhSMjZKWkw5U1o0?=
 =?utf-8?B?MzFkVElGUnk0SE1vdVRXSjdDM1ZZRkVib09QRGszM3JzT2k1ODhCY0pTeHVU?=
 =?utf-8?B?WlJWSEJNbk92b0c4aUYvNElYcHUyZ2tRWWlZQjhBUG5TUzQxWDFnZ0FoTkRL?=
 =?utf-8?B?N0QyZGtKRSsyUEJZdTdiLzZJMkZmQ0p0NEtNbGhHamFVeE04ajJsNkt6RDlL?=
 =?utf-8?B?NHdES1BLMGxWUzE4bzVFYnhvclVLT3B6dGxlZnRiVmJQb2lJUFdYcS9wK2dN?=
 =?utf-8?B?RWxxVnRoSEk4VlZwM0R4UDJlOGdSY2s5WERjTlVPTUk2MytZSFBVRDNRdURk?=
 =?utf-8?B?dXJhRkcwNSt3K3V6UEQwdXlzb0VLRTFHTUVWU3E1ZXNXK2FpaWZKSVFRUHhm?=
 =?utf-8?B?OXdqa1pWdnFhTlFjMTNHQnU0bjNDcWJ5VmFLdjRTSEl4SkhkSERhN2JaclJ5?=
 =?utf-8?B?Mjl2VU9tOUsrdS9QNEZCV2dVTzVpdmExMWY4cS9XcENBcEZ0Q212R2w1MGdh?=
 =?utf-8?B?Z25jZG00dzlOY1VlMlBqMmcwbzcyRnJjQ2YwV2R0ZXlCL1pMMUpkL2xBSU1j?=
 =?utf-8?B?RnhVNWpQNFZPTEpuOEVuTWgwK3F0RkUxZjNReUxqMmNYWE56cG5lVk42TUhy?=
 =?utf-8?B?YmszUmtKMDVVL1hvSUVDeU82YlFmeW5NS09Uam5CeWtNSGx2L0Ixd3AyYXJo?=
 =?utf-8?B?WVl0V3VPdkQ3Z3dML2wyYml5OGI3aXZ3RDNFT3dFYnhSYmRxOWVzcVlCanVj?=
 =?utf-8?B?VWkyU0RJUlpReDU4ZDVFcjhwaE41RFFaY2NUcittczdXc3A5TStEaUlBTFNH?=
 =?utf-8?Q?F1nKqqqE8xZZ2DfGdxWWgJN/J?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf18cf4d-2c4f-41c8-98f3-08dc38064ccd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 02:38:09.0248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLP9qnN9UmUpa9x0tcUuJUuAR0KK4pFvbkvKZdy8FnFh5/jzGmhT2ReZtHfpgUDh8xWm0cUZ7PjmNs7Y0vfYyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
X-Proofpoint-GUID: QeRfzrFIbku9CftGWcxX8LZYvCGlNuIl
X-Proofpoint-ORIG-GUID: zS4mJL_gCyFZEkjiF9K_c5LYEPbhOGpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_02,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=888
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 02:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196319

Is this 1.21 upgrade going to be merged in LTS 5.0?
The reason I'm asking is that I'm going to upgrade some recipes in 
meta-virt and I'd like to check what would be the go version in the next 
release.

P.S.
Is this runtime error OE specific? Is it caused by some OE specific patch?

Regards,
Qi

On 2/27/24 18:07, Jose Quaresma wrote:
> With go-1.21 dynamic linking cause a runtime panic:
>
> | root@qemux86-64:~# go-helloworld
> | panic: runtime error: index out of range [0] with length 0
> |
> | goroutine 1 [running]:
> | flag.init()
> |         /usr/lib/go/src/flag/flag.go:1199 +0xf9
>
> In my opinion, this would be a good trade-off so that we can update and
> leave the version 1.20 for the next LTS 5.0 since we are already quite
> behind on the version available upstream which already has the 1.22 available.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   meta/classes-recipe/goarch.bbclass | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
> index 1ebe03864f..6899ec28e4 100644
> --- a/meta/classes-recipe/goarch.bbclass
> +++ b/meta/classes-recipe/goarch.bbclass
> @@ -38,13 +38,13 @@ BASE_GOARM:armv5 = '5'
>   # Go supports dynamic linking on a limited set of architectures.
>   # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
>   GO_DYNLINK = ""
> -GO_DYNLINK:arm ?= "1"
> -GO_DYNLINK:aarch64 ?= "1"
> -GO_DYNLINK:x86 ?= "1"
> -GO_DYNLINK:x86-64 ?= "1"
> -GO_DYNLINK:powerpc64 ?= "1"
> -GO_DYNLINK:powerpc64le ?= "1"
> -GO_DYNLINK:class-native ?= ""
> +GO_DYNLINK:arm = ""
> +GO_DYNLINK:aarch64 = ""
> +GO_DYNLINK:x86 = ""
> +GO_DYNLINK:x86-64 = ""
> +GO_DYNLINK:powerpc64 = ""
> +GO_DYNLINK:powerpc64le = ""
> +GO_DYNLINK:class-native = ""
>   GO_DYNLINK:class-nativesdk = ""
>   
>   # define here because everybody inherits this class
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196251): https://lists.openembedded.org/g/openembedded-core/message/196251
> Mute This Topic: https://lists.openembedded.org/mt/104600087/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


