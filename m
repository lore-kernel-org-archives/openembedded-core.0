Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18284C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 16:27:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.762.1702398443029153879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 08:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=b6cKd5JQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07109d2a54=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCAJgbR025659
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 08:27:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:from:to:cc:references
	:in-reply-to:mime-version; s=PPS06212021; bh=WzuiAzt7GkhpbYYk8Fa
	Ja+ds3IeskJXws/pFrqwov+4=; b=b6cKd5JQPg+Bgj9S53IfqQPprmjkorXQJtb
	V5O3hZCSEwKROyZ/WhxjIlmY4zsk1zbMeJoiHzrGuh1YVeuGFNaHiWKU6JbAFxaR
	+w2qXjvSr9vEHhosiQqqrVx6iO26M7ma8FMneqDx02BOYin3OyaYGkqarSkC9RUW
	WfigYAATvZnLiFRBFq462HvZRrs5vcd5DrwRClxreVzags6QZlkwXBHRZ802ky4N
	c4r7ziJSGAmaaJvGzTYtcDXsHauRoi861oZfwkDgvb8drxVdlU1IYZ/GW61QMY2m
	7lIas3kbQPiQ0scAUul8bA4uV8kwQnB64NEjuya2qxooZUesJpg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxj9fk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 08:27:22 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BCGF6vn007255
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 08:27:22 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxj9fjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 08:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiYvDts5mtc6gYaTfCqMUtbhDwdTaq2tf465gd8NzsjIbwUT7sjzjK+EGs7KZh/SrXGLr3z3moh4WBLJuH3EFfO5UF36/WYC4wqlOhKre6PEWnpJWZWfa/nBCM9mzleHEP0rsJgYG8WeGCTiE/mP8Oa0/geeE0w1kN/hrWsuUa0kJk3/woUZMVVbIpEGoe+jSiFxe7jUju3D1KDA9SulkX834ZfYRfBJQhBnKn5UvVFmUacpP/iAS5RszPHHIhNGfpXZTMADwJubxSHXmzPJtP8UoGv/FvWfPpVjf3sXYCL0Ga+dJLbY3VauiiZJ71dx6BdnUROsN2WzxB+5sQ8zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzuiAzt7GkhpbYYk8FaJa+ds3IeskJXws/pFrqwov+4=;
 b=BHVLyfblvosaKA7nYHwl8fe6h3epHt+T3/8MWQt0q8p8Z3EW5qJcFm0MKvlONTmKYLG6cLY+GVwO3hjzRawnwp2oX0B+Y5oVT+B0wJhL97FB2VQ1hG0OIyFGQoH2jOkSFCZXOj1+w63pL9Z+8LUdFZySPYi6h0tOi8+8XK9TbV7WzDyf2ch6QFeyRG5gtdwDmaPir6HKPnvPz9K0mM3jB2Pw+gGKBoVMWLTfFpWx82BQsPeqL5h+lYpS2/DE/siYweW5t6OAxmS1dO9KmRszADqngXcImB2ZTl7xil+eB8E902Vpwo3nbjRFm1drqwfuyRuzZ6xbeRuvAMWBU3LnqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 16:27:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 16:27:16 +0000
Content-Type: multipart/alternative;
 boundary="------------9oFKueTsdDvglHJ6Q0VFCG4x"
Message-ID: <0fd78419-41d3-4337-b378-76d337fd2e29@windriver.com>
Date: Tue, 12 Dec 2023 11:27:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 7/7] rust: Upgrade 1.73.0 -> 1.74.0
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: alex.kiernan@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        openembedded-core@lists.openembedded.org,
        Tim Orling <tim.orling@konsulko.com>
References: <20231208140349.3576-1-alex.kiernan@gmail.com>
 <20231208140349.3576-7-alex.kiernan@gmail.com>
 <20231209121845ed0bfb0d@mail.local>
 <179F2EEFE21E3032.26830@lists.openembedded.org>
 <CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9CxNhopgvqie6OBAo-HOQ@mail.gmail.com>
 <7cdd0aca-025f-4561-96a0-87c7fd02fbdd@windriver.com>
