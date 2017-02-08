Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E415171D9E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYaNU000364; Wed, 8 Feb 2017 23:34:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YDKWasd0mFt8; Wed,  8 Feb 2017 23:34:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYYBi000345
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Feb 2017 23:34:35 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cbbkw-0006Qa-Gr; Wed, 08 Feb 2017 23:34:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 23:34:28 +0000
Message-Id: <1486596869-24628-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/7] sstate: Make absolute symlinks an error
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
X-List-Received-Date: Wed, 08 Feb 2017 23:34:38 -0000

The current relocation code is broken, at least in the native case. Fixing it
would mean trying pass in new data on sstate tasks about the relative positioning
of symlinks compared to the sstate relocation paths. Whilst we could do this,
right now I'm favouring making this an error and fixing the small number of
problematic recipes we have in OE-Core (3).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 42 ++++++++++++------------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ada6fe5..bd9c2ae 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -583,29 +583,6 @@ python sstate_hardcode_path () {
 def sstate_package(ss, d):
     import oe.path
 
-    def make_relative_symlink(path, outputpath, d):
-        # Replace out absolute TMPDIR paths in symlinks with relative ones
-        if not os.path.islink(path):
-            return
-        link = os.readlink(path)
-        if not os.path.isabs(link):
-            return
-        if not link.startswith(tmpdir):
-            return
-
-        #base = os.path.relpath(link, os.path.dirname(path))
-
-        depth = outputpath.rpartition(tmpdir)[2].count('/')
-        base = link.partition(tmpdir)[2].strip()
-        while depth > 1:
-            base = "/.." + base
-            depth -= 1
-        base = "." + base
-
-        bb.debug(2, "Replacing absolute path %s with relative path %s for %s" % (link, base, outputpath))
-        os.remove(path)
-        os.symlink(base, path)
-
     tmpdir = d.getVar('TMPDIR')
 
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
@@ -619,15 +596,20 @@ def sstate_package(ss, d):
         if d.getVar('SSTATE_SKIP_CREATION') == '1':
             continue
         srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
+        # Find and error for absolute symlinks. We could attempt to relocate but its not
+        # clear where the symlink is relative to in this context. We could add that markup
+        # to sstate tasks but there aren't many of these so better just avoid them entirely.
         for walkroot, dirs, files in os.walk(state[1]):
-            for file in files:
+            for file in files + dirs:
                 srcpath = os.path.join(walkroot, file)
-                dstpath = srcpath.replace(state[1], state[2])
-                make_relative_symlink(srcpath, dstpath, d)
-            for dir in dirs:
-                srcpath = os.path.join(walkroot, dir)
-                dstpath = srcpath.replace(state[1], state[2])
-                make_relative_symlink(srcpath, dstpath, d)
+                if not os.path.islink(srcpath):
+                    continue
+                link = os.readlink(srcpath)
+                if not os.path.isabs(link):
+                    continue
+                if not link.startswith(tmpdir):
+                    continue
+                bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         os.rename(state[1], sstatebuild + state[0])
 
-- 
2.7.4


