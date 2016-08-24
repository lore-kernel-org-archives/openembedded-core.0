Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9A09B731FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 10:16:20 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 24 Aug 2016 03:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,570,1464678000"; 
   d="scan'208";a="1076001"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 24 Aug 2016 03:16:20 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id 7E3486A4080;
	Wed, 24 Aug 2016 03:16:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 13:16:15 +0300
Message-Id: <1472033775-23995-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] combo-layer: python3: fix UnicodeDecodeError
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
X-List-Received-Date: Wed, 24 Aug 2016 10:16:22 -0000

check_patch function opens patch file in text mode. This causes
python3 to throw exception when calling readline():
    UnicodeDecodeError: 'utf-8' codec can't decode byte 0xa7 in position
                        NNNN: invalid start byte

Opening file in binary mode and using binary type instead of strings
should fix this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/combo-layer | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 8f57ba5..b90bfc8 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -482,32 +482,32 @@ def check_repo_clean(repodir):
         sys.exit(1)
 
 def check_patch(patchfile):
-    f = open(patchfile)
+    f = open(patchfile, 'rb')
     ln = f.readline()
     of = None
     in_patch = False
     beyond_msg = False
-    pre_buf = ''
+    pre_buf = b''
     while ln:
         if not beyond_msg:
-            if ln == '---\n':
+            if ln == b'---\n':
                 if not of:
                     break
                 in_patch = False
                 beyond_msg = True
-            elif ln.startswith('--- '):
+            elif ln.startswith(b'--- '):
                 # We have a diff in the commit message
                 in_patch = True
                 if not of:
                     print('WARNING: %s contains a diff in its commit message, indenting to avoid failure during apply' % patchfile)
-                    of = open(patchfile + '.tmp', 'w')
+                    of = open(patchfile + '.tmp', 'wb')
                     of.write(pre_buf)
-                    pre_buf = ''
-            elif in_patch and not ln[0] in '+-@ \n\r':
+                    pre_buf = b''
+            elif in_patch and not ln[0] in b'+-@ \n\r':
                 in_patch = False
         if of:
             if in_patch:
-                of.write(' ' + ln)
+                of.write(b' ' + ln)
             else:
                 of.write(ln)
         else:
-- 
2.6.6


