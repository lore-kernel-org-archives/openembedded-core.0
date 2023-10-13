Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247C5CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:15:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41475.1697210146048558622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 08:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iLde7Z+z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86502223d3=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39DEmtff002546
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 15:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=PPS06212021; bh=tvjRbfe/d3wbZmgptUm
	dC1t3xzXnngzawUqcoRoxhzE=; b=iLde7Z+zeeuUgeYPN7yNhUh8rinhHkIkdiw
	+0HR3EfBu3pl6F5EENayzSqjFOe63KkunegQeNb7iLtMJcSRTtY0zLvaQLPXLB8B
	Kfha4dB3u6BMTnTaCRG0DGQk+hfLP/pR7o01DBlulJ7m4hTx8VNCXaHvmqyxFWgV
	JR2bIn6F3eVUh13HAbY2WbquI2c2ykg2xsafPvsguz7mmlel0aj94zGRlytgRtWw
	vBykopiXB/+Xjz8+DA4SLFqBPL6Fdu/K8vyFV+x5SPGs0XLeF/dVX/LKMUviS7lB
	jHnC8+cDo5qlCa1REG5+b/OFqG0ct4LMpA4srUUnLypHy8dfeWA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhuejkgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 15:15:44 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39DFAwPu010263
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 15:15:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhuejkgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 15:15:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNtB4R5/o7f3WnP9vFg2hUJJ9wkXTcw5T7idEgVi05hI8ysLakCuIgtdvwAdJS6rhEmQsPCMJmSb/JQzfHpN7r0CMBf/xyUmiTFURL8xeSNnUp/254TY8s31F5YZYnz5XaZbbaMHq4FhZLr7FimZUBMFx4dQAmgbZb9W1dy4IGu3mGPmKcqPzitPJEjZDOhryKzUo0Gku3MkuMu1a9QU/6YGGV2FN2uy74MrX9jE6w+I7n8i9Tt1P6nzWDgYA1+LN4FxYi/fVSjGFqasfIRgDbJZgnFqW/997IvO/M6Ei6cQ2HKr+6N0omromIj1SHX5XSBc8Wv6B6O0rTSk64GOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvjRbfe/d3wbZmgptUmdC1t3xzXnngzawUqcoRoxhzE=;
 b=BG8E8ah4gslFqdXYUGONi9jlGKGof5c7gxTof3WiLfVBWPG8xPXKHLOaAPvRvACBp3vy6X1SHZceRr+Qt6JBTo7kKk3sH7RNJI4S2oNovQRocuqZzDH6/2C/CwyMAVN4SBwS3G98c4Di+rtJEba3l1CHZS65UOSiXrfO1spgxCQ3kdq2XwB1DkLq8UgzxIhb3qSp0XP3sCO4dOZeIszBeAHrJHMXOygVzOdZvgudhMBg9u49WHGUJST6ATyo7toF7bR5B+qdJmxtEmpYfAwJvqu8mY1DtWRTSbFUDdy4iiDkHOn0m02bCqXXjwtWDKUplm6LOCkOMGIgB3g5mKxBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Fri, 13 Oct
 2023 15:15:40 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::4550:92ba:e229:2549]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::4550:92ba:e229:2549%6]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 15:15:40 +0000
Date: Fri, 13 Oct 2023 11:15:35 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Mikko Rapeli <mikko.rapeli@linaro.org>,
        Randy MacLeod <randy.macleod@windriver.com>
Subject: Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and
 6.5 summary)
Message-ID: <ZSlfF+2cEHb8nUwO@windriver.com>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
 <178C1443D3C8D91F.5378@lists.openembedded.org>
 <178C704E48D36FAB.24994@lists.openembedded.org>
 <178CD9772ED4DEB5.9719@lists.openembedded.org>
 <8943ba03ec46c2c6d115a4fcdb8412571f56543d.camel@linuxfoundation.org>
 <ZSYpdnwTW+6FkBiF@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSYpdnwTW+6FkBiF@windriver.com>
