Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E18AE75618
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 16:58:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 27 May 2015 09:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,506,1427785200"; d="scan'208";a="732588480"
Received: from kanavin-desktop.fi.intel.com ([10.237.72.87])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2015 09:58:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 12:58:15 +0300
Message-Id: <1432720695-28058-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qt4: unconditionally disable gstreamer 0.10 support in qt webkit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 May 2015 16:58:35 -0000

Previously it was auto-detected in a broken way, which was causing build errors
for qt-mobility. Qt4 build will fail if some gstreamer 0.10 packages are
available at build time, but not all. It will not fail if none of
the packages are available or if all of them are available. We can't guarantee either,
hence this patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 6d67994..2175fc0 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -25,6 +25,7 @@ QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -system-libjpeg -system-libpng -system-libtiff -system-zlib \
                     -no-pch -stl -glib -icu \
                     -no-rpath -silent \
+		    -D USE_QTMULTIMEDIA=1 \
                     ${QT_DBUS} \
                     ${QT_QT3SUPPORT} \
                     ${QT_WEBKIT} \
-- 
2.1.4


