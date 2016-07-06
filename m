Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E30560123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 23:57:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2016 16:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="1016966581"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2016 16:57:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:57:09 +1200
Message-Id: <2e1423fa0b0ac6bf9facbe5e9ed9df1051ccd6fa.1467849364.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] lib/oe/patch: handle encoding differences in patch files
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
X-List-Received-Date: Wed, 06 Jul 2016 23:57:40 -0000

With Python 3, the encoding of a file is significant; several recipes in
OE-Core have patches which are not fully utf-8 decodable e.g. man,
lrzsz, and gstreamer1.0-libav, leading to errors when using devtool's
modify, upgrade or extract subcommands on these recipes. To work around
this, try reading the patch file as utf-8 first and if that fails try
latin-1 before giving up.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 100 +++++++++++++++++++++++++++++----------------------
 1 file changed, 57 insertions(+), 43 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 4a0d3f7..af3adec 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -117,43 +117,50 @@ class PatchSet(object):
                 return None
             return os.sep.join(filesplit[striplevel:])
 
-        copiedmode = False
-        filelist = []
-        with open(patchfile) as f:
-            for line in f:
-                if line.startswith('--- '):
-                    patchpth = patchedpath(line)
-                    if not patchpth:
-                        break
-                    if copiedmode:
-                        addedfile = patchpth
-                    else:
-                        removedfile = patchpth
-                elif line.startswith('+++ '):
-                    addedfile = patchedpath(line)
-                    if not addedfile:
-                        break
-                elif line.startswith('*** '):
-                    copiedmode = True
-                    removedfile = patchedpath(line)
-                    if not removedfile:
-                        break
-                else:
-                    removedfile = None
-                    addedfile = None
-
-                if addedfile and removedfile:
-                    if removedfile == '/dev/null':
-                        mode = 'A'
-                    elif addedfile == '/dev/null':
-                        mode = 'D'
-                    else:
-                        mode = 'M'
-                    if srcdir:
-                        fullpath = os.path.abspath(os.path.join(srcdir, addedfile))
-                    else:
-                        fullpath = addedfile
-                    filelist.append((fullpath, mode))
+        for encoding in ['utf-8', 'latin-1']:
+            try:
+                copiedmode = False
+                filelist = []
+                with open(patchfile) as f:
+                    for line in f:
+                        if line.startswith('--- '):
+                            patchpth = patchedpath(line)
+                            if not patchpth:
+                                break
+                            if copiedmode:
+                                addedfile = patchpth
+                            else:
+                                removedfile = patchpth
+                        elif line.startswith('+++ '):
+                            addedfile = patchedpath(line)
+                            if not addedfile:
+                                break
+                        elif line.startswith('*** '):
+                            copiedmode = True
+                            removedfile = patchedpath(line)
+                            if not removedfile:
+                                break
+                        else:
+                            removedfile = None
+                            addedfile = None
+
+                        if addedfile and removedfile:
+                            if removedfile == '/dev/null':
+                                mode = 'A'
+                            elif addedfile == '/dev/null':
+                                mode = 'D'
+                            else:
+                                mode = 'M'
+                            if srcdir:
+                                fullpath = os.path.abspath(os.path.join(srcdir, addedfile))
+                            else:
+                                fullpath = addedfile
+                            filelist.append((fullpath, mode))
+            except UnicodeDecodeError:
+                continue
+            break
+        else:
+            raise PatchError('Unable to decode %s' % patchfile)
 
         return filelist
 
@@ -280,12 +287,19 @@ class GitApplyTree(PatchTree):
         """
         Extract just the header lines from the top of a patch file
         """
-        lines = []
-        with open(patchfile, 'r') as f:
-            for line in f.readlines():
-                if line.startswith('Index: ') or line.startswith('diff -') or line.startswith('---'):
-                    break
-                lines.append(line)
+        for encoding in ['utf-8', 'latin-1']:
+            lines = []
+            try:
+                with open(patchfile, 'r', encoding=encoding) as f:
+                    for line in f:
+                        if line.startswith('Index: ') or line.startswith('diff -') or line.startswith('---'):
+                            break
+                        lines.append(line)
+            except UnicodeDecodeError:
+                continue
+            break
+        else:
+            raise PatchError('Unable to find a character encoding to decode %s' % patchfile)
         return lines
 
     @staticmethod
-- 
2.5.5


