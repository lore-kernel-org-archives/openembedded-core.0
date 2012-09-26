Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0HP-0005vP-Cx
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:31 +0200
Received: by weyt44 with SMTP id t44so279267wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RGXIVX3TXyIc0EsuL/4mzx9tYMtwcvQUm4RcXeQruHk=;
	b=VyYNaZXFJkQaUAEKcTvXwmCxy+9ou5mMlutLwB3aY9JvKDcvg0fZ3cYz88bcrHxDuE
	9IzbLw9mEcHP7bzvLyiVHEXyyZV59UVduG3bVXLY5Yhl6I7f7ZejG8Sps4/FwADbLEha
	VIZeLBhDzlgvMn5kQKj98GnRSM14Qpi+75LHxNCyM0fzOdWTdsfjjFfbJHep4nlkhFOt
	n6N94+IGCd2ZWZ2tTaKgwj6tkwMNiqKmpyLFgr97XF22n0cWX7ykkYfjHeJCHpS1VJjZ
	Tu8sJQtguuglSlAKtj0BH/LwJZlY+VHGCY83dOA/NE6cnEphgFcxnHdUXb1avGrgbQ8H
	nv7Q==
Received: by 10.180.8.41 with SMTP id o9mr4127033wia.3.1348698460671;
	Wed, 26 Sep 2012 15:27:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm9497984wib.10.2012.09.26.15.27.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:27:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:09 +0200
Message-Id: <920ba43ec9efff798e309fa44473d96d43f22f4b.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/10] qt4.inc: move more options to separate variables
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
X-List-Received-Date: Wed, 26 Sep 2012 22:40:31 -0000

* make it easier to override them in bbappend
* convert pulseaudio to more common -pulseaudio/-no-pulseaudio form

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index ba231ba..35748f8 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -12,12 +12,25 @@ QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -p
 
 QT_GLFLAGS ?= ""
 
+  
+QT_QT3SUPPORT ?= "-qt3support"
+QT_XML ?= "-xmlpatterns"
+QT_WEBKIT ?= "-webkit"
+QT_PHONON ?= "-phonon"
+QT_DBUS ?= "-qdbus"
+QT_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', '-pulseaudio', '-no-pulseaudio', d)}"
+ 
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
                     -system-libjpeg -system-libpng -system-libtiff -system-zlib \
-                    -no-pch -qdbus -stl -glib -phonon -webkit \
-                    -xmlpatterns -no-rpath -qt3support -silent \
-                    ${@base_contains('DISTRO_FEATURES', 'pulseaudio', '--enable-pulseaudio', '--disable-pulseaudio', d)} \
+                    -no-pch -stl -glib \
+                    -no-rpath -silent \
+                    ${QT_DBUS} \
+                    ${QT_QT3SUPPORT} \
+                    ${QT_WEBKIT} \
+                    ${QT_PHONON} \
+                    ${QT_XML} \
+                    ${QT_MULTIMEDIA} \
                     ${QT_SQL_DRIVER_FLAGS} \
                     ${QT_DISTRO_FLAGS} \
                     ${QT_GLFLAGS}"
-- 
1.7.12



