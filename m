Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A77C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 13:09:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.133695.1692104945682845210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 06:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bjk8nOEq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7591478c17=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37FCAWWq031950
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 13:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=PPS06212021; bh=nlIyoURV49FiVTZetAp
	pyWG/KfQftp+mDpYuBTISqHg=; b=Bjk8nOEqCLBgPwBpuWBllasTgMi24zf4Ah6
	PRaT3mAc0t7yInc0o7TI2Z5VI7Qg8SmQ3wxFBq0/Ksc2TxfmptT/kOVwkrcz/5VC
	rlwrgrxExSy7wBtCqW2rk0a8n1EkBhlaKQj8wY2IMK9FCocUauJ63ThSbdgIMBKt
	82I7R54kpibjawyFYLPP2zEQxIzVbNGpMZZYJ1gx4HVyBCTjHdZTftAcY2+bUhHE
	0JmBWYVe1HlSo2BVOaXAh7NXUkwofCCyPfUzLxFuGeRVbMZAlQe5czxEdJv/Z+Ja
	29dT/cyUT9JmPABTvv8uVmOyd8+ZFGNqDedh7QC3+aL/Px1wStw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wauq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 13:09:04 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37FD94TB007280;
	Tue, 15 Aug 2023 13:09:04 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wauq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 13:09:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdf09alKN/78fgyhr+t4MFWRNMYQm4UJOq8eC4PaSwZMLbZ9PxyF+At1wJMuUH5neZQUuR5gptukN35lqeIFLzvvdwCIQnpiuSlTWQlYwdIXVOzs3SULbX7cMT+jop2LHEkCcPTYxjRgtjg5F2DInJnjmtZzjrcKJ0wHDjBysFJqypqSKW+YJCTNayjvMNJxv2tBS5lQhayo11LXUmPnk8MccUhUEa3rfJyNvaXsuRyjy/5+/zHIHCwy0gO9NFjhsPJ9pRD6bUqQj89Cg0TzXKbgdk6Hzdyr6xX6/GF3tk0Ie6T5UMGTZoQKYt3WZ+0NFHxQRXoOG4r76ue7x3ijoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlIyoURV49FiVTZetAppyWG/KfQftp+mDpYuBTISqHg=;
 b=Omips66lKuiI9rrWqLP8lMXZSfWyWIxd4rcUXEGrkG2gTY8pvPWop3E4jxks+XpMcKzRzHELK/hynbR0rtR++N3L2kzCKPTVtz6Rbwtr1EYp4gGo1QhZE2m3AriqNR8zrKZBtyVAww0fCChYX3c2fAMRvK2KdoZ7kgZbE8U+vzQ5W2WikgVWSLq59Uoi3O9WRhwDPcrvpAi+OhE36q94efDBMMvzg5uyiiwYE3SUxKI2SfWkqzhWEfSYCPWDLBh2+bCcUUS1+Xr6vlIXfsHra0QMz6QKeyyn4qjmWkwKXyXoFTWVUuNNiuWWiKNCtHOou38kRw9UdItshmSDrw5Ujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 15 Aug
 2023 13:09:00 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52%5]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 13:09:00 +0000