In-Reply-To: <7cdd0aca-025f-4561-96a0-87c7fd02fbdd@windriver.com>
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: ab84b721-6d58-4580-f089-08dbfb2f3428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cVSf9DBt0ji3s8I6431Gxs4ee7KH25JBWLzQKnfrgOMhCEXPsoCfqNYEZKWjRglxXFhXTdS3dlQ6dwKwAsuuh7+NFYIdlFt15YdEtE1og4bIycsacJFQh6z1zAX1YDx1HWhuaOHZONrQEHhzbccQsyjsm6a2hAa8d4jYpTMa5wUlVm7pIHRuiO6dGX5zSm3TdW8BFcfLQWSSlWt9XBYbTutwtA9ZwR7YiXkmc4RDSgSe6wzGwfQ3Aji7dhQBaBjKOlCbq6jTzwhJtohm7hcn1hEUPqt1E5vHjLPUfOIA8ClD01u7l3VwaI94EhyBSDj51JKBiA0HOFpKMAeNLQ1+tHfrFG/9lbIpYcE3zgNXQWRyAgK+O+3ZrAJ14wz1bPSz5xeLep8ImxE4IOuu6WcpyksFbgCPynCmWri9ROL1rq/vIQiCwzMQ0eirjyMFthhqwA3Mu8v9qYzCW1WhxphUg4KKl8x2fwRYzMM0cQFQcgjFt08cXw1sRoPOx/0Oe2h0egPQ8t6p2k9eXgBTO57/vwFwNLROWMX1nmTj9QslEjQqili8LoldDifkr6mBZGGxor+vyJewffZtIiYlq8PivEN0Gas7VxDlCJEab3MudDzxLCrZNXUNobivZGwnZNC9+9FW57v+1YoESXLcLj/EHB9cL7UCsCV7rI19s+KPKz3sEGthBEM0RZM7yT3BpPBl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39850400004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(2906002)(41300700001)(478600001)(86362001)(31686004)(4001150100001)(166002)(54906003)(6916009)(66946007)(66476007)(66556008)(6486002)(966005)(316002)(38100700002)(8676002)(8936002)(31696002)(4326008)(53546011)(6506007)(33964004)(6512007)(66899024)(21615005)(36756003)(5660300002)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnUwVFVld01oQ3p4emU3cWlxcm5CNUlBdXRyMEtXdFNpWDFIRklQVEZ0S3ZM?=
 =?utf-8?B?VVdIczJ1WWJSOFc3aFIyT1g0K0lCOXpHT245SFJCY0JCaUhkOXpNaHZvQ2Nu?=
 =?utf-8?B?R0JvOXVvSzhnbkdHclUzcUcrYzh4RlJMTnVlWi9CdnZHUEJSSWtuTC9sMDZ5?=
 =?utf-8?B?bzRvL3lrUTZyck5oS0RxRXNJV2dGcGRHUUhUaTF1T2JBOVJVZm45eGIxaXFW?=
 =?utf-8?B?TVMrSWtvQjd0OHpYVHgxYjg5RFlJRmlsaGwvZDZpMStNNlJxWDB2bnlRUFY2?=
 =?utf-8?B?Tmx4bGgrc2U5N3kvUmNkZnpadGpkQzZOUGRpRUNXY1dLbDJiWENJUm5wQ2Zj?=
 =?utf-8?B?NmJWa3o3ZzlTQUVnS2NMaTJlc1kxTFA4MVVSOU4zejNXUFJZUWNYalV3Uits?=
 =?utf-8?B?cERYMDY5TERqNVN6OXl0RHRGK1JuanJjWXdvYlorUC9Kam5ZNnRNNWN1aVpk?=
 =?utf-8?B?SHl5VWkramExZ0ZwdjRPWTR0YTI2YzRsbDRPb0Q2UXgzdy9YQTRsdURLYitI?=
 =?utf-8?B?NU5mNDQ0OHBpcU5GeC83dnY0L1JXVHJiOXcxTTN6b0JmNmVmd2xrS1F1aDdj?=
 =?utf-8?B?ekZsZE5kcXNDdG94aGxEMUhKYmxhRFZVNEliN1JOdGt3N3dlWmxwOWdGVGgy?=
 =?utf-8?B?Yi83cUQ4T0hNSjJZV0lhOVV2VDBRQlE0TnVIaWpmMDI1RWJoNHJRMGtkVXNC?=
 =?utf-8?B?ME9jMHlHNGF6NElkTkVJaVZpenhhYktBSTJLZ0NNWWRuMHlRZldvRUdmeUZI?=
 =?utf-8?B?NmRqSFVFMWZRSkV4S0pLNmVuVmNaS3FEM3drNVRvQk5VenNXb1hZTDhXWWhu?=
 =?utf-8?B?SThTSERVNUwvV243SGxzZTlOUkdQTUd2VG4yQi9GekM4ZFkyM3NpaFQrSTlI?=
 =?utf-8?B?VUlJZXlUbEtIRWpsSFFGVWNPSWFLQzlWL0g4aGZsQW1VVHYxMDBxQkxvNXI0?=
 =?utf-8?B?U1AxZCtBQnprdFdyNkU1M213MnhIV1hhZmE3a3FOeG15eFZLOVdiSEpLajAx?=
 =?utf-8?B?UjJReElSU3pISnBYcVEwemlzUUFnS2ZldFdxWWZYdTgyNHp3d1NNdG05T29R?=
 =?utf-8?B?T1dzWFV3NkFoRjBML2d4dXBnbmo2a0s5NEpvMytBVUZNd0gxdXhQbE56bjZm?=
 =?utf-8?B?c3VEenF2OEJya0tYNStUTWFyREZ0RC85clpFdVlORVhWb29tcFRvUTVQaWdP?=
 =?utf-8?B?MEVwNzhBSTJWZTltNHJSelNjb1RYVFpYSlNoSHBvNEs0ZkQ4T3F1bC9TdTFj?=
 =?utf-8?B?QzdUam12eTg0K216N2w1NHF1c01OZE9pN0R1QXZ5bHIweTlFWlowL1VYNDRS?=
 =?utf-8?B?dFlWbEtwSjgwQ25UeTROd0xEMnBHdjBxdERsZnczTHkwYll4Q0x5bFB5Wklo?=
 =?utf-8?B?VStUZHQ3TjZidTEzSXRqSnRFR0xWTXN6a3QyZmJuQkhnbC9pRm9xeUgvbEhh?=
 =?utf-8?B?S3h2aFM1M29YcWVaOWZpSW96b2x4RWpUcEpma1dsMFZHaUd3ejJMSVdRVzVy?=
 =?utf-8?B?MGZwcG0ycWUvQWdnREFITWVnMU04WE1WU1FyaFdKamRmNWNIU3JGVEhnb25l?=
 =?utf-8?B?T2tDZU1mRHBzdDRLSGZFcVBacFVCQU1ZSkZTckZXSVh3U1JRTStINGQxaE5U?=
 =?utf-8?B?RUVNdkRoOXBCQWZoanltdi9Sbm5lYWtsdlc0RjZSdWRGYzdXNUlZRHZhV0JG?=
 =?utf-8?B?c0l0Z1dyVnFEc3NLZkFEZksrUGFnZ0xML0oxTG1QLzAveENad1lJV0g1bFlZ?=
 =?utf-8?B?anJnbmthbXVncWZHNkthRS9DZytGU0N0WTRaNjBJVFpDZnc2NjZVM1ljeUhI?=
 =?utf-8?B?SzNpekttbHNZa3hTZk9iamFNNEVBNW5lTFJseXhjbEQ5Tm9jNTFpQkR4Z0xw?=
 =?utf-8?B?bEJiRFFCek0vdVFUTUcvcnpsTi95ZXgwUWhNY1B1WnJWaCtRMnhJM05YUml1?=
 =?utf-8?B?THpWa2RoZGlsUTA3eEorWUVRRXgvOVVQWTRSZWszWkI0K2hVSWlzdGlxZFdG?=
 =?utf-8?B?NnExVTkwWjY4MVZYRjh3VDdCZnhVYWx1UC9zM3c2Y01tTzdnMUM0RkNUOWRZ?=
 =?utf-8?B?VVUwQlJVWUVrbllDTC9rc1ZaK0lTZGNmblhQUDRSa0U0K1NFN1lRM0M5c3pP?=
 =?utf-8?B?MDhKdDVVR1pJeGFMbnBzcXAyV29vZU0xOU5NVWFOaVBZNGw4ZHJ0VVFtMUUx?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab84b721-6d58-4580-f089-08dbfb2f3428
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 16:27:16.1630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bbm8e+JDif3SQG1j1duUa8OWwVpW/ciBjXCw0ZxTIQG8iaRay6iv/qlrzTzgVGR2PyS21vXYlqR+fUwPJBmWPYyyWgu5izBEhyiUIuosnL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-Proofpoint-ORIG-GUID: TxaVEA6o_M_Nh6ium6u_QQdt3aGPr-LD
X-Proofpoint-GUID: WjY0PfJtGSrz1jo2SlGtMcKXuvZpmNMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=641 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 16:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192236

