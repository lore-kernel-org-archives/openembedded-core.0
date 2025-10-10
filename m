Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E38CCD187
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 07:53:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3976.1760082795998203902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 00:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OQMp3YEH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237871debd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A5A8W71967446;
	Fri, 10 Oct 2025 07:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=L/lpD+KMWjjqj6u7VkpABgfrbYFR/g4o3saqkFUK0Ss=; b=OQMp3YEHVa9i
	mq3rj2K/Cik8L+/PHGZCpAFJVTYIOx4PWJD4SWoWn7qmnKTYSVhYoZ/f7pTuHR21
	ehMYvntPmYgSXvobhSxteKNRG/PIsf/xmgfMBTWCKKR5r2d5+Vf2ed7J4Yo6cDzO
	mdLSu9JbGyzTF80RklkAVeCUKFcwpMnUzRds/svXQbdw2yEteP9mf3wTs8xGo3ea
	x39fCaJI0nVUiyNRvd0+F/XQqDbQDVOJNG/HgqFFfFac6e6eOLskVDmfeFOayoNQ
	+i1qXOlELLgHNx5q3nIPaUHkCBJ3rkMUQy321DO12VbFnS0Nbj2z2e4e45vk3rfe
	qXKI7cxTZQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx37stsy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Oct 2025 07:53:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 00:53:04 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 00:53:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <peter.kjellerstedt@axis.com>, <randy.macleod@windriver.com>,
        <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v5 3/5] debug_build.inc: override INHIBIT_SYSROOT_STRIP for cross and native
Date: Fri, 10 Oct 2025 15:52:56 +0800
Message-ID: <20251010075258.2161972-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010075258.2161972-1-hongxu.jia@windriver.com>
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=68e8bb61 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=ZTSxEvWJ_2GTAduBev4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nieSXD1MNlTZz9-fUzENgxQCK06pL8kv
X-Proofpoint-GUID: nieSXD1MNlTZz9-fUzENgxQCK06pL8kv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA0NSBTYWx0ZWRfX5+0VZd6eJtql
 TuU4PPUJ1CxMWUo03XmqCkUl3ofgiOkyNGs8tE5HYSl/f8t7k3nRP2mcOixSkPmiEfitYuYQ0LM
 jpr9wTGrd1Kn16TcXUTXK4HmmdY+mECJDkJvk0hFtJ/ILWINImhXFy2nueUVldiGSRCbug+39hG
 mLsLnza6Ir+z/7dxN577qjO3RTjJ5qpGu2qHi64Qt4vqMMwRn3LuNFWYzFvGrdJe8luhgfKm2Hy
 nn+uzSOvEUteflyyuc7nFCwuhwCv3tHV1j7OyqS7akxOB6z0qJBwmecARB9VouWH83OIMnHD61j
 xPl1ddC7IjxNiNhoYqoCeZi6wPpwis9j7WRFTPlQh83P3ll6XIiwYAzLHXR66nRkOgErzRJwZky
 cqaOHco/Qnn22oG6gJDLMOywIUW0RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 07:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224670

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
index c006093345..1062326417 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -40,3 +40,7 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit = " --disable-inlined-xxhash"
 lcl_maybe_fortify:pn-vim = ""
 
 CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
+
+# No strip sysroot for cross and native
+INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
+INHIBIT_SYSROOT_STRIP:class-native ?= "1"
-- 
2.34.1


