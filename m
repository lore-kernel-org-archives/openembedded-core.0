Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8063CC47422
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 03:06:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13376.1705633590794998660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 19:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hbJlpDHc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1748b1ad81=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J36U8w009639;
	Fri, 19 Jan 2024 03:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=rntsRwh+JQ9NBwbh4ZFpogkEx014yQPesEhKzCNq25Q=; b=
	hbJlpDHczA1JZeYY4eT0BIQ7dRWcSqJy8mqdsl0mtmIFTVDVgbkuBCHnOXiC2lMo
	3euHvbsUlEGAIuDIyO6Y/uR1GQNU2J8WztPTanYxYrGkFWqaUo3y/5/DOkzl8CvG
	Ww3tBJ+k6E9o3QkdXatcTymuiguuGINM74hxLWGRp5pXDrLltLj3oDk7sumGxplr
	bxjGdH7Pfi1iBIJot9V3XOkEL3t7YYQ9Ja8ATvghG8IBuVsekM3MBPJ43KPnqxyJ
	mOZHIaVfwOvJomvTptBoVRr9pAcwaFDU01dfYXCsDJLiLyYw21fcw6aAV1vXifSa
	CQDj9H2R5RGHz/OMLCqlnQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxem2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 03:06:29 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40J36Tq9009634;
	Fri, 19 Jan 2024 03:06:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxem2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jan 2024 03:06:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ3JuCl5hxNEtNtnAFbu90GMWuh5NzCY3QrPLl3X6rg1ytddD2eXi72OXatSQRnut0bsdtRNxgU2EXnHQQ1phXFT//91XFw7d2dMjG6T/DWp2R+M4Vg8/zteZPn3Bci6mOWRn1E+4gdbsGwEEOIvFE15Qkr1S3C8nMDSamQqgadI8gqEeDRCG3LylWSxtvhBmGLsppuQAvBeFbXGakJh9fWSF0y0SLzRIUIG8kRaUWwwx9n1OPSTzUAXL2hRV1BMd18Md9d8DJvwXuOmiGYmF+yYcKMwRuSm9OUG8SRAa8cHQDjn3d7kh5tsjER/q2dw6x28oo2lK13G8MQHqthVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rntsRwh+JQ9NBwbh4ZFpogkEx014yQPesEhKzCNq25Q=;
 b=Sf8Dd6jZG4gMSRohJYjl6/xUEQ51uT3VljAsytyrArYedlt1SrGFwfium22Jxh+8wueAuLW9BGWYtbkb885SlHiGzJEWLKZapeRq7e8J4CLWO6QjIxFV9rJ7Iclj1D8CiBgD0WRypnrZ9G4XwqynK91bBTLtz7RAWuNfVN9it9TtEfQ+C2+g4KcGIAmKTvhg21kIvY5YODBwZ4qV1l6TXSes6BGCo1IgSPsODNRQOmMc1l21xdQcljynAKUgDnwgNHk9TsZE/+eCnK6J7NuoH/aJZVnua566o0fMMjkagOknSa0i5wnS3XXDMsXP8WpfpgBDtz+LGY5YZohVvwvGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB6964.namprd11.prod.outlook.com (2603:10b6:930:57::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 03:06:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 03:06:24 +0000
Message-ID: <51ee1c53-0687-22a5-ec9b-88c2ecd2bc66@windriver.com>
Date: Fri, 19 Jan 2024 11:06:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH v3 1/2] shadow: update 4.13 -> 4.14.2
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20240111131521.2305172-1-alex@linutronix.de>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240111131521.2305172-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb7aeb2-3896-43d1-e0f5-08dc189b9f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U8jZL8qaJjCOWdkv7ArMSFBMbYaCVgZz3PlXi/Hhqqf6Cfej7qQDWkGEqxlI1i9/cA17llmpWcPfhmm/aTtAPyt8+bU+g7DZGMumPjIr3AhK8VeBDkEPaDczKY8CSIKJtgxwCeIydGeaKOP2MtqKiq4zkY0MfuTQL6r+qmTEAI6z9ttLrYx9RkYCnwFZpERm192M670QHZwLgjVLYaupEuNhiaK4APoXU4osmXZYPRXen6H4D+HZWhK8KVEZ+tw0OTOpVlsTjRP+ppnWCiMHy4qtCP5//ROR1n1cmEWooavE7fGevW3HUeOx1UkfBa54gQx3gCzuFOEHzmjwGg4//BfzenJD21D2uqEpP/M0EGnhKoOHLEK5zn3tu0ToYZLsg8bsJuMA9GhvCrpPjHzm0ODZfNbY6cglB5ezYdDTPOvkZY5ThO368UaaBsVOILQzc0QA3Jb9an/OIM3lNNnhbar0W+/j3sFHwGE+PXoPSGC5qxTwSkjTv+bkq+Wd5z8LHaiqrMZUM0lCJ3V7JbN1BufRNRd3FdPDIxKoRldThSZFnKM9PdZjqq/Zhb6p23TsOljeypelb+eZst3DiekXFYoIfXqwoPwIlacfEP106CIgAMnH2amC4QZqHBMuiNbKwVKTmtWbOCGqRer9tdnXESM3/YPORcpCjS48P6YnQsrnXO9pTxmzVTsZJ6PaBZD/FV+X7PQkW1AenC/R3pmDFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39850400004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31696002)(6506007)(66946007)(53546011)(83380400001)(6512007)(18074004)(86362001)(66556008)(316002)(66476007)(66574015)(8936002)(4326008)(38100700002)(31686004)(6486002)(478600001)(2616005)(26005)(6666004)(8676002)(966005)(30864003)(15650500001)(2906002)(66899024)(41300700001)(5660300002)(36756003)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVBHbHBPWUJ3WktQWkRyTnZKSVFaTFRMQmxxcnYxeVJETUtORXU5SG10K2Rq?=
 =?utf-8?B?MEVzT0xhRVdKWHlzeVV6M2lDbm5iNVZzenNjdVdoNVQ1YmFkMjdpelpoMCtQ?=
 =?utf-8?B?bW93NndTY2poeExBM1VUQy9WUFl3L0JtVjVRTkFuTUNmTGhFdElscko3YU16?=
 =?utf-8?B?cmM5blZVbkNwWXNyTnBvcEg5Ni9RQ0RyMTZDalltS2RJaWQ1K2tidU9UYkEr?=
 =?utf-8?B?RXFuamxZcmNBZkZma0hhQ1B1dktDZk1mYi92d1p6TUNVVGptcnhNbFdyMlBu?=
 =?utf-8?B?Nm9SLzdhSWVWNEx3c0k5cnB4ZTlLc2luM2NQV2tsazIxS2FteHJ6aG1tQWE0?=
 =?utf-8?B?eE5hNDJBK3l6UHBwcy9RaDIrTjZ5STJYN0Q1SGhkNFlOSzduTDNvejNRYmFr?=
 =?utf-8?B?Z0haOXFmZXQrMlVjSVJpcEdvUUNIV014dGc1eDV4QnZ0ZFFzT3ljUDdJY3Ix?=
 =?utf-8?B?Y2V5cWljNllkVHFhckFSVzRmc2dVNkxpaUJlclpXdmNPYkZLZnFCNE0wbWNW?=
 =?utf-8?B?c0FIdGpvSUlxNFFOWHdVb3RXUldMSkZ1amQvYjVidDR5MTBhM3k5OUJHSTZD?=
 =?utf-8?B?ZksxMTVZR3AxTXAzZm5HdCtLOFZ4MURpVmU1VHhoT2taVzNiQU1OSk1ZdTFj?=
 =?utf-8?B?WXZRcG8zTmpWSE9ibTFHZ3JqQ1p2UVZQYm9vQlVJa0QzM1Faa0gxc1BiVmVl?=
 =?utf-8?B?UUlzaXNiUDFkSS9pWmRwK0pocUZlbFBZVWxEaUZnMDFUTFM5K1h0ZGxNMUVJ?=
 =?utf-8?B?VytVSGlSdmwwMmNRRlZGZmdZcHJYbk9GQlNudUQ4dXUvb3E0YnVmYTRnN0hI?=
 =?utf-8?B?S2ZFNlo4Wit4ZUVxT0ZWRU5ISFpWZWtqMW5qRy9ram4xYnR0Z2hGNnNYM0lR?=
 =?utf-8?B?ZTVjaWM5eG9tUllDbnY4TlNuVlB4NmNhM3lkSHpka0N3akhXRXBPSHl4cFY3?=
 =?utf-8?B?VXkybkpMam8yS2Nhd0VoUTN5aGU0dlJleDhqWEQ5eEpwQ3B3MFlKMzdSUzkz?=
 =?utf-8?B?emFncU9IejkxdTBrelFETjhuMjFTK0R1eWk3TUt1QlZGY3cwd1dyQ1ZWNVpu?=
 =?utf-8?B?RE1jTFZSY2IwYWgySldBb2FVMlpPcnlmbkZGYklaY0dyaEs4ckdLNDcwcCtl?=
 =?utf-8?B?Z3ppSTA0VzNCYkZla1Nzd0FoWjVIVXpCR0VIV3dHRXFyUjJSbFhkdklZa1pY?=
 =?utf-8?B?M2s3MGd1YXpUUHBxazdMdW8zekNzMkZsNGJyNWFSYXMrMmoxMDNRdm1UemM3?=
 =?utf-8?B?aDhyWUJxWkc2M1p6NGZ5bWFYdFRLYWlpcWloejZ1eWRYb2hYMncydW5mU0gx?=
 =?utf-8?B?Q1dPdG5zL1RJdnY5SUlsRjRjTmk3aHFmckx0N3B5Nng4U3lTMlRTcGpWbm5s?=
 =?utf-8?B?anRxNWlmUE1PaGpyYnM5WU9hei80aCtMRm9oZ2cxaDNxRUdLZzc1bTFMbW9P?=
 =?utf-8?B?MkU1b3ViUzNGK3d1bXZibVBVRjlTZWVKSWFIZmlpMjhGM1NReSt1TUExUGZC?=
 =?utf-8?B?UCtxajlXVVE5M2E1bENhbHNGUlFDNWMwUEdIcHVRbzJlYTM5cDRsTTV1QUda?=
 =?utf-8?B?OC9EcXdvSHdER3VFSUtudE42REI5SGMwcnVteDdKdHNLa0JZMEw1eFcvNHRQ?=
 =?utf-8?B?V2Q1WFhhY1ZxTnl0UU9xb3RJOXc5b3c4ZUV0OFliZ3p3dGwxcWlOTE5EdWQ3?=
 =?utf-8?B?Zi9GOWRlcFd2WXN4RWxlUC9rbjE5R2I3SW5NbjR2djNtOW5TaC9aSzk1OWZa?=
 =?utf-8?B?YTIwcFNBRDhNZVhqUmJkV3R2bGtXNlJuaUVYUmM3Uld5ZTBXeXZEYnMxS2I4?=
 =?utf-8?B?NDFCQUNJOWhDTU1EaEtQMWdOd1E0Z0tSbW9UZ3d2UXZPZGYrMHlzVW5TQkdM?=
 =?utf-8?B?ZGVIa2dqSDc5UlVPT1RKc0E2Q3orZVVHUkdBREQzMjNKKzN5VHZySTRXdk5S?=
 =?utf-8?B?Z0dGQ2FaZWhjRXVzdHJOVUxtRGhrQWlmVHM1UkpVd3MyenZKbC9iS2hsWElQ?=
 =?utf-8?B?RjdjYWYrc0VWS3oycldML3VuRU9GZW5qbTVLQ09mckFKZG5hVFVQZVZkeHdv?=
 =?utf-8?B?TUhZQ0lmZ0RZVFFqL0RsdXRBYXBPNC9wank2QU1vMkszbitvYWtSaWZzdm9E?=
 =?utf-8?Q?wukcrXGqhrd0IQNh1JA6sI6hH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb7aeb2-3896-43d1-e0f5-08dc189b9f15
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 03:06:24.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVVAgZqXfcv4CteCeZHubJWUUbDEvFh5n+BOatricb145lezK7STRFjfEopzSLXNmNjmQzvU6pw/GApRSPupzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6964
X-Proofpoint-GUID: wuXX-FuOkUa5dOyKXCdM94FlyAhlxTx4
X-Proofpoint-ORIG-GUID: o1qQ1lt2Ppj_haRP7B2aZsRRXkPqOCvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_12,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 03:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194006

