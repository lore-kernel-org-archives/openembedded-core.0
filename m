Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E829C1B0D9
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10364.1740662454971617419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 05:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=415338782f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R5K2Hr023578
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:20:54 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmj574-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0QvQxTICryZkYUuD//T9dcMUIJBZvWg2xUP/qFJEU83VCffopwovTTWouKWnH0xXwWOqXa4JRw8pQN5lAZE8j7eGLjXGsQZJ+xyTrsNmueQ1JOiptKNJFywmtYRk3kVD72N4+uky8EFu3FA9x7Nsp7tlaGD+hTdMZML6N4H2VIuIGLjkq9ZsqSvT/jro329flcm3nroyVyI9psVFtQJmSTuLQ0Zlr67zvoY280C2tVuT4fJMESQXA+UpJFnJ+e+Z9uTyRwq/agJjKou+mi0duZN9EM66JBFrO3rKfz0QDr+m7gOSwCgJj0TOEmc6yEo4JTtVJp7Oeh5lATVyD+mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4IvoVQ6Tg08fvJF0X00lTyvW0diWb7pzTTUFz3s7nc=;
 b=jaZ2+1KHAzaWSt2130S+meuA0C6CCS2kXBUiyyanplG6FXH1QgL1Pyxv9nsIdcUwyJm2qDjmM53R6SO+UMQaZMn4jJAkTLNLxoIMlQeRpn/qRI5l6qVAypPNLuYj1CpgxFAIfgqDicD5D2yGKvHT2FQan0x43ICwqOAqmzOmTUU1xaL1L+LwkgIjIdsGyFPjGy5LTiKcib6vqf57GwUE6CTq7YxPeviY+N4vZFwSOOLDY3eb/AHsU4h+Yfnp00WCr+DKuzgBg3AAHSNl2D523MRu3ETurNhUghsPDUlG18ge+ZBFvdmnMt2rShEhRyM20R1vbfgFBLeVz9CTkXvr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.23; Thu, 27 Feb 2025 13:20:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 13:20:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: upgrade 20240930 -> 20250130
