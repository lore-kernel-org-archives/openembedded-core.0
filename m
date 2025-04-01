Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55BEC36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 07:14:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13436.1743491672522212623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 00:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61864ba94c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5315t2kJ009664
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Apr 2025 07:14:31 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p63130tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 07:14:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuqY7yyBIwN+KxVNM9N6DA1QueCNZyQAfIzFF1r3txVcjcQfsX61gPN5qJfaYNYVMdlJZh9WmwX0USVAvrNp44OO6Zd8WK4yTsyf02hhxzgtf3eeYXntjowN6Npm0HgMNVG8h1sk6zDt9SJGYKrBw36PAjZtlFpxYNgLdX2L+FbrU4Zf7rPH5icB6+62wltCIyYovb09jg94wcAmN9HZk6n0YwagBK7ULLJDVUF5gQRkGaAxAoHt8UaChfK97s+tPo4AKkiFQVEt1GBAzDrXkz75qwS4LjSmy8b/dwmesnFLn6fweWTfyu0viiQFZRxBU6KOHxP9rechTcm48+xRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0M5HuZztj9QSHhO0ZziK3BrirQneuQMCkPh5NyrIto=;
 b=av9R4B+cl2UrStWbOz31krQvE52sJvjKyMmmingjAECrJzc/niaQqsotLaz+kY8Uvh2YeBEh/jBciyfTt79EDlumh5kC2DeVV221Oe3ynjbyAgwLQUf6HkVdtGwJu9Uar6vcP4jNnHSPBGUUl39MxfhiK05iuyZoLJDQpYjt/TIocTvt61M2UuaTRiMmNsxcBUgW9hnpjyI/lEB/NzBITtX+BG6kwz50vrprLlbm15PFdk/wAAlAVi1zxWscEZ5f2DEltLckYll9WBGQpKMAhEEZnAe0ro0QbBx+Pxb0jthcxYZbmtT5v8535DU/+EddgTzs84OYnG1qnoGy80lkfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 07:14:25 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 07:14:25 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] llvm : Fix CVE-2024-0151
