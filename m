Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42833CD6E41
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19537.1779885868916233495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qqwSKvSH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8ndMF2633662
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=lfaODGE7i
	xytosOiyPXQ1TDA1ko+kKXscFDeKitA87I=; b=qqwSKvSHWeqPE/OH9pN5PxkO9
	QeQyN4mt6jGxbnbh8XRxPsMiDsYN/bi0HyzJk7kJJlwgMu65R1OZXUljVhAqOm4z
	QscgB1uYtOrBnd9BNj2lA44stcizLkuQrPlNbyyoKc9t5MLrhRo5e1VS3AhfN2TW
	o/XaLolQxyT5ISGvSr8gxOam4dSpmsVRzDumIiA6YNuMU/IU6JYkxfLB8jVjURLH
	onO5EW4iLeLkfADJTft4L7DJO2BACsBz+SLRn8Z1kXLoj2wCeWFn/gadfPzFmefL
	NVTByXHD7GGuSvQZxu2ratOuKWv3FNWaZ0bRxXpEOA2B1E0cScQmCGpM8YL6w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dvx5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPjOr5r0Vt55NdzkKEBH5SjKVjaXA3k89Bh/yFlQlPCCKNYX3pVayriogd/bIKDqWxCD/EI6zq+7fQlyxpnfOLjlz4mxUo0GNFQNESipOjin7VNiN48NhaonumsRsesu7KTBf4c6ljpISSRKG6s24ffVwh5nZz5YuQXUqflnl6bBnf/druVMea1thaFuRBMwqcVKpl+IKd11vv4V6G6GYAsmay7FprTZlRXwdJliUpS7ICcYHEjgV6Y0O/xdwplUyuUzMmxWhmySbSDYbPLFHDXCOdrXGXazOhse1GzDSGllALgtB+EkVKhD2KinvWqGLwl0ttQL5pGJkXpwx2q2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfaODGE7ixytosOiyPXQ1TDA1ko+kKXscFDeKitA87I=;
 b=CWAxapooGlRk25Bt/AQOOcEhfP83WJZsrQrlG46m1w++1Yu9Qx50nsQa+m10NozzJSnqEcAdq8V80zL3NaTLDo2TKVSqHasGBDUoOE+RwSm8L3U0qZ0W8FmoWtJEHL41SmLQ/6TVgI8Jg/1tf1whenZ8lejFesPcaHTIH/3q2kUGQDWXUcn0a55DBAEmULDxkxN9m5dDjm5KcAtOg6h8+IYMxGlxCXUrbcRR0noRKk3dmUAd2c5o8OzD/OWuifbA6mImKL7RFNVSBWiuMFh57OGN92pPX5aFvie3cR41XD9uOPbpWAVrpHNUfJ2E8Tv3sfYrlIWHIbVudxzWZh/MEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH8PR11MB9973.namprd11.prod.outlook.com (2603:10b6:510:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 12:44:25 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:25 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 0/7] gcc: Upgrade GCC to 16.1 release
