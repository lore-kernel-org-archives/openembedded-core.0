Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2255D6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326947"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:04 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:12 +0000
Message-Id: <314e82766b9e1a05465f685af7411eb4483c4d54.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 03/10] oeqa/utils/package_manager.py: Add get_package_manager()
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
X-List-Received-Date: Tue, 24 May 2016 20:49:03 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This new file just contain one function to return an OE package
manager, this depends in the current packaging method.

[YOCTO #8694]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/package_manager.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/package_manager.py

diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
new file mode 100644
index 0000000..099ecc9
--- /dev/null
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -0,0 +1,29 @@
+def get_package_manager(d, root_path):
+    """
+    Returns an OE package manager that can install packages in root_path.
+    """
+    from oe.package_manager import RpmPM, OpkgPM, DpkgPM
+
+    pkg_class = d.getVar("IMAGE_PKGTYPE", True)
+    if pkg_class == "rpm":
+        pm = RpmPM(d,
+                   root_path,
+                   d.getVar('TARGET_VENDOR', True))
+        pm.create_configs()
+
+    elif pkg_class == "ipk":
+        pm = OpkgPM(d,
+                    root_path,
+                    d.getVar("IPKGCONF_TARGET", True),
+                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))
+
+    elif pkg_class == "deb":
+        pm = DpkgPM(d,
+                    root_path,
+                    d.getVar('PACKAGE_ARCHS', True),
+                    d.getVar('DPKG_ARCH', True))
+
+    pm.write_index()
+    pm.update()
+
+    return pm
-- 
2.6.6


