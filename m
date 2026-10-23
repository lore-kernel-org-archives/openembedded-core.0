Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3859.1792750974608110783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mAeQJAxp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 023A81650;
	Fri, 23 Oct 2026 03:22:51 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9CA93F7B4;
	Fri, 23 Oct 2026 03:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750974; bh=qcpAsmRVXKeoqBbFLk5t43Hc9p9ua3dAYkEp5+lScFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAeQJAxpFe5r3Y6dp2w9BG2zYr97hOpbmhKQKVUGiEmGGy05dD8fpkAq4v8RlNRvS
	 4m4fHQioS0+DbqKo618YlTlH522yT8YWXVyhZGn6qiSD4GIkzxhq4j30IHfIIjY1Fk
	 YIYZJUEgaQvvCAEDXL/Hi7C+eIFoWX+UMBL4586w=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 3/5] devtool: Isolate multiconfig workspace entries
Date: Fri, 23 Oct 2026 11:22:13 +0100
Message-ID: <20261023102215.4043005-4-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
References: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248501
Content-Type: text/plain; charset="utf-8"

Store workspace appends in multiconfig-specific directories
and select them using BB_CURRENT_MC to prevent changes from
affecting same-named recipes in other configurations.

Fixes [YOCTO #13933]

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 scripts/devtool                 | 24 ++++++++++++++++++++++--
 scripts/lib/devtool/__init__.py |  8 ++++++--
 scripts/lib/devtool/standard.py |  7 ++++---
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 39cebec0d8..bae7c8bbe4 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -28,6 +28,11 @@ import scriptutils
 import argparse_oe
 logger =3D scriptutils.logger_create('devtool')
=20
+# Only expose workspace appends belonging to the current configuration.
+workspace_append_pattern =3D ("${LAYERDIR}/appends/"
+                            "${@'multiconfig/%s/' % d.getVar('BB_CURRENT=
_MC') "
+                            "if d.getVar('BB_CURRENT_MC') else ''}*.bbap=
pend")
+
=20
 class ConfigHandler:
     basepath =3D None
@@ -99,9 +104,21 @@ def read_workspace(basepath, context):
     if not context.fixed_setup:
         _enable_workspace_layer(context.config.workspace_path, context.c=
onfig, basepath)
=20
+    # Upgrade existing workspace layers as well as newly created ones.
+    layerconf =3D os.path.join(context.config.workspace_path, 'conf', 'l=
ayer.conf')
+    with open(layerconf) as f:
+        contents =3D f.read()
+    updated =3D contents.replace('${LAYERDIR}/appends/*.bbappend', works=
pace_append_pattern)
+    if updated !=3D contents:
+        with open(layerconf, 'w') as f:
+            f.write(updated)
+
     logger.debug('Reading workspace in %s' % context.config.workspace_pa=
th)
     externalsrc_re =3D re.compile(r'^EXTERNALSRC(:pn-([^ =3D]+))? *=3D *=
"([^"]*)"$')
-    for fn in glob.glob(os.path.join(context.config.workspace_path, 'app=
ends', '*.bbappend')):
+    appenddir =3D os.path.join(context.config.workspace_path, 'appends')
+    appendfiles =3D glob.glob(os.path.join(appenddir, '*.bbappend'))
+    appendfiles +=3D glob.glob(os.path.join(appenddir, 'multiconfig', '*=
', '*.bbappend'))
+    for fn in appendfiles:
         with open(fn, 'r') as f:
             pnvalues =3D {}
             pn =3D None
@@ -130,6 +147,9 @@ def read_workspace(basepath, context):
                 if not pnvalues.get('srctreebase', None):
                     pnvalues['srctreebase'] =3D pnvalues['srctree']
                 logger.debug('Found recipe %s' % pnvalues)
+                if pn in workspace:
+                    raise DevtoolError("Multiple workspace appends found=
 for recipe '%s'; "
+                                       "only one configuration can be mo=
dified at a time" % pn)
                 workspace[pn] =3D pnvalues
=20
     return workspace
@@ -166,7 +186,7 @@ def _create_workspace(workspacedir, basepath, layerse=
ries=3DNone):
             f.write('# ### workspace layer auto-generated by devtool ###=
\n')
             f.write('BBPATH =3D. "$' + '{LAYERDIR}:"\n')
             f.write('BBFILES +=3D "$' + '{LAYERDIR}/recipes/*/*.bb \\\n'=
)
-            f.write('            $' + '{LAYERDIR}/appends/*.bbappend"\n'=
)
+            f.write('            %s"\n' % workspace_append_pattern)
             f.write('BBFILE_COLLECTIONS +=3D "workspacelayer"\n')
             f.write('BBFILE_PATTERN_workspacelayer =3D "^$' + '{LAYERDIR=
}/"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_workspacelayer =3D "1"\=
n')
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init=
__.py
index 9d227e2032..f728f7ada0 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -133,13 +133,15 @@ def setup_tinfoil(config_only=3DFalse, basepath=3DN=
one, tracking=3DFalse):
 def parse_recipe(config, tinfoil, pn, appends, filter_workspace=3DTrue):
     """Parse the specified recipe"""
     import bb.providers
+    import bb.runqueue
     try:
         recipefile =3D tinfoil.get_recipe_file(pn)
     except bb.providers.NoProvider as e:
         logger.error(str(e))
         return None
     if appends:
-        append_files =3D tinfoil.get_file_appends(recipefile)
+        mc, _ =3D bb.runqueue.split_mc(pn)
+        append_files =3D tinfoil.get_file_appends(recipefile, mc)
         if filter_workspace:
             # Filter out appends from the workspace
             append_files =3D [path for path in append_files if
@@ -276,7 +278,7 @@ def setup_git_repo(repodir, version, devbranch, baset=
ag=3D'devtool-base', d=3DNone):
     if os.path.exists(os.path.join(repodir, '.gitmodules')):
         bb.process.run('git submodule foreach --recursive  "git tag -f -=
-no-sign %s"' % basetag, cwd=3Drepodir)
=20
-def recipe_to_append(recipefile, config, wildcard=3DFalse):
+def recipe_to_append(recipefile, config, wildcard=3DFalse, mc=3D''):
     """
     Convert a recipe file to a bbappend file path within the workspace.
     NOTE: if the bbappend already exists, you should be using
@@ -287,6 +289,8 @@ def recipe_to_append(recipefile, config, wildcard=3DF=
alse):
     if wildcard:
         appendname =3D re.sub(r'_.*', '_%', appendname)
     appendpath =3D os.path.join(config.workspace_path, 'appends')
+    if mc:
+        appendpath =3D os.path.join(appendpath, 'multiconfig', mc)
     appendfile =3D os.path.join(appendpath, appendname + '.bbappend')
     return appendfile
=20
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 1f6ae1d931..0f7cfe132f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -540,7 +540,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, config, basepath, works
     initial_rev =3D None
=20
     recipefile =3D d.getVar('FILE')
-    appendfile =3D recipe_to_append(recipefile, config)
+    appendfile =3D recipe_to_append(recipefile, config, mc=3Dd.getVar('B=
B_CURRENT_MC'))
     is_kernel_yocto =3D bb.data.inherits_class('kernel-yocto', d)
=20
     # We need to redirect WORKDIR, STAMPS_DIR etc. under a temporary
@@ -804,7 +804,8 @@ def modify(args, config, basepath, workspace):
                             srctree)
=20
         recipefile =3D rd.getVar('FILE')
-        appendfile =3D recipe_to_append(recipefile, config, args.wildcar=
d)
+        appendfile =3D recipe_to_append(recipefile, config, args.wildcar=
d,
+                                      mc=3Drd.getVar('BB_CURRENT_MC'))
         if os.path.exists(appendfile):
             raise DevtoolError("Another variant of recipe %s is already =
in your "
                             "workspace (only one variant of a recipe can=
 "
@@ -2076,7 +2077,7 @@ def _reset(recipes, no_clean, remove_work, config, =
basepath, workspace,
             # This should always be true if recipefile is set, but just =
in case
             preservedir(os.path.dirname(recipefile))
         # We don't automatically create this dir next to appends, but th=
e user can
-        preservedir(os.path.join(config.workspace_path, 'appends', pn))
+        preservedir(os.path.join(os.path.dirname(appendfile), pn))
=20
         srctreebase =3D workspace[pn]['srctreebase']
         if os.path.isdir(srctreebase):
