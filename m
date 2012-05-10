Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SSaih-0002Wa-9A
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:16:19 +0200
Received: by wibhm14 with SMTP id hm14so618297wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=RLeFwfp8bfzaWuLUPQFmomIScqLutTL+bCrP2juHkN0=;
	b=lL0Fr5CXYbBLZiyYc52yw/o8bQCMUhwgKQGF6fl1ZVzbMkZuvNOSqrkKKQzEwWsU4a
	FdNccGU7mWm+mjWysULgmGUH5V4MDSsFgKliG8gbFd9UnLjI1FnCms8VtGtpKqqWNpA3
	jN9vIc4NRE7yOKMBWjaowbIitup3sYjH/9fPTUeWHfmCpkjJq4/jLrnwsysc0p4OJ9Hp
	m9rIOkU1WGxOmsGBjcgxwaUknEyKEnSBHb/nBNGQg7pGxIqowdzyFHLktNy07Dpb+gjy
	tqVEJwSlk4b3zg8RLTJPPr5YhjXGgduiEO6162fBEZ8HpHBrLdYSf9vgIWKQjxwDV+r7
	keyg==
Received: by 10.180.109.229 with SMTP id hv5mr2508597wib.0.1336683984884;
	Thu, 10 May 2012 14:06:24 -0700 (PDT)
Received: from localhost.localdomain ([79.117.103.30])
	by mx.google.com with ESMTPS id ex2sm9149013wib.8.2012.05.10.14.06.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 14:06:24 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 00:06:16 +0300
Message-Id: <1336683976-11846-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlAkwsS8x691eAkAcReBtaDznc/vE+FjefYEDHZmHRhLtvBtMPwvkmYq60xn7y5jCl2s8kw
Subject: [PATCH V3] fotowall: Add #include ui_wizard.h to ExportWizard.cpp
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
X-List-Received-Date: Thu, 10 May 2012 21:16:19 -0000

App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
should be already generated before compiling ExportWizard.cpp.

[YOCTO #2297]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../ExportWizard-depends-on-ui_wizard.patch        |   18 ++++++++++++++++++
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch

diff --git a/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
new file mode 100644
index 0000000..d8b2b23
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
@@ -0,0 +1,18 @@
+App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
+should be already generated before compiling ExportWizard.cpp.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
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