Date: Tue, 15 Aug 2023 09:08:53 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: Dilemma on changes - merge or not to merge (e.g. 6.4)
Message-ID: <ZNt45UVb0Ps/kKLM@windriver.com>
References: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
X-ClientProxiedBy: BL1PR13CA0448.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::33) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|IA1PR11MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e483b0-be15-447d-72a6-08db9d90ca92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q+Mvank0aJpeS/eVkelqsww/Q63Id9+QDctK+2Bq5x84nEUngeUs8MD7umMrCIfr3gZVTHRirSPDu3Frktmn8mc+WmDVix+WEzMx8hWrFia0h2CQK3Bfrge0RJHZbf3H/DJLObZjv22xoqIAUa/ChwhyV8cytthSUkKB0wONvtKpz5akxot5PxdL4nhLUxJKwQn3+PQO3tma324PP5l6fh1BKexzFeIdVJoSuYWBLZCDi5nuBJb38csRPTejoW1IvUAEBnomeIzF7f4Er4yWTHUrHxkebGTUhtNvei7Afj9FyEZRCsWkOIPlxMrkaWRTFtV/9SfhB5ddZlvuqyNAe1VSV/UDkF2QvTqn89C7rO++GWPnY2o8fZPfd0ctSA4OIcEeo/m4wh/hXwMMgleUU7LigMftieI4c3WyIjEpcIuc72L3mf+dQFQ3U/v/G59IRPG3nB7h38wzXEwUc+g/pBC1w+9OZWAuyvsz9klWL2eLJf6kAUeATEwPNlYwYdnYLiS67ZC7vj5u1SpmE8A6OCTOnzeGk0B7eVaw23mwYgw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199024)(1800799009)(186009)(5660300002)(66899024)(2616005)(83380400001)(4326008)(316002)(66946007)(6916009)(36756003)(86362001)(478600001)(966005)(66556008)(66476007)(41300700001)(54906003)(26005)(8676002)(6512007)(6506007)(6486002)(2906002)(38100700002)(6666004)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L42/iXNn4lwdeKmxmP38e1uRv7IIEHOYJYABW/h6Sqjpp+I+fB9g/roMlLZn?=
 =?us-ascii?Q?gG6Os3F1NUKANcjtedKw2lPmV76HQTVTx3fq66qA+yL0ACG1J+HmD1JgoaRF?=
 =?us-ascii?Q?BAGgbzsu7+mMxZu5kxFiH0DmTvI9SKat5zESbwt+dt0W5mqN1T55En7h2Upm?=
 =?us-ascii?Q?+vPcEQkf8NX/XDvrAiay3DPkwYcbBGgMPo+5rgsMZxMzvJtvjbkT11ecakzi?=
 =?us-ascii?Q?r6QSiEMiyZ72p4lsJXVVkK0PKWQNt1vdTO5fXFENoJRI/D8C1buYtEWD0Cdo?=
 =?us-ascii?Q?WAhClDvUgwBqDBPY+remVoO4fjrjxcM9XQ1+pLjTdHl2AUzHaLgg9CmEbhGS?=
 =?us-ascii?Q?VW8nHRGbkTaeozvtoSKygfx69zX/VS6ZlxDP6wZaleurfUoovkQdpANPi57p?=
 =?us-ascii?Q?qI1TAc84GyJnl03J9EuB+aLYom94qVUDxWVZ3yLUdT1BlzsYJ6Md5UHRRMCT?=
 =?us-ascii?Q?241T4J+Bx72/PKDxfJegEbNPpe/MNLOfkfRxWn0aAzMwoxi16le2rpnS/84r?=
 =?us-ascii?Q?qgkbPPKR5CS+D/S1juN7eQSv8wkKPpIDPcqaav2F/iwfKdjQuknDl1/AH/cz?=
 =?us-ascii?Q?YFqMja/ooNe4uVihPhjuOWgEh7Kwj0FZ0jl9gE6bPujkLK8oQRChjD6CbFM5?=
 =?us-ascii?Q?ylBVqSB3uRHK1XkiVDfVb/W+Hyc/pdT2NtaoElAOsYgY0bDTkf6UBjZcGYQk?=
 =?us-ascii?Q?ju2WSPwZNoFv5r2Vi5C+6zgBQDRyeHHFIjbmilN+hgv0oZshOsQTRMtfJspV?=
 =?us-ascii?Q?Q8443OsPasr7HushV8i1g8snOjRqHGoVGhyzE7r1lj9JxrsIGMXqyIaJkMrj?=
 =?us-ascii?Q?pDok6AfZfFd5bIoxzRpoqJZjxjiDtuViqCFp6R+naMb/ln7N4CNmGrqh+orO?=
 =?us-ascii?Q?gIDyMgRdYBTJPRV1692DAJcI4CM78mUXppHnd/xa6mjNDboZb7yomTjAmBeh?=
 =?us-ascii?Q?Bvq/P7JsiTUVmHk5pzNYBEGoWivUZ+JEe7erqHWKH7plcOxQzWOSEOs4Wjzo?=
 =?us-ascii?Q?3PeQWInxlO//XCYNroRQfD0S/7qIJzEdWRfH5shjSEU6ZrU2i7EdTiTA6VVR?=
 =?us-ascii?Q?wLuOCZf7C60W6if/juzriU3OBoPETVW2hnRU+U+c+f7Gq4V/kBuixnu1LUn5?=
 =?us-ascii?Q?r3ix6KA8kjHVEr9D1iZroKhqsy1VYMK6Wr/kbMuxv2lRuBraYAKfKSIUgJdq?=
 =?us-ascii?Q?HoHUj6ygGC7C9Z2z6OLfB+sYtITs+Xyq97rp70ew/MYVnHUDvodkTfYBb4yy?=
 =?us-ascii?Q?fHl2ismFjtn6a1xMCx9BOw1FFOS6b2UXl+NsBd1Ymi9Yhi2y0Yaz51XvPbZ3?=
 =?us-ascii?Q?4RSMRCaLzgH+yMlovdlHt2xZZ+WqLcrEC692k4NqOHr5XvmPfChVcT/VyPXV?=
 =?us-ascii?Q?gDvLmJlVsnkAIjXRRKM+b3ok6IZvWhDEsemeG1+Y39Oh/MO9br0ymXb9sE58?=
 =?us-ascii?Q?a1H0IhUqeHmLayYkVpWkIczsmO21sbG2Mhuo90HaZJI5DUuTHp3fwho0G/SE?=
 =?us-ascii?Q?pBuKy7Chsd3CrnGw5rf0PUe2K6PxRoLZXCs8yEDO3CISPefUSyDpaGH6ln3+?=
 =?us-ascii?Q?+UqS3KiBPaagK/1OKxvyNjgQNugurP5UbFJ169/40o2Tzon+CbpkPGm13OXL?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e483b0-be15-447d-72a6-08db9d90ca92
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 13:09:00.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5V7xyZXYb48LDWi3RKxxWWDCuQXIji5bwHghNRGw3XKUqaPJsOjI2TEGEAKPIlwnYMJTdtZuZD/Qlo3leiSYcGZ1eGzdlVQZkrAn0Cs43U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
X-Proofpoint-GUID: eYFMtGMtZZPC3Bi6Kdwp0R2XktWZnsJs
X-Proofpoint-ORIG-GUID: _xN7XCuXT5zx1qNzLTEDq2-ZAsa1ShSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-15_13,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=646
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308150116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 13:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186063

