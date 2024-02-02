Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECAFC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 16:14:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26617.1706890494515231579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 08:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ec8Oh2Zr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2762c8d993=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4125JPCs030990
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 08:14:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=0TZ2V8wV5+yyRHqsoMe
	DO2XJWwS8pslqYPH/sDf6O7M=; b=ec8Oh2Zr93C8WE32IEHy9bmxuzVp4Z2Xyh9
	CHrInn2zKD43iWPVwRtASSEMWjUXK4sLYjwHiEvzKf8jg5fp18jQO7ZsvnODfqEY
	eQ0/q75GnSlPs9JZQyu1zxYZQ9pGVqRQZ05ChB8JJAXYkVpj19HkxDsV4PjoMbY3
	pm4w/OpfNNTImao7NaCRih9jDBJnLL7XpfFx5Hg04YVQjAkgFRv2QyC+iW+TN9MQ
	D7jbt83OfCad4hKLVDRWEjWB1988jafU2+9LlI3EZcTl5xxh0js8AAJlKXlzaaS9
	cx62RGIdlK3PURLqaFrgccmIx8+M8c+nscCx/uUtQHA7a95pYCw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0px58mv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 08:14:53 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 412GEr6m001471;
	Fri, 2 Feb 2024 08:14:53 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0px58mv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 08:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hj4tyM9NyqQtuImVwg8500Dixw5zSOKtP/owR/pEYk+d9/8QdWzfNs3Y5HJ1Pnj2Qr9GwlhB6aUCr52dxpPogr9mDge5Nz3CluGHEkFjhPnsFShku18MNDIUuOQ360a2voGKwejQOyPzXDKpKlBcf+laWbnnVOQlmqL/k5eTyxz7FhRP81GqDu2TBqoIRTDyThWeWy9ZzioA0/vfQjTInrb9w7xUIwsojbg3w2tLLN4QmvEFuw0Nj0FJYuY0T64WPsyBUvlBd2saUgZqebvdZQkMqmJHBriAWaiOPtZwJPHMh/0U2aEeJY6D4BJuF/eUd49GiTuKnxXXuZrnx7/dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TZ2V8wV5+yyRHqsoMeDO2XJWwS8pslqYPH/sDf6O7M=;
 b=l13dYTpR1PiQUkVMdH5Qh+Poq1ltdbMLng/d9ANXj/oX5BAH5dr9cS+pW9DJ+Cz9pr5NlrXFQ3uVoB4o3PDyullIXLXaM7PO6F4nqGDtLA394ZS58QjqujH0aKYcxpcmFF5iQIxfzOGtPV+nh2cweLUkXmodWHzwgfgbpFkWLckhFwgd2gmV+YBV+N82YLQ261PRC97Be2nZDsSKONrQ8pyNBiIYwodEIhL+f+7XT+uwVdhpghoWYlTSKVwuzmWxFVKvLNBVNIaxdrpknw+2wOByu3kBAsQl3gZ+venFTxfjOWOp12dJUF9EIudfjPGpmOpXUFGGw1BvOZstSWKOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 16:14:45 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 16:14:45 +0000
Content-Type: multipart/alternative;
 boundary="------------Oowgp976hTl2vX74kZPoMNV0"
Message-ID: <42f67a75-53c6-4b8c-891e-f2c33e74f1bc@windriver.com>
Date: Fri, 2 Feb 2024 11:14:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
Content-Language: en-CA
To: steve@sakoman.com, Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com,
        umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com,
        sundeep.kokkonda@gmail.com
References: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
 <CAOSpxdbXC2D4iiUx8950bKHF1ajCOm1ijbazrkqKADNqdZnpOA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdbXC2D4iiUx8950bKHF1ajCOm1ijbazrkqKADNqdZnpOA@mail.gmail.com>
