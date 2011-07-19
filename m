Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3Z-0001dy-1F
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396946"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:51:01 -0700
Message-Id: <c878650fba77994c00db01b4b9999fd70818544e.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/22] Fixed concurrency problem for ZIP packed recipes.
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:53 -0000

From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

The problem occured when unzip-native is not yet staged, and ZIP
archive unpacking already started resulting in failed do_unpack task.
Added NEED_UNZIP_FOR_UNPACK variable to use in recipes which do_unpack
with unzip utility but doesn't have '.zip' in SRC_URI (f.e. .EXE
windows self-extraction binaries).

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
Signed-off-by: Koen Kooi <koen@openembedded.org>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/base.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3ca4e47..56f744d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -354,6 +354,15 @@ python () {
         depends = depends + " xz-native:do_populate_sysroot"
         bb.data.setVarFlag('do_unpack', 'depends', depends, d)
 
+    # unzip-native should already be staged before unpacking ZIP recipes
+    need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
+    src_uri = bb.data.getVar('SRC_URI', d, 1)
+
+    if ".zip" in src_uri or need_unzip == "1":
+        depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
+        depends = depends + " unzip-native:do_populate_sysroot"
+        bb.data.setVarFlag('do_unpack', 'depends', depends, d)
+
     # 'multimachine' handling
     mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
     pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
-- 
1.7.3.4



