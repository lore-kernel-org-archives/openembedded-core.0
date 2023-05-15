Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B7EC7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 10:04:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.84521.1684145072509464408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 03:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=449953b4b4=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F9MgZl019353
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 03:04:32 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj5u2sfy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 03:04:31 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FA1bdt003717
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 03:04:30 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj5u2sfy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 03:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnlLZZa/nl5vU4CCODg09jUVzgkuCauuOU9a4dvhYe78poQ+9bgw8BLOLk/uBWAEkvmWeOGhRaR69Jdffeni5ltdLUMILrTHdDeTTpq6EHL4kP9dqpunM2fAcpk/pu/ec+PmqAFgEdCPGvjt9WCnhQli+MtP7sYHukBQG7GZMMl319Z7IViXIq8ga4MhAMh2TGyXS1MfIObQ4pwleZf0ThITM7p5WLpyGErJO5DkFm44vWsDMUm8f3cOWzGhqdgvpTaYFaypMOPiIhs+0exXgr5X8dbBYSV0Vigo/MRigvw2i4kb1MuYw85h4t6PjFUPxpH69AXFoLnpy5qEpgpNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PReBQwH7lQaiv/CWfPPNMSlG6WEufQNI/I+BSic1F+0=;
 b=DTgwhSR42bSvFCibLDERXP+BSLQw7QBw2Z9lxKxbRhaAIbYYuBZPk5i6Q2sH2kzbfgjfP9BN2naSQseZaLZ/ylZQgscWxiPls/UaWsN+vLmMP9OOLO9XsL2dmyo1BkZepjaSd06rTww5/pOPYnRoFj+eP1tJEIBPziG+46eGNImbdJFiHc3vd76C8Tci4u7jukXMtfTuHebHwmjx5diS5H4OcCMfr4szXkttqH/k8KUwPfPhYFusF7cXV/9aEKnFdT/9ZrDRQcBVPXFRqQygEIDfG3ieDJbwpxgBXPwyOo0T5j5Y3onlQt1se5SjGKi24u0UJjvPEsSot/yOgzUCTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 10:04:27 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6387.024; Mon, 15 May 2023
 10:04:27 +0000
Content-Type: multipart/alternative;
 boundary="------------lqhr60tqWtfuPZV60aO2XmB6"
Message-ID: <312184e0-32cb-ab57-50c0-7a8c5519a0c7@windriver.com>
Date: Mon, 15 May 2023 18:04:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
 <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com>
 <175E6CB55C617FA5.27409@lists.openembedded.org>
 <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
