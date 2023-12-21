Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC93C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 05:41:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45945.1703137282698669275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 21:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=aVZYpfsX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=071976e036=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BL5Qg39032577
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 21:41:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=KBkzpbrQJDPwfLQEML7VGlOvkYcqu4R0AabQjZ1aybA=; b=
	aVZYpfsXR84Emz0JJIOar0KloLTlF56cVci+evQguLHQeoiQiJRjpM2Ieeu8KkL3
	e8/PNWzmS9FY8llqkc7iOXKiBjj4+r0xsyhz+FTmtxo3/MMHGIHA16Jr4FCE0n5E
	YEZu6AJFkjEl9aE3xJHhP0ll4y4wR5PnzoS73O53vmEa7n3ambnMGQLyaCW5mdWl
	CNNBvqMnU14PQ4y7rpybZCHaP0zNsw91rp1waidHgxBaozS7qlfxC21jQ8G2iMKE
	S1N/LGJUcgCP9r/6eqHUXZveDYmWRoXHiHIgU492xN1t+2YlvHKrwDtq+djpLk/g
	5uAg+bkTXwgLePCVO6zijg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824nncb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 21:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLmrjqm2P1xbgL8nutp7M04vkaoJJLLnZe5xWdq1THRkfV26LIXOpk9PZ6eCl7S9Ytf98gkypthZ0G0tcaBoQ6YSqjGPE2/YoNxlB0BBWgLRpBQjikSJwdobBzb4D8syd/DSiZ/Peb6MHOjR2p1M6uXU0B8hX7VtIF5sBy3u68yj32PMR0N9fYH4ItLANE3/SeIGJXN5ApYqbGApQ3DcoC434fmDKP7kfBgYiTc3a8b3FJI1j2NOiSxBdWNaygqH/LHI1msBzxJrqEaADSOQiyL4ntbdcwNhispHvU3y61UvjY3XnU1PVRfKvrzYL3KNkHRugltoFUDxVjhJsh4icQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBkzpbrQJDPwfLQEML7VGlOvkYcqu4R0AabQjZ1aybA=;
 b=hWzIRnH9/CkQzq0Epy9e5sAvwLUGAYbJ8Znjgw5bYVVvqvVSBP00kitGCkVM/zx2RNU5LH/EBwsFB+K1bTE43wesd6wDvxvje/lFPuMSf3+Iw5V6XoW55c7kQ/hETIUWesay1Dp42GY7oEGKWH3Icf2Mo2gcmz8h9WLBiUvus1w2eAI6cgcnfrO7Yg3oeE4UbJkdLn6jRb+99sAiBYO6Wm7LtKIH5aH/BC0hBEC+Qd2tWwEXUZZAj1GdlzJsbq5cZ0wWg9iVz+UWGYVpFyEG/FZpn2yTz9xz0xn+ArizyPFqAGjgWL/Fxg6YSZgXVWMEjtvmkUYEC+SPnfZ9fGWmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 05:41:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 05:41:18 +0000
