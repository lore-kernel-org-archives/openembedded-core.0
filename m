Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TMczd-0004Ih-N8
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 13:01:25 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1680622wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2012 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kvSfBU9ynUAVBcnD0ODUMuf8HU3EHPnoWae/GYs2YFY=;
	b=yNdq5LDA9WpKgCgiUa+fxV7ZGf2sO0wuL3BiqZ0vNqTWKj5QK3E4BjCq9SC6QdeFbR
	eQYsIhp9MksRmxFNTpE/3my0yaq+6Cm6K06+go2Qf6Xl1y2qm68dBcvNtLhBpOKdvnbm
	mhQUQqlP1n8jZ6MlVfSoEaWEk5IXL5yiqF+jl6SD3i+xZn6vLtHC7YD43Rc4hXK10USk
	bgIhQw44I3WLIZpvkZga6wvurt+arRfP7N3sDuXi6AJgaiDRB7PG83teOC4noFx54edp
	UKfqmBlUp38GYxjLjlXsZC5pMhYllkleYEnW9kOzZTq2Rzbuua4rWkWyCSBkEui8Y5UY
	QSDA==
Received: by 10.216.28.140 with SMTP id g12mr2558359wea.59.1350038894579;
	Fri, 12 Oct 2012 03:48:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm2609833wib.10.2012.10.12.03.48.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 03:48:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2012 12:48:10 +0200
Message-Id: <1350038890-8985-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH] qt4: use extra variable for more QT_CONFIG_FLAGS fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 11:01:25 -0000

* qt4-embedded was forcing -DQT_KEYPAD_NAVIGATION which depends on feature-completer
* separate variable makes it easier to not enable QT_KEYPAD_NAVIGATION in some upper layer where we have disabled feature-completer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc | 10 ++++++++--
 meta/recipes-qt/qt4/qt4-x11-free.inc |  6 ++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 4a146f7..afca7f8 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -10,14 +10,20 @@ QT_BASE_LIB  ?= "libqt-embedded"
 # Set necessary variables in the profile
 SRC_URI += "file://qte.sh"
 
-QT_CONFIG_FLAGS += " \
+QT_EMBEDDED_FLAGS ?= " \
     -embedded $QT_ARCH \
     -qtlibinfix ${QT_LIBINFIX} \
+"
+QT_EMBEDDED_EXTRA_FLAGS ?= " \
     -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
     -qt-kbd-tty \
+"
+QT_EMBEDDED_KEYPAD_FLAGS ?= " \
     -DQT_KEYPAD_NAVIGATION \
-    "
+"
+
+QT_CONFIG_FLAGS += "${QT_EMBEDDED_FLAGS} ${QT_EMBEDDED_EXTRA_FLAGS} ${QT_EMBEDDED_KEYPAD_FLAGS}"
 
 require qt4.inc
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 404d8b8..20ad30c 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -12,11 +12,13 @@ INC_PR = "r47"
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
 QT_GLFLAGS_qemuppc = "-opengl"
-QT_CONFIG_FLAGS += "-no-xinerama -no-xkb"
+QT_X11_FLAGS ?= "-no-xinerama -no-xkb"
+QT_CONFIG_FLAGS += "${QT_X11_FLAGS}"
 QT_BASE_LIB  ?= "libqt"
 
 # required by kdelibs4
-QT_DISTRO_FLAGS = "-accessibility -sm"
+QT_KDE_FLAGS ?= "-accessibility -sm"
+QT_DISTRO_FLAGS ?= "${QT_KDE_FLAGS}"
 
 inherit qt4x11
 
-- 
1.7.12



