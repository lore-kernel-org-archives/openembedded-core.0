Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4F4C41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:11:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55182.1716192663064993168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 01:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5870edb5a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K5PlDR003963
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:02 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y7bx6rq1j-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzvSW2kRbf8T8+Pul9KiWMRuy7M0qkOtJ/lXLm5W6glBS9IwsY+An/Y49M8Qsh1FTALuXu/WuYkqeg8rXMjOvOFWqpLF6Yuriq8sA758Nv/s97ayKlbx/mcdHqtiXkzJsyCCorGU1sEyQRz/b9bwXjNGmDPIGBnHDDg4I/5vi+bAO5JtZAJyA/x9EEzvrQ1G3FSP76n9J8aJz+ER0zVqAEYGDIS3UG/pP0CwPPn9Dd/RjSGKVZXx5JXih/SYILNFdKIN1hoWS/9vGv7K7zmK77Oe1/LfAJgLTVYx60q5csKBoMB9UfJ0MtGyKGD+BM2nsZBFhQici9UwRe9BUqelAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtUQ5ND3Nop5ASJ/MjFaVDaEcQoxi1JOgJGR+xBak1w=;
 b=gzKxi88nkHydO0CIiYjLi1Yv9+UA2eXWAsbDXaOlApIXT4qj8XHj1jRpEJY4C0Qy+w7Mn8ZLcyqMbiUWChddu0o/RNEGeBBW6kwmgrXcfA43OD6IOLeOVL2US/mR9yyTigpr9MrhiEUTyKB/dCKQU3VxBg3Rra5DXQmCXoDv94v8XMIdgKEFld3nC8sB0GF2yPtGLjD7RUJxOzwYItY+NVTSvmrOcaq0FB5OELCDckZqfNdv+Uk7u1GbD3Ki4EepErZ5iWjNfWqRqQbSensiCwgSnsA3reBoJsy5H0yrCBx+A/OBYqCpsVyFRp9jgGESrWsyzTRq5Mx0NMfLPthpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:11:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7544.052; Mon, 20 May 2024
 08:11:01 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] shadow: upgrade from 4.15.0 to 4.15.1
