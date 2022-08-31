Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61598ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 15:33:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.281.1661960005745209403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 08:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Eiui0if1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6242a4a6ba=li.wang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27VBwTJH015700
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 15:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=3rkKouhG4cZbR3QPliRyLvWuVW2bFaJh1UvYuLgf7do=;
 b=Eiui0if14NjZHexvvbysRmDugXlB3Ccd0PfEzaXUkYrZodh4SMOC+sl4W2Gm3h8/XOqG
 2/UO5jb7qeXLMQZkZ773X8jaXw5pudTTpTqm+zy/Mu78rrfg8xnmz6QdeUQU9pZ7KbJy
 yyeRZNHHz8dSCJY7JEhg6NMU+iGRsl0I9ZxL2sgq1O1eDqT9sQlv51GG1nB1/rJ6L9sY
 I86qzD3C35Kp7HHZ7vf7vxwhoijgG+/0eEaaa0wLMmFwOdH2gTFR4QR9AAsYTHORjqQp
 S0uDKpXDvV8zL7G04F2T0iVJjs4nq5C20P0jijZRCy+XfonF+huIjhHEir1npwGp6ll+ BA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89ku3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 15:33:24 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27VFGiYm027823
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 15:33:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89ku3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Aug 2022 15:33:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDZkovsE3nsIDLVf3eyb4gbpZJmit6iNw4g/rhCGaY3G+9W6tkFgU+opA93nDPJ807sC5fbZMCqxCXfHnuICLVFeQnN6dsJQUF6XSyy273imuju3yVGkwk50aqPzqZx5YJoEPVeYbbdLAqIafN1c4lY8aDYHVQHFFtWsCpk+Djd5oKYtKjF4a3zGFJuQTMPd3EvJLAI8Qjlvggx+qJ5LPDaCcyGoFTCw3QhJDYlFdfJ8sRjWv8BYFcs1/1Cai68J+p3mXda0HKcjpPXkW6qpO0Js712LMb4ir4mbg3e7+AGUB0xnC9HTAm9yjTGeGSW/IlRnuPSPRdqjUJhqS87k1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rkKouhG4cZbR3QPliRyLvWuVW2bFaJh1UvYuLgf7do=;
 b=cCilNzGqtG4JdT+zEIa+9FFtOwDVXelb09iPWqnUNynvsneg80t6/VZk0VCcARhV3UFk0n2R8h3DTX0LaNI998JCnZiELE36kJH3wylyzJkDGlpdZn/yrN65YgRcB1L3PQIwTG93Eg9b3T4uQ50iJo2IhE2eedcYqXxPBjaYH5ZC9XHeJ1qFbMrMBwCUdSAcilUfmJSfNZPKDQVUuU+dJfs8cGfaTV8E+gu9945n63kP2lZErBu+mU1EEqN4GFvnYok28JzKJnHQmTaJSUak5ijY5eDmHfAQdg4/4xN0IQRqZ4TzBF47nk48dXbJV5P1BC2PtMi3ycgHPUVgQ/+NIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by BY5PR11MB4356.namprd11.prod.outlook.com (2603:10b6:a03:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 15:33:19 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::8c4d:7d4:ff68:9344]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::8c4d:7d4:ff68:9344%6]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 15:33:18 +0000
Message-ID: <7d6ab172-8a96-2303-1a19-79eba621b134@windriver.com>
Date: Wed, 31 Aug 2022 23:33:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [OE-core] [PATCH 2/2][kirkstone] linux-yocto/5.10: update to
 v5.10.137
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220829015759.63624-1-bruce.ashfield@gmail.com>
 <20220829015759.63624-2-bruce.ashfield@gmail.com>
 <CAOSpxdYY9c4ndFw+4GGksC8PQ+VTR18KO+mwnzrqA3Z3a+Qy4A@mail.gmail.com>
 <CADkTA4O8Um32h++zUgM9wk0Fy-_1DdHoyvhnay8fgAuDF7OykQ@mail.gmail.com>
 <CADkTA4Ms_0Ftct5_HLzv5GeBLbpF8VFL=gAjSSspTiRHTKeGfw@mail.gmail.com>
From: "Wang, Li" <li.wang@windriver.com>
In-Reply-To: 
 <CADkTA4Ms_0Ftct5_HLzv5GeBLbpF8VFL=gAjSSspTiRHTKeGfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 274692a5-362f-4bf0-39bc-08da8b6620f2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	seGANlHO/Gh5UqjOIQLYHso6kXKef7FwL5w4q2vVyptuONcIEkM7zLY4vGC0SoSkcWXjPKjHVLm9DKRg9YDlz4eKgdyloPxnmtXQHLMREmseh+AisqB+V0cEkTU+c9gZobO0pUbc03grLLq99W6Ed+OdToZCOSrDeluvH8eIBpMaIjpg9i0cY8uLSigbv1XAQLv6LUdn6mdzzr4bsqrFvK0gMm6yjp3/+6cpXtiHh5j40t7cgPux7Fo36AbIsPMHSHA9x/bx6FCZRj+8CIaOEWGMftkLOQ1HMOBAMBOknrO8gunhuaxnx9KOCc0CkO/WNhpd0Ozp9sphefo5p6D+ZbCBoar2K/TzUQOTzfZSfNMRYUJx4eoPLwoDum3GX+kfOI7JesO2o5sXdVX+vgGVvyrwXBswUM6zx2ZAY1RsT7fiE0aCAZzYCq+EBCDNuCmlFD7BDEfYtdvMK/k51WrWPXPnzkxyydc3/kd0s/Lgk3G9om9KNQq+R7vPTVoeueNOncFZJrA34oSwFmyxwHQF3DqzPOLm/LY1TVA9Y4U+yOBXcaBLkD05uw3JQd8gstwPIFtICnnmcRnRzmnMAHRZJfwQnCJntdM0wvJHx5kCQQBzBq0go0wmGYb96taNAGHypmk9PMuSSOGG9RUkKFr/4IDiTTfK4KysIMHezU2u34LBPSXT+AdfUPi/UrxrQW8kcfnuG59kKl9fy9BtCU9oEUeAN9tBf6E9aBM6tGkQUpPTcOzmKBbg07tkXNaQJ5u7PW44bDYGMFT7g6ueTfq8TfaGMJ4jq4uYrFu0Sn2utO7Avun6jmHXcjVStcDlaOpEbLrBnYjh2JIOKO1uxXM8spwhPzpdgqil5KMoTMxGUX4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39850400004)(396003)(366004)(376002)(2906002)(31686004)(8936002)(15650500001)(30864003)(110136005)(5660300002)(316002)(6486002)(36756003)(6506007)(6512007)(26005)(6666004)(41300700001)(966005)(53546011)(478600001)(83380400001)(186003)(2616005)(66476007)(66556008)(66946007)(8676002)(4326008)(86362001)(31696002)(38100700002)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cy9UazRtWnJGZklHMHUxNTd5cHdKVXhGSDJIVGIrbk13L1FpVTVMOFBMYzhy?=
 =?utf-8?B?WTZPYWRET2w4MzNGQURNNGR0UENyc3kwZVJPYWFQYU1nVTl2VXluS3c0eHg1?=
 =?utf-8?B?eGRBRThYWmc4YWcvRHZZR1J4Y3kwUEJjWkFOUFVDamhlbXVnSEw1ajR5M0pN?=
 =?utf-8?B?N0ZmY0RGbUtsQVE2WVNnU3E4WkQweGRxdnlmRHhYa0VITXROUTBUN1RoQmc1?=
 =?utf-8?B?WGNNY0cxbm8xVVVuOUQwQmR2VTZwVVZ1VHZDV0w2UHd2M1NKdHhvQUpTaVdn?=
 =?utf-8?B?SFBkZDEzZmYxVGFqaVBsQ0trZ3h1bnlpTjlBbWNlZTBsUVlOMFlvL25ENE1x?=
 =?utf-8?B?UTgyN1llUWFtQlhuMG9aT2dJUjFMVjZpSTI3a3M1WHRseit1RkxGSnBEWGlS?=
 =?utf-8?B?RFNjeFljNWkvYkVIVXVTWTg1UnQ5N29sQnNZOCtpOEpOU2U0QkQwRENGOHRF?=
 =?utf-8?B?bDd4WC9TUmZiNVYxWmhndDJMV3VkMml4NGtKQWdnZi9hYVBUTlp6UkkwYmUr?=
 =?utf-8?B?NzQwaEtlM2dBNXFMODY2eWVaNWQwUXJoSjByeGtPaFdsZ0o5Q1BnTkNNMnZF?=
 =?utf-8?B?akdSM3JvcmxyRFZ3WmlrWEFIZDVMRjdZYlhRZk1NbitQQmIzeldOS0UyN2V2?=
 =?utf-8?B?MGhudkVTakVCVFg1ZEVLYjZzVHM2dTdHa3NadjljcW16RFdqRUtnUnoyZlcz?=
 =?utf-8?B?cDBFSTBuZHVmZ25URWYyWjYxdmFncUlSK0ZKMHBGSGZ4bkRoSm51STlTTU13?=
 =?utf-8?B?eW5DamVHV3dFaTlnZ2dPS3JBR2hmTXdYb3E5elBCcE1GaGsySndVeDVkOUVT?=
 =?utf-8?B?MjRKUTVHZ2pkcHZUNUtwTTlwc1pHK25IdTRwL2JaTExPL09NZ293U2dmZGRH?=
 =?utf-8?B?MDltWWcrTGJGL0lzeHZMdnBINk51TityS09wQWdUbENMbjc2ZE9Id3MzRnE0?=
 =?utf-8?B?WWc2VjVjM1M1dm9RaFkrK0w0WUhBMlY5M25rcTVOS3RsSEF5Y3hzcS9MaE9Z?=
 =?utf-8?B?OElubVI0MHdzNFV1OE1ma3VPS2h0RVFPTThrWXU0WllZa3JPcUI5emhlTUEy?=
 =?utf-8?B?NGFxL1JEd0xwMmlnWklmazZTTlRUYVZ1UWQ4NW5PNVN5dXJpM1RjL1FycVhv?=
 =?utf-8?B?YjVteXFzYVRaWjRWTVM1Y1JFdXhSODYxQjAyemljcjErc2Q5MWQ3eUxhby9T?=
 =?utf-8?B?aXpWZmNqSW85MjdpallLdDhzMm5kV01qTnRvQ1lxcXoxTHJKUi9TOTB0WEVp?=
 =?utf-8?B?TGpzQ3RvSnRTejd6WWRNQ0R2ZGN1TTF5TTlLQWw0YW94Z1BUdHVKSUNBbzl6?=
 =?utf-8?B?eTBYSHRGUExTQlBTNUlnT3Z0RWRkV2lEZUUyWnlQL3VRWmNZMWY4aURFMU11?=
 =?utf-8?B?UEJEV29Hb3NGUkpqQlU2bEZyZU1WTWZUMXl1WWRFNzJYcjdnY2JTbWNkMTJM?=
 =?utf-8?B?SkRRVkUzY1ZoTnNYZURpVFBtbktoWlF0RnlOWmp0Y1EyWUo0NFdVcEFTT0lx?=
 =?utf-8?B?NHdaRlQ0K0g5UE5VeFZPUit0U2orL1J1dzI5SGVKU3RlL2VOOEUyZjN1bXRX?=
 =?utf-8?B?VVdVM1o2NkxCRS9vNTJidWJDWlhuVGRUZ3YvV0M2UzFlNHJES2VGekt2OWZM?=
 =?utf-8?B?WUF2Nndremg4NUNMTGpkVXJ5Z3g3ZmtiZTEzQ3FOdWdFOFQ4d1B0d3ZyUURi?=
 =?utf-8?B?TFBnK214NUpGc3N0SGpaM0dHM3QyS0dSOVNxSzhzRnBQZFZFZWZGY0ZoaEE4?=
 =?utf-8?B?UzlKRkpZMkdEUmJNa1EvL3EyUm54UnRkUGMxc25mRGt1OFdWSHhOWGhYWklV?=
 =?utf-8?B?SDZhZmEzNCtCWlowUEFPdzJGRGRsRzJURURvMlc4OGQvbmdXcEUwRVFhNVFG?=
 =?utf-8?B?WnJyUmpaZUZLTlBXMCtrZDVnY29tcHJWbHZXak10RXhNa0dwQzRrNVlNOUkr?=
 =?utf-8?B?TXZnMlE0M1lYNGJBTDlYQmtqcXMrV2NuZmtqVHQ1M0dyVkh6UnZQbkpDQmlI?=
 =?utf-8?B?UTRNVmh3czlWTzd1SWpnTU00aXFVcUFJSndiVDZUYjMxTGk1MWVkc2M5eVJD?=
 =?utf-8?B?cjEvQ2t6ZXlXVDMvZFN5ZDJQM1A3WjNqNWNlUmlRclVjYUJtYitENk5aZEtM?=
 =?utf-8?Q?rkS/e2Fij0nxa+kkdYOtx0zsx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 274692a5-362f-4bf0-39bc-08da8b6620f2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 15:33:18.6391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZCKfP6B7JzwZmHNdrEAWUQmm0bivvjWM1vv5zSmQaXEXZXR3ZxSkIToe5lO9RfG8gwmIDmCDi2Jyggj52iI6KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4356
