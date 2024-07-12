Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D9BC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 05:26:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1157.1720761960010768527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 22:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7923e07da7=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C4atPl013485
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 22:25:59 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg5bbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 22:25:59 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 22:25:58 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 22:25:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/2] webkitgtk: fix do_compile errors on beaglebone-yocto
Date: Fri, 12 Jul 2024 13:25:56 +0800
Message-ID: <20240712052556.3982466-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240712052556.3982466-1-changqing.li@windriver.com>
References: <20240712052556.3982466-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: n1H3IF2qAKkqoF_IFVAASDrX7Nk7sPLy
X-Proofpoint-ORIG-GUID: n1H3IF2qAKkqoF_IFVAASDrX7Nk7sPLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407120034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 05:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201800

From: Changqing Li <changqing.li@windriver.com>

Backport 2 patches to fix following compile errors:
webkitgtk-2.44.1/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:545:37: error: 'LS_POINT' was not declared in this scope; did you mean 'WebCore::LightType::LS_POINT'?
  545 |     if (data.lightSource->type() == LS_POINT) {
      |                                     ^~~~~~~~
      |                                     WebCore::LightType::LS_POINT

webkitgtk-2.44.1/Source/WebCore/platform/graphics/filters/FELighting.h:73:41: error: 'LightingData' does not name a type
   73 |     inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...fic-declarations-in-FELighting.h-unn.patch | 43 ++++++++++++
 ...icDowncast-adoption-in-platform-code.patch | 65 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb  |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
new file mode 100644
index 0000000000..1b457f7519
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
@@ -0,0 +1,43 @@
+From dbd1a59b239b3902e717fdeb063883dbb0b06ee9 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sun, 26 May 2024 14:24:35 -0700
+Subject: [PATCH 1/2] Remove ARM-specific declarations in FELighting.h unneeded
+ after 272873@main
+
+Unreviewed build fix.
+
+* Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
+  declarations for the getPowerCoefficients() and platformApplyNeon()
+  functions, which are now defined elsewhere; and were causing a build
+  failure due to usage of the protected LightingData type.
+
+Canonical link: https://commits.webkit.org/279334@main
+
+Backport this patch for fixing following compile error:
+webkitgtk-2.44.1/Source/WebCore/platform/graphics/filters/FELighting.h:73:41: error: 'LightingData' does not name a type 
+   73 |     inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/36d1b5d7c0ef9a733ee8055b1f35b1d24435d538]
+---
+ Source/WebCore/platform/graphics/filters/FELighting.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
+index 4efab920..dcd80b6f 100644
+--- a/Source/WebCore/platform/graphics/filters/FELighting.h
++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
+@@ -68,11 +68,6 @@ protected:
+ 
+     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
+ 
+-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+-    static int getPowerCoefficients(float exponent);
+-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
+-#endif
+-
+     Color m_lightingColor;
+     float m_surfaceScale;
+     float m_diffuseConstant;
+-- 
+2.25.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch b/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
new file mode 100644
index 0000000000..a0c7b6bd57
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
@@ -0,0 +1,65 @@
+From 88fa4b49a10ecfb74c36c678c1e2b76136357153 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 12 Jul 2024 10:16:05 +0800
+Subject: [PATCH 2/2] More dynamicDowncast<> adoption in platform code
+
+Backport part of commit [90d13e7 More dynamicDowncast<> adoption in
+platform code] to fix following compile error for ARM_NEON:
+webkitgtk-2.44.1/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:545:37: error: 'LS_POINT' was not declared in this scope; did you mean 'WebCore::LightType::LS_POINT'?
+  545 |     if (data.lightSource->type() == LS_POINT) {
+      |                                     ^~~~~~~~
+      |                                     WebCore::LightType::LS_POINT
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/90d13e77ab2192b7efa8e763eeb8b08dbbb6d5c3]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../filters/FELightingNeonParallelApplier.cpp | 22 +++++++++----------
+ 1 file changed, 10 insertions(+), 12 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
+index 04d855fa..dccc003d 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
+@@ -542,19 +542,17 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
+     floatArguments.colorBlue = color.blue;
+     floatArguments.padding4 = 0;
+ 
+-    if (data.lightSource->type() == LS_POINT) {
++    if (auto* pointLightSource = dynamicDowncast<PointLightSource>(*data.lightSource)) {
+         neonData.flags |= FLAG_POINT_LIGHT;
+-        auto& pointLightSource = downcast<PointLightSource>(*data.lightSource);
+-        floatArguments.lightX = pointLightSource.position().x();
+-        floatArguments.lightY = pointLightSource.position().y();
+-        floatArguments.lightZ = pointLightSource.position().z();
++        floatArguments.lightX = pointLightSource->position().x();
++        floatArguments.lightY = pointLightSource->position().y();
++        floatArguments.lightZ = pointLightSource->position().z();
+         floatArguments.padding2 = 0;
+-    } else if (data.lightSource->type() == LS_SPOT) {
++    } else if (auto* spotLightSource = dynamicDowncast<SpotLightSource>(*data.lightSource)) {
+         neonData.flags |= FLAG_SPOT_LIGHT;
+-        auto& spotLightSource = downcast<SpotLightSource>(*data.lightSource);
+-        floatArguments.lightX = spotLightSource.position().x();
+-        floatArguments.lightY = spotLightSource.position().y();
+-        floatArguments.lightZ = spotLightSource.position().z();
++        floatArguments.lightX = spotLightSource->position().x();
++        floatArguments.lightY = spotLightSource->position().y();
++        floatArguments.lightZ = spotLightSource->position().z();
+         floatArguments.padding2 = 0;
+ 
+         floatArguments.directionX = paintingData.directionVector.x();
+@@ -565,8 +563,8 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
+         floatArguments.coneCutOffLimit = paintingData.coneCutOffLimit;
+         floatArguments.coneFullLight = paintingData.coneFullLight;
+         floatArguments.coneCutOffRange = paintingData.coneCutOffLimit - paintingData.coneFullLight;
+-        neonData.coneExponent = getPowerCoefficients(spotLightSource.specularExponent());
+-        if (spotLightSource.specularExponent() == 1)
++        neonData.coneExponent = getPowerCoefficients(spotLightSource->specularExponent());
++        if (spotLightSource->specularExponent() == 1)
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+         ASSERT(data.lightSource->type() == LS_DISTANT);
+-- 
+2.25.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 14f7531549..c4a3c464c1 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
+           file://0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch \
+           file://0002-More-dynamicDowncast-adoption-in-platform-code.patch \
            "
 SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
 
-- 
2.25.1


