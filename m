Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFB5C61DA3
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 01:27:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1871.1677029253815167074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 17:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=TVf6czgA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=141720c701=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M1DVTw002015
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 17:27:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=4PAML4sIA3Mr6HbPtle90cjsUSP6UMwAOtAVOEtaDxE=;
 b=TVf6czgAA+H2KefnencYaAGey5CZLg8Ig+PxaV0vYJATPulsxfR2lSvxsVGTD4pcSQd4
 iFHAKD+IfQtW1HAp0G2ukFXSKhtCkM/VUNXTJF1f1KKzXmzUuTGkk+U++k4JuYmeCxP9
 nKZPaSsw3DRRrsKjN1W5Pn9jqFEDGndTlNReg2epS1AtkDLPOnw4p9dpoucg5NTtz/EY
 Krd46KU+Ls7PfO0NofR5z6K9XEks7CS3pSwQpzoyayPEWF5d1yToJZdD6HCJ03GpsmlE
 UNv5QYBmgI8C8l/RQi7V06mI9VIyr6WO1oHIYDsWW1Vp/DHen3XcJcWPbN2wC3mmHfL1 bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6u6wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 17:27:33 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M1R0pe026829
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 17:27:32 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6u6ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 17:27:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1cUYomRwZ0NgUD69xOTuFw0VvXLCycpQUdZODIltZbtVm/751fr7iZXqRSV4nEWQ86KRk4FYIQ6dw5z3P8x2LzqziM5yuuKtsUMSitxvKgJBNryuSaOgM37ireEpeEMckJlHCcEMli92UQGqZL5/shPGX8YGUmJlfv6dg0ITeB9w5DcoxewcE9akWGtrFqWs3ys/0/9wAEVCaePEoif3Ul8Z/Dz+kDBDYVrePlFu2+ng7O0OmoUViGr0s8ir+CiDGNmt9xMM+52TdrWjLznGYZLM8kpzbv+npfpXdXu281Cew3Mr1+/jXGvdDU9VJfVAqai3CUYRvqR5N/7cECbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PAML4sIA3Mr6HbPtle90cjsUSP6UMwAOtAVOEtaDxE=;
 b=EYR+zAyZ4XCkkvze5vy55xyNnIYCGii/RHGjh/NHSVEeWt3y0wuZZPifA0jYCJrAB/IoogGmdQR8NC8Xatgy5yqbYeQmvCFeYhirzXKFDHdNmGwA2yr8MqXxHIeVszLc9q1uJX9SGL4XJmYWPt3BUvoaXsGm1MwAL3pA81E9Rz8pg5JwAn6rLYX9Obuv8pA1qa9qNtJYQcHvVq/NRYK14gJ7jUP5QOqRy4D+5wI4jDhz3DXRoraPwN48oq+1OWLvNOpi8jaDZ9z89imkPVAGzn8nWEXwkbdbkxO4a0lrW/F+ey9Av3/v//UtdlWIcoxX88tWT4UfHg8fwxyCl1PfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 01:27:28 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 01:27:28 +0000
Content-Type: multipart/alternative;
 boundary="------------cRbmD7EaZGW71Xh9mBjMneLr"
