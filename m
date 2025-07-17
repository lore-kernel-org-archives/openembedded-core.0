Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AD5C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 11:35:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46878.1752752147306662533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 04:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9293639f93=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56HBQO0D645150
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 11:35:46 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2074.outbound.protection.outlook.com [40.107.100.74])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva2yvb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 11:35:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b70ZvdEm84pkqBhCZGXXRDZu88DvzhJIFia8RiFdgVXfu7EHr5wwGIscryk/4GPKh6XHp/jZQmgt1Xo3A5uXOq9w1N85psZu7qQelAKwNPmQihyIYZBhkV4NwgKR0Np+tiIkq9UvdTXruHDUxi4fhjPaUEYAG/z2Z6KS5e09Fv5cS+haiqZ7oPuReHVYc5jD1/ue8woO8N5AKBJrvDmLOWH8YyGOY7j75fhjodEG8HaPFPyoON/duhZmao3zWOUcx8v35SaoFhdoddMaah5XTLORnOQcPHvyZQZryG4owqmYilucoGpD7NROHwra2PTX3QTV5TAxJz+Is/Z7CRAhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki1gpvAK9TQyEHYu5MKtE7Dr/0oUZiSBpuse9FAmuNE=;
 b=iFTKU/WPFsWsv7k+WIaabngnBnzFH7PnrVpzcd7uzQcCi1QsxG6xlWz094Foxqc+qC4koXFiPkLOto/nP+veydpKELhQJb/zJgcvz1zmibPoH73g9GiUzNmbHsEee2GSQEuU9yUi2Ff3raNQ9gQvzFmv/Bc29jILYGy5GXBcNcHLtK7/TmhEsX/V6Wkvr65bm2yuYI/yKrIloYbN2w0LbV3Pm+F60ITi3mY9u1pnIRDV1QHk9jsHTaD0K+uSJYCCPzDOcrFL3uzaNsR8c7rAsDW6UTwqeyDynNU9O/5s/Ssal2xHg9XQoe/09bQEa969M1sZAsj5RK3HTbw1mwh+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 17 Jul
 2025 11:35:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 11:35:43 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-7545
