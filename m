Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QskDP-0005Pe-Tg
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 01:35:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 16:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38387537"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 16:30:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 16:30:37 -0700
Message-Id: <7443e896b8c85ab870f00a81151d827bda343eef.1313363644.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/12] utils.bbclass/multilib.class: Added misc supporting functions.
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
X-List-Received-Date: Sun, 14 Aug 2011 23:35:36 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

1. Added variable MULTILIB_VARIANTS to store all the instance variants
for multilib extend.

2. Added function all_multilib_tune_values to collect the variable
values for all multilib instance.

3. multilib bbclass handler will save the orignal value of all variables
defined in MULTILIB_SAVE_VARNAME.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/multilib.bbclass |    7 ++++++-
 meta/classes/utils.bbclass    |   29 +++++++++++++++++++++++++++++
 meta/conf/bitbake.conf        |    1 +
 meta/conf/multilib.conf       |    3 +++
 4 files changed, 39 insertions(+), 1 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6e1669f..571b7be 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -6,7 +6,12 @@ python multilib_virtclass_handler () {
     variant = e.data.getVar("BBEXTENDVARIANT", True)
     if cls != "multilib" or not variant:
         return
- 
+    save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
+    for name in save_var_name.split():
+        val=e.data.getVar(name, True)
+        if val:
+            e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
+
     override = ":virtclass-multilib-" + variant
 
     e.data.setVar("MLPREFIX", variant + "-")
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 8c3a9b8..c66c184 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -341,3 +341,32 @@ def base_set_filespath(path, d):
 		for o in overrides.split(":"):
 			filespath.append(os.path.join(p, o))
 	return ":".join(filespath)
+
+def extend_variants(d, var, extend, delim=':'):
+	"""Return a string of all bb class extend variants for the given extend"""
+	variants = []
+	whole = d.getVar(var, True) or ""
+	for ext in whole.split():
+		eext = ext.split(delim)
+		if len(eext) > 1 and eext[0] == extend:
+			variants.append(eext[1])
+	return " ".join(variants)
+
+def all_multilib_tune_values(d, var, unique=True):
+	"""Return a string of all ${var} in all multilib tune configuration"""
+	values = []
+	value = d.getVar(var, True) or ""
+	if value != "":
+		values.append(value)
+	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+	for item in variants.split():
+		localdata = bb.data.createCopy(d)
+		overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+		localdata.setVar("OVERRIDES", overrides)
+		bb.data.update_data(localdata)
+		value = localdata.getVar(var, True) or ""
+		if value != "":
+			values.append(value)
+	if unique:
+		values = set(values)
+	return " ".join(values)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7bb68b8..b309516 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -749,3 +749,4 @@ BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-inter
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
 MLPREFIX ??= ""
+MULTILIB_VARIANTS ??= ""
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index f2a2002..36793d2 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -1,6 +1,9 @@
 
 baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
 
+MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
+MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
+
 MULTILIBS ??= "multilib:lib32"
 
 BBCLASSEXTEND_append_pn-acl = " ${MULTILIBS}"
-- 
1.7.6



