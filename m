Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9C9C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:06:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26784.1707861978839049366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 14:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=C1H5YG9d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27731d4e0c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41DI7ZcU003850
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=nyaH0PB3/XtCQk2yNqc
	ZYmh8JbEeD53e8UozmDqFXME=; b=C1H5YG9djNuExwYxPYSypvAsLV4gXHwM6d7
	8eYZqUzaICw1OoHbS8rpsxniz/Vh9eMaIHS3NyeuAc5LGr3e/+5lx4kimQOZWKQV
	h/VeyvAaQHBhc6R6Cazh3DCRxpP2IfZ0i0A/jQrN5rP5l7YOVDrPVELI81VXHOHH
	8CpSYD0plOA5tF7spL6RDi8mMNbby3naYWrZmBT9cXV5etyUvc3pobaJbY/XbgHD
	hsQz0vYUzD5/MOCJVQeL6Cjgb3sd8LFNC1AZtuURYfGOhR3ROCclldkEa4DA76++
	u/modeR8e0dpqwpFudlginXUhjjWlrhn9kD9PxxqdxagvJu/1yA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w6046u65y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:06:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMpEQMjR3FZ/x8QA425AuDZam/I6sIBXJRu6XZ6aQuHFnUUEICHOu7nk9tJiYZJQeP4Pguz4oeJkwNCAbwC45JiDOT2gPg1OXK68dAkU9HKov6t10Gwm7JAoJjiX6oh9DlmBXvEq9OgUUif74B2czjE0FeigAL/Dsc1MetFL+v3bv2zDEfanUm+2d9SFQVm10p6HvnoYR9E7Ipefe/PDv1iqOzWMyuQTYs2V2G66xjob7wV9CbECnAHzo4xmZ9Fo4n4oNUQhVWBI/1WEYOAqZ2lMBVnfEZrk4i4/sffVlqdHjmbzZr/cI/7PHti/nKKci9Ibd9E67/YEPF64b036rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyaH0PB3/XtCQk2yNqcZYmh8JbEeD53e8UozmDqFXME=;
 b=LWg8GY+SXAiQeJsK4it4bIEtMKQ234G7u09+5wAeU99wzrhvFg7TgfJWM+aykX7Bk5AlH93CB68YD9JiMd8x5BYnJZdIRCiFuc46S9J9+lYkrwvtvACit1lfICoZFRHjEdt9yY1RuRXQe+oxdkmwIKSdtLtj/ptF0AEIntAMrn4UiicHqUZtXeMgch3lgYILPVrVXmLQV2HtajjKtz8dgl1mBBYMYDFQNLeNYdoc31KIv0WPEjGfj0Uzu+IIE2goz8lh9WISzdXqzSxUJjR0vgl63BjFadbSTt4L/Rt2p6+QBaYWBrLi8grPqOndRCM99BXD06RdKobxGDkBYHLEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by CH0PR11MB5412.namprd11.prod.outlook.com (2603:10b6:610:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 22:06:14 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 22:06:14 +0000
Content-Type: multipart/alternative;
 boundary="------------gJvF9NV4MdiA8W0TCC5oO3Kl"
Message-ID: <fc738754-a1ed-432a-97fb-dfa31cac6a69@windriver.com>
Date: Tue, 13 Feb 2024 17:06:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gcc: Add riscv64 as a compatible host to gcc-sanitizers
Content-Language: en-CA
To: Deepthi H <deepthi.hemraj@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        "Hao, Kexin" <Kexin.Hao@windriver.com>,
        "Kallapa, Umesh" <Umesh.Kallapa@windriver.com>
References: <20240212110000.1687187-1-Deepthi.Hemraj@windriver.com>
 <df3c6eb1-2cec-490f-bb89-e06de070b62c@windriver.com>
 <fcc39c54-1961-40ed-88fe-9303c8280bf1@windriver.com>
 <1ecab610-2732-4dd4-a1be-14eb6b3454c3@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1ecab610-2732-4dd4-a1be-14eb6b3454c3@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|CH0PR11MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 7722b314-0583-4323-84c6-08dc2cdffee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mjt6N8JHh6gKg8DaCGQcUC6jM4M1dlVYQLGX7evYaJoTIaExa3UKbN84yBim7tskyrGtkUQVTRFLBJQKFviN9Z9+OQQY6N7NR12dDOMfBbQktm9pAGwb2Ria2XNQ4o50YCj74ExTkKSozPEoJ3REC1yjrhaDbrp9LlnPcL7E0KnTEvVaehWyAGvQsqxgjWnuHQ67rBqksN22xQ58k2b9JnXc/3ZF5EKNeRwFQm2c9a1IxVxnMJrrqUnFTxcTZsM2mzMaDeNdnjTLcIDvIB5d65VVcDqSWTiws4UilqHwMJZfFZTMoxLVKlNSPm/icEz0jHrCAeyIL68jqPzBSDRVIJ5917TyPZMv2MLn9GszxnpeAhsJ+ARxsMuZfLwwkY1SBFipXNZZsW/0G5M3n25FkYy3Jljfx/HEP8nPOOTBgAvC1SVDCSgTF5TU9Aekc2XNA7Nbo3pPyegcT289AsHReE+ROqM9LCDZ+WXyseWLclTaD3rgWOhRcVMgru1nMCdhDBRK97zo1qFECEuHo8n8lFl5HRzmpc4ZqWzlYMUaxNI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39850400004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31686004)(2906002)(5660300002)(30864003)(4326008)(86362001)(31696002)(2616005)(41300700001)(38100700002)(107886003)(33964004)(6666004)(54906003)(6512007)(6506007)(316002)(66476007)(66946007)(66556008)(53546011)(8936002)(8676002)(6486002)(83380400001)(166002)(26005)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c004YXEwbVdHTzBNY2x4cFJSVllnNThhUmVOdk5BVnVnMFZYTUFzOG9ZVlh4?=
 =?utf-8?B?Wmlob0Nhd0R0aE5ManRDdXV0RkRHNmVXYnArS3FYTXB3VUgwL210R250bW5s?=
 =?utf-8?B?WU1GeEZjSFV6elAya3lSQld3TmVhUDMrMm1MczF4VHpoZ2x3UjZaZGltS3dy?=
 =?utf-8?B?Ym5NUUUxaUE2emlMa1V2WTdJd2tHNTN5Q2E4OHlZNU1xQW5hLy95SnRBbnpF?=
 =?utf-8?B?U2xsMDh5MzFadUw1WHhZamovRVhYR294MU5QUGtDOUVRa1RiWUdqQThURitW?=
 =?utf-8?B?cHZraGVOWm9SUDN1ekxXeGZTK3htcGdwT2Nwa1owNUJ4N0NFY1VzeDNYUkVy?=
 =?utf-8?B?cU13aTM4SVBPaERWS3ZRcWduNGJYaS94M0t4RjdBN05hRE9EUTJNcnltVTRy?=
 =?utf-8?B?UnlCSmdiclJYOGFZU1JFcXQ3bytSZHNxTTl1bE9Qams0VXVxV2xRejRubkRN?=
 =?utf-8?B?K2dZcG5sVlI5Y0lmemxlK1UwaHdsSERxR25kWVVxM1Qxc3NVK0VMOXMvMUVK?=
 =?utf-8?B?MU5OcHYrVVF0LzdmK1ZyUjEzQkJCVW1VNWdob0Z3Y2hlQjR5bmY2Q2trRkw3?=
 =?utf-8?B?SSsxZ1hiWW15QWMrV3RrYnM0MkIrbldFYk9leTl0QUhpSnFYQ1gxWjMxVW53?=
 =?utf-8?B?MjNGYzNjWURESC9YbW1KODNrUkdQM1ZnWXBTV1JNTEFmajFtaGhtY0ZzSWFI?=
 =?utf-8?B?S0VwVkRpcHVCYkZhN2l0ckFmRnJndzFXSTFLd05sUDM3R2xOZXlVclJHREVZ?=
 =?utf-8?B?ZjdpcjJCUHQveGdtVW9TcEVNQkxLNm01UjFYV3p4VjFKM3JQS2QvaWtNN3JI?=
 =?utf-8?B?aStIVmNSQzgyQjVQcC96N1I4RlVOY2ZzMmhDNWJub3o5Z1FqMGdNU2dIUzkr?=
 =?utf-8?B?VFJSMmxzc3FaQWtJajNMZmRoV3NLc0pyRmt5THVvR0JqTU1IWCtJYitESHdE?=
 =?utf-8?B?ZEI4QXFuUnBET3NZWSs3TWhsVWRhbEMzUFZNN2FiaWU5aU5iZGNxMWRhVjhU?=
 =?utf-8?B?YmYvbDJoeUdqcitUeGlBZlY4cEhQL0RwWXUrWVIzZ2tMa2haMHRyVVkxN3Zv?=
 =?utf-8?B?c2pWUUNzZUVlRWxNZithQzRzR3o0SEIwTnZhTXlUQjkxRGQ5ODI2MnlCcm84?=
 =?utf-8?B?SlJiZG9UWnMyekNDTWVLVXRzS3cwWkY3NmQxZHdFNWZXclVXMjZ3UUVVTVdJ?=
 =?utf-8?B?U2h6TFRjRmlvZVBWaEtMbVorbTRQT1psbklIZTRORCtjSkMyQ0RmZGlmWm50?=
 =?utf-8?B?TGJsRTlqaTJ1QjhlVGtLOHZGUGNXaUNvVmtSc0FaNG50MzV0UDJTaFNEOENu?=
 =?utf-8?B?b3padjVCSnE4dE9Bbml2V1N5aERKc3U5ZWpCc0NsejhrRUZmdjlsUkpleElF?=
 =?utf-8?B?WUpwRGFBL2FQdm1hMzl6S1Z2THVHR1Y2SFVuVGJZNFhhY3VWOUVwd0xPdjVR?=
 =?utf-8?B?U3dtT0N4VEJ0UFdhb2tKVTNweHVUK1liQ3hxblNlbURLTlZsV3FvOWV2YnRN?=
 =?utf-8?B?cjdPczdHcEFCNG9DaXpNVHI3ZU9aQTVLZ1hSUlk5UDFRSjBWR0ExcnJ5Vk1P?=
 =?utf-8?B?SGVYdlJmZ3NSSzBIK1plOW85ZVBQY3Iza05lbUJnZVRrU2NrWTZ4bHU3Y0xq?=
 =?utf-8?B?WDhJRGtwZE5OckpqTXZZQlpJUnhocmxVeTQzTDNsN1ZVcUxxeHRhNlJBK0lq?=
 =?utf-8?B?RWRIUEV5NjB3bWRrMDUzZHE1YThqaDZxTFdPTXhxcVROYmV0Q0tDcWR3YTRk?=
 =?utf-8?B?Q3RTYVBxbkUzQ3hGV3NnbDd1a0FlYjFGRUxBR2l2NFhQTDNZVHJ2cm5mV2xG?=
 =?utf-8?B?LzN3YjlVKyswcDBoNm42L0ZrUDYydTZoTHR1aXBacmdGWXdGRi8rcUtIMWU0?=
 =?utf-8?B?eUlObDdDRXo2VTd3cDI2RVZqbzBKLzlGaE11NTFIQkJGM2w5aEROUDhUWFlZ?=
 =?utf-8?B?T1JSV0E0NWVqMlc1OG5uK2FwL1VwUzJTbU1hZHdDalVab3o2T09DK0ZHU1dJ?=
 =?utf-8?B?K2tMRkxmNG5UdkJWaUZaOVhDNU9iajVHZlhXdlF2STNiaU44T2ZtSXJ6Q3FR?=
 =?utf-8?B?RW9qNG5KVTNtdHEzVDhETU1yTDlMS2hlYjRBdVhvc2xlM1pWMVdqKzRLV1pQ?=
 =?utf-8?B?RGFYaUtmZXFQb0RPd1RLeEl1dUlXZkVyVVZSbWlqYzl2MHRuQ3lrT0R6OGFU?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7722b314-0583-4323-84c6-08dc2cdffee3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:06:14.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAGjZ5lul3AYN6ydfS+aw2+q0amAco1UsdxZgx5e7JaSI715V4W2UkNPfq13r04RKyoysANwWA8lLtoM+kXGun6rIWPlCkVSuQb7rFZwL8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5412
