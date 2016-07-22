Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 256816067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:38:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 05:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000491775"
Received: from lwong9-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.13])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 05:38:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 00:38:11 +1200
Message-Id: <1e809997082d77b5db2ce8c97559b880dfc13bb5.1469190931.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/8] classes/populate_sdk_ext: filter sstate within the extensible SDK
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
X-List-Received-Date: Fri, 22 Jul 2016 12:38:54 -0000

Use the new oe-check-sstate to filter the sstate artifacts shipped with
the extensible SDK by effectively running bitbake within the produced
eSDK and and getting it to tell us which tasks it will restore from
sstate. This has several benefits:

1) We drop the *-initial artifacts from the minimal + toolchain eSDK.
   This still leaves us with a reasonably large SDK for this
   configuration, however it does pave the way for future reductions
   since we are actually filtering by what will be expected to be there
   on install rather than hoping that whatever cuts we make will match.

2) We verify bitbake's basic operation within the eSDK, i.e. that
   we haven't messed up the configuration

3) We verify that the sstate artifacts we expect to be present are
   present (at least in the sstate cache for the build producing the
   eSDK). Outside deletion of sstate artifacts has been a problem up to
   now, and this should at least catch that earlier i.e. during the
   build rather than when someone tries to install the eSDK.

This does add a couple of minutes to the do_populate_sdk_ext time, but
it seems like the most appropriate way to handle this.

Should mostly address [YOCTO #9083] and [YOCTO #9626].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 78 ++++++++++++++++++++++++++++++++---
 meta/lib/oe/copy_buildsystem.py       | 22 +++++++++-
 scripts/gen-lockedsig-cache           | 16 ++++++-
 3 files changed, 106 insertions(+), 10 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 211a022..ce8c8ff 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -85,6 +85,60 @@ SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
 SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} Extensible SDK"
 
+def clean_esdk_builddir(sdkbasepath):
+    """Clean up traces of the fake build for create_filtered_tasklist()"""
+    import shutil
+    cleanpaths = 'tmp cache conf/sanity_info conf/templateconf.cfg downloads'.split()
+    for pth in cleanpaths:
+        fullpth = os.path.join(sdkbasepath, pth)
+        if os.path.isdir(fullpth):
+            shutil.rmtree(fullpth)
+        elif os.path.isfile(fullpth):
+            os.remove(fullpth)
+
+def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
+    """
+    Create a filtered list of tasks. Also double-checks that the build system
+    within the SDK basically works and required sstate artifacts are available.
+    """
+    import tempfile
+    import shutil
+    import oe.copy_buildsystem
+
+    # Create a temporary build directory that we can pass to the env setup script
+    shutil.copyfile(sdkbasepath + '/conf/local.conf', sdkbasepath + '/conf/local.conf.bak')
+    try:
+        with open(sdkbasepath + '/conf/local.conf', 'a') as f:
+            f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR', True))
+            f.write('SSTATE_MIRRORS_forcevariable = ""\n')
+
+        # Unfortunately the default SDKPATH (or even a custom value) may contain characters that bitbake
+        # will not allow in its COREBASE path, so we need to rename the directory temporarily
+        temp_sdkbasepath = d.getVar('SDK_OUTPUT', True) + '/tmp-renamed-sdk'
+        # Delete any existing temp dir
+        try:
+            shutil.rmtree(temp_sdkbasepath)
+        except FileNotFoundError:
+            pass
+        os.rename(sdkbasepath, temp_sdkbasepath)
+        try:
+            cmdprefix = '. %s .; ' % conf_initpath
+            logfile = d.getVar('WORKDIR', True) + '/tasklist_bb_log.txt'
+            try:
+                oe.copy_buildsystem.check_sstate_task_list(d, get_sdk_install_targets(d), tasklistfile, cmdprefix=cmdprefix, cwd=temp_sdkbasepath, logfile=logfile)
+            except bb.process.ExecutionError as e:
+                msg = 'Failed to generate filtered task list for extensible SDK:\n%s' %  e.stdout.rstrip()
+                if 'attempted to execute unexpectedly and should have been setscened' in e.stdout:
+                    msg += '\n----------\n\nNOTE: "attempted to execute unexpectedly and should have been setscened" errors indicate this may be caused by missing sstate artifacts that were likely produced in earlier builds, but have been subsequently deleted for some reason.\n'
+                bb.fatal(msg)
+        finally:
+            os.rename(temp_sdkbasepath, sdkbasepath)
+        # Clean out residue of running bitbake, which check_sstate_task_list()
+        # will effectively do
+        clean_esdk_builddir(sdkbasepath)
+    finally:
+        os.replace(sdkbasepath + '/conf/local.conf.bak', sdkbasepath + '/conf/local.conf')
+
 python copy_buildsystem () {
     import re
     import shutil
@@ -301,6 +355,15 @@ python copy_buildsystem () {
     # uninative.bbclass sets NATIVELSBSTRING to 'universal'
     fixedlsbstring = 'universal'
 
+    sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1')
+    sdk_ext_type = d.getVar('SDK_EXT_TYPE', True)
+    if sdk_ext_type != 'minimal' or sdk_include_toolchain or derivative:
+        # Create the filtered task list used to generate the sstate cache shipped with the SDK
+        tasklistfn = d.getVar('WORKDIR', True) + '/tasklist.txt'
+        create_filtered_tasklist(d, baseoutpath, tasklistfn, conf_initpath)
+    else:
+        tasklistfn = None
+
     # Add packagedata if enabled
     if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
         lockedsigs_base = d.getVar('WORKDIR', True) + '/locked-sigs-base.inc'
@@ -312,20 +375,21 @@ python copy_buildsystem () {
                                              lockedsigs_pruned,
                                              lockedsigs_copy)
 
-    if d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1':
+    if sdk_include_toolchain:
         lockedsigs_base = d.getVar('WORKDIR', True) + '/locked-sigs-base2.inc'
         lockedsigs_toolchain = d.getVar('STAGING_DIR_HOST', True) + '/locked-sigs/locked-sigs-extsdk-toolchain.inc'
         shutil.move(lockedsigs_pruned, lockedsigs_base)
-        oe.copy_buildsystem.merge_lockedsigs(['do_populate_sysroot'],
+        oe.copy_buildsystem.merge_lockedsigs([],
                                              lockedsigs_base,
                                              lockedsigs_toolchain,
                                              lockedsigs_pruned)
         oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_toolchain,
                                                        d.getVar('SSTATE_DIR', True),
                                                        sstate_out, d,
-                                                       fixedlsbstring)
+                                                       fixedlsbstring,
+                                                       filterfile=tasklistfn)
 
-    if d.getVar('SDK_EXT_TYPE', True) == 'minimal':
+    if sdk_ext_type == 'minimal':
         if derivative:
             # Assume the user is not going to set up an additional sstate
             # mirror, thus we need to copy the additional artifacts (from
@@ -341,12 +405,14 @@ python copy_buildsystem () {
                 oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_extra,
                                                                d.getVar('SSTATE_DIR', True),
                                                                sstate_out, d,
-                                                               fixedlsbstring)
+                                                               fixedlsbstring,
+                                                               filterfile=tasklistfn)
     else:
         oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
                                                        d.getVar('SSTATE_DIR', True),
                                                        sstate_out, d,
