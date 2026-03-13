Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EF9107BCC4
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19268.1773417609515485464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Cns8T8u/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDCkC8009465
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ik5M5E3qtvbBPI5X9Ohbw2vy4emfbpmNYrhZD/BgQaw=; b=
	Cns8T8u/cfOeov0fJO6yEOXwjIR3uRJi1p6a9SKMQvEC7WurjaNxvuMraNWEM0Sj
	/Z4iRFaYXwMGJdqRKBSxySopPb2eeNKOuas8mT4d/5Gj8BGNgIrRnffZp1Gz+VRz
	IemVaBX+dOMSOAPEIb2bgOTIDD6i9fgpLxuZUD6V0BSpxuFdC7gVv5zOaOdkuI1D
	jXiOwTny2FPSbOnshnIxYCmaA9SHq/KzP3XeeGXaj4X8N3WG0Aql+qRwM0Sdf9wa
	EFehV274RWnJbjxQlIL59Wm7NccXERBZx5VamrC4bmFLeXk+KOk5f2v9ieFPddx5
	RZwMta84coqLwXQeoha+bw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvk8nr5nx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 16:00:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mITyYHPoP1f/KX5QlMEYjZbTQCb9oCZIdeuCRVjl0ZQef8Xy1nC+45E/jgYLgttRlxMp+8ybhbWHEQYe+kNEN8nYJTQ9JEfbsO9Vr6y9I0Nyz9oPl6cWvC2N0524FBfPgxy+6wypjJ8NePRcL0CIEd2aIZ+0CT68pK/+7jrs190spYVi82L/SOQG0Of7X08h3IhHESyii3HGm7UwwNTqQo87AbLs4dQsmsZUenckkecNhrg3oa+W9AVlsYgc1SA8n0oLjBlMaKeNO01Oa4FOVSmgfeu4sVWmpylhNJRhZiN1I8Cy/mb2MenU729B9vn9TJ7B1qdOlG9XZlKKrFGiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ik5M5E3qtvbBPI5X9Ohbw2vy4emfbpmNYrhZD/BgQaw=;
 b=eAVB3ILEePC9Wwz7g3V/mnDN3VX2aXemV3RiAh8tMRBVklSJHM3oCIAhr4tqsFB0k/126GYGW1OHOGvWKspEgiDOF/1Mrh4a4HbDgiDDDgJ9COjrP2et2BO9BWKY1hwW9bu8BnGLouys8HxppBgHW/hvC48Ocf5CB4wFNW1pX8jCApo0ZrvdG2T6Mi73hlANnLVKe2gb/U65jycZ0I9sQI24LVgSr2He32n9jMDpLjCmu1JvSCrvBrmR5MxSZu2nIZ+lhJ1DpheLR6+h0gunXFRNGVduOOA/Wexj0Iid0bQj8a4+cBwfSfWJVcJ6xUZkd4yWDsp4M3B3KuoE97TiEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 16:00:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 16:00:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 11/14] module-rust.bbclass: Prepare out-of-tree rust module compilation