X-Proofpoint-ORIG-GUID: TmKStn1DOzWLZf-q5NSBf7vPqMJaMZ3W
X-Proofpoint-GUID: TmKStn1DOzWLZf-q5NSBf7vPqMJaMZ3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_14,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402130174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195438

--------------gJvF9NV4MdiA8W0TCC5oO3Kl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41DI7ZcU003850

Fixed Umesh's address.

On 2024-02-13 4:30 a.m., Deepthi H wrote:
>
>
> On 2/13/2024 1:31 AM, Randy MacLeod wrote:
>> On 2024-02-12 2:49 p.m., Randy MacLeod wrote:
>>> On 2024-02-12 6:00 a.m., Deepthi.Hemraj@windriver.com wrote:
>>>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>>>
>>>> The issue address-sanitizer check failure arises when attempting to =
run a testcase compiled with AddressSanitizer on RISC-V 64 systems using =
the SV48 and SV57 virtual address scheme.
>>>> This error occurs due to the lack of support for SV48 and SV57 in AS=
AN, which was originally designed for SV39 in Riscv64 architecture.
>>>> This patch disables SV48 and SV57 support in QEMU and modifying the =
kernel to use SV39 by default.
>>>
>>>
>>> Deepthi,
>>>
>>> Thanks for looking into the gcc-sanitizers feature for qemuriscv64.
>>>
>>> I'm not sure if we want to make the qemu change that you have=20
>>> proposed and
>>> since no one else has replied, I've looped in Kevin and Raj who may=20
>>> be able to
>>> comment on the change.
>>>
>>> Oh, in reading over the comments to the issue linked below, I see:
>>> =C2=A0 "As a temporary workaround for this problem"
>>>
>>> so I really doubt we want to make this change. Changing thevirtual=20
>>> address range for qemu is not to be undertaken lightly!
>>>
>>> Let's see what we hear from Kevin, Raj and upstream qemu over the=20
>>> coming week or two.
>>>
>>> To me, this is a '(very) nice to have' feature not a 'must have=20
>>> feature'
>>> so if we have to wait until after Yocto-5.0, that's fine.
>>>
>> One more thing Deepthi,
>>
>> It would be good to add a test case similar to or extending:
>>
>> =C2=A0=C2=A0 meta/lib/oeqa/runtime/cases/gcc.py
>>
>> to ensure the feature does not regress.
>>
> Hi Randy,
>
>
> Sure, We will work on this requirement with 15338 =E2=80=93 address san=
itizer=20
> self test (yoctoproject.org)=20
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15338>
>
>