Date: Wed, 27 May 2026 05:44:07 -0700
Message-ID: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH8PR11MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 31146ebe-3091-414d-7d24-08debbedaf00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|6133799003|38350700014|11063799006|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	PQTa3Hxt+V4z/veTJ3qdelJAgk+pHZghD5TV6TCMIKPZ5IvBcKqnvY9yDP+kFF+P827kLeEZEqAIJoZ9eVGMToSKEDmZ9UlveHm/TH1x9HiN0BT+Ll+2bV3hsYtbEzi2hfa/R/qMTzOQieIsXNjfMOMV+BfyM38AwCQVZHXEGp7MBSAFoy45Ha3Bpm0rom+kKECDYIitmv+45gScLGuRAp6bHku332vf6qvlGzWe0HKVAf2GjZVOU5hVKG+TNrKD1uLSgYep4N5jr86NZjcP8AOspJNpHVCrLQp+7NTq1uem/m+DrD1W6UW4horSJv9XDnEQ5RfE2k2DTg2JTonB5X8fl3zYXUpbIkBUf1Gxih9QGW9LiZJwUJlJZldBVBinv9Kse3FkYiupYiqGJuwv7f/KRdDGeyHIZVbua73Xi6REKNG+aHmlv5OLfNcv09TkvWG9MPnHgxi3fFIo3qS3MTbL/iPWdkWCu90ThoNZHjiWtLREgEODfoy3OW5p4bIx7Ss9c74ETt8L8DguUsCJlfbE+fz3ncrqqlWkHmZdXBkv7rs5AYcYPSqIa/ODHGWHAc+4X9o85kB/RJKDdJ9NWrmikPAHH4INXkKb2R3FW7gkA4yV7wmjNDQWju5C+CNNvNrNLxD2CfUHpi7LPZHSDuvAkVqT8Oah/x7fT7XcwI1FIUeqYq6RGRcAYu9ayK3rrKou9lgeP0KgMLuHhVKFwhahn0M0SQaHw2E6cZ+mNv/i9GAAlNmwn8ELOHUc0PyZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(6133799003)(38350700014)(11063799006)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XX2q784rHm2mGg4ViFJGhW5NAvs+frqDb6P8VwzjD43dSY3huQTevwGVRmVI?=
 =?us-ascii?Q?Mt3B4hF8/vWk4ldiNKZRGNqOpeuXIZvcAFTg3NTsS62SWEAYKKNjciLDwM6g?=
 =?us-ascii?Q?xdIWLc8dKN5s7fj3E3Ri7+0UsR9jdRBEpajJhtAmsmUgKyF4SqBeCrKXP+oF?=
 =?us-ascii?Q?X6QOCfv9AYyBKEi7ZQepMF5vG9Qtw6/A5Kb1j1xTrBAO/RLQ5xu8dyySHfj3?=
 =?us-ascii?Q?wsVWteUwSvG7A2EiUUM2uSeke9hFSbTiJ99UvuX76r4Sz17tRyy6UPFvWbQv?=
 =?us-ascii?Q?EBVdvvks6f0/3basnlKbrtp/JervvDflH8GfCBLNKAZnp5TkVZQV8AKA46R2?=
 =?us-ascii?Q?hsTioH5vHXs/sagZdJg+QPg4SFTYojfoffGdgPh4oDd9Pvl74JDgieHp5/C2?=
 =?us-ascii?Q?Rymr9ENQmMp/7iOr4g340xZZiSMaDFqxxZkPzI91INf4li3aO9bOl23e5a/M?=
 =?us-ascii?Q?Rs65Xrs6/XXH5v+W5mg4vga//5XG/pgu2f3YQLH6x8RO4blMppeMYL6fVvVi?=
 =?us-ascii?Q?1iYovS7XtrzyCD1E0pC1uJdP0xHOUx42WE8sY5ND+gUhOc8bHpqXGDrw4HS9?=
 =?us-ascii?Q?5JXxZHNNF+o80P0796JwgeEWWK9qeJNAvKACkLrnASBcOxsGZtzj6JSW/fbT?=
 =?us-ascii?Q?ZpusIZ5NJJFp0Me2MbYhBXctYXdTe18VOXmHk4eddXxTQzNRvDjjThkn9aSL?=
 =?us-ascii?Q?6Zn2IRiCSNxXdFajqZJHHUiR2O6ol1F5NQ4ob4oETe0qc+IgmTc8U7GcSDqk?=
 =?us-ascii?Q?5E+bn2B8sw5PSWVfrLH5Dj0digyL7Q/PhfUpAG9FzEPH8SCBLvmbt18Jhve5?=
 =?us-ascii?Q?rgYuuk2xl7EyPmooap7C8Vli0QlbzXw6xjy02uoGPODyjCCq5VuFkcFrNRfH?=
 =?us-ascii?Q?7ken5FZua8dqQtrJ/NB6a2OsyS6AJ9S4kuAlys4WROcOa+bDN7SqeNthbF4v?=
 =?us-ascii?Q?j7V3UYkw1tUb9PgUDP0EFq/nGlFrAz82nLDjlg1SPkNQzYQCaU4ArCcXhCPE?=
 =?us-ascii?Q?d1xEezfiyUaea6O0/Ln+alZR4y0I4K+ruZZEq3c0H0svkrzK9V/JfIV9bIDQ?=
 =?us-ascii?Q?jcznGr8ixYRie5Wug2Z2NDxcXaePQ30+r5lCs5Txsk4DrGPKNlTvhjPFaZnB?=
 =?us-ascii?Q?psEszQ4DqyA2C9Lt1Cy/uVDTQ5qgPaNAc6ng69ytdu8CWFPNDTOtX2Yo2PVS?=
 =?us-ascii?Q?9W73vC6Dk7HMkrHm3JuMxjzIECONZO5Tryob7SWGb75mbkFCYaeB/jP870Ml?=
 =?us-ascii?Q?Hx2w0ErKGvFBEGWBbua+gXx/IP8mkrY3Fsgm2mzKVt74tlCUOPMlJfqSUV8C?=
 =?us-ascii?Q?2BaoB2M+j9Vlu2WtvS/bficV2KCaZEMMWIHnWZz+0sOFniQVyDRKCC2FDihW?=
 =?us-ascii?Q?DuAR33KOE6I8wPn69X3eBpvECLJdh02wjI8CgiOt4oHJrHJVkAWdbVgo5APb?=
 =?us-ascii?Q?alR9wadTbEvnV/Acd3EVH8jm1Z5aaT2Wd4DmH5j8MGdxBfqDbjZtGJ8yxptd?=
 =?us-ascii?Q?hLTilO7rX3I0vv0m5V7HUvZo7dyvYR9YOqmWHJgODWUYHfVfk3gGhs8/puiH?=
 =?us-ascii?Q?rnzwZsWRHv5736dvORzZi7JfZhksp4VjpTpxwJUNeJY5CG+OxfDJu0012P09?=
 =?us-ascii?Q?gfMk5+uSvOkUb9OhNsDjxCTkHfwK5co//1Lf9WyXQLKq5oHcJQ7/18UPOtZV?=
 =?us-ascii?Q?lrTqAswAzhquYY8yEbZ8zyI9WeDrlA8hN0XF9hGurO7AkITCT+c8n84cKPeS?=
 =?us-ascii?Q?3UgqUvTsqT5QprphdH++3nxVDeEzcGY=3D?=
