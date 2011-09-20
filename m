Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6A3R-0006Tg-PT
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 01:48:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 16:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50889693"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2011 16:43:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 16:43:17 -0700
Message-Id: <80ef3b7b21b3280dc9d4f69879df5807ac139405.1316562083.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316562083.git.sgw@linux.intel.com>
References: <cover.1316562083.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316562083.git.sgw@linux.intel.com>
References: <cover.1316562083.git.sgw@linux.intel.com>
Subject: [RC Fixes 1/8] scripts/combo-layer: fix still overzealous regex in default hook script
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
X-List-Received-Date: Tue, 20 Sep 2011 23:48:46 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
1.7.6



