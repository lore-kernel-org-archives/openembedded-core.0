Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TK9n1-0002NV-6k for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 17:26:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95FD8k9017958
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 16:13:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17915-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 16:13:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95FCxTO017952
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 16:12:59 +0100
Message-ID: <1349449982.15658.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Oct 2012 16:13:02 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/cp-noerror: Copy the code from shutils.copytree, update not to error if the mkdir fails
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
X-List-Received-Date: Fri, 05 Oct 2012 15:26:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index fdb3d2d..f0cd243 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -5,10 +5,38 @@
 #
 
 import sys
+import os
 import shutil
 
+def copytree(src, dst, symlinks=False, ignore=None):
+    """Based on shutil.copytree"""
+    names = os.listdir(src)
+    try:
+        os.makedirs(dst)
+    except OSError: 
+        # Already exists
+        pass
+    errors = []
+    for name in names:
+        srcname = os.path.join(src, name)
+        dstname = os.path.join(dst, name)
+        try:
+            shutil.copy2(srcname, dstname)
+        # catch the Error from the recursive copytree so that we can
+        # continue with other files
+        except shutil.Error, err:
+            errors.extend(err.args[0])
+        except EnvironmentError, why:
+            errors.append((srcname, dstname, str(why)))
+    try:
+        shutil.copystat(src, dst)
+    except OSError, why:
+        errors.extend((src, dst, str(why)))
+    if errors:
+        raise shutil.Error, errors
+
 try:
-    shutil.copytree(sys.argv[1], sys.argv[2])
+    copytree(sys.argv[1], sys.argv[2])
 except shutil.Error:
    pass
 




