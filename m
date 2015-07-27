Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 783 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Jul 2015 13:36:07 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id B34FC762E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:36:06 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.1/8.15.1) with ESMTPS id t6RDN01N014117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 15:23:00 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.79.122])
	by mail1.sbs.de (8.15.1/8.15.1) with ESMTP id t6RDN0Zj004007;
	Mon, 27 Jul 2015 15:23:00 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 15:22:58 +0200
Message-Id: <1438003378-4578-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] nativesdk-qt4-tools: depend on nativesdk-qt4-tools only if DISTRO_FEATURES includes x11
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
X-List-Received-Date: Mon, 27 Jul 2015 13:36:08 -0000

Currently nativesdk-qt4-tools can't be built if the DISTRO_FEATURES doesn't contain x11.
To make it build we add a dependency to x11 only if the feature is activated.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 1c9ee2e..1adad31 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,5 +1,5 @@
 SUMMARY = "SDK tools for Qt version 4.x"
-DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
+DEPENDS = "nativesdk-zlib nativesdk-dbus qt4-native ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11', '', d)}"
 SECTION = "libs"
 HOMEPAGE = "http://qt-project.org/"
 LICENSE = "LGPLv2.1 | GPLv3"
-- 
1.9.1


