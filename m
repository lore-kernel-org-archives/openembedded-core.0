Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROmhM-0000N8-7K
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:42:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 00:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89010330"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 00:36:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:36:27 -0800
Message-Id: <815560c0ee5a1a984b7d0fc8417c46606854e7fe.1321000451.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 1/9] qt-mobility: qa_configure stage failed
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
X-List-Received-Date: Fri, 11 Nov 2011 08:42:56 -0000

From: Dmitry Cherukhin <dima_ch@emcraft.com>

The catalogue /usr/lib removed from Makefiles used for building configure tests.

Signed-off-by: Dmitry Cherukhin <dima_ch@emcraft.com>
---
 .../qt4/files/qt-mobility-configure.patch          |   17 +++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 ++-
 2 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/qt-mobility-configure.patch

diff --git a/meta/recipes-qt/qt4/files/qt-mobility-configure.patch b/meta/recipes-qt/qt4/files/qt-mobility-configure.patch
new file mode 100644
index 0000000..d61ec03
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/qt-mobility-configure.patch
@@ -0,0 +1,17 @@
+When building qt-mobility, the qa_configure stage failed because the catalogue /usr/lib
+is used in some Makefiles within configure tests. We manually removed this catalogue.
+
+Upstream-Status: Inappropriate [embedded]
+Signed-off-by: Dmitry Cherukhin <dima_ch@emcraft.com>
+
+--- qt-mobility-opensource-src-1.2.0/configure.orig	2011-05-10 10:06:01.000000000 +0200
++++ qt-mobility-opensource-src-1.2.0/configure	2011-11-08 12:34:56.347645968 +0100
+@@ -583,6 +583,8 @@
+     fi
+ 
+     $QMAKE_EXEC $QMKSPEC "$relpath/config.tests/$2/$2.pro" 2>> "$CONFIG_LOG" >> "$CONFIG_LOG"
++    cp Makefile Makefile.old
++    sed -e 's@-L/usr/lib@@' <Makefile.old >Makefile
+     printf  " ."
+     "$MAKE" clean >> "$CONFIG_LOG"
+     printf "."
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index f665e64..11aad8b 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -5,7 +5,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz "
+SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
+	   file://qt-mobility-configure.patch "
 
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
-- 
1.7.6.4



