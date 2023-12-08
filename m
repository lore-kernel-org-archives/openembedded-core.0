Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87867C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:14:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36557.1702044840225937656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=qvNpIUFp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0706163bac=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B88suMs028322
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 06:14:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=1fY+HwU+eOZBOa8KFMg
	DLkTykjga/RgrbL9OUsMGDrI=; b=qvNpIUFp4zAw6qh4Lu7Pi92+D9RFqZ5oWDg
	PFn/4zaOAiv30beDP9fYDYdnrM+YeeklDcPf4YgT8LpnZ3QxUvtkHPOAT1CLdy9b
	1Hg7obDU+1McE8ky22VbFGEgdMPHWKs/QdLnkT/0zO3apHRxklcRZFM1huIinTgb
	BYdXHAB/ym6a6EPUwJF3MVoJ/8vJFsekUNC6bwIhp+nmNFa1IMhTVEXIX8fRwqUi
	stU+xsozV5jiKgoboky1GsqvQ0oeq7jd6oK6t6DgQLA1wo4W6KlxvoBP4tx2+MR9
	5ll4zPXQZgBFTnJVT9wVipW5N6XNcFHs99WWaTsXMPD/nvnCugQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r2vn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 06:13:59 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B8ED1cs030054
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 06:13:59 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r2vn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:13:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcGVrxNfRkAtXvBPCGLtdoQVeNz54f4ublexfpkY40HmwSZKZtsJokV6qOXcg6MCQd8UvZnpQd0WyvDcWPxhc0hTchhZzJNzRRqFTZpwTHuJNsdQrTWYlAsbBSj2vmRz5LtvnS2GAZDgfNSotPxF/EsrlX/d8uZm1Wo3frybRLqM+kEh3q2DbLftk9pYj/KSk31YIeLdAyq/9voVaydEcYvftDcOyeW0zYTAOm8KIYKIIwbMeODYoD6P+pBFcslrh4hJSnnyr8Iovc7XOJdKGvseEOpnI4uucmRCbdC+qnXZyUugPp+gIVHEJ0Vdeuec+/GIwysZOjtUFlQgj19lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fY+HwU+eOZBOa8KFMgDLkTykjga/RgrbL9OUsMGDrI=;
 b=TZG9z6KSOJW3a5QCJDGa9XsXUx+xT/k3ut0/55dx6ZfhQe1+4XEbHsFHR5/euIIEOnO+QUo4CtOtffnZyhEG7H2MLdKh3jq5dxMJH0Gai4h9nGnR+GICg1KBCnMFwcPxq8dCM0oBNeDuG0SgnDRjgdXK7eIBXR3qAovp0CmiIDXo0CrhuHlwmlaLfIsCTU5w2TGqnYEgIqzwRKozA03DVwPA51AOvzJI72BF6NNO8cYun0Le54407KTDMuFeeCNS1xKWojebv+lSII6D6C6jB5pYHSUsPNCBfi9xOo6Cui5NqILD2LbIqcdPQWrEZbFvzCoKFCkWSVcIw3FNxxpfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 14:13:55 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 14:13:55 +0000
Content-Type: multipart/alternative;
 boundary="------------JPWCaje0gaCTSWMXzSFCqccl"
Message-ID: <0b20b0f2-9cf7-4afa-9508-91eef56d8122@windriver.com>
Date: Fri, 8 Dec 2023 09:13:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.70.0 -> 1.73.0
Content-Language: en-CA
To: Alex Kiernan <alex.kiernan@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
 <CAO5Uq5R1hYwo+oa4QR9bFQif57OrXbWEY0QSZfJZZHmipfajqg@mail.gmail.com>
 <82c9303fff1e1f728b3aa08c47d75efbf239da88.camel@linuxfoundation.org>
 <CAO5Uq5RLXtwaVULLQWh_atppYvO_r-qibP7AMyE7KiLyj4SAvA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAO5Uq5RLXtwaVULLQWh_atppYvO_r-qibP7AMyE7KiLyj4SAvA@mail.gmail.com>
