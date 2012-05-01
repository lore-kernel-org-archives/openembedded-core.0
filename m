Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFgj-000135-2D
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:12:43 +0200
Received: by qcso7 with SMTP id o7so1986282qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CXVwEvMcRTHOqN2kzxU7GUt/jbcFIrerih1WHuVOq64=;
	b=VZFKyTp9qrhAe0crKLq2NRSuUnUBj2qt2lwB8ryiIzjHChUabiMSSD6QjVaOEmS6eG
	hhCpRre1kaLa+UVLF0AKccIHil0ZkwPb/gQb2a3H9oPF3mbDVCd8va9fVTgMEfbcvKk3
	S0+Lqpvc2Kbu8YfwN4O4SVb0AP1IS0bgEPT5pvuf8JV505h30RG0HzNTPtz4lepn3sIA
	KAQ43KoX5PAQ4KAZWP78+xHf7vodmZM/Wxqy6jV7eKCuqoQ+JETyUKLt+tdY4GAAQ/iy
	MTYxnA8vJ+xJDtTleNvYq7CqWoV30FX82FQj0tSxjke4TehY+lHrlBgO+tjjdWzxa5WE
	OlmQ==
Received: by 10.60.22.10 with SMTP id z10mr35167032oee.16.1335888138593;
	Tue, 01 May 2012 09:02:18 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h2sm20758865obn.20.2012.05.01.09.02.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 09:02:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 11:02:44 -0500
Message-Id: <42995edf6598222a5759f17a584325c37feb233a.1335888041.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
Subject: [PATCH 5/6] bitbake.conf: shift build config summary control to here
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
X-List-Received-Date: Tue, 01 May 2012 16:12:43 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/base.bbclass |   48 ++++++++++++++++++++++++++++++--------------
 meta/conf/bitbake.conf    |    7 ++++++
 2 files changed, 40 insertions(+), 15 deletions(-)

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
 
-		needed_vars = [ "TARGET_ARCH", "TARGET_OS" ]
-		pesteruser = []
-		for v in needed_vars:
-			val = e.data.getVar(v, True)
-			if not val or val == 'INVALID':
-				pesteruser.append(v)
-		if pesteruser:
-			bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
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
1.7.7



