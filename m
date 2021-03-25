Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web09.4727.1616712244651371254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 15:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12PMi2i7001229
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 17:44:03 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: Avoid copying and producing .pyc files
Date: Thu, 25 Mar 2021 17:44:02 -0500
Message-Id: <20210325224402.145099-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Since pyc cache files are really system specific, no real reason to copy or
generate them during the eSDK build process.  Also generating them has the
possibility of re-using inodes that pseudo may have been tracking, leading
a build failure.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/populate_sdk_ext.bbclass | 4 +++-
 meta/lib/oe/copy_buildsystem.py       | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9112ab6c5e..14689ec6ac 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -251,7 +251,9 @@ python copy_buildsystem () {
 
     # Create a layer for new recipes / appends
     bbpath = d.getVar('BBPATH')
-    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')])
+    env = os.environ.copy()
+    env['PYTHONDONTWRITEBYTECODE'] = '1'
+    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')], env=env)
 
     # Create bblayers.conf
     bb.utils.mkdirhier(baseoutpath + '/conf')
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 31a84f5b06..d97bf9d1b9 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -20,7 +20,7 @@ def _smart_copy(src, dest):
     mode = os.stat(src).st_mode
     if stat.S_ISDIR(mode):
         bb.utils.mkdirhier(dest)
-        cmd = "tar --exclude='.git' --xattrs --xattrs-include='*' -chf - -C %s -p . \
+        cmd = "tar --exclude='.git' --exclude='__pycache__' --xattrs --xattrs-include='*' -chf - -C %s -p . \
         | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dest)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
@@ -259,7 +259,7 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
     bb.note('Generating sstate-cache...')
 
     nativelsbstring = d.getVar('NATIVELSBSTRING')
-    bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
+    bb.process.run("PYTHONDONTWRITEBYTECODE=1 gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
     if fixedlsbstring and nativelsbstring != fixedlsbstring:
         nativedir = output_sstate_cache + '/' + nativelsbstring
         if os.path.isdir(nativedir):
@@ -286,7 +286,7 @@ def check_sstate_task_list(d, targets, filteroutfile, cmdprefix='', cwd=None, lo
         logparam = '-l %s' % logfile
     else:
         logparam = ''
-    cmd = "%sBB_SETSCENE_ENFORCE=1 PSEUDO_DISABLED=1 oe-check-sstate %s -s -o %s %s" % (cmdprefix, targets, filteroutfile, logparam)
+    cmd = "%sPYTHONDONTWRITEBYTECODE=1 BB_SETSCENE_ENFORCE=1 PSEUDO_DISABLED=1 oe-check-sstate %s -s -o %s %s" % (cmdprefix, targets, filteroutfile, logparam)
     env = dict(d.getVar('BB_ORIGENV', False))
     env.pop('BUILDDIR', '')
     env.pop('BBPATH', '')
-- 
2.17.1