--------------9oFKueTsdDvglHJ6Q0VFCG4x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BCAJgbR025659

On 2023-12-12 11:25 a.m., Randy MacLeod wrote:
> On 2023-12-12 5:41 a.m., Alex Kiernan via lists.openembedded.org wrote:
>> On Sat, Dec 9, 2023 at 2:06=E2=80=AFPM Alex Kiernan via lists.openembe=
dded.org
>> <alex.kiernan=3Dgmail.com@lists.openembedded.org>  wrote:
>>> On Sat, Dec 9, 2023 at 12:18=E2=80=AFPM Alexandre Belloni
>>> <alexandre.belloni@bootlin.com>  wrote:
>>>> Hello Alex,
>>>>
>>>> rust 1.74.0 is not reproducible:
>>>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208=
-rfbproj4/packages/diff-html/
>>>>
>>> Thanks, I think :)
>>>
>> One observation, which might be useful, these failures are all inside
>> the same module src/llvm-project/compiler-rt/lib/builtins which are
>> just a bunch of intrinsics. And as far as I can see it looks like it's
>> just the object name mangling that's not reproducible.
>
> FYI:
>
> In the weekly YP tech call, we talked about Rust and Richard said that=20
> he'd merge
> 1.71 to master since it's progress and it unblocks some ptest works=20
> that Tim was working on.
>
> We can then just jump directly from 1.71 to 1.74 if ( when! ) we can=20
> make that reproducible.
>
Or even=C2=A0 to rust-1.74.1:

