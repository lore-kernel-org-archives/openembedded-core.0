Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U0zmu-0003AC-Uc
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 20:27:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jan 2013 11:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,578,1355126400"; d="scan'208";a="255598957"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.100])
	by orsmga001.jf.intel.com with ESMTP; 31 Jan 2013 11:11:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2013 11:11:20 -0800
Message-Id: <1359659480-8210-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] gtk-icon-cache: Fix rdepends construction
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
X-List-Received-Date: Thu, 31 Jan 2013 19:27:20 -0000

The rdepends getVar is returning NoneType and the string constuction fails
this occurs with the hicolor-icon-theme recipe.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index d5fdcd5..cf33efd 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -67,9 +67,8 @@ python populate_packages_append () {
             continue
 
         bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
-        rdepends = d.getVar('RDEPENDS_%s' % pkg, True)
-        rdepends = rdepends + ' ' + d.getVar('MLPREFIX') + "hicolor-icon-theme"
-        d.setVar('RDEPENDS_%s' % pkg, rdepends)
+        rdepends = ' ' + d.getVar('MLPREFIX') + "hicolor-icon-theme"
+        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
     
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
         
-- 
1.7.10.4