X-ClientProxiedBy: TY2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:404:56::34) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|SN7PR11MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: b4753fcc-4363-46bf-1b75-08db552bc439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uSTyxzM1B+0kYZ4mIsVgO90kpkg15npN5vD4MLlWl3friz5NVAOdxAxc0pzKSuVtHJJnXB+ma6xkURz2NrAvtUDb+QGHFVZFquylQXy1zRL5VT5/u+4eeHRb8OpS9PJVEJ5azUCURO5Z1cpfKSGO4b/4RrHOuNXOxkCAZXNbYiRtXRZsLaLzNFJWF4pTxV7PdMqVO7GQOPlMr/5vhi47/e5LZpSLzCQRWg76GpZqMwlGKcgJIGnt7fe6vEutvwysk4/E7jxxARqj2NKnsu3kc5Lct/bwowkkTJ9gdiEEnqL6oSc+vm7HH99ov5+ycE2JdkVY6UVP8E8tabkRyevxH7OOnFe0PNqg567JKO2bBWm0tW4zGazrOdKO6zrE05FKSaqdYQpI6cCCbK5Lseflw+r/k/5iYVdMVGbp4aPUhWYi8m1iog55313lM00lHLQCQQRba7Wgs7bTV+b4GCT7bxEPn1j4agYk4JwvF4zhyF21Wq2qxso4pbvjNyQ4XFwyCeaKLhJR7CLymfSDg6kLFl5rvOouPLwCR1Vi4C4RjnfoiGgDsalThVRFzBGknw4rF7kypgicgGvgbjas+9jae1lgONONrTw7s5fPGC7JIO4K61g/Vk3Uwz6HYJBDGurMZZk2PjKevX8RPAzeosa42A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(451199021)(478600001)(6506007)(186003)(9686003)(6512007)(53546011)(26005)(6666004)(83380400001)(4326008)(6916009)(66556008)(66476007)(66946007)(83170400001)(31686004)(966005)(33964004)(6486002)(66899021)(41300700001)(5660300002)(316002)(8676002)(8936002)(30864003)(2906002)(44832011)(38100700002)(166002)(31696002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDhNK3NQUy9YTkl4T1pFN0FZblhabGlubFlpZUxuV0QrRTBsWEZkNWNRSmhl?=
 =?utf-8?B?dXNFNlNOQXp1QjRZdXJCTlQydktNU2Zaak8yc1k5ZkJiSmlxdU9ySnhmQ09T?=
 =?utf-8?B?Y2hEd3NsWnB5aml1ZFRkWStSYVpmcUxNOGNBOG1wNWFqZ2NzNXNKYkdmK0Iz?=
 =?utf-8?B?Z1BIRStqOGlhMDQxd2g5cjB1cW82dXorTHI1T2h6dWhjNENQRlpxMHd1NjZz?=
 =?utf-8?B?eVFMREVXbE8wWUNaSWV0Z1F6MTJIT0hQTDhOeXZXSHh5RUVsQXh0NjBsaEp5?=
 =?utf-8?B?OXJ0OGNiRjFqa3ZtYkpNNXYwaWZRUm4xektST1daV1NCU3Z5UldMMDJETFVJ?=
 =?utf-8?B?TmJwTWJLVzQ5ZUlpckUvRzVZT00rR2J2Yyt6QVZmOHRKQjc3Y2pLd2VJYXlI?=
 =?utf-8?B?UmZNRjVBcG9GSjZoYmxtdFFvYzdpMVpyTDgyMmQvKzh4U1VSTFBGZUZPdnVn?=
 =?utf-8?B?b29GUEhZVDFBeHpTNjl6MjNnNmlnL1dkczBSeXdzenlZNkJIYWJFS3Ira0li?=
 =?utf-8?B?ZFRHQ2tVcDFmSUtnR1JPMnJROGVmV01XVXpFaW1HQktTYjlyZXhWSjFRTnZw?=
 =?utf-8?B?UFVHVTJ0bTFVUitIY2pSTlhwZFN5eGZUaG5XWldDZCtRQXdGTldMNEFTRHp1?=
 =?utf-8?B?bkZPL3RsdVlxMGVsamRQRzNIMTdsUHhVcUE2dkl1Zk5TY25KODV5V0VKMzh5?=
 =?utf-8?B?OGhoSWp6NTZLOS9GYmxMTXBCMHVTbUFDMjdERmUwM0lUK1UvMEgvQkMyU3lB?=
 =?utf-8?B?aWhjTW1rbTdWbldoUlU2alFYMk03RU9SSFRkL1pvNkhqMVp6VkFnRFNoSzJY?=
 =?utf-8?B?YngrYWRJWXRoeDhHc1JYdGh0ZVBpaGFGZURYV0lvSWFiSTJ2SjNQQnplSnI4?=
 =?utf-8?B?VHpucjNlbk92VER3K3lvaTRRaTN5SDhKOW4ya2taK1FZb2FnVFN1Qm13SzAx?=
 =?utf-8?B?d1R4QW1oNUh5T2tUNkNoUVhtV2hrd0x0QTgzTzg0bHQyY3U0NEpIdjg0U0lW?=
 =?utf-8?B?Um5OcVplZFVTOVZ4S1Q0cDBwenorTTlQanVmNUxpeEJZL1FGc0lEb3VyaEFa?=
 =?utf-8?B?bHhJbjlLQkZjbzF6Z2JKUkI0OWxaUnloYm5CUVl4Y3VNMDNPK1VLSDQwMkhV?=
 =?utf-8?B?cTRGa3dGZmFqeDdhZjNLZkF2OEpsSVFjYU9OY2JaQXRKL0hmS09SRXd3WEs5?=
 =?utf-8?B?YXhDNW1ITlo0OUhHb1dZVmg1R2tMbnhWZUZibDdsNkVEMXZVNUxJTHpDSnhY?=
 =?utf-8?B?VzhRUmtFUlYzU3RtZTVoRHN4TStiTHBvYUYxenVCUkZTc3cxV1FCanZlSHdC?=
 =?utf-8?B?OC9vUHlDakJyQ1lnMmxSNk1KYWN2R3pPUEZMRGdlb1Z0T3hCZ05qYVdLSUxl?=
 =?utf-8?B?clBjc1A1MUdwMERsdm5DN0NWMFFBQ0d5Y05IMXVaYTZhcVRWMk1hYldHSmd0?=
 =?utf-8?B?R21XSjVUMjFZZkVoR01jRGpHSVVGWW8zNFFWTWVJZzNvZ3ZZMkNVeTZJNkJx?=
 =?utf-8?B?NWpROWkzcDRNZlNKK2loUFFST01CR3RzbEhuSE1PdDM5SUdQQkYvQ1JRd2ZE?=
 =?utf-8?B?OERHbWZuM2VqRnNMWGtlZGpqVjlFSm5Ea0RQekZVbUtaOTB6K2V6WkhvVWpI?=
 =?utf-8?B?dTFNK1hia0RvQ2k1UkxJZHNZZHpKZHBDdUc2Ui9leHRoa1N5YU1mcHU1NTlI?=
 =?utf-8?B?S3Z0b2NqeVV1TVZKSTBXVEFHak5Va29hMElSNGRLRzYzSzkwYldlS2pJaksx?=
 =?utf-8?B?UzBjbE90dElLVTRqL2VOVDFWeXc4R09KREthTWtqU2h0WThmTE1HUmsrUitj?=
 =?utf-8?B?bENORlJmVW9VaTNOZk1nMm1aQXREM3hJQktBbGRVNkhvVWl1Nk1ma2dmcURN?=
 =?utf-8?B?SnBBbklLOTByNkN1VXVTbC8xaVpKRzZkU2pyeTY0UXkrVXp3UlUyMVAxVnZZ?=
 =?utf-8?B?OExJaWlWNGJUNkgrT2ZnN3RBYW9zL3lvYXhYVnlLQTZNNnB3aXRGOW9GVWhG?=
 =?utf-8?B?K1dwWFNLVElYa2FOaXlaM05mMm1PMStVWjdLeEU4aGhNdUpmU25wWk9GaUxr?=
 =?utf-8?B?TEdQdG8zK295SS9ZME1XanVCVEJaUHVMTUkvMVZkeVIydWR2UDk0QlBLNW56?=
 =?utf-8?B?bFNzQTRTSXdKVHF6V3YrVzIzL2Z6QUJoQjNMU3BRbkV0ZGZyTSt3UWNBdXBR?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4753fcc-4363-46bf-1b75-08db552bc439
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 10:04:27.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4CsOSZjPqxTm5+E7N1RyEPymlsM1GbnISzASlp7CVm3QFngRHIYSPrzgdAYRNYSRjZ4HNNS1UcLo6/OAbrabo9cDshQnm9XUzljfVO5hA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
X-Proofpoint-ORIG-GUID: HRMBnZp0gogGU0gh9KzypRRoo3mVMBYQ
X-Proofpoint-GUID: 1oeyme66PA2gP4Tv6kBwWstQcejAxcis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 10:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181241

--------------lqhr60tqWtfuPZV60aO2XmB6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34F9MgZl019353

Hi Bruce,


Sorry for being late..


On 5/13/23 09:16, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org>  wrote:
>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
>> <xiangyu.chen@eng.windriver.com>  wrote:
>>> Hi Richard and Bruce,
>>>
>>>
>>> Thanks for your suggestion,
>>>
>>>
>>> On 5/11/23 00:25, Bruce Ashfield wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the send=
er and know the content is safe.
>>>>
>>>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org>  wrote:
>>>>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
>>>>>> From: Xiangyu Chen<xiangyu.chen@windriver.com>
>>>>>>
>>>>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the mak=
e would report some
>>>>>> errors due to pahole and elfuitls is missing, since this is a debu=
g option, so conditionally
>>>>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need=
 enable CONFIG_DEBUG_INFO_BTF
>>>>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" i=
n local.conf to solve the pahole
>>>>>> and elfutils dependency.
>>>>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with =
this
>>>>> option documented somewhere?
>>>>>
>>>>> I also think the mention of devshell in the commit message is
>>>>> misleading, this issue happens regardless of how you enable the opt=
ion.
>>>>> There are also other ways of enabling this than local.conf, you'd
>>>>> likely not want people doing that at the end of development.
>>>>>
>>>>> I'm curious on Bruce's opinion but to me this at the very least nee=
ds a
>>>>> commit message rewrite and I'd question whether the docs elsewhere
>>>>> would allow someone to discover this workflow anyway.
>>>> I missed this entirely, thanks for replying to it, or I never would
>>>> have noticed.
>>>>
>>>> This mechanism isn't appropriate for these dependencies. I only adde=
d
>>>> it to work around pkgconfig issues (which we can more cleanly solve =
in
>>>> newer kernels  (see what I've been doing with make-mod-scripts) .. s=
o
>>>> it can eventually be dropped).
>>>>
>>>> We are already enabling elfutils-native conditionally on a
>>>> per-architecture basis (currently only x86-64).
>>>>
>>>> If we need it on more arches now, we should enable it in the version
>>>> specific recipes, or actually, we have moved far enough into newer
>>>> kernel's that it could be in the .inc now.
>>> This commit's background was some kernel debug options needs elfutils
>>> and pahole native package, since the issue happens on enabling kernel
>>> debug options and not all people needs it, so I conditionally add the
>>> dependency in KERNEL_DEBUG_OPTION.
>>>
>>> If possible we can enable it in .inc because newer kernel tools like =
btf
>>> are support using pkg-config to locate the libelf instead of finding =
it
>>> from /usr/ folder, so we can use elfutils-natvie instead of installin=
g
>>> elfutils package on host PC.
>>>
>>>> Similarly, we should enable the pahole-native dependency on a per-ar=
ch basis.
>>>>
>>>> As Richard mentioned, what's the reproducer to see the errors ? it
>>>> must be more than devshell.
>>> Yes, this happens on devshell and normal world if some kernel debug
>>> options are enabled. We can reproduce this issue with following steps=
(I
>>> have found the issue with kernel 5.15):
>>>
>>> 1. enable kernel option CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
>>> CONFIG_DEBUG_INFO_BTF
>>>
>>> 2. build the kernel image, the compiler would report missing libelf.h
>>> and gelf.h which contains in elfutils-native(this step not happens on
>>> x86-64 due to it has been enabled).
>>>
>>> 3. enable elfutils-native by manual, the kernel source code can be
>>> compiled successfully but failed in final step due to missing pahole.
>>>
>>>
>>>> If you can follow up with the steps to reproduce, I can take on the
>>>> refactoring and broader dependency cleanup question, since I can tes=
t
>>>> the wider matrix at the same time.
>>> Thanks, my local setup might missing some corner case, this is anothe=
r
>>> reason I enable those native packages limit in KERNEL_DEBUG_OPTION :).
>>>
>> I've been thinking about this, and I've come to the following suggesti=
on:
>>
>> I plan on moving the elfutils-native to linux-yocto.inc, out of the
>> version specific
>> recipes.  I'll also drop the architecture specific nature of the
>> current DEPENDS.
>> The need for this is much more common now, and all of the reference ke=
rnels
>> in master are new enough. The elfutils-native build dependency is not
>> significant
>> enough to worry about adding it for all architectures. If it does
>> become a problem,
>> there are options to make it conditional again.
>>
>> I can drop the HOST_LIBELF_LIBS work around in the linux-yocto.inc, as
>> we can now properly detect libelf via pkg-config. I didn't need it in =
any of
>> my testing. Again, if this proves to be wrong, I'd enable it in a
>> different way now
>> (using what I've learned from fixing make-mod-scripts).
>>
>> As for the pahole-native dependency, there's been a "developer" kernel=
-type
>> for quite some time. The design intention behind it was to enable opti=
ons like
>> this, and not make the "standard" or "production" kernel's too large b=
y default.
>> So the dependency could be conditional on that kernel type ... but we =
don't
>> want to break other kernels just because they've enabled that option. =
We also
>> don't (and won't) get into the game of looking for individual options =
in the
>> .config to enable something, since a) it is too late b) it is a moving=
 target.