I'm seeing build failures on Ubuntu 20.04.
GCC version: 9.4.0

1. error: parameter name omitted
The problem is that the active_sessions_count function's definition 
lacks parameter. I did change like below:
-unsigned long active_sessions_count(const char *name, unsigned long unused)
+unsigned long active_sessions_count(const char *name, unsigned long 
unused unused_parameter)
But then I observed another error, as shown below.

2. undefined reference to `dlsym'.
| /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld: 
../lib/.libs/libshadow.a(libshadow_la-nss.o): in function `nss_exit':
| nss.c:(.text+0x32): undefined reference to `dlclose'
| /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld: 
../lib/.libs/libshadow.a(libshadow_la-nss.o): in function `nss_init':
| nss.c:(.text+0x1dd): undefined reference to `dlopen'
| /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld: 
nss.c:(.text+0x21c): undefined reference to `dlsym'
| /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld: 
nss.c:(.text+0x237): undefined reference to `dlsym'
| /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld: 
nss.c:(.text+0x253): undefined reference to `dlsym'
| /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld: 
nss.c:(.text+0x365): undefined reference to `dlclose'
| /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/hosttools/ld: 
nss.c:(.text+0x3b2): undefined reference to `dlerror'
| collect2: error: ld returned 1 exit status
| make[2]: *** [Makefile:1130: su] Error 1

