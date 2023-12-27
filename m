Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1376FC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 15:47:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.104110.1703692041036944176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 07:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iIGasjiO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0725c91a19=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BRE1NnL023542
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 15:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=RrXiNVBruqRpY7qQOz4
	maBduEhY+jEm8wHuYukQgGIg=; b=iIGasjiOM6AkBRaurTcrMXRXtrxCcnJk2A4
	EtoaJ5ECGaySZoMkTFfONQcvAKOIBqbRLAwnxEbO3LpfXBjVlBdp41eroSpHmEMa
	4zpIFElrxZi7Pw/TC+hVHE1dVTQVSExHjIFkNn4WyBCUJpR5xyZiV1ta8TS2MHMi
	UEeQNJiWG9sJW3y0y0gTCn7hu8WHaqS4PItnbptPGYrLMcBbaepmAtVgf+xZsLT2
	WZ8wgk01EMiXwwoO54sl8OlrZJSsleHFrJ8LP7Xg+YA72QQuLDYp/TwSRuPggJO2
	3UhRYfOvfEG7gMiHUxEVY2PVBUDME0WljM+6E95EmiK1ehL9aog==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5mrxud0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 15:47:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fa5g0I9ZL8fKDi+C748BOa5v4cG/VY42xWVonWZdUTm2ZjgWZSTg/xX8J/Eh7dSFhi08AquVB2KJbU0iWZU5rOHdJgvxE6BcFrO+6HWp8M3s9hRChAm3nKPkOzo876uXY+Zl0axPXqf3bEfaU+mkeYXSoQIW/6VyBKsdddsdC+Q8uJ1fnn2LIBvZdPtRvJ8XVIHLnkUwOzP7eW9KQ+DYA4UzAdzrkJB8pzqDVmj9V18dcYvCSoyMH0CJuM689hi//P0F6JhmxIqFHCfNI+8GmaG48hoS5qg2pGsPkr3rfNz+9D4fLa60bNgEzvpzsyXRs4WwZmqG5AIITXuY3dXSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrXiNVBruqRpY7qQOz4maBduEhY+jEm8wHuYukQgGIg=;
 b=Zzl4RvVbeD206ItTVtyGLjwuQrYWQGNP3S3USLriJcx68l96wgfa7xRWRtZ3ivMU3LJYF4+v+1sn/X6BV/Z1caTRFgglsSZvJuWPfQ3PaXjozzsuoLEU8EUa/4L9HCtr1yKxnf6wqMvjt/o55uxLOHCsYMnseiXaSphHnmBrFh5ky3pVHRv64oy6e2bW9cRqYKK02G2+GTrNvXwmaNH9I1S/S/55i9pLYepCqRU9dz+CFbmCpQKJOVfgTjRPstYTpKWqWZp7sLeh2k2Rb5wZ54suG+gCY3UAsCgrFo71bLnoMI+AADc6jOQXxrNfGhjt8LHAADm0kFdqR9sXu27Lkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Wed, 27 Dec
 2023 15:47:17 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4b4:e7a7:9d2:946f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4b4:e7a7:9d2:946f%6]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 15:47:16 +0000
Content-Type: multipart/alternative;
 boundary="------------08azkSr8ns2Gy60NjzxR4n7U"
