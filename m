Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002022"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002022"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478651725"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/37] devtool: correctly handle non-standard source tree locations in upgrades
Date: Mon,  2 Aug 2021 15:51:57 +0800
Message-Id: <ddf5a7f3b644915d360f725eca8322187226f171.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

When S is set to a sub-directory of upstream source, the license
checks and the bbappend writing (specifically, setting EXTERNALSRC)
need to operate on that sub-directory.

'devtool modify' already has similar logic, and it was copied from there
and adjusted.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd77e356d4507405fde352c8bba7d3842518bbdd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/upgrade.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 4605355681..a061f26076 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -520,6 +520,15 @@ def upgrade(args, config, basepath, workspace):
         else:
             srctree = standard.get_default_srctree(config, pn)
 
+        # Check that recipe isn't using a shared workdir
+        s = os.path.abspath(rd.getVar('S'))
+        workdir = os.path.abspath(rd.getVar('WORKDIR'))
+        srctree_s = srctree
+        if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
+            # Handle if S is set to a subdirectory of the source
+            srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
+            srctree_s = os.path.join(srctree, srcsubdir)
+
         # try to automatically discover latest version and revision if not provided on command line
         if not args.version and not args.srcrev:
             version_info = oe.recipeutils.get_recipe_upstream_version(rd)
@@ -549,12 +558,12 @@ def upgrade(args, config, basepath, workspace):
         try:
             logger.info('Extracting current version source...')
             rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
-            old_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
+            old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            new_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
+            new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             license_diff = _generate_license_diff(old_licenses, new_licenses)
             rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except bb.process.CmdError as e:
@@ -563,7 +572,7 @@ def upgrade(args, config, basepath, workspace):
             _upgrade_error(e, rf, srctree, args.keep_failure)
         standard._add_md5(config, pn, os.path.dirname(rf))
 
-        af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
+        af = _write_append(rf, srctree_s, args.same_dir, args.no_same_dir, rev2,
                         copied, config.workspace_path, rd)
         standard._add_md5(config, pn, af)
 
-- 
2.31.1

