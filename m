Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FB7CAC5A0
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11592.1757995780785675098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gk7KPU7d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G2slG81208297;
	Tue, 16 Sep 2025 04:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zcnjYTcKWtDxkY7Jd15POVc9wJyXE7mFIzLFG+7LbmQ=; b=
	gk7KPU7dKMkcnc83a2G/xfHHerzgwdddyOlDs5jPfm8jI7xhxLfiDalB/SMzdxDE
	tRTUE82Q5W1ATsohLgrwKsoQG8NpSwGVONoRyTo6NXZzyORLbm22QdBaFkZMzsBn
	/UdCN6R7KlbT/fxpMCCsYTOCTd336wUI6yh2IWELsoezLIjHMLVsG5/4sSOHxlQ2
	RdfOQAIzGhRTqdpmVfY82qaR1l8NCsjmJtcoL31HlFfohy3P9FfNBprrHs0Qby2I
	twY/8vXK68NP00k5hlAdh3CE4z+Kz0fza/2yIamXSnGzKLrzNBTV+KUHBZnqZr/W
	B6ndov2kHJbzdBkzy4kbhg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 496pekrha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:37 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:36 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 6/8] debug_build.inc: override INHIBIT_SYSROOT_STRIP for cross and native
Date: Tue, 16 Sep 2025 12:09:25 +0800
Message-ID: <20250916040927.103722-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040927.103722-1-hongxu.jia@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX4Cux0bU/74UF
 MVSdsaA0m3NUtw8+MHu3n6Dv9mEEGK4MKmwKikHPXP0FgfJfz5lFSWAGcnRRoImJWaKDEKvN+sl
 FAIEdKQz6GHkWfyhGmSGkBk3/Zd53uDJ9PXDNjLjl/8OW2QlWI9mQYBgnzmPy1XOb09qi1tnzPY
 XkYUDffLtQvVKATyvokZjgm+XkvQJ4Zh7/OnYkNp/pU1o9/BPzYU/FLMvoJazNuavwg7215FX0+
 lEE3i3945aRW+OvboBfbALHwCOK1KKGaOUYdjRead7HYh50KYUAoX4IDYDbobBIQQCOH9/JOjIV
 BqEjBEa+7qjFQ5h+FqF2o0YAc0LObsSmk+gusccvMIMGMpSAVs9gMBgmHzT804=
X-Authority-Analysis: v=2.4 cv=DYAXqutW c=1 sm=1 tr=0 ts=68c8e301 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=ZTSxEvWJ_2GTAduBev4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: znYX-Hwe4aDHelV6sNaG1acN42dYMF52
X-Proofpoint-GUID: znYX-Hwe4aDHelV6sNaG1acN42dYMF52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223521

The debug_build.inc is used to collect debug build configuration,
override INHIBIT_SYSROOT_STRIP for cross and native bbclass when DEBUG_BUILD
is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cross.bbclass        | 3 +--
 meta/classes-recipe/native.bbclass       | 3 +--
 meta/conf/distro/include/debug_build.inc | 4 ++++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 9abf166e50..ede04950b5 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -23,8 +23,7 @@ HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_LD_ARCH = "${BUILD_LD_ARCH}"
 HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
-# No strip sysroot when DEBUG_BUILD is enabled
-INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+INHIBIT_SYSROOT_STRIP ??= ""
 
 export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64 /usr/lib /usr/lib64"
 
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 7d1fe343fa..b3411d20ca 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -118,8 +118,7 @@ PATH:prepend = "${COREBASE}/scripts/native-intercept:"
 # reused if we manipulate the paths.
 SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 
-# No strip sysroot when DEBUG_BUILD is enabled
-INHIBIT_SYSROOT_STRIP ?= "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
+INHIBIT_SYSROOT_STRIP ??= ""
 
 python native_virtclass_handler () {
     import re
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index ae6dc7f4c6..6e28e76b44 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -42,3 +42,7 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit = " --disable-inlined-xxhash"
 lcl_maybe_fortify:pn-vim = ""
 
 CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
+
+# No strip sysroot for cross and native
+INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
+INHIBIT_SYSROOT_STRIP:class-native ?= "1"
-- 
2.34.1


