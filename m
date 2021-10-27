Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A5FC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 02:30:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.6514.1635301830654628182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 19:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pjgK2yY+;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5934ff6c8b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R2EORe027568
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 02:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=DYue83zMo01pkVUcLx9+hU/RZ1WqBMNArKJyCZ1+rcI=;
 b=pjgK2yY+AvIAJGkGV8a0KZ0Llfj0TRRJmCjBgVVFPp8hyRNbc62MtQ4JyfEyQPv+d19K
 L+7ltw+jM8vmEWd8y+lOjggqX/fk/tTAs8NGX0jRlHkeyO8aYDhwwtmHuQOXqclj78Li
 rhxdB3nkpEyTL/ds3L1yiCypJpyoxFEOOqcwVOI9itzYbJz8+JQwUoqijFlBTcnxCyPo
 QfEF2ZcaxFhe3FsS2mkQ/GjFw/r/WIkHVTktKJXTZDydJL33ylxSbIDkizpQVnivhjjX
 8R2ldb5w5MW3wPOT4W+BjG2H7Djep+VK4M64PYKss8HDfofHNeLsN+W/mHHmAzK2Ba3o cw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs4rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:30:29 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19R2UTr3017044
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 02:30:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs4rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Oct 2021 02:30:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe+hHSNvxZuE1CuUMjcvH7yTegujSFpzk7b913xFZ1o2B8j0iutmxFjfAoysmRad2idQxgkiuCheO2BmgxdqBWJ8oJ4uwV+BYxo3nkt0X7HCsMHh+PtMeaJiqdEF6T+OS6VF0NDV+eoA0V7hB0ly6+oipsML/y87UYorBBVqGvMZfGyFuJ/p5ADKgh07okN8c7/ssgs1xPZAzl8fLnsm/RFGWEJu8ee+XlMvQAugmPno/990dGFMg728BMrkp0FLJ5qjwMTE5mM8OM4bFmpcyUmh3Usx7dNKRbPab3VtiTX3sW2R31IH5y1Xw751cmQxgAgZT3RAb6EPQA+P9YyVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYue83zMo01pkVUcLx9+hU/RZ1WqBMNArKJyCZ1+rcI=;
 b=my97Hs7x+gDOWfiCM9lxOB2Z/l81veIGOrGcPGNyzW035HAbqDe7WeEguNwPODVedCEDM5ytRwozBVrZhynvCx8QY6aOXE9ZEphyu83WN1I7XFm3HC9OuoEwd2Vv3W8AH0ynr4BCqv1FCPrTS6T7gqWqv+fwawTXaVtaKQJwFC3w0SEAT/0YQztMP3j1A42KjuO/LAFQvlzPJ1WRVsn862ui6hty7ROsr1JxVgoDgpyCngnpA1AVG7lcg7qbNcmRv+td42jzSUSB+yAp+2Bi5yqqTi7a+nUEzvt+JL9w0L+qeYGPKd0HHBhH60d4veO6Ty6fNwPc6/AUd3srKl3YvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 02:30:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 02:30:26 +0000
Subject: Re: [OE-core] [RFC PATCH 11/14] populate_sdk_base/images: Drop use of
 'meta' class and hence do_build dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <20210920124621.1576702-11-richard.purdie@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <c5a8296f-bd0b-e0db-9b1e-7f32ebd5c100@windriver.com>
Date: Wed, 27 Oct 2021 10:43:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210920124621.1576702-11-richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------64AC23848449FE8B50646D11"
X-ClientProxiedBy: SG2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:3:18::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from [128.224.162.158] (60.247.85.82) by
 SG2PR02CA0036.apcprd02.prod.outlook.com (2603:1096:3:18::24) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4628.22 via Frontend
 Transport; Wed, 27 Oct 2021 02:30:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91aaa57f-bc24-4ae0-c32d-08d998f1bbd8