X-ClientProxiedBy: YT4P288CA0062.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::17) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 68411e9c-fa3c-44ea-4085-08dbcbff42a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ogSAN/yzAACb1dLK36jWxDuJjC6wEOlkMewuheAKQIt06s+eIuLj1ZWLqlR+Exb3S5A6jY2PMkL6vXDmq19aIb9DHcXDXRNQgIB7fRBRluxvjMyt8Lkez+OVu+fOH3oe+rDfXAodo+fEMqSe93i6L6mVkc/ZSLj5HkBXueGpTURi6kGnOy9W4mjm+87eqqUC7sAthmG2tfl5eAXt5e4zNMNUfYkeaJOafc/XBhTihWYSsMY/DMJj2xMLLyMIZ3vK20HUoRbhfgJiYuA9HsNvo8atBGJD3pGy8S+ltbY+tkmIdtsBJlGm1R23mD3xVxpohNicKPtu5ClyAFQkga2E3P3vjAq2pHLlx2e27wfiIeqyKBOGVenlY9kE1Xu7rdJkXYqf0SaTBdGq4G0N7jnKJKAxKZuu6f+8jMUbCzmH9PT51xGXXW4x+cKVrQ6gJ7o8JBHmwLeyYVqCeLRoe8RYNwDZcplxvHT7SpynH/HTd8rsa+IHylCq+tmjM1n1zz5UojSc4dc0XIDcZ/bj/mvv4k21HM1l7CGyEUVXA9AfNmaCXDjS1ZSDldrT7T+el/XsSrs7PJMNwP/DUZeIrGdUJ0QeuB0ZUpBEAKSLHRmJOnZsY+Xop9cQJNsO2IOr3IeKLnS8kQY2MggR9bKmhkLhxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(376002)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4326008)(8936002)(8676002)(30864003)(2906002)(6486002)(966005)(5660300002)(44832011)(6666004)(478600001)(6506007)(86362001)(6512007)(41300700001)(36756003)(38100700002)(83380400001)(316002)(107886003)(6916009)(26005)(54906003)(66476007)(66556008)(66946007)(2616005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sn9PGg+z1ov0//HIj5wVJtIrBGIpO3tQ/EqWvDHZnaRWvKFN7E6+NN1WgK9x?=
 =?us-ascii?Q?aCTL279b0Bla/l3Nk7U0elWjqGBQSNq/T7uZsCkQ9ncaYbriavX/0phJPYdF?=
 =?us-ascii?Q?8+Oy/vag6Woda/m4IdEkn+vPF0pgSmvl/SoKGDyrT49M1KQ/u65nvcLs6xCD?=
 =?us-ascii?Q?pfWDZgkUP+5nZii4kQW8oAKP4DQPJyk6EFcivhMPsFPufDuXvTk6GgP8Bt58?=
 =?us-ascii?Q?osxJJmWTE7b4uxtegNLj9aU9N7YPUv1RfnvVxPMZRRM3X+awUCaikoi1MQbz?=
 =?us-ascii?Q?aUHRg2lpdtHZ2qIk7rPpmXpwqH9zkwEl4h9kztOHSYdY/HyQ099TEK+jiIMB?=
 =?us-ascii?Q?I2DqFoGec/fAhpnO7hJ0o/tV47ZzhEe/4jMyI9hFMrVE3TOwqBRkRfAMtAaz?=
 =?us-ascii?Q?BL79geo2XAM3ASo9XJXizl7h30jkc6w+eaOPfWiR8vn0hTklo37aA2pS/RFe?=
 =?us-ascii?Q?uOya1lX6ThwbK6f2C0bWkA1uGK0DNU5g5/HL2aFsjbSMaU1tDVXD7cJ01JRd?=
 =?us-ascii?Q?RWrT7MGt1R+DdJh0wfVqv2qH9NTaT6arhItc1GAj83hpRB0t5HI38SRLnXKR?=
 =?us-ascii?Q?bJwIttwZF7OHot/SyKqqcn5wRAfFeGKj4064K/mnO9qNCMo315XqP5GNxrvK?=
 =?us-ascii?Q?8WYOYrv/YLeSqSncoMPvDkexmy4wkk2AGQwKHgt/LyVvizAmg4gTTS0Xtn1N?=
 =?us-ascii?Q?Kn916Iz+tSqAt7SfFgcYCPCyHISqAn2xNX+XQyRDE0rsGnJg9cEe2KORKrdX?=
 =?us-ascii?Q?KMbBvtikwxxLBzBhxLXKqGL9fXxdqbLeRCvEx8ZnKSb4YA+m1W7t94mH23+T?=
 =?us-ascii?Q?sa9q1eBddCnhgfJbj+szivunyWJUy/SMNAd+GTf1ftS+/bN86HBU8GJmR0Zz?=
 =?us-ascii?Q?OJmb3TKmNgpQ3DsCYA6L89yLGKgQMLjR/Qwe+22oxqfpsXtD0aiexo+eAQhV?=
 =?us-ascii?Q?pmRkILaZ0aWpL6wpLBFSrVg/WjVigdZX7SoTpBNSHPlUfqhiwP0BtHusc34L?=
 =?us-ascii?Q?w838LX7eW5ifX1hpQdiDKoKeVwZ+6633oHDNu5ShFpaHeW92x8NLUadQIdQe?=
 =?us-ascii?Q?0WRH65qtO3hPjedMlNvjFyMqDK8MbtueNTWkszd4poP2LUD5pNisYlV2laR0?=
 =?us-ascii?Q?Iep4dHZ3jbpE2YRVHjXktAnZUs+0/uTnMGn8sYFzgMigXuOa05+HLYZgfV19?=
 =?us-ascii?Q?Fa0hxJfjkeXoPJQMW+ShqZFTPGfUe7aTjzbU5qcgLHG7wbN7karGyIplyyEE?=
 =?us-ascii?Q?Nnkfxhyo8iNL17vMoeMFs4IOBIgnu6nCa7/KZD1rftJ2OwXmDeUXEHrtNtAI?=
 =?us-ascii?Q?v8Axh3QiXTNVrD2QkYFfNeyeun5aSUaJzFRyF+NMELPISI7bcbXR2y4UUsDi?=
 =?us-ascii?Q?TaMDQxz2KjjBFM0o4Tn9UfN9D7yIX9Uc481/aHxOtisi8hAHOBN0XrFC3tpD?=
 =?us-ascii?Q?Evt8Gh8ibbqn6hSu2hlGQFPrJdz/jwzRpksvC2+PkK0LHePuUpc47uGARf4y?=
 =?us-ascii?Q?MborVJQQOztjNyXi4fFn2xke77WJzHlke8wVTDJL4AWst7cLelfbJt5Q8STk?=
 =?us-ascii?Q?TLDzedlrhO8ax2sYcR2guhHWY3R1QB/s6GkLcV04XlH4LoWo+GtbLpAFDjiM?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68411e9c-fa3c-44ea-4085-08dbcbff42a5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 15:15:39.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddZcV3eZZJX7MOCELTSvEZfvJgsI2sNSwCHYKcI8EWVK8P2wvtlKFe8pX+sGHy9eZJf6cwJLVxtoxjor0PmXIINC2bbPSycZEEPRNdLDuGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
X-Proofpoint-GUID: tq_xZmz-EdgsqbqNf55cXIPGm_eWEFqd
X-Proofpoint-ORIG-GUID: tKy6HhQtv_ZvRxQMR--ENKz09J6TLVne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_06,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310130128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 15:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189070

So, here is an update for those not following on IRC:

[Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and 6.5 summary)] On 11/10/2023 (Wed 00:50) Paul Gortmaker wrote:

