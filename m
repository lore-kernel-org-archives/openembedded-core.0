Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD8AC001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 03:22:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4452.1692328938467926383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 20:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lUguMMiz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75949d5f76=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37I2rAkb026335
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=PPS06212021; bh=29tcCI79pPHk9pVr+/5
	EhDxYdtwzSPU+14it/VYqxaU=; b=lUguMMiznYUbm8sU451YaYNVStgXKDo5p9o
	2xxUGaFu/OYxeSnRfqCVjD2ICSH78L8wrAHsbiTkI8gU2Jh1fwJPmDqS3mJJLh4g
	2K+XhCojyR7ZAFDLQKu9lH/t9fGYiFcVufALNRkoWiCb+cUDJK59itte9mrnJohY
	/jyeqfLLlSlE2steRf+nrUyaRPpGW7FIY3dp2b0zkXyYGO152lqxyz4r0DADB7R8
	4wXCeLPh6aYrimEJ9xxdTQRmddkopipCAiEuPWlY6bdtXV4K+W77sOfI7jdu7hG1
	g7cqg7xC4GxxZ49LQrHZcEp479B4EfUVAn+e9feBDj5TIGb+xrg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125wjm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:22:17 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37I3KpKB030636
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:22:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125wjm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 03:22:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoTYR+/0wwz610MxL5bx/buMu9P3g0caMTAWHKC6M0Aq0Ve7u6E4B2Yxf5VxCSwzjya+R10bEFK+8eaa3VF3Sw6UmG4y9Tk/Pa3VGhins5sELq32OMl5KkpjCtYo/qkTR3/LakVAhT0bWAxCgxnrX54DfIduZ17QvOq6kCWRQRVmbHVw7olmyaK2o0RDJCzO0IrW/SBUNO65znk2SFjHMqcLFD+dKslU2KQTzpqUuHHX9ndi8hxlRImbR57sfctw3/qJaOaMwtQWKC4WhiK/GO1ajwJNIAJF0/jL9yzqd50f38QyHNI/B9ZwQzgdHcbnMyq1B8pDyIXmizF+haWx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29tcCI79pPHk9pVr+/5EhDxYdtwzSPU+14it/VYqxaU=;
 b=kO/SqjRS91K1ge3y7KfcdAsSaTbyelcLxIziYeR5JMI6ZOoRNZ1ipNenz0HnY2YD+a/FS2Y60pUv3Xfo1b25YZb2JoZCNhq+aFioJO8f0tXtBvKls/iE6gIewtOBaiWFOKnDmOLSA9H0r1PnN04wYH0fj84x3xjx+YWT3aW71dynE5FB7PjJArcgPV45umdmOYH3IFvMrstGUL7Slul/0vd4WSPnEC42YyUPr1FsOuLPWfS94KmwcQV3wo0t/MUle17rMfpP4vdvLJQmAvmaNUqcQMIUzN+BwWsub3aCWAfyDg+/ZnmabbPZby1IEMZbkvQ3C3zj1h2ibNe2FMdqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 03:22:15 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 03:22:15 +0000
Date: Thu, 17 Aug 2023 23:22:11 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core <openembedded-core@lists.openembedded.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
Message-ID: <ZN7j425iXGBPbS5i@windriver.com>
References: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
 <ZNt45UVb0Ps/kKLM@windriver.com>
 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
