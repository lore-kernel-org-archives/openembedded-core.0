Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7EA77CFA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 22:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491516114; x=1523052114;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=TtGzeNVAGRlweR1ZTSsVXkQ/zCaeXzkgUo54SK0zGyA=;
	b=IbOM0XE7brwjSZIRDGjvZnTSipr52dTdnpueU4H4EsL/qhkYyPUqrfel
	RcVXl+R7sGPwutkQX+pLiGLR3IqjCQ==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 15:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,161,1488873600"; d="scan'208";a="953035290"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2017 15:01:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 10:01:43 +1200
Message-Id: <cd7119c32021febffcc4524ff204bf13290c5cf4.1491515976.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491515976.git.paul.eggleton@linux.intel.com>
References: <cover.1491515976.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] lib/oe/sstatesig: fix finding native siginfo files in sstate-cache
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
X-List-Received-Date: Thu, 06 Apr 2017 22:01:53 -0000

When comparing signatures with bitbake-diffsigs -t or bitbake -S
printdiff, we use this find_siginfo() function implemented in this
module to find the siginfo/sigdata files corresponding to the tasks
we're looking for. However, native sstate files go into a
NATIVELSBSTRING subdirectory and there was no handling for this when
asking about native recipes.

I'm not even sure why we were walking SSTATE_DIR in order to find
this - we don't need to, we just need to run glob.glob() on the filespec
we calculate, which should be a little bit more efficient.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 13fd3bd..a76a031 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -318,22 +318,15 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             sstatename = taskname[3:]
             filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG'), sstatename)
 
-            if hashval != '*':
-                sstatedir = "%s/%s" % (d.getVar('SSTATE_DIR'), hashval[:2])
-            else:
-                sstatedir = d.getVar('SSTATE_DIR')
-
-            for root, dirs, files in os.walk(sstatedir):
-                for fn in files:
-                    fullpath = os.path.join(root, fn)
-                    if fnmatch.fnmatch(fullpath, filespec):
-                        if taskhashlist:
-                            hashfiles[hashval] = fullpath
-                        else:
-                            try:
-                                filedates[fullpath] = os.stat(fullpath).st_mtime
-                            except:
-                                continue
+            matchedfiles = glob.glob(filespec)
+            for fullpath in matchedfiles:
+                if taskhashlist:
+                    hashfiles[hashval] = fullpath
+                else:
+                    try:
+                        filedates[fullpath] = os.stat(fullpath).st_mtime
+                    except:
+                        continue
 
     if taskhashlist:
         return hashfiles
-- 
2.9.3


