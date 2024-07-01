Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C41FC30653
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:10:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21051.1719842996436553260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 07:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79128b38c7=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4611nw7n001159
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 14:09:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4027fx9vay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 14:09:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9evQ5l7mebp26LzYRFkPfeDxuxlIlO7BT4YPzDytQq7DH+pYT7GALJuPW2O4ltglxMloaoBk4YFY4IJ6KoeiS4Z2Hm5rnoUN56vNW+88C4Pb0RsZ7VsAAmdRtrJhfJjwB1/yqRe7zDfsEIaATiuwihuTOLzG8y3aTo9umj2UD2OKI1L1hMhQ+l3P0ap7aDv8NUj16b1pYFCN0aYyCdPAI/4VsL5e7Mbw5icGhpkQJXYKnlFaeFzxG9j4U4XRSZKVEGxYQAUSjGrnZUuNIEJzSp2WFhuGkfft6NoOVTf1wjkspwKfeerob0mKpzrldJ5U12jt9S/+4x5QYz9EbIOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLlIXMLGX7LLDLjDl0T1UxuAvEI8zCzR7w1BBffJJK8=;
 b=KPODv0A4Lzu0NKumu7b7RPs19Bk+UNIh0MwdPdtMQhcNMuEHmtkrQlcZO3drRtGoOcRxW2deT9WmZTwmtFW/17r3ODXsXZowg8esrcbNM3GcFB7lepXGoGGJs8xT3S9wYia9dzf+v7vRU+7XuRlAeuIG3+9USjqC4PctVimJWBVBNVetJYZen6szdcZERX4xzUSWNAoK/flFeFRORuxErWoeeRAvtmo8+wo2WX5s4qZAyVX5FR6j95NtHGTlY3UOvCJrEiS1+ExfKdOr4Zu+LXRHwWtk4gMF1TZ93ZG5/n8dztoSR8WaKvH8TYC5EfAtRPY3KttaSSvTFgdwPVqFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Mon, 1 Jul
 2024 14:09:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 14:09:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] libpam: fix runtime error in pam_pwhistory moudle
