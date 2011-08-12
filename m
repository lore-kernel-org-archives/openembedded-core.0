Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qrot6-0000P5-Rd
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 12:22:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7CAIFNh029188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 03:18:15 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 12 Aug 2011 03:18:15 -0700
Message-ID: <6da4b426f8aa96335542deb671a21f99b8e0f398.1313141568.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1313141568.git.xiaofeng.yan@windriver.com>
References: <cover.1313141568.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 12 Aug 2011 17:19:10 +0800
Date: Fri, 12 Aug 2011 18:18:17 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt3: fix bug 1348
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
X-List-Received-Date: Fri, 12 Aug 2011 10:22:49 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1348]

The variable is different when building qt-x11-free-native and qt-x11-free. The
different cause this bug.
$ bitbake qt-x11-free-native -e | grep ^TARGET_OS
TARGET_OS="linux"
$ bitbake qt-x11-free -e | grep ^TARGET_OS
TARGET_OS="linux-gnueabi"

So I add a task function before do_configure for linking ${TARGET_OS} to linux-g++.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 recipes-qt3/qt3/qt-x11-free-common.inc |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes-qt3/qt3/qt-x11-free-common.inc b/recipes-qt3/qt3/qt-x11-free-common.inc
index e486c52..9e6cc81 100644
--- a/recipes-qt3/qt3/qt-x11-free-common.inc
+++ b/recipes-qt3/qt3/qt-x11-free-common.inc
@@ -3,7 +3,7 @@ SECTION = "x11/libs"
 PRIORITY = "optional"
 LICENSE = "GPL | QPL"
 HOMEPAGE = "http://www.trolltech.com"
-PR = "r0"
+PR = "r1"
 
 S = "${WORKDIR}/qt-x11-free-${PV}"
 
@@ -24,6 +24,12 @@ EXTRA_ENV = 'QMAKE="${STAGING_BINDIR_NATIVE}/qmake -after INCPATH+=${STAGING_INC
              AR="${TARGET_PREFIX}ar cqs" \
              MOC="${STAGING_BINDIR_NATIVE}/moc3" UIC="${STAGING_BINDIR_NATIVE}/uic3" MAKE="make -e"'
 
+do_configure_prepend() {
+    if [ ! -L ${QMAKE_MKSPEC_PATH}/${TARGET_OS}-oe-g++ ]; then
+        ln -sf ${QMAKE_MKSPEC_PATH}/linux-g++ ${QMAKE_MKSPEC_PATH}/${TARGET_OS}-oe-g++
+    fi
+}
+
 do_configure() {
 	echo "yes" | ./configure -prefix ${prefix} ${QT_CONFIG_FLAGS} -no-fast \
 		-L${STAGING_LIBDIR} -I${STAGING_INCDIR} -I${STAGING_INCDIR}/freetype2 -I${STAGING_INCDIR}/mysql
-- 
1.7.0.4



