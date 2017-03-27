Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 00FF277A36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 12:54:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 27 Mar 2017 05:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,231,1486454400"; d="scan'208";a="240718232"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 27 Mar 2017 05:54:41 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 15:53:58 +0300
Message-Id: <20170327125359.16788-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCHv3 1/2] python3: do not hardcode "lib" into site-packages search path
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
X-List-Received-Date: Mon, 27 Mar 2017 12:54:44 -0000

This was not working in multilib or x32 setups and amazingly, was not
noticed until now.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-not-hardcode-lib-into-site-packages-path.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.2.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-into-site-packages-path.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-into-site-packages-path.patch b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-into-site-packages-path.patch
new file mode 100644
index 00000000000..286ba352b0a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-into-site-packages-path.patch
@@ -0,0 +1,33 @@
+From f2bb0a0e3c4eef4fa3853920ecc1cc59618f1409 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 27 Mar 2017 15:33:43 +0300
+Subject: [PATCH] Do not hardcode "lib" into site-packages path.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Lib/site.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/site.py b/Lib/site.py
+index 3f78ef5..511931e 100644
+--- a/Lib/site.py
++++ b/Lib/site.py
+@@ -303,12 +303,12 @@ def getsitepackages(prefixes=None):
+         seen.add(prefix)
+ 
+         if os.sep == '/':
+-            sitepackages.append(os.path.join(prefix, "lib",
++            sitepackages.append(os.path.join(prefix, sys.lib,
+                                         "python" + sys.version[:3],
+                                         "site-packages"))
+         else:
+             sitepackages.append(prefix)
+-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
+         if sys.platform == "darwin":
+             # for framework builds *only* we add the standard Apple
+             # locations.
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 2ff7c9e2780..43cc125b506 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://configure.ac-fix-LIBPL.patch \
             file://python3-fix-CVE-2016-1000110.patch \
             file://upstream-random-fixes.patch \
+            file://0001-Do-not-hardcode-lib-into-site-packages-path.patch \
            "
 SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
 SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
-- 
2.11.0


