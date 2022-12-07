Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD58C4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 10:31:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12143.1670409076624297368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 02:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9340152798=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7ATadL016369
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Dec 2022 02:31:16 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqu310-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 02:31:16 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7AVF1i020702
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Dec 2022 02:31:15 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqu30y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 02:31:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NF/o/j0d4eJBNJVrxiOSSI0OIcBy8Oncm7qpnef38JIAF1ZCThFOD5K3eEbaLWtXUWditgLuDM/y7R3qJJ/zXSC/g4WnM1zyOBB0etb0UW8S2VSMvK0TM9y3Iv7C4EVte7S7sFfdPkAWmU6GVdI6ns7w3DRERXKv8O1dGUUn6CdZQEs0tgMeYWNLTr/joTFAdBbjKIJf+2sKiI1BBSMAriWs3bXMxZ5LKgR6H9FWNxO2UCJHq9l41a9PH5iTrhy2pse3CY98t+r2XFlYRDXh4qAhUiQPEktK5RZehcZ+3gR9OG0YuKYxaYrbUUhbSGjtTMWz761OYj0PRth8+HYlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpOEaph1UVmSyj30o8OlWjoOOGZJj8/j6N9+JntWd2Q=;
 b=hSmOMbr5/TR1zXQBKNSYTWeNl7dBNjG7VTkmFZ+XSYBRDo1IfXqDv+MHJbku9kAvb2gqPqPSo0ydYxcCaeoJW2dMwHn0NHM9l2aknoEKRZZi3tCo6vxWlUBa8vNJlG9tv+qaDdIJEaWBmtQFNbQFzTHq3A97Td6GL7Tmhv42/eIvfMyBDjcKeusP+KnC5QciF3s2C2hWq3kNnFJm+sRQry05XkK2a9XsxBT5QwHbkQXjAvfXUM0jlfpiYh6wRUQkLPgp7f5Lvnna3jl+4PubCBRzQ7FErLjOI0V1XgUJXl0h4sbCqIIyWvykMrUTbJjr1yC7ULFhPx+SeNdnFIiDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 10:31:13 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:31:13 +0000
