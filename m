Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA6FC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 08:18:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3256.1668500322709774079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 00:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8318f3f37c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AF7baAM014572
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 08:18:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt2faa6b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 08:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DagQpSF8badXc95wYSwwOVBLLdgkopMH2STBY8EmFgCncI8IwseSUxNV4bjvfigknktIyOHBC3ktSh4JJSOScVIH0Zvu5ugUf35+QKCTNc8+Z9QrGRKnk1bO6QrPoucD9qrIWNzHodO0PWno25isiRJGdB8cyKmSu8BmwmoytHizzW61TlkRWgigXbiSgA/Wd2+EOLSnrlh28TMV3n7Gi0p3bwCr34T2Ni8peqp8ldwdQC1HGIXyxaCo58kMC0if0vUt9nclM7e+lBNR4VG1aBN4Soa0VNmBb6AKDnKkBZMLTCHBhq15ZkY7GL4XLhDQlu0fjWLXgJUNx03HebXbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7tX1wFpJYWKLDfeJLvJQ/KyGkv5FF89byKK5L/Av4I=;
 b=HkQNWZm+Af/8O+vfSfAf2Q+t1WSINp/z+FMCrkcCOjEg8Xn2hn3aotpGMB3kPDdXsPsZTGZzR/4oXlAr5JD8aNsuNht75cOW/PUBdY9OE62oB9xywitShV7Ai/g0J5B7o47ba51tj7TUzQRUIgv9Hw1sm7WrLfCQ32x8ouxLSAz+mBBpZJK8gNcOjIRN23X758M3tFwVSEMeWocfe+T9NUcASvdgzwwg2Ec0qzYM51PzaajIlQvHFeo+BW07/dXNn6VmE4g17Y+7N1skn9sIoqK7eMueeJNbsKWTuiKFChqMKJjTmNLVdWrHpM/ev9G1XRyeeUcuty7PcGQV5Rt0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 08:18:37 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 08:18:37 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][kirkstone][PATCH] rng-tools: backport patch to adjust jitterentropy library to timeout/fail on long delay