X-Proofpoint-ORIG-GUID: 8LVlpKdwEtH7RuWtIt_0X0-erMj2ZBlW
X-Proofpoint-GUID: iuFQzdpIUCnESgnFZEJ0hrMYtT2C12Sb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_09,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208310076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 15:33:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170132

need fix the issue in lttng-modules package:

https://github.com/lttng/lttng-modules/commit/9f7df0f1867273244e62e14e68e20e03db4902ca

Thanks,
LiWang.

On 8/30/2022 10:08, Bruce Ashfield wrote:
> On Mon, Aug 29, 2022 at 11:07 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Mon, Aug 29, 2022 at 5:56 PM Steve Sakoman <steve@sakoman.com> wrote:
>>> Unfortunately I'm getting a build error in lttng-modules with these updates:
>>>
>>> https://errors.yoctoproject.org/Errors/Details/670595/
>> Right. Someone else will have to look into backporting the appropriate
>> fixes, since I won't have time for a few weeks to do anything more
>> than keeping 5.4 kernel up to date.
> That should say "5.10"
>
> Bruce
>
>> Bruce
>>
>>> Steve
>>>
>>> On Sun, Aug 28, 2022 at 3:58 PM <bruce.ashfield@gmail.com> wrote:
>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>
>>>> Updating  to the latest korg -stable release that comprises
>>>> the following commits:
>>>>
>>>>      74ded189e5e4 Linux 5.10.137
>>>>      fb4e220e1b2b btrfs: raid56: don't trust any cached sector in __raid56_parity_recover()
>>>>      1e1a039f44b7 btrfs: only write the sectors in the vertical stripe which has data stripes
>>>>      8f317cd88805 sched/fair: Fix fault in reweight_entity
>>>>      aa318d35bedc net_sched: cls_route: disallow handle of 0
>>>>      5a2a00b60458 net/9p: Initialize the iounit field during fid creation
>>>>      578c349570d2 tee: add overflow check in register_shm_helper()
>>>>      98b20e1612e6 kvm: x86/pmu: Fix the compare function used by the pmu event filter
>>>>      705dfc4575d6 mtd: rawnand: arasan: Prevent an unsupported configuration
>>>>      c898e917d8bb Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm regression
>>>>      e81046da1d9b Revert "net: usb: ax88179_178a needs FLAG_SEND_ZLP"
>>>>      a60996dc027a drm/vc4: change vc4_dma_range_matches from a global to static
>>>>      3422e24af9ba drm/bridge: tc358767: Fix (e)DP bridge endpoint parsing in dedicated function
>>>>      2223b35c5752 Revert "mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv"
>>>>      8338305317df tcp: fix over estimation in sk_forced_mem_schedule()
>>>>      c35c01a7cb30 mac80211: fix a memory leak where sta_info is not freed
>>>>      ac7de8c2ba12 KVM: x86: Avoid theoretical NULL pointer dereference in kvm_irq_delivery_to_apic_fast()
>>>>      4c85e207c1b5 KVM: x86: Check lapic_in_kernel() before attempting to set a SynIC irq
>>>>      a4c94205ba79 KVM: Add infrastructure and macro to mark VM as bugged
>>>>      7018f03d97da net_sched: cls_route: remove from list when handle is 0
>>>>      49dba30638e0 dm raid: fix address sanitizer warning in raid_status
>>>>      c2d47bef93fb dm raid: fix address sanitizer warning in raid_resume
>>>>      d0b495aa2692 ext4: correct the misjudgment in ext4_iget_extra_inode
>>>>      603fb7bd744a ext4: correct max_inline_xattr_value_size computing
>>>>      e8c747496f23 ext4: fix extent status tree race in writeback error recovery path
>>>>      ac8cc061145a ext4: update s_overhead_clusters in the superblock during an on-line resize
>>>>      bb8592efcf8e ext4: fix use-after-free in ext4_xattr_set_entry
>>>>      69d1a36eb4b2 ext4: make sure ext4_append() always allocates new block
>>>>      e1682c7171a6 ext4: fix warning in ext4_iomap_begin as race between bmap and write
>>>>      2da44a2927a7 ext4: add EXT4_INODE_HAS_XATTR_SPACE macro in xattr.h
>>>>      1571c4613059 ext4: check if directory block is within i_size
>>>>      e99da0f92142 tracing: Use a struct alignof to determine trace event field alignment
>>>>      35508b60b54a tpm: eventlog: Fix section mismatch for DEBUG_SECTION_MISMATCH
>>>>      0e48eaf75d18 KEYS: asymmetric: enforce SM2 signature use pkey algo
>>>>      135d9e071099 xen-blkfront: Apply 'feature_persistent' parameter when connect
>>>>      d4fb08e5a4b4 xen-blkback: Apply 'feature_persistent' parameter when connect
>>>>      9e8408845276 xen-blkback: fix persistent grants negotiation
>>>>      b788508a0990 KVM: x86/pmu: Ignore pmu->global_ctrl check if vPMU doesn't support global_ctrl
>>>>      6b4addec2f2d KVM: VMX: Mark all PERF_GLOBAL_(OVF)_CTRL bits reserved if there's no vPMU
>>>>      46ec3d8e9094 KVM: x86/pmu: Introduce the ctrl_mask value for fixed counter
>>>>      2ba1feb14363 KVM: x86/pmu: Use different raw event masks for AMD and Intel
>>>>      4bbfc055d3a7 KVM: x86/pmu: Use binary search to check filtered events
>>>>      441726394efa KVM: x86/pmu: preserve IA32_PERF_CAPABILITIES across CPUID refresh
>>>>      a7d0b21c6b40 KVM: nVMX: Inject #UD if VMXON is attempted with incompatible CR0/CR4
>>>>      c72a9b1d0dad KVM: x86: Move vendor CR4 validity check to dedicated kvm_x86_ops hook
>>>>      2f04a04d0650 KVM: SVM: Drop VMXE check from svm_set_cr4()
>>>>      da7f731f2ed5 KVM: VMX: Drop explicit 'nested' check from vmx_set_cr4()
>>>>      8b8b376903b3 KVM: VMX: Drop guest CPUID check for VMXE in vmx_set_cr4()
>>>>      5f3c8352cc22 ACPI: CPPC: Do not prevent CPPC from working in the future
>>>>      40d28ae57672 btrfs: reset block group chunk force if we have to wait
>>>>      e2f150730316 btrfs: reject log replay if there is unsupported RO compat flag
>>>>      b58294ce1a8a um: Allow PM with suspend-to-idle
>>>>      c6cf21d8d520 timekeeping: contribute wall clock to rng on time change
>>>>      5e2cf705155a dm thin: fix use-after-free crash in dm_sm_register_threshold_callback
>>>>      539c20ad260e kexec, KEYS, s390: Make use of built-in and secondary keyring for signature verification
>>>>      782e73acdba8 dm writecache: set a default MAX_WRITEBACK_JOBS
>>>>      e41b3b883179 serial: 8250: Fold EndRun device support into OxSemi Tornado code
>>>>      194dc559e6b2 serial: 8250_pci: Replace dev_*() by pci_*() macros
>>>>      297e2fd08a58 serial: 8250_pci: Refactor the loop in pci_ite887x_init()
>>>>      3110e5a49b87 serial: 8250: Correct the clock for OxSemi PCIe devices
>>>>      3e9baedb3237 serial: 8250: Dissociate 4MHz Titan ports from Oxford ports
>>>>      85d6306a87c5 PCI/AER: Iterate over error counters instead of error strings
>>>>      d83d886e69bd PCI/ERR: Recover from RCEC AER errors
>>>>      bb6990fd3729 PCI/ERR: Add pci_walk_bridge() to pcie_do_recovery()
>>>>      7730ba6151b7 PCI/ERR: Avoid negated conditional for clarity
>>>>      078d79fad521 PCI/ERR: Use "bridge" for clarity in pcie_do_recovery()
>>>>      2e3458b995aa PCI/ERR: Simplify by computing pci_pcie_type() once
>>>>      f236fa38508b PCI/ERR: Simplify by using pci_upstream_bridge()
>>>>      de4534ac28c4 PCI/ERR: Rename reset_link() to reset_subordinates()
>>>>      78d431e8a56c PCI/ERR: Bind RCEC devices to the Root Port driver
>>>>      dce8d7427c6a PCI/AER: Write AER Capability only when we control it
>>>>      5659efdadf04 iommu/vt-d: avoid invalid memory access via node_online(NUMA_NO_NODE)
>>>>      e7ccee2f09b0 KVM: x86: Signal #GP, not -EPERM, on bad WRMSR(MCi_CTL/STATUS)
>>>>      f5385a590df7 KVM: set_msr_mce: Permit guests to ignore single-bit ECC errors
>>>>      6a84dae3a7ec intel_th: pci: Add Raptor Lake-S CPU support
>>>>      581f7eb8ae3d intel_th: pci: Add Raptor Lake-S PCH support
>>>>      36f5ddde6776 intel_th: pci: Add Meteor Lake-P support
>>>>      08272646cd7c firmware: arm_scpi: Ensure scpi_info is not assigned if the probe fails
>>>>      bc945ca49613 usbnet: smsc95xx: Avoid link settings race on interrupt reception
>>>>      e9733561e966 usbnet: smsc95xx: Don't clear read-only PHY interrupt
>>>>      04c9d23ac352 mtd: rawnand: arasan: Fix clock rate in NV-DDR
>>>>      dc0e4a10b49d mtd: rawnand: arasan: Support NV-DDR interface
>>>>      87d1266b4cd4 mtd: rawnand: arasan: Fix a macro parameter
>>>>      d4f7bcce9002 mtd: rawnand: Add NV-DDR timings
>>>>      72fae7e7f7f5 mtd: rawnand: arasan: Check the proposed data interface is supported
>>>>      c91e5215a413 mtd: rawnand: Add a helper to clarify the interface configuration
>>>>      ae1e2bc7bfaa drm/vc4: drv: Adopt the dma configuration from the HVS or V3D component
>>>>      fe695a2b469b HID: hid-input: add Surface Go battery quirk
>>>>      434c4aad53fd HID: Ignore battery for Elan touchscreen on HP Spectre X360 15-df0xxx
>>>>      2d05cf10695e drm/mediatek: Keep dsi as LP00 before dcs cmds transfer
>>>>      311728757821 drm/mediatek: Allow commands to be sent during video mode
>>>>      a3a85c045aa0 drm/i915/dg1: Update DMC_DEBUG3 register
>>>>      dd02510fb431 spmi: trace: fix stack-out-of-bound access in SPMI tracing functions
>>>>      bc8c5b3b3eb9 __follow_mount_rcu(): verify that mount_lock remains unchanged
>>>>      bda7046d4d59 Input: gscps2 - check return value of ioremap() in gscps2_probe()
>>>>      541840859ace posix-cpu-timers: Cleanup CPU timers before freeing them during exec
>>>>      ce19182b43a5 x86/olpc: fix 'logical not is only applied to the left hand side'
>>>>      43e059d01628 ftrace/x86: Add back ftrace_expected assignment
>>>>      fd96b61389f8 x86/bugs: Enable STIBP for IBPB mitigated RETBleed
>>>>      1118020b3b7a scsi: qla2xxx: Fix losing FCP-2 targets during port perturbation tests
>>>>      912408ba0bdc scsi: qla2xxx: Fix losing FCP-2 targets on long port disable with I/Os
>>>>      82cb0ebe5bd1 scsi: qla2xxx: Fix erroneous mailbox timeout after PCI error injection
>>>>      7941ca578c4d scsi: qla2xxx: Turn off multi-queue for 8G adapters
>>>>      2ffe5285ea5d scsi: qla2xxx: Fix discovery issues in FC-AL topology
>>>>      b8aad5eba738 scsi: zfcp: Fix missing auto port scan and thus missing target ports
>>>>      5e0da18956d3 video: fbdev: s3fb: Check the size of screen before memset_io()
>>>>      09e733d6ac94 video: fbdev: arkfb: Check the size of screen before memset_io()
>>>>      bd8269e57621 video: fbdev: vt8623fb: Check the size of screen before memset_io()
>>>>      a9943942a501 x86/entry: Build thunk_$(BITS) only if CONFIG_PREEMPTION=y
>>>>      e6c228b950d0 sched: Fix the check of nr_running at queue wakelist
>>>>      bd1ebcbbf08e tools/thermal: Fix possible path truncations
>>>>      0288fa799e27 video: fbdev: arkfb: Fix a divide-by-zero bug in ark_set_pixclock()
>>>>      94398c1fec34 x86/numa: Use cpumask_available instead of hardcoded NULL check
>>>>      336626564b58 sched, cpuset: Fix dl_cpu_busy() panic due to empty cs->cpus_allowed
>>>>      0039189a3b15 sched/deadline: Merge dl_task_can_attach() and dl_cpu_busy()
>>>>      e695256d4604 scripts/faddr2line: Fix vmlinux detection on arm64
>>>>      232f4aca400a genelf: Use HAVE_LIBCRYPTO_SUPPORT, not the never defined HAVE_LIBCRYPTO
>>>>      cadeb5186e25 powerpc/pci: Fix PHB numbering when using opal-phbid
>>>>      2a49b025c36a kprobes: Forbid probing on trampoline and BPF code areas
>>>>      4296089f61aa perf symbol: Fail to read phdr workaround
>>>>      00dc7cbbb558 powerpc/cell/axon_msi: Fix refcount leak in setup_msi_msg_address
>>>>      6d1e53f7f181 powerpc/xive: Fix refcount leak in xive_get_max_prio
>>>>      85aff6a9b7b7 powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
>>>>      50e7896c8e0a f2fs: fix to remove F2FS_COMPR_FL and tag F2FS_NOCOMP_FL at the same time
>>>>      ec769406d06d f2fs: write checkpoint during FG_GC
>>>>      d0311057395b f2fs: don't set GC_FAILURE_PIN for background GC
>>>>      47a8fe1b154a powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
>>>>      7ac58a83d8f1 powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
>>>>      2d2b6adb22c8 ASoC: mchp-spdifrx: disable end of block interrupt on failures
>>>>      ca326aff6bf3 video: fbdev: sis: fix typos in SiS_GetModeID()
>>>>      da276dc288bf video: fbdev: amba-clcd: Fix refcount leak bugs
>>>>      345208581c4a watchdog: armada_37xx_wdt: check the return value of devm_ioremap() in armada_37xx_wdt_probe()
>>>>      d3e6460619d4 ASoC: audio-graph-card: Add of_node_put() in fail path
>>>>      92644d505b4e fuse: Remove the control interface for virtio-fs
>>>>      60e494b4d578 ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
>>>>      5682b4f84aab ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
>>>>      9c2ad32ed916 s390/zcore: fix race when reading from hardware system area
>>>>      ae921d176b6f s390/dump: fix old lowcore virtual vs physical address confusion
>>>>      b002a71d45bd perf tools: Fix dso_id inode generation comparison
>>>>      2ada6b4a8007 iommu/arm-smmu: qcom_iommu: Add of_node_put() when breaking out of loop
>>>>      afdbadbf18c1 mfd: max77620: Fix refcount leak in max77620_initialise_fps
>>>>      52ae9c159972 mfd: t7l66xb: Drop platform disable callback
>>>>      5a0e3350c29e remoteproc: sysmon: Wait for SSCTL service to come up
>>>>      3487aa558a66 lib/smp_processor_id: fix imbalanced instrumentation_end() call
>>>>      483ad8a16fde kfifo: fix kfifo_to_user() return type
>>>>      9715809b9eeb rpmsg: qcom_smd: Fix refcount leak in qcom_smd_parse_edge
>>>>      0ce20194b4a6 iommu/exynos: Handle failed IOMMU device registration properly
>>>>      8fd063a6085a tty: n_gsm: fix missing corner cases in gsmld_poll()
>>>>      01c8094bed8e tty: n_gsm: fix DM command
>>>>      6737d4f5f513 tty: n_gsm: fix wrong T1 retry count handling
>>>>      b16d653bc7bb vfio/ccw: Do not change FSM state in subchannel event
>>>>      db574d3bb6e5 vfio/mdev: Make to_mdev_device() into a static inline
>>>>      a2fbf4acd280 vfio: Split creation of a vfio_device into init and register ops
>>>>      f54fa910e6cb vfio: Simplify the lifetime logic for vfio_device
>>>>      0abdb80e812a vfio: Remove extra put/gets around vfio_device->group
>>>>      cb83b12320ea remoteproc: qcom: wcnss: Fix handling of IRQs
>>>>      2f735069cdc1 ASoC: qcom: Fix missing of_node_put() in asoc_qcom_lpass_cpu_platform_probe()
>>>>      273d41217721 tty: n_gsm: fix race condition in gsmld_write()
>>>>      2466486cae0a tty: n_gsm: fix packet re-transmission without open control channel
>>>>      34c9fe392d26 tty: n_gsm: fix non flow control frames during mux flow off
>>>>      006e9d5a9877 tty: n_gsm: fix wrong queuing behavior in gsm_dlci_data_output()
>>>>      c45b5d24fe06 tty: n_gsm: fix user open not possible at responder until initiator open
>>>>      9e38020f1700 tty: n_gsm: Delete gsmtty open SABM frame when config requester
>>>>      d94a552183c0 ASoC: samsung: change gpiod_speaker_power and rx1950_audio from global to static variables
>>>>      875b2bf469d0 powerpc/perf: Optimize clearing the pending PMI and remove WARN_ON for PMI check in power_pmu_disable
>>>>      ba889da9a0e1 ASoC: samsung: h1940_uda1380: include proepr GPIO consumer header
>>>>      4046f3ef3bb6 profiling: fix shift too large makes kernel panic
>>>>      3bf64b9cc640 selftests/livepatch: better synchronize test_klp_callbacks_busy
>>>>      75358732af9b remoteproc: k3-r5: Fix refcount leak in k3_r5_cluster_of_init
>>>>      2aa8737d49a9 rpmsg: mtk_rpmsg: Fix circular locking dependency
>>>>      1d5fc40382c5 ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
>>>>      4181b214184b ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
>>>>      4b171ac88cb7 serial: 8250_dw: Store LSR into lsr_saved_flags in dw8250_tx_wait_empty()
>>>>      d98dd16d3dfd serial: 8250: Export ICR access helpers for internal use
>>>>      403d46971936 ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
>>>>      132b2757c52f ASoC: codecs: da7210: add check for i2c_add_driver
>>>>      a0381a9f3e59 ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
>>>>      aa1214ece379 ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
>>>>      ec0c272b1868 ASoC: samsung: Fix error handling in aries_audio_probe
>>>>      bae95c5aee1f ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
>>>>      e2a4e46f5258 opp: Fix error check in dev_pm_opp_attach_genpd()
>>>>      3b973703229a usb: cdns3: Don't use priv_dev uninitialized in cdns3_gadget_ep_enable()
>>>>      f7161d0da975 jbd2: fix assertion 'jh->b_frozen_data == NULL' failure when journal aborted
>>>>      a6d7f224730e ext4: recover csum seed of tmp_inode after migrating to extents
>>>>      914bf4aa2d5b jbd2: fix outstanding credits assert in jbd2_journal_commit_transaction()
>>>>      706960d328f5 nvme: use command_id instead of req->tag in trace_nvme_complete_rq()
>>>>      7a4b46784a7b null_blk: fix ida error handling in null_add_dev()
>>>>      3ef491b26c72 RDMA/rxe: Fix error unwind in rxe_create_qp()
>>>>      53da1f0fa0e2 RDMA/mlx5: Add missing check for return value in get namespace flow
>>>>      c0ba87f3e7b4 selftests: kvm: set rax before vmcall
>>>>      4ffa6cecb53d mm/mmap.c: fix missing call to vm_unacct_memory in mmap_region
>>>>      de95b52d9aab RDMA/srpt: Fix a use-after-free
>>>>      d14a44cf2919 RDMA/srpt: Introduce a reference count in struct srpt_device
>>>>      204a8486d775 RDMA/srpt: Duplicate port name members
>>>>      5ba56d9bd0d0 platform/olpc: Fix uninitialized data in debugfs write
>>>>      7af83bb516d7 usb: cdns3: change place of 'priv_ep' assignment in cdns3_gadget_ep_dequeue(), cdns3_gadget_ep_enable()
>>>>      a916e8036079 USB: serial: fix tty-port initialized comments
>>>>      b1124a2f478f PCI: tegra194: Fix link up retry sequence
>>>>      88a694d9c870 PCI: tegra194: Fix Root Port interrupt handling
>>>>      e2d132ca7fab HID: alps: Declare U1_UNICORN_LEGACY support
>>>>      74e57439e21f mmc: cavium-thunderx: Add of_node_put() when breaking out of loop
>>>>      3bed7b981175 mmc: cavium-octeon: Add of_node_put() when breaking out of loop
>>>>      66c8e816f2f2 HID: mcp2221: prevent a buffer overflow in mcp_smbus_write()
>>>>      26975d8ea96b gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
>>>>      a85c7dd1edad RDMA/hfi1: fix potential memory leak in setup_base_ctxt()
>>>>      9ade92ddaf23 RDMA/siw: Fix duplicated reported IW_CM_EVENT_CONNECT_REPLY event
>>>>      0ecc91cf9645 RDMA/hns: Fix incorrect clearing of interrupt status register
>>>>      79ce50dddaf2 RDMA/qedr: Fix potential memory leak in __qedr_alloc_mr()
>>>>      aaa1a8150657 RDMA/qedr: Improve error logs for rdma_alloc_tid error return
>>>>      84f83a26194a RDMA/rtrs-srv: Fix modinfo output for stringify
>>>>      50a249ad1db7 RDMA/rtrs: Avoid Wtautological-constant-out-of-range-compare
>>>>      2b3dcfbece1c RDMA/rtrs: Define MIN_CHUNK_SIZE
>>>>      993cd1621180 um: random: Don't initialise hwrng struct with zero
>>>>      a6a7f80e6267 interconnect: imx: fix max_node_id
>>>>      5bcc37dc2463 eeprom: idt_89hpesx: uninitialized data in idt_dbgfs_csr_write()
>>>>      4ab5662cc3ce usb: dwc3: qcom: fix missing optional irq warnings
>>>>      d376ca671683 usb: dwc3: core: Do not perform GCTL_CORE_SOFTRESET during bootup
>>>>      251572a26dea usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
>>>>      e6db5780c2bf usb: aspeed-vhub: Fix refcount leak bug in ast_vhub_init_desc()
>>>>      c818fa991c51 usb: gadget: udc: amd5536 depends on HAS_DMA
>>>>      d6d344eeef7a xtensa: iss: fix handling error cases in iss_net_configure()
>>>>      fb4c1555f93f xtensa: iss/network: provide release() callback
>>>>      2fe0b06c166c scsi: smartpqi: Fix DMA direction for RAID requests
>>>>      7542130af1b7 PCI: qcom: Set up rev 2.1.0 PARF_PHY before enabling clocks
>>>>      ee70aa214a2d PCI/portdrv: Don't disable AER reporting in get_port_device_capability()
>>>>      9d216035d173 KVM: s390: pv: leak the topmost page table when destroy fails
>>>>      59fd7c0b41e0 mmc: block: Add single read for 4k sector cards
>>>>      2985acdaf27d mmc: sdhci-of-at91: fix set_uhs_signaling rewriting of MC1R
>>>>      9260a154b3b5 memstick/ms_block: Fix a memory leak
>>>>      ae2369ac4247 memstick/ms_block: Fix some incorrect memory allocation
>>>>      b305475df756 mmc: sdhci-of-esdhc: Fix refcount leak in esdhc_signal_voltage_switch
>>>>      028c8632a2dc staging: rtl8192u: Fix sleep in atomic context bug in dm_fsync_timer_callback
>>>>      6ae2881c1d1f intel_th: msu: Fix vmalloced buffers
>>>>      81222cfda686 intel_th: msu-sink: Potential dereference of null pointer
>>>>      a8f3b78b1f8e intel_th: Fix a resource leak in an error handling path
>>>>      ab3b82435f14 PCI: endpoint: Don't stop controller when unbinding endpoint function
>>>>      b9b4992f897b dmaengine: sf-pdma: Add multithread support for a DMA channel
>>>>      37e1d474a3fb dmaengine: sf-pdma: apply proper spinlock flags in sf_pdma_prep_dma_memcpy()
>>>>      38715a0ccb55 KVM: arm64: Don't return from void function
>>>>      fbd7b564f930 soundwire: bus_type: fix remove and shutdown support
>>>>      ed457b0029ab PCI: dwc: Always enable CDM check if "snps,enable-cdm-check" exists
>>>>      e7599a5974d4 PCI: dwc: Deallocate EPC memory on dw_pcie_ep_init() errors
>>>>      80d9f6541ee2 PCI: dwc: Add unroll iATU space support to dw_pcie_disable_atu()
>>>>      2293b23d274b clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
>>>>      b28ebe7d2f10 clk: qcom: ipq8074: set BRANCH_HALT_DELAY flag for UBI clocks
>>>>      b83af7b4ec1d clk: qcom: ipq8074: fix NSS port frequency tables
>>>>      58023f5291b4 clk: qcom: ipq8074: SW workaround for UBI32 PLL lock
>>>>      e2330494f0f8 clk: qcom: ipq8074: fix NSS core PLL-s
>>>>      b840c2926de2 usb: host: xhci: use snprintf() in xhci_decode_trb()
>>>>      42f182709663 clk: qcom: clk-krait: unlock spin after mux completion
>>>>      a93f33aeef4e driver core: fix potential deadlock in __driver_attach
>>>>      2593f971f043 misc: rtsx: Fix an error handling path in rtsx_pci_probe()
>>>>      267c5f17a001 dmaengine: dw-edma: Fix eDMA Rd/Wr-channels and DMA-direction semantics
>>>>      956b79c20665 mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv
>>>>      803526555b2a mwifiex: Ignore BTCOEX events from the 88W8897 firmware
>>>>      dceedbb5aba0 KVM: Don't set Accessed/Dirty bits for ZERO_PAGE
>>>>      02d203f48821 clk: mediatek: reset: Fix written reset bit offset
>>>>      4f51a09f3d7b iio: accel: bma400: Reordering of header files
>>>>      ab831a12c8a7 platform/chrome: cros_ec: Always expose last resume result
>>>>      366d0123c387 iio: accel: bma400: Fix the scale min and max macro values
>>>>      edfa0851d8c9 netfilter: xtables: Bring SPDX identifier back
>>>>      9feb3ecd0709 usb: xhci: tegra: Fix error check
>>>>      bb5e59f00f7d usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()
>>>>      d35903e9650f usb: ohci-nxp: Fix refcount leak in ohci_hcd_nxp_probe
>>>>      585d22a5624e usb: host: Fix refcount leak in ehci_hcd_ppc_of_probe
>>>>      474f12deaa19 fpga: altera-pr-ip: fix unsigned comparison with less than zero
>>>>      175428c86fb8 mtd: st_spi_fsm: Add a clk_disable_unprepare() in .probe()'s error path
>>>>      55d0f7da66de mtd: partitions: Fix refcount leak in parse_redboot_of
>>>>      b4e150d295ba mtd: sm_ftl: Fix deadlock caused by cancel_work_sync in sm_release
>>>>      ebda3d6b004b HID: cp2112: prevent a buffer overflow in cp2112_xfer()
>>>>      cdf92a0aee97 PCI: tegra194: Fix PM error handling in tegra_pcie_config_ep()
>>>>      b0e82f95fded mtd: rawnand: meson: Fix a potential double free issue
>>>>      941ef6997f9d mtd: maps: Fix refcount leak in ap_flash_init
>>>>      52ae2b14f76e mtd: maps: Fix refcount leak in of_flash_probe_versatile
>>>>      6471c83894c1 clk: renesas: r9a06g032: Fix UART clkgrp bitsel
>>>>      38c9cc68e36f wireguard: allowedips: don't corrupt stack when detecting overflow
>>>>      17541a4aab81 wireguard: ratelimiter: use hrtimer in selftest
>>>>      aa8f5593367a dccp: put dccp_qpolicy_full() and dccp_qpolicy_push() in the same lock
>>>>      5b69f34daccc net: ionic: fix error check for vlan flags in ionic_set_nic_features()
>>>>      9a070a441766 net: rose: fix netdev reference changes
>>>>      397e52dec168 netdevsim: Avoid allocation warnings triggered from user space
>>>>      692751f26099 iavf: Fix max_rate limiting
>>>>      b0d67ef5b43a net: allow unbound socket for packets in VRF when tcp_l3mdev_accept set
>>>>      1d9c81833dec tcp: Fix data-races around sysctl_tcp_l3mdev_accept.
>>>>      0de9b3f81e01 ipv6: add READ_ONCE(sk->sk_bound_dev_if) in INET6_MATCH()
>>>>      b7325b27d869 tcp: sk->sk_bound_dev_if once in inet_request_bound_dev_if()
>>>>      f7884d95000a inet: add READ_ONCE(sk->sk_bound_dev_if) in INET_MATCH()
>>>>      c206177ca8a9 crypto: hisilicon/sec - fix auth key size error
>>>>      9524edb1a782 crypto: inside-secure - Add missing MODULE_DEVICE_TABLE for of
>>>>      cb6277507998 crypto: hisilicon/hpre - don't use GFP_KERNEL to alloc mem during softirq
>>>>      e6cbd15950cf net/mlx5e: Fix the value of MLX5E_MAX_RQ_NUM_MTTS
>>>>      1f7ffdea19f2 net/mlx5e: Remove WARN_ON when trying to offload an unsupported TLS cipher/version
>>>>      420cf3b781b2 media: cedrus: hevc: Add check for invalid timestamp
>>>>      97e5d3e46a3a wifi: libertas: Fix possible refcount leak in if_usb_probe()
>>>>      38d71acc15a2 wifi: iwlwifi: mvm: fix double list_add at iwl_mvm_mac_wake_tx_queue
>>>>      6c5fee83bdbe wifi: wil6210: debugfs: fix uninitialized variable use in `wil_write_file_wmi()`
>>>>      c040a02e4c21 i2c: mux-gpmux: Add of_node_put() when breaking out of loop
>>>>      353d55ff1bfc i2c: cadence: Support PEC for SMBus block read
>>>>      0c5dbac1ce7f Bluetooth: hci_intel: Add check for platform_driver_register
>>>>      a7a7488cb15a can: pch_can: pch_can_error(): initialize errc before using it
>>>>      4c036be75774 can: error: specify the values of data[5..7] of CAN error frames
>>>>      f0ef21b73978 can: usb_8dev: do not report txerr and rxerr during bus-off
>>>>      ca1a2c538834 can: kvaser_usb_leaf: do not report txerr and rxerr during bus-off
>>>>      9e6ceba6be36 can: kvaser_usb_hydra: do not report txerr and rxerr during bus-off
>>>>      cddef4bbebea can: sun4i_can: do not report txerr and rxerr during bus-off
>>>>      22e382d47de0 can: hi311x: do not report txerr and rxerr during bus-off
>>>>      06e355b46c30 can: sja1000: do not report txerr and rxerr during bus-off
>>>>      6ec509679beb can: rcar_can: do not report txerr and rxerr during bus-off
>>>>      5d85a89875e8 can: pch_can: do not report txerr and rxerr during bus-off
>>>>      d2b9e664bbfd selftests/bpf: fix a test for snprintf() overflow
>>>>      a06c98c47e45 wifi: p54: add missing parentheses in p54_flush()
>>>>      56924fc19d31 wifi: p54: Fix an error handling path in p54spi_probe()
>>>>      05ceda14ef7c wifi: wil6210: debugfs: fix info leak in wil_write_file_wmi()
>>>>      36ba38996001 fs: check FMODE_LSEEK to control internal pipe splicing
>>>>      7430e587643a bpf: Fix subprog names in stack traces.
>>>>      990ca39e78cf selftests: timers: clocksource-switch: fix passing errors from child
>>>>      ee3cc4c76121 selftests: timers: valid-adjtimex: build fix for newer toolchains
>>>>      f29cf37698db libbpf: Fix the name of a reused map
>>>>      799cfed1b1a8 tcp: make retransmitted SKB fit into the send window
>>>>      5713b0be6dd9 drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() failed.
>>>>      9aa4ad5ccabc mediatek: mt76: mac80211: Fix missing of_node_put() in mt76_led_init()
>>>>      3ad958bc488e mt76: mt76x02u: fix possible memory leak in __mt76x02u_mcu_send_msg
>>>>      b1812f6500dd media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment
>>>>      1008c6d98b6d crypto: hisilicon - Kunpeng916 crypto driver don't sleep when in softirq
>>>>      16e18a8ac7c9 crypto: hisilicon/sec - don't sleep when in softirq
>>>>      1f697d795290 crypto: hisilicon/sec - fixes some coding style
>>>>      bf386c955f35 drm/msm/mdp5: Fix global state lock backoff
>>>>      e74f3097a9c7 net: hinic: avoid kernel hung in hinic_get_stats64()
>>>>      e286a882f227 net: hinic: fix bug that ethtool get wrong stats
>>>>      8369a39b529d hinic: Use the bitmap API when applicable
>>>>      26a10aef28d9 lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
>>>>      1238da5f32b7 lib: bitmap: order includes alphabetically
>>>>      7f29d75693dc drm: bridge: sii8620: fix possible off-by-one
>>>>      8bb0be3186b1 drm/mediatek: dpi: Only enable dpi after the bridge is enabled
>>>>      c47d69ed5667 drm/mediatek: dpi: Remove output format of YUV
>>>>      fc85cb33f6aa drm/rockchip: Fix an error handling path rockchip_dp_probe()
>>>>      9f416e32eda9 drm/rockchip: vop: Don't crash for invalid duplicate_state()
>>>>      e2d2dcab19f6 selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0
>>>>      64b1e3f90491 crypto: arm64/gcm - Select AEAD for GHASH_ARM64_CE
>>>>      2e306d74adcf drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
>>>>      36f797a10f30 drm/vc4: hdmi: Fix timings for interlaced modes
>>>>      717325e814d0 drm/vc4: hdmi: Limit the BCM2711 to the max without scrambling
>>>>      c015d12317c5 drm/vc4: hdmi: Don't access the connector state in reset if kmalloc fails
>>>>      ba8ffdb450d4 drm/vc4: hdmi: Avoid full hdmi audio fifo writes
>>>>      b161b2706776 drm/vc4: hdmi: Remove firmware logic for MAI threshold setting
>>>>      cefc8e7e0ea4 drm/vc4: dsi: Add correct stop condition to vc4_dsi_encoder_disable iteration
>>>>      acfca24ec0b7 drm/vc4: dsi: Fix dsi0 interrupt support
>>>>      97c2fa3a7b9e drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
>>>>      6cc1edddcf02 drm/vc4: dsi: Introduce a variant structure
>>>>      79374da86285 drm/vc4: dsi: Use snprintf for the PHY clocks instead of an array
>>>>      1f98187a7c15 drm/vc4: drv: Remove the DSI pointer in vc4_drv
>>>>      ed2f42bd8021 drm/vc4: dsi: Correct pixel order for DSI0
>>>>      ddf6af3b0b3f drm/vc4: dsi: Correct DSI divider calculations
>>>>      f517da5234f8 drm/vc4: plane: Fix margin calculations for the right/bottom edges
>>>>      5aec7cb08bb7 drm/vc4: plane: Remove subpixel positioning check
>>>>      611f86965df0 media: tw686x: Fix memory leak in tw686x_video_init
>>>>      7f7336ce3568 media: v4l2-mem2mem: prevent pollerr when last_buffer_dequeued is set
>>>>      bb480bffc1fd media: hdpvr: fix error value returns in hdpvr_read
>>>>      f57699a9b66e drm/mcde: Fix refcount leak in mcde_dsi_bind
>>>>      6a43236ebcfb drm: bridge: adv7511: Add check for mipi_dsi_driver_register
>>>>      87af9b0b4566 crypto: ccp - During shutdown, check SEV data pointer before using
>>>>      5f8a6e8f14d6 test_bpf: fix incorrect netdev features
>>>>      45e1dbe5f6e1 drm/radeon: fix incorrrect SPDX-License-Identifiers
>>>>      e7d6cac69675 wifi: iwlegacy: 4965: fix potential off-by-one overflow in il4965_rs_fill_link_cmd()
>>>>      eccd7c3e2596 ath9k: fix use-after-free in ath9k_hif_usb_rx_cb
>>>>      918f42ca1d3f media: tw686x: Register the irq at the end of probe
>>>>      d45eaf41140c crypto: sun8i-ss - fix infinite loop in sun8i_ss_setup_ivs()
>>>>      81cb31756888 i2c: Fix a potential use after free
>>>>      d0412d8f693e net: fix sk_wmem_schedule() and sk_rmem_schedule() errors
>>>>      0e70bb9cdb0e crypto: sun8i-ss - fix error codes in allocate_flows()
>>>>      e8673fbc10ff crypto: sun8i-ss - do not allocate memory when handling hash requests
>>>>      648b1bb29a46 drm: adv7511: override i2c address of cec before accessing it
>>>>      259773fc8742 virtio-gpu: fix a missing check to avoid NULL dereference
>>>>      e28aa4f4674d i2c: npcm: Correct slave role behavior
>>>>      385f6ef4de3d i2c: npcm: Remove own slave addresses 2:10
>>>>      5ce9cff37181 drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff function
>>>>      b54bc0013d7b drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs
>>>>      0cb658988511 drm/mediatek: Modify dsi funcs to atomic operations
>>>>      8508d6d23a24 drm/radeon: fix potential buffer overflow in ni_set_mc_special_registers()
>>>>      ac225376438c ath11k: Fix incorrect debug_mask mappings
>>>>      648d3c87141f drm/mipi-dbi: align max_chunk to 2 in spi_transfer
>>>>      a2c45f8c3d18 ath11k: fix netdev open race
>>>>      58fd794675f0 wifi: rtlwifi: fix error codes in rtl_debugfs_set_write_h2c()
>>>>      71426d31d0ee drm/st7735r: Fix module autoloading for Okaya RH128128T
>>>>      fd98ccda50a4 ath10k: do not enforce interrupt trigger type
>>>>      bcc05372a2c2 drm/bridge: tc358767: Make sure Refclk clock are enabled
>>>>      c038b9b73389 drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into dedicated function
>>>>      f312bc33caa0 pwm: lpc18xx-sct: Convert to devm_platform_ioremap_resource()
>>>>      6aaac1d9243b pwm: sifive: Shut down hardware only after pwmchip_remove() completed
>>>>      9073dbec8879 pwm: sifive: Ensure the clk is enabled exactly once per running PWM
>>>>      47902de24a46 pwm: sifive: Simplify offset calculation for PWMCMP registers
>>>>      6d7f7ffbcdb9 pwm: sifive: Don't check the return code of pwmchip_remove()
>>>>      b7e2d64d673a dm: return early from dm_pr_call() if DM device is suspended
>>>>      b3f5cc0cc0de thermal/tools/tmon: Include pthread and time headers in tmon.h
>>>>      7aa3a2559915 selftests/seccomp: Fix compile warning when CC=clang
>>>>      e06a31e61f96 nohz/full, sched/rt: Fix missed tick-reenabling bug in dequeue_task_rt()
>>>>      298417471e82 drivers/perf: arm_spe: Fix consistency of SYS_PMSCR_EL1.CX
>>>>      a1891d3df719 arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
>>>>      a7753a260e53 soc: qcom: Make QCOM_RPMPD depend on PM
>>>>      332e555dca07 regulator: of: Fix refcount leak bug in of_get_regulation_constraints()
>>>>      1ed71e6bcedb blktrace: Trace remapped requests correctly
>>>>      1cb303240642 block: remove the request_queue to argument request based tracepoints
>>>>      d125b13a6682 hwmon: (drivetemp) Add module alias
>>>>      ed6ae2381150 blk-mq: don't create hctx debugfs dir until q->debugfs_dir is created
>>>>      0ca556256fb4 erofs: avoid consecutive detection for Highmem memory
>>>>      8dee22b4576d arm64: tegra: Fix SDMMC1 CD on P2888
>>>>      a1e238690916 arm64: dts: mt7622: fix BPI-R64 WPS button
>>>>      7eafa9a1aa52 bus: hisi_lpc: fix missing platform_device_put() in hisi_lpc_acpi_probe()
>>>>      7fcf4401d539 ARM: dts: qcom: pm8841: add required thermal-sensor-cells
>>>>      97713ed9b6cc soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register
>>>>      07aea6819d56 soc: qcom: ocmem: Fix refcount leak in of_get_ocmem
>>>>      71042279b161 ACPI: APEI: Fix _EINJ vs EFI_MEMORY_SP
>>>>      5f29b045da22 regulator: qcom_smd: Fix pm8916_pldo range
>>>>      22e6d8bcde8e cpufreq: zynq: Fix refcount leak in zynq_get_revision
>>>>      d294d60dc685 ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init
>>>>      14bac0c7035b ARM: OMAP2+: Fix refcount leak in omapdss_init_of
>>>>      fdcb1fdbdc15 ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
>>>>      c32d5491c841 block: fix infinite loop for invalid zone append
>>>>      2d9a1a96eb0a soc: fsl: guts: machine variable might be unset
>>>>      4cea8391778a locking/lockdep: Fix lockdep_init_map_*() confusion
>>>>      87e415aec4e6 arm64: cpufeature: Allow different PMU versions in ID_DFR0_EL1
>>>>      30119131e3ac hexagon: select ARCH_WANT_LD_ORPHAN_WARN
>>>>      9d744229cdbe ARM: dts: ast2600-evb: fix board compatible
>>>>      75a24da2b9fe ARM: dts: ast2500-evb: fix board compatible
>>>>      2c07688d3e89 x86/pmem: Fix platform-device leak in error path
>>>>      6a28f363d390 arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
>>>>      80c469e63bfa soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
>>>>      6cd8ba0c0b06 soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
>>>>      6771609e1933 Input: atmel_mxt_ts - fix up inverted RESET handler
>>>>      11903c5457fd ARM: dts: imx7d-colibri-emmc: add cpu1 supply
>>>>      b8b1f0d74ff2 ACPI: processor/idle: Annotate more functions to live in cpuidle section
>>>>      91e7f04f53e6 ARM: bcm: Fix refcount leak in bcm_kona_smc_init
>>>>      f6a6cc6d577a arm64: dts: renesas: beacon: Fix regulator node names
>>>>      2691b8780f88 meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
>>>>      ccf56ea52b3e ARM: findbit: fix overflowing offset
>>>>      71fc6e0dcaca spi: spi-rspi: Fix PIO fallback on RZ platforms
>>>>      4234c5f34e71 powerpc/64s: Disable stack variable initialisation for prom_init
>>>>      adbfdaacde18 selinux: Add boundary check in put_entry()
>>>>      003a456ae6f7 PM: hibernate: defer device probing when resuming from hibernation
>>>>      70bccff899cf firmware: tegra: Fix error check return value of debugfs_create_file()
>>>>      c2e53a1b0746 ARM: shmobile: rcar-gen2: Increase refcount for new reference
>>>>      f48cec57367a arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
>>>>      fcdc1e13e0db arm64: dts: qcom: ipq8074: fix NAND node name
>>>>      931d0a574caf ACPI: LPSS: Fix missing check in register_device_clock()
>>>>      d257d9b0a44c ACPI: PM: save NVS memory for Lenovo G40-45
>>>>      85bc8689a702 ACPI: EC: Drop the EC_FLAGS_IGNORE_DSDT_GPE quirk
>>>>      def469523dfb ACPI: EC: Remove duplicate ThinkPad X1 Carbon 6th entry from DMI quirks
>>>>      88d556029a78 ARM: OMAP2+: display: Fix refcount leak bug
>>>>      43157bc5f9dc spi: synquacer: Add missing clk_disable_unprepare()
>>>>      607570808af2 ARM: dts: BCM5301X: Add DT for Meraki MR26
>>>>      9213e5a397ba ARM: dts: imx6ul: fix qspi node compatible
>>>>      976db15fee3a ARM: dts: imx6ul: fix lcdif node compatible
>>>>      6045ac40e323 ARM: dts: imx6ul: fix csi node compatible
>>>>      c7ce841f48df ARM: dts: imx6ul: fix keypad compatible
>>>>      15af2deb19e4 ARM: dts: imx6ul: change operating-points to uint32-matrix
>>>>      278aa4c73dad ARM: dts: imx6ul: add missing properties for sram
>>>>      695a3c2a8273 wait: Fix __wait_event_hrtimeout for RT/DL tasks
>>>>      2b8c55900d46 irqchip/mips-gic: Check the return value of ioremap() in gic_of_init()
>>>>      8dfb4a99b1c8 genirq: GENERIC_IRQ_IPI depends on SMP
>>>>      f460141f29f0 irqchip/mips-gic: Only register IPI domain when SMP is enabled
>>>>      4aba3247af12 genirq: Don't return error on missing optional irq_request_resources()
>>>>      d08bb199a406 ext2: Add more validity checks for inode counts
>>>>      353b4673d01c arm64: fix oops in concurrently setting insn_emulation sysctls
>>>>      913f1732377c arm64: Do not forget syscall when starting a new thread.
>>>>      fb086aea3910 x86: Handle idle=nomwait cmdline properly for x86_idle
>>>>      48c390021058 epoll: autoremove wakers even more aggressively
>>>>      80977126bc20 netfilter: nf_tables: fix null deref due to zeroed list head
>>>>      0cc5c6b7567d netfilter: nf_tables: do not allow RULE_ID to refer to another chain
>>>>      9e7dcb88ec8e netfilter: nf_tables: do not allow CHAIN_ID to refer to another table
>>>>      1a4b18b1ff11 netfilter: nf_tables: do not allow SET_ID to refer to another table
>>>>      19bf7199c3a9 lockdep: Allow tuning tracing capacity constants.
>>>>      f294829fb47e usb: dwc3: gadget: fix high speed multiplier setting
>>>>      fc2a039cdb3d usb: dwc3: gadget: refactor dwc3_repare_one_trb
>>>>      9a3a61bd730c arm64: dts: uniphier: Fix USB interrupts for PXs3 SoC
>>>>      63228d832832 ARM: dts: uniphier: Fix USB interrupts for PXs2 SoC
>>>>      4d7da7e565c3 USB: HCD: Fix URB giveback issue in tasklet function
>>>>      37c7fe9b3175 usb: typec: ucsi: Acknowledge the GET_ERROR_STATUS command completion
>>>>      847b9273dd61 coresight: Clear the connection field properly
>>>>      807adf6ffa8c MIPS: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
>>>>      26d767990e16 powerpc/powernv: Avoid crashing if rng is NULL
>>>>      3db593ab8e42 powerpc/ptdump: Fix display of RW pages on FSL_BOOK3E
>>>>      b326b8d6ae4c powerpc/fsl-pci: Fix Class Code of PCIe Root Port
>>>>      39c51471efd2 PCI: Add defines for normal and subtractive PCI bridges
>>>>      23c2f921f246 ia64, processor: fix -Wincompatible-pointer-types in ia64_get_irr()
>>>>      2f36ba13cb5b media: [PATCH] pci: atomisp_cmd: fix three missing checks on list iterator
>>>>      5fd4ffa2372a md-raid10: fix KASAN warning
>>>>      e0bdaed154e5 md-raid: destroy the bitmap after destroying the thread
>>>>      3bdda8656a1b serial: mvebu-uart: uart2 error bits clearing
>>>>      cfe17ae313aa fuse: limit nsec
>>>>      e63ea5814ba1 scsi: qla2xxx: Zero undefined mailbox IN registers
>>>>      6f18b5ad2d55 scsi: qla2xxx: Fix incorrect display of max frame size
>>>>      408bfa1489a3 scsi: sg: Allow waiting for commands to complete on removed device
>>>>      fb1888205c07 iio: light: isl29028: Fix the warning in isl29028_remove()
>>>>      fb7eea3946d3 mtd: rawnand: arasan: Update NAND bus clock instead of system clock
>>>>      15d0aeb01785 drm/amdgpu: Check BO's requested pinning domains against its preferred_domains
>>>>      55f558442742 drm/nouveau/acpi: Don't print error when we get -EINPROGRESS from pm_runtime
>>>>      92050011e09d drm/nouveau: Don't pm_runtime_put_sync(), only pm_runtime_put_autosuspend()
>>>>      ca0742a8ed54 drm/nouveau: fix another off-by-one in nvbios_addr
>>>>      de63dbc29681 drm/vc4: hdmi: Disable audio if dmas property is present but empty
>>>>      1ff71d4f532b drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error
>>>>      043f4642c168 parisc: io_pgetevents_time64() needs compat syscall in 32-bit compat mode
>>>>      fc3918d70bbe parisc: Check the return value of ioremap() in lba_driver_probe()
>>>>      b0dfba6d3bf2 parisc: Fix device names in /proc/iomem
>>>>      542d2e799d53 ovl: drop WARN_ON() dentry is NULL in ovl_encode_fh()
>>>>      135199a2edd4 usbnet: Fix linkwatch use-after-free on disconnect
>>>>      d65c3fcd6dfa fbcon: Fix accelerated fbdev scrolling while logo is still shown
>>>>      16badd998736 fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters
>>>>      826955eebc47 thermal: sysfs: Fix cooling_device_stats_setup() error code path
>>>>      60a8f0e62aeb fs: Add missing umask strip in vfs_tmpfile
>>>>      cf65b5bfac3d vfs: Check the truncate maximum size in inode_newsize_ok()
>>>>      5c6c65681f39 tty: vt: initialize unicode screen buffer
>>>>      f9b244e54111 ALSA: hda/realtek: Add a quirk for HP OMEN 15 (8786) mute LED
>>>>      7b9ee47c285f ALSA: hda/realtek: Add quirk for another Asus K42JZ model
>>>>      c366ccad5bce ALSA: hda/cirrus - support for iMac 12,1 model
>>>>      f2b72c51c2cf ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
>>>>      2613baa3ab21 mm/mremap: hold the rmap lock in write mode when moving page table entries.
>>>>      0a69f1f84207 xfs: fix I_DONTCACHE
>>>>      e32bb2428104 xfs: only set IOMAP_F_SHARED when providing a srcmap to a write
>>>>      f5f3e54f8116 mm: Add kvrealloc()
>>>>      3ff605513f31 riscv: set default pm_power_off to NULL
>>>>      230e369d4997 KVM: x86: Tag kvm_mmu_x86_module_init() with __init
>>>>      0dd8ba6670f4 KVM: x86: Set error code to segment selector on LLDT/LTR non-canonical #GP
>>>>      68ba319b8888 KVM: x86: Mark TSS busy during LTR emulation _after_ all fault checks
>>>>      b670a585498e KVM: nVMX: Let userspace set nVMX MSR to any _host_ supported value
>>>>      e9c55562b393 KVM: s390: pv: don't present the ecall interrupt twice
>>>>      8bb683490278 KVM: SVM: Don't BUG if userspace injects an interrupt with GIF=0
>>>>      860e3343958a KVM: nVMX: Snapshot pre-VM-Enter DEBUGCTL for !nested_run_pending case
>>>>      ab4805c2638c KVM: nVMX: Snapshot pre-VM-Enter BNDCFGS for !nested_run_pending case
>>>>      40593c589888 HID: wacom: Don't register pad_input for touch switch
>>>>      0ba645def77b HID: wacom: Only report rotation for art pen
>>>>      57f2ee517dec add barriers to buffer_uptodate and set_buffer_uptodate
>>>>      6dece5ad6e1e wifi: mac80211_hwsim: use 32-bit skb cookie
>>>>      d400222f4959 wifi: mac80211_hwsim: add back erroneously removed cast
>>>>      eb8fc4277b62 wifi: mac80211_hwsim: fix race condition in pending packet
>>>>      9a22b1f7daa6 ALSA: hda/realtek: Add quirk for HP Spectre x360 15-eb0xxx
>>>>      d909d9bdc882 ALSA: hda/realtek: Add quirk for Clevo NV45PZ
>>>>      348620464a5c ALSA: bcd2000: Fix a UAF bug on the error path of probing
>>>>      101e0c052d4f scsi: Revert "scsi: qla2xxx: Fix disk failure to rediscover"
>>>>      14eb40fd79c4 Revert "pNFS: nfs3_set_ds_client should set NFS_CS_NOPING"
>>>>      4ad6a94c68a1 x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments
>>>>      8f4f2c9b98e4 Makefile: link with -z noexecstack --no-warn-rwx-segments
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>> ---
>>>>   .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
>>>>   .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
>>>>   meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
>>>>   3 files changed, 19 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
>>>> index fe566f4a98..bd9b1ab33a 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
>>>> @@ -11,13 +11,13 @@ python () {
>>>>           raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>>>   }
>>>>
>>>> -SRCREV_machine ?= "53c4c47a43a3309e6aac7c67642877e2fb5f0aa5"
>>>> -SRCREV_meta ?= "443f1c2f821e55dd96d115bb09e89f8f106b63d4"
>>>> +SRCREV_machine ?= "f32be1e4f2fc4ce856e2474ba9594830d61635c6"
>>>> +SRCREV_meta ?= "e462ebf62581138ef03de1783e93c49c2f0b1051"
>>>>
>>>>   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>>>>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
>>>>
>>>> -LINUX_VERSION ?= "5.10.136"
>>>> +LINUX_VERSION ?= "5.10.137"
>>>>
>>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
>>>> index 6527b79127..102d8d26d2 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
>>>> @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
>>>>
>>>>   require recipes-kernel/linux/linux-yocto.inc
>>>>
>>>> -LINUX_VERSION ?= "5.10.136"
>>>> +LINUX_VERSION ?= "5.10.137"
>>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>>>
>>>>   DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>>>> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>>>>   KMETA = "kernel-meta"
>>>>   KCONF_BSP_AUDIT_LEVEL = "2"
>>>>
>>>> -SRCREV_machine:qemuarm ?= "9809577b21100a3aefced164ee35a396a39328d2"
>>>> -SRCREV_machine ?= "c6edaa10a3b8eb4543a60a638d9b70d4389d3297"
>>>> -SRCREV_meta ?= "443f1c2f821e55dd96d115bb09e89f8f106b63d4"
>>>> +SRCREV_machine:qemuarm ?= "44dc7fc9b0ab8f14f4ebe4dea9aaec050c80fa57"
>>>> +SRCREV_machine ?= "fa23e23c26057013e592f767f3e515d6abb58b87"
>>>> +SRCREV_meta ?= "e462ebf62581138ef03de1783e93c49c2f0b1051"
>>>>
>>>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
>>>> index e190fe1d20..2423ff8b1b 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
>>>> @@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
>>>>   KBRANCH:qemux86-64 ?= "v5.10/standard/base"
>>>>   KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
>>>>
>>>> -SRCREV_machine:qemuarm ?= "43b91747cacc1e5fcdf5b947fd5b4590fae8a049"
>>>> -SRCREV_machine:qemuarm64 ?= "6165ca236a23c05d3da4b738bad89dd535aa78f3"
>>>> -SRCREV_machine:qemumips ?= "31e654239d87d1e23860c4d3ccb4ec1cafcd1da1"
>>>> -SRCREV_machine:qemuppc ?= "c937840dded651d4a6c52c3224d9143881357f24"
>>>> -SRCREV_machine:qemuriscv64 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
>>>> -SRCREV_machine:qemuriscv32 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
>>>> -SRCREV_machine:qemux86 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
>>>> -SRCREV_machine:qemux86-64 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
>>>> -SRCREV_machine:qemumips64 ?= "d66b79176c796d94b313bff2b7dc77f0db335490"
>>>> -SRCREV_machine ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
>>>> -SRCREV_meta ?= "443f1c2f821e55dd96d115bb09e89f8f106b63d4"
>>>> +SRCREV_machine:qemuarm ?= "5666799db3b45abc8e17389d03abf495acf3cf32"
>>>> +SRCREV_machine:qemuarm64 ?= "170f32d0f616bead995cfa8aadb925e6996ab96b"
>>>> +SRCREV_machine:qemumips ?= "598bb1c14a82d24332f5c594faf5b7ca4090f3f3"
>>>> +SRCREV_machine:qemuppc ?= "c9942a6b847adae4e4249b4f7d6340c4fbef793b"
>>>> +SRCREV_machine:qemuriscv64 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
>>>> +SRCREV_machine:qemuriscv32 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
>>>> +SRCREV_machine:qemux86 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
>>>> +SRCREV_machine:qemux86-64 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
>>>> +SRCREV_machine:qemumips64 ?= "81761f090ebe75106ecd0d16fe44b59d395a2acc"
>>>> +SRCREV_machine ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
>>>> +SRCREV_meta ?= "e462ebf62581138ef03de1783e93c49c2f0b1051"
>>>>
>>>>   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
>>>>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
>>>>
>>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>>> -LINUX_VERSION ?= "5.10.136"
>>>> +LINUX_VERSION ?= "5.10.137"
>>>>
>>>>   DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>>>>   DEPENDS += "openssl-native util-linux-native"
>>>> --
>>>> 2.19.1
>>>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170045): https://lists.openembedded.org/g/openembedded-core/message/170045
> Mute This Topic: https://lists.openembedded.org/mt/93318710/4454486
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [li.wang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