Message-ID: <e40b828a-f7b8-5be6-189e-372803955368@windriver.com>
Date: Wed, 7 Dec 2022 18:31:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][kirkstone][PATCH V2] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <172352CEDDCB35BE.6436@lists.openembedded.org>
 <d26c2ba8-eb2c-5a72-e7ee-e1ad89e95444@windriver.com>
 <CAMKF1soeerVU3hLV+UG7HzBkNkN2MYddoPj3S49oQg=fHRCbcw@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CAMKF1soeerVU3hLV+UG7HzBkNkN2MYddoPj3S49oQg=fHRCbcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 991b6d93-b3dd-4a8d-86a4-08dad83e29c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hibn6jt438WpyII81NNd2ZhQJdiZY+BlEvHOJhfIkLxeHIK997l2O1amkVvtbnDJddmDgRQQTrAwHaBlGcBb3G+OhIqbvKK4LGwUtAwo/ilsVkJYyU9WDG6pAIsCfcZw+QrLcPFHIjM5yJjuVcIjSy6RWjK418CsS9N/YrH9K8QOxdJj4YG27TleeWoqIYhxqQOe1BhmmeUdMdxMkbY0rtWM/gFIUCHWFrpi65OrP5iT00a88kw/+4Xtg8Wxs9GEmsDDcnrEVDMjDIEPLgPTTdKkNrfrrra203tLaOgBXwveSJU0Xq963lv1uTIUzkaxFrKaHhx+vfuX/tnil+Y53W+v96dvjCPKY/1nOYHPJlQ5W8PMiPgj0xhV4gI5Z7syObDs9pK4jPI2Sd7hCnzId/XDOnLDRRQbthU7H1nSrfps6zYP05IxM8xXtpwvfdVokvhUw3LxYvTk7SDO3TtlSlNBRJBzMeGcw4zHSyhafeqZxoUl1OGzbUyP6oArbCaNaJtosINXORQyAIWB+kPJQiLb357VwFZJrhcRcbQi1LKezZbXYkCQiswpJFV+1Ao5Uzab3XrsZTiRT3UGIaCEDJRIP1Ul6gl+dwGCTLZugpn7upvGpxB229u3KTry5EVyHgnkzx2myvGWpp5HJxPyyQe2EZHntWrWcBzUmV3ztGMPpH3NR4/vQ26r+qauaWqGO1nQ7Dc/8DLSZeIfx6EaouFbo1E1Jg4Au/FgBmFQ5HOU9aRw8eHGpBuHdvKXHtiR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(451199015)(31686004)(66899015)(36756003)(83170400001)(31696002)(8936002)(66476007)(66946007)(66556008)(2906002)(41300700001)(8676002)(44832011)(38100700002)(83380400001)(110136005)(316002)(966005)(6486002)(5660300002)(478600001)(6666004)(9686003)(26005)(6512007)(6506007)(186003)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTZjVE85VFZFemdvVVBYT2d0a1dwZFJRL3BIN2pwditDbi9wSytvREVsY1Z6?=
 =?utf-8?B?T3dtMU5ZdHIzQ21aQ0NmYWYwTnZ3VzA1aVdiL3hHWm5GOTYyU2pPYTVoNmRM?=
 =?utf-8?B?dng2ZkhSYUNnNFdyeW1Pd1NodW51cFBSWlBHZUgvS3UwbjJPTklEUzEyTWJV?=
 =?utf-8?B?TVRtS0gyRXFCdkxXN2NPcTdHOXYvaXl4RnZXUzhLSHVoL2JsdlQ1Nk52TE5j?=
 =?utf-8?B?STYrWmdxSUw3MnloSEt5dzgydlBTa2MyVnJDNXpZRjRFdVoyZktiN3AyMFJN?=
 =?utf-8?B?bHRTR25WTS9nb1ZIK0x4bzU4dytIKzVCVVFEYWhLWkErNVhBQ3hBdVlzZksv?=
 =?utf-8?B?Qy94ZHBKKzdQQlF6QlluQXhKcGZ6ZUxjYVBGazJpZ3RhRHo4eVVoQ0xrUlZ0?=
 =?utf-8?B?S2xxM3NXR3RsNTVmSWI0ampOYUllSVp3cmtzUEhaSXVEL3BWbEFYUFhnNGI4?=
 =?utf-8?B?OUEwNlBqbGNhbTVFOHlsQ284ZlhpZndQRE9jWi9sc3A5eURuNno4ZmtjMGVz?=
 =?utf-8?B?VHFtNW14V2t4WmpKcUxQRVhLeDZIbHhBSjdDeXhGTERGbGdkNzlRWFFEcjN4?=
 =?utf-8?B?SFcwcHNKd2YzWGkzaHFjdnl2S0FUM3ZWUklrYTk1c3JiQnoyb2FWNVdFKzNq?=
 =?utf-8?B?c0dEcFd4N2owcm1rSEdPblM3aG92dHlWeldYZmRwQTFOem9YMUtRUFBrR1d0?=
 =?utf-8?B?ZExzazIyaHlKVFVmUUpvcjlXOGdvT2p4LzRNZ3dqblBocHIwQmV3RkFtR1hB?=
 =?utf-8?B?cGo2S09IaXVVdFA3L3NTVmF5NXdXSHRpTENaVFhLY0kzYk9Pc1BnSnI0MTdB?=
 =?utf-8?B?QUF3eDROcFJaQzBPZkNONzVXSm1FbEdwWWdSUjduMlIzMnFldy9VM0pCcUlJ?=
 =?utf-8?B?QXhCVnFzLzczRzF2dXM5ZkxYeFhJU2JSWU5kYjE0Vml5Q28vMC9BMGg3aUtl?=
 =?utf-8?B?VGVudXZ4cEk2U2JkRDh2cWIrRTEzZVNZNisvVDR1UmpjMmlXbC80NVZJbWFE?=
 =?utf-8?B?Q2Q1a1NpaEw1bkdYamExTzMwaDBZd2ZhQUdqU0toS0lyem5ZYzF5VGZBdldu?=
 =?utf-8?B?ZUhUNnRvcElVbnhvT3AxZnRrY043Q01qbkwvVzk0Z0tvRU1yeXEvR3p3ME5W?=
 =?utf-8?B?TDJzdDRGY3ZqbTBhelR0aUNWVnkySDJPVW9Lcm1pMC9kZXFmMmlDVkdPWG5M?=
 =?utf-8?B?aTR4T2xRT1I5S0tQWkRGcXphVmZ5L05DMmJKL2dUR2ZraXRiZzZoVUkyaGMv?=
 =?utf-8?B?ZVEwNXNma2xoN25vVjBxTC9JVlIyeHE0ZHFLYzFZeFBPSGlOVGtwdnNGU3lN?=
 =?utf-8?B?ODNQMHI2MW80YkJyNDQ2YjVyY0JIay9qVWIyZGduaFdTZStvQ2ZTaWNXL0JU?=
 =?utf-8?B?TW92RHlIYzlnd1BCUTJDODFnTk1YaTFjUEdVejg2Unk0K1RSVFZEeG5pNVI4?=
 =?utf-8?B?ZThFZGgrWkY1WGlwSHgyV2R3TzY1TVpVajFrK0F3MlhESmJnY1FUc3hFUlZF?=
 =?utf-8?B?S1JsRHAxYTdwc0NPNmNiVWZOOVQ0TDVjdWQvTTlvS2xqUGRrbkJzbGo0N1hY?=
 =?utf-8?B?RlNhd1RPTVhuR0RNSm43cXNIOW1MRFAzWEF2TVFpdmViTHp1MGdJQ01DNXhr?=
 =?utf-8?B?OW9jQW9YZHc2SlhUU09DTmQ2bVdGL05YOGdOL3NVTGV6bkZkdVg0UmV1RElY?=
 =?utf-8?B?NTU0blBmVUQwQjJkU21ZV1RDcHoreXZlNzYyM1JrWW1XNmkrKzdJVXIrTzhn?=
 =?utf-8?B?VWZRUzJheVFYa0IwM003SG1rd0hvZHpOOUVwSjVHYjQ0ZXNHRXpXcW9pTUps?=
 =?utf-8?B?dUJJaFdNQUNla2llVURzMmxpc3VwcnQxNnJRRUFyQWtFbmY1dlF4V2F5YlMr?=
 =?utf-8?B?L0t6ejRPZ3MzYW1ESk14M210cGRmTUFOVmc4eU5Od2hMbDJpSGJLZ1pXSTN4?=
 =?utf-8?B?UnZzNFNQZnVvZDJjK3pDTjlvZ21XaDNKeUNHWjh4YWtlK3dVVDdVWHpYZENC?=
 =?utf-8?B?SUxQeThVdU5JZUYzSGFUY1V2Wlk3SC9UdzJ2ZEJZbkMwSzBQZkY0aERQQ1BS?=
 =?utf-8?B?N0JHSzl3OGp0aGJ2bzN2dUVnL1RKaTU1Znk4MDl4QURVNHpUNm01V1pvY1NL?=
 =?utf-8?B?QTZMZTdwRnZudm5vYm44em9uUTZRaExQWjU0dWRDU0dVUmNSUklVcEJDQllQ?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991b6d93-b3dd-4a8d-86a4-08dad83e29c7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:31:12.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79m3chQimvs6BOT7j3ztAR4RqhMY8CtQH5wZ+cNclxJZeW/8YD+9v+xiGlBfh9YhloTti22NbVHCKZxBTlk0Gu6RzP61nDDQgHC0ghkC3nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-Proofpoint-ORIG-GUID: ACUZjZDyQ_ITWjBXplNgScTGVrFnemBc
