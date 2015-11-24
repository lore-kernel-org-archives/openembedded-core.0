Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE85B6057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 21:54:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Nov 2015 13:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,340,1444719600"; d="scan'208";a="858701774"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.171])
	by orsmga002.jf.intel.com with ESMTP; 24 Nov 2015 13:54:18 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Nov 2015 15:55:05 -0600
Message-Id: <1448402105-20832-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] classes/sstate.bbclass: checkhashes modify to take into account siginfo.
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
X-List-Received-Date: Tue, 24 Nov 2015 21:54:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When sstate file exists but not siginfo one then sstate need to be marked as
 non-available to avoid post FetchError's when trying to download siginfo.

For example,

   WARNING: Failed to fetch URL
   file://3b/sstate:gcc::5.2.0:r0::3:3bb8ffd234f7eb3709b5447f1f82d6d0_populate_lic.tgz.siginfo,
   attempting MIRRORS if available

   ERROR: Fetcher failure: Unable to find file
   file://3b/sstate:gcc::5.2.0:r0::3:3bb8ffd234f7eb3709b5447f1f82d6d0_populate_lic.tgz.siginfo
   anywhere. The paths that were searched were:
       /home/alimon/repos/poky/build-x86/sstate-cache
       /home/alimon/repos/poky/build-x86/sstate-cache

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/sstate.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d09e27a..b41860b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -763,12 +763,15 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             (task, sstatefile) = arg
 
             localdata2 = bb.data.createCopy(localdata)
-            srcuri = "file://" + sstatefile
+            uris = ['file://{0}'.format(sstatefile),
+                    'file://{0}.siginfo'.format(sstatefile)]
+            srcuri = '\t'.join(uris)
+
             localdata.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             try:
-                fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
+                fetcher = bb.fetch2.Fetch(uris, localdata2,
                             connection_cache=thread_worker.connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
-- 
2.1.4