[Dilemma on changes - merge or not to merge (e.g. 6.4)] On 14/08/2023 (Mon 10:54) Richard Purdie wrote:

> I'm becoming a little weary/wary of some of the changes that are coming
> in. The challenge is that once they merge, issues become the problem of
> a very small number of people.
> 
> My current dilemma is the 6.4 kernel. People would like it, we'd really
> ideally use it for the next release but there are issues.
> 
> I've worked through a few, at least pinning down where the issues were
> then resolving them with the help of others (thanks Bruce, Jon, Ross).
> 
> Remaining are:
>   * an error upon boot on preempt-rt on qemux86-64
>      (e.g. https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/7616/steps/36/logs/stdio)
>      We'll probably just have to ignore it in parselogs as it has been??
>      around for a while and nobody seems interested in fixing it upstream.

Just back from vacation and I see an internal report of 10-ish at boot

  NOHZ tick-stop error: local softirq work is pending, handler #80!!!

..on the 6.1.43-rt10-yocto-preempt-rt kernel, on real hardware.  So it
seems we can't blame that one entirely on v6.4 kernel (or qemu).

We used to get (late 3.x and 4.x era) pretty common "NOHZ: local softirq
pending" messages even on common/popular distro kernels.  But I haven't
seen those for a long time and they didn't scream "error" or have the
alarmist three exclamation marks either.

I'll see if I can dig into that further.  This instance is new to me, so
any additional context or information I might not turn up myself would
be useful.

>   * some random hangs:
>      https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/349/steps/12/logs/stdio
>      https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/354/steps/12/logs/stdio
> 
> The latter are rare and intermittent, mainly taking out CI test builds.
> Most people aren't affected by them, find them hard to reproduce let
> alone fix and will ignore them. That will leave me/Bruce/PaulG holding
> the pieces.

Ugh.  The RCU one is ugly and the Silent Boot Death one is no better.
Nobody likes SBD cases.  They suck.

> 
> I know Bruce spends a ton of time debugging weird things just to get
> the kernel to the point we can even consider merging and nobody ever
> really sees or appreciates that work :(.

Well, not "nobody".  There are at least two people who have a good idea
of what Bruce does.  :-P

Paul.
--

> 
> Systemd was a similar challenge recently, multiple patches causing
> multiple issues with a significant impact on CI. In that case the
> issues weren't intermittent so resolution wasn't so bad.
> 
> Rust and reproducibility??was given a pass so the rest of the changes
> could merge for it. That just meant there was less pressure and the
> reproducibility issue is still there with people saying its too hard.
> That issue is now spreading down the chain to other recipes.
> 
> The toolchain test reports have thousands of failures nobody is really
> looking at. Similarly the now consistent ltp controllers failures
> (previously the reports weren't even consistent!).
> 
> I'm worried the access control patches changing the tar format are
> going to destablise and once merged, people will move on to other
> things leaving any remaining intermittent issues to me. Already we're
> seeing things like sstate being blamed as it is easiest to do that. I
> end up having to "prove" it isn't that.
> 
> There are intermittent ptests on the autobuilder too. I took mdadm
> ptest patches on the basis there was help to fix them. We are still see
> a lot of failures in CI from there. The glib-networking intermittent
> failures continue, I know Trevor has tried to dig into those but he is
> alone in doing it in code which isn't easy to navigate (and I don't
> know how to help there).
> 
> As an idea of impact, every time one of these things fails in CI,
> someone has triage that failure. The bug triage team has to triage the
> bugs too.
> 
> I don't know how we fix this but we really could do with more people
> able to dive in and help with these intermittent issues. I'm really
> really apprehensive about merging some patches as I can just tell
> they're going to cause pain :(.
> 
> Cheers,
> 
> Richard
> 

