Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEE3EE499B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 22:37:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35.1692398220865397406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 15:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=djwU2RAB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75949d5f76=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37IMV6eH026258
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 22:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=date:from:to:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=PPS06212021; bh=LZkH1FtJ+R807UpKAuY
	non5FfzKNzUrbMrfYg2VT4zU=; b=djwU2RABb7BCIEOmAul9chxd1N5C66gwdqT
	8zQFEjie16GeRdmlu5n023vyncX7w6i4gagx1ajKGH2e4eE9BpD4EbFw2Ccun8Z3
	0lfOquiAlog4zCctLtd31nKJ5VsD7uR2kd6STzs/MwmWQHn/605jSvTDsV6zywjR
	o8LaMrnCZsOIR7GSfvh3hJwjhwqEvrNJ93ZCgHcBEBeEmKqxo3XzZR+lo/JcMNrE
	w0xqtv6Zgsy1fHPqvbHLsKSQ9oujtMmGKK9JGN/8IOMK6+cD6ERcrspdQKtKJzfN
	Y7Aspni4UdfZq/DvO80e4J0d67jYQbpeNEtCe7/VIUk0Cecw0QA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wedtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 22:36:59 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37IMY0nM030105
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 22:36:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wedte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 22:36:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7mch/Kb54kIKJ6TCvOpu1HuaVURoU/d8OLwGXQSPsPGJIqrrlzmb9BGBJfVC6WWGviv+7+D28Ue8IU0l0S8aNasHzdNUNmneh5H6w+34suS8/0lJoyJ/wxFkchcV3KEJ0I9A3wrRIY2FXDYqduzziHLAkXcmzXLW2R8FnNsbhtAo4cOsl777uW6Q+uGOfFHgfKgAhWg0F0XZB5bD5DFBLrMNkks/6I07ms5U7JtJLEvFQ6Db2UYmd4XmQO0w6SaDZt5miJurUlSx/iY0JSCHK53AaCXRNG29jQYDlGqieidxOaV3XSmDygACAZjkVTOrZ0TaofqgQALPybL5ggT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZkH1FtJ+R807UpKAuYnon5FfzKNzUrbMrfYg2VT4zU=;
 b=g68I9YZQlpbr6iNyfy/W1mD0vLQDh70bm/UWsbi5cmy2osvO31E4mjoJUu0bIH4BscpsM5P9Uex5ePYJRfH0eKuJjF1++qfn/SOSmwGefa9nusuqDzrjBPtCOz/nkaPPSf1efDSrrdIplLwTgQlzMPjMlQH7eKrazqNZL+PL3oqy45OwyfcDRk06eM1K+YPSz6GJvkC4Eo5SLSI6G6T17gQ6PJx8xIZG5k5IlwOq/oLKIrnQyCwZj2v9zmgJ1kXCoYYr6zdFczDf5sD+4NXrcHSJvGAAoh3ia657PCiupKfF3bDnHRiWc0TqqbLy/R4/LXiM3VOVipPfnBotvYKN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Fri, 18 Aug
 2023 22:36:54 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::16a1:cf75:23cf:6e52%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 22:36:54 +0000
Date: Fri, 18 Aug 2023 18:36:50 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][mickledore 00/18] Patch review
Message-ID: <ZN/ygrsJU3k18Vm4@windriver.com>
References: <177B9B269D618F2D.8497@lists.openembedded.org>
 <CAOSpxdbAToPehX6e5wdwG-MH8+8VdU0bMUU86C3Vi_sVNzdMcA@mail.gmail.com>
 <177C5BF219AB3C22.3047@lists.openembedded.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177C5BF219AB3C22.3047@lists.openembedded.org>