Date: Thu, 27 Feb 2025 21:20:34 +0800
Message-Id: <20250227132034.3925574-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e46467-11a4-4c68-41f4-08dd57318ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a+juZ0MAcR8Pxz5/HF76fS7dBgRSSWZ5S5nqkr12IruhSWEjv0y+shxZ3608?=
 =?us-ascii?Q?HXDxOyzsWvmIPh0Z0am7x0yKTAfQlILS9pE42e0vESJ2rnCAmLRMCP7sOkR+?=
 =?us-ascii?Q?T4c0Rr0vDWjL1WJu4T5OuvOhinGHw65Wgo25ECQy+OnuBhyC/Gx73idplL7F?=
 =?us-ascii?Q?PhCb+d7EEzZxeachvkjL2YVqYbeQMyLqeZhW7GsMgROWeq8Pyk1fGmQCB+mk?=
 =?us-ascii?Q?ZNQ1q6/PaaIDvz3gvKXaTPAmKkzzSI66Dji2tPuLg8rKjznPkxzBCXkdRBdw?=
 =?us-ascii?Q?QjK44VFMhWfi1im6++DSUPnJhd+e1XGiJ3T9G0wCFUOkfUVk3lTNVy+jW2t8?=
 =?us-ascii?Q?pzDdyOTW4iXc8+Yd0TwXFdujZjC7rCQ8QtSWM56KGpwp70uj8HbYGzcqBYPy?=
 =?us-ascii?Q?VKbz7BdK94TLzzD1ecBqREVcpo/SuVLdxC6c12hF+bJKXEgaz2eFbLzNRSn9?=
 =?us-ascii?Q?8x8mpm5gsOgsUTerbBmtk/0BBgvzKyZ1ZLrJT+/+lDVV9M28nHcXzBQwL2Ym?=
 =?us-ascii?Q?/kOP9AP7xaODn76Xo2btsatgjYSMRc15BI0G6hFHjYtPssxSrx6MdP08y1Fo?=
 =?us-ascii?Q?guGmq6eNgLcubCUq55f90AP0pMHl6wBjUryVIKqNPyuh8ix84MT0kMvUs/rv?=
 =?us-ascii?Q?jGxkb2dCbXJ2s+9KIzxZwQTp8suqImwGmDsLoMixDyCOP3oDB+vQPIbEr6k1?=
 =?us-ascii?Q?Fjlf+wEVYI/3DQSNfJ17DNXi+W8rSH1EUbgIx/AXK7NVXRqfw/nFA6WOl1ov?=
 =?us-ascii?Q?bhi8vjv2uMyI8d5ekswh6PqPnfmBmywqJCIwQeDqmy9L+X6nZFIuoJl+zoPn?=
 =?us-ascii?Q?btWXp+2on6l4cyJGj64NFmXAtjS/QvRRi8LeAZlNb3OvLbN7IYsi6iy81FxS?=
 =?us-ascii?Q?VmBYex/kS/Ep7iiqV1uFmS5gOfF0Zi9QNCy06q5u3tgL0lWpxKoMNNpkTBnD?=
 =?us-ascii?Q?KF4dutYMh0yigwzFfyyNmw6zDCsu7YV63W3PVEsvSISowklHjJU4P+31wein?=
 =?us-ascii?Q?tGw4kj4QJ0gJIQLmyOnk5RiBfmvYFxsG1sUARIKBaBrzUmt5wGIbyuOsIiWU?=
 =?us-ascii?Q?yrQnfb5LyfPJZrMD7IZXhp7pnAwOw3a0ek6oOvPUPMuf7Sp6vzd8s76i8+Jq?=
 =?us-ascii?Q?W0EO0Pt0zSJWTBpijo2c5oI80v1beNAqjJc/1aRsTWImFhMKVLfbpaHWJ/4v?=
 =?us-ascii?Q?IElfnYTtyiUGpfXmE8k2O8fSAkgnf5a5MUhXNvxv1nBnUX4ewmqr9Nr1pPZu?=
 =?us-ascii?Q?0K6y6rzoh3K8UcMxEew5XOdmXyn7TaPqxsTuQ3d9t6b3uixpGG7pmw9dfD7j?=
 =?us-ascii?Q?1xWO0bYQxGwFiOlnGhymO2P2zFUmgtvp5R9zEPnu4hVZTgFHzeZct7I21Knn?=
 =?us-ascii?Q?wKOvj87rHsdf2RcZ9jFqUdc8Kj6r?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WfrmxPtXwvbxGAULc7FSGYJ4JA9LBoo9EfeqARovmIsR51hAMuW8rHIsF+Uw?=
 =?us-ascii?Q?2bZ9luCk+6Y7ZPfEc4QZC1IpkX+qst2fkiP/mb4fvV3S5SiBfhXB0Cuyy2g7?=
 =?us-ascii?Q?HfuNu1pSgJRPCXWmf26hz/7U4xzWyYZaf3fch3xLgLJZS5FYVsTBhznKpEME?=
 =?us-ascii?Q?laggboEOxgSEupufKTshGHhJI/SDeJs2DpZo8R3ZXX3qiW+7crLmNBxcKtFY?=
 =?us-ascii?Q?nPAuhpP9aaaxArz/vreGAlHIo3AolrMn9tGjlEFJA3DIVDmMQF/EESrhaiAo?=
 =?us-ascii?Q?nAz4GsTSvDAOVqa9wxMVZoDZFYnJDuvSlT2RXHNA7q0IsOzFj3vNk5as1b9/?=
 =?us-ascii?Q?HvtvuXVzqqWY5GVOBH90I3MAuj4jaqi9LpWiv4y9HVzKFlTw1efGy94ODQjM?=
 =?us-ascii?Q?pjdVvEO5V0JLDVOFnKMaXvMMXCdzwkcu+vPgu+lcXnPNnGs94NEx/8yCIVpL?=
 =?us-ascii?Q?vEhSSsUAg1LHA7atuFSG5cjRRWrh7j0xxgR6gG3txkKkImLW62KA6cv8IFKT?=
 =?us-ascii?Q?Xwy4eej+ZQWZT3BA+iVZcriJfaQvPirwSGTLSXp/7isWQMuRKOMG+v1szY7Q?=
 =?us-ascii?Q?5P0nPj21bdWybEb5A4lEJGfjI1aA+s9ha0sH3qw0Zd4z3SfwYj6nG5k5CuYp?=
 =?us-ascii?Q?IlX/sl25CuG+919slrEil++tkv1HiKA1ksvPcO6H7JE/eTs6ymLwTxk9h9Tz?=
 =?us-ascii?Q?um20egAGr/lR+ykKCFyDOhYTEXRQszZSLNeBM2f+LWVFOVIhOrjPc7ral9YC?=
 =?us-ascii?Q?GQjtus8Q6XPpcmUdO6SbPW9poQtIrmITV9Q46jCnT6Wa2R2+DLIQTirk2y0Q?=
 =?us-ascii?Q?ebB22pGhgqwbcIcA5hujEgAmxEdfU7aqz2RXeaAHGO/sql4fREIWqVOF5sLU?=
 =?us-ascii?Q?OSVJ3JPCMJ193UPwFoGFr+fZSI3VEKI2QXllfX0GvCJpl9kAwxAYpA2KKtX9?=
 =?us-ascii?Q?V9qFF0iCbQEnOFUn52Mt+3XudcOIEZUVMC9+eW0rNO2mvRPR/lK7VdddTKhc?=
 =?us-ascii?Q?PaFLmv7LF7LSTNPS3jcoFNSEAE7tIpjDV0E4RPtgyrYFv/m+aSVAYticoKiy?=
 =?us-ascii?Q?cSAO60RM0o+BIv0EXzgA1Sf2aemWjbav67VuSZg1AcLbrJ2gTD6A0Qq7AvVQ?=
 =?us-ascii?Q?32D4NS8dKO1z2jdse7zgaKtv8pJmH98uKbW/ahrvJFZHhzeHkRBxeEKmJbLE?=
 =?us-ascii?Q?z6eCxjrqeSr9nftUNhuXV4UkriGxRdScA7VYfUEY0uUfuRR4PcMpuYS9pNx+?=
 =?us-ascii?Q?SH7oAZWjMS5KmeKSBgK174mOVmYK8QcjDnifxbpCUz/yw92RQNX4LCdZA0Qe?=
 =?us-ascii?Q?mNdB+naTGOFLbX6TEzpQ6n9ZuJfWflWHxoGI/H+x+X96bFr/vnNADytjG2VI?=
 =?us-ascii?Q?Ngy8zTiBnS10tnzCdks4bHPRzdK0BPizZtcev+Bq9ORReVuvHYKJ8/8vRbpk?=
 =?us-ascii?Q?UKhOd8FZVQ9FsZctQpgU0LuYKs7+srnMC9FLtZasahsOUeCiidgGfBV45wf9?=
 =?us-ascii?Q?17U8VjWNOrLBO3OWs/jzhxFOeFJ3NH05EzR16osF5MBYudhyagMNdUCYhQGc?=
 =?us-ascii?Q?JxTlKQMWw0V80kFcAoRVO6XMIZhmlI6P2fzy97EN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e46467-11a4-4c68-41f4-08dd57318ed7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 13:20:51.9735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQO6KpS2kmq9qA2rPzm+ovZXMCkEmBVizcOOcHpRSM+ADu3rn846UL8WJ/g92o+l1F8vdIPi7vpX1mtRwZV+aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
