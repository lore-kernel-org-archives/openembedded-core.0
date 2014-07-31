Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9AA701C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:16:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6V1GVAU001624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 18:16:31 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 18:16:31 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 20:16:27 -0500
Message-ID: <472a7048934afbe8464a69be871be22a54df7313.1406769215.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1406769215.git.mark.hatle@windriver.com>
References: <cover.1406769215.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] sanity.bbclass: Add ability to verify toolchain flags
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
X-List-Received-Date: Thu, 31 Jul 2014 01:16:30 -0000
Content-Type: text/plain

When attempting to use a binary toolchain, such as meta-mentor,
we want the ability to verify that the CCARGS, ASARGS and LDARGS
contain the necessary and appropriate flags.

This change specifically verifies, if set:
   TUNEABI_REQUIRED_CCARGS_tune-<tune>
   TUNEABI_REQUIRED_ASARGS_tune-<tune>
   TUNEABI_REQUIRED_LDARGS_tune-<tune>

Each of these, will be processed by the class and verified that the
selected tune's CCARGS, ASARGS, and LDARGS contains the listed item.  This
can be used to validate that the user has not accidently or otherwise
missed an argument.  Note, conflicting arguments are not verified.

Without verification it's possible for a misconfiguration to go
undetected, presenting runtime and debugging errors.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/sanity.bbclass | 52 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1ad663a..b5fab6a 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -87,17 +87,54 @@ def raise_sanity_error(msg, d, network_error=False):
     
     %s""" % msg)
 
+# Check flags associated with a tuning.
+def check_toolchain_tune_args(data, tune, multilib, errs):
+    found_errors = False
+    if check_toolchain_args_present(data, tune, multilib, errs, 'CCARGS'):
+        found_errors = True
+    if check_toolchain_args_present(data, tune, multilib, errs, 'ASARGS'):
+        found_errors = True
+    if check_toolchain_args_present(data, tune, multilib, errs, 'LDARGS'):
+        found_errors = True
+
+    return found_errors
+
+def check_toolchain_args_present(data, tune, multilib, tune_errors, which):
+    args_set = (data.getVar("TUNE_%s" % which, True) or "").split()
+    args_wanted = (data.getVar("TUNEABI_REQUIRED_%s_tune-%s" % (which, tune), True) or "").split()
+    args_missing = []
+
+    # If no args are listed/required, we are done.
+    if not args_wanted:
+        return
+    for arg in args_wanted:
+        if arg not in args_set:
+            args_missing.append(arg)
+
+    found_errors = False
+    if args_missing:
+        found_errors = True
+        tune_errors.append("TUNEABI for %s requires '%s' in TUNE_%s (%s)." %
+                       (tune, ' '.join(args_missing), which, ' '.join(args_set)))
+    return found_errors
+
 # Check a single tune for validity.
 def check_toolchain_tune(data, tune, multilib):
     tune_errors = []
     if not tune:
         return "No tuning found for %s multilib." % multilib
+    localdata = bb.data.createCopy(data)
+    if multilib != "default":
+        # Apply the overrides so we can look at the details.
+        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + multilib
+        localdata.setVar("OVERRIDES", overrides)
+    bb.data.update_data(localdata)
     bb.debug(2, "Sanity-checking tuning '%s' (%s) features:" % (tune, multilib))
-    features = (data.getVar("TUNE_FEATURES_tune-%s" % tune, True) or "").split()
+    features = (localdata.getVar("TUNE_FEATURES_tune-%s" % tune, True) or "").split()
     if not features:
         return "Tuning '%s' has no defined features, and cannot be used." % tune
-    valid_tunes = data.getVarFlags('TUNEVALID') or {}
-    conflicts = data.getVarFlags('TUNECONFLICTS') or {}
+    valid_tunes = localdata.getVarFlags('TUNEVALID') or {}
+    conflicts = localdata.getVarFlags('TUNECONFLICTS') or {}
     # [doc] is the documentation for the variable, not a real feature
     if 'doc' in valid_tunes:
         del valid_tunes['doc']
@@ -113,15 +150,18 @@ def check_toolchain_tune(data, tune, multilib):
             bb.debug(2, "  %s: %s" % (feature, valid_tunes[feature]))
         else:
             tune_errors.append("Feature '%s' is not defined." % feature)
-    whitelist = data.getVar("TUNEABI_WHITELIST", True) or ''
-    override = data.getVar("TUNEABI_OVERRIDE", True) or ''
+    whitelist = localdata.getVar("TUNEABI_WHITELIST", True) or ''
+    override = localdata.getVar("TUNEABI_OVERRIDE", True) or ''
     if whitelist:
-        tuneabi = data.getVar("TUNEABI_tune-%s" % tune, True) or ''
+        tuneabi = localdata.getVar("TUNEABI_tune-%s" % tune, True) or ''
         if not tuneabi:
             tuneabi = tune
         if True not in [x in whitelist.split() for x in tuneabi.split()]:
             tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
                 (tune, tuneabi))
+        else:
+            if not check_toolchain_tune_args(localdata, tuneabi, multilib, tune_errors):
+                bb.debug(2, "Sanity check: Compiler args OK for %s." % tune)
     if tune_errors:
         return "Tuning '%s' has the following errors:\n" % tune + '\n'.join(tune_errors)
 
-- 
1.9.3


