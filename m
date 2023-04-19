Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046D7C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 05:34:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30897.1681882448294654368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 22:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=kugbcmYi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34734a0540=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J5RlcI016990
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=OHDqmyGXHx/duvso5YGGLOddrkeuUmjioaUF8ycbyUA=;
 b=kugbcmYiDY+KS/lJ2ZdSlJ7xofDZmo4dlaRUTswAuY3TJosGv9YibdpTvRDs4ELnameJ
 Tieq+lLLNiWd2hnT5f7yAYwR7iu8HxEIdRVs9SrjNZnBinxR/wVa3AgSIlOwMUlY6IjX
 XhLVZZJKzjV6W7MOIcN0i89znRDQrYXuT1Jp7s4tlxbsyLcqQHhoQdj8NLAvqG8EFb/s
 nv2SqscqN/WFwAgMd01eK9SaYva6vxOWCpXexzy/ckK5Obby/wzN3CrOoLfeywq+HOE4
 Ro2c545SN1HZ16YKi/8BsNKqRJ67/yLKVfbE0AQtXldk4rsWT+QDUMc/86Qdg4ymvyDB uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyh53n40u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:34:07 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J5Y6Hj032336
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:34:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyh53n40s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 05:34:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YN0KywwNhOuwDHFED0dAwaXEIPa4o0KXVKfru46oRJ4gtMnrQWoCqYVFklP1w9s5z+nyXJUKHSlYEJy/9aR9npuI21JETj9uP4PqLgXow27wOCRiV90ctNskVgUko0Mw1eeU1V2E0KMFCQnxEnALhzy5VRsV01QrVeEqIYrEhZC41d4zrclGSSCZ6s0OmENksDSWJUN5jGXXJMz79YLRyn6GPuDN33qWz6W9Y8juIqBASomb7vAUWCZy6z1qt6oKF1dXXnf25LziverxvgVaC2LnGkFWDFGYvLxj6xGPtHGL4S9zPNw9KyXDr682XPS2obDjNuFG/hA8EkT+hl1L4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHDqmyGXHx/duvso5YGGLOddrkeuUmjioaUF8ycbyUA=;
 b=e3mmwhu2nnJ+ZBBQIzq0z7ph64RAcYiLlmHBGazNZD43nY03YxekEkMjdKGiCACr4cXhGsruTEJbNGisnXB7CONn9PbMJ5AA7GjAyR41ELBMZyk0WfQORK0mYHIcShOftyhnhz4hrxkPHwMIOZKK/EBNNB73S36nabXu5KJYwuz3Mk67KZRQpTD2PVRTWVt6aP9AO2wKeHmQp43hEDjlxe7P4ulWXuxtcEjL3JOjePdkEGMgsHuv3ScQCYUv/N5yIlIy2wnNTlGaBpNbtKNZc/r2gmrZcGrfPLMXBSN7OHIPU5o0YSAAuGN5n3/i4gvqQd97pTJsXb4f5VqfXhDNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 05:34:03 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::65f0:c792:6078:8451]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::65f0:c792:6078:8451%3]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 05:34:03 +0000
