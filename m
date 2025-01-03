Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082E9E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 09:25:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26894.1735896309139477117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 01:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=30983b852f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038Xc0n018516
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 01:25:09 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq4rf4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 01:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4zFrDoXLmqHMC+CtNDNYuAGwda7Qw8Y0J8+np9AC8Ce7fmDyqa+m24Ec/qNliQZFfFmCLBS67+CHlNo4r1GDxquv1P42Mj2Za7MDrvwm8/f2L5zUgXllDgDIHKekdIFp5uOLRG567FW5VOHTIBuIK3a+QtZPdFErX1BDbrFCP913+1+xGxeEPhe78yVF31zWhgZyUdqwJGrndCFeRYTT1yiTOTifXh4Pa4XoQemagHmHMC93vEoKw0IM8UoQgABcVWTZA+xh5B2ll/G9lujaDAj0aIAuSzjkRvbAifUWG6KYe+2jD+Dpxel+j0jK8gpIXJAWz7qXCawbMCigmnYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJAlbO+JyHmudevhGSjDUZZ3t/Uoa1t9evWxXIrNNKA=;
 b=x5ioRCT1MvxWvOvfDedub683Gxfjd8MYVqHuuSOnnoucSLSvdxDYqIYEVbqMYXnjjP6Hz3XRRfLXvsY46iRlTIzYhY1bFLCPNU46BfXmD87NKcHv0jcwt8XCB2sjYVKauZBY5wpPp9/VBd/qx9IcevNqn41cKXZOJ+4e11uQJjoF3ZQNh1/0dzBLmSTeOJJBEpHMESMCZnknrhP2Pp3vBkNCAq4xb1Jp7WINnrXPwuHk4Su4dJ+CBPVJWozX/i+HObrsObbbtgmtyZtnvK9/bcP+wvupkeI9kpPocJLLzd2wXc6NvKHv9zDTuVC12E67WGa25q0bayLb7mPzZ7ixpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 09:25:02 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Fri, 3 Jan 2025
 09:25:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] util-linux: replace local patch with upstream patch
