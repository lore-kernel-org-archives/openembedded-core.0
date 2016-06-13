Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E7B3E65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:14:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2016 20:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,464,1459839600"; d="scan'208";a="718037645"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2016 20:14:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 15:13:57 +1200
Message-Id: <d1381672beea22b5f4cd7f420727b0cfbc175cb3.1465787274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/9] classes/populate_sdk_ext: eliminate double execution on install
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
X-List-Received-Date: Mon, 13 Jun 2016 03:14:45 -0000

Use the new BB_SETSCENE_ENFORCE functionality to avoid having to run
bitbake twice on installing the extensible SDK - we can now do it all in
one invocation and we should get more meaningful errors.

Part of the implementation of [YOCTO #9367].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  5 +++-
 meta/files/ext-sdk-prepare.py         | 52 +----------------------------------
 2 files changed, 5 insertions(+), 52 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index b9d9543..67297e5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -223,10 +223,13 @@ python copy_buildsystem () {
             # warning.
             f.write('SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK = "none"\n\n')
 
-            # Error if the sigs in the locked-signature file don't match
+            # Warn if the sigs in the locked-signature file don't match
             # the sig computed from the metadata.
             f.write('SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n\n')
 
+            # Set up whitelist for run on install
+            f.write('BB_SETSCENE_ENFORCE_WHITELIST = "%:* *:do_shared_workdir *:do_rm_work"\n\n')
+
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n')
 
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index bf0d033..3b33c0f 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -27,22 +27,6 @@ def exec_watch(cmd, **options):
 
     return process.returncode, buf
 
-def check_unexpected(lines, recipes):
-    """Check for unexpected output lines from dry run"""
-    unexpected = []
-    for line in lines.splitlines():
-        if 'Running task' in line:
-            for recipe in recipes:
-                if recipe in line:
-                    break
-            else:
-                line = line.split('Running', 1)[-1]
-                if 'do_rm_work' not in line:
-                    unexpected.append(line.rstrip())
-        elif 'Running setscene' in line:
-            unexpected.append(line.rstrip())
-    return unexpected
-
 def main():
     if len(sys.argv) < 2:
         sdk_targets = []
@@ -55,44 +39,10 @@ def main():
 
     print('Preparing SDK for %s...' % ', '.join(sdk_targets))
 
-    ret, out = exec_watch('bitbake %s --setscene-only' % ' '.join(sdk_targets))
+    ret, out = exec_watch('BB_SETSCENE_ENFORCE=1 bitbake %s' % ' '.join(sdk_targets))
     if ret:
         return ret
 
-    targetlist = []
-    for target in sdk_targets:
-        if ':' in target:
-            target = target.split(':')[0]
-        if not target in targetlist:
-            targetlist.append(target)
-
-    recipes = []
-    for target in targetlist:
-        try:
-            out = subprocess.check_output(('bitbake -e %s' % target).split(), stderr=subprocess.STDOUT)
-            for line in out.splitlines():
-                if line.startswith('FILE='):
-                    splitval = line.rstrip().split('=')
-                    if len(splitval) > 1:
-                        recipes.append(splitval[1].strip('"'))
-                    break
-        except subprocess.CalledProcessError as e:
-            print('ERROR: Failed to get recipe for target %s:\n%s' % (target, e.output))
-            return 1
-
-    try:
-        out = subprocess.check_output('bitbake %s -n' % ' '.join(sdk_targets), stderr=subprocess.STDOUT, shell=True)
-        unexpected = check_unexpected(out, recipes)
-    except subprocess.CalledProcessError as e:
-        print('ERROR: Failed to execute dry-run:\n%s' % e.output)
-        return 1
-
-    if unexpected:
-        print('ERROR: Unexpected tasks or setscene left over to be executed:')
-        for line in unexpected:
-            print('  ' + line)
-        return 1
-
 if __name__ == "__main__":
     try:
         ret = main()
-- 
2.5.5


