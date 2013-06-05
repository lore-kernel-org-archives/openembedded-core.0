Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAEE61E92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 07:24:55 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hr14so4511729wib.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 00:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=IdU1CAkOUJaILrreILUskmtQy2lXq5Vf7GOpNUJVq78=;
	b=XPJHSS3rDAaxpCVsebNEojvUoMlYWd/j8Bn2ZS+gba0pAcCJDJleW/tpVqDbH4QI76
	DJAGRHSNli2lHyv1WU4sGIg5gHtv7II5U8M3hilvx9grv4SendV2fOHdkyuI5SoF00SI
	ippuMCPOVrgFhNosDhnl7IYdsRGpKEjV+QyFJhUA7uCwDyi7VpnCVmd01E67LEGLExI2
	QBEK8T9RsG0oElokiZDchCsAHv1/O/3+X4he2cjTt0MSUX6WRnO8tTAun5nfXJBWsJYb
	SOxusnluDdZpON2xSxNzark6vQUhlBbVWMFNSHORXIy8VVUz6tEbSR269fylt1uufR95
	ba0w==
X-Received: by 10.180.183.67 with SMTP id ek3mr5117138wic.44.1370417095132;
	Wed, 05 Jun 2013 00:24:55 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id k10sm8350679wia.4.2013.06.05.00.24.54
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 00:24:54 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 09:24:27 +0200
Message-Id: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQlfv9gd88ZYh5k0ww3GtWhGD7VysQJhANqlitewEycLnHlU6gMJ5qi9HGLonvTqm7HaxjII
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Wed, 05 Jun 2013 07:24:55 -0000

When building QTe SDK for a DISTRO that does not have x11 FEATURES,
building meta-toolchain-qte failed because it unconditionally pulls in
nativesdk-libx11. The 'culprit' is meta/recipes-qt/qt4/nativesdk-qt4-tools.inc.

The fix is inspired from the following commits:

abf2ab7 dbus: only use x11 if DISTRO_FEATURES has selected it
ba22cfa cairo: only use x11 if selected in DISTRO_FEATURES

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index cfc6fd8..3725cac 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,5 +1,6 @@
 DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
+X11DEPENDS = "nativesdk-libx11"
+DEPENDS = "nativesdk-zlib nativesdk-dbus qt4-native ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
-- 
1.8.1.2


