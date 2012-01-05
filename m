Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigxy-0001EK-KJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663906"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:30:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:37 -0800
Message-Id: <fd8f785db698b6b4fe706175220285ff7c8d31c1.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/28] opkg-utils: use /usr/bin/env python
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:22 -0000

From: Christopher Larson <kergoth@gmail.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../opkg-utils/opkg-utils/shebang.patch            |   46 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
 2 files changed, 48 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
new file mode 100644
index 0000000..f6a2ef9
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
@@ -0,0 +1,46 @@
+Use python via the PATH, rather than hardcoding /usr/bin/python
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <kergoth@gmail.com>
+
+--- opkg-utils.orig/opkg-list-fields
++++ opkg-utils/opkg-list-fields
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, opkg
+ 
+--- opkg-utils.orig/opkg-make-index
++++ opkg-utils/opkg-make-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, posixpath
+ from glob import glob
+--- opkg-utils.orig/opkg-show-deps
++++ opkg-utils/opkg-show-deps
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, posixpath
+ from glob import glob
+--- opkg-utils.orig/opkg-unbuild
++++ opkg-utils/opkg-unbuild
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, re
+ 
+--- opkg-utils.orig/opkg-update-index
++++ opkg-utils/opkg-update-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python2.1
++#!/usr/bin/env python
+ 
+ import sys, os
+ from glob import glob
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index 9b94aff..9702131 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -8,13 +8,14 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
            file://index-ignore-filenotfound.patch \
            file://mtime-int.patch \
            file://add-license-field.patch \
            file://arfile_header_split.patch \
+           file://shebang.patch \
            "
 
 S = "${WORKDIR}/opkg-utils"
-- 
1.7.6.4