Message-ID: <28cffc0d-da67-e259-a55e-b6165a5498e0@windriver.com>
Date: Tue, 21 Feb 2023 20:27:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] gdb: Upgrade to 12.1
Content-Language: en-CA
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20220512192854.1538701-1-raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Shinde, Yash" <yash.shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220512192854.1538701-1-raj.khem@gmail.com>
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CO1PR11MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: 444389ca-7215-4bfd-9ee4-08db1473f57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pNcxhz1ItBwLjrg/Prq5Ukk8rkb3ybVlW5T98LQk1YO+9aS/P2cV/HfI8B8pi/oEed5VEDZGApEXXNJNNaFA2CY33PIgWGyZ1NovuMqG9iqEHu+yDzIrhL5UW3HLBilO96dIsn24A2RCcM/stSwPZQvi0eTjnzK//CVP+oWmGXiPKkcnRCIQ+1i4GdOXRJRmgAk1i9rojCsd5+HybutIV4xNWNtiSjSQBN28gCyftJRTwbErO9WVNGnyUudBJb0G0My08yAOmvmjr9bpeXcCUC/gE1BoKCrx14QENB9IOxoA+46tunY0kSc6UgD95sebuuk9UdEbKoA/Nus0QmbML8vEjPe8Vc8gFiSMLtBLlHak4piaAIzdboYHWwpefYHLGe31j0PQA//9kBIXgH/BmD1vLjWegNqWR5d0tJDjTUB+D9npDR1SaMm1MWaGC05rTgl9prHmKeaTW568ttGGnYoCW22h7Oez6jAJAgknvcsL+DUq6xgeDBrxiOJHNSvvqlYa21O1BSz1TsMJrAV7Z9IZr659WFGV0vHlSiZ2EiEQ0aek3q6ukzBArjuL3ciBEbD9qLshdHg/NI5HFTkEJ8Z43sSCJvndyGsHbR6KqjLEKEYCwvF+m4lmTtmh7rPnzlFLb60ZK6W7dBVNU4WuEb+kSzOQK5l1B001w+g8Ex0lB9aXpWJv8gPyUg1+dwOdiGXufL0CfLlWIVuLNHgb+/rTOoSDi0KtEY8BSLhdyWX4mTCkmvqmqdgtVl6YLskWYgH4xc+En/Cr3YuvxyWCtw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(451199018)(21615005)(31696002)(41300700001)(30864003)(8936002)(5660300002)(53546011)(6666004)(186003)(6512007)(2906002)(6506007)(26005)(33964004)(38100700002)(54906003)(478600001)(31686004)(6486002)(966005)(316002)(66946007)(4326008)(107886003)(66476007)(8676002)(66556008)(19627235002)(66899018)(36756003)(83380400001)(2616005)(86362001)(166002)(43740500002)(45980500001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVJIaGZBbFR5bU83L1FSalBHbkFnL2s1RFV6SFVRVDZuaFhQQ1pNU3VEMnor?=
 =?utf-8?B?c1VKRmtSQWU2QWVDeFNvT09ZUVhCU1dBTnFwZGdZdk94WExXeHMwS01yVVU0?=
 =?utf-8?B?d2pXWW41dXpkYVRrU0tpOFJCQWVCUnVMRjBONzh1WEQ2OXM2ZXhkaFA3WlNj?=
 =?utf-8?B?L0RYMi9VYzRtcXJHQ1BHdC9uN2ZSSVJGYzJHemRMSC9oendLcVdpT0ZDeC95?=
 =?utf-8?B?STg3OWhRUkpPd1BlSHdEYXF3ek1EWEE4UitoNEtrdklYZ1M4aFlDMG0yQVh2?=
 =?utf-8?B?dlFXTjVQczFWTHkvVU5KK3hqWjJkM2RjM3Z5Z1BQZ2JaNCs5VTRmV3NKRHhN?=
 =?utf-8?B?dU94UVRhMHZCd3VYL3RLeTB0SElNOE9naUVkb3N5WjBBVGMwTFR4WERha1Z0?=
 =?utf-8?B?aFR5NE5Gc0NYbklQQmxRcFl1WHhQV0MxZE16RWI1amltSWJ1dlhrMllydlRa?=
 =?utf-8?B?UFZTL2hkTXV2cDduZnkwZno0MGZVSjcwT1ZlT21ERFFhc2l4c2VIN0NnbzhL?=
 =?utf-8?B?ZzFYdXhncG5KSGNELzZvbTVRQnJGcHlZUlovMWJWQW9KVm9EMldpalI2LzZj?=
 =?utf-8?B?TmV2YUc1QnUrZm43bmxhbXU0Mmd1WW1xdzg4V0dHZVV1RnlZSkp2YjRqYkF4?=
 =?utf-8?B?T0lRbzZQZFlkTWNQakpwS2FRZHM2dkp1MmlXS0ZVQThBUEdUV0diUzY4MUlu?=
 =?utf-8?B?SjBYWWpFOHdZZlFPL0o1NytjSi9KWkxNM1VsSVNSRDdvdjdISFdNaU1ZVm44?=
 =?utf-8?B?SUJnOTFack80R284SWQ0K2s1T1N0b3d0T2hsTXVBTHBaeDJzUFNvdHZmSmQw?=
 =?utf-8?B?UFlyNFdhVWMzQjZidUo5akhJKzB4VFUxNGdkL1R3ZnhtUUVrZW9BcGdYaXU0?=
 =?utf-8?B?cFRHV2ZSWHlyNHYzZTBmNTBpNkRnemw3NG9KWmRhR1ZEeUEycnYxYVBnaEFy?=
 =?utf-8?B?TWZua213dE9HdU9lSlBjbFlGOFNWQVhQVDk1M2UrZGlSSllnQWoyUzRROU9h?=
 =?utf-8?B?ekxsZVAvZE5wZGJBdUxhekQ1N3JlaUMvc0l5TGFKRE5TaHBLcjFhckd5MkNp?=
 =?utf-8?B?ZnR0RWlZNDhTaWpxanEwNVlxdjdUbFdDWmV3RTN5dWVHR0NuKzEwTmVsYWFn?=
 =?utf-8?B?bmorakttNndLbnVKdGcyby8yb3FCSWlueldHcDNnREloTHZmU2lYWWZYYzMw?=
 =?utf-8?B?UWFCNTZqVitsYUtnWWZyd3gxQVRNRlpzWWlhaUJZODZrUm45ZEp5NzNFcGc1?=
 =?utf-8?B?aDFhbGRNaDFDV3Mzd2dBZGE2blpZZTl0dnRZWjNoTEp0NmV4UldpMFQ5c2FH?=
 =?utf-8?B?cDBYYm1DUVA4TzVUN0tQYlRybWhYajFIRkdKc29MUURVbzlPamxGTUFOeVBa?=
 =?utf-8?B?cWdqYTBsM2VValJwdnFMWEJEWmVzYURQV3hhZytJQ2lsM0huWW10N0hsZzNy?=
 =?utf-8?B?Z3c5ZEJMTEh1WHBQd3VQREFtQVQ5Qmt1Q3FzYlh5N3paR0FueUdGMGRKdlBT?=
 =?utf-8?B?YlR2d2VWVkNmS3FhUnp5Z0JoVGZGaTJmbHIwbFgrVkJJWmR4OFJjL2oycU9O?=
 =?utf-8?B?d3ZwVHhOT1VRWEttQVhrbXVEMU53UGg2aVN3TjBNNVRWMzVKOHpGMERZVlNt?=
 =?utf-8?B?MS9xcjhtZFZzK2dlWEI1cW5UVktzSGJqTk8rRkxoMTRaaEJ2YVNhcmdMWWhl?=
 =?utf-8?B?WXJ4NGpsMmFPZ2VHQVBpRTlheG5yVExpVm85dzdyOEFrRFJqVXVBRFcwUjds?=
 =?utf-8?B?V1dqU0N4ejRzWWR1eS8vVDNUTFh2eHJkcWFIV3l5NjJHVyt0RjRocEdneits?=
 =?utf-8?B?Q3hjeFNlVm9zRjVpZ0NucFpZMk1zbXFscjc0VVNTNWNBenlYeDA0SFEwL3JG?=
 =?utf-8?B?R3pSajk2UHA2Sit3bjh1NHRhY3F6M0lGa2hQRTdZdWFsaEF4THlDTE9SdEla?=
 =?utf-8?B?eTlxNXlHRlBiTlpjYXg3ajY5TWJzTTRyR3I2czJ4dmNXanIyYTk5SndWS0p5?=
 =?utf-8?B?aWlES3RXUFFtUnpGeC94c3ZvTVVmNmYxd24ydjZLWm1hNTlWSHNqdDBBY1pH?=
 =?utf-8?B?d1R3RzczOHYvZm5qNWVMUzkxc1EvOTIrR3BJODdIRUp1YjN4Q3dTdnZlMnFZ?=
 =?utf-8?B?dWNhRmM3RWRJVVJoNkZRc3krejQ0WVc5OGFTbFp2THl4WmZIbWZ1YmJPTnNu?=
 =?utf-8?Q?hXo0x7A33AWbDwOJ8FpOSGs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444389ca-7215-4bfd-9ee4-08db1473f57e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 01:27:27.9005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4DcldVDFwwUFcdzMGK/fPA6wk7Lsi/O+AXGxKGMcmatdf42fJQHuTrN6MWyd2eDQI9eMXSbYfQIKv7Qnw8o8WtNe/4hzqBaNufM2SzzMpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
