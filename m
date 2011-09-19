Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5emn-0007vS-S1
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 16:25:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 07:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50127358"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.110])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2011 07:20:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 15:20:08 +0100
Message-Id: <b1f7bdfc28f0197596b2e362e01c75e1152fa971.1316441889.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316441889.git.paul.eggleton@linux.intel.com>
References: <cover.1316441889.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316441889.git.paul.eggleton@linux.intel.com>
References: <cover.1316441889.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] scripts/combo-layer: fix still overzealous regex in default hook script
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
X-List-Received-Date: Mon, 19 Sep 2011 14:25:30 -0000

In the previous fix to this hook script (OE core revision
e7aae45414e4597e9244f86a81fbc940f73785c8) a start-of-line (^) marker was
missed, so if a commit had no Signed-off-by line but it contained an
inner patch that did, the inner patch was modified causing a "corrupt
patch" error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer-hook-default.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
index e535d5f..8b148ac 100755
--- a/scripts/combo-layer-hook-default.sh
+++ b/scripts/combo-layer-hook-default.sh
@@ -10,4 +10,4 @@ rev=$2
 reponame=$3
 
 sed -i -e "s#^Subject: \[PATCH\] \(.*\)#Subject: \[PATCH\] $reponame: \1#" $patchfile
-sed -i -e "0,/^Signed-off-by:/s#\(Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
+sed -i -e "0,/^Signed-off-by:/s#\(^Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
-- 
1.7.4.1



