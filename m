Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEd-0005Qv-Po
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="634683336"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 00:29:59 -0700
Message-Id: <ee54f2998bde83872fa1f48c4b1f55f7dfc5774b.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 11:28:08 -0700
Date: Wed, 27 Apr 2011  0:29:59 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 38/52] insane.bbclass: Checking for NLS too when checking gettext dependency
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:33 -0000

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
1.7.1.1



