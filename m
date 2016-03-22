Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 777CF6E65F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:47:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2016 09:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,377,1455004800"; d="scan'208";a="71227576"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2016 09:47:01 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 18:47:00 +0200
Message-Id: <1458665220-26223-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH v3] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 22 Mar 2016 16:47:05 -0000

Make sure that we have a pristine source tree after do_unpack.

[YOCTO #9064]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/base.bbclass | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e066dc9..2acb2b6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -133,23 +133,15 @@ python base_do_fetch() {
 
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
+do_unpack[cleandirs] = "${@d.getVar('S', True) if d.getVar('S', True) != d.getVar('WORKDIR', True) else os.path.join(d.getVar('S', True), 'patches')}"
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI', True) or "").split()
     if len(src_uri) == 0:
         return
 
-    rootdir = d.getVar('WORKDIR', True)
-
-    # Ensure that we cleanup ${S}/patches
-    # TODO: Investigate if we can remove
-    # the entire ${S} in this case.
-    s_dir = d.getVar('S', True)
-    p_dir = os.path.join(s_dir, 'patches')
-    bb.utils.remove(p_dir, True)
-
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
-        fetcher.unpack(rootdir)
+        fetcher.unpack(d.getVar('WORKDIR', True))
     except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
 }
-- 
2.6.2


