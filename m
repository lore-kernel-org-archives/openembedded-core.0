Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD60C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:42:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18347.1752658929733917937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9292e0fab0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G4i72h1306136
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:42:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva1pmn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:42:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9iw5JmiaorJnQ3je7/R/UvmcMsq7SW3rVHm6pK61UAz/GUdGAdA3XDfyBmVws4AkMkOgvXUDNKV2ofO0TnyEQHK1jeHH2k7aUXDcecBRJn1z0hQvDI2KI9NoX/zTAoTfQpsr51IK7W8JOTFGJxHlefLXA3SuK87B3GlbpM17gmOqHBk9Pl/NbdQnDB3p5OSTchwwrLISV8a13ls4jMLiJeT0kGWLvVHH+Mp2XyMdHiBCfoTP57ELwsFm96GeHvECXpyXFs9FSFHsudXrFNnZwt6Ox4nL7j7bH9EOKBl27v3kXVPyC+c+vd9iqdz/uUiCPLRIoV9P66SEI7DiN43IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNjeRZnyuNR5yggjMNlSHp9jydpEEVECgw9zvhpE9wM=;
 b=d+G5Y7x1sRsZZWRsXRx2cWer4ewMhdSJWMeLPi1Z9805ltYEkYhq6XyBjve8mkgk//ZXi+f/blbtIe5zltjlKNLOEyKzqqx4COkwjqY1mN9oAW7GWFH0gCiSSRIsMKt3PtzclcmZQPEy7vJKxE1PSwYpCeDSam89V86STBhE/REW8Q9ekkVzxEumRUkFJGivG9D85bFYKXcKLDUyoto1Tv56RLcuXap478NXM2Q4Q9xQ54xa0+finuUEkxthqEklFsZC9YtDiJes+CkvSIHrGJYkVXC47kKSAfunccCqOuiT4Rxm5u5Ry5pmJKhFEd1yxbhogiy753ITG3EvwW8lWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 16 Jul
 2025 09:42:07 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 09:42:07 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH 2/2] binutils: Fix CVE-2025-7545