Date: Fri,  3 Jan 2025 17:24:44 +0800
Message-Id: <20250103092445.566172-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250103092445.566172-1-yi.zhao@windriver.com>
References: <20250103092445.566172-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:403:a::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e14fc66-26a0-497e-c290-08dd2bd88060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KiM2xefOQdTNN7FIrdH+HVhlQaeHDcRYZykcAcYYTO2RGDfHIBj0Xc7DcroR?=
 =?us-ascii?Q?b24A06v83a/qf0fk1reJH4U81jyddSmbBjw/aW06a9bfuiLVnXJtHOBT9mCm?=
 =?us-ascii?Q?kUd5AaE5egQQ5YaZMTGf47bPkvtRIx3gDq++iVQSI9NsLSCYmd3PgxR7uw/3?=
 =?us-ascii?Q?Nt7nSK2WBrfuwYiRAvPk63wt3pXaAkrZV3JXJxdyTvuiSmRyXcOucIur25Me?=
 =?us-ascii?Q?Fcjsevvj6OCzCJI9HAv701WEuE3ekNjAf4JGYTmLjMowfLgwYxZE8pZ7vTXI?=
 =?us-ascii?Q?Jid4a9I9ZvWXq/6KEbf/1HOwwy+PbrPxCYTdKl/rRiq9Jy4tgmm2WPDmuozf?=
 =?us-ascii?Q?P2mGw9aa2wGh+oCtvYU8gTrAKMOyePwS3uNEvYXtsxixJkpREYAxtjaNkrIj?=
 =?us-ascii?Q?n+KE2rHl0Hn8+je6hpljNFE8c3/OmC/Ll9HPC912kIwUty65T5URqcxAhJrf?=
 =?us-ascii?Q?ETa1JUd6cd+nzw9vLGehZmCgTJyA+4ILRxK/pBmYEaS+DmuvAFlAkJmyE9G8?=
 =?us-ascii?Q?r17JRpjY4LjLDh7fboz03apR5cMRWPdEr/7CstuceTllprjB5U5KFPR5XgVg?=
 =?us-ascii?Q?wxmSUB1WvlpO/4oIcD5tqjMTJGk3I3uTisKOGbz461dFkDjKiLT0I7rhIaGJ?=
 =?us-ascii?Q?oQI/q1PoVUEDpcKkLc6xarPmWpIU7BEIqRPKkWDTueMC7n1OFXDONIvW4zfC?=
 =?us-ascii?Q?jrVTXD/l1+ayqJPySBJtLMLsbs/8LBrNECL3lwK9+Nh+grj9PC3mxVADBIMO?=
 =?us-ascii?Q?HEvNijA7CxK+XH2cxBCcfFdrD95/xKos/lMY2bYsfsJXNXMNphDmMmj1e9GS?=
 =?us-ascii?Q?l26WDoWH8FlTFL/t+c7F/uuNNMPBGhBGfugsu/wCkgtfEBQ23fI+pV8pmg1G?=
 =?us-ascii?Q?SvQg8iuIG6/wVNk1MINwCjHxb5s0VAtnEABdlP5Ymxq1atjibEUab4McynWc?=
 =?us-ascii?Q?NVFqhGrvlBeSwxO5NfCpM+CWQSojEvz+7pn8pcXMJye7GMLsBS+h3EJW16gM?=
 =?us-ascii?Q?KxHr4SmgEx1sCjatJtSMcKqEFH3KhrZCPwfaLDhQL8lfJwk3fvEIEfcFSeo/?=
 =?us-ascii?Q?JOKUFq3wae1Wmq8AjNwxRA4Ggvcr7EB2sZ0dyZExtfdMcqoYhk+bRUXwFC01?=
 =?us-ascii?Q?h42ulkq7qUb0FJCR35f9bK4uC8nbYUETFJcAuhbu4S3vLbKTEm2MOR5Ft6CP?=
 =?us-ascii?Q?T90qN6M+c45X/JR2iFjNXTpFJkOefxkkaHrtBotzgx8kwuV+X3JnKfjkHT8e?=
 =?us-ascii?Q?hSDzOYrBRPWfigQ1AbhyorRNTFFdV3kjmZPnEWe8EYtJ0Uj/ar0FxnymxQDP?=
 =?us-ascii?Q?0yXdI6upNrrIh7xB0E4vQmWZjkmF90GVtzadt4Iqh7ZxjfdVvsKjP0ESLCHH?=
 =?us-ascii?Q?8s/2fdpZQNlFUYhT9Q6GltB519pjJfsexjn7vdINlW/nbhJYhc34uwHhPEqg?=
 =?us-ascii?Q?CrlVUy8mAA344byodQN2nj3bcfe0NQVmaalqQytKeJtYaWjXOA5g/A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?waozyElu0Z6irvF0DOMRwwJGQmMBvDkfUg6Vt9NVE54y5ahEm5zlSvzrCxMb?=
 =?us-ascii?Q?ZYLfuiK4GH9wLhDcAM0nYG83B+k8b872fNWbAZhfD2oUgKrobIJ4X8AY2HRp?=
 =?us-ascii?Q?5SjLLJYYJ3FthB0x8wgTvl4rC8DuYjxSxN6dCrUmRjYIOzg6mbhvOMz6eiJP?=
 =?us-ascii?Q?G3TeYW+7oVx4gkmrvux4pwYHxjyRA0VdaHSjDUjgdMqUgsySkB9NIHzYBO83?=
 =?us-ascii?Q?7ImULBRImZDHSbaxfRKHII/+YhOMwZA8iCtOuNHwsCspWeBFD+s9/5DNo+WX?=
 =?us-ascii?Q?c2g+54vO1JMoTSbQILVucyafZLK4j7KPj9CpZan5qFvKo7NEVdCa2mnDrVtY?=
 =?us-ascii?Q?Uufb191e85S8eNt6M+NPZ7Fxzy1Kap7d/UkB7rwpM2MFd4JOQKEx3XIo3qSy?=
 =?us-ascii?Q?lj738o5X9lXZTjrAWfbeuK9Cn07q32Vx0rEPntXxYWkhDm7/XZh4V/XpRSfQ?=
 =?us-ascii?Q?axXBjL0hid0/vjCY+CdECmMljZFqYFwXPvW3UVzU2F/hc/uYMFMEcGwvCgCP?=
 =?us-ascii?Q?UzJLF87VZcTbKQUEWITpIYXcjnb3dzNQyA8GCn211tl5CD6r2HAS8aF99Vl+?=
 =?us-ascii?Q?LyblhBXcuuxz1h8fmc+8b36BK9esb/aHCwdKhaqR+QCgnQWmNs5XW1V1kmOk?=
 =?us-ascii?Q?UXENdIleqtA09Q9Q3c2VZU2d3H+y4kki+/98FyItvOPJFjguPRuLEW8T4HDW?=
 =?us-ascii?Q?dNlVFhW4K2co+fNLIDfN5xI17M/ErvdPFrolEGOuXG1v6MqM5/4YO4n7bgK7?=
 =?us-ascii?Q?WMkPmhn7A4Snr7bnUZ51S4bIkgA5wEqgjwVkQrfLyDpRtwiQr7Wg2EG9ZBuw?=
 =?us-ascii?Q?+US9GcAb4Gul0TitrXKnm6gFXQCx6JdaASBEULFHTw8gFrmCaGJcqqUn6AnB?=
 =?us-ascii?Q?xb7HdS0dU2p4u2ynKnfhvyYuZY4jlfWeyW1+uZZCQut+pSvnUH1O0LqIbo53?=
 =?us-ascii?Q?QHsJFDysI1SC6PlGMxjyqPw2raQRxKno7akax82Jv5Anp/Al+SRAiUxu5cQL?=
 =?us-ascii?Q?Fo34J1/RwcwuU9Giy3zhkU6AZab8P6tOpYAbmMufG5xavOimxka/7PMPU1uL?=
 =?us-ascii?Q?3+ToUz4i0FVryeDdRJngz84MNM17Oy8R+vyIokFvhX6kEAEuuKl2YILGN7b1?=
 =?us-ascii?Q?TDA32jcUoVi4rOCZCc5+g8HIHLp+LbZ6cGyWWmSeZ3Slvaoli/moJDaHAdJj?=
 =?us-ascii?Q?eh+g2XBz+uuH8OHVTzNouMtxcXjV169ylJ99ubV5AhvekNa9Jd/zFWPZfD0y?=
 =?us-ascii?Q?GzF3EOCr7epkI3k3H4gTUYJ1L49UeMDddeB0h5WJcpOTh4hZPPwntuEpaDUD?=
 =?us-ascii?Q?6nh1tUDccpdQFiXm34+vPAB/PEJKor7AaUqIsNQs/v7XRF4EnOWsvOc93DpF?=
 =?us-ascii?Q?ARlKU2JdC2mWCxJfcUptvLvDm0VBZ10imQcU8KMinltPNPZ9+065Y6MLDHQz?=
 =?us-ascii?Q?nycZ9qMSwc3jGMSERUQzlUPbbe1o00oupKn9ZpAsrXJ8xAosJQtcFQt4/z12?=
 =?us-ascii?Q?t7z276XBdhyYWFnFhOrHxJtxHncfLj1S93EI3UbYA5h56ahQxZNcm3B8cvek?=
 =?us-ascii?Q?FTnZ4pTuZxmz5/oSaedRQP67B7GJQZ7Y7ezv/7yS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e14fc66-26a0-497e-c290-08dd2bd88060
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 09:25:02.5031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVBQT2PVsoy8JhZZhnllSVHb4puc9oun30vm/r5Q3z+5eRh1XWV1DuQThu98KfVqWZMFk98dqDqTMP/f7gcMyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=6777acf4 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=b_pyp5wphmC0vpvZUIUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6d7GZ_mBaG-E-SnV6NcB1gwyVl0cJWk7
X-Proofpoint-ORIG-GUID: 6d7GZ_mBaG-E-SnV6NcB1gwyVl0cJWk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209328

