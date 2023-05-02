Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1668BC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:29:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.136.1683048595506537166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ol4b7Cql;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4486efa346=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342CbjNs015914
	for <openembedded-core@lists.openembedded.org>; Tue, 2 May 2023 10:29:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=7u1JuhJAR+0YmD/O4CtdUVk7gOwZKvc/0Kg9IWC19cs=;
 b=ol4b7CqlBDsFpC/8z+jVYbIIghPXbu56YPTXYqdSqUJGcXTFCwPm/dLTUfY9oCRLxh5M
 lMLq47OtRzRoP9IWVmD2QduqJKXxTnoEVgB6fSjkWiLkxFBszwcTb1BjU6rppqoQ9wpj
 eHphwzrK+rc7CSJCysHSD5ZOpBwWTkiati3LE+0ccMZZ8RFfqBtxJPWFiFHKdN8+PRY3
 IrhjKg2aQvlGvMC5YWDTNDUS+dDnpRsnCI4ioXcveKGFNNH/JemFPq10H5W9ZDDLI6iv
 dmb3xL0BqePGYxUwc4QlDGWtEdZqmQHL6Ea2+NhLc23ebsRXHVnW1LuGood25HvSMkdb Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8xh5jv2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:29:54 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 342HTsEm020156
	for <openembedded-core@lists.openembedded.org>; Tue, 2 May 2023 10:29:54 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8xh5jv2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 10:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMkixZzpvUpWVc5SeQtBjhsUPieBebtIiOsv2H/QS2P5loGX0qAlbDm+B5Y72QzQrJ4KkW25ADkufYw5bXUGqhxqy/6WBjvak5dsDe5nGWNbZ4LVMt6oJOhQ9nPRQqfXn4lhRgk/ZBkxkFUtRwUt6hiEY6MbfFRivDUdNhsnw+XhOQgY+LTm8D03xPDD5KI7o7MCMIRuOk2UFnre7iZavLndLdDZOv1GmPxStphljnftEhQuBofA+hvgz0TvtgA3EenJsoEfB6MkAI8mPTVDmaX2wWgvn2tirIGAJHHdLeU/0ucHsux8dhw8ySrIhUdeT7cva62ake+KzTXaWnGRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u1JuhJAR+0YmD/O4CtdUVk7gOwZKvc/0Kg9IWC19cs=;
 b=QKlQwGpeqoFuluY1sS/s1TZCXeOFZG+v2tI3k92WodMm6ZAMTlEmybxulzk+4OnW3/rAMcBZrYEspgdUsP+XoiFkAedZxPOj68+XhFkb/k+aHptfTMaPspn1yxDAAG+2s7imciYhMsXTXA6jtji9HO8AsoqisvbYvaFOFPZ8E2eQO6qa9oZyazVwweypaz4O4epdBqR3/5EdBf+caTYbjC/zZUBm8pwjD2AIhj5o3aGNWJFPHcpA9QwvHrrj1ECJnD+D4UPzznyzOhlHL12zoaZ8HXvTkrUqEirx8NrhbNfy1YTRwwBuJtPdgL8cBxhpmzkWW37drdxSbKNzlUfNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 17:29:52 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::6e26:7321:99ab:72ab%3]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 17:29:51 +0000
Content-Type: multipart/alternative;
 boundary="------------gpF5SJIH5NLXfp6zNE9TYVQe"
Message-ID: <50be53c6-bd6b-48ec-9514-2788b1a35b58@windriver.com>
Date: Tue, 2 May 2023 13:29:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH v2] machine/qemuarm*: don't explicitly set
 vmalloc
Content-Language: en-CA
To: raj.khem@gmail.com, Ross Burton <ross.burton@arm.com>,
        "steve@sakoman.com" <steve@sakoman.com>,
        "Mali, Narpat" <narpat.mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
