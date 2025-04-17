Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5062DC369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:55:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.194.1744858550919549642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6202e9a415=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H1eWYX029573
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:50 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3njyj-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbi6GXPdMqK9UowAjLnehcDwgC218D1QoxLb6zfbA17HOkBHTmlAPp6bUPL6Nnr0m2ZWlrw2JcHPvhPEMuEGlANvMobisL4h9N26c9mD0Y2Fct9OtsxzAxM6PJtQWqnFfhSo+fpHaFk7rvm+wlKbc7cE16DzrU5BxxJ1eEnD+qgDr288OVU8O+7CEwoxJ0DcLCjg3qXJarsllOwWLgsisv9H+cAZEdF+1I97rdObP0rD5by6cN+io/9z7IlryjdSJG1qj2jk/pDHGo+PjTcXfOSkGzCMZrQs0vQy5iQ+Q6o5qXgrarKimMlkyIXBzrjZVD+qM5SOPy9ZmPD7iVQL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKjd1/l+yatH/99j4yALitqYRUOMjC0QHXvg0XvyAdE=;
 b=Ur7bjB8KsSEQv/CixYdyQSMYV7LPifNzHlOGpGlJXYgkY6FBu6WA+2Unl47TKe/U5jVF1B3zZpD9Ith5m22RgYkSz3Q1ocF6AG2iIQAOX0mZVKLO3hcK4b9VFYJWcbUlWx1pjmr6z/QbZo4UZ02q6zNixDt2+78S18mOVtrXIaZ6U2HoNpe2cqZgEiRE1Z6WQg5Xxl3+1PZfV0Si3W4gytyGM2T/6CFuAlCXNzFkAMY/srFWGJuqELR1DXak4kd2TmP85i7p/+SjnxogC3Fd0VjkKAQG8jFcAsuEa9VWLGp7CtPowNVMjQ0kVb0NBbZHuIa1tJE87CgXUsgU/RBadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 02:55:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 02:55:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] libassuan: drop -unknown suffix from version number
