Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DA0C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 13:25:13 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.111])
 by mx.groups.io with SMTP id smtpd.web11.5368.1668173111117346380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 05:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=EjsRul5j;
 spf=pass (domain: prevas.dk, ip: 40.107.104.111, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0qNwyBlF94HREQfKkkO8g4LSz+ZWUiQJ924Zza3M3b7G293d4ppYW+hZ266OVRs1aD3uXdF6pnuMasAQzBs1+ANGJWOzuusIg5TXfRMkjmqttx9GeYmuDz5Kd+hwria7ChSvie45m7mKs5ByaxMdBGDH0jnrNRX9bELqNtru3E9UyYA1Lmlhndigf0PHnxndY3MIrKi5dj6IO3T/uAKwYNqpIh4SF18m4/NQKPEJyxaqAYzQDon3YkVb8eQZAw2s8nLsYAHcLe/p/qOzJ8gMFrJzvPHEfji2gaJaHTwJnSWH4XCGCyNPRd6mwyKp88QY8kD2TgAHLPLYuKKbwtmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2ZyuJW0aexQ9M1CmpV+yRTSc4g5eXL9sHJ8QCBky7M=;
 b=Lph00S9tytWlQ17dTUwSX19ozsRL9NRitwrJ3LyNFBXHZAORECsjXdZZS/L6+K33POF+W+/4uLqh9TcBC354INwDKtbkn7QnGts1zE+5s9OERrStt5wH/fKA5WgBgiE4Mi7r11S6rM0YMIiX3483vjS6RchobLLqVexgQAsUvrQ+7o+SmH014J5UQoyrxoo3T9fOT1R5jF9eTpLWIrZk/xkMv+FV1pSAh9ZhOGK+sfSAQnNxbiEmcFSp+3k8psKAj6hL1pqUiU5SzApk29gdHGOUIScn0L+Ua/tDPc15BaknY+V+KldeVm+TxJJnKF4NiDHAa9Px7e/FrAd4mkQ9Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2ZyuJW0aexQ9M1CmpV+yRTSc4g5eXL9sHJ8QCBky7M=;
 b=EjsRul5jHbEvqcVxDoF5FJbacarR8BKr/tFFc3pJQEIWftrF3TU59Oid2Q7CZXv5wk0t2rHKa2fU2jO8tL0U0FjJAqjIpqC1LlyZWipLfxsXr0LYmLSf54sSjIyXjeyVz4ja6bGbV+/kqhQoOr/AsqnWmGU3g1Pkxt1dWmWmRYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 13:25:08 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::732f:4316:a0be:bdbc]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::732f:4316:a0be:bdbc%4]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 13:25:08 +0000
Message-ID: <7d37134e-3239-f6dd-fe35-4ac5f7d519be@prevas.dk>
Date: Fri, 11 Nov 2022 14:25:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to be
 accelerated
Content-Language: en-US, da
To: openembedded-core@lists.openembedded.org
References: <1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com>
 <7a3e2fb0a5f0e71581fa4c2da529454bd2eb27ad.camel@linuxfoundation.org>
 <3386323.QJadu78ljV@linc>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: paul.eggleton@linux.microsoft.com
