Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Rlcd1-0002XL-Cm
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 09:36:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Jan 2012 00:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="56075666"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jan 2012 00:29:18 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 16:31:37 +0800
Message-Id: <976bc7a0d816273809b4eb4c32eeec3a2678a798.1326443095.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326443095.git.dongxiao.xu@intel.com>
References: <cover.1326443095.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1326443095.git.dongxiao.xu@intel.com>
References: <cover.1326443095.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/3] package.bbclass: set package size into pkgdata for hob2's use
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
X-List-Received-Date: Fri, 13 Jan 2012 08:36:51 -0000

From: Shane Wang <shane.wang@intel.com>

Write the size of a package into its pkgdata for hob2 to get the size
and show on the UI for image making.

Signed-off-by: Shane Wang <shane.wang@intel.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f8f0a12..19616bd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1057,6 +1057,13 @@ python emit_pkgdata() {
 			f.write('%s: %s\n' % (var, encode(val)))
 		return
 
+	def get_directory_size(dir):
+		if os.listdir(dir):
+			size = int(os.popen('du -sk %s' % dir).readlines()[0].split('\t')[0])
+		else:
+			size = 0
+		return size
+
 	packages = d.getVar('PACKAGES', True)
 	pkgdest = d.getVar('PKGDEST', 1)
 	pkgdatadir = d.getVar('PKGDESTWORK', True)
@@ -1105,6 +1112,7 @@ python emit_pkgdata() {
 		for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
 			write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
+		sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
 		sf.close()
 
 
-- 
1.7.0.4