X-ClientProxiedBy: BYAPR01CA0053.prod.exchangelabs.com (2603:10b6:a03:94::30)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffa3331-c23a-46bc-2db9-08dbf7f7e9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c0V7t7BAd5d0I+yetZkbyg3R2HD8WWHezDyhd17+X/wPS+3Y/WW15sJE6RlfbxMzmyink9UT+96NMWkuRmAm3XFUATsRkYZR1dGI7TcbiWV20HWiFzLdm6VTT46jo2PM/YeDtKyjdfXgGTCblKawIvLvGPXfSZR/1KSKJofZ8mQBVXNCNmY0ZRjjwHovwprADt8Z1v4QQFgDUNMdDrdsp/z94oQNIH4d4FKYN2dF7O/f5r0Asn4qeYSRz6iDixxSRpZ5DAwP3d64azUedhEYBZs7wtPhM66VM3FcbHI5zu45vnYnjstXT1HzU+mkq6FDhyY8hQizs6wd8PysgRTzbReAqJRr0zGFNaiv3KZ0fY6MeBtiy4aEZ9PjQ5iH4x4FHiRLvyXVEHyIizznPXDEENpvEkvortOkeIF/qeVOEYBpfPBv9AOkqR7lWOGEmrE1Ve6e9ZaNv/6XGz3r31Vt1HydvkxhuOTxFtstL/vyrPiF9GutRcEUwB+2xYPKbXsjeVVlSLKnHN2AHiD8opSF1VT+ORsr1Sgg8eURDAlkmogao2lkup5jOGC3DOTzWqvKbjBup/34mig14N7o079Frbl5gkHsW56Bj4iWyIDazqY35QCVbCEzPc8FKuGTv/q9tDXAk9JqJ2frY11xiiH/8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39850400004)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(6506007)(6512007)(26005)(2616005)(107886003)(6666004)(86362001)(166002)(31696002)(36756003)(38100700002)(41300700001)(8676002)(4326008)(5660300002)(8936002)(33964004)(83380400001)(316002)(66476007)(66946007)(66556008)(2906002)(478600001)(6486002)(53546011)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3V6SkNjWlRpOUtldERYVkZWdFBuY1JsY0NJNGJORUxsdVV6c0daVUR1M05h?=
 =?utf-8?B?MGZVNUt4a2tLd1U0TU1lMSsrNUtOWDJad2lFbzdXcXNHVkN0MUdCcGFabUxo?=
 =?utf-8?B?RWNHYjZacWpTS01pZ2FEcFJNbU9sRlV1VHBzNEhNUXVyUE1JaE5nUktpdDZm?=
 =?utf-8?B?VTVHa2JlREkvZ3dnbVdvM3Qwb2JLR1haclBzR1lMT0VFU0xZYXJ6Z1JxaXFT?=
 =?utf-8?B?ZWU2VXhXKzNyTEFoWkx3KzlXMCs2YkRld3cxNnZMZlM5RmFMK25qVm5xRFph?=
 =?utf-8?B?TjZscm5zam1Fa0l3bUFNc0dRc1V5UmdCZDZ6OVZ4c2dtWFc1akl6amtsQUJP?=
 =?utf-8?B?NXNmSnFHQndqN0I4T2JUSlhBUlRCb3FRSGJSK09pYVNmdldrdUs3eWxhTmFO?=
 =?utf-8?B?K29QaVkxUFpDQktoUlVsaE9hZVpZSkFsSUszSTdsRHNUWjYyZ2RpV2xVWi9v?=
 =?utf-8?B?RDg5dkR1dWFaZjE1S1ZVd3c0dnAyTFdOQU9oQk52R3ErMkNzSVA0ZDBuZnM5?=
 =?utf-8?B?TEN6eUdHV0VYZlpZbFM4ZVlQelQ3SENJR3Y1aTgxTVdpOVFyZVFyVnIwY1Ew?=
 =?utf-8?B?WEROUkFXbnkzd1hBVmUzUGdkcFEvM3lweUR1d0I4dUhqdktyaW1saVo1TUdo?=
 =?utf-8?B?cGhvcXpVVjBEVnh2ckFxTkJoQ25SQTNJZlZLVnl3bUtyWDEvYXQxVW52QUhw?=
 =?utf-8?B?MEdveDRicmZyVDVDZmNkdmE2VHF2WjU0Q2JpbTA2eVcwNGp0eFFCSGJWMm5Y?=
 =?utf-8?B?SFNsb1FJUkRocHVUNWZyRWxwY2g4QTMwdWZrU09vMVd5RCtabkx3WjdGM2xj?=
 =?utf-8?B?SHJQVUpUQUk5YXJZTFB0M0JWdVpJakNVYVdZTVREQk1kMFdOeVNGRDlRRHh1?=
 =?utf-8?B?OHlpK0Z6T1c3ZkIvL1dHTkZLU2I0a241dWtScE52ZFpoNlFlK3hUYjZpVzRj?=
 =?utf-8?B?Zm01SXNJSmtBSVpDYWQybEdUSDQvdWt5Y0hHN1UvMndsQzZTRERjUlRTTS9T?=
 =?utf-8?B?NjZhSkMxR0krM0gzMU5EUVdHMlh5Q3FWRUQvTXc5Ync5OW5vSXB4MHhlZE1E?=
 =?utf-8?B?ZEVxY1BGdWdkdCtLZ2ptQXZpREhQRWJRTWI0UjkzejYrak9vS0V2K1RaU081?=
 =?utf-8?B?aithS3ZJT0dOcXdOM09DTGREV29BQWQzQ0ZMSE91YXY4T1VYWWNlRWE0U3Yr?=
 =?utf-8?B?Ny83M01GT1hoMkN2d2pNQld1NDBDN1poZzU0bHAvdWZZdlFRZVhOTEpNdEpz?=
 =?utf-8?B?ZUZGNWVBY3N0YTlsTTF5NTl0UFA3ZUNNdHdVYk1zTVg0dThxWjJkd2Vwb3o5?=
 =?utf-8?B?cnNqcjEyUVFNTVZHUGlTSnFwQ3BiZXlzbHk4MTNGNmZhai9JSUs1ckk3eGRP?=
 =?utf-8?B?ZnhJUXdxa3BQS21VQlhabG9ML2tERUJHbFlRSHNnUmZHajhzNXQvS05aOHVW?=
 =?utf-8?B?dnBhT2tTUXljVzBPNFRhcVUzZGVrMHU2b3NQQ2pYYkRXZzNPL1g4Z0ZscHc1?=
 =?utf-8?B?eHY3RXlwbHpNMElVRktxUy9XRUtLTHlnTkJGYStEektja3JQVHZVNXNlUmd2?=
 =?utf-8?B?TmNYNmFUd1htU2tITElsNHNLbnFpaUxZck9NZ1J6Zyt2OEx3VDZpRmpCbEF0?=
 =?utf-8?B?MFRsN3dNN0N3blhPRzFKUWhONzFVSkZBWXh2UVJoVUl3RDBvOEYwSVMzSkpJ?=
 =?utf-8?B?Y2dSRDlYN240RjRKSU92dDZlMnV4ZUNRaFZTL25kZ3NIWmJLWHZWZSt6dENx?=
 =?utf-8?B?Y0szZ2lwaEdpUU4ybEczR1VPYTIxRGE1MXVpdk0vVEZwNitnUTRhbnhuTDFG?=
 =?utf-8?B?V21VaU5rSjFGeXp4YzZ2R0VIdlZDNHpBc3AwaEJ5Zkl1NFd1MXh5Z3VSZGZ4?=
 =?utf-8?B?eDZ0WjdaWVdET3EvL1FpZzZ3MFAxb0Z3cERmNEZFNGk1d1FyV1czd2VsT0Vz?=
 =?utf-8?B?Zmc0L2U1ZlI3WXBQT3RaSHlDd0VhU0hZdkFrMEFkWWljSjQzOFlHOXZVcEN4?=
 =?utf-8?B?b3lYOGtySEV6RnpGMnk4OVZWai9ubS9SY2VLaGZvSTBYeUQxbS9yaWUvVUIy?=
 =?utf-8?B?UjhQN1hBNjdvME5CVW5hTjdFZWNkemxMdDR4bGhQeHRwMGRlN3VEZk5NSnRK?=
 =?utf-8?B?NFNteGNJWDM5eTlzOEVHMGJyQjlxOENLaWxnRk5LbVBRYmYwWUw1K2pwMGNF?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffa3331-c23a-46bc-2db9-08dbf7f7e9b2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 14:13:55.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYszvPFQ6U0xitaKbm2X14tGxzXMX55gJ9BuS8NT/cZb+0RtiuMIsefwHQ3YVrQ6CiVb7K0psn/4ZhNF4kKE+LPNkYzma2R/Im+abxDcxEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
