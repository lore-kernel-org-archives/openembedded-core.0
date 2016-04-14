Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3576E681
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 08:24:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2016 01:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,484,1455004800"; d="scan'208";a="686085024"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.255.145.9])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2016 01:24:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 20:24:19 +1200
Message-Id: <4114b7c2d87b52c3c1feaa8328f28325baade784.1460622215.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460622215.git.paul.eggleton@linux.intel.com>
References: <cover.1460622215.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1460622215.git.paul.eggleton@linux.intel.com>
References: <cover.1460622215.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] devtool: upgrade: handle recipes where source is not first entry in SRC_URI
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
X-List-Received-Date: Thu, 14 Apr 2016 08:24:58 -0000

It is unusual but not impossible to find recipes whose first entry is
not the main source URL but instead some patch or other local file, for
example python-cryptography in meta-python (which sets SRC_URI before
inheriting pypi). There's nothing inherently wrong with this, and we
shouldn't assume that the first entry is the main source URL, so just
take the first non-local entry instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 680cbf1..a085f78 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -145,7 +145,15 @@ def _get_uri(rd):
     srcuris = rd.getVar('SRC_URI', True).split()
     if not len(srcuris):
         raise DevtoolError('SRC_URI not found on recipe')
-    srcuri = srcuris[0] # it is assumed, URI is at first position
+    # Get first non-local entry in SRC_URI - usually by convention it's
+    # the first entry, but not always!
+    srcuri = None
+    for entry in srcuris:
+        if not entry.startswith('file://'):
+            srcuri = entry
+            break
+    if not srcuri:
+        raise DevtoolError('Unable to find non-local entry in SRC_URI')
     srcrev = '${AUTOREV}'
     if '://' in srcuri:
         # Fetch a URL
-- 
2.5.5


