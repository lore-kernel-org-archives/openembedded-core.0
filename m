Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15EFC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 08:56:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17224.1684227365189452590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 01:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4500724dd7=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34G6VYc3028399
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 08:56:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qhys02qf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 08:56:04 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34G8u3CD032716
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 08:56:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qhys02qf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 08:56:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdFNwqxNz6ZwMgUudr1dI5Eq6FwK4lGdmIWQdTQ9rTZ11Zts9Is3SPwggxX449qPKPk9174RhCFJEvJORe29PEQ0L2NhzHRAlik9XUSLIAwvnG0UDOgJ0bWA9GWf7v9Sf0LXp6LZQNnzEdPepA4ss9jJkmtSAEMmXxKZ6FYIRS/4VrOTwncu7Ca1op9pshfhTFDmRn8Pvil7fzh2oA9+Pg/gMFTQprazmFzXb8WhYOSl7m0uplhw93XCzQTHsG/fb2Asfr7DM9C+S5QTNercgRAl1ReMs1ccyr7G8yB8+4/HBIALOEioQkLnNq1mCk7v8wh7dNdPgXwf9sqoB93LRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3lH+hmRG0Dm35TZXQbeZp+p/YV3+sU1SmCdCPc+DeI=;
 b=IR1bgQoBfRYNpBe+ceHOFjWqQa25r7sa6VRQgBBWZ/kDGVuzctDKs4HB0lMnLGf/uRWcQWiGw72w607w2vOmkwxjVRbYJo6Jjj2OwotWB+FFXGfaiLmRwhf+Q91whodTyVK5QDif0WhBQ+5g3F0kyrWHvUGmKQ2oDqOVDs39GpxHtGwpsH+7x21aYm7s3CDzaIb/GGTiJC4MGO4qAfl4kNpobZjLhpvCY0a7zsC6JnM1fC77165OzxZ7W0uNYs6E/jZFQa9na2wZum2X4Foa6Ilqdm0YuNWKN502yd+nCoosgzD/KfOwS0V1AWjiyuA3WsyBQ073lkkmDtnD0tVyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 08:55:57 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 08:55:57 +0000