X-Proofpoint-ORIG-GUID: fHYi-7uXZjYN_tqwK6mTVvVlUUJz5XLY
X-Proofpoint-GUID: oMdNtwswLw5ZAOe-21GxzZU_hu9uPU1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192072

--------------JPWCaje0gaCTSWMXzSFCqccl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B88suMs028322

On 2023-12-08 9:07 a.m., Alex Kiernan wrote:
> On Fri, Dec 8, 2023 at 1:55=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>> On Fri, 2023-12-08 at 13:47 +0000, Alex Kiernan wrote:
>>> On Fri, Dec 8, 2023 at 9:56=E2=80=AFAM Shinde, Yash via lists.openemb=
edded.org
>>> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org>  wrote:
>>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>>
>>>> In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from t=
ier2 to tier3.
>>>> The mips bootstrap compiler is removed from src/stage0.json file and
>>>> so the same are removed from rust-snapshot.inc. [https://github.com/=
rust-lang/rust/releases/tag/1.72.0]
>>>>
>>>> Drop bootstrap_fail.patch, getrandom-open64.patch
>>>> as they are merged in upstream rust.
>>> ]>
>>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>>> ---
>>> If we're going to go down the road of disabling the rust oe-selftest
>>> (and I don't see a better option right now as we're well behind), I
>>> have a series which steps us through each of the releases up to
>>> 1.74.0.
>>>
>>> It also avoids the need for the library/test hack (upstream has a new
>>> target we can use for libstd).
>> This sounds useful, particularly this last piece. Can you send it? We
>> could probably combine it with 2/2 in this series if Yash/Randy agree.
>>
> I've pulled that in as the first patch in the series so if you were
> bisecting you wouldn't see the oe-selftest fail on upgrade to 1.71.
I was just about to ask you to do that! Thanks for being one step ahead=20
of me!
> It's on top of the cargo cleanups I posted yesterday, so I suspect
> those are prerequisites (or I could combine the two into one series?)
I'm not sure, let's see it on the list and review there.
>
> I've not tested every step extensively, but they all build and I've
> tested cargo in most of them manually inside qemu.
>
Thanks Alex.