Date: Wed, 16 Jul 2025 02:41:53 -0700
Message-ID: <20250716094153.1698390-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716094153.1698390-1-Deepesh.Varatharajan@windriver.com>
References: <20250716094153.1698390-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 49229b89-cba9-4747-c8dc-08ddc44d0743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lfEr27LwiFYOfxD6OqgDBTDSZpYQ2hfM+xw9tMzHWwwC77KTkb9XOdSDnBaK?=
 =?us-ascii?Q?9dTio094U5PEUCfj/bIofpevvMdR6yOsdctRLbs4qFMSlXBjdaVQ3wrksd43?=
 =?us-ascii?Q?VO1EV45jM0TmXSznIo8IRJ8lbZh1zL9jt4oljuLXh0DbsSJgggJaOx87Pogg?=
 =?us-ascii?Q?lxgGi+H+pvF0dEQsuoXZbRnoU4g5vTbFgWraf80JgZCcsLxY65CoLIFp0uWH?=
 =?us-ascii?Q?JCRg+Q7oyULM3iypX4w8WjOeu8ocrh6acExMgiQfUFHchTtRs5SpZCtB8kmg?=
 =?us-ascii?Q?Opwt8A+ZxH334tALsTtL1y44d9rzbE5T3JcSd923boFh207Gw81MGQFc/06J?=
 =?us-ascii?Q?LsEKcu2fenCdpbNM5FW2Ku0Jd3npHxgz4fRx9xrzDNPtX2Q+Ysnz/bwgFEAh?=
 =?us-ascii?Q?yr2bRXiZp37pXR+fhOTQpqYAt/V0R9av34d9Jc7pY+trde4WkNHcHltiRsMh?=
 =?us-ascii?Q?ObkdGVtvX+xtz6GDYBKsM3W5zOO08JMDWYl62ex0wNnZZEuXcMI7/M1Ijtus?=
 =?us-ascii?Q?cwdmkCEfGee43i3EC4FqwozOt3WiHUbsELWRfcuU4nU009rGv3sU+04IqPxL?=
 =?us-ascii?Q?miQDYL4pOUKINImPOax6YvNE87vkmkIflJJ2dAlIusPQfnixIq53Jpkf7gQC?=
 =?us-ascii?Q?txuPeKU4AN3MrW3+k5Su11b6PX6ba79MAgUNk8iUcOSwdHIiuCFO6La9429w?=
 =?us-ascii?Q?d+yXl7OP11cCjZLR4+fO3yGsajiYtw62NRAT6C54oNuYr0gi5N16QSIqDUmy?=
 =?us-ascii?Q?XYfRzHLIDWZ+LTbXgj0+jFwMZPdOYmb0nOBi3HfKMrZhHBxpNuzP/tTZNoMY?=
 =?us-ascii?Q?anE/kLWDtW2p741/srgczJoThVcr1ku4dDBkORPGDW6fVR34pGiZzeGkvZF5?=
 =?us-ascii?Q?/IuxWd0E1GtJjfMnm8e3/5Z2bfRt8YSCFZ346LVFPbW7lBmRt0K7qfAOndsa?=
 =?us-ascii?Q?RUZ8O7v1YViQWWcL2cwpT3BLYtRlg5IM+IR34YxvsBijKS2ixMWEdec719Qr?=
 =?us-ascii?Q?3VCQFUC41LmCF/zEdzrjBrYJiUPDBAncYW9HJyux/QG87TPIIEBLiHpnDsak?=
 =?us-ascii?Q?VroBribvzaCKiaCrN95lg6U9g3HEqQ1kJRkbIwWBQnG0LKZZaVJrRuV3a5mL?=
 =?us-ascii?Q?ube9GywEog7qWJtncZGe7GQR5RiEpEWf4i/YODMa99uoe+H1k4r9EZZfIAAW?=
 =?us-ascii?Q?NhZ2PcIl+ImiFxKoaVqWPWmiMHUHPrGX8ZnFWAPK+kyJp3POysDLPUwHXC/u?=
 =?us-ascii?Q?QcCv260/eeGHn7xYdR3nM7uJd+TUOLe2BHj9Fw6be4ocJrJc6uSjer/YMhVg?=
 =?us-ascii?Q?YFSDikTwqnbmhCg+d0EEA+x+nVRRX1UYcl9D7vFC/9cb10hFr9sYuBWtHEmo?=
 =?us-ascii?Q?PztPJdn9qBZGQ5yAej8FeWoLIyvIuZfxlNb/S+1WAO+ow/ka4JECzy0+DJrC?=
 =?us-ascii?Q?h9D73VOqD5hafH3+dTNzcvlz+c755W8N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fOvY7pgqad8qQ25+iQ963gKtq7U8hgUG7QxGVwRFxeopJjpjKqo5yj1ZlOp5?=
 =?us-ascii?Q?TrGB8lkDJjgDE8QSiki3OhRjwe7UBZBE1aWPuqVQafEbzIVpuXOqfouURwcj?=
 =?us-ascii?Q?ZXeGQs2EsPoOaz9eJ7NuuZIGxJck2g/mkj0ggDCUZgl0DJA03X8X21dfmts+?=
 =?us-ascii?Q?AeBhyVYzhl4okA6D+cocFaePjOU4aVUG3LaYGBBo2RnRD2DNncXRgtKIcXDi?=
 =?us-ascii?Q?euqUW1TKIqG6ybBGummjE6HKUvEgN/UkYPF8jqEap2lqre4JR1sr/ouOlDWH?=
 =?us-ascii?Q?We1N6ZPp8LAIt5Y/c3o4Kp2jIjLzADzvRogevOd8Nah6E3c2cLoONmWF1NyW?=
 =?us-ascii?Q?ZJRwrHbpTCV/PdNJV002oVVfgyhT1Qpwvw3Dej67pLycweFGxa8ph9F73r5w?=
 =?us-ascii?Q?xim5MX0SCHFv/QE4APQ7n5j4J71jEFywH9WciyeR/TjOUMTyNPD9uYyccBmZ?=
 =?us-ascii?Q?4tw14hTCzrt7sbIF9KlPt2q39+6+ybhfyh4XF7O3jjsnj8MC8LLOO9/TuUVo?=
 =?us-ascii?Q?JvArURbYb2lU53avYgriI8uUSLKp86UsA4kec/amchhscwCLFxCVTwnbLCX0?=
 =?us-ascii?Q?idgTwKKGQcQXkQLDSQxCpx6iSAv6JrEOhbSarC67Kc4OY1UjBYRot3qHUSke?=
 =?us-ascii?Q?+0NaqUzBw0eR/0sZOf7bmMC9vnJPjdnNEQS+Qi8Yf7QyC2HQblnkv8N1qRYP?=
 =?us-ascii?Q?Dg+2pLwFBbWc7LwBQdfFNwYLmDbkXE4QOgv56vXn2EHuXeVNQwJfv4XsrYm7?=
 =?us-ascii?Q?n3VCvJRbyGPdV35ZxLOr0tRDQaST1l4N71N/H8GXITvbY/5b/XujPpcYPvYQ?=
 =?us-ascii?Q?Jozu6W+UxRMwoOhawkgxbIcJtLNtgXJU9tvIuCNe2lcsK7LzoYNEZemDHsLK?=
 =?us-ascii?Q?iSEcp3f/Tol6eLcnjSTOGef4ZSO6OkGF1g3UTaz9d/6umedCQnPpEIi2xyiL?=
 =?us-ascii?Q?36u7XEO3SgKdzHgwPtyr1iQzI38A30u7SnWQEuTvp7+maK3rq/0Bq/vwi7qN?=
 =?us-ascii?Q?M76NtBqoqObsoIAnY62MfQXgfDpgfryNPo9B5CyswINWMduNeQ/P5LCQIidL?=
 =?us-ascii?Q?Xgrk+PrzGLZbR69RQTIlpPfvMiIN4ye0POAP3xFpRE/3uoqD6/FS6gdz1ZGC?=
 =?us-ascii?Q?ARpKvJhL8uvcpROvj2KN4Rb8705UyZ7Obk4e/o99mbKxvbTVZecp1DH9VZfL?=
 =?us-ascii?Q?orLf0ymMbR8DES9GDTjNDYpNkMZi+LxZSpO+Q4StCJ1BMwutpv53IYIIiLVL?=
 =?us-ascii?Q?zzP6/tTahyd1nqxFbwSQvXdH7hGxLReSxaF88TttCAtpG8iAMhuD36xAjdGY?=
 =?us-ascii?Q?HRKD1/7eCmiXC8py81ZbVNo8ttaEBGq+0NGvNFl+CTj+AMMfWKVMLSOZOPQU?=
 =?us-ascii?Q?voppTPFfMwftyHcPy7RMxn5ri6eT1jARjPN4USWcdXQp35xTaAiwqmQwFJBY?=
 =?us-ascii?Q?nmBR5g1rEVGEE+bmx/wFeapxFsse263jIneTUShKtUfMJgA9e1T0Az/J1a4i?=
 =?us-ascii?Q?E+9/NaNnnrzJ/lbwAhd1BsoVzk4POIkXzH2cmBpCc94sWJhWwnvRSZ3btOmV?=
 =?us-ascii?Q?XcgEdN5p553WzZKzsb5IlxjAaitCQsvPmNrwN46+u0WP8fXK6v7hqGdbS5Cq?=
 =?us-ascii?Q?Z9bXCbGvi4Iwpnz2lYb/B6k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49229b89-cba9-4747-c8dc-08ddc44d0743
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 09:42:07.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFGNoAxgnPHJbENN8uRKVaQk/0Dj7vs0lAPgdTrxpPMV0sxgCX+uAnrYBb95pWl2OQmckGUi2qEsS3b8oVdZIAjRQ4CW99PGs0sJv+hYAoTahjxCacGU2xs455bcdJ+W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=687773f0 cx=c_pps
 a=cwm4V9kIV149ZnrMCXrCJA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=o8x1PyFA2OIQ-l2cK8MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XnQ1TRaJ1EHLkrrf7oxMNs9nr7dEBdyA
