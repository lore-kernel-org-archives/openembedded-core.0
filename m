Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 849F57EAED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:24:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="157502512"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga008.jf.intel.com with ESMTP; 01 Jul 2019 21:24:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:24:00 +1200
Message-Id: <fc845c219ccb0dc686d0fbfdcb4df7ed31adc2ea.1562041417.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562041417.git.paul.eggleton@linux.intel.com>
References: <cover.1562041417.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] devtool: upgrade: fix handling of errors parsing upgraded recipe
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
X-List-Received-Date: Tue, 02 Jul 2019 04:24:31 -0000
Content-Transfer-Encoding: 8bit

As part of upgrading a recipe we create the upgraded recipe file in the
workspace and then try to parse it so we can then make further
modifications. If for some reason that parsing fails then the failure
was not being handled very well - the broken recipe was being left in
place, breaking parsing until it was removed by hand. Fix that by adding
a call to the cleanup function, and fix the following issues:

* Fix the cleanup function which doesn't look like it has ever worked
  due to a typo in the function call

* Fix double-printing the error message

* Remove usage of DevtoolError in this case (DevtoolError is for simple
  usage errors, not this kind of issue which may be the result of a
  bug).

We're still printing a traceback in this scenario but at least it
doesn't break the build system requiring manual cleanup. I also
introduced a command-line option to preserve the broken upgraded recipe
file(s) for debugging purposes.

(The reproducer for this is "devtool upgrade libnewt-python", however
you need to check out revision b82ea144e144671d3f64c0785ba4beafe905cd4f
or earlier since that recipe has now been absorbed into the libnewt
recipe. The libnewt-python recipe was causing an issue with the upgrade
because it actually included the libnewt recipe using ${PV} in the
include statement, and of course PV was changing in the upgrade.)

Fixes [YOCTO #13404].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 62ec2f94cbc..706f91c9358 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -122,18 +122,22 @@ def _cleanup_on_error(rf, srctree):
     rfp = os.path.split(rf)[0] # recipe folder
     rfpp = os.path.split(rfp)[0] # recipes folder
     if os.path.exists(rfp):
-        shutil.rmtree(b)
+        shutil.rmtree(rfp)
     if not len(os.listdir(rfpp)):
         os.rmdir(rfpp)
     srctree = os.path.abspath(srctree)
     if os.path.exists(srctree):
         shutil.rmtree(srctree)
 
-def _upgrade_error(e, rf, srctree):
-    if rf:
-        cleanup_on_error(rf, srctree)
+def _upgrade_error(e, rf, srctree, keep_failure=False, extramsg=None):
+    if rf and not keep_failure:
+        _cleanup_on_error(rf, srctree)
     logger.error(e)
-    raise DevtoolError(e)
+    if extramsg:
+        logger.error(extramsg)
+    if keep_failure:
+        logger.info('Preserving failed upgrade files (--keep-failure)')
+    sys.exit(1)
 
 def _get_uri(rd):
     srcuris = rd.getVar('SRC_URI').split()
@@ -299,7 +303,7 @@ def _add_license_diff_to_recipe(path, diff):
         f.write("\n#\n\n".encode())
         f.write(orig_content)
 
-def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses):
+def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctree, keep_failure):
     """Creates the new recipe under workspace"""
 
     bpn = rd.getVar('BPN')
@@ -416,7 +420,10 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
         newvalues["LIC_FILES_CHKSUM"] = newlicchksum
         _add_license_diff_to_recipe(fullpath, license_diff)
 
-    rd = tinfoil.parse_recipe_file(fullpath, False)
+    try:
+        rd = tinfoil.parse_recipe_file(fullpath, False)
+    except bb.tinfoil.TinfoilCommandFailed as e:
+        _upgrade_error(e, fullpath, srctree, keep_failure, 'Parsing of upgraded recipe failed')
     oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
     return fullpath, copied
@@ -548,11 +555,11 @@ def upgrade(args, config, basepath, workspace):
                                                     tinfoil, rd)
             new_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
             license_diff = _generate_license_diff(old_licenses, new_licenses)
-            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses)
+            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except bb.process.CmdError as e:
-            _upgrade_error(e, rf, srctree)
+            _upgrade_error(e, rf, srctree, args.keep_failure)
         except DevtoolError as e:
-            _upgrade_error(e, rf, srctree)
+            _upgrade_error(e, rf, srctree, args.keep_failure)
         standard._add_md5(config, pn, os.path.dirname(rf))
 
         af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
@@ -623,6 +630,7 @@ def register_commands(subparsers, context):
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_upgrade.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_upgrade.add_argument('--keep-failure', action="store_true", help='Keep failed upgrade recipe and associated files  (for debugging)')
     parser_upgrade.set_defaults(func=upgrade, fixed_setup=context.fixed_setup)
 
     parser_latest_version = subparsers.add_parser('latest-version', help='Report the latest version of an existing recipe',
-- 
2.20.1


