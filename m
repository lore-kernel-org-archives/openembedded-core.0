Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3O-00065C-Oh
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625104"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:32 -0700
Message-Id: <0224132d4fb780052e1bd7f76ab1642deacf8225.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/28] patch: Convert to use oe_terminal
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Unfortunately we can't access oe_terminal directly from patch.py
so we have to pass in the correct terminal function pointer.

[YOCTO #1587]

(From OE-Core rev: 9e0a21dda24f285a1c4878488e887485a749f3f2)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/patch.bbclass |    4 +++-
 meta/lib/oe/patch.py       |   17 ++++++-----------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 7622163..86046e1 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -5,6 +5,8 @@ QUILTRCFILE ?= "${STAGING_BINDIR_NATIVE}/quiltrc"
 
 PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
+inherit terminal
+
 python patch_do_patch() {
 	import oe.patch
 
@@ -124,7 +126,7 @@ python patch_do_patch() {
 
 		if not patchdir in classes:
 			patchset = cls(patchdir, d)
-			resolver = rcls(patchset)
+			resolver = rcls(patchset, oe_terminal)
 			classes[patchdir] = (patchset, resolver)
 			patchset.Clean()
 		else:
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 9768be0..75fb91e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -311,7 +311,7 @@ class QuiltTree(PatchSet):
             self._runcmd(args)
 
 class Resolver(object):
-    def __init__(self, patchset):
+    def __init__(self, patchset, terminal):
         raise NotImplementedError()
 
     def Resolve(self):
@@ -324,8 +324,9 @@ class Resolver(object):
         raise NotImplementedError()
 
 class NOOPResolver(Resolver):
-    def __init__(self, patchset):
+    def __init__(self, patchset, terminal):
         self.patchset = patchset
+        self.terminal = terminal
 
     def Resolve(self):
         olddir = os.path.abspath(os.curdir)
@@ -341,13 +342,13 @@ class NOOPResolver(Resolver):
 # resolution, with the exception of refreshing the remote copy of the patch
 # files (the urls).
 class UserResolver(Resolver):
-    def __init__(self, patchset):
+    def __init__(self, patchset, terminal):
         self.patchset = patchset
+        self.terminal = terminal
 
     # Force a push in the patchset, then drop to a shell for the user to
     # resolve any rejected hunks
     def Resolve(self):
-
         olddir = os.path.abspath(os.curdir)
         os.chdir(self.patchset.dir)
         try:
@@ -368,16 +369,10 @@ class UserResolver(Resolver):
             f.write("echo 'Run \"quilt refresh\" when patch is corrected, press CTRL+D to exit.'\n")
             f.write("echo ''\n")
             f.write(" ".join(patchcmd) + "\n")
-            f.write("#" + bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
             f.close()
             os.chmod(rcfile, 0775)
 
-            os.environ['TERMWINDOWTITLE'] = "Bitbake: Please fix patch rejects manually"
-            os.environ['SHELLCMDS'] = "bash --rcfile " + rcfile
-            rc = os.system(bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
-            if os.WIFEXITED(rc) and os.WEXITSTATUS(rc) != 0:
-                bb.msg.fatal("Build", ("Cannot proceed with manual patch resolution - '%s' not found. " \
-                    + "Check TERMCMDRUN variable.") % bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
+            self.terminal("bash --rcfile " + rcfile, 'Patch Rejects: Please fix patch rejects manually', self.patchset.d)
 
             # Construct a new PatchSet after the user's changes, compare the
             # sets, checking patches for modifications, and doing a remote
-- 
1.7.6.4