X-ClientProxiedBy: BLAPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:32b::9) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|CO1PR11MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: 573a6066-0bf0-4b62-3ef4-08db9f9a51b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Db+ODmhh8q6GGWe/iJTeFcY0wNfqt9w6G5cbJ+WcralV/jWg5QxhO0Tc2wXCSvgG3zmRJUIJNJpERuQZMGyPSayE+ulgjXaM/+GvbKYUR602pgSyHNeoxkFY016BYxH9JMvR0iPpEeSmeDPyuWV3ILnL4YbvE8/E3TvWy8nBKTYa2BbocrZ5MBEmhdXpulN7/V5KVyd4IWHZqaA9wA1+bYF8YoXJ4vBgh/9FZI2f1FNSso19clAWnuoi2NTgvrk9TtJhWAQRkRggKR4H3TKF38WTzUv9UyH/Tztx64m3Tmthut5Br4UjVDv483364BlQsApS+Yl10yIItUcFb2MkBDhoaMeBCTnTny0jPs8JlFfM5jQ3mZySrIial92I2T9xCy7y0D/EBkHCu6cJwbna13y7dvDXwsCcQIYDs+FUt5DkpDzg34TDi8pkbfxcS2OxNQIImxBfj9qffPTQvWp4GfheWNa96SrlXNZNiGcnNwE12UrwSgwHeHR1wDWTtUEFndUn5mHA7PuQT8DjOzkXMFv0Z2ueADkl8wrPS0DWFq4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(39850400004)(396003)(451199024)(1800799009)(186009)(36756003)(86362001)(38100700002)(966005)(5660300002)(44832011)(2616005)(66556008)(66476007)(478600001)(6506007)(6666004)(6486002)(54906003)(316002)(66946007)(6916009)(41300700001)(4326008)(8936002)(26005)(6512007)(8676002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aLU9QTK2ZL8zAk1dXvQxX666xAK1lCMjuyZf4Z+U66a91vOAIAEZ9r+A+VPH?=
 =?us-ascii?Q?MzjmsHFG9G0GCQfXckkWhNTg62E7Q79U4ocGv9EqtozotW3OxD7l1PnGIqNy?=
 =?us-ascii?Q?sY6GdZaw53FDe+6WdmAhi0XpfOef5bsumVJAIso71/BraJMMt3fwD6RAuMtN?=
 =?us-ascii?Q?Gh8js0sZsj0D80br+ozK9GzLZouMulOmxkWqgXZmgfcI0Xi/QhfVfFwKETUq?=
 =?us-ascii?Q?u/BarejJMr3XbgG0tMKU4onk6S8crsLL8p91MXe4m4TkwxXi9IYso8xo4Q4W?=
 =?us-ascii?Q?wJaVJSwgXYugW202jOpxZshNtrCfFLKVwnWVvOGEF/O37pWTSHyKh9qxG43l?=
 =?us-ascii?Q?UsrY9Bmv8jLgg/sJCB5EMeDRtflKWwt+ihHf/94qdAmVqBvKklxMbSZBXCrC?=
 =?us-ascii?Q?yqAXkIFsm0jBXtwseWCtU/azSjcfjdlq/xMaT0Tl/+FDw8T2p8Ng7NvzBlcA?=
 =?us-ascii?Q?qyOFwiF5/C5mxFBz40sUeq7UuSvTCG3fH6Iuwt+Zrw5rUaAk51tSxtoJwUTy?=
 =?us-ascii?Q?qAaBeBC+LnHnedwMJ7+RK0f5Nus4GVdujjhXURQhvOyWvd9rJ3CL1Bc9CURH?=
 =?us-ascii?Q?5y/se9xnP1EmMNsW9wsV9mHZQ1pmiawPKlVpH7IlmVI+bMmV3tvOI4+34Q7p?=
 =?us-ascii?Q?ENOqJI5rpgFv9ajKSAS5QdjuyzqDwPLTy293goOrCSoGAkhYMjg90Y5XD6DZ?=
 =?us-ascii?Q?HK9li9Yy5mHtbYfsDptMv3LVk/q6uhvnwydBGIxMM8MeqH6zFVJBGOGEe1ws?=
 =?us-ascii?Q?tqQXQECJrWhkdP1Z9NPq1XFO4Z50Ogg4m6ZOyBZT7rfarbQWB40lnqdmgqeR?=
 =?us-ascii?Q?tkfxdIU28P40/R7/ORhxDEu9XxfTT5MRl9XQgeAUPopsFeWy8M5wIs/lyUoV?=
 =?us-ascii?Q?B4JumYmkSxGU3FNXd8YFtUTaQaLDp9dHehxxX2BBpjOVwAZrhGL7rx7GmQnY?=
 =?us-ascii?Q?3iPcRvxnWeSiMEVjL0Rj1KN6VyfLlK5lY2XxrGzO29MXfmlxZUpngIOAvv+9?=
 =?us-ascii?Q?5bIiDkaCnjYBlcezirmznlJPWis1k3TEIy4YFphXffB6Cy6y+8TlsH0o+fhI?=
 =?us-ascii?Q?C7j/+9XY1sfv59yq2QMdO/v4ya8GfJslounV9xS1vZ0A6gVH7AEUkhcaJGFr?=
 =?us-ascii?Q?Cdm7NhyxDRvlNspEdu88CrKAEpfGVT0K29DyZmHOUn0LrJYdEOYb28LKhHKp?=
 =?us-ascii?Q?MWtePDjxt6/CdxipnSGi2Uqg+DuV3HuUS4dvPq4ugdozEQirAEUKy0iYf/f5?=
 =?us-ascii?Q?lgfVDRctbHBhC3FnbCpPHy9qwTPI1AOoretkCUa4zrX2hphBNB2sT7JmKoPa?=
 =?us-ascii?Q?yjclZ4TmFEh7O8jfnAgZm1QWjRMIV+pfRVQCRUtUWdCkLJ1p7y//8WmfOADG?=
 =?us-ascii?Q?vdhnivB0gopz5Ulmdgp9JCl9HmwMXcSbcztWdrbcTBRtziEeqr1nPUIApcd6?=
 =?us-ascii?Q?NYofCQZ9qFpPPo8gV1CkzkaVpF5x6vioEqQlpIwrEUga5m5gDcVRcUZcrlNR?=
 =?us-ascii?Q?BrgfvuX6iARIdr2x9swJ32Iqifjq0hHLt2MGv1Pe6ogwL69mPjJ8w/j7T7GO?=
 =?us-ascii?Q?LyeSiGtUxvvKxlMRDQ6gg3nKIs7OV9tlL75yC3lMZgnf1KZLyaB1C7czeELq?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573a6066-0bf0-4b62-3ef4-08db9f9a51b4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 03:22:14.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8tz0opl8svFPk2g2XcGkm0XtbI5aXnqrmByMZ8BlgrBE2KMNx6hTb9BAsoAKD/3vf2DRbHo9b1injCGYhNLqsra2GbBGdKoep83k9Ujv4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
X-Proofpoint-GUID: BQbdgAlZyWNsM0vMTvXELHA9q3mVxP-Y
X-Proofpoint-ORIG-GUID: rinvYVpuvgSymFGCpOEzIB44BpWuP1s3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_02,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=483 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308180030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186344

[Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)] On 16/08/2023 (Wed 09:55) Rasmus Villemoes wrote:

