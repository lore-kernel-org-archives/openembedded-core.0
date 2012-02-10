Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlya-0001XA-3W
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213846"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:37 -0800
Message-Id: <1747d68198772177dd825843b09a1147bbd65d47.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/20] cross.bbclass: add virtclass handler
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:04 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Allow use of BBCLASSEXTEND with 'cross' and use of virtclass-cross in
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/cross.bbclass |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 5681ab9..8da3048 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -55,6 +55,23 @@ libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}"
 
+python cross_virtclass_handler () {
+    if not isinstance(e, bb.event.RecipePreFinalise):
+        return
+
+    classextend = e.data.getVar('BBCLASSEXTEND', True) or ""
+    if "cross" not in classextend:
+        return
+
+    pn = e.data.getVar("PN", True)
+    if not pn.endswith("-cross"):
+        return
+
+    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-cross", e.data)
+}
+
+addhandler cross_virtclass_handler
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 }
-- 
1.7.6.5



