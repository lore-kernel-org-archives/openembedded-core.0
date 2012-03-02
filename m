Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3RR9-0007El-2W for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:18:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22C9iQA030565
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:09:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29319-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 12:09:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22C9YKe030558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:09:38 GMT
Message-ID: <1330690177.15224.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 12:09:37 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] lib/oe/patch.py: Fix and improve PatchTree() resolver logic
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
X-List-Received-Date: Fri, 02 Mar 2012 12:18:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, if PATCHRESOLVE is user and and PatchTree() is being used, you can
get backtraces if patch application fails. This is because even in the failure
case, self._current is incremented, meaning second time around, there are array
range issues.

This patch changes the code so _current is only incremented upon successful
patch application, thereby resolving this failure.

Secondly, if you bitbake -c patch -f a recipe using PatchTree(), the
clean method was unimplemented leading to patch failures.

The other part of this patch changes the logic so a series file and
set of applied patches are maintained in a quilt like fashion. This
means a the Clean method can be implemented correctly and rerunning
the patch task of an existing patches source now works reliably.

[YOCTO #2043 partially]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 6f7f900..a5b31b8 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -98,7 +98,37 @@ class PatchSet(object):
 class PatchTree(PatchSet):
     def __init__(self, dir, d):
         PatchSet.__init__(self, dir, d)
-
+        self.patchdir = os.path.join(self.dir, 'patches')
+        self.seriespath = os.path.join(self.dir, 'patches', 'series')
+        bb.utils.mkdirhier(self.patchdir)
+
+    def _appendPatchFile(self, patch, strippath):
+        with open(self.seriespath, 'a') as f:
+            f.write(os.path.basename(patch) + "," + strippath + "\n")
+        shellcmd = ["cat", patch, ">" , self.patchdir + "/" + os.path.basename(patch)]
+        runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+
+    def _removePatch(self, p):
+        patch = {}
+        patch['file'] = p.split(",")[0]
+        patch['strippath'] = p.split(",")[1]
+        self._applypatch(patch, False, True)
+
+    def _removePatchFile(self, all = False):
+        if not os.path.exists(self.seriespath):
+            return
+        patches = open(self.seriespath, 'r+').readlines()
+        if all:
+            for p in reversed(patches):
+                self._removePatch(os.path.join(self.patchdir, p.strip()))
+            patches = []
+        else:
+            self._removePatch(os.path.join(self.patchdir, patches[-1].strip()))
+            patches.pop()
+        with open(self.seriespath, 'w') as f:
+            for p in patches:
+                f.write(p)
+         
     def Import(self, patch, force = None):
         """"""
         PatchSet.Import(self, patch, force)
@@ -127,6 +157,10 @@ class PatchTree(PatchSet):
 
         shellcmd.pop(len(shellcmd) - 1)
         output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+
+        if not reverse:
+            self._appendPatchFile(patch['file'], patch['strippath'])
+
         return output
 
     def Push(self, force = False, all = False, run = True):
@@ -134,30 +168,37 @@ class PatchTree(PatchSet):
         bb.note("patches is %s" % self.patches)
         if all:
             for i in self.patches:
-                if self._current is not None:
-                    self._current = self._current + 1
-                else:
-                    self._current = 0
                 bb.note("applying patch %s" % i)
                 self._applypatch(i, force)
+                self._current = i
         else:
             if self._current is not None:
-                self._current = self._current + 1
+                next = self._current + 1
             else:
-                self._current = 0
-            bb.note("applying patch %s" % self.patches[self._current])
-            return self._applypatch(self.patches[self._current], force)
+                next = 0
+
+            bb.note("applying patch %s" % self.patches[next])
+            ret = self._applypatch(self.patches[next], force)
 
+            self._current = next
+            return ret
 
     def Pop(self, force = None, all = None):
         if all:
-            for i in self.patches:
-                self._applypatch(i, force, True)
+            self._removePatchFile(True)
+            self._current = None
         else:
-            self._applypatch(self.patches[self._current], force, True)
+            self._removePatchFile(False)
+
+        if self._current == 0:
+            self._current = None
+
+        if self._current is not None:
+            self._current = self._current - 1
 
     def Clean(self):
         """"""
+        self.Pop(all=True)
 
 class GitApplyTree(PatchTree):
     def __init__(self, dir, d):




