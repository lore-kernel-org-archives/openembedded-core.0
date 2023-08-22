Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D230EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 03:38:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.883.1692675533481052956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 20:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=YiNhZekQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75984a2f3d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37M2wNr8001494
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=2m7UgIXsE8ckX6/xiL7trgC1JXvtRseVjYKDPvNh7lQ=; b=
	YiNhZekQaliPLmjlBAA+9XSxFip988k8BlIaxFNGrqS5YWmh8c3rx3FV/68sSD0l
	OF5wrVusmtpP2yIi7ZhUdgRuTW2h9LFh4TaGW2zOmNDhsIqUXMx18Dbq3YiwXVfK
	f12NCCbiWd1xVY2H8veLwzFty9U19S0WHRCoho09njum/kUEg1zvtHuIALbdhNYj
	aIV14fW3ya9nbVSkN+fWreQnId0zPKTJpa+s/q1185Z0SS4o6pWXAEHrGbXhgknu
	Nh+kNnEW9ZbP2RuUd06MI6gKF0VWtScRnVBucU22xvkVOwkFoFMqIB0AlCiI6SQA
	35sNJk/tyhYcUJDaH00now==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjmq5j82m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:38:52 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37M3ahSM018199
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:38:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjmq5j82j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 03:38:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQZag7l1B5xQ1pzJnwDoooChdbO5jqpvyTUMixxvijguccKD8vRb45+YhvhuLnqXX0CqsQUmrop81bMw2Dx3T0VGrCZLcooQzmSwKA8HWcJiRpkW7Hq8T4PuxNFG6LaXAWop5wyeANyIabgYNhweLO5FFem530m5CDp29jRwCDq/zZ0UgPHXvnBN5BuEOUdWVaI6AFQr8D7hCS/c59LamkvJvv085ZM3T0jVYgfiswhECOGGE/m/yk7s8RCEpNip73tYnhZ6kd0Z6YnkGom9kV8rXgtLFoNv68ScYMsmx+mc9mqsMlr8ujM1qW0IGr6HxwKsSoN1xRCkMcgHRFIFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m7UgIXsE8ckX6/xiL7trgC1JXvtRseVjYKDPvNh7lQ=;
 b=Ss/VVSDMoNB4IEMqvn1w0o9Xlllq2DYS57j6rvTh7mgsZQbujzPHMzHJ9OpyW6M6K4ieskBZvE6jjY7rFAtPqQdrjL+Fp5MDWI5mA08o7CtHq/siFHiU4AfmCerQsOrgM9HRnVV0ok1Yx0uWPLem+gdWzVpuPWJECY9wcHqCaD3A8vJtMktZc0CKRPrglYxUN4EH02+32kZvxz5qzUH4J7+q8jrz7a3lslYdhLGT+iSm96UEOW2xDW0jK5+F1hWpsT2cqIqWsHjiKOQyVpVxJEF6mcWSk0gStxuOpcoDjtPNq7pA7V7Es0Ta6xjkRP7vTvFQHFQFaFkwOOBulfN8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 03:38:48 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::e2da:8be2:4e5e:d265]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::e2da:8be2:4e5e:d265%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 03:38:48 +0000
Message-ID: <86ec0a3c-e9bb-89e6-dd68-e8eb4b18bb16@windriver.com>
Date: Tue, 22 Aug 2023 11:38:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][kirkstone][PATCH] go: fix CVE-2023-29406 net/http
 insufficient sanitization of Host header
