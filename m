Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8053A6AF05
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 10:31:09 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 03:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,973,1363158000"; d="scan'208";a="262373192"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jul 2013 03:30:59 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 13:31:00 +0300
Message-Id: <2ee8976b4ad482eafb186deba9a14fc52f6dc8cf.1372674367.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372674367.git.mihai.prica@intel.com>
References: <cover.1372674367.git.mihai.prica@intel.com>
Subject: [PATCH 1/1] insane.bbclass: Added QA warning for shipping /usr/share/info/dir
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
X-List-Received-Date: Mon, 01 Jul 2013 10:31:09 -0000

/usr/share/info/dir should be generated at install time in a postinst.
Added QA warning to check at build time for this file. The warning
is disabled by default.

[YOCTO #3969]

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/classes/insane.bbclass |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 27c225f..cde1ea9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -32,7 +32,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides \
+            pn-overrides infodir \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -552,6 +552,16 @@ def package_qa_check_xorg_driver_abi(path, name, d, elf, messages):
                 return
         messages.append("Package %s contains Xorg driver (%s) but no xorg-abi- dependencies" % (name, os.path.basename(path)))
 
+QAPATHTEST[infodir] = "package_qa_check_infodir"
+def package_qa_check_infodir(path, name, d, elf, messages):
+    """
+    Check that /usr/share/info/dir isn't shipped in a particular package
+    """
+    infodir = d.expand("${infodir}/dir")
+
+    if infodir in path:
+        messages.append("The /usr/share/info/dir file is not meant to be shipped in a particular package.")
+
 def package_qa_check_license(workdir, d):
     """
     Check for changes in the license files 
-- 
1.7.9.5


