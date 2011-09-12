Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R31xk-0001dG-Ji
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Sep 2011 10:33:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2011 01:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,367,1312182000"; d="scan'208";a="16143970"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2011 01:28:44 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2011 16:33:59 +0800
Message-Id: <85e223c8783eca48835226c2786e60b2c67e66df.1315815933.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315815933.git.dongxiao.xu@intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315815933.git.dongxiao.xu@intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/3] package_rpm: add architecture info in rpm spec file
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
X-List-Received-Date: Mon, 12 Sep 2011 08:33:57 -0000

For supporting multilib, architecture information is needed in package
require/provide/suggest/recommend fields.

Use DEFAULTTUNE value as the postfix.

For "all" arch recipe, it requires "all" arch recipe with no postfix,
but provides all possible multilib archs.

For example, qemu-config:

Requires: rsync
Requires: update-rc.d
Requires: task-core-nfs-server
Requires: distcc
Requires: oprofileui-server
Requires: dbus-x11
Requires: bash
Provides: qemu-config.x86
Provides: qemu-config.x86-64

For other recipe like zlib:

Requires: libc6.x86-64 >= 2.13
Provides: zlib.x86-64

[YOCTO #1457]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass    |    1 +
 meta/classes/package_rpm.bbclass |   36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 583d76b..76c86b2 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -23,6 +23,7 @@ python multilib_virtclass_handler () {
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
     e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
+    e.data.setVar("SAVED_DEFAULTTUNE", e.data.getVar("DEFAULTTUNE", True))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 }
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9ef1acd..ea0a079 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -350,6 +350,7 @@ package_install_internal_rpm () {
 python write_specfile () {
 	import textwrap
 	import oe.packagedata
+	import re
 
 	# We need a simple way to remove the MLPREFIX from the package name,
 	# and dependency information...
@@ -498,6 +499,8 @@ python write_specfile () {
 
 		splitname    = strip_multilib(pkgname, d)
 
+		defaulttune = bb.data.getVar('DEFAULTTUNE', localdata, True)
+
 		splitsummary = (bb.data.getVar('SUMMARY', localdata, True) or bb.data.getVar('DESCRIPTION', localdata, True) or ".")
 		splitversion = (bb.data.getVar('PKGV', localdata, True) or "").replace('-', '+')
 		splitrelease = (bb.data.getVar('PKGR', localdata, True) or "")
@@ -528,6 +531,39 @@ python write_specfile () {
 		if pkg == d.getVar("PN", True):
 			splitrprovides = splitrprovides + " " + (d.getVar('ALTERNATIVE_LINK', True) or '') + " " + (d.getVar('ALTERNATIVE_LINKS', True) or '')
 
+		package_arch = bb.data.getVar('PACKAGE_ARCH', localdata, True)
+
+		splitrprovides = splitrprovides + " " + splitname + "." + defaulttune
+		if package_arch != "all":
+			pattern = '\([^()]*\)'
+			prog = re.compile(pattern)
+
+			str_list = [splitrdepends, splitrrecommends, splitrsuggests]
+			for e in range(len(str_list)):
+				brackets = prog.findall(str_list[e])
+				for i in range(len(brackets)):
+					str_list[e] = str_list[e].replace(brackets[i], "#BRACKETS"+str(i)+"#")
+				tmp = ""
+				for i in str_list[e].split():
+					if i.startswith("#BRACKETS"):
+						tmp += " " + str(i)
+						continue
+					tmp += " " + str(i) + "." + defaulttune
+				str_list[e] = tmp
+				for i in range(len(brackets)):
+					str_list[e] = str_list[e].replace("#BRACKETS"+str(i)+"#", brackets[i])
+
+			[splitrdepends, splitrrecommends, splitrsuggests] = str_list
+		else:
+			variants = (bb.data.getVar("MULTILIB_VARIANTS", localdata, True) or "").split()
+			for variant in variants:
+				tune = bb.data.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, localdata, True) or ""
+				if tune:
+					splitrprovides = splitrprovides + " " + splitname + "." + tune
+			tune = bb.data.getVar("SAVED_DEFAULTTUNE", localdata, True) or ""
+			if tune:
+				splitrprovides = splitrprovides + " " + splitname + "." + tune
+
 		# Gather special src/first package data
 		if srcname == splitname:
 			srcrdepends    = splitrdepends
-- 
1.7.1



