Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 746726AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 19:21:52 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 12:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,339,1498546800"; d="scan'208";a="137397472"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2017 12:21:53 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 12:21:50 -0700
Message-Id: <20170807192151.134063-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 1/2] Revert "cml1.bbclass: wait until menuconfig terminal finishes"
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
X-List-Received-Date: Mon, 07 Aug 2017 19:21:53 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

This reverts commit d2ebee7c3a0c8ab9a09ebad12a2fda51f8d10954.
---
 meta/classes/cml1.bbclass | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 0bab22efed..eb8e7907f6 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -26,28 +26,8 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
-    # We need to know when the command completes but some terminals (including gnome-terminal
-    # and tmux) gives us no way to do this. We therefore write the pid to a temporal file
-    # then monitor the pid until it exits.
-    import tempfile
-    pidfile = tempfile.NamedTemporaryFile(delete = False).name
-    try:
-        oe_terminal("${SHELL} -c \"echo $$ > %s; make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % (pidfile, d.getVar('KCONFIG_CONFIG_COMMAND')),
+    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
-        while os.stat(pidfile).st_size <= 0:
-            continue
-        with open(pidfile, "r") as f:
-            pid = int(f.readline())
-    finally:
-        os.unlink(pidfile)
-
-    import time
-    while True:
-        try:
-            os.kill(pid, 0)
-            time.sleep(0.1)
-        except OSError:
-            break
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
     if hasattr(bb.build, 'write_taint'):
-- 
2.12.3


