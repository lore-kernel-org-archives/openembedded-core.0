Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC87160616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 02:29:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6Q2TcVx009237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 19:29:38 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 19:29:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 26 Jul 2018 10:39:47 +0800
Message-ID: <1532572787-5992-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LYdkR+2p4FGDgQJFsOGTFMqsS1Syr015sz2d1_nS3KPFg@mail.gmail.com>
References: <CAJTo0LYdkR+2p4FGDgQJFsOGTFMqsS1Syr015sz2d1_nS3KPFg@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] webkitgtk: fix compile failure on beaglebone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 02:29:39 -0000
Content-Type: text/plain

Since the following patch applied in upstream webkitgtk
...
commit 1a55d8c685b3e5b4dbeda202009e7527aa59eadd
Author: simon.fraser@apple.com <simon.fraser@apple.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
Date:   Thu Nov 23 22:20:09 2017 +0000

    FELighting cleanup and optimization
    https://bugs.webkit.org/show_bug.cgi?id=179933
...

It missed to tweak `paintingData.lightVector' which caused
PaintingData' has no member named 'lightVector' on ARM_NEON
(beaglebone)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...gData-has-no-member-named-lightVector-on-.patch | 37 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.20.3.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch
new file mode 100644
index 0000000..25f4846
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch
@@ -0,0 +1,37 @@
+From a5d4e038268ae23486fecc1966fd2e16a7f40ce8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 25 Jul 2018 00:23:48 -0700
+Subject: [PATCH] Fix PaintingData' has no member named 'lightVector' on
+ ARM_NEON
+
+* platform/graphics/cpu/arm/filters/FELightingNEON.h:
+(WebCore::FELighting::platformApplyNeon):
+
+Upstream-Status: Submitted
+https://bugs.webkit.org/show_bug.cgi?id=187991
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+index 42af922..b542a4c 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+@@ -144,9 +144,9 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+         ASSERT(m_lightSource->type() == LS_DISTANT);
+-        floatArguments.lightX = paintingData.lightVector.x();
+-        floatArguments.lightY = paintingData.lightVector.y();
+-        floatArguments.lightZ = paintingData.lightVector.z();
++        floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
++        floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
++        floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
+         floatArguments.padding2 = 1;
+     }
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
index 9d0f00a..a528c5d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://detect-gstreamer-gl.patch \
            file://0012-soup-Forward-declare-URL-class.patch \
+           file://0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch \
            "
 
 SRC_URI[md5sum] = "efb69a0cc3cc67ef2647efec22e44c69"
-- 
2.7.4


