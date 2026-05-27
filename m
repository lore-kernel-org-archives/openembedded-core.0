Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC436CD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20633.1779888936569859015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dHM6xpvp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8c3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YsxAZxnjn
	p98hkkDXFa7RedkbIumjnv7oGrO2Vycyhc=; b=dHM6xpvp5eCTM5l0ltk8bsHel
	UiPBfsyCDAuHtMs7mu9tcavGbWKFd4DdJGDj5H89Y87q7XGdiaT2LpJRNWem8/34
	L9bOsGe8zThEMVvbopGnpgjxsKb3NeXOWcahVBRkRdOvA7q/OqR3U2VOk0UM6xHO
	2AMKWzCZzVUvMH8Jyc03UgSKRpEfNKVDPDnTPSvv+I/+Xhd0X9dODd4MJsmOkq6p
	c8+ZBUtXjx3508opNaduQzJZpLfVQAyBWiKLxMoxkDwlGNnLJvrxdqHuBRdJD892
	a6bsCBa4kONf5DYRZ2sc0t/AfA2Xx3qpjPxBqUmmetohFGVeDFWJemYElwNWQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFK6v85zhIoMx8QHNqsD10PB3bC0VTidOdcIBbAwB6hYHk6zaviqDzYMUE7y7wbILia8tQcIFUC+bRimmJEmsjlcFyjZAFlHXFQ3Rcqi0Mx4twgpzVC7KeV1DYL720HYpYVFhRDKRB4nPTyEEqt7kD1Cl/CaHAc7rwQNMPaHV06GKUx5m1gRTKMRMnbCVi3mwJp0kc/gRlAuW8MGPnV6ha50FGWWYMN5+gD+gwkq/Aya/Eqw/WcH8s4zZq8qtwaAJ6Bc2mGNgGjNGEcpFKWRpCVHAn4N5Sh02V9V8ggiBSP3HdHGNcV6orNsIatoVsqZExcsDQ6OF4yA5uUmPxmPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsxAZxnjnp98hkkDXFa7RedkbIumjnv7oGrO2Vycyhc=;
 b=jYPT0kaIVWU3LP4euyIgUk9KodcWIurCW9OAwA18uz5TCDnTSI3dd+0KQ3Zc8ggZrZb6eglWvwGeJmgwHQPjl146mRHQbrKIa5U4GijyjeCXRJjbWBAJQ9PeU+WsvzSYD9bLhqrd0k9LTAbMdnY3a7Mt4Brz9vIT7qg5HLQAvi6ZV2p4gw4NNaaH+C+szqt8Wxx5xUzGYNqmH4h/A96Hc1mXFIXlfGOHUw225unOlYdOyRRa7mSvsz+yCpuA+eW8H06KvpOz0Lk9yXcH2EGzJ1fvJR6wPfkAPT/dZK1Gs3zBiA22uDqZKX3bo4y2YmFlM2IfnnjeaJLRxQH1as434w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:32 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:31 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 0/7] gcc: Upgrade GCC to 16.1 release 
