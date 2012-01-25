Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rq8ex-0006xz-5K
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 20:37:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2012 11:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100524977"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2012 11:29:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:29:38 -0800
Message-Id: <98f44f4dfd7ad7636c60a78c74834eae8d44532b.1327519635.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327519635.git.sgw@linux.intel.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327519635.git.sgw@linux.intel.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] insane.bbclass: Add test for static .a libraries in non-staticdev packages
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
X-List-Received-Date: Wed, 25 Jan 2012 19:37:31 -0000

This check verifies that non staticdev and non pic packages do not
have static libraries in them. There are a few exceptions for the
libgcc-dev and libgcov-dev packages which are whitelisted, also the
*_nonshared.a need to be part of their respective -dev packages.

This is currently a warning to work out any other issues in the upper
layers but will be moved to ERROR at somepoint in the future.

[YOCTO #663]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/insane.bbclass |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ce21496..ead6ec1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -109,7 +109,7 @@ def package_qa_get_machine_dict():
 
 
 # Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts"
+WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev"
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
 
 def package_qa_clean_path(path,d):
@@ -192,6 +192,19 @@ def package_qa_check_dev(path, name, d, elf, messages):
         messages.append("non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+QAPATHTEST[staticdev] = "package_qa_check_staticdev"
+def package_qa_check_staticdev(path, name, d, elf, messages):
+    """
+    Check for ".a" library in non-staticdev packages
+    There are a number of exceptions to this rule, -pic packages can contain
+    static libraries, the _nonshared.a belong with their -dev packages and
+    libgcc.a, libgcov.a will be skipped in their packages
+    """
+
+    if not name.endswith("-pic") and not name.endswith("-staticdev") and path.endswith(".a") and not path.endswith("_nonshared.a"):
+        messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
+
 QAPATHTEST[debug-files] = "package_qa_check_dbg"
 def package_qa_check_dbg(path, name, d, elf, messages):
     """
-- 
1.7.6.5