Date: Thu, 17 Jul 2025 04:35:29 -0700
Message-ID: <20250717113529.1025378-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 34342a00-49d7-429b-5fa7-08ddc526109a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XNvxixYJUEHMqAYcouwrTBKD8jFWm1P7V1INemijujtMIgEBheBLYJYLa+3b?=
 =?us-ascii?Q?USU4yxj0lVBJLxhzYHGw7W7Vyuxtx3UGlyGu34N+67jFYl+COfU4e/9ie8kc?=
 =?us-ascii?Q?Hewq6rqG0snEg4heAhYaijqmGjjWdpUKGQtq73vYntWdBFngGVlakz+e6e9H?=
 =?us-ascii?Q?lXM28t5/NLj7Uunwtqles6zmUT+d1OhWB1lODQs8OElYFO037VQp7uIYmU5d?=
 =?us-ascii?Q?OqaR47EdL55cz5E312QwKBGmSWOkHow6ftETT4JlCY3ubL3rO+DUl1jtxhfe?=
 =?us-ascii?Q?xvPCRyX9i9vePmAuzil0fDnKJ7e4YipFIK0j9ey/QuVvD3Hmvfrf4xldAlx9?=
 =?us-ascii?Q?9+IU/BVKTLsSxZtyS2h4ESJb1C0iSIC4jXSvCuqdqLCWx+cJ4nB7xggJn9k1?=
 =?us-ascii?Q?g7oi+AbQyjDMIpGJ2loGwThN0EwO3itcMQQOsVdJARWp7XkSDbMPPvc2Tq/a?=
 =?us-ascii?Q?8lTBV88juYmSa7unY8HLdCl6mk5+hayTeaAQwFG/Kk+UCTxNN80m5JCsgKlZ?=
 =?us-ascii?Q?zSJH+aj2rnsTWq1kjFyKJsWGl3/YmWdBvG2NSFlvvdFsKmYyQmAd4ZDIfkbU?=
 =?us-ascii?Q?zIevVhyuuBA4VA6s9ex1R2BGZc5Nt0GxGEHfATHetbUnuJ3yX/hofO3JKHLX?=
 =?us-ascii?Q?eddLvmy93fOIn+01KZ+U50h3Ti0zzbr/6GeAKvmGrUwxuLa13MmHFOO4O3gw?=
 =?us-ascii?Q?PRHdY/+u3O/55kSTVTVVxtbGJch2p9mWYpf7tYieMTDewcEOZNpbSY+WsUX9?=
 =?us-ascii?Q?geu+aN1RkAkB9w3TloGhXu8kBpW0bVGGxchCT0S+W8jXJLdqK3OuP1sNFuvV?=
 =?us-ascii?Q?0pua769dXYdhEPENeZzUIAJzdx8RFV7144QXP2RibbM0VpgIv1lXunRWb37+?=
 =?us-ascii?Q?5UjTM7b6VHfpX7HP1QS0SzS7m/lc/bQnUJFttdP3P7oyCd5HAlS2krDniVy1?=
 =?us-ascii?Q?E3+nGOrWRO6rMPMAVO8J9o6vnWz8v2uxsl5q7Dsm09GG6T5tODFR4SCyrGj4?=
 =?us-ascii?Q?FScnMgHZ8I3SXn5gBGnKJSlzA2BDe52lTSYU3DlxH420S2Z7yFZgYF//aa5I?=
 =?us-ascii?Q?56jkrY25QNstYGYNZI9FKL4ryWyV6kFABhawr1gzUlpT5y7CjXSytnkxi/zz?=
 =?us-ascii?Q?/gXjLrZyk9aiKhmWvtRe+WNsk8mYlCAwqH3q9+BkXfrOXmvM3wnZA7LQm6eg?=
 =?us-ascii?Q?209iSE5vps5UNY5V4HbCI4Q8mmiFCjJ1rEIUE8mx9h/Jd3mnb0HZK79I+5W6?=
 =?us-ascii?Q?iMMqesZgFa728/D9GOjcFvUDUMlMY2PaZ4HlWSQpy4iRfp7EP0okYDQkvb8l?=
 =?us-ascii?Q?sRNObsFvDv+yQvgAZq7sk/iYsr2pvAAw1eL9H67vQRDEH49F/wpCyFz9RWsz?=
 =?us-ascii?Q?XPreWvlgVS7MIagNfLk+Ikanh51+Igj49gOtutVxqgPAA0Dv+p4xRPsMUGEe?=
 =?us-ascii?Q?aOSY8G0+FlsHN+CxprSDHvZvBEQQcKS9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dGpc2aerQ8HOhQMc06G3lOEgl12cMGEjIugczIh7eBEyHafL/1pQEj+x/bSN?=
 =?us-ascii?Q?Ji2VDauNJEYwdJoglscuZetRhSmFJ0PtgHQR6aewRo/hrKWv/hHSJv3ioVoD?=
 =?us-ascii?Q?T1KFepWgjZlV9+Pn7TwRSqLq5UrnC+bipqNzy60LKtiw68daH1ulPAmnO3LT?=
 =?us-ascii?Q?hMcsk3RLRlozraps22YkM3ew4i7wM55rZIW8hgPsizQWih6L9xrv8NNZZSGz?=
 =?us-ascii?Q?AiXWwf03gIK8X9/vs27pIQrxlXCJTqZAJlKp4ptoKTEN9aqesO4VpFZWgrbA?=
 =?us-ascii?Q?y3slEhsvcxpcHpvvl5hfEDWR506MvLWI1+Zks7rTuW23grR38d5ONUt4L0qx?=
 =?us-ascii?Q?Goe3lRhrStv8BXQGgCR7SjqYNp8RtguaaI11Egq64Aq3QfhePci4HZugiOm+?=
 =?us-ascii?Q?o7Hh9yJJHMAPDbBzVn3wHxRWYcvm6vZ/E9+M/8iN6tq8eRhfXtY82imfYV6o?=
 =?us-ascii?Q?+EnTuMPI592hbqztwG+vwITSwPxxAPamnZsW03352gZQITmTLegy+nFTdheg?=
 =?us-ascii?Q?TKqSa9rC80BXjiXa8tYbSPCoKlklRnH+IVidK0/xsljNFn5OV0r8sMya+Xzj?=
 =?us-ascii?Q?he4T6tRKOskcempwkbnjZOSlhmZFUrniN9nFkreuu7quMbd5uPYgokzdDImz?=
 =?us-ascii?Q?xv12WXstraSAzUTQGksiMJKgDt/Q2K4iKXe5rj7GuunswGXZgKxR2JUJKIi4?=
 =?us-ascii?Q?up9/sVTlRGypwxTlsMC4g8PD4gsJ7+M1MA0a6PHF1gwKHHcy4cMAuU3gk7RB?=
 =?us-ascii?Q?SgxkxuYSFH1zRIrjDkTSgHsGerUGJa42EaKMs2+dXpLSxkxd64WimRAT4NDP?=
 =?us-ascii?Q?Z9do7VCpuVfg5+MxMv9M7BFbflaFRcQ3rbiKDba1mfgEKEASui008RLVR775?=
 =?us-ascii?Q?rzcPX1hE5/G72oDyzB9R9pHp6k1cPrEFrHOXEiOkG1ZNtB979BbOkb/25map?=
 =?us-ascii?Q?YXW+naAaxEop8diwhpDnGChp7obAgcv3I+QZ61q8z19Vy1/r7eyhNHQaM5Jq?=
 =?us-ascii?Q?eCbIi/UFinLQo0JgPgjUsENaaV2TT9hrp+2JnHbFfDIK1DY8oAvTYVctkVWk?=
 =?us-ascii?Q?8pKnQwlIRxMxpqi3DSMaOG9stdIboNZD1a3t5dPhgEhBT8im0zN2/HqwPpUu?=
 =?us-ascii?Q?0qSj7++vEVyJOPDWFh6mRKmxrRcEriLquCIV/YpYocD6L2HHTcw3huv8yESD?=
 =?us-ascii?Q?BuKlLN4CBG6YKg6fD+TEpLSmWp4F6uDV0xnzUFO0zpr1vv+bT/m+6BTqFN56?=
 =?us-ascii?Q?EPwdIhJaJ56RaBeNatGwcZ7zhqBIUMyl6VfTzuDv7X1ikQNZ7CSGa67jaIsk?=
 =?us-ascii?Q?98he0ngliJ4Dl+7JX35Pn3zasjUQX6v+jQ9XgeVPlwXsOM5/uUJZy9Cv5IBz?=
 =?us-ascii?Q?+mcXn4rLjvPeZix/1DO4DVadXqRSBYWw5svwtbd4eR4aGjZMJ3GaIS2g20tt?=
 =?us-ascii?Q?da/1FXRM/zVVLWml8jiu3Ck7VqXpZK4HypLNGgUTfch5iiqj1lg2h+sNjngi?=
 =?us-ascii?Q?3H8aGaG43q7o41N5jHwpIOKTmbbmygOWqJg8SPnEvPmYfsJfM6F9AUgZQdcW?=
 =?us-ascii?Q?M+UxW2O6zeQOoFv5tJmHy/GqyFPmEwWdbJqo9aMMHeTMRMS70kDcXC9FcOml?=
 =?us-ascii?Q?mpDFA69pJ18dWMkB64bzvrA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34342a00-49d7-429b-5fa7-08ddc526109a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 11:35:43.5240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DnrZw6bdT58CpWJkmx7UV2u/CJHjdbdC9lX8WhUA3ZThF6FGePyZHQLVoYOsuMOeXmfr3ze+NHZ/aDnf/XYZk2K3CrfglF/V8lRRkTx2qDvuQUEhUAb8FlxiVLxqv9S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=6878e012 cx=c_pps
 a=L6Hz9/pR7DVG8eCy1x1OqQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=o8x1PyFA2OIQ-l2cK8MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GcxceEReOgMm9l0zJyaa7lVMcNpidN7r
