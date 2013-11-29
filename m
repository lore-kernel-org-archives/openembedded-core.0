Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3D61D6AB73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 13:51:11 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hm4so2104799wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 05:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kWrg9w61fzAmPjEbq8c6Hjp44vd4jItJr1LevTIPHJM=;
	b=ANvCGrtpisT46jgPZkGFLZOEZz2n/muCM6k7XHJUZHtujEY/EIUnBNSeKqcnDALBj9
	EURpUO884S/w81MKKPFOBMEgo1pSujXRw5PVSmhFpKoXf3y1JCns/rhR8hLoeUcxnTtc
	G6Y+mZJUIlnNaA1nUU0Nmn/yqNltqfuPx+UVWYX20f9urdg2MncrmsGPOrm8FkD4ziPm
	4J55Mhh+wqVmbRRivLlvFCWnEmzYQROOvj88q6+B6aDFDzgYEDSGMec2RIAJzQhpOmYN
	F8n8/zwVVjkB9WOCCQcN0I5gi/PlxSXaj5CXzzXck344A4afpZ/W4B3YWvtkiuUK3wPk
	UNog==
X-Gm-Message-State: ALoCoQlxcdAbuEhmpkiNvMAhgKSNQI2wqqPREK4yKe1AAJpCjhvZdsgMFSMt9/OPE5HjFxRzQUfg
X-Received: by 10.180.93.8 with SMTP id cq8mr6876649wib.38.1385733069778;
	Fri, 29 Nov 2013 05:51:09 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	uc18sm53091965wib.11.2013.11.29.05.51.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Nov 2013 05:51:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2013 13:51:05 +0000
Message-Id: <1385733065-13722-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] qt4-x11-free: depend on ICU
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
X-List-Received-Date: Fri, 29 Nov 2013 13:51:12 -0000

ICU presence is auto-detected at configure time and until recently (e68850 and
d61230) was pulled into most builds through harfbuzz and beecrypt.  Now it's
floating and this leads to build failures.

As in all likelihood the majority of people were building this with ICU enabled,
add an explicit dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 369b3d5..46869aa 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -3,7 +3,7 @@ require qt4.inc
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
 HOMEPAGE = "http://qt-project.org/"
 SECTION = "x11/libs"
-DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor icu"
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 293eb87..659561c 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -23,7 +23,7 @@ QT_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', '-pulseaudio
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
                     -system-libjpeg -system-libpng -system-libtiff -system-zlib \
-                    -no-pch -stl -glib \
+                    -no-pch -stl -glib -icu \
                     -no-rpath -silent \
                     ${QT_DBUS} \
                     ${QT_QT3SUPPORT} \
-- 
1.7.10.4