X-MS-TrafficTypeDiagnostic: CO6PR11MB5569:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5569053274A5D4C8A91941CBED859@CO6PR11MB5569.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aFcbgZR7B+MN4CK0VCfhEuFqMRlSjqW1h7VrmrptSe85Kx5rATEo2gXbA9TIpdZZKVvgjpIifodpkabN7rnasVXFjrWCrnBBB2aoBJDNrtkzcD5OE6bae/stYqWVe0MZVP9lna7iJB43nMRj2YkO79e3tGxAEqFZ977ilIYRu1pcEOGO3iUfPTQPvHhdjO8jy9l0R4Vq9tlQKtRxFEhhFZxSwarA3QsR8r/gdXDdYZzKqh3iPIjWbuAEFNNBaPrWC9ujFU4X9d9q4Z/Eg0SanY7J5wEpw+WnWUPblHVg8YUxWBrwhWdGHRyQ84RIboF36eaNAumT00/Jzz1p/x4s61AAhDdoArXZkVbXoN1iixoZi01LqbBIjj3TtV2ot1LD4OZjmIZA1An/rNfbgu8rT+FVusBNpKXLSLzk34GTxClJMPDAFDTkamPf0ztz1NmGHI1vXrQxMSJ7UVoTvOtWSYankBBlXFP/nfUOvgbJ3By04wUDrVAJ319jbO0CRlU8Dn9xmnKzG2XLf45f2wkyp9I5ytxLw8wG9IuRg9G5UooLIIdYdE0ebXzxQixoc51onRskNtl1RaDJV78R3RbIPdhqV5ak7GzcF/UBTzKqSmUR3tnQO/+cuui+uvYgt19iBp5IH4wAKorg6vP6dcLkFr3rBYoPBUYT3ZUxHbTyPGekCEhBr89fxHYrNGRRL3Ojzl15UwKNQ/VDm6WjZ8z8h7bZ/ejdEVlckKuxCuMNi3uthHioMdka0kjdvlODLzSlIjf8ydh/zyrx2KnblfTbwBWP8gXy8Af7pAmkdE4+5B1MUqSR1rVNZVrWGMl2zAOpgcKifTflRnubWUeL2+C1Ip0tOKo1Z0Q1C2Q9oZFkMKosyaVgHiU72Nd6wti7J5xqbaLMeWO4p7XvqEsgdCuKQUWJ2Q/tTAJ/mzdOlXfKoAU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6666004)(38350700002)(38100700002)(2616005)(31686004)(6486002)(86362001)(966005)(2906002)(5660300002)(66556008)(66476007)(66946007)(166002)(956004)(53546011)(31696002)(52116002)(33964004)(26005)(316002)(83380400001)(8676002)(16576012)(6706004)(36756003)(186003)(8936002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTdHNnlvZkZpdG9wK2Mzd05zbWR1VGMzLzZ3ZEowNGZwUDUzOU13RlJKMmRq?=
 =?utf-8?B?K1AzeFJXeWR2MXJRTFh1bGNjc3EyTEh1b3g4QkVIS3M0d296WHdMYlpnSjgy?=
 =?utf-8?B?bUdWTGYzUStwYWIwMFp3Y2dkUXdIbHRjVU8rK3lVQWNwNkpOTThsdTE3UDVP?=
 =?utf-8?B?WC9paUhta2c0ZzZjaSttdXJVVnpZaFFVZUQ3ZEJqU3Zqb0VKNURFOElhR0lI?=
 =?utf-8?B?bXR2cFJVQTVZbmprYmRKbXROV1N4QWR6aWVHL3NQYWdUaWRvN05ReEV3ZUJS?=
 =?utf-8?B?MEJKNGV4L3R4T3o0aEhmclZxcmFyNFVvZ2FReHRNTVpuSmNzekdlNmVWTVFV?=
 =?utf-8?B?dXg2UXEwS3ZuUHdJYmdqT0Y4cWtGNWo0REhiUWN1dzMySEZ1UEdMaDkyZjNq?=
 =?utf-8?B?M2VUSGZRZ2NPMjJPZmRkTzgzT295S2NzTmFkMjYzZFAzRno4Y2pPM2RJMnBq?=
 =?utf-8?B?eFBXYnN2cTBHTVpIZEh2TTQ0TVZIY1QydVNLWUlRRUlaMEdwWkh6MHp3ZDF1?=
 =?utf-8?B?VW5OTnljcVVQdTBvUlhtOTFpTmZEcEl5MTMyejB2aEFMQ0dBa2NpL3EyY3Jk?=
 =?utf-8?B?TXRtcmZmWjRLVDZFVTFieFk5UUNaenZUMXNzUVZldk9ONnZGS1EzdUk2Rlpt?=
 =?utf-8?B?NXNKanRUR251K2ZiU0ZLaFJvYTY3YnVDTlBLWU9zM3FuckxJWmg3MytZYVNn?=
 =?utf-8?B?NVBwbzY4blpqVUJBN0N6Z0x4NytPTE5ES092OXYzSEhLSHhoc2N5azcxSm1t?=
 =?utf-8?B?a1FnWkdpZVk0L2tJK3NyMVlpRWlJVk5EQzJZeGQ0WGEyZFZNOG40V3A2azkw?=
 =?utf-8?B?SU1EWmdha0xjc2czaFhiWjN0d25vamJBcjdBQ05HQXhMQlY2S1NkejZWbWta?=
 =?utf-8?B?WTNPenFSbFo0Uk9VU0w1cXNBVmV6ZmNlenBvWngwbzJhN2FpSUZMcmYyUTJq?=
 =?utf-8?B?Wk9RMGxPZHRqUjRDWmNjczBCVmsyZkR4NjdOWkdTT0c3dndOTHdPM1NFZndV?=
 =?utf-8?B?S2hiT0d0eTVjSXhHUTJOb1htUGxKN3N5bDJqVk83SWo0eUo0S2owWmh4aStt?=
 =?utf-8?B?K0NoTmJHeEtaeWpkUFIyOVRVTlBYQjlLTlRvYzVhVjNOQzdIdjNjMjdGb2VP?=
 =?utf-8?B?UXpVdVg4M0MwTkE0QVFvdGJFeVZwRWRVT09pbFRIQ2syVXJTWWtiZFc1eWxw?=
 =?utf-8?B?aHFIQWJrcW9YcWt3YVlwdndXWlpRMzZhYXl3RDBRV09nTjBoaSszbmtmYjlx?=
 =?utf-8?B?dmlpL3JuejA1YkppOFBtRVo0cVRyQ1AzQUs1UWJRVDZDM2U2NGhCQ2JhSEoz?=
 =?utf-8?B?SUQ5ZTJEeGY0UXhac2V1dU9rTTBUdHFtMURMdVhHNFkvelp5cnhQTTQ0M2ly?=
 =?utf-8?B?ZGNOWFdOVUxkODZ6ZDZTb09LSDRzTmNYbmNjRXh3ZktJbVkrank5SWxNREFM?=
 =?utf-8?B?UGlsVzBDOWNCNDZkenpXaHJ4QVBmMlRaVTVqTmtsSUxBWmEzZWFmOElYTlhL?=
 =?utf-8?B?QmJkS2RaRGw1M2tnbExQb2JxQU5wSTVFTWFNaUdWSFRmSGQvL3Bkd2tQTjRa?=
 =?utf-8?B?bHVCUDM2a1JFek1QT25UUk4wM3Q1NnJnaWl4VEhJcWhBdWtEaWplRjgvWGJq?=
 =?utf-8?B?TlFaMGszdm9kdy9lOW1FRkFJY2FXanNHSjU1elE5a0lpbWZaekpsZjFLYzMw?=
 =?utf-8?B?T2FINDR1ay9US0lsWU1FV1MwWlhibFBmQnFuK0NuOVU2ZUJXQWRwNmk0TEtz?=
 =?utf-8?B?eWNVRi80Z1NkUU1qbXVJYjJ6bHhnRWl1RDEwNGw1NFZKaStXZzNCZDlDU0d2?=
 =?utf-8?B?S1lKRCtleW80eGg5b3VJZjNkcUF6QUxJZGltWDV0OU02T1hzRHlSWVh1T0Zt?=
 =?utf-8?B?d0JpSXRIMS9UMUIwTkFzSGtJWkV0OWlVTlU0TndnRnVVWCtoenMvOEI2c3M3?=
 =?utf-8?B?VU1YOElOUXFHTjhzVWJQZmlDY2VzM1FoT2VBNzBjZzNhdllwL2ovQ21yM3Bq?=
 =?utf-8?B?cXhzbE1saEo4cFBxTHhHZUFFdGE5MTFWOHp6ZGNWUzBiR3U3K2tUNllaVmhX?=
 =?utf-8?B?R0VMRFJJeWQxMGtyQmpWK3BYdGovMi9LRnRVVzU4bDRIZUF4WjIraFovL2hu?=
 =?utf-8?B?MlFWZ0FuY3NDNTBXUmlDUTNuNFNHalNYVkNkVjd6aHBCczdNalhQWHJzTVgv?=
 =?utf-8?Q?85J65FxaYcgPOjGqb9WSA6I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91aaa57f-bc24-4ae0-c32d-08d998f1bbd8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 02:30:25.9653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zEJBvWa1a6hOa1xgIkgRnX7QYHjQpNbqATntuL6Ss7rnX817Fe1HlP/aO/nIRUuxPc+/teOY6RNtq/+p9aL+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5569
X-Proofpoint-GUID: xpFSlg-hC4Ql0aKYTnWT2kxM_kpsNYgg
X-Proofpoint-ORIG-GUID: IhaGCzBLC4xI3F9fyJDxdnrePt__mPZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=869 suspectscore=0 clxscore=1011 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 02:30:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157472

--------------64AC23848449FE8B50646D11
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I like this change. However, it causes problem of 'rm_work'.
Now some native recipes don't get cleaned up with 'rm_work' enabled.

e.g.
INHERIT += "rm_work"
bitbake core-image-minimal
A few native recipes don't get clean up such as alsa-lib-native, 
createrepo-c-native, dnf-native, etc.

Do you have any idea how to fix it? Or should we accept the current 
situation?

Regards,
Qi

On 09/20/2021 08:46 PM, Richard Purdie wrote:
> The 'meta' is old and not very useful. It empties PACKAGES and creates
> recursive do_build dependencies.
>
> We shouldn't need such recursive build dependencies any more so simplify the code.
>
> This does cause behaviour changes as some dependencies are no longer built.
> It did show up issues with qemu-helper-native handling for example but those
> issues look like real races and the underlying dependency chains were not correct.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/populate_sdk_base.bbclass | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index ccfe2232895..49e166e697d 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -1,4 +1,6 @@
> -inherit meta image-postinst-intercepts image-artifact-names
> +PACKAGES = ""
> +
> +inherit image-postinst-intercepts image-artifact-names
>   
>   # Wildcards specifying complementary packages to install for every package that has been explicitly
>   # installed into the rootfs
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156182): https://lists.openembedded.org/g/openembedded-core/message/156182
> Mute This Topic: https://lists.openembedded.org/mt/85739582/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--------------64AC23848449FE8B50646D11
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Richard,<br>
      <br>
      I like this change. However, it causes problem of 'rm_work'.<br>
      Now some native recipes don't get cleaned up with 'rm_work'
      enabled.<br>
      <br>
      e.g.<br>
      INHERIT += &quot;rm_work&quot;<br>
      bitbake core-image-minimal<br>
      A few native recipes don't get clean up such as alsa-lib-native,
      createrepo-c-native, dnf-native, etc.<br>
      <br>
      Do you have any idea how to fix it? Or should we accept the
      current situation?<br>
      <br>
      Regards,<br>
      Qi<br>
      <br>
      On 09/20/2021 08:46 PM, Richard Purdie wrote:<br>
    </div>
    <blockquote cite="mid:20210920124621.1576702-11-richard.purdie@linuxfoundation.org" type="cite">
      <pre wrap="">The 'meta' is old and not very useful. It empties PACKAGES and creates
recursive do_build dependencies.

We shouldn't need such recursive build dependencies any more so simplify the code.

This does cause behaviour changes as some dependencies are no longer built.
It did show up issues with qemu-helper-native handling for example but those
issues look like real races and the underlying dependency chains were not correct.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ccfe2232895..49e166e697d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,4 +1,6 @@
-inherit meta image-postinst-intercepts image-artifact-names
+PACKAGES = &quot;&quot;
+
+inherit image-postinst-intercepts image-artifact-names
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#156182): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/156182">https://lists.openembedded.org/g/openembedded-core/message/156182</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/85739582/3618072">https://lists.openembedded.org/mt/85739582/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------64AC23848449FE8B50646D11--