Message-ID: <942a69f9-07ae-43c3-90dd-ce687bad22ab@windriver.com>
Date: Wed, 27 Dec 2023 10:47:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [patch] packagegroups: Add perl modules to rdeps
Content-Language: en-CA
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Harish.Sadineni@windriver.com
References: <20231227125025.2531461-1-Deepthi.Hemraj@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20231227125025.2531461-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA2PR11MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e822b2-a2ba-494e-d419-08dc06f31a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ne3/NcW34WL/ua51PdH/vD9fE0V0URttGAVDL1rm2RriyTj5TB8EM7q2qfbCJEn8cyzsUo5fgO+VgBHAD0qMPb8fEYxkDkSmeoEJ5I5D8jP+eubDxPHO1G64Gh8DtBM+qI1+K6FrxEaXhS8/WuuCtd8az6/calmsJrL/UYPqVCy3Tq5GD22+XbvHY7lfOTvJvIQyx08lUp7hbKQ3jD/vQiNyaAUPJO3327vniH9qdvoqFkUILUS8/qXG41HG0nDHfRFB6UTu3ZrmVf9jEu07KeQd8rVd7HUP8u1yTLBL+wfa8qlbol+kH9wHKgXCvPFpP3Eh2oDpSCoFMLAfGSNE8mHtFuqsl3nIE84dtynrsFpo7I+DNqQu+p8p4eG3t56qRUZow9N6goJtE+YZ73PUPhJfAuHQ4j4RJLNFmRtqc0hgTYhNuP7vz5dPMZR8fAW8OmKuzUR5kfMk7qgHLTFPCG9koQ7iRSVLzoT6F6c4wbm0770KqgbfB0w+GUGZ8Z7tmnzZfFrYPPRd2Aw6O6Q+0V2AXehgvSgYzLVRzow88UUturoLB5f3qQd9R09QHg7ZEPqud4FgzXAj+U4xaaOchQmt/2pMBUUX11aKGdr2ES1abBNx92Y9jQrESw7O/rm74tEAgMiZtPOk0KSNNAaKAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39840400004)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(107886003)(2616005)(8936002)(21615005)(5660300002)(6486002)(8676002)(316002)(31686004)(66556008)(66946007)(66476007)(4326008)(36756003)(966005)(2906002)(31696002)(6666004)(86362001)(6506007)(6512007)(4001150100001)(53546011)(33964004)(41300700001)(478600001)(38100700002)(166002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RkgzSnJ3UDJMaWtGR25HRWs1ZitUSzl6K2lObHlYenVGc1BqN3E3SkxXbks2?=
 =?utf-8?B?QkJMbXBKWWNiMThmRkJHYUxUZ2IrQk5rVHdCNHlHbzM1aklaY2Z0MEZnMzJB?=
 =?utf-8?B?RXFYNzZaSWVYbDBGYkwwUEJieXAzTXZLWnU1WGVRZHN6dE51Z0drd2YyMmc2?=
 =?utf-8?B?WXFJUTE0TTBWZGlYNjk3bk5pbm4yRzJuQnN5OG44YytOMndad2MrOVFwNGZC?=
 =?utf-8?B?aUtHNG1xVmpoMDBFcm1Eek1SN0FDY1VTSkQycG0zQmlXU1lmeTlRZnRLRE9a?=
 =?utf-8?B?bDVqUzIraFlDRWtkUWx2SDAzeUZ0bE80UGZTbHdBTEdGT0lUU00vWlRSN29F?=
 =?utf-8?B?UTJ2Vll0K1NCZWR1ZW9lU0xDOXhneGpQWXlQMkYyTDZ1NUdsVG1hODRLSzNZ?=
 =?utf-8?B?YVNKZnMwZ1JMMDlLU2pUNkFWWUgzdTNUbWlyemQrMnJ6SFdONTdMazlKL3Fs?=
 =?utf-8?B?RC93Nno1d2V6RzRDTDJSRjZrUUgwZGZMM25GTzZtaUZmQjlPSGl0WWFnWXow?=
 =?utf-8?B?dWdXNEpCaEwzeDNMS3lOKzNxMTBYMEtHbGJZczF5OWxaTUE2dXE0MU9sM1lD?=
 =?utf-8?B?azdQdUl6Qnl2a0tISkQ3Z2tXR1Fobm1HeGtPWUl2RmZHVUxGdk1IOFRSU2lp?=
 =?utf-8?B?RFNrWUsyckRFK1NSVWIvTGtpREM0d21xRnlyYjdaaWJaYy9TbjN0UytmVFZ6?=
 =?utf-8?B?QUQyNmRJbVVCMmJOK3RsSXIzZFFxL2lFbjRMcHdhMXhTdGJwZVk1SXJiVmhz?=
 =?utf-8?B?SlF5QWNvY1JSWFdQR1RnVG1VWnc5Y2VWOXM3SExVWC9uSjhoVGs2cGVJWmIx?=
 =?utf-8?B?S2FVNlJTNCt1dS9sVXRHTDR2Rnk2L3NyemdYVllGZGZRWU9xc0s2RHB3K1RQ?=
 =?utf-8?B?Myt4eFI0SHU2ZWhuWFYvYnFxODVQWG96NEpZZXVvYkFVbWFhdTZyUENwVzRU?=
 =?utf-8?B?dmhsSW1DWG1jRHhETEJiZGdEMzM5aVg1L3RwN3hxdG1PUG1GdFFCSjZCZFgz?=
 =?utf-8?B?cXE1ZHEycFNYK1R2K0ZLcGZxRXFwVWRCOUlnRENkZTdoSDkwcjdKdzAxWGc4?=
 =?utf-8?B?OUNUaUdqM3Jpd2hneFE4S244bDArZy93bFNCOWoyOG5ZTDBuVGtxdjdndXZY?=
 =?utf-8?B?MjJ3QmI4YzBCdi9yNGhickU0UkdTRjRLWHZmYVBZaG9DaHFHMHRvSnBkMkt4?=
 =?utf-8?B?OGc0T1AxNmNuOG1aOHE5WnJ5elZHVEdmR3h1U3VzY2IxZklMa0t6bWhvaUhN?=
 =?utf-8?B?YVFQRXdZSmhkQ242V0dFNVhaaHE1RU9oTENpZDhqRWdPU25BbW1RTDByTTUw?=
 =?utf-8?B?WmpaRmpzNTlMeTE0NkpKVkJmOWRlcWZJT2VONkx0YVZ3R3c2WGE3ODRrMCt5?=
 =?utf-8?B?YXlTd0NVR05ZdzhxVjEvQ3dOenBUVjZCeUgxaVNPdVdPSFpFMGRSNENna1Y3?=
 =?utf-8?B?M3JqWVZFMVoxK25HOHAraGx4dmdkRzRvQ3NnWTQydk5iUXpXRkU0QTNQaHFv?=
 =?utf-8?B?VTZiT2thWTNXZC9TVWlCbE1xUnJBT2g0a0JEYTVITitwdjlmSDdXM3dVc2lr?=
 =?utf-8?B?UTZMLzh5WWxCRXNGWVkydFovMnBDbGQwOThNVHV2R09PUjh4bDRDbW85N0E1?=
 =?utf-8?B?OFhmMHdxakNUVXRwejMzTkZEcU1lQ0QvN3MxV0JFb1VSdjRZMU1NbWpjUEhI?=
 =?utf-8?B?TEVTb1VMQjFDdWhQQnNkU09JRkxtSkxaRk5pamJvU3ZXYmo1RmdyUDR5ZEU3?=
 =?utf-8?B?Z1ZRdyszSXE5bmFoK2I3MGMrbGt0NG9MQTFvaGN2aUMxeWFENW5UYXVQVjZG?=
 =?utf-8?B?NzZvaVpUNzJkYlJwc1NtUXR6Ti9UazlxM1VsMDhZUytWQ0NoQ29JN2l5bWJI?=
 =?utf-8?B?VHMxLy9KNXhHM2JpaFhsZklyUHVQVzZLZ3kyREh2enJkK2J5ajRVVGVOT1Zk?=
 =?utf-8?B?akZndkpEVEZtanNZSHBINXM2Nnl3ZW1COXFadDZHM09XdC9mb0JkejZraTZm?=
 =?utf-8?B?cEpSb3cwRks5Zk5NNHJwb3RKVEFxOTR1Um1TL0RNYW02K09LWXJsVkFYcFZP?=
 =?utf-8?B?bUtLdnB6aVpJTkFBTzhETU5sRDdqbDZPTGNjMi95TW1MQzU4VkRpaE44VUVp?=
 =?utf-8?B?ZFgwUE1saWQ0ODNWTWx2Z2trb3BjNk9MSlVUVFFZRFpMNWZYOGR0WE1VYks5?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e822b2-a2ba-494e-d419-08dc06f31a0c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 15:47:16.5991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sc6VxD4+urxmxUkyzIjBxGS+qoJ42cAl0z4ezD1+miXs9C3X5YEmAH32MYq/kM/E3JtBz43EsfPKFBPt2oHt8d7Q4dnwT/tpA/2q8DPNWOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
X-Proofpoint-ORIG-GUID: UvtpdKnEo3aVpnXzruRyU_zwko9Ex3Sz
X-Proofpoint-GUID: UvtpdKnEo3aVpnXzruRyU_zwko9Ex3Sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 15:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192953

--------------08azkSr8ns2Gy60NjzxR4n7U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BRE1NnL023542

On 2023-12-27 7:50 a.m., Deepthi.Hemraj@windriver.com wrote:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> In SDK,running "x86_64-poky-linux-gp-display-html --help" fails due to =
missing perl modules which are required for it to work.
>
> Fixes:Can't locate feature.pm in @INC (you may need to install the feat=
ure module) and also add all the perl modules to sdk.
>
> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   .../packagegroups/nativesdk-packagegroup-sdk-host.bb          | 4 +--=
-
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk=
-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-hos=
t.bb
> index 11e31dcba3..2561d79900 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.b=
b
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.b=
b
> @@ -8,8 +8,6 @@ inherit packagegroup nativesdk
>  =20
>   PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
>  =20
> -# autoconf pulls in nativesdk-perl but perl-module-integer is needed t=
o
> -# build some recent linux kernels (5.14+) for arm
>   RDEPENDS:${PN} =3D "\
>       nativesdk-pkgconfig \
>       nativesdk-qemu \
> @@ -28,7 +26,7 @@ RDEPENDS:${PN} =3D "\
>       nativesdk-sdk-provides-dummy \
>       nativesdk-bison \
>       nativesdk-flex \
> -    nativesdk-perl-module-integer \
> +    nativesdk-perl-modules \
>       "

