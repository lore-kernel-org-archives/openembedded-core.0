Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E5CC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 06:26:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5088.1748932004859329846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 23:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8249809aff=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5533kVdV016119
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Jun 2025 23:26:44 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrkm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 23:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb+8iukqTcPFW6W7gygwrYj2D21tycakAt10T9VLsEscXpGP4JC82Bht3Q+j1Qnf47FghJF6DihbrmtqOA8lWhmF+RKfG4F80DOjDRuh91Mn3QFT6jgdT137sNZjPiK6DUVuUM33MhaSwDfpWWujo2URx7At52JD5WjVykh6c+5Cj3fpR5IA1Eq3vgTHSeC0PJok0oiDMGDXDRSIpXpag5qKm920wehrpvgPNmH7BhQ+TgkzIfzZNrjJp87d5E7RiFyKHNRN/3GPo4LxXv+LpdLk3ZK1y27YQC4nLqmbAw9/xnX2NQvI5BNrEDkBlD8bMxSZrO0ZKu2PaLtbEZh+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdBBUd1Z1Ay0jjvLtH5ruDqbRD5ce4TWM7ChMnTOJOI=;
 b=RUmtcM+tK48OHJRHW68rBUuyt+DzhWZjX3BDHIbMKkVqyH0QAd/kXM/UUEOqpsM4ktJRPPpQL0OZfYUqv6t8409zn87dVaNTFfET54rU83ToJ4rEfU0cEODjfiThUbSaAVO+c71UDAC3ZEcTly1soXpCWZ86VIGlmNE246nmRwfKE0kTf11BxfJEjf7iD442aauinyYKmQog1/sZVYoffKANElGBHwNy7vLcurfOA8XcZkPUi396sgpzlVEWEs1qoNTSgrics86eKVlcArZLHx3pcWS7uxu9N4943UdBSMd2qZpGDgPaz8NWbNcbYAe2oltlKH7rxBZifq2TIvZyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 06:26:41 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 06:26:41 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH] binutils: Fix CVE-2025-1181
