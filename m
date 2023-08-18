Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EDDC05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 03:17:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4215.1692328654999982873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 20:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NlyqyRgF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75949d5f76=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37I2r0sX009615
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=PPS06212021; bh=xN+lG0ZpF+03tAFY3jd
	1wNkZVWwDTRlV1u3Ni4M4uzY=; b=NlyqyRgFp3aDPmTMvFRFyGd9ekl6th2TemT
	liMdnJj7QSz02LbBxITed1+ygWqYx8RbceGidl7dn/2cgrhRv5+5so4G4INHcwm0
	5NWyZNgEbsCo83GulVYC1/EoaaPyWJOJUPjLzS5oi98FN6Y3lrlFHN7mNp4SmZPR
	ElwSXVlZ2+UyJQ2MCbrnOL1Bx9naj3adyoG5QVV1/1D3xyFSzccgfHSmNCe0OSmJ
	KgPmJqBkPBSWMYtt8f38uYxhfaKu0slShDT9Qd5B/mlaojqaiEILtIUvOo9sqm3U
	0EhglqpEzvn4/YUQBT2RtG6/WxUso+ik9FGIXBkrK+p1jph5C2g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wdmac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:17:33 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37I3HXu6018156;
	Fri, 18 Aug 2023 03:17:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wdmaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 03:17:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjeyElwAXeiZc8qpQuXFQTYnR062qpKisVOZM11IAHWX/22LuxyvSr9O6eGlgfj1jzQ28eI/NoAfHdbkdpZvgAcKhVnDzGczn6pFWavqr+niqy7M430X3l11RZ64Zh6WllRSqMpqNW9cporp0oEilzo4y0tLikKC89clfl+gcoqRVuPUcWTJ4CrWjcsC8Oy3qIWy1jF688n6kjhwesTPDprlslm8YmGCEXeVvGRMFOu8O7UqRUzJtfKKQYtUH2sSDUGw6Oa0Rf7uCgNk2Qk8WMF0L3fMIciHF61b9/Qdudx3uFpgWtGiG0CB6MSTGxT0DxF/n4pBf97dCN7CoHmJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN+lG0ZpF+03tAFY3jd1wNkZVWwDTRlV1u3Ni4M4uzY=;
 b=EJdv9e6x8wIKd4I5U09FJEeIC58rg/2DWgXaG8k03yAxFvyMmCN+8EvgG9E+ZtmWuQGbjDiwFJF6TX60lFyFLbR0UEjIYuYM3ERB4iyFyFQAu2kYnpeO4NkMjfLp1iEC3D5yEC1yxvmn9HrHY1I4ooDd2tyq5Ct7+6BB7Fi0hjYOEUqcBTbJscsoyHwdDmJO9hZeUOq+XffIFEJJgASXNqbDIInv7ZqF6yTh2NqkBAPAHYqAxHnP5H8BTb3w9ANOVcCypcJm/3JBxxVbuXtogl1V9vleT6S1G3UJNslol2dq95CAGF65IT3hMiwSQShlWM2vEpBh+LWbMOrhQ5fO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 03:17:29 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 03:17:29 +0000
Date: Thu, 17 Aug 2023 23:17:25 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][mickledore 00/18] Patch review
Message-ID: <ZN7ixbmTKeTnTR4j@windriver.com>
References: <177B9B269D618F2D.8497@lists.openembedded.org>
 <CAOSpxdbAToPehX6e5wdwG-MH8+8VdU0bMUU86C3Vi_sVNzdMcA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSpxdbAToPehX6e5wdwG-MH8+8VdU0bMUU86C3Vi_sVNzdMcA@mail.gmail.com>
