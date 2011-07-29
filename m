Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QmoXI-0003wM-7H
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 16:59:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jul 2011 07:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,287,1309762800"; d="scan'208";a="33029049"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 29 Jul 2011 07:55:16 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 22:57:26 +0800
Message-Id: <86e74f97a7eea07d74dafa632c053da2d37e03eb.1311950827.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311950827.git.lianhao.lu@intel.com>
References: <cover.1311950827.git.lianhao.lu@intel.com>
Subject: [RFC BUG #1236 1/2] utils.bbclass/multilib.conf: Added misc supporting functions.
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
X-List-Received-Date: Fri, 29 Jul 2011 14:59:36 -0000

1. Added variable MULTILIB_VARIANTS to store all the instance variants
for multilib extend.

2. Added function all_multilib_tune_values to collect the variable
values for all multilib instance.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/utils.bbclass |   35 +++++++++++++++++++++++++++++++++++
 meta/conf/bitbake.conf     |    1 +
 meta/conf/multilib.conf    |    6 +++++-
 3 files changed, 41 insertions(+), 1 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 8c3a9b8..f8adaea 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -341,3 +341,38 @@ def base_set_filespath(path, d):
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
+		#Fix ME. OVERRIDES not work, we have to set DEFAULTTUNE to TUNENAME
+		#overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+		#localdata.setVar("OVERRIDES", overrides)
+		if localdata.getVar("BBEXTENDVARIANT", True) == item:
+			tunename=localdata.getVar("TUNENAME", False) or ""
+		else:
+			tunename=localdata.getVar("TUNENAME_virtclass-multilib-" + item, False) or ""
+		if tunename != "":
+			localdata.setVar("DEFAULTTUNE", tunename)
+		value = localdata.getVar(var, True) or ""
+		if value != "":
+			values.append(value)
+	if unique:
+		values = set(values)
+	return " ".join(values)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6e109ec..bcff50e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -736,3 +736,4 @@ BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-inter
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
 MLPREFIX ??= ""
+MULTILIB_VARIANTS ??= ""
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 894b7a5..60760df 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -1,6 +1,11 @@
 
 baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
 
+MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
+
+TUNENAME_virtclass-multilib-lib64 ?= "x86-64"
+TUNENAME_virtclass-multilib-lib32 ?= "x86"
+
 MULTILIBS ??= "multilib:lib32"
 BBCLASSEXTEND_append_pn-linux-libc-headers = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eglibc-initial = " ${MULTILIBS}"
@@ -21,4 +26,3 @@ BBCLASSEXTEND_append_pn-bash = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-ncurses = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-expat = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eglibc-locale = " ${MULTILIBS}"
-
-- 
1.7.0.4