[snip details of getting RP's chunk of AB python working as a 1% reproducer]

> Next steps:
> 
> Each run takes approximately 20s, and with a 1.5% success factor, a
> minimum of 150 clean runs is needed before one can say "OK, *maybe* this
> kernel currently under test is OK.  That translates to over an hour to
> get a data point you have some faith in as being "good".  [Still a heck
> of a lot better than doing 150 *builds* though!]
> 
> On the other hand, just one instance of missing login on ttyS1 is
> concretely "bad" and hence the test run can be stopped as soon as one
> instance of that is seen.
> 
> This "good is really maybe perhaps good, but bad is for sure bad" type
> of bisects that I love to hate.
> 
> Since the data points are "expensive", I probably won't just attempt a
> mindless brute force bisect.  I'd probably do something more like...
> 
> --ensure modules (or lack of) don't impact the results, so I don't have
>   to rebundle rootfs images.

This turned out to be true - didn't need modules.

> --maybe see if I can build with host gcc vs. using devshell/sysroot gcc
>   and still see the issue.  Although really, kernel build time optimization
>   won't be the bottleneck in this particular case, so not worthwhile?

I didn't bother with the above, since build time was not significant here.

> --check vanilla v6.5 (i.e. v6.5.0 -- no linux-stable content) so I know
>   whether to dig around in v6.5.0 --> v6.5.5, or dig around in the
>   much much larger v6.4 --> v6.5 additions.  I expect it to be the
>   latter, i.e. digging through mainline, but who knows.

As expected, it followed v6.5.0 and linux-stable isn't to blame here.

> --assuming mainline introduced it, instead of a brute force bisect, I'd
>   look for merges by Linus from gregKH pull requests for the tty and
>   serial subsystems in the merge window (v6.4 ---> v6.5-rc1) and test
>   both sides of that/those merge(s).

This also largely went according to plan. I started with the tty merge:

v6.5-rc1~74:
868a9fd94807 Merge tag 'tty-6.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty

and did burrow down into the 60-odd commits within.  One complication
was that there were interim mainline merges into the dev stream:

$ git log --oneline --merges v6.5-rc1~74^2  ^v6.5-rc1~74^1
2076b2a4a6b7 Merge 6.4-rc5 into tty-next
0e4daea31d83 Merge 6.4-rc3 into tty-next

..which usually indicate a dependency on work from another subsystem.
Fortunately the test pass/fail boundary didn't land on one of those.

> --if things haven't completely fallen apart by that point, I'd be left
>   with a relatively small set of subsystem specific commits from a single
>   pull request which then could be bisected.

We did somehow manage to get here with just 60 commits to consider.

> 
> Sometimes in the past, when I've got down to that small set of commits,
> the culprit almost jumps out at you when scanning over the shortlogs.

While I didn't immediately spot the commit via the shortlog, extensive
test iterations did give us confidence in pinpointing a single commit:

84a9582fd203 serial: core: Start managing serial controllers to enable runtime PM       *******         <---- FAIL (33/1436)
ae62c49c0cef serial: 8250: omap: convert to modern PM ops                                               <---- PASS (0/1593)

> Anyway, that is where my thoughts are at.  But of course we don't even
> yet know if this "test" is even accurately reflecting the OEQA/AB issue!
> So nobody should get their hopes up too early.

I think now, we can say with a solid degree of confidence that the PM
commit gets to own the responsibility of causing the ttyS1 getty not
flushing the login banner and prompt.  Hence why I did over 1000 runs on
both the PASS and FAIL commit boundary.

Unfortunately, there is a lot in that commit ; also a lot in the
discussion and the twelve iterations before acceptance that I've not
even looked at yet:

https://lore.kernel.org/linux-serial/1431f5b4-fb39-483b-9314-ed2b7c118c11@gmail.com/T/#t

My "next steps" at this point would be to try and attempt to break down
that relatively large commit into multiple "sub-commits" in order to use
the AB test harness portion to better get an idea of which change
component is the root cause of the ttyS1 getty stall/seizure.

I won't get to that until Saturday at the earliest - going AFK after
sending this.  However, Mikko already opened a dialog with the
linux-serial folks a few days ago:

https://lore.kernel.org/all/ZSPQY6UYg21Z0PnN@nuoska/

Mikko -- if you want to take our pseudo bisect information (below) and
continue that thread; sharing what we've learned since, and also loop in
Tony (author of v6.4-rc3-31-g84a9582fd203) and others on the CC there,
that might be a good next step to do now, while I am AFK.

A quick technical note on testing - all my kernels have been built in
the same devshell instance, so same path, same compiler, same ".config",
same "test harness" from RP, same qemu, same underlying machine.  Both
Richcard and I have also found that loading on the host machine running
the qemu binary (ubu 20.04 default in my case) influences the rate of
incidence - an otherwise idle machine is less likely to show the issue
vs a machine that has other things going on -- indicating a qemu
scheduling component influences the incident rate.

Paul.
--

Note asterik "*****" marking suspect commit.

v6.5.7													<---- FAIL (2/188)
v6.5.5													<---- FAIL (13/1039)
v6.5.0													<---- FAIL (6/422)
v6.5-rc1												<---- FAIL (2/230)

v6.5-rc1~74:
868a9fd94807 Merge tag 'tty-6.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty

$git log --oneline v6.5-rc1~74^2  ^v6.5-rc1~74^1
e534756c9412 tty_audit: make data of tty_audit_log() const						<---- FAIL (3/266)
e64ed44bce43 tty_audit: make tty pointers in exposed functions const
3e540a7bad85 tty_audit: make icanon a bool
94f94810efc4 tty_audit: invert the condition in tty_audit_log()
e1488513abee tty_audit: use kzalloc() in tty_audit_buf_alloc()
777e456852f7 tty_audit: use TASK_COMM_LEN for task comm
a82d62f70854 Revert "8250: add support for ASIX devices with a FIFO bug"
27a826837ec9 serial: atmel: don't enable IRQs prematurely
930cbf92db01 tty: serial: Add Nuvoton ma35d1 serial driver support
e0edfdc15863 tty: serial: fsl_lpuart: add earlycon for imx8ulp platform
639949a7031e tty: serial: imx: fix rs485 rx after tx
e8cc334847db selftests: tty: add selftest for tty timestamp updates
360c11e2258c tty: tty_io: update timestamps on all device nodes
4903fde8047a tty: fix hang on tty device with no_room set
cef09673c35b serial: core: fix -EPROBE_DEFER handling in init
20a41a62618d serial: 8250_omap: Use force_suspend and resume for system suspend
f3710f5e9e1a tty: serial: samsung_tty: Use abs() to simplify some code
832e231cff47 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() when iterating clk
a9c09546e903 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() in case of error
d9f59caf94a9 serial: 8250: Apply FSL workarounds also without SERIAL_8250_CONSOLE
1eea99c04555 powerpc/legacy_serial: Handle SERIAL_8250_FSL=n build failures
52861a3be8d6 serial: core: don't kfree device managed data
b6c7ff2693dd serial: 8250_mtk: Simplify clock sequencing and runtime PM
643662d12bc2 serial: st-asc: fix typo in property name
66eff0ef528b powerpc/legacy_serial: Warn about 8250 devices operated without active FSL workarounds
2076b2a4a6b7 Merge 6.4-rc5 into tty-next								<---- FAIL (2/145)
49c80922ff81 serial: core: Fix error handling for serial_core_ctrl_device_add()				<---- FAIL (6/992)
539914240a01 serial: core: Fix probing serial_base_bus devices						<---- FAIL (3/145)
d0a396083e91 serial: core: Don't drop port_mutex in serial_core_remove_one_port
84a9582fd203 serial: core: Start managing serial controllers to enable runtime PM	*******		<---- FAIL (33/1436)
ae62c49c0cef serial: 8250: omap: convert to modern PM ops						<---- PASS (0/1593)
c53aab207622 serial: 8250: omap: Move uart_write() inside PM section
d2d4bd217ccd serial: 8250-fsl: Expand description of the MPC83xx UART's misbehaviour
1b997aef4f54 serial: Indicate fintek option may also be required for RS232 support
20ec397d694b tty: serial: fsl_lpuart: Check the return value of dmaengine_tx_status			<---- PASS (0/316)
0d07703be74f serial: Switch i2c drivers back to use .probe()
d0b309a5d3f4 serial: 8250: synchronize and annotate UART_IER access
25614735a647 serial: 8250: lock port for UART_IER access in omap8250_irq()
8b45503776b6 serial: 8250: lock port for omap8250_restore_regs()
87660fb4041f serial: 8250: lock port for rx_dma() callback
51e45fba14bf serial: core: lock port for start_rx() in uart_resume_port()
ca73a892c5be serial: 8250: lock port for stop_rx() in omap8250_irq()
abcb0cf1f5b2 serial: core: lock port for stop_rx() in uart_suspend_port()
b1207d86169d serial: 8250: lock port in startup() callbacks
0e4daea31d83 Merge 6.4-rc3 into tty-next
d5b3d02d0b10 serial: Make uart_remove_one_port() return void
6bd6cd29c924 serial: stm32: Ignore return value of uart_remove_one_port() in .remove()
72fc578b220c serial: 8250_rt288x: Remove unnecessary UART_REG_UNMAPPED
33e3b0eb7550 serial: 8250_rt288x: Name non-standard divisor latch reg
b334214ea08d serial: 8250: RT288x/Au1xxx code away from core
30c61f53fdf2 serial: 8250: Add dl_read/write, bugs and mapsize into plat_serial8250_port
98658ae8f392 serial: 8250: Document uart_8250_port's ->dl_read/write()
b245aa0cc583 serial: 8250: Change dl_read/write to handle value as u32
9d86719f8769 serial: 8250: Allow using ports higher than SERIAL_8250_RUNTIME_UARTS
db86bb6ed497 serial: 8250: omap: Shut down on remove for console uart
fef4f600319e serial: 8250: omap: Fix life cycle issues for interrupt handlers
398cecc24846 serial: 8250: omap: Fix imprecise external abort for omap_8250_pm()
b9ab22c2bc86 serial: 8250: omap: Fix freeing of resources on failed register
6d8c1fca0a6e serial: pl011: set UART011_CR_RXE in pl011_set_termios after port shutdown
cf9aa72d2f91 tty: serial: fsl_lpuart: optimize the timer based EOP logic

Baseline of tty queue for v6.5 was:
$git show --oneline --stat cf9aa72d2f91~
ac9a78681b92 (tag: v6.4-rc1) Linux 6.4-rc1
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Have also 1000+ runs on Yocto's v6.4.16 based kernel with no fails.

