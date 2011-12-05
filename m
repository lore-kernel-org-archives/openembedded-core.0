Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RXdNb-0000wP-UH
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 19:35:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 10:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,300,1320652800"; d="scan'208";a="44067117"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.228])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Dec 2011 10:28:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 18:28:12 +0000
Message-Id: <8651be5fb600a2d20acaf3c7b6848f7855bd2b75.1323109431.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1323109431.git.paul.eggleton@linux.intel.com>
References: <cover.1323109431.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323109431.git.paul.eggleton@linux.intel.com>
References: <cover.1323109431.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/buildhistory: do not save old packagehistory files by default
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
X-List-Received-Date: Mon, 05 Dec 2011 18:35:08 -0000

Disable storing package history as version named files unless
BUILDHISTORY_KEEP_VERSIONS is set to 1; otherwise the adds of these
files that duplicate what is already in git anyway is just noise in the
git log.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 1859961..e4534e9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -258,8 +258,13 @@ def write_latestlink(pkg, pe, pv, pr, d):
 		filedir = os.path.join(pkghistdir, pkg)
 	else:
 		filedir = pkghistdir
-	rm_link(os.path.join(filedir, "latest"))
-	shutil.copy(os.path.join(filedir, "%s:%s-%s" % (pe, pv, pr)), os.path.join(filedir, "latest"))
+	latest_file = os.path.join(filedir, "latest")
+	ver_file = os.path.join(filedir, "%s:%s-%s" % (pe, pv, pr))
+	rm_link(latest_file)
+	if d.getVar('BUILDHISTORY_KEEP_VERSIONS', True) == '1':
+		shutil.copy(ver_file, latest_file)
+	else:
+		shutil.move(ver_file, latest_file)
 
 
 buildhistory_get_image_installed() {
-- 
1.7.5.4



