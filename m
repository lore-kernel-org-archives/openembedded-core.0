Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B4AC4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 16:26:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.678.1702398359680753780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 08:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=KANWx4dx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07109d2a54=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCB4WfO020349
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 16:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=caNy/ceEhzCGj7lUveD
	NigtLdxVGdTdSZKKRB0InuIM=; b=KANWx4dxbd5E/PWnrIHdQ7pfBx01nfHRx4y
	dbya+oe219IsBLQq91O/73QjBkUEvDy96Yo0AsnO6wWPZ9aljvBCqe1uKYSSioYO
	ZzEAsjF/49jm4T4clleFqyk/x+pwxtPHXSqjYvrak8HpD7i9u8R/iJ7c7nGBQU54
	0/HZt05S0BbjMP/BzjCgumw/bPtE32bsv76EiaTM849rehWfN7pnm+XwZ65Gldm6
	YmVCS9RlQI8ixLvTkVGlTSnQdsmN5VLNjS06mkTnF53NuyUKyRCEpg55Qep/K4gq
	9G3yGGbYkzB8uFbZgN4jJ1/jtDnKAExdljGkqzL2zl4wqHWxnMw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvf7630k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 16:25:58 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BCGPwT9027359;
	Tue, 12 Dec 2023 16:25:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvf7630k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:25:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6lh01hBLdEJQvTOF5SHUMpf7tsJcvNpsvXtQ3i21NnDze0t8IWahX6+3zP2yldZ7TiXREzWn27GyOaHyKPbLz4+TF7Gm456LBVwYEDcBBat1KwwM7lSpLaFx8GAJr9Mq1YlpDH8rYVwVg6b2Oo8V5AUT/hyy3tyzX984wBU7JjQysH+wI0D9Du1ptMbnZ1RHjMkT7qysG0x8gk5ppwdKL+YypL3ix+MSc5udCGsy3vsgsJRwxvdfwjB3xP3QE5r58OJNj3NCHkPImVXrraX5uJbr9tO+d9KllTgw+axMWFtjRgonvciuTIC42JP5Szjvd0Z2gZJ3QXgevcPRYMZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caNy/ceEhzCGj7lUveDNigtLdxVGdTdSZKKRB0InuIM=;
 b=KFxG1B9bZzuquP+d0jmNqJlR6YTzut3eFrJ8TCVIPSk/VQfxgo7VLiByTlpDKXrFTm2iANu2n/wegb27ubHv6SHUSqyKQ0YBYn3sMius7/nIzOCc9YhXWKecBSDTaZFO59BV44hRbQDsh+xzKfxroUtOccr7a9iIRII2Bzsc+WgB1BdDnaZ6X8vyhn0BxW75kvXaWhEiIUAwsGI55yToFVU1c9F+oLftTzCxOjOBx4OIRz1dO12Rq6QPQCzk1KO5oyhxga993VhuhehCGWXmJ7zq4VJSAVsgdNA+qRXFFdkEngkQVvzRhove2024Zw7XBvK7eS77Z8fz7iVqNrsPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN2PR11MB4615.namprd11.prod.outlook.com (2603:10b6:208:263::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 16:25:52 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 16:25:52 +0000
Content-Type: multipart/alternative;
 boundary="------------8mvAo3GzaABFHVEhcf7tosND"
Message-ID: <7cdd0aca-025f-4561-96a0-87c7fd02fbdd@windriver.com>
Date: Tue, 12 Dec 2023 11:25:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 7/7] rust: Upgrade 1.73.0 -> 1.74.0
Content-Language: en-CA
To: alex.kiernan@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        openembedded-core@lists.openembedded.org,
        Tim Orling <tim.orling@konsulko.com>
