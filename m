Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28484C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 04:18:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5743.1671164280355732554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 20:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93496aaedb=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BG4CJXP005145
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:18:00 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyg529qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:17:59 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BG4Hxqo016013
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:17:59 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyg529qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 20:17:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoMNpIB2O6+FqcnZ6kQsetQQR1jKGb94Gw/DRyboXMyvNuF1/Ee6fyZfmh3MwMR/wqeTUchi+P0Cdz207R8N0/Dyz9vysMkf+ZMwnFYgOathWLJEsHwGKJGQgnQ6chbMRZze7GAEstVqZCSH8/aRF/z/G9tscTeKOrqUV8ZbAcfDe1dGf+K3uS7PdJXxkEHa8C7FbST6e83OcpKhk5Ao0lAf5s9YG2uMaptKhKYilpW4ydXL1d7H9PqvZrv5/SkVqRLNhKzy2YqXWZ6rFTwzMOsgBthL2HtraxdzX2HcrPsJZzXm52pdZ5jLFW3iotROrzz73b0XKK3tqVQ54JLV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3kr5STk/SQj6Nvi5FX6a+A4M9UjqGJnPkgGYmNiO68=;
 b=aV9p8bRbNtVlXjhNo2yJAVNEGnwarEB1QvMgAx6tSosc2vvGYj3z7+UTpm+iRQaOlPyx/O+jIUNcmNWmcrA6qsnRY3nRfEP3qYPBNSI17qsD/4QIe3y4j/YcOkifnpx+p6Frq6THvlICNgSKW6WSPdLYvLBuJEdNyV8DcBUaePW9/R28hTqzIJZugnlnCIVgVVlUMXvFmdh8y/KN4e7tm5nFfsBSfTpaDn/FthGxdtaTLBX82wrmVOUqPLkjdZ7icYVuU4/WcRTLHwVlCP2FWpuFmU0RrtvrLZHOc6NgkPEaO37P4TrOxcJDsrprrh4NK9l3H82CpY+6k8cRVchqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 04:17:55 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5924.012; Fri, 16 Dec 2022
 04:17:55 +0000
