Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEU-0005O8-7M
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550400"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:29:51 -0700
Message-Id: <9b8518e100fc826c9695024b06e6221e6d5a2ee3.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Mon, 25 Apr 2011 12:48:47 -0700
Date: Wed, 27 Apr 2011  0:29:51 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 30/52] cdrtools: recipe and patch cleanup
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:23 -0000

From: Scott Garman <scott.a.garman@intel.com>

* Recipe cleanup, added missing metadata fields and fixed
  whitespace issues
* Added Upstream-Status to patches
* Confirmed that CVE-2003-0655 does not apply to this recipe
  as rscsi is not packaged

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../cdrtools-native/glibc-conflict-rename.patch    |    8 +++++++
 .../cdrtools/cdrtools-native/no_usr_src.patch      |    7 ++++++
 .../cdrtools/cdrtools-native_2.01.bb               |   22 +++++++++++--------
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch b/meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
index 0b9b892..2fd5696 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
@@ -1,3 +1,11 @@
+This patch fixes collisions between locally defined functions
+and glibc's fexecve() and getline() functions.
+
+Upstream-Status: Inappropriate [Other]
+Upstream no longer maintains a GPL version of this utility.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: cdrtools-2.01/include/schily.h
 ===================================================================
 --- cdrtools-2.01.orig/include/schily.h	2009-06-18 11:30:45.000000000 +0100
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch b/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
index 0318d31..82e57d1 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
@@ -1,3 +1,10 @@
+Remove hard-coded references to /usr/src/linux/include to avoid
+host contamination.
+
+Upstream-Status: [Other (build-system specific)]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: cdrtools-2.01/DEFAULTS/Defaults.gnu
 ===================================================================
 --- cdrtools-2.01.orig/DEFAULTS/Defaults.gnu	2008-09-22 12:42:12.000000000 +0100
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
index 769e5e2..aba6a45 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
@@ -1,21 +1,25 @@
 # cdrtools-native OE build file
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
-
-LICENSE="GPL"
-DESCRIPTION="A set of tools for CD recording, including cdrecord"
-HOMEPAGE="http://cdrecord.berlios.de/old/private/cdrecord.html"
+SUMMARY = "A set of tools for CD recording, including cdrecord"
+DESCRIPTION = "A set of tools for CD recording, including cdrecord"
+HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
+SECTION = "console/utils"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PR = "r2"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/cdrtools-${PV}.tar.bz2 \
+           file://no_usr_src.patch \
+           file://glibc-conflict-rename.patch"
 
-SRC_URI="ftp://ftp.berlios.de/pub/cdrecord/cdrtools-${PV}.tar.bz2 \
-         file://no_usr_src.patch;patch=1 \
-         file://glibc-conflict-rename.patch;patch=1"
+SRC_URI[md5sum] = "d44a81460e97ae02931c31188fe8d3fd"
+SRC_URI[sha256sum] = "728b6175069a77c4d7d92ae60108cbda81fbbf7bc7aa02e25153ccf2092f6c22"
 
 inherit native
 
-STAGE_TEMP="${WORKDIR}/image-temp"
+STAGE_TEMP = "${WORKDIR}/image-temp"
 
 do_install() {
 	install -d ${STAGE_TEMP}
-- 
1.7.1.1



