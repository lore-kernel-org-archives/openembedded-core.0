Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvzbK-0004jV-Ec
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 00:37:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 15:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41503281"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.108])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 15:32:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2011 23:32:46 +0100
Message-Id: <d353e993939f7c5d678633841c0460f27a3e8042.1314138692.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314138692.git.paul.eggleton@linux.intel.com>
References: <cover.1314138692.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1314138692.git.paul.eggleton@linux.intel.com>
References: <cover.1314138692.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/combo-layer: fix overzealous regex in default hook script
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
X-List-Received-Date: Tue, 23 Aug 2011 22:37:42 -0000

combo-layer's hook scripts are intended to modify patches as they pass
through; the default one adds a prefix with the component name and
a line with the component repo revision before the Signed-off-by;
however the script was also unintentionally modifying the contents of
patches *within* the patches passing through it, which resulted in
unexpected failures when the combo-layer script attempted to use
"git am" to apply them.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer-hook-default.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
index f03c4fa..e535d5f 100755
--- a/scripts/combo-layer-hook-default.sh
+++ b/scripts/combo-layer-hook-default.sh
@@ -9,5 +9,5 @@ patchfile=$1
 rev=$2
 reponame=$3
 
-sed -i -e "s#Subject: \[PATCH\] \(.*\)#Subject: \[PATCH\] $reponame: \1#" $patchfile
-sed -i -e "0,/Signed-off-by:/s#\(Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
+sed -i -e "s#^Subject: \[PATCH\] \(.*\)#Subject: \[PATCH\] $reponame: \1#" $patchfile
+sed -i -e "0,/^Signed-off-by:/s#\(Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
-- 
1.7.4.1



