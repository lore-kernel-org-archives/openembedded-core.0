Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79562C3600C
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 06:22:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43951.1743056527064339881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 23:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5181519be0=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5wYHV005249
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:22:06 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkd9k2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfECx52DaO4sPsn1o/O5fymVj9IVYja3kvqDA9yrvrj7Ir9HyZvLMansa4UreS3ygkbZNl2WBcaxG3YoyzBUQA+Tk2jZgJ8PsDZiHbgoj31tmxp+81FjW4pC41kE0K35YIIDc/dLOs8qolfFRK7yAKeTRjlpdTTOUyOyCSjL2amPvRAbKJrm8wdd01OM63FcqGR+CqxdX58C+qZ9Vd1bghLJR2Wr1uVRlusuhVmUBC9vFy4BYdCVwFOQalnNA20JJlq59kIoZ+sbh9YsVRIP/A52hqHclTXS7n/6hDnR25PjLFiNVAZl/gCHsSPJx9D4RVpRlRyt+mWngOuPCuoZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNPWF39HaYEBRqrkyfcublUQD6o17HDAZDR4jFEFsk0=;
 b=Beh1s0T608PzDozipHNKAJoOLIYMJhrnsIjBOTuOn2mLuU1oAlPvKSfe1WD5l471gRqecCEm4S2cQ/B578DZ/8OXeKXibKNmOpvMuXWtCHI8mPaX8gFjTg1j95Bj6XmJ8HhYFfnk3JTE0crmtuAcLrFAoGczkSInt1DEaitqqsR66pu3gEYtUmtY9lCTSErlMtzmPMVFRMk+c2VnDLyeK7wx4uJ5zC16wRHHm+1OsPjV8ffrG6GrqlFEBr19Pr0NTf5ZKejZbB4Jj9iRfw615ju2P2OJhQDIH8YmDCgggJtLYJ4Bv3LfVOGRy7Ncs45w7ZsRFp55Wdhn6TfqCdbsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 06:22:05 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 06:22:05 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [RFC PATCH 1/3] version-check.conf: add mechanism for checking version mismatch