X-Proofpoint-ORIG-GUID: GcxceEReOgMm9l0zJyaa7lVMcNpidN7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfXzm62b2A2yUNo
 vE00s3wk5L+AHZ/fwAcMKu3l8EIHBZF0Jr7TCwJzHGY746aYp1Q05yXnIHjCz/zcFWaVfAI9K6c
 W3PVAeViTbbBgxMeR0ygl/1QLNUJviFCuCaDwgQC9P8WJzLsFNgILWE9ipMdF9I7DzOI5GEyu9t
 zwSWmr2GUgB4A/QWStn16NQJg7eBVUHO9y9KYF5RRAQoK/lWcei8UNyZGyBuJZL5Z5ieKBP8Zkm
 ZOhRW5Ssyxc8cZKh+qPCPbSDatxmzG0va53Z6fD7q//ta12BgcxBlvF3AcLNFWN8iwFCuwqeuTc
 XPLuupXzLwCvRcOG77mMz8R8/sFpLoWr5Xig7yhZ0w1jNKdu1BgAdl29laWOEJpN+IbbgNuyr6T
 fpc3Tuel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 11:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220532

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0020-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 2219ada4ac..c8d655c990 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -43,4 +43,5 @@ SRC_URI = "\
      file://0018-CVE-2025-5245.patch \
      file://0019-CVE-2025-5244.patch \
      file://0019-CVE-2025-3198.patch \
+     file://0020-CVE-2025-7545.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch
new file mode 100644
index 0000000000..062d6721b6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch
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


