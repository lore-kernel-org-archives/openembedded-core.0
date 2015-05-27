Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CBA2D6C6F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 12:58:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 27 May 2015 05:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,505,1427785200"; d="scan'208";a="498893970"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 27 May 2015 05:58:58 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5BFE46A4005;
	Wed, 27 May 2015 05:58:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 14:05:20 +0300
Message-Id: <1432724720-7255-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: refactored processing of wic exceptions
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
X-List-Received-Date: Wed, 27 May 2015 12:58:58 -0000

All wic exceptions are now inherited from new base exception
class WicError. It makes them easy to maintain and catch.

Processing of exceptions is done this way:
    Known wic exceptions cause wic to print error message to stdout.
    Unknown exceptions are not catched anymore and produce standard
    python traceback.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/errors.py | 34 ++++++++--------------------------
 scripts/wic                     | 11 +++++------
 2 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/wic/utils/errors.py b/scripts/lib/wic/utils/errors.py
index 9410311..d1b514d 100644
--- a/scripts/lib/wic/utils/errors.py
+++ b/scripts/lib/wic/utils/errors.py
@@ -16,32 +16,14 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
-class CreatorError(Exception):
-    """An exception base class for all imgcreate errors."""
-    keyword = '<creator>'
+class WicError(Exception):
+    pass
 
-    def __init__(self, msg):
-        self.msg = msg
+class CreatorError(WicError):
+    pass
 
-    def __str__(self):
-        if isinstance(self.msg, unicode):
-            self.msg = self.msg.encode('utf-8', 'ignore')
-        else:
-            self.msg = str(self.msg)
-        return self.keyword + self.msg
+class Usage(WicError):
+    pass
 
-class Usage(CreatorError):
-    keyword = '<usage>'
-
-    def __str__(self):
-        if isinstance(self.msg, unicode):
-            self.msg = self.msg.encode('utf-8', 'ignore')
-        else:
-            self.msg = str(self.msg)
-        return self.keyword + self.msg + ', please use "--help" for more info'
-
-class KsError(CreatorError):
-    keyword = '<kickstart>'
-
-class ImageError(CreatorError):
-    keyword = '<mount>'
+class ImageError(WicError):
+    pass
diff --git a/scripts/wic b/scripts/wic
index 90b36c6..cf96859 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -53,6 +53,7 @@ else:
     bitbake_main = None
 
 from wic.utils.oe.misc import find_bitbake_env_lines, set_bitbake_env_lines
+from wic.utils.errors import WicError
 from image import engine
 from image import help as hlp
 
@@ -309,10 +310,8 @@ def main(argv):
 
 if __name__ == "__main__":
     try:
-        ret = main(sys.argv[1:])
-    except Exception:
-        ret = 1
-        import traceback
-        traceback.print_exc()
-    sys.exit(ret)
+        sys.exit(main(sys.argv[1:]))
+    except WicError as err:
+        print >> sys.stderr, "ERROR:", err
+        sys.exit(1)
 
-- 
2.1.4