X-ClientProxiedBy: MN2PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:208:23d::16) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: b652e4ec-bb51-4233-403e-08dba03b9f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n8lG6DmmRoAg0VJjgw3dWnHsxglNCU1ym06sRD4Mg/a+51kSr47JJfQBarOSLvyJ8m68l47JjF189nCwGScw4MGznfAL4zE1hd3LHZu0hExURPO6FuQvFUJXYGCgbhGvm6Ye/bLkM/wezG45KF9pwt2iYstdFHGiLTXJbI/8SRkI59FRB2Wsi2WO4XcOAqvm1XQH0YUEoDig85R10XrXt8os+XTBuhB04K0oD53hGxb+Y2djcitRNY5dI0cfv++yDUKPjFp/rI7NQxO4kHEG0XSENUrpFkiTl8QA/Od6OKkiGq/YFFUAjXKIQ8UW8SMrxaUQ4WYR8KLmVPvGH1CmgfQMuNZFATvCkqBbVA1BrdO8jCNtNSBUEfDQAK3i7gQe3sHtNV8AwIkbsSWlmBvU3LI5jK0fIKSmbWb14oVsYby9oUElq3THsMVF+DtYYM6PamH2Y03UvWBn3p1Gk4yx54FjbnZRtoFWdL8Q1ZGOoB5kxcNClIKqMGE5UDbTO8QR/OYP+rKpGnS+wpEpnX4peuMQMAo3Xdp8yd1RZJrVPBa3hY/NFWos+TW4Zogqj+2Jf4SlaFQh89hzBfeRg5PiFg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(186009)(451199024)(1800799009)(2906002)(83380400001)(66899024)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(6512007)(36756003)(966005)(44832011)(5660300002)(41300700001)(66476007)(66556008)(110136005)(66946007)(316002)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qEV7P3h+6qDBwxnKve1iRufW/wE4hqbnNVZxUtrGmFcTYXiqXH05YKmrEe+B?=
 =?us-ascii?Q?xryoLJAQ6a2xS2YGDX0/35yF2Q9QyQl6btDm+FWmbDfUV14NnD8ch2btl/8C?=
 =?us-ascii?Q?rssA36u4WDk/heM+2GVsLTA1x0PwsFtZGsjChh5Rzpb2aDnFj8x2Ho3rE1JH?=
 =?us-ascii?Q?o8GtADeL8BH6ZSq4Yy071l5oaaXiWA3sBoEAlc/TCEen30Ar3r86M8LnFoGE?=
 =?us-ascii?Q?Y5xCV0V9Kc8tI6mo7lbTk2rnfH8KKK8z7jr/VlbA4+ClvBc7BJz9l7CMe6og?=
 =?us-ascii?Q?H4GpwvPIvHd6X6aRvo63c4PubqmTsgJuHUfMO4Dqb0c4QxvHHzie1AxjsRPZ?=
 =?us-ascii?Q?3ZLotVW6FgBmGtkIC03IlVxu+QlI6V/Z8wsVwvULV6MlvUQ189Fa/iAEGN7Y?=
 =?us-ascii?Q?W6id5giw7aIzGaNfyOL/yQXcmx8Z5CXMXtIGDhc2UDUbBE/0Xze9558B0sPI?=
 =?us-ascii?Q?oqKEXKz1s/MRp/rNnm602wtHxZNehZi8RqMDJr+weFhtUZpDGRrLT97HVMBQ?=
 =?us-ascii?Q?kOychaoYenTSzcob5jTQQESwt/KvTRyDr1/JzGKPbOJzPX9RAOIjmEGW9Dnd?=
 =?us-ascii?Q?H0L7ROwXKm/scrXBoMOHc6kExkJYE9nS4UqpVHVvCuBxShFqbbSFqO+NNuas?=
 =?us-ascii?Q?xYUOTZ5WmN93TDlPMqG7wzNkNiY/YnQHNYMkRHokijNvhyEFSFwJz36LDBTF?=
 =?us-ascii?Q?dmiluRJp09vS/zck4Vyh3jGM1s4aEy56+TpeJKmDIjGTi8BVa2D3UZI7cwQN?=
 =?us-ascii?Q?r8SbeEwuiyaCGm+aft9kkRi1Nu0grvSaqAExAf/xl4LvidLIl4MYg1YvJjbO?=
 =?us-ascii?Q?zmq+sXZjjAdPx0nhkdP3QJB4eDyspSec5ZRimyGExxPauXo7RDrUS8nVpcFt?=
 =?us-ascii?Q?8Z61zFaMCHL44oxGFxM+YqrpcybYhpj8KoZfxWU1vXsnfBF9oIV1HtWHlqnL?=
 =?us-ascii?Q?Txz1dbo20i1JI1qvgI2wc/OjFnqu8PGP0eH2NnwBuRQNgzD1/Yd01LwYgWHk?=
 =?us-ascii?Q?eu2fFblClKBWarnBnsyiIh+j92j1yD1xohz1WkVl0MBdmus2RkdVhcbVhe38?=
 =?us-ascii?Q?wGh0ArIvfvVuh7xUt1zmgy1MvEgRHrHob2+etHmZI/oc7iVXmZkTiLwiNukF?=
 =?us-ascii?Q?8mvHnSynKM2FRC2lywYgg5hbxdEbROT2jZN1EJE90f+hoGUMYXT2Dm0HMBMd?=
 =?us-ascii?Q?T4Npox7ZwSPGKISLdFLjLnnSZYPfuIp6Cw5vz6ZCF4uEXeul250ZhUkm2C5B?=
 =?us-ascii?Q?dqNNMMBMlRSZV/oNR7CL4m44r55rEfA2ArMYkIBiE39DS02mSwbDUyDCmI/x?=
 =?us-ascii?Q?B5Hd5ipQ+0bkyG54eTb5vjCWf485QRrUZxBxM8fdKv19a4v8PPw6xm6OIgFC?=
 =?us-ascii?Q?eUVsURTCKbFfEKLyqnHDESqrLWvdJGm3VEHXn1W0HHuhXeEE6xR/Mgt7/CY4?=
 =?us-ascii?Q?tNfpkER4hqJyp/QIVntctVWPC3wqh8ldb+w/KiAXfrvmiHv+htYez95QYK54?=
 =?us-ascii?Q?72BebhFGMKNajJC2wvjA1OtfkbpSYHFJfd0LmWHweYJOYKRpKbejyjT3Hiox?=
 =?us-ascii?Q?0hrzZ82+6/K1oG5eGjrpi/aVEhlA0iSbHux6rkwSnIYDCsXV1hxJxYgIBvRS?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b652e4ec-bb51-4233-403e-08dba03b9f50
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 22:36:54.0701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/JP8gbEIImN+bQhGCy/Gyzr8710UppPTe/0SNGJNACb5WtRzvCOpQ8rKzlG2vFrI8gzaZc8FK+EGfSNfj/89cxhn/HhYRT8KIhd6g96Jcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-GUID: vk1N2R3zj5v8PDGUvkBoCBkDy8mHzlf1
X-Proofpoint-ORIG-GUID: cxUfBDXymGHYrME1tX9eTrECjLsQUNFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_26,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308180208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 22:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186398

