Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27497.1792952334746325424
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=mLnVHelr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026102518185137682b23be0002074f-ednjyf@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026102518185137682b23be0002074f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BxGuveQWxhPFureqVqBXzXtkD+/NgCJtB0dOtOif9hg=;
 b=mLnVHelrvecoH9oXKRJhi7AUT0TrmImrnPCoxJKM4ilN7g8zhjAMiaA2QIxFTJ3QPLtUoA
 vGVDssCPDMl0EOqz8WrCCjsIkIo6akTPA743s+OxYLvmY1FpCXB53o/bELNEqo1AkC7V55xf
 oisuf2yYVksSdmaJ3YeC7vGOY5SO5+Gku5bOvd0wGyjh4GbnSm01Pd0moMRLZ7FxIZ92G6n9
 UetZ31UtN5dJw8eILbXMS/z+5gZMCtcDgnETlp5cDHUNq2X2Ko7OMNWFOK7wxOEmvGKGT3R+
 obD4iiCy/Lf8/rVZ9+I+2+q0SvS6FfQntbiBGPNCSym1D6zFjIuF6nBw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/6] oeqa/utils/commands: use tinfoil in get_bb_vars
Date: Sun, 25 Oct 2026 19:18:29 +0100
Message-ID: <20261025181847.784113-4-adrian.freihofer@siemens.com>
In-Reply-To: <20261025181847.784113-1-adrian.freihofer@siemens.com>
References: <20261025181847.784113-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248616
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Refactor get_bb_vars to read the variables from a tinfoil datastore
instead of parsing the "bitbake -e" output with regular expressions.
Without a target, finalizeData() is used as bitbake -e does. The
postconfig file handling of bitbake() is moved into a context manager
which is shared with get_bb_vars. The postconfig parameter is kept
although no caller in oe-core uses it.

The API does not change. Small differences in the returned values:
- values are no longer shell escaped. bitbake -e escapes $, ", ` and
  newlines, e.g. BB_UNIHASH was returned as \${BB_TASKHASH}. This is
  consistent with get_bb_var, which already returned unescaped values.
  No test in oe-core or meta-yocto undoes the escaping or reads a
  variable which contains these characters after expansion.
- multi-line values are found
- lines of shell functions are no longer returned as variables
- when all variables are requested, names such as FILES:${PN} are
  returned as well

It is also faster. Without a memory resident bitbake server, reading a
few configuration variables takes 0.65s instead of 2.0s, reading a few
variables of a recipe takes 2.1s instead of 2.8s.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/commands.py | 99 +++++++++++++++++----------------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 9154220968..1ccc107aed 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,25 +218,33 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
     return result
 
 
-def bitbake(command, ignore_status=False, timeout=None, postconfig=None, output_log=None, **options):
-
-    if postconfig:
-        postconfig_file = os.path.join(os.environ.get('BUILDDIR'), 'oeqa-post.conf')
-        ftools.write_file(postconfig_file, postconfig)
-        extra_args = "-R %s" % postconfig_file
-    else:
-        extra_args = ""
-
-    if isinstance(command, str):
-        cmd = "bitbake " + extra_args + " " + command
-    else:
-        cmd = [ "bitbake" ] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
+@contextlib.contextmanager
+def _postconfig_file(postconfig):
+    """Write postconfig to a temporary configuration file and yield its path
 
+    Yield None if there is no postconfig.
+    """
+    if not postconfig:
+        yield None
+        return
+    path = os.path.join(os.environ.get('BUILDDIR'), 'oeqa-post.conf')
+    ftools.write_file(path, postconfig)
     try:
-        return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
+        yield path
     finally:
-        if postconfig:
-            os.remove(postconfig_file)
+        os.remove(path)
+
+
+def bitbake(command, ignore_status=False, timeout=None, postconfig=None, output_log=None, **options):
+    with _postconfig_file(postconfig) as postfile:
+        extra_args = "-R %s" % postfile if postfile else ""
+
+        if isinstance(command, str):
+            cmd = "bitbake " + extra_args + " " + command
+        else:
+            cmd = [ "bitbake" ] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
+
+        return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
 
 
 def get_bb_env(target=None, postconfig=None):
@@ -246,42 +254,37 @@ def get_bb_env(target=None, postconfig=None):
         return bitbake("-e", postconfig=postconfig).output
 
 def get_bb_vars(variables=None, target=None, postconfig=None):
-    """Get values of multiple bitbake variables"""
-    bbenv = get_bb_env(target, postconfig=postconfig)
+    """Get values of multiple bitbake variables
+
+    All values are read with a single tinfoil session. If variables is None,
+    all variables are returned. Unset or empty values are returned as None.
+    """
+    import bb.tinfoil
 
-    if variables is not None:
-        variables = list(variables)
-    var_re = re.compile(r'^(export )?(?P<var>\w+(_.*)?)="(?P<value>.*)"$')
-    unset_re = re.compile(r'^unset (?P<var>\w+)$')
-    lastline = None
     values = {}
-    for line in bbenv.splitlines():
-        match = var_re.match(line)
-        val = None
-        if match:
-            val = match.group('value')
+    with _postconfig_file(postconfig) as postfile, bb.tinfoil.Tinfoil() as tinfoil:
+        config_params = None
+        if postfile:
+            config_params = bb.tinfoil.TinfoilConfigParameters(config_only=not target, quiet=2, postfile=[postfile])
+        tinfoil.prepare(config_only=not target, config_params=config_params, quiet=2)
+        if target:
+            d = tinfoil.parse_recipe(target)
         else:
-            match = unset_re.match(line)
-            if match:
-                # Handle [unexport] variables
-                if lastline.startswith('#   "'):
-                    val = lastline.split('"')[1]
-        if val:
-            var = match.group('var')
-            if variables is None:
-                values[var] = val
-            else:
-                if var in variables:
-                    values[var] = val
-                    variables.remove(var)
-                # Stop after all required variables have been found
-                if not variables:
-                    break
-        lastline = line
-    if variables:
-        # Fill in missing values
+            # Expand keys and run anonymous functions to get the same result as "bitbake -e"
+            d = tinfoil.finalizeData()
+
+        if variables is None:
+            for var in d.keys():
+                if var.startswith('__') or d.getVarFlag(var, 'func'):
+                    continue
+                val = d.getVar(var)
+                if val is not None and val != '':
+                    values[var] = str(val)
+            return values
+
         for var in variables:
-            values[var] = None
+            val = d.getVar(var)
+            values[var] = str(val) if val is not None and val != '' else None
     return values
 
 def get_bb_var(var, target=None, postconfig=None):
-- 
2.56.0

