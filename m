Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1A192705D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:42:45 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so2729823wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VugJcEC/wqSSrwunnrYnQUnrTgVDpYGbsG/+C1DTuJs=;
	b=dB5iXYAFpFNrTop9dF8XpHibMuSJzxNsIXe31lGNMRxdiaxdwF5gr4r9BLA4I4vxix
	RnhLT+IDIgnBqDKgzBQqEUvQ6dhyuM4n1+JagibjXC38dUZGCuZbsJCD0pYJthRigkBw
	LHIR/ebBfZT42gQSfGWmZ9hlExXRVEPX27mo+CE+K+qxaoEweBkZ6gGwZHNA6i07U/XB
	Yqs1ziosF68xMIunE8XEj1bq6hva+RyPAKrzKBMzeCaOGQ+/VVRzljIXT2VJyxmoAOgp
	6BhkXsygXtUKKAsJefZbl9avU1ciijiBN+1BfdqScPRk1p4EYfiW2KNciTkt9+NetFFK
	Yt1g==
X-Received: by 10.180.24.225 with SMTP id x1mr13051822wif.14.1406209364830;
	Thu, 24 Jul 2014 06:42:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w9sm22939358wif.12.2014.07.24.06.42.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 06:42:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 15:42:56 +0200
Message-Id: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH 1/4] xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
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
X-List-Received-Date: Thu, 24 Jul 2014 13:42:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb      | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 5 ++++-
 meta/recipes-graphics/xorg-app/xprop_1.2.2.bb      | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
index 96ea030..84d0cb8 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 SRC_URI[md5sum] = "a3035dcecdbdb89e864177c080924981"
 SRC_URI[sha256sum] = "975e98680cd59e1f9439016386609546ed08c284d0f05a95276f96aca6e8a521"
 
-DEPENDS += " virtual/libx11 libxau libxt libxext libxmu libxrender"
+DEPENDS += "libxau libxt libxext libxmu libxrender"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 524a2d3..59a04fa 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -5,12 +5,15 @@ SECTION = "x11/apps"
 LICENSE = "MIT-X"
 DEPENDS = "util-macros-native virtual/libx11"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 INC_PR = "r8"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
index efbb1b3..d78bf04 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
@@ -10,7 +10,7 @@ formatting information."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e226ab8db88ac0bc0391673be40c9f91"
 
-DEPENDS += " libxmu virtual/libx11"
+DEPENDS += "libxmu"
 
 PE = "1"
 
-- 
2.0.2