[Re: [OE-core][mickledore 00/18] Patch review] On 17/08/2023 (Thu 23:17) Paul Gortmaker via lists.openembedded.org wrote:

> [Re: [OE-core][mickledore 00/18] Patch review] On 16/08/2023 (Wed 07:50) Steve Sakoman via lists.openembedded.org wrote:
> 
> > On Tue, Aug 15, 2023 at 6:24???AM Steve Sakoman via
> > lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > Please review this set of changes for mickledore and have comments back by
> > > end of day Thursday, August 17.
> 
> [...]
> 
> > > Bruce Ashfield (2):
> > >   linux-yocto/6.1: update to v6.1.41
> > >   linux-yocto/6.1: update to v6.1.43
> > 
> > I'm seeing intermittent failures with these 6.1 "stable" version bumps
> > (issues are also seen in master).
> > 
> > So I am dropping these for now till we can fix the problem.
> 
> aka "NOHZ tick-stop error: local softirq work is pending, handler #80!!!"
> 
> For those not on IRC, the "cause" was tracked down to a v6.1.39 change:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/releases/6.1.39/tick-rcu-fix-bogus-ratelimit-condition.patch
> 
> [linux-stable commit ID 77cc52f1b8d7 in v6.1]
> 
> The bad news - when you look at that commit, you realize the softirq-80
> problem has been there for an as-yet undetermined length of time, but
> was never output because of the bogus/broken "less than 10" check.
> 
> The "less than 10" was introduced in v5.18, so that sets a lower bound,
> but I've not yet tested if the pending-80 was there immediately at 5.18
> or appeared somewhere between v5.18 and v6.1 - stay tuned.

For the mail archives - it turns out the issue was there immediately at
v5.18, based on my testing results. - I'm optimistic (for once) that we
have this softirq-80 issue solved.  But we'll have to wait and see.

If folks are interested, more details are in the commit log here:

https://lore.kernel.org/lkml/20230818200757.1808398-1-paul.gortmaker@windriver.com/

Paul.
--

