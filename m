Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TiS0u-0006ZL-Rv
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 16:44:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2012 07:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,259,1355126400"; d="scan'208";a="260538268"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2012 07:29:18 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 17:29:42 +0200
Message-Id: <76c157858049dab2c0ad550f1d5d197bb95abe17.1355236839.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355236839.git.constantinx.musca@intel.com>
References: <cover.1355236839.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355236839.git.constantinx.musca@intel.com>
References: <cover.1355236839.git.constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 4/4] package.bbclass: prepend MLPREFIX to LOCALEBASEPN
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 15:44:57 -0000

We need to prepend MLPREFIX to LOCALEBASEPN in order to
fully enable multilib

[YOCTO #3440]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 993ce98..3f7e7bf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -432,7 +432,7 @@ python package_do_split_locales() {
         return
 
     dvar = d.getVar('PKGD', True)
-    pn = d.getVar('LOCALEBASEPN', True)
+    pn = "%s%s" % (d.getVar('MLPREFIX', True) or "", d.getVar('LOCALEBASEPN', True))
 
     if pn + '-locale' in packages:
         packages.remove(pn + '-locale')
-- 
1.7.11.7



