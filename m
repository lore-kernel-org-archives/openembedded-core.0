Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CF0C177407
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:14:00 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2016 03:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114724099"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 03:14:01 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 5E49D6A4008
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:59 +0300
Message-Id: <43ef4c1253ff2852deee2529f8d067c7fe414f28.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 13/16] dirsize: python3: fix TypeError: unorderable types
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
X-List-Received-Date: Thu, 02 Jun 2016 10:14:01 -0000

Python 3 ignores the __cmp__() method and doesn't have cmp() builtin
function. This caused sorted() call to raise
    TypeError: unorderable types: Record() < Record()

Removing __cmp__ method and implementing __lt__ should solve the
problem as __lt__ is the only method needed for sort[ed] to work.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/tiny/dirsize.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/scripts/tiny/dirsize.py b/scripts/tiny/dirsize.py
index 5329b86..0b4fbd1 100755
--- a/scripts/tiny/dirsize.py
+++ b/scripts/tiny/dirsize.py
@@ -52,20 +52,16 @@ class Record:
         self.size = 0
         self.records = []
 
-    def __cmp__(this, that):
+    def __lt__(this, that):
         if that is None:
-            return 1
+            return False
         if not isinstance(that, Record):
             raise TypeError
         if len(this.records) > 0 and len(that.records) == 0:
-            return -1
-        if len(this.records) == 0 and len(that.records) > 0:
-            return 1
-        if this.size < that.size:
-            return -1
+            return False
         if this.size > that.size:
-            return 1
-        return 0
+            return False
+        return True
 
     def show(self, minsize):
         total = 0
-- 
2.1.4


