Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F22B26CF9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 22:02:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BM2YRZ002200 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:02:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lQOa7CJKuXUK
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:02:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BM2VCO002184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:02:32 +0100
Message-ID: <1381528947.29912.189.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 23:02:27 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/path: Fix copytree functions for tar 1.32
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
X-List-Received-Date: Fri, 11 Oct 2013 22:02:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

tar version 1.32 returns:

tar: --same-order option cannot be used with -c

with the commandlines we have been using. We can remove the -s option (which
is --same-order) to remove the error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index da044ba..1310e38 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -81,7 +81,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
 
     bb.utils.mkdirhier(dst)
-    cmd = 'tar -cf - -C %s -ps . | tar -xf - -C %s' % (src, dst)
+    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def copyhardlinktree(src, dst):
@@ -93,7 +93,7 @@ def copyhardlinktree(src, dst):
     if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
-        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -ps --files-from - | tar -xf - -C %s' % (src, src, dst)
+        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - | tar -xf - -C %s' % (src, src, dst)
         check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         if os.path.isdir(src):
             src = src + "/*"
--
cgit v0.9.1



