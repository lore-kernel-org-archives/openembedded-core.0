Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D09B876FD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520420"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:30 +0100
Message-Id: <6526d17fe06f06a18296f6e616bd4d93b69d6ada.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 16/27] devtool: show proper error when extracting source for recipes with disabled unpack task
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:18 -0000

If you try to use "devtool modify -x" or "devtool extract" on a recipe
where do_unpack has been set as noexec (e.g. glibc-locale), then we get
an error because the expected source wasn't ever unpacked. Do a check up
front for noexec being set on do_unpack and error out with a reasonable
message if that's the case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 700a56b..72ec97b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -261,6 +261,10 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             raise DevtoolError("output path %s already exists and is "
                                "non-empty" % srctree)
 
+    if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
+        raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
+                           "extract source" % pn)
+
     # Prepare for shutil.move later on
     bb.utils.mkdirhier(srctree)
     os.rmdir(srctree)
-- 
2.1.0


