Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5F277A8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 14:57:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2018 07:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; d="scan'208";a="63922112"
Received: from bucksteg-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.38.111])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2018 07:57:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 16:56:50 +0200
Message-Id: <69f22f2384c53f5cef4cafb5b66f8d25c42247e9.1531320900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1531320900.git.paul.eggleton@linux.intel.com>
References: <cover.1531320900.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] classes/buildhistory: handle packaged files with names containing spaces
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
X-List-Received-Date: Wed, 11 Jul 2018 14:57:10 -0000

The FILELIST field of the package info file in the buildhistory
repository is a space-separated list of all of the files in the package.
If a name of a file packaged by a recipe contains a space character then
of course the result was that we didn't handle its name properly. To fix
that, use quotes around any filename containing spaces and at the other
end use these quotes to extract the proper entries.

Fixes [YOCTO #12742].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass    |  3 ++-
 meta/lib/oe/buildhistory_analysis.py | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 63980f72a52..2e5213e66ec 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -77,6 +77,7 @@ python buildhistory_emit_pkghistory() {
 
     import re
     import json
+    import shlex
     import errno
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
@@ -287,7 +288,7 @@ python buildhistory_emit_pkghistory() {
         dictval = json.loads(val)
         filelist = list(dictval.keys())
         filelist.sort()
-        pkginfo.filelist = " ".join(filelist)
+        pkginfo.filelist = " ".join([shlex.quote(x) for x in filelist])
 
         pkginfo.size = int(pkgdata['PKGSIZE'])
 
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ff7815d7c94..ad7fceb8bbc 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -13,6 +13,7 @@ import os.path
 import difflib
 import git
 import re
+import shlex
 import hashlib
 import collections
 import bb.utils
@@ -115,10 +116,13 @@ class ChangeRecord:
                 aitems = pkglist_combine(depvera)
                 bitems = pkglist_combine(depverb)
             else:
-                aitems = self.oldvalue.split()
-                bitems = self.newvalue.split()
                 if self.fieldname == 'FILELIST':
+                    aitems = shlex.split(self.oldvalue)
+                    bitems = shlex.split(self.newvalue)
                     renamed_dirs, aitems, bitems = detect_renamed_dirs(aitems, bitems)
+                else:
+                    aitems = self.oldvalue.split()
+                    bitems = self.newvalue.split()
 
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
@@ -409,9 +413,13 @@ def compare_dict_blobs(path, ablob, bblob, report_all, report_ver):
                     (depvera, depverb) = compare_pkg_lists(astr, bstr)
                     if depvera == depverb:
                         continue
-                alist = astr.split()
+                if key == 'FILELIST':
+                    alist = shlex.split(astr)
+                    blist = shlex.split(bstr)
+                else:
+                    alist = astr.split()
+                    blist = bstr.split()
                 alist.sort()
-                blist = bstr.split()
                 blist.sort()
                 # We don't care about the removal of self-dependencies
                 if pkgname in alist and not pkgname in blist:
-- 
2.17.1


