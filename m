Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SwXcx-00046A-2r
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:02:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71BoVqw021114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2012 04:50:31 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 04:50:30 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 19:50:02 +0800
Message-ID: <f0327f027aad26e2b31f4eca789e20b24881b50f.1343821674.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343821674.git.wenzong.fan@windriver.com>
References: <cover.1343821674.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, wfan@windriver.com
Subject: [PATCH 1/1] qt4: fix qt4-native build failure on SLED-11
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
X-List-Received-Date: Wed, 01 Aug 2012 12:02:11 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This issue is that with C++ compiler process an old version of kernel
header file, coincidently that file has a variable named 'new':

* 'embedded/qkbdtty_qws.cpp' include 'linux/vt.h';
* '/usr/include/linux/vt.h' has below code on SLED-11.x:
    + unsigned int new;

On mostly hosts it has been changed to: new -> newev.

[YOCTO #2845]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch |   26 +++++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-native.inc              |    6 ++++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch

diff --git a/meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch b/meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch
new file mode 100644
index 0000000..d8f647f
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+=======================================
+diff --git a/src/gui/embedded/qkbdtty_qws.cpp b/src/gui/embedded/qkbdtty_qws.cpp
+--- a/src/gui/embedded/qkbdtty_qws.cpp	2012-07-27 13:16:58.420198350 +0800
++++ b/src/gui/embedded/qkbdtty_qws.cpp	2012-07-27 13:24:43.924191127 +0800
+@@ -54,8 +54,20 @@
+ 
+ #if defined Q_OS_LINUX
+ #  include <linux/kd.h>
++
++/* Workaround kernel headers using "new" as variable name. The problem
++ is specific to SLED-11, other distros use "newev" rather than "new" */
++#ifdef __cplusplus
++#warning "workaround kernel headers using new as variable name on SLED 11"
++#define new newev
++#endif
++
+ #  include <linux/vt.h> //TODO: move vt handling somewhere else (QLinuxFbScreen?)
+ 
++#ifdef __cplusplus
++#undef new
++#endif
++
+ #  include "qscreen_qws.h"
+ #  include "qwindowsystem_qws.h"
+ #  include "qapplication.h"
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 70adec4..90ea63c 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r14"
+INC_PR = "r15"
 
 inherit native
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://qt-config.patch \
            file://g++.conf \
-           file://linux.conf"
+           file://linux.conf \
+           file://fix_qkbdtty_qws.patch \
+	"
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 EXTRA_OECONF = "-prefix ${prefix} \
-- 
1.7.9.5