Super! ( I had forgotten about the YP BZ! )

../Randy


> Thanks,
>
> Deepthi.
>
>> Thanks,
>>
>> ../Randy
>>
>>>> Upstream-Status: Backport [https://github.com/google/sanitizers/issu=
es/1707]
>>>
>>> s/Backport/Submitted/
>>>
>>> as you have done below in the patch body.
>>>
>>>
>>> Only commits merged to supported branches or master/main, should be=20
>>> labelled as back-ports
>>>
>>> Thanks,
>>>
>>> ../Randy
>>>
>>> `
>>>
>>>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>>> ---
>>>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
>>>>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>>>>   ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++=
++++
>>>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>>>   create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv=
57-support-for-riscv64.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/rec=
ipes-devtools/gcc/gcc-sanitizers.inc
>>>> index 524ebd4ba4..8c98e9cf8a 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>>>> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>>>>   RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>>>>   RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>>>>   RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
>>>> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
>>>>  =20
>>>>   do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PR=
EFIX}compilerlibs:do_packagedata"
>>>>   do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PR=
EFIX}compilerlibs:do_packagedata"
>>>>   do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PR=
EFIX}compilerlibs:do_packagedata"
>>>>  =20
>>>>   # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are=
 supported
>>>> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|lo=
ongarch64).*-linux'
>>>> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|lo=
ongarch64|riscv64).*-linux'
>>>>   # musl is currently broken entirely
>>>>   COMPATIBLE_HOST:libc-musl =3D 'null'
>>>>  =20
>>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devt=
ools/qemu/qemu.inc
>>>> index 2a81870151..56c988e7fd 100644
>>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>>> @@ -36,6 +36,7 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}=
.tar.xz \=20
>>>> file://fix_segv.patch \ file://qemu-guest-agent.init \=20
>>>> file://qemu-guest-agent.udev \ +=20
>>>> file://disable-sv48-sv57-support-for-riscv64.patch \ "
>>>>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>>>  =20
>>>> diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-suppo=
rt-for-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-=
support-for-riscv64.patch
>>>> new file mode 100644
>>>> index 0000000000..7f3eab1463
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-=
riscv64.patch
>>>> @@ -0,0 +1,25 @@
>>>> +From: Deepthi Hemraj
>>>> +Date: thur, 18 jan 2024 17:52:45
>>>> +Subject: disable-sv48-sv57-support-for-riscv64
>>>> +
>>>> +Disabling  48 & 57 bit virtual memory address in a RISC-V program, =
while the system's upper address limit resembles that of a 39-bit address=
 space.
>>>> +This signals a lack of support for the 48 & 57 bit virtual address =
space on RISC-V; only the SV39 scheme is supported.
>>>> +
>>>> +Upstream-Status: Submitted [https://github.com/google/sanitizers/is=
sues/1707]
>>>> +Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>>> +
>>>> +---
>>>> +
>>>> +diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> +--- a/target/riscv/csr.c
>>>> ++++ b/target/riscv/csr.c
>>>> +@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] =3D {
>>>> +     [VM_1_10_MBARE] =3D true,
>>>> +     [VM_1_10_SV39] =3D true,
>>>> +-    [VM_1_10_SV48] =3D true,
>>>> +-    [VM_1_10_SV57] =3D true
>>>> ++    [VM_1_10_SV48] =3D false,
>>>> ++    [VM_1_10_SV57] =3D false
>>>> + };
>>>> +
>>>> + /* Machine Information Registers */
>>>
>>>
>>> --=20
>>> # Randy MacLeod
>>> # Wind River Linux
>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------gJvF9NV4MdiA8W0TCC5oO3Kl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41DI7ZcU003850

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Fixed Umesh's address.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-02-13 4:30 a.m., Deepthi H
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:1ecab610-2732-4dd4-a1be-14eb6b3=
454c3@windriver.com">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 2/13/2024 1:31 AM, Randy MacLeod
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:fcc39c54-1961-40ed-88fe-9303c=
8280bf1@windriver.com">
        <div class=3D"moz-cite-prefix">On 2024-02-12 2:49 p.m., Randy
          MacLeod wrote:<br>
        </div>
        <blockquote type=3D"cite" cite=3D"mid:df3c6eb1-2cec-490f-bb89-e06=
de070b62c@windriver.com">
          <div class=3D"moz-cite-prefix">On 2024-02-12 6:00 a.m., <a clas=
s=3D"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:Deept=
hi.Hemraj@windriver.com" moz-do-not-send=3D"true">Deepthi.Hemraj@windrive=
r.com</a>
            wrote:<br>
          </div>
          <blockquote type=3D"cite" cite=3D"mid:20240212110000.1687187-1-=
Deepthi.Hemraj@windriver.com">
            <pre class=3D"moz-quote-pre" wrap=3D"">From: Deepthi Hemraj <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver=
.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

The issue address-sanitizer check failure arises when attempting to run a=
 testcase compiled with AddressSanitizer on RISC-V 64 systems using the S=
V48 and SV57 virtual address scheme.
This error occurs due to the lack of support for SV48 and SV57 in ASAN, w=
hich was originally designed for SV39 in Riscv64 architecture.
This patch disables SV48 and SV57 support in QEMU and modifying the kerne=
l to use SV39 by default.</pre>
          </blockquote>
          <p><br>
          </p>
          <p>Deepthi,</p>
          <p>Thanks for looking into the gcc-sanitizers feature for
            qemuriscv64.</p>
          <p>I'm not sure if we want to make the qemu change that you
            have proposed and<br>
            since no one else has replied, I've looped in Kevin and Raj
            who may be able to<br>
            comment on the change.</p>
          <p>Oh, in reading over the comments to the issue linked below,
            I see:<br>
            &nbsp; &quot;As a temporary workaround for this problem&quot;=
&nbsp;</p>
          <p>so I really doubt we want to make this change. Changing the<=
span style=3D"white-space: pre-wrap"> virtual address range for qemu is
not to be undertaken lightly!
</span></p>
          <p>Let's see what we hear from Kevin, Raj and upstream qemu
            over the coming week or two.<br>
          </p>
          <p>To me, this is a '(very) nice to have' feature not a 'must
            have feature' <br>
            so if we have to wait until after Yocto-5.0, that's fine.<br>
          </p>
        </blockquote>
        <p>One more thing Deepthi,<br>
          <br>
          It would be good to add a test case similar to or extending:<br=
>
        </p>
        <p>&nbsp;&nbsp; meta/lib/oeqa/runtime/cases/gcc.py</p>
        <p>to ensure the feature does not regress.</p>
      </blockquote>
      <p>Hi Randy,</p>
      <p><br>
      </p>
      <p>Sure, We will work on this requirement with <a href=3D"https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D15338" moz-do-not-send=3D"true=
">15338 =E2=80=93 address sanitizer self test
          (yoctoproject.org)</a></p>
      <p><br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Super! ( I had forgotten about the YP BZ! )<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:1ecab610-2732-4dd4-a1be-14eb6b3=
454c3@windriver.com">
      <p> </p>
      <p>Thanks,</p>
      <p>Deepthi.<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:fcc39c54-1961-40ed-88fe-9303c=
8280bf1@windriver.com">
        <p>Thanks,</p>
        <p>../Randy<br>
        </p>
        <blockquote type=3D"cite" cite=3D"mid:df3c6eb1-2cec-490f-bb89-e06=
de070b62c@windriver.com">
          <p> </p>
          <blockquote type=3D"cite" cite=3D"mid:20240212110000.1687187-1-=
Deepthi.Hemraj@windriver.com">
            <pre class=3D"moz-quote-pre" wrap=3D"">Upstream-Status: Backp=
ort [<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/google=
/sanitizers/issues/1707">https://github.com/google/sanitizers/issues/1707=
</a>]</pre>
          </blockquote>
          <p>s/Backport/Submitted/</p>
          <p>as you have done below in the patch body.</p>
          <p><br>
          </p>
          <p>Only commits merged to supported branches or master/main,
            should be labelled as back-ports <br>
          </p>
          <p>Thanks,<br>
          </p>
          <p>../Randy</p>
          <p>`<br>
          </p>
          <blockquote type=3D"cite" cite=3D"mid:20240212110000.1687187-1-=