Date: Wed, 27 May 2026 06:35:06 -0700
Message-ID: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdaa0ef-3f50-485c-0c82-08debbf4d2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|38350700014|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	gHp2WGDkiXegeBOecNPIursOMvGvp16SNgM3pw8gOHFOOGZSxmnG6NEbA32n3yXyqYXuXhggfgymcPyFtWdSiVWEAKJQ3lAH1Hvx5omk+ir5dUlWDUgoN7h3JDeL93yIZ8TAk44vuZuSwgx5UX3Mr+WyN7Cf4sikSBTLkmC5EEjqt/lDqRxjSUViYrG1dTDHS49dn8pWgy3tFf9UhTE6cUZRf9lqvuvrPft6gqKfaU39K2VeKnk4/VjXLR9BTwnyTvyoSxkqNywP4Q1M6EKMKabMWTQWocYjfI/a5RUHHZ1omUG0Yjj04SF6mtMqJyhEtANfsvfAvXwNajpkvyjo3VbG0IrioBlnSjEyf4gyssjfELg24wWPlh+n5YdcAuc1GBPDufaMyQ0k6tQTEYMSAtWD4si013k2HgTBrxXsgtVZKKvCWkZuSrwoy4xHSZ84GGKHC6rYxurzM+KBlZr7rtLKitjZAJw5vMt3e2awG496Wdu9THl1I9NCq742mLIEDg+eq0gcpf5s8HmHZ1xB+h/+059ASOomZPb1KXtofOHiaA+h1ujOP9Unh5UJdd6SQHH/aT8wXEFBT6n0b1tFWo4FO9XKnuL2V+77hOyR9o9POnzcRfOS8KcpPoI4tEPOyBj9ZQql3ZiAohWq522dnUoDH2BrDvJo7kKWcSxMwoCsossqQsB4j008+nPW8/nCTM5lj5Lfzku8baEobIyXxHBZATul87CqYn7iIfglB3kDZgYpDIOvIxcxoS0aka9v
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(38350700014)(6133799003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F5mWLmvRyMToGDFV2l/pK9odqmwo6PJgmz4yb9sGw4cM1qQWqkROYIBcYe6W?=
 =?us-ascii?Q?sYKNWUPlw6/641uR42LBTJKz/XnDF5e5xmEbiBc++GkUI1BUT85KirrwIaex?=
 =?us-ascii?Q?aUNP7AlcD7lL4FierSetd69w6Eu9cyHw7WbdTRqveXcyBhdFK6hEadvEIekf?=
 =?us-ascii?Q?ijjUw1lBNz6cDKbhxx4FML6zpsOPcD5Pc+Gl/renPHyX/jJTpQgW5yA3Ucjg?=
 =?us-ascii?Q?dOw7iWP7VC+/S+1uVYPQIg5b36PD04WTJuevMQf7DaIWIMRCxGnVsLMwVOJp?=
 =?us-ascii?Q?aBFKO4J+6HiCr7ELjvc2nkS4eW/P/Mf7ZkKpdk4wlMmmxS0Q5bBAUwvG9hop?=
 =?us-ascii?Q?lwP3Wves5v1Y9pCkJ7dvPa4DO6cm/C7jGl5ML+IrZ4GLt02o3OZySbHgFbt+?=
 =?us-ascii?Q?sEugsax93q+nps1K0HZgGulrgrw3yai1wBusNqp6UmRGy8gHSk+flEu0AwqQ?=
 =?us-ascii?Q?BcqSj++XR/7AwR75gIIQ9QKs9bJP+kkzqq33oev9trLCbHnYjmHv5ey61Z55?=
 =?us-ascii?Q?kljGbvZrkz28YNzvuzHshpRZPbAuUr2E+G+lOe6x0/kxce8a2BpzmclxmrCz?=
 =?us-ascii?Q?7z05v6DSL8iNtrUIlGxpk7tWmQ6DgpI34jed5esw8RUn4uydSSR1OU5I6PAr?=
 =?us-ascii?Q?KThjypfR3wCegWWF8M0uzDFj0wjXx+JCLVeHY5guCd0IXlkuijfY5FewUYgl?=
 =?us-ascii?Q?XHu6hvLZw/lJjHc3h5lAEcKk3zAeumo3EYDkMfNgGPfF8MEdFx4tlnvNwj3+?=
 =?us-ascii?Q?OabmhTd3aLxSXAjIJo30pSnme+1nU2FH9MaMIRWECm+DwInKD/Dy4IpU930q?=
 =?us-ascii?Q?dX91QIHe+B6Do15UZELDqPSv4TxK4qK4Q0BHgBkWB1RGXFgx+V9/kw96VM1/?=
 =?us-ascii?Q?Ze7//PBTvK165zIo6SbOT7k/2ceP21O9I1Dba8e95GWKNRZjMpQuij/E6c0+?=
 =?us-ascii?Q?tvm9IlU8AAuiibg9+8CaO8vXkAAgy5tHgJFE16hgT+fk42HVZwUmydzh19jA?=
 =?us-ascii?Q?gF4lCJnV0+/nmHXk79SpdpY7tRRmmhxsKsxntq3VAejeWkkHt3jYnbBvgmH/?=
 =?us-ascii?Q?bK19e1yZ9YWy/5NTCAAWFBFVeDpIwD7d+MPgvxaKbfesybhyo8DNQPwK+igm?=
 =?us-ascii?Q?dA0bS1VTBHetDFY4VWgzFNm5j2IU8aQqnb5EfjDiJELPl/ajni1Jc1E1Ceqv?=
 =?us-ascii?Q?0gCU7oTmCHXE86SLyxij1nh90EDKS7oKRX8x3zrXyDVfxlxpFXzw3F8yXZE6?=
 =?us-ascii?Q?eA9s5MDXHoG/iHEAvQfg3uKvZ8JDF8agdCKMqvQPSMzIJXzfPe+ueaSpqP9r?=
 =?us-ascii?Q?PaugqTV1SNfInL/9ET9RwfjWXxEF/u+heQthpi2aupfW/u16bhv7c5kBqOw1?=
 =?us-ascii?Q?l6xp3xMIYRZWpdNMhDfuGk+TaBOcNNPUzJHvH+spVJ6FFb6GilveRqN1QfJa?=
 =?us-ascii?Q?+ITgw+7nM+jt3FvKrVcAnpjEOFHxoveDrAh36eUPW8yIrrYJxQ5C0TE9KI2T?=
 =?us-ascii?Q?wvFShDoRdq/Fkx+0Y04JFN7M+xeB5O7ufvMq7DhAMHmb3pU9NkhYkN5FuIMG?=
 =?us-ascii?Q?uVnM8RHOuGX4cBRImtrUTrTBYiarDAf59U+nA/3A/qDjNIDjS/OdWW6NSbMk?=
 =?us-ascii?Q?tHX6BETYnv7KZe485EoZL9qWolB8MTG8i9r5PDunXGonWmqKrgM3es/12+3g?=
 =?us-ascii?Q?r9o5fbX+bb1fgdiHa7hKeCysSrLHJpO2cdOD7wWuAxmRersnUBvqtjhPicq4?=
 =?us-ascii?Q?GdmDwE+EbTnWiAbQKG+i+HU/SiWvZHc=3D?=
X-Exchange-RoutingPolicyChecked: 
	GU1By0Kos5Pk2ngfjV1YPXOQuuEr/t4RhDgCQGQmq1ywaXwWIxZPEw4WI+GlmnbPIe2KTiO9FEFIeUIPj2QLHl0qalc7pqHMm7B7nX/17/WnWSWtWr27DdY4er6ip8KhSA4hQBFTPIC6jaGMj+lUxP8xT4Vf3R4nkNzXz0iyTDnK/WNxDFgUsDvZFQCzTKu7bsDfXSyLI0CLFQ/TYQ5KzlRoWakuU4dPDtuxZz0DSpgLy2uHagDsBUmyfcFn3dK9MZNfK+wk2XaYaNzAR7TCm3B5N19kjYDwbUyWaJmfAmAfXEGEtTV5xMYnC7iq/ChpOfoiGz9i1iauUNOYuTXI1Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdaa0ef-3f50-485c-0c82-08debbf4d2d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:31.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5631Q8yOcDNqVRke62s0pz66SN9aYdKgEtwKXKGgfMdgdubZY3UuhsWEqLWIDP1OkI3lTUnWKHl4Hm7es7miETOQ7BMKrNR289NX84Mdi18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfXxV+wYim+M4v1
 SIxmGt6LUH2pTl4dS8iYaqL4jVfqwCPUhk15a4F23MbiT1DiCDPYbeDeVLUl/8g8BSGor5HsIwI
 4HOwcANTrSr8mFy/yK0+5Qjl+KeKHmaiDoiZ/4oY8iOmmmKH8knwDQEkr0VGnj/jkn5/yHJeNwe
 FxvnF1nK6w/Yqj99XL1Ik7Z5n+6ZwmxqIr8hVR4kBGyGjsSvhTOTlVkZVuc2w81Cd+m3BH7iUwV
 0zzh9a25gI2a+4KVK6hz1Rp/R/tQo3Jv9cwpqn5HYXckZLCmWfytqV7XOmCxjmrrVUioNW+2LrI
 fpwssyKkqgBakC+mcKTspzDTq/hGbbg88fIrIubtkBHWBAvAaUDZcVenwmNjROFJdKb8s9U3pfo
 3yvf0Fl/Kj0yRxML8Psj38VN5yL/y0SdZmDR1Oxe9yHgoAEoDGIbr3Y8Zrw1mJpj0IC/7oz4kCv
 Ai+7zuCPBZ5lIzSL8gg==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f327 cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=HNlJcesoxV9f1XXmrvEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1pbLSwf3nNbA2GVzkxgP7c1LpV125SFi
X-Proofpoint-ORIG-GUID: 1pbLSwf3nNbA2GVzkxgP7c1LpV125SFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237661

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This patch series upgrades GCC to 16.1 and includes the required
runtime and compatibility fixes identified during testing in OE-Core.

The remaining fixes from v3 are updated in this version with
toolchain-gcc specific handling for libatomic related changes
based on review feedback.

Changes in v5:
- Add missing Signed-off-by tag in 0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
- Delete patch files dropped from SRC_URI

Changes in v4:
- Use toolchain-gcc override for glibc libatomic linker flags
- Use toolchain-gcc override for libc-test libatomic-staticdev dependency

Changes in v3:
- Fix missing Signed-off-by in gn and gcc inner patch files

Changes in v2:
- Add libatomic-dev to elfutils ptest RDEPENDS
- Add libatomic-staticdev to libc-test ptest RDEPENDS
- Package new libcaf_shmem.a static library in libgfortran
- Fix gn build with GCC 16 on musl
- Backport GCC i386 ICE fix with -ffloat-store and SSE [PR125308]

Summary of patches:
- Patch 01: Upgrade GCC to 16.1 release.
- Patch 02: Disable automatic libatomic linking during gcc-runtime build.
- Patch 03: Package new libatomic_asneeded runtime files.
- Patch 04: Avoid passing MULTIBUILDTOP to libatomic in OE builds.
- Patch 05: Fix ICE on i386 with -ffloat-store and SSE [PR125308].
- Patch 06: Disable automatic libatomic linking in glibc.
- Patch 07: Limit libc-test libatomic-staticdev ptest dependency to GCC.

 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/recipes-core/glibc/glibc.inc             |   3 +
 meta/recipes-core/musl/libc-test_git.bb       |   3 +-
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        |  18 +-
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |   0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |   0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |   0
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  18 +-
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |   0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |   0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |   0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |  18 +-
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch |  78 +++---
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  |  40 ---
 ...6-fix-ICE-with-ffloat-store-PR125308.patch |  89 ++++++
 .../gcc/gcc/0027-gcc15-pr122394.patch         |  88 ------
 ...028-fix-gcc-libitm-false-postives-01.patch | 187 -------------
 ...028-fix-gcc-libitm-false-postives-02.patch | 220 ---------------
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ------------------
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |   0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |   0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |   0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |   0
 26 files changed, 176 insertions(+), 853 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (100%)

-- 
2.49.0


