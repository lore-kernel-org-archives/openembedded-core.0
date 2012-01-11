Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkoZB-0005eO-HK
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 04:09:33 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jan 2012 19:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105790090"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jan 2012 19:02:03 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 11:04:13 +0800
Message-Id: <589f74c4c0832a3cc42daa656da2996764186463.1326249734.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/5] package.bbclass: set package size into pkgdata for hob2's use
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
X-List-Received-Date: Wed, 11 Jan 2012 03:09:33 -0000

From: Shane Wang <shane.wang@intel.com>

Write the size of a package into its pkgdata for hob2 to get the size
and show on the UI for image making.

Signed-off-by: Shane Wang <shane.wang@intel.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9040eb4..8bde0b3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1042,6 +1042,13 @@ python emit_pkgdata() {
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
@@ -1090,6 +1097,7 @@ python emit_pkgdata() {
 		for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
 			write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
+		sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
 		sf.close()
 
 
-- 
1.7.0.4



