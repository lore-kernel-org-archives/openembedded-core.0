Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF6D73211
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 18:48:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2016 10:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,558,1449561600"; d="scan'208";a="879952908"
Received: from rusilaw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.174])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2016 10:48:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 07:47:47 +1300
Message-Id: <b12177a5a627861a191addeec5294548c38949ba.1452624350.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452624350.git.paul.eggleton@linux.intel.com>
References: <cover.1452624350.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452624350.git.paul.eggleton@linux.intel.com>
References: <cover.1452624350.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] classes/populate_sdk_ext: check that extensible SDK prepared correctly
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
X-List-Received-Date: Tue, 12 Jan 2016 18:48:28 -0000

After the change to use --setscene-only when running bitbake to prepare
the SDK at the end of installation, add a check that the SDK got
prepared correctly by doing a dry-run and looking at the output for any
real tasks that we don't expect. In order to make this easier, the
preparation shell script was rewritten in python.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  5 +-
 meta/files/ext-sdk-prepare.py         | 92 +++++++++++++++++++++++++++++++++++
 meta/files/ext-sdk-prepare.sh         |  8 ---
 3 files changed, 94 insertions(+), 11 deletions(-)
 create mode 100644 meta/files/ext-sdk-prepare.py
 delete mode 100644 meta/files/ext-sdk-prepare.sh

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 69e13ab..4d8d2a6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -224,7 +224,7 @@ install_tools() {
 
 	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}
 
-	install -m 0755 ${COREBASE}/meta/files/ext-sdk-prepare.sh ${SDK_OUTPUT}/${SDKPATH}
+	install -m 0644 ${COREBASE}/meta/files/ext-sdk-prepare.py ${SDK_OUTPUT}/${SDKPATH}
 }
 
 # Since bitbake won't run as root it doesn't make sense to try and install
@@ -270,9 +270,8 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && $target_sdk_dir/ext-sdk-prepare.sh $target_sdk_dir '${SDK_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py '${SDK_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 	fi
-	rm -f $target_sdk_dir/ext-sdk-prepare.sh
 	echo done
 }
 
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
new file mode 100644
index 0000000..143e0fe
--- /dev/null
+++ b/meta/files/ext-sdk-prepare.py
@@ -0,0 +1,92 @@
+#!/usr/bin/env python
+
+# Prepare the build system within the extensible SDK
+
+import sys
+import os
+import subprocess
+
+def exec_watch(cmd, **options):
+    """Run program with stdout shown on sys.stdout"""
+    if isinstance(cmd, basestring) and not "shell" in options:
+        options["shell"] = True
+
+    process = subprocess.Popen(
+        cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, **options
+    )
+
+    buf = ''
+    while True:
+        out = process.stdout.read(1)
+        if out:
+            sys.stdout.write(out)
+            sys.stdout.flush()
+            buf += out
+        elif out == '' and process.poll() != None:
+            break
+
+    return process.returncode, buf
+
+
+def main():
+    if len(sys.argv) < 2:
+        print('Please specify target to prepare with')
+        return 1
+
+    sdk_targets = ' '.join(sys.argv[1:]).split()
+    print('Preparing SDK for %s...' % ', '.join(sdk_targets))
+
+    ret, out = exec_watch('bitbake %s --setscene-only' % ' '.join(sdk_targets))
+    if ret:
+        return ret
+
+    targetlist = []
+    for target in sdk_targets:
+        if ':' in target:
+            target = target.split(':')[0]
+        if not target in targetlist:
+            targetlist.append(target)
+
+    recipes = []
+    for target in targetlist:
+        try:
+            out = subprocess.check_output(('bitbake -e %s' % target).split(), stderr=subprocess.STDOUT)
+            for line in out.splitlines():
+                if line.startswith('FILE='):
+                    splitval = line.rstrip().split('=')
+                    if len(splitval) > 1:
+                        recipes.append(splitval[1].strip('"'))
+                    break
+        except subprocess.CalledProcessError as e:
+            print('ERROR: Failed to get recipe for target %s:\n%s' % (target, e.output))
+            return 1
+
+    try:
+        out = subprocess.check_output('bitbake %s -n' % ' '.join(sdk_targets), stderr=subprocess.STDOUT, shell=True)
+        unexpected = []
+        for line in out.splitlines():
+            if 'Running task' in line:
+                for recipe in recipes:
+                    if recipe in line:
+                        break
+                else:
+                    line = line.split('Running', 1)[-1]
+                    unexpected.append(line.rstrip())
+    except subprocess.CalledProcessError as e:
+        print('ERROR: Failed to execute dry-run:\n%s' % e.output)
+        return 1
+
+    if unexpected:
+        print('ERROR: Unexpected tasks left over to be executed:')
+        for line in unexpected:
+            print('  ' + line)
+        return 1
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
diff --git a/meta/files/ext-sdk-prepare.sh b/meta/files/ext-sdk-prepare.sh
deleted file mode 100644
index b3f5d93..0000000
--- a/meta/files/ext-sdk-prepare.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-# Prepare the build system within the extensible SDK
-
-target_sdk_dir="$1"
-sdk_targets="$2"
-
-bitbake $sdk_targets --setscene-only || exit 1
-- 
2.5.0