Date: Tue, 15 Nov 2022 16:18:19 +0800
Message-Id: <20221115081819.761176-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:100:55::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 89fc7f66-2e4d-4a2e-a955-08dac6e1feee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X9IVv2iTuGsP7uoEFT2VAbQdASsvB6tCt3nCldYQevWpZztn3rdjdD9U1hjpiQSQE+nxR/1QKikl1c7O9+AcUzBJAVAKWolPwZb3jGVSJgTudecYYEDRu8J9G67TfN8mjzaZK+NJVJpgo/60mg6nYSUariw2Ia4xllh9Xl1+185AwvJLjJnFJI7oWt7J0wJUU2rWoBNDCfiTcVICuqSkW44rTABpPuXlw+h8xuHoNe9wQTk44R3N8aQboYLQ2Vra7HWOW+dQyzRxCvJ1ivwlEVrWpOc/iON+jNjgbuYclHeL3yAJZg6Sc4pllynRHSTC7zWeumaGn4As2EaQPyD4Iov1y50vp4JGFsGYbJACQi1q+DCxPIgooQQ2QRWDYZa/sCEt55VdhWrvswiaAqAHTbbw6Iw43D/qXh7IERoPUVpZHebaJCStuiXQtAXQG0+1MExdRd1qFtS5ZRF6oPSsYAr5gTZmg1+UnRcBal+2oB7/2ZwA8Wtf3d/Y4hjcZWG8mCnBZSkCLAGBGO5ckGYeKiA6cKGggkkAEdHPIGNhhW8VN3OJVFbJ6XPJxY52vRNA+j4pbr+zj+gzVes2extXXEU6DivV3OfrLJpiHXibL8tHWyVm4izmb7xAk+twfzbsq3E5AQNdhZ/T/saBVMWQbHQGeakqOB1ZaEB3tSkX5P4/iMPyNA396rPbGuXEreHXn+G+7Hhz1Nvm1rTDbDX4oTA5Yt3nSwMIvteYAyRO/qjqcO9M6lTQOCbWSUuT+Lw5T33OWpawF54jDwfXHss9dFYbelX0K4fEwqcEzAD/b88=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199015)(6666004)(6512007)(6506007)(52116002)(26005)(478600001)(966005)(6486002)(6916009)(316002)(1076003)(66946007)(66476007)(66556008)(8676002)(186003)(5660300002)(83380400001)(2616005)(41300700001)(44832011)(8936002)(2906002)(83170400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p1spfoWtlMVvLWo2aM0RwtI3UAkc81fvwenOxu6OzmXv7KJkhaf8ARPi3dmS?=
 =?us-ascii?Q?3i7nSRl3HvyPnnE6VDqOnUNkQDc45MqVLYYIhtjIIbVREVpFdxLkOMkzI2I3?=
 =?us-ascii?Q?XJ/CA4pBF+3YQ8kIL4OWrmzSobToe7+8pD+FstsfEWKgrlN31Mqp2bdfKZFm?=
 =?us-ascii?Q?hLKyuxWQX+MrPNbLnzw8uoAeTXFHhroXli8oSSRllfyMP8s0PFJoFQDgkbWi?=
 =?us-ascii?Q?BcNhUfCj/vwwV3kh+HP99SWWZFAm+J3IkD+ui+hAdDgSbICYuyxEhurh2ugQ?=
 =?us-ascii?Q?LsbKsm9kUSG1xSQNDB2gZ2kS35TY4SEgZJ+iqXpZcNL6gRELcjpPtRe7m8cI?=
 =?us-ascii?Q?uI4TrLRovNbsu3WBzSsRavG/JbxWX2EOazizJmJ3DVBI3KCPx8QHLcwcFAfo?=
 =?us-ascii?Q?XPamA78WjsAUoBJvebyX7JAVp+X9M4NMwnNl5zBYtD0fCJehqD+y5RUSHXnW?=
 =?us-ascii?Q?4P0HVhmKd5YhgRANyLrvKvX7EDsCt669Fjx9q8r72Ku/g1Za+h1pH3+W8PvC?=
 =?us-ascii?Q?7o33ZhO/X3Ae2ZltkL4skrqF8jiC2CqSyss7J36+QgddDis2RgltbjoGVevs?=
 =?us-ascii?Q?r8EL4R2ihYNJxT6zVvdNO1SxRbsNsuk0fRBRjHiPnwqY7YztO6ocBOZvs9iM?=
 =?us-ascii?Q?iat1tGWltn5JDooir5jMBLM2epAaBIODdD6FEEj+UwNx3tjVO6VZ61UlJoPg?=
 =?us-ascii?Q?nCrjqYh04FsoWQpQqZ4oHy6AXStIHsupjc4OCb9uFwVaYtQLqRe6VYIDOl9B?=
 =?us-ascii?Q?vK0k9P1rJeVv47IssO+A90dyJZsWuaBQ3ShzVwPLpdBLkiMSzsEVF3TG6rUt?=
 =?us-ascii?Q?yrAvlZJMOFHUzzM6KJ5vZ9rN2gqN4CmO89oVcxArazFglf7aR2sT0HvFegOn?=
 =?us-ascii?Q?niLZ4SJT08YP0DHR5P5MOkVGRIAPH9LcM4VwhdZJqhtz6+o27RlSAnQccgHQ?=
 =?us-ascii?Q?PSRg907RHELaFtNHZ7twLVBP9wVvoVLa8Y5hiH+GN4JDLLc0LPUUZ1pMz2EF?=
 =?us-ascii?Q?rA9Z2PPnumw2L2twhx3q6EXvBt9o69Sxyk3BhIoiCQAvCks8h7SxIxqB+Dex?=
 =?us-ascii?Q?9bJrmra9CNQjN9t1vcDGfdNaOZUcoMWYhZBCQWjoqvIdbbAA/tfVemtr4gWa?=
 =?us-ascii?Q?mdmOWLLXgqQx2PGez4Ca4xIPpddmFVkUEUDUqzP5KXoXNJh4DL9/bWJe75dA?=
 =?us-ascii?Q?OG2tRdVp+UJhyFnd4xyeAaSiBQaTVU+ECZXLtO1/Ou1cAjekhpDYAg8gFm7X?=
 =?us-ascii?Q?tg2nw9RDDkFLqGKuglskVXkfMkiHl/eVi4mP6rJfPZfsGr0HEUD58gsFDiEl?=
 =?us-ascii?Q?BCqXSZUFPd0dYfvfGUbviwAG5jctI+jiz493+thdq3uG1Ikm2FQDESlxa9AS?=
 =?us-ascii?Q?esgW3omlHOV3Etiq+u6+gg/RIYVExYi9Rdwe+ESo7LBU7zJyznt3QmsNXTp7?=
 =?us-ascii?Q?kGGFnVMft5jH62p2CNItWQMFBRlsr4Hlb1xRMBGnXazuFpdUrE4B13JJhWpJ?=
 =?us-ascii?Q?zz3XBb+Ri4wgyEs8nH3ZGKC1UuDGG0UEFz5quXahh++U5qckJUH44qTDPJLR?=
 =?us-ascii?Q?6nK5005cj2MY3U8/8zS8/fa0kd3EDwQ3uZpvHxAWQ5Bk4OqdHNO5+eLbxM6R?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fc7f66-2e4d-4a2e-a955-08dac6e1feee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 08:18:37.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1UpBzssiFiUTzdccC0JgWCqRPKGXEXYxs7TGIoXorD73Kg/oaMkkeGcWA4P2KPnra5cvo0u+ViWSEfsgXPq2chmgPvL0JwrdAFyBf1OnoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
X-Proofpoint-ORIG-GUID: 6rFGhpwtCccKuMmJDPRrUk9lub_tJXar
X-Proofpoint-GUID: 6rFGhpwtCccKuMmJDPRrUk9lub_tJXar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_04,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 08:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173266

Backport patch from upstream[1] to adjust jitter to timeout on init after 5 seconds in the event it takes
to long to gether jitter entropy.This also fix rng-tools take full cpu usage with whole cores on ARM platforms.

[1] https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...ropy-library-to-timeout-fail-on-long.patch | 144 ++++++++++++++++++
 .../rng-tools/rng-tools_6.15.bb               |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
new file mode 100644
index 0000000000..d70c6587aa
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
@@ -0,0 +1,144 @@
+From 3f1d6e53985e40cbe4c7380ce503ca2778d4cd9d Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Mon, 16 May 2022 13:38:54 -0400
+Subject: [PATCH] Adjust jitterentropy library to timeout/fail on long delay
+
+When running rngd -l its possible, on platforms that have low jitter
+entropy to block for long periods of time.  Adjust jitter to timeout on
+init after 5 seconds in the event it takes to long to gether jitter
+entropy
+
+Also while we're at it, I might have a build solution for the presence
+of internal timers.  When jitterentropy is built without internal
+timers, jent_notime_init is defined publically, but when it is built
+with timers, its declared as a static symbol, preenting resolution, so
+we can test to see if the function exists.  If it does we _don't_ have
+notime support. The logic is a bit backwards, but i think it works
+
+Upstream-Status: Backport from
+[https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ configure.ac  |  6 ++---
+ rngd_jitter.c | 61 +++++++++++++++++++++++++++++++++++++++------------
+ 2 files changed, 50 insertions(+), 17 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 40008ca..2e12308 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -94,9 +94,9 @@ AS_IF(
+ 		AC_SEARCH_LIBS(jent_version,jitterentropy,
+ 				[AM_CONDITIONAL([JITTER], [true])
+ 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
+-				AC_CHECK_LIB(jitterentropy, jent_entropy_switch_notime_impl,
+-				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
+-				[],-lpthread)],
++				AC_CHECK_LIB(jitterentropy, jent_notime_init,
++				[],
++				[AC_DEFINE([HAVE_JITTER_NOTIME],1, [Enable JITTER_NOTIME])],-lpthread)],
+ 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
+ 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
+ )
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index d1b17ba..3647b7f 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -400,6 +400,8 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 	int entflags = 0;
+ 	int ret;
+ 	int core_id = 0;
++	struct timespec base, now;
++	int rc;
+ 
+ 	signal(SIGUSR1, jitter_thread_exit_signal);
+ 
+@@ -508,6 +510,10 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 	CPU_FREE(cpus);
+ 	cpus = NULL;
+ 
++	flags = fcntl(pipefds[0], F_GETFL, 0);
++	flags |= O_NONBLOCK;
++	fcntl(pipefds[0], F_SETFL, flags);
++
+ 	if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
+ 		/*
+ 		 * Temporarily disable aes so we don't try to use it during init
+@@ -516,32 +522,59 @@ int init_jitter_entropy_source(struct rng *ent_src)
+ 		message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Initializing AES buffer\n");
+ 		aes_buf = malloc(tdata[0].buf_sz);
+ 		ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 0;
+-		if (xread_jitter(key, AES_BLOCK, ent_src)) {
+-			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling AES in JITTER source\n");
+-		} else if (xread_jitter(iv_buf, CHUNK_SIZE, ent_src)) {
+-			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling AES in JITTER source\n");
++		clock_gettime(CLOCK_REALTIME, &base);
++		do {
++			rc = xread_jitter(key, AES_BLOCK, ent_src);
++			clock_gettime(CLOCK_REALTIME, &now);
++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
++
++		if (rc) {
++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling JITTER source\n");
++			close_jitter_entropy_source(ent_src);
++			return 1;
++		}
++		do {
++			rc = xread_jitter(iv_buf, CHUNK_SIZE, ent_src);
++			clock_gettime(CLOCK_REALTIME, &now);
++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
++
++		if (rc) {
++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling JITTER source\n");
++			close_jitter_entropy_source(ent_src);
++			return 1;
+ 		} else {
+ 			/* re-enable AES */
+ 			ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 1;
+ 			ossl_ctx = ossl_aes_init(key, iv_buf);
+ 		}
+-		xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
++
++		do {
++			rc = xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
++			clock_gettime(CLOCK_REALTIME, &now);
++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
++		if (rc) {
++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain aes buffer, disabling JITTER source\n");
++			close_jitter_entropy_source(ent_src);
++			return 1;
++		}
++
+ 	} else {
+ 		/*
+-		 * Make sure that an entropy gathering thread has generated
+-		 * at least some entropy before setting O_NONBLOCK and finishing
+-		 * the entropy source initialization.
+-		 *
+ 		 * This avoids "Entropy Generation is slow" log spamming that
+ 		 * would otherwise happen until jent_read_entropy() has run
+ 		 * for the first time.
+ 		 */
+-		xread_jitter(&i, 1, ent_src);
+-	}
++		do {
++			rc = xread_jitter(&i, 1, ent_src);
++			clock_gettime(CLOCK_REALTIME, &now);
++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
++		if (rc) {
++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to prime jitter source, disabling JITTER source\n");
++			close_jitter_entropy_source(ent_src);
++			return 1;
++		}
+ 
+-	flags = fcntl(pipefds[0], F_GETFL, 0);
+-	flags |= O_NONBLOCK;
+-	fcntl(pipefds[0], F_SETFL, flags);
++	}
+ 
+ 	message_entsrc(ent_src,LOG_DAEMON|LOG_INFO, "Enabling JITTER rng support\n");
+ 	return 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
index efc08b5e0a..c6284f0006 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
            file://default \
            file://rng-tools.service \
+           file://0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch \
            "
 SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
 
-- 
2.34.1