References: <20231208140349.3576-1-alex.kiernan@gmail.com>
 <20231208140349.3576-7-alex.kiernan@gmail.com>
 <20231209121845ed0bfb0d@mail.local>
 <179F2EEFE21E3032.26830@lists.openembedded.org>
 <CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9CxNhopgvqie6OBAo-HOQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9CxNhopgvqie6OBAo-HOQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MN2PR11MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4f586b-d0db-47c1-26ae-08dbfb2f0240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jTDM9wOY8W38EAPIRH4oAN29m2d8joY3NE1u/3C/zvk71u5pU/r0WnvsK8Urds55Yugv1VRvnFeTYDhfqL0Rya12KvY7RXaEvL3bh389uftGTZtzQ4MfASFK+jDD4kRClcw7jG1MKXbgwVNgiDVvSa0XOYgMAbBb0npooFAdJmTKZw8gLza8q7YNLUvIW4B68Fwc+94Ww+UdDk8G3PpCK1Cv9FK8t+JaiXt4VOerQGeMxxtay4zqHwsq9jWghe/VNy6HGK4h6pRSELHhjmu6/NAMzhVZ+yb0GxPV/tJr2mUVVGN+Ac+d/eijs/sarnAphRv8X5Pzpy491KTDVP+hq04yT9rELnXHvc5gTe7+LSh142HKyPTcsqj52w2lfIobBa+CLpJImNBYHw5ja3Tk+6trQWjX8F6jJqO5JsMoiO5ZOOgPvg7N8yakYEWwZW0hx7r78A5zD3ZvVV5Hexv0C/ExAU7101qFdziGE0V4WQh8BWW7ExMRlkZc5hTOiEkbMHyERVdKfpbsR5rA8G0F2be8V7RFrKpyZ1D7BSPdC2M4hy5oonc/qPMtlwc39pqOrwgTMKRYKiaPtfje+ne7hTAcSwKzwwgtZwWnrUibKOOno1u+WlMWizva1NkNL84lBC1Gfn7zdl3B1qF6Yli1Rxq4IKhqFS2BwZjr41CY+yGW3D7oT2Ol1VsUjoiN9zAL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(376002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(53546011)(36756003)(33964004)(2906002)(966005)(478600001)(6666004)(6506007)(83380400001)(4001150100001)(26005)(2616005)(6512007)(6486002)(4326008)(8936002)(66899024)(8676002)(5660300002)(6916009)(54906003)(66946007)(316002)(166002)(38100700002)(86362001)(31696002)(31686004)(66476007)(66556008)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3ZLYk1DSXBCaFVPUlBFbEFuRkFFQlNha3MrR3RZVzVXMEUwVmpvTEp6OHkr?=
 =?utf-8?B?RGEybzRLdzBTMFJjaHk2S3JSQXNEUGl2eStSMG5JK2p1bUovWnNkRVpXazVy?=
 =?utf-8?B?a0h5cWlVTGs1RmJURERGQURReFdVRlgvMkhPZVFRUW13NnZhb0E1WlJuR1JS?=
 =?utf-8?B?SVplRDlpZTVKK2lVb1BvNzJzL3NnV0JYWXlNNjlvRG45U3Jad2t3ZUJja0x3?=
 =?utf-8?B?NHJRZVYxS3phaHhxdXZrZGVlVm43RG4wdnFnMzNvbVp4KzBnTUVKdkkybzZp?=
 =?utf-8?B?dmRHN0Z4MGJBTDhPWVNaa0pQYmp6aHRQb3NlRmRsbnc1bmJpSU9aTlFRd0pX?=
 =?utf-8?B?NWpTSi9SQnhxMG5RZ3pXbmFsUnQvSVZSREFXcEZyY1Q0eEJuY0hjZWJYQndH?=
 =?utf-8?B?RHpmTEVDaVNMbkJ4K3RBaU1qRm51enlSbk1mZGgySXZZM2JRTUJ4aDFnK3R4?=
 =?utf-8?B?dm5adDVaQ211NXZoaVgxVHB6NTRYNFBTc0V0bmtCS05SSlpUNXN0b1hjQWZw?=
 =?utf-8?B?TlRNQ2RqTCtwWkdwcUhSZlMrNzMvM3UveWpFRWl0QmlyaVNJeWpuQTR2NUtX?=
 =?utf-8?B?aWNLbWZGcnRtbkZOVmZlYjBweUZTeDNXclcxYW5kcFRNV1M3ZE9lNDBaTXZp?=
 =?utf-8?B?Yy9GaGZjTDhiTzRoZEltejFBNG80WVl2dThvdERldjloZGMwcXBDV1hKek5x?=
 =?utf-8?B?eU4xdG4wdk9ub0VSM2pYejBWbmw5R1h1cU4yeG1sdTU4YUNYYjJRaXgwNDBY?=
 =?utf-8?B?bVZEVFl6NDJOQUlDUTltRDY2WG1YazIvNDcrRDZ4M1k4S2dqbE10TE1TUGlx?=
 =?utf-8?B?c1JCNktDV1FuZWxCZXRxRjNBY0puMW5IODJOZ084dCs4MzQ4Y0Uxc20wSm1R?=
 =?utf-8?B?Q3hEUmFadVlsTEY0bnZwdU92QnplbXp3Q3BZWGtPUUxRVHVUWmR4QUUySGRw?=
 =?utf-8?B?aE0yQXMxdXZ5YVFKSmFhd2RqM0hXTUlURXFrYm5xcW04TlVzajdLaTNTeTE1?=
 =?utf-8?B?NzRBblRIeUJKK1k5dGNvT2Y4aVloNzBwWEplWFU3ZVNuNU1SeEFhMCtsY0pi?=
 =?utf-8?B?TDNqU2U0UVFjVXNrekVOSmhYTVc0U1cxdlRWS01YZUxtNG5xUGJEVWtDYlJR?=
 =?utf-8?B?UkRwZTNmVXNXamZnS0c4NnBsc2YyK2hwV1dzUVZVNEg2ams5N0UvN3ZvQ1Zk?=
 =?utf-8?B?Y0FiUHZuS2lDclhZS01aaTZZTFduSjEwU0lMOXg4am40L0FtSUV0Y1MzT0Ro?=
 =?utf-8?B?c1B3VUtEdHZpbWsyYjQzQlV3ZzI1TWg5Q1d6dlh5M1Y3VFNEU2VLY1BaYmZi?=
 =?utf-8?B?VGF1bWQ2QkdlR2FXeTgyQXF6MU9nU0JnL3hxMFd1VnpMWmM0aVhlRFZwZ0NQ?=
 =?utf-8?B?SXk3MmgxSzJiNW5CYWIvVWZYNG51OUJ3a3k5TFEwekl1ZEdtOFJDci8xOStD?=
 =?utf-8?B?RW9pK2VEQk9xZGhhSTFjNnRuVGtkS2x2WW9iTHRpenlNNDFvaEhCM0hKUjJh?=
 =?utf-8?B?YVZyb2dZMW5aRE9xRE9QUjF4cTJScjUwNFlvOUV6VWY2Njl3bEJoQ1ZLZVpS?=
 =?utf-8?B?UFFJR2RUNU5RajdzUTZGNDcyQmc1N01pQW5sQnBhbTJDWkJSTG9XMGE4TXo1?=
 =?utf-8?B?Y2lMUlA5MUdvVGk1OXgzaHFXZ1l2TFM5RGJwKzhYOEpzTEM3WndpbXY4VHBj?=
 =?utf-8?B?ZjNUU1FDY0FWc09jUmMxc25UY0t0QjFsQUdGZVJXVVdsN2FBWEtKVmZwME00?=
 =?utf-8?B?V2xRVDRKQWlsem5peDBEOTh6aHljcVE5dDZxUmxvcGFLWS9ITWpyWE93YXRX?=
 =?utf-8?B?QjRwYzdIdUFLNHl1cjF0SUxHWlBXYVRHZFcveXV3QmV4QmhOaDNzK0lUdEZz?=
 =?utf-8?B?YjhNR1Z4WHA3WWRoSWpuTnJaK1k3cWx4M2FvTVluMUlEL2F2cmRWWStJSnR4?=
 =?utf-8?B?VEw1U2YvZ1VlbDBtSHdQSGxOTVAwdWMrTW0vd2l2Tzk0Wm9nN2Y2a29VWWFT?=
 =?utf-8?B?ZVp5YlRqWU1ZUy8zbkdUUXQraHY2OWQwSVJzeFhtODcrRDhqYk9JbUFVZWpr?=
 =?utf-8?B?QktON1l2RkZyckJ5bVFkWmdhVTJob3djOXZmNGdmV0RYOHFkTE9sYUV4MzNS?=
 =?utf-8?B?SSsyelJiSkEvNWFIRWVKbzYrY3F3RHEvRTRtckFHV0crMFF6TmZ0NUxQUjg3?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4f586b-d0db-47c1-26ae-08dbfb2f0240
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 16:25:52.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1fcBzjELEVra6YR5eLM+BMLC7pnz6nSPj7rw41e77daJvtiMSlv/k6yc8IVsS8X+F8N2alCjXNiUBMGvOFZLwMlKbgZGatW5dq1M1iLWVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4615
X-Proofpoint-GUID: Nuxe6aB-scqpKltl4rZer71qP94gMV3S
X-Proofpoint-ORIG-GUID: QkJ_g4KJHzwMzf4AYHckjRolzlTsA-AL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=739 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312120126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 16:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192235

--------------8mvAo3GzaABFHVEhcf7tosND
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BCB4WfO020349

On 2023-12-12 5:41 a.m., Alex Kiernan via lists.openembedded.org wrote:
> On Sat, Dec 9, 2023 at 2:06=E2=80=AFPM Alex Kiernan via lists.openembed=
ded.org
> <alex.kiernan=3Dgmail.com@lists.openembedded.org>  wrote:
>> On Sat, Dec 9, 2023 at 12:18=E2=80=AFPM Alexandre Belloni
>> <alexandre.belloni@bootlin.com>  wrote:
>>> Hello Alex,
>>>
>>> rust 1.74.0 is not reproducible:
>>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-=
rfbproj4/packages/diff-html/
>>>
>> Thanks, I think :)
>>
> One observation, which might be useful, these failures are all inside
> the same module src/llvm-project/compiler-rt/lib/builtins which are
> just a bunch of intrinsics. And as far as I can see it looks like it's
> just the object name mangling that's not reproducible.

