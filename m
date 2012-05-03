Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQV-0006gj-Dk
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772185"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:28 -0700
Message-Id: <9c79252878c458a620b6a9465742fd989b6da472.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/36] bitbake.conf: shift build config summary control to here
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
X-List-Received-Date: Thu, 03 May 2012 02:05:51 -0000

From: Christopher Larson <kergoth@gmail.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/base.bbclass |   50 ++++++++++++++++++++++++++++++--------------
 meta/conf/bitbake.conf    |    7 ++++++
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a984eae..07ef9a2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -225,6 +225,27 @@ def get_layers_branch_rev(d):
 	return layers_branch_rev
 
 
+BUILDCFG_FUNCS ??= "buildcfg_vars get_layers_branch_rev buildcfg_neededvars"
+BUILDCFG_FUNCS[type] = "list"
+
+def buildcfg_vars(d):
+	statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
+	for var in statusvars:
+		value = d.getVar(var, True)
+		if value is not None:
+			yield '%-17s = "%s"' % (var, value)
+
+def buildcfg_neededvars(d):
+	needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
+	pesteruser = []
+	for v in needed_vars:
+		val = d.getVar(v, True)
+		if not val or val == 'INVALID':
+			pesteruser.append(v)
+
+	if pesteruser:
+		bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
+
 addhandler base_eventhandler
 python base_eventhandler() {
 	from bb.event import getName
@@ -232,22 +253,19 @@ python base_eventhandler() {
 	name = getName(e)
 
 	if name.startswith("BuildStarted"):
-		e.data.setVar( 'BB_VERSION', bb.__version__)
-		statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TUNE_FEATURES', 'TARGET_FPU']
-		statuslines = ["%-17s = \"%s\"" % (i, e.data.getVar(i, True) or '') for i in statusvars]
-
-		statuslines += get_layers_branch_rev(e.data)
-		statusmsg = "\nOE Build Configuration:\n%s\n" % '\n'.join(statuslines)
-		bb.plain(statusmsg)
-
-		needed_vars = [ "TARGET_ARCH", "TARGET_OS" ]
-		pesteruser = []
-		for v in needed_vars:
-			val = e.data.getVar(v, True)
-			if not val or val == 'INVALID':
-				pesteruser.append(v)
-		if pesteruser:
-			bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
+		e.data.setVar('BB_VERSION', bb.__version__)
+		statuslines = []
+		for func in oe.data.typed_value('BUILDCFG_FUNCS', e.data):
+			g = globals()
+			if func not in g:
+				bb.warn("Build configuration function '%s' does not exist" % func)
+			else:
+				flines = g[func](e.data)
+				if flines:
+					statuslines.extend(flines)
+
+		statusheader = e.data.getVar('BUILDCFG_HEADER', True)
+		bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
         if name == "ConfigParsed":
                 generate_git_config(e)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9f4e4d4..dc68690 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -609,6 +609,13 @@ export PATCH_GET="0"
 # Not sure about the rest of this yet.
 ##################################################################
 
+# Pre-build configuration output
+BUILDCFG_HEADER = "Build Configuration:"
+BUILDCFG_VARS = "BB_VERSION TARGET_ARCH TARGET_OS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
+BUILDCFG_VARS[type] = "list"
+BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
+BUILDCFG_NEEDEDVARS[type] = "list"
+
 # Other
 
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}/${libdir}/pkgconfig"
-- 
1.7.7.6



