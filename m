Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AEEC369CF
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:55:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.192.1744858549381187391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6202e9a415=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H1eWYU029573
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:49 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3njyj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpq7Gs03VcpyF+O/RkyjkXduxzOYguA9LwP47roMsj278udOSVDq2/8oiOUWnLmgxNvzDK8QqTW1PEsKkAMXTU1HDdEkRK6OtGCzqb1LmwCRK5LbPZfAO5TNUWIzOBZru3o4pU0prvLcd8ForwWWKmMfAZ4uyRjEgfvfEDTNBBXr/x3/D09Y84cEyoZmBCZv5HHJQjtCg5sBKp7UoXkvb8kGc6vYJ8P748+4qGdUK/VBQBe45fvS5KDZ8rUo2dnjPG5mPcy/BPLlxQE4vU0TAY3IVd2ZIeMJQUypko+MX2Ur2YHqbGzuDHqwfdIBMfGnBIMli+FwGDC6JHsQxOPqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qQdKgGoDWiC6utFa5f53DQqzva1oUk/NV1KRvPyfBE=;
 b=cASjQsrpIyiIlhtNYMx2YuWJQRya1TaYvqJ/t0TKJ8r/pCS4xPDjlOzpyLcaq/VBTeN8UpY5xORwpevBboDxp8OSWRGacOmaby2mKIC7pgU2LMudMko3ygPdAReH7TES2OPhj81zm6eiPQpvXNMSSYi5ZE2ln5BZTASoEwhAHWPJwtMjz6+mjlFnBDUytQZ/0G+iUmB8r1BTaUR5KfcEoPFCFilqCjBGrWrjtnYWFDRv6qXHRf1q5aFwpnMZeejMEVgCR2gQQ4e6l3qLVXe5OFpT+rH75EVmSHyzghe5XVAaYnggjevqi+hPtmg9Aljix3RgkLgf/UrYjmRK6JAKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 02:55:43 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 02:55:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] libgpg-error: drop -unknown suffix from version number