Message-ID: <70bd8fc7-34b3-a435-cd88-2c39987cb547@windriver.com>
Date: Tue, 16 May 2023 16:55:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
 <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com>
 <175E6CB55C617FA5.27409@lists.openembedded.org>
 <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
 <312184e0-32cb-ab57-50c0-7a8c5519a0c7@windriver.com>
 <175F5136C3E93ABB.30531@lists.openembedded.org>
 <CADkTA4M5ZodLTjZ1EF0CFt4zzvywrg9rW-CZkexV_1pNgAdwgg@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4M5ZodLTjZ1EF0CFt4zzvywrg9rW-CZkexV_1pNgAdwgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:404:a6::25) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: ee119e6a-2043-4bae-00d4-08db55eb5ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KhrnbQv+hhc5L2+WdL+rpMhtqegM9HlEhgMFyoa3Q0NDXW0xQuNXC+fJ+UVxRPhWDizP8VE05YPE7JtN1TQb0iYwOt36n2EVcEKTYEhetCjextk6ri1l4GF6sS6mMqhIega02xmAnOjD12KdEfthjkFoQLWZrU/jZuWcVu/HD+XTfixUtWjCTYVU/qT9+allqMPqMQ1EFaOSNssuQrY0LM9KVv7poxJeo+tnSYTSQXIIgQ5bHjydIDI1SuDGbmSbT9Oyw9h2lv5nQQbGKIVrNGSWcFok3fuMkFJ1FXOvfit4Uai4OdnylJWYF8E2RmIkFWRzjPf0wzUdU0rCqS/bS2GUU8mPn6L423iYudwV2Y3SAZEUiVPxft25Y9ANBIAAvKutt04zSvAwfmd704LyhmIO9QNOu/2ky5fWvDjJsvdExefF0RPsJYQ/SNTd68byPycXvgOVW2+tyvp0fitySMLdDXKb3CaAQotX5Ww3x1X6YiJN8dmsSIf2LdIPJE+4n7k1zeRUjMx48NaDbxKx6mOhc3Vh2Hsa4j05J/RZtrY7dV5vSBfd4MD/QEDFzY1xNveRfiBtMT/luuaETg6Jf3WLmsSIscMYa3RED97BAZ237GhxA7y9Mgw8fmLfoS4rKly1FSczx03i42i5UzVckA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(346002)(39850400004)(451199021)(6486002)(6666004)(66899021)(8936002)(8676002)(18074004)(41300700001)(83380400001)(478600001)(38100700002)(83170400001)(186003)(2906002)(30864003)(6512007)(26005)(6916009)(66946007)(36756003)(6506007)(9686003)(53546011)(66476007)(66556008)(31696002)(316002)(31686004)(966005)(4326008)(44832011)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1BxTjdGbEREZFhsb3BjS1R0clUyWFN2dEpZNHpVelhwZkovb2o3aWcyeTFh?=
 =?utf-8?B?ZHh6RTdNSTdPNWlSdjNkZkNyOSsrbzJOZGduWmlQSDlrSmQrNWxVa3VMMHND?=
 =?utf-8?B?QWVyOXpBdTZFTzdOczk1MlVvUVBzb21EYmFOc2M4ZGlRWllTa2xFZWNkRHM4?=
 =?utf-8?B?eXd0MkhNZ2hxTkVLU1pWZDcvbGplalZlMVlIcklTUW1md3hZQmtIOWhiaitT?=
 =?utf-8?B?TkxZVnEzSXBid2hBZmFDbzg2OHZ3RDdHT1d4bFBVM3NrNkcydk40R1VVcVR1?=
 =?utf-8?B?MmxnWVRFT05idElLWUl3bXpxME4yME1YZjF3RDNrT3lQbG1WdE5lRy92cnNu?=
 =?utf-8?B?QnliRWx5MHVmNUw1TjhXMmZITHFMcnJycno5TGx6dnVCM01DRXk0a0ZVaVhK?=
 =?utf-8?B?UHpYaHE2NUhSSnZ4NnVFVVB1cmQ0M283MEJVQTN0MytLNlhIZ0FhMmg1UEJ3?=
 =?utf-8?B?WjNITUVuM2dWY0VQZlh5MUhzTkd5dWgwVmd5dytidlJGZEdJZktQZmFDQmor?=
 =?utf-8?B?VnBjM1Foc1dYaklRNzltZ24zOHczc2dCcmZ5VmZLWHVzZGJqdERFUExmOWZH?=
 =?utf-8?B?d3hHNkZDTFdJM0EyMlBUOHg0VExKRWRWR0FYcllmWmhkRm1teG1VVktvNlVv?=
 =?utf-8?B?RmhCS3J1RU16TS9BWlF6RTV0ekxVZ1FLL3lCUGJvRmxCLzJ0RWlza3hXYlNu?=
 =?utf-8?B?WHhHZGZaUkJVL2YvV2RkRmhJTXJaMGVYQXJLWWJwS09aTTNxandSc0d3aHJz?=
 =?utf-8?B?amhZSWI5b0FaWXIzY3ZGa0FsMm80MS83VHdrMXh0emRudHNodmpSQnRiU20x?=
 =?utf-8?B?R25IMGRjK0tGSFpJV3ZQRUwvWFp0NWU1VXR4NGQxR0FiSExHdjZVQUUwRWw5?=
 =?utf-8?B?b2V4aEdPYXZWckgwL0N5VXd2WGdWdFI4QytYaTYzcXdUNE9nSnhJVGRqbW1m?=
 =?utf-8?B?aEtMK1g3UWQxeFBvTm5FVTdCZzUrQkVjeEsxUmlVLzFBT3dJSnhkTVVuVVlo?=
 =?utf-8?B?VVhUR2RHNWdpODhPZW1QUEJUbi8wQmY3R0FONUdxMFdoZkR4M1U3SEZFSXpw?=
 =?utf-8?B?a3dWaWt1d0FZZS9IbUE2TXpZcGl5VkdNeUN0S1AwRzRBY0F5c21pdTRNSGhl?=
 =?utf-8?B?Q1gwdSs4dU1IbzVhQUliRWxOU01KTTVzUmJaLzJpYnQvRmpWMXZMMlROeDMx?=
 =?utf-8?B?ZVNkTCtGVHZ6dE1kazRVb00xbGRxUDF1aHY4RUpkWmp2dCt1OUIzeE9pNFA5?=
 =?utf-8?B?ZkExRHJYelpxVGFXZHdvZnoyRG51c25pRkh3NmFPeHZsYXpDdDNPdm1yVHg3?=
 =?utf-8?B?NkNGbDJYQWJ6RzJFaTA2MWtEZGdmTjEyc3p1ckNPZE5aQ1RQV3YzbkZ2T3Jn?=
 =?utf-8?B?aXRMOU5ScGJ0QXhndmJtZFp4SmFoNlpoMVo2TlVHZy9jcC9CZGhSa2pORWor?=
 =?utf-8?B?TDJCYkhXWC95amZZTUtMUURDc2tYZGZsNzlNaDlzdDNEbkVVMWd5ZGN5RHRk?=
 =?utf-8?B?TmNLU1QwUFNjZW1nQkFRU2pmWmxTVXdiNUlTdER5cUJZN1o2YzlJVkhTNklu?=
 =?utf-8?B?dGc3NHV1WjFIMWU0RUJxbXlwZk4zV0lLTk44WVk4bnhWSTBKZG5UMUNnd0hB?=
 =?utf-8?B?bXk0WFNsdVRLcUtQOGVkMFVYdmRZWVJ0TmREOHNzaWl4ZkZIWVpuM0hmYXFH?=
 =?utf-8?B?TnNSakRRczk3NWUrdnUrS0JUTWFFRDVqRVFETjg4RTh0cTR2ZWtCM05vOTVt?=
 =?utf-8?B?bVgrRS9mTnJiVFo3N2k1bzY1eXNGSlZabmswRndBRkpwaksyc0U4STZSTTFq?=
 =?utf-8?B?QldndHFtMTdMT0prMDFXQzhRSTRqWW45S3dwL0ljRjU1NHh3NVhMTmQxa29W?=
 =?utf-8?B?NGowQkwvdjVCdTdVMmZvZG9nUm1maTJiczhNWFY3UnlPTHdKWDRnNVVWNDlM?=
 =?utf-8?B?SklrWnlpMGlYUzE1T090UWdYQlQ2d1oza3E0bDFzcGt5dUNnZFVuZmtZRjBV?=
 =?utf-8?B?TDFrUGNTWWRIcWxEdzJtYXF5TWkwZEJvQTlEcFMyRnhwMkZ1RTZCc2djZ0Mr?=
 =?utf-8?B?YnNnaHNyWlN0cGtNcCt4a1B2dGJJcGxpMDNtem1OTFEwcExxdUtEWU1pUHpo?=
 =?utf-8?B?bDk3b25KQTRUazNDVlYwbHNsUk1mekNNOWg3em95MWloa05pS0dQZHVEVmRx?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee119e6a-2043-4bae-00d4-08db55eb5ce6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 08:55:57.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh/1rh+BFcwl3ebKknCqTWLai2WkWunE5xVFb+B4K+UvzSfaIUFBl2zvkKwbLXdg075j8pEhHE2dXDGX8fBORFM2/htdsj7PxZC2rumAMeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-Proofpoint-ORIG-GUID: M2zBt9zTKCjxNLsiuqHmtcEKMuVimHyb
