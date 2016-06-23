Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0CB60123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730893"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:07:05 +1200
Message-Id: <54021007c5c58d58278595063c1eccabd6326338.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 09/10] classes/populate_sdk_ext: show progress when preparing build system
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:56 -0000

During the extensible SDK installation process the final step is to
prepare the internal copy of the build system. This can take some time,
especially if you have SDK_EXT_TYPE set to "minimal" (downloading
sstate artifacts) and SDK_INCLUDE_PKGDATA set to "1" (restoring
pkgdata for world). To make this a bit less painful, use BitBake's new
quiet mode to display status during this operation so you have some idea
of how it's progressing; instead of redirecting the output to
preparing_build_system.log we grab the last console log and append it
instead.

Part of the implementation for [YOCTO #9613].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  2 +-
 meta/files/ext-sdk-prepare.py         | 67 ++++++++++++++++++++++-------------
 2 files changed, 44 insertions(+), 25 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index df39ff6..5e1a485 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -427,7 +427,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py '${SDK_INSTALL_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE for a slightly more detailed log"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "ERROR: SDK preparation failed: see $LOGFILE for a slightly more detailed log"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 		rm $target_sdk_dir/ext-sdk-prepare.py
 	fi
 	echo done
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 3b33c0f..8b15982 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -5,43 +5,62 @@
 import sys
 import os
 import subprocess
+import signal
 
-def exec_watch(cmd, **options):
-    """Run program with stdout shown on sys.stdout"""
-    if isinstance(cmd, str) and not "shell" in options:
-        options["shell"] = True
+def reenable_sigint():
+    signal.signal(signal.SIGINT, signal.SIG_DFL)
 
-    process = subprocess.Popen(
-        cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, **options
-    )
-
-    buf = ''
-    while True:
-        out = process.stdout.read(1)
-        if out:
-            sys.stdout.write(out)
-            sys.stdout.flush()
-            buf += out
-        elif out == '' and process.poll() != None:
-            break
+def run_command_interruptible(cmd):
+    """
+    Run a command with output displayed on the console, but ensure any Ctrl+C is
+    processed only by the child process.
+    """
+    signal.signal(signal.SIGINT, signal.SIG_IGN)
+    try:
+        ret = subprocess.call(cmd, shell=True, preexec_fn=reenable_sigint)
+    finally:
+        signal.signal(signal.SIGINT, signal.SIG_DFL)
+    return ret
 
-    return process.returncode, buf
+def get_last_consolelog():
+    '''Return the most recent console log file'''
+    logdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tmp', 'log', 'cooker')
+    if os.path.exists(logdir):
+        mcdir = os.listdir(logdir)
+        if mcdir:
+            logdir = os.path.join(logdir, mcdir[0])
+            logfiles = [os.path.join(logdir, fn) for fn in os.listdir(logdir)]
+            logfiles.sort(key=os.path.getmtime)
+            if logfiles:
+                return os.path.join(logdir, logfiles[-1])
+    return None
 
 def main():
     if len(sys.argv) < 2:
+        print('Please specify output log file')
+        return 1
+    logfile = sys.argv[1]
+    if len(sys.argv) < 3:
         sdk_targets = []
     else:
-        sdk_targets = ' '.join(sys.argv[1:]).split()
+        sdk_targets = ' '.join(sys.argv[2:]).split()
     if not sdk_targets:
         # Just do a parse so the cache is primed
-        ret, _ = exec_watch('bitbake -p')
+        ret = run_command_interruptible('bitbake -p --quiet')
         return ret
 
-    print('Preparing SDK for %s...' % ', '.join(sdk_targets))
+    with open(logfile, 'a') as logf:
+        logf.write('Preparing SDK for %s...\n' % ', '.join(sdk_targets))
 
-    ret, out = exec_watch('BB_SETSCENE_ENFORCE=1 bitbake %s' % ' '.join(sdk_targets))
-    if ret:
-        return ret
+        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
+        lastlog = get_last_consolelog()
+        if lastlog:
+            with open(lastlog, 'r') as f:
+                for line in f:
+                    logf.write(line)
+        if ret:
+            print('ERROR: SDK preparation failed: see %s' % logfile)
+            return ret
 
 if __name__ == "__main__":
     try:
-- 
2.5.5


