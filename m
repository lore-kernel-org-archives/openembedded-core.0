Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E791CAC594
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:07:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20673.1757693271154519460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 09:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fszDWDrk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13506f3714=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5lOUr558447
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PeiOll5xHCqnn0I6RvYjqAy0o3nFi5Q6hzC7h4P3oKQ=; b=
	fszDWDrkqgh1amFaeSzht1YVhdrSGdD3TCmwSbr3EGHr4/3AGSqBNT9jepw6WmrL
	uljS+nVgtG7QtsVTJuxIIid4wyiMZ/Vga+tG0++9wbMPVit6Ws6hEZfBoiPd2xL4
	lOmsrjvsNEvzN67P+KobKzWoXe6Phc52TBR6W+qyWd9Xt9jsEvFedSt7uoTn05Vs
	5WH0QNObgPY+Ze0Rg7F209jVi78ZRi1Tc5eYQ0BySS1C69Bl30POmL7+HPAIO/rI
	+eMFX7RVYwrDHPGCMmsJFTurrluQLClDEli6a/8BZOdH1ar9dthJ8OyCaiYmLgJH
	difOQ+V9wjeDmTSV8nsdZw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve36bu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:07:45 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 12 Sep 2025 09:07:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 3/5] debug_build_tune.inc: override INHIBIT_SYSROOT_STRIP for cross and native
Date: Sat, 13 Sep 2025 00:07:39 +0800
Message-ID: <20250912160741.346809-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912160741.346809-1-hongxu.jia@windriver.com>
References: <20250912160741.346809-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3xQ2cuTZH-hogfMKMBsXnNUWbJlvqToF
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c44556 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=ZTSxEvWJ_2GTAduBev4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3xQ2cuTZH-hogfMKMBsXnNUWbJlvqToF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDE1MCBTYWx0ZWRfXzbjPb+2JfLGM
 631ww4F9kAOni7wAmHRqUs6YECe5m7/0yCpqTJ4AyD+ff8yj3I0LrOfq8G7QloHu65SrbYghqz7
 1IOhngeth++RxVjSp9zkUXaxdhcMzY6KCi0+dJfiekJ9n9o/X3N12Ak+GxoodJCLygKcACY6fGP
 zzc1bB9sGKXFJytziHj0EQj33yusCHbsL2F8QY3kxbyYOIdowpdQXzXFfHwfmI74sSRtDaZChM0
 Zr1dW+InNR9dliTQjrYGHEh+x2avyk/VGepKcHLQjXl9s2ok5uBDVMaiKRrb/MT8i+QRcDa9Uvo
 V7sSQ8BlyVEp8Y9iwWQafA/2CvQt1LGOJNo4UjtUK4EuVPZRMUJ24TiHLbaEdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223330

The debug_build_tune.inc is used to collect debug tuning configuration,
override INHIBIT_SYSROOT_STRIP for cross and native bbclass when DEBUG_BUILD
is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cross.bbclass             | 3 +--
 meta/classes-recipe/native.bbclass            | 3 +--
 meta/conf/distro/include/debug_build_tune.inc | 4 ++++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 9abf166e50c..ede04950b5f 100644
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
index 7d1fe343fa0..b3411d20ca2 100644
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
diff --git a/meta/conf/distro/include/debug_build_tune.inc b/meta/conf/distro/include/debug_build_tune.inc
index ca43d2b955c..c2b877c2643 100644
--- a/meta/conf/distro/include/debug_build_tune.inc
+++ b/meta/conf/distro/include/debug_build_tune.inc
@@ -31,6 +31,10 @@ BUILD_OPTIMIZATION:append:mips:pn-python3-lxml = " -O"
 BUILD_OPTIMIZATION:remove:mipsel:pn-python3-lxml = " -Og"
 BUILD_OPTIMIZATION:append:mipsel:pn-python3-lxml = " -O"
 
+# No strip sysroot for cross and native
+INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
+INHIBIT_SYSROOT_STRIP:class-native ?= "1"
+
 CPPFLAGS:append:arm::pn-lttng-ust = " -DUATOMIC_NO_LINK_ERROR"
 
 EXTRA_OECMAKE:remove:pn-webkitgtk = "-DWEBKIT_NO_INLINE_HINTS=OFF"
-- 
2.34.1


