Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SE2LN-0001Tw-7W
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 19:44:05 +0200
Received: by dadz8 with SMTP id z8so703664dad.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BSJl52VeyomxwxNzc6M60wNaTTFsqYqilmSLZltw6+g=;
	b=GYBdVXJr7GkOjhPQMERIu6QIPTypM9tZawT9Zp+8icjZJ4WpSERfTc7dJydt5O3pZH
	CzshQzsdWwqbUN8FGceXsT6vCj9Zz3C3hXIFUAVoe1aoBC0j5f7W5B1M9M/a1aT2QA/f
	Yj8ZJcoXct96XMOYHK8pI8jE+vqifZ8rkxFSuKREeriOrJuhRz6UxpX8ZlKvzmdvHYt2
	4jtWNzCiNtVW65GfvVigA8zw4g2bP30K/UEDbZaw3izPmihFcqGm5JEtzE5rEiyIev7o
	XAjPYh8aQmocQdQs9vZS43DldT9luY7Qj1+5JFEHrzt4LJPZk/plZvMjOMWvnXv5FSLC
	P1Xw==
Received: by 10.68.201.169 with SMTP id kb9mr7098780pbc.146.1333215298404;
	Sat, 31 Mar 2012 10:34:58 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id o2sm10061456pbq.61.2012.03.31.10.34.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Mar 2012 10:34:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 10:34:48 -0700
Message-Id: <1333215288-21539-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] qt-mobility: Fix build with gcc 4.7
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
X-List-Received-Date: Sat, 31 Mar 2012 17:44:05 -0000

C getpid needs unistd.h for getting
its signature

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-qt/qt4/files/gcc-scope.patch |   48 +++++++++++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/gcc-scope.patch

diff --git a/meta/recipes-qt/qt4/files/gcc-scope.patch b/meta/recipes-qt/qt4/files/gcc-scope.patch
new file mode 100644
index 0000000..f01ee9f
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/gcc-scope.patch
@@ -0,0 +1,48 @@
+
+Fixes issues like below
+
+| qaudiooutput_pulse.cpp: In member function 'bool QPulseAudioOutput::open()':
+| qaudiooutput_pulse.cpp:255:75: error: '::getpid' has not been declared
+| make[3]: *** [../../../build/Debug/qtmedia_pulse/qaudiooutput_pulse.o] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: qt-mobility-opensource-src-1.2.0/plugins/multimedia/pulseaudio/qaudiooutput_pulse.cpp
+===================================================================
+--- qt-mobility-opensource-src-1.2.0.orig/plugins/multimedia/pulseaudio/qaudiooutput_pulse.cpp	2012-03-31 07:26:24.457018348 -0700
++++ qt-mobility-opensource-src-1.2.0/plugins/multimedia/pulseaudio/qaudiooutput_pulse.cpp	2012-03-31 07:27:53.309022654 -0700
+@@ -46,7 +46,7 @@
+ #include "qaudiodeviceinfo_pulse.h"
+ #include "qpulseaudioengine.h"
+ #include "qpulsehelpers.h"
+-
++#include <unistd.h>
+ QT_BEGIN_NAMESPACE
+ 
+ const int PeriodTimeMs = 20;
+Index: qt-mobility-opensource-src-1.2.0/plugins/multimedia/pulseaudio/qaudioinput_pulse.cpp
+===================================================================
+--- qt-mobility-opensource-src-1.2.0.orig/plugins/multimedia/pulseaudio/qaudioinput_pulse.cpp	2012-03-31 07:29:19.997026831 -0700
++++ qt-mobility-opensource-src-1.2.0/plugins/multimedia/pulseaudio/qaudioinput_pulse.cpp	2012-03-31 07:29:39.541027625 -0700
+@@ -46,6 +46,7 @@
+ #include "qaudiodeviceinfo_pulse.h"
+ #include "qpulseaudioengine.h"
+ #include "qpulsehelpers.h"
++#include <unistd.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+Index: qt-mobility-opensource-src-1.2.0/plugins/multimedia/pulseaudio/qpulseaudioengine.cpp
+===================================================================
+--- qt-mobility-opensource-src-1.2.0.orig/plugins/multimedia/pulseaudio/qpulseaudioengine.cpp	2012-03-31 07:33:24.805038719 -0700
++++ qt-mobility-opensource-src-1.2.0/plugins/multimedia/pulseaudio/qpulseaudioengine.cpp	2012-03-31 07:33:46.889039783 -0700
+@@ -46,6 +46,7 @@
+ #include "qaudiodeviceinfo_pulse.h"
+ #include "qaudiooutput_pulse.h"
+ #include "qpulsehelpers.h"
++#include <unistd.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 3e50b2d..e612adb 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -9,12 +9,14 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
            file://qt-mobility-configure.patch \
            file://0001-gstvideoconnector-fixed-buffers-allocation.patch \
            file://0002-Remove-unnecessary-rpaths-from-qml_device-example.patch \
-           file://qt-mobility-no-opengl.patch"
+           file://qt-mobility-no-opengl.patch \
+	   file://gcc-scope.patch \
+	   "
 
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
 
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
 
-- 
1.7.5.4



