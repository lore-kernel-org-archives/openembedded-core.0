Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 600FD7870D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 01:50:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 17:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,395,1515484800"; d="scan'208";a="206908207"
Received: from cthanang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.39])
	by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2018 17:50:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 14:49:57 +1300
Message-Id: <690ab4d326341a98938a8c4424229c18e0f511c3.1519609613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519609613.git.paul.eggleton@linux.intel.com>
References: <cover.1519609613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 4/8] devtool: finish: fix erroneously creating bbappend for relative paths
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
X-List-Received-Date: Mon, 26 Feb 2018 01:50:46 -0000

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
index 2dbb1976422..a962ebe09b4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1861,9 +1861,7 @@ def _get_layer(layername, d):
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
2.14.3


