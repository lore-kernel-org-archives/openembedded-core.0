Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkdP-00020t-Od
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 22:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; 
   d="scan'208";a="1133396"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 22:06:46 -0700
Message-Id: <af22757737f3b5e2d58eba8c5e01176ac26592c5.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Thu, 12 May 2011 20:11:37 +0200
Date: Thu, 12 May 2011 22:06:46 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 8/8] qt4-tools-nativesdk: -arch is required for nativesdk build
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
X-List-Received-Date: Fri, 13 May 2011 05:09:56 -0000

From: Ilya Yanok <yanok@emcraft.com>

We need to pass correct -arch option to configure to fix building in
case of SDK_ARCH != BUILD_ARCH.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index f273c9f..5faf40c 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -25,6 +25,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
+require qt4_arch.inc
+
 # FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
 EXTRA_OECONF = "-prefix ${prefix} \
                 -qt-libjpeg -qt-gif -system-zlib \
@@ -37,6 +39,7 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -verbose -release -fast -static \
                 -platform ${TARGET_OS}-oe-g++ \
                 -xplatform ${TARGET_OS}-oe-g++ \
+                -arch ${@qt_arch(d)} \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -qt3support \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include \
-- 
1.7.1.1



