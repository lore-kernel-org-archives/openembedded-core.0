Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F7FC4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:39:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.91618.1669556392197956782
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8330146791=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ARDP2NS026727
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:39:51 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6r8jvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:39:51 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ARDdpLW020281
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:39:51 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6r8jvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Nov 2022 05:39:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZ6msTdAClcZ23Pq7OSIqgwyp8qcQ2tr9rskTnGtISZ+QHQ9maue7AtwMIDBujtm1uJXQzpYfN5a8k6X6MMa7tueEEVJwM7vT2FxAtdbFjUTs5AwzoZb6pS61cvY8S8MqJQ0mSJYZ5ORa+JcVK3xS4VsvdFh6BhVMVUyN2Z7K9AGig4gBGq+OdFKrevT0Pzw5LOCh2yldL7+rBai4360R4qkg5NNno0IjIlSi8NhbMBoTp8H5/z53NTZtivE+sAu5mh6zEN9vLqbnY548ST2lVjzI26ZkoeyUwVpOAlHB/wmnry5iv98oMOfC99Z2t1324lydI/hxUf5D9yXyOvaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MPLKJNTeHnQh184AKR6ZhqIwS66Df5NKQPgVROgvp4=;
 b=Buv4NlxZO4HftZ8EFdhG1b5mnEzI7l+EAuKBZ+uMFJF1j0fUXAuLbSEDAHams6uhJEIaktSyd4GJAPogFh+WFV30d6CpRUfIeD8suFHSmwkxLn7AA5jVveiBk5+nAe7fkrl+ae806fAqaKCm20Me30Bz3J2Z6o7CJoS8FswIDw0iNnSGtVOLshjSqKu4B5dOJu7KhL9A15SWSxnjoxAvql7IOn+1brdE5akrV+Tf2OKbVyb9EtKt2VqHFQZ4gc7jjsk7rEqaH6RkLBgdGQsvvii/ciAcIESh8lZcb8sua0VbA/cuKDnK34R/6g+pZDwN4H0GHCJ/WdLKC5l8e3hljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB5143.namprd11.prod.outlook.com (2603:10b6:510:3f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Sun, 27 Nov
 2022 13:39:49 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5857.021; Sun, 27 Nov 2022
 13:39:48 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][langdale][kirkstone][PATCH v2] rng-tools: backport patch to adjust jitterentropy library to timeout/fail on long delay