> On 15/08/2023 15.08, Paul Gortmaker via lists.openembedded.org wrote:
> > [Dilemma on changes - merge or not to merge (e.g. 6.4)] On 14/08/2023 (Mon 10:54) Richard Purdie wrote:
> > 
> >> Remaining are:
> >>   * an error upon boot on preempt-rt on qemux86-64
> >>      (e.g. https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/7616/steps/36/logs/stdio)
> >>      We'll probably just have to ignore it in parselogs as it has been??
> >>      around for a while and nobody seems interested in fixing it upstream.
> > 
> > Just back from vacation and I see an internal report of 10-ish at boot
> 
> it seems to be rate-limited to 10 per boot, so it should never appear
> more than those 10ish times:
> 
> static bool report_idle_softirq(void)
> {
> ...
>         if (ratelimit >= 10)
>                 return false;
> ...
>         ratelimit++;
> ...

Amusingly enough - you were looking right at the problem.  Just a few
stable kernels ago, it was inadvertently ratelimited to zero.  :-P

https://lists.openembedded.org/g/openembedded-core/message/186343

Paul.
--

> }
> 
> (it's all non-atomic/lockfree, so ofc it could just happen to get
> emitted 11 or 12 times if the stars align just right...)
> 
> > 
> >   NOHZ tick-stop error: local softirq work is pending, handler #80!!!
> > 
> > ..on the 6.1.43-rt10-yocto-preempt-rt kernel, on real hardware.  So it
> > seems we can't blame that one entirely on v6.4 kernel (or qemu).
> > 
> > We used to get (late 3.x and 4.x era) pretty common "NOHZ: local softirq
> > pending" messages even on common/popular distro kernels.  But I haven't
> > seen those for a long time and they didn't scream "error" or have the
> > alarmist three exclamation marks either.
> 
> FWIW, we're also seeing exactly that "NOHZ tick-stop error" message on
> 6.4.6-rt8 running on a couple of different imx8mp based boards.
> 
> Rasmus
> 

