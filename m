Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UYH0g-0002oC-HY for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 16:30:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43EErVl001235 for <openembedded-core@lists.openembedded.org>;
	Fri, 3 May 2013 15:14:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0M-X5iJy-sYJ
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2013 15:14:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43EDYNU001200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 3 May 2013 15:13:35 +0100
Message-ID: <1367590293.5379.155.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 03 May 2013 15:11:33 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] path.py: Deal with race issue
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
X-List-Received-Date: Fri, 03 May 2013 14:31:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The change to use copyhardlinktree in some of the sstate code instead of
copytree exposed a race condition. This is due to cp failing if it finds
a directory doesn't exist yet some other process creates it while cp was
trying to create it itself. tar doesn't error in this case.

To fix this we need to create the directory structure with tar, then
use cp to hardlink the files. Messy but probably worth doing.

I also took the opportunity to remove src_bak since the code is neater
without it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 4f8b66c..0e2d8bc 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -87,16 +87,21 @@ def copytree(src, dst):
 def copyhardlinktree(src, dst):
     """ Make the hard link when possible, otherwise copy. """
     bb.utils.mkdirhier(dst)
-    src_bak = src
-    if os.path.isdir(src):
-        if not len(os.listdir(src)):
-            return	
-        src = src + "/*"
-    if (os.stat(src_bak).st_dev ==  os.stat(dst).st_dev):
+    if os.path.isdir(src) and not len(os.listdir(src)):
+        return	
+
+    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
+        # Need to copy directories only with tar first since cp will error if two 
+        # writers try and create a directory at the same time
+        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -ps --files-from - | tar -xf - -C %s' % (src, src, dst)
+        bb.warn(cmd)
+        check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        if os.path.isdir(src):
+            src = src + "/*"
         cmd = 'cp -afl %s %s' % (src, dst)
         check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
-        copytree(src_bak, dst)
+        copytree(src, dst)
 
 def remove(path, recurse=True):
     """Equivalent to rm -f or rm -rf"""




