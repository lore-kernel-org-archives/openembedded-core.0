Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxInz-0005Be-OG
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:52:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Feb 2012 05:44:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117410032"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:44:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:44:05 +0000
Message-Id: <aad30e9967067a16b41bf2397b4b5750fa1985a6.1329226937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] scripts/combo-layer: avoid saving last revision if unchanged
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Feb 2012 13:52:28 -0000

If we are running an update and the last revision hasn't changed since
the last update, don't write to the configuration file. This avoids
committing the config file with no changes other than spontaneous
reordering of sections, which sometimes occurs due to the behaviour of
the internal dictionary in Python's ConfigParser class. (This can be
fixed properly but the fix is only easy in Python 2.7+ due to the
availability there of the collections.OrderedDict class, and we
currently want to be compatible with 2.6.x as well.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 8fb27f6..7457ba2 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -283,7 +283,8 @@ def apply_patchlist(conf, repos):
                     logger.info("After applying, run this tool again to apply the remaining patches")
                     conf.update(name, "last_revision", lastrev)
                     sys.exit(0)
-        conf.update(name, "last_revision", lastrev)
+        if lastrev != repo['last_revision']:
+            conf.update(name, "last_revision", lastrev)
 
 def action_splitpatch(conf, args):
     """
-- 
1.7.5.4



