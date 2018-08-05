Return-Path: <jpewhacker@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id E19A078AA7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 19:43:39 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id 139-v6so2856953ywg.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NNE/k8GOUP6rA6hpQKsXPQWIITggV4A/9nmY5MraWw0=;
	b=hNJJh6b0D4EBLJeMmwz0+aT/e+FzYZ+aPPls8UTBrdftNaD+gg6IJAfxlwCYt/ibSk
	qH2DXJw52V8LW4k1b+yGsSIUkOP2scAcWGILapueWBoy0KrOK92EAaquvdLDTxyyvl8L
	KR5Ux6yD98sawxHq2xDpQcbUEoDv74We1sFvwfDsaVrc7Tn5oKuS5RPb904QBLIvTxJR
	hvTJ4BoOR0fK5Hu49AxZOdAOHfXyIlHzmD1OuwrE3+z0mnQQOMGlel+8Jz/s4lQ76F4f
	LigcwQzNru48zW+nDKtxISH1u0+Y2kqKMfC9qn+KQqsPsF2yBfYKjxXG/Nyjk44jZPhe
	FuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NNE/k8GOUP6rA6hpQKsXPQWIITggV4A/9nmY5MraWw0=;
	b=COSDxpK9xee2yXIrM5XXYhif13vFINakV1nZ1Dgfikl2cDZuIGb3QheBv91AC8zKQ8
	JA/PExOoEItfBo5Gq1XRvdU8hqjl1Ng2s15rBbRZqepm/IetU4w3eZWHK3M5g64G1hK+
	/uRFQohOGgkOcDvQ72QQL1cxOGJgzZXrtxzVONLD0tNG7MOeyXh0OrJRymdU8ndXTKsL
	Pt8MRSk0HnBpE0f5WYjZKHRvOQ4LSs5CzVcPhBBShSU1qxdur1gWtPzSm3xI3kbl9401
	1i3NE2VX2N7XSH/3eaHURdnJz3i4bfWmzaC6Jzvy59rV0rqg1v3vRlOJdx3TwOjONJSj
	Mbnw==
X-Gm-Message-State: AOUpUlGE/DpK5Qe2km7Fx9cCbT0BiofhLnWNMr3cToMscH+dwQwn0vQb
	IhVvsJgxvtEVd0l8vXbsWi+/F7G6
X-Google-Smtp-Source: AAOMgpc4FJ9c2t0Ox14Bpg21c0NA9IpL/jZ1Ui3o2pD+ZkiF/xyTRrfVnOOn71Ugf9SAXDmeGsqA0g==
X-Received: by 2002:a0d:e447:: with SMTP id
	n68-v6mr6689717ywe.112.1533498220669; 
	Sun, 05 Aug 2018 12:43:40 -0700 (PDT)
Received: from localhost.localdomain
	([2605:a601:21d1:5200:620a:c230:ada8:3135])
	by smtp.gmail.com with ESMTPSA id
	z190-v6sm5309822ywd.97.2018.08.05.12.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Aug 2018 12:43:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2018 14:43:10 -0500
Message-Id: <20180805194310.22049-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] classes/sanity: Clean up getstatusoutput usage
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
X-List-Received-Date: Sun, 05 Aug 2018 19:43:40 -0000

Replace usage of oe.utils.getstatusoutput() with direct subprocess
calls.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/sanity.bbclass | 67 +++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e0e57ceec1f..4e8eae8946d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -336,11 +336,11 @@ def check_path_length(filepath, pathname, limit):
     return ""
 
 def get_filesystem_id(path):
-    status, result = oe.utils.getstatusoutput("stat -f -c '%s' '%s'" % ("%t", path))
-    if status == 0:
-        return result
-    else:
-        bb.warn("Can't get the filesystem id of: %s" % path)
+    import subprocess
+    try:
+        return subprocess.check_output(["stat", "-f", "-c", "%t", path]).decode('utf-8')
+    except subprocess.CalledProcessError:
+        bb.warn("Can't get filesystem id of: %s" % path)
         return None
 
 # Check that the path isn't located on nfs.
@@ -463,7 +463,7 @@ def check_patch_version(sanity_data):
     import re, subprocess
 
     try:
