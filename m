Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sowlk-0000cG-8D
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 15:15:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2012 06:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="164251574"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.253])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2012 06:04:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 14:04:32 +0100
Message-Id: <2180f501590f39f8c84c553f158635c2526f099d.1342011575.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342011575.git.paul.eggleton@linux.intel.com>
References: <cover.1342011575.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1342011575.git.paul.eggleton@linux.intel.com>
References: <cover.1342011575.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] classes/rootfs_deb: use more reliable check for package existence
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
X-List-Received-Date: Wed, 11 Jul 2012 13:15:53 -0000

It turns out "apt-cache showpkg" does return some information when a
package does not exist but another package recommends it, which can
occur for empty *-dev packages; so use "apt-cache policy" with a
different line count instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/rootfs_deb.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 4ea71da..67871a9 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -111,7 +111,7 @@ list_package_recommends() {
 }
 
 rootfs_check_package_exists() {
-	if [ `apt-cache showpkg $1 | wc -l` -gt 2 ]; then
+	if [ `apt-cache policy $1 | wc -l` -gt 4 ]; then
 		echo $1
 	fi
 }
-- 
1.7.9.5



