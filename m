Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3Fky-0006lr-Lz for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 00:49:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NfQ7s024311
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 23:41:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23870-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 23:41:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NfIgq024305
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 23:41:19 GMT
Message-ID: <1330645282.15224.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 23:41:22 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] lib/oe/patch.py: Fix patch resolver logic
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
X-List-Received-Date: Thu, 01 Mar 2012 23:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, if PATCHRESOLVE is user and and PatchTree() is being used, you can
get backtraces if patch applcication fails. This is because even in the failure
case, self._current is incremented, meaning second time around, there are array
range issues.

This patch changes the code so _current is only incremented upon successful
patch application, thereby resolving this failure.

[YOCTO #2043 partially]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 6f7f900..065a8f7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -134,20 +134,23 @@ class PatchTree(PatchSet):
         bb.note("patches is %s" % self.patches)
         if all:
             for i in self.patches:
+                bb.note("applying patch %s" % i)
+                self._applypatch(i, force)
+
                 if self._current is not None:
                     self._current = self._current + 1
                 else:
                     self._current = 0
-                bb.note("applying patch %s" % i)
-                self._applypatch(i, force)
         else:
+            bb.note("applying patch %s" % self.patches[self._current or 0])
+            ret = self._applypatch(self.patches[self._current or 0], force)
+
             if self._current is not None:
                 self._current = self._current + 1
             else:
                 self._current = 0
-            bb.note("applying patch %s" % self.patches[self._current])
-            return self._applypatch(self.patches[self._current], force)
 
+            return ret
 
     def Pop(self, force = None, all = None):
         if all:




