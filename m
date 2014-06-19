Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B31566FC94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 11:23:43 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so2650739wiw.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V1xcx2rBmlYGl1GA4Tt08sYZPzjfNK17Ap3hIGtO0Xo=;
	b=qgmgGayHPl9AmNbMNRcRUFKos8O7FBj5wBbuV1vEJG6A9Piyz7r8c2F5O7Vb3mikHX
	2Mtk34JO8ahvnJoExjQ9d7pFm/vn1vPeIpF88UN8cJguUFPuaD2Zv81o3Qxh8RxAnd7w
	4RzMHlyGdeiyUmx8ASuCzPwaAOmqW++iJJzWgSDoRnwValElNuHAK5Q66c+mFPH6B0xD
	docZ1r4pYWFQYsnXBkf70Bhsc4UkJk21i1d2XBe/TFeDurlM/Tx2k7vljm/CK/ock3Wb
	mPe+B7CEdXoxBkWva9y6d5lV9Sc6klNLCM322TnuN5NYS4cU4sS9F/vjQKL+Rgv/z5fx
	bQig==
X-Received: by 10.194.243.104 with SMTP id wx8mr4370554wjc.32.1403177023924;
	Thu, 19 Jun 2014 04:23:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o3sm32482464wiz.24.2014.06.19.04.23.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 04:23:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jun 2014 13:23:42 +0200
Message-Id: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
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
X-List-Received-Date: Thu, 19 Jun 2014 11:23:44 -0000

* update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscripts, so these cannot be allarch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/usbinit/usbinit.bb                      | 2 +-
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb | 2 +-
 meta/recipes-graphics/wayland/weston-init.bb             | 2 +-
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index aba44b4..bc36824 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -15,7 +15,7 @@ do_install() {
     install usb-gether ${D}${sysconfdir}/init.d
 }
 
-inherit update-rc.d allarch
+inherit update-rc.d
 
 INITSCRIPT_NAME = "usb-gether"
 INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 64f85c2..4eec578 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://run-postinsts \
            file://run-postinsts.init \
            file://run-postinsts.service"
 
-inherit allarch systemd update-rc.d
+inherit systemd update-rc.d
 
 INITSCRIPT_NAME = "run-postinsts"
 INITSCRIPT_PARAMS = "start 99 S ."
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 38b78bc..ae306c9 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -11,7 +11,7 @@ do_install() {
 	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 }
 
-inherit allarch update-rc.d
+inherit update-rc.d
 
 RDEPENDS_${PN} = "weston kbd"
 
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
index fff3620..a2f51d4 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
+++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
@@ -11,7 +11,7 @@ do_install() {
 	install -m 0755 ${WORKDIR}/qtdemo-init ${D}${sysconfdir}/init.d/qtdemo
 }
 
-inherit update-rc.d allarch
+inherit update-rc.d
 
 INITSCRIPT_NAME = "qtdemo"
 INITSCRIPT_PARAMS = "start 99 5 2 . stop 19 0 1 6 ."
-- 
2.0.0