X-Proofpoint-GUID: ApSi-GXn7KMHE0uMHMQ6eSrp7YEfT1Jg
X-Authority-Analysis: v=2.4 cv=TuEchCXh c=1 sm=1 tr=0 ts=67c066b6 cx=c_pps a=oYCWE2dcp7hbP1SgTdEJ+A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=CCpqsmhAAAAA:8 a=0Ni6rV8TAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=z4xpoG0O8P8Z49Imcp4A:9 a=LD1QsIDK0S0A:10 a=ul9cdbp4aOFLsgKbc677:22 a=MEv8DOuCJPEGjlO0Qob3:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ApSi-GXn7KMHE0uMHMQ6eSrp7YEfT1Jg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212003

* Drop 0001-sched_attr-Do-not-define-for-glibc-2.41.patch as it has been
  merged upstream.
* Skip statmount02 case which does not work on musl.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 42 -------------------
 .../ltp/{ltp_20240930.bb => ltp_20250130.bb}  |  8 ++--
 2 files changed, 5 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
 rename meta/recipes-extended/ltp/{ltp_20240930.bb => ltp_20250130.bb} (95%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 58d665c7dd..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 38ac9ed7a4f7e2dcedb3c13d807ad0575435bab4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Oct 2024 14:37:12 -0700
-Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
-
-Fixes builds with glibc/trunk
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-October/040678.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/lapi/sched.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/lapi/sched.h b/include/lapi/sched.h
-index 26fdb628d..e1c7ff011 100644
---- a/include/lapi/sched.h
-+++ b/include/lapi/sched.h
-@@ -15,6 +15,8 @@
- #include "lapi/syscalls.h"
- #include "lapi/sched.h"
- 
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
- 	uint32_t size;
- 
-@@ -44,6 +46,7 @@ static inline int sched_getattr(pid_t pid, struct sched_attr *attr,
- {
- 	return syscall(__NR_sched_getattr, pid, attr, size, flags);
- }
-+#endif
- 
- #ifndef HAVE_CLONE3
- struct clone_args {
diff --git a/meta/recipes-extended/ltp/ltp_20240930.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
similarity index 95%
rename from meta/recipes-extended/ltp/ltp_20240930.bb
rename to meta/recipes-extended/ltp/ltp_20250130.bb
index 0760170c7b..96e402a79b 100644
--- a/meta/recipes-extended/ltp/ltp_20240930.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "60f81419c43f94ec182827ef0b9eb5baeb303419"
+SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
-           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -121,6 +120,8 @@ FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${pr
 INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
 INSANE_SKIP:${PN} += "already-stripped staticdev"
 
+CACHED_CONFIGUREVARS:libc-musl = "ac_cv_type_struct_mnt_id_req=no ac_cv_type_struct_statmount=no"
+
 remove_broken_musl_sources() {
 	[ "${TCLIBC}" = "musl" ] || return 0
 
@@ -134,7 +135,8 @@ remove_broken_musl_sources() {
 		testcases/kernel/syscalls/getcontext/getcontext01.c \
 		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 		testcases/kernel/syscalls/timer_create/timer_create01.c \
-		testcases/kernel/syscalls/timer_create/timer_create03.c
+		testcases/kernel/syscalls/timer_create/timer_create03.c \
+		testcases/kernel/syscalls/statmount/statmount02.c
 }
 do_patch[postfuncs] += "remove_broken_musl_sources"
 
-- 
2.25.1


