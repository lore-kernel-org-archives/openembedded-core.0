Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qe1KB-00033d-RY
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 10:49:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p658jsCN014956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 01:45:54 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 5 Jul 2011 01:45:54 -0700
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2011 16:40:46 +0800
Message-ID: <033bcedc144922a1187ed4e9b6e8f480390f817f.1309785892.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1309785892.git.xiaofeng.yan@windriver.com>
References: <cover.1309785892.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.28]
Subject: [PATCH 1/1] libQtOpenGL:Add libQtOpenGL to an lsb image
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
X-List-Received-Date: Tue, 05 Jul 2011 08:49:46 -0000
Content-Type: text/plain

I make "opengl" as a DISTO_FEATURE for installing libQtOpenGL to image.
Fix Bug [YOCTO #1020]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |   18 +-----------------
 meta/recipes-qt/qt4/qt4-x11-free.inc         |    2 +-
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 2ec63cc..672b487 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -173,23 +173,7 @@ RDEPENDS_task-core-lsb-graphic-add = "\
     gtk+ \
     atk \
     libasound \
-"
-
-RDEPENDS_task-core-lsb-graphic-add_qemux86 = "\
-    libqtopengl4 \
-"
-RDEPENDS_task-core-lsb-graphic-add_atom-pc = "\
-    libqtopengl4 \
-"
-RDEPENDS_task-core-lsb-graphic-add_qemuppc = "\
-    libqtopengl4 \
-"
-RDEPENDS_task-core-lsb-graphic-add_emenlow = "\
-    libqtopengl4 \
-"
-
-RDEPENDS_task-core-lsb-graphic-add_mpc8315e-rdb = "\
-    libqtopengl4 \
+    ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
 "
 
 #    mesa-dri 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 87145a3..aed2ef5 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -7,7 +7,7 @@ DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender li
 
 INC_PR = "r23"
 
-QT_GLFLAGS ?= "-no-opengl"
+QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
 QT_GLFLAGS_qemuppc = "-opengl"
 QT_CONFIG_FLAGS += "-no-xinerama -no-xkb ${QT_GLFLAGS}"
-- 
1.7.0.4