On Ubuntu22.04, there's no such issue.

Regards,
Qi

On 1/11/24 21:15, Alexander Kanavin wrote:
> License-Update: formatting, spdx conversion
>
> Drop:
> 0001-Disable-use-of-syslog-for-sysroot.patch
> (issue fixed upstream)
>
> 0001-Fix-can-not-print-full-login.patch
> 0001-Overhaul-valid_field.patch
> CVE-2023-29383.patch
> (backports)
>
> libbsd is a new native dependency, as otherwise glibc >= 2.38
> is needed.
>
> A similar fix is added to musl in order to define non-standard __BEGIN_DECLS/__END_DECLS.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   ...01-Disable-use-of-syslog-for-sysroot.patch |  52 -------
>   .../0001-Fix-can-not-print-full-login.patch   |  41 -----
>   .../files/0001-Overhaul-valid_field.patch     |  65 --------
>   .../shadow/files/CVE-2023-29383.patch         |  53 -------
>   .../shadow/files/CVE-2023-4641.patch          | 147 ------------------
>   ...nexpected-open-failure-in-chroot-env.patch |  16 +-
>   meta/recipes-extended/shadow/shadow.inc       |  20 +--
>   .../{shadow_4.13.bb => shadow_4.14.2.bb}      |   0
>   8 files changed, 16 insertions(+), 378 deletions(-)
>   delete mode 100644 meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch
>   rename meta/recipes-extended/shadow/{shadow_4.13.bb => shadow_4.14.2.bb} (100%)
>
> diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> deleted file mode 100644
> index fa1532c8317..00000000000
> --- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 85d0444229ee3d14fefcf10d093f49c862826f82 Mon Sep 17 00:00:00 2001
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Date: Thu, 14 Apr 2022 23:11:53 +0000
> -Subject: [PATCH] Disable use of syslog for shadow-native tools
> -
> -Disable use of syslog to prevent sysroot user and group additions from
> -writing entries to the host's syslog. This patch should only be used
> -with the shadow-native recipe.
> -
> -Upstream-Status: Inappropriate [OE specific configuration]
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> -
> ----
> - configure.ac      | 2 +-
> - src/login_nopam.c | 3 ++-
> - 2 files changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 924254a..603af81 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -191,7 +191,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
> - 	[Path to passwd program.])
> -
> - dnl XXX - quick hack, should disappear before anyone notices :).
> --AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
> -+#AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
> - if test "$ac_cv_func_ruserok" = "yes"; then
> - 	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for rlogind.])
> - 	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value (0 or 1).])
> -diff --git a/src/login_nopam.c b/src/login_nopam.c
> -index df6ba88..fc24e13 100644
> ---- a/src/login_nopam.c
> -+++ b/src/login_nopam.c
> -@@ -29,7 +29,6 @@
> - #ifndef USE_PAM
> - #ident "$Id$"
> -
> --#include "prototypes.h"
> -     /*
> -      * This module implements a simple but effective form of login access
> -      * control based on login names and on host (or domain) names, internet
> -@@ -57,6 +56,8 @@
> - #include <netinet/in.h>
> - #include <arpa/inet.h>		/* for inet_ntoa() */
> -
> -+#include "prototypes.h"
> -+
> - #if !defined(MAXHOSTNAMELEN) || (MAXHOSTNAMELEN < 64)
> - #undef MAXHOSTNAMELEN
> - #define MAXHOSTNAMELEN 256
> diff --git a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
> deleted file mode 100644
> index 89f9c05c8d3..00000000000
> --- a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -commit 670cae834827a8f794e6f7464fa57790d911b63c
> -Author: SoumyaWind <121475834+SoumyaWind@users.noreply.github.com>
> -Date:   Tue Dec 27 17:40:17 2022 +0530
> -
> -    shadow: Fix can not print full login timeout message
> -
> -    Login timed out message prints only first few bytes when write is immediately followed by exit.
> -    Calling exit from new handler provides enough time to display full message.
> -
> -Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
> -
> -diff --git a/src/login.c b/src/login.c
> -index 116e2cb3..c55f4de0 100644
> ---- a/src/login.c
> -+++ b/src/login.c
> -@@ -120,6 +120,7 @@ static void get_pam_user (char **ptr_pam_user);
> -
> - static void init_env (void);
> - static void alarm_handler (int);
> -+static void exit_handler (int);
> -
> - /*
> -  * usage - print login command usage and exit
> -@@ -391,11 +392,16 @@ static void init_env (void)
> - #endif				/* !USE_PAM */
> - }
> -
> -+static void exit_handler (unused int sig)
> -+{
> -+	_exit (0);
> -+}
> -
> - static void alarm_handler (unused int sig)
> - {
> - 	write (STDERR_FILENO, tmsg, strlen (tmsg));
> --	_exit (0);
> -+	signal(SIGALRM, exit_handler);
> -+	alarm(2);
> - }
> -
> - #ifdef USE_PAM
> diff --git a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
> deleted file mode 100644
> index ac08be515bf..00000000000
> --- a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 2eaea70111f65b16d55998386e4ceb4273c19eb4 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
> -Date: Fri, 31 Mar 2023 14:46:50 +0200
> -Subject: [PATCH] Overhaul valid_field()
> -
> -e5905c4b ("Added control character check") introduced checking for
> -control characters but had the logic inverted, so it rejects all
> -characters that are not control ones.
> -
> -Cast the character to `unsigned char` before passing to the character
> -checking functions to avoid UB.
> -
> -Use strpbrk(3) for the illegal character test and return early.
> -
> -Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/2eaea70111f65b16d55998386e4ceb4273c19eb4]
> -
> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ----
> - lib/fields.c | 24 ++++++++++--------------
> - 1 file changed, 10 insertions(+), 14 deletions(-)
> -
> -diff --git a/lib/fields.c b/lib/fields.c
> -index fb51b582..53929248 100644
> ---- a/lib/fields.c
> -+++ b/lib/fields.c
> -@@ -37,26 +37,22 @@ int valid_field (const char *field, const char *illegal)
> -
> - 	/* For each character of field, search if it appears in the list
> - 	 * of illegal characters. */
> -+	if (illegal && NULL != strpbrk (field, illegal)) {
> -+		return -1;
> -+	}
> -+
> -+	/* Search if there are non-printable or control characters */
> - 	for (cp = field; '\0' != *cp; cp++) {
> --		if (strchr (illegal, *cp) != NULL) {
> -+		unsigned char c = *cp;
> -+		if (!isprint (c)) {
> -+			err = 1;
> -+		}
> -+		if (iscntrl (c)) {
> - 			err = -1;
> - 			break;
> - 		}
> - 	}
> -
> --	if (0 == err) {
> --		/* Search if there are non-printable or control characters */
> --		for (cp = field; '\0' != *cp; cp++) {
> --			if (!isprint (*cp)) {
> --				err = 1;
> --			}
> --			if (!iscntrl (*cp)) {
> --				err = -1;
> --				break;
> --			}
> --		}
> --	}
> --
> - 	return err;
> - }
> -
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
> deleted file mode 100644
> index f53341d3fc2..00000000000
> --- a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
> -From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
> -Date: Thu, 23 Mar 2023 23:39:38 +0000
> -Subject: [PATCH] Added control character check
> -
> -Added control character check, returning -1 (to "err") if control characters are present.
> -
> -CVE: CVE-2023-29383
> -Upstream-Status: Backport
> -
> -Reference to upstream:
> -https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
> -
> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ----
> - lib/fields.c | 11 +++++++----
> - 1 file changed, 7 insertions(+), 4 deletions(-)
> -
> -diff --git a/lib/fields.c b/lib/fields.c
> -index 640be931..fb51b582 100644
> ---- a/lib/fields.c
> -+++ b/lib/fields.c
> -@@ -21,9 +21,9 @@
> -  *
> -  * The supplied field is scanned for non-printable and other illegal
> -  * characters.
> -- *  + -1 is returned if an illegal character is present.
> -- *  +  1 is returned if no illegal characters are present, but the field
> -- *       contains a non-printable character.
> -+ *  + -1 is returned if an illegal or control character is present.
> -+ *  +  1 is returned if no illegal or control characters are present,
> -+ *       but the field contains a non-printable character.
> -  *  +  0 is returned otherwise.
> -  */
> - int valid_field (const char *field, const char *illegal)
> -@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
> - 	}
> -
> - 	if (0 == err) {
> --		/* Search if there are some non-printable characters */
> -+		/* Search if there are non-printable or control characters */
> - 		for (cp = field; '\0' != *cp; cp++) {
> - 			if (!isprint (*cp)) {
> - 				err = 1;
> -+			}
> -+			if (!iscntrl (*cp)) {
> -+				err = -1;
> - 				break;
> - 			}
> - 		}
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
> deleted file mode 100644
> index 1fabfe928e4..00000000000
> --- a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
> +++ /dev/null
> @@ -1,147 +0,0 @@
> -From 25dbe2ce166a13322b7536ff2f738786ea2e61e7 Mon Sep 17 00:00:00 2001
> -From: Alejandro Colomar <alx@kernel.org>
> -Date: Sat, 10 Jun 2023 16:20:05 +0200
> -Subject: [PATCH] gpasswd(1): Fix password leak
> -
> -How to trigger this password leak?
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -When gpasswd(1) asks for the new password, it asks twice (as is usual
> -for confirming the new password).  Each of those 2 password prompts
> -uses agetpass() to get the password.  If the second agetpass() fails,
> -the first password, which has been copied into the 'static' buffer
> -'pass' via STRFCPY(), wasn't being zeroed.
> -
> -agetpass() is defined in <./libmisc/agetpass.c> (around line 91), and
> -can fail for any of the following reasons:
> -
> --  malloc(3) or readpassphrase(3) failure.
> -
> -   These are going to be difficult to trigger.  Maybe getting the system
> -   to the limits of memory utilization at that exact point, so that the
> -   next malloc(3) gets ENOMEM, and possibly even the OOM is triggered.
> -   About readpassphrase(3), ENFILE and EINTR seem the only plausible
> -   ones, and EINTR probably requires privilege or being the same user;
> -   but I wouldn't discard ENFILE so easily, if a process starts opening
> -   files.
> -
> --  The password is longer than PASS_MAX.
> -
> -   The is plausible with physical access.  However, at that point, a
> -   keylogger will be a much simpler attack.
> -
> -And, the attacker must be able to know when the second password is being
> -introduced, which is not going to be easy.
> -
> -How to read the password after the leak?
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Provoking the leak yourself at the right point by entering a very long
> -password is easy, and inspecting the process stack at that point should
> -be doable.  Try to find some consistent patterns.
> -
> -Then, search for those patterns in free memory, right after the victim
> -leaks their password.
> -
> -Once you get the leak, a program should read all the free memory
> -searching for patterns that gpasswd(1) leaves nearby the leaked
> -password.
> -
> -On 6/10/23 03:14, Seth Arnold wrote:
> -> An attacker process wouldn't be able to use malloc(3) for this task.
> -> There's a handful of tools available for userspace to allocate memory:
> ->
> -> -  brk / sbrk
> -> -  mmap MAP_ANONYMOUS
> -> -  mmap /dev/zero
> -> -  mmap some other file
> -> -  shm_open
> -> -  shmget
> ->
> -> Most of these return only pages of zeros to a process.  Using mmap of an
> -> existing file, you can get some of the contents of the file demand-loaded
> -> into the memory space on the first use.
> ->
> -> The MAP_UNINITIALIZED flag only works if the kernel was compiled with
> -> CONFIG_MMAP_ALLOW_UNINITIALIZED.  This is rare.
> ->
> -> malloc(3) doesn't zero memory, to our collective frustration, but all the
> -> garbage in the allocations is from previous allocations in the current
> -> process.  It isn't leftover from other processes.
> ->
> -> The avenues available for reading the memory:
> -> -  /dev/mem and /dev/kmem (requires root, not available with Secure Boot)
> -> -  /proc/pid/mem (requires ptrace privileges, mediated by YAMA)
> -> -  ptrace (requires ptrace privileges, mediated by YAMA)
> -> -  causing memory to be swapped to disk, and then inspecting the swap
> ->
> -> These all require a certain amount of privileges.
> -
> -How to fix it?
> -~~~~~~~~~~~~~~
> -
> -memzero(), which internally calls explicit_bzero(3), or whatever
> -alternative the system provides with a slightly different name, will
> -make sure that the buffer is zeroed in memory, and optimizations are not
> -allowed to impede this zeroing.
> -
> -This is not really 100% effective, since compilers may place copies of
> -the string somewhere hidden in the stack.  Those copies won't get zeroed
> -by explicit_bzero(3).  However, that's arguably a compiler bug, since
> -compilers should make everything possible to avoid optimizing strings
> -that are later passed to explicit_bzero(3).  But we all know that
> -sometimes it's impossible to have perfect knowledge in the compiler, so
> -this is plausible.  Nevertheless, there's nothing we can do against such
> -issues, except minimizing the time such passwords are stored in plain
> -text.
> -
> -Security concerns
> -~~~~~~~~~~~~~~~~~
> -
> -We believe this isn't easy to exploit.  Nevertheless, and since the fix
> -is trivial, this fix should probably be applied soon, and backported to
> -all supported distributions, to prevent someone else having more
> -imagination than us to find a way.
> -
> -Affected versions
> -~~~~~~~~~~~~~~~~~
> -
> -All.  Bug introduced in shadow 19990709.  That's the second commit in
> -the git history.
> -
> -Fixes: 45c6603cc86c ("[svn-upgrade] Integrating new upstream version, shadow (19990709)")
> -
> -CVE: CVE-2023-4641
> -Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/65c88a43a23c2391dcc90c0abda3e839e9c57904]
> -
> -Reported-by: Alejandro Colomar <alx@kernel.org>
> -Cc: Serge Hallyn <serge@hallyn.com>
> -Cc: Iker Pedrosa <ipedrosa@redhat.com>
> -Cc: Seth Arnold <seth.arnold@canonical.com>
> -Cc: Christian Brauner <christian@brauner.io>
> -Cc: Balint Reczey <rbalint@debian.org>
> -Cc: Sam James <sam@gentoo.org>
> -Cc: David Runge <dvzrv@archlinux.org>
> -Cc: Andreas Jaeger <aj@suse.de>
> -Cc: <~hallyn/shadow@lists.sr.ht>
> -Signed-off-by: Alejandro Colomar <alx@kernel.org>
> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ----
> - src/gpasswd.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/gpasswd.c b/src/gpasswd.c
> -index 5983f787..2d8869ef 100644
> ---- a/src/gpasswd.c
> -+++ b/src/gpasswd.c
> -@@ -896,6 +896,7 @@ static void change_passwd (struct group *gr)
> - 		strzero (cp);
> - 		cp = getpass (_("Re-enter new password: "));
> - 		if (NULL == cp) {
> -+			memzero (pass, sizeof pass);
> - 			exit (1);
> - 		}
> -
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> index 85d91751056..4a932d2dbb1 100644
> --- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> +++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> @@ -1,4 +1,4 @@
> -From 21583da072aa66901d859ac00ce209bac87ddecc Mon Sep 17 00:00:00 2001
> +From a773c6b240d27e23d6be41decef0edf24fcee523 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Thu, 17 Jul 2014 15:53:34 +0800
>   Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
> @@ -15,35 +15,37 @@ Note that this patch doesn't change the logic in the code, it just expands
>   the codes.
>   
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    lib/commonio.c | 16 ++++++++++++----
>    1 file changed, 12 insertions(+), 4 deletions(-)
>   
>   diff --git a/lib/commonio.c b/lib/commonio.c
> -index 9a02ce1..61384ec 100644
> +index 73fdb3a..d1231e9 100644
>   --- a/lib/commonio.c
>   +++ b/lib/commonio.c
> -@@ -616,10 +616,18 @@ int commonio_open (struct commonio_db *db, int mode)
> +@@ -606,10 +606,18 @@ int commonio_open (struct commonio_db *db, int mode)
>    	db->cursor = NULL;
>    	db->changed = false;
>    
>   -	fd = open (db->filename,
>   -	             (db->readonly ? O_RDONLY : O_RDWR)
> --	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
> +-	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
>   -	saved_errno = errno;
>   +	if (db->readonly) {
>   +		fd = open (db->filename,
>   +			   (true ? O_RDONLY : O_RDWR)
> -+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
> ++			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
>   +		saved_errno = errno;
>   +	} else {
>   +		fd = open (db->filename,
>   +			   (false ? O_RDONLY : O_RDWR)
> -+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
> ++			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW| O_CLOEXEC);
>   +		saved_errno = errno;
>   +	}
>   +
>    	db->fp = NULL;
>    	if (fd >= 0) {
>    #ifdef WITH_TCB
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index ce3ce627156..c024746d4ff 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -5,7 +5,7 @@ BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
>   SECTION = "base/utils"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
> -                    file://src/passwd.c;beginline=2;endline=30;md5=758c26751513b6795395275969dd3be1 \
> +                    file://src/passwd.c;beginline=2;endline=7;md5=67bcf314687820b2f010d4863fce3fc5 \
>                       "
>   
>   DEPENDS = "virtual/crypt"
> @@ -14,10 +14,6 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
>   SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
>              ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
>              file://useradd \
> -	   file://0001-Fix-can-not-print-full-login.patch \
> -           file://CVE-2023-29383.patch \
> -           file://0001-Overhaul-valid_field.patch \
> -           file://CVE-2023-4641.patch \
>              "
>   
>   SRC_URI:append:class-target = " \
> @@ -26,14 +22,9 @@ SRC_URI:append:class-target = " \
>              "
>   
>   SRC_URI:append:class-native = " \
> -           file://0001-Disable-use-of-syslog-for-sysroot.patch \
>              file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>              "
> -SRC_URI:append:class-nativesdk = " \
> -           file://0001-Disable-use-of-syslog-for-sysroot.patch \
> -           "
> -SRC_URI[sha256sum] = "813057047499c7fe81108adcf0cffa3ad4ec75e19a80151f9cbaa458ff2e86cd"
> -
> +SRC_URI[sha256sum] = "a305edf5d19bddbdf5e836d2d609fa8bff2d35458819de4d9f06306a1cf24342"
>   
>   # Additional Policy files for PAM
>   PAM_SRC_URI = "file://pam.d/chfn \
> @@ -44,7 +35,7 @@ PAM_SRC_URI = "file://pam.d/chfn \
>                  file://pam.d/passwd \
>                  file://pam.d/su"
>   
> -inherit autotools gettext github-releases
> +inherit autotools gettext github-releases pkgconfig
>   
>   export CONFIG_SHELL="/bin/sh"
>   
> @@ -54,6 +45,8 @@ EXTRA_OECONF += "--without-libcrack \
>                    --without-sssd \
>                    ${NSCDOPT}"
>   
> +CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
> +
>   NSCDOPT = ""
>   NSCDOPT:class-native = "--without-nscd"
>   NSCDOPT:class-nativesdk = "--without-nscd"
> @@ -73,13 +66,14 @@ PAM_PLUGINS = "libpam-runtime \
>   
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
> -PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
> +PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} libbsd"
>   PACKAGECONFIG:class-nativesdk = ""
>   PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
>   PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
>   PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
>   PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
>   PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
> +PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
>   
>   RDEPENDS:${PN} = "shadow-securetty \
>                     base-passwd \
> diff --git a/meta/recipes-extended/shadow/shadow_4.13.bb b/meta/recipes-extended/shadow/shadow_4.14.2.bb
> similarity index 100%
> rename from meta/recipes-extended/shadow/shadow_4.13.bb
> rename to meta/recipes-extended/shadow/shadow_4.14.2.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193542): https://lists.openembedded.org/g/openembedded-core/message/193542
> Mute This Topic: https://lists.openembedded.org/mt/103661547/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