Date: Sun, 27 Nov 2022 21:49:09 +0800
Message-Id: <20221127134909.72700-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0209.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::7) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB5143:EE_
X-MS-Office365-Filtering-Correlation-Id: d780da86-ecb1-4694-4ef0-08dad07cda91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FFjZcjZqwWOQo9NhixBNQeiMNW8k53PRgWml+dhtfSomsX6hBbLRzUGcdGAYf55Y1Pl/a1Y2QM8CcxeFPblcCi81vsna7/x/dW4eCteqwTqkMvCWGcJ8EZljsUmTpMqiBTHiaGjGgCECUVGrjZE98UOuO7aJSpoU18hFHTmL+QI46YchknQDbE9y9v6TFjylbX11jz8bc8tKvj8XorM94KfQWEkkM+ReKHVK1mKEiqWWb38P/df+mVDiubzsFOkRQw89xhA7A+mbW3POFYwHhLl1O9vAVPkykJC2WNs+6oJTEup47GitT99OPqT47VMNR9ZjY+MG46/peCoctUWNEgpEBpTmERJkK50+a4Z9Cnuu7hD4J9z6qQdckdpOb7eYb55PRUcDJwKNiV/iNwvr0TzJjgQaNb5GDmzXedefdMLzAqRgcaWk6tDdGBMg2qPmP5/zqhYAr2lckczlwKC1GWwbpDb/MTspt1jRAaMn23DQmdF572JYC/5cOuax0wleXrmkvnO8QUmAD9NXtWSWlqkB5BjsOczXUAb2XmNc2qKfGkcpGVDsFOHSm4XgAAN4v3x7Be2ZDbu02bEtojcs/UMEebwyGlHgd83y2dkjjGJxPp6HqQ2KRlSkCYWUnA/RKekf/ugeFIxrCSLVEY9f6MjdyHqvwNT8FImrtowPPEgBnqAuZ+ZS8ONckpgMeGaF+Dy7i218aypKt9M0xwDVIPTi+QWA2e/HtxFT1QFMucXktH8/sy2siJzWKJiAOc4jaW4CCXC+HRGyxlFESyT5uw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39830400003)(366004)(396003)(346002)(136003)(376002)(451199015)(2906002)(38100700002)(38350700002)(44832011)(8936002)(1076003)(2616005)(83380400001)(5660300002)(186003)(83170400001)(316002)(8676002)(966005)(6486002)(478600001)(6666004)(66946007)(66476007)(41300700001)(66556008)(6506007)(52116002)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FP/OjLNsTOUVeGb3wm153N+mwNY3S0gwPwR1JnL3DVWXdFvnWG5hNoWJ4xZQ?=
 =?us-ascii?Q?Q+U1TBDrAmluRwyBsb6wVIrPPanZsPm9jqbApeD5cgPCtDXV2919Jv1pupxX?=
 =?us-ascii?Q?yPAJjCGgDIxYUDwnoJaTWPShjzNh+jm8bNZLHHcW7QxXCYK63Cgh2OXxidTA?=
 =?us-ascii?Q?+8leqQUKQi5oseSfnQwfRbYX8w9zG6oqeEcv+hANP3IvKZTYrIOOYtj3tLli?=
 =?us-ascii?Q?ehwc8jxk6OSyZ1/2o+40K09pl7B41MGE48B8I3c8oFwNd9uDaLP5qja4xoQg?=
 =?us-ascii?Q?mCFpHUPD0gsbX/rgE6+7LikvzXX34XHaMiAoGZy3Y1ycknvLd4Peq5vzh6rT?=
 =?us-ascii?Q?icW0WaF61KLNVhCQB5+DC0okZ3a9oWO+NL4dx8/QhXQ4hOlOsSRS6PzXZJUd?=
 =?us-ascii?Q?m0NAPrOPUdm+9e1C7TYkMosMk6YN5nCtI+5MY0w2H045djO5x0nM5UYM6RwG?=
 =?us-ascii?Q?Gb2QY6Wp+wlKmjlN3t5kguJp8pjJxozpa2hC+xRJLpFSw8hPYqlfEkdeDvKd?=
 =?us-ascii?Q?fxSRVIkN4gChPbO9OWKCRONQ2vFeCBkbKhNgRjl6RXANZpUMpP+sV1KWmeF9?=
 =?us-ascii?Q?T1mAC+Gsca+r0bsKybnqrnAi8TprYyUkKrBgmJHgpCewSNHaCe569RIyJiJh?=
 =?us-ascii?Q?jVDh4GUALG4Te08/c9AA410LyBG6HXQaiCY7PF8j3JN2abQ1KkyAmBFwi+JK?=
 =?us-ascii?Q?tkyCFrJG4pL2M6DMQGfuBRnidHsUjoFChCS8qvvQvh6IN8ONBdLGMOHhz0JZ?=
 =?us-ascii?Q?tq418JI8wy6/di0nyMIY7f5MdbcUNoCvaD5/vxgDUftZRYooyICXeBxZlmJi?=
 =?us-ascii?Q?wEbQxTivqp/ev86mBl9f0yC6X4rz8hnUTiIGdj6RFW4LNtCI9aY3SND6OEqs?=
 =?us-ascii?Q?6zQC0+vOnC4uPUnnnirvMgao9CmgMJOjtBhVlWAKSFR0mu654ohgf5n9Rwjw?=
 =?us-ascii?Q?j15/BiFb5AJeqvYQAxgmJMPb9O472WSzGVJzlslkHobLPpOD88wietJyibZ5?=
 =?us-ascii?Q?dGGqfd+UxKtagqYLs3xYzYjkUcCjTRaH7CHCtA4wuIyoTpqsH80hVqTeVsE0?=
 =?us-ascii?Q?KKgIGG3z9rKZ1kFzqt2rI9vBP8I36sFDeyUSxuXpyEB9isDRA0zsj/Sk0Mx6?=
 =?us-ascii?Q?8TvPwP3r8i8DGwcS2zIp91T/0Gf6DRqgXK6KEPTeQVBOVnEgpCqmo9lcu62y?=
 =?us-ascii?Q?ogNoF6iq8UrFJaeabdQg2DUCEwJSwgVV++NxryRyIiodizdBq1Lsr0c52/RL?=
 =?us-ascii?Q?mPpu474Pb9U992OZLo/ag1FiJOl2HW+15jcDRWPwP9mIgK2nhsi5ByKoThhk?=
 =?us-ascii?Q?cc+rRVG7GMYVrsQFRp09i3x7xVil66/efEBsG2sdXSzR4QCvt17ESzYHnWhm?=
 =?us-ascii?Q?Gg9FtBgxc0rZRe/s9Jetw9RiYiVKBrNpzG0lYZfooCUwnglTkDon6EXgp68W?=
 =?us-ascii?Q?Nj0RKxCmjfB3KcFqk8X6dFiZvJg/POhciH5FA1x7hI+UTPY1NYGdmxvgnAeJ?=
 =?us-ascii?Q?Z4i1wCi0aR+79fTGFvBBQc5dJyIwNbUtHgKjlDUnSgF1GaWFdsWd8s8Axy1g?=
 =?us-ascii?Q?acnAZUbFVTjtirWV6e0XB25OYcUXZ/2BTyIUEjV2DW/6Mtm6SHl0CxoaYBmg?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d780da86-ecb1-4694-4ef0-08dad07cda91
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2022 13:39:48.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQuUuSU0p3//g3kCUGJ3tezFOJ7Wgytih9hWQb6UIZgZep32nunsUNr8EqLEe+6q3sN/TVvJrNLfC0QkDkEKh1iywswyU2hYLy2T1/77JX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5143
X-Proofpoint-ORIG-GUID: VS13HlTAAbSW0GUw3zVWy4CfRNBidON4
X-Proofpoint-GUID: 0VkSpoogsudM9NouKSv7LaJ4dIGWUF1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_06,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211270114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173844

Backport patch from upstream[1] to adjust jitter to timeout on init after 5 seconds in the event it takes
to long to gether jitter entropy.This also fix rng-tools take full cpu usage with whole cores on ARM platforms.

[1] https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
Changes in v2:
  * add libgcc in RDEPENDS flag to solve testing failed in core-image-full-cmdline

---
 ...ropy-library-to-timeout-fail-on-long.patch | 144 ++++++++++++++++++
 .../rng-tools/rng-tools_6.15.bb               |   2 +
 2 files changed, 146 insertions(+)
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
index efc08b5e0a..d16675730a 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -7,11 +7,13 @@ BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "sysfsutils openssl"
+RDEPENDS:${PN} = "libgcc"
 
 SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
            file://default \
            file://rng-tools.service \
+           file://0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch \
            "
 SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
 
-- 
2.17.1