X-Proofpoint-GUID: yGjq9fzL086ILLkVP4XWlimw0AvXqUpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305160075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34G6VYc3028399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 08:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181403

Hi Bruce,


On 5/15/23 21:11, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, May 15, 2023 at 8:34=E2=80=AFAM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> On Mon, May 15, 2023 at 6:04=E2=80=AFAM Xiangyu Chen
>> <xiangyu.chen@eng.windriver.com> wrote:
>>> Hi Bruce,
>>>
>>>
>>> Sorry for being late..
>>>
>>>
>>> On 5/13/23 09:16, Bruce Ashfield wrote:
>>>
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
>>> lists.openembedded.org
>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>
>>> Hi Richard and Bruce,
>>>
>>>
>>> Thanks for your suggestion,
>>>
>>>
>>> On 5/11/23 00:25, Bruce Ashfield wrote:
>>>
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
>>>
>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>
>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make w=
ould report some
>>> errors due to pahole and elfuitls is missing, since this is a debug o=
ption, so conditionally
>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need en=
able CONFIG_DEBUG_INFO_BTF
>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" in l=
ocal.conf to solve the pahole
>>> and elfutils dependency.
>>>
>>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with th=
is
>>> option documented somewhere?
>>>
>>> I also think the mention of devshell in the commit message is
>>> misleading, this issue happens regardless of how you enable the optio=
n.
>>> There are also other ways of enabling this than local.conf, you'd
>>> likely not want people doing that at the end of development.
>>>
>>> I'm curious on Bruce's opinion but to me this at the very least needs=
 a
