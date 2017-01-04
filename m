Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD8A71A13
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 23:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v04NmvLu032475; Wed, 4 Jan 2017 23:48:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BFQqn2G6mf8R; Wed,  4 Jan 2017 23:48:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v04NmsVm032472
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 4 Jan 2017 23:48:55 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cOvIc-0002cD-7v; Wed, 04 Jan 2017 23:48:54 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 23:48:53 +0000
Message-Id: <1483573733-10014-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe-selftest: Improve BUILDDIR environment handling
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
X-List-Received-Date: Wed, 04 Jan 2017 23:48:58 -0000

Its possible something (like bitbake/tinfoil2) may mess around with the
environment and using the enviroment as a global variable store isn't
particularly nice anyway.

This patch changes the BUILDDIR usages so that the environment isn't used
as a global store and a global variable is used instead. Whilst that
is still not perfect, it does avoid the current double and triple backtraces
we're seeing where tinfoil2/bitbake has trampled the enviroment leading
to failures of failures making debugging even harder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-selftest | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index bfcea66..e166521 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -111,9 +111,13 @@ def get_args_parser():
                         help='Submit test results to a repository')
     return parser
 
+builddir = None
+
 
 def preflight_check():
 
+    global builddir
+
     log.info("Checking that everything is in order before running the tests")
 
     if not os.environ.get("BUILDDIR"):
@@ -135,7 +139,7 @@ def preflight_check():
     return True
 
 def add_include():
-    builddir = os.environ.get("BUILDDIR")
+    global builddir
     if "#include added by oe-selftest.py" \
         not in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
             log.info("Adding: \"include selftest.inc\" in local.conf")
@@ -149,7 +153,7 @@ def add_include():
                     "\n#include added by oe-selftest.py\ninclude bblayers.inc")
 
 def remove_include():
-    builddir = os.environ.get("BUILDDIR")
+    global builddir
     if builddir is None:
         return
     if "#include added by oe-selftest.py" \
@@ -165,18 +169,21 @@ def remove_include():
                     "\n#include added by oe-selftest.py\ninclude bblayers.inc")
 
 def remove_inc_files():
+    global builddir
+    if builddir is None:
+        return
     try:
-        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/selftest.inc"))
+        os.remove(os.path.join(builddir, "conf/selftest.inc"))
         for root, _, files in os.walk(get_test_layer()):
             for f in files:
                 if f == 'test_recipe.inc':
                     os.remove(os.path.join(root, f))
-    except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
+    except OSError as e:
         pass
 
     for incl_file in ['conf/bblayers.inc', 'conf/machine.inc']:
         try:
-            os.remove(os.path.join(os.environ.get("BUILDDIR"), incl_file))
+            os.remove(os.path.join(builddir, incl_file))
         except:
             pass
 
@@ -394,7 +401,7 @@ def coverage_setup(coverage_source, coverage_include, coverage_omit):
     """ Set up the coverage measurement for the testcases to be run """
     import datetime
     import subprocess
-    builddir = os.environ.get("BUILDDIR")
+    global builddir
     pokydir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
     curcommit= subprocess.check_output(["git", "--git-dir", os.path.join(pokydir, ".git"), "rev-parse", "HEAD"]).decode('utf-8')
     coveragerc = "%s/.coveragerc" % builddir
-- 
2.7.4