There is a better solution upstream to fix the pam_lastlog2 installation
issue[1]. Backport this patch to replace the local patch.

[1] https://github.com/util-linux/util-linux/pull/3173

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  2 +-
 ...s-make-pam-install-path-configurable.patch | 65 ---------------
 ...x-securedir-and-pam_lastlog2-install.patch | 82 +++++++++++++++++++
 3 files changed, 83 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1c066631f3..1dc30c0535 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,7 +38,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-Revert-autotools-make-pam-install-path-configurable.patch \
+           file://0001-autotools-fix-securedir-and-pam_lastlog2-install.patch \
            file://libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch \
            "
 
diff --git a/meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch b/meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch
deleted file mode 100644
index e9f01fd0be..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-Revert-autotools-make-pam-install-path-configurable.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From af5b58cb77fc8e2e2e2f26aadef4b773b950eafc Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 21 Aug 2024 07:50:57 -0700
-Subject: [PATCH] Revert "autotools: make pam install path configurable"
-
-This reverts commit 0539b1ebd26f6a168b822374d7b167f8ef4a1997.
-
-If people want to use /lib instead of /usr/lib as $(libdir) and want
-lastlog2 pam module installed in /lib/security, there's no way to do so.
-
-Beside, we have:
-pam_lastlog2/meson.build:        pamlibdir = get_option('libdir') / 'security'
-
-So things are not in sync between Makemodule.am and meson.build with
-the original commit.
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3173]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.am                    | 1 -
- configure.ac                   | 3 ---
- pam_lastlog2/src/Makemodule.am | 3 ++-
- 3 files changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 54e0fd497..3f801c686 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -56,7 +56,6 @@ usrsbin_exec_PROGRAMS =
- man_MANS =
- pkgconfig_DATA =
- usrlib_exec_LTLIBRARIES =
--usrsecurelib_exec_LTLIBRARIES =
- bin_PROGRAMS =
- sbin_PROGRAMS =
- dist_usrbin_exec_SCRIPTS =
-diff --git a/configure.ac b/configure.ac
-index 82d0e4bf9..35a70aba4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -120,9 +120,6 @@ AS_CASE([$libdir],
- )
- AC_SUBST([usrlib_execdir])
- 
--usrsecurelib_execdir='${usrlib_execdir}/security'
--AC_SUBST([usrsecurelib_execdir])
--
- # static configuration maintaned by packages (e.g. /usr/lib)
- AC_ARG_VAR([SYSCONFSTATICDIR],
- 	   [Path to static system configuration, default ${prefix}/lib])
-diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
-index 6d2365378..f9a9b6b41 100644
---- a/pam_lastlog2/src/Makemodule.am
-+++ b/pam_lastlog2/src/Makemodule.am
-@@ -1,4 +1,5 @@
--usrsecurelib_exec_LTLIBRARIES += pam_lastlog2.la
-+securelibdir = $(libdir)/security
-+securelib_LTLIBRARIES = pam_lastlog2.la
- 
- pam_lastlog2_la_SOURCES = \
- 	pam_lastlog2/src/pam_lastlog2.c
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch b/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
new file mode 100644
index 0000000000..272e574a77
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
@@ -0,0 +1,82 @@
+From f912fb1bbb0ff5af2736d154347a3b9fc40476eb Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 27 Aug 2024 12:00:21 +0200
+Subject: [PATCH] autotools: fix securedir and pam_lastlog2 install
+
+Addresses: https://github.com/util-linux/util-linux/pull/3173
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/util-linux/util-linux/commit/9c787eaac43f5f01146f792b0239f587e4b81202]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile.am                    | 6 +++---
+ configure.ac                   | 6 +++---
+ pam_lastlog2/src/Makemodule.am | 2 +-
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ee2d553..a5dcaea 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -56,7 +56,7 @@ usrsbin_exec_PROGRAMS =
+ man_MANS =
+ pkgconfig_DATA =
+ usrlib_exec_LTLIBRARIES =
+-usrsecurelib_exec_LTLIBRARIES =
++securelib_exec_LTLIBRARIES =
+ bin_PROGRAMS =
+ sbin_PROGRAMS =
+ dist_usrbin_exec_SCRIPTS =
+@@ -155,11 +155,11 @@ EXTRA_DIST += \
+ # pylibmountexec module must be installed after usrlib_exec libraries,
+ # otherwise the libtool relink step will fail to find libmount.la and
+ # will try -lmount which is possibly not available.
+-# The same for usrsecurelib_exec and liblastlog2.la
++# The same for securelib_exec and liblastlog2.la
+ #
+ # So introduce this dependency rule:
+ # install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
+-# install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
++# install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
+ @verbatim_extra_dependency@
+ 
+ #
+diff --git a/configure.ac b/configure.ac
+index 0375d29..134cf38 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -123,8 +123,8 @@ AS_CASE([$libdir],
+ )
+ AC_SUBST([usrlib_execdir])
+ 
+-usrsecurelib_execdir='${usrlib_execdir}/security'
+-AC_SUBST([usrsecurelib_execdir])
++securelib_execdir='${libdir}/security'
++AC_SUBST([securelib_execdir])
+ 
+ # static configuration maintaned by packages (e.g. /usr/lib)
+ AC_ARG_VAR([SYSCONFSTATICDIR],
+@@ -2767,7 +2767,7 @@ verbatim_extra_dependency='
+ # otherwise the libtool relink step will fail to find libmount.la and
+ # will try -lmount which is possibly not available.
+ install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
+-install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
++install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
+ 
+ '
+ AC_SUBST([verbatim_extra_dependency])
+diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
+index 6d23653..a2becac 100644
+--- a/pam_lastlog2/src/Makemodule.am
++++ b/pam_lastlog2/src/Makemodule.am
+@@ -1,4 +1,4 @@
+-usrsecurelib_exec_LTLIBRARIES += pam_lastlog2.la
++securelib_exec_LTLIBRARIES += pam_lastlog2.la
+ 
+ pam_lastlog2_la_SOURCES = \
+ 	pam_lastlog2/src/pam_lastlog2.c
+-- 
+2.25.1
+
-- 
2.25.1


