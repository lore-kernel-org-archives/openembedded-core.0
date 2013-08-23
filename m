Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0306860896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 09:02:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7N9EUXX006936 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:14:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PxtfBX7Bmll7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:14:30 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7N9EQ7D006931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:14:28 +0100
Message-ID: <1377248541.6762.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2013 10:02:21 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Fix the relative symlink replacement code
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
X-List-Received-Date: Fri, 23 Aug 2013 09:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ant reported on irc that the sstate absolute to relative symlink creation
code wasn't working in klibc. He was correct although the level of breakage is 
rather surprising since it only worked for one level of symlink (usr/include) with
everything else being broken.

The reason is probably that nothing really uses absolute paths, we use relative
paths where at all possible already. Nothing in the target sysroot should use
absolute paths for a start. In this regard, the klibc-dev package is broken and
needs fixing. It will currently break when building for one machine, then switching
to another of the same TUNE_PKGARCH and installing from sstate but that is a
separate issue.

This patch fixes the symlink creation code by firstly passing in the correct
value we need (where the symlink will end up) and seccondly, actually using it.

I've also tweaked the debug message to contain appropriate information and got
right of the double "//" value the existing code created in favour of the form
'./..' which looks neater.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c1ca54b..c86f393 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -440,13 +440,14 @@ def sstate_package(ss, d):
         if not link.startswith(tmpdir):
             return
 
-        depth = link.rpartition(tmpdir)[2].count('/')
+        depth = outputpath.rpartition(tmpdir)[2].count('/')
         base = link.partition(tmpdir)[2].strip()
         while depth > 1:
-            base = "../" + base
+            base = "/.." + base
             depth -= 1
+        base = "." + base
 
-        bb.debug(2, "Replacing absolute path %s with relative path %s" % (link, base))
+        bb.debug(2, "Replacing absolute path %s with relative path %s for %s" % (link, base, outputpath))
         os.remove(path)
         os.symlink(base, path)
 
@@ -464,11 +465,11 @@ def sstate_package(ss, d):
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files:
                 srcpath = os.path.join(walkroot, file)
-                dstpath = srcpath.replace(state[1], sstatebuild + state[0])
+                dstpath = srcpath.replace(state[1], state[2])
                 make_relative_symlink(srcpath, dstpath, d)
             for dir in dirs:
                 srcpath = os.path.join(walkroot, dir)
-                dstpath = srcpath.replace(state[1], sstatebuild + state[0])
+                dstpath = srcpath.replace(state[1], state[2])
                 make_relative_symlink(srcpath, dstpath, d)
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         oe.path.copyhardlinktree(state[1], sstatebuild + state[0])



