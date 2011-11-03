Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RM5RG-0002iy-1o for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 23:07:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3M11cI001529
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 22:01:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00579-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2011 22:00:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3M0su4001523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 22:00:55 GMT
Message-ID: <1320357655.20107.82.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Nov 2011 22:00:55 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] patch: Convert to use oe_terminal
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
X-List-Received-Date: Thu, 03 Nov 2011 22:07:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Unfortunately we can't access oe_terminal directly from patch.py
so we have to pass in the correct terminal function pointer.

[YOCTO #1587]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
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