Date: Fri, 13 Mar 2026 08:59:17 -0700
Message-ID: <20260313155920.2347101-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fec99e-c944-41a1-d469-08de8119981a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	1cdi4rUd7TXudo0rgEi2FO0t7DnIIXRrrBiYmNB1yvtFnkD9yxxPEytgRhKLKVBOQlbfkOGBmHPp2c6AP/S5Y1znB636n+rg7fXGgzn6MChbp7DnoHbz6/gDkPdzPP3L877Mlv7rZyQvcfdZTciRkBsEURH5dRN4SleIXwdqgqWssI1PPGJA1W9wWXAnvDsgbRA+rBacyIBSj86GKsJtBiyO59Tql513bBPzPR0uoXvjiB40+6CB862oVUPrzuf0KsYmiER6zq5Ct5zxMMMLoov5tiaHXCfpmFf7dB/3xzHvGch17OajeX/0Au+P9vCZzmjvtq5vYboiON+XcAvyCPmz41/O0r2eX2dcus05TP6S2wMLjQyYMtG9ewcnZp8cJJ1ZMQs1xG24kVZgS9k20SLzDJi+AfK1y41XeD7b1UL5sxK61pMyHAyyyai3MC6tP/rDuY7oiewXtgYE9n7UUm5I2cQaCbULj9r0ORr+QTGCv4T8mXnXSqHU5WlwY3OjxLKQtfUJ2ScTOnRMYRKlLnO99SMTii/vda/gLFFOKzYKmbpaveYTmilD8V0rVaYbGkS6kS8kdyyUEN5Vn3SDTIc+mQNYosIyJE0TQa5TAht6koCCIgP3vq9eG/kxcW+InOy2OmkGhOQXCjOUtZwSBuqCopH8sdT0Z99OfQ+AIkEyqZYyk5q5/HuZ38U0ddZdxqhUWWXI8oId45acT1udHi2exRdaNpvtJwtVrs0W8Fmbsho3pu9s8aQPkeoO+hgLo7NxsH+l7+hLJOFFVopQ9KJVOczrda3bz5Be6+OFAeg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SgktcfFVrOj4/b2I/HHtAPqWIWjyw22QvoumxtFQLKV8pOxvZaejHnG1mblx?=
 =?us-ascii?Q?x0H8trmRmDvCZC4rP0zXiGuPRB4xJEH6L7HQnrk7Jd+0IJQ371EHz97RlLgh?=
 =?us-ascii?Q?MSI98g2R+sL80t6UyReEUifB3llfvqcVQkBeqfEQdMtzoSNugtGSnIcIntMg?=
 =?us-ascii?Q?FyaR/fu0JdPivxe0/Jq3DRgRpWYgH0m91rfQGp1WcBtDOttgZDJJ4ZkwSxUc?=
 =?us-ascii?Q?f0bhCeifN89oQUj67xM4NnnpjJiJxFahfKhGoorMIBG//sAIZw2qq5jf//O+?=
 =?us-ascii?Q?VHhMluLpQevf1u+/537/BWSWX/VpF3xOyM3n8DGv5L3v50MEGJi5RHh9Tn9h?=
 =?us-ascii?Q?H81stwALMWXUPvFRnCnPTpO3ma+usmZvaFppaZCmqx6HrgIechxh9ZzvtjY7?=
 =?us-ascii?Q?NYOazJtrE1yK/6+lrNORpVZ4fM5g6qgBndSW8kv3LRE16fPsBAgQWau5sD8w?=
 =?us-ascii?Q?Rb0JjFV2V6ehLPGqkjfTWQ46nOvSjTY6LvFbIinCUJ2K2L+ThT3M7j7jqsnm?=
 =?us-ascii?Q?eN2bNygT4W9fY9DrrGuJgwPrHdDc6/x5qMkzahyw2pP9UyO7aZLWNwaTicr0?=
 =?us-ascii?Q?OHXSe0qL5xJ4briQzfqxrFJFX+ytOhJZdaeJQq1vpPQ05JUcf1G1cct7We/e?=
 =?us-ascii?Q?gzp34SaT/I9ixK0uneRTkVCli+QqRA6BhTWp6Ubcpmq9qUSbdWz1QZ0nWIUG?=
 =?us-ascii?Q?0n/K9MCIDtc9H0LPFJW1o74Tbh5X9b/nxmz9OTDCMQHTDuUOiqpdU+Ibdimm?=
 =?us-ascii?Q?CSh+xlp7SX3jrtGNg7lDy3siuR/5w2CkH+44hUpK0kfXrBQAElDPP59lVINh?=
 =?us-ascii?Q?nM8UedEXz2mpLUHbPvSohpS7DzSDXL+UV+w6Ezn/xz3wS8/R1JRkJmj2eII3?=
 =?us-ascii?Q?1EI3F3kXSLzpgWBwsb6+yc/qHzR/z5nrhzGk5qxvGBgVXNuukvGl6luApD4f?=
 =?us-ascii?Q?Z25A1JzNvSlrSEVxZ6LGdvU7F/ybtbCK2jWPvIQkoGguYLOfkapY+h3giet4?=
 =?us-ascii?Q?LiR3r+4Am+AfTI0mL4u9sRs3LbE7J016QvXMufBjxF6nnm9DfDL8YJyxR1AZ?=
 =?us-ascii?Q?XAgLrWQESFgVBHJ5mhcc0E6+pwEuia9Dm+YrwEnisibtxAoPDqB13eup24Ao?=
 =?us-ascii?Q?EMjSfyTFSR9BIoiejLlaIYPqr2E7LmVzkNL6YwZn3JXsrgbk7GWCsqMBlDl/?=
 =?us-ascii?Q?Oz2+HjwcOI9LrSFj77f+2Hk5cou4KNHc9BaLK4QU4QKTbS52Oit+XLEprEl5?=
 =?us-ascii?Q?GKTVIloaTWTm07tSsYw8CkZlN3va1SFM1tw96x9KEAfufYCvj4nJ2Frp6anc?=
 =?us-ascii?Q?JhDRAdvVpPqw2fXe9Nkmz7bQSJ73Nt3FR7lBE6S46jtbJLNFVaGA1/qvrcs3?=
 =?us-ascii?Q?z/uxwoyegN9T8kOc/LzEIxLfGjXc1AbU5siQSXvBzirJP/io6bToxHrz8Llb?=
 =?us-ascii?Q?3f7XUTEEhpELy/yKlthulczIuCDHinCH3AWGpjbutV+Auu7YNy5z8mbOVsWL?=
 =?us-ascii?Q?Nf4umXRz/z3LMEbBRoQWWhAwrm+4CBCDiYAT9fVQsKIL/PHTG228eG9t55U0?=
 =?us-ascii?Q?ZQThufhq2wkQUsJNm34Y4gejwH+i+LL1FZzxF3Kvoq6WQxOLLz3+rdGvA6FE?=
 =?us-ascii?Q?GABAicl9WwhcU2ORdZ2F0PnOM0AHrAS4+AVUp0LnT5zGjLADjXrztsNqfS6u?=
 =?us-ascii?Q?TIRfXLLTeV5g6m1oDkO4C1u45kmap/Ovva65jjT5/ojxdXGERAFFbVpDusui?=
 =?us-ascii?Q?cYU9NHSgRVdJdtCppUIkO9FPvPXEvb4=3D?=