Date: Mon, 20 May 2024 16:10:38 +0800
Message-Id: <20240520081040.2380736-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520081040.2380736-1-Qi.Chen@windriver.com>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2a2a37-85b4-43dd-89ef-08dc78a46361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NNlvVylYLC39bb6F1A55GPBwe1sQAbiuJaYu6A6nOEUwPwnsjrvws2gEsYsD?=
 =?us-ascii?Q?ksHDCq3xXCEYXxT/GZJfWIaCzYjORZwjInnlavuqVPxxbdMvoZ0wud/he0Ay?=
 =?us-ascii?Q?erPZpkUBz7gcU6aSCQCZ5iV7R6/y67AyBvHOeyk+KQAQejkokPKhO/B42rJR?=
 =?us-ascii?Q?juxvX0QPm7RUH86Q/y+JtnYZmEpaGAVQLyVpnZYQzlB1TSveSBnxIfjEnhUN?=
 =?us-ascii?Q?fghF4Git9v7IP/x7PZY2GGJukEgA8gG1GhRMdpveCX6HKZiY2lZ1kOchXg9Z?=
 =?us-ascii?Q?BwYgqiD/b2X2aZPpVDMG03leJLTTi6Vll8/r9FUQ0YlKr+URziAFwQ0XylWS?=
 =?us-ascii?Q?3KmD73OT5Vnj3LPropiZeULdE4V4ygv2er2lgok5NnIatHA33kcIwd0ytgQm?=
 =?us-ascii?Q?dkZFzLBWWyg69c7vIPmk6/t3PbeZ+wIuVrBr6W//BbjoWxD3GciIDthyQipW?=
 =?us-ascii?Q?BYmqaeifi0gRAsCIUnr0AQOCxniYNvb5JVwGK4dLI3pBkxlrAG+Y/N3bb/hi?=
 =?us-ascii?Q?gGzB+wVlnfLMWEARie3QXQYYVyuvub3c0HycHF/bwUWt3WY8HThXd8nmu4ko?=
 =?us-ascii?Q?dueEO2v5XappNhH9p3LXg3fK/N8oZwlCf7/7DHBj/+U2m86x5apQzD/43TJ0?=
 =?us-ascii?Q?zahtWP7Rm1nATySul3qW231TV/HyIkNmEGawHRabGScbiVCc8fJj28At/pFr?=
 =?us-ascii?Q?Ro4Rikzc/a/w5R4XvM0J+czclI7iEXs6JxndCnGiZSha0OBSkEEUdGlJE5zb?=
 =?us-ascii?Q?zsUmGBVhIsJNSzoW473Y3NuX8yQFLX5SQ/6+bF20EVOZOPH5U80U1DwT354U?=
 =?us-ascii?Q?ZIM3lI1NFsDmNzPHZ+vigV7I6J+7xZTwWVtBZLP5EeAH7UMqzdqYFFVDJITJ?=
 =?us-ascii?Q?k4QyBuaMkQZ+EaCfa9ko0aYKKz21qpf1VaDDu/jk+jYg4anYJZFLI9EQZyqs?=
 =?us-ascii?Q?t4CPa9SV+/F5yYVDYq6uKwZq+QoK9KaMVJHnM8P5HJD3ltGBppM5RcZ0xjyr?=
 =?us-ascii?Q?MjMrbiwX4gjc1CRSM16qHq3wRRTdPht9Y/lCSehF/JCzijnRH8p1wqLT8uOv?=
 =?us-ascii?Q?OsdVIorIlppjkbYO5jNuMh7+0K2UcSOm3koqTYSywtppRsciZols9CyhV21n?=
 =?us-ascii?Q?Gl+1ypfJ8QWY6YZjttjR+KHLF7JNeAG5UKu5N81tnBsAzXvXPmL19/yaqhcw?=
 =?us-ascii?Q?Unk7xdTVfDC3VkBml1nA+jbwjjnjd1b2sZ+TAJEyFQP6OQ1HKTGA0gH31sjG?=
 =?us-ascii?Q?ugW0UEYYuMCnmFLsAYyQmH96islmP381NEAvUc3DPzNk9N5YPiR0bn+jBZL5?=
 =?us-ascii?Q?7/c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?joGsnbx+rlguax3b73XvA1/YTd/K2qsaSZaTptEbODmL+mRdE7ane9uzE1lv?=
 =?us-ascii?Q?i8SN529/50B/ZiUwPhLZTtM4yxN8IYpc1duNXwWu2QXHjcX7/xZsQlsX9z7s?=
 =?us-ascii?Q?ZJf2K7issXD+1b0Zv3NsgqNlSZWQ9xnxfJXcYgVcp9z8liPEt+7FwCAG85SG?=
 =?us-ascii?Q?XoIpDoPCYwxV8UaPkO7nOU8vCqU3f7GUgzoEabVwkLIGnyz8Pyk8NB2dDhyn?=
 =?us-ascii?Q?ztB9qh9/i8F8FqaXtZuy+xW3hGjMUoR9uQCIBoIqvzsPLS00L2LFbRG2CpDt?=
 =?us-ascii?Q?MTWNlrdpfqwlET0id7hwAwLQZHG3OkbSPzTsKgI+kNbyhUN726ETgUyf7ArM?=
 =?us-ascii?Q?7nFkIoSZU6fPNH6MTNKO03jfinWoPcxexDuzcMT06tUE6Fh8xL2JfRZ9Krj3?=
 =?us-ascii?Q?C57Z3sdejOUTjNupxmeIKHSygOaWHZs0lIBaT2kXKeSRMz4XatkbJ5hHN9VY?=
 =?us-ascii?Q?H7gFCGPDL4OTXruFt6oLXP0TDSMzu9VA+AIjK2l6XHRPLe0ysFK1mETpQ5Z2?=
 =?us-ascii?Q?fbuwtkSdn1UdIqEYgV1khOg8eUWHxib9Mq55mVB79+k9jHCAOOWFGWIkSJdK?=
 =?us-ascii?Q?YGJQA9gGZ1OzkwLEjJ/0gq398f8gYtYCMSbJPxxT/m3wFc/sU5e3tvcfeQZQ?=
 =?us-ascii?Q?raKdYvkEt0Y8sSZ6JKZ9iIJcWr9reHFiGyEfal9jTugjjurpFP/Y1J8SmKMW?=
 =?us-ascii?Q?xnUoO8qlkf7kkNq2nKDBW8rBOeSzua+FKPibidGnXIUIIlqNeOvTsfeAfd2m?=
 =?us-ascii?Q?E7okn0NFBSeJAWTDdl8UqqpuAcuGL9QsJTEfdqU6tfcVoDRnNaXEdY7l7yxf?=
 =?us-ascii?Q?N10/iRM1OvgAK3xXFrE5BvCShHIAtqXxWFwYjhnXcB0qg6Y8HcJb9d/5hJ5k?=
 =?us-ascii?Q?PYA3PJzEZpk4OfmevBsZupBJAUHc32f0bEXdl0pMgK814FBrItjliMmy3tkC?=
 =?us-ascii?Q?NTDpTBP+GG/iwTE8FmVA2PPjBkWwDyXXGI+aeh2BLJ59Sj8xbLq4zJS1BbYe?=
 =?us-ascii?Q?3bf/P10se6INCmb7WHZL51WIJOyaj9YUWKdIasujZuW0nzeO5QnZosURQbg9?=
 =?us-ascii?Q?6GDg4JBUWM4u7AkNvJcT7gUjwTf+045KQRz8cp5UcCbo8nvBqZCJn4YvKJ9g?=
 =?us-ascii?Q?wHm3Nz03p6Quzw1hAb4y1WxN6JOxizCmm8efqZQPz4JnxR3qqJaLBTioRofI?=
 =?us-ascii?Q?7+Z8HzmTgy9bEI0v5BQ+AF6KG2IiRXrA+a2v/4QRYhEkoC0O1bvhvsKXptoM?=
 =?us-ascii?Q?utGa6qKZUu1DbnTk4rS+/6kqGdkgjTse7/qtNFgsBt+efS5Abv6WE6RQqLTw?=
 =?us-ascii?Q?5m/SfxhU8hGdrfA5IN5VHsdlLTCRZYVgIevNf1znIAUL7RWJtJf/b624GPds?=
 =?us-ascii?Q?ckBHDioJz0i/kWPErESvZ8YiN0ZGHe7St7BfX/qIJoX3ehJdMTGK3D4UzEzF?=
 =?us-ascii?Q?krxANClDSsSGUERQxW2n9BaQ5xFq89AKLl+y0JGEts9owcF2gm8bKmaBYS10?=
 =?us-ascii?Q?/ceXX/N37g45UnqnqlcM5BHXpHXwnIKezCEvzKDI/wogi//vN5iY4Y8yHaQU?=
 =?us-ascii?Q?bQRanMpbiyz9zcP1uoELB4EUyvQgdqlDioXW2YBP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2a2a37-85b4-43dd-89ef-08dc78a46361
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:11:01.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /593lTqtsthR2zMi2D/s1qYqh0d/yLN27wpaqIYHzM7l0tcS4dO7mpi7ieireuRPDLAxhKFVKK4V1DgmV6q9hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
X-Proofpoint-GUID: ak76cIAuAtzNRfkI0ceisYdGU-pxMT_i
X-Proofpoint-ORIG-GUID: ak76cIAuAtzNRfkI0ceisYdGU-pxMT_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199559