X-Exchange-RoutingPolicyChecked: 
	VibFUaOlD7Y9+fbsOV/iCb28vXGhBiIFJJDBgTzUK7SQgbVpyu44Z6xYbw+VjhIC6g7V5GSGAuz/vZ6d7g2DilvFy0bQdFG2wB/jmu3aKivLIwFiMB2RAW0KLk6o4+ETdRIhSvmrFo//jmipaKJXRPDf95R9E+kFOnKCOj2AMFn8WaZd2KSGPBsZuFCZgLRgonYZCH71i50ISYPipD8pZNLOlFQLLGpH50230ojpFS82O1KZqRbK55jfi5n+L5kZfH7ErJ0v1iCCaJm2eoiQHYYNko9cpQGyEAoGTZDHTirgPvXlOenv5jnr0X4wBmteOWQC676ZeSJsFhHsQouvvQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31146ebe-3091-414d-7d24-08debbedaf00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:25.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57kY4bnJTRhJVeimTfAyQnDHUfGOXl8R4HtUKnuW2TIbe9gF0Ee6MaMgf0Dwnky5syh3XZKAwYtVFBCzH30naLnkhiEs5/1OFgHGE0TLH80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9973
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyMyBTYWx0ZWRfX/Cfr99FxeY+O
 tnHa++IsrB57tQjV4nZ9GiaGlJuRxa469zU/szOkWkG+PZse/vgjS5blaiWOQh5S+A23QwQQy30
 faSfShKswgvfIcrNNkd8ZBX8VgxEfJC88UVxgLZRtvhdIDThzykADbXaP5HFgwBP/tzHbKnGIGl
 25XhHrlCyuOQoMfwWSZ3rAaTic+sfH3audIm4CCitJj8AgX9ayrOUJgDco8ByIeVeMsRyt37xIK
 32Eex1QVfd/F+pmamWdIM/S9Jwvz6P/cq3EOkwYzom9LB12mXFysf4BrmUap9NbCdbb90qIurVd
 0LHHFoJt3PBGx73CMPe0zuOSw6abfdRqy2iTHzNYiYGmI0swqjR51LzI/d3GutACsJbionXzmRF
 Jkzc5rfwG/MnoZKDZfiC9Cdg5EjTS9A6Xm+uqFfk9ur9wPPjkVJVkSVlEy2tf4brWPcoaq1Tw4W
 x1wk4HoHqWehIuSFtuQ==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16e72b cx=c_pps
 a=4QVYENZnsEoURNel/cbnog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=JpuZ-9DYC_qHTRhXKNkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kmTDer-JV8oVniF6u7QOm9FmcefhgfKG
X-Proofpoint-ORIG-GUID: kmTDer-JV8oVniF6u7QOm9FmcefhgfKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237648

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This patch series upgrades GCC to 16.1 and includes the required
runtime and compatibility fixes identified during testing in OE-Core.

The remaining fixes from v3 are updated in this version with
toolchain-gcc specific handling for libatomic related changes
based on review feedback.

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

 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/recipes-core/glibc/glibc.inc             |  3 +
 meta/recipes-core/musl/libc-test_git.bb       |  3 +-
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        | 18 ++--
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |  0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |  0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |  0
 meta/recipes-devtools/gcc/gcc-runtime.inc     | 18 +++-
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |  0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |  0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++--
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 ++++++++++-------
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 85 +++++++++++++++++++
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |  0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |  0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |  0
 21 files changed, 172 insertions(+), 61 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (100%)

-- 
2.49.0