Date: Thu, 27 Mar 2025 14:21:42 +0800
Message-Id: <2ade23315e080afec9b58e7dbb615b5e6d3262aa.1743052694.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743052694.git.Qi.Chen@windriver.com>
References: <cover.1743052694.git.Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: d78dd833-b452-4ad7-0a6d-08dd6cf7b0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Fs+0uWRPW7EKvaAsD/6xKCm322+5gAD5RBSKFgpiaXU5v82074VQcwEsntmn?=
 =?us-ascii?Q?S3MQF63uBmDdWFDlQrUJNs3I3J/IM5BMK1otSC/rz8SjRoD71quz/pbgqiiW?=
 =?us-ascii?Q?S0N7K6diTGwMBsQlmkP8ZttpQt2NpxMx5PAkpAIShLXWR5IWggrLY3iPA1gm?=
 =?us-ascii?Q?i3d36mEBlsXC0otYf8A2c+jEG/B7V8eCS80x+LjZ/hstMMaV287we6h28EdN?=
 =?us-ascii?Q?WBo/gEnEBnNLaK4W9e/D6hA7CPW78Uwm+F9vG6F80JlyNZkZNqtzseZI88Gm?=
 =?us-ascii?Q?Q9ToNa7FhAV/UkM3v91EV/negzrxAucYK0EFioGdSm6RvfexDYKR2nUinR82?=
 =?us-ascii?Q?i1gU12di3ZAXSjz4lPfoyHJfbWvfHPTV6YDvEXv2E8Bxs2CDZ9WnygHvSxdD?=
 =?us-ascii?Q?9VqKBIAxdhug2Nc9rBxqjPrAuvwOwmqrpch8PemoJj9Za4dmniRORApL+Jea?=
 =?us-ascii?Q?lqnNFlgmqgyhXFioSgNVREE169osUbeAv1ygEHR2nnS9dUg3iuQDQ3Dmt4vj?=
 =?us-ascii?Q?lvUrEHXL69sAVq4dvlkMLtH9+GrFoXLg8LodGwLhbG5RsuOM1xcTJpfMtMr1?=
 =?us-ascii?Q?4o4y/kKQhAvzxpAXTCmMDz2t3ur/ulN3bd1LMT9pLvupEr42cnmPtoQ7HM9H?=
 =?us-ascii?Q?7hQ+v4eBu3qJMi27QBYte0yhgzseqLlU51qQaIW7BeAtVEBTzGmuyXW/yRI2?=
 =?us-ascii?Q?ceP4farJOUA2NZnIA5/apC2EOYRzRysS2E4WISHqA83Z3g+ifX3ex6jU5iHG?=
 =?us-ascii?Q?TTAN3XU8+PYA9PCnC2GIQAva1P30PbMUc22pmHy+k8cn2m/69gVQip7aNqi6?=
 =?us-ascii?Q?KI2B+RAGILz893Ww3tdMZ6RExomcrze/Ffd+qu8wJbhbJP1GmLOSCz9FMQX0?=
 =?us-ascii?Q?Puau8iILp2wPi+MEMQ14fqkUj3z9mk+DenwVXoDMhniCClZHw/hxWJjm/G/h?=
 =?us-ascii?Q?enPEsmytO9rPlYgstlGUrDHcuv5FE2R9FqUQjBj571CwYSGM7a/lE4hveWlT?=
 =?us-ascii?Q?DixNi8ljl/9y7GON72xliALGSkkPeH2V8K5n/Z+BOxtdCZYRu85XAajyc48q?=
 =?us-ascii?Q?Lf3ZdoHjY8VxbVn5nOoKOgoWUoJDq9YmY+9FORng+8XaSd0H0awmcAPUDavM?=
 =?us-ascii?Q?iQCca9Kq3C1TP55hG/fVQ+ijkLghvuKwA1TNEbLHHXNgxLAULKuMiEwJkKrw?=
 =?us-ascii?Q?cNtEcEhhkfAR+NDflfh1lAbZrwNMdmVSYk1niJWA73lmqH9O3Oeuikkp1a/D?=
 =?us-ascii?Q?jsASD17pJcWxX55wY5T2UVWX45a6WQ+qNeFsA/Dy7f5NhYmUBd9gqMHxJIli?=
 =?us-ascii?Q?su9O5ko+aSb31t3JFe36n8FDnoLH6R00PLkauvcRty7xDJKsU/AI+Ua+vfRN?=
 =?us-ascii?Q?y4SRUmZBPHF+GzTp7CzQM2jdghtmMScn31lFAulJDODlYtImVyzBtHmR8ZRJ?=
 =?us-ascii?Q?GELDNtYHIqa+yRjUVadEIRESgd0Wp6Pf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+/tU6iOQaJpmSrTWrx8ECW+ZVG7HlKw7jTxZH+FjIhyU9Et76B4WeeBiuMEz?=
 =?us-ascii?Q?IXO1G3RYKoq+17efvVi9u8hFrPG4WxdjyYucTBUzdpoZUX5BoILlf4V5XTXg?=
 =?us-ascii?Q?k+lqbWEKKwhBqsbcuRkWzIIOy3SJxv4KXFnqs9LvniC8KWeVrlsDY8UGMaME?=
 =?us-ascii?Q?WWVK74BOixBx5lc0Kz67MgQB+KkrHuv9eqxHjRiiUMC0MOE3hglCmrNc7UJZ?=
 =?us-ascii?Q?dlVsyLHFU3LnMKUvMfeQBFonLguuC51OyybQWxX2ml3GmKJkJCN/wyXxxSxd?=
 =?us-ascii?Q?OWiZR0Vsrxiw+XaKFRwPj7MaAZ/jla+V8WfS17UB3wm2BRncsMD9GKR2SsGw?=
 =?us-ascii?Q?lQ+X4uSG44gy4MS1zntjDj5eDXMR2gVPNosTNUkepwJWUfvrYQ/SQataFMXj?=
 =?us-ascii?Q?oEYMu9N/QcYTtMhvFrMl1hIIeVTjURdGObMFA/P/3Wf93EK6qnXtonigLzLN?=
 =?us-ascii?Q?Q2wWZmirHzo/F6O8Z4VrV7vKwBO7R1Wun7uvG0l2F1S5rfILfULmbTWem6ok?=
 =?us-ascii?Q?Bw/XdRPI5+6wiVwgL29aFoX9Rvv1069izj8cGTbSgDVeb7ozH4O0ew9ra+L4?=
 =?us-ascii?Q?gwyYN6UUcxCgcu+TRVddbeDUJy7VHT2UkBFksV7a1C3+68ihAg6pXfeKVpTE?=
 =?us-ascii?Q?kTkesxlkB9hfMe/PfZRyjaGCrgApB3fsm1FYumOD7RR3oYLy8XwctcWR6mE2?=
 =?us-ascii?Q?upKeufdSlhQQ9SjDmYK1jAt8Ttck0yMmEkDY5zFXDCpmj3orfY97AdksJmFg?=
 =?us-ascii?Q?uGCE9H+x63jSFEBCaphEmLnWxnIo4LFyqaaOPK+lJ13QgUOA3ewHpNBDUVpL?=
 =?us-ascii?Q?toh2BKK+kmCaK9VfL7frb9eKcUD0N1plH+faCFZabszSBnOxARmqtUw+GXxl?=
 =?us-ascii?Q?IyHE13dvL3MJspMhd0w2T18RyIeCa7eD6L8rcsHXBf/zRhyia7qGJZfA1Aj9?=
 =?us-ascii?Q?zAKJ0sm7+s9rcjURTWOplBknzb98lUaQpYmEHH8NlvjP9DzZJZxIbRmIbk97?=
 =?us-ascii?Q?FVL4DyTf6JjwL235gqnY9Xi2TEWBbOe+mKS2Qo56IHT483V+2C7GI/grZRod?=
 =?us-ascii?Q?uWGO4fRmHhYByMK3qmRXrWKwXACeOeBM+MQE42/QV+43g7Axbgnhr8Jpy+B0?=
 =?us-ascii?Q?k3G5riZsNzlflva9hHbiDZmdmyNbo7leCrqgbgxqXa0QgssvDbOiqme8rioY?=
 =?us-ascii?Q?L2tuuwV0WipjdFnqWiAPQhoMXk+oSFK/pM8hodnDw6JYaDLPTgwovENGhPQH?=
 =?us-ascii?Q?ICL84kZYxJ0pSYBXL7KiPojsYAQlJEGT034Cx1a8jLYgsl40adG5ig1e0gTE?=
 =?us-ascii?Q?DCLfAKl7Twxw8inWClu/mDHmzVUqtiiyMc7rV1PrhB0FhEPhwZt3UeHz66+j?=
 =?us-ascii?Q?FkbgsiWPqbsBY9NGEv0xUjC/+6qfcOVgtOQG6rU3LlbFmjY3SwJlhVz1xMbI?=
 =?us-ascii?Q?VDLnf8oil8i+9xtc4Rqq6FuX74n5GksfGUWltT85r1RKdOwxCvz5Htmt7dNM?=
 =?us-ascii?Q?glGES0e/TVE03zctiHMKsCaTp0d/Eqr1tujVq6TkSwVex930bCW02gVxEzNI?=
 =?us-ascii?Q?Po1Y9qkdra47phF5kd+4npaPMoTHZGb4VS6GYQhO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78dd833-b452-4ad7-0a6d-08dd6cf7b0e5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 06:22:05.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnW16i2f5FEMowa8aamiOii5Gap6CuDPAQ9DG3HZ35JZdXvoQuU6V5vP3u3zTOsHtt3V7DQ2mY3tlCYVlcv4FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e4ee8e cx=c_pps a=FmV7mXqD6UovpQmy5PTGeA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=iX_doNFVrK8UyYuocnMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FlvMhtTHHdfi8u3j7owqFesjJg3Jt9ZH
