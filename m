Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A1FF07881A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:03:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026556"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:02:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:12 +1300
Message-Id: <868218b6b3e777aa89efdb579c9faab25d1beedb.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519354910.git.paul.eggleton@linux.intel.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/8] devtool: finish: fix erroneously creating bbappend for relative paths
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
X-List-Received-Date: Fri, 23 Feb 2018 03:03:01 -0000

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
index 0c31e1768cf..6cd52fe4f68 100644
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