perl-modules is a meta-package that pulls in *all* **726** (1) perl=20
modules with each one
being ~100KB.

That's adding quite a bit of bloat for a feature that few people need (=20
gp-display-html --help=20
https://manpages.debian.org/unstable/binutils-common/gp-display-html.1.en=
.html=20
)

We just need perl-modue-feature to get features.pm.

tmp-glibc/work/core2-64-wrs-linux/perl/5.38.0/packages-split/perl-module-=
feature/usr/lib64/perl5/5.38.0/feature.pm

Can you try again to see if you can require fewer packages please?
If you can explain that you tried adding > 15 perl modules and you still=20
don't have all the dependencies,
then we can talk about what to do.

Please confirm that you are able to use gp-display-html to view the=20
results of a profiling run.

../Randy


1)

=E2=9D=AF ls tmp-glibc/work/core2-64-wrs-linux/perl/5.38.0/packages-split=
/ | rg=20
module | wc -l
726


I
>  =20
>   RDEPENDS:${PN}:darwin =3D "\


--=20
# Randy MacLeod
# Wind River Linux

--------------08azkSr8ns2Gy60NjzxR4n7U
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BRE1NnL023542

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-12-27 7:50 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Deepthi.Hemraj=
@windriver.com">Deepthi.Hemraj@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20231227125025.2531461-1-Deepth=
i.Hemraj@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Deepthi Hemraj <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver.com">=
&lt;Deepthi.Hemraj@windriver.com&gt;</a>