In-Reply-To: <3386323.QJadu78ljV@linc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::11) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|AM7PR10MB3939:EE_
X-MS-Office365-Filtering-Correlation-Id: b33dd3bb-6b3e-4e4c-6d96-08dac3e8271d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d+6bX7HlquydxTsusJsf3kfJhinU9BSZ8obIMOylBc62MzThHOYvPoXjXeEjsPhnogYGsLLsT3Lf2crj2eXz7Zb/MND2j4WcQnVVFpu2X9K0jOesVgAH01qBJxeKlcy86/Q/4x1yYYJXGc6zx2lLLA/KNl37Qht1aqItfyc3LNuxm3kXJyhgh7Zfg1CXanmS0c7DUnS02/0oBq3gPe2x0NJImUcpO5TvXcW1LdYiy7r22W/uc4mHLHBwS0jyj+IGmsu6mit57jyVJHj94SzIKfY214T02OqTj/XLjKArG9BITWsBYsuhgWhQ3LcEEl6tNNIAHFJbqyk/TMQwKtSmG0q3GyvVwYKlbpOrpNQc7waZu6tgRoXetbAo/X7eDgQPP0iKiaDNeVUiqQRTLTDsv41/u9jqvBCdQtFoS16W4C1sepuRAUqop5EjJCeYz+eHf4Ts/P0USOMcw1u4mZiLV3PARbt4TckkwtmT0v82V0SbJMeQLmrEA9cZIsE2BV1S10DGX9ivJZUl0UB21IfEkgVMOBlhdLSSPjBBwUJP4s3gMuLEMEfAsb5yHU0sMlXxOm5cR9azJto6jUaVbjp7Lgy5XqnxVINpuZsxyLR21JBKX3AOxL3nZ+tLBwjP1UrGLVBMwmyRHnQHRefm3GgzM5S90RxhX60t3dJ7FxK+nfqjtS+wlLN9Lxs3RSYUpt+FSKxwcsRJasGhUlfi0LwP72w8E5sCr9gWZg14TnyQ24VOat35B04ipdLrjOLG9p0HewdUtWaLRQRPsY+JBmUWPoWYa0ccZQ9qHg8bek8z762QAjEPhsQkSReDcddkADOK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39840400004)(346002)(366004)(136003)(396003)(376002)(451199015)(316002)(31696002)(6486002)(86362001)(6512007)(66946007)(66476007)(44832011)(66556008)(2906002)(4326008)(8676002)(26005)(478600001)(8976002)(41300700001)(36756003)(5660300002)(52116002)(186003)(31686004)(2616005)(6506007)(8936002)(38100700002)(38350700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFVUWSt4S3NKcXR5SmliNWZjcHZ5VDJ4ajVhNzNsVmQ3elhrcisyemJEWW90?=
 =?utf-8?B?ZXBHbzBEakZZN2R3cGZodFF1SUVjdWdNY00vWlZMcjFJRUxCSVZxVFVRdWp3?=
 =?utf-8?B?cytqOEtnK0FOS2RkaTh1eHF1ZHVwSGV1d3I2WUQ1NEJoSDBjMUtYWVJNVEVR?=
 =?utf-8?B?cnprNTVUVGlBTU55aDd5YWkvMDdJT2NkV0xjZG5WeWZvUlI3bmp2L3hOVlQw?=
 =?utf-8?B?dzRmNjd0WGI0ZTRLNWlmekxjb3cxMVVVRktKQWZ4MlQ0M1cyUXllK0UzZ2g4?=
 =?utf-8?B?dGVQZnVmWVVFYVFaVTUrazMrTmplbzMrSnMwWkQ3ZXVHMWpBOHFoeE81ZFpl?=
 =?utf-8?B?UHVvbGxSVmVFcVVaQWpBOU1mVEJ1eGtEVFNvRks0NWcvQ1ZQSnVudHJ1WW1Y?=
 =?utf-8?B?NmFPK3ppMWIxOVZXMDBQTTRJaTY4bkNEL2dNYktnU2lUM1dwMklPRHQxMWJl?=
 =?utf-8?B?bzlFQVVnRWdORTFQeG5EY25wZUtpMm9weDgyc3RmWkZZZ1NCdy8vUlR1eGtP?=
 =?utf-8?B?TmYyejB3a1pNbldydUE5WE9EVFlXangwa3ZBVS9Jek5GSEpEZTFIQjUxQWdO?=
 =?utf-8?B?VzlYN29TUDV0bHdpWkp4STZlZ2FCN0dyTXUwUnFLck9VT1hUSHFHc0lxUkNu?=
 =?utf-8?B?N3NjeE1EazE2cS91TFE1VHB5TmNsUVl3L0p2TWJ6M2N1U3JjZEpiRTlvOVpP?=
 =?utf-8?B?cExKa3BsV1N2RVYwaU5yZWoxWHM5R2tDR1hyVVpRYlNYV1pvOUs1bWY4M3Vz?=
 =?utf-8?B?cnVXQy9JaWtMQVhLV3ZyeDNFT2xUVFNVczMzTU9Nb05aYUtZamI1QWhDSFYz?=
 =?utf-8?B?MTd2NzRXZWdnV0k4cXNJVTNjWWRwWDhrMEpPQ2Erak4xU295YzRCN2NKcnFK?=
 =?utf-8?B?cVFvNUxBZHlyKzYya3J0aGh0Y3VScjVSbkFWV0VyUHlhM0Z6TktoMllrL3ZX?=
 =?utf-8?B?TjFoZklHajRody8rd3c4aXFoVzlhY0M0eTJvNlNOVEp0KzN5eFdCd1c2a0VB?=
 =?utf-8?B?RWlWYy80N1RCMXhXSU41cTNRQVpXL2hqTk93YnlkRHlraDhMcDNQeGFyVE9S?=
 =?utf-8?B?Q3JNL3Q0UlYveHkyM3JGdTJzWVVoU3hjUGJHd1VBT3N3bGEyZ0RhZkVwK1pt?=
 =?utf-8?B?ZU5wMEgvQ0p6UGJTZU56Z2dSdmdia1lFWDZqQVM1Q0tJQ0thbHlUT2hOM1VM?=
 =?utf-8?B?Y0lOT3NwblBTeTZwNUNWaHlmeGZMNG1nRGdiNlhINWVvMzBWVitCSUN0L29L?=
 =?utf-8?B?bFhpVmFEQnhSeGxVbjJJenVwVGtDcHQ2WG9SZ0JyekpkZE04WHJ6ZC9ReHRP?=
 =?utf-8?B?UER5NFpRSUptMWRDM1dXZ1EyaG9objFoMHFlcHhUSU5qR3VNbXlVTDBvYUlr?=
 =?utf-8?B?ZFEzd2FhUjVjeVZOcnNmd3p2L1dNUGpiT3lsei9tNEVic3JhOHRUZGU5S1NV?=
 =?utf-8?B?Z3Vzcko4aU5qNzV6T1JOWnpseExZbUpzN2FHZ05nditMWitHUzZackpMaGhX?=
 =?utf-8?B?d1RUblM4aE1JU0FWaVZBVVpuV3BGSTR6Z3BIak54ZHptWkxHWm51Z1BIeExj?=
 =?utf-8?B?TWFtcmdYNHhoSDB4M0FhY0N0ZUpab2xqS3RwSW5obHJ2d2RLQk5QbmxmVUdi?=
 =?utf-8?B?OFJWWU5uaUJ6RFh5SnVUeUoyaUdQTkxwN1Z2OHBRTTNLK0Rpd0hNT3JrbEZh?=
 =?utf-8?B?WVVUYlViK28xNTNtckRqL2lUTTRxWnpUZnIrZFg1QlBuTnpOVW5GUmJyR25s?=
 =?utf-8?B?RVFjbzBKNWh3Z0k3Z2dHQW8weC9LdVByVFF4S2NZclh2R0pGRmxsbERjSUVv?=
 =?utf-8?B?ZnFlMlJMcFp4UzVDdmFTNE9YYUZ4NU1xbEczdEorVDlNd1JJOEF2QW9sR2cz?=
 =?utf-8?B?NHZpdlorM2ZUKzRrcnd3Y2ZrWWFCbmViUVZxVDZIbWovMjc0TWlvUFlVRHVN?=
 =?utf-8?B?SG1OenJ5aFVBRElld09uaGw2aXo1T2NwOFhIeU53N0M4aG91Q0hrNTFMdzdP?=
 =?utf-8?B?RGFDOXVUeE5vMGpCQzB2MTk1WGgrTHZBZlJaa3c4L3g4T2M5bThiY09hVnNG?=
 =?utf-8?B?SGs1OEZHdklwYmZkb3J5SVdVcUlwMHd5Q0M1Mk5pN2JvNmd2RmF4WksrWlVK?=
 =?utf-8?B?MWhPTXFaQW1IQUlEQXJsUGt5bWRjd0xOdE5ZTHVIK2kxZ0tyY3o1eDlDZGNz?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b33dd3bb-6b3e-4e4c-6d96-08dac3e8271d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 13:25:08.3977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XdzMVSmD7qQbkDkDVWlQN+wJ9+lHIZnLSZGnxNHN8i68m+BFmwlPvFLsgcZrQ8KbULaAVv5sI4qHIyp9ZiB4+/znzR4v7AlAd8w934ds5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 13:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173128

On 10/11/2022 21.32, Paul Eggleton via lists.openembedded.org wrote:
> Hi Richard
> 
> On Thursday, 10 November 2022 11:14:24 NZDT Richard Purdie wrote:

>> Adding in yet further if/else paths with magic variables to control
>> them isn't filling me with confidence.
> 
> I understand that. I was hoping to figure out a way to avoid adding significant 
> extra complexity.
>

FWIW, we've long since given up on using kernel-fitimage.bbclass, it is
way to inflexible (e.g. there's no way to build two FIT images with the
same kernel but different initramfs).

It is much simpler to just have a separate small kernel-fit.bb recipe
which pulls vmlinux or Image or whatnot, plus the .dtbs, from
DEPLOY_DIR_IMAGE along with the initramfs images, provide our own .its
file(s), and build the FIT image(s) there. That automatically avoids
rebuilding the kernel when only something in initramfs has changed.

Building the kernel and packaging the binary into some container format
really doesn't need to be done in the same recipe.

Rasmus