https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html

../Randy

>
> Richard said that he started with 1.74 from Alex's patch-set and
> when he found that it wasn't reproducible, he simply worked his way=20
> backward.
>
> ../Randy
>
>
>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192191):https://lists.openembedded.org/g/openembed=
ded-core/message/192191
>> Mute This Topic:https://lists.openembedded.org/mt/103055169/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------9oFKueTsdDvglHJ6Q0VFCG4x
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BCAJgbR025659

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-12-12 11:25 a.m., Randy MacLeo=
d
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:7cdd0aca-025f-4561-96a0-87c7fd0=
2fbdd@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2023-12-12 5:41 a.m., Alex Kierna=
n
        via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5QA+YaNQtOgtzjNRNLc4_YB=
G9CxNhopgvqie6OBAo-HOQ@mail.gmail.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Sat, Dec 9, 2023 at 2:0=
6=E2=80=AFPM Alex Kiernan via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alex.kiernan=3Dgmail.co=
m@lists.openembedded.org">&lt;alex.kiernan=3Dgmail.com@lists.openembedded=
.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Sat, Dec 9, 2023 at 1=
2:18=E2=80=AFPM Alexandre Belloni
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alexandre.belloni@bootl=
in.com">&lt;alexandre.belloni@bootlin.com&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Hello Alex,

rust 1.74.0 is not reproducible:
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yocto.io/p=
ub/repro-fail/oe-reproducible-20231208-rfbproj4/packages/diff-html/">http=
s://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rfbproj4=
/packages/diff-html/</a>

</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Thanks, I think :)

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">One observation, which mig=
ht be useful, these failures are all inside
the same module src/llvm-project/compiler-rt/lib/builtins which are
just a bunch of intrinsics. And as far as I can see it looks like it's
just the object name mangling that's not reproducible.</pre>
      </blockquote>
      <p>FYI:</p>
      <p>In the weekly YP tech call, we talked about Rust and Richard
        said that he'd merge<br>
        1.71 to master since it's progress and it unblocks some ptest
        works that Tim was working on.<br>
      </p>
      <p>We can then just jump directly from 1.71 to 1.74 if ( when! )
        we can make that reproducible.<br>
      </p>
    </blockquote>
    Or even&nbsp; to rust-1.74.1:<br>
    <p>&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://bl=
og.rust-lang.org/2023/12/07/Rust-1.74.1.html">https://blog.rust-lang.org/=
2023/12/07/Rust-1.74.1.html</a></p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:7cdd0aca-025f-4561-96a0-87c7fd0=
2fbdd@windriver.com">
      <p> <br>
        Richard said that he started with 1.74 from Alex's patch-set and
        <br>
        when he found that it wasn't reproducible, he simply worked his
        way backward.</p>
      <p>../Randy<br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5QA+YaNQtOgtzjNRNLc4_YB=
G9CxNhopgvqie6OBAo-HOQ@mail.gmail.com">
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#192191): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/192191">https:/=
/lists.openembedded.org/g/openembedded-core/message/192191</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/103055169/3616765">https://lists.openembedded.org/mt=
/103055169/3616765</a>
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
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------9oFKueTsdDvglHJ6Q0VFCG4x--

