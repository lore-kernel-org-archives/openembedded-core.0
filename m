Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 87FD177B5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490705004; x=1522241004;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KyljanowkZ/ZI/4wW5tUwImNecDlgB6H1y6mQVK8dy4=;
	b=BBedL6sdKYr3Sqs7wwj6KYwqOODf+KAhfJnJRAPkDWLyoldUrXgPMgrM
	5SGH+CABlu4ZsMkk9j6nT1MmOc0D4g==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="948995694"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 28 Mar 2017 05:43:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 023AD6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:16 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:41:05 +0300
Message-Id: <f9d281a81336a50508b48bbbb873d2ede5ee5f06.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 8/9] wic: remove unused code from runner module
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:23 -0000

Removed unused APIs 'outs' and 'quiet'.
Removed 'catch' parameter from runner.runtool API as wic
uses only one value of it. Removed the code that handles
unused values of 'catch' parameter.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/misc.py   | 14 ++++++------
 scripts/lib/wic/utils/runner.py | 50 +++++------------------------------------
 2 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index c941112..307779a 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -59,7 +59,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "syslinux": "syslinux"
                  }
 
-def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
+def _exec_cmd(cmd_and_args, as_shell=False):
     """
     Execute command, catching stderr, stdout
 
@@ -70,9 +70,9 @@ def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
     logger.debug(args)
 
     if as_shell:
-        ret, out = runner.runtool(cmd_and_args, catch)
+        ret, out = runner.runtool(cmd_and_args)
     else:
-        ret, out = runner.runtool(args, catch)
+        ret, out = runner.runtool(args)
     out = out.strip()
     if ret != 0:
         raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
@@ -84,14 +84,14 @@ def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
     return ret, out
 
 
-def exec_cmd(cmd_and_args, as_shell=False, catch=3):
+def exec_cmd(cmd_and_args, as_shell=False):
     """
     Execute command, return output
     """
-    return _exec_cmd(cmd_and_args, as_shell, catch)[1]
+    return _exec_cmd(cmd_and_args, as_shell)[1]
 
 
-def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
+def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     """
     Execute native command, catching stderr, stdout
 
@@ -118,7 +118,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
 
     # If the command isn't in the native sysroot say we failed.
     if spawn.find_executable(args[0], native_paths):
-        ret, out = _exec_cmd(native_cmd_and_args, True, catch)
+        ret, out = _exec_cmd(native_cmd_and_args, True)
     else:
         ret = 127
         out = "can't find native executable %s in %s" % (args[0], native_paths)
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index 348557a..4aa00fb 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -14,32 +14,17 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-import logging
-import os
 import subprocess
 
 from wic import WicError
 
-logger = logging.getLogger('wic')
-
-def runtool(cmdln_or_args, catch=1):
+def runtool(cmdln_or_args):
     """ wrapper for most of the subprocess calls
     input:
         cmdln_or_args: can be both args and cmdln str (shell=True)
-        catch: 0, quitely run
-               1, only STDOUT
-               2, only STDERR
-               3, both STDOUT and STDERR
     return:
-        (rc, output)
-        if catch==0: the output will always None
+        rc, output
     """
-
-    if catch not in (0, 1, 2, 3):
-        # invalid catch selection, will cause exception, that's good
-        return None
-
     if isinstance(cmdln_or_args, list):
         cmd = cmdln_or_args[0]
         shell = False
@@ -48,26 +33,13 @@ def runtool(cmdln_or_args, catch=1):
         cmd = shlex.split(cmdln_or_args)[0]
         shell = True
 
-    if catch != 3:
-        dev_null = os.open("/dev/null", os.O_WRONLY)
-
-    if catch == 0:
-        sout = dev_null
-        serr = dev_null
-    elif catch == 1:
-        sout = subprocess.PIPE
-        serr = dev_null
-    elif catch == 2:
-        sout = dev_null
-        serr = subprocess.PIPE
-    elif catch == 3:
-        sout = subprocess.PIPE
-        serr = subprocess.STDOUT
+    sout = subprocess.PIPE
+    serr = subprocess.STDOUT
 
     try:
         process = subprocess.Popen(cmdln_or_args, stdout=sout,
                                    stderr=serr, shell=shell)
-        (sout, serr) = process.communicate()
+        sout, serr = process.communicate()
         # combine stdout and stderr, filter None out and decode
         out = ''.join([out.decode('utf-8') for out in [sout, serr] if out])
     except OSError as err:
@@ -76,15 +48,5 @@ def runtool(cmdln_or_args, catch=1):
             raise WicError('Cannot run command: %s, lost dependency?' % cmd)
         else:
             raise # relay
-    finally:
-        if catch != 3:
-            os.close(dev_null)
-
-    return (process.returncode, out)
-
-def outs(cmdln_or_args, catch=1):
-    # get the outputs of tools
-    return runtool(cmdln_or_args, catch)[1].strip()
 
-def quiet(cmdln_or_args):
-    return runtool(cmdln_or_args, catch=0)[0]
+    return process.returncode, out
-- 
2.1.4


