Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzd0-0005zp-9e
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:39:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721020"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:30:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:49 -0700
Message-Id: <da264f456ca10d46fc498198babba93fce8be25d.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/12] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Wed, 09 May 2012 05:39:59 -0000

From: Peter Seebach <peter.seebach@windriver.com>

This introduces a sanity check for the toolchain, which verifies
each tuning (including any multilibs), producing meaningful diagnostics
for problems, and also provides some higher-level tuning features.

The TUNEVALID and TUNECONFLICT/TUNECONFLICTS settings were not
implemented.  Listed one or two missing features in TUNEVALID,
also (in a previous patch) fixed the references to
features which didn't exist.

This patch also provides a whitelisting mechanism (which is completely
unused) to allow vendors providing prebuilt toolchain components to
restrict tunings to those based on or compatible with a particular ABI.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/sanity.bbclass  |   73 ++++++++++++++++++++++++++++++++++++++++++
 meta/conf/documentation.conf |    6 +++
 2 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 687ddeb..635049e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -11,6 +11,76 @@ def raise_sanity_error(msg):
     
     %s""" % msg)
 
+# Check a single tune for validity.
+def check_toolchain_tune(data, tune, multilib):
+    tune_errors = []
+    if not tune:
+        return "No tuning found for %s multilib." % multilib
+    bb.debug(2, "Sanity-checking tuning '%s' (%s) features:" % (tune, multilib))
+    features = (data.getVar("TUNE_FEATURES_tune-%s" % tune, True) or "").split()
+    if not features:
+        return "Tuning '%s' has no defined features, and cannot be used." % tune
+    valid_tunes = data.getVarFlags('TUNEVALID') or {}
+    conflicts = data.getVarFlags('TUNECONFLICTS') or {}
+    # [doc] is the documentation for the variable, not a real feature
+    if 'doc' in valid_tunes:
+        del valid_tunes['doc']
+    if 'doc' in conflicts:
+        del conflicts['doc']
+    for feature in features:
+        if feature in conflicts:
+            for conflict in conflicts[feature].split():
+                if conflict in features:
+                    tune_errors.append("Feature '%s' conflicts with '%s'." %
+                        (feature, conflict))
+        if feature in valid_tunes:
+            bb.debug(2, "  %s: %s" % (feature, valid_tunes[feature]))
+        else:
+            tune_errors.append("Feature '%s' is not defined." % feature)
+    whitelist = data.getVar("TUNEABI_WHITELIST", True) or ''
+    override = data.getVar("TUNEABI_OVERRIDE", True) or ''
+    if whitelist:
+        tuneabi = data.getVar("TUNEABI_tune-%s" % tune, True) or ''
+        if not tuneabi:
+            tuneabi = tune
+        if True not in [x in whitelist.split() for x in tuneabi.split()]:
+            tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
+                (tune, tuneabi))
+    if tune_errors:
+        return "Tuning '%s' has the following errors:\n" + '\n'.join(tune_errors)
+
+def check_toolchain(data):
+    tune_error_set = []
+    deftune = data.getVar("DEFAULTTUNE", True)
+    tune_errors = check_toolchain_tune(data, deftune, 'default')
+    if tune_errors:
+        tune_error_set.append(tune_errors)
+
+    multilibs = (data.getVar("MULTILIB_VARIANTS", True) or "").split()
+    if multilibs:
+        seen_libs = []
+        seen_tunes = []
+        for lib in multilibs:
+            if lib in seen_libs:
+                tune_error_set.append("The multilib '%s' appears more than once." % lib)
+            else:
+                seen_libs.append(lib)
+            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True)
+            if tune in seen_tunes:
+                tune_error_set.append("The tuning '%s' appears in more than one multilib." % tune)
+            else:
+                seen_libs.append(tune)
+            if tune == deftune:
+                tune_error_set.append("Multilib '%s' (%s) is also the default tuning." % (lib, deftune))
+            else:
+                tune_errors = check_toolchain_tune(data, tune, lib)
+            if tune_errors:
+                tune_error_set.append(tune_errors)
+    if tune_error_set:
+        return "Toolchain tunings invalid:\n" + '\n'.join(tune_error_set)
+
+    return ""
+
 def check_conf_exists(fn, data):
     bbpath = []
     fn = data.expand(fn)
@@ -327,6 +397,9 @@ def check_sanity(e):
         messages = messages + pseudo_msg + '\n'
 
     check_supported_distro(e)
+    toolchain_msg = check_toolchain(e.data)
+    if toolchain_msg != "":
+        messages = messages + toolchain_msg + '\n'
 
     # Check if DISPLAY is set if IMAGETEST is set
     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3e40a77..004a16c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -36,6 +36,12 @@ for hardware floating point instructions."
 
 TUNEVALID[doc] = "Descriptions of valid tuning features, stored as flags."
 TUNECONFLICTS[doc] = "List of conflicting features for a given feature."
+TUNEABI[doc] = "An underlying ABI used by a particular tuning in a given \
+toolchain layer.  This feature allows providers using prebuilt \
+libraries to check compatibility of a tuning against their selection \
+of libraries."
+TUNEABI_WHITELIST[doc] = "A whitelist of permissible TUNEABI values; if unset, all are allowed."
+TUNEABI_OVERRIDE[doc] = "If set, ignores TUNEABI_WHITELIST."
 
 ASSUME_PROVIDED[doc] = "List of packages (recipes actually) which are assumed to be implicitly available.\
  These packages won't be built by bitbake."
-- 
1.7.7.6



