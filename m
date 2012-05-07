Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SRMEL-0008Ma-T4
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 13:35:53 +0200
Received: by bkcjm2 with SMTP id jm2so3912192bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 04:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=jOhu6k53tNO8Cq8d4V7mjfFlgcmbcFeUuJHVTOQodKg=;
	b=DTZnwAucJ18lcDm+emUQJqsgtJtp4FdjE42WTMYKJceawzFhPoizTMNt9qXPYxpNtP
	h1Ld+endSN/axcSyjBzXRjkKBkhA6ViGkr2MX2xBj0MOCRbH9bqsoE09jb0n+sO2z0Sp
	8Ep1KLXMG0pMYO2KsDGuI6SiJyHIElXse9V/Lq9oQiT5f3XT547AriVU8Qcmzbgj3NFa
	pUFL6XvtXYcrJiOv70OwXZ0k9ItxU4wL9UDzo/RruB+jWpzJGsn2C5J5BXjncMCF6Sx4
	cpOwJikktexXrbmMeuPaVe8N+piUxPaAnE/uTKMfL7QYR+2XyqXw0b7QYa7uYN/SUSJe
	DqXg==
Received: by 10.204.150.2 with SMTP id w2mr5576735bkv.101.1336389963321;
	Mon, 07 May 2012 04:26:03 -0700 (PDT)
Received: from otp-agherzan-l1.wrs.com ([79.115.103.32])
	by mx.google.com with ESMTPS id h18sm31762473bkw.3.2012.05.07.04.26.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 04:26:02 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 14:25:53 +0300
Message-Id: <1336389953-19123-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm4e3aq8mGPFY0HzqOx46WjEs+p4yft0S7sQre3Wmq9vyqVQmoMPJP6iEYVBRYEcK9Gd2GE
Subject: [PATCH] fotowall: Add patch which adds ui_wizard.h as a make dependency to ExportWizard.o
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
X-List-Received-Date: Mon, 07 May 2012 11:35:54 -0000

App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
should be already generated before compiling ExportWizard.cpp.

[YOCTO #2297]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 ++++--
 .../ExportWizard-depends-on-ui_wizard.patch        |   20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch

diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
index 52dd727..04580ff 100644
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
+	   file://ExportWizard-depends-on-ui_wizard.patch \
+	   "
 
 SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
 SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"
diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
new file mode 100644
index 0000000..4101e28
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
@@ -0,0 +1,20 @@
+App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
+should be already generated before compiling ExportWizard.cpp.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: Fotowall-0.9/Makefile
+===================================================================
+--- Fotowall-0.9.orig/Makefile	2012-05-06 16:54:26.991254818 +0300
++++ Fotowall-0.9/Makefile	2012-05-06 16:52:57.000000000 +0300
+@@ -1074,7 +1074,8 @@
+ 		Canvas/CanvasModeInfo.h \
+ 		App/App.h \
+ 		App/Settings.h \
+-		.build/ui_ExportWizard.h
++		.build/ui_ExportWizard.h \
++		.build/ui_wizard.h
+ 	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o .build/ExportWizard.o App/ExportWizard.cpp
+ 
+ .build/FotowallFile.o: App/FotowallFile.cpp App/FotowallFile.h \
-- 
1.7.9.5



