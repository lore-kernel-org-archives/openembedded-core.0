Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA356D756
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 11:18:36 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rB4BIO1c026745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 4 Dec 2013 12:18:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1386155909;
	bh=H0lBrXN8sbJzzmPIyXC9d5nsNTRimrGZMJWt3VXEzOU=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=a4ViG46mKd9VDIjwIbXfEqT+dxywyXhxc0+MnDwdrroPOs69uoESsEIN23K7EndIh
	I4sNclmvcxFvulkx2/i0FHBd6SRp0lyH1lsAA3XtkKGU0wVdDoHv0zzJzzGazV4hqX
	ScPjAcMQlxzti6Hq8XJvxXDDsx483i59ZhHdtQns=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rB4BIG9Z029805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Dec 2013 12:18:17 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VoATA-0003RM-7t; Wed, 04 Dec 2013 12:18:16 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 12:18:13 +0100
Message-Id: <1386155893-13145-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.3.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -3.9
X-Spam-Level: ---
X-Spam-Tests: AWL,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] qt4: fixed dependency on icu
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
X-List-Received-Date: Wed, 04 Dec 2013 11:18:38 -0000

Commit 46dcec6fd455584d9b5d0d7ff1e5b36fbe5a2d62 added 'icu' to DEPENDS
in qt4-x11 only, but enabled icu globally in qt4.inc.

This breaks build of qt4-embedded because this recipe does not have
such a DEPENDS but uses qt4.inc:

| icu.cpp:42:28: fatal error: unicode/utypes.h: No such file or directory
|  #include <unicode/utypes.h>
|                             ^
| compilation terminated.
| make: *** [icu.o] Error 1


Patch moves the 'icu' dependency into qt4.inc.


Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc | 2 +-
 meta/recipes-qt/qt4/qt4.inc          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 46869aa..369b3d5 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -3,7 +3,7 @@ require qt4.inc
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
 HOMEPAGE = "http://qt-project.org/"
 SECTION = "x11/libs"
-DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor icu"
+DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 659561c..9a10138 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -1,6 +1,6 @@
 inherit qmake_base
 
-DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff"
+DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff icu"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 
 require qt4_arch.inc
-- 
1.8.3.1


