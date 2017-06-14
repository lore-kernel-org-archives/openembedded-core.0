Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C09A87834A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 11:32:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 04:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="980709694"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 14 Jun 2017 04:32:27 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 14:30:46 +0300
Message-Id: <1497439848-29967-6-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v4 5/7] insane.bbclass: Add package QA check for merged /usr.
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
X-List-Received-Date: Wed, 14 Jun 2017 11:32:26 -0000

This check makes sure that, when usrmerge distro feature enabled, no package
installs files to root (/bin, /sbin, /lib, /lib64) folders.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/insane.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f6fd7c7..1c11254 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -40,6 +40,9 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             version-going-backwards expanded-d invalid-chars \
             license-checksum dev-elf file-rdeps \
             "
+# Add usrmerge QA check based on distro feature
+ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
+
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
 enabled tests are listed here, the do_package_qa task will run under fakeroot."
@@ -998,6 +1001,18 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
     check_valid_deps('RREPLACES')
     check_valid_deps('RCONFLICTS')
 
+QAPKGTEST[usrmerge] = "package_qa_check_usrmerge"
+def package_qa_check_usrmerge(pkg, d, messages):
+    pkgdest = d.getVar('PKGDEST')
+    pkg_dir = pkgdest + os.sep + pkg + os.sep
+    merged_dirs = ['bin', 'sbin', 'lib'] + d.getVar('MULTILIB_VARIANTS').split()
+    for f in merged_dirs:
+        if os.path.exists(pkg_dir + f) and not os.path.islink(pkg_dir + f):
+            msg = "%s package is not obeying usrmerge distro feature. /%s should be relocated to /usr." % (pkg, f)
+            package_qa_add_message(messages, "usrmerge", msg)
+            return False
+    return True
+
 QAPKGTEST[expanded-d] = "package_qa_check_expanded_d"
 def package_qa_check_expanded_d(package, d, messages):
     """
@@ -1071,6 +1086,7 @@ def package_qa_check_host_user(path, name, d, elf, messages):
             return False
     return True
 
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
2.7.4