References: <20230418164100.4035328-1-ross.burton@arm.com>
 <CAMKF1soH2QOZq6cBEp_+ktybne=t3iy=hxcxeTPGCPT8wNXi0A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1soH2QOZq6cBEp_+ktybne=t3iy=hxcxeTPGCPT8wNXi0A@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 427be50d-b698-4c78-a6bc-08db4b32d615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VoiikKJyI4NL/l0W4Pqd31du0BgnaujIvusWzJSR3VI/UpTIRL0+kEV4cd1YmuZm6A8fw87WUJz1T09tNEvCftdlAS3YPcmHmFUUAdoRv7GHI+P1ALc1nOOg3QhnJakORvgA0YeEYwmnnOylm/0l0bnfqK5lLNSGSxRD+nHF61yIaMflG5Grncv7XfcU+ZzAVXCMSE2HfVe1sTZYe1Lo1bAD5Kgz4X3wdmj2NtyFTfFmUzJRfiEUyfM7iu1RLZkgVnt3ALo3DLJuEUAX2IA6t9BlrjKeM5eVjKdJSeZNVWdysaeV+3c4JiXvfDhFi5KoxdKkhn+2mQ8IKE4JoqHT/9CDoT5O5Yzp8iWhCqQM+DmCvMuAQmmQT9V5hCQ4PHlmMy/FCuSE62dH7uiPTyhrnwQyMCzvbADpwqs8ID9rmqAKWMalPFg/+7ptSoTJ8cH+xpZ2ZyiR12qsP8yiwEr0eeo9OflrdVI3us/fMTNX5wORtWQssx80QNrDS0pAnbhAsW2Y7jJegASaeRNmwWfQ4uJl7pREswHgMfmPxO+cKCJAisiDwaEEsPK3w//XXy3zoAnY4J5oFSjhB+GQaU1+WhqLX0TADdcw3Yg7EGvawL6qPcqwBuxFbwRUrMgYIWxkClpuCtRCNPpUN3bYcwtpnCZvEDkaWhBpR2b1pCi6OQQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(451199021)(33964004)(966005)(166002)(6666004)(6486002)(38100700002)(2906002)(66556008)(86362001)(41300700001)(4326008)(66946007)(478600001)(316002)(5660300002)(31696002)(8676002)(6636002)(8936002)(110136005)(66476007)(26005)(53546011)(6506007)(36756003)(6512007)(186003)(2616005)(83380400001)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjUzQTRqY1owVG5vcmR4bzlaQmIrcit6RU9mdEVNK0NpZWZOQ2dHb2xUNnAz?=
 =?utf-8?B?Q202WkFXNFNLZFp6RHRucU43dVBtMWZ2eXgvS3VKc3lwekZhWC83M0pSMVN3?=
 =?utf-8?B?eDRtUUpjVWVIWWpVeEJXdVVjN3RSY2JkZUE1SUVCbUpPTTFCRzBIZ2NmZlRY?=
 =?utf-8?B?OEg5V09mcjlMS05XcG1BN2VFL3NFb2VYUnRleEJKNFpkc20yTnRTK2xWcUp4?=
 =?utf-8?B?c0Z1SXh6RGdaM1c2SXE4US9USVAxZlhqdllVK2U5S1BNQ2NxQTRoNU9TOEQw?=
 =?utf-8?B?RVdlM3NMYjVPcHRoNjl3T3VaNjJPcnJIeGx0WFJhN2FZQ2R3cDJZMVIycjV5?=
 =?utf-8?B?bHMvNTg0d2RrQkh3bUpQaVFVVmhTenFYZzZNS083Si9iZjRTOFVVVU5LTVRq?=
 =?utf-8?B?RlM4dGJIOGxmK0tvYUYvRC9vUkhKRjBxUHhwL1Jub3ZpcU9Kb2dIeDk4UVFL?=
 =?utf-8?B?QTU3cVU2a0gzeWFmZElKTDFsRXV3bUl3ajgzdUJHaWhKMlE3MkpHRjlKUmdq?=
 =?utf-8?B?U0dlbVVGWndnZXJOaUI2c2d2c1BxeElmNm05c2ZlQXpncG9tVHArOTVvN2xl?=
 =?utf-8?B?dzVvSXFTcFA4cjNrZWNTcnBVc28wWEQ4bkcvTmZEbHlwMXJaTXdMSFRDYkQx?=
 =?utf-8?B?THRUN0FpQWNpcjM2Q0Y0UVpVMWhZUjdWSTJFcndKVkpzRGhMdkJqK1lxdStt?=
 =?utf-8?B?b0IwUFFDT1FQd3YyTkRZbEg3TFlJUEdlUEZsK3NwWTFwcEVMeE95ZU8rUE11?=
 =?utf-8?B?QlpkNmJnaEpITjh4aElYdWR3M3RyM2dBOThGK3JIMXV5cE9BSVpkNEtHZHNB?=
 =?utf-8?B?UVVPYU0zV21vMXJ1Sm4ydDdYUEFJMjMxVFowWVVwVys0TTJrWm1RU0JJV05R?=
 =?utf-8?B?dzVFanJpWGF2N2tiWDg0RFNmVkpheEFrWmZuMmVNam8xUG5SRTc1S2p1NWk5?=
 =?utf-8?B?QkhxWTZWMU5xc2pkRVlxa2FRNUd5bzEyRkVMWjlISFhYYWx1S08yeXFaakpM?=
 =?utf-8?B?MXBkb1pYYjdKWXEwN0NlOTJhQTVPa0dGOUJUem1LNG1SdU02L1R3OHVuRGhJ?=
 =?utf-8?B?cXhYbEo4aWtCcVAwUTNqMTNFdEFqdm5tSnNnWGRYZmtmQUJPenB0MTJSU0x6?=
 =?utf-8?B?N3dGNE1DWEgxK01HL044WTZBVFZwUEFQWXJjOW52WDVDekNDUkZGMTJWS1VV?=
 =?utf-8?B?YzlneWdFanZlUjQ0K3NLNGZpNytPY1dMQ1hKZmtmL25mSGJTSTBGWGR5dW5H?=
 =?utf-8?B?b01VSXFRYTBKL0FVT0tmUGk4R3owbjY4NXF0dGtRUGJCU2JmSzd6N05XT25W?=
 =?utf-8?B?U0pxOGFsTnA2M2M5bndZeTZSMCtMN0ZaNk1RRDROOXhLRmx5aDNhZXl0ekxY?=
 =?utf-8?B?SG5Cc1BucmFTejRNQXhnby9OMTBaODNrbGhhMXNMeGVwaWhuMHZNVlNmY0I2?=
 =?utf-8?B?alc4K1NGTy9iZnBYN1JsYWtvVXRQbFlJYStKbU14NW9hUW11aUx1bHZDMGVt?=
 =?utf-8?B?YjVZM0ZsZEkvVEd1TGZnbTJ0ZDRuM0gzY3BFWXU0MmpNWSswQzFDZ3V5SHpy?=
 =?utf-8?B?YXV5elRuMW10TGluWFZoTVFBUFkzajlERndvZTI4eUIxMXdqazhkTlI0L2hH?=
 =?utf-8?B?SllqYmJINVMrMFM2aWl1M2pCa2NHdStVdm5WOVd0ZWNoREo5TG84WkdsTURS?=
 =?utf-8?B?dGhKRTl3YUN1ODIyVEFsak5TRmswRUZXZ1Uyb1BtaVQ0eFVsU0Y5MTljZ1hL?=
 =?utf-8?B?S2xoSmlwK3VLUEdpdTgxbnNReFBMdVEzdS9VNU96Uk9vSGFzUGE4TEdUYk9z?=
 =?utf-8?B?b0RXa3VwWldVeEtXS3Z1NERHNG9IY0V1dVlFSmhjcjR1dEIwdEZpNUc5SSta?=
 =?utf-8?B?MGJVa2l6QkZVK0VmTEltaHNKTzdkdHZuZmNOR1ZZMEZjdkxuQTJHY1IyOC9K?=
 =?utf-8?B?RFV6ZjQ3aWdWbTI3aG80Y0F1eDJpZHJBNk1aK3ljcEllNC9QdXNjZ2k4Wmh0?=
 =?utf-8?B?M21BK0hScTZoWVorWEVTb0hQWGNMajZQd241YThGeTR3cU1udTF1b005a0dt?=
 =?utf-8?B?QXpmMER3ampEcjVUQ2VucHZxSm1yUFJ3cUsrQlg3S0dDYi9MZjJUek9meDM3?=
 =?utf-8?B?akV1dkRlVzNoWFJkbU9UNGJlRVUzdUk0ZEtGbzlFNUx5ayt6RmVyQy8rZUV2?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427be50d-b698-4c78-a6bc-08db4b32d615
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 17:29:51.7602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48pEfwvOx+KAz8R0vWJDMIZHn5YwggsWkjgYr+FvqIl7tp426JfU50/gp/REPuyEVSVnJzu+9QWjZpAkWFIx9fdAh2PBLwkIVXAezaWmD6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
X-Proofpoint-ORIG-GUID: EDHVCAq25wC1k_Z6oMe9EJvNTCAo8ZP0
X-Proofpoint-GUID: 8x9nqtWiZ6oBORxj2BOkaD2YUg-Sl6qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_10,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180755

