Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6AD7318C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:52:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2016 04:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="964240579"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2016 04:52:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 66D5E6A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:40:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 12:31:59 +0300
Message-Id: <b5a456055f062008b8e476b4ab7e714b916110d8.1461317156.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 1/6] wic: add --system-id wks option
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
X-List-Received-Date: Fri, 22 Apr 2016 11:52:28 -0000

Added new option --system-id to wks parser. The option
will be used to set partition system id.

[YOCTO #9096]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 8c3f808..10d0d7c 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -92,6 +92,24 @@ def cannedpathtype(arg):
         raise ArgumentTypeError("file not found: %s" % arg)
     return result
 
+def systemidtype(arg):
+    """
+    Custom type for ArgumentParser
+    Checks if the argument sutisfies system id requirements,
+    i.e. if it's one byte long integer > 0
+    """
+    error = "Invalid system type: %s. must be hex "\
+            "between 0x1 and 0xFF" % arg
+    try:
+        result = int(arg, 16)
+    except ValueError:
+        raise ArgumentTypeError(error)
+
+    if result <= 0 or result > 0xff:
+        raise ArgumentTypeError(error)
+
+    return arg
+
 class KickStart(object):
     """"Kickstart parser implementation."""
 
@@ -121,6 +139,7 @@ class KickStart(object):
         part.add_argument('--size', type=sizetype, default=0)
         part.add_argument('--source')
         part.add_argument('--sourceparams')
+        part.add_argument('--system-id', type=systemidtype)
         part.add_argument('--use-uuid', action='store_true')
         part.add_argument('--uuid')
 
-- 
2.1.4