Date: Mon,  2 Jun 2025 23:26:37 -0700
Message-ID: <20250603062637.2915962-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:208:15e::38) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 72cce383-c324-4e33-8476-08dda2679a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/tzRfDIsiTlX+GbsKzJSxJGykmXjhKRYtrdgXw/U6co/fBnjM1LvZcgZS67m?=
 =?us-ascii?Q?LlH+yktQidIMtraNDNkVFJYACKz8h8OLhFgBGB4hzQQClDSXBimRAyS1W7Og?=
 =?us-ascii?Q?ueKjwRkJf5oS/dYxK5B2ldEv0njoDVHefxSAElVn6QeF2QwJC/dXU605qCvI?=
 =?us-ascii?Q?jfgGWSmwRjJXl+tjEalRmJBeO8LO1nnXQF7EOrMRVB7gaou9qJUjAbhOj3TX?=
 =?us-ascii?Q?D/KfP3BemQ8RU1uyeV79fUkB8Gs7MbdrtA+msrv0hpiJwJZH5K09QboGPZLW?=
 =?us-ascii?Q?+0qJYc2s4r9vLS8Dj0a5GEfMElj+/kNdpJhM5wXtayXziVgs5BSs/cTGEzu3?=
 =?us-ascii?Q?uQGOE6d2vAJrXZTINNhWBMYeghD0UZjBf5KjEGLfw7RrR21n/Gi0uSUeTPiF?=
 =?us-ascii?Q?lEUdzhd7ZTN9O8AzsdnLTqgP7l9JWVHZZclqBB3QTfJygSbU96YqhineG3WY?=
 =?us-ascii?Q?6fgl0K0RBOnIdAWxGq6UyMBh2hKF5h7g9OdSymRrFeUcJAftNudd3Etn3G2I?=
 =?us-ascii?Q?O+3YBB6VKK6mV2uBb8lDYH8tym+qZnkbHRz+CnFYT+dh+Z1IyYm1n6kKUw32?=
 =?us-ascii?Q?gKf+/HOAOJeswdYpP3Z/jDdnatHZvNSB911bnlA56Bo0a9c1qGmeZ+aNhv9D?=
 =?us-ascii?Q?Vy/qSlAykTnbfnkS4Qap4eUZZG78d/TemVmeOpoJTPdd9PhHXOt+ZbQJqyIQ?=
 =?us-ascii?Q?4ElhwOrbZKoU22ttW2qgnpcFZKlthxmPp3h+KnK/1Jj4FMdzPMb5OTFHYdD9?=
 =?us-ascii?Q?aAMV59O5TL/rT6xBxwDGJzhNEgHUHii0dxB/RYWotiRvPLIwqjBCDgZ+edhE?=
 =?us-ascii?Q?VsQprlUnM3NXpf8rTxgOG7Oh8AezjG/foo8I+LI9OAcz+tpw1hK7GUs2koVO?=
 =?us-ascii?Q?sHd54JFK26+gu0fAmcRgCLpqqRfy7mxnpXQytK6SbmGphYwHAvtw4G+S3FDj?=
 =?us-ascii?Q?M4l4nGmCQY8BrXMXFP2V/OSpWte0BDcYXKYzAUSq+FuMn/wZOCk/X/S/9W6l?=
 =?us-ascii?Q?gEayFOYu8ka+IJTM9CA+a9NYr2Uerjq4E4J5yLTNtadG5Mw+xoTdoWujRYOe?=
 =?us-ascii?Q?MqXFyyAZKZMJXU1GApG1k09XVPwjLpAttp6qcU68yuDXTTQ6nQkeKuweF1l7?=
 =?us-ascii?Q?Rz6Ms8pPdKMFGf8k21WEW3CTgWaUM1EtNdKcSZWXcAmklzNQrCyJsBgMJkUn?=
 =?us-ascii?Q?F5N+2jfP+/KM1DFMNW3CH6Rmz2XW/y9rznQhjgBuJbaJ4Vw3B5yVGptLHgOt?=
 =?us-ascii?Q?vABl5Db/hHkOGo7qJDBPBrddYas9htoV2KgyKSgkVeG2RodNJsxDU08yvpyT?=
 =?us-ascii?Q?tn5aqkxqE4A6WYRJPuvmoBWcEzZwgDXV/0bT6/VIauxyWnTN29R5NvrePM6O?=
 =?us-ascii?Q?NfyNRq74Unb6YDXZZ5ozA2sVpNzzFxsWanO22kyBcrdGphEtG6ytgvWl9d45?=
 =?us-ascii?Q?TY8zySWad0MisxxL/dmgLKYaFGvbeIa8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sPN4k/2fJ8Oc3U2GnVxBVFa3lLicttsFm+YsKjcf2NFa5YVsidKVGsrSi5CX?=
 =?us-ascii?Q?6pvyjW1ZgkY85IYke9Q0H84XQb4WuDysIYQ3QD6vjkOjiPaluBXw0fVjEnlp?=
 =?us-ascii?Q?oUiXdgeU1b8CiLRriheCxLRT9aFnt0EHiTv3X+C7E+Y5tdsKAdids5Y9FKzo?=
 =?us-ascii?Q?hdDl54ChjlTGN4XUUyV9G1H4VBIVeN3G6ekM02JsPyadV/094s0L74a0DOqs?=
 =?us-ascii?Q?q+O2jpGdu2mQkmeYKnnVpEshwetR6ZcHJy+2A3nN7qJAbDT3Yo+uYja+msYW?=
 =?us-ascii?Q?oC0B+h92FmWSp/iWDQG2Ph2XPrXNVErGp/2wPvgwCHS/YZKE4Fh2b+P/nJ/c?=
 =?us-ascii?Q?7JDbjYKOpBOv8quS4LMGqioewU/VUD2xB75Mj9Wamn7rQEKHBEiQ6Lnc11Ge?=
 =?us-ascii?Q?6MIHBuvV5A69PTTPty3kMvpW9ngxmXeT5ZIuHBzUkANIf13g1brc3pf/Vvch?=
 =?us-ascii?Q?31skZBTvVC8dzEC31O8lYv7v2BqruKeyHt/IWY31RWDHsOkYS3HuD+vgYG/z?=
 =?us-ascii?Q?fSo/xWMMgHvq+wLxWC4YccuyvEn3MBXx5kFH2yzLGuCKqJttAW3OHRPGXMhC?=
 =?us-ascii?Q?EWO0Flq0sxhESuwWekI+0/RnDZawfrW+V5KOTrv3UCSYi00PBiV8t5S3Hufo?=
 =?us-ascii?Q?i8Yi2v9aFs1RybwPs3YxbNy08w4lEDLJP/29WhI3cJl2XLSYFXEWROu9xCug?=
 =?us-ascii?Q?SXPANX44ngWOTxb3iuUxZEJddbzbS6Rc7EHcWl17NPE4a2D58aUn+OFGFvaF?=
 =?us-ascii?Q?XgHhGKrhQnHaWxj9tnEhrUWMysVa95aRXvI4SQU2CdZdj2LYgS1sXho9ZHZV?=
 =?us-ascii?Q?wO10Ni3dF77l5kCQ1DN3uSa96uGMYW4IjuRnda6kcpcNRIOtDY3FB5cnAZbw?=
 =?us-ascii?Q?/kZeiJ8x20OEYN+LyZ1meK1HcfMU1o8UFHgYQ51pJoP6iTup/tNbstKBs5/b?=
 =?us-ascii?Q?Tjm206H7+USLo93/cw4Cfhp2LUOsjWprCBEdFOU5Bk2CcM5mrmQtAbg1UD75?=
 =?us-ascii?Q?qq1tXNtOwXJ+5UyRIEvVQsP2QPHOouLG7BFlI62sEYQzBvB42aFy2ojGrigQ?=
 =?us-ascii?Q?G7lX+2fIOs2Tdci2Bs3MDo2qVjPzWy4Ws239ahH7EeeaQBhJLYfxQB8A7aHA?=
 =?us-ascii?Q?fCSs9VWoO7yVZano0icoo9YJGjEPjdx0Bh1i7E+t54+FLspYoDAX/l9ZmKoW?=
 =?us-ascii?Q?hOkMSvvNmKMRqiy1M6PRd2wW3S+4m6CXOF1GiMVoaU5QAz37gKHLu6xvmHYf?=
 =?us-ascii?Q?VtVXILZMlmVle+Zioi19lpTbWN94vzpptp6Im+wGaTdn3yAdOnOQJEh3xL2Z?=
 =?us-ascii?Q?9oNMNxQyUlRNnuYb3aej1OL2oDVbS8tNCX07GNfvkTJTcsOqnRD2qXTdo8TJ?=
 =?us-ascii?Q?FKP05VHkWyrcIZGGUny6lvIoqlIuSyZrMnt8iLnFo4lrFzz+L7Eoo4x2JcsC?=
 =?us-ascii?Q?t2loGUABV7fwSq8oQmu0HLH49CWmmK5euJqt9mtYAr/JT/npO/Bn1fDnJDZ5?=
 =?us-ascii?Q?4AcTkRGA83zJZhS8nU0RHob98vlObHlNT5eruMGhmMzVNM/p7CBjaHlvbzH8?=
 =?us-ascii?Q?cCY5qwY5fbdjZeXfR4YmnnVC4745GZcWHBFOSs6xHrOJXdL7QOLpm2rPVWam?=
 =?us-ascii?Q?pdoArDOrL7NgQ5Bd8wEo05Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cce383-c324-4e33-8476-08dda2679a7c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:26:41.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajlm6K9UH+Z7DoZ0Pwrq7Jw+dAyv0ZkCwe6rl3DuQBfY2n8Owl1QqwNSzb7ZGmLp3wL4xlDxV0KB95Ac4zhPGQqKvpBAdtr6xAteX8arLtHeu7dSkVvcZDw9oGsVdBI1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1NCBTYWx0ZWRfX01wILmSLQILN zz1qOLShs3sACwc2pDaDhum8nNFWNZQpN7dr3p4mtQ2gFMKRA6LhCkwtxNIgxmcjZJLeUZKnXos SmXwKVe/aGK4qAWD+ZcmJJQMr3yRUBdeNG8rUOT7MGnXawaz7Gl6kUKfei8D/XXAB9ncCEQzQb6
 YH6heK8/UtiUUJQM7K55p3Q+pGFfXMYfcU/JlBNJuWnDxs9PXxzIQV5Lra0JowG4oh+ZbzBC5/X vniDRPd0uVpna6yTWbfEUU/swkMyqfZEHkliCevwMhdPPWPPgRFK6TmH6C4szLnwyMo2mYzbbyc G6V3jk4gg6w2Sa9yuSF3b4troQh97TWHbdqoYv19ORQlQNWmL3SFaTC90GgidKol4WI67U7mR8w
 U4MFWu/AKj7nusdz2c4VdwJXrytLaI3P+zooMZV9ya6sRdMljP6cve7Jy3DGH8FtAuEGYIeN
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683e95a4 cx=c_pps a=MluzuTSrCb2Jr8GzfqiGLQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=H4py6OZAxxsHHjbtlqMA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 143VWeXQO33OsEVzYi4-LvSfvgI8Lbvi
X-Proofpoint-ORIG-GUID: 143VWeXQO33OsEVzYi4-LvSfvgI8Lbvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 06:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217759

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR 32641 [https://sourceware.org/bugzilla/show_bug.cgi?id=32641]
PR 32643 [https://sourceware.org/bugzilla/show_bug.cgi?id=32643]

Upstream-Status: Backport
[https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=18cc11a2771d9e40180485da9a4fb660c03efac3
&& https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=931494c9a89558acb36a03a340c01726545eef24]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |   2 +
 .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
 .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++++
 3 files changed, 480 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 6906ab3efb..46a95838b7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -37,5 +37,7 @@ SRC_URI = "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2025-1178.patch \
      file://CVE-2025-1180.patch \
+     file://0016-CVE-2025-1181-1.patch \
+     file://0017-CVE-2025-1181-2.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
new file mode 100644
index 0000000000..d3709c7a4f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
@@ -0,0 +1,141 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 14:31:10 +0000
+
+Prevent illegal memory access when checking relocs in a corrupt ELF binary.
+
+PR 32641
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=18cc11a2771d9e40180485da9a4fb660c03efac3]
+CVE: CVE-2025-1181
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
+index 785a37dd7fd..d2bf8e5cbae 100644
+--- a/bfd/elf-bfd.h
++++ b/bfd/elf-bfd.h
+@@ -3150,6 +3150,9 @@ extern bool _bfd_elf_link_mmap_section_contents
+ extern void _bfd_elf_link_munmap_section_contents
+   (asection *);
+ 
++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
++
+ /* Large common section.  */
+ extern asection _bfd_elf_large_com_section;
+ 
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 32db254ba6c..2d82c6583c3 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1744,7 +1744,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+   bool to_reloc_pc32;
+   bool abs_symbol;
+   bool local_ref;
+-  asection *tsec;
++  asection *tsec = NULL;
+   bfd_signed_vma raddend;
+   unsigned int opcode;
+   unsigned int modrm;
+@@ -1910,6 +1910,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+ 	return true;
+     }
+ 
++  if (tsec == NULL)
++    return false;
++
+   /* Don't convert GOTPCREL relocation against large section.  */
+   if (elf_section_data (tsec) !=  NULL
+       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) != 0)
+@@ -2206,10 +2209,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_info *info,
+       else
+ 	{
+ 	  isym = NULL;
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
+ 	}
+ 
+       /* Check invalid x32 relocations.  */
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 1f1263007c0..eafbd133ff5 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,6 +96,27 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
+   return true;
+ }
+ 
++struct elf_link_hash_entry *
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++			      unsigned int                   symndx,
++			      Elf_Internal_Shdr *            symtab_hdr)
++{
++  if (symndx < symtab_hdr->sh_info)
++    return NULL;
++
++  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
++
++  /* The hash might be empty.  See PR 32641 for an example of this.  */
++  if (h == NULL)
++    return NULL;
++
++  while (h->root.type == bfd_link_hash_indirect
++	 || h->root.type == bfd_link_hash_warning)
++    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++
++  return h;
++}
++
+ static struct elf_link_hash_entry *
+ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+@@ -108,6 +129,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+     {
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
++      if (h == NULL)
++	return NULL;
++
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 8e5a005fd36..832a5495eb1 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
+ 	  goto error_return;
+ 	}
+ 
+-      if (r_symndx < symtab_hdr->sh_info)
+-	h = NULL;
+-      else
+-	{
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-	}
++      h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
+ 
+       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
+ 	  && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
+@@ -1209,10 +1201,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+       else
+ 	{
+ 	  /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  */
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
++	  if (h == NULL)
++	    {
++	      /* FIXMEL: Issue an error message ?  */
++	      continue;
++	    }
+ 
+ 	  if (h->root.type == bfd_link_hash_defined
+ 	      || h->root.type == bfd_link_hash_defweak)
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
new file mode 100644
index 0000000000..5af743582f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
@@ -0,0 +1,337 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 15:43:04 +0000
+
+Add even more checks for corrupt input when processing
+relocations for ELF files.
+
+PR 32643
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=931494c9a89558acb36a03a340c01726545eef24]
+CVE: CVE-2025-1181
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index fd423d61..91cd7c28 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,15 +96,17 @@
+   return true;
+ }
+ 
+-struct elf_link_hash_entry *
+-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
+-			      unsigned int                   symndx,
+-			      Elf_Internal_Shdr *            symtab_hdr)
++static struct elf_link_hash_entry *
++get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++		     unsigned int                   symndx,
++		     unsigned int                   ext_sym_start)
+ {
+-  if (symndx < symtab_hdr->sh_info)
++  if (sym_hashes == NULL
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      || symndx < ext_sym_start)
+     return NULL;
+ 
+-  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
++  struct elf_link_hash_entry *h = sym_hashes[symndx - ext_sym_start];
+ 
+   /* The hash might be empty.  See PR 32641 for an example of this.  */
+   if (h == NULL)
+@@ -117,27 +119,28 @@
+   return h;
+ }
+ 
+-static struct elf_link_hash_entry *
+-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
++struct elf_link_hash_entry *
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++			      unsigned int                   symndx,
++			      Elf_Internal_Shdr *            symtab_hdr)
+ {
+-  struct elf_link_hash_entry *h = NULL;
+-
+-  if ((r_symndx >= cookie->locsymcount
+-       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-      /* Guard against corrupt input.  See PR 32636 for an example.  */
+-      && r_symndx >= cookie->extsymoff)
+-    {
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
++  if (symtab_hdr == NULL)
++    return NULL;
+ 
+-      if (h == NULL)
+-	return NULL;
++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_info);
++}
+ 
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-    }
++static struct elf_link_hash_entry *
++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
++{
++  if (cookie == NULL || cookie->sym_hashes == NULL)
++    return NULL;
++  
++  if (r_symndx >= cookie->locsymcount
++      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++    return get_link_hash_entry (cookie->sym_hashes, r_symndx, cookie->extsymoff);
+ 
+-  return h;
++  return NULL;
+ }
+ 
+ asection *
+@@ -147,7 +150,7 @@
+ {
+   struct elf_link_hash_entry *h;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
+   
+   if (h != NULL)
+     {
+@@ -9105,7 +9108,6 @@
+ 		  size_t symidx,
+ 		  bfd_vma val)
+ {
+-  struct elf_link_hash_entry **sym_hashes;
+   struct elf_link_hash_entry *h;
+   size_t extsymoff = locsymcount;
+ 
+@@ -9128,12 +9130,12 @@
+ 
+   /* It is a global symbol: set its link type
+      to "defined" and give it a value.  */
+-
+-  sym_hashes = elf_sym_hashes (bfd_with_globals);
+-  h = sym_hashes [symidx - extsymoff];
+-  while (h->root.type == bfd_link_hash_indirect
+-	 || h->root.type == bfd_link_hash_warning)
+-    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++  h = get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symidx, extsymoff);
++  if (h == NULL)
++    {
++      /* FIXMEL What should we do ?  */
++      return;
++    }
+   h->root.type = bfd_link_hash_defined;
+   h->root.u.def.value = val;
+   h->root.u.def.section = bfd_abs_section_ptr;
+@@ -11611,10 +11613,19 @@
+ 	      || (elf_bad_symtab (input_bfd)
+ 		  && flinfo->sections[symndx] == NULL))
+ 	    {
+-	      struct elf_link_hash_entry *h = sym_hashes[symndx - extsymoff];
+-	      while (h->root.type == bfd_link_hash_indirect
+-		     || h->root.type == bfd_link_hash_warning)
+-		h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	      struct elf_link_hash_entry *h;
++
++	      h = get_link_hash_entry (sym_hashes, symndx, extsymoff);
++	      if (h == NULL)
++		{
++		  _bfd_error_handler
++		    /* xgettext:c-format */
++		    (_("error: %pB: unable to create group section symbol"),
++		     input_bfd);
++		  bfd_set_error (bfd_error_bad_value);
++		  return false;
++		}	      
++
+ 	      /* Arrange for symbol to be output.  */
+ 	      h->indx = -2;
+ 	      elf_section_data (osec)->this_hdr.sh_info = -2;
+@@ -11749,7 +11760,7 @@
+ 		  || (elf_bad_symtab (input_bfd)
+ 		      && flinfo->sections[r_symndx] == NULL))
+ 		{
+-		  h = sym_hashes[r_symndx - extsymoff];
++		  h = get_link_hash_entry (sym_hashes, r_symndx, extsymoff);
+ 
+ 		  /* Badly formatted input files can contain relocs that
+ 		     reference non-existant symbols.  Check here so that
+@@ -11758,17 +11769,13 @@
+ 		    {
+ 		      _bfd_error_handler
+ 			/* xgettext:c-format */
+-			(_("error: %pB contains a reloc (%#" PRIx64 ") for section %pA "
++			(_("error: %pB contains a reloc (%#" PRIx64 ") for section '%pA' "
+ 			   "that references a non-existent global symbol"),
+ 			 input_bfd, (uint64_t) rel->r_info, o);
+ 		      bfd_set_error (bfd_error_bad_value);
+ 		      return false;
+ 		    }
+ 
+-		  while (h->root.type == bfd_link_hash_indirect
+-			 || h->root.type == bfd_link_hash_warning)
+-		    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+ 		  s_type = h->type;
+ 
+ 		  /* If a plugin symbol is referenced from a non-IR file,
+@@ -11984,7 +11991,6 @@
+ 			  && flinfo->sections[r_symndx] == NULL))
+ 		    {
+ 		      struct elf_link_hash_entry *rh;
+-		      unsigned long indx;
+ 
+ 		      /* This is a reloc against a global symbol.  We
+ 			 have not yet output all the local symbols, so
+@@ -11993,15 +11999,16 @@
+ 			 reloc to point to the global hash table entry
+ 			 for this symbol.  The symbol index is then
+ 			 set at the end of bfd_elf_final_link.  */
+-		      indx = r_symndx - extsymoff;
+-		      rh = elf_sym_hashes (input_bfd)[indx];
+-		      while (rh->root.type == bfd_link_hash_indirect
+-			     || rh->root.type == bfd_link_hash_warning)
+-			rh = (struct elf_link_hash_entry *) rh->root.u.i.link;
+-
+-		      /* Setting the index to -2 tells
+-			 elf_link_output_extsym that this symbol is
+-			 used by a reloc.  */
++		      rh = get_link_hash_entry (elf_sym_hashes (input_bfd),
++						r_symndx, extsymoff);
++		      if (rh == NULL)
++			{
++			  /* FIXME: Generate an error ?  */
++			  continue;
++			}
++
++		      /* Setting the index to -2 tells elf_link_output_extsym
++			 that this symbol is used by a reloc.  */
+ 		      BFD_ASSERT (rh->indx < 0);
+ 		      rh->indx = -2;
+ 		      *rel_hash = rh;
+@@ -13965,25 +13972,21 @@
+ 		       struct elf_link_hash_entry *h,
+ 		       Elf_Internal_Sym *sym)
+ {
+-  if (h != NULL)
++  if (h == NULL)
++    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
++
++  switch (h->root.type)
+     {
+-      switch (h->root.type)
+-	{
+-	case bfd_link_hash_defined:
+-	case bfd_link_hash_defweak:
+-	  return h->root.u.def.section;
++    case bfd_link_hash_defined:
++    case bfd_link_hash_defweak:
++      return h->root.u.def.section;
+ 
+-	case bfd_link_hash_common:
+-	  return h->root.u.c.p->section;
++    case bfd_link_hash_common:
++      return h->root.u.c.p->section;
+ 
+-	default:
+-	  break;
+-	}
++    default:
++      return NULL;
+     }
+-  else
+-    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
+-
+-  return NULL;
+ }
+ 
+ /* Return the debug definition section.  */
+@@ -14032,46 +14035,49 @@
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
++  if (h == NULL)
++    {
++      /* A corrup tinput file can lead to a situation where the index
++	 does not reference either a local or an external symbol.  */
++      if (r_symndx >= cookie->locsymcount)
++	return NULL;
+ 
+-  if (h != NULL)
++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
++			      &cookie->locsyms[r_symndx]);
++    }
++
++  bool was_marked = h->mark;
++
++  h->mark = 1;
++  /* Keep all aliases of the symbol too.  If an object symbol
++     needs to be copied into .dynbss then all of its aliases
++     should be present as dynamic symbols, not just the one used
++     on the copy relocation.  */
++  hw = h;
++  while (hw->is_weakalias)
+     {
+-      bool was_marked;
++      hw = hw->u.alias;
++      hw->mark = 1;
++    }
+ 
+-      was_marked = h->mark;
+-      h->mark = 1;
+-      /* Keep all aliases of the symbol too.  If an object symbol
+-	 needs to be copied into .dynbss then all of its aliases
+-	 should be present as dynamic symbols, not just the one used
+-	 on the copy relocation.  */
+-      hw = h;
+-      while (hw->is_weakalias)
+-	{
+-	  hw = hw->u.alias;
+-	  hw->mark = 1;
+-	}
++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
++    {
++      if (info->start_stop_gc)
++	return NULL;
+ 
+-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
++      /* To work around a glibc bug, mark XXX input sections
++	 when there is a reference to __start_XXX or __stop_XXX
++	 symbols.  */
++      else if (start_stop != NULL)
+ 	{
+-	  if (info->start_stop_gc)
+-	    return NULL;
+-
+-	  /* To work around a glibc bug, mark XXX input sections
+-	     when there is a reference to __start_XXX or __stop_XXX
+-	     symbols.  */
+-	  else if (start_stop != NULL)
+-	    {
+-	      asection *s = h->u2.start_stop_section;
+-	      *start_stop = true;
+-	      return s;
+-	    }
++	  asection *s = h->u2.start_stop_section;
++	  *start_stop = true;
++	  return s;
+ 	}
+-
+-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
+     }
+ 
+-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
+-			  &cookie->locsyms[r_symndx]);
++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
+ }
+ 
+ /* COOKIE->rel describes a relocation against section SEC, which is
+@@ -15094,7 +15100,7 @@
+ 
+       struct elf_link_hash_entry *h;
+ 
+-      h = get_ext_sym_hash (rcookie, r_symndx);
++      h = get_ext_sym_hash_from_cookie (rcookie, r_symndx);
+ 
+       if (h != NULL)
+ 	{
-- 
2.49.0