>>
>> So that leaves the following options: a) enable pahole-native uncondit=
ionally
>> on the arches that support it (x86-64, aarch64) (and also move the pah=
ole
>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specific,
>> and simply call it KERNEL_DEBUG, when enabled, we could conditionally
>> add pahole-native (I'd also submit documentation for the functionality
>> c) something I haven't thought about ...
>>
>> I'm moving on the implementation now, but will adjust course if
>> there's something
>> I've missed.
> I have my implementation done, but I'm wondering what your configuratio=
n
> was for testing pahole ?

I have tested on a devshell, with oe-master branch, the kernel version=20
using 5.15

1. enable pahole-native and elfutils-native in linux-yocto.inc as a=20
dependency.

2. enable CONFIG_DEBUG_KERNEL=C2=A0 CONFIG_DEBUG_INFO and
CONFIG_DEBUG_INFO_BTF under menuconfig

3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning=20
PKG_CONFIG_SYSROOT_DIR

4, make


If the test environment using bitbake, then we need to remove=20
PAHOLE=3Dfalse flag in kernel EXTRA_OEMAKE in=20
classes-recipe/kernel.bbclass, otherwise, bitbake would report missing=20
pahole error.


> I'm seeing the following in qemux86-64 at the end of the build:
>
> | Unsupported DW_TAG_unspecified_type(0x3b)
> | Encountered error while encoding BTF.
> |   LD      .tmp_vmlinux.kallsyms1
> |   NM      .tmp_vmlinux.kallsyms1.syms
> |   KSYMS   .tmp_vmlinux.kallsyms1.S
> |   AS      .tmp_vmlinux.kallsyms1.S
> |   LD      .tmp_vmlinux.kallsyms2
> |   NM      .tmp_vmlinux.kallsyms2.syms
> |   KSYMS   .tmp_vmlinux.kallsyms2.S
> |   AS      .tmp_vmlinux.kallsyms2.S
> |   LD      vmlinux
> |   BTFIDS  vmlinux
> | FAILED: load BTF from vmlinux: No such file or directory
> | make[1]: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-sourc=
e/scripts/Makefile.vmlinux:34:
> vmlinux] Error 255
> | make[1]: *** Deleting file 'vmlinux'
> | make: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/M=
akefile:1255:
> vmlinux] Error 2
>
> I haven't looked into it at all yet (but will do so over the weekend)
> .. but I thought