> 
> The same change/issue 1st appears in v6.4.4 stable kernel [7fe63c29cb].
> 
> Paul.
> --
> 
> > 
> > I reran a-full without the version bumps and all tests passed:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5742
> > 
> > Steve
> > 
> > > Dmitry Baryshkov (1):
> > >   linux-firmware: split platform-specific Adreno shaders to separate
> > >     packages
> > >
> > > Joel Stanley (1):
> > >   kernel: don't fail if Modules.symvers doesn't exist
> > >
> > > Marek Vasut (1):
> > >   linux-firmware: Fix mediatek mt7601u firmware path
> > >
> > > Mark Hatle (1):
> > >   tcf-agent: Update to 1.8.0 release
> > >
> > > Richard Purdie (1):
> > >   oeqa/ssh: Further improve process exit handling
> > >
> > > Ross Burton (1):
> > >   openssh: upgrade to 9.3p2
> > >
> > > Sudip Mukherjee (1):
> > >   bind: upgrade to v9.18.17
> > >
> > > Yogita Urade (3):
> > >   qemu: fix CVE-2023-3301
> > >   qemu: fix CVE-2023-3255
> > >   qemu: fix CVE-2023-2861
> > >
> > > sanjana (1):
> > >   binutils: stable 2.40 branch updates
> > >
> > >  meta/classes-recipe/kernel.bbclass            |   4 +-
> > >  meta/conf/distro/include/maintainers.inc      |   2 +-
> > >  meta/lib/oeqa/core/target/ssh.py              |   5 +-
> > >  ...1-avoid-start-failure-with-bind-user.patch |   0
> > >  ...d-V-and-start-log-hide-build-options.patch |   0
> > >  ...ching-for-json-headers-searches-sysr.patch |   0
> > >  .../bind/{bind-9.18.16 => bind}/bind9         |   0
> > >  .../bind/{bind-9.18.16 => bind}/conf.patch    |   0
> > >  .../generate-rndc-key.sh                      |   0
> > >  ...t.d-add-support-for-read-only-rootfs.patch |   0
> > >  .../make-etc-initd-bind-stop-work.patch       |   0
> > >  .../bind/{bind-9.18.16 => bind}/named.service |   0
> > >  .../bind/{bind_9.18.16.bb => bind_9.18.17.bb} |   4 +-
> > >  .../{openssh_9.3p1.bb => openssh_9.3p2.bb}    |   2 +-
> > >  meta/recipes-core/glibc/glibc-locale.inc      |   8 +-
> > >  .../binutils/binutils-2.40.inc                |   2 +-
> > >  meta/recipes-devtools/qemu/qemu.inc           |   3 +
> > >  .../qemu/qemu/CVE-2023-2861.patch             | 171 ++++++++++++++++++
> > >  .../qemu/qemu/CVE-2023-3255.patch             |  65 +++++++
> > >  .../qemu/qemu/CVE-2023-3301.patch             |  65 +++++++
> > >  .../tcf-agent/tcf-agent_git.bb                |   4 +-
> > >  .../linux-firmware/linux-firmware_20230625.bb |  28 ++-
> > >  .../linux/linux-yocto-rt_6.1.bb               |   6 +-
> > >  .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
> > >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +--
> > >  meta/recipes-support/curl/curl/disable-tests  |   2 +
> > >  meta/recipes-support/curl/curl/run-ptest      |   2 +-
> > >  scripts/lib/devtool/upgrade.py                |   2 +
> > >  28 files changed, 366 insertions(+), 43 deletions(-)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-avoid-start-failure-with-bind-user.patch (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/bind9 (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/conf.patch (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/generate-rndc-key.sh (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/init.d-add-support-for-read-only-rootfs.patch (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/make-etc-initd-bind-stop-work.patch (100%)
> > >  rename meta/recipes-connectivity/bind/{bind-9.18.16 => bind}/named.service (100%)
> > >  rename meta/recipes-connectivity/bind/{bind_9.18.16.bb => bind_9.18.17.bb} (96%)
> > >  rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb} (98%)
> > >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
> > >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
> > >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > > 
> > >
> 
> > 
> > 
> > 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186343): https://lists.openembedded.org/g/openembedded-core/message/186343
> Mute This Topic: https://lists.openembedded.org/mt/100761429/6329300
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [paul.gortmaker@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


