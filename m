Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 45ECA77BE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467574"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:20 -0500
Message-Id: <4aa2e9adc287aa9ef6f20ee3b2c5e978b3495103.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 12/30] oeqa/selftest/case: Add wrappers to utils.commands modules
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This wrappers are for be able to use a custom build directory
per Test class, there is a function to modify the environment
setting BUILDDIR, BBPATH and CWD.

The oeqa.utils.commands module could be removed when other selftests
(refkit, etc) are adapted to use this wrappers methods (get_bb_var{,s},
bitbake, runCmd).

The remaining command (oeqa.utils) to provide a wrapper is runqemu, this
has other issue because bitbake/tinfoil are expected to run into the
main thread (signal handling, etc).

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 96 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index dd24e366abd..3998aeac5c4 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -6,10 +6,11 @@ import os
 import shutil
 import glob
 import errno
+import re
 from unittest.util import safe_repr
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_env, get_bb_var, get_bb_vars
 from oeqa.core.case import OETestCase
 
 class OESelftestTestCase(OETestCase):
@@ -197,7 +198,7 @@ to ensure accurate results.")
         if self._extra_tear_down_commands:
             failed_extra_commands = []
             for command in self._extra_tear_down_commands:
-                result = runCmd(command, ignore_status=True)
+                result = self.runCmd(command, ignore_status=True)
                 if not result.status ==  0:
                     failed_extra_commands.append(command)
             if failed_extra_commands:
@@ -313,3 +314,94 @@ to ensure accurate results.")
             msg = self._formatMessage(msg, "%s exists when it should not" % safe_repr(expr))
 
             raise self.failureException(msg)
+
+    # utils commands to run on it's on builddir
+    @classmethod 
+    def _env_own_builddir(cls, **kwargs):
+        env = None
+
+        if 'env' in kwargs:
+            env = kwargs['env']
+
+            if not 'BUILDDIR' in env:
+                env['BUILDDIR'] = cls.builddir
+            if not 'BBPATH' in env:
+                env['BBPATH'] = cls.builddir
+
+        else:
+            env = os.environ.copy()
+            env['BUILDDIR'] = cls.builddir
+            env['BBPATH'] = cls.builddir
+
+        kwargs['env'] = env
+
+        # XXX: tinfoil doesn't honor BBPATH bblayers and tinfoil test
+        # modules uses it
+        if not 'cwd' in kwargs:
+            kwargs['cwd'] = cls.builddir
+
+        # XXX: uncomment for debugging purposes
+        #kwargs['output_log'] = cls.logger
+
+        return kwargs
+
+    @classmethod
+    def runCmd(cls, *args, **kwargs):
+        kwargs = cls._env_own_builddir(**kwargs)
+        return runCmd(*args, **kwargs)
+
+    @classmethod
+    def bitbake(cls, *args, **kwargs):
+        kwargs = cls._env_own_builddir(**kwargs)
+        return bitbake(*args, **kwargs)
+
+    @classmethod
+    def get_bb_env(cls, target=None, postconfig=None):
+        if target:
+            return cls.bitbake("-e %s" % target, postconfig=postconfig).output
+        else:
+            return cls.bitbake("-e", postconfig=postconfig).output
+
+    @classmethod
+    def get_bb_vars(cls, variables=None, target=None, postconfig=None):
+        """Get values of multiple bitbake variables"""
+        bbenv = cls.get_bb_env(target, postconfig=postconfig)
+
+        if variables is not None:
+            variables = variables.copy()
+        var_re = re.compile(r'^(export )?(?P<var>\w+(_.*)?)="(?P<value>.*)"$')
+        unset_re = re.compile(r'^unset (?P<var>\w+)$')
+        lastline = None
+        values = {}
+        for line in bbenv.splitlines():
+            match = var_re.match(line)
+            val = None
+            if match:
+                val = match.group('value')
+            else:
+                match = unset_re.match(line)
+                if match:
+                    # Handle [unexport] variables
+                    if lastline.startswith('#   "'):
+                        val = lastline.split('"')[1]
+            if val:
+                var = match.group('var')
+                if variables is None:
+                    values[var] = val
+                else:
+                    if var in variables:
+                        values[var] = val
+                        variables.remove(var)
+                    # Stop after all required variables have been found
+                    if not variables:
+                        break
+            lastline = line
+        if variables:
+            # Fill in missing values
+            for var in variables:
+                values[var] = None
+        return values
+    
+    @classmethod 
+    def get_bb_var(cls, var, target=None, postconfig=None):
+        return cls.get_bb_vars([var], target, postconfig)[var]
-- 
2.11.0