--=20
# Randy MacLeod
# Wind River Linux

--------------JPWCaje0gaCTSWMXzSFCqccl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B88suMs028322

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-12-08 9:07 a.m., Alex Kiernan
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5RLXtwaVULLQWh_atppYvO_r-=
qibP7AMyE7KiLyj4SAvA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Dec 8, 2023 at 1:55=E2=
=80=AFPM Richard Purdie
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfou=
ndation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, 2023-12-08 at 13:4=
7 +0000, Alex Kiernan wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Dec 8, 2023 at 9=
:56=E2=80=AFAM Shinde, Yash via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde=3Dwindriver=
.com@lists.openembedded.org">&lt;Yash.Shinde=3Dwindriver.com@lists.openem=
bedded.org&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">From: Yash Shinde <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">=
&lt;Yash.Shinde@windriver.com&gt;</a>

In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from tier2 =
to tier3.
The mips bootstrap compiler is removed from src/stage0.json file and
so the same are removed from rust-snapshot.inc. [<a class=3D"moz-txt-link=
-freetext" href=3D"https://github.com/rust-lang/rust/releases/tag/1.72.0"=
>https://github.com/rust-lang/rust/releases/tag/1.72.0</a>]

Drop bootstrap_fail.patch, getrandom-open64.patch
as they are merged in upstream rust.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">]&gt;
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Yash Sh=
inde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windri=
ver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">If we're going to go dow=
n the road of disabling the rust oe-selftest
(and I don't see a better option right now as we're well behind), I
have a series which steps us through each of the releases up to
1.74.0.

It also avoids the need for the library/test hack (upstream has a new
target we can use for libstd).
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">This sounds useful, partic=
ularly this last piece. Can you send it? We
could probably combine it with 2/2 in this series if Yash/Randy agree.

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I've pulled that in as the f=
irst patch in the series so if you were
bisecting you wouldn't see the oe-selftest fail on upgrade to 1.71.</pre>
    </blockquote>
    I was just about to ask you to do that! Thanks for being one step
    ahead of me!<br>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5RLXtwaVULLQWh_atppYvO_r-=
qibP7AMyE7KiLyj4SAvA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
It's on top of the cargo cleanups I posted yesterday, so I suspect
those are prerequisites (or I could combine the two into one series?)</pr=
e>
    </blockquote>
    I'm not sure, let's see it on the list and review there.<br>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5RLXtwaVULLQWh_atppYvO_r-=
qibP7AMyE7KiLyj4SAvA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

I've not tested every step extensively, but they all build and I've
tested cargo in most of them manually inside qemu.

</pre>
    </blockquote>
    <p>Thanks Alex.<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------JPWCaje0gaCTSWMXzSFCqccl--

