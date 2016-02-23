Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7D61077333
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 11:36:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2016 03:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="892595220"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2016 03:36:25 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 13:36:23 +0200
Message-Id: <1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 23 Feb 2016 11:36:34 -0000

Make sure that we have a pristine source tree after do_unpack.

[YOCTO #9064]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/base.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1372f38..717a01e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -140,12 +140,10 @@ python base_do_unpack() {
 
     rootdir = d.getVar('WORKDIR', True)
 
-    # Ensure that we cleanup ${S}/patches
-    # TODO: Investigate if we can remove
-    # the entire ${S} in this case.
+    # Cleanup ${S}
     s_dir = d.getVar('S', True)
-    p_dir = os.path.join(s_dir, 'patches')
-    bb.utils.remove(p_dir, True)
+    if s_dir != rootdir and not d.getVar("EXTERNALSRC", True):
+        bb.utils.remove(s_dir, True)
 
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
-- 
2.6.2


