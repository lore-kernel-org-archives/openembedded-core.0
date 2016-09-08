Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D39EC60621
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 16:58:48 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w12so100799829wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=mFtvLGtIx/lqYFerADNCXR2/H1xW77JssJSrgwOghUA=;
	b=fVQAABi5do1E0GJHSd3C0n+VHQ0hWkMoj01ZFHDFU+Nokrk/FiIDIAyPEkqdr0VaRx
	9jazsSpupxmMUZhYRSmvvT8OPyNwjYkuaOesG5dKMgG90SAhmg8mcKJqv2H6RjNLs4Yi
	o5W8DGXh9Gu++ziLpu9QO1SIrZZtOW+hdlzdmuuvX1UTYOBx6CnB0w2u7b1P/dBwtXYI
	KQP/sGGuIaUwONBL8vITeCJEK/lo6KLvgbkeTLf5FMj0MAF2+/WFt9nVcSFv6E5bpx4E
	FUFsGOxiQFZGeutQb8v+aITb464TW7RZrQ1QTkP4ANBPr7wg6W7FEXD26i6MUtOzLzzp
	rcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mFtvLGtIx/lqYFerADNCXR2/H1xW77JssJSrgwOghUA=;
	b=QQgj6BU92VJ3RaNUlST74wv/f/zi4AOePdWniH5vvTNDCNvGM1MsfzrHUU1ToO7yNr
	U43er3EcV72VeHz97HbJ+lfZWv1OmcA8OCeJLW3x/x0d8nVAetUuYsYAP3cRhK/vOwT9
	aEGVLhmmWDbidFrOfZp9tIkkt3M4z+/HKIErB+ZfWReM3imwAs1bwNQWyFPgcTbeZer4
	zr4g10yp7PY3A+fbp3Z8X2HwuP1w+OUI7B/cEeWNOyrN1C1Xp8EndJZR5tTQw8GxbxpE
	1rprvUHKjQMqiaD43gURWjG7LyGWVc1+JhxWhUrfQ9kG+HgFwbZH1MGSJDBr5YhxiCLi
	0VnQ==
X-Gm-Message-State: AE9vXwM8ByFExJ5D2kCoTpOsSEv8ZONQ8PUOWPVc+BBtKq1btZl7o85uoYesotKSvBEPBQHf
X-Received: by 10.28.20.77 with SMTP id 74mr1230241wmu.1.1473353928433;
	Thu, 08 Sep 2016 09:58:48 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lj2sm10085147wjc.38.2016.09.08.09.58.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Sep 2016 09:58:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 17:58:43 +0100
Message-Id: <1473353924-21627-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] scripts: add tool to scan for bashisms recipe shell scripts
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
X-List-Received-Date: Thu, 08 Sep 2016 16:58:49 -0000

Shell functions in bitbake are executed with /bin/sh so should be POSIX
compliant and not use Bash extensions, or at least only use extensions that are
implemented in both dash and ash (busybox).

This tool will extract all of the shell scripts from all recipes and run them
through checkbashisms (it assumes that checkbashisms is on $PATH).

There is a whitelist to filter out false-positives such as the use of $HOSTNAME
(a bashism) in functions where we have defined it, or using the 'type' builtin
which is supported by ash/dash.

[ YOCTO #8851 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/verify-bashisms | 116 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100755 scripts/verify-bashisms

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
new file mode 100755
index 0000000..0741e18
--- /dev/null
+++ b/scripts/verify-bashisms
@@ -0,0 +1,116 @@
+#!/usr/bin/env python3
+
+import sys, os, subprocess, re, shutil
+
+whitelist = (
+    # type is supported by dash
+    'if type systemctl >/dev/null 2>/dev/null; then',
+    'if type systemd-tmpfiles >/dev/null 2>/dev/null; then',
+    'if type update-rc.d >/dev/null 2>/dev/null; then',
+    'command -v',
+    # HOSTNAME is set locally
+    'buildhistory_single_commit "$CMDLINE" "$HOSTNAME"',
+    # False-positive, match is a grep not shell expression
+    'grep "^$groupname:[^:]*:[^:]*:\\([^,]*,\\)*$username\\(,[^,]*\\)*"',
+    # TODO verify dash's '. script args' behaviour
+    '. $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE'
+    )
+
+def is_whitelisted(s):
+    for w in whitelist:
+        if w in s:
+            return True
+    return False
+
+def process(recipe, function, script):
+    import tempfile
+
+    if not script.startswith("#!"):
+        script = "#! /bin/sh\n" + script
+
+    fn = tempfile.NamedTemporaryFile(mode="w+t")
+    fn.write(script)
+    fn.flush()
+
+    try:
+        subprocess.check_output(("checkbashisms.pl", fn.name), universal_newlines=True, stderr=subprocess.STDOUT)
+        # No bashisms, so just return
+        return
+    except subprocess.CalledProcessError as e:
+        # TODO check exit code is 1
+
+        # Replace the temporary filename with the function and split it
+        output = e.output.replace(fn.name, function).splitlines()
+        if len(results) % 2 != 0:
+            print("Unexpected output from checkbashism: %s" % str(output))
+            return
+
+        # Turn the output into a list of (message, source) values
+        result = []
+        # Check the results against the whitelist
+        for message, source in zip(output[0::2], output[1::2]):
+            if not is_whitelisted(source):
+                result.append((message, source))
+        return result
+
+def get_tinfoil():
+    scripts_path = os.path.dirname(os.path.realpath(__file__))
+    lib_path = scripts_path + '/lib'
+    sys.path = sys.path + [lib_path]
+    import scriptpath
+    scriptpath.add_bitbake_lib_path()
+    import bb.tinfoil
+    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil.prepare()
+    # tinfoil.logger.setLevel(logging.WARNING)
+    return tinfoil
+
+if __name__=='__main__':
+    import shutil
+    if shutil.which("checkbashisms.pl") is None:
+        print("Cannot find checkbashisms.pl on $PATH")
+        sys.exit(1)
+
+    tinfoil = get_tinfoil()
+
+    # This is only the default configuration and should iterate over
+    # recipecaches to handle multiconfig environments
+    pkg_pn = tinfoil.cooker.recipecaches[""].pkg_pn
+
+    # TODO: use argparse and have --help
+    if len(sys.argv) > 1:
+        initial_pns = sys.argv[1:]
+    else:
+        initial_pns = sorted(pkg_pn)
+
+    pns = []
+    print("Generating file list...")
+    for pn in initial_pns:
+        for fn in pkg_pn[pn]:
+            # There's no point checking multiple BBCLASSEXTENDed variants of the same recipe
+            realfn, _, _ = bb.cache.virtualfn2realfn(fn)
+            if realfn not in pns:
+                pns.append(realfn)
+
+
+    def func(fn):
+        result = []
+        data = tinfoil.parse_recipe_file(fn)
+        for key in data.keys():
+            if data.getVarFlag(key, "func", True) and not data.getVarFlag(key, "python", True):
+                script = data.getVar(key, False)
+                if not script: continue
+                #print ("%s:%s" % (fn, key))
+                r = process(fn, key, script)
+                if r: result.extend(r)
+        return fn, result
+
+    print("Scanning scripts...\n")
+    import multiprocessing
+    pool = multiprocessing.Pool()
+    for pn,results in pool.imap(func, pns):
+        if results:
+            print(pn)
+            for message,source in results:
+                print(" %s\n  %s" % (message, source))
+            print()
-- 
2.8.1


