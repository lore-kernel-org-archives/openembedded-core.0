Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7A6C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 20:26:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2800.1660249582063223289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 13:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qsHY2Lm3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5222674877=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27BIg3Jd030997
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 20:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ktAw84P3uWj/o7ssfHYUPwt3XJDk/lSYuEGVROc/Tig=;
 b=qsHY2Lm35TZ4XurXEx5DdHw4vW919KxZfzGPZL3AuV6frooO+QIIu8Vv8VDVsp4asNiS
 lfpOzR0NH8Axw0OBhXG474hbkywbnKL9CugPlj8UAdhfl5QQU2if4H9v+7xKKR586/ND
 fv6QkZOoBPEcF3bJOo4G1YU4cb9956uTIx6pI3VuEDR4Q0qnL/AtUEwvn9zU15tE1VQj
 sdolxexSPzagslDPUyTgPEx+65XwPgm14hkKFVgYTLkioXSoxF71wxKPaj89MY3KbCbc
 tX90s1IgQSwkkU93mRQb+lt6V2IAUdpIoIKz+LZFP5I3sOzpOVQuDOork2BP3yXIEJd9 Nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqgy8qt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 20:26:20 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BKMLTs027197
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 20:26:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqgy8qt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 20:26:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEan7Bt653rEF8pl3munMOVujE1gfC8ut1G52n6PvUNbWg81it/0Jg2seUPZ0PVIKt/n1FAO7BWCykKu+TVFPSF/QVcKzVjz7ynR5QybscVucfEqlB5TGD8LYdN26e8hhLtaft0iO1B5k0trKxOtm1gm8IpQUGTq14LZgqk5Ljelj2wQorxHmz1eMuW4qlgWhMnlSyPEN8vvDAOJ8nDmlxsGTDqqXB9qs+9E9Z8GrUgiyvttfRz0EAiJNTZxY19WCS4SGFFNbGarGX0Q64qIJ7V7jjYM6JomcWF7P1W+Z+VlN9yyU1FjSBkzeK1HumqKBPpy7n+WPBJnRdlcYCtDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktAw84P3uWj/o7ssfHYUPwt3XJDk/lSYuEGVROc/Tig=;
 b=a1dSYuLlKsiqgap9ausj5hKUVoeYa9/mJ44soFg4eN1swESgW09L6AsukLHj+be1CSM/npr/YHT5p4IhM6OhhGOU659LQ+wlmHL4RKO521Kv4Ab0WbWGPi+PRIl0sjxrHRVEFLYnYnmyJZ26P4Up9gFCzRppktmVljlsRkUW35npa8LMSBIcdxCQGSIM4aZyyWMO6WdxpWhvXpJDvmToEzkqWLuxN91SPW3PQSQtmi0vamzrb2oDxeJLHaiYYfS/0JhgRi6zq0bAsOlF59HwXejEIJDpLCoSRDmjBZXvOJWDBfI+qC10LJaGkPtitFOxwAFK9g0tjTVQ4uzvGD9NRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BN6PR11MB1236.namprd11.prod.outlook.com (2603:10b6:404:48::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Thu, 11 Aug 2022 20:26:17 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 20:26:16 +0000
Message-ID: <b0231554-ed52-b08e-2e7c-f5a202b2b2d7@windriver.com>
Date: Thu, 11 Aug 2022 16:26:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [kirkstone][PATCH] u-boot: fix CVE-2022-33103
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <1705773DE10A5E2A.21236@lists.openembedded.org>
 <b6e3d481-675d-fc6f-b88b-81cfc6ca2aed@windriver.com>
 <CAOSpxdYbaGBmOqhvcaPeUgGZZUumE9fc_0c0g_sq5A4AHeXv3w@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CAOSpxdYbaGBmOqhvcaPeUgGZZUumE9fc_0c0g_sq5A4AHeXv3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0190.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::33) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b042e02-ea1f-4cf5-6fab-08da7bd7be3e