X-ClientProxiedBy: BLAPR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:208:32f::34) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|DM4PR11MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: 550802be-8969-449f-d88a-08db9f99a753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uI+XVmhQxG7iw1HE0TU6pyRHlMB4TrV0pvwrsTcPPpVByiJyweqMZKlqI8wbewQxrslngKJFtmljRZQw9xNAb84Fe2qaAI3JAmCUjEiXIJQj4UWi3zQDIFBgfPQO9KQ5fMnzgC9GfevvarGY8NunL2ebHpX484PvRDvGRb/LtVd80SwOpirQeP1pQ524iNo80lt+twwb8XVuR4Ha/n4YRS5H/LSP6AExVxoMM4GdZxx5g42ujy1yavIlaakHpDAKApWCFMITSWoUv4QEQE0+kgb0nn3BqNKQyhkSfcLvxaCkUCwWeaojOvNrfhYSpHBA4knVU4Ka1zda11VEnGKFPmEdo5TLCMhLy+ziTnVr0X0akQu0d9Ob3rktyJHzek1hHArTHCo7euqfu1lQAP8mRvvvaBhqwSFzLcicewhHym5PTG9p+L/yMZZ3CS9ZqwWLuYBq5PZamUpcOxFW899AhZZtuTNZzZYX+wC05oYMrwmbBNBhAyt7NyK++kDInz2tcV3PigioKcnydBBMlxuAzfP1UdgrTuqvKX2agNVSf/w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(39850400004)(396003)(451199024)(1800799009)(186009)(86362001)(36756003)(38100700002)(966005)(2616005)(5660300002)(44832011)(66556008)(478600001)(6506007)(66946007)(66476007)(6666004)(6486002)(54906003)(316002)(6916009)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(66899024)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hq2QaAnIdz3JbXvM07HnY25YTR3Q6fdHr8fUjTHAWE0ZJXkYZkw/8X7czcdY?=
 =?us-ascii?Q?RjtbYe5fRwwfLJ8Au544B7ABQ4NnwaoDreXxGHuGv5GrA7CWJH0ljolNigll?=
 =?us-ascii?Q?CiryTLXmg0HYtdFrWZIufFMQqr35eMuC4nxSmHeLizngkivrdODSeTyrxy5h?=
 =?us-ascii?Q?EjqsTk15/HrH8taJb2/+zHwzc2B52SM2yeniEt9S3Kiwdu5EXBwCcalmj3Gf?=
 =?us-ascii?Q?JpCJzvgPdwJitKyEhgmz464pq9a9VypeS+EVh+mc+0XFTrpbOQrZJcv6wTvP?=
 =?us-ascii?Q?osbWyMqhhzAf0g81Z//+89bVn3xBajGiGvlhsik+mNYxsm1XX+Y6oZPAYR9P?=
 =?us-ascii?Q?lBNhi9CfohLis5f+iPgc2vKZu4NE58+Exjs8wvZTBMtflwKaUQh9lrd9gMG7?=
 =?us-ascii?Q?mg+WL2gp0fYHccnJt9MQXT9fWzP9kFprho5Jk3xfLyRPWYOSnwOWRJx9Ua6B?=
 =?us-ascii?Q?ipiuz0IrpYr50jRkgdZop4vNtZ7AOOJcSRa0+iDJj3Ec89x/kBSYcCg2KJaK?=
 =?us-ascii?Q?hp1Yb2+cY9P/AF9suE2ymmVVCz6M9SzvUMYS7ielzISj0+sGJCtv457MRIp/?=
 =?us-ascii?Q?5+RXfX1oMoqKKPTe1oKvD1OPKXam7jl8DPp0mbGdosmaGslQ5evXP1UtBVaf?=
 =?us-ascii?Q?k45H6OSuNjY1nOQWhp0iP5cPciz1mfmYQMXsBBKwgkfODWFQ0rI7bqCv29Sp?=
 =?us-ascii?Q?bD+jCFMmChxuidMw6Bd33iIlHib2plmjUgMnlTOKTNmUMtgQiy+imnFk73Nh?=
 =?us-ascii?Q?sWAO/oh4JL/IzItrQpGwZKt054EUoQSxCLtkL8e91rPSwU99R3DFwMOkDeQz?=
 =?us-ascii?Q?UPOdIsGqWMmXk9J0Os4E0iMSiQ6lYb+q5ZO8EkLO1Fjf8k7HNLzgYcnU4u5F?=
 =?us-ascii?Q?vuGA3AXCtyKxJbyG3SWeGr/q94FEOPFAiSjBy7oD06We7B2P5ueOKWJg7Mdi?=
 =?us-ascii?Q?/Hm2zmgH1NUFVy7en6P0vd7+y35D/YPohajDmEC8minltf4z5oQn2lwES7Xn?=
 =?us-ascii?Q?1+1opVfB+MosliseE6J51NX2l0ZnHX4e3YJIxORJ6WCFJ8juPWhfR0JIQmpf?=
 =?us-ascii?Q?vsrGqMJWR9MKufO4lCN7shmM7Khnlt1rvV5hNJla9mr1+DFkSkycAia7peQw?=
 =?us-ascii?Q?V/hbs3J/uBs2cv59nwNf9H2WyhOEfD+TL/i34umyPSM9LCaCNHLi+RsSD4tI?=
 =?us-ascii?Q?zdYD8vNLlmmb6zCl/daRNMvyyRepeTxYMRNa/+siGJfHG/hs0+vCIrtKRkz6?=
 =?us-ascii?Q?KVoxtlQcUJcAL9mJubkX4dDNu42ZngUveh8bTR7XbKTwP/gSVKX/IqSHUJmN?=
 =?us-ascii?Q?dIYVI2SJPeqkwKUySUoG4qY2Vh08NI6BPkf6oEMV62M/Trrj8ATH95XPWD4z?=
 =?us-ascii?Q?uGGZplhJpnDIhs745WxxlSUWqhNyh8GVsdncKNC9norZNSHFZkX4DFxmSqlL?=
 =?us-ascii?Q?Jdsxhmpegcl2AtFnoIFc5mQO0Qi3cMLiHeXRJiY3mFWI/2EQGg7cxmWho2D/?=
 =?us-ascii?Q?Ar3ILGDObjpW1wdj9QaFce00WQc1zrWjAE1dryUR+S2IFaVQVZvWqDhRdT3h?=
 =?us-ascii?Q?ImF/xS+PpMk+Uwargsyg6UiFq5quQTNE/6z3DxC/T20ww0mdQ2A22djaM0MZ?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550802be-8969-449f-d88a-08db9f99a753
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 03:17:29.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouS5swfizhlm7Il1oL9PMtOOQWZHKZNxZmPs0eXcGxvVnEHfdCayY7ZawxdX7YmqKeEA+3DDP71ObDA/koj21CN9X2UZ1oIQ3dBcCIyCwUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5341
X-Proofpoint-GUID: qBi5dTfY2JAKYbEb45uIZCvGkbISqRjH
X-Proofpoint-ORIG-GUID: 3aJA2r-q9Qv9WL7Pu9i7pp79N9Ci1MPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_02,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308180030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186343