X-ClientProxiedBy: PH8PR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::19) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cb8470-9f54-42b5-2f90-08dc240a1245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J2lfDuPpBp3oBip933KoUBYtkUZljzj4GbwnthSfEyestxHPv0i1crpoe+H0Otx9BLyKRaGZinK20Q+XnYqQQFCc+Jv+b6qXLM/sZNA1Ubanp7LxgAhGeIUSCx5cwAknryXGN6/dWYhNaaxWVwafKT2dJI+y36ITeC5BvRt2j0xkl4iA0qmLRVuhgeqUCOVUQS24jGNsf2vl7F+J6ps+c6qJeD2l+1Fjf242k4Bd/vUrXpDDSIv9POtQlZaXIVWfUe796jHsozQLGsE/BrSRX/+zVdkfLPr2nqj/fSTBh09CnAUZW7CT/0jBTDB4UygmkdQFnMDWpMFqEXel8E7zdgTfqGT6q/TWxsn/Uu3VKuWlgzB8bg5w+Jc/lyumGk0EBgHupITdSPaTmmBzaqZGeJMgqPCOQWpTWQTBOiU4nIX856ND59u5GQp2Z7S/kaq2uSplrkTal3UoorjYa12LfHmlgyeXwQnQhHNXiFksIAJey1KgSulSDXhjo4P5kSIKbgKdGGv3FGQBVXysAZwtp1Gn/42hsGQLDt7Mh0CQfQzE6NSHPnsZN4e3/6rCb8N9FcCF/wQ556nxjeMYuHYDaXSvIpkud7+aP/nqR7maN6CVrfZXlzTD+EZvTQdkRsWBz04+azHMBrgZupW8FABX+JEjzrkJaq5DhjyFjWBT1ckx7GAMpgrc6vfWtXJ5tmXT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39850400004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(6512007)(2616005)(26005)(166002)(5660300002)(4326008)(8936002)(8676002)(66476007)(478600001)(66556008)(33964004)(38100700002)(6666004)(6486002)(53546011)(6506007)(30864003)(316002)(2906002)(66946007)(966005)(6636002)(86362001)(41300700001)(36756003)(31696002)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVBYWDErNk45OFpuUWVNZm50ZTBQL21na011RFhkdzgrcE1VOWdIZzFVQ1BS?=
 =?utf-8?B?U2o5OHZQVTJadkFoOEFqM3NNaE9LWDFVcVhEc2FNWFg5TmdEbFpTOUZUWC96?=
 =?utf-8?B?MTA4ZVc1L3JtT0krTjV6M29jV3VvV3FoZlI1TXpCSGhVNnBNUHpzR2U3UmFV?=
 =?utf-8?B?VnFPY25ydW1IK3lLMHhRUSs3SWNhbEZxdWZ6N3BsSENXbGU5aGkrdEpVNEFp?=
 =?utf-8?B?NFhtbEZOVFJxUjBDQkNPeEkwT1l0TFpKOVRnSmNmUFlVL0xXRFIzY1hDamp2?=
 =?utf-8?B?enBNMVl3RzR0ZDZodlphcnd3SldqbzIzZE5BUW1SNXdBWGRkT04zVm9LUEsw?=
 =?utf-8?B?WXNVclFZU3lXYVJCcEQ0Tmdhb2JJQi8zTDFmUUtONW9ubVhkK0h4akFpcHM2?=
 =?utf-8?B?UUNUbmZmdExiekNhV3prNWZQcmJWSWc5dDhZY0xYNW5mZ2pSMDFWa21HVmpm?=
 =?utf-8?B?SGliVnhuMDh3Zk9kckswU1NKR0RSTHR6VE9VbGUxeW1FM3g2K3Z6S2R5U2FO?=
 =?utf-8?B?WTJYSkVoZzFOemV4MEtEdWNWY3JTUTBwdzdXQnA3NzBkelNQKzdELzZwUXpt?=
 =?utf-8?B?TXZtbFhyMWRjQ2FwZFBpcVd6anB6SjZYbjZJR0RLQXRMSXkreldQT2hmU3A1?=
 =?utf-8?B?Y3BtQzB1OXhQeE8wdGphL3J6MU9qa3BBT0RhZE5zN0N5dE16cU9UVDhsNlpq?=
 =?utf-8?B?OXYxYVdiQVhzazFIZ0xsMHpRK0hVOHp5aHB3NmJqV2FGdTEwczZPVG1ibllK?=
 =?utf-8?B?ZGNYZHZTN3lMK1FvbU5PaDdnQmU3Tmg0R2h1ZW8yWU1RQlNDbHlHQlhXNWVo?=
 =?utf-8?B?UllFRldKRHc4dVlmb01sQzZBMmlTWGt6YldYUnpLektma0NSU0dWaWRJdGVu?=
 =?utf-8?B?SGpqRE5tVlJ2a3JqYmJ1bEtaRGNsWll4Z1owUEF5Nm5JeFZjT0t3NWdJS0JT?=
 =?utf-8?B?VVJTZGRHb0YxYkYveU56VW1YZlZ2M2JaVjc0bHF6ZW5XZWxtaTZ3UjFnaEVI?=
 =?utf-8?B?Q3hVUitTRDdTck5ZaEtCUDZWUUVOZ3BvSFNnQ3ZadzNFUnU2QnpXZWRobnFu?=
 =?utf-8?B?MFpzRmwramR0b2lWbnljUHgyelVEa2VOVHQvdnZtTnVLUFRCekxWTDB1Zjdu?=
 =?utf-8?B?YWRITmJyVERXRXBRbWxFQUxhNWRSYzVacGkvd3poU0UyWnJKc3dqQzl0L2Nn?=
 =?utf-8?B?S2VzV1hrbFFsOEZPVlpyQU9DZU5BMXordWF0NzY2ckNJTGlsL3I2cDBFWWFW?=
 =?utf-8?B?WUNjZlNYMTQrMisvVzlRUElvMk0xbzd0d0xnTFh0RGp4MWlBZkZod2REVm52?=
 =?utf-8?B?TElQTDFNQTloejZUUit6R1o2T0E4Z2p3cUJaVWxpRzVkenpPd3hhaS9hL01q?=
 =?utf-8?B?eU1RcDBzdlNUWEgvV2ZaYjRSbGVlL2pzM0diRWRaalExUXB2OG9EZTZuWi9o?=
 =?utf-8?B?a09ab1RrY1hxNm9GKzdkMHNHV2FQaHNxdUxPdkZTbVpNZlA0UFBjQ1c1bnJ5?=
 =?utf-8?B?d29jUkRONnhDRFZIbEpFMkw5c0V6K1p6dTk0NU5EeFhJQXJ4YldZeWNUMXIy?=
 =?utf-8?B?dmJvc2MrTHh2aXdMNGxYSEJ6SXVnc042bndLbWN2clVzOGJXc2FYclNtVDFH?=
 =?utf-8?B?QWx2V1d5cWIzVm8vWEpOZ1ZXc1BRaFUrUU05OWV1bVNCWTM1cFBMbDdHbDZo?=
 =?utf-8?B?ZjV4QUFTV0k3cVlWdENIVTVkYkpqcXQreHVkY3Fpckk2K2RMSDhZTUJiV1Ji?=
 =?utf-8?B?MUErRXZZRTRpVnl6VnIvaUR2VlBKOXZ4RDNNYjRpNVVQQlBlTDFqekcvL3Nq?=
 =?utf-8?B?ak9HL2RjbC9tT1BnbmpKR2J5R0pncGFPVXZ6OTFBcGtuU216R0FuQXNhc2pO?=
 =?utf-8?B?Y0VDT1BIcDFMa2lSbDk2NjdsakhwVjUyWEZVWTdWbU5pdzRCZWlWU092WjZx?=
 =?utf-8?B?ajhERzJEN0poWmx0ZFBSNUp4dTREZTA5M0VHSzRjb2RQazZiMzVwN2thZVND?=
 =?utf-8?B?NEdXSnNsbzZZN2NBcitaRTl5amVBWWFsbEtFc01ZQVhHWE5RTnBsRDUzSis3?=
 =?utf-8?B?dDJYYnBnMGtRT0lCWHYrZmR3bWlPeVhSRG85QnN0eWx1c0cwTkFiS1MyTmNu?=
 =?utf-8?B?d3kzbWF6RENoU3V1VHNtb0hQbi9iRjFRejE3UEhMekUyUytWNC9kb2lOeGtC?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cb8470-9f54-42b5-2f90-08dc240a1245
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:14:45.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7SJjjVoLaIzLXl7u0ztZSNUsSNN9+glrZVuwozodVKY0ZcgpuBVlzzkp2ye8a/fW8f3qnWxKIhYN6SUfkPzqyFx7TZbWLda39DRJbF0yvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Proofpoint-GUID: IYG-JOuvYrdYVdc8RopGeixdWQ2C3MjV
X-Proofpoint-ORIG-GUID: NZojyRxN187UWCFb2Ae_s7acuBn3Vost
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402020118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194807

