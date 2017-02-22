Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E2DD573047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:28:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:28:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114018158"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:28:03 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:27:22 +0200
Message-Id: <1487752042-19804-51-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 25/25] insane.bbclass: Add package QA check for merged /usr.
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
X-List-Received-Date: Wed, 22 Feb 2017 08:28:04 -0000

This check makes sure that, when usrmerge distro feature enabled, no package
installs files to root (/bin, /sbin, /lib, /lib64) folders.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/insane.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e8e54f0..011eb99 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -40,6 +40,9 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             version-going-backwards expanded-d invalid-chars \
             license-checksum dev-elf \
             "
+# Add usrmerge QA check based on distro feature	    
+ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
+
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
 enabled tests are listed here, the do_package_qa task will run under fakeroot."
@@ -1035,6 +1038,18 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
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
@@ -1108,6 +1123,7 @@ def package_qa_check_host_user(path, name, d, elf, messages):
             return False
     return True
 
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
2.7.4


