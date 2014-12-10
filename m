Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C010272341
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:18:44 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so3766870wgg.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nj4twscl1FCa09353oF8pEkP0lSNHNy2NSfx11WMtTM=;
	b=Dn7Sid0xdP1ODBoz4IoH8Ma8UXWEwzWIkkALZaMeYObcdILuglipdiaBZpQU4sSb4t
	sM5I2gAj+Hf3v8UfSyl/8sjmV0lBScMY0nZUyJV3/ttK8FxwG+gxTC4ymGUKCabN/ZY/
	5aa7QR1jmcKSnRrJW3Ww7yHhIThi+mck9gZSCBQQ1Wk8HLnOWP2uZhGAtrPW6rXMQuKO
	TtBeB1rQU9iuixOoQUGSITR+bFT89F9xuYY6poRhbeK7bWVfX7AVRvw6T9cW1wdMOeYa
	36ArU+XlBPFxgx5TS/ufhN2VWSdJWjm+UUj30tfrcLy7mKh0qRzr+bwPjByWIsMwD3Ph
	EYXg==
X-Received: by 10.180.73.235 with SMTP id o11mr6707996wiv.51.1418221124332;
	Wed, 10 Dec 2014 06:18:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p1sm6042043wjy.22.2014.12.10.06.18.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:18:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:18:37 +0100
Message-Id: <1418221117-12710-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 4/4] recipes-qt: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Dec 2014 14:18:47 -0000

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
index b06e15d..c3500ea 100644
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
2.1.3


