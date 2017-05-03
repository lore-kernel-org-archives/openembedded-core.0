Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0BB71B29
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 13:11:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 06:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,284,1491289200"; d="scan'208";a="81964835"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2017 06:12:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 16:11:50 +0300
Message-Id: <20170503131153.1780-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/5] packagegroup-core-lsb: do not include Qt4 anymore
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
X-List-Received-Date: Wed, 03 May 2017 13:12:00 -0000

Last version of qt4 was released 2 years ago, and Qt4 was
officially EOLd at the end of 2015. On the other hand, LSB is no longer
being developed, and so will 'require' Qt4 until the end of time.

Let's pull the plug.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../conf/distro/include/poky-world-exclude.inc     |  4 ----
 .../packagegroups/packagegroup-core-lsb.bb         | 26 ----------------------
 2 files changed, 30 deletions(-)

diff --git a/meta-poky/conf/distro/include/poky-world-exclude.inc b/meta-poky/conf/distro/include/poky-world-exclude.inc
index a6635b63aa4..1a2dea5859b 100644
--- a/meta-poky/conf/distro/include/poky-world-exclude.inc
+++ b/meta-poky/conf/distro/include/poky-world-exclude.inc
@@ -2,7 +2,3 @@
 # Things we exlude fromw world testing within the reference distro
 #
 
-# qwt from meta-qt4, has poky-lsb QA warnings, qt4 for lsb only
-EXCLUDE_FROM_WORLD_pn-qwt = "1"
-# python-pyqt from meta-qt4 requires sip from meta-oe
-EXCLUDE_FROM_WORLD_pn-python-pyqt = "1"
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