X-Proofpoint-ORIG-GUID: FlvMhtTHHdfi8u3j7owqFesjJg3Jt9ZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213706

From: Chen Qi <Qi.Chen@windriver.com>

Add a mechanism to check mismatch between runtime version and build time version.

To use, add the following line to local.conf:

  include conf/version-check.conf

The basic idea is to use qemu to run executables at build time, extract
possible versions, and check if there's a mismatch found.

Python meta data and .pc files are also checked for quick match. This
is because such info are also easy to be checked by users.

check-version-mismatch.bbclass is the class that does the actual work.
A new variable, CHECK_VERSION_PV, is introduced. It defaults to ${PKGV},
but also allows override. This allows us to handle special cases in each
layer.

version-check.conf is the configuration file that makes this functionality
easier to use and draws some baseline. It contains some override settings
for some recipes. With these overrides, all recipes in oe-core are handled
well. All warnings are valid warnings.

Note that 'ps' is added to HOSTTOOLS in version-check.conf. This is because
we need 'ps' to find stale processes and then clean them.

The warnings are like below:

  WARNING: time-1.9-r0 do_package_check_version_mismatch: Possible runtime versions ['UNKNOWN'] do not match recipe version 1.9
  WARNING: python3-unittest-automake-output-0.2-r0 do_package_check_version_mismatch: Possible runtime versions ['0.1'] do not match recipe version 0.2
  WARNING: pinentry-1.3.1-r0 do_package_check_version_mismatch: Possible runtime versions ['1.3.1-unknown'] do not match recipe version 1.3.1
  ...