Content-Language: en-US
To: vkumbhar <vkumbhar@mvista.com>, openembedded-core@lists.openembedded.org
References: <20230726043733.1979925-1-vkumbhar@mvista.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20230726043733.1979925-1-vkumbhar@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:404:14::18) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae7ea2b-7c15-4a3c-958f-08dba2c14b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9I9L93fjevDM7x76oi0+6gSbUuFfsP+qBeu8j8kVcgnP9E0UzRqY3kcjI5G007tyKs9qJ02JsYlnxDi+cahOb/ZRc67SwcgTasyK3S7h1LUJqUcuoC/gutwZcuowUSehUCuOi3BfpCCOKToHl+XGpY4b68L9VcQ8LzRBeWEjxH374mPCLvDdZDh6wD7JYivUuoL14tk4qUlWnuNuMFqchi5ph1aoeOfpaQUejeWh9CslAmySV1oqcZn+LJsQgTHMlTaalqGBYYR9jP1yU+qz/+dv+24Qj3xyBB7Lng74ecGU3iKk14fGHEpECJSJc8KqCDsLaxgQOVD9MrNRX1HRCYtLV2q+l64RneF8P8tUTK0xQW68Rk2um2dJr8lCE/DrUERhePGn25dCxb8iLNw+2FbXe+DkE1nadErj79ENIcYimOyhIVUjI68xo369NbAZVgGH8sMLbsmGrqls+nOwzor2Y4r4i0ogKi3DcWLu3idTbHzd+eFbUhgc7q7SXHj3KH+xtDpZEVn4v+qBu3DHVJLA4JnrJE+v5A6exp1KNnqg1e9BdVyX15fmfoKahcuoBt47+baeHoWoc+izCLtjriCrlV1EJLkSk5OROT/dJVpkoPTKHfAKV2CNNbXxSGe8YP8s5jbePsN8XpxM/OMqorQg6hvpR6Ubg/534W1pvcNnhlMEAMU1lVkjLQmrZu0hN5y2/7pbAk7tftJV1CO2z7GVZI8LgnI5QT5OYCbVVtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(376002)(346002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(66899024)(8676002)(8936002)(2616005)(41300700001)(36756003)(966005)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(66574015)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(14892575004)(9126006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTZkeWRSUVVCQVE3RzFVZWppOUNjbU1Ic3FURWFTbU9Od1JGb2ErZDBIQjlB?=
 =?utf-8?B?QVc5aXB4bWNObTJWSk5CWkYrcCtuMEJjR2J2eXZXOVoraDZybE8yUHB6bXN6?=
 =?utf-8?B?Smh0c2RaMUtteWJEUElHYy9sYXM5cmtzZ2k1NTRHaUxuR25YU0dLaU5MT2lW?=
 =?utf-8?B?SytvZEFtRStTcEs0a1BJaWRpS243cWY1Zi94YmVRQmlJYzMwMWVEdmxvT3NU?=
 =?utf-8?B?MFI1OUh6cm5XeWZ6K0E2ajgvT3hvd0U5dFhXVUI4MkZVenRRS3Z1Z0hmb1Fu?=
 =?utf-8?B?UHdoWjJSc3QxTlQ5QVFPblVVaWVIU25YMy96YnhqbnNqSnJjU3c4OWZJZURV?=
 =?utf-8?B?aDZCRUROc1R4TUNFVkdWV0ZlaVFHbTRUMXgvS2crOEc4MzAvUE55Y1NlN3Bv?=
 =?utf-8?B?cTE3MUNETzdhdEI2SlRRTC9hUlJtc0E2QjQ4NjRuOW5qdEJ5azA0VVBvRWJl?=
 =?utf-8?B?ZG1QUzR6MUU3VExWZVo2ZngwSzRnSGt1VlgvdDQvQXh0djd4L2NaZFd5RmJx?=
 =?utf-8?B?d1V3MDREalNFM05TSEk5b1lGbXp0N0FIOVdOWElkckM3OHl6SlFOWHVHWERK?=
 =?utf-8?B?eFNiNFhNV2l6RFNvL3ZBS2l2TmE1dDRCZ2tvOHdIdytlblROZldoOURoZG5z?=
 =?utf-8?B?YTlvUjdyQTFzaWl6ZXNUQmJucjl1aFg5alZUNDlQS0Z0L284THQ2L2xGd2ZJ?=
 =?utf-8?B?RHkrMVY0cDY3a0xxZDZnZDU2WEtLMDAyak81L1lTcE4rU3VxZ21jaEVVVC9y?=
 =?utf-8?B?ZkdZZm1wWTdtbU1wZnRHeU9xU0NkdmlqT2cvb2tnT3VLWmRNTC9sUHpFcjZK?=
 =?utf-8?B?SXZ3cytoS0YrVFQ4b01sUVBxTHphRjljYTgyYkVxU053dWllWXZGU1QrSzR5?=
 =?utf-8?B?VHA4c2ZIVTM2cTAyOHpCQ0ZsUWNDZEIyZm8yeVhXa2EwNElPalZnaWRwdHA2?=
 =?utf-8?B?RXdNMUg5TFk1YkFWZFR2MHNBODhkbHVaWnVScEJkc0JjNisvdGY3dkJyMXdt?=
 =?utf-8?B?b3RIUXR4TWVwR1pWbjlqZ3NxQS9GeVZVK29lTEZEOW5LcFluR3J6TEpaWmJK?=
 =?utf-8?B?Sm9JTDIxMy8ycTNxaFRPeVh4NFR2Qkw4SjJmbU9ZWnRmUExEY1daaWJ6ZE5P?=
 =?utf-8?B?VFlSbTRtOEZMLytVMkRSWWRVUEZqTC9ITmlWajMwRStEVDd2R0JkZGdLRFQr?=
 =?utf-8?B?NWdzZXh1am5SbUtIQktGTmV5K2VWMzhsNHZ4ZHpXNFNWMXVRbExNMEpGTUVR?=
 =?utf-8?B?bUhqQWEwU0E4MnJzSnl2NUJMQ0lJSmx1SWZpTHRkZ1NKdVlhdG5haXN0UUFU?=
 =?utf-8?B?akQrZ0FFNTBzUk1PUFIxTXYyTUZEWHB0d2djQnZ2V0hwMytReDUyWFdzR2Ns?=
 =?utf-8?B?MkR1ay90amJmMFBKaTZ3QysrWjVJdjYvN3dMcE1KSFV3MWdLb1pEamNiTGpU?=
 =?utf-8?B?R3BYd3dPY3o3UDV4clk4citBQjVwOG8vUnJrWmM5SndORm9JY2pUdlZ6MFdN?=
 =?utf-8?B?SFVNRW45SlJiMHBXZzU4SExkSG14WFI5NmtiYkduT3UyUU15ZVdDcUlPUlpT?=
 =?utf-8?B?c1hvNDExVFBaTFdyb1N2RGdORkpCOVVLZ0RtMUJvU1VWQlR4UFp2cGVlclNB?=
 =?utf-8?B?UW02cEQxMWdjZSs1eEYyOFREeDRTaWo0ZlAwUWRSWXg0MEZsNURxb2h1eUI0?=
 =?utf-8?B?Y3YxVzB1UzlndSt0Yks5RldGclBLeXBhWHFlN1ZVakVKL2QvMDJ5dlpUWjhY?=
 =?utf-8?B?VHJMT2FnK2Z2MFhxTnVYemJoaUZRVnFiR3JtVDNmejZqTzR1YUY5MGFTUHJR?=
 =?utf-8?B?bUM5Y0g5dmJnV0YyQzg4R2xDTDlyQWNnYUhoRkszenYrRE5sMCtud1BPc3pW?=
 =?utf-8?B?WlhGS3NPcm5uSUtYSEZQVXVicmREWHZ2SHBrQ3dnSkNKYTZqYkozMVUwNUY5?=
 =?utf-8?B?MDlpOVo4UnQ4by9sdTNBZTZRSkZkcTU1UkZIbUl0amRVMTBGbWJ5TkswNGpz?=
 =?utf-8?B?c21zOUxpL2JLYWZzbm1QUFdzckVJSlM4NWxoVGNPNmpLRnlZbFdqNkU1KzZq?=
 =?utf-8?B?VGFVZjJ0YTVZY1FRdUhHNERMbFk2dHA0eEk0OTczdjltbU1FTFBtcVBUV2xz?=
 =?utf-8?B?UmhiWnBYdERndVZFdGowN25IdXhzNEFaZDllclpiZ1B1MHYwNFdlYWJoL0U1?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae7ea2b-7c15-4a3c-958f-08dba2c14b37
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 03:38:47.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C814z0lwt7eGxg97bPGZTxNgw8kO4IsYwhsI+ZZT/uEOxTvNCu9zTqFdI/edxfzoEpe7EiDM0stdAZic7wMQuGixZgfIP43W+t3g1vu9e5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
X-Proofpoint-GUID: yMAor2Ws9nWmdXYoWbj0dgXRFqKcAxxe
X-Proofpoint-ORIG-GUID: OvAJ8-0bF9iI_WWJATFAinT2WSwG9NDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_01,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308220028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37M2wNr8001494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186492

Hello,

This patch caused docker failed to run on kirkstone branch:

$ docker run --rm -it ubuntu /bin/bash
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
3153aa388d02: Pull complete
Digest: sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3d=
d7f508
Status: Downloaded newer image for ubuntu:latest
http: invalid Host header

Maybe we need consider revert it atm since CVE-2023-29406 is a medium bug.

// Robert

On 7/26/23 12:37, vkumbhar wrote:
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>   meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>   .../go/go-1.18/CVE-2023-29406.patch           | 210 +++++++++++++++++=
+
>   2 files changed, 211 insertions(+)
>   create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29406.pa=
tch
>=20
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-dev=
tools/go/go-1.17.13.inc
> index 73921852fc..36904a92fb 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -36,6 +36,7 @@ SRC_URI +=3D "\
>       file://CVE-2023-29405.patch \
>       file://CVE-2023-29402.patch \
>       file://CVE-2023-29400.patch \
> +    file://CVE-2023-29406.patch \
>   "
>   SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6=
f1d1fc0c1d784ada0cd300fd"
>  =20
> diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch b/me=
ta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
> new file mode 100644
> index 0000000000..a326cda5c4
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
> @@ -0,0 +1,210 @@
> +From 5fa6923b1ea891400153d04ddf1545e23b40041b Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Wed, 28 Jun 2023 13:20:08 -0700
> +Subject: [PATCH] [release-branch.go1.19] net/http: validate Host heade=
r before
> + sending
> +
> +Verify that the Host header we send is valid.
> +Avoids surprising behavior such as a Host of "go.dev\r\nX-Evil:oops"
> +adding an X-Evil header to HTTP/1 requests.
> +
> +Add a test, skip the test for HTTP/2. HTTP/2 is not vulnerable to
> +header injection in the way HTTP/1 is, but x/net/http2 doesn't validat=
e
> +the header and will go into a retry loop when the server rejects it.
> +CL 506995 adds the necessary validation to x/net/http2.
> +
> +Updates #60374
> +Fixes #61075
> +For CVE-2023-29406
> +
> +Change-Id: I05cb6866a9bead043101954dfded199258c6dd04
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/506996
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +(cherry picked from commit 499458f7ca04087958987a33c2703c3ef03e27e2)
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/507358
> +Run-TryBot: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Roland Shoemaker <roland@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/5fa6923=
b1ea891400153d04ddf1545e23b40041b]
> +CVE: CVE-2023-29406
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + src/net/http/http_test.go      | 29 ----------------------
> + src/net/http/request.go        | 45 ++++++++-------------------------=
-
> + src/net/http/request_test.go   | 11 ++-------
> + src/net/http/transport_test.go | 18 ++++++++++++++
> + 4 files changed, 30 insertions(+), 73 deletions(-)
> +
> +diff --git a/src/net/http/http_test.go b/src/net/http/http_test.go
> +index 0d92fe5..f03272a 100644
> +--- a/src/net/http/http_test.go
> ++++ b/src/net/http/http_test.go
> +@@ -48,35 +48,6 @@ func TestForeachHeaderElement(t *testing.T) {
> +	}
> + }
> +
> +-func TestCleanHost(t *testing.T) {
> +-	tests :=3D []struct {
> +-		in, want string
> +-	}{
> +-		{"www.google.com", "www.google.com"},
> +-		{"www.google.com foo", "www.google.com"},
> +-		{"www.google.com/foo", "www.google.com"},
> +-		{" first character is a space", ""},
> +-		{"[1::6]:8080", "[1::6]:8080"},
> +-
> +-		// Punycode:
> +-		{"=D0=B3=D0=BE=D1=84=D0=B5=D1=80.=D1=80=D1=84/foo", "xn--c1ae0ajs.x=
n--p1ai"},
> +-		{"b=C3=BCcher.de", "xn--bcher-kva.de"},
> +-		{"b=C3=BCcher.de:8080", "xn--bcher-kva.de:8080"},
> +-		// Verify we convert to lowercase before punycode:
> +-		{"B=C3=9CCHER.de", "xn--bcher-kva.de"},
> +-		{"B=C3=9CCHER.de:8080", "xn--bcher-kva.de:8080"},
> +-		// Verify we normalize to NFC before punycode:
> +-		{"goph=C3=A9r.nfc", "xn--gophr-esa.nfc"},            // NFC input; =
no work needed
> +-		{"goph\u0065\u0301r.nfd", "xn--gophr-esa.nfd"}, // NFD input
> +-	}
> +-	for _, tt :=3D range tests {
> +-		got :=3D cleanHost(tt.in)
> +-		if tt.want !=3D got {
> +-			t.Errorf("cleanHost(%q) =3D %q, want %q", tt.in, got, tt.want)
> +-		}
> +-	}
> +-}
> +-
> + // Test that cmd/go doesn't link in the HTTP server.
> + //
> + // This catches accidental dependencies between the HTTP transport an=
d
> +diff --git a/src/net/http/request.go b/src/net/http/request.go
> +index 09cb0c7..2f4e740 100644
> +--- a/src/net/http/request.go
> ++++ b/src/net/http/request.go
> +@@ -17,7 +17,6 @@ import (
> +	"io"
> +	"mime"
> +	"mime/multipart"
> +-	"net"
> +	"net/http/httptrace"
> +	"net/http/internal/ascii"
> +	"net/textproto"
> +@@ -27,6 +26,7 @@ import (
> +	"strings"
> +	"sync"
> +
> ++	"golang.org/x/net/http/httpguts"
> +	"golang.org/x/net/idna"
> + )
> +
> +@@ -568,12 +568,19 @@ func (r *Request) write(w io.Writer, usingProxy =
bool, extraHeaders Header, waitF
> +	// is not given, use the host from the request URL.
> +	//
> +	// Clean the host, in case it arrives with unexpected stuff in it.
> +-	host :=3D cleanHost(r.Host)
> ++	host :=3D r.Host
> +	if host =3D=3D "" {
> +		if r.URL =3D=3D nil {
> +			return errMissingHost
> +		}
> +-		host =3D cleanHost(r.URL.Host)
> ++		host =3D r.URL.Host
> ++	}
> ++	host, err =3D httpguts.PunycodeHostPort(host)
> ++	if err !=3D nil {
> ++		return err
> ++	}
> ++	if !httpguts.ValidHostHeader(host) {
> ++		return errors.New("http: invalid Host header")
> +	}
> +
> +	// According to RFC 6874, an HTTP client, proxy, or other
> +@@ -730,38 +737,6 @@ func idnaASCII(v string) (string, error) {
> +	return idna.Lookup.ToASCII(v)
> + }
> +
> +-// cleanHost cleans up the host sent in request's Host header.
> +-//
> +-// It both strips anything after '/' or ' ', and puts the value
> +-// into Punycode form, if necessary.
> +-//
> +-// Ideally we'd clean the Host header according to the spec:
> +-//   https://tools.ietf.org/html/rfc7230#section-5.4 (Host =3D uri-ho=
st [ ":" port ]")
> +-//   https://tools.ietf.org/html/rfc7230#section-2.7 (uri-host -> rfc=
3986's host)
> +-//   https://tools.ietf.org/html/rfc3986#section-3.2.2 (definition of=
 host)
> +-// But practically, what we are trying to avoid is the situation in
> +-// issue 11206, where a malformed Host header used in the proxy conte=
xt
> +-// would create a bad request. So it is enough to just truncate at th=
e
> +-// first offending character.
> +-func cleanHost(in string) string {
> +-	if i :=3D strings.IndexAny(in, " /"); i !=3D -1 {
> +-		in =3D in[:i]
> +-	}
> +-	host, port, err :=3D net.SplitHostPort(in)
> +-	if err !=3D nil { // input was just a host
> +-		a, err :=3D idnaASCII(in)
> +-		if err !=3D nil {
> +-			return in // garbage in, garbage out
> +-		}
> +-		return a
> +-	}
> +-	a, err :=3D idnaASCII(host)
> +-	if err !=3D nil {
> +-		return in // garbage in, garbage out
> +-	}
> +-	return net.JoinHostPort(a, port)
> +-}
> +-
> + // removeZone removes IPv6 zone identifier from host.
> + // E.g., "[fe80::1%en0]:8080" to "[fe80::1]:8080"
> + func removeZone(host string) string {
> +diff --git a/src/net/http/request_test.go b/src/net/http/request_test.=
go
> +index fac12b7..368e87a 100644
> +--- a/src/net/http/request_test.go
> ++++ b/src/net/http/request_test.go
> +@@ -776,15 +776,8 @@ func TestRequestBadHost(t *testing.T) {
> +	}
> +	req.Host =3D "foo.com with spaces"
> +	req.URL.Host =3D "foo.com with spaces"
> +-	req.Write(logWrites{t, &got})
> +-	want :=3D []string{
> +-		"GET /after HTTP/1.1\r\n",
> +-		"Host: foo.com\r\n",
> +-		"User-Agent: " + DefaultUserAgent + "\r\n",
> +-		"\r\n",
> +-	}
> +-	if !reflect.DeepEqual(got, want) {
> +-		t.Errorf("Writes =3D %q\n  Want =3D %q", got, want)
> ++	if err :=3D req.Write(logWrites{t, &got}); err =3D=3D nil {
> ++		t.Errorf("Writing request with invalid Host: succeded, want error")
> +	}
> + }
> +
> +diff --git a/src/net/http/transport_test.go b/src/net/http/transport_t=
est.go
> +index eeaa492..58f12af 100644
> +--- a/src/net/http/transport_test.go
> ++++ b/src/net/http/transport_test.go
> +@@ -6512,3 +6512,21 @@ func TestCancelRequestWhenSharingConnection(t *=
testing.T) {
> +	close(r2c)
> +	wg.Wait()
> + }
> ++
> ++func TestRequestSanitization(t *testing.T) {
> ++	setParallel(t)
> ++	defer afterTest(t)
> ++
> ++	ts :=3D newClientServerTest(t, h1Mode, HandlerFunc(func(rw ResponseW=
riter, req *Request) {
> ++		if h, ok :=3D req.Header["X-Evil"]; ok {
> ++			t.Errorf("request has X-Evil header: %q", h)
> ++		}
> ++	})).ts
> ++	defer ts.Close()
> ++	req, _ :=3D NewRequest("GET", ts.URL, nil)
> ++	req.Host =3D "go.dev\r\nX-Evil:evil"
> ++	resp, _ :=3D ts.Client().Do(req)
> ++	if resp !=3D nil {
> ++		resp.Body.Close()
> ++	}
> ++}
> +--
> +2.25.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184856): https://lists.openembedded.org/g/openembed=
ded-core/message/184856
> Mute This Topic: https://lists.openembedded.org/mt/100365153/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
liezhi.yang@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