FYI:

In the weekly YP tech call, we talked about Rust and Richard said that=20
he'd merge
1.71 to master since it's progress and it unblocks some ptest works that=20
Tim was working on.

We can then just jump directly from 1.71 to 1.74 if ( when! ) we can=20
make that reproducible.

Richard said that he started with 1.74 from Alex's patch-set and
when he found that it wasn't reproducible, he simply worked his way=20
backward.

../Randy



>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192191):https://lists.openembedded.org/g/openembedd=
ed-core/message/192191
> Mute This Topic:https://lists.openembedded.org/mt/103055169/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------8mvAo3GzaABFHVEhcf7tosND
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BCB4WfO020349

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-12-12 5:41 a.m., Alex Kiernan
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9=
CxNhopgvqie6OBAo-HOQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Sat, Dec 9, 2023 at 2:06=E2=
=80=AFPM Alex Kiernan via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alex.kiernan=3Dgmail.co=
m@lists.openembedded.org">&lt;alex.kiernan=3Dgmail.com@lists.openembedded=
.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Sat, Dec 9, 2023 at 12:=
18=E2=80=AFPM Alexandre Belloni
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
      <pre class=3D"moz-quote-pre" wrap=3D"">One observation, which might=
 be useful, these failures are all inside
the same module src/llvm-project/compiler-rt/lib/builtins which are
just a bunch of intrinsics. And as far as I can see it looks like it's
just the object name mangling that's not reproducible.</pre>
    </blockquote>
    <p>FYI:</p>
    <p>In the weekly YP tech call, we talked about Rust and Richard said
      that he'd merge<br>
      1.71 to master since it's progress and it unblocks some ptest
      works that Tim was working on.<br>
    </p>
    <p>We can then just jump directly from 1.71 to 1.74 if ( when! ) we
      can make that reproducible.<br>
      <br>
      Richard said that he started with 1.74 from Alex's patch-set and <b=
r>
      when he found that it wasn't reproducible, he simply worked his
      way backward.</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9=
CxNhopgvqie6OBAo-HOQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
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
  </body>
</html>

--------------8mvAo3GzaABFHVEhcf7tosND--

