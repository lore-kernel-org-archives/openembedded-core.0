Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQV-0006gd-M6
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772186"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:29 -0700
Message-Id: <79954d953dfb176e0bf90dc4b2e65485f87f9061.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/36] base.bbclass: use isinstance for base_eventhandler
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
X-List-Received-Date: Thu, 03 May 2012 02:05:52 -0000

From: Christopher Larson <kergoth@gmail.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/base.bbclass |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 07ef9a2..bb39b7b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -248,12 +248,13 @@ def buildcfg_neededvars(d):
 
 addhandler base_eventhandler
 python base_eventhandler() {
-	from bb.event import getName
-
-	name = getName(e)
-
-	if name.startswith("BuildStarted"):
+        if isinstance(e, bb.event.ConfigParsed):
 		e.data.setVar('BB_VERSION', bb.__version__)
+                generate_git_config(e)
+                pkgarch_mapping(e.data)
+                preferred_ml_updates(e.data)
+
+	if isinstance(e, bb.event.BuildStarted):
 		statuslines = []
 		for func in oe.data.typed_value('BUILDCFG_FUNCS', e.data):
 			g = globals()
@@ -266,11 +267,6 @@ python base_eventhandler() {
 
 		statusheader = e.data.getVar('BUILDCFG_HEADER', True)
 		bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
-
-        if name == "ConfigParsed":
-                generate_git_config(e)
-                pkgarch_mapping(e.data)
-                preferred_ml_updates(e.data)
 }
 
 addtask configure after do_patch
-- 
1.7.7.6



