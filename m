Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0F58A779F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 14:32:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2017 07:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,244,1488873600"; d="scan'208";a="849222600"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.4.33])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2017 07:32:54 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Apr 2017 09:33:47 -0500
Message-Id: <20170424143347.28218-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe-selftest : Unset SANITY_TESTED_DISTROS to avoid warnings on execution
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
X-List-Received-Date: Mon, 24 Apr 2017 14:32:54 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Unsetting SANITY_TESTED_DISTROS is required to avoid warnings that are
treated like failures by oe-selftest suite.

[YOCTO #11401]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 scripts/oe-selftest | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 52366b1c8d..8c72b8c601 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -151,14 +151,24 @@ def preflight_check():
         return False
 
     if get_bb_var("SANITY_TESTED_DISTROS"):
-        log.error("Please unset SANITY_TESTED_DISTROS in order to run oe-selftest")
-        return False
+        log.info("Unsetting SANITY_TESTED_DISTROS in order to run oe-selftest")
+        ftools.append_file(os.path.join(builddir, "conf/local.conf"), \
+                           "\n#Unset SANITY_TESTED_DISTROS added by oe-selftest.py\nSANITY_TESTED_DISTROS=''")
 
     log.info("Running bitbake -p")
     runCmd("bitbake -p")
 
     return True
 
+def remove_variables():
+   if "#Unset SANITY_TESTED_DISTROS added by oe-selftest.py" \
+       in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
+           log.info("Removing SANITY_TESTED_DISTROS from local.conf")
+           ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
+                   "\n#Unset SANITY_TESTED_DISTROS added by oe-selftest.py\nSANITY_TESTED_DISTROS=''")
+
+
+
 def add_include():
     global builddir
     if "#include added by oe-selftest.py" \
@@ -811,4 +821,5 @@ if __name__ == "__main__":
     finally:
         remove_include()
         remove_inc_files()
+        remove_variables()
     sys.exit(ret)
-- 
2.11.0


