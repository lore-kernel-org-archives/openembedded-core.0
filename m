Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABDAC47422
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 01:03:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11000.1705626186813503942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 17:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=TrouxrDp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174848cf02=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40INm7EH022536
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 17:03:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=AIXj+ER3gRfBhiRrQg+
	yagw06oiNeV2BZTYb4z/1OZc=; b=TrouxrDpC2mTpKzdEqHSQFfeQKXeh4VmppC
	6/vpe7wOGOCZwCl3KatyI+/kP1xPLKHV+t+kAyxD3S4z/GAkRoj2RhOS6J02q7ha
	9+Z8n4e8Kg1ccLXNWd4fJZZ8cRLjZOh8iPCqXZkPgcPOg0R4w1pp82KkL6BzNS7l
	qgEySR2ZiVu410SEE7FB4HzrTfAyQ3485Poeovqw5zbiwWQU89SxjJErpnDyDbMS
	8tp3dOvTKyxC6GQBFqZXeZSRNFJFkYM3cDLSCwpq8SQllZw7RKYEhnM9TpOC6WDl
	K/EJkuY0dfPXzqiL8UNbeZZYV2BNT0aqo7OOaOjmiMW9aUY07WA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkp3vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 17:03:05 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40J135v6013388;
	Thu, 18 Jan 2024 17:03:05 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkp3vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 17:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nT4i5YdxVXpFB+NtwWFYNUW37FIYphiX8xYjHay4rNx16eOUCLWcgXizgm8kG4olmDgo6KjgKyaurV/7Y7dnffLeq4wG4qQMnZS2GN6IL8rQT3j6YGospvi7GKT6CegGHhNJnBWKy/pceWBr4ywJlcBNCzcjw3mPfnrOHvsjbeqONUXN1rNBMGY4bBvB9TeixivXjUq4FGVP/YQiVA+gOZrYw+xbQ8uFKgtAN68fY7frNyh5m6n/7oCGdVac+2asAjW3U7C6csBE3H5f5u4LAjEAH/LDTzeH9PfzxJuZj2VSF8IomZHuXiOEDkpAYyM7bnbGF2GOLRXcb11AtR6wEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIXj+ER3gRfBhiRrQg+yagw06oiNeV2BZTYb4z/1OZc=;
 b=BmiDMUBtbsvg7ZzW0GhlHGWBRmOVoxdKzuW1V/sIkjD6+DKsUuwh6msmjhOTOeomnHimsiCXh+H56jRkaIOC4NbUhyc8Cx3t+6CYilv5IxFnfXnsYMKCVp1UgsZEBkoXEOJTpG8Kwd3SMLocFTJ9ej5KDZJWI1ZrOPKis9lJd557VDkNkAJD+5Z2xKgd+JaZIOMf1NyBwR2kq3lNc6H8x4FmFNVp53bD4kRf/5ykNYVdUtlsSvPS7CBV3QoVJuURA47tiEDjkVPRTMTp72JqtMb8GM92bjptcs/hppa/wyp/NrdO00Qw+FQA2QFfNM6q1s3KGKUijHkHZKknr/hwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 01:03:01 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 01:03:00 +0000
Content-Type: multipart/alternative;
 boundary="------------7B50stWlNL0J3YI5siA5sY7Y"
Message-ID: <fc1823e9-b883-477c-9255-eb4f17267124@windriver.com>
Date: Thu, 18 Jan 2024 20:02:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCHv2] openssl: fix CVE-2023-6237
 Excessive time spent checking invalid RSA public keys