Deepthi.Hemraj@windriver.com">
            <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Deepthi=
 Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@=
windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 ++-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...isable-sv48-sv57-support-for-riscv64.patch | 25 +++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-sup=
port-for-riscv64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-=
devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D &quot; liblsan&quot;
 RRECOMMENDS:${PN}:append:x86-64 =3D &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:powerpc64 =3D &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:aarch64 =3D &quot; liblsan libtsan&quot;
+RRECOMMENDS:${PN}:append:riscv64 =3D &quot; liblsan libtsan&quot;
=20
 do_package_write_ipk[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
 do_package_write_deb[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
 do_package_write_rpm[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
=20
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are suppo=
rted
-COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64).*-linux'
+COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl =3D 'null'
=20
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 2a81870151..56c988e7fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://download.qemu.org/${BPN}-${PV}.tar.xz\file://fix_segv.patch\file:=
//qemu-guest-agent.init\file://qemu-guest-agent.udev\+file://disable-sv48=
-sv57-support-for-riscv64.patch\">&quot;https://download.qemu.org/${BPN}-=
${PV}.tar.xz \
            file://fix_segv.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://disable-sv48-sv57-support-for-riscv64.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-fo=
r-riscv64.patch b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-suppo=
rt-for-riscv64.patch
new file mode 100644
index 0000000000..7f3eab1463
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/disable-sv48-sv57-support-for-riscv=
64.patch
@@ -0,0 +1,25 @@
+From: Deepthi Hemraj
+Date: thur, 18 jan 2024 17:52:45
+Subject: disable-sv48-sv57-support-for-riscv64=20
+
+Disabling  48 &amp; 57 bit virtual memory address in a RISC-V program, w=
hile the system's upper address limit resembles that of a 39-bit address =
space.=20
+This signals a lack of support for the 48 &amp; 57 bit virtual address s=
pace on RISC-V; only the SV39 scheme is supported.
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://github.com/google/sanitizers/issues/1707">https://github.com/googl=
e/sanitizers/issues/1707</a>]
+Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt=
;</a>
+
+---
+
+diff --git a/target/riscv/csr.c b/target/riscv/csr.c
+--- a/target/riscv/csr.c
++++ b/target/riscv/csr.c
+@@ -1178,7 +1178,7 @@ const bool valid_vm_1_10_64[16] =3D {
+     [VM_1_10_MBARE] =3D true,
+     [VM_1_10_SV39] =3D true,
+-    [VM_1_10_SV48] =3D true,
+-    [VM_1_10_SV57] =3D true
++    [VM_1_10_SV48] =3D false,
++    [VM_1_10_SV57] =3D false
+ };
+=20
+ /* Machine Information Registers */
</pre>
          </blockquote>
          <p><br>
          </p>
          <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
        </blockquote>
        <p><br>
        </p>
        <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------gJvF9NV4MdiA8W0TCC5oO3Kl--