-                                                       fixedlsbstring)
+                                                       fixedlsbstring,
+                                                       filterfile=tasklistfn)
 
     # We don't need sstate do_package files
     for root, dirs, files in os.walk(sstate_out):
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index b5f546f..349819e 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -200,11 +200,11 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
     if merged_output:
         write_sigs_file(merged_output, arch_order, merged)
 
-def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring=""):
+def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring="", filterfile=None):
     bb.note('Generating sstate-cache...')
 
     nativelsbstring = d.getVar('NATIVELSBSTRING', True)
-    bb.process.run("gen-lockedsig-cache %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring))
+    bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
     if fixedlsbstring:
         nativedir = output_sstate_cache + '/' + nativelsbstring
         if os.path.isdir(nativedir):
@@ -216,3 +216,21 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
                 src = os.path.join(nativedir, i)
                 dest = os.path.join(destdir, i)
                 os.rename(src, dest)
+
+def check_sstate_task_list(d, targets, filteroutfile, cmdprefix='', cwd=None, logfile=None):
+    import subprocess
+
+    bb.note('Generating sstate task list...')
+
+    if not cwd:
+        cwd = os.getcwd()
+    if logfile:
+        logparam = '-l %s' % logfile
+    else:
+        logparam = ''
+    cmd = "%sBB_SETSCENE_ENFORCE=1 PSEUDO_DISABLED=1 oe-check-sstate %s -s -o %s %s" % (cmdprefix, targets, filteroutfile, logparam)
+    env = dict(d.getVar('BB_ORIGENV', False))
+    env.pop('BUILDDIR', '')
+    pathitems = env['PATH'].split(':')
+    env['PATH'] = ':'.join([item for item in pathitems if not item.endswith('/bitbake/bin')])
+    bb.process.run(cmd, stderr=subprocess.STDOUT, env=env, cwd=cwd)
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 26e9b63..de8a20c 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -15,15 +15,27 @@ def mkdir(d):
 
 if len(sys.argv) < 5:
     print("Incorrect number of arguments specified")
-    print("syntax: gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir> <nativelsbstring>")
+    print("syntax: gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir> <nativelsbstring> [filterfile]")
     sys.exit(1)
 
+filterlist = []
+if len(sys.argv) > 5:
+    print('Reading filter file %s' % sys.argv[5])
+    with open(sys.argv[5]) as f:
+        for l in f.readlines():
+            if ":" in l:
+                filterlist.append(l.rstrip())
+
 print('Reading %s' % sys.argv[1])
 sigs = []
 with open(sys.argv[1]) as f:
     for l in f.readlines():
         if ":" in l:
-            sigs.append(l.split(":")[2].split()[0])
+            task, sig = l.split()[0].rsplit(':', 1)
+            if filterlist and not task in filterlist:
+                print('Filtering out %s' % task)
+            else:
+                sigs.append(sig)
 
 print('Gathering file list')
 files = set()
-- 
2.5.5