Message-ID: <f4d55d36-83a5-4223-93da-fe0a133bae3e@windriver.com>
Date: Thu, 21 Dec 2023 13:41:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <179E2737483C0885.1352@lists.openembedded.org>
 <179E27474C306557.1352@lists.openembedded.org>
 <7a8e831d-bb7e-4d3d-bda7-ba225e453bb0@windriver.com>
 <787d16b8c357e46bc7607339f601ce1293a1e3a5.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <787d16b8c357e46bc7607339f601ce1293a1e3a5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 73185968-4454-4b57-8e77-08dc01e77445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L00PTF+NmxP/B9BkWIH+f69fWXjy4otoI38g+klmMFlPvHO23sVjieJP5fcHNbOg99dxh56QoXUQrxzJbcnpXg3+401qR5KwxyK5m6ft0YZwZ7l9CBhDTgLTNYewK6JIrylADUeD9Sy/9Vd7odxEGaLl/LswQqbH1mOHkrTuBOZxM9PXSe3PNQzmRXN2+MlpaM5xQjIJDBK4nNhliVpteqP9/elA3SyNX835uvxv85rOyOTnmt05eKlW4544rfE5BAG9Y9ETS6OnFbCeqCFbjcNGK+QXGxma7ApncX8A/V+LBY8hcmxXrcO6nAdys/FLcrYElBaTJsgAJsAv0I35zloxny1Kvvu4CTvRvCTYzE4Cg0EhnEQCbjdMVqJyb9sDJXMKd++fKVVgmy6dQ6mhKC2ec9d5n2IeClTdRT5pQb8CAp9pywqIY+W4qS9Nrd7DMfijtNYba6MnM5vEIrTY7fewWvx2Rha3EI3IMdf5O01WK8L7eNMld6L/BfIr7Fx8xFeYL1NtBVJgUb00CGXE88tAyaLbwIBNEqgPyBnkNb9dPa4jNVrNhtt4onxqyaRQDq8Lv5+giHrNH+Wgn4WqwJ3rkU08Zhk6BFUq3h7d91147z0HYMZPpbkffGKOSplsYegzMgDRfQZevMGzqLlgnL54ZVkCkKUOEJfuyfrTfuI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(346002)(136003)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(1800799012)(64100799003)(66899024)(31686004)(6666004)(26005)(53546011)(2616005)(6506007)(6512007)(8936002)(38100700002)(2906002)(36756003)(86362001)(31696002)(4001150100001)(6486002)(478600001)(8676002)(41300700001)(83380400001)(66476007)(44832011)(5660300002)(6916009)(66946007)(966005)(316002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEMwbFp3SFoweGVLekVqcFVhQ0xmeUU3MndZdGlhRElSNEx5ekFOdEk1L2tx?=
 =?utf-8?B?VFE3VkNiUy9ITGk5V05FMnVmenhMeHhqdmltaGdkeVAzOGN1bXlyNmhLMnlp?=
 =?utf-8?B?ZlcxbGhieVpmTGhmalJmcll2WE1LSEE5K0MycWdhWEY4dCtuRzNPKzdUaWFS?=
 =?utf-8?B?WUg5eDBrQ2MyTldzV0I3R2xkSnUrcWFLdHRnRWtRdm8zd3g1amxVL3dmUWN5?=
 =?utf-8?B?YTgxL1p2YmZqazE5UzJnSHBKVWdyQ24vcno3TEFlcEZkeUxETEN2R0x1a291?=
 =?utf-8?B?S25uaWlsc3dIOHJVUjRLSUkzQ0JaNklPQm5QaVlJWlR6b044QXNJOGZYK0or?=
 =?utf-8?B?ZEZ5U1c2STRQNmNnT081VEtxUjVqYSttVFlOQ3R0RTdqU3JTMlV4WnJKeFI2?=
 =?utf-8?B?Y3ZmejRmc0owc2E0SXdLRlZBZ3Rhem5ma0NTU3VLRjUyNUJaRnNwYWNSZVJk?=
 =?utf-8?B?QzQ2eUlPMGhjUWd3SFNScjkvbTVUcHRWRFAxeDM4cU1GRXJzVWpOaDBET0Fm?=
 =?utf-8?B?anQxNTdmTWpVRFRyQnQzb01WYTBRSDdVSUtRTGtiRVVBVWtabUhldHdua1JO?=
 =?utf-8?B?NldSWkNBczhjQUswTTYvZFJUd05zNlVaRU1mL3hLNWJLV2lIaTFxUDlVWXRG?=
 =?utf-8?B?em1qYVBJeThaSU9hVEY5V09tMVFMc0pydGRIY3ZuUk1USVdTUzA0UzQ5cVRr?=
 =?utf-8?B?MVdQcUh3MEM3NFl4ck9vTE9jOG1LTm82V3JRYUZQcHFNQk12alBBWlBoSXNH?=
 =?utf-8?B?VmNOdk9EcHpwZjlESkM2b3Jpc2FPS1RCL0JQc0tHK2I3WjNFWEtKT05CTnJE?=
 =?utf-8?B?ZzRYMXdVYkUxSW1pcndPc3NpT1JCay9oblovbi80dWhtNC9rdFF6YVR3RVl2?=
 =?utf-8?B?Smg2bjZFbXZDTlRxU3g3ZFVUaEoxQitFbW50Szc4RFd5bmVWUlN6T1ExMm0w?=
 =?utf-8?B?cE8vZ1N4ajFadHViMmhiSm1NakNjOGcvbTFRWUVCVkdYd0taSVNZVGVheE43?=
 =?utf-8?B?WGFGL1FHTkxCV0czRXlpT2pEay9KTVROMFdVb3g1QlRWTTlpb1JLUmZnVElL?=
 =?utf-8?B?K2hleGxPTFcrbzBZelpVUExibVRGcjNlOGNZYkk5cU1xLzJCRGgxYmw4aEps?=
 =?utf-8?B?NmtibUc5K280ekx5R05yMk5pblJyOW96bk51dUVRWGtjSGd3aUI2Q29STk9i?=
 =?utf-8?B?OHZxb1RpYVpHdDE4V1BMbGVmUEIwVkpSM3JROXJ1WWNEcWd2VDVSRHdmeEZt?=
 =?utf-8?B?QUpqQ3lKTnB6a0liNWFYSUZqZjNPUXVXc2NubnpBYzJCMkVRMDQybzBua2hD?=
 =?utf-8?B?ZS9kbHRjMzhrMjFjd0wzTkp5VWJEVFVOZEVDeVVJNUl2TGxzOUozalZDQ21X?=
 =?utf-8?B?dEJkajlRNmdITVovczMvc3dLUmlveVBnWnczV3hDZmV4WFAvQ2lYc0kzTUhp?=
 =?utf-8?B?bk5RN2MrUU4yVGpxQnRwa3NPQXNpM2F3NitzS2laT3dOZmxYOEFpd3V3WFFN?=
 =?utf-8?B?S3AwM2I5b3hzVlJEbHB5K1ZJQ2piK0hHQmg4YmxIYUJyWm9sN1FUQVlmUXBW?=
 =?utf-8?B?eUdBMEtleTBtVEpFRWdwenZwNitlL1lXZ3BMYmFkYmM4eUdXK0Y3d3V0M3pj?=
 =?utf-8?B?Szc3eitYMlduRDljanZBWFlhUU9UTjMwL2NnWXEzZ2sydXI3RTcwckRWVUJT?=
 =?utf-8?B?NWQycElSWmNtYXpqZG9BbkhhUzdoR3NadXBmd1lTNzA4bGpoZ0RWSXd0Z1FQ?=
 =?utf-8?B?T3Y1WEdJbysxRlJTcFNCa0dTK0YvSy9FYk5ldUY1VnFWanNSVThqbG1EUVFh?=
 =?utf-8?B?VFpTMnlELzJNYmNVcTRXQ0czNzM0cTBWK3c2aXNoYThJQUdnMHN1OVl1MUd4?=
 =?utf-8?B?NjU0SXdMbUt3T2J2MzFEdFBRMmxCdm5JdmZmY293NGY2NGptaWNnWUFMMWJW?=
 =?utf-8?B?alZxODVUMUJFWUNvL1A3NDNwNVl6K0RHY2ZKZElJME1PUFMxUC9kTS92STcz?=
 =?utf-8?B?NEx6TUpIcURoZFFOTFhUUFhoajJLa3U3VGtpeHpWTFVmaXBwcUx0K0JTcHFS?=
 =?utf-8?B?VldBT1p2Y2xSenBJVnpHc09pZTJrNWRuZXNveXFjYnBaamRzNk03RjRjU0hZ?=
 =?utf-8?B?VDhTODRtaXN3Yk9SVjQ0bWlDSWtNbDBLVTI1TnFyTVpLdCtsZXJyYUxtOHY4?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73185968-4454-4b57-8e77-08dc01e77445
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 05:41:18.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jKpr5VOgEikQDtwJFxslp8Ru8/RadHBWkkvCH5se45S/Zh1wD3OGArJq+/1UOyRPUH9hZzE7wRyHe6jgg7qK1HnaAojz01yBM2DVk+zHP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
X-Proofpoint-ORIG-GUID: VJ30Uk7jwHz_oZradDekI7QpzRZCjQVM
X-Proofpoint-GUID: VJ30Uk7jwHz_oZradDekI7QpzRZCjQVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=793 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312210040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BL5Qg39032577
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 05:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192825


On 12/19/23 16:29, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2023-12-19 at 12:07 +0800, Changqing Li wrote:
>> Kindly ping
>>
>>
>> And why have this change:
>>
>> In old version of man-pages's README,  it mentioned:
>>
>> Note that sometimes these pages are duplicates of pages also distribut=
ed
>> in other
>> packages. Be careful not to overwrite more up-to-date versions.
>>
>> So we set man-pages to lower priority,  so the doc in the related
>> packages are used.
>>
>>
>> And if we delete them from man-pages recipes, it will make man-pages
>> missing these docs
>>
>> when eg: libcrypt-doc is not installed.
>>
>> in man-pages recipe, ALTERNATIVE_PRIORITY set to 100. So I send an V2 =
to
>> update
>>
>> ALTERNATIVE_PRIORITY of libcrypt-doc to 200.
> Please delete the version from man-pages. Those are only added there if
> the upstream doesn't have a man page. libxcrypt does now have this so
> the doc isn't needed from there.

Thanks for explaining this,=C2=A0=C2=A0 V3 is sent.

Regards

Changqing

> I suspect a future version of man-pages will do this anyway.
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192694): https://lists.openembedded.org/g/openembed=
ded-core/message/192694
> Mute This Topic: https://lists.openembedded.org/mt/103008188/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

