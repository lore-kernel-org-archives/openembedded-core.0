Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 220F960069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040327"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:10 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:27:58 +0300
Message-Id: <1475159288-31921-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 01/11] scripts/buildstats-diff: check that the given directory exists
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:10 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 8ee2aaf..d0cd766 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -115,11 +115,14 @@ def read_buildstats_dir(bs_dir):
 
     if os.path.isfile(os.path.join(bs_dir, 'build_stats')):
         top_dir = bs_dir
-    else:
+    elif os.path.exists(bs_dir):
         subdirs = sorted(glob.glob(bs_dir + '/*'))
         if len(subdirs) > 1:
             log.warning("Multiple buildstats found, using the first one")
         top_dir = subdirs[0]
+    else:
+        log.error("No such directory: %s", bs_dir)
+        sys.exit(1)
     log.debug("Reading buildstats directory %s", top_dir)
     subdirs = os.listdir(top_dir)
 
-- 
2.6.6


