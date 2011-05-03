Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJR-0001in-RY
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2011 16:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="917582067"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2011 16:44:53 -0700
Message-Id: <e24fb20e93b278115a784dd1c9620a70db564a9e.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 11:28:08 -0700
Date: Tue, 03 May 2011 16:44:52 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 24/33] insane.bbclass: Checking for NLS too when checking gettext dependency
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
X-List-Received-Date: Tue, 03 May 2011 23:47:30 -0000

From: Khem Raj <raj.khem@gmail.com>

Checking for gettext is not needed when --disable-nls is used

Let user know what variant of gettext is missing e.g. gettext-native,
gettext-nativesdk etc, reveals a bit more for user

Check for virtual/gettext

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 98acf7f..742be5e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -578,20 +578,21 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
         if "configure.in" in files:
             configs.append(os.path.join(root, "configure.in"))
 
-    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True):
+    cnf = bb.data.getVar('EXTRA_OECONF', d, True) or ""
+    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True) and "--disable-nls" not in cnf:
        if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
           gt = "gettext-native"
        elif bb.data.inherits_class('cross-canadian', d):
           gt = "gettext-nativesdk"
        else:
-          gt = "gettext"
+          gt = "virtual/gettext"
        deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
        if gt not in deps:
           for config in configs:
               gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
               if os.system(gnu) == 0:
-                 bb.fatal("""Gettext required but not in DEPENDS for file %s.
-Missing inherit gettext?""" % config)
+                 bb.fatal("""%s required but not in DEPENDS for file %s.
+Missing inherit gettext?""" % (gt, config))
 
     if not package_qa_check_license(workdir, d):
         bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
-- 
1.7.4.1