Date: Mon,  1 Jul 2024 22:09:38 +0800
Message-Id: <20240701140938.595511-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: a9de44da-a90d-41fb-63e3-08dc99d77872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iqORP3UxEc4Xl9MjRHzQzfVshx3Vmro6RVsxDtRkhHIvEI3C/kFsch92a8ij?=
 =?us-ascii?Q?NBwK2lM3bvgQ2lDB7YFXebBJmw3s83TbuCbGam/g4CpzVqPR/e/TdYZrieRG?=
 =?us-ascii?Q?Nh9Xp6Lx+Sq3RJGsN9CGuOqDxRN7A8Go8wC6HcG+tu90cGQsvyxX7tLc1xTX?=
 =?us-ascii?Q?/Q67bsXXluDFEJQMGxem572qTaR4VcbLGHZggMyX9VOVCq/O9oSkV5l2GGHy?=
 =?us-ascii?Q?dYII5DFjHRpeY/3AzgDZ4Pf7T3NiL/LD1oCbp0hFlfl4DT+VlKsu6btGO49D?=
 =?us-ascii?Q?mPGq8LFwcqbf2hMtegwJGBFb09R3tiQrMCBlg6fU8KKGMJa9DqpkGRW2T+/M?=
 =?us-ascii?Q?hkeqcZlwMdtO3Suc3JQlExJBsJDgDA0dmQKsARMGWeI3O0Hd2YAuDDPWa5Dx?=
 =?us-ascii?Q?Tw8HEbrjOR8VYwyHGHxPbVPakAy2bVF4FKY3hMgIWIOpnvwf0Dtc6gOym4XA?=
 =?us-ascii?Q?ZKEUkfO1r91nFHV/VMI+KuOmOVT1Df65Mzbgbz7w4hw/kOsLj87diG96T37o?=
 =?us-ascii?Q?LRlWhsaKNyMGyurLJ7LTLPOYTqZa22O/Zb5QzR8gjkKNu1b6qdfxW9D5TWCG?=
 =?us-ascii?Q?uqmh2AZizxTRsQkc5mRexgOA2xK/0Qa9Sf7F7BsjutCSB1J/jWQmuBX+tpRN?=
 =?us-ascii?Q?W1POY3BsgfWtIWq3S55llFrzjqofJvfO3Isji4h1chyKUUcDl464KuEGk43k?=
 =?us-ascii?Q?OJXvlokhiifO/YHWKRgHtjKs1hf7jKDWDZ9A7Q+/q5ZOIFYoXjKm/7mZUQWc?=
 =?us-ascii?Q?5uDt8j/43t3YZ0SOGmrQeYuwKSIXSQJctVXvkD0mgAmwrP6CrpI9ncXtEN5C?=
 =?us-ascii?Q?E5aOCX+9KQjPi7cyq73Dt60qDiZryM7QrqPV5tfnsYUoeZuB9ZF4MxELTaQs?=
 =?us-ascii?Q?MAIg41sktGlm8ob4nFbG7CTMRtMtAnsxsbyEgJMUu+j7jx69t0kQ4wF5+v0l?=
 =?us-ascii?Q?V94O2FNKjeRP75MTYQnYQ9A8wAyIxeubmj/9zQCrEmmOv3nIofv4PkctPmvq?=
 =?us-ascii?Q?1mdsWAzrjh0JErX74miPU5+lxwxYZqHiQVyzoYiJEO7ttM7NNSKl9SwpN2PZ?=
 =?us-ascii?Q?1aChXtreRAAXpL6Xjk9CG7Kl0Ot6TATb33i14Ne8209qbwvirAGAOve9WN/c?=
 =?us-ascii?Q?usRgfBBOX4LaymsM/aVp+4IDO/ArFd513L0UPiDhAZVSh1Oztu58gFDNDYSW?=
 =?us-ascii?Q?WGOKvzzEpdZXL0LZ3gEVnvXlHBX722oN7G1A0vCnSb35VPpPH5VnM4Ib7Wxq?=
 =?us-ascii?Q?+cyH+B0q8ec1OJZTKwC4CdooOgMRcAE06hy4KsRztCfSGPVUsykvayVVv3/e?=
 =?us-ascii?Q?jJXjeohiAP4LSnn3Apd0sKgjyDVOb4sVQgrZXsiymGfAj45QYIgtGylO3O15?=
 =?us-ascii?Q?9o4BA1c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rEB8cljhoo3fg1rtBwca4OGCV5nh5XsQYd1mToBAbEbOAx6KwFbwlB5kbqyk?=
 =?us-ascii?Q?E7a/RFeWTVOMnCW7jbLVXzG88s2s1D+7HQlq1lzWQKjDn2sEuMKALD3vrvhg?=
 =?us-ascii?Q?YkroD1ax5JA1P4zFW/oFOKcCZpBc2hSCVd3TK8svUz7WY/fLP3hlIl+zxc3U?=
 =?us-ascii?Q?pZnDSIGhEBdkO38O9XyledJ8oZVoVoCHyLv8dXvitlwbfU4CdS2RkqX6zVp8?=
 =?us-ascii?Q?EzAjQuedmrL8RqFsgawcWCC3bcofhAqZPUphhLVkh7J3A5ZCtCoY6GdV/sAK?=
 =?us-ascii?Q?0sANZ5LPM8oEN1zOGSYYcrgS3tAI5lACRxw6+Bm7xPOAbQaVBeiYLHxTrNHN?=
 =?us-ascii?Q?VpAcuYLGledPVGxHpdylQfJi7k7cGJ8EQtL4TTLX1X6R8mbycwGpjSBo0vBP?=
 =?us-ascii?Q?vUNP0NDid9gmBcn4teLvuL86XafkMP24jR8zt/35oaJGJQU7voKpVFkwR1Pj?=
 =?us-ascii?Q?U1NidvsKRJfa+C3RIIJ6TNk/W/J8VZoz7c9pfT6mck1Fa6FQTjS7n8w1jLgo?=
 =?us-ascii?Q?ly60MkJTSJsxmJHrvz2xGtTKyKFnc92oB6+in+JoephfyCM9E//6KFoO5Mzi?=
 =?us-ascii?Q?CbFKdTxcPWqkgx6E8jmrrsUGwgxr8ujnEDQSdNXa7sdMcw02Fr2qIJB4Bj5v?=
 =?us-ascii?Q?B0a5YQdwS3cKOsN/KE7d7fxCUUELSuvQQjUvukZU7JCG8KL8gCKxxabgx0aE?=
 =?us-ascii?Q?T6g41ojmOSwq7CmTFK22D3y0T9vNnnWHWG9eMMEfhT7wGUtuJ1GIm62tEMyl?=
 =?us-ascii?Q?Wsl0DOAeu4BJiclJA6u08alsh/M/tWYcXocCJllRD1474GvdEUIJ4cE5We1g?=
 =?us-ascii?Q?IJ4UjWLr7onIeKli8gT9nU34edntUTUyGR51XpU1NqXvFIF7vSfo6BWGdjwO?=
 =?us-ascii?Q?hykAjEYcFsub3iGDRFnKUBa9CrXJ94X9FoW8LMywgoJeb6BovjozmEww8SGD?=
 =?us-ascii?Q?A7VvSjx0VTkUyz/A8PFY/zClZ2gsXp85nTh+LCZ69iPZ2KpO/ApS6B/uHGdJ?=
 =?us-ascii?Q?CEfX0htIidpVL9/FKs1ldBR4xOmpQ5yEJ0WoQGVyVIg4wtWwlMQdBB9eipUj?=
 =?us-ascii?Q?GzT8D3vH8LuSOpW8PmNt4zH2DYpDyimz0NGVjPO0zkGEh633dep4XuEnr0X2?=
 =?us-ascii?Q?n8ML2EslPFGaeqGbvjGx79Lg9RiXFChmNgzDT/p+u0ilE7YLxdk16jlb64IX?=
 =?us-ascii?Q?KsZqmW8ivGW0WtmDP+3CkhSyLrorRnskEI95eAMNno90uixoMDxGKTOEE/pW?=
 =?us-ascii?Q?sV0tfizJOg1hDVlhpS0wDO5yNRs300wochHdxzANndfqEIX6Vv3Pkwx38oTk?=
 =?us-ascii?Q?IlXwl3uH89pDT63XBhA+m63uM9+3WFuI7APnjn/Aa+MD8KP18TRseaQ/TCRl?=
 =?us-ascii?Q?h1PZSYMeGYjeVfW4oYju7uEy+Q/jDWV1VLtTQeFrwEafeFdSk99z1wc4t5BZ?=
 =?us-ascii?Q?qqUR2eawB59NNM6CN6OG+fKOH8/spkuBK2DNgR6G8yEvQ4GRf6GjP2QJ53Yb?=
 =?us-ascii?Q?IuKBfy+oQ1gF0EXSdy7H4um6VRIbUlLr7IkBLW+ptqoLdwLJOusZ+SGZOlPF?=
 =?us-ascii?Q?StnZ/AeCY19t7hiPJvHQfY/u+90wqE66zWGb8Sv5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9de44da-a90d-41fb-63e3-08dc99d77872
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 14:09:50.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9mJbisQNey4PZfcW0Fi6ttkHMnXxsF8O5vEtQVCVm3Ha+sJWCS3M61QPwGhJcvh12tCPMUQESx53iouXwfLkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
X-Proofpoint-ORIG-GUID: euNKlEzzGgZV3sjmI7vyGDfpIKyVATkI
X-Proofpoint-GUID: euNKlEzzGgZV3sjmI7vyGDfpIKyVATkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_12,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 14:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201304

