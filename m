Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668B7FEEF25
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 11:18:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78013.1775556727273135894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 03:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=f8o3mCOr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: mangadi@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ifJK2580486
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Apr 2026 09:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2lAEKyctLZORfkOccYq7GhxF/jZ6giBxoe3
	HbgC0PhM=; b=f8o3mCOrs2WDzebJWLEfFnHww95lwR/neFF3uVKTG1EzM8t77JE
	XqkwjOG0nCuoHpaUFODUKV1DnFCeZBelXwxIUHU0taDh8B+samA60UulxfiZv7UN
	ZKOsgTQlBbQKk2nQsN+fv/W5YZKCBjcyTeXz6/rNLB3YoLHowpmEUrhSgj3fjPmt
	H6QtQEYEe10FNJJtCPRTNh2vKOFvdg/zEpaF625reRYpStMNLYMt6Tr4WqHlivgn
	KHoYfqyYUyckJmPNff86RW79SvoDSok5KeB2dLwkh1u7ha/cBKEa1jh3cOWnRxwV
	CoG/BnpNa6GekSZ+D5AH49eoJRE2rxyHR8A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf24yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:48:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6379hSLb028390
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Apr 2026 09:48:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4db4jf7rue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:48:04 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6379hKpj028304
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Apr 2026 09:48:04 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.108.83])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6379m4Ef001629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 09:48:04 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2304365)
	id 96CFE5E7; Tue,  7 Apr 2026 15:18:03 +0530 (+0530)
From: Mahesh Angadi <mangadi@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Mahesh Angadi <mangadi@qti.qualcomm.com>
Subject: [PATCH] weston: backport gl-shaders fix to avoid shader compiler crashes
Date: Tue,  7 Apr 2026 15:17:59 +0530
Message-Id: <20260407094759.3116923-1-mangadi@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfXxQlyJmAEHhGI
 hfuYOIZXjsLnV4xpAPd5uUmuuQFFktPUpmf8Ng7oIOgXT9hkgCs8p1Kui6VFW/D5Z1ytVmw1w+z
 U8OxugmBa/34okoTvfIRPJFl+uViDGhhQhPOS2+/bH5CTkJ7s7p83Uw4jTUAToQhy0hIgaSjM8+
 LbGixCE4UXDPKgHnLg1JCq0JmIw1wcG3jcFxC81j1uPeeT93MW0GG+uJHz0q0GzGZgFkq6lwwhH
 rrpjoOEv2+ldB1SCN/HbY8MNfw5h40nkvG6sWmihxpQ5rgOX3osX2j53Od+ZRSeo7OFxz0GkACw
 c8TWiS3eSYHIXC/QpCWfa0RTAPm0yNqknA+mIBygCAMLvgljD+BQP3eleeSehDvlD1eJZQ0/7yH
 f+wD33mQrTpFi83JMxPkV4toIeZICEYXZ//SrQjMohmUQ63DDVlgpeHOyt/ibzsSu+CQ72NL01k
 6z8JHZZzazTLgi17UHw==
X-Proofpoint-ORIG-GUID: f1wS8i6eYnOnbC3MSRwD8xf4L55h3I8j
X-Proofpoint-GUID: f1wS8i6eYnOnbC3MSRwD8xf4L55h3I8j
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4d2d9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8
 a=KMa9XPk8u63VMljZ2WgA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070089
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 11:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234729

Some GPU shader compilers do not optimize away unused YUV shader
uniforms, even when the associated code paths are unreachable. This can cause
Weston to hit assertion failures at runtime on non-Mesa platforms, despite
working correctly on Mesa-based drivers.

Backport the upstream gl-shaders fix to restore stable behavior across
GPU drivers.

Signed-off-by: Mahesh Angadi <mangadi@qti.qualcomm.com>
---
 ...e-asserts-relying-on-shader-compiler.patch | 47 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_15.0.0.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-gl-shaders-Remove-asserts-relying-on-shader-compiler.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-gl-shaders-Remove-asserts-relying-on-shader-compiler.patch b/meta/recipes-graphics/wayland/weston/0001-gl-shaders-Remove-asserts-relying-on-shader-compiler.patch
new file mode 100644
index 0000000000..4c9b740bd2
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-gl-shaders-Remove-asserts-relying-on-shader-compiler.patch
@@ -0,0 +1,47 @@
+From 5c49563ef49a502a6b8fae44f8778e109d32c2d9 Mon Sep 17 00:00:00 2001
+From: Robert Mader <robert.mader@collabora.com>
+Date: Mon, 2 Mar 2026 13:11:05 +0100
+Subject: [PATCH] gl-shaders: Remove asserts relying on shader compiler
+ behavior
+
+yuv_coefficients and yuv_offsets should get optimized away by shader
+compilers as the related code paths can never be reached. This seems to
+work well on Mesa but not necessarily with other drivers.
+
+While on it, assert that the uniforms *are* present, unless the
+yuv-to-rgb conversion is handled by the driver.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/commit/5c49563ef49a502a6b8fae44f8778e109d32c2d9]
+Signed-off-by: Robert Mader <robert.mader@collabora.com>
+---
+ libweston/renderer-gl/gl-shaders.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/libweston/renderer-gl/gl-shaders.c b/libweston/renderer-gl/gl-shaders.c
+index 98041882..18eeedf6 100644
+--- a/libweston/renderer-gl/gl-shaders.c
++++ b/libweston/renderer-gl/gl-shaders.c
+@@ -762,8 +762,18 @@ gl_shader_load_config_representation(struct weston_compositor *compositor,
+ 
+ 	if (sconf->yuv_coefficients == WESTON_COLOR_MATRIX_COEF_UNSET ||
+ 	    sconf->yuv_coefficients == WESTON_COLOR_MATRIX_COEF_IDENTITY) {
+-		assert(shader->yuv_coefficients_uniform == -1);
+-		assert(shader->yuv_offsets_uniform == -1);
++		/*
++		 * In this case the yuv_coefficients and yuv_offsets uniforms
++		 * should never be used and thus get optimized away by the
++		 * shader compiler. Unfortunately on some drivers this is not
++		 * the case, so we can't assert on it.
++		 */
++		return;
++	}
++
++	if (shader->yuv_coefficients_uniform == -1 ||
++	    shader->yuv_offsets_uniform == -1) {
++		assert(shader->key.variant == SHADER_VARIANT_EXTERNAL);
+ 		return;
+ 	}
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/wayland/weston_15.0.0.bb b/meta/recipes-graphics/wayland/weston_15.0.0.bb
index b67f5f52dd..da347659f1 100644
--- a/meta/recipes-graphics/wayland/weston_15.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_15.0.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://0001-vulkan-renderer-guard-surface-output-creation-with-b.patch \
+           file://0001-gl-shaders-Remove-asserts-relying-on-shader-compiler.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
-- 
2.34.1