Date: Tue,  1 Apr 2025 00:14:00 -0700
Message-ID: <20250401071400.612837-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:408:fb::23) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: a1227bde-122c-484e-f4d2-08dd70ecd55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MQPt0nZ/WLtgZ8qAD1FpV6Lqw5k5NHKPe8q2VoHuc2Liu/7WghYzEUBBFnuk?=
 =?us-ascii?Q?1+w5V5+BNP7OPq7uShP8HYT2EP0QlAfpKmndtP0rhSMd52gPZxEeC5eZTdpl?=
 =?us-ascii?Q?lNxMmUvmB2/qzi4JzU9JfM+fYsJfte9biBiiLcIQT66HaNKyj4AMvo5vSn58?=
 =?us-ascii?Q?RtS7H/z9T2MHB1rYJywR9hBZMkbeD27mjAjbrzXKap0TTp4XNveccuGeZGil?=
 =?us-ascii?Q?A7MjpYjvauoZcMWoiFMYcVZ4G3Gapowz5SXeZxpN5IF2sctL9HK2GsKBZwMC?=
 =?us-ascii?Q?YcCopgKAM4ljIYxZv31jtvgzgYSbGpI8Fbq3A8brR9O9q7nxpOBXpQeCykVC?=
 =?us-ascii?Q?//fQCAdXYgSjt5IBYyNJUVD1g3bbllKOul76TcYHAaI3V2mF49NwtUGhbUMm?=
 =?us-ascii?Q?vfjOmD733+ltnhNXBPGPeQq3+S2sMDcNBU8toK9ybeERzUJDfTBApLT9axlL?=
 =?us-ascii?Q?2sT5AheyKqeztsrjRRW0ljJiC+vEIie9CaOnkmmwcGZAgMxPcU2BN8RjqSr8?=
 =?us-ascii?Q?E7Wd0ET6Lv6UGmg3YUlgAImzS+4GdyTW6fEb9IUiYdPk0feMt0ZFIxStE+o2?=
 =?us-ascii?Q?fFspvdphGD+RhPG7MnebpfRACvmKTCvTgCBIelPyDUFeAS9cbrQSDq0MGLy7?=
 =?us-ascii?Q?CuiWHI6bE9oabBoRoyWfSoBrR3mQ1OWaukCp8SI2L/p8B1pYEm/x4cGcD+p9?=
 =?us-ascii?Q?56+3UnO2dTacktfOudHwM51oY3m47svsfe4hqLVW01s0q1BvlUuQ4it7jHmT?=
 =?us-ascii?Q?6EWNx6JlmMjsvW8zSI9+Q190EV4KqJJw0Jw3lnJkA+R2K56VTIW6lIRhtC8b?=
 =?us-ascii?Q?wqQIlMSuJoEXeTlf/21kNoqq9zKdwhepJqbZbSYHMJ+f6C5stwk54FWUZjIK?=
 =?us-ascii?Q?ZVn1NVe8sSwrfE+p1Uha4AQRU5cLRaMB0hDP0yTk1Cn7njRzUO4ANexs+pLy?=
 =?us-ascii?Q?I0rpvyZKTZWFuH87i7jlE9NHmtUTERjAUJlbolAbjln3PNKTqb3FzyjLaM4U?=
 =?us-ascii?Q?ZyoqMB7fIn6pmDQPLe9OFpMI8PTAzk8/qeNeZePoFOYMtcSsQjpOleBqXWaP?=
 =?us-ascii?Q?UkABtZ8hq9JjfGcH52jJB/z1irwyRuZlZrfbC7llpRHi6AmxWf55KOsJFsnz?=
 =?us-ascii?Q?ldTIg+9530K6uz11njNiFEJ4LfKLX6mdXJ+TCMtWPsahAKi9f44BFq0lraPS?=
 =?us-ascii?Q?DMRsAkpqQ38Ogq3QTEgKEb6ezkCH3//CeO6X/hmdxiiHg6yAxtmHFutHEOIZ?=
 =?us-ascii?Q?dYD7yOp67kN3it9ylGG5ooNe+SIj2y3K2uuzEOC/xa+4JA4vmwn+ecg1IzJz?=
 =?us-ascii?Q?xuF8Vzi54AJjHXy9ATckX6NapAEGsiR1jb9DWoAVTGL58/J0JAGNftzkLVGm?=
 =?us-ascii?Q?mACHiJ9mi34OJQfYvQrpRKbzwVwt06nMpSO6U4oqcKGPwN1kF6CNq6ckfl5T?=
 =?us-ascii?Q?7BqIVhth54qxNAeJCJJQmBp6rUAXiLWA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3pOlauKGjClm6NlSi+lCGLWeA5YH1ZgPovxMKBoEJEZ0vFt4H3wv8rRAC8fd?=
 =?us-ascii?Q?1n4PD/pCfSVrkXOL33/mc1ayoAPKU+EWxCpLzxiULTH4HcbB/g2SGUU7WN9J?=
 =?us-ascii?Q?Ppp8auhzdOYJTd4vXurqnYdGiX7HPwfLmUJSfZ+Hlbfi2mtiykEcel4HHm+0?=
 =?us-ascii?Q?boEb9FZ3ST09dnXoeGp1Fp9wS3VLgr5PhMZ/n/UAdx81jzM3ZoR//cAT2CeH?=
 =?us-ascii?Q?lICnX0ZxiyYDuunqS1pFmCK6HU+UMmc5v7rPzPYITWTakqZvigu+dLs1L4kA?=
 =?us-ascii?Q?MXLqDQuaWl+LanFIG8WgISwv8CNwl6i8yC2LerDEpMlSOOg5uNKDiid7eXFw?=
 =?us-ascii?Q?tViKjz/5zVbIByNcP/ckEyTP3eKLjbei9LGIl0GJTO0sCmMfvrh27wfTV1os?=
 =?us-ascii?Q?zuLTJ5hdHIj9hFqy6hi5Mdo4Wt2QhagutHWOwaz6+7tqBSriNth47zlVwwkp?=
 =?us-ascii?Q?xuJAEcSW3E77Zsf/8xR3wm/B1R2KDgipg6UXvH3gPcMCF/j0R0LT5l+oIBeb?=
 =?us-ascii?Q?T9be4SP5WTshQJGQe0++4v5aBJpeoK1dy8TPFFwKRaXBeRpcne9MzSxVQv0k?=
 =?us-ascii?Q?ZBoZy0g29XXuyoSUpJlK71M6mOf1ezaJq/kaW6exCBP4xTX44B3L0FvCGwUi?=
 =?us-ascii?Q?xHehh0v3th0ah+IgJpe3f34uSw9Txqc3wl7i+OhVIrPXSgDoDJoKf9iwMYlj?=
 =?us-ascii?Q?/Zr0Ss08/S1qSF34NnPgI4J+3aAiuSkN4ey8Uex0zVCioVZonDMg8zdj9Lt+?=
 =?us-ascii?Q?2pSl61NpOS7Qz4P72qHyB09bavGNm7YNc6qNqwSvYxoSsKAqugOWnYe/kTiH?=
 =?us-ascii?Q?ueSwz1IgceJYKLYrO3I+FIxeUmpbzCYJ1+BU7LtuDRleHBOcdtTFtheLKchC?=
 =?us-ascii?Q?bw8Jkx+LMOH7WRk4DvSSMXste0lghRJKOoTm/wb6Akxl6Wak+fyLuqgcOMXI?=
 =?us-ascii?Q?Ay1XwCcjr1OmT9KIWZIseZqxvH4IASfhwLup7dgxNoDHAGKm/649o/Dj+egJ?=
 =?us-ascii?Q?mueuGOmLRD67SviA8Ox7IkNLV0qU2JXx/MsffwDAmuHTjhNP7CeC20rwS8FF?=
 =?us-ascii?Q?CyXLs0TCsofE1LPR2j3vtIFhCoAtSR8ZEBagRZvIdSM3q1n0kjukYSede3Oo?=
 =?us-ascii?Q?eUYPSyb+aC9kbXc9WEgsTb2obYRnhCm6HhRtxOK4wsghWPjk3AFCHgO82vbc?=
 =?us-ascii?Q?rBEE7t9E/xXVmoRLjkuFbSOwyxMzPrT2AEKZcYC5jiifCS8uUmgR9xCyUqxW?=
 =?us-ascii?Q?XupjoynJ9h99agXdY8Y0OmwQAZSOyx6sPQ8f94fhNdKP2U9rsolI0ctwwjvm?=
 =?us-ascii?Q?YJBfWCkIZqbZUVdngy9jbuLjXjcRoTgRSkhzTq8FL5EMiljVkbIjNc5XxJa7?=
 =?us-ascii?Q?ecGCJoJu4meKVZxkgc+mnk4+0JX3M2kafeIu8TgqOqZP7rG7D/nvPkSBOb7E?=
 =?us-ascii?Q?o7XsXtXyIIfh8vHmQekZJlbAZcpGwgzb6EJMaOXkqNThAyvEPolutIjzhPaT?=
 =?us-ascii?Q?J+7v5byniz75LanKGJ8xy6QP7bBUZsb0fwzrEv4XTtioyh1XfPMHYKI8UR30?=
 =?us-ascii?Q?hBLymWJXXvX5uJqJZEVxfp4OTY6QOOtAF31HsNO0Yx6aOti/nyCSHMZf7oEe?=
 =?us-ascii?Q?R6tZbGatr5h9V3b1YoyFi8c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1227bde-122c-484e-f4d2-08dd70ecd55f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:14:25.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYuw2vkq1XI6Rc0oQzaHpaR/ws/O1B8oyyWbMQjrWEcUjJ02ULCxQ/WXZuqmWo27ybPISM9tpqzqbtFCwMPmh5Xxtk1xzLyIadxEoGk3VFAwglWQuJPMOGTqJgAk6Jj1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67eb9257 cx=c_pps a=0XndbtkAAnsFgPxdSZG6GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=wQfKxpVCxC01tQNuVb0A:9 a=rZ9ZGtFgVrrETnTr:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: sTp7zI27S7VQ_r3FzNE8v32rKv_Gkgtg
