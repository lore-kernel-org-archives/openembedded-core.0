Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fIFc3n+gkN81l8PloseF2hu1LC2LDgMYql90/FW17YaSDpSDEJU90KHWWpsTDMre49a0o59F5z
 42H4N2X/om5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392516"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392516"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:42 -0800
IronPort-SDR: PBANEFux3PAytsNSQ+qh5i4rffzohMIW9/FN261g0KJXt1FRzGm5fR1fIfQfL9b1dEttllrJNC
 rLndzdgqWFVg==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413923"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:40 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/20] devtool: Fix source extraction for gcc shared source
Date: Fri, 22 Jan 2021 00:22:04 +0800
Message-Id: <9a1bcf47f0242215610ddf917e8bd87e86fdf419.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If do_patch task is disabled then prepare do_configure dependencies to
fetch external sources and create symlink to ${S} in devtool workspace.

[YOCTO #13036]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e47319bfe62d289b90f7545a64dbdc1cbde7f1d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/standard.py | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 261d642d4a..f7d8a82117 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -589,6 +589,16 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             else:
                 task = 'do_patch'
 
+                if 'noexec' in (d.getVarFlags(task, False) or []) or 'task' not in (d.getVarFlags(task, False) or []):
+                    logger.info('The %s recipe has %s disabled. Running only '
+                                       'do_configure task dependencies' % (pn, task))
+
+                    if 'depends' in d.getVarFlags('do_configure', False):
+                        pn = d.getVarFlags('do_configure', False)['depends']
+                        pn = pn.replace('${PV}', d.getVar('PV'))
+                        pn = pn.replace('${COMPILERDEP}', d.getVar('COMPILERDEP'))
+                        task = None
+
             # Run the fetch + unpack tasks
             res = tinfoil.build_targets(pn,
                                         task,
@@ -600,6 +610,17 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         if not res:
             raise DevtoolError('Extracting source for %s failed' % pn)
 
+        if not is_kernel_yocto and ('noexec' in (d.getVarFlags('do_patch', False) or []) or 'task' not in (d.getVarFlags('do_patch', False) or [])):
+            workshareddir = d.getVar('S')
+            if os.path.islink(srctree):
+                os.unlink(srctree)
+
+            os.symlink(workshareddir, srctree)
+
+            # The initial_rev file is created in devtool_post_unpack function that will not be executed if
+            # do_unpack/do_patch tasks are disabled so we have to directly say that source extraction was successful
+            return True, True
+
         try:
             with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
                 initial_rev = f.read()
@@ -847,10 +868,11 @@ def modify(args, config, basepath, workspace):
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
-            # Get list of commits since this revision
-            (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
-            commits = stdout.split()
-            check_commits = True
+            if os.path.exists(os.path.join(srctree, '.git')):
+                # Get list of commits since this revision
+                (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
+                commits = stdout.split()
+                check_commits = True
         else:
             if os.path.exists(os.path.join(srctree, '.git')):
                 # Check if it's a tree previously extracted by us. This is done
-- 
2.29.2

