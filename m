Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08F15786B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:23:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADNFVt018046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:23:15 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:23:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:23 +0800
Message-ID: <bdae2032e47aa7255c282bd2d48b6a4d93a785d9.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 23/23] populate_sdk_ext.bbclass: remove the try...finally
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
X-List-Received-Date: Fri, 10 Nov 2017 13:23:14 -0000
Content-Type: text/plain

The "sdkbasepath + '/conf/local.conf.bak" doesn't exist when
"oe.copy_buildsystem.check_sstate_task_list()" fails, then os.replace() would
raise FileNotFoundError, which overcomes the real error. Keep the error status
makes debug easier, so remove the try..finally.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 70 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index da0e292..62705fe 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -142,43 +142,41 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
 
     # Create a temporary build directory that we can pass to the env setup script
     shutil.copyfile(sdkbasepath + '/conf/local.conf', sdkbasepath + '/conf/local.conf.bak')
+    with open(sdkbasepath + '/conf/local.conf', 'a') as f:
+        # Force the use of sstate from the build system
+        f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR'))
+        f.write('SSTATE_MIRRORS_forcevariable = "file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n')
+        # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
+        f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
+        f.write('TCLIBCAPPEND_forcevariable = ""\n')
+        # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
+        # be different and we won't be able to find our native sstate)
+        if not bb.data.inherits_class('uninative', d):
+            f.write('INHERIT_remove = "uninative"\n')
+
+    # Unfortunately the default SDKPATH (or even a custom value) may contain characters that bitbake
+    # will not allow in its COREBASE path, so we need to rename the directory temporarily
+    temp_sdkbasepath = d.getVar('SDK_OUTPUT') + '/tmp-renamed-sdk'
+    # Delete any existing temp dir
     try:
-        with open(sdkbasepath + '/conf/local.conf', 'a') as f:
-            # Force the use of sstate from the build system
-            f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR'))
-            f.write('SSTATE_MIRRORS_forcevariable = "file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n')
-            # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
-            f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
-            f.write('TCLIBCAPPEND_forcevariable = ""\n')
-            # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
-            # be different and we won't be able to find our native sstate)
-            if not bb.data.inherits_class('uninative', d):
-                f.write('INHERIT_remove = "uninative"\n')
-
-        # Unfortunately the default SDKPATH (or even a custom value) may contain characters that bitbake
-        # will not allow in its COREBASE path, so we need to rename the directory temporarily
-        temp_sdkbasepath = d.getVar('SDK_OUTPUT') + '/tmp-renamed-sdk'
-        # Delete any existing temp dir
-        try:
-            shutil.rmtree(temp_sdkbasepath)
-        except FileNotFoundError:
-            pass
-        os.rename(sdkbasepath, temp_sdkbasepath)
-        cmdprefix = '. %s .; ' % conf_initpath
-        logfile = d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
-        try:
-            oe.copy_buildsystem.check_sstate_task_list(d, get_sdk_install_targets(d), tasklistfile, cmdprefix=cmdprefix, cwd=temp_sdkbasepath, logfile=logfile)
-        except bb.process.ExecutionError as e:
-            msg = 'Failed to generate filtered task list for extensible SDK:\n%s' %  e.stdout.rstrip()
-            if 'attempted to execute unexpectedly and should have been setscened' in e.stdout:
-                msg += '\n----------\n\nNOTE: "attempted to execute unexpectedly and should have been setscened" errors indicate this may be caused by missing sstate artifacts that were likely produced in earlier builds, but have been subsequently deleted for some reason.\n'
-            bb.fatal(msg)
-        os.rename(temp_sdkbasepath, sdkbasepath)
-        # Clean out residue of running bitbake, which check_sstate_task_list()
-        # will effectively do
-        clean_esdk_builddir(d, sdkbasepath)
-    finally:
-        os.replace(sdkbasepath + '/conf/local.conf.bak', sdkbasepath + '/conf/local.conf')
+        shutil.rmtree(temp_sdkbasepath)
+    except FileNotFoundError:
+        pass
+    os.rename(sdkbasepath, temp_sdkbasepath)
+    cmdprefix = '. %s .; ' % conf_initpath
+    logfile = d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
+    try:
+        oe.copy_buildsystem.check_sstate_task_list(d, get_sdk_install_targets(d), tasklistfile, cmdprefix=cmdprefix, cwd=temp_sdkbasepath, logfile=logfile)
+    except bb.process.ExecutionError as e:
+        msg = 'Failed to generate filtered task list for extensible SDK:\n%s' %  e.stdout.rstrip()
+        if 'attempted to execute unexpectedly and should have been setscened' in e.stdout:
+            msg += '\n----------\n\nNOTE: "attempted to execute unexpectedly and should have been setscened" errors indicate this may be caused by missing sstate artifacts that were likely produced in earlier builds, but have been subsequently deleted for some reason.\n'
+        bb.fatal(msg)
+    os.rename(temp_sdkbasepath, sdkbasepath)
+    # Clean out residue of running bitbake, which check_sstate_task_list()
+    # will effectively do
+    clean_esdk_builddir(d, sdkbasepath)
+    os.replace(sdkbasepath + '/conf/local.conf.bak', sdkbasepath + '/conf/local.conf')
 
 python copy_buildsystem () {
     import re
-- 
2.7.4


