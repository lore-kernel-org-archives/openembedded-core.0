Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UIO2H-0003EW-CJ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 19:46:53 +0100
Received: by mail-ob0-f171.google.com with SMTP id x4so1974042obh.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 11:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=dbFM1q6ahM+pmJRNn8uhXipAuaDCxC05icaVZ3dic/Y=;
	b=Aw1viOQNWF0pNiuVlZCZiSD31p1nlRf9QUFxgPBrl9deWG0QKksV+rotoif54MSjoF
	2AiWTMQuafv4PC7rOkKmsddvinuAWvFwWUxNXzg2KyEKQ9Q9Ol/d8D6K2F1dva7oYOQo
	+C2dEGfv+uph54MKvH/aDLNUFPINFEvgYVI0p3rxt2Gy2IZBgqoq3lIe9fnNGzD5m+bi
	gXYAVcPpPyEtrX0Yx/wSp2w+si6PVUrle2fwNNZMQCg5pCBQsDnF7y4NUx+hRHhhBreB
	2Z3eEyl4Zx35zcaxzYIz9lib9ztdREPqy26Rh5gkh7YjpZDcjQBJcwlcUy8REM35PuW/
	LG5A==
X-Received: by 10.182.49.102 with SMTP id t6mr4761026obn.75.1363804201295;
	Wed, 20 Mar 2013 11:30:01 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id x5sm3254069oeb.6.2013.03.20.11.29.59
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 11:30:00 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 11:29:49 -0700
Message-Id: <1363804189-27603-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlmqDaK2HDbfW50H4gMJdx9OQx7TE+3CZRdgw3ME15NVvCH/n74+8TdSoy07lANeTdPV0v/
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v4] qt-mobility: added list of modules to be compiled
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
X-List-Received-Date: Wed, 20 Mar 2013 18:46:53 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This is useful for users that want to .bbappend this recipe to select specific
modules to be compiled.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index fca4cb0..1db1438 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -18,7 +18,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
 
-PR = "r7"
+PR = "r8"
 
 S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
 
@@ -31,6 +31,8 @@ qtm_plugins	:= "/usr/lib/${qtm_dir}/plugins/QtMobility"
 qtm_data	:= "/usr/share/${qtm_dir}"
 qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
 
+QTM_MODULES_LIST ?= "bearer contacts gallery location publishsubscribe messaging multimedia \
+systeminfo serviceframework sensors versit organizer feedback connectivity"
 qtm_bluezflag ?= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'yes', 'no', d)}"
 
 do_configure_prepend() {
@@ -44,7 +46,7 @@ do_configure_prepend() {
 	cp staticconfig.pri staticconfig.pri.old
 	echo "include(${STAGING_DATADIR}/${qtm_dir}/mkspecs/qconfig.pri)" >staticconfig.pri
 	cat staticconfig.pri.old >>staticconfig.pri
-	./configure -qmake-exec qmake2 -prefix /usr -examples -demos
+	./configure -qmake-exec qmake2 -prefix /usr -examples -demos -modules "${QTM_MODULES_LIST}"
 	echo QT_MOBILITY_BIN = ${qtm_bin} >>./config.pri
 	echo QT_MOBILITY_LIB = ${qtm_lib} >>./config.pri
 	echo QT_MOBILITY_INCLUDE = ${qtm_include} >>./config.pri
-- 
1.7.9.5