In SDK,running &quot;x86_64-poky-linux-gp-display-html --help&quot; fails=
 due to missing perl modules which are required for it to work.

Fixes:Can't locate feature.pm in @INC (you may need to install the featur=
e module) and also add all the perl modules to sdk.

Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;=
</a>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
index 11e31dcba3..2561d79900 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -8,8 +8,6 @@ inherit packagegroup nativesdk
=20
 PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D &quot;1&quot;
=20
-# autoconf pulls in nativesdk-perl but perl-module-integer is needed to=20
-# build some recent linux kernels (5.14+) for arm
 RDEPENDS:${PN} =3D &quot;\
     nativesdk-pkgconfig \
     nativesdk-qemu \
@@ -28,7 +26,7 @@ RDEPENDS:${PN} =3D &quot;\
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
     nativesdk-flex \
-    nativesdk-perl-module-integer \
+    nativesdk-perl-modules \
     &quot;</pre>
    </blockquote>
    <p>perl-modules is a meta-package that pulls in *all* **726** (1)
      perl modules with each one<br>
      being ~100KB.<br>
    </p>
    <p>That's adding quite a bit of bloat for a feature that few people
      need ( <span style=3D"white-space: pre-wrap">gp-display-html --help=
=20
   <a class=3D"moz-txt-link-freetext" href=3D"https://manpages.debian.org=
/unstable/binutils-common/gp-display-html.1.en.html">https://manpages.deb=
ian.org/unstable/binutils-common/gp-display-html.1.en.html</a> )</span></=
p>
    <p>We just need perl-modue-feature to get features.pm.</p>
    <p>&nbsp;&nbsp;
tmp-glibc/work/core2-64-wrs-linux/perl/5.38.0/packages-split/perl-module-=
feature/usr/lib64/perl5/5.38.0/feature.pm<br>
      <br>
    </p>
    <p>Can you try again to see if you can require fewer packages
      please?<br>
      If you can explain that you tried adding &gt; 15 perl modules and
      you still don't have all the dependencies,<br>
      then we can talk about what to do. <br>
    </p>
    <p>Please confirm that you are able to use gp-display-html to view
      the results of a profiling run.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>1)</p>
    <p>=E2=9D=AF ls
      tmp-glibc/work/core2-64-wrs-linux/perl/5.38.0/packages-split/ | rg
      module | wc -l<br>
      726<br>
      <br>
    </p>
    <p><br>
    </p>
    I<br>
    <blockquote type=3D"cite" cite=3D"mid:20231227125025.2531461-1-Deepth=
i.Hemraj@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
=20
 RDEPENDS:${PN}:darwin =3D &quot;\
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------08azkSr8ns2Gy60NjzxR4n7U--

