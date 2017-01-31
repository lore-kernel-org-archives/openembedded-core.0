Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C922071E50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:50:57 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id j13so130155411iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kkd3o65KmOfebc32V/G4J5vU4zXMDFKXdfgFKNPvcEc=;
	b=NTULZk7HeDIHrySk3/Rhk0CgxmAYid0J7FsHfwO0+K5gwx32btobO862+51PTOuD6e
	uv7G+W8ZU16VTaCCetZkvAgLGfDBLytvUkKJVPQt88/aG2lDnr+HtQkWxqXzYO+fMH3T
	OLM4Y0kWZFV4uH2WEi/CrrBO39AtzjOyL6Ymjejrpxq+Yks6aAM6xMN5f1wd6r4Vqi1m
	lfMrCXs11JYE4qMeEcM9nZOM553n29KF1Xy1BqoaBYv9PUrAFxHo9PqhS/12lzruN0x5
	ykh6RzkyC7Ws4W3l/r1AngDBr9nB/G/z5Wibr4hwjQbFER8kxJrz0MIldmcUlQmpewEr
	vrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kkd3o65KmOfebc32V/G4J5vU4zXMDFKXdfgFKNPvcEc=;
	b=k0CqBdZaayNQOi9FjBMTccs49mY1YmX7C0ZopQzoWy8Q/lXqhs5cPoijN9LbWLtGd2
	8xEymypAUvkKZ9Ms0g7Hch2tVoIPqYj095l4e9XRwjN505/ZpZfEd03JU8jHKm42DZo7
	fawG9JVKxupePDxwhBXyfKBSU/Ax88zIyi5gbdqUhOJ12msZtBX37ZMtTWK3wBwPJSy5
	+jno6R8uT8485vQOnUxBqJtIKPtWDTg1LVJCGgqc+CQbNhGeBldTdV3kBawyMnoPhLqE
	f+xT9mvREhUJqwxMwHAISHuqy35kIzJsF9xI/XUSyD38sR6NTwATaLVajtWOiMRUsjhJ
	hLkA==
X-Gm-Message-State: AIkVDXI7z2utTJkS/I3m0+uaZZ8z7wz9rFBgBhxb9n7KALk5yT71CHDThrucwaeNzf9JXC1L
X-Received: by 10.107.176.21 with SMTP id z21mr27111347ioe.161.1485867057718; 
	Tue, 31 Jan 2017 04:50:57 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:56 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:31 +0100
Message-Id: <7ddd977a52c501a6a64b6b31f0ffba3bcbb2c11a.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 6/8] verify-bashisms: check scripts only once, include original file and line
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
X-List-Received-Date: Tue, 31 Jan 2017 12:50:58 -0000

Several scripts that are defined in .bbclass files end up in multiple
different recipes. It's better (faster, less repetitive error reports)
to check them only once.

In addition, the real information for the developer is where he can
find the script, not which recipe file uses it. verify-bashisms now
prints the original file instead of the recipe whenever possible
(i.e. 'filename' is set) and also bumps the line number so that it is
relative to the file and not the script.

Example with one real error and one added just for testing:

  $ verify-bashisms core-image-minimal core-image-sato
  Loading cache: 100% |#################################################################################| Time: 0:00:00
  Loaded 2935 entries from dependency cache.
  Parsing recipes: 100% |###############################################################################| Time: 0:00:01
  Parsing of 2137 .bb files complete (2101 cached, 36 parsed). 2935 targets, 412 skipped, 0 masked, 0 errors.
  Generating scripts...
  Scanning scripts...

  /.../openembedded-core/meta/classes/populate_sdk_ext.bbclass
   possible bashism in install_tools line 515 (should be 'b = a'):
  	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" -a ! -e $unfsd_path ] ; then
   possible bashism in install_tools line 521 (type):
            type fixme

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/verify-bashisms | 56 +++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index df071e3..7283980 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -22,7 +22,9 @@ def is_whitelisted(s):
             return True
     return False
 
-def process(recipe, function, script):
+SCRIPT_LINENO_RE = re.compile(r' line (\d+) ')
+
+def process(filename, function, lineno, script):
     import tempfile
 
     if not script.startswith("#!"):
@@ -45,13 +47,25 @@ def process(recipe, function, script):
             print("Unexpected output from checkbashism: %s" % str(output))
             return
 
-        # Turn the output into a list of (message, source) values
+        # Turn the output into a single string like this:
+        # /.../foobar.bb
+        #  possible bashism in updatercd_postrm line 2 (type):
+        #   if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
+        #  ...
+        #   ...
         result = []
         # Check the results against the whitelist
         for message, source in zip(output[0::2], output[1::2]):
             if not is_whitelisted(source):
-                result.append((message, source))
-        return result
+                if lineno is not None:
+                    message = SCRIPT_LINENO_RE.sub(lambda m: ' line %d ' % (int(m.group(1)) + int(lineno) - 1),
+                                                   message)
+                result.extend([' ' + message, '  ' + source])
+        if result:
+            result.insert(0, filename)
+            return '\n'.join(result)
+        else:
+            return None
 
 def get_tinfoil():
     scripts_path = os.path.dirname(os.path.realpath(__file__))
@@ -75,12 +89,8 @@ if __name__=='__main__':
     # initializing the pool and connecting to the
     # bitbake server is crucial, don't change it.
     def func(item):
-        fn, scripts = item
-        result = []
-        for key, script in scripts:
-            r = process(fn, key, script)
-            if r: result.extend(r)
-        return fn, result
+        (filename, key, lineno), script = item
+        return process(filename, key, lineno, script)
 
     import multiprocessing
     pool = multiprocessing.Pool()
@@ -97,27 +107,33 @@ if __name__=='__main__':
     else:
         initial_pns = sorted(pkg_pn)
 
-    pns = {}
+    pns = set()
+    scripts = {}
     print("Generating scripts...")
     for pn in initial_pns:
         for fn in pkg_pn[pn]:
             # There's no point checking multiple BBCLASSEXTENDed variants of the same recipe
+            # (at least in general - there is some risk that the variants contain different scripts)
             realfn, _, _ = bb.cache.virtualfn2realfn(fn)
             if realfn not in pns:
+                pns.add(realfn)
                 data = tinfoil.parse_recipe_file(realfn)
-                scripts = []
                 for key in data.keys():
                     if data.getVarFlag(key, "func") and not data.getVarFlag(key, "python"):
                         script = data.getVar(key, False)
                         if script:
-                            scripts.append((key, script))
-                pns[realfn] = scripts
+                            filename = data.getVarFlag(key, "filename")
+                            lineno = data.getVarFlag(key, "lineno")
+                            # There's no point in checking a function multiple
+                            # times just because different recipes include it.
+                            # We identify unique scripts by file, name, and (just in case)
+                            # line number.
+                            attributes = (filename or realfn, key, lineno)
+                            scripts.setdefault(attributes, script)
+
 
     print("Scanning scripts...\n")
-    for pn, results in pool.imap(func, pns.items()):
-        if results:
-            print(pn)
-            for message,source in results:
-                print(" %s\n  %s" % (message, source))
-            print()
+    for result in pool.imap(func, scripts.items()):
+        if result:
+            print(result)
     tinfoil.shutdown()
-- 
git-series 0.9.1

