Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9207678757
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:39 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181355864"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:12 +1300
Message-Id: <74154b4da32cff6d3d3ec002ae742f6bf272ceb1.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/12] devtool: finish: fix erroneously creating bbappend for relative paths
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:39 -0000

After OE-Core rev 5e3fe00a0233d563781849a44f53885b4e924a9c we call
os.path.abspath() on the original layer path, but we later compare that
to the destination layer path. If that layer path isn't absolute but is
effectively the same path, it should be writing to the original recipe
but because we weren't making it absolute we were writing a bbappend
instead. Call os.path.abspath() on the destination path as well to avoid
that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f59c6d6..cdd2346 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1848,9 +1848,7 @@ def _get_layer(layername, d):
         layerdir = layers.get('meta', None)
     else:
         layerdir = layers.get(layername, None)
-    if layerdir:
-        layerdir = os.path.abspath(layerdir)
-    return layerdir or layername
+    return os.path.abspath(layerdir or layername)
 
 def finish(args, config, basepath, workspace):
     """Entry point for the devtool 'finish' subcommand"""
-- 
2.9.5


