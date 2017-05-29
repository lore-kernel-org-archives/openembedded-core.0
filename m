Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EFC1977F90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 05:16:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2017 22:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,412,1491289200"; d="scan'208";a="1153993622"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2017 22:16:07 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 29 May 2017 13:16:18 +0800
Message-Id: <1496034979-99713-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 1/2] devshell.bbclass: ensure toolchains available for do_devshell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 May 2017 05:16:07 -0000

Toolchains are required to be prepopulated in sysroot before
entering devshell.

[YOCTO #11464]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/classes/devshell.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 4de7ea6..770dcbd 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -32,7 +32,16 @@ python () {
        # can't manipulate the environment and variables here yet (see YOCTO #4795)
        d.setVarFlag("do_devshell", "manualfakeroot", "1")
        d.delVarFlag("do_devshell", "fakeroot")
-} 
+
+    # We need to ensure that the toolchains are available in the sysroot
+    # when running devshell (see YOCTO #11464)
+    # We get the dependency for do_configure depends varflag and DEPENDS
+    # variable, then append it to do_devshell depends varflag
+    deps = d.getVarFlag('do_configure', 'depends') or ""
+    for x in bb.utils.explode_deps(d.getVar('DEPENDS') or ""):
+        deps += ' %s:do_populate_sysroot' % x
+    d.appendVarFlag('do_devshell', 'depends', deps)
+}
 
 def devpyshell(d):
 
-- 
2.7.4


