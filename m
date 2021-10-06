Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7198FC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:43:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.5346.1633480981551263241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HfXYDw57;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=591368cda2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1960YpLD016955
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Oct 2021 00:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=QM8hT/BtPyeT+dePRT3467rB/u2TnQIhmovtWqmLV8A=;
 b=HfXYDw57ZEOuwxKI9DwuAvNrsjIfAORXP5JBwduOR77YR9Reksnzs//71XeOgBTSdN34
 T1kkjsGoXSNNHs0UN9xwgyr+rnYEeqMHrvCN5nCUk1DzMkm5AO7uK53pN1a3De4lB8TH
 m9oa87mVvy2xycDMFCKY0W+sG2FzckD1G5SHieIHiGQ8ZfE90484pRFg/UlSEupYRHcU
 l3Iy1d0Fpv7sMGkgAiC8gfhI/UbCh2UtBQn3jOgi+RXVE02udxagq9V682gmO0+6uY4M
 mQiIRwlJnyyJp8ZAS4gG6hNcA0br/w9abENN/6WFj3r7S6woAIOx4zKJ8WRnbLLQBNNX 6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bgs9f0f8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 00:43:00 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1960gxVD032083
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Oct 2021 00:42:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bgs9f0f89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Oct 2021 00:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsST03QLZQOqCSlt+RfDjqgLlx9KAfXsMqOoVCsxGH9lkJQPBeWMFB9CmiaIbsAigVKFMLoMvFRzvk7rPnmoesjGBV3GiPGFaXzyDp4pn/J/KoN1B/xTKzAxxAFdKn8ji9mXpi8gCtWgdFNiG8m+5WEVLs4RC0nkTKPj/rOOfsX4vRJYzf31oP4k/6ev2GcRbWoBN3r7WVWEVK7enaHDmC2xWHf48v7YpOm6ZO4gNf1aIgwF9hHRcs7RJ7EKmN55cQqJ8ffP81Otvp3/DyUxiOwKOeXVh8svwDagac4GQMOjOL9l9fwNGMaihXW3hUjTruGWGQmDHJUhV2pqRcIg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QM8hT/BtPyeT+dePRT3467rB/u2TnQIhmovtWqmLV8A=;
 b=jcvE/v6WQoaXLbvioccjADjtMapbuj6C4WBxruUuGrBhCBf4pShb1B/NfRi2q6mO5KP9cYK/50FXvKExz7m4F2MQmLuNlWDSXV1c4DnEpGEkhr1eKYzepRC+9qQOi1ZnkRqnw3/XiJ+OfYwM207WvbA/K1yjcbNWCxE6Awpbaw7pZQ9wCHB3J5aDdmhGf0XEiePIGVajkMc9+QAjQHBZoF02N8iklrQe5MFigmQ2szYyh6brG2Cus+Dso/6OFgxZBbBW0HVR4Ear24ap3454uEsvq2pYvL75WE8GsDz9myCuQXv5BWUPDwgS8XuBgwLp56W6rbzgBaUkF5VnT2vKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3866.namprd11.prod.outlook.com (2603:10b6:5:199::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 00:42:57 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 00:42:57 +0000
Subject: Re: [OE-core] [PATCH] Fix rust-native build issue when debug is
 enabled
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
        alex.kanavin@gmail.com, umesh.kalappa0@gmail.com,
        vinay.m.engg@gmail.com
References: <20210929132054.117151-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <582c9e8b-0b34-dba4-4a6f-1d6ff27f9204@windriver.com>
Date: Tue, 5 Oct 2021 20:42:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210929132054.117151-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 BYAPR06CA0049.namprd06.prod.outlook.com (2603:10b6:a03:14b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 00:42:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a6f8cc5-9561-49d0-f36c-08d988623d71
X-MS-TrafficTypeDiagnostic: DM6PR11MB3866:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB386664B8F3FDAB951909BBD2F8B09@DM6PR11MB3866.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uNRZnHcSOWyJf1z70XLni0vOQ00gNL+rdvERvN0fo6oKjf4v0G6kI0j5ODPD9wwqszr85alapi+uUqV3Tgk9Musbi6vFkWuQ8VrUWbpIeJ8T1Wx3pXoiArjF/SnQnZPhdbTRPQi4gWpPqxtkC5X3eYx4Xe83wNo9QDlFfuiByzwPqKChT1Fnm8r4kohS+XLW0gLxkW5s4M6sD2bHUGG7GwMKFwbE4CiuS110dOH2WsrFohmr6x9E/9RQIOxPe+q2zMOTHHkAPLlnfPR8RGM9Tdcf6yLZZFueFVqXaxg0ArTvnlqr8P7LjG2P/0LGLnxDFa+8SuIxYdX1UGiU36TS3hROEKfSqtn4jI3i+rk2rRLPpUbqkeYA20g7IKHLwYyq8STsC2kwMzwuVgXl/McQLn20Q/CtMkavvo7LEwv5MB0y3T17A4HbCoU2NFsWXpnr1iaRLSL74LxIbQVTfCiD95qqxc0mY493t/9T/+MB7DMh3P7aOL8Es6EROturNAYnvTThto1w9TkWXcci6ZN1t/zVNV777kVOxedxjrkCJM3CFhKeT0IVXZ5oadRVLtDF9l5ACA/2mY7FKPqyIN2yXUdbtmJEa7Z8kNVJjKpRluFQ1dSWsssuREgjf0HXavcvZusajPpQpuwUbMUHKV70PQ9fL7ZirOlQcNR1wmXG73UhCE0PCEXECHJQIbAnI55fy5FNJiSlbYz1l2mO7z8RzpbgMwKPMOsK2TzgWVePumrqPv/N6RyYfXTfuqSxhHgxu59twmEERoxJDtHpNxTNdxIuRCT70MqfDPVDRZQnVltoE4mjfN+w9JbphOvM/88OL55RoAfpAow2UM3H0oLgRQNQ9pPuo5BAOMGNhln+HwRsYPJLm9uP60hqcgesMeCStrRhs3iyMWII8VibpBr7Yw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(66556008)(66476007)(6486002)(316002)(86362001)(2906002)(53546011)(16576012)(38350700002)(508600001)(38100700002)(186003)(31696002)(66946007)(956004)(36756003)(26005)(6666004)(8936002)(966005)(8676002)(31686004)(2616005)(5660300002)(4326008)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UFhQWUlGVEZHb3JWeXFmMWRGZTd6SVR2aHAwVUdxdXFvN3ZLSDBWVThpRDUx?=
 =?utf-8?B?TEh3V3RQTUdmZUpuVGlJYTRDYUZ2VzV1aGw1M1pseEZSTlhHamYrUWdXOWox?=
 =?utf-8?B?Q3EvVmtJZFkyR0c4b2ZCc0czYUVFcG15TUw2Sys4bEhaK1ZJaWNuWDB1MXpY?=
 =?utf-8?B?bVV2MGwxTE5PSWVHQzl1TlJIQTIwdjdGQjdYR1UyYnAxUWh5aVhxcFUxRTNE?=
 =?utf-8?B?a2F3eTM3NjFTcDVKVTJNeDB4WkZabXJRWnppdXJaS3I3cnBmeldWNlYzUmhZ?=
 =?utf-8?B?bWNHRGZFSDkrVFQzM25IV3dRd3VzaEYrTFpHQWFyNU85SWVXREltTDBPdWV0?=
 =?utf-8?B?WGo3MUFLdTdrSm1kVUlJUDNVejRaVGczdm5RbWVuQngyUzB2eFdySnBRcFlj?=
 =?utf-8?B?WTNodithc2JhQXdlNnVXQzVJak1EOEdOVHVKNjZvVlVobWUxRTh4dWloZlRy?=
 =?utf-8?B?YjRZd1Yzb21oNHZFTTFTbC9nb1huS2xaOHZZeU4zVG03SlR3TmJXYXpINjJz?=
 =?utf-8?B?ZXhBRHMrYkN0ak1RclovUHN4MSthSlNvanhIN21ySHVyWUswSHRWYXllSHNL?=
 =?utf-8?B?Zk1kVGo3QzFncGtMeGl0UGNIZkZMNkM1OHQzYklmYWFkMnBhY1h4VHNZYW9t?=
 =?utf-8?B?ZzdiL1lrNGUrTlZzbEx5MVVXSkpKb3Y3aVhSNUdMcUhkSS80TUxDRVRBemFm?=
 =?utf-8?B?blpDUTQyc2kxckExM2paZC92R1pTZjZGSHUwWmhrUEFkZmVFZStqTVY1dnVF?=
 =?utf-8?B?TWgxaURnNWFOSE9YdUlDczhWS2dEZWhwY0hpSzZUTlRpa3JMd3ZyU0hCa29p?=
 =?utf-8?B?WmtvV2JXRnZhSmdIQU14b3hQZHJxWTI3d1YvUkE1c3RydzllZU5yaWhJSzVP?=
 =?utf-8?B?eG5KWVVMK1d1UHpod2NhSFV4Ky9yUHlkRXE4YUJFNWhsd252WEErUGJnUDMr?=
 =?utf-8?B?U2FDamVQT0ZPcE8rN2hXMnl2UzhBMjZ3MGtSNUpzTDd4YzdhMEZicFJvZXBl?=
 =?utf-8?B?SWxyRHlhZG5jS3ZLbzNTRmVOdEI4WThPaHllN0wvZ2Nqek1PRVY4clV1Zktx?=
 =?utf-8?B?ODlaNHhHbVBMMzl1emtSUEVITGJTRUNDWUxHRzVuQWhiSlhnOVpJR1g1Q0dB?=
 =?utf-8?B?Q0QvdHhRL0kwcUQyTmhSY1FHaVBGYmdFYzl0SEJVK2pwZVg3dGl1MWZhb0Jx?=
 =?utf-8?B?YVJ6OVJIWVMzSXZQQndVNmNXdmJ5c25BS2piS09GT3A0ajFicGI4elNYYm1S?=
 =?utf-8?B?bXlGV044SzhvSnI1aXRsWnp1ZzExRzlNSzg5Z0d3Q0E0bm1lREFBdjI3NXRX?=
 =?utf-8?B?aWplUVBTVmx2dERjYU4xcHJ5VnVKZFhjNFJqZm85SFVWeTlzdXA2QUtZSFZQ?=
 =?utf-8?B?ckd4ZVA2clRzb05TQWxaOUZIYlYxUHFJRFVzWXhYaFVxd2YzUm40MHM5UUwr?=
 =?utf-8?B?cjhZMnFtNFJXQWZPaTlvT01paVg1cVJjZGVnUXgrQ0YvY0MrVkhjU2NWZHF3?=
 =?utf-8?B?VUlzcnQraTUveVE2TjEwRktZdjJFZDVSalBJWGVvaFBzSUQvOUl4UE9mMjF0?=
 =?utf-8?B?REwreWl0Y1NER2pLaE9tZkhuN2htSFJjWkpRem1USE9lcjVmbmxsblFOZStU?=
 =?utf-8?B?d01BcnpVanVGLzRnc3htQThRMkRsOHB6blRXOWxDaVN4dmVJOGtpYkd3QXp2?=
 =?utf-8?B?VW4xc3V5U3hvc3U3NG93c25ncjNBb2lYZDBMaVNjMThMZnZ4Z3MrckU3MTJL?=
 =?utf-8?Q?n59652KcAEAyty8MR6Mqnqx3cnCfzGDgkyUMVS4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7a6f8cc5-9561-49d0-f36c-08d988623d71
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 00:42:57.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oBujRMc0DKZRBPUECJjmWr9wjmFFdYc24LKG/pZQMFqGrpqFdP5t3ALqpRZJHVyr5M1UMe3UQH9+i7qDQdOwFwLpNmUK68tXBGNXfEogqH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3866
X-Proofpoint-GUID: uByf0Kcapw4x7_jmxbAD2k3VGjo8Jk_G
X-Proofpoint-ORIG-GUID: 9oFZvqxlhREY8jStvjxnHh6K_WF9dAVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_06,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:43:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156671

On 2021-09-29 9:20 a.m., Pgowda wrote:
> When DEBUG_BUILD is set for building rust-native, it generated
> error as follows:-
> =========================================================
> Building : rustdoc, rustdoc-json-types
> error[E0463]: can't find crate for `rustc_llvm`
> which `rustc_driver` depends on
>    --> src/librustdoc/lib.rs:37:1
>     |
> 37 | extern crate rustc_driver;
>     | ^^^^^^^^^^^^^^^^^^^^^^^^^^ can't find crate
> =========================================================
> On analyzing the issue, it was found that rustc_llvm crate was present
> at required path. However, it was very huge due to the presence of
> debugging information. Hence, it was somehow not recognized as a valid
> crate. 

So we need to know more about this. What tool is being used to identify
the crate and has there been any changes to fix is since 1.54?

Also, please check this problem still happens with Alex's 1.55 upgrade:
 
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates



> The following patch removes the debug information from
> rust-llvm-native which is built prior to rust-native but retains debug
> information as required in rust-native binaries.

This is a functional work-around but I suspect that we'll hold-off
for a while before giving in and accepting it in oe-core/master.
Some people might find it useful so thanks for posting it as I suggested.

Hopefully we can better understand and fix the root cause.

Thanks Naveen,

../Randy

> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>   meta/recipes-devtools/rust/rust-llvm.inc | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
> index d7f445385b..0f8fb785b7 100644
> --- a/meta/recipes-devtools/rust/rust-llvm.inc
> +++ b/meta/recipes-devtools/rust/rust-llvm.inc
> @@ -15,6 +15,11 @@ DEPENDS += "ninja-native rust-llvm-native"
>   ARM_INSTRUCTION_SET:armv5 = "arm"
>   ARM_INSTRUCTION_SET:armv4t = "arm"
>   
> +# rustc_llvm with debug info is not recognized as a valid crate that's
> +# generated by rust-llvm-native.
> +CFLAGS:remove = "-g"
> +CXXFLAGS:remove = "-g"
> +
>   LLVM_DIR = "llvm${LLVM_RELEASE}"
>   
>   EXTRA_OECMAKE = " \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156454): https://lists.openembedded.org/g/openembedded-core/message/156454
> Mute This Topic: https://lists.openembedded.org/mt/85948023/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


