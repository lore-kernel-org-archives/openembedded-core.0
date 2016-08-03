Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2A255731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 07:28:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2016 00:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="149808999"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2016 00:28:41 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 10:28:40 +0300
Message-Id: <1470209320-20006-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470209320-20006-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470209320-20006-1-git-send-email-markus.lehtonen@linux.intel.com>
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
X-List-Received-Date: Wed, 03 Aug 2016 07:28:52 -0000

Make sure that we have a pristine source tree after do_unpack.

[YOCTO #9064]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/base.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5d8e8d6..39acd1e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -136,23 +136,22 @@ python base_do_fetch() {
 
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
+
+python () {
+    if d.getVar('S', True) != d.getVar('WORKDIR', True):
+        d.setVarFlag('do_unpack', 'cleandirs', '${S}')
+    else:
+        d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}', 'patches'))
+}
+
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
2.6.6