X-Proofpoint-ORIG-GUID: hKXLb_nnakglmHHJCYmLKhiN8E4t-0oD
X-Proofpoint-GUID: yjDZlzaMwAKdkVEyCfBjJ157iDGBaMkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_14,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302220008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 01:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177552

--------------cRbmD7EaZGW71Xh9mBjMneLr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31M1DVTw002015

On 2022-05-12 15:28, Khem Raj wrote:
> Release Announcement [1] and Notes [2]
>
> [1]https://lists.gnu.org/archive/html/info-gnu/2022-05/msg00000.html
> [2]https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_=
plain;f=3Dgdb/NEWS;hb=3Dgdb-12.1-release

I just noticed that gdb-13.1 was released 2 days ago (Feb 19, 2023) .

It seems like a good candidate to be included in the 4.2 release.

$ git diff gdb-12-branch=C2=A0 gdb-13-branch gdb | diffstat | tail -1
 =C2=A06222 files changed, 142614 insertions(+), 63875 deletions(-)

and=C2=A0 notes linked below.

Khem,

Are you working on that or should someone else start on it?

../Randy


https://www.sourceware.org/gdb/download/ANNOUNCEMENT

https://www.sourceware.org/gdb/

>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc        |  2 +-
>   ...canadian_11.2.bb =3D> gdb-cross-canadian_12.1.bb} |  0
>   .../gdb/{gdb-cross_11.2.bb =3D> gdb-cross_12.1.bb}   |  0
>   meta/recipes-devtools/gdb/gdb.inc                  | 14 +++++++------=
-
>   ...0001-make-man-install-relative-to-DESTDIR.patch | 10 +++++-----
>   ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |  8 ++++----
>   ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 11 +++++------
>   ...-libreadline.a-when-using-disable-static.patch} | 14 +++++++------=
-
>   ...gidefs.h.patch =3D> 0005-use-asm-sgidefs.h.patch} |  8 ++++----
>   ...AGS.patch =3D> 0006-Change-order-of-CFLAGS.patch} | 10 +++++-----
>   ...> 0007-resolve-restrict-keyword-conflict.patch} |  6 +++---
>   ...tch =3D> 0008-Fix-invalid-sigprocmask-call.patch} |  8 ++++----
>   ....patch =3D> 0009-gdbserver-ctrl-c-handling.patch} | 10 +++++-----
>   .../gdb/{gdb_11.2.bb =3D> gdb_12.1.bb}               |  0
>   14 files changed, 50 insertions(+), 51 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_11.2.bb =3D> gdb=
-cross-canadian_12.1.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_11.2.bb =3D> gdb-cross_12=
.1.bb} (100%)
>   rename meta/recipes-devtools/gdb/gdb/{0005-Dont-disable-libreadline.a=
-when-using-disable-static.patch =3D> 0004-Dont-disable-libreadline.a-whe=
n-using-disable-static.patch} (80%)
>   rename meta/recipes-devtools/gdb/gdb/{0006-use-asm-sgidefs.h.patch =3D=
> 0005-use-asm-sgidefs.h.patch} (84%)
>   rename meta/recipes-devtools/gdb/gdb/{0007-Change-order-of-CFLAGS.pat=
ch =3D> 0006-Change-order-of-CFLAGS.patch} (80%)
>   rename meta/recipes-devtools/gdb/gdb/{0008-resolve-restrict-keyword-c=
onflict.patch =3D> 0007-resolve-restrict-keyword-conflict.patch} (93%)
>   rename meta/recipes-devtools/gdb/gdb/{0009-Fix-invalid-sigprocmask-ca=
ll.patch =3D> 0008-Fix-invalid-sigprocmask-call.patch} (90%)
>   rename meta/recipes-devtools/gdb/gdb/{0010-gdbserver-ctrl-c-handling.=
patch =3D> 0009-gdbserver-ctrl-c-handling.patch} (82%)
>   rename meta/recipes-devtools/gdb/{gdb_11.2.bb =3D> gdb_12.1.bb} (100%=
)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/di=
stro/include/tcmode-default.inc
> index 9660f2804a7..1179ba172ff 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>   GCCVERSION ?=3D "12.%"
>   SDKGCCVERSION ?=3D "${GCCVERSION}"
>   BINUVERSION ?=3D "2.38%"
> -GDBVERSION ?=3D "11.%"
> +GDBVERSION ?=3D "12.%"
>   GLIBCVERSION ?=3D "2.35"
>   LINUXLIBCVERSION ?=3D "5.16%"
>   QEMUVERSION ?=3D "7.0%"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb b/met=
a/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_11.2.bb b/meta/recipes=
-devtools/gdb/gdb-cross_12.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_11.2.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_12.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/=
gdb/gdb.inc
> index 649ee287276..3b569fd40e7 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -8,11 +8,11 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>              file://0001-make-man-install-relative-to-DESTDIR.patch  \
>              file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.p=
atch  \
>              file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIB=
C-syst.patch  \
> -file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch=
  \
> -file://0006-use-asm-sgidefs.h.patch  \
> -file://0007-Change-order-of-CFLAGS.patch  \
> -file://0008-resolve-restrict-keyword-conflict.patch  \
> -file://0009-Fix-invalid-sigprocmask-call.patch  \
> -file://0010-gdbserver-ctrl-c-handling.patch  \
> +file://0004-Dont-disable-libreadline.a-when-using-disable-static.patch=
  \
