Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2289775843
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 15:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5PF8gKP004424; Thu, 25 Jun 2015 16:08:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qZbMTdaMWfXL; Thu, 25 Jun 2015 16:08:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5PF8QZW004420
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 25 Jun 2015 16:08:38 +0100
Message-ID: <1435244906.10583.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 16:08:26 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [PATCH] lib/oe/patch: Fix git patch application for source in subdirectory
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
X-List-Received-Date: Thu, 25 Jun 2015 15:08:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Similarly to:
http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/lib/oe/patch.py?id=f205ccaf48ac36f4b26efc4aeb2e9d2939b28646
we need to fix patch application for source which is in a subdirectory.

Passing "." as the git directory or work-dir appears to work (or is ignored)
in some versions of git but does not work in others, probably quite correctly.

Since we have reporoot from the above patch, pass this in directly.

This bug caused this sanity test failure on some machines:

FAIL: test_devtool_modify_git (oeqa.selftest.devtool.DevtoolTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/devtool.py", line 390, in test_devtool_modify_git
    self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
AssertionError: '?? util/mkelfImage/patches/' != '' : Created git repo is not clean

since git apply would fail, it would then fall back to quilt
and the git tree would be left unclean.

[YOCTO #7911]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index afb0013..c4f042d 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -398,17 +398,17 @@ class GitApplyTree(PatchTree):
         try:
             patchfilevar = 'PATCHFILE="%s"' % os.path.basename(patch['file'])
             try:
-                shellcmd = [patchfilevar, "git", "--work-tree=.", "am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
+                shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot, "am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
                 return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at the end
                 try:
-                    shellcmd = ["git", "--work-tree=.", "am", "--abort"]
+                    shellcmd = ["git", "--work-tree=%s" % reporoot, "am", "--abort"]
                     runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
                 except CmdError:
                     pass
                 # Fall back to git apply
-                shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
+                shellcmd = ["git", "--git-dir=%s" % reporoot, "apply", "-p%s" % patch['strippath']]
                 try:
                     output = _applypatchhelper(shellcmd, patch, force, reverse, run)
                 except CmdError:



