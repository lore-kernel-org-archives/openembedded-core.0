Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CC60471A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:52:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 12 Dec 2016 05:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,336,1477983600"; d="scan'208";a="1080746568"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2016 05:52:45 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 7C7AA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 05:51:58 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 15:48:04 +0200
Message-Id: <1481550484-3360-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] sstatesig: don't squash dependencies of useradd packages
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
X-List-Received-Date: Mon, 12 Dec 2016 13:52:46 -0000

Without this change, sstate dependency filter squashes dependencies
of packages which inherits useradd class. That causes failures while
rebuilding it for another MACHINE.

Fixes [YOCTO #8078]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/lib/oe/sstatesig.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 8224e3a..88b2290 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -17,6 +17,9 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isAllArch(fn):
         inherits = " ".join(dataCache.inherits[fn])
         return "/allarch.bbclass" in inherits
+    def isUserAdd(fn):
+        inherits = " ".join(dataCache.inherits[fn])
+        return "/useradd.bbclass" in inherits
     def isImage(fn):
         return "/image.bbclass" in " ".join(dataCache.inherits[fn])
 
@@ -39,6 +42,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 
     # Only target packages beyond here
 
+    # Don't squash the dependencies of packages inheritting useradd class
+    if  isUserAdd(fn):
+        return True
+
     # allarch packagegroups are assumed to have well behaved names which don't change between architecures/tunes
     if isPackageGroup(fn) and isAllArch(fn) and not isNative(depname):
         return False  
-- 
2.4.0


