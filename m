Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7177.1793221929090469937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 14:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=hgtK0SC9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20261028211206be661a5b85000207fe-b3tyk3@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261028211206be661a5b85000207fe
        for <openembedded-core@lists.openembedded.org>;
        Wed, 28 Oct 2026 22:12:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/xfwsoOkM9ZgI44tCRVWrbjUeRVyyYCqUeZ1/8f49ZA=;
 b=hgtK0SC9JRVuzSQ3gzhPXOh+1gcVzxnr/7afmYvnGz7PgcR1s8KokDfczvBhlB1rXT8lIb
 xGlF9I9J6Emb4DwZOfXM+fldBwmfXJbw2qDDPPl49r75Li5TI4peM7IZyD8r4yps2J88Zrlh
 bVzVyrMr3lYyte8d8a2A+O/T8j5LJGnC1Bx4iN+q+8IVhg+OD4BCZv+mXidx3cyjP+s3qGft
 AhLfuaLC0FbTKnvgdkQ3OD91gwnp1z3ERIQz96I8BBVST4hMho+TgEhBmWR1fUX1fMmWYhDT
 Q1fcv8yzCpCzahuSdahXPn4DHtlwBhkcmicqXZ2ELAu7Ugeeh+ZbvW9w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/3] kernel-fit-image: drop the synthetic FIT_LOADABLE_* values
Date: Wed, 28 Oct 2026 22:11:25 +0100
Message-ID: <20261028211203.3081460-4-adrian.freihofer@siemens.com>
In-Reply-To: <20261028211203.3081460-1-adrian.freihofer@siemens.com>
References: <20261028211203.3081460-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 21:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248830
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The anonymous function sets the FIT_LOADABLE_* variables to the flags of
all loadables joined by " ? ", e.g. "0x86000000 ? 0x87000000". This was
done only to make the flags visible to the selftests, which could read
variables but not flags. do_compile reads the flags directly and does
not need these values.

get_bb_vars_flags can read variable flags now. Let the test request
the FIT_LOADABLE_* flags of the loadables it configures and drop the
synthetic values from the class.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  7 ++----
 meta/lib/oeqa/selftest/cases/fitimage.py     | 24 ++++++++++++--------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index a238de1aa2..abf7327c97 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -32,8 +32,8 @@ python () {
     # Parse loadables config
     loadables = d.getVar('FIT_LOADABLES')
     if loadables:
-        # Forbid direct assignment, set synthetic values for testability and
-        # add the vars to vardeps so their flags are part of the signature.
+        # Only flags are supported. Add the vars to vardeps so their flags are
+        # part of the signature.
         loadable_vars = ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
                          'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
                          'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
@@ -41,9 +41,6 @@ python () {
         for v in loadable_vars:
             if d.getVar(v):
                 raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
-
-            synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
-            d.setVar(v, synt_value)
         d.appendVarFlag('do_compile', 'vardeps', ' ' + ' '.join(loadable_vars))
 }
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 81d2be5013..1fad53b16c 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -14,7 +14,7 @@ import oe.fitimage
 
 from bb import BBHandledException
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_vars_flags, get_bb_var
 
 
 class BbVarsMockGenKeys:
@@ -662,10 +662,12 @@ class FitImageTestCase(OESelftestTestCase):
 class KernelFitImageBase(FitImageTestCase):
     """Test cases for the linux-yocto-fitimage recipe"""
 
-    def _fit_get_bb_vars(self, additional_vars=[]):
+    def _fit_get_bb_vars(self, additional_vars=[], flags=None):
         """Retrieve BitBake variables specific to the test case.
 
-        Call the get_bb_vars function once and get all variables needed by the test case.
+        Call the get_bb_vars_flags function once and get all variables needed by
+        the test case. flags maps variable names to lists of flag names. The
+        flags are returned as dict {flag name: value} for their variable name.
         """
         internal_used = {
             'DEPLOY_DIR_IMAGE',
@@ -676,8 +678,6 @@ class KernelFitImageBase(FitImageTestCase):
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
             'FIT_LOADABLES',
-            'FIT_LOADABLE_ENTRYPOINT',
-            'FIT_LOADABLE_LOADADDRESS',
             'FIT_OS',
             'FIT_SIGN_ALG',
             'FIT_SIGN_INDIVIDUAL',
@@ -712,7 +712,9 @@ class KernelFitImageBase(FitImageTestCase):
             'UBOOT_FIT_TEE_LOADADDRESS',
             'UBOOT_FIT_TEE_ENTRYPOINT',
         }
-        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), self.kernel_recipe)
+        bb_vars, bb_flags = get_bb_vars_flags([*internal_used, *additional_vars], flags, self.kernel_recipe)
+        bb_vars = {var: val or None for var, val in bb_vars.items()}
+        bb_vars.update(bb_flags)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
@@ -1025,10 +1027,10 @@ class KernelFitImageBase(FitImageTestCase):
                 "Entry Point": bb_vars['UBOOT_RD_ENTRYPOINT']
             }
         # Create one section per loadable
-        for index,loadable in enumerate(loadables):
-            loadaddress = bb_vars['FIT_LOADABLE_LOADADDRESS'].split("?")[index].strip()
+        for loadable in loadables:
+            loadaddress = bb_vars['FIT_LOADABLE_LOADADDRESS'][loadable]
             req_sections[loadable] = { "Load Address": loadaddress }
-            entrypoint = bb_vars['FIT_LOADABLE_ENTRYPOINT'].split("?")[index].strip()
+            entrypoint = bb_vars['FIT_LOADABLE_ENTRYPOINT'][loadable]
             if entrypoint:
                 req_sections[loadable]['Entry Point'] = entrypoint
         # Create a configuration section for each DTB
@@ -1204,7 +1206,9 @@ FIT_LOADABLE_TYPE[loadable2] = "firmware"
         config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "FIT_CONF_DEFAULT_DTB"])
         config = self._config_add_kernel_classes(config)
         self.write_config(config)
-        bb_vars = self._fit_get_bb_vars()
+        loadables = ['loadable1', 'loadable2']
+        bb_vars = self._fit_get_bb_vars(flags={'FIT_LOADABLE_ENTRYPOINT': loadables,
+                                               'FIT_LOADABLE_LOADADDRESS': loadables})
         self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
-- 
2.56.0