Message-ID: <6428c683-615d-f73a-de15-86783a96cb7e@windriver.com>
Date: Wed, 19 Apr 2023 13:33:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [kirkstone][PATCH] curl: Fix CVE-2023-27536
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230417062207.3870781-1-mingli.yu@eng.windriver.com>
 <CAOSpxdbuzJiBAiSw4P3+YJc6rUqg1zvU_vsVds9zWq3L5V=EzQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAOSpxdbuzJiBAiSw4P3+YJc6rUqg1zvU_vsVds9zWq3L5V=EzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0292.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::17) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS0PR11MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 143d28ac-6344-492b-1a64-08db4097aee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AbGgfb2qdQICBfWHolBkSIV2Mfg3E5prqqqYir6rA+7YVXM2YBRRk3AucSxgA5QjezbK8Spr895rnAQw8ypJ4Jz2jKEe4muIwSiN2BA+Mz3fCxGMtOgrNoqkaFBHxMpszi+CV6UQlT9cEsFXyJCz7qQ91v/wkw2w25EZ/CHxZkk1u0qKSLfloOYoYsURMh+VEZ+D+Bh/wCwlzenlk71njJJbpMtJaHEkCV8iQKIb2IU0z48JTA6y+JKS3ZcoH2YHZdRg0DyIpeJtuEP2K7Icq+dAQo9PHiTixzso47QYdEtQ6A2jj2XcPSDqmJv3APvMZySsdDqqJc/C1mFVVVNw+S8l2DXmsjNtslBanDaJH5Q7f/MCczKd+c0B6jUYhqdW7Aq59fzNDdf5rCtCF9Q4aeHTFI9DpQVWR6WvdEMvHCzepcB+gqd9giAGS9HX1UtPaCmIPhOkNFix20gzYuwRKDjz6XoA/2R24TfuF8GcaOgGhULzwewCAPh2VFN7kIjR1yjOwiapcnyswnVmWOrXNtckzc+q87xhIsnPzFjTq/D+5uEdD81+UTkWxHTk0pt4th+v0hfM/JllLPbLMbuwsgLm+J1alZASUGspbzZouZqQKWD8AQYLl4PMgYH8AbcxULcuKWRr9Eih2PD21nExXmMzCFa1b+FZzBXAGyulBf3wiSFX1yR+hWyEKP/CiAfz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(366004)(346002)(376002)(396003)(451199021)(53546011)(31696002)(66899021)(6506007)(6512007)(26005)(186003)(41300700001)(316002)(110136005)(6486002)(478600001)(36756003)(6666004)(966005)(86362001)(66476007)(66556008)(66946007)(4326008)(2616005)(5660300002)(38100700002)(8676002)(8936002)(31686004)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mm92V2JFaW5zUlhpeDgwM1hDV0IyMHhOYnIrakNTeENjQ2ZTQklvbW82QlhK?=
 =?utf-8?B?NmYvV0Q5MnZDZFdzVDhFUHdaUGtPYUI4TThmMTcyTnJkWkhQK2FqV1lRa1BG?=
 =?utf-8?B?bTgvRzJFTW1nZmJLekxOMmFrcjVXK2xUazZKdUxmVkJBSktxWlU3R2cwYXc3?=
 =?utf-8?B?NWJLT2VFQWMxaEdWVklqR1kvMlE3MGg3OWk5Z0NLTGJWWDlNb3pwQlR6OUhk?=
 =?utf-8?B?Z3lINFd5b3k1R0R3cXVEeWV5eS84UUVZNFU5V3dob1BrazcyS0I5RmZKOGtL?=
 =?utf-8?B?NjV1TW55d0NDV1JjV0N2ZWQ2RUEvb1M5VXM5amMwSDMzaG9md0FtaUVackw2?=
 =?utf-8?B?TndaNTcvNXZSNkduN3J6dGgwLzluK05mNlhJZ21mNWtVUzRqT012eGVzRTJs?=
 =?utf-8?B?TGMxN3pzMnBDbmpFN2RPWk1DbEZ3OEFRa3ZzZGpQOTZzVzIrVnhTVGdzWlZ3?=
 =?utf-8?B?b283N24wdEQxMTBKL2s5VWM2TmpYMzZIUUptQ3B0Yzg3RXlISjdXRnp6NXdL?=
 =?utf-8?B?MG8vUXZjWGdVOVRpdHY4cU8xdndMd0l2em1ka1VyeFVnaXpzekE3K2YyNnlU?=
 =?utf-8?B?SEJINVRIZVFwaE1GWisyL0NibGxrVkZsT3NqOTQwUXJYZjdFKzFNQytHWVF5?=
 =?utf-8?B?R21XRERMV1A3Mml0Z2VwVFRONUdUOVowVjhiSGNqREQvUzVJNkVhK05leGk2?=
 =?utf-8?B?SHRDZFNHRy9ZWWlGdm5EaXhweUgvNTVpQVdtUHJoQlFYWlJSc1NXeW5oYkhx?=
 =?utf-8?B?RitjVjlrWWhlQUwwcHNNV3hQWXNiQitLNUIwWnVhRkg4V2NEY1RXSk5zT0N2?=
 =?utf-8?B?VEdSVm1FQlk4czZxYXZSaGM1YlQ5Uk8xTkQxaEZlaDBhQm5YVDRNM3MwM2gr?=
 =?utf-8?B?QnFSaEtTNVFhK1R0MnhxOFR5d1ZpYURzMVNYTFpsZlM2cXFuWFFFMkhlVkZy?=
 =?utf-8?B?cnhGTlc4ajlMLzlkeUlkOXUzOWtaemdGbUVzOVFESitPL2h1SHJyUHJGZE1O?=
 =?utf-8?B?MzFIVm5pQXI0N0JrVjllVXlEMG9BTi9VRkh1b1ZRaGkxY1h6ZGY1MHJnUUsz?=
 =?utf-8?B?L3o3Yi9aZ0lHdFR2bitZejVzTlVBT3pBUVBtNk9TUzJwR0xDUlNyczcySU5o?=
 =?utf-8?B?K1Erc0p6LzZ1MGdkRmR3Nnk4eTFpZXlJajZDMUJHZmhTR3NPZUh1WkVINmFE?=
 =?utf-8?B?K2d2dUp3SmVyN21udWpuMUZIUEdOQ3dMYkJ1VCtmdWlhVTVEQXJkNDN6WHJ5?=
 =?utf-8?B?emdGWnhsMzZZNVdnc3ZNalNobXU3cnRDb0FhMWNscUhVZ0Vtak1oM0liNldC?=
 =?utf-8?B?LzFVZ3BsbG5kb2V5K1FjOUxBbUNVdVZQbXZwTjJ5UEJQU1RwN1ZsRFJ6RCti?=
 =?utf-8?B?SWpzUU0wOUdiR2x5MS9YS2o1Z1MzcXhKMENHRWNvZzVyU3grUmM1Uy9IUDRa?=
 =?utf-8?B?L1o0UDBmb0RBWlYvZDM1aitPM2RBOVFLMFFqQUVhN094S3F4b210YmkxaVhK?=
 =?utf-8?B?RExENTNXUENNL2tzN0pRTDkvNDJvKzNpVHdJZzFxUmFpOE4yTkZJS3RleE5k?=
 =?utf-8?B?WCtMK2RnSVl3ZkFFMlovZmZibkludTVOSWk5MnpXbzJ0OWtSNzZySVdXcmVF?=
 =?utf-8?B?MVBZMlZqSWthV0xHVVJoRU1wMng4UTNZYWUrR3g3RlY4UkpNQzlacG1XZVJT?=
 =?utf-8?B?eERsZWF2L0N2bmo0MjV5UTB0dGxIbW9YVzgyOU8zVFZpMXdaY0xNZ2dsK1Aw?=
 =?utf-8?B?Y25adENSTWpvNEE3Y0xBbGlILzdzRTBkUTl3S2R1am1pb1ZzNXpFMkhucFBH?=
 =?utf-8?B?djZPU2VpYnBMbjA3YWlsc291VkhEcU9ISHhsUUtETkVBc2crbForUUtIZHpz?=
 =?utf-8?B?a25EeTJMZTRseTZqTW1PNXdvOVFnYmd4bUpMVmt4bWgrbmlFZUY3eVZoZ2ZH?=
 =?utf-8?B?SklzVHZWN1RhY2hqVGhZS2txNDJsTS9DelBBSzJMenNaNVpkb2RRL0pHK0Nq?=
 =?utf-8?B?Mm8wQmFQQTdQdzYzZ1ZhOW1xUE1maGNWOGVmTzExaGlSWkdybUlQZk5RRVE4?=
 =?utf-8?B?Um91a0MrMnJ6b3lQdzREcDJ3S2p1NjVZdkhwQlY1R2MrenJteUpWZ1R4bmRQ?=
 =?utf-8?Q?DTZtwKx9KsglbuB8WC3vWcNun?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143d28ac-6344-492b-1a64-08db4097aee3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 05:34:02.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHNkCT45Az2QuXqg8QMkHrT57GP3duavDaDGVJuTdnZNMnW1/fSZoK2DpCb9zg450DGHN5BkMGoeKf448tEOaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
