Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SNv6P-000366-Dr
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 02:01:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3RNpoHb001479
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 16:51:50 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 Apr 2012 16:51:50 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 18:51:47 -0500
Message-ID: <f705d78daf24e291d96d9ccd07ac7755dc3b362a.1335569869.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1335569869.git.peter.seebach@windriver.com>
References: <cover.1335569869.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Sat, 28 Apr 2012 00:01:29 -0000
Content-Type: text/plain

This introduces a sanity check for the toolchain, which verifies
each tuning (including any multilibs), producing meaningful diagnostics
for problems, and also provides some higher-level tuning features.

The TUNEVALID and TUNECONFLICT/TUNECONFLICTS settings were not
implemented, and there were some loose ends (like not knowing how
the conflict one was spelled).  Listed one or two missing features
in TUNEVALID, also (in a previous patch) fixed the references to
features which didn't exist.

This patch also provides a whitelisting mechanism (which is completely
unused) to allow vendors providing prebuilt toolchain components to
restrict tunings to those based on or compatible with a particular ABI.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/sanity.bbclass                      |   69 ++++++++++++++++++++++
 meta/conf/documentation.conf                     |    6 ++
 meta/conf/machine/include/README                 |    4 +
 meta/conf/machine/include/arm/arch-armv5-dsp.inc |    1 +
 meta/conf/machine/include/arm/arch-armv7a.inc    |    2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc     |    2 +-
 meta/conf/machine/include/mips/arch-mips.inc     |    6 +-
 meta/conf/machine/include/tune-c3.inc            |    2 +-
 8 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 687ddeb..ff11fec 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -11,6 +11,72 @@ def raise_sanity_error(msg):
     
     %s""" % msg)
 
+# Check a single tune for validity.
+def check_toolchain_tune(data, tune, multilib):
+    tune_errors = []
+    if not tune or tune == "":
+        return "No tuning found for %s multilib." % multilib
+    bb.note("Sanity-checking tuning '%s' (%s) features:" % (tune, multilib))
+    features = data.getVar("TUNE_FEATURES_tune-%s" % tune, True) or ""
+    if features == '':
+        return "Tuning '%s' has no defined features, and cannot be used." % tune
+    features = features.split()
+    valid_tunes = data.getVarFlags('TUNEVALID') or ""
+    conflicts = data.getVarFlags('TUNECONFLICTS') or ""
+    split_conflicts = {}
+    for feature in features:
+        if feature in conflicts:
+            if feature not in split_conflicts:
+                split_conflicts[feature] = conflicts[feature].split()
+            for other in features:
+                if other in split_conflicts[feature]:
+                    tune_errors.append("Feature '%s' conflicts with '%s'." %
+                        ( feature, other ))
+        if feature in valid_tunes:
+            bb.note("  %s: %s" % (feature, valid_tunes[feature]))
+        else:
+            tune_errors.append("Feature '%s' is not defined." % feature)
+    whitelist = data.getVar("TUNEABI_WHITELIST", True) or ''
+    if whitelist != '':
+        override = data.getVar("TUNEABI_OVERRIDE", True) or ''
+        if not override:
+            tuneabi = data.getVar("TUNEABI_tune-%s" % tune, True) or ""
+            if tuneabi == "":
+                tuneabi = tune
+            if True not in [x in whitelist.split() for x in tuneabi.split()]:
+                tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
+                    (tune, tuneabi))
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
+    multilibs = data.getVar("MULTILIBS", True) or ""
+    if multilibs != "":
+        for pairs in [x.split(':') for x in multilibs.split()]:
+            if pairs[0] != 'multilib':
+                bb.warn("Got an unexpected '%s' in MULTILIBS." % pairs[0])
+            else:
+                if pairs[1] == 'lib':
+                    tune_error_set.append("The multilib 'lib' was specified, but that causes parse errors.")
+                else:
+                    tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % pairs[1], True)
+                    if tune == deftune:
+                        bb.warn("Multilib '%s' (%s) is also the default tuning." % (pairs[1], deftune))
+                    else:
+                        tune_errors = check_toolchain_tune(data, tune, pairs[1])
+                    if tune_errors:
+                        tune_error_set.append(tune_errors)
+    if tune_error_set:
+        return "Toolchain tunings invalid:\n" + '\n'.join(tune_error_set)
+
+    return ""
+
 def check_conf_exists(fn, data):
     bbpath = []
     fn = data.expand(fn)
@@ -327,6 +393,9 @@ def check_sanity(e):
         messages = messages + pseudo_msg + '\n'
 
     check_supported_distro(e)
+    toolchain_msg = check_toolchain(e.data)
+    if toolchain_msg != "":
+        messages = messages + toolchain_msg + '\n'
 
     # Check if DISPLAY is set if IMAGETEST is set
     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index f4d6241..f41c79f 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -34,6 +34,12 @@ TARGET_CC_ARCH[doc] = "FIXME"
 TARGET_FPU[doc] = "Floating point option (mostly for FPU-less systems), can be 'soft' or empty \
 for hardware floating point instructions."
 
+# WARNING:  Because the flags on these have semantic implecations,
+# they must not actually be defined.
+#TUNEVALID[doc] = "Descriptions of valid tuning features, stored as flags."
+#TUNEVALID[doc] = "List of conflicting features for a given feature."
+TUNEABI[doc] = "A base ABI used by a given tuning, used with prebuilt binaries."
+
 ASSUME_PROVIDED[doc] = "List of packages (recipes actually) which are assumed to be implicitly available.\
  These packages won't be built by bitbake."
 ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib packages in ASSUME_PROVIDED,\
diff --git a/meta/conf/machine/include/README b/meta/conf/machine/include/README
index 6a3a63d..e4b59c9 100644
--- a/meta/conf/machine/include/README
+++ b/meta/conf/machine/include/README
@@ -24,6 +24,10 @@ TUNEVALID[feature] - The <feature> is defined with a human readable
 explanation for what it does.  All architectural, cpu, abi, etc tuning 
 features must be defined using TUNEVALID.
 
+TUNECONFLICTS[feature] - A list of features which conflict with <feature>.
+New sanity checks will try to reject combinations in which a single
+tuning ends up with features which conflict with each other.
+
 TUNE_FEATURES - This is automatically defined as TUNE_FEATURES_tune-<tune>.
 See TUNE_FEATURES_tune-<tune> for more information.
 
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index 9f03a0f..0f64562 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -1,4 +1,5 @@
 ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
+TUNEVALID[dsp] = "ARM DSP functionality"
 
 require conf/machine/include/arm/arch-armv5.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 629960d..c90aff5 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv7a"
 
 ARMPKGARCH ?= "armv7a"
 
-TUNEVALID[armv7-a] = "Enable instructions for ARMv7-a"
+TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNE_CONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index a5dae88..15f67d7 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -27,7 +27,7 @@ TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-TUNECONFLICT[m64] = "m32 mx32"
+TUNECONFLICTS[m64] = "m32 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 8758ecd..9f12920 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -12,15 +12,15 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel
 
 # ABI flags
 TUNEVALID[o32] = "MIPS o32 ABI"
-TUNECONFLICT[o32] = "n32 n64"
+TUNECONFLICTS[o32] = "n32 n64"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "o32", "-mabi=32", "", d)}"
 
 TUNEVALID[n32] = "MIPS64 n32 ABI"
-TUNECONFLICT[n32] = "o32 n64"
+TUNECONFLICTS[n32] = "o32 n64"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n32", "-mabi=n32", "", d)}"
 
 TUNEVALID[n64] = "MIPS64 n64 ABI"
-TUNECONFLICT[n64] = "o32 n32"
+TUNECONFLICTS[n64] = "o32 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-mabi=64", "", d)}"
 
 # Floating point
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index 06fac8f..79bb67b 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/ia32/arch-ia32.inc
 
 TUNEVALID[c3] = "VIA Cyrix III or VIA C3 specific optimizations"
-TUNECONFLICT[c3] = "m64 mx32"
+TUNECONFLICTS[c3] = "m64 mx32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "c3", "-march=c3 -mtune=c3", "", d)}"
 
 AVAILTUNES += "c3"
-- 
1.7.0.4



