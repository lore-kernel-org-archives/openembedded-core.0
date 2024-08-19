Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639B0C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 09:57:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.206943.1724061421094122834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 02:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8961a927c4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J7Ngd5007496
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 09:57:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xhn31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 09:57:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjxmzQsSDz05ZG8rQHhr9dAnN2R9wvNJK3DO28qGk4fQONAoykSo9CVrCwI6UnGM66FSEkOdqSPklSVi4fa27Vl7KXY0hj28onr74vq6L5Gii8XItpMIRAdmkVCkaOxPFuuQeIQEeImL/eSQvDDJ8nxxhdvUTuAwMpqEuOLk50oFPPLZYBXsZlw8l2LL1CEQmkbE6bSL3TELKkxmHA7shni56XX/iZghgC7M/iIqVeI2HP6+OF7NhyABeQC1intLYbnsggb0o2gMZ+tP3ALTQpYyQyq2SzQe2A0F9jSbRGkcaIP2DG7GJkPqpgXkPqAx/Aq8xRPmbvP8LTl1MPOIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3cERt940K4AREvJiuT+kNCwp+wdSATFtXF5x0XLVD0=;
 b=PtvDBSLtSWGovkHZbz+19a3h9K1crRr5D57udEmGny+6/7AYfE3dJUbCXkka4Vqu8r8nMIZUed4QOT6dIhmtZKBYfiNprqiePxlbrBfFzt0wZldnn0r+rQM81TF4Wuocc9honU7NvmTpgcJz9iWiJGootzrHUxLWcGrrJRuq8QrzllOJWvxf3Wkvd/Z1kv8/8eg6vQWBAWtnwmsM4hirJUqs2Q6Pz8QNq8roat7KpLJsTLhF11vJfywcggg18EvVwN364pB8mkwpwmlVa2gw0rf9pym1rx5g5ij4ZwEk87+BmBHcJnx0oEZeeF+2jMs/Ntgn2WD2/djaMsFxAGwqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 09:56:57 +0000
