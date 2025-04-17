Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B82C369C7
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:55:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.198.1744858548642437037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6202e9a415=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H1eWYT029573
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:48 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3njyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOTiVndYOLq7g1Ep8yGGYbTmzj1xuLUCd7JIavMqH+UqSOvXwNS+Wx3voozbOVo3cegi7FIPwlnGZhlXMnidyhfKrrabmPRBM5LUgBYMyNfa7vTkV1DTYlRqa7cDOTS/eMGEEDkADyCrh7W8zSRl6QRpJdo+uY2GXkCkDptJ8RjpkWmun3Pi8oWxvhI496u2IgmCmu+BCNASu18+w/+eKvVcKPPLEN/TbbfZfiLHIU4Cqw4VjL4bMDc7Pd/1dFYrx/qOwC1Svnh9Q48qEyk2UHkHGwbSWfh4serf7DX64ENSDTq/kQPmZ9/5MmB/Koh2h+V+gJUOPUQM9xcFPkKX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lW/1dHDbdvl5lsHj06YV2dwt8vkGg083ptB9FoUj0T8=;
 b=wrugU7b3i3oj2F9hxX4qzV8hA3JSqbrWat9uituM39P7fS6i7OLZTDv2D/4FgToRh1CMEdunh3nbTu7iuwfpPAYNnrF3NsINLGYVmZoSmZs5gl9LBw/dbEcMTSHkIqI4zoKukczsP+0eahn3iMuKnxlYVWAN56gRu+ZwtmIYQsOTsWO6X6ymzYH8K+SF0oEWQltnq42TeI7+PQQ3A2Nfy2eJYMHLMoUs0Kgr0ULLp1XP35lfbYQK4Hjir0/ohXsgSLM/GseBGHKtGqH5r522uUW/bMi0MrwGEonkgOErcCQRxxB+vt4odIBEfIo6crR6I2qs6ishl224DVdmnnrt9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 02:55:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 02:55:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] pinentry: drop -unknown suffix from version number