[Re: [OE-core][mickledore 00/18] Patch review] On 16/08/2023 (Wed 07:50) Steve Sakoman via lists.openembedded.org wrote:

> On Tue, Aug 15, 2023 at 6:24???AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > Please review this set of changes for mickledore and have comments back by
> > end of day Thursday, August 17.

[...]

> > Bruce Ashfield (2):
> >   linux-yocto/6.1: update to v6.1.41
> >   linux-yocto/6.1: update to v6.1.43
> 
> I'm seeing intermittent failures with these 6.1 "stable" version bumps
> (issues are also seen in master).
> 
> So I am dropping these for now till we can fix the problem.

aka "NOHZ tick-stop error: local softirq work is pending, handler #80!!!"

For those not on IRC, the "cause" was tracked down to a v6.1.39 change:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/releases/6.1.39/tick-rcu-fix-bogus-ratelimit-condition.patch

[linux-stable commit ID 77cc52f1b8d7 in v6.1]

The bad news - when you look at that commit, you realize the softirq-80
problem has been there for an as-yet undetermined length of time, but
was never output because of the bogus/broken "less than 10" check.

The "less than 10" was introduced in v5.18, so that sets a lower bound,
but I've not yet tested if the pending-80 was there immediately at 5.18
or appeared somewhere between v5.18 and v6.1 - stay tuned.

