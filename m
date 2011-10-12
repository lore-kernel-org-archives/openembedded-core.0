Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDtaY-0005Jl-4f
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 09:50:54 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so617268bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gFq9+/KpUJxba/XDN6uW5Fmfk2fNoBAjgr6PIuiD6co=;
	b=uBRMudxj2ApFrCXxCGeY8yi1Nr1WpNK99GwVpRCVvj2xlKB21DYq91eBhstk0gD7C/
	aGFArVdwcqwtxMa/0M1rsSvFdcyTA7ejF6Cj4jHAZJzOsRelQM8eMhQwbdTBB+wpVEHl
	cYaMN8SVhNMEjMKJ26l29SFNTkVdD1ro13mNE=
Received: by 10.204.148.68 with SMTP id o4mr9539948bkv.21.1318405513961;
	Wed, 12 Oct 2011 00:45:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm1069941bkd.6.2011.10.12.00.45.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 00:45:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 09:45:02 +0200
Message-Id: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1318405370.git.Martin.Jansa@gmail.com>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
Subject: [oe-core 1/4] qt4-embedded: remove dependency on tslib and use std. linux input
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 07:50:54 -0000

From: Simon Busch <morphis@gravedo.de>

In most cases we don't need tslib in std. configuration as touchscreen access in most
devices today is done with linux input interface. If some specific machine has a need for
tslib support it should add the dependency in it's machine layer again and modify the
profile script accordingly.

Signed-off-by: Simon Busch <morphis@gravedo.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/files/qte.sh     |    2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/files/qte.sh b/meta/recipes-qt/qt4/files/qte.sh
index 21d6ecb..bb8dfae 100644
--- a/meta/recipes-qt/qt4/files/qte.sh
+++ b/meta/recipes-qt/qt4/files/qte.sh
@@ -2,6 +2,6 @@
 
 if [ -e /dev/input/touchscreen0 ]
 then
-    QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+    QWS_MOUSE_PROTO=LinuxInput:/dev/input/touchscreen0
     export QWS_MOUSE_PROTO
 fi
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index bee7345..179de87 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
-DEPENDS += "directfb tslib"
-INC_PR = "r36"
+DEPENDS += "directfb"
+INC_PR = "r37"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
@@ -15,7 +15,7 @@ QT_CONFIG_FLAGS += " \
     -embedded ${QT_ARCH} \
     -qtlibinfix ${QT_LIBINFIX} \
     -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
+    -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
     -qt-kbd-tty \
     -DQT_KEYPAD_NAVIGATION \
     "
-- 
1.7.7



