Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQBv-0001VX-Kl
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410682"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:33 -0800
Message-Id: <523f4b2508e897e1703ec3096d2da84dd036c306.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/16] base.bbclass: add subversion-native to DEPENDS if there is svn:// in SRC_URI
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:15 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* in some cases this could cause circual dependency (ie if we decide to
  apr_svn.bb or something like that before subversion-native in dependency
  tree), Saul said he had such case, but I wasn't able to reproduce it
  here (here it builds subversion-native-1.7.0 fine).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f3f798f..ba1f230 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -401,8 +401,14 @@ python () {
                     bb.note("SKIPPING %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
-    # Git packages should DEPEND on git-native
     srcuri = d.getVar('SRC_URI', 1)
+    # Svn packages should DEPEND on subversion-native
+    if "svn://" in srcuri:
+        depends = d.getVarFlag('do_fetch', 'depends') or ""
+        depends = depends + " subversion-native:do_populate_sysroot"
+        d.setVarFlag('do_fetch', 'depends', depends)
+
+    # Git packages should DEPEND on git-native
     if "git://" in srcuri:
         depends = d.getVarFlag('do_fetch', 'depends') or ""
         depends = depends + " git-native:do_populate_sysroot"
-- 
1.7.6.4