Message-ID: <e39221a9-4767-f950-9d53-8d275428efcc@windriver.com>
Date: Fri, 16 Dec 2022 12:17:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][PATCH] openssh: remove RRECOMMENDS to rng-tools
 for sshd package
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <20221209070538.72901-1-xiangyu.chen@eng.windriver.com>
 <CAMKF1sokegC9mr0VkmdEqW2WqRxBdc0fVYS39Pp8FFFzj6jc-Q@mail.gmail.com>
 <883249ff-3f56-21c3-8bec-b10f01c06499@kernel.crashing.org>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <883249ff-3f56-21c3-8bec-b10f01c06499@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 4260d558-5e17-4cef-de1b-08dadf1c8177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HL5IfjxXXqVKNcT+Mc2JMSZQvO6inoHuSbFuFFqAQT2NquVJHLH1pwY/M8gzRiaY4mRb7TE2OBHl5IjUUJlIUSK6aAaM9sm9sWh5iC7xw8+Gfpq4OYeUIGe3o/+Awu44ygCc2Ydr8a6m8xx8K9l+qmIsMmWn1nfi+XxJVkzrr5+ELwtfSiEK//UoKX4sdL7M8OJ2TFa5lTl78NLkrgMQBwzDFfZjNZoa09IWO404xatrK+P3CeRZtGA9YPBfrfwuGqmfXbD5lmybi8xQRN228/SMLP34/tS2fODL7Y/MHsODA6xaZfsSvGV3l72fekbIbR1ExmHr8kuuzTQNrb8pdgttYI7MuO8P7/Gr86ypFmX24lhMfi8u3NeVF71YmvgG7e+XV/GfEmAbWm1YiblZ78BSUBsncVwjaN4wGkkRmM8ytImG5TMvlV30H9q9xbwX/EjzMoevmsHXYIrnjTrK91J9J57psZ5SFzuKv0CuIlKEVIzdMtgouZwStGlLOrhuEDJm1uWlKFX8iLT4UCk9bIQJc/Wu+avcIdAViDRjNS7VlJb7Rw/JF5YvSSjj+nYnWiD7eWfb1OOC/oCgvcAcdCs/IUfnuJejjEQQXjJ9A8c7qWs8wuNqVfmjGnRDJA5dd686PN2EFXfT36JP9wlkUV7dkzTDP5HDmAH4uAF7imRDHkSTYi5BZ3pWLeW0xUWG1LiBetJH3d6IZlQ9lYJrnqQ5gWtVGEalCN851E28W6rvkSooSZNTCMbua10RdOqB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39850400004)(451199015)(83170400001)(38100700002)(36756003)(31696002)(31686004)(6506007)(53546011)(9686003)(186003)(6666004)(6512007)(966005)(26005)(6486002)(316002)(66899015)(6916009)(478600001)(4326008)(8936002)(44832011)(66556008)(2906002)(5660300002)(66476007)(8676002)(66946007)(83380400001)(41300700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3JzUFVsckovQ1F2c0hGRmpxVTNYOU1uYlhucXNxM3llTGUyZWZBWjg4ckVJ?=
 =?utf-8?B?UkJaUGZZVE5VR2E5Q3lOYTFHZHRlWE84bkZFN1c5Q2dtSDgvU0RUdmxRUlV6?=
 =?utf-8?B?VGg3WDR6L2oxZS9Tb2t1WmlkZSs3ZTZZYTlsUUJNbjdtaXRkSWsxTDV3SHZl?=
 =?utf-8?B?WThhWnhhM2hGQlVsbnlFbW9kd1ovL2NRR2lMUCt2SFB1RE9ScC9DdzF6UTlZ?=
 =?utf-8?B?Mm9lYkRrZDZpZDRPaStvR2d0aWpmbzVYc2o5QnBwaThINnJkNFBSVjJuOUNU?=
 =?utf-8?B?NE9DaGFrWStCaHNRdjZYcGRLVEZoQ2xPS25EU1ZTWUxRZWhTTFUyWDZmNUpz?=
 =?utf-8?B?MlpvL2tOYzBBYllteHFBQW41a0oyRHM1bXZxUjdTTGdKK2FsYk5lWFVLdWdR?=
 =?utf-8?B?ckNMam5jSVBtOUUranZSQVIzTUdJNlJuNXgrTkRpVnRpMmRIc0R3OXh2Wjg1?=
 =?utf-8?B?cU9pZkxiQlhhcWNzWnd5bks4QS94YklibjNsMzNjeERlUWQ2YlhOK0RPVVNx?=
 =?utf-8?B?TFlMNmNEdytNaC82MXoyaVp6NzlDVGhKS01jUWpzOEl4OTdnd0VleWlnYU9F?=
 =?utf-8?B?QlBTWDZ6Y1lWMVNkeFRnMXBqZXJCd3hUZktza2Q4SGVTVE1QVzlUbmJYcEN4?=
 =?utf-8?B?WlJuYjVLODY3RTJNR2lTZ0FXWHpwUDBabVdlU2t0RVREd3lGUUYvTThnTXN0?=
 =?utf-8?B?T2oyMWM2OW5sTEo5di9oN0RDTjRhVTlZN1dCSEpxNFpsc01pYjdkc3Rwckk5?=
 =?utf-8?B?RnZiQURkWGY3NHpPK0pZUmROOGwyRUd0WDFJNzM0M3lIaW5WUUdwWGRvTkZa?=
 =?utf-8?B?c3FTeXFhcTM0dlllTWhySVRiK3dKYWJ4TkRTVHZsbE9QQ1BscjZxYW5NN3h5?=
 =?utf-8?B?SStuK29sVisyR3I4bWg1MlR3cGRuVU15eVFIOUpuT2k2RWNMYWhSbjZoSTFR?=
 =?utf-8?B?NWhjOS9mSnNpR0JLc0ZXUmVBeStOODMybVlFSUlVeldDcEhCT0RRRFVpRlZQ?=
 =?utf-8?B?MlJLbXl0d1pnelN3Q3p4UEViSkk1UndOZG9hSzNPMDFQdUIzOEFNNit5RzE1?=
 =?utf-8?B?aUNqRkU1V3R3VGhkcmk3Q3ZsTCtueEJweFJtekRseEVYRDJDekdEb3ZFY3JU?=
 =?utf-8?B?VUFhZXhOUDBTOUU5bzB6Q1NJMWRoWEx4QXVoRTZINHRicEgzYU1QOFBVcG5C?=
 =?utf-8?B?Z2ttbjNJdC9neW4rTHBpWVNkOWdDWkhtbUdwaUwydG5FNXV1TFhOZWJnUTdN?=
 =?utf-8?B?UEIzaTY2d04zTS80ZVQ2VVFVaHovRHpIalFiMFFDckJicDNBb0V0MGxZWldt?=
 =?utf-8?B?ekY3WVRvR0pBOVkwbytHYzdiTjZhYk1sRlhmSy9aaWE2UkNuWTkwSUg5NzYr?=
 =?utf-8?B?TXFkV2dSRDl4cjFzN3FsTGYyc0lvNERubFhCNTJibW1kbEtkY2N1d1dTMGlL?=
 =?utf-8?B?K3ZpcnUwR0R3L2hDUWV3b2VUd01BTkRYVFRCaDh0V2NOSEJndzh4YTBTTXlR?=
 =?utf-8?B?ZnVSd0huVWJXeGpzZGphSHc3VGsyK3F5VDk4Ni9WYnN6RVRvYlhPbkxQVlBu?=
 =?utf-8?B?Z0I5Mk9BMDZDRlVzRzFiV3JtTndFcGFoVUcrMFRwa044M3RFNXJ3ZHFibkN4?=
 =?utf-8?B?RFhXNXM0clhjOVdWQkxRRGxSMjdBNzJsQmo5ZElVOVFlaVExYUVzbWYzZTFt?=
 =?utf-8?B?VUxaZXBLdExvOXI0UDFlSDVRSGFxL2QrVHpiVlphNWxHa0h3bHA2SEEwVnFS?=
 =?utf-8?B?WnVNMENHRW1pSWszWnBMNmNhKzFKUkh6b1FGVWpXeUROeW5TUWtjR3NKcEg5?=
 =?utf-8?B?WE9ONkJ4Slpqd2pYa0RYRmFxcGh0Ums4NkZOWU80bSs1aFhMU0VZM2loejY4?=
 =?utf-8?B?WEVMbENaUWRLWE5PTmNjTUcxc0VkNWd6U2t5U1RUczVQc3ZmcUZtTm1TejdB?=
 =?utf-8?B?aWFrWFdlMGRhNzQyMHR0Um1vV1ZiODRYTmN0cGpoS3ZPTlpPRVEwbzJXUGdw?=
 =?utf-8?B?NXJIQktDUmx0STlsWkZlbTUrcnZzaVVIK0tvcUlnTUVObERjNUNPMXdyZmIx?=
 =?utf-8?B?WjduVXJyS3JvN1RKWXIvYStYTWpEMkJaQzNXc0xrbUd0UjFUS3V1YTlnbmZ3?=
 =?utf-8?B?eDFVUlV2RVpMaWJHRTZka2xSMkluVFg1MFZxR3pwb2VOOURhVzZBamRVUWdv?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4260d558-5e17-4cef-de1b-08dadf1c8177
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 04:17:55.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igydCVV1pT/8DJZGH2xd0cKQNtRmnlhjZyaSpoM+ThHvYpLOjZBcaNkdh0Fa4IvHX5oAjGrO7W2Yy9erpCcotOSUjrY9ZxCDBk+WuBmRB/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
X-Proofpoint-GUID: 8aW1jOv8fGzcspb9ymItqWrzc_GmykiK
X-Proofpoint-ORIG-GUID: -tzerJtcACubLhgIVayD62XyG8OVBo99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_02,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160037
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BG4CJXP005145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 04:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174730


