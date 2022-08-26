Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04EAECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 01:18:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.32069.1661476682643384556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 18:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SAz5pjJj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5237bd7a43=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27Q1B53T030803
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 01:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zvLuEqdk0wak42+LP7xMxZtRJivg0DQ3TP5cEZnxcMQ=;
 b=SAz5pjJj9JioBL8BxH4nBeF6m1zdckps27YjWR8L/F/014C3+phu8xFUF8rFWFG7sDSY
 t39GvRddH22iijFDwlUnJ7iz+oN/c0P1MqX3NB5MawgKGaNcDtjkKxIbYK0C3fwmfvY3
 NVCA+/b6Cx1oIV9JTx2PjbHpR1Ok5S7O3f97v/YbyHkoKUoKzFaxSyS7L46qBGeH0uOz
 mnfE5eJpx38FtW9lyS9HYEBrY8EVK5BewbqovPzZRsB6I+bH8RJ4JEvzhbZPL5TVx/st
 NEd+uyNJNkL9YI28eQNJYsCbVW6/UCDQuMzKSdsb/IP39/j0P3wCqFKY47zcmPsi3foa rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53ryj8xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:18:01 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27Q1Hxpe010620
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 01:17:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53ryj8xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Aug 2022 01:17:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCihlgMLlJuRVPdgMFgc+CkWAy1COG8EmcQq12waqzMnN/tq9R2UB63WlDbF8AJFinqHUpdil9WTAMEOl4sx9GPv6rwOJLsAwFrMZZOh09BTvpKycUyDA/uuTBfLT7qsJ/elOYl5lwqjglxeygvYjxZ9gVhLYFSeQrqbT5AcqvcLdP/D7UcjJjlgZ7qYKFF4e/b3eP4PHquEVCASLVgnlTOGjsrrnXn2p2Y0nheXBYFKET0hdBnFyJmKBhnHElxQoYDtnYK2q0kyn/597WaWEYzo1f/ugxFDxOd41lmFzvZP+iQI/OW4bhF6dv2/k5K7RvJfJwIcvVEbz9UwWRKkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvLuEqdk0wak42+LP7xMxZtRJivg0DQ3TP5cEZnxcMQ=;
 b=Xfn1/taDHuM3c7kFaU/dL2lCHeP5aPgYSGQxthqWLBr8QbIY8+q9ZKoIIHzPbpSa3squl2/HD8mL9T/UNybDA+gC499yBNaQUER0+phAvREiSws2ULAqbAQvpmPqlW1SJb9RRysh1iKOTRX40Oyk78tfHIgVRHwGvvWGcRcg1d1Ie2q9SR3Uzv9W8I+2RC9UO/FkLf8y6D+eDjAa+TLXWdgJk7cCsLRnRrliAGoyq2xf3rKsHqgA/tQNg78RfM7w11SYgIMrJhGs1FTDc1eLaO1/Q89G06GZ0u+Q39aGSY0KuPRst2g06itv/8EirfZ9Ul54p6t94f+BgyneRUX17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MWHPR11MB1615.namprd11.prod.outlook.com (2603:10b6:301:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Fri, 26 Aug
 2022 01:17:56 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5546.022; Fri, 26 Aug 2022
 01:17:56 +0000
Message-ID: <e57b55a2-983d-29b5-605e-96efd4a1a93d@windriver.com>
Date: Thu, 25 Aug 2022 21:17:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
Content-Language: en-CA
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        OE-core <openembedded-core@lists.openembedded.org>
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
 <6eac7847f432cc60d66c9afba010308818bbbb46.camel@linuxfoundation.org>
 <CANNYZj91fDezS+i1tdX7zZ1B6M_roVgn3wh5gHyNzkj=rn-BFw@mail.gmail.com>
 <0e3c6ff17930e446338e75dc4bf6f6d4bf53c166.camel@linuxfoundation.org>
 <9b77dad2-3e98-02db-d248-822bc8b3e138@windriver.com>
 <CAMKF1soOjRBF9yPrNQrjHDzn+HYS4TDvnyzoqTX8viK0_yXMQw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAMKF1soOjRBF9yPrNQrjHDzn+HYS4TDvnyzoqTX8viK0_yXMQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80b59474-9f99-4be2-aebe-08da8700ce62
X-MS-TrafficTypeDiagnostic: MWHPR11MB1615:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CHakEx/WwPKS9fWA+GEDaIE5uOXNuVdyYnOSyscj5EWW/nKt0idMMLqtQfVNYimrA78wf9cPZg+jipVzL+1eeL++SijX51F7CoP+Udo1SAekLuS/nyyhpwL1Y4Wvw1ka1jdZtl6KW2zuL5aLjVJtRH85otXM5Hq+TAtvat9UfTlymW70dfwmulWQFgHKbd54CsHjl+ycTE33zdGkYFtMV/3vrpNE+RlkDjHny3h2A06M5XCx2yqx/52AlgrH13TYlbDQdqS+hQeG8GS8rs5IXZEhqqfXDcSO5nojso+BwrXe19p89+yXOqzPojNs6qceesCAFLi3PrTuvDlDsrKa1KNenxYASrZDYe9djD4/wN1XHIUzfR4pAQSi3spqfADyjrKNxbsmeUuVMvHSf3JtSw5ZHd2ZuxgvzBgudIjkgmE7cZ/tJYT/6JxLAUJfliHO9Qq+glFwQ8FtdQ4jofaBHqgfPiIQ7m7TcJvvLF6BvNUORaVGj8JTUcEEcDScpPPshL97jLcqKYTCMdoMc8CTzN/ie7gKP2A+nvZu0/dsGankQuSJp0Q9S9BUff+azs2hiMMI9UkdtdEHaqdlQG39Amy9AJGIPfQkx6TZLQlqyp/SppA45M5pvwbdkJrfjGXsnlaaDjhPrVbVH6KcZ0Uw7HDbiXyvE4JPIdE04DjF2xYRLdttaUOue/XyGbZksS+9yQ3fs5sUb55cosYCt/7JPiEnhukv74o9NQPnyXCUeht2DZkouvJkE8qWa3RYEC5oTSHKLFDmOf3ZUfA/EzwSDTmRoeSbDbB24Upg0+9tG5RI+3wq4/pr4xrPAVsuuhJAja286SEbqxiYm5Cn2+p6Qs3i9VIP50J38dlEawZU/qxjo4yV5eyC3GCZDkxoaVNtIcnvCwtcsA5hEz+VkNj9qA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(396003)(136003)(376002)(366004)(2906002)(31696002)(5660300002)(6486002)(41300700001)(966005)(478600001)(6506007)(86362001)(6512007)(52116002)(53546011)(26005)(6666004)(38100700002)(38350700002)(186003)(2616005)(8936002)(83380400001)(8676002)(31686004)(66946007)(4326008)(36756003)(66556008)(66476007)(316002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2dmWVVVNGtQbHdrR2JWczM4bmUvYXk4V3JRRTNIb1hlT2lXK3NOcW1WY2Q2?=
 =?utf-8?B?N0ZxS1BGRHJsMVRYNFI4aWU2bFpVdEx2MytpTG04Zlllc3dQR1BrSU9TQTNP?=
 =?utf-8?B?WjlLZnZlT1pwRG5oYzR5MTJ0TmNPVFNkYitaSGZGQVBEaEFiS1gwUWhoeEtk?=
 =?utf-8?B?OTk4MkZrLzRHeUhoZEdlV0xRalAxMldkVHNRMzU3NG0rRjN1SGIrUVkvcWM5?=
 =?utf-8?B?V1pFVzZhenlBUlZwSjczellpaEVkaDhjUWE2M0xGM0V3cGZ6dHhQZ1d0RHd3?=
 =?utf-8?B?VnhXQVRqSGJFQTE4eWxmQmVVaURLKzRSWlNleDdJa3Rhc1RENVZQY21OMmdo?=
 =?utf-8?B?c1oybllYVm5Qa2xncjlvM0Q0Nm5hTjIxL2J1VHpUQXBiZDI1MytBazhuUGhX?=
 =?utf-8?B?YU01dWZuaTlkdXNJd1JST2Vza0Zwd2xWeU52dXk4OHpYaDI2Tm12Sk03Sytu?=
 =?utf-8?B?NU40RzIvRWxLOUd6aWJySjNQN21ta2NyWVlJaCtRd3hha1FvLzQxK2crWnA2?=
 =?utf-8?B?NHRvWGoxQXlmMm04QXBDK1B3amN4OFQ4aDExakZMd0FEOExCZWJXNnFMTWVk?=
 =?utf-8?B?N0ZSN3I4ZDBDclBkSG1ScWVVNVNVN2dHb2k3MHZpU3F6bGJ2a3JhNXpZU25W?=
 =?utf-8?B?WnRZUG5pZEUzVldSbkxmaGdYcHpweDkwRVk1cEZCRDJmZXE2Z1VnSlh3bUxR?=
 =?utf-8?B?QjR2cnUzd2YrbWt3Vk1CREd5YnVQQmpVYXFmbFNsQjBWZGRwREl5Ni8zZ1Ux?=
 =?utf-8?B?dDdMYWVwMkV2ems4MEp6ditLN0FRcElDNWM2d1REOFo5K2Nsb0QrMW93TUxR?=
 =?utf-8?B?cG56azFlSEZEOWt5aEphbStrTjJUK3NsY2tMTy80aUhkck1IMzNuZ0RDS2Vi?=
 =?utf-8?B?WVQ3WjR1OFJQRDBoV1VvNDUwUHVmZzdSZndPVzRYZ3djdUVpSmxUN1VNdmQ4?=
 =?utf-8?B?aXN5ZGsxUHZPY3RWWFFDaytCb3d0d3I2d09TbThMU1Y1ZHV3MjIxcjJpdll2?=
 =?utf-8?B?TmRpdWllUnJua0Z6K2VtRFJ5UlZrdFlRSWZxOUpTUk5RUWRzakJmTHREVWc5?=
 =?utf-8?B?MlNSMm1XUDlraUxSYUR2d01iZExDRDZWYjBNWlBTcUt6WWpQQ1diMGx6THY2?=
 =?utf-8?B?WE9KOHcvY2dPekk2dXVVVFlYSXpsbWo0ZWh3WUczZWcxTXVPakIrQkI2MUVG?=
 =?utf-8?B?aURqbXF2dFIyVTFaY2dTY2xTRWEzOTE0eHdZRjJlcHRUT3AwZUF5UDgxVklT?=
 =?utf-8?B?c1M3VjdxSDJZNE1FV01CdkFVT2VJZXhXVVlaYkpEUzJqa2RYZXJ6TnJXcGNR?=
 =?utf-8?B?bWRsVysrRzBPVEJaclFJME83TnJHQUZDczFSV3V6eC92QXRsdStDaHZqQk83?=
 =?utf-8?B?eklXQ0ZyZ1o1dFg0dEY0alRzY05WSnRicmNsTGJpM1RCV3E1cFhNK3ZvVGV3?=
 =?utf-8?B?MHlhdW52Z0h3bWRBN3NieE5MQ3RxdmlmSjNob3FIMnpwS0ptUm54Rmo2OWF0?=
 =?utf-8?B?Z1JXODFnMjBUMlhwR0lyRnFEUWVyNk5heEJ4WlF4MTlCQUdKR21QbDhWQUVi?=
 =?utf-8?B?M0V0QVhyTTNZc2FzTEhNUGpqbDJObjdhNW0vcmFDY2l6SjFVU1IwejNlaTRh?=
 =?utf-8?B?REI4aUJMVzMvK1lSV3BFUXo1a2theTNER0Z5ckhrdzVwM0tkK3JoMFFkdWYr?=
 =?utf-8?B?WjIyR2EyY2o0UVlYWi96OUJqRE9JaWQ5a0o1dEdOSzZWczczM2pxdnpkWWYz?=
 =?utf-8?B?dE94dUZDUXJwM0JDMUZYdnZINzhDZVpTVUZGYWM2YXdVZFlmSHNydUljMisx?=
 =?utf-8?B?WjZTL0k3Y3RUKzZiTG9vaXNZb213R1RWdmNCZ2l0dm1HWDRYdGVROHBMWjc5?=
 =?utf-8?B?Z1FKSWdoN2J1Zis5aEtocXRYU09iVHpOU0ZZOGIvRFVMQ0Z4d3A3VndYbGQ5?=
 =?utf-8?B?SSs1c1E4MHdFRmpQZzYxbFErNENGYkxGTmFoQXZQak9XQWZxd09jdkk1U2xT?=
 =?utf-8?B?Q3lvYTc4S20xVU92V2dTYnZQN2RXYmJLUE5hQy9IODFWTFV3bWNrWHVwTEtZ?=
 =?utf-8?B?ckdIMjNBVWFuVGJMb042L1NPdmVGcnVVQ3FWTzVBN2IzakxwcjlwMTF2RzhY?=
 =?utf-8?B?UzhvQnJKcDJudmt2ek5YZnZ1UXRBVmRHNW9URDV4akZpblZjVElNODByYllp?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80b59474-9f99-4be2-aebe-08da8700ce62
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 01:17:56.0076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m/OcrudJbZfxazHJuM6LIxf/5lCZX0SUGjJDLcPDwO4nyALJcdWgCDtERBRuQyxgjcgrgMBf9/zBvHFmMT7RiDwvB9K4chMUuYj3WgkkGfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1615
X-Proofpoint-GUID: 13TMjQ5jODK4g32033ye-FNkMBwOgONY
X-Proofpoint-ORIG-GUID: _-xB5o8OUoBe0PJcduIbkDtpa-Z0Cx7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_11,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208260003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 01:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169899

On 2022-08-25 19:24, Khem Raj wrote:
> On Thu, Aug 25, 2022 at 12:11 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 2022-08-25 07:53, Richard Purdie wrote:
>>> On Thu, 2022-08-25 at 13:04 +0200, Alexander Kanavin wrote:
>>>> On Thu, 25 Aug 2022 at 12:59, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> The usptreamable version of the patch would probably be something which
>>>>> splits the target names in no_atomics up into components and matched on
>>>>> subsections of it rather than the whole string. My rust isn't really up
>>>>> to doing that though.
>>>>>
>>>>> I didn't really want us to maintain a separate list of targets which
>>>>> have atomics issues given it and the list in no_atomics would get out
>>>>> of sync very easily too.
>>>> But then the same patch needs to be applied to (and maintained
>>>> separately in) librsvg - and everything else that includes a copy of
>>>> crossbeam. Perhaps it's worth to at least make the above suggestion
>>>> about making it upstreamable in the patch commit message?
>>> Yes, I can improve the patch header. I do understand the patch isn't
>>> ideal.
>>>
>>> The alternatives are:
>>>
>>> * we take my patch
>>> * we break powerpc, mips, armv5, riscv32 and others
>>> * we drop the rust upgrades (the latent problem still exists)
>>> * we rewrite the patch
>>>
>>> For me to rewrite the patch, I'll need to learn more rust. I'm sure I
>>> can do that but it will take time and that time is time I can't use for
>>> other things.
>>>
>>> I'm hoping that by explaining the issue and documenting it, *someone*
>>> would step up and work out the upstreamable patch. This hasn't worked
>>> well for the rust recipes so far as I've had to do a lot of work to get
>>> them more into shape. I'm hoping the problem was just the shear scale
>>> and now issues are in easier smaller pieces others can/will help. It
>>> will certainly be time before someone else can schedule that in, we
>>> don't have anyone who can do it now.
>> Yes, with the range of things I have had going on, re-writing the
>> rust classes/recipes was too big a task to consider. However, I can
>> and will work to get this patch into a form that is upstreamable.
>>
>> I've created a bug to track that:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14904
>>
>> and at least started to look at some of the code!
>>
> Also opening an issue upstream at
> https://github.com/crossbeam-rs/crossbeam
>
> would be a good thing. crossbeam is vendored by many rust packages and
> we will end up spewing
> the all such recipes with the tweak in addition to regenerating the
> checksums in toml files with every
> upgrade.

Agreed and noted in the YP bug.

../Randy


>
>> ../Randy
>>
>>
>>> I will say that I'm really really tired.
>>>
>>> I have a ton of autobuilder failures and in order to resolve them I'm
>>> rewriting patches many times over, first to get them to work, then
>>> taking review feedback and people complaining they're not perfect or
>>> don't fix other issues. I have a pile of other problems like this.
>>>
>>> I appreciate the desire not to have patches, particularly when they're
>>> as painful as the rust ones are. I appreciate the patch can be improved
>>> and should go upstream. I was hoping to take some time off tomorrow but
>>> it looks like I have other things to do (in reality probably on the
>>> weekend, I need to rework the llvm patches too and both sets take hours
>>> in rebuild time even to test).
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169885): https://lists.openembedded.org/g/openembedded-core/message/169885
>> Mute This Topic: https://lists.openembedded.org/mt/93245408/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
# Randy MacLeod
# Wind River Linux


