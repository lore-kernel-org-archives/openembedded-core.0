Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SSUP4-0005dh-L7
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 16:31:38 +0200
Received: by pbbrq2 with SMTP id rq2so1776446pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 07:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=M4r2VjXQEMIUnPbDmYIPG7nX79plal9HaLtTJpeTFww=;
	b=J/RI/nS5FNY5L11Mzu/baiRsy0kyR+6GsuyIpSyyr18Qzb0Z0kwX/IuL38QhauQxQ1
	1hHTjW7N4MQnsql0PwyMKbJPVVF02IC0uF0PIUAu//6d72mqAYS2R0YMCUz3ptqqS3bY
	iqQdsYY+sucAenmWMDriSOvNiK2CIa2uNcR0EWVCVe+YGY34JhteQthvTqmhmOKREt9z
	Bw2S8ZywKJGlzVm7Mc84iEGkR37Ttf51tX3HyxPkCfcIGiLT73V7WiKRE5cqM1deiigt
	XvH39g+mTq8FOxg5G207bzyFQMXTWuAtDNBnv7vMmBa+lUoXVhYJhfF5o3YW/kpI84ix
	pUMw==
Received: by 10.68.227.33 with SMTP id rx1mr20500909pbc.102.1336659703412;
	Thu, 10 May 2012 07:21:43 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id oi3sm4387816pbb.0.2012.05.10.07.21.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 07:21:42 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2012 17:21:30 +0300
Message-Id: <1336659690-27308-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmrrGI3lTzfYccYE3pBTev4UwHxEN7tjTVY36fpmuaSgij84ICA5hrhIfGoxnxhzaRfvqfx
Subject: [PATCH] fotowall: Add #include ui_wizard.h to ExportWizard.cpp
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
X-List-Received-Date: Thu, 10 May 2012 14:31:38 -0000

App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
should be already generated before compiling ExportWizard.cpp.

[YOCTO #2297]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../ExportWizard-depends-on-ui_wizard.patch        |   12 ++++++++++++
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 ++++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch

diff --git a/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
new file mode 100644
index 0000000..3ad5774
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
@@ -0,0 +1,12 @@
+Index: Fotowall-0.9/App/ExportWizard.cpp
+===================================================================
+--- Fotowall-0.9.orig/App/ExportWizard.cpp	2009-11-30 13:21:31.000000000 +0200
++++ Fotowall-0.9/App/ExportWizard.cpp	2012-05-10 17:12:06.765230830 +0300
+@@ -23,6 +23,7 @@
+ #include "imageloaderqt.h"
+ #include "posterazorcore.h"
+ #include "wizard.h"
++#include "ui_wizard.h"
+ 
+ #include <QDesktopServices>
+ #include <QDesktopWidget>
diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
index 52dd727..3cb79a3 100644
--- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
+++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
@@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://GPL_V2;md5=79808397c3355f163c012616125c9e26 \
                     file://main.cpp;beginline=6;endline=11;md5=b569acc2bf8974a3082b58fc53b9d8dc"
 SECTION = "x11/apps"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "qt4-x11-free"
 RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
 
-SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2"
+SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
+           file://ExportWizard-depends-on-ui_wizard.patch \
+           "
 
 SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
 SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"
-- 
1.7.9.5