Date: Thu, 17 Apr 2025 10:55:27 +0800
Message-Id: <20250417025532.1363790-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417025532.1363790-1-yi.zhao@windriver.com>
References: <20250417025532.1363790-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 86afdfd3-867a-4a06-a96c-08dd7d5b5855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LbA1coA+CgN8vpt7XfH0mVFpx1s9V6v15xvJBM9RTOJDzweK2pT1NK+BMiJd?=
 =?us-ascii?Q?6u6VEr9fdBmQlzOBtBtfQs1/CSn34LgvYrzkaH6NRcW0Unc8B+J5POdqTc+x?=
 =?us-ascii?Q?s34UQzbdx+Xwmnpu0E8BY0LS52kCO19BQ1lEO6xq/jUGz4lqaKDJAYxHbGLk?=
 =?us-ascii?Q?xVLk7IeLtFqEHzwulsyq7dlFyf21wjawosXESQkZCb+tzo5tmf5EcqpzQVF+?=
 =?us-ascii?Q?eZFLuDW4j7xOCqzT9EO+8YeFebBJqxmGNf11+RvhGEskQY1JLcz3Bv3UCU8W?=
 =?us-ascii?Q?82SH1CS7P5yZUNeaBRAYxN+v7RKj14J08qavXdKXYX70tug5y/2R7KEWegu8?=
 =?us-ascii?Q?gBjJB56VTWjqZD7MWPNThbFH1r9EDSbE2eNnIXI4mGcY0jiI4sAjyhPORj81?=
 =?us-ascii?Q?UGCUrtNXYi6V9fYwRSFfzitpZXNsrEpvAa4IxRpOC6Ac3Rpn9nkdOLQLgxM5?=
 =?us-ascii?Q?BFJYfsKUqFB1g0HTyUzr3vZNRGtBDSzsoNaP6chEudElPXHOrDNPfNGDjTam?=
 =?us-ascii?Q?fgeS2B8P9IwN+v+BvUP/6cbjHpVBl6BGqTYV5//Ln0vawUbPK1p1ANy4JMbr?=
 =?us-ascii?Q?Z2w5ns6P3w2OxWHOOL9y18MAg6YUI3Sy0ObpdQ5XDea5nhmR35s3DddV3tUh?=
 =?us-ascii?Q?pxtwjtRncBNiDR0l/K4dT1lDSZz5gfeXpMDvhGp0AN+K3m1ES5/M2AhZVhst?=
 =?us-ascii?Q?6ZO8qpgcj0PuLKOWpHU3skSMe10zhn7dMT9itebdIzm2h3bLKb1WFXeS/zuC?=
 =?us-ascii?Q?MaqX8vCb/yiPT7rSMTxm57nQo0g7Yvq2yTDDTFb8guA1ww2ND62FQLtGJ+Cy?=
 =?us-ascii?Q?GtTdC7i/Lo0JimY0CEmXGJ98qNOepAZkcmCrwfj5knQ0TrbE3RfVoS894y+x?=
 =?us-ascii?Q?Xb6MylXfBWJCmF4fLyumS456FeJbdCG6bWkcPyzUOe18/SpUToz2GxkKg2jO?=
 =?us-ascii?Q?5nAfmvvpSQS+xwogs0pf5D/MOn/hz+uKTeByyo1YuS3rlhQYPokmQzKHirHD?=
 =?us-ascii?Q?TZ+oJDLtjFaK36VlpnwrL6hrKKtJU9EWmrbt3fx4uROF+wc3mxwwRbZMd1Ek?=
 =?us-ascii?Q?KJrZepsatgrIkNIdiG5ZJsuvbgX1DOWI2+X3wMqxsybk2WneIjxTDfFsNrQU?=
 =?us-ascii?Q?JIQAfwqIqtl+sdMSabpbNWzBoXX52IVPHADqxAsbYj4jf+RQnb4mdZUYXkBh?=
 =?us-ascii?Q?UaGYybl3kGOMgRY1Kv+NOgGC5ULKXJfdKWgvNUfSZFl9RVPxENv2X5geIkP4?=
 =?us-ascii?Q?sroR/vXQXXYdzrA3cPQVrY/8aRSuRUsKHpPXb1HJ22pdJZNlA2vneRnB9SJu?=
 =?us-ascii?Q?o2bj6Qr4w9XCch/02vGRzolLDJje/zmrRs4dTVaN/8vNkWHWUNCeOcw4cE+9?=
 =?us-ascii?Q?9nUVomYuhFhpG+5gxj9VZ33v4xOxFROLJAW5DVoSaE5da7NPh7Bb1oQ/e8P2?=
 =?us-ascii?Q?IuwOymUUQtE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8qOMQlv6B6K0K+J2h9a+v6OLL6CtxDwH62Lmtc1vkB5iERVyGfdtP7DT451v?=
 =?us-ascii?Q?ZocvoVfsL8qnSy3ntI+5wYYuhOJX5czhcTcrnyAxU9OPyYR35d0KoGmV23B7?=
 =?us-ascii?Q?I37IBPGBNM3mp07de7UQIEtpERjsWaep+F10kEWapSncqobWekvZ605+EEpj?=
 =?us-ascii?Q?iC9E402faTZi45j/UxqWk1W4rNOZgQhpL2rwUfNZsV+pWrt2L4fY1sQEhPT/?=
 =?us-ascii?Q?/0aJDWoyqYBfdWELV3xm2C0avjle5LhuBf724AUW6tI7v/msMi2KnqnN96fw?=
 =?us-ascii?Q?ttz363af2cAGb01XJvJ8Zo8C8X/EIPZQIvO1k9lmSFfGxKI+oZLSNZTR5l1g?=
 =?us-ascii?Q?R/MhSzfZQ9clyeKQizb7OyjlsLjh/+A5tKt79LlgMzRDnDA8b0CwKD6etHaa?=
 =?us-ascii?Q?fw8+ZQ28R572W4pHceJQHHrqPcQHcMNdLGZIZGLiXaH0T68ng8BkSvquqWGt?=
 =?us-ascii?Q?Bgbt+/ag/1pdL6BL5R/VJRey4Wj3BUHrSbhWuYx75qS++l9y+0Da4Eb1v7en?=
 =?us-ascii?Q?M62sfm9YnRBMum3r2A6Np0J42DheTedX5ndeP9vJhJ/To0JBvxQzqIrKXwaZ?=
 =?us-ascii?Q?zIPJrQhzQNjfECvnHpq+gBm4bZIZIKeQWNv7VFsuUAWhawt6zCk8YY4ouJJa?=
 =?us-ascii?Q?Yvxl1M0hcyiUoz1OVC16LejshBq9c/TUJacXVfsuWBjKpSFptU3n7O8HN2rX?=
 =?us-ascii?Q?cGP72QbNxhWnT0cTK6PIw9TtBnvp0LxcAyShQdW51kqUBirV9DUkbG5iZLbg?=
 =?us-ascii?Q?WhEy/Lf4IU/FQOYvmXSJVCEGqC7J5bfKzMOoOtTxMC2r9HXUI6mgO/Ahfgo8?=
 =?us-ascii?Q?Sp1RcnFM+ailXbHfujmER2TonwG5BQsxXwnLM7tXB8QYRM4QHjUsTk1mh07U?=
 =?us-ascii?Q?22IkzZK34AWhHnvGHdSaxNsutp39a9bjbSR+HlMpfFeSuj1X9Mck2beRjK92?=
 =?us-ascii?Q?PeWY+Mmkc/ue+wAMdrBiMCXOGwtp6Drqvbg7S+2QcT25uPsRNmJNVaPvk6vm?=
 =?us-ascii?Q?1kLIiVOjpoBHu5z1oHuzyfZwfqXgkqGZaxSHIIq/aK7rOR/v+PDDKOEpyqL4?=
 =?us-ascii?Q?Dvbv6gzXsDiDhl57TMg+RTox4hD8Hkkhx3mQ/JOVtqElW4tVBEDR5ip61smO?=
 =?us-ascii?Q?r+nAztnkMbibK1JpyzgOB9SmMhpzXFmFXbdcFTkNixPGnqq27cDOa/OVt1Mc?=
 =?us-ascii?Q?85AlGFmW2V9JKDDDlpkCz+4YZ5f/+xAJHccH0EYrZxJrGCgV0NY/T7vG9lFZ?=
 =?us-ascii?Q?FGMqThifd3nNL6V0iQion8SvY1iumE5BIDN2Seem96LPlnlQmocY4xzcb0cd?=
 =?us-ascii?Q?Oyf/LoPD2CcPXQQ9V86gLF/hTw1iNJx9mLkfFZZ2xTFxlY5jW3QL2ssWcq0I?=
 =?us-ascii?Q?9vb5qF9Q0mk0ZUd2A+8c6ghrQ4BNHFAuFxlaoTkSlxAn/Djw+1pRVWI+O7I2?=
 =?us-ascii?Q?LhOf/Q6DT8E16ImvKZho5SVwZNLzttfI0F0y9wNQZOT4NEKukT8+ERYM1kJ3?=
 =?us-ascii?Q?xquHjQz9UejqAyDOh+HEpn5hi8oq2X7VuTj/enRDzY5I1rwGtsV4taVOEKa+?=
 =?us-ascii?Q?rVUTjmVKu68H/T3oTc/FqVDPom2w+CKPc9CUJIcs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86afdfd3-867a-4a06-a96c-08dd7d5b5855
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:55:43.6630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONnv9ax6Dt+BFmikjwkuFP/FuFQRGnFOlZ2Xz8hxqw69N5mkLh+BrZDrcfEOojd3GniYTf63e8gZAua/zJa+HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-Proofpoint-ORIG-GUID: 6UBkJg_GWLkaZOZTeJplyU63RDWBqtff
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=68006db4 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=sODZU1DNDF4EVHEcULQA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6UBkJg_GWLkaZOZTeJplyU63RDWBqtff
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215027

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libgpg-error is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.51-unknown

After the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.51

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libgpg-error/libgpg-error_1.51.bb         |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..cc6c35884c
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 7358f4ff6c711bde1d83b9a38bbf349a23e0e243 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libgpg-error is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 9f91297..daa2730 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -270,8 +270,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       cid="0000000"
+       rev="0000000"
+       rvd="0"
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
index 741969beb0..9760b4d107 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
            file://run-ptest \
            "
 
-- 
2.34.1