X-Exchange-RoutingPolicyChecked: 
	GFxEN7QOTymG7/iX7dY/Yv+AbHtLG/V52/V0Z+cEjgLcliqbJveUckMoMUUcMxnN3/1V0AwnrKSzW64Tfb7+MAP7MOJNJSEcenkomi2JF3Bru3NiI6h/ZVVzdyQYulUv1d0PDdwq/Q3H6mQeIBJ1cNF0UDR+iBkXbiXtp2oFgpfHnppRaR5pu6oCOZ3/0L9fbeCJjAGJaBhagfjRPU4p61mN4edsoYBnoMZahN+mxWuHnfnvX5fsTk34xAgNKf3WSSVgFt26zvX6aiLn3HYSQDC14hA06J/V3yXZrTVs7To4XhPMPx4nHhSYLvPkgNv+AH5eyobutA139qf/Yy+frw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fec99e-c944-41a1-d469-08de8119981a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:00:06.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6FIUW3ytQmPCYQA+FS28gnetJXyI+IEcTzLWUE3UB6sbIYtoHuTo5j96YX62OFDTjO+ZbH/7OG2i5zZrl+VeeecFPmK2YX6UFugIxhQeOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX9nbnJ3IgEYDJ
 9c1eaZ6381BaQ7I29g5Ukqyq2QsQ9Hx0ULPoNPaUN+S+eO09cwkgeE/OUeYVmRxjM4kK4PrItn9
 CbliOjaYAEL+EZWK1mg09A2O2lKSuXXOtlyzf2xxlDmGBJ9AWMq3vEkzZprPmLsdWBXcWUYsDOJ
 TDWq49kqcIpI1pk3tXaCMnuFtm+ueez6u79qDT6TZri4kSib+l+SNGOF01dsfHhisE1j0fs34RF
 QVCY77RogyvkTzmS1fFwspRTFkzPrrvUPry7D18CiWCakCeVewv4JMGGocT4u07xPM2DgqxVRvc
 Z2V4wzSFtC+qjXwE/acXy/5ZZSJAhtUHIi5xNJBV287FA05xg6hFXEaf+aQANhbMeWx9dfrMQq4
 WjHGYO2E0FEJao0t1NMnkJ5jne514Ng/tKSZrJHJMZOMcft3XtRetsjvOBGlWmiwpMGDb4fjM/H
 xpC6P9ltHQ27IGbTtnA==
X-Authority-Analysis: v=2.4 cv=Vsguwu2n c=1 sm=1 tr=0 ts=69b43488 cx=c_pps
 a=O5ql0vl6PVxeYGQXc+vjrA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=1gVo_yxusmGMHPU948wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: LT9uhvXg7IeRKaed3BLoeOBsqN4p4kTR
X-Proofpoint-ORIG-GUID: UFKJMRfcwClCn6KuEG9wKBbGZ8If-DIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233058

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add support for rust-out-of-tree module compilation:
- Add dependency to rust-native
- Remap ${S} in compiled output to avoid buildpath errors
- Added check to skip rust out-of-ree-module compilation,
  if rust kernel support is not enabled

Co-developed-by:Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module-rust.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes-recipe/module-rust.bbclass

diff --git a/meta/classes-recipe/module-rust.bbclass b/meta/classes-recipe/module-rust.bbclass
new file mode 100644
index 0000000000..a043361f10
--- /dev/null
+++ b/meta/classes-recipe/module-rust.bbclass
@@ -0,0 +1,18 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit module
+
+DEPENDS += " rust-native"
+
+RUST_DEBUG_REMAP = "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR} "
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
+python __anonymous() {
+    if not bb.utils.contains('KERNEL_FEATURES', 'rust', True, False, d):
+       raise bb.parse.SkipRecipe("Skipping rust-out-of-tree-module: 'rust' is not enabled in KERNEL_FEATURES")
+}
-- 
2.49.0


