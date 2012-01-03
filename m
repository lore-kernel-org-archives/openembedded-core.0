Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrP-0004iK-2l
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752256"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:01 -0800
Message-Id: <b06630c1ce142211b62cc2edd5aa4fc9e27b0384.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 075/113] jpeg: fix configure with automake 1.11.2
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The support for automatic de-ANSI-fication has been deprecated in
automake 1.11.2, and will be removed altogether in automake 1.12

This avoids this error:
| configure.ac:24: automatic de-ANSI-fication support is deprecated
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
NOTE: package jpeg-native-8c-r2: task do_configure: Failed

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../jpeg/jpeg-8c/fix_for_automake_1.11.2.patch     |   28 ++++++++++++++++++++
 meta/recipes-core/jpeg/jpeg_8c.bb                  |    5 ++-
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch

diff --git a/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch b/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
new file mode 100644
index 0000000..c0d7f3e
--- /dev/null
+++ b/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+The support for automatic de-ANSI-fication has been deprecated in
+automake 1.11.2, and will be removed altogether in automake 1.12
+
+This avoids this error:
+| configure.ac:24: automatic de-ANSI-fication support is deprecated
+| autoreconf: automake failed with exit status: 1
+| ERROR: autoreconf execution failed.
+NOTE: package jpeg-native-8c-r2: task do_configure: Failed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/28
+
+
+Index: jpeg-8c/configure.ac
+===================================================================
+--- jpeg-8c.orig/configure.ac
++++ jpeg-8c/configure.ac
+@@ -21,7 +21,7 @@ AC_CANONICAL_TARGET
+ 
+ # Initialize Automake
+ # Don't require all the GNU mandated files
+-AM_INIT_AUTOMAKE([-Wall -Werror ansi2knr no-dist foreign])
++AM_INIT_AUTOMAKE([-Wall -Werror no-dist foreign])
+ 
+ # Make --enable-silent-rules the default.
+ # To get verbose build output you may configure
diff --git a/meta/recipes-core/jpeg/jpeg_8c.bb b/meta/recipes-core/jpeg/jpeg_8c.bb
index 1c242d1..6aeaeaa 100644
--- a/meta/recipes-core/jpeg/jpeg_8c.bb
+++ b/meta/recipes-core/jpeg/jpeg_8c.bb
@@ -13,10 +13,11 @@ SECTION = "libs"
 DEPENDS = "libtool-cross"
 DEPENDS_virtclass-native = "libtool-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
-	   file://debian-libjpeg7_7-1.diff;"
+	   file://debian-libjpeg7_7-1.diff \
+           file://fix_for_automake_1.11.2.patch"
 
 SRC_URI[md5sum] = "a2c10c04f396a9ce72894beb18b4e1f9"
 SRC_URI[sha256sum] = "edfc0b3e004b2fe58ffeeec89f96e3a3c28972c46725ec127d01edf8a1cc7c9a"
-- 
1.7.6.4



