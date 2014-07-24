Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE59707E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:42:49 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so2783425wes.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qa9t2kCPaG7UXqlu3FKbiNKpi1p6OaWiGDkoF1M0nrE=;
	b=x3KfXHvrdy1IEHQBnHN0e+9hyqt4cByXbljAP7mNs1PBZCigHs7dU59lb2YTX34eBq
	NFc8vQDZ8ReNsZx5C1ugLGhg0Dl7Htq2ijz3kDi/kwSWLu4fKCXBU9u4YTpZnhrJUZV+
	bB7vBZTIvuiVPAtygq+JqzOEMCyUsyTa/V72UU3DCfxzgmmEc6ymKymLrjA/aRDy9g0x
	9X2f/lEdnB7i5PL1bfmqS3/cBPnXjl209ZBzZazvr5NCpv9u9uAM4GfAHw3Ch8DdxcTe
	wag4iJJuMW72xKmg8Q8vthdItFtNKUlZz4bLagGma0uHW1Jpobb3UgaCD0s6tHlPtxOl
	0Hlw==
X-Received: by 10.194.90.228 with SMTP id bz4mr12442886wjb.65.1406209370362;
	Thu, 24 Jul 2014 06:42:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eo4sm23217154wid.4.2014.07.24.06.42.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 06:42:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 15:42:59 +0200
Message-Id: <1406209379-1662-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] recipes-qt: add x11 to required DISTRO_FEATURES
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

* it's not complete, but recipes depending on virtual/libx11 are easiest
  to spot, I've long list of PNBLACKLIST for all recipes which cannot
  be built in distro without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/qt4x11.bbclass                                       | 5 ++++-
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb | 4 ++++
 meta/recipes-qt/qt4/qt4-x11-free.inc                              | 5 ++++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index 65d196a..bdbfc4a 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -1,7 +1,10 @@
 QT4DEPENDS ?= "qt4-x11 "
 DEPENDS_prepend = "${QT4DEPENDS}"
 
-inherit qmake2
+# depends on qt4-x11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+inherit qmake2 distro_features_check
 
 QT_BASE_NAME = "qt4"
 QT_DIR_NAME = "qt4"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
index 0e7c800..772c151 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
@@ -4,6 +4,10 @@ QTLIBPREFIX = ""
 
 require packagegroup-qt-toolchain-target.inc
 
+inherit distro_features_check
+# depends on qt4-x11-free
+REQUIRED_DISTRO_FEATURES = "x11"
+
 RDEPENDS_${PN} += " \
         qt4-x11-free-dev \
         ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev', '', d)} \
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 3b1e0fe..b621f8e 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -8,6 +8,9 @@ DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender li
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 INC_PR = "r50"
 
 QT_GLFLAGS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
@@ -21,7 +24,7 @@ QT_BASE_LIB  ?= "libqt"
 QT_KDE_FLAGS ?= "-accessibility -sm"
 QT_DISTRO_FLAGS ?= "${QT_KDE_FLAGS}"
 
-inherit qt4x11
+inherit qt4x11 distro_features_check
 
 do_install_append() {
   # fix pkgconfig, libtool and prl files
-- 
2.0.2