Date: Thu, 17 Apr 2025 10:55:31 +0800
Message-Id: <20250417025532.1363790-6-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2a1f9bb7-68ef-4eb3-0f57-08dd7d5b5b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZFvtUTRSH2huZHZw9ANww33Y+2sihwffnao9N2PJplLMmVO3kTJQgnhC7Q1t?=
 =?us-ascii?Q?u/JX4rUXveiD1M6UoHl+aFYU+pGU8+9xwF3SUgbfP9DBGdNd6PHIuvpXatFy?=
 =?us-ascii?Q?nZyGVxnfd5ulYqZRjM6fsBJgTuxAf7g4rGkFRmwFpOv026oRO1PIsZshi0rl?=
 =?us-ascii?Q?M+M27HtDBpuUoSnYy3qjOVYNZ3f3ilczaMBtvbJKv2RiTatH/M6FBBG/TtAx?=
 =?us-ascii?Q?Nexo5R2kD2K1a4S5U2i+UORF/1qMFFpynRgPhyb7WYLwcxNpJEUKLwz9d0mD?=
 =?us-ascii?Q?fJNgYkbnNlpMVMcZcfBkeOAjR6i5Hg+ZR0q3kyTKp3stcLEdduoWVVn1XTsH?=
 =?us-ascii?Q?dnntpOMaAc/DUW/X8G9dkLBOtKaAn1MC90NKe1Q0xJ3QMfsUQkGd/hDeiUAY?=
 =?us-ascii?Q?pnjZCpyiSgfqrSYExcSpz/Wqil5zh/PsfWY1GLUnfYb+Stx/NSTm/zvgbC/e?=
 =?us-ascii?Q?bFSsRoy8LQRAWgogD9elOSv0Zgt4GsvgF8p3FUQO2am8lDTFYgai9+JKMz2X?=
 =?us-ascii?Q?R5XHSC2OvJfwULwd4PUvUsfOIqVLqNCC4pjOD45Rec3fSYOHjGBR5v9kDbt6?=
 =?us-ascii?Q?Fom2+dOdK5x7IVfcgoQy5RxuMygOQdEa4WNggGRnOkxyY/za3lMShjUAMNzp?=
 =?us-ascii?Q?edwp4T1DOX6lSANkqhuGB57XYpVoYd9n8XpYcXrgV5vWnRZVx6+MpN0qQhfL?=
 =?us-ascii?Q?hgcMignWWD0VXRCN8gXvbz3VW+yjAbeZg5R37xPe4UY05vr4gsYteDVjueeh?=
 =?us-ascii?Q?ujquVs4lZxXPT5iLMgaSAaDnAF3VfcgCmOvPBiMt0jPfmpvlQUNvy2/vyDRg?=
 =?us-ascii?Q?6t6i47GSUAX4NcnpBeTv6gaDW36SuWbr50kbF4dxBTmahobaPSz1q+J1J4Do?=
 =?us-ascii?Q?x0fjW+MCMNlRyDz4wj9+f2UQdWJbxjI7aPQCkwovIONwMYOXNAJnHc3RojwN?=
 =?us-ascii?Q?ib4FquBTdbYOl9SQeCk2vk1knZpMqIPDDz6oZMG5nr5ar5XSO1s4I2baiCAq?=
 =?us-ascii?Q?ItQmhu2p1UtLZ58xWTjVBbTr2m9SqRJFaEdE7+l8cgvTSovfINBFnha+EfaE?=
 =?us-ascii?Q?ban51n0L5H3AvAgR1ZOI5WWP6MDhqQH9IyHrEu0zeiHvrBnvljeZpDYNGBRR?=
 =?us-ascii?Q?Fng6efCEt6310I49yI1jly9Xq9O7BQ/ebyTwt5fppZhOuABDYKyVIC3J5WQR?=
 =?us-ascii?Q?1vYvhmNgFX0EYvuxXkwEWSufyzoEDNRrlrd2enS2IXfgw9iUPaVyY5eE6sX1?=
 =?us-ascii?Q?SxyYbo9U4+IeQYbYVgHEBb66ESzywrNGWc+i2vMA0TvCVOrDJKyDXKtc7IQm?=
 =?us-ascii?Q?I+Mx86SVXZZv8hQkocaUk848OGJG4F3gy6HS5NZs5FYPkGbUrJhrp6bJafPj?=
 =?us-ascii?Q?wg4tZhsVr/1a12aUHsXkblPC0rSdj5bg69OJ1Kjlh/LypjKaX2qYG/xFzswH?=
 =?us-ascii?Q?r92HMYTCojQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XbnA7ApxdMPBH7CzjRM/u+Ad+V258t2ZSowE5ZJM2za4DWTjeJNxbMe+qQxY?=
 =?us-ascii?Q?g8TPmEnuDt1jRAY1bhVhk2lL1YGUqqfXw15cDVp4j1/pxpPCILdPKIx3Bae3?=
 =?us-ascii?Q?SvtEQP7d2SA8jQF1amJzPfB4wvGM4Lb+jDCqmfeeidW0qF4/+hBLBr2U+MZ6?=
 =?us-ascii?Q?H0NouiaAnA6+MP0ka+tNjDOS2PvnmH3TOhqY5E6lBtRcD1VWJx5kPFo37bJv?=
 =?us-ascii?Q?1PICN4XnNfVxUnUJVLhkZ2OVWXD5ejykj4A3+RG0bPIXARMDzEeOCOIMLhYc?=
 =?us-ascii?Q?wST8hglMJ91RAS9F1vaBJ1h86mcXPOdyodhp6mEN7sMSsuQnvWGqpdPg1j0U?=
 =?us-ascii?Q?sEZPZ0Qv2bX3na0QEReK3nHMxJTXgg2NhWjOZ6Cdy8i+VFDvHBeGzB78craI?=
 =?us-ascii?Q?nKqzY4dMXLuDqrD7dhj1djTsHCV8oHWQorWIXvSzeP83535ed0i76xET/eyI?=
 =?us-ascii?Q?mKQ9jQjn+FhRFG21lPs6B/RIfBjCow331A4TEj13ByWdIljM2eioCsySwIG3?=
 =?us-ascii?Q?TXL0C9oI2rh2LrQOWLz/vjYe4l+Q0cVSBdw8CIDh6IwtSnCGTFZg9LRuBocB?=
 =?us-ascii?Q?yYzUIldzOM+zAwEfhi+hL74wZDG4TmqlIzRp8T9MU072KwqrCM0mOM4jTdc6?=
 =?us-ascii?Q?bh4naU7WKHrMec5oq3C2OjZqKsgMppIQZ6LMy9rGSWcmEgQLFHOrl1IYPpLg?=
 =?us-ascii?Q?An3yJBsN+KocyMiEfGvqm85CAlBaGnGiWro8Yqpyw2qUSA2ED6P8UKlqMsIM?=
 =?us-ascii?Q?BKjqpvPTS2wRKWO+uAI3+OMt7Oy+Pfm4B7nHGnGdUMrQwxE87rwyNRo1E7EB?=
 =?us-ascii?Q?YNEc3WF9RE+dMj16GLRSARDr6k58KEY+Hzrt8qToFpIFdALUDCvSJQms24oD?=
 =?us-ascii?Q?1BOp6YsPsXyiQgOwJ2WOYNCNwkxnoYIlr50GlCswvQXLSTICpI65yLaG8Dgt?=
 =?us-ascii?Q?gX+2GDiI3u53aUCQHJvTPnQT0nRrlMtUm9ApMvROCjIMMLDXkH4v9NU8pUJi?=
 =?us-ascii?Q?lU+qvDnnPktQ0e1dzJtoO/VzzICibCdesQNRFeSb0ydI411TNuQ/ZV2g33qL?=
 =?us-ascii?Q?rCVxoBPFr1F86/2MD0zVQ4Ru11KYSkFCz4vdGJeCQn/CFVz31G+h6OS/oZ/Y?=
 =?us-ascii?Q?/BexPMlus//JsSGyk6PBImWLUVcZ/xXqvnz+fsEsx15tv3a0d5IdF0fLNtm+?=
 =?us-ascii?Q?+JPEmO9piiKKCKWYVjE2fzuk0bQuP/7mD0UdfveV0fntyrKaPOLxudegE1DQ?=
 =?us-ascii?Q?2KdFRCjrTLfFee6kfc2RyDLnyCAVoxygKoWoTPHG18oWB1XjPzP8c2qrCReB?=
 =?us-ascii?Q?xR8QkhH1vTLsZz4abuni6UASeMYb7CZPQ0eSEiP6PeUHwHg1oPva2XhJU16k?=
 =?us-ascii?Q?+9LRMC9zKBYcouNzGsEPNNs52jEWoHvEN7gEUou5N5pOOP+p+wVJDJpnS3eU?=
 =?us-ascii?Q?Psr3ZSYEbRDYE2cOM7ObLVp2h9yqWF9Et+CTifKosh3VvYOuNW9Xo9XQsOJY?=
 =?us-ascii?Q?iaR6DrVKny6zrGrXopn/gi2lSeuROwpzzNc3Fguz/gbbhM1fB4S8ybfdRhiO?=
 =?us-ascii?Q?iIt1mLtcyZWgoYIg/b6h3S5cKD2WEILL+nl3CYli?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1f9bb7-68ef-4eb3-0f57-08dd7d5b5b46
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:55:48.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvR8lmKE5V4FddLEprubrmVSMrNvNYis8Wfhsf9iI6h/LMsVvq5JF1lJ7jW6jk+lbtDH2/N8/hc6cwP6gckphg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-Proofpoint-ORIG-GUID: zU0dvj8aHK4KzLTzppGGR74gi3Wdj8Et
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=68006db6 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=99BbB_j3FNS7aohJxzYA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zU0dvj8aHK4KzLTzppGGR74gi3Wdj8Et
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215030

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libassuan is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libassuan/libassuan_3.0.2.bb              |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..5aff687e97
--- /dev/null
+++ b/meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From ecf05e7794edd56c6ff1cd7b14154e647dd0d787 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libassuan is a beta version and adds the suffix
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
+index 0b08e8b..0c5e425 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -284,8 +284,8 @@ if [ "$myhost" = "find-version" ]; then
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
diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
index f0b7746284..e4e903366f 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -18,6 +18,7 @@ DEPENDS = "libgpg-error"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
           "
 
 SRC_URI[sha256sum] = "d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6"
-- 
2.34.1