>>> commit message rewrite and I'd question whether the docs elsewhere
>>> would allow someone to discover this workflow anyway.
>>>
>>> I missed this entirely, thanks for replying to it, or I never would
>>> have noticed.
>>>
>>> This mechanism isn't appropriate for these dependencies. I only added
>>> it to work around pkgconfig issues (which we can more cleanly solve i=
n
>>> newer kernels  (see what I've been doing with make-mod-scripts) .. so
>>> it can eventually be dropped).
>>>
>>> We are already enabling elfutils-native conditionally on a
>>> per-architecture basis (currently only x86-64).
>>>
>>> If we need it on more arches now, we should enable it in the version
>>> specific recipes, or actually, we have moved far enough into newer
>>> kernel's that it could be in the .inc now.
>>>
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
>>> Similarly, we should enable the pahole-native dependency on a per-arc=
h basis.
>>>
>>> As Richard mentioned, what's the reproducer to see the errors ? it
>>> must be more than devshell.
>>>
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
>>> If you can follow up with the steps to reproduce, I can take on the
>>> refactoring and broader dependency cleanup question, since I can test
>>> the wider matrix at the same time.
>>>
>>> Thanks, my local setup might missing some corner case, this is anothe=
r
>>> reason I enable those native packages limit in KERNEL_DEBUG_OPTION :).
>>>
>>> I've been thinking about this, and I've come to the following suggest=
ion:
>>>
>>> I plan on moving the elfutils-native to linux-yocto.inc, out of the
>>> version specific
>>> recipes.  I'll also drop the architecture specific nature of the
>>> current DEPENDS.
>>> The need for this is much more common now, and all of the reference k=
ernels
>>> in master are new enough. The elfutils-native build dependency is not
>>> significant
>>> enough to worry about adding it for all architectures. If it does
>>> become a problem,
>>> there are options to make it conditional again.
>>>
>>> I can drop the HOST_LIBELF_LIBS work around in the linux-yocto.inc, a=
s
>>> we can now properly detect libelf via pkg-config. I didn't need it in=
 any of
>>> my testing. Again, if this proves to be wrong, I'd enable it in a
>>> different way now
>>> (using what I've learned from fixing make-mod-scripts).
>>>
>>> As for the pahole-native dependency, there's been a "developer" kerne=
l-type
>>> for quite some time. The design intention behind it was to enable opt=
ions like
>>> this, and not make the "standard" or "production" kernel's too large =
by default.
>>> So the dependency could be conditional on that kernel type ... but we=
 don't
>>> want to break other kernels just because they've enabled that option.=
 We also
>>> don't (and won't) get into the game of looking for individual options=
 in the
