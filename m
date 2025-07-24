Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3310C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 10:32:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9318.1753353132287430199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 03:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=930074213d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O8UIM6561654
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 10:32:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483hbq03dg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 10:32:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IItoPrg7zyxv8f4w6ynMwAWEQlpbI0Y6vv/xJxDljp/MK6a5BRJBIUbKCP0mcUk5msPZgwru43HPtXM9Ib3tYH2E7FjHyBsgJ59OTFcRVgOCQ1GqGhfWLX8XUjmJmP2O+wEziHNPise+8gwiqA359r2O6sex0Zp9OX3OnBANGwnJpUw/EYJcsmqo3EzUj90T4FDXc/uBhACwW2envPBy8NhRjDLp4ga7ZjEmxE3v74SZNGZxH0g0fcu2OUuB3Meup/TCKh+qEK2zu01Q7X/bI6SF+AXGuks2Pvp4Yk3/euVFnPTQIOKGz7ECcwD3Ai+1GhrB32SuhmII8H/msGdNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB3edYEg1Fi5z/WAS9Lu3UaUQRnoZ8E9s5GVqZn7Ojs=;
 b=UMUI1mh2EUKb8VAh/SEO63WUkUVnTvsVoi/s2Er50YblH3vLKsIrToHq1xjFCUcKE0n4EgO1AdLDFSyXtr993Awj7Q3HxSGpLK7ucaOX5N/yshgxMlvCjfeaArfADeOCDAeRfJsSHYfrh6qnpHKN4HOe2a2DItNTRy6ebPYpBJ11DpgEKDznO/QrdnN9+33z4DKVsaJelF18n8+USO+gqEcdLa8K3AYyACX/0lacYM4tKB298fBT9BFs9nZye7xQjZAJPPpWJoIkkARbtj3pJdyT9UKFo8b3cVZcw9twbkcTig3RSg5UFu7yoDLQVaxajxrQI9kqg2ybfUd2EN4Giw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA0PR11MB7884.namprd11.prod.outlook.com (2603:10b6:208:3dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 10:32:08 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 10:32:08 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-7545
Date: Thu, 24 Jul 2025 03:31:53 -0700
Message-ID: <20250724103153.532074-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA0PR11MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a25d1d-630a-4694-f95f-08ddca9d57a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iPHPuACid+uRsHDOeJ163HffnaVjcJrBkp1d5zvY+BDVt0SJZEXETrBd7Gdw?=
 =?us-ascii?Q?kZg+X3sds183z2cq8KdVBB692tUAOVbJPJQZnQ8yrUn30l7MO13xpvaUy6y/?=
 =?us-ascii?Q?Q3l+xtY0jfDHwFacK3uFHWTO3xYSMLUTc0B9kMfTD+ruhAvGIhXIPj3QWUQu?=
 =?us-ascii?Q?V0Uk5B32dHNtLyFelom3ZE5NBYxCTeEYWCTIrVtWzyaSqZaXk/ZsKER0a468?=
 =?us-ascii?Q?9gI1aXlgQVP/Y7tKdK3TYFluk1wJkIIHrBv8aBq9WsbNkYAZB4nJF8MJD5uI?=
 =?us-ascii?Q?UURBNvykgPXcwVXVFN9+XHKnYkbGWKFz8TQMOrmSdJUGRTA+y01CT7zS5Ft0?=
 =?us-ascii?Q?kIqTNHc0CKNokZ9heXYOK/HJShwK05tUy/tv2XhN1JlmV2wkroJF3JfiuVrx?=
 =?us-ascii?Q?UFJtn8RuXbYL8x2ruy79KRPlgt720pDSPOetexBzvbdAqYhE7M6ucDF67ROX?=
 =?us-ascii?Q?48pajm+tynn4PqvHwtFqZc6owU5osZCvAxULiU/yIesm5GPj6LJmHm7dh+F1?=
 =?us-ascii?Q?6zwGMlEW49jpjzUXZQuBVFhkWToYpqMPAeT2k9DwZxe5/BtbXmYmSvnuwt9T?=
 =?us-ascii?Q?yBkFUeuHCX59/ZB/C/yB7n1zOnhMBCEZsPGFXSrh2RVx73Ngm2cICIOCt1+Z?=
 =?us-ascii?Q?vH5ALqVXw56fvJi70xw3G2RrE8Kmn3eIWwwB3A+Fe83gaMNX8rp0DlrYbF+Q?=
 =?us-ascii?Q?6DaOxhxjwegWnbwzMB7Cmj6pDzuea7qaofzemZ8ipu9pri2j7c2hG36UbRTr?=
 =?us-ascii?Q?prdL2cnuPyyXEfKwSaJ4yNZE0xArEv/hGle32QtyUDBOSt6g9GTKck9OT12q?=
 =?us-ascii?Q?ADRcnG0/x5uvhw7e/+2jhWZocchlnFvL/jaE3f8508I/Yr+zpZy92uvyC6UU?=
 =?us-ascii?Q?FazpkBs0htvdkIfs5y2pD/Zw1VkUNIcJxNR7fNnDvtCLG/FmUaZQO9CBjdxM?=
 =?us-ascii?Q?irT5TBE5YYedK6MwMBn3fWpwAC1AVKA+7ZXMu4VEoDAIGHrsPkwMmFsBt5er?=
 =?us-ascii?Q?WGaQAL2q8Yy6ud41Poma3TceSiDbTnbCfq6rgsobd7V+Wk1BWWOH3eY29mdh?=
 =?us-ascii?Q?otl+lP81ip1KcjQzwGaXYeJeajSz+I0tGeQ0wA2RFpkzFbcUK7cByLOrX0sH?=
 =?us-ascii?Q?O+o0ov2SqPJJ2U1sAIbiXDzRw4DU8TAhJVJ3CfsK0ACPZg6aVDQwvhbGxaEn?=
 =?us-ascii?Q?ko5+jJISn+XA+PlUtGZ4abIB8DAP71ZXEQKFmp3XZpYit9cDMAICRBGyXmD1?=
 =?us-ascii?Q?LdvjdIxaHzzR23jdsU2Iz+vzOTwv3NJM2KNThFdGFUji4z4ahsB2xuPUtrdJ?=
 =?us-ascii?Q?bJ33WCsH3rONHRE0NZORZAxGE3A44fXHW75XDl6bCz8QKbcRGFJEK+GF8wnh?=
 =?us-ascii?Q?T2Pp0YCIp+qOiqxplZ+EOU5dtRVNFA3R/kcxfPOIv+aTHstgJO4j7xFDVsIt?=
 =?us-ascii?Q?3Waw9z5jLRvegkoWCAiNfwN7tvSHoCej?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QdCJHp39s7N6xqIq+ibmoXL1VgdHsNFsyfXHgXp3IRp60pcJ3/AdvclNvWh8?=
 =?us-ascii?Q?g9sSooLBtHPhyhWbEH26da7WLy33Nv8J8lnPttjaFr2FF9443VELa8AFAKII?=
 =?us-ascii?Q?07jcvNDK3mK1yl5nLNCVCN3XeBxkI+3X+jsXMGs3oCGrIiLj1+R2iKLURjLr?=
 =?us-ascii?Q?S/MckhwMEIeXJSvavyuuOQcRGUTaN0vtqPfGOSUbvT/dS7/bcISMp9ya5WCv?=
 =?us-ascii?Q?GUVnU9Az3DCfrzIQZ8u0XFRkT9b3P+iJIWL38tPlGzIjRM5OHs/Oflfk/4Aq?=
 =?us-ascii?Q?1a5IXg5ZhfyF/RSxb5M1N5zf7qEg8Zny7pYWsXWF8EDuo+8mVCvp85N8JjgA?=
 =?us-ascii?Q?P1ZDuNmyMUWo/oLAUYxsPBm+1pGMROLGX+44pSwaSe0CcMZdXHmN5949DeKy?=
 =?us-ascii?Q?8alUhAeJR5xDg7/tXStYFsXVqwN84TCBQsYo4/bnXM6GJi9LIMb9lcAMkgTJ?=
 =?us-ascii?Q?sLN8nmRvYi7DT3ef/kRcGEe3+i7lCOjpAQ6Eq+gX3ttNgwSj5mvfTjn8/HoJ?=
 =?us-ascii?Q?puMubwZCsY1bLtP5Yz1VQZvwUNNSULUnCdyaq5wYZG972BVJ05eZCJsc9cDH?=
 =?us-ascii?Q?aycnDmXEVJAAeceotbLWi7nqXaQQtSIN1uwtDnDgzspCLH8C69SUixHZXxj2?=
 =?us-ascii?Q?LtHbr/zDu0irSt3jdyWF9qVk9P7DzNPktYmx1QCqDLj6qtEaAPv1fhcNS9F4?=
 =?us-ascii?Q?JKEn9aE0aAut8gVzzKOrWx2VzRvGAOT/zfNczVHv1H0mB01Bmbw1G95l7a7X?=
 =?us-ascii?Q?MtGprQiI+zc7mF2nFNiR2C0n30MppdlZjS+SuZI06hhoWIlw6sUIhQ2amXId?=
 =?us-ascii?Q?5naoiyuvnJYbMJ92Fkqt9nuLnCE1tiEgtXEyH56V6hl+Q9xhgIxyASJNuuDr?=
 =?us-ascii?Q?ySdq9pOhVm7K/GTTEcKqxjiDaclMReONnCGt8kLXXAau4w0C4ABCY1nusH1b?=
 =?us-ascii?Q?BAqzP1wjYM4DZ05MwTE++s6vCCrdezAczx6cNGF2rMwfQQYiiuu/g7DMoqUl?=
 =?us-ascii?Q?oPmo3W5qidTHdZFALcvcEy5UshCAab5ohbwRGTmLFRIHFitiwxVRoN5hEtwr?=
 =?us-ascii?Q?rSOit/GL416G2BxjlX+rj2dr50ZxJUhm89DZxloqKT8Pap4cVnyg9jDRRHEP?=
 =?us-ascii?Q?3mMXRjd6zKCZJwv2IIYHhae+VzTeQD3nKfr+HZ1lZzeScKcPrDk1ogv68lWy?=
 =?us-ascii?Q?PqkuYO2tv1j3JbwW8WbxF1vyYvtElHtElNPmYPuOEIHuoxOp4uTQtrY03dHJ?=
 =?us-ascii?Q?i1mahWvaeTazxheOGGZaG5trq/kxzlKVXoBhWTCMbd99sc7eti2qyUtAsPaS?=
 =?us-ascii?Q?xWuJEPU8ETechja0AtYKx3NmO8yAHzKbRxVi7T4SAtoOG/jL6rYdtWDYc7ys?=
 =?us-ascii?Q?P+CZHZmznhqCXJ3r0oO0GZNPtcnSzSBAtLrsCEeFIdcunvbVBrQwFeZCkLNY?=
 =?us-ascii?Q?4K4xaGtThTqwJdiGm/Q5kNexkFk5O+eUaG30PnzRtmlwW4xuRAh9dTsJvlWe?=
 =?us-ascii?Q?C43siGgb2seThwEImQx+H3rvmRVFDbmlz0P0J/dXJTWmD816yKhueQPY81n2?=
 =?us-ascii?Q?RhTWbiI9LepeBXAWnZ+8CbSDlzD3nLOrB/SHPCiK5PSdOdFUnlMQxRJ6vk2I?=
 =?us-ascii?Q?KKXcSOXsznQzBkOsHKB+uXg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a25d1d-630a-4694-f95f-08ddca9d57a4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 10:32:08.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDbmREtf/hTNIDNcWs6Yganl5tXUBDjSudynkpUoEaaTU/zQC3ISFrem/77IirKXJavqwy5H9ywoXrgEZtmjgJSpLH/VVimIzqJ2z0yb9DZ0JlO6+8XT44Mb7Fwkpisq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7884
X-Authority-Analysis: v=2.4 cv=Y9f4sgeN c=1 sm=1 tr=0 ts=68820bab cx=c_pps
 a=VXqs0nH5bCPAj+PVW1y1NA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=o8x1PyFA2OIQ-l2cK8MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GSq9Gs3xkkqcbNjvgImUyS_jYo8lnWD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3OSBTYWx0ZWRfX+eqp+uq87ppB
 OpYQpr7bXvbNOvYaOGeQ3M8rsvifzNyEWPn6jyDh5em5bzStO0B/yavd4tWmeHajhJqKmTx07gj
 aZM+gkpLtTZH8HDXmPblY36roBNZEaWq+mffdg1J4pgYzUH2bCF+FrGpic8fcE9z7gcGWLru+9/
 ylLSRqGHQsZrDx9DpD6mTZ22w+FJvvxQsZzOZO32ZCkczGSSg8VRDYWvnZHQyTn6QGRTd2nAYsK
 bGEQqRkatPqtQaVncsMGPsepRL1Fc3tuyOERkhrJHpPrZ26+tgWPnxNyHDpf2uWFHLJzCvA7dXE
 0g1jwNmVxSKWafQMDvXvIpxBhNPWvDBacHj0adytIpHPlEVYvxR0rPblQWH82bAUvULo04hjGKW
 y8+0ad+W
X-Proofpoint-ORIG-GUID: GSq9Gs3xkkqcbNjvgImUyS_jYo8lnWD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507240061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 10:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220833

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0023-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 9471e6accd..c2685948f7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -53,5 +53,6 @@ SRC_URI = "\
      file://CVE-2025-1179.patch \
      file://0022-CVE-2025-5245.patch \
      file://0022-CVE-2025-5244.patch \
+     file://0023-CVE-2025-7545.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
new file mode 100644
index 0000000000..de132f74fc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
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
+index a85d2620..18cd1bfd 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -4547,6 +4547,7 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	  char *to = (char *) memhunk;
+ 	  char *end = (char *) memhunk + size;
+ 	  int i;
++	  bfd_size_type memhunk_size = size;
+ 
+ 	  /* If the section address is not exactly divisible by the interleave,
+ 	     then we must bias the from address.  If the copy_byte is less than
+@@ -4566,6 +4567,11 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	      }
+ 
+ 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
++
++         /* Don't extend the output section size.  */
++         if (size > memhunk_size)
++           size = memhunk_size;
++	  
+ 	  osection->lma /= interleave;
+ 	  if (copy_byte < extra)
+ 	    osection->lma++;
-- 
2.49.0


