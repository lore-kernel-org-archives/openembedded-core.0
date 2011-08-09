Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qqi5W-000792-Ea
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 10:55:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p798oWTP003717
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 01:50:32 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 9 Aug 2011 01:50:32 -0700
Message-ID: <b58224cc88baa6cfea83da19e0315d1f4307df5b.1312878559.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1312878559.git.xiaofeng.yan@windriver.com>
References: <cover.1312878559.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 9 Aug 2011 16:05:00 +0800
Date: Tue, 9 Aug 2011 16:50:34 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt3: Solve the failure to compile qt3 on platform arm
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
X-List-Received-Date: Tue, 09 Aug 2011 08:55:03 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1348]
The variable "TARGET_OS" has different value when building qt-x11-free-native and \
qt-x11-free.
The different cause failure to compile qt3.
$ bitbake qt-x11-free-native -e | grep ^TARGET_OS
TARGET_OS="linux"
$ bitbake qt-x11-free -e | grep ^TARGET_OS
TARGET_OS="linux-gnueabi"

Use "TARGETOS = linux${LIBCEXTENSION}${ABIEXTENSION}" in place of TARGET_OS \
for solving this bug.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
index e64256f..fe04a4a 100644
--- a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
+++ b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
@@ -4,10 +4,11 @@ PRIORITY = "optional"
 LICENSE = "GPL | QPL"
 DEPENDS = "xmu-native"
 HOMEPAGE = "http://www.trolltech.com"
-PR = "r0"
+PR = "r1"
 
 PROVIDES += "qt-x11-free-native"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qt-x11-free"
+TARGETOS = linux${LIBCEXTENSION}${ABIEXTENSION}
 
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=629178675a7d49c9fa19dfe9f43ea256 \
                     file://LICENSE.QPL;md5=fff372435cb41647bc0b3cb940ea5c51"
@@ -26,7 +27,7 @@ export QTDIR = "${S}"
 export SYSCONF_CXX = "${CCACHE} g++"
 export SYSCONF_CC  = "${CCACHE} gcc"
 export SYSCONF_LINK  = "${CCACHE} g++"
-THIS_QMAKESPEC = "${STAGING_DATADIR}/qmake/${TARGET_OS}-oe-g++"
+THIS_QMAKESPEC = "${STAGING_DATADIR}/qmake/${TARGETOS}-oe-g++"
 export QMAKESPEC = ""
 ARCH_i686 = "x86"
 
@@ -57,7 +58,7 @@ do_install() {
  
     install -d ${D}${datadir}/qt3/
     cp -PfR mkspecs ${D}${datadir}/qt3/
-    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${TARGET_OS}-oe-g++
+    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${TARGETOS}-oe-g++
     ln -s ${D}${datadir}/qt3/mkspecs/ ${D}${datadir}/qmake
     install -d ${D}${libdir}/
     oe_soinstall lib/libqt-mt.so.${PV} ${D}${libdir}/
-- 
1.7.0.4