--------------Oowgp976hTl2vX74kZPoMNV0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4125JPCs030990

On 2024-02-02 10:57 a.m., Steve Sakoman via lists.openembedded.org wrote:
> On Fri, Feb 2, 2024 at 2:01=E2=80=AFAM Hemraj, Deepthi via
> lists.openembedded.org
> <Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>
>> Issue: LIN1022-4854
> Please don't include internal windriver issue designators.
Agreed. Please only add those if needed when doing WR reviews.
>
> Also, please send your initial submission without a version number.
> If you need to resubmit, add a version number and include a comment
> after the --- line below indicating what has changed. Otherwise I am
> left to puzzle out which patch you intended I should take.

>
> I have fixed this, so no need to resubmit this time.

Thanks Steve.

Also there are two threads with the same git shortlog / email subject:
 =C2=A0=C2=A0 [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129


This is the second one and the first was:
https://lists.openembedded.org/g/openembedded-core/message/194789
I'll reply there to ask you to change the git shortlog.


I'm a bit concerned about the fix since the last comment in:

https://sourceware.org/bugzilla/show_bug.cgi?id=3D30640

says:
 =C2=A0=C2=A0 " Fixed by 58abdf88782 (and follow-up patches from mjw). "

Deepthi,
What can you find out about the "follow-up" patches?

I suspect that we won't need to revert this commit but that there
may be more work to be done.

Steve, will you keep what you have from this commit in your tree?

../Randy

>
> Thanks,
>
> Steve
>
>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> ---
>>   meta/recipes-devtools/gdb/gdb.inc             |  1 +
>>   .../gdb/gdb/0012-CVE-2023-39129.patch         | 50 +++++++++++++++++=
++
>>   2 files changed, 51 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129=
.patch
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools=
/gdb/gdb.inc
>> index 099bd2d8f5..ad2b3ad4b7 100644
>> --- a/meta/recipes-devtools/gdb/gdb.inc
>> +++ b/meta/recipes-devtools/gdb/gdb.inc
>> @@ -15,5 +15,6 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>>              file://0009-Fix-invalid-sigprocmask-call.patch  \
>>              file://0010-gdbserver-ctrl-c-handling.patch  \
>>              file://0011-CVE-2023-39128.patch  \
>> +file://0012-CVE-2023-39129.patch  \
>>              "
>>   SRC_URI[sha256sum] =3D "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba=
19d8463c3cc787152e32"
>> diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch b=
/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
>> new file mode 100644
>> index 0000000000..63fb44d59a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
>> @@ -0,0 +1,50 @@
>> +From: Keith Seitz<keiths@...>
>> +Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
>> +Subject: Verify COFF symbol stringtab offset
>> +X-Git-Tag: gdb-14-branchpoint~473
>> +X-Git-Url:https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit=
diff_plain;h=3D58abdf887821a5da09ba184c6e400a3bc5cccd5a
>> +
>> +Verify COFF symbol stringtab offset
>> +
>> +This patch addresses an issue with malformed/fuzzed debug information=
 that
>> +was recently reported in gdb/30639. That bug specifically deals with
>> +an ASAN issue, but the reproducer provided by the reporter causes a
>> +another failure outside of ASAN:
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommitdiff_plain;h=3D58abdf887821a5da09ba184c6e400a3bc5cccd5a]
>> +
>> +CVE: CVE-2023-39129
>> +
>> +Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> +
>> +diff --git a/gdb/coffread.c b/gdb/coffread.c
>> +--- a/gdb/coffread.c
>> ++++ b/gdb/coffread.c
>> +@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
>> + static file_ptr linetab_size;
>> +
>> + static char *stringtab =3D NULL;
>> ++static long stringtab_length =3D 0;
>> +
>> + extern void stabsread_clear_cache (void);
>> +
>> +@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb=
::unique_xmalloc_ptr<char> *stora
>> +   /* This is in target format (probably not very useful, and not
>> +      currently used), not host format.  */
>> +   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
>> ++  stringtab_length =3D length;
>> +   if (length =3D=3D sizeof length)        /* Empty table -- just the=
 count.  */