On 12/12/22 02:35, Mark Hatle wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> In the kernel is the jitter entropy system.=C2=A0 It should work on all=
=20
> platforms
> that have high res timers available.=C2=A0 (This is the same mechanism =
that=20
> haveged
> was using before as well.=C2=A0 So no change in the RNG quality, just n=
ow=20
> built into
> the kernel itself.)
>
> The only place we've observed an issue with the new approach is on a qe=
mu
> machine that was moderately loaned.=C2=A0 The jitter was apparently too=
=20
> large (our
> theory) and caused the crng init to happen VERY slowly.=C2=A0 (This wou=
ld=20
> not have
> been resolved using rngd.)
>
> All-in-all, I thought this change had already been made, and think it=20
> should go in.
>
> (We tested this on microblaze, and performance with and without=20
> haveged was the
> same.=C2=A0 I don't have number, but I expect the same behaviors on any=
=20
> architecture.)
>
> --Mark
>
> On 12/9/22 11:02 AM, Khem Raj wrote:
>> would be good to know some numbers on non-arm/non-x86 systems too.
>>
>> On Thu, Dec 8, 2022 at 11:05 PM Xiangyu Chen
>> <xiangyu.chen@eng.windriver.com> wrote:
>>>
>>> It appears that rngd is not needed as of linux-5.6 and later[1]
>>> and should not be installed by default since the purpose of rngd
>>> is to provide additional trusted sources of entropy.
>>>
>>> We did some testing on real hardware, the result seems to support tha=
t
>>> we no longer need rngd by default on kernel v5.6 and later.
>>>
>>> Testing result as below:
>>>
>>> 1. observing the crng init stage.
>>> =C2=A0 the "random: crng init done" always available before fs being=20
>>> mounted.
>>>
>>> 2. generating random number without rngd.
>>> =C2=A0 testing command: dd if=3D/dev/random of=3D/dev/null status=3Dp=
rogress
>>> =C2=A0=C2=A0=C2=A0 on Marvell CN96xx RDB board, speed almost 20.4 MB/=
s without block
>>> =C2=A0=C2=A0=C2=A0 on NXP i.mx6q board, speed almost 31.9 MB/s withou=
t block
>>> =C2=A0=C2=A0=C2=A0 on qemu x86-64, speed almost 2.6MB/s without block
>>>
>>> 3. using rngtest command without rngd
>>> =C2=A0 testing command: rngtest -c 1000 </dev/random
>>> =C2=A0=C2=A0=C2=A0 on Marvell CN96xx RDB board:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: input channel speed: (m=
in=3D4.340; avg=3D135.364;=20
>>> max=3D146.719)Mibits/s
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: FIPS tests speed: (min=3D=
8.197; avg=3D69.020;=20
>>> max=3D72.800)Mibits/s
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: Program run time: 41877=
1 microseconds
>>>
>>> =C2=A0=C2=A0=C2=A0 on NXP i.mx6q board:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: input channel speed: (m=
in=3D96.820; avg=3D326.769;=20
>>> max=3D340.598)Mibits/s
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: FIPS tests speed: (min=3D=
15.090; avg=3D37.543;=20
>>> max=3D40.324)Mibits/s
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: Program run time: 57022=
9 microseconds
>>>
>>> =C2=A0=C2=A0=C2=A0 on qemu x86-64:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: input channel speed: (m=
in=3D37.769; avg=3D101.136;=20
>>> max=3D136.239)Mibits/s
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: FIPS tests speed: (min=3D=
10.288; avg=3D30.682;=20
>>> max=3D40.155)Mibits/s
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rngtest: Program run time: 83680=
0 microseconds
>>>
>>> 4. observing sshd service.
>>> =C2=A0=C2=A0 using "systemctl disable rng-tools" disable service and =
reboot=20
>>> system.
>>> =C2=A0=C2=A0 system boot up normal, sshd service also start in normal=
 time=20