--------------gpF5SJIH5NLXfp6zNE9TYVQe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 342CbjNs015914

On 2023-04-18 12:54, Khem Raj via lists.openembedded.org wrote:
> On Tue, Apr 18, 2023 at 9:41=E2=80=AFAM Ross Burton<ross.burton@arm.com=
>  wrote:
>> In 5c6064 the qemuarm* machines gained vmalloc=3D256, because in testi=
ng
>> Bruce was seeing problems when the vmalloc area was too big for the
>> memory size of the machine (eg 256MB).
>>
> default seems to be 128M for 32bit systems with memory < 1G and 256M
> for memory < 2G
> but I think using defaults might be preferred it works with original pr=
oblem too


I think we should backport this to mickledore, right Ross?

Steve, is so does it apply cleanly or should Narpat send a PR?

../Randy


>
>> The intention was for the area to be very small, but 256 bytes is too
>> small and the kernel sets a minimal vmalloc area of 16MiB:
>>
>> [    0.000000] vmalloc area is too small, limiting to 16MiB
>>
>> However, a 16MiB area is too small and results in pages of messages wh=
en
>> you try and use the system:
>>
>> [  242.822481] vmap allocation for size 4100096 failed: use vmalloc=3D=
<size> to increase size
>>
>> There have been a number of changes since this commit, remove the
>> explicit vmalloc argument and use the default.  I've tested that the
>> system still boots locally.
>>
>> [1] early_vmalloc(),https://elixir.bootlin.com/linux/latest/source/arc=
h/arm/mm/mmu.c#L1170
>> Signed-off-by: Ross Burton<ross.burton@arm.com>
>> ---
>>   meta/conf/machine/qemuarm.conf   | 2 --
>>   meta/conf/machine/qemuarmv5.conf | 1 -
>>   2 files changed, 3 deletions(-)
>>
>> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuar=
m.conf
>> index c5234231e2e..aa9ce882035 100644
>> --- a/meta/conf/machine/qemuarm.conf
>> +++ b/meta/conf/machine/qemuarm.conf
>> @@ -17,8 +17,6 @@ QB_SYSTEM_NAME =3D "qemu-system-arm"
>>   QB_MACHINE =3D "-machine virt,highmem=3Doff"
>>   QB_CPU =3D "-cpu cortex-a15"
>>   QB_SMP ?=3D "-smp 4"
>> -# Standard Serial console
>> -QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
>>   # For graphics to work we need to define the VGA device as well as t=
he necessary USB devices
>>   QB_GRAPHICS =3D "-device virtio-gpu-pci"
>>   QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-=
kbd"
>> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemu=
armv5.conf
>> index 6e59e42c3ab..ef1b4ece230 100644
>> --- a/meta/conf/machine/qemuarmv5.conf
>> +++ b/meta/conf/machine/qemuarmv5.conf
>> @@ -12,7 +12,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;ttyAMA1"
>>   # For runqemu
>>   QB_SYSTEM_NAME =3D "qemu-system-arm"
>>   QB_MACHINE =3D "-machine versatilepb"
>> -QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
>>   QB_GRAPHICS =3D "-device virtio-gpu-pci"
>>   QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-=
kbd"
>>   QB_DTB =3D"${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linu=
x-yocto',=20
>> '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180199):https://lists.openembedded.org/g/openembed=
ded-core/message/180199
>> Mute This Topic:https://lists.openembedded.org/mt/98348317/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------gpF5SJIH5NLXfp6zNE9TYVQe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 342CbjNs015914

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-04-18 12:54, Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soH2QOZq6cBEp_+ktybne=3Dt=
3iy=3DhxcxeTPGCPT8wNXi0A@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Apr 18, 2023 at 9:41=
=E2=80=AFAM Ross Burton <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">In 5c6064 the qemuarm* mac=
hines gained vmalloc=3D256, because in testing
Bruce was seeing problems when the vmalloc area was too big for the
memory size of the machine (eg 256MB).

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">default seems to be 128M for=
 32bit systems with memory &lt; 1G and 256M