> +file://0005-use-asm-sgidefs.h.patch  \
> +file://0006-Change-order-of-CFLAGS.patch  \
> +file://0007-resolve-restrict-keyword-conflict.patch  \
> +file://0008-Fix-invalid-sigprocmask-call.patch  \
> +file://0009-gdbserver-ctrl-c-handling.patch  \
>              "
> -SRC_URI[sha256sum] =3D "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19=
d8463c3cc787152e32"
> +SRC_URI[sha256sum] =3D "0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c=
4f7fc017b818d69fed"
> diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relati=
ve-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install=
-relative-to-DESTDIR.patch
> index 824b96f6afe..16d6cf196fd 100644
> --- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-D=
ESTDIR.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-D=
ESTDIR.patch
> @@ -1,7 +1,7 @@
> -From a6d3df9d84463ec500d9d01558ab8a17e824e9e5 Mon Sep 17 00:00:00 2001
> +From 8eca28eddcda4ce8a345ca031f43ff1ed6f37089 Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Mon, 2 Mar 2015 02:27:55 +0000
> -Subject: [PATCH 01/10] make man install relative to DESTDIR
> +Subject: [PATCH 1/9] make man install relative to DESTDIR
>  =20
>   Upstream-Status: Pending
>  =20
> @@ -11,10 +11,10 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/sim/common/Make-common.in b/sim/common/Make-common.in
> -index 8c2cacea1e5..4a52eef2203 100644
> +index 74e5dad3049..9e95c224ba4 100644
>   --- a/sim/common/Make-common.in
>   +++ b/sim/common/Make-common.in
> -@@ -63,7 +63,7 @@ tooldir =3D $(libdir)/$(target_alias)
> +@@ -70,7 +70,7 @@ tooldir =3D $(libdir)/$(target_alias)
>    datadir =3D @datadir@
>    datarootdir =3D @datarootdir@
>    mandir =3D @mandir@
> @@ -24,5 +24,5 @@ index 8c2cacea1e5..4a52eef2203 100644
>    includedir =3D @includedir@
>   =20
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_=
ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-lin=
ux-nat-Define-_ABIO32-if-not-defined.patch
> index 591c9bfa3f9..8d263de8963 100644
> --- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-=
if-not-defined.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-=
if-not-defined.patch
> @@ -1,7 +1,7 @@
> -From 7f1f25eaaace289bc33c5aaa1c5fe9e04e719651 Mon Sep 17 00:00:00 2001
> +From 37d3afd2eaa95c89ad7cb5d0079b017752e4d0ea Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Wed, 23 Mar 2016 06:30:09 +0000
> -Subject: [PATCH 02/10] mips-linux-nat: Define _ABIO32 if not defined
> +Subject: [PATCH 2/9] mips-linux-nat: Define _ABIO32 if not defined
>  =20
>   This helps building gdb on mips64 on musl, since
>   musl does not provide sgidefs.h this define is
> @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 4 insertions(+)
>  =20
>   diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> -index b21c7cb2ea6..6614b4de31e 100644
> +index 20e12b6889e..6adc61235aa 100644
>   --- a/gdb/mips-linux-nat.c
>   +++ b/gdb/mips-linux-nat.c
>   @@ -41,6 +41,10 @@
> @@ -31,5 +31,5 @@ index b21c7cb2ea6..6614b4de31e 100644
>    class mips_linux_nat_target final : public linux_nat_trad_target
>    {
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_re=
gs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-=
ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> index 09ea533b00d..7e09404bb05 100644
> --- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi=
_pt_regs-on-GLIBC-syst.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi=
_pt_regs-on-GLIBC-syst.patch
> @@ -1,8 +1,7 @@
> -From 0cb233ec3951582fa1a051a16bfd644ef4969df5 Mon Sep 17 00:00:00 2001
> +From e689eec672ee8c53b3adb2ade2b5deb9b7cd99d4 Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Sat, 30 Apr 2016 18:32:14 -0700
> -Subject: [PATCH 03/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLI=
BC
> - systems
> +Subject: [PATCH 3/9] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC=
 systems
>  =20
>   Upstream-Status: Pending
>  =20
> @@ -13,7 +12,7 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    2 files changed, 12 insertions(+)
>  =20
>   diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
> -index e712a9a5713..76bbcca0928 100644
> +index 1094f6b0be3..d8588a646c2 100644
>   --- a/gdb/nat/ppc-linux.h
>   +++ b/gdb/nat/ppc-linux.h
>   @@ -18,7 +18,13 @@
> @@ -31,7 +30,7 @@ index e712a9a5713..76bbcca0928 100644
>   =20
>    /* This sometimes isn't defined.  */
>   diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
> -index db9a88219ea..151e4183bb1 100644
> +index 08824887003..69afbae5359 100644
>   --- a/gdbserver/linux-ppc-low.cc
>   +++ b/gdbserver/linux-ppc-low.cc
>   @@ -23,7 +23,13 @@
> @@ -49,5 +48,5 @@ index db9a88219ea..151e4183bb1 100644
>    #include "arch/ppc-linux-common.h"
>    #include "arch/ppc-linux-tdesc.h"
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadlin=
e.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0004-=
Dont-disable-libreadline.a-when-using-disable-static.patch
> similarity index 80%
> rename from meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline=
.a-when-using-disable-static.patch
> rename to meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a=
-when-using-disable-static.patch
> index 02ea30f9bf8..a1e85e91b33 100644
> --- a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-whe=
n-using-disable-static.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-whe=
n-using-disable-static.patch
> @@ -1,7 +1,7 @@
> -From e2efd044c479895767f1b929f5a54fa0c689f318 Mon Sep 17 00:00:00 2001
> +From 15ee6a626242efb8f367be49c13e00d0b72317f0 Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Sat, 30 Apr 2016 15:25:03 -0700
> -Subject: [PATCH 05/10] Dont disable libreadline.a when using --disable=
-static
> +Subject: [PATCH 4/9] Dont disable libreadline.a when using --disable-s=
tatic
>  =20
>   If gdb is configured with --disable-static then this is dutifully pas=
sed to
>   readline which then disables libreadline.a, which causes a problem wh=
en gdb
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    2 files changed, 3 insertions(+), 2 deletions(-)
>  =20
>   diff --git a/Makefile.def b/Makefile.def
> -index 5a460f1dbbc..77a702ac6d6 100644
> +index acdcd625ed6..78fc31e1199 100644
>   --- a/Makefile.def
>   +++ b/Makefile.def
> -@@ -105,7 +105,8 @@ host_modules=3D { module=3D libiconv;
> +@@ -120,7 +120,8 @@ host_modules=3D { module=3D libiconv;
>    		missing=3D install-html;
>    		missing=3D install-info; };
>    host_modules=3D { module=3D m4; };
> @@ -33,10 +33,10 @@ index 5a460f1dbbc..77a702ac6d6 100644
>    host_modules=3D { module=3D sim; };
>    host_modules=3D { module=3D texinfo; no_install=3D true; };
>   diff --git a/Makefile.in b/Makefile.in
> -index 9b3a5d75735..98cbe844fca 100644
> +index 3aacd2daac9..aa58adada4a 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
> -@@ -25607,7 +25607,7 @@ configure-readline:
> +@@ -32791,7 +32791,7 @@ configure-readline:
>    	  $$s/$$module_srcdir/configure \
>    	  --srcdir=3D$${topdir}/$$module_srcdir \
>    	  $(HOST_CONFIGARGS) --build=3D${build_alias} --host=3D${host_alias=
} \
> @@ -46,5 +46,5 @@ index 9b3a5d75735..98cbe844fca 100644
>    @endif readline
>   =20
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch=
 b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> similarity index 84%
> rename from meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
> rename to meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> index ef271c45e29..242099b9b1e 100644
> --- a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> @@ -1,7 +1,7 @@
> -From 5077518c11e8d75e9bf65cdf9ca21c59564e1037 Mon Sep 17 00:00:00 2001
> +From 25a75aaf29791f4302f0e4452f7ebaf735d4f083 Mon Sep 17 00:00:00 2001
>   From: Andre McCurdy<amccurdy@gmail.com>
>   Date: Sat, 30 Apr 2016 15:29:06 -0700
> -Subject: [PATCH 06/10] use <asm/sgidefs.h>
> +Subject: [PATCH 5/9] use <asm/sgidefs.h>
>  =20
>   Build fix for MIPS with musl libc
>  =20
> @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> -index 6614b4de31e..237eb6eb975 100644
> +index 6adc61235aa..afb40066744 100644
>   --- a/gdb/mips-linux-nat.c
>   +++ b/gdb/mips-linux-nat.c
>   @@ -31,7 +31,7 @@
> @@ -32,5 +32,5 @@ index 6614b4de31e..237eb6eb975 100644
>    #include <asm/ptrace.h>
>    #include "inf-ptrace.h"
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.=
patch b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
> similarity index 80%
> rename from meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.p=
atch
> rename to meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.pat=
ch
> index 40d12579c0e..58c9b1d0a78 100644
> --- a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
> @@ -1,7 +1,7 @@
> -From 80080e6c8425ac51498f49c2063b960a08f9a27d Mon Sep 17 00:00:00 2001
> +From c0e7c34134aa1f9644075c596a2338a50d3d923e Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Sat, 30 Apr 2016 15:35:39 -0700
> -Subject: [PATCH 07/10] Change order of CFLAGS
> +Subject: [PATCH 6/9] Change order of CFLAGS
>  =20
>   Lets us override Werror if need be
>  =20
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
> -index 12e9b2777ae..ad44fbc3309 100644
> +index 47648b8d962..5599779de57 100644
>   --- a/gdbserver/Makefile.in
>   +++ b/gdbserver/Makefile.in
> -@@ -172,7 +172,7 @@ WIN32APILIBS =3D @WIN32APILIBS@
> +@@ -156,7 +156,7 @@ WIN32APILIBS =3D @WIN32APILIBS@
>    INTERNAL_CFLAGS_BASE =3D ${GLOBAL_CFLAGS} \
>    	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
>    INTERNAL_WARN_CFLAGS =3D ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
> @@ -26,5 +26,5 @@ index 12e9b2777ae..ad44fbc3309 100644
>    # LDFLAGS is specifically reserved for setting from the command line
>    # when running make.
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keywor=
d-conflict.patch b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-ke=
yword-conflict.patch
> similarity index 93%
> rename from meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword=
-conflict.patch
> rename to meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-c=
onflict.patch
> index 9095f905828..bbd1f0b27f1 100644
> --- a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-confl=
ict.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-confl=
ict.patch
> @@ -1,7 +1,7 @@
> -From 4ee7e8afb9ff259e889ac938c673fda9ddc5e15a Mon Sep 17 00:00:00 2001
> +From 44fa1ecfbd8a5fe0cfea12a175fa041686842a0c Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Tue, 10 May 2016 08:47:05 -0700
> -Subject: [PATCH 08/10] resolve restrict keyword conflict
> +Subject: [PATCH 7/9] resolve restrict keyword conflict
>  =20
>   GCC detects that we call 'restrict' as param name in function
>   signatures and complains since both params are called 'restrict'
> @@ -44,5 +44,5 @@ index 90a67d18426..664641a1fe8 100644
>    _GL_CXXALIASWARN (gettimeofday);
>    # if defined __cplusplus && defined GNULIB_NAMESPACE
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask=
-call.patch b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-=
call.patch
> similarity index 90%
> rename from meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-=
call.patch
> rename to meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-ca=
ll.patch
> index 5b9d1cfaf93..ed1310ced28 100644
> --- a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.p=
atch
> +++ b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.p=
atch
> @@ -1,7 +1,7 @@
> -From 5740876d92ddb67b039d5fbcd1b71e6c58823c08 Mon Sep 17 00:00:00 2001
> +From 5bdd15553daef7370ca3c1f12d8f14247fdd4907 Mon Sep 17 00:00:00 2001
>   From: Yousong Zhou<yszhou4tech@gmail.com>
>   Date: Fri, 24 Mar 2017 10:36:03 +0800
> -Subject: [PATCH 09/10] Fix invalid sigprocmask call
> +Subject: [PATCH 8/9] Fix invalid sigprocmask call
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=3DUTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -32,7 +32,7 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/si=
gnals-state-save-restore.cc
> -index 95c156e5036..f4aa512d105 100644
> +index 92e799d3551..a4a0234272a 100644
>   --- a/gdbsupport/signals-state-save-restore.cc
>   +++ b/gdbsupport/signals-state-save-restore.cc
>   @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
> @@ -45,5 +45,5 @@ index 95c156e5036..f4aa512d105 100644
>        perror_with_name (("sigprocmask"));
>   =20
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handli=
ng.patch b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.p=
atch
> similarity index 82%
> rename from meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handlin=
g.patch
> rename to meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.=
patch
> index cb4744e5dda..f53d3bd1e54 100644
> --- a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patc=
h
> +++ b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patc=
h
> @@ -1,7 +1,7 @@
> -From d611a68f05c0c86af27bf6beae189a90a946e2e3 Mon Sep 17 00:00:00 2001
> +From bc3b1f6aacf2d8fe66b022fbfcf28cd82c76e52f Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
>   Date: Thu, 29 Nov 2018 18:00:23 -0800
> -Subject: [PATCH 10/10] gdbserver ctrl-c handling
> +Subject: [PATCH 9/9] gdbserver ctrl-c handling
>  =20
>   This problem was created by the upstream commit 78708b7c8c
>   After applying the commit, it will send SIGINT to the process
> @@ -23,10 +23,10 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>  =20
>   diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
> -index 5c6191d941c..7f7acf6700d 100644
> +index 7726a4a0c36..f750e074a03 100644
>   --- a/gdbserver/linux-low.cc
>   +++ b/gdbserver/linux-low.cc
> -@@ -5733,7 +5733,7 @@ linux_process_target::request_interrupt ()
> +@@ -5496,7 +5496,7 @@ linux_process_target::request_interrupt ()
>    {
>      /* Send a SIGINT to the process group.  This acts just like the us=
er
>         typed a ^C on the controlling terminal.  */
> @@ -36,5 +36,5 @@ index 5c6191d941c..7f7acf6700d 100644
>   =20
>    bool
>   --
> -2.33.1
> +2.36.1
>  =20
> diff --git a/meta/recipes-devtools/gdb/gdb_11.2.bb b/meta/recipes-devto=
ols/gdb/gdb_12.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_11.2.bb
> rename to meta/recipes-devtools/gdb/gdb_12.1.bb
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165541):https://lists.openembedded.org/g/openembedd=
ed-core/message/165541
> Mute This Topic:https://lists.openembedded.org/mt/91065965/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------cRbmD7EaZGW71Xh9mBjMneLr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-05-12 15:28, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220512192854.1538701-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">Release Announcement [1] and Notes [2]

[1] <a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/info-gnu/2022-05/msg00000.html">https://lists.gnu.org/archive/html/info-gnu/2022-05/msg00000.html</a>
[2] <a class="moz-txt-link-freetext" href="https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-12.1-release">https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-12.1-release</a></pre>
    </blockquote>
    <p>I just noticed that gdb-13.1 was released 2 days ago (Feb 19,
      2023) .</p>
    <p>It seems like a good candidate to be included in the 4.2 release.</p>
    <p>$ git diff gdb-12-branch&nbsp; gdb-13-branch gdb | diffstat | tail -1<br>
      &nbsp;6222 files changed, 142614 insertions(+), 63875 deletions(-)<br>
    </p>
    <p>and&nbsp; notes linked below.<br>
    </p>
    <p>Khem, <br>
    </p>
    <p>Are you working on that or should someone else start on it?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://www.sourceware.org/gdb/download/ANNOUNCEMENT">https://www.sourceware.org/gdb/download/ANNOUNCEMENT</a></p>
    <p><a class="moz-txt-link-freetext" href="https://www.sourceware.org/gdb/">https://www.sourceware.org/gdb/</a></p>
    <blockquote type="cite" cite="mid:20220512192854.1538701-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...canadian_11.2.bb =&gt; gdb-cross-canadian_12.1.bb} |  0
 .../gdb/{gdb-cross_11.2.bb =&gt; gdb-cross_12.1.bb}   |  0
 meta/recipes-devtools/gdb/gdb.inc                  | 14 +++++++-------
 ...0001-make-man-install-relative-to-DESTDIR.patch | 10 +++++-----
 ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |  8 ++++----
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 11 +++++------
 ...-libreadline.a-when-using-disable-static.patch} | 14 +++++++-------
 ...gidefs.h.patch =&gt; 0005-use-asm-sgidefs.h.patch} |  8 ++++----
 ...AGS.patch =&gt; 0006-Change-order-of-CFLAGS.patch} | 10 +++++-----
 ...&gt; 0007-resolve-restrict-keyword-conflict.patch} |  6 +++---
 ...tch =&gt; 0008-Fix-invalid-sigprocmask-call.patch} |  8 ++++----
 ....patch =&gt; 0009-gdbserver-ctrl-c-handling.patch} | 10 +++++-----
 .../gdb/{gdb_11.2.bb =&gt; gdb_12.1.bb}               |  0
 14 files changed, 50 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_11.2.bb =&gt; gdb-cross-canadian_12.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_11.2.bb =&gt; gdb-cross_12.1.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0005-Dont-disable-libreadline.a-when-using-disable-static.patch =&gt; 0004-Dont-disable-libreadline.a-when-using-disable-static.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0006-use-asm-sgidefs.h.patch =&gt; 0005-use-asm-sgidefs.h.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0007-Change-order-of-CFLAGS.patch =&gt; 0006-Change-order-of-CFLAGS.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0008-resolve-restrict-keyword-conflict.patch =&gt; 0007-resolve-restrict-keyword-conflict.patch} (93%)
 rename meta/recipes-devtools/gdb/gdb/{0009-Fix-invalid-sigprocmask-call.patch =&gt; 0008-Fix-invalid-sigprocmask-call.patch} (90%)
 rename meta/recipes-devtools/gdb/gdb/{0010-gdbserver-ctrl-c-handling.patch =&gt; 0009-gdbserver-ctrl-c-handling.patch} (82%)
 rename meta/recipes-devtools/gdb/{gdb_11.2.bb =&gt; gdb_12.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9660f2804a7..1179ba172ff 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= &quot;gettext&quot;
 GCCVERSION ?= &quot;12.%&quot;
 SDKGCCVERSION ?= &quot;${GCCVERSION}&quot;
 BINUVERSION ?= &quot;2.38%&quot;
-GDBVERSION ?= &quot;11.%&quot;
+GDBVERSION ?= &quot;12.%&quot;
 GLIBCVERSION ?= &quot;2.35&quot;
 LINUXLIBCVERSION ?= &quot;5.16%&quot;
 QEMUVERSION ?= &quot;7.0%&quot;
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_11.2.bb b/meta/recipes-devtools/gdb/gdb-cross_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_11.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_12.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 649ee287276..3b569fd40e7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -8,11 +8,11 @@ SRC_URI = &quot;${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0001-make-man-install-relative-to-DESTDIR.patch">file://0001-make-man-install-relative-to-DESTDIR.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch">file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch">file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch">file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0006-use-asm-sgidefs.h.patch">file://0006-use-asm-sgidefs.h.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0007-Change-order-of-CFLAGS.patch">file://0007-Change-order-of-CFLAGS.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0008-resolve-restrict-keyword-conflict.patch">file://0008-resolve-restrict-keyword-conflict.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0009-Fix-invalid-sigprocmask-call.patch">file://0009-Fix-invalid-sigprocmask-call.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0010-gdbserver-ctrl-c-handling.patch">file://0010-gdbserver-ctrl-c-handling.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0004-Dont-disable-libreadline.a-when-using-disable-static.patch">file://0004-Dont-disable-libreadline.a-when-using-disable-static.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0005-use-asm-sgidefs.h.patch">file://0005-use-asm-sgidefs.h.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0006-Change-order-of-CFLAGS.patch">file://0006-Change-order-of-CFLAGS.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0007-resolve-restrict-keyword-conflict.patch">file://0007-resolve-restrict-keyword-conflict.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0008-Fix-invalid-sigprocmask-call.patch">file://0008-Fix-invalid-sigprocmask-call.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0009-gdbserver-ctrl-c-handling.patch">file://0009-gdbserver-ctrl-c-handling.patch</a> \
            &quot;
-SRC_URI[sha256sum] = &quot;1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32&quot;
+SRC_URI[sha256sum] = &quot;0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed&quot;
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
index 824b96f6afe..16d6cf196fd 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
@@ -1,7 +1,7 @@
-From a6d3df9d84463ec500d9d01558ab8a17e824e9e5 Mon Sep 17 00:00:00 2001
+From 8eca28eddcda4ce8a345ca031f43ff1ed6f37089 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH 01/10] make man install relative to DESTDIR
+Subject: [PATCH 1/9] make man install relative to DESTDIR
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Make-common.in b/sim/common/Make-common.in
-index 8c2cacea1e5..4a52eef2203 100644
+index 74e5dad3049..9e95c224ba4 100644
 --- a/sim/common/Make-common.in
 +++ b/sim/common/Make-common.in
-@@ -63,7 +63,7 @@ tooldir = $(libdir)/$(target_alias)
+@@ -70,7 +70,7 @@ tooldir = $(libdir)/$(target_alias)
  datadir = @datadir@
  datarootdir = @datarootdir@
  mandir = @mandir@
@@ -24,5 +24,5 @@ index 8c2cacea1e5..4a52eef2203 100644
  includedir = @includedir@
  
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 591c9bfa3f9..8d263de8963 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 7f1f25eaaace289bc33c5aaa1c5fe9e04e719651 Mon Sep 17 00:00:00 2001
+From 37d3afd2eaa95c89ad7cb5d0079b017752e4d0ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH 02/10] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH 2/9] mips-linux-nat: Define _ABIO32 if not defined
 
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index b21c7cb2ea6..6614b4de31e 100644
+index 20e12b6889e..6adc61235aa 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -41,6 +41,10 @@
@@ -31,5 +31,5 @@ index b21c7cb2ea6..6614b4de31e 100644
  class mips_linux_nat_target final : public linux_nat_trad_target
  {
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 09ea533b00d..7e09404bb05 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,8 +1,7 @@
-From 0cb233ec3951582fa1a051a16bfd644ef4969df5 Mon Sep 17 00:00:00 2001
+From e689eec672ee8c53b3adb2ade2b5deb9b7cd99d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
-Subject: [PATCH 03/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
- systems
+Subject: [PATCH 3/9] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
 
 Upstream-Status: Pending
 
@@ -13,7 +12,7 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index e712a9a5713..76bbcca0928 100644
+index 1094f6b0be3..d8588a646c2 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -31,7 +30,7 @@ index e712a9a5713..76bbcca0928 100644
  
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index db9a88219ea..151e4183bb1 100644
+index 08824887003..69afbae5359 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -23,7 +23,13 @@
@@ -49,5 +48,5 @@ index db9a88219ea..151e4183bb1 100644
  #include &quot;arch/ppc-linux-common.h&quot;
  #include &quot;arch/ppc-linux-tdesc.h&quot;
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
rename to meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
index 02ea30f9bf8..a1e85e91b33 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,7 +1,7 @@
-From e2efd044c479895767f1b929f5a54fa0c689f318 Mon Sep 17 00:00:00 2001
+From 15ee6a626242efb8f367be49c13e00d0b72317f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
-Subject: [PATCH 05/10] Dont disable libreadline.a when using --disable-static
+Subject: [PATCH 4/9] Dont disable libreadline.a when using --disable-static
 
 If gdb is configured with --disable-static then this is dutifully passed to
 readline which then disables libreadline.a, which causes a problem when gdb
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 5a460f1dbbc..77a702ac6d6 100644
+index acdcd625ed6..78fc31e1199 100644
 --- a/Makefile.def
 +++ b/Makefile.def
-@@ -105,7 +105,8 @@ host_modules= { module= libiconv;
+@@ -120,7 +120,8 @@ host_modules= { module= libiconv;
  		missing= install-html;
  		missing= install-info; };
  host_modules= { module= m4; };
@@ -33,10 +33,10 @@ index 5a460f1dbbc..77a702ac6d6 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 9b3a5d75735..98cbe844fca 100644
+index 3aacd2daac9..aa58adada4a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25607,7 +25607,7 @@ configure-readline:
+@@ -32791,7 +32791,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -46,5 +46,5 @@ index 9b3a5d75735..98cbe844fca 100644
  @endif readline
  
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
similarity index 84%
rename from meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
rename to meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
index ef271c45e29..242099b9b1e 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 5077518c11e8d75e9bf65cdf9ca21c59564e1037 Mon Sep 17 00:00:00 2001
+From 25a75aaf29791f4302f0e4452f7ebaf735d4f083 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <a class="moz-txt-link-rfc2396E" href="mailto:amccurdy@gmail.com">&lt;amccurdy@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH 06/10] use &lt;asm/sgidefs.h&gt;
+Subject: [PATCH 5/9] use &lt;asm/sgidefs.h&gt;
 
 Build fix for MIPS with musl libc
 
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 6614b4de31e..237eb6eb975 100644
+index 6adc61235aa..afb40066744 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -32,5 +32,5 @@ index 6614b4de31e..237eb6eb975 100644
  #include &lt;asm/ptrace.h&gt;
  #include &quot;inf-ptrace.h&quot;
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
rename to meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
index 40d12579c0e..58c9b1d0a78 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From 80080e6c8425ac51498f49c2063b960a08f9a27d Mon Sep 17 00:00:00 2001
+From c0e7c34134aa1f9644075c596a2338a50d3d923e Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
-Subject: [PATCH 07/10] Change order of CFLAGS
+Subject: [PATCH 6/9] Change order of CFLAGS
 
 Lets us override Werror if need be
 
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 12e9b2777ae..ad44fbc3309 100644
+index 47648b8d962..5599779de57 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
-@@ -172,7 +172,7 @@ WIN32APILIBS = @WIN32APILIBS@
+@@ -156,7 +156,7 @@ WIN32APILIBS = @WIN32APILIBS@
  INTERNAL_CFLAGS_BASE = ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
  INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
@@ -26,5 +26,5 @@ index 12e9b2777ae..ad44fbc3309 100644
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
similarity index 93%
rename from meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
rename to meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
index 9095f905828..bbd1f0b27f1 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
@@ -1,7 +1,7 @@
-From 4ee7e8afb9ff259e889ac938c673fda9ddc5e15a Mon Sep 17 00:00:00 2001
+From 44fa1ecfbd8a5fe0cfea12a175fa041686842a0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH 08/10] resolve restrict keyword conflict
+Subject: [PATCH 7/9] resolve restrict keyword conflict
 
 GCC detects that we call 'restrict' as param name in function
 signatures and complains since both params are called 'restrict'
@@ -44,5 +44,5 @@ index 90a67d18426..664641a1fe8 100644
  _GL_CXXALIASWARN (gettimeofday);
  # if defined __cplusplus &amp;&amp; defined GNULIB_NAMESPACE
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
similarity index 90%
rename from meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
rename to meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
index 5b9d1cfaf93..ed1310ced28 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
@@ -1,7 +1,7 @@
-From 5740876d92ddb67b039d5fbcd1b71e6c58823c08 Mon Sep 17 00:00:00 2001
+From 5bdd15553daef7370ca3c1f12d8f14247fdd4907 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <a class="moz-txt-link-rfc2396E" href="mailto:yszhou4tech@gmail.com">&lt;yszhou4tech@gmail.com&gt;</a>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
-Subject: [PATCH 09/10] Fix invalid sigprocmask call
+Subject: [PATCH 8/9] Fix invalid sigprocmask call
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
-index 95c156e5036..f4aa512d105 100644
+index 92e799d3551..a4a0234272a 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
 @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
@@ -45,5 +45,5 @@ index 95c156e5036..f4aa512d105 100644
      perror_with_name ((&quot;sigprocmask&quot;));
  
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
similarity index 82%
rename from meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
rename to meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
index cb4744e5dda..f53d3bd1e54 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
@@ -1,7 +1,7 @@
-From d611a68f05c0c86af27bf6beae189a90a946e2e3 Mon Sep 17 00:00:00 2001
+From bc3b1f6aacf2d8fe66b022fbfcf28cd82c76e52f Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Date: Thu, 29 Nov 2018 18:00:23 -0800
-Subject: [PATCH 10/10] gdbserver ctrl-c handling
+Subject: [PATCH 9/9] gdbserver ctrl-c handling
 
 This problem was created by the upstream commit 78708b7c8c
 After applying the commit, it will send SIGINT to the process
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
-index 5c6191d941c..7f7acf6700d 100644
+index 7726a4a0c36..f750e074a03 100644
 --- a/gdbserver/linux-low.cc
 +++ b/gdbserver/linux-low.cc
-@@ -5733,7 +5733,7 @@ linux_process_target::request_interrupt ()
+@@ -5496,7 +5496,7 @@ linux_process_target::request_interrupt ()
  {
    /* Send a SIGINT to the process group.  This acts just like the user
       typed a ^C on the controlling terminal.  */
@@ -36,5 +36,5 @@ index 5c6191d941c..7f7acf6700d 100644
  
  bool
 -- 
-2.33.1
+2.36.1
 
diff --git a/meta/recipes-devtools/gdb/gdb_11.2.bb b/meta/recipes-devtools/gdb/gdb_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_11.2.bb
rename to meta/recipes-devtools/gdb/gdb_12.1.bb
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#165541): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/165541">https://lists.openembedded.org/g/openembedded-core/message/165541</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/91065965/3616765">https://lists.openembedded.org/mt/91065965/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------cRbmD7EaZGW71Xh9mBjMneLr--

