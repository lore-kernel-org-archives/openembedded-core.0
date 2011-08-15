Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QswJH-00072s-LT
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:30:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 05:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; d="scan'208";a="39630455"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2011 05:25:51 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2011 20:33:55 +0800
Message-Id: <f49ee37a4a630a5dbbc1dea6881032b2b5267ef0.1313411289.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313411289.git.ke.yu@intel.com>
References: <cover.1313411289.git.ke.yu@intel.com>
In-Reply-To: <cover.1313411289.git.ke.yu@intel.com>
References: <cover.1313411289.git.ke.yu@intel.com>
Subject: [PATCH 2/2] qt4.inc: expand the package name for multilib case, fix bug 1344
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
X-List-Received-Date: Mon, 15 Aug 2011 12:30:27 -0000

in the qt4.inc python annomyous code, there is case where package name
is set to "${QT_BASE_LIB}-tool", and  FILE_${QT_BASE_LIB}-tool is set to xxx.
here QT_BASE_NAME=qt4. multilib.bbclass will try to rename the FILE_qt4_tool to
FILE_lib64_qt4_tool. unfortunately, there is only FILE_${QT_BASE}-tool, no
FILE_qt4-tool, so FILE_lib64_qt4_tool will not be defined.

to fix this issue, this patch expand the QT_BASE_LIB when assigning the package
name.

FIX [YOCTO #1344]

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-qt/qt4/qt4.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 4d26c64..1f4e012 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -40,7 +40,7 @@ python __anonymous () {
     dev_packages = []
     dbg_packages = []
     for name in bb.data.getVar("QT_LIB_NAMES", d, 1).split():
-        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "").replace("_", "-") + "4"
+        pkg = bb.data.getVar("QT_BASE_LIB",d, True) + name.lower().replace("qt", "").replace("_", "-") + "4"
         # NOTE: the headers for QtAssistantClient are different
         incname = name.replace("QtAssistantClient", "QtAssistant")
         bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
@@ -59,7 +59,7 @@ python __anonymous () {
         dbg_packages.append("%s-dbg" % name)
 
     for name in bb.data.getVar("QT_EXTRA_LIBS", d, 1).split():
-        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "").replace("_", "-") + "4"
+        pkg = bb.data.getVar("QT_BASE_LIB",d, True) + name.lower().replace("qt", "").replace("_", "-") + "4"
         bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals(), d)
         bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
                   ${libdir}/lib%(name)s.a
-- 
1.7.0.4



