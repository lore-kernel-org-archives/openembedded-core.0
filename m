Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29gY-0002jG-F9
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:13:24 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FUQ020480; Mon, 4 Feb 2013 00:01:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WyK+gD55OuGL; Mon,  4 Feb 2013 00:01:23 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401DbN020463
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:15 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pm-0000YQ-06; Sun, 03 Feb 2013 23:56:02 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:49 +0000
Message-Id: <d823341ff52284d246e7a3074f2bf5ef38f810ed.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 19/22] sstate/path.py: Add copyhardlinktree() function and use for performance optimisation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 00:13:31 -0000

Add a function which copys a tree as a set of hardlinks to the original
files, then use this in sstate to reduce some of the overhead of sstate
package creation since the file isn't actually copied.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass |    4 ++--
 meta/lib/oe/path.py         |    4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a79d2b5..6f77bb9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -458,14 +458,14 @@ def sstate_package(ss, d):
                 dstpath = srcpath.replace(state[1], sstatebuild + state[0])
                 make_relative_symlink(srcpath, dstpath, d)
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
-        oe.path.copytree(state[1], sstatebuild + state[0])
+        oe.path.copyhardlinktree(state[1], sstatebuild + state[0])
 
     workdir = d.getVar('WORKDIR', True)
     for plain in ss['plaindirs']:
         pdir = plain.replace(workdir, sstatebuild)
         bb.mkdirhier(plain)
         bb.mkdirhier(pdir)
-        oe.path.copytree(plain, pdir)
+        oe.path.copyhardlinktree(plain, pdir)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_PKG', sstatepkg)
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 7197b23..11d4694 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -83,6 +83,10 @@ def copytree(src, dst):
     cmd = 'tar -cf - -C %s -ps . | tar -xf - -C %s' % (src, dst)
     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
+def copyhardlinktree(src, dst):
+    bb.utils.mkdirhier(dst)
+    cmd = 'cp -al %s %s' % (src, dst)
+    check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def remove(path, recurse=True):
     """Equivalent to rm -f or rm -rf"""
-- 
1.7.10.4