for memory &lt; 2G
but I think using defaults might be preferred it works with original prob=
lem too</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I think we should backport this to mickledore, right Ross?<br>
    </p>
    <p>Steve, is so does it apply cleanly or should Narpat send a PR?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soH2QOZq6cBEp_+ktybne=3Dt=
3iy=3DhxcxeTPGCPT8wNXi0A@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">The intention was for the =
area to be very small, but 256 bytes is too
small and the kernel sets a minimal vmalloc area of 16MiB:

[    0.000000] vmalloc area is too small, limiting to 16MiB

However, a 16MiB area is too small and results in pages of messages when
you try and use the system:

[  242.822481] vmap allocation for size 4100096 failed: use vmalloc=3D&lt=
;size&gt; to increase size

There have been a number of changes since this commit, remove the
explicit vmalloc argument and use the default.  I've tested that the
system still boots locally.

[1] early_vmalloc(), <a class=3D"moz-txt-link-freetext" href=3D"https://e=
lixir.bootlin.com/linux/latest/source/arch/arm/mm/mmu.c#L1170">https://el=
ixir.bootlin.com/linux/latest/source/arch/arm/mm/mmu.c#L1170</a>
Signed-off-by: Ross Burton <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---
 meta/conf/machine/qemuarm.conf   | 2 --
 meta/conf/machine/qemuarmv5.conf | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
