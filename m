Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF61FCA101F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:17:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26096.1757917042267958819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QxD+aos0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F252jX2974038;
	Mon, 15 Sep 2025 06:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/PdU/w8H40M56Hn5N407NnAeOCX/Aujrx5Qqkrxp7/8=; b=
	QxD+aos0VkSd2qA6Ww/XN3C1EYsR4JAs5rW0YoYm3HHMcXksN+BU7iHrNHQOJooN
	9JO3po+MtczYAgFq0IcaPFMnsRtukYKhCkwiF+eWh6ojb/qdExsjhBXXwNrlgCBv
	AS2Fx/GEfJmeip3IHjvpq741d1TnroqPgQvrljOSlHifgphJ/6kx3R04Uwq+zFls
	6mC99QoVZJmOyG/s4+YhaovEJ7G/7cXwq6sz+81OlwwAieCGaLYX1RJjAWFgpM7R
	7MfEmgUfE0uClAqV9UE7SO3murKQq2I86qE9LpIbSqTrC+h+tPOxXcX3OnQsk2vT
	w+ARSjvJOeuakHuxU8p9Iw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494yk79pv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Sep 2025 06:17:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 14 Sep 2025 23:17:52 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 14 Sep 2025 23:17:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 6/8] debug_build.inc: override INHIBIT_SYSROOT_STRIP for cross and native
Date: Mon, 15 Sep 2025 14:17:41 +0800
Message-ID: <20250915061743.313230-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915061743.313230-1-hongxu.jia@windriver.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=GZYXnRXL c=1 sm=1 tr=0 ts=68c7af6f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=ZTSxEvWJ_2GTAduBev4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SW2jHcNinGZWm47a8-D9YEkGAAasYs9I
X-Proofpoint-ORIG-GUID: SW2jHcNinGZWm47a8-D9YEkGAAasYs9I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfX6MIBQkdsELrS
 V/hawxu6KOuYlrXQgPttfPe0RB8bhj2sf7fp3955ntWE1gwwcgK/6rOwFKbHLV9WpuL/pnvwrmh
 QR10xw5AsH9tWw7v9uNt3uO48lC+k7ddASgFIXDS9Kvj/hS3OKzuge8Y2rdhFkv4JXuSUVT9Glt
 a6wlkx8x9r1oTygw1vNlv2s+pmxPNrdxojqEtp2HaCYV74HQNJb3eFMxoEmQCgZvp2s7TjTG698
 jfmhWjkKH0vB4sfTh9+0WLa8AGIC3PKgzGPrFz2Y2C3QBO+OjcdsJslymcDqvo0qWk71WN9UN5o
 +h7r6QEOvJVXVa8w5nhPvV81jguub/Ll6hIc6viAndm24GpyzccRRmlnWE3cf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223382

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
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index f594df4b107..979dd111fc9 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -44,5 +44,9 @@ lcl_maybe_fortify:pn-vim = ""
 
 CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
 
+# No strip sysroot for cross and native
+INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
+INHIBIT_SYSROOT_STRIP:class-native ?= "1"
+
 # Allow other layers to add their own debug build configurations
 include_all conf/include/debug_build.inc
-- 
2.34.1


