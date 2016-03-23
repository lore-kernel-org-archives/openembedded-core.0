Return-Path: <william.c.randle@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 036E2601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:54:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2016 08:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="943503565"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.0.118])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2016 08:54:26 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 08:54:21 -0700
Message-Id: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 15:54:27 -0000

lib_re would match files like "/libsoletta.so.0.0.1-gdb.py" which are
not valid library filenames. Tighten up the re for lib_re and exec_re
so they match only valid sonames (.so or .so followed by major version
and optional minor version and release).

[YOCTO #9215]

Signed-off-by: Bill Randle <william.c.randle@intel.com>

---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7ac945d..e60c358 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -318,8 +318,8 @@ def package_qa_check_libdir(d):
 
     messages = []
 
-    lib_re = re.compile("^/lib.+\.so(\..+)?$")
-    exec_re = re.compile("^%s.*/lib.+\.so(\..+)?$" % exec_prefix)
+    lib_re = re.compile("^/lib.+\.so(\.\d+){0,3}$")
+    exec_re = re.compile("^%s.*/lib.+\.so(\.\d+){0,3}$" % exec_prefix)
 
     for root, dirs, files in os.walk(pkgdest):
         if root == pkgdest:
-- 
2.5.0