X-Proofpoint-ORIG-GUID: XnQ1TRaJ1EHLkrrf7oxMNs9nr7dEBdyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfXw1+4kE62vQBh
 BAm+HM848wetG2zFHrH/SLWGnGU40Zeoffm6fBN0McinADBAXF7oVglZAvZmA782jtD2I0IYeWJ
 TxiUCk9zYzCyhM2bacDoElq9IfUT6zsrn47O/Ggs9v+YjvQMry7mJzNNU66tFrymj0wxA6AnLea
 ptOCOQqebdLuyeBfXbe5P7ywCrzboGCZKmhYC7p5wCe3XP9AcqP8CpupvGmHj3sO4dYH7BBa8/C
 rtlo2eOJf94OoYeKGra8Yhve9jJW6roNYRgr32PuBlHlwSf/gkH/jaCry0h75wLb/GGMuaq/dpn
 FNtc55o34P8OhnBe/eTeK/9Dqxbu4dFezJTRp5UWZBZN4O2y61RwuKgiBC3ki4th06xB9qPIeZz
 IFfP1AJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220442

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0019-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index a37f0bd27a..3d86942660 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -43,5 +43,6 @@ SRC_URI = "\
      file://0016-CVE-2025-5244.patch \
      file://0016-CVE-2025-3198.patch \
      file://0018-CVE-2025-5245.patch \
+     file://0019-CVE-2025-7545.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch
new file mode 100644
index 0000000000..062d6721b6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch
@@ -0,0 +1,39 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:36:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
+CVE: CVE-2025-7545
+
+Since the output section contents are copied from the input, don't
+extend the output section size beyond the input section size.
+
+	PR binutils/33049
+	* objcopy.c (copy_section): Don't extend the output section
+	size beyond the input section size.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objcopy.c b/binutils/objcopy.c
+index e2e6bd7e..3cbb3977 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -4634,6 +4634,7 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *obfd)
+ 	  char *to = (char *) memhunk;
+ 	  char *end = (char *) memhunk + size;
+ 	  int i;
++	  bfd_size_type memhunk_size = size;
+ 
+ 	  /* If the section address is not exactly divisible by the interleave,
+ 	     then we must bias the from address.  If the copy_byte is less than
+@@ -4653,6 +4654,11 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *obfd)
+ 	      }
+ 
+ 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
++
++          /* Don't extend the output section size.  */
++          if (size > memhunk_size)
++            size = memhunk_size;
++	  
+ 	  osection->lma /= interleave;
+ 	  if (copy_byte < extra)
+ 	    osection->lma++;
-- 
2.49.0


