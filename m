Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5683E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 12:23:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.61490.1735561396785588833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 04:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=30946ffcbd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUCM003025364
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 12:23:16 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a81m4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 12:23:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 30 Dec 2024 04:23:14 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 30 Dec 2024 04:23:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] icu: fix buildpaths QA error occasionally
Date: Mon, 30 Dec 2024 04:23:14 -0800
Message-ID: <20241230122314.1835719-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CqZFwLVcHMuNtGceaqTFOgjvTAaJbIV_
X-Proofpoint-ORIG-GUID: CqZFwLVcHMuNtGceaqTFOgjvTAaJbIV_
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=677290b3 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=53YJ4SoVRwPEYcq3EYwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-30_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412300107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 12:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209160

$ bitbake icu
...
ERROR: QA Issue: File /usr/lib64/icu/76.1/pkgdata.inc in package icu-dev contains reference to TMPDIR [buildpaths]
...

$ vim tmp/work/corei7-64-wrs-linux/icu/76-1/image/usr/lib64/icu/76.1/pkgdata.inc
...
INSTALL_CMD=path-to-build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install -c
...

The autoconf walked $PATH to find INSTALL_CMD, and commit [icu:
remove host references in nativesdk to fix reproducibility] [1]
removed prefix ${HOSTTOOLS_DIR}/ from pkgdata.inc.

If setting INSTALL_CMD with recipe-sysroot-native's install,
the buildpaths QA error occurs.

Explicitly set INSTALL_CMD with hosttools's install

[1] https://github.com/openembedded/openembedded-core/commit/dc6306883cc2c7d4d98d595442e5bf4037a160c5

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/icu/icu_76-1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index 08dabde3ae..47847a6903 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -132,6 +132,8 @@ GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
 
 EXTRA_OECONF:append:libc-musl = " ac_cv_func_strtod_l=no"
 
+EXTRA_OECONF:append = " ac_cv_path_install='${HOSTTOOLS_DIR}/install -c'"
+
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[make-icudata] = ",,,"
 
-- 
2.25.1


