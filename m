Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.2585.1620181317113122971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 19:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ulCL64lYOqwUFOaj32Cidywjdb2VZ9B6Gk+9rkd2SeHMIkdnzADSAuXzEkGhFRArx8jeZ2pLWV
 1F/XmIYWQ3+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="178335138"
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; 
   d="scan'208";a="178335138"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 19:21:56 -0700
IronPort-SDR: H3jmIfoGqC1VG73qyH5MhzOyztD3hKCn72UEiiGEX1VBPnkMkVEciI5IzP80yJYTWnbWwN9YkB
 cq+qSKKjAKWg==
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; 
   d="scan'208";a="531392591"
Received: from teohzhiq-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.150.148])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 19:21:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: peter@hatina.eu
Subject: [gatesgarth][PATCH] populate_sdk_ext: Avoid copying and producing .pyc files
Date: Wed,  5 May 2021 10:21:47 +0800
Message-Id: <20210505022147.338186-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Since pyc cache files are really system specific, no real reason to copy or
generate them during the eSDK build process.  Also generating them has the
possibility of re-using inodes that pseudo may have been tracking, leading
a build failure.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce8eba263647ae63a722122e28f26af46ae083a0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.30.2