index c5234231e2e..aa9ce882035 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,8 +17,6 @@ QB_SYSTEM_NAME =3D &quot;qemu-system-arm&quot;
 QB_MACHINE =3D &quot;-machine virt,highmem=3Doff&quot;
 QB_CPU =3D &quot;-cpu cortex-a15&quot;
 QB_SMP ?=3D &quot;-smp 4&quot;
-# Standard Serial console
-QB_KERNEL_CMDLINE_APPEND =3D &quot;vmalloc=3D256&quot;
 # For graphics to work we need to define the VGA device as well as the n=
ecessary USB devices
 QB_GRAPHICS =3D &quot;-device virtio-gpu-pci&quot;
 QB_OPT_APPEND =3D &quot;-device qemu-xhci -device usb-tablet -device usb=
-kbd&quot;
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarm=
v5.conf
index 6e59e42c3ab..ef1b4ece230 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -12,7 +12,6 @@ SERIAL_CONSOLES ?=3D &quot;115200;ttyAMA0 115200;ttyAMA=
1&quot;
 # For runqemu
 QB_SYSTEM_NAME =3D &quot;qemu-system-arm&quot;
 QB_MACHINE =3D &quot;-machine versatilepb&quot;
-QB_KERNEL_CMDLINE_APPEND =3D &quot;vmalloc=3D256&quot;
 QB_GRAPHICS =3D &quot;-device virtio-gpu-pci&quot;
 QB_OPT_APPEND =3D &quot;-device qemu-xhci -device usb-tablet -device usb=
-kbd&quot;
 QB_DTB =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@oe.utils=
.version_less_or_equal('PREFERRED_VERSION_linux-yocto','4.7','','zImage-v=
ersatile-pb.dtb',d)}">&quot;${@oe.utils.version_less_or_equal('PREFERRED_=
VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}&quot;</a>
--
2.34.1




</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#180199): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/180199">https:/=
/lists.openembedded.org/g/openembedded-core/message/180199</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/98348317/3616765">https://lists.openembedded.org/mt/=
98348317/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------gpF5SJIH5NLXfp6zNE9TYVQe--