Content-Language: en-CA
To: steve@sakoman.com, hprajapati@mvista.com, tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
References: <20240117114532.716702-1-hprajapati@mvista.com>
 <CAOSpxdZgVkLg6S0i=h-kxrrhdJkGYPVJyz3dbRearaZNxdbYqQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdZgVkLg6S0i=h-kxrrhdJkGYPVJyz3dbRearaZNxdbYqQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SA1PR11MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 56925fc4-a3e8-4f39-6a79-08dc188a61cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lJ28QeLfMBQ/x/0J7w/rA4Q/MJqtwT+OQI/5Yr4j+V5RxfGx2rt/C8Lvqe7DzgjFVR48GDRLUcnTWb1zMORl92POG64H9ILlWKjpbJIgJW1S9C0MQO2/fxrmu8FFaPnPL87RopMOodEWLkl/4jhwfgDzHcBDb1LYlQa75ILyO8ATgHyYFd17qJ9Lr/haJpCoKUxdcMifj2Ww7ByNdmYvVMFiJ3/FhUWdUN7fBLrC/1BKys9Lh313NqldUQXMsXtxeldqQg/Fv5r1PGsSWP8X6LoXgQPgvBa2htp2cx8UYlfdGifa2DT1vc+Tt7fymQQlVuC8i6SmZxzNTtRvgT6yUNP3E6wCKk6kOZSc7Vtwo7imXZTCus21GzyhXbwsMMWiUxZ1oi65EWdylPKdNuZ+IL1QPUts1ciUmZZW6UdU3aw2Z3Z7vixYlsIy3Rm1F2FZhWiY8A1pqiMS+k/Htr/Ry1VXMhEVSqUu3avIzFl84c+LTWro/P1kHVMejD7F7eXSP2P0v9JvzQP1lfED4PFSRyVB3PFk81EkOAplfiLCH4K2l8njNUHwvku3nimfatg/F1J7G/lGqFab/IXlAudxJoz3ofMXaMy+IUXFVOhzXnSxo+JHj4gOBMlrp3xAj1CB3N+LFAzB9XR0Hr3GPHJ0i6rdhttdDqT2+KcwcCw2Eww=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(376002)(136003)(346002)(396003)(84040400005)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31696002)(38100700002)(8676002)(66899024)(86362001)(8936002)(2906002)(6512007)(53546011)(33964004)(83380400001)(6506007)(30864003)(26005)(316002)(66946007)(66556008)(66476007)(4326008)(966005)(5660300002)(2616005)(478600001)(166002)(6486002)(41300700001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDQzR1FCMkFKSVhFV0N1aFJSRkJwYkRIZmpLdXF3NEVIZmdiVk1ueTl5b2Rr?=
 =?utf-8?B?ZUJobUpFTHJCaGJ6cUlPRnp4aFA2SDl3TmRkTzQvTW1tK2VpZmRIR3ViK2xN?=
 =?utf-8?B?c0FoZFhJWHFxUjl4NmNpVTJtNmxXbHFQUGN1QUlTVGhwZ2FaYUEyQWdsMWlJ?=
 =?utf-8?B?Q3FDMEs0MVRhTm1VSytZd1BKN0VUbkgrQnd1cHFFMzA4VC9odkx1OGg3bVM4?=
 =?utf-8?B?Y2tNN29IYk1EaWVCMFpmMUwvQ2M0b0ZjSkl0QXdDQ3BocnU2WEh4dHluSHlH?=
 =?utf-8?B?bkcrbzVrRE5mblBTNjlHYVpXM0c1TmtrYU00ZlFjSGFoZWtFZm4xM0g4ZmRz?=
 =?utf-8?B?eVJDN0o1Ym1qYjZJaXo3VTJVa0gzY015K2lGZ1dhUnBvaUphNS9xbEYxUEtP?=
 =?utf-8?B?djZZSEZLRE5kRHQzMXdBQUI5aElBTUlwc1J0NmZkMXEvRlhNK1p3SjVkSnV1?=
 =?utf-8?B?OExXeENJMG1FYyt4clhSZ1ZKSFowS2lvZ1ZhU2M3Y3NNOUdoREpnSHNMQzNZ?=
 =?utf-8?B?QlUzV3RnZmx1RFY1Ylh1S0Y5OVg5MytVVm1HOERabTF2dVQwR3BBeXpwL2Zw?=
 =?utf-8?B?NVdqMkZBSmJOSUt6bTVOZkY2WFVGTnRFOVMzSktka3FybFRwaW1rb2dhT0tx?=
 =?utf-8?B?eGN3M2xMMTBGMXZxM2xRSGRUdlk0UEJDZGJiSExjcUIrczFnOHgrZVdzNFpj?=
 =?utf-8?B?WllYVzJIajZtMkd5Mi9xdXU3Q20vYkNiS3diOENsOXROYVFWNjAvbVVEU3Bj?=
 =?utf-8?B?T0cxejFWMnArZGNlMUNtNlR3Ly9VZjVNR3E1Wm5haTYvSHZBZDd5bS9SL21Y?=
 =?utf-8?B?SjFyemZpSzZNaGc1U3JWTW1uRkJ2eGhSekRhVmZ2NDlRWkRhaHNwTm94dHhx?=
 =?utf-8?B?OFpPVVJhT2Y2Sm8rNUdIVWo2YXRBNW9NTElmTkpPSEZHV2NKbzhNdEJtU3Jo?=
 =?utf-8?B?S056VUQwLzAxVmdjTENzdGJ2TjVEc243RkJOc2ZaVmQ1QjJ4dzRzVENuQnlD?=
 =?utf-8?B?NFlwdzFnVnk0dlVlMFlZTWROa0lzQmpLM2Zsdm5qbjdXaVh5eDVIWjlWTnRi?=
 =?utf-8?B?TWJCb0U4UzRtWkVrWXltUE5XM0hCQnEvNVRZMWgydnl5ZWlkcTkzR0dFK2ts?=
 =?utf-8?B?S0RzL3NEaXc4eDhIc1pTSUdVMHo2SzhMSmdOZHVRRGVsVVlaeE5OOE1MMnpr?=
 =?utf-8?B?TUF5UkF2UjdyZ0M2Qy94QWM2TDdrRFh0RlNNMUV6ZDY1SnBRb0p4ekRQNGJy?=
 =?utf-8?B?T1RGSWZacUFEMnRUVjFnbldMOGRlQ3lQOGEzUjhxZnFQZmMxZGxjRlUvS0Vk?=
 =?utf-8?B?RnFRUUNocWhhOVhzc3lwNkthc2VDZGU2ekM2SDV0d09KZTc4RERSdUFNNFR3?=
 =?utf-8?B?LzZVSFRZc25mQ1BRWmpQNDFPL0EyNGdjaktlRDZVeVJXUktRM2lYZ1VRNnQy?=
 =?utf-8?B?cENrekJDU3l1L2J5dnZSMmQwWkNwZ3pBK0RBNDQzakQ0Sm1leTZYTENZQm1B?=
 =?utf-8?B?RUFENlplQjh1ZUdDRTNyR1kva0ZrSXd1dXNMendPSFlPaUttUTlVVStOTzBB?=
 =?utf-8?B?Y0g1NGxNRCtNY0NhN0d3QS9ZbzE3RU9tV3RoTW8yYk9oSW0yUWtYWUJtQm5D?=
 =?utf-8?B?QlFZUTFEU3JSUHB1OGxGR1FaOEhPRTlEL01KVDRhTzNQZXd2c2R2TGNuMCtO?=
 =?utf-8?B?SDRkSnZJUm1jbzB5SmIxa0pabVBpNGxZV2VLZzc1T3M0WHdBSjRWYk1VcW51?=
 =?utf-8?B?Q0J5QmkrVk9uSjkvc2txNDNJM3dlaTY1QVdMNjd1Q3I4cGVPOUJSRFViajBI?=
 =?utf-8?B?ZElKR2dqbW4xSC8wTzRocTJNUDVlQnBvVUFLeC95eHNhU2pObGtqbXY2eE5O?=
 =?utf-8?B?TWJ3clB6b1AzWUZDa2FEV2l2c043aE1XSHl5eCtHa1NLTjlzdXZ6M0NSZ3V0?=
 =?utf-8?B?Q05OOGNBOWJZQUxsaDhHZkxNODN3aDVZbTZlcGhZVkNQS21aUWNYem02bnln?=
 =?utf-8?B?ZjNteGhKMkFVTkVNclRRMUphKzJBR3kxZDFWaGtGbi8wNVV4ZVlKczg2cWVy?=
 =?utf-8?B?cHpzd3Bsd3VpTGdQV3JlSHJsVkVVajRiSVQveGVqaWlXMFN2a0hMQlNFc2hM?=
 =?utf-8?B?dlkyK1RsTlBGK2lSTkZjVXdRbVZST3N0OFo1bVI3RjhUdGk2VndjK1M1em9x?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56925fc4-a3e8-4f39-6a79-08dc188a61cc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 01:03:00.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6y0huafkRhV+oRBSfTVCGYcWIaQpPJfbAzkzpSh+z3LAF3A3WMU3xS0DuttBlAiMJwQEpIWatYrSdX/3NPKniRbcwfVkjiPDuiqlMvZnq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6967
X-Proofpoint-ORIG-GUID: hrokLz43WH0uJ0p3k-PvKKpDfJ-1k-bl
X-Proofpoint-GUID: YYQO2dpWMvaeFq1CYrvt_rlxuIfbps1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_12,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401190005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 01:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194003

--------------7B50stWlNL0J3YI5siA5sY7Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40INm7EH022536

On 2024-01-17 11:09 a.m., Steve Sakoman via lists.openembedded.org wrote:
> On Wed, Jan 17, 2024 at 1:47=E2=80=AFAM Hitendra Prajapati via
> lists.openembedded.org<hprajapati=3Dmvista.com@lists.openembedded.org>
> wrote:
>> Upstream-Status: Backport fromhttps://github.com/openssl/openssl/commi=
t/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db
>>
>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> ---
>>   .../openssl/openssl/CVE-2023-6237.patch       | 127 ++++++++++++++++=
++
>>   .../openssl/openssl_3.0.12.bb                 |   3 +-
>>   2 files changed, 129 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-202=
3-6237.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.p=
atch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
>> new file mode 100644
>> index 0000000000..621dc6b0ab
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
>> @@ -0,0 +1,127 @@
>> +rom e09fc1d746a4fd15bb5c3d7bbbab950aadd005db Mon Sep 17 00:00:00 2001
>> +From: Tomas Mraz<tomas@openssl.org>
>> +Date: Fri, 22 Dec 2023 16:25:56 +0100
>> +Subject: [PATCH] Limit the execution time of RSA public key check
>> +
>> +Fixes CVE-2023-6237
>> +
>> +If a large and incorrect RSA public key is checked with
>> +EVP_PKEY_public_check() the computation could take very long time
>> +due to no limit being applied to the RSA public key size and
>> +unnecessarily high number of Miller-Rabin algorithm rounds
>> +used for non-primality check of the modulus.
>> +
>> +Now the keys larger than 16384 bits (OPENSSL_RSA_MAX_MODULUS_BITS)
>> +will fail the check with RSA_R_MODULUS_TOO_LARGE error reason.
>> +Also the number of Miller-Rabin rounds was set to 5.
>> +
>> +Reviewed-by: Neil Horman<nhorman@openssl.org>
>> +Reviewed-by: Matt Caswell<matt@openssl.org>
>> +(Merged fromhttps://github.com/openssl/openssl/pull/23243)
>> +
>> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/=
e09fc1d746a4fd15bb5c3d7bbbab950aadd005db]
>> +CVE: CVE-2023-6237
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + crypto/rsa/rsa_sp800_56b_check.c              |  8 +++-
>> + test/recipes/91-test_pkey_check.t             |  2 +-
>> + .../91-test_pkey_check_data/rsapub_17k.pem    | 48 +++++++++++++++++=
++
>> + 3 files changed, 56 insertions(+), 2 deletions(-)
>> + create mode 100644 test/recipes/91-test_pkey_check_data/rsapub_17k.p=
em
>> +
>> +diff --git a/crypto/rsa/rsa_sp800_56b_check.c b/crypto/rsa/rsa_sp800_=
56b_check.c
>> +index fc8f19b..bcbdd24 100644
>> +--- a/crypto/rsa/rsa_sp800_56b_check.c
>> ++++ b/crypto/rsa/rsa_sp800_56b_check.c
>> +@@ -289,6 +289,11 @@ int ossl_rsa_sp800_56b_check_public(const RSA *r=
sa)
>> +         return 0;
>> +
>> +     nbits =3D BN_num_bits(rsa->n);
>> ++    if (nbits > OPENSSL_RSA_MAX_MODULUS_BITS) {
>> ++        ERR_raise(ERR_LIB_RSA, RSA_R_MODULUS_TOO_LARGE);
>> ++        return 0;
>> ++    }
>> ++
>> + #ifdef FIPS_MODULE
>> +     /*
>> +      * (Step a): modulus must be 2048 or 3072 (caveat from SP800-56B=
r1)
>> +@@ -324,7 +329,8 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rs=
a)
>> +         goto err;
>> +     }
>> +
>> +-    ret =3D ossl_bn_miller_rabin_is_prime(rsa->n, 0, ctx, NULL, 1, &=
status);
>> ++    /* Highest number of MR rounds from FIPS 186-5 Section B.3 Table=
 B.1 */
>> ++    ret =3D ossl_bn_miller_rabin_is_prime(rsa->n, 5, ctx, NULL, 1, &=
status);
>> + #ifdef FIPS_MODULE
>> +     if (ret !=3D 1 || status !=3D BN_PRIMETEST_COMPOSITE_NOT_POWER_O=
F_PRIME) {
>> + #else
>> +diff --git a/test/recipes/91-test_pkey_check.t b/test/recipes/91-test=
_pkey_check.t
>> +index dc7cc64..f8088df 100644
>> +--- a/test/recipes/91-test_pkey_check.t
>> ++++ b/test/recipes/91-test_pkey_check.t
>> +@@ -70,7 +70,7 @@ push(@positive_tests, (
>> +     "dhpkey.pem"
>> +     )) unless disabled("dh");
>> +
>> +-my @negative_pubtests =3D ();
>> ++my @negative_pubtests =3D ("rsapub_17k.pem");  # Too big RSA public =
key
>> +
>> + push(@negative_pubtests, (
>> +     "dsapub_noparam.der"
>> +diff --git a/test/recipes/91-test_pkey_check_data/rsapub_17k.pem b/te=
st/recipes/91-test_pkey_check_data/rsapub_17k.pem
>> +new file mode 100644
>> +index 0000000..9a2eaed
>> +--- /dev/null
>> ++++ b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
>> +@@ -0,0 +1,48 @@
>> ++-----BEGIN PUBLIC KEY-----
>> ++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
>> ++AQAB
>> ++-----END PUBLIC KEY-----
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/met=
a/recipes-connectivity/openssl/openssl_3.0.12.bb
>> index 4602151d91..b1de72afd0 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
>> @@ -14,6 +14,7 @@ SRC_URI =3D"http://www.openssl.org/source/openssl-${=
PV}.tar.gz \=20
>> file://0001-Configure-do-not-tweak-mips-cflags.patch \=20
>> file://CVE-2023-5678.patch \ file://CVE-2023-6129.patch \ +=20
>> file://CVE-2023-6237.patch \ "
>>
>>   SRC_URI:append:class-nativesdk =3D " \
>> @@ -259,4 +260,4 @@ CVE_VERSION_SUFFIX =3D "alphabetical"
>>
>>   # Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.3=
7
>>   # Apache in meta-webserver is already recent enough
>> -CVE_CHECK_IGNORE +=3D "CVE-2019-0190"
>> +CVE_STATUS +=3D "CVE-2019-0190"
> I took the initial version of this patch.  Patchtest mistakenly called
> out CVE_CHECK_IGNORE as an issue, it is not an issue for kirkstone
> since CVE_STATUS is not implemented.

CC Trevor in case he wants to fix that.

../Randy

>
> Steve
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193933):https://lists.openembedded.org/g/openembedd=
ed-core/message/193933
> Mute This Topic:https://lists.openembedded.org/mt/103783757/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------7B50stWlNL0J3YI5siA5sY7Y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40INm7EH022536

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-01-17 11:09 a.m., Steve Sakoma=
n
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZgVkLg6S0i=3Dh-kxrrhdJkG=
YPVJyz3dbRearaZNxdbYqQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Jan 17, 2024 at 1:47=
=E2=80=AFAM Hitendra Prajapati via
lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
hprajapati=3Dmvista.com@lists.openembedded.org">&lt;hprajapati=3Dmvista.c=
om@lists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Upstream-Status: Backport =
from <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openss=
l/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db">https://github=
.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db</a>

Signed-off-by: Hitendra Prajapati <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 .../openssl/openssl/CVE-2023-6237.patch       | 127 ++++++++++++++++++
 .../openssl/openssl_3.0.12.bb                 |   3 +-
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-62=
37.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
new file mode 100644
index 0000000000..621dc6b0ab
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
@@ -0,0 +1,127 @@
+rom e09fc1d746a4fd15bb5c3d7bbbab950aadd005db Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:tomas=
@openssl.org">&lt;tomas@openssl.org&gt;</a>
+Date: Fri, 22 Dec 2023 16:25:56 +0100
+Subject: [PATCH] Limit the execution time of RSA public key check
+
+Fixes CVE-2023-6237
+
+If a large and incorrect RSA public key is checked with
+EVP_PKEY_public_check() the computation could take very long time
+due to no limit being applied to the RSA public key size and
+unnecessarily high number of Miller-Rabin algorithm rounds
+used for non-primality check of the modulus.
+
+Now the keys larger than 16384 bits (OPENSSL_RSA_MAX_MODULUS_BITS)
+will fail the check with RSA_R_MODULUS_TOO_LARGE error reason.
+Also the number of Miller-Rabin rounds was set to 5.
+
+Reviewed-by: Neil Horman <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:nhorman@openssl.org">&lt;nhorman@openssl.org&gt;</a>
+Reviewed-by: Matt Caswell <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:matt@openssl.org">&lt;matt@openssl.org&gt;</a>
+(Merged from <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/openssl/openssl/pull/23243">https://github.com/openssl/openssl/pull/23=
243</a>)
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aa=
dd005db">https://github.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d=
7bbbab950aadd005db</a>]
+CVE: CVE-2023-6237
+Signed-off-by: Hitendra Prajapati <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ crypto/rsa/rsa_sp800_56b_check.c              |  8 +++-
+ test/recipes/91-test_pkey_check.t             |  2 +-
+ .../91-test_pkey_check_data/rsapub_17k.pem    | 48 +++++++++++++++++++
+ 3 files changed, 56 insertions(+), 2 deletions(-)
+ create mode 100644 test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+
+diff --git a/crypto/rsa/rsa_sp800_56b_check.c b/crypto/rsa/rsa_sp800_56b=
_check.c
+index fc8f19b..bcbdd24 100644
+--- a/crypto/rsa/rsa_sp800_56b_check.c
++++ b/crypto/rsa/rsa_sp800_56b_check.c
+@@ -289,6 +289,11 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
+         return 0;
+
+     nbits =3D BN_num_bits(rsa-&gt;n);
++    if (nbits &gt; OPENSSL_RSA_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_RSA, RSA_R_MODULUS_TOO_LARGE);
++        return 0;
++    }
++
+ #ifdef FIPS_MODULE
+     /*
+      * (Step a): modulus must be 2048 or 3072 (caveat from SP800-56Br1)
+@@ -324,7 +329,8 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
+         goto err;
+     }
+
+-    ret =3D ossl_bn_miller_rabin_is_prime(rsa-&gt;n, 0, ctx, NULL, 1, &=
amp;status);
++    /* Highest number of MR rounds from FIPS 186-5 Section B.3 Table B.=
1 */
++    ret =3D ossl_bn_miller_rabin_is_prime(rsa-&gt;n, 5, ctx, NULL, 1, &=
amp;status);
+ #ifdef FIPS_MODULE
+     if (ret !=3D 1 || status !=3D BN_PRIMETEST_COMPOSITE_NOT_POWER_OF_P=
RIME) {
+ #else
+diff --git a/test/recipes/91-test_pkey_check.t b/test/recipes/91-test_pk=
ey_check.t
+index dc7cc64..f8088df 100644
+--- a/test/recipes/91-test_pkey_check.t
++++ b/test/recipes/91-test_pkey_check.t
+@@ -70,7 +70,7 @@ push(@positive_tests, (
+     &quot;dhpkey.pem&quot;
+     )) unless disabled(&quot;dh&quot;);
+
+-my @negative_pubtests =3D ();
++my @negative_pubtests =3D (&quot;rsapub_17k.pem&quot;);  # Too big RSA =
public key
+
+ push(@negative_pubtests, (
+     &quot;dsapub_noparam.der&quot;
+diff --git a/test/recipes/91-test_pkey_check_data/rsapub_17k.pem b/test/=
recipes/91-test_pkey_check_data/rsapub_17k.pem
+new file mode 100644
+index 0000000..9a2eaed
+--- /dev/null
++++ b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+@@ -0,0 +1,48 @@
++-----BEGIN PUBLIC KEY-----
++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
++AQAB
++-----END PUBLIC KEY-----
+--
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.12.bb
index 4602151d91..b1de72afd0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
@@ -14,6 +14,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
http://www.openssl.org/source/openssl-${PV}.tar.gz\file://0001-Configure-=
do-not-tweak-mips-cflags.patch\file://CVE-2023-5678.patch\file://CVE-2023=
-6129.patch\+file://CVE-2023-6237.patch\">&quot;http://www.openssl.org/so=
urce/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2023-5678.patch \
            file://CVE-2023-6129.patch \
+           file://CVE-2023-6237.patch \
            &quot;</a>

 SRC_URI:append:class-nativesdk =3D &quot; \
@@ -259,4 +260,4 @@ CVE_VERSION_SUFFIX =3D &quot;alphabetical&quot;

 # Only affects OpenSSL &gt;=3D 1.1.1 in combination with Apache &lt; 2.4=
.37
 # Apache in meta-webserver is already recent enough
-CVE_CHECK_IGNORE +=3D &quot;CVE-2019-0190&quot;
+CVE_STATUS +=3D &quot;CVE-2019-0190&quot;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I took the initial version o=
f this patch.  Patchtest mistakenly called
out CVE_CHECK_IGNORE as an issue, it is not an issue for kirkstone
since CVE_STATUS is not implemented.</pre>
    </blockquote>
    <p>CC Trevor in case he wants to fix that.</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZgVkLg6S0i=3Dh-kxrrhdJkG=
YPVJyz3dbRearaZNxdbYqQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Steve
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#193933): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/193933">https:/=
/lists.openembedded.org/g/openembedded-core/message/193933</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/103783757/3616765">https://lists.openembedded.org/mt=
/103783757/3616765</a>
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
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------7B50stWlNL0J3YI5siA5sY7Y--

