Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 238A97DD2C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 09:59:41 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x3U9xgmA015470
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:59:42 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x3U9xgdc026118;
	Tue, 30 Apr 2019 11:59:42 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 00E2C9508F2;
	Tue, 30 Apr 2019 11:59:42 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 11:59:17 +0200
Message-Id: <20190430095917.3680-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190430095917.3680-1-andrej.valek@siemens.com>
References: <20190430095917.3680-1-andrej.valek@siemens.com>
Subject: [PATCH 1/1] insane.bbclass: Add QA package check for mixed bins and libs
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
X-List-Received-Date: Tue, 30 Apr 2019 09:59:42 -0000

Warn about mixed binaries and libraries in the same package. This could
makes unexpected behavior in multi-lib cases.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/insane.bbclass | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a9be88e816..09b82529d9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -17,6 +17,8 @@
 #  -Check that scripts in base_[bindir|sbindir|libdir] do not reference
 #   files under exec_prefix
 #  -Check if the package name is upper case
+#  -Check that binaries and libraries base_[bindir|sbindir|libdir] are
+#   not mixed in the same package
 
 QA_SANE = "True"
 
@@ -28,6 +30,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
+            mixed-libs-bins-in-pkg \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -893,6 +896,30 @@ def package_qa_check_host_user(path, name, d, elf, messages):
     return True
 
 
+QAPKGTEST[mixed-libs-bins-in-pkg] = "package_qa_check_bins_libs"
+def package_qa_check_bins_libs(pkg, d, messages):
+    """Check for mixed binaries and libraries in the same package."""
+    pkgdest = d.getVar('PKGDEST')
+    pkg_dir = pkgdest + os.sep + pkg + os.sep
+
+    # Skip unneeded packages
+    if pkg.endswith("-dev") or pkg.endswith("-staticdev") or pkg.endswith("-dbg") or pkg.endswith("-ptest") or pkg.startswith("nativesdk-"):
+        return True
+
+    binaries = [d.getVar('base_bindir'), d.getVar('base_sbindir'), d.getVar('bindir'), d.getVar('sbindir')]
+    libraries = [d.getVar('base_libdir'), d.getVar('libdir') ] + d.getVar('MULTILIB_VARIANTS').split() + [d.getVar('exec_prefix') + x for x in d.getVar('MULTILIB_VARIANTS').split()]
+
+    # Check pkg_dir content
+    for bin in binaries:
+        if os.path.exists(pkg_dir + bin) and not os.path.islink(pkg_dir + bin):
+          for lib in libraries:
+              if os.path.exists(pkg_dir + lib) and not os.path.islink(pkg_dir + lib):
+                  package_qa_add_message(messages, "mixed-libs-bins-in-pkg", "Package %s has mixed binaries and libraries" % pkg)
+                  return False
+
+    return True
+
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
2.11.0