-        result = subprocess.check_output(["patch", "--version"], stderr=subprocess.STDOUT, universal_newlines=True)
+        result = subprocess.check_output(["patch", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
         version = re.search(r"[0-9.]+", result.splitlines()[0]).group()
         if LooseVersion(version) < LooseVersion("2.7"):
             return "Your version of patch is older than 2.7 and has bugs which will break builds. Please install a newer version of patch.\n"
@@ -476,9 +476,12 @@ def check_patch_version(sanity_data):
 # Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
 def check_make_version(sanity_data):
     from distutils.version import LooseVersion
-    status, result = oe.utils.getstatusoutput("make --version")
-    if status != 0:
-        return "Unable to execute make --version, exit code %d\n" % status
+    import subprocess
+
+    try:
+        result = subprocess.check_output(['make', '--version'], stderr=subprocess.STDOUT).decode('utf-8')
+    except subprocess.CalledProcessError as e:
+        return "Unable to execute make --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
     if LooseVersion(version) == LooseVersion("3.82"):
         # Construct a test file
@@ -493,18 +496,18 @@ def check_make_version(sanity_data):
         f.close()
 
         # Check if make 3.82 has been patched
-        status,result = oe.utils.getstatusoutput("make -f makefile_test")
-
-        os.remove("makefile_test")
-        if os.path.exists("makefile_test_a.c"):
-            os.remove("makefile_test_a.c")
-        if os.path.exists("makefile_test_b.c"):
-            os.remove("makefile_test_b.c")
-        if os.path.exists("makefile_test.a"):
-            os.remove("makefile_test.a")
-
-        if status != 0:
+        try:
+            subprocess.check_call(['make', '-f', 'makefile_test'])
+        except subprocess.CalledProcessError as e:
             return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
+        finally:
+            os.remove("makefile_test")
+            if os.path.exists("makefile_test_a.c"):
+                os.remove("makefile_test_a.c")
+            if os.path.exists("makefile_test_b.c"):
+                os.remove("makefile_test_b.c")
+            if os.path.exists("makefile_test.a"):
+                os.remove("makefile_test.a")
     return None
 
 
@@ -512,9 +515,11 @@ def check_make_version(sanity_data):
 # but earlier versions do not; this needs to work properly for sstate
 def check_tar_version(sanity_data):
     from distutils.version import LooseVersion
-    status, result = oe.utils.getstatusoutput("tar --version")
-    if status != 0:
-        return "Unable to execute tar --version, exit code %d\n" % status
+    import subprocess
+    try:
+        result = subprocess.check_output(["tar", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
+    except subprocess.CalledProcessError as e:
+        return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.24"):
         return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
@@ -525,9 +530,11 @@ def check_tar_version(sanity_data):
 # The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
 def check_git_version(sanity_data):
     from distutils.version import LooseVersion
-    status, result = oe.utils.getstatusoutput("git --version 2> /dev/null")
-    if status != 0:
-        return "Unable to execute git --version, exit code %d\n" % status
+    import subprocess
+    try:
+        result = subprocess.check_output(["git", "--version"], stderr=subprocess.DEVNULL).decode('utf-8')
+    except subprocess.CalledProcessError as e:
+        return "Unable to execute git --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
     if LooseVersion(version) < LooseVersion("1.8.3.1"):
         return "Your version of git is older than 1.8.3.1 and has bugs which will break builds. Please install a newer version of git.\n"
@@ -535,13 +542,15 @@ def check_git_version(sanity_data):
 
 # Check the required perl modules which may not be installed by default
 def check_perl_modules(sanity_data):
+    import subprocess
     ret = ""
     modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper" )
     errresult = ''
     for m in modules:
-        status, result = oe.utils.getstatusoutput("perl -e 'use %s'" % m)
-        if status != 0:
-            errresult += result
+        try:
+            subprocess.check_output(["perl", "-e", "use %s" % m])
+        except subprocess.CalledProcessError as e:
+            errresult += e.output
             ret += "%s " % m
     if ret:
         return "Required perl module(s) not found: %s\n\n%s\n" % (ret, errresult)
-- 
2.17.1