X-Proofpoint-GUID: o-Mss7ZMqSVlR4pePaopqqr5SY_strYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B7ATadL016369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 10:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174348


On 11/7/22 10:18, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Sun, Nov 6, 2022 at 5:21 PM Xiangyu Chen <xiangyu.chen@windriver.com=
> wrote:
>>
>> On 11/1/22 09:48, Xiangyu Chen wrote:
>>> With the default jitter options aarch64 CPU-based devices typically e=
xperience continuous
>>> high CPU utilisation for several minutes after rngd starts.
>>>
>>> Accoring to the rng-tools issue #150[1] and comments[2],in order to a=
ddress this,
>>> the following configuration changes have been made, those configurati=
ons
>>> also can be found on Alpine Linux[3]:
>>>
>>> - reduce the number of threads used to 1 in total, rather than 1 per =
core.
>>> - reduce the buffer size from 16535 to 4133 which reduces the time ta=
ken
>>>     to fill the buffer (and so reduces the duration of CPU load).
>>>
>>> [1] https://github.com/nhorman/rng-tools/issues/150
>>> [2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-9530=
79212
>>> [3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd=
-arm
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ---
>>> Changes in V2:
>>>     *put the aarch64 specific default file in meta/recipes-support/rn=
g-tools/rng-tools/aarch64
>> Friendly ping. Is there any more concern on this?
> My concern is that will it be so for all aarch64 machines ?
Regarding the rng-tools high cpu usage still need to be discussed here.

Currently, on some platforms like ARM, there is not any good idea to=20
solve the rng-tools jitter module take full cpu load during the daemon=20
start. In fact, after kernel v5.6, the /dev/random doesn't block=20
anymore, so, perhaps we can use the parameter to limit rng-tools=20
resource during it start up, does anyone have any ideas to propose?=C2=A0=
 Thanks!


Br,

Xiangyu

>
>>
>> Thanks,
>>
>> Xiangyu
>>
>>> ---
>>>    .../rng-tools/rng-tools/aarch64/default               | 11 +++++++=
++++
>>>    1 file changed, 11 insertions(+)
>>>    create mode 100644 meta/recipes-support/rng-tools/rng-tools/aarch6=
4/default
>>>
>>> diff --git a/meta/recipes-support/rng-tools/rng-tools/aarch64/default=
 b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>> new file mode 100644
>>> index 0000000000..5a2fbcc9ef
>>> --- /dev/null
>>> +++ b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>> @@ -0,0 +1,11 @@
>>> +# With the default jitter options Arm CPU-based devices typically ex=
perience
>>> +# continuous high CPU utilisation for several minutes after rngd sta=
rts.
>>> +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 an=
d
>>> +# https://github.com/nhorman/rng-tools/issues/150
>>> +# In order to address this the following configuration changes have =
been made:
>>> +#
>>> +#   - reduce the number of threads used to 1 in total, rather than 1=
 per core.
>>> +#   - reduce the buffer size from 16535 to 4133 which reduces the ti=
me taken
>>> +#     to fill the buffer (and so reduces the duration of CPU load).
>>> +#
>>> +EXTRA_ARGS=3D"-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:ref=
ill_thresh:4133 -O jitter:thread_count:1"
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172819): https://lists.openembedded.org/g/openembe=
dded-core/message/172819
>> Mute This Topic: https://lists.openembedded.org/mt/94701000/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

