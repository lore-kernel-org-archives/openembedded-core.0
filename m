Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C5BDA78442
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 01:54:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 27 Jul 2017 18:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,423,1496127600"; d="scan'208";a="1200099637"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2017 18:54:41 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 18:54:31 -0700
Message-Id: <20170728015431.25919-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] cml1.bbclass: wait until menuconfig terminal finishes
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
X-List-Received-Date: Fri, 28 Jul 2017 01:54:51 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are at least two terminals types (gnome and tmux) that when
launched to show the kernel's menuconfig, we lost track of the corresponding
process ID, thus there is no way to see when they finish, yielding identical
timestamps before and after menuconfig thus compile's task
is never tainted. This commit takes the solution from [1] but now in the menuconfig's
context.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=c706bfbabbf9f7caf2cf509eb91381fb49aa44cb

[YOCTO #11146]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/cml1.bbclass | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 38e6613c48..1e84795aa2 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -26,8 +26,28 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
-    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+    # We need to know when the command completes but some terminals (including gnome-terminal
+    # and tmux) gives us no way to do this. We therefore write the pid to a temporal file
+    # then monitor the pid until it exits.
+    import tempfile
+    pidfile = tempfile.NamedTemporaryFile(delete = False).name
+    try:
+        oe_terminal("${SHELL} -c \"echo $$ > %s; make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % (pidfile, d.getVar('KCONFIG_CONFIG_COMMAND')),
                 d.getVar('PN') + ' Configuration', d)
+        while os.stat(pidfile).st_size <= 0:
+            continue
+        with open(pidfile, "r") as f:
+            pid = int(f.readline())
+    finally:
+        os.unlink(pidfile)
+
+    import time
+    while True:
+        try:
+            os.kill(pid, 0)
+            time.sleep(0.1)
+        except OSError:
+            break
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
     if hasattr(bb.build, 'write_taint'):
-- 
2.12.3