>>> without
>>> =C2=A0=C2=A0 block.
>>>
>>> Reference:
>>> [1]=20
>>> https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094ba=
a51bb4c44e32
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

Hello Steve,

According to oe release kernel=20
version(https://wiki.yoctoproject.org/wiki/Linux_Yocto), the kirkstone=20
and langdale is also using linux v5.6 later version kernel, so could you=20
help to cherry pick this commit on master to kirkstone and langdale=20
branch? Thanks!

The commit now on master:

commit: 868dfb46d96a27ec9041cb902fb769330277257d

https://git.openembedded.org/openembedded-core/commit/?id=3D868dfb46d96a2=
7ec9041cb902fb769330277257d=20



Thanks,

Xiangyu

>>> ---
>>> =C2=A0 meta/recipes-connectivity/openssh/openssh_9.1p1.bb | 9 +------=
--
>>> =C2=A0 1 file changed, 1 insertion(+), 8 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb=20
>>> b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
>>> index 85f97b1bbb..23ae8d5b0c 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
>>> +++ b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
>>> @@ -52,15 +52,12 @@ SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket"
>>>
>>> =C2=A0 inherit autotools-brokensep ptest
>>>
>>> -PACKAGECONFIG ??=3D "rng-tools"
>>> +PACKAGECONFIG ??=3D ""
>>> =C2=A0 PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerber=
os5,krb5"
>>> =C2=A0 PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
>>> =C2=A0 PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,l=
ibedit"
>>> =C2=A0 PACKAGECONFIG[manpages] =3D "--with-mantype=3Dman,--with-manty=
pe=3Dcat"
>>>
>>> -# Add RRECOMMENDS to rng-tools for sshd package
>>> -PACKAGECONFIG[rng-tools] =3D ""
>>> -
>>> =C2=A0 EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>>>
>>> =C2=A0 # login path is hardcoded in sshd
>>> @@ -160,10 +157,6 @@ FILES:${PN}-keygen =3D "${bindir}/ssh-keygen"
>>>
>>> =C2=A0 RDEPENDS:${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keyg=
en=20
>>> ${PN}-sftp-server"
>>> =C2=A0 RDEPENDS:${PN}-sshd +=3D "${PN}-keygen=20
>>> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit=20
>>> pam-plugin-loginuid', '', d)}"
>>> -RRECOMMENDS:${PN}-sshd:append:class-target =3D "\
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', =
d)} \
>>> -"
>>> -
>>> =C2=A0 # gdb would make attach-ptrace test pass rather than skip but =
not=20
>>> worth the build dependencies
>>> =C2=A0 RDEPENDS:${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-se=
rver=20
>>> make sed sudo coreutils"
>>>
>>> --=20
>>> 2.34.1
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174478): https://lists.openembedded.org/g/openembed=
ded-core/message/174478
> Mute This Topic: https://lists.openembedded.org/mt/95556189/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
xiangyu.chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

