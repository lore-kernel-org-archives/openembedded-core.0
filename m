Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6343C783CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279508"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:28:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:27 +0300
Message-Id: <bf80bdf5824ffcd1130e0f7d45a627e890bb5df9.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/32] packagegroup-core-lsb: do not include Qt4 anymore
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
X-List-Received-Date: Fri, 16 Jun 2017 12:28:52 -0000

Last version of qt4 was released 2 years ago, and Qt4 was
officially EOLd at the end of 2015. On the other hand, LSB is no longer
being developed, and so will 'require' Qt4 until the end of time.

Let's pull the plug.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         | 26 ----------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 224ff19819c..61b35e68921 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -202,31 +202,6 @@ RDEPENDS_packagegroup-core-lsb-python = "\
     python-misc \
 "
 
-QT4PKGS = " \
-    libqtcore4 \
-    libqtgui4 \
-    libqtsql4 \
-    libqtsvg4 \
-    libqtxml4 \
-    libqtnetwork4 \
-    qt4-plugin-sqldriver-sqlite \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
-    "
-QT4PKGS_mips64 = ""
-QT4PKGS_mips64n32 = ""
-
-def get_libqt4(d):
-    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) or "":
-        if 'qt4' in d.getVar('BBFILE_COLLECTIONS', False) or "":
-            return d.getVar('QT4PKGS', False)
-
-        bb.warn('The meta-qt4 layer should be added, this layer provides Qt 4.x ' \
-                'libraries. Its intended use is for passing LSB tests as Qt4 is ' \
-                'a requirement for LSB.')
-    return ''
-# We don't want this to rebuild every time you change your layer config
-get_libqt4[vardepsexclude] += "BBFILE_COLLECTIONS"
-
 SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
 DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
     specified in the LSB Desktop specification"
@@ -247,7 +222,6 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     gtk+ \
     atk \
     libasound \
-    ${@get_libqt4(d)} \
 "
 
 RDEPENDS_packagegroup-core-lsb-runtime-add = "\
-- 
2.11.0


