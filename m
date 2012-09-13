Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBy0h-000470-3c
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 03:14:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2012 18:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,413,1344236400"; d="scan'208";a="221315293"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 18:01:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 18:01:52 -0700
Message-Id: <1347498112-22462-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC PATCH] insane.conf: add new libexec test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 01:14:27 -0000

This tests for /usr/libexec as we are moving things to /lib/.
the test is ignored if the distro defaults to /usr/libexec.

Currently this test will be disabled by default since the current
value of ${libexecdir} is "/usr/libexec".  Also this tests needs
to be enabled in the WARN_QA list.

[YOCTO #2915]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/insane.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e74eb3f..8b2d536 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -137,6 +137,20 @@ def package_qa_handle_error(error_class, error_msg, d):
         bb.warn("QA Issue: %s" % error_msg)
         return True
 
+QAPATHTEST[libexec] = "package_qa_check_libexec"
+def package_qa_check_libexec(path,name, d, elf, messages):
+
+    # Skip the case where the default is explicitly /usr/libexec
+    libexec = d.getVar('libexecdir', True)
+    if libexec == "/usr/libexec":
+        return True
+
+    if 'libexec' in path.split(os.path.sep):
+        messages.append("%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
+        return False
+
+    return True
+
 QAPATHTEST[rpaths] = "package_qa_check_rpath"
 def package_qa_check_rpath(file,name, d, elf, messages):
     """
-- 
1.7.7.6