Backport a patch to fix runtime error in pam_pwhistory module when
selinux is enabled:

root@qemux86-64:~# passwd
passwd: System error
passwd: password unchanged

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...x-passing-NULL-filename-argument-to-.patch | 69 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch b/meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch
new file mode 100644
index 0000000000..23d5646235
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch
@@ -0,0 +1,69 @@
+From 80dc2d410595b5193d32f965185710df27f3984e Mon Sep 17 00:00:00 2001
+From: Md Zain Hasib <hasibm@vmware.com>
+Date: Sat, 29 Jul 2023 11:01:35 +0530
+Subject: [PATCH] pam_pwhistory: fix passing NULL filename argument to
+ pwhistory helper
+
+This change fixes a bug when pwhistory_helper is invoked from
+pam_pwhistory with an NULL filename, pwhistory_helper receives a short
+circuited argc count of 3, ignoring the rest of the arguments passed
+due to filename being NULL. To resolve the issue, an empty string is
+passed in case the filename is empty, which is later changed back to
+NULL in pwhistory_helper so that it can be passed to opasswd to read
+the default opasswd file.
+
+* modules/pam_pwhistory/pam_pwhistory.c (run_save_helper,
+run_check_helper): Replace NULL filename argument with an empty string.
+* modules/pam_pwhistory/pwhistory_helper.c (main): Replace empty string
+filename argument with NULL.
+
+Fixes: 11c35109a67f ("pam_pwhistory: Enable alternate location for password history file (#396)")
+Signed-off-by: Dmitry V. Levin <ldv@strace.io>
+
+Upstream-Status: Backport
+[https://github.com/linux-pam/linux-pam/commit/80dc2d410595b5193d32f965185710df27f3984e]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ modules/pam_pwhistory/pam_pwhistory.c    | 4 ++--
+ modules/pam_pwhistory/pwhistory_helper.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/modules/pam_pwhistory/pam_pwhistory.c b/modules/pam_pwhistory/pam_pwhistory.c
+index 5a7fb811..98ddffce 100644
+--- a/modules/pam_pwhistory/pam_pwhistory.c
++++ b/modules/pam_pwhistory/pam_pwhistory.c
+@@ -141,7 +141,7 @@ run_save_helper(pam_handle_t *pamh, const char *user,
+       args[0] = (char *)PWHISTORY_HELPER;
+       args[1] = (char *)"save";
+       args[2] = (char *)user;
+-      args[3] = (char *)filename;
++      args[3] = (char *)((filename != NULL) ? filename : "");
+       DIAG_POP_IGNORE_CAST_QUAL;
+       if (asprintf(&args[4], "%d", howmany) < 0 ||
+           asprintf(&args[5], "%d", debug) < 0)
+@@ -228,7 +228,7 @@ run_check_helper(pam_handle_t *pamh, const char *user,
+       args[0] = (char *)PWHISTORY_HELPER;
+       args[1] = (char *)"check";
+       args[2] = (char *)user;
+-      args[3] = (char *)filename;
++      args[3] = (char *)((filename != NULL) ? filename : "");
+       DIAG_POP_IGNORE_CAST_QUAL;
+       if (asprintf(&args[4], "%d", debug) < 0)
+         {
+diff --git a/modules/pam_pwhistory/pwhistory_helper.c b/modules/pam_pwhistory/pwhistory_helper.c
+index 469d95fa..fb9a1e31 100644
+--- a/modules/pam_pwhistory/pwhistory_helper.c
++++ b/modules/pam_pwhistory/pwhistory_helper.c
+@@ -108,7 +108,7 @@ main(int argc, char *argv[])
+ 
+   option = argv[1];
+   user = argv[2];
+-  filename = argv[3];
++  filename = (argv[3][0] != '\0') ? argv[3] : NULL;
+ 
+   if (strcmp(option, "check") == 0 && argc == 5)
+     return check_history(user, filename, argv[4]);
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index 2a53bb4cc5..ef32d19f3d 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://run-ptest \
            file://pam-volatiles.conf \
            file://0001-pam_namespace-include-stdint-h.patch \
+           file://0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch \
            "
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
-- 
2.25.1