>>> .config to enable something, since a) it is too late b) it is a movin=
g target.
>>>
>>> So that leaves the following options: a) enable pahole-native uncondi=
tionally
>>> on the arches that support it (x86-64, aarch64) (and also move the pa=
hole
>>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specific,
>>> and simply call it KERNEL_DEBUG, when enabled, we could conditionally
>>> add pahole-native (I'd also submit documentation for the functionalit=
y
>>> c) something I haven't thought about ...
>>>
>>> I'm moving on the implementation now, but will adjust course if
>>> there's something
>>> I've missed.
>>>
>>> I have my implementation done, but I'm wondering what your configurat=
ion
>>> was for testing pahole ?
>>>
>> My reply will be hard to read, as plain text reply to the html doesn't
>> give us proper
>> context indenting.
>>
>>> I have tested on a devshell, with oe-master branch, the kernel versio=
n using 5.15
>>>
>>> 1. enable pahole-native and elfutils-native in linux-yocto.inc as a d=
ependency.
>>>
>>> 2. enable CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
>>> CONFIG_DEBUG_INFO_BTF under menuconfig
>>>
>>> 3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning PKG_CONFIG_SY=
SROOT_DIR
>>>
>>> 4, make
>>>
>>>
>>> If the test environment using bitbake, then we need to remove PAHOLE=3D=
false flag in kernel EXTRA_OEMAKE in classes-recipe/kernel.bbclass, other=
wise, bitbake would report missing pahole error.
>>>
>> That's the same as my patch series (I've also changed PAHOLE=3Dfalse t=
o
>> a conditional in my series).
>>
>>> I'm seeing the following in qemux86-64 at the end of the build:
>>>
>>> | Unsupported DW_TAG_unspecified_type(0x3b)
>>> | Encountered error while encoding BTF.
>>> |   LD      .tmp_vmlinux.kallsyms1
>>> |   NM      .tmp_vmlinux.kallsyms1.syms
>>> |   KSYMS   .tmp_vmlinux.kallsyms1.S
>>> |   AS      .tmp_vmlinux.kallsyms1.S
>>> |   LD      .tmp_vmlinux.kallsyms2
>>> |   NM      .tmp_vmlinux.kallsyms2.syms
>>> |   KSYMS   .tmp_vmlinux.kallsyms2.S
>>> |   AS      .tmp_vmlinux.kallsyms2.S
>>> |   LD      vmlinux
>>> |   BTFIDS  vmlinux
>>> | FAILED: load BTF from vmlinux: No such file or directory
>>> | make[1]: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-sou=
rce/scripts/Makefile.vmlinux:34:
>>> vmlinux] Error 255
>>> | make[1]: *** Deleting file 'vmlinux'
>>> | make: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source=
/Makefile:1255:
>>> vmlinux] Error 2
>>>
>>> I haven't looked into it at all yet (but will do so over the weekend)
>>> .. but I thought
>>>
>>> I haven't seen this problem yet(i'll pull the latest oe-core and meta=
-oe code and try again), if possible, could you share a patch with me so =
that we can test it together? thanks.
>>>
>> I'm on oe-core master, with qemux86-64.
>>
>> I'll do a bit more work on the patch today, and can share it if I
>> can't figure out where that unsupported tag is coming from.
> It seems like it is a known issue, I found both a lkml thread and
> debian bug from October 2022.
>
> Your 5.15 kernel wouldn't show the issue.

Yes, this should not happens on 5.15 kernel.


Today I synced the oe-core/poky to latest master version, removed the=20
build dir and run oe-init-build-env again and switched to use default=20
linux 6.1.25 instead of 5.15.

Some kernel config has been updated, there is no CONFIG_DEBUG_INFO, I=20
used CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT.

So, currently my local setup kernel config is enabled=20
CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and=20
CONFIG_DEBUG_INFO_BTF, in order to make a easy test, I enabled=20
elfutils-native and pahole-native as DEPEND directly in linux-yocto.in,=20
and remove the PAHOLE=3Dfalse in EXTRA_OEMAKE.

my oe-core rev: 35e5d29a7d654fc79bdb898d0f1fb277270dbfd5

my meta-oe rev:b7aa66d734b911737b61610c1c47778e14b15c55


When I ran bitbake linux-yocto -v -D, I have met the same issue,

| Unsupported DW_TAG_unspecified_type(0x3b)
| Encountered error while encoding BTF.

It's bit strange that the I removed my local OS(ubuntu)'s pahole and the=20
code can be compiled without error:


 =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init/version-timestamp.o
 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.btf
 =C2=A0 BTF=C2=A0=C2=A0=C2=A0=C2=A0 .btf.vmlinux.bin.o
 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1
 =C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.syms
 =C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.S
 =C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1.S
 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2
 =C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.syms
 =C2=A0 KSYMS=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.S
 =C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms2.S
 =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux
 =C2=A0 BTFIDS=C2=A0 vmlinux
 =C2=A0 NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 System.map
 =C2=A0 SORTTAB vmlinux



>
> You can find a link to the lkml thread from the debian bug:
> https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg18735=
53.html

>
> I'll clean up my patch, since this isn't something I can fix immediatel=
y.
>
> If you do track down patches in the latest kernel that haven't been
> sent to -stable, we can backport them to fix the linux-yocto builds
> with pahole.
>
> Bruce
>

Br,

Xiangyu

>> Bruce
>>
>>> I should check with you first to get the details on how you were test=
ing pahole
>>> functionality.
>>>
>>> Bruce
>>>
>>>
>>> Br,
>>>
>>> Xiangyu
>>>
>>> Bruce
>>>
>>>
>>> Xiangyu
>>>
>>> Bruce
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181248): https://lists.openembedded.org/g/openembe=
dded-core/message/181248
>> Mute This Topic: https://lists.openembedded.org/mt/98753313/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