From: Chen Qi <Qi.Chen@windriver.com>

0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch is dropped
as it has been merged and is in this new release.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...copy_entry-use-temporary-stat-buffer.patch | 37 -------------------
 meta/recipes-extended/shadow/shadow.inc       |  3 +-
 .../{shadow_4.15.0.bb => shadow_4.15.1.bb}    |  0
 3 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
 rename meta/recipes-extended/shadow/{shadow_4.15.0.bb => shadow_4.15.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch b/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
deleted file mode 100644
index 2e5503bfd4..0000000000
--- a/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From af4b8cb780587aa736692a3baa76b60474f19c5d Mon Sep 17 00:00:00 2001
-From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-Date: Mon, 18 Mar 2024 12:14:21 +0100
-Subject: [PATCH] lib/copydir:copy_entry(): use temporary stat buffer
-
-There are no guarantees that fstatat() does not clobber the stat
-buffer on errors.
-
-Use a temporary buffer so that the following code sees correct
-attributes of the source entry.
-
-Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/974]
-
-Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
----
- lib/copydir.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/lib/copydir.c
-+++ b/lib/copydir.c
-@@ -400,6 +400,7 @@ static int copy_entry (const struct path
- {
- 	int err = 0;
- 	struct stat sb;
-+	struct stat tmp_sb;
- 	struct link_name *lp;
- 	struct timespec mt[2];
- 
-@@ -423,7 +424,7 @@ static int copy_entry (const struct path
- 	* If the destination already exists do nothing.
- 	* This is after the copy_dir above to still iterate into subdirectories.
- 	*/
--	if (fstatat(dst->dirfd, dst->name, &sb, AT_SYMLINK_NOFOLLOW) != -1) {
-+	if (fstatat(dst->dirfd, dst->name, &tmp_sb, AT_SYMLINK_NOFOLLOW) != -1) {
- 		return err;
- 	}
- 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 25930b64c1..3991006b43 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -12,7 +12,6 @@ DEPENDS = "virtual/crypt"
 
 GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-           file://0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
            "
@@ -25,7 +24,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "377fe0d7c1a0aa5e3514c08fdf5ddc70c9dcbb391678c2134445ed97326bcc26"
+SRC_URI[sha256sum] = "b34686b89b279887ffbf1f33128902ccc0fa1a998a3add44213bb12d7385b218"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.15.0.bb b/meta/recipes-extended/shadow/shadow_4.15.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.15.0.bb
rename to meta/recipes-extended/shadow/shadow_4.15.1.bb
-- 
2.34.1