Received: from IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c]) by IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:56:56 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] rust: rustdoc reproducibility issue fix
Date: Mon, 19 Aug 2024 02:56:38 -0700
Message-ID: <20240819095638.29008-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To IA1PR11MB7320.namprd11.prod.outlook.com
 (2603:10b6:208:424::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7320:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: cc545e7b-ae11-4d4b-b9ac-08dcc03542d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ye4UUkHFBFTXQApqHCz3d5YBkZKSAwkx9VSGQe9yM1lpj/KzqsFaMPR8znXb?=
 =?us-ascii?Q?WBBPyJCKNezAm6pRSskm6XZGffoM+HxyOxHvT5heXBgNJgj8HHLnY0kyk2/5?=
 =?us-ascii?Q?lAMBR+QP+sEDEinMqfnzLsSgJnV/6/Wlxz5oL6yx5rH/w359UkBlSn+szViY?=
 =?us-ascii?Q?FMoYBjE8YGyAXqdNkE4y8iAUOEo+h1S/hYJkUuvvUDmCaDh1wGd8J0grXqlP?=
 =?us-ascii?Q?Dy28NzJT8dxNVe0nYSa78KzkiUA6RPl3FVFmFddgvNuqiomk8uGVuKMbyg96?=
 =?us-ascii?Q?sv0sk4J4Rd1fTkjnGc5xu1yg8mmEdEMzs+mnC/rSDd7h8D5rBMUwNxIMDiI6?=
 =?us-ascii?Q?3gQF0wV4WdwB6GSvCewZrpaqw3OBXde2196n2xbimKyyS+/UJCd9dYoqoz00?=
 =?us-ascii?Q?fXTbF5w5Aeoc6vHJdpyLjeylUlxUW2MEowC/N4g8jsQdoJ+6EgMaCxEmO+4j?=
 =?us-ascii?Q?Nnizx16OctLBLp3LEvO3iX4icY9PJeEtOyWgDp/BaKpz243dPXMurNEKFzrB?=
 =?us-ascii?Q?P0DnOLhEf8qmfl9vTDPQIF+RX1ViVpVpmbN2ZMAnxaykUEORi4zKwxU3xKjH?=
 =?us-ascii?Q?Rn2+eJyj1jJG5t5IGF2r1EvCCf6S8kibqjpQ+lDCHb2Owump56nVjo8TLx1m?=
 =?us-ascii?Q?FyI8Ht87R2JHgutKiZE03uO6COsG9wUmTMeL3+MV7nj5UgxSMHPk6Q5L/g1V?=
 =?us-ascii?Q?l6MYdjWyUq2gcXK/3k3s1zDuzUX5ni6VUMGFmGq9Et1hf4GaVp6JEVd34IhY?=
 =?us-ascii?Q?YSPyRC5q21Lyge7qtwQ5u29yAK4Vp7ve1/QUIQfUPz+m2MtvVtsYKJktosW0?=
 =?us-ascii?Q?iQcGPndz3ie/cnt4PSmB5yQ/noAslqVGBKfLaz/vUHe0a/++5ptGm3QAGLEg?=
 =?us-ascii?Q?PRSp4OkFVLE+GBr4aEqWIOSNrDvKtCPUIQdlcXqvv/4vI/VUAZvdAFH5urSL?=
 =?us-ascii?Q?UfGcE8ylUj3B/lBoXLh4Ks2/12oPK0T7FbkQqe3HwUm0iTFrU1KhQ+d1XDiW?=
 =?us-ascii?Q?l4S8Hqi9e41IDK21IIZTFtnghmDiQQh/3OKuxf6bYUVscNqAIokAr2YzjhDn?=
 =?us-ascii?Q?TD7VNHKT8qUs/RF5OOXFEaKr0s3L6NwPpOwzguaK8fxKITfWuqnkiBdFNF7h?=
 =?us-ascii?Q?nDcOzfOP9fvbU8Sl8nDrF3+7zuSeAlnhQihJskH7diTXSOLyX0OwB3ww4Jo1?=
 =?us-ascii?Q?go/oFDPo8ltJ7mfuRgHSSFfLPAPPg44zZXvT74e5ZeLLPu2SiJzEQ2FmC04N?=
 =?us-ascii?Q?TPs3vvYBbfaqeoUeYuOiXaCv0BcsxSV3W/zIp9hsc7SkAXIQfR/z8xey+q9F?=
 =?us-ascii?Q?yBWUTP1zvMLlIf9GQpkMCRcCiNY5Y4B1LXYEchUMAEm/90mpMFqh67YD5oZv?=
 =?us-ascii?Q?zBKHHGI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nI2pFQLVGi3hwGl58aB5z2/7zTnwmMkvIMEx7MNaQYYDP3Y+SqnciRqzPR0W?=
 =?us-ascii?Q?8nJoB4xGRH0+jhA0Zg183p7n/i8eC5WQJWhcuPq6DQIyXWLTPOw/R5UWxHyG?=
 =?us-ascii?Q?l5kz0xBm/dTt0F01q1Fame+fxAwMxUIdGbuQVA7pcv9X9hhPtSJMGaSS/JlI?=
 =?us-ascii?Q?CUzX3PmrihGkrzluVOPPzQVPl4HTVQ+nvvZL6Q+XQfHzQj4pAPVVpucSIWuw?=
 =?us-ascii?Q?u7SIURYeeslZ27aIkphwvr0RX+wkHA3pFEHbt2oP0xU6+3wHgJeRMKVp2Tfx?=
 =?us-ascii?Q?ENuZeWs9zac0KsaeqWc8vfqm2jERwrKFU/iX2qVq0UuLhV9CNqoJqh6y1irC?=
 =?us-ascii?Q?wmj9kxJ0PS4GFLzjNpso0R7Nfhi4oyw0NE2i/eCm2RnRKxOhcY1ok3wvtQEE?=
 =?us-ascii?Q?NuvVbMI6kyOZQAydJRt+IKGvu2cppoY1XAUFOHfUeE+/D2JT+ZcRrINtvm5U?=
 =?us-ascii?Q?u5M0Vzqj1gvRHY9lLBCFZjB1VwK+qfFpZYZGhjxUCICUdhYX8392xTXUh5PV?=
 =?us-ascii?Q?GGN5X/vgEIFrqoibKLQlsHwU27E6uPQsGaqrmVdfhSxh2tIwivimRFO78wdA?=
 =?us-ascii?Q?rayC7Q+RFs/FGjPzkvRBA/pDsxfxk6K683kiEZCCdrC+3JRiEr3LXz+megWr?=
 =?us-ascii?Q?Znpo2/KB5NTB8RlBFPeZdvDZaRTYrXgUdugK0k3GaJL9sNW63U5IOBcKLeIy?=
 =?us-ascii?Q?uOJ7rCOf1Fndv9sOXczpQDBbiTAYgVUHNDbQN2rJrgla/etRgnGwu2AxD5wV?=
 =?us-ascii?Q?jsD3J49EuCJz0jsdoEyt6u7YJmqEbCo5Gxs1HmdOCI8xL+gmu05SEu+1RCH/?=
 =?us-ascii?Q?ZzvEo+QyY0XAWh62FLJcqnBxxZCd/mhcuDFrxsRr3gn6LopoOuBFO0DbN5Cc?=
 =?us-ascii?Q?UH75rYpLqny938pn+mZsz9kimcxz7FlJo30TCcS+ke7Kf/uryorUrKP9KXcW?=
 =?us-ascii?Q?xiDJvb7EPtRBTXQ1V+2ctVs+NXA/AXDOnasmhF0sEl4cW/fHeJBKwZ5f8b6V?=
 =?us-ascii?Q?IPjs40g97ag+LzH7MqxnbzuatBOn3zwn9Gc3m06yxDY8kGWgQ70X0ZOEdnBz?=
 =?us-ascii?Q?vM9KuUhzdnIz+M47hKsblzx5xsvyMWURfX07XN1TjnNr7OxfEx080wuQmwBD?=
 =?us-ascii?Q?xQhbpD19qBwpnFcORH1YIdE5eZVTqylWiAJ9/Ld2jV2+Nzq9QzjpdbQO7Dvr?=
 =?us-ascii?Q?3NAmshq/rXFInujhWO54uXMS5VtoS87M1J9iiYpa9d8ge53Yw6YVO1Ilr0jQ?=
 =?us-ascii?Q?HE3m6ItSgJJ1bEBl9Ji+5x7nLt6c5x8K1ZAatNNvkh97FbavIXVJupWwcYM4?=
 =?us-ascii?Q?hwNWOsGaUk7g9fHe0c3OTBDJIzIW8WoqfFh/vYHH8jdqR7t7aVn5kGRccbZG?=
 =?us-ascii?Q?2Bs0tdjfT0x0tXHU5o0Ci3gd1j4Od9OODaLeIcG9aRnMyzvmvsG7X7BqVbxa?=
 =?us-ascii?Q?BnFijjYOWICZp56xvVIb5UchaCAcu5bUp61lMDXtkhFonONtVTZSeYA23DWq?=
 =?us-ascii?Q?UBlPOIIRKbVEOSXK7tCZorHWauV256G8HSSHi13fMHrWk+gDVesl0PIFLvH3?=
 =?us-ascii?Q?roaYwDO92K9izbeoktBxsTQGpGriXL+IcmPsrSaYuCSI2T4OukpVRDEjvgmj?=
 =?us-ascii?Q?nJkiKfUkus7Vx3bYOQP7yts=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc545e7b-ae11-4d4b-b9ac-08dcc03542d6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 09:56:56.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNl2gsvbnLF8//Vem5gHFlBL9WUUl8ej0R9aGnEoBRZHZGmbqJi69sS9pz/dPWipcd9lSAYoc/hkw5CvyTSokteFiSNLCAEn496is/AGeJLq16n6qVEA2UlnSXSthrRR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c316ec cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ei4SEBeUAAAA:8 a=X30zvtXajfbtiY8q2AoA:9
 a=m5Prkr60LOIA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=8zIOOLb7Ym0NljyPXbuS:22
X-Proofpoint-ORIG-GUID: YB5smzJlk7uoJ6z7WwtnHordFgsJnBvz
X-Proofpoint-GUID: YB5smzJlk7uoJ6z7WwtnHordFgsJnBvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_08,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=855 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408190066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 09:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203498

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The 'codegen-units' option split the crate into multiple compilation units for parallel compilation.
Currently, this split is causing the rustdoc to generate differnt binary between the builds.
To fix this the codegen-units & the lto options are disabled.

More info about options:
https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
https://doc.rust-lang.org/rustc/codegen-options/index.html#lto

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ue-fix-cargo-config-for-codegenunits.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.75.0.bb     |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch

diff --git a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
new file mode 100644
index 0000000000..fdb2a4a498
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
@@ -0,0 +1,29 @@
+commit e2e7017350d0b5324811fef3b841f98b00273887
+Author: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+Date:   Fri Jul 26 06:35:59 2024 -0700
+
+    rust: rustdoc reproducibility issue fix
+
+    The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. 
+    Currently, this split is causing the rustdoc to generate differnt binary between the builds.
+    To fix this the codegen-units & the lto options are disabled.
+
+    More info about options:
+    https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
+    https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
+---
+--- a/.cargo/config.toml
++++ b/.cargo/config.toml
+@@ -3,3 +3,7 @@
+
+ [source.vendored-sources]
+ directory = "vendor"
++
++[profile.release]
++codegen-units = 1
++
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b14221b6cb..4ffc9faf18 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://target-build-value.patch;patchdir=${RUSTSRC} \
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
+	    file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index c33f31d261..7cd34a61c3 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -132,6 +132,7 @@ python do_configure() {
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
     config.set("rust", "remap-debuginfo", e(True))
+    config.set("rust", "lto", "\"off\"")
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
 
     # Whether or not to optimize the compiler and standard library
-- 
2.43.0