>> +     return 0;
>> +
>> +@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entr=
y)
>> +
>> +   if (symbol_entry->_n._n_n._n_zeroes =3D=3D 0)
>> +     {
>> +-      /* FIXME: Probably should be detecting corrupt symbol files by
>> +-       seeing whether offset points to within the stringtab.  */
>> ++      if (symbol_entry->_n._n_n._n_offset > stringtab_length)
>> ++      error (_("COFF Error: string table offset (%ld) outside string=
 table (length %ld)"),
>> ++             symbol_entry->_n._n_n._n_offset, stringtab_length);
>> +       result =3D stringtab + symbol_entry->_n._n_n._n_offset;
>> +     }
>> +   else
>> --
>> 2.43.0
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#194805):https://lists.openembedded.org/g/openembed=
ded-core/message/194805
>> Mute This Topic:https://lists.openembedded.org/mt/104117785/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------Oowgp976hTl2vX74kZPoMNV0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4125JPCs030990

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-02-02 10:57 a.m., Steve Sakoma=
n
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbXC2D4iiUx8950bKHF1ajCOm=
1ijbazrkqKADNqdZnpOA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Feb 2, 2024 at 2:01=E2=
=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj=3Dwindri=
ver.com@lists.openembedded.org">&lt;Deepthi.Hemraj=3Dwindriver.com@lists.=
openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Deepthi Hemraj <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver.com=
">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

Issue: LIN1022-4854
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Please don't include interna=
l windriver issue designators.</pre>
    </blockquote>
    Agreed. Please only add those if needed when doing WR reviews.<br>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbXC2D4iiUx8950bKHF1ajCOm=
1ijbazrkqKADNqdZnpOA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Also, please send your initial submission without a version number.
If you need to resubmit, add a version number and include a comment
after the --- line below indicating what has changed. Otherwise I am
left to puzzle out which patch you intended I should take.</pre>
    </blockquote>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbXC2D4iiUx8950bKHF1ajCOm=
1ijbazrkqKADNqdZnpOA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

I have fixed this, so no need to resubmit this time.</pre>
    </blockquote>
    <p>Thanks Steve.</p>
    <p>Also there are two threads with the same git shortlog / email
      subject:<br>
      &nbsp;&nbsp; [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-=
39129<br>
      &nbsp; <br>
    </p>
    <p><br>
    </p>
    <p>This is the second one and the first was:<br>
      &nbsp;
      <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedd=
ed.org/g/openembedded-core/message/194789">https://lists.openembedded.org=
/g/openembedded-core/message/194789</a><br>
      I'll reply there to ask you to change the git shortlog.<br>
    </p>
    <p><br>
    </p>
    <p>I'm a bit concerned about the fix since the last comment in:</p>
    <p>&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://so=
urceware.org/bugzilla/show_bug.cgi?id=3D30640">https://sourceware.org/bug=
zilla/show_bug.cgi?id=3D30640</a></p>
    <p>says:<br>
      &nbsp;&nbsp; &quot; Fixed by 58abdf88782 (and follow-up patches fro=
m mjw). &quot;<br>
      <br>
      Deepthi, <br>
      What can you find out about the &quot;follow-up&quot; patches?<br>
      <br>
      I suspect that we won't need to revert this commit but that there
      <br>
      may be more work to be done. <br>
    </p>
    <p>Steve, will you keep what you have from this commit in your tree?<=
br>
    </p>
    <p>../Randy<br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbXC2D4iiUx8950bKHF1ajCOm=
1ijbazrkqKADNqdZnpOA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Thanks,

Steve

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Deepthi Hem=
raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@wind=
river.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0012-CVE-2023-39129.patch         | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.pat=
ch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
index 099bd2d8f5..ad2b3ad4b7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0009-Fix-in=
valid-sigprocmask-call.patch">file://0009-Fix-invalid-sigprocmask-call.pa=
tch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0010-gdbser=
ver-ctrl-c-handling.patch">file://0010-gdbserver-ctrl-c-handling.patch</a=
> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0011-CVE-20=
23-39128.patch">file://0011-CVE-2023-39128.patch</a> \
+          <a class=3D"moz-txt-link-freetext" href=3D"file://0012-CVE-202=
3-39129.patch">file://0012-CVE-2023-39129.patch</a> \
            &quot;
 SRC_URI[sha256sum] =3D &quot;1497c36a71881b8671a9a84a0ee40faab788ca30d7b=
a19d8463c3cc787152e32&quot;
diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch b/me=
ta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
new file mode 100644
index 0000000000..63fb44d59a
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
@@ -0,0 +1,50 @@
+From: Keith Seitz <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:keit=
hs@...">&lt;keiths@...&gt;</a>
+Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
+Subject: Verify COFF symbol stringtab offset
+X-Git-Tag: gdb-14-branchpoint~473
+X-Git-Url: <a class=3D"moz-txt-link-freetext" href=3D"https://sourceware=
.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff_plain;h=3D58abdf887821a5da0=
9ba184c6e400a3bc5cccd5a">https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff_plain;h=3D58abdf887821a5da09ba184c6e400a3bc5cccd5a</a>
+
+Verify COFF symbol stringtab offset
+
+This patch addresses an issue with malformed/fuzzed debug information th=
at
+was recently reported in gdb/30639. That bug specifically deals with
+an ASAN issue, but the reproducer provided by the reporter causes a
+another failure outside of ASAN:
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff_plain;h=3D5=
8abdf887821a5da09ba184c6e400a3bc5cccd5a">https://sourceware.org/git/?p=3D=
binutils-gdb.git;a=3Dcommitdiff_plain;h=3D58abdf887821a5da09ba184c6e400a3=
bc5cccd5a</a>]
+
+CVE: CVE-2023-39129
+
+Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt=
;</a>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+
+ static char *stringtab =3D NULL;
++static long stringtab_length =3D 0;
+
+ extern void stabsread_clear_cache (void);
+
+@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::u=
nique_xmalloc_ptr&lt;char&gt; *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length =3D length;
+   if (length =3D=3D sizeof length)        /* Empty table -- just the co=
unt.  */
+     return 0;
+
+@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entry)
+
+   if (symbol_entry-&gt;_n._n_n._n_zeroes =3D=3D 0)
+     {
+-      /* FIXME: Probably should be detecting corrupt symbol files by
+-       seeing whether offset points to within the stringtab.  */
++      if (symbol_entry-&gt;_n._n_n._n_offset &gt; stringtab_length)
++      error (_(&quot;COFF Error: string table offset (%ld) outside stri=
ng table (length %ld)&quot;),
++             symbol_entry-&gt;_n._n_n._n_offset, stringtab_length);
+       result =3D stringtab + symbol_entry-&gt;_n._n_n._n_offset;
+     }
+   else
--
2.43.0




</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#194805): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/194805">https:/=
/lists.openembedded.org/g/openembedded-core/message/194805</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104117785/3616765">https://lists.openembedded.org/mt=
/104117785/3616765</a>
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

--------------Oowgp976hTl2vX74kZPoMNV0--