I haven't seen this problem yet(i'll pull the latest oe-core and meta-oe=20
code and try again), if possible, could you share a patch with me so=20
that we can test it together? thanks.

> I should check with you first to get the details on how you were testin=
g pahole
> functionality.
>
> Bruce


Br,

Xiangyu

>
>> Bruce
>>
>>
>>> Xiangyu
>>>
>>>> Bruce
>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181185):https://lists.openembedded.org/g/openembed=
ded-core/message/181185
>> Mute This Topic:https://lists.openembedded.org/mt/98753313/1050810
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
--------------lqhr60tqWtfuPZV60aO2XmB6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34F9MgZl019353

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi Bruce,</p>
    <p><br>
    </p>
    <p>Sorry for being late..<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/13/23 09:16, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4M5JnHLpea+EEWG9gD2SPEG_R=
9KDjr6zGVEvRHusV9upQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:bruce.ashfield=3Dgmail.=
com@lists.openembedded.org">&lt;bruce.ashfield=3Dgmail.com@lists.openembe=
dded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiangyu.chen@eng.windri=
ver.com">&lt;xiangyu.chen@eng.windriver.com&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
Hi Richard and Bruce,


Thanks for your suggestion,


On 5/11/23 00:25, Bruce Ashfield wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email co=
mes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfou=
ndation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 2023-05-08 a=
t 09:33 +0800, Xiangyu Chen wrote:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">From: Xiangyu Chen=
 <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiangyu.chen@windriver=