X-MS-TrafficTypeDiagnostic: BN6PR11MB1236:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LDygRJY6Us2duFu1hczEuRTejPPpl/8nJDUn55IVm38czsLf32bxt2/hJMxBRZasVac/uvy33E02klZxCxpfeyLHHgcHRx5NlU03IKFFL61kvODMB0yCmcs+Vb4R2dKtgjdK4s+wtMGyQCMnhuz2jKdKUyB8HC9USas/dsbuiU/BHXZwe0jkjuXet+o5WlrFsIDCOPNESAoWunHfLVHOL/mjFPiS5Wx1MLCwFlylPGI8pQOBoQ9AIxXr1NlKe8j9fKLRqA14aV+cqeEpnReElgHQhuVuvZeomLkciw0pf52vUpHkV6t78c9c3iD1LMMEaw5sJ6mfnVnQ5KLwri5BbeXjtsNMogUseEtI/Sgj9p0P2QQSBu6PEZqLQjUeJAQA5675YK7uM/3yVRvx80uHDNEsmRlECuijeQr+8Bbo1ukFYgJERFRSD5PzFw0B0X4yRrYiz5jtrbndmIA60q6fykN9P7GPeDty9Sv4DbHXGj/yhyD7GNhCLFezf+24S8r1I9QnfV8yHpvq9M7W7h48+9NAn8kvloCYFuPFTunm8ae2er0FTL0HdlRygF7IBs5g59Mna0KpTkHGjK8onOypP0GzTOczeAoVttfAXVmtamVMRTjaT6bAHHK/JWOD2wKq6D0w+MR14gJC9wFvwbPeDfpu7WYH4GsyIxpwcCWJQ4TBelGJc8XamWNm96ruzgRHixnMDo7iWdxfGigxNPK7krIqZDw2NdgHkE6VvZaW7aY4xj+yzg2/ruLEj/t8NtFrDAKmdAT8jVbBSC5bIfUHl13onw31dRWCMuNxwijG2YAnAHxPrejxlWbIbcDAjPGJ5/WNSOUH+fPS1Vg69gvgwbMq8Rqjv8OjnzIJELijPHVFmv7Y26AsZ81V/u+zeW5A2UiwYfDgzgVEp3YdT+nn9jD8K0fyXU6tv+almz//5mE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39850400004)(376002)(66476007)(26005)(38350700002)(38100700002)(966005)(31696002)(44832011)(53546011)(6486002)(6512007)(5660300002)(52116002)(8936002)(86362001)(478600001)(6506007)(83380400001)(41300700001)(8676002)(4326008)(2906002)(66946007)(6916009)(66556008)(36756003)(2616005)(186003)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlUwZDhzRmhXeGI1a3JqTGVzQlBnWDVzcVE1QVBHNWpDTHFKczhOZE9xQURr?=
 =?utf-8?B?aXZBMmdNNUhnMVllY29CY1ZoV1d1WHRvQU04anB1Si9tUmVGR3BMY0ZTUUlK?=
 =?utf-8?B?T1Z3ZXowOTZoenFLZEh6VER1V1FaczZ6MUtyaHZHa0VxZmtKWldXS2d0K0lW?=
 =?utf-8?B?L05DYWhFcWQyN3FMZXdyNE93Y0dnRThqeWVQeXYxbUdiM20xcGFYTHZCd1hi?=
 =?utf-8?B?bThWYVNJbjcvQmlXd0J3N1c1VjkyaDV4amxDUVQ3aHdwdkp4Y2hycXFrc3VV?=
 =?utf-8?B?d1ppdzhjRlJUcWJMaUppeEpBSDFmT2gxRVlTWHJ2Z3hkRVpJT0NQWEo0eVFl?=
 =?utf-8?B?Z2NZK3JzR2Y4eUNrb3ovOG9hVWN5N01PREdqeFYrQUhOMTNpYkt6R2tWNjFx?=
 =?utf-8?B?UFAzRHcwdVltWWZFU1J6RHJhWEpqRHZDaFlXa3pTNGdMWUN0Y2haeEtsRzJK?=
 =?utf-8?B?aFIyZ3dHb0cwb1N6K1VHS1Exc2ZDaXU3S2Q5NURDaXJCUjQrVGhsUTNMQW9a?=
 =?utf-8?B?azRUT1BySy9RRjc5NG0ycERLYWlldHIvSk9QelEwbWkzNS9VMWhFc3ptNVZ4?=
 =?utf-8?B?b2xobHlqTVU3UENGMnhTU291cUQ2eE5wUSs5RFY2Tjgra1UvQjhxZG13NGd0?=
 =?utf-8?B?c0g1anhiS2RrMjYybklzM0M3b3Vjb0NSSy9nMy85MjVvcXd4OE4rWjVwY3Nh?=
 =?utf-8?B?TGV0Q2RkUjBCNjNnaHE1dXRzMGVOa3FlNFdyWm53TUorbTAwUUhrZWU2Q1RE?=
 =?utf-8?B?cHVlTTZENlMzSy9HcEJ2Mm1NaThNODRYcDc5ZDNrTkNNa012Q1phUmI0QnBW?=
 =?utf-8?B?UExmTmJSY2tTeFFQMXdHcXVvL0h1bktRRXFrdklFYXZvWTZzSk9TZ0lZWE0z?=
 =?utf-8?B?ZThMV0JEOFZwdmVWREFqNjNmYS9EZmYzblVhRFdxSUVPdXRFWjBYeTZ0UW5v?=
 =?utf-8?B?WmFuV2hmVCs3UlFtTHExNlVGMmlBTzNaOUozWldteUZDMkU4MldZVmx4aGJw?=
 =?utf-8?B?S1d3TDVEeE1PZTd4YmsxUWFjbGtNTGFONVBYUmQzMWFrR1BhUmd3NWI3U3Fo?=
 =?utf-8?B?cXRVd0RsT2x0cHYxNUlCdnFnZ2tvcisrUDdFMFhldUExMWVEVzRIYWl4R3hK?=
 =?utf-8?B?amFHODA2eXQ2ekpPRGNKY0htcEVndTRVZXM2Y1VBVzVyNzZJQndXS2QrMDJB?=
 =?utf-8?B?M2YwY2MxNVlIbGdjT3JSalJOcmVTbVRQeXptZnZFZi92dGRYSklSUEFmUXhV?=
 =?utf-8?B?aEYvMWUwKzN6L3FNS1BJYW10M1ovMXVSMWFCb0hBeWhwZ1lINHBEVkVaZTM0?=
 =?utf-8?B?eWtMbEZ0VUUwZVZ4TGtHbE1xNkpHaWtidmdzNGpQamV5eENUakszSUN4SFRV?=
 =?utf-8?B?Mm9udW9mSlk0ZFUwbzZ0NzVMdkxsdTIvVkJaZ0hqdmpSMmp4ZmdlSTBzQnFX?=
 =?utf-8?B?Wi9uN295K0tnNG5Ea3pwemw0LzY5VnVyR213NW1QVVpJb1J3bUIwaUNoTk1y?=
 =?utf-8?B?OEVjWXNJeUdhUyt3b1VpL0ZXand3dVlBM053Sm1XdnJVUk5VUkFjcm8yWmV0?=
 =?utf-8?B?NjJHRzlYcmg5VElXZE1pV3hZOHNLbk50MElsVVgxNWF5QVRDK1pOTUtPNjlB?=
 =?utf-8?B?OXh3ZzdzZTlqS1hLL2ljOWNxTitjd01TUElvMUFmOE9kWjNOTjdRZkkxUlhH?=
 =?utf-8?B?c3ArSEJGMVd4azdqZDBjWXN3Qlh5elUvc3pJd0lGQWU3QUdMVWZBb2pYRzdl?=
 =?utf-8?B?SXQxK2JNZGpWSkU2QnY2bDRkaEpDYU0rODZLRTQ1ck9SWGxPV2FjVWdCT0tt?=
 =?utf-8?B?UllLb1pEYVUwNFcxM1F1cWNsaUZlb3VpUlo1V0ZtWlFhUUFiRGo3UWxYSng4?=
 =?utf-8?B?MU9KTitTYXU0ZEt6bnMyRHJ6MFRrYWprTEplYm9kNUF0ZkZCcVBPbGl4czhq?=
 =?utf-8?B?T3h1Z2FXUHZVNXdiSjgxeVdVaVhlZTZwaHNoaHdWai95anArNGNkZW9Da2wx?=
 =?utf-8?B?QklwaGJHWWRCQlIxN283OEd1TWdrN0dDT2hiRGxCOWtzMFRUKzVxeWRyTXdI?=
 =?utf-8?B?NjRPemU1WUVUd1IyZ2JhOVFHd1lSdlBObTRxYSs4V2NMa2MrM1AxYzdqY01E?=
 =?utf-8?B?bU1uSk1sWkpUc2p0U0swYXExRzA3Uk4wL1BUeU1RRVFhbFdNenNxQjU0V3Mx?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b042e02-ea1f-4cf5-6fab-08da7bd7be3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 20:26:16.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nPx7ftmv99GMtGmXROaZOjEm0bGu5qAQodW6Xz1myssqaBKOkZoKwQisqEDbvLIznlq3Q1efD97FS8QyLQASDlHIqyahUSHSVUO/loU3tT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1236
