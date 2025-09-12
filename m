Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A59DCAC593
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:07:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20850.1757693271566158363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 09:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B+Sy9aGR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13506f3714=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5lOUs558447
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WdZyjOX3M7nEsB0DKes8jxc9oAxz+4S2tJsrhR6Gysk=; b=
	B+Sy9aGRm4SgpWJoj0jtDEIgJdV1iDtuYEJh8jrR+l9UYOrWtSA+wYAjiG4/DMlo
	iOd/nd+jVyhwU0iQSOY/6t6MqaAB2YLLsuDgZp4bZz8RkOLpqXXU/OIVa75LYVRQ
	8HzP1CFBduXn/uIYIfe3x7rmFcJO6agaCiO9gq8bb0vaOtGtPrY2DY9h5hkaoEaU
	fB2hsNMMDL3Surc1UCuC74jngdpS5iKiNAJ3DEicn7a8K81iU/1/lZkKIGC3FFk+
	zuqYP51D59HTqZIZAxY6HymNhrKaOgI/Mi4BII6WoJVqWx0jyoe6JewOoPfsjCo4
	TFO5dMZNUKz9cIlwlhDUVQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve36bu9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:07:46 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 12 Sep 2025 09:07:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 4/5] debug_build_tune.inc: override MESON_BUILDTYPE for meson.bbclass
Date: Sat, 13 Sep 2025 00:07:40 +0800
Message-ID: <20250912160741.346809-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912160741.346809-1-hongxu.jia@windriver.com>
References: <20250912160741.346809-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eI4_4dVkwA1kGpNEvgbNViVom479phuI
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c44556 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=NExZSWpPQYzSdC6iAAoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: eI4_4dVkwA1kGpNEvgbNViVom479phuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDE1MCBTYWx0ZWRfX1iYVjUMiDDRB
 q5W8KiW2bODehrIU32Dix0JXNqSYaJa34d/O91k/triv7Iqy3EnzLqmyjIfMVY+ELNJMWjcqXs7
 w0guhovkzvyjmHnZTv7QpZIOsHzye7DDMECrbZiQhLkFE9EDeeSLj8pfiWGx5PbxWZpeFxp+VJr
 uoQ6PYNAvYCpzkyjd+ryMYLMm55Ps9zZdZnhBQXOEh9dfuNcNHuRMXfqHbWO1Lj5CKXi99CSXSm
 5JAVR8vkDdSnqYndOHeFTKEK6Iy9/WgN/9qxRY4KamAvh2JTltUMDn7/ms6s549MY5yrxq6/OQ9
 kzrYWskjRnMFVt7KeM4EC/GWHmrohdNBya5I7ZVMUpft0WnehDNNt4DcrKb0yA=
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223331

The debug_build_tune.inc is used to collect debug tuning configuration,
override MESON_BUILDTYPE for meson.bbclass when DEBUG_BUILD is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/meson.bbclass             | 3 +--
 meta/conf/distro/include/debug_build_tune.inc | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index c8b3e1ec29a..0944ea03cc2 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -28,8 +28,7 @@ MESON_INSTALL_TAGS ?= ""
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
-MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
-MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
+MESON_BUILDTYPE ??= "plain"
 MESONOPTS = " --prefix ${prefix} \
               --buildtype ${MESON_BUILDTYPE} \
               --bindir ${@noprefix('bindir', d)} \
diff --git a/meta/conf/distro/include/debug_build_tune.inc b/meta/conf/distro/include/debug_build_tune.inc
index c2b877c2643..69cdbc84505 100644
--- a/meta/conf/distro/include/debug_build_tune.inc
+++ b/meta/conf/distro/include/debug_build_tune.inc
@@ -35,6 +35,9 @@ BUILD_OPTIMIZATION:append:mipsel:pn-python3-lxml = " -O"
 INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
 INHIBIT_SYSROOT_STRIP:class-native ?= "1"
 
+# For meson.bbclass
+MESON_BUILDTYPE ?= "debug"
+
 CPPFLAGS:append:arm::pn-lttng-ust = " -DUATOMIC_NO_LINK_ERROR"
 
 EXTRA_OECMAKE:remove:pn-webkitgtk = "-DWEBKIT_NO_INLINE_HINTS=OFF"
-- 
2.34.1