.com">&lt;xiangyu.chen@windriver.com&gt;</a>

after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make would=
 report some
errors due to pahole and elfuitls is missing, since this is a debug optio=
n, so conditionally
add an option named &quot;btf&quot; in KERNEL_DEBUG_OPTIONS, if someone n=
eed enable CONFIG_DEBUG_INFO_BTF
option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D &quot;btf&quot=
; in local.conf to solve the pahole
and elfutils dependency.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">Is this a defined wo=
rkflow somewhere? Is KERNEL_DEBUG_OPTIONS with this
option documented somewhere?

I also think the mention of devshell in the commit message is
misleading, this issue happens regardless of how you enable the option.
There are also other ways of enabling this than local.conf, you'd
likely not want people doing that at the end of development.

I'm curious on Bruce's opinion but to me this at the very least needs a
commit message rewrite and I'd question whether the docs elsewhere
would allow someone to discover this workflow anyway.
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">I missed this entirely=
, thanks for replying to it, or I never would
have noticed.

This mechanism isn't appropriate for these dependencies. I only added
it to work around pkgconfig issues (which we can more cleanly solve in
newer kernels  (see what I've been doing with make-mod-scripts) .. so
it can eventually be dropped).

We are already enabling elfutils-native conditionally on a
per-architecture basis (currently only x86-64).

If we need it on more arches now, we should enable it in the version
specific recipes, or actually, we have moved far enough into newer
kernel's that it could be in the .inc now.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">This commit's background=
 was some kernel debug options needs elfutils
and pahole native package, since the issue happens on enabling kernel
debug options and not all people needs it, so I conditionally add the
dependency in KERNEL_DEBUG_OPTION.

If possible we can enable it in .inc because newer kernel tools like btf
are support using pkg-config to locate the libelf instead of finding it
from /usr/ folder, so we can use elfutils-natvie instead of installing
elfutils package on host PC.

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
Similarly, we should enable the pahole-native dependency on a per-arch ba=
sis.

As Richard mentioned, what's the reproducer to see the errors ? it
must be more than devshell.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
Yes, this happens on devshell and normal world if some kernel debug
options are enabled. We can reproduce this issue with following steps(I
have found the issue with kernel 5.15):

1. enable kernel option CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
CONFIG_DEBUG_INFO_BTF

2. build the kernel image, the compiler would report missing libelf.h
and gelf.h which contains in elfutils-native(this step not happens on
x86-64 due to it has been enabled).

3. enable elfutils-native by manual, the kernel source code can be
compiled successfully but failed in final step due to missing pahole.


</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
If you can follow up with the steps to reproduce, I can take on the
refactoring and broader dependency cleanup question, since I can test
the wider matrix at the same time.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
Thanks, my local setup might missing some corner case, this is another
reason I enable those native packages limit in KERNEL_DEBUG_OPTION :).

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
I've been thinking about this, and I've come to the following suggestion:

