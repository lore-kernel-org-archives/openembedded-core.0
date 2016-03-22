Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 205336FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 07:24:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 22 Mar 2016 00:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,376,1455004800"; d="scan'208";a="929187918"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2016 00:24:35 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 09:24:33 +0200
Message-Id: <1458631473-22563-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1458631473-22563-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1458631473-22563-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 22 Mar 2016 07:24:45 -0000

Make sure that we have a pristine source tree after do_unpack.

[YOCTO #9064]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/base.bbclass | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1372f38..aa107d4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -133,23 +133,15 @@ python base_do_fetch() {
 
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
+do_unpack[cleandirs] = "${@d.getVar('S', True) if d.getVar('S', True) != d.getVar('WORKDIR', True) else ''}"
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