There will be a data directory containing all details: tmp/check-version-mismatch.
This directory contains detailed data for each recipe that is built.
If users don't want it, they can set DEBUG_VERSION_MISMATCH_CHECK to 0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/check-version-mismatch.bbclass   | 399 ++++++++++++++++++
 meta/{classes-recipe => classes}/qemu.bbclass |   0
 meta/conf/version-check.conf                  |  14 +
 3 files changed, 413 insertions(+)
 create mode 100644 meta/classes/check-version-mismatch.bbclass
 rename meta/{classes-recipe => classes}/qemu.bbclass (100%)
 create mode 100644 meta/conf/version-check.conf

diff --git a/meta/classes/check-version-mismatch.bbclass b/meta/classes/check-version-mismatch.bbclass
new file mode 100644
index 0000000000..fac24ad45b
--- /dev/null
+++ b/meta/classes/check-version-mismatch.bbclass
@@ -0,0 +1,399 @@
+inherit qemu
+
+ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
+DEBUG_VERSION_MISMATCH_CHECK ?= "1"
+CHECK_VERSION_PV ?= ""
+
+DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')) else ''}"
+
+QEMU_EXEC ?= "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
+
+python do_package_check_version_mismatch() {
+    import re
+    import subprocess
+    import shutil
+    import signal
+
+    classes_skip = ["nopackage", "image", "native", "cross", "crosssdk", "cross-canadian"]
+    for cs in classes_skip:
+        if bb.data.inherits_class(cs, d):
+            bb.note(f"Skip do_package_check_version_mismatch as {cs} is inherited.")
+            return
+
+    if not bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')):
+        bb.note("Skip do_package_check_version_mismatch as ENABLE_VERSION_MISMATCH_CHECK is disabled.")
+        return
+
+    __regexp_version_broad_match__ = re.compile(r"(?:\s|^|-|_|/|=| go|\()" +
+                                                r"(?P<version>v?[0-9][0-9.][0-9+.\-_~\(\)]*?|UNKNOWN)" +
+                                                r"(?:-release|-stable|)" +
+                                                r"(?P<extra>[+\-]unknown|[+\-]dirty|[+\-]rc?\d{1,3}|\+cargo-[0-9.]+|" +
+                                                r"[a-z]|-?[pP][0-9]{1,3}|-beta[^\s]*|-alpha[^\s]*|)" +
+                                                r"(?P<extra2>[+\-]dev|)" +
+                                                r"(?:,|:|\.|\)|)" +
+                                                r"(?=\s|$)"
+                                                )
+    __regexp_exclude_year__ = re.compile(r"^(19|20)[0-9]{2}$")
+    __regexp_single_number_ending_with_dot__ = re.compile(r"^\d\.$")
+
+    def is_shared_library(filepath):
+        return re.match(r'.*\.so(\.\d+)*$', filepath) is not None
+
+    def get_possible_versions(output_contents, full_cmd=None, max_lines=None):
+        #
+        # Algorithm:
+        #   1. Check version line by line.
+        #   2. Skip some lines which we know that do not contain version information, e.g., License, Copyright.
+        #   3. Do broad match, finding all possible versions.
+        #   4. If there's a version found by any match, do exclude match (e.g., exclude years)
+        #   5. If there's a valid version, do stripping and converting and then add to possible_versions.
+        #   6. Return possible_versions
+        #
+        possible_versions = []
+        content_lines = output_contents.split("\n")
+        if max_lines:
+            content_lines = content_lines[0:max_lines]
+        if full_cmd:
+            base_cmd = os.path.basename(full_cmd)
+        __regex_help_format__ = re.compile(r"-[^\s].*")
+        for line in content_lines:
+            line = line.strip()
+            # skip help lines
+            if __regex_help_format__.match(line):
+                continue
+            # avoid command itself affecting output
+            if full_cmd:
+                if line.startswith(base_cmd):
+                    line = line[len(base_cmd):]
+                elif line.startswith(full_cmd):
+                    line = line[len(full_cmd):]
+            # skip specific lines
+            skip_keywords_start = ["Copyright", "License"]
+            skip_line = False
+            for sks in skip_keywords_start:
+                if line.startswith(sks):
+                    skip_line = True
+                    break
+            if skip_line:
+                continue
+
+            # try broad match
+            for match in __regexp_version_broad_match__.finditer(line):
+                version = match.group("version")
+                #print(f"version = {version}")
+                # do exclude match
+                exclude_match = __regexp_exclude_year__.match(version)
+                if exclude_match:
+                    continue
+                exclude_match = __regexp_single_number_ending_with_dot__.match(version)
+                if exclude_match:
+                    continue
+                # do some stripping and converting
+                if version.startswith("("):
+                    version = version[1:-1]
+                if version.startswith("v"):
+                    version = version[1:]
+                if version.endswith(")") and "(" not in version:
+                    version = version[:-1]
+                # handle extra version info
+                version = version + match.group("extra") + match.group("extra2")
+                possible_versions.append(version)
+        return possible_versions
+
+    def is_version_mismatch(rvs, pv):
+        got_match = False
+        if pv.startswith("git"):
+            return False
+        if "-pre" in pv:
+            pv = pv.split("-pre")[0]
+        if pv.startswith("v"):
+            pv = pv[1:]
+        for rv in rvs:
+            if rv == pv:
+                got_match = True
+                break
+            pv = pv.split("+git")[0]
+            # handle % character in pv which means matching any chars
+            if '%' in pv:
+                escaped_pv = re.escape(pv)
+                regex_pattern = escaped_pv.replace('%', '.*')
+                regex_pattern = f'^{regex_pattern}$'
+                if re.fullmatch(regex_pattern, rv):
+                    got_match = True
+                    break
+                else:
+                    continue
+            # handle cases such as 2.36.0-r0 v.s. 2.36.0
+            if "-r" in rv:
+                rv = rv.split("-r")[0]
+            chars_to_replace = ["-", "+", "_", "~"]
+            # convert to use "." as the version seperator
+            for cr in chars_to_replace:
+                rv = rv.replace(cr, ".")
+                pv = pv.replace(cr, ".")
+            if rv == pv:
+                got_match = True
+                break
+            # handle case such as 5.2.37(1) v.s. 5.2.37
+            if "(" in rv:
+                rv = rv.split("(")[0]
+                if rv == pv:
+                    got_match = True
+                    break
+            # handle case such as 4.4.3p1
+            if "p" in pv and "p" in rv.lower():
+                pv = pv.lower().replace(".p", "p")
+                rv = rv.lower().replace(".p", "p")
+                if pv == rv:
+                    got_match = True
+                    break
+            # handle cases such as 6.00 v.s. 6.0
+            if rv.startswith(pv):
+                if rv == pv + "0" or rv == pv + ".0":
+                    got_match = True
+                    break
+            elif pv.startswith(rv):
+                if pv == rv + "0" or pv == rv + ".0":
+                    got_match = True
+                    break
+            # handle cases such as 21306 v.s. 2.13.6
+            if "." in pv and not "." in rv:
+                pv_components = pv.split(".")
+                if rv.startswith(pv_components[0]):
+                    pv_num = 0
+                    for i in range(0, len(pv_components)):
+                        pv_num = pv_num * 100 + int(pv_components[i])
+                    if pv_num == int(rv):
+                        got_match = True
+                        break
+        if got_match:
+            return False
+        else:
+            return True
+
+    # helper function to get PKGV, useful for recipes such as perf
+    def get_pkgv(pn):
+        pkgdestwork = d.getVar("PKGDESTWORK")
+        recipe_data_fn = pkgdestwork + "/" + pn
+        pn_data = oe.packagedata.read_pkgdatafile(recipe_data_fn)
+        if not "PACKAGES" in pn_data:
+            return d.getVar("PV")
+        packages = pn_data["PACKAGES"].split()
+        for pkg in packages:
+            pkg_fn = pkgdestwork + "/runtime/" + pkg
+            pkg_data = oe.packagedata.read_pkgdatafile(pkg_fn)
+            if "PKGV" in pkg_data:
+                return pkg_data["PKGV"]
+
+    #
+    # traverse PKGD, find executables and run them to get runtime version information and compare it with recipe version information
+    #
+    enable_debug = bb.utils.to_boolean(d.getVar("DEBUG_VERSION_MISMATCH_CHECK"))
+    pkgd = d.getVar("PKGD")
+    pn = d.getVar("PN")
+    pv = d.getVar("CHECK_VERSION_PV")
+    if not pv:
+        pv = get_pkgv(pn)
+    qemu_exec = d.getVar("QEMU_EXEC").strip()
+    executables = []
+    possible_versions_all = []
+    data_lines = []
+
+    if enable_debug:
+        debug_directory = d.getVar("TMPDIR") + "/check-version-mismatch"
+        debug_data_file = debug_directory + "/" + pn
+        os.makedirs(debug_directory, exist_ok=True)
+        data_lines.append("pv: %s\n" % pv)
+
+    got_quick_match_result = False
+    # handle python3-xxx recipes quickly
+    __regex_python_module_version__ = re.compile(r"(?:^|.*:)Version: (?P<version>.*)$")
+    if "python3-" in pn:
+        version_check_cmd = "find %s -name 'METADATA' | xargs grep '^Version: '" % pkgd
+        try:
+            output = subprocess.check_output(version_check_cmd, shell=True).decode("utf-8")
+            data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+            data_lines.append("output:\n'''\n%s'''\n" % output)
+            possible_versions = []
+            for line in output.split("\n"):
+                match = __regex_python_module_version__.match(line)
+                if match:
+                    possible_versions.append(match.group("version"))
+            possible_versions = sorted(set(possible_versions))
+            data_lines.append("possible versions: %s\n" % possible_versions)
+            if is_version_mismatch(possible_versions, pv):
+                data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                bb.warn("Possible runtime versions %s do not match recipe version %s" % (possible_versions, pv))
+            else:
+                data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+            got_quick_match_result = True
+        except:
+            data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+            data_lines.append("result: RUN_FAILED\n\n")
+    if got_quick_match_result:
+        if enable_debug:
+            with open(debug_data_file, "w") as f:
+                f.writelines(data_lines)
+        return
+
+    # handle .pc files
+    version_check_cmd = "find %s -name '*.pc' | xargs grep -i version" % pkgd
+    try:
+        output = subprocess.check_output(version_check_cmd, shell=True).decode("utf-8")
+        data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+        data_lines.append("output:\n'''\n%s'''\n" % output)
+        possible_versions = get_possible_versions(output)
+        possible_versions = sorted(set(possible_versions))
+        data_lines.append("possible versions: %s\n" % possible_versions)
+        if is_version_mismatch(possible_versions, pv):
+            if pn.startswith("lib"):
+                data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                bb.warn("Possible runtime versions %s do not match recipe version %s" % (possible_versions, pv))
+                got_quick_match_result = True
+            else:
+                data_lines.append("result: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+        else:
+            data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+            got_quick_match_result = True
+    except:
+        data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+        data_lines.append("result: RUN_FAILED\n\n")
+    if got_quick_match_result:
+        if enable_debug:
+            with open(debug_data_file, "w") as f:
+                f.writelines(data_lines)
+        return
+
+    skipped_directories = [".debug", "ptest", "installed-tests", "tests", "test", "__pycache__", "testcases"]
+    pkgd_libdir = pkgd + d.getVar("libdir")
+    pkgd_base_libdir = pkgd + d.getVar("base_libdir")
+    extra_exec_libdirs = []
+    for root, dirs, files in os.walk(pkgd):
+        for dname in dirs:
+            fdir = os.path.join(root, dname)
+            if os.path.isdir(fdir) and fdir != pkgd_libdir and fdir != pkgd_base_libdir:
+                if fdir.startswith(pkgd_libdir) or fdir.startswith(pkgd_base_libdir):
+                    for sd in skipped_directories:
+                        if fdir.endswith("/" + sd) or ("/" + sd + "/") in fdir:
+                            break
+                    else:
+                        extra_exec_libdirs.append(fdir)
+        for fname in files:
+            fpath = os.path.join(root, fname)
+            if os.path.isfile(fpath) and os.access(fpath, os.X_OK):
+                for sd in skipped_directories:
+                    if ("/" + sd + "/") in fpath:
+                        break
+                else:
+                    if is_shared_library(fpath):
+                        # we don't check shared libraries
+                        continue
+                    else:
+                        executables.append(fpath)
+    if enable_debug:
+        data_lines.append("executables: %s\n" % executables)
+
+    found_match = False
+    some_cmd_succeed = False
+    if not executables:
+        bb.debug(1, "No executable found for %s" % pn)
+        data_lines.append("FINAL RESULT: NO_EXECUTABLE_FOUND\n\n")
+    else:
+        # first we extend qemu_exec to include library path if needed
+        if extra_exec_libdirs:
+            qemu_exec += ":" + ":".join(extra_exec_libdirs)
+        for fexec in executables:
+            for version_option in ["--version", "-V", "-v", "--help"]:
+                version_check_cmd_full = "%s %s %s" % (qemu_exec, fexec, version_option)
+                version_check_cmd = version_check_cmd_full
+                #version_check_cmd = "%s %s" % (os.path.relpath(fexec, pkgd), version_option)
+                
+                try:
+                    cwd_temp = d.getVar("TMPDIR") + "/check-version-mismatch/cwd-temp/" + pn
+                    os.makedirs(cwd_temp, exist_ok=True)
+                    # avoid pseudo to manage any file we create
+                    sp_env = os.environ.copy()
+                    sp_env["PSEUDO_UNLOAD"] = "1"
+                    output = subprocess.check_output(version_check_cmd_full,
+                                                     shell=True,
+                                                     stderr=subprocess.STDOUT,
+                                                     cwd=cwd_temp,
+                                                     timeout=10,
+                                                     env=sp_env).decode("utf-8")
+                    some_cmd_succeed = True
+                    data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+                    data_lines.append("output:\n'''\n%s'''\n" % output)
+                    if version_option == "--help":
+                        max_lines = 5
+                    else:
+                        max_lines = None
+                    possible_versions = get_possible_versions(output, full_cmd=fexec, max_lines=max_lines)
+                    if "." in pv:
+                        possible_versions = [item for item in possible_versions if "." in item or item == "UNKNOWN"]
+                    data_lines.append("possible versions: %s\n" % possible_versions)
+                    if not possible_versions:
+                        data_lines.append("result: NO_RUNTIME_VERSION_FOUND\n\n")
+                        continue
+                    possible_versions_all.extend(possible_versions)
+                    possible_versions_all = sorted(set(possible_versions_all))
+                    if is_version_mismatch(possible_versions, pv):
+                        data_lines.append("result: MISMATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                    else:
+                        found_match = True
+                        data_lines.append("result: MATCH (%s v.s. %s)\n\n" % (possible_versions, pv))
+                        break
+                except:
+                    data_lines.append("version_check_cmd: %s\n" % version_check_cmd)
+                    data_lines.append("result: RUN_FAILED\n\n")
+                finally:
+                    shutil.rmtree(cwd_temp)
+            if found_match:
+                break
+    if executables:
+        if found_match:
+            data_lines.append("FINAL RESULT: MATCH (%s v.s. %s)\n" % (possible_versions_all, pv))
+        elif len(possible_versions_all) == 0:
+            if some_cmd_succeed:
+                bb.debug(1, "No valid runtime version found")
+                data_lines.append("FINAL RESULT: NO_VALID_RUNTIME_VERSION_FOUND\n")
+            else:
+                bb.debug(1, "All version check command failed")
+                data_lines.append("FINAL RESULT: RUN_FAILED\n")
+        else:
+            bb.warn("Possible runtime versions %s do not match recipe version %s" % (possible_versions_all, pv))
+            data_lines.append("FINAL RESULT: MISMATCH (%s v.s. %s)\n" % (possible_versions_all, pv))
+
+    if enable_debug:
+        with open(debug_data_file, "w") as f:
+            f.writelines(data_lines)
+
+    # clean up stale processes
+    process_name_common_prefix = "%s %s" % (' '.join(qemu_exec.split()[1:]), pkgd)
+    find_stale_process_cmd = "ps -e -o pid,args | grep -v grep | grep -F '%s'" % process_name_common_prefix
+    try:
+        stale_process_output = subprocess.check_output(find_stale_process_cmd, shell=True).decode("utf-8")
+        stale_process_pids = []
+        for line in stale_process_output.split("\n"):
+            line = line.strip()
+            if not line:
+                continue
+            pid = line.split()[0]
+            stale_process_pids.append(pid)
+        for pid in stale_process_pids:
+            os.kill(int(pid), signal.SIGKILL)
+    except Exception as e:
+        bb.debug(1, "No stale process")
+}
+
+addtask do_package_check_version_mismatch after do_package before do_build
+
+do_build[rdeptask] += "do_package_check_version_mismatch"
+do_rootfs[recrdeptask] += "do_package_check_version_mismatch"
+
+SSTATETASKS += "do_package_check_version_mismatch"
+do_package_check_version_mismatch[sstate-inputdirs] = ""
+do_package_check_version_mismatch[sstate-outputdirs] = ""
+python do_package_check_version_mismatch_setscene () {
+    sstate_setscene(d)
+}
+addtask do_package_check_version_mismatch_setscene
diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes/qemu.bbclass
similarity index 100%
rename from meta/classes-recipe/qemu.bbclass
rename to meta/classes/qemu.bbclass
diff --git a/meta/conf/version-check.conf b/meta/conf/version-check.conf
new file mode 100644
index 0000000000..154bc4a637
--- /dev/null
+++ b/meta/conf/version-check.conf
@@ -0,0 +1,14 @@
+INHERIT += "check-version-mismatch"
+# we need ps command to clean stale processes
+HOSTTOOLS += "ps"
+
+# Special cases that need to be handled.
+# % has the same meaning as in bbappend files, that is, match any chars.
+CHECK_VERSION_PV:pn-rust-llvm = "${LLVM_RELEASE}"
+CHECK_VERSION_PV:pn-igt-gpu-tools = "${PV}-${PV}"
+CHECK_VERSION_PV:pn-vim = "${@'.'.join(d.getVar('PV').split('.')[:-1])}"
+CHECK_VERSION_PV:pn-vim-tiny = "${@'.'.join(d.getVar('PV').split('.')[:-1])}"
+CHECK_VERSION_PV:pn-ncurses = "${PV}.%"
+CHECK_VERSION_PV:pn-alsa-tools = "%"
+CHECK_VERSION_PV:pn-gst-examples = "%"
+CHECK_VERSION_PV:pn-libedit = "${@d.getVar('PV').split('-')[1]}"
-- 
2.34.1