I plan on moving the elfutils-native to linux-yocto.inc, out of the
version specific
recipes.  I'll also drop the architecture specific nature of the
current DEPENDS.
The need for this is much more common now, and all of the reference kerne=
ls
in master are new enough. The elfutils-native build dependency is not
significant
enough to worry about adding it for all architectures. If it does
become a problem,
there are options to make it conditional again.

I can drop the HOST_LIBELF_LIBS work around in the linux-yocto.inc, as
we can now properly detect libelf via pkg-config. I didn't need it in any=
 of
my testing. Again, if this proves to be wrong, I'd enable it in a
different way now
(using what I've learned from fixing make-mod-scripts).

As for the pahole-native dependency, there's been a &quot;developer&quot;=
 kernel-type
for quite some time. The design intention behind it was to enable options=
 like
this, and not make the &quot;standard&quot; or &quot;production&quot; ker=
nel's too large by default.
So the dependency could be conditional on that kernel type ... but we don=
't
want to break other kernels just because they've enabled that option. We =
also
don't (and won't) get into the game of looking for individual options in =
the
.config to enable something, since a) it is too late b) it is a moving ta=
rget.

So that leaves the following options: a) enable pahole-native uncondition=
ally
on the arches that support it (x86-64, aarch64) (and also move the pahole
recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specific,
and simply call it KERNEL_DEBUG, when enabled, we could conditionally
add pahole-native (I'd also submit documentation for the functionality
c) something I haven't thought about ...

I'm moving on the implementation now, but will adjust course if
there's something
I've missed.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I have my implementation done, but I'm wondering what your configuration
was for testing pahole ?
</pre>
    </blockquote>
    <p>I have tested on a devshell, with oe-master branch, the kernel
      version using 5.15<br>
    </p>
    <p>1. enable pahole-native and elfutils-native in linux-yocto.inc as
      a dependency.<br>
    </p>
    <p>2. enable CONFIG_DEBUG_KERNEL&nbsp; CONFIG_DEBUG_INFO and<br>
      CONFIG_DEBUG_INFO_BTF under menuconfig</p>
    <p>3. using &quot;export PKG_CONFIG_SYSROOT_DIR=3D&quot;&quot;&quot; =
cleanning
      PKG_CONFIG_SYSROOT_DIR <br>
    </p>
    <p>4, make</p>
    <p><br>
    </p>
    <p>If the test environment using bitbake, then we need to remove
      PAHOLE=3Dfalse flag in kernel EXTRA_OEMAKE in
      classes-recipe/kernel.bbclass, otherwise, bitbake would report
      missing pahole error. <span style=3D"font-family:monospace"><br>
      </span></p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4M5JnHLpea+EEWG9gD2SPEG_R=
9KDjr6zGVEvRHusV9upQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
I'm seeing the following in qemux86-64 at the end of the build:

| Unsupported DW_TAG_unspecified_type(0x3b)
| Encountered error while encoding BTF.
|   LD      .tmp_vmlinux.kallsyms1
|   NM      .tmp_vmlinux.kallsyms1.syms
|   KSYMS   .tmp_vmlinux.kallsyms1.S
|   AS      .tmp_vmlinux.kallsyms1.S
|   LD      .tmp_vmlinux.kallsyms2
|   NM      .tmp_vmlinux.kallsyms2.syms
|   KSYMS   .tmp_vmlinux.kallsyms2.S
|   AS      .tmp_vmlinux.kallsyms2.S
|   LD      vmlinux
|   BTFIDS  vmlinux
| FAILED: load BTF from vmlinux: No such file or directory
| make[1]: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/=
scripts/Makefile.vmlinux:34:
vmlinux] Error 255
| make[1]: *** Deleting file 'vmlinux'
| make: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/Mak=
efile:1255:
vmlinux] Error 2

I haven't looked into it at all yet (but will do so over the weekend)
.. but I thought</pre>
    </blockquote>
    <p>I haven't seen this problem yet(i'll pull the latest oe-core and
      meta-oe code and try again), if possible, could you share a patch
      with me so that we can test it together? thanks.</p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4M5JnHLpea+EEWG9gD2SPEG_R=
9KDjr6zGVEvRHusV9upQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
I should check with you first to get the details on how you were testing =
pahole
functionality.

Bruce
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Br,</p>
    <p>Xiangyu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4M5JnHLpea+EEWG9gD2SPEG_R=
9KDjr6zGVEvRHusV9upQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Bruce


</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
Xiangyu

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Bruce

</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Cheers,

Richard

</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">
--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II
</pre>
          </blockquote>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#181185): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/181185">https:/=
/lists.openembedded.org/g/openembedded-core/message/181185</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/98753313/1050810">https://lists.openembedded.org/mt/=
98753313/1050810</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II
</pre>
    </blockquote>
  </body>
</html>

--------------lqhr60tqWtfuPZV60aO2XmB6--