The same change/issue 1st appears in v6.4.4 stable kernel [7fe63c29cb].

Paul.
--

> 
> I reran a-full without the version bumps and all tests passed:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5742
> 
> Steve
> 
> > Dmitry Baryshkov (1):
> >   linux-firmware: split platform-specific Adreno shaders to separate
> >     packages
> >
> > Joel Stanley (1):
> >   kernel: don't fail if Modules.symvers doesn't exist
> >
> > Marek Vasut (1):
> >   linux-firmware: Fix mediatek mt7601u firmware path
> >
> > Mark Hatle (1):
> >   tcf-agent: Update to 1.8.0 release
> >
> > Richard Purdie (1):
> >   oeqa/ssh: Further improve process exit handling
> >
> > Ross Burton (1):
> >   openssh: upgrade to 9.3p2
> >
> > Sudip Mukherjee (1):
> >   bind: upgrade to v9.18.17
> >
> > Yogita Urade (3):
> >   qemu: fix CVE-2023-3301
> >   qemu: fix CVE-2023-3255
> >   qemu: fix CVE-2023-2861
> >
> > sanjana (1):
> >   binutils: stable 2.40 branch updates
> >
> >  meta/classes-recipe/kernel.bbclass            |   4 +-
> >  meta/conf/distro/include/maintainers.inc      |   2 +-
> >  meta/lib/oeqa/core/target/ssh.py              |   5 +-
> >  ...1-avoid-start-failure-with-bind-user.patch |   0
> >  ...d-V-and-start-log-hide-build-options.patch |   0
> >  ...ching-for-json-headers-searches-sysr.patch |   0
> >  .../bind/{bind-9.18.16 => bind}/bind9         |   0
> >  .../bind/{bind-9.18.16 => bind}/conf.patch    |   0
> >  .../generate-rndc-key.sh                      |   0
> >  ...t.d-add-support-for-read-only-rootfs.patch |   0
> >  .../make-etc-initd-bind-stop-work.patch       |   0
> >  .../bind/{bind-9.18.16 => bind}/named.service |   0
> >  .../bind/{bind_9.18.16.bb => bind_9.18.17.bb} |   4 +-
> >  .../{openssh_9.3p1.bb => openssh_9.3p2.bb}    |   2 +-
> >  meta/recipes-core/glibc/glibc-locale.inc      |   8 +-
> >  .../binutils/binutils-2.40.inc                |   2 +-
> >  meta/recipes-devtools/qemu/qemu.inc           |   3 +
> >  .../qemu/qemu/CVE-2023-2861.patch             | 171 ++++++++++++++++++
> >  .../qemu/qemu/CVE-2023-3255.patch             |  65 +++++++
> >  .../qemu/qemu/CVE-2023-3301.patch             |  65 +++++++
> >  .../tcf-agent/tcf-agent_git.bb                |   4 +-
> >  .../linux-firmware/linux-firmware_20230625.bb |  28 ++-
> >  .../linux/linux-yocto-rt_6.1.bb               |   6 +-
> >  .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
> >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +--
> >  meta/recipes-support/curl/curl/disable-tests  |   2 +
> >  meta/recipes-support/curl/curl/run-ptest      |   2 +-
> >  scripts/lib/devtool/upgrade.py                |   2 +
> >  28 files changed, 366 insertions(+), 43 deletions(-)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-avoid-start-failure-with-bind-user.patch (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind9 (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/conf.patch (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/generate-rndc-key.sh (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/init.d-add-support-for-read-only-rootfs.patch (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/make-etc-initd-bind-stop-work.patch (100%)
> >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/named.service (100%)
> >  rename meta/recipes-connectivity/bind/{bind_9.18.16.bb => bind_9.18.17.bb} (96%)
> >  rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb} (98%)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
> >
> > --
> > 2.34.1
> >
> >
> > 
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186136): https://lists.openembedded.org/g/openembedded-core/message/186136
> Mute This Topic: https://lists.openembedded.org/mt/100761429/6329300
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [paul.gortmaker@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


