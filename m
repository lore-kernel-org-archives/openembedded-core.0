Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1S0ZBA-0000iK-JK
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 14:57:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 05:49:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120527786"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2012 05:49:30 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 21:48:06 +0800
Message-Id: <c0d34f10bc9e3bbb6ab65a0eaba8d7fdbc7f3828.1330003047.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330003047.git.dongxiao.xu@intel.com>
References: <cover.1330003047.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1330003047.git.dongxiao.xu@intel.com>
References: <cover.1330003047.git.dongxiao.xu@intel.com>
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
X-List-Received-Date: Thu, 23 Feb 2012 13:57:52 -0000

From: Shane Wang <shane.wang@intel.com>

Write the size of a package into its pkgdata for hob2 to get the size
and show on the UI for image making.

Signed-off-by: Shane Wang <shane.wang@intel.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f6d6e1a..f5606d6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1054,6 +1054,13 @@ python emit_pkgdata() {
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
@@ -1102,6 +1109,7 @@ python emit_pkgdata() {
 		for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
 			write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
+		sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
 		sf.close()
 
 
-- 
1.7.4.1



