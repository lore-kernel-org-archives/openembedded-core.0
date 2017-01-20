Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACE5772DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5EYo019639; Fri, 20 Jan 2017 18:05:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8Yg4riTiPF7j; Fri, 20 Jan 2017 18:05:15 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5A86019624
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdYk-0000uy-LD; Fri, 20 Jan 2017 18:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:05:04 +0000
Message-Id: <1484935506-3419-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/14] wic: misc.py: add parameter 'cache' to get_bitbake_vars
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
X-List-Received-Date: Fri, 20 Jan 2017 18:05:17 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

This parameter will be used to allow or prevent variable caching.

For example, we don't want to cache value of RECIPE_SYSROOT_NATIVE
wic-tools variable as we may decide to rebuild wic-tools.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 445109a..3737c4b 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -160,7 +160,7 @@ class BitbakeVars(defaultdict):
         key, val = match.groups()
         self[image][key] = val.strip('"')
 
-    def get_var(self, var, image=None):
+    def get_var(self, var, image=None, cache=True):
         """
         Get bitbake variable from 'bitbake -e' output or from .env file.
         This is a lazy method, i.e. it runs bitbake or parses file only when
@@ -202,21 +202,26 @@ class BitbakeVars(defaultdict):
                     self._parse_line(line, image)
 
             # Make first image a default set of variables
-            images = [key for key in self if key]
-            if len(images) == 1:
-                self[None] = self[image]
+            if cache:
+                images = [key for key in self if key]
+                if len(images) == 1:
+                    self[None] = self[image]
 
-        return self[image].get(var)
+        result = self[image].get(var)
+        if not cache:
+            self.pop(image, None)
+
+        return result
 
 # Create BB_VARS singleton
 BB_VARS = BitbakeVars()
 
-def get_bitbake_var(var, image=None):
+def get_bitbake_var(var, image=None, cache=True):
     """
     Provide old get_bitbake_var API by wrapping
     get_var method of BB_VARS singleton.
     """
-    return BB_VARS.get_var(var, image)
+    return BB_VARS.get_var(var, image, cache)
 
 def parse_sourceparams(sourceparams):
     """
-- 
2.7.4