X-Proofpoint-GUID: sTp7zI27S7VQ_r3FzNE8v32rKv_Gkgtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504010048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 07:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214003

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport a patch from upstream to fix CVE-2024-0151
Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/78ff617d3f573fb3a9b2fef180fa0fd43d5584ea]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../llvm/llvm/CVE-2024-0151.patch             | 1087 +++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |    1 +
 2 files changed, 1088 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch

diff --git a/meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch b/meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch
new file mode 100644
index 0000000000..cbe6f5bf3f
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/CVE-2024-0151.patch
@@ -0,0 +1,1087 @@
+commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
+Author: Lucas Duarte Prates <lucas.prates@arm.com>
+Date:   Thu Jun 20 10:22:01 2024 +0100
+
+    [ARM] CMSE security mitigation on function arguments and returned values (#89944)
+
+    The ABI mandates two things related to function calls:
+     - Function arguments must be sign- or zero-extended to the register
+       size by the caller.
+     - Return values must be sign- or zero-extended to the register size by
+       the callee.
+
+    As consequence, callees can assume that function arguments have been
+    extended and so can callers with regards to return values.
+
+    Here lies the problem: Nonsecure code might deliberately ignore this
+    mandate with the intent of attempting an exploit. It might try to pass
+    values that lie outside the expected type's value range in order to
+    trigger undefined behaviour, e.g. out of bounds access.
+
+    With the mitigation implemented, Secure code always performs extension
+    of values passed by Nonsecure code.
+
+    This addresses the vulnerability described in CVE-2024-0151.
+
+    Patches by Victor Campos.
+
+    ---------
+
+    Co-authored-by: Victor Campos <victor.campos@arm.com>
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/78ff617d3f573fb3a9b2fef180fa0fd43d5584ea]
+CVE: CVE-2024-0151
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+diff --git a/llvm/lib/Target/ARM/ARMISelLowering.cpp b/llvm/lib/Target/ARM/ARMISelLowering.cpp
+index 900113244e41..e12f8c183db2 100644
+--- a/llvm/lib/Target/ARM/ARMISelLowering.cpp
++++ b/llvm/lib/Target/ARM/ARMISelLowering.cpp
+@@ -154,6 +154,17 @@ static const MCPhysReg GPRArgRegs[] = {
+   ARM::R0, ARM::R1, ARM::R2, ARM::R3
+ };
+ 
++static SDValue handleCMSEValue(const SDValue &Value, const ISD::InputArg &Arg,
++		               SelectionDAG &DAG, const SDLoc &DL) {
++  assert(Arg.ArgVT.isScalarInteger());
++  assert(Arg.ArgVT.bitsLT(MVT::i32));
++  SDValue Trunc = DAG.getNode(ISD::TRUNCATE, DL, Arg.ArgVT, Value);
++  SDValue Ext =
++      DAG.getNode(Arg.Flags.isSExt() ? ISD::SIGN_EXTEND : ISD::ZERO_EXTEND, DL,
++		  MVT::i32, Trunc);
++  return Ext;
++}
++
+ void ARMTargetLowering::addTypeForNEON(MVT VT, MVT PromotedLdStVT) {
+   if (VT != PromotedLdStVT) {
+     setOperationAction(ISD::LOAD, VT, Promote);
+@@ -2113,7 +2124,7 @@ SDValue ARMTargetLowering::LowerCallResult(
+     SDValue Chain, SDValue InFlag, CallingConv::ID CallConv, bool isVarArg,
+     const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl,
+     SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals, bool isThisReturn,
+-    SDValue ThisVal) const {
++    SDValue ThisVal, bool isCmseNSCall) const {
+   // Assign locations to each value returned by this call.
+   SmallVector<CCValAssign, 16> RVLocs;
+   CCState CCInfo(CallConv, isVarArg, DAG.getMachineFunction(), RVLocs,
+@@ -2191,6 +2202,15 @@ SDValue ARMTargetLowering::LowerCallResult(
+         (VA.getValVT() == MVT::f16 || VA.getValVT() == MVT::bf16))
+       Val = MoveToHPR(dl, DAG, VA.getLocVT(), VA.getValVT(), Val);
+ 
++    // On CMSE Non-secure Calls, call results (returned values) whose bitwidth
++    // is less than 32 bits must be sign- or zero-extended after the call for
++    // security reasons. Although the ABI mandates an extension done by the
++    // callee, the latter cannot be trusted to follow the rules of the ABI.
++    const ISD::InputArg &Arg = Ins[VA.getValNo()];
++    if (isCmseNSCall && Arg.ArgVT.isScalarInteger() &&
++        VA.getLocVT().isScalarInteger() && Arg.ArgVT.bitsLT(MVT::i32))
++      Val = handleCMSEValue(Val, Arg, DAG, dl);
++
+     InVals.push_back(Val);
+   }
+ 
+@@ -2787,7 +2807,7 @@ ARMTargetLowering::LowerCall(TargetLowering::CallLoweringInfo &CLI,
+   // return.
+   return LowerCallResult(Chain, InFlag, CallConv, isVarArg, Ins, dl, DAG,
+                          InVals, isThisReturn,
+-                         isThisReturn ? OutVals[0] : SDValue());
++                         isThisReturn ? OutVals[0] : SDValue(), isCmseNSCall);
+ }
+ 
+ /// HandleByVal - Every parameter *after* a byval parameter is passed
+@@ -4377,8 +4397,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+                  *DAG.getContext());
+   CCInfo.AnalyzeFormalArguments(Ins, CCAssignFnForCall(CallConv, isVarArg));
+ 
+-  SmallVector<SDValue, 16> ArgValues;
+-  SDValue ArgValue;
+   Function::const_arg_iterator CurOrigArg = MF.getFunction().arg_begin();
+   unsigned CurArgIdx = 0;
+ 
+@@ -4432,7 +4450,7 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+     }
+     // Arguments stored in registers.
+     if (VA.isRegLoc()) {
+-      EVT RegVT = VA.getLocVT();
++      SDValue ArgValue;
+ 
+       if (VA.needsCustom() && VA.getLocVT() == MVT::v2f64) {
+         // f64 and vector types are split up into multiple registers or
+@@ -4496,16 +4514,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+       case CCValAssign::BCvt:
+         ArgValue = DAG.getNode(ISD::BITCAST, dl, VA.getValVT(), ArgValue);
+         break;
+-      case CCValAssign::SExt:
+-        ArgValue = DAG.getNode(ISD::AssertSext, dl, RegVT, ArgValue,
+-                               DAG.getValueType(VA.getValVT()));
+-        ArgValue = DAG.getNode(ISD::TRUNCATE, dl, VA.getValVT(), ArgValue);
+-        break;
+-      case CCValAssign::ZExt:
+-        ArgValue = DAG.getNode(ISD::AssertZext, dl, RegVT, ArgValue,
+-                               DAG.getValueType(VA.getValVT()));
+-        ArgValue = DAG.getNode(ISD::TRUNCATE, dl, VA.getValVT(), ArgValue);
+-        break;
+       }
+ 
+       // f16 arguments have their size extended to 4 bytes and passed as if they
+@@ -4515,6 +4523,15 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+           (VA.getValVT() == MVT::f16 || VA.getValVT() == MVT::bf16))
+         ArgValue = MoveToHPR(dl, DAG, VA.getLocVT(), VA.getValVT(), ArgValue);
+ 
++      // On CMSE Entry Functions, formal integer arguments whose bitwidth is
++      // less than 32 bits must be sign- or zero-extended in the callee for
++      // security reasons. Although the ABI mandates an extension done by the
++      // caller, the latter cannot be trusted to follow the rules of the ABI.
++      const ISD::InputArg &Arg = Ins[VA.getValNo()];
++      if (AFI->isCmseNSEntryFunction() && Arg.ArgVT.isScalarInteger() &&
++	  RegVT.isScalarInteger() && Arg.ArgVT.bitsLT(MVT::i32))
++	ArgValue = handleCMSEValue(ArgValue, Arg, DAG, dl);
++
+       InVals.push_back(ArgValue);
+     } else { // VA.isRegLoc()
+       // sanity check
+diff --git a/llvm/lib/Target/ARM/ARMISelLowering.h b/llvm/lib/Target/ARM/ARMISelLowering.h
+index 844b7d4f1707..2168a4a73589 100644
+--- a/llvm/lib/Target/ARM/ARMISelLowering.h
++++ b/llvm/lib/Target/ARM/ARMISelLowering.h
+@@ -865,7 +865,7 @@ class VectorType;
+                             const SmallVectorImpl<ISD::InputArg> &Ins,
+                             const SDLoc &dl, SelectionDAG &DAG,
+                             SmallVectorImpl<SDValue> &InVals, bool isThisReturn,
+-                            SDValue ThisVal) const;
++                            SDValue ThisVal, bool isCmseNSCall) const;
+
+     bool supportSplitCSR(MachineFunction *MF) const override {
+       return MF->getFunction().getCallingConv() == CallingConv::CXX_FAST_TLS &&
+diff --git a/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll b/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll
+new file mode 100644
+index 0000000000..58eef443c2
+--- /dev/null
++++ b/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll
+@@ -0,0 +1,552 @@
++; RUN: llc %s -mtriple=thumbv8m.main     -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-LE
++; RUN: llc %s -mtriple=thumbebv8m.main   -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-BE
++; RUN: llc %s -mtriple=thumbv8.1m.main   -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-LE
++; RUN: llc %s -mtriple=thumbebv8.1m.main -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-BE
++
++@get_idx = hidden local_unnamed_addr global ptr null, align 4
++@arr = hidden local_unnamed_addr global [256 x i32] zeroinitializer, align 4
++
++define i32 @access_i16() {
++; V8M-COMMON-LABEL: access_i16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i16 %0() "cmse_nonsecure_call"
++  %idxprom = sext i16 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u16() {
++; V8M-COMMON-LABEL: access_u16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i16 %0() "cmse_nonsecure_call"
++  %idxprom = zext i16 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i8() {
++; V8M-COMMON-LABEL: access_i8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i8 %0() "cmse_nonsecure_call"
++  %idxprom = sext i8 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u8() {
++; V8M-COMMON-LABEL: access_u8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i8 %0() "cmse_nonsecure_call"
++  %idxprom = zext i8 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i1() {
++; V8M-COMMON-LABEL: access_i1:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i1:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i1 %0() "cmse_nonsecure_call"
++  %idxprom = zext i1 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i5() {
++; V8M-COMMON-LABEL: access_i5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i5 %0() "cmse_nonsecure_call"
++  %idxprom = sext i5 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u5() {
++; V8M-COMMON-LABEL: access_u5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #31
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #31
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i5 %0() "cmse_nonsecure_call"
++  %idxprom = zext i5 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i33(ptr %f) {
++; V8M-COMMON-LABEL: access_i33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    rsb.w r0, r0, #0
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    rsb.w r0, r0, #0
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %call = tail call i33 %f() "cmse_nonsecure_call"
++  %shr = ashr i33 %call, 32
++  %conv = trunc nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u33(ptr %f) {
++; V8M-COMMON-LABEL: access_u33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %call = tail call i33 %f() "cmse_nonsecure_call"
++  %shr = lshr i33 %call, 32
++  %conv = trunc nuw nsw i33 %shr to i32
++  ret i32 %conv
++}
+diff --git a/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll b/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll
+new file mode 100644
+index 0000000000..c66ab00566
+--- /dev/null
++++ b/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll
+@@ -0,0 +1,368 @@
++; RUN: llc %s -mtriple=thumbv8m.main     -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-LE
++; RUN: llc %s -mtriple=thumbebv8m.main   -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-BE
++; RUN: llc %s -mtriple=thumbv8.1m.main   -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-LE
++; RUN: llc %s -mtriple=thumbebv8.1m.main -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-BE
++
++@arr = hidden local_unnamed_addr global [256 x i32] zeroinitializer, align 4
++
++define i32 @access_i16(i16 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i16 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u16(i16 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i16 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i8(i8 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i8 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u8(i8 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i8 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i1(i1 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i1:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    rsbs r0, r0, #0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i1:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    rsbs r0, r0, #0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i1 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i5(i5 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i5 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u5(i5 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #31
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #31
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i5 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i33(i33 %arg) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    rsbs r0, r0, #0
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    rsbs r0, r0, #0
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %shr = ashr i33 %arg, 32
++  %conv = trunc nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u33(i33 %arg) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %shr = lshr i33 %arg, 32
++  %conv = trunc nuw nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_i65(ptr byval(i65) %0) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i65:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    sub sp, #16
++; V8M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V8M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V8M-LE-NEXT:        and r0, r0, #1
++; V8M-LE-NEXT:        rsbs r0, r0, #0
++; V8M-BE-NEXT:        movs r1, #0
++; V8M-BE-NEXT:        sub.w r0, r1, r0, lsr #24
++; V8M-COMMON-NEXT:    add sp, #16
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i65:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    sub sp, #16
++; V81M-COMMON-NEXT:    add sp, #4
++; V81M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V81M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V81M-LE-NEXT:        and r0, r0, #1
++; V81M-LE-NEXT:        rsbs r0, r0, #0
++; V81M-BE-NEXT:        movs r1, #0
++; V81M-BE-NEXT:        sub.w r0, r1, r0, lsr #24
++; V81M-COMMON-NEXT:    sub sp, #4
++; V81M-COMMON-NEXT:    add sp, #16
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %arg = load i65, ptr %0, align 8
++  %shr = ashr i65 %arg, 64
++  %conv = trunc nsw i65 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u65(ptr byval(i65) %0) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u65:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    sub sp, #16
++; V8M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V8M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V8M-BE-NEXT:        lsrs r0, r0, #24
++; V8M-COMMON-NEXT:    add sp, #16
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u65:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    sub sp, #16
++; V81M-COMMON-NEXT:    add sp, #4
++; V81M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V81M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V81M-BE-NEXT:        lsrs r0, r0, #24
++; V81M-COMMON-NEXT:    sub sp, #4
++; V81M-COMMON-NEXT:    add sp, #16
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %arg = load i65, ptr %0, align 8
++  %shr = lshr i65 %arg, 64
++  %conv = trunc nuw nsw i65 %shr to i32
++  ret i32 %conv
++}
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 8dcd124c71..1531e12fff 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://CVE-2023-46049.patch;striplevel=2 \
            file://CVE-2024-31852-1.patch;striplevel=2 \
            file://CVE-2024-31852-2.patch;striplevel=2 \
+	   file://CVE-2024-0151.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