X-Proofpoint-GUID: hqtL-hnIhifwaK-cMFggJ9qFdgARfa42
X-Proofpoint-ORIG-GUID: pYqQ0fiJEO1I6wvE2xY0ga51lrYG9Pao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304190050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33J5RlcI016990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180208



On 4/18/23 00:42, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> There is also a patch submitted today that fixes this CVE as well as
> two others: https://lists.openembedded.org/g/openembedded-core/message/=
180143

I'm fine with the patch as=20
https://lists.openembedded.org/g/openembedded-core/message/180143.

Thanks,

>=20
> Could you review the above patch and ack if you approve.  It would be
> nice to fix all three patches in a single commit if possible.
>=20
> Thanks!
>=20
> Steve
>=20
> On Sun, Apr 16, 2023 at 8:22=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windr=
iver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Backport patch [1] to fix CVE-2023-27536.
>>
>> [1] https://github.com/curl/curl/commit/cb49e67303dba
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../curl/curl/CVE-2023-27536.patch            | 57 +++++++++++++++++=
++
>>   meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>>   2 files changed, 58 insertions(+)
>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.pat=
ch
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/met=
a/recipes-support/curl/curl/CVE-2023-27536.patch
>> new file mode 100644
>> index 0000000000..842c70785a
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
>> @@ -0,0 +1,57 @@
>> +From 6b1ef6d5ebbfd5e68dea1eea2dc0c6cc4dc2e394 Mon Sep 17 00:00:00 200=
1
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Mon, 17 Apr 2023 05:36:18 +0000
>> +Subject: [PATCH] url: only reuse connections with same GSS delegation
>> +
>> +Reported-by: Harry Sintonen
>> +Closes #10731
>> +
>> +CVE: CVE-2023-27536
>> +
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/cb49e6=
7303dba]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + lib/url.c     | 6 ++++++
>> + lib/urldata.h | 1 +
>> + 2 files changed, 7 insertions(+)
>> +
>> +diff --git a/lib/url.c b/lib/url.c
>> +index df4377d..8c43c3b 100644
>> +--- a/lib/url.c
>> ++++ b/lib/url.c
>> +@@ -1350,6 +1350,11 @@ ConnectionExists(struct Curl_easy *data,
>> +         }
>> +       }
>> +
>> ++      /* GSS delegation differences do not actually affect every con=
nection
>> ++         and auth method, but this check takes precaution before eff=
iciency */
>> ++      if(needle->gssapi_delegation !=3D check->gssapi_delegation)
>> ++        continue;
>> ++
>> +       /* If multiplexing isn't enabled on the h2 connection and h1 i=
s
>> +          explicitly requested, handle it: */
>> +       if((needle->handler->protocol & PROTO_FAMILY_HTTP) &&
>> +@@ -1807,6 +1812,7 @@ static struct connectdata *allocate_conn(struct=
 Curl_easy *data)
>> +   conn->fclosesocket =3D data->set.fclosesocket;
>> +   conn->closesocket_client =3D data->set.closesocket_client;
>> +   conn->lastused =3D Curl_now(); /* used now */
>> ++  conn->gssapi_delegation =3D data->set.gssapi_delegation;
>> +
>> +   return conn;
>> +   error:
>> +diff --git a/lib/urldata.h b/lib/urldata.h
>> +index 69eb2ee..c2a7e6c 100644
>> +--- a/lib/urldata.h
>> ++++ b/lib/urldata.h
>> +@@ -1131,6 +1131,7 @@ struct connectdata {
>> +   int socks5_gssapi_enctype;
>> + #endif
>> +   unsigned short localport;
>> ++  unsigned char gssapi_delegation; /* inherited from set.gssapi_dele=
gation */
>> + };
>> +
>> + /* The end of connectdata. */
>> +--
>> +2.23.0
>> +
>> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-s=
upport/curl/curl_7.82.0.bb
>> index 945745cdde..888527857a 100644
>> --- a/meta/recipes-support/curl/curl_7.82.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
>> @@ -40,6 +40,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>>              file://CVE-2023-23914_5-4.patch \
>>              file://CVE-2023-23914_5-5.patch \
>>              file://CVE-2023-23916.patch \
>> +           file://CVE-2023-27536.patch \
>>              "
>>   SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0=
297d3d690cdce58a583c"
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180120): https://lists.openembedded.org/g/openembe=
dded-core/message/180120
>> Mute This Topic: https://lists.openembedded.org/mt/98313621/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

