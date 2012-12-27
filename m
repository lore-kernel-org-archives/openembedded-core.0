Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToERW-0001tt-JI
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 15:28:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2012 06:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,362,1355126400"; d="scan'208";a="239466215"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2012 06:13:22 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 16:13:54 +0200
Message-Id: <b02b1965f4646137798d065b7047f8a3a5831b2d.1356617488.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
Subject: [PATCH 3/6] package.bbclass: don't prepend MLPREFIX to LOCALEBASEPN
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
X-List-Received-Date: Thu, 27 Dec 2012 14:28:20 -0000

- all the recipes that overwrite LOCALEBASEPN must consider
also the MLPREFIX
- if the LOCALEBASEPN variable is not overwritten then it will
have the correct prefix (LOCALEBASEPN ??= "${PN}")

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9885d94..8a94e30 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -438,7 +438,7 @@ python package_do_split_locales() {
         return
 
     dvar = d.getVar('PKGD', True)
-    pn = "%s%s" % (d.getVar('MLPREFIX', True) or "", d.getVar('LOCALEBASEPN', True))
+    pn = d.getVar('LOCALEBASEPN', True)
 
     if pn + '-locale' in packages:
         packages.remove(pn + '-locale')
-- 
1.7.11.7



