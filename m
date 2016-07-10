Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9238731A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 23:08:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2016 16:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,343,1464678000"; d="scan'208";a="732288720"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.164.140])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2016 16:08:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 11:07:57 +1200
Message-Id: <012693dc46810e2d941eae46f442e22e07c60d86.1468191874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 7/7] scripts/contrib/devtool-stress: skip incompatible recipes
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
X-List-Received-Date: Sun, 10 Jul 2016 23:08:42 -0000

If devtool returns exit code 4 then record the recipes as "skipped"
rather than "failed" - these are recipes we know cannot work (usually
because they don't provide any source).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/devtool-stress.py | 57 ++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index ab77a2d..5fff257 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -121,14 +121,18 @@ def stress_extract(args):
             sys.stdout.write('Testing %s ' % (pn + ' ').ljust(40, '.'))
             sys.stdout.flush()
             failed = False
+            skipped = None
 
             srctree = os.path.join(tmpdir, pn)
             try:
                 bb.process.run('devtool extract %s %s' % (pn, srctree))
-            except bb.process.CmdError as exc:
-                failed = True
-                with open('stress_%s_extract.log' % pn, 'w') as f:
-                    f.write(str(exc))
+            except bb.process.ExecutionError as exc:
+                if exc.exitcode == 4:
+                    skipped = 'incompatible'
+                else:
+                    failed = True
+                    with open('stress_%s_extract.log' % pn, 'w') as f:
+                        f.write(str(exc))
 
             if os.path.exists(srctree):
                 shutil.rmtree(srctree)
@@ -136,6 +140,8 @@ def stress_extract(args):
             if failed:
                 print('failed')
                 failures += 1
+            elif skipped:
+                print('skipped (%s)' % skipped)
             else:
                 print('ok')
     except KeyboardInterrupt:
@@ -162,29 +168,34 @@ def stress_modify(args):
             sys.stdout.flush()
             failed = False
             reset = True
+            skipped = None
 
             srctree = os.path.join(tmpdir, pn)
             try:
                 bb.process.run('devtool modify -x %s %s' % (pn, srctree))
-            except bb.process.CmdError as exc:
-                with open('stress_%s_modify.log' % pn, 'w') as f:
-                    f.write(str(exc))
-                failed = 'modify'
-                reset = False
-
-            if not failed:
-                try:
-                    bb.process.run('bitbake -c install %s' % pn)
-                except bb.process.CmdError as exc:
-                    with open('stress_%s_install.log' % pn, 'w') as f:
+            except bb.process.ExecutionError as exc:
+                if exc.exitcode == 4:
+                    skipped = 'incompatible'
+                else:
+                    with open('stress_%s_modify.log' % pn, 'w') as f:
                         f.write(str(exc))
-                    failed = 'build'
-            if reset:
-                try:
-                    bb.process.run('devtool reset %s' % pn)
-                except bb.process.CmdError as exc:
-                    print('devtool reset failed: %s' % str(exc))
-                    break
+                    failed = 'modify'
+                    reset = False
+
+            if not skipped:
+                if not failed:
+                    try:
+                        bb.process.run('bitbake -c install %s' % pn)
+                    except bb.process.CmdError as exc:
+                        with open('stress_%s_install.log' % pn, 'w') as f:
+                            f.write(str(exc))
+                        failed = 'build'
+                if reset:
+                    try:
+                        bb.process.run('devtool reset %s' % pn)
+                    except bb.process.CmdError as exc:
+                        print('devtool reset failed: %s' % str(exc))
+                        break
 
             if os.path.exists(srctree):
                 shutil.rmtree(srctree)
@@ -192,6 +203,8 @@ def stress_modify(args):
             if failed:
                 print('failed (%s)' % failed)
                 failures += 1
+            elif skipped:
+                print('skipped (%s)' % skipped)
             else:
                 print('ok')
     except KeyboardInterrupt:
-- 
2.5.5