Date: Thu, 17 Apr 2025 10:55:28 +0800
Message-Id: <20250417025532.1363790-3-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 732f6945-e730-48c3-1e1f-08dd7d5b591c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tXt+HuSUPU9s7vco93d/7FEjPmEdx8UmUL9b4qqarGcUsWP5dCnWry1OQv9a?=
 =?us-ascii?Q?IAbNXBCEw2SpzViP+Ub+APeGi8BXYthB2kxqNqESw458FgKZYVUuTD/d1ctr?=
 =?us-ascii?Q?ok1Knl/k3oT1VxMYd7qpQ+bCwJA+yMYu8V4xdXRKvwpa6ZpFIBlCX8CBs/6w?=
 =?us-ascii?Q?O9/lluolKKoew+MxWPjSYsnUiLnax+gjrlZePDbvAxx4sHkmsLyX6UShdmEc?=
 =?us-ascii?Q?lQsAJsHsl0jDo3gpJXFkpNm1bha8WwcXeaEEDl2VvKJpWx2LbZBzry++6OPE?=
 =?us-ascii?Q?k23rd8HSwDj+qee3V5vi8GNq4kf2VH1KSCPxOrFD70Z1JqO4urrbSxmOMQhe?=
 =?us-ascii?Q?plGLsNnq0PBXZSPV+ca6QTcC5U+GrinuoWOP43XIwaaA2mHjBWXJJOuRIrIx?=
 =?us-ascii?Q?LRUDMBlnM8llUMyZLKwzVTXUVOsgcwDQzr8rInwaNI7cggfoRxiEF0UNO1eu?=
 =?us-ascii?Q?wHn93YugwMgHsNC5/R+5g6WCqCJ7Gro+3iW0ZrKTS2Ubv9PdSsSVJEqSzLIi?=
 =?us-ascii?Q?VN5QxQsRWz+Rd9rqzdy9Gsfd1dC0xRKH+rA2aO338J2s4QBYdBSF7pjqQ2Dn?=
 =?us-ascii?Q?41zXkv5UZHkq01KWSksLNJkUDE8MEoAVEThy9k/fVZ4kI6RgpjWqTYwaaS2K?=
 =?us-ascii?Q?ycfmyZVooa5syaknhQ+bSZEz+M+5kt6oE8P5ta+O3sYmY4QKb5QBwbfY6Wyo?=
 =?us-ascii?Q?ZRO+fitGg867inlDY3KG63WsZ2GipPaCmaWvabQtZ2YWUE31UShuFRJh0Gvc?=
 =?us-ascii?Q?PwBdgdvinzBt01F+f6ErtDuuOylhvZ4P92K55MxXljTDYaf9xJ9LdruE0OBT?=
 =?us-ascii?Q?W3VGgE4kPadeEX1xda48iuL2n1cIP23lScEi2TdBCWfnrTuNUeqo6OKKcdIR?=
 =?us-ascii?Q?egfHf3zE8mQnt6OQDZvNjLI26/TWtoq591QML0mLqntQO7ZySNfxUlWLo1o8?=
 =?us-ascii?Q?3xQrNHK4iem18RB5YaMBa7rJ3lG/ukj0Exkm5ft4mstVnbJfhORoczU/BEZG?=
 =?us-ascii?Q?uFNCwZqywQptghJFEHF7yIPDcLRNVKCA61SZj/+k+WI+koZVJaSnONNbnLsM?=
 =?us-ascii?Q?MStKkK6EKzIx2WEb9UjpVZR1STiWInnxRgNnTgjWnt4Sb3OrNY7YngEVzqB6?=
 =?us-ascii?Q?5rwfCwMNxm/CrEPI/Z/rxtKjou5tl6NKwS39A4Ijfm0w6aneIlp13ZcIKd3Q?=
 =?us-ascii?Q?+uMsps5VttweTcbZWXt8tuNkbMm0sUJLpFT4y3gub2F05gZzlo/OPqQjt/vi?=
 =?us-ascii?Q?K4MByNeDd+3cBtWTUFcxnSJ0zF0TSrc32I3B9++OqA6G6l/+zgPmWnTGsAwK?=
 =?us-ascii?Q?eJFkRi+z4IPG3M/le0SmQyHJboNkQTg7wMsOyeexGswiW47z3TZBtHsKKNlj?=
 =?us-ascii?Q?BEvMRU/pWrJK2K6tZYjpSuZXdpcHNm/H0LX1brP5Z/5Jgp9ZtiZAVyDMyAWH?=
 =?us-ascii?Q?oRfPxenhAT0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fS51Blt7HgCa8tHsmbfoAWDO8LKhJ+IMMZUccCKVzeB+AI+l41Pu/b180UV8?=
 =?us-ascii?Q?XP1JAOs+JZ9Qp68OyXFL8cDG+DTFbXzBj+zvDAjQ6xkhWtAKybSd193V1D7Q?=
 =?us-ascii?Q?ncurw7m/zd1gtzU3dbYmtDQcg/lYoGr+E+3ykk6SRLY2TBeKOG2XlAWcEx6T?=
 =?us-ascii?Q?0BpiXEH0ioe2WRL1zUoynAtqSFjyFxoyp5MtJdiP3HduqA5p9Kjs8rrmyTfO?=
 =?us-ascii?Q?yhHRYgGpR96m4KrMdXY9m/Eb8oO27SsRm/zYXy13eMdhk8nD5DuzI9ZKfMN/?=
 =?us-ascii?Q?dJ30PwGqzagNCyLXmHWs4hN65joVvMVidcLG89fH7chS1j/KN4MyYyDsbdZX?=
 =?us-ascii?Q?EOaQwnLo5AouBhYrRLh9xKQ0FWjOP0ud9LQuiO9NlrqcpRw07F6u9bf2QKKH?=
 =?us-ascii?Q?Orb2VKdeOxPyNwQacuFL3zAElFwFVJvGjPypwBtYE9QsB3qVtYWkN1cI44DT?=
 =?us-ascii?Q?suPmKe+8x58m2hnM7mxTV0q5Hbz8m5o4UkWGtKpwGFBiq5IjjTg+ZWji4ifC?=
 =?us-ascii?Q?vk5Q+RQos/07YQ6PvVnYVD6+guFqyjgJHhpX+sJ6ybGyNeWEFkjDdGVcbi69?=
 =?us-ascii?Q?N6X5iwHvF5KDqm4mOz6KZKvjzXZin4xxOUb2uOxkK7KRIDkuaXDcRWYHONLO?=
 =?us-ascii?Q?23SwyZwD7D4asNuHzozz2nnUw4uJ6LLJTxIJ+VbXQAr+QF9yWM09YKs1iYi4?=
 =?us-ascii?Q?jxqvMtGRAcGDHrckTrhI7yBcmAnDUhzJFPAXvP2Hbk5FTbLzJNF3jxa/9+Uf?=
 =?us-ascii?Q?sBPVwe1qEucXDYhEFUHhKzZnntrCJVmbXa5a3ACFwZwAO4MFjPWKlyVZA33q?=
 =?us-ascii?Q?CclT+sLnBN5IiSO4hbq9IRDMfyvuEDKr2Hc03qmKjDxYzwBk4gVKRycFgViF?=
 =?us-ascii?Q?BHx/8U44YEHOxPFHubDA7m1zerSKXwWii10cHZcAIFzuRHO9jprbwzj9Me77?=
 =?us-ascii?Q?Urzb48cBJDpaKHJNuTEaME3jAOK9TzHhYgqXKGdUcPQIE6lQi0ryg2VsNx1/?=
 =?us-ascii?Q?UDFz4x1ZUXgfHGhr4oA6H0y9pS7yse2gE4lRtSDd/Gt58txAHbk84P5bDrIv?=
 =?us-ascii?Q?1hF8nbnCahF5upNNRJTl5+wpRcJMMNlnky2r6rozk0UBK3Tg3Lq1I6qlPQln?=
 =?us-ascii?Q?80czuZ5elFLwUOxQqeswSbD9qcBU3pkJ4HqICC/hpNcBwh6cg1PjfB5Ahhir?=
 =?us-ascii?Q?CyK9fhWbjHMo3z+N7sws7++H1Vd00IAhAL7nLeGeqyTJ9Knennfc/I8Z9HmQ?=
 =?us-ascii?Q?qIXl7gT2u3ztj+PrpTI/zVFwNZkgRZAYETJcp4/4+nRj38wJNH++wfIvvdE4?=
 =?us-ascii?Q?ZEw4QNHvAeTDGfa3IFuR0oJmKT8Sa8obeUgoFG+o+jg/3kurZQXzDwsdjxex?=
 =?us-ascii?Q?vY7Wj1p5ciXfNx9gYFhV5R22kNgzFrEr2QbqfGTijQMWLR+cG+zWZAyrmu/y?=
 =?us-ascii?Q?g78db2Hktap9StaMhYh1zv1MAxT2GylTZm1eJHMq4IIP96//FAzPE3ihLmel?=
 =?us-ascii?Q?9Fvggz6pbNzymmiaUHlRvsFpb5B9Rk7R1n13v9JMR82x7C2IlyoNnfU5mvOg?=
 =?us-ascii?Q?WqC+Urb8jfLrLzxSWUvkqju97Drf2O6jaYrM5aYi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732f6945-e730-48c3-1e1f-08dd7d5b591c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:55:44.9249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIJjIH01A+iJGNYApjOR5gt5Y/AZh9l3UL4lOEuko+mvPtl44zH59trqZvW6OW3DzOZmh/tVOLj8maHL7TVjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-Proofpoint-ORIG-GUID: 5qGNwZ9jHBEg1g0zjn7wp1emcZpVLJlv
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=68006db4 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=XZe7PhnZs3Yj-w9OOncA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5qGNwZ9jHBEg1g0zjn7wp1emcZpVLJlv
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215026

If autogen.sh is run outside of a git repo, the find-version function
always assumes that pinentry is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1-unknown

After the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../pinentry/pinentry_1.3.1.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..29aed68e40
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 211fd00a631da3e907e3a78890bfd1cf3bbe069e Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that pinentry is a beta version and adds the suffix
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
+index e6efe33..6acff4d 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -269,8 +269,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
index 14b368177c..aa0592d569 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
@@ -14,6 +14,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libassuan_pkgconf.patch \
            file://gpg-error_pkconf.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
 "
 
 SRC_URI[sha256sum] = "bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04"
-- 
2.34.1