X-Proofpoint-ORIG-GUID: J8Sr8Bdf0aU3hDuUJS2G9BdOuZCDsolC
X-Proofpoint-GUID: DUS0BCD_C-BERsLm0GxrSvULp0MbZ-Uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 20:26:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169272


On 2022-08-10 12:30, Steve Sakoman wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, Aug 10, 2022 at 5:35 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>> Steve, did you miss this patch?
> I did :-(
>
> I've got it now.  Sorry about that.
No worries! :)
>
> Steve
>
>> On 2022-07-26 15:18, Sakib Sajal wrote:
>>> Backport patch to resolve CVE-2022-33103.
>>>
>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>> ---
>>>    ..._read-Prevent-arbitrary-code-executi.patch | 80 +++++++++++++++++++
>>>    meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
>>>    2 files changed, 81 insertions(+)
>>>    create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
>>>
>>> diff --git a/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
>>> new file mode 100644
>>> index 0000000000..b1650f6baa
>>> --- /dev/null
>>> +++ b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
>>> @@ -0,0 +1,80 @@
>>> +From 65f1066f5abe291c7b10b6075fd60776074a38a9 Mon Sep 17 00:00:00 2001
>>> +From: Miquel Raynal <miquel.raynal@bootlin.com>
>>> +Date: Thu, 9 Jun 2022 16:02:06 +0200
>>> +Subject: [PATCH] fs/squashfs: sqfs_read: Prevent arbitrary code execution
>>> +
>>> +Following Jincheng's report, an out-of-band write leading to arbitrary
>>> +code execution is possible because on one side the squashfs logic
>>> +accepts directory names up to 65535 bytes (u16), while U-Boot fs logic
>>> +accepts directory names up to 255 bytes long.
>>> +
>>> +Prevent such an exploit from happening by capping directory name sizes
>>> +to 255. Use a define for this purpose so that developers can link the
>>> +limitation to its source and eventually kill it some day by dynamically
>>> +allocating this array (if ever desired).
>>> +
>>> +Link: https://lore.kernel.org/all/CALO=DHFB+yBoXxVr5KcsK0iFdg+e7ywko4-e+72kjbcS8JBfPw@mail.gmail.com
>>> +Reported-by: Jincheng Wang <jc.w4ng@gmail.com>
>>> +Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> +Tested-by: Jincheng Wang <jc.w4ng@gmail.com>
>>> +
>>> +CVE: CVE-2022-33103
>>> +Upstream-Status: Backport [2ac0baab4aff1a0b45067d0b62f00c15f4e86856]
>>> +
>>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>> +---
>>> + fs/squashfs/sqfs.c | 8 +++++---
>>> + include/fs.h       | 4 +++-
>>> + 2 files changed, 8 insertions(+), 4 deletions(-)
>>> +
>>> +diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
>>> +index e2d91c654c..a145d754cc 100644
>>> +--- a/fs/squashfs/sqfs.c
>>> ++++ b/fs/squashfs/sqfs.c
>>> +@@ -973,6 +973,7 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
>>> +     int i_number, offset = 0, ret;
>>> +     struct fs_dirent *dent;
>>> +     unsigned char *ipos;
>>> ++    u16 name_size;
>>> +
>>> +     dirs = (struct squashfs_dir_stream *)fs_dirs;
>>> +     if (!dirs->size) {
>>> +@@ -1055,9 +1056,10 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
>>> +             return -SQFS_STOP_READDIR;
>>> +     }
>>> +
>>> +-    /* Set entry name */
>>> +-    strncpy(dent->name, dirs->entry->name, dirs->entry->name_size + 1);
>>> +-    dent->name[dirs->entry->name_size + 1] = '\0';
>>> ++    /* Set entry name (capped at FS_DIRENT_NAME_LEN which is a U-Boot limitation) */
>>> ++    name_size = min_t(u16, dirs->entry->name_size + 1, FS_DIRENT_NAME_LEN - 1);
>>> ++    strncpy(dent->name, dirs->entry->name, name_size);
>>> ++    dent->name[name_size] = '\0';
>>> +
>>> +     offset = dirs->entry->name_size + 1 + SQFS_ENTRY_BASE_LENGTH;
>>> +     dirs->entry_count--;
>>> +diff --git a/include/fs.h b/include/fs.h
>>> +index 1c79e299fd..6cb7ec89f4 100644
>>> +--- a/include/fs.h
>>> ++++ b/include/fs.h
>>> +@@ -161,6 +161,8 @@ int fs_write(const char *filename, ulong addr, loff_t offset, loff_t len,
>>> + #define FS_DT_REG  8         /* regular file */
>>> + #define FS_DT_LNK  10        /* symbolic link */
>>> +
>>> ++#define FS_DIRENT_NAME_LEN 256
>>> ++
>>> + /**
>>> +  * struct fs_dirent - directory entry
>>> +  *
>>> +@@ -181,7 +183,7 @@ struct fs_dirent {
>>> +     /** change_time:        time of last modification */
>>> +     struct rtc_time change_time;
>>> +     /** name:               file name */
>>> +-    char name[256];
>>> ++    char name[FS_DIRENT_NAME_LEN];
>>> + };
>>> +
>>> + /* Note: fs_dir_stream should be treated as opaque to the user of fs layer */
>>> +--
>>> +2.33.0
>>> +
>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
>>> index f2443723e2..a6a15d698f 100644
>>> --- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
>>> @@ -4,6 +4,7 @@ require u-boot.inc
>>>    SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
>>>                       file://0001-riscv-fix-build-with-binutils-2.38.patch \
>>>                       file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
>>> +                   file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
>>>                     "
>>>
>>>    DEPENDS += "bc-native dtc-native python3-setuptools-native"
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#169199): https://lists.openembedded.org/g/openembedded-core/message/169199
>>> Mute This Topic: https://lists.openembedded.org/mt/92635002/4422444
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakib.sajal@windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

