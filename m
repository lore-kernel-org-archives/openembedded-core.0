Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E07C77CF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491516118; x=1523052118;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Cx4QSAtrNZxcGFn5CV5EFfzGIe8fdNjv/Nl6i1kobl0=;
	b=bSmcecvHaP01O6AYKhldr3BrLSgzfJexb5iCtsiySz106A1wCwLEZxc8
	OwNwxKHSl9ln269g0eGpRbcGjWFr9g==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 15:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,161,1488873600"; d="scan'208";a="953035331"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2017 15:01:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 10:01:44 +1200
Message-Id: <b54dd1059c3a501bf022d34a26a8d72dd1e05b78.1491515976.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491515976.git.paul.eggleton@linux.intel.com>
References: <cover.1491515976.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] lib/oe/sstatesig: avoid reporting duplicate siginfo files from sstate
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
X-List-Received-Date: Thu, 06 Apr 2017 22:01:56 -0000

In find_siginfo(), which is used by bitbake-diffsigs among other things,
avoid adding a siginfo file from the sstate-cache where we've already
collected a sigdata file from the stamps directory with the same hash.
This avoids the possibility that the top two files (as picked by default
using the bitbake-diffsigs -t option) are for the same signature and
thus the tool would report no differences. In order to do that, just use
the hashfiles dict that we already have - we just need to change the
code to populate that even if we're collecting matching files without
looking for a fixed set of hashes (i.e. taskhashlist isn't set).

This replaces previous code in bitbake-diffsigs that attempted to filter
these out with limited success.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index a76a031..8d93013 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -254,9 +254,6 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     import fnmatch
     import glob
 
-    if taskhashlist:
-        hashfiles = {}
-
     if not taskname:
         # We have to derive pn and taskname
         key = pn
@@ -266,8 +263,15 @@ def find_siginfo(pn, taskname, taskhashlist, d):
         if key.startswith('virtual:native:'):
             pn = pn + '-native'
 
+    hashfiles = {}
     filedates = {}
 
+    def get_hashval(siginfo):
+        if siginfo.endswith('.siginfo'):
+            return siginfo.rpartition(':')[2].partition('_')[0]
+        else:
+            return siginfo.rpartition('.')[2]
+
     # First search in stamps dir
     localdata = d.createCopy()
     localdata.setVar('MULTIMACH_TARGET_SYS', '*')
@@ -297,6 +301,8 @@ def find_siginfo(pn, taskname, taskhashlist, d):
                 filedates[fullpath] = os.stat(fullpath).st_mtime
             except OSError:
                 continue
+            hashval = get_hashval(fullpath)
+            hashfiles[hashval] = fullpath
 
     if not taskhashlist or (len(filedates) < 2 and not foundall):
         # That didn't work, look in sstate-cache
@@ -320,9 +326,11 @@ def find_siginfo(pn, taskname, taskhashlist, d):
 
             matchedfiles = glob.glob(filespec)
             for fullpath in matchedfiles:
-                if taskhashlist:
-                    hashfiles[hashval] = fullpath
-                else:
+                actual_hashval = get_hashval(fullpath)
+                if actual_hashval in hashfiles:
+                    continue
+                hashfiles[hashval] = fullpath
+                if not taskhashlist:
                     try:
                         filedates[fullpath] = os.stat(fullpath).st_mtime
                     except:
-- 
2.9.3


