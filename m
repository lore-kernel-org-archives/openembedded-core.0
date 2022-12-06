Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750D9C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 16:46:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.53010.1670345163187414990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 08:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MAKkj8e1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q7so24330578wrr.8
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 08:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6T/efl/D6JOhjr45zuvbXMonnM0Wjy4BWP/0102MawM=;
        b=MAKkj8e1bov7m4QQpssPa2EmGa1FzLCczl+H0GVtSBlayi+n+8HnW0SKJ08Wu98SRX
         4cfWo8/IZSuss0s+vLI6xLjbONkSYCOZ88WbnXIku8j++9QPreABH5ovBCqanq0zmlro
         ZGAu6IExU8a65M/PyagQDIRqGfSoGUSs5mO44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6T/efl/D6JOhjr45zuvbXMonnM0Wjy4BWP/0102MawM=;
        b=47pH6AD2XAAOVsXVgL4kX2+uPH2nAupXpJkvGKBeGyM6wyYArc4Tgakrghu/mgifPk
         WrawoNlnXBipfzflBdtDIYQdy6rIzqjU/7IWXYkS15TK8Trejcp9C7Q1CgfBL2Y8BVJd
         kOak5L/CDG1djbIJqzWMXkupW1E1v649HD4Z1Sfl/XUVud/1Gk8vgqbiuH3qJ4PWNcz5
         ajX2IOS8fkzzZ9N+dauEM2RB9nhfNsck2rkDpeoGFEi1hgGKFJWWMVsbrihfLSCWubMj
         eEQ7Y6m4WYqc7Z+l2BIQ4vQHdkWH/ZGS/XnwstevgWFnlOzmIYIkWjnWMLh7Mn0uPqly
         LYGg==
X-Gm-Message-State: ANoB5plYT4XesVvt5tLkV6hU1s5YysRdzrkQqgcMQe3Qt0l2g1+efrmK
	t+EhIQ7PmKhrulIitdybeWHajpx2PzCeLmGo
X-Google-Smtp-Source: AA0mqf545BgrNYJo57nzi/iAeQTAeoQVr0YXAU/pWxOp62Xr+pW4k8eylTwwCIB7Ji66HPaLXx5nSg==
X-Received: by 2002:adf:fb45:0:b0:241:ea14:f22b with SMTP id c5-20020adffb45000000b00241ea14f22bmr36999155wrs.460.1670345160961;
        Tue, 06 Dec 2022 08:46:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d6:2c80:98d5:dc63])
        by smtp.gmail.com with ESMTPSA id l11-20020a1ced0b000000b003b3307fb98fsm20632128wmh.24.2022.12.06.08.46.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:46:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] devtool/friends: Use LAYERSERIES_CORENAMES when generating LAYERSERIES_COMPAT entries
Date: Tue,  6 Dec 2022 16:45:59 +0000
Message-Id: <20221206164559.1969059-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 16:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174327

It seems some layers want to subvert the intent of LAYERSERIES_COMPAT
so bitbake is going to have to become stricter about the values there.
To work with this, use LAYERSERIES_CORENAMES to generate the entries in
LAYERSERIES_COMPAT instead of the current magic LAYERSERIES_COMPAT_core
value which may not continue to work.

The downside to this is when migating between releases, people would
need to update devtool workspace layer.conf files. I guess you could
argue this is a feature!

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2 - fix hangs with esdk building from bitbake lockfile contention by adding --layerseries option

 meta/classes-recipe/populate_sdk_ext.bbclass |  3 +--
 meta/lib/bblayers/create.py                  |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py      |  5 +++--
 meta/lib/oeqa/utils/commands.py              |  3 ++-
 scripts/devtool                              | 15 ++++++++++++---
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 01d8a693a72..f78a9f4e9b2 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -255,7 +255,7 @@ python copy_buildsystem () {
     bbpath = d.getVar('BBPATH')
     env = os.environ.copy()
     env['PYTHONDONTWRITEBYTECODE'] = '1'
-    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')], env=env)
+    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--layerseries', d.getVar("LAYERSERIES_CORENAMES"), '--create-only', os.path.join(baseoutpath, 'workspace')], env=env)
 
     # Create bblayers.conf
     bb.utils.mkdirhier(baseoutpath + '/conf')
@@ -498,7 +498,6 @@ python copy_buildsystem () {
     else:
         tasklistfn = None
 
-
     cachedir = os.path.join(baseoutpath, 'cache')
     bb.utils.mkdirhier(cachedir)
     bb.parse.siggen.copy_unitaskhashes(cachedir)
diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 0aeb5d5f7b5..c8f3f1b370e 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -53,7 +53,7 @@ class CreatePlugin(LayerPlugin):
         shutil.copy(license_src, license_dst)
 
         # Get the compat value for core layer.
-        compat = self.tinfoil.config_data.getVar('LAYERSERIES_COMPAT_core') or ""
+        compat = self.tinfoil.config_data.getVar('LAYERSERIES_CORENAMES') or ""
 
         # Create the layer.conf from templates/layer.conf
         layerconf_template = read_template('layer.conf').format(
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0cb7403f16e..c78a68be5b4 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1076,9 +1076,10 @@ class DevtoolUpdateTests(DevtoolBase):
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils-selftest'
-        bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI', 'LAYERSERIES_CORENAMES'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
+        corenames = bb_vars['LAYERSERIES_CORENAMES']
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
         for entry in src_uri.split():
             if entry.startswith('git://'):
@@ -1109,7 +1110,7 @@ class DevtoolUpdateTests(DevtoolBase):
             f.write('BBFILE_PATTERN_oeselftesttemplayer = "^${LAYERDIR}/"\n')
             f.write('BBFILE_PRIORITY_oeselftesttemplayer = "999"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_oeselftesttemplayer = "1"\n')
-            f.write('LAYERSERIES_COMPAT_oeselftesttemplayer = "${LAYERSERIES_COMPAT_core}"\n')
+            f.write('LAYERSERIES_COMPAT_oeselftesttemplayer = "%s"\n' % corenames)
         self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
         result = runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
         # Create the bbappend
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f733fcdf3c8..f4daea25075 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -300,6 +300,7 @@ def get_test_layer():
 
 def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec='recipes-*/*'):
     os.makedirs(os.path.join(templayerdir, 'conf'))
+    corenames = get_bb_var('LAYERSERIES_CORENAMES')
     with open(os.path.join(templayerdir, 'conf', 'layer.conf'), 'w') as f:
         f.write('BBPATH .= ":${LAYERDIR}"\n')
         f.write('BBFILES += "${LAYERDIR}/%s/*.bb \\' % recipepathspec)
@@ -308,7 +309,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
         f.write('BBFILE_PATTERN_%s = "^${LAYERDIR}/"\n' % templayername)
         f.write('BBFILE_PRIORITY_%s = "%d"\n' % (templayername, priority))
         f.write('BBFILE_PATTERN_IGNORE_EMPTY_%s = "1"\n' % templayername)
-        f.write('LAYERSERIES_COMPAT_%s = "${LAYERSERIES_COMPAT_core}"\n' % templayername)
+        f.write('LAYERSERIES_COMPAT_%s = "%s"\n' % (templayername, corenames))
 
 @contextlib.contextmanager
 def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
diff --git a/scripts/devtool b/scripts/devtool
index 20d785c7f79..16605e1d1e2 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -137,11 +137,19 @@ def create_workspace(args, config, basepath, workspace):
         workspacedir = os.path.abspath(args.layerpath)
     else:
         workspacedir = os.path.abspath(os.path.join(basepath, 'workspace'))
-    _create_workspace(workspacedir, config, basepath)
+    if args.layerseries:
+        layerseries = args.layerseries
+    else:
+        tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+        try:
+            layerseries = tinfoil.config_data.getVar('LAYERSERIES_CORENAMES')
+        finally:
+            tinfoil.shutdown()
+    _create_workspace(workspacedir, config, basepath, layerseries)
     if not args.create_only:
         _enable_workspace_layer(workspacedir, config, basepath)
 
-def _create_workspace(workspacedir, config, basepath):
+def _create_workspace(workspacedir, config, basepath, layerseries):
     import bb
 
     confdir = os.path.join(workspacedir, 'conf')
@@ -159,7 +167,7 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('BBFILE_PATTERN_workspacelayer = "^$' + '{LAYERDIR}/"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_workspacelayer = "1"\n')
             f.write('BBFILE_PRIORITY_workspacelayer = "99"\n')
-            f.write('LAYERSERIES_COMPAT_workspacelayer = "${LAYERSERIES_COMPAT_core}"\n')
+            f.write('LAYERSERIES_COMPAT_workspacelayer = "%s"\n' % layerseries)
         # Add a README file
         with open(os.path.join(workspacedir, 'README'), 'w') as f:
             f.write('This layer was created by the OpenEmbedded devtool utility in order to\n')
@@ -309,6 +317,7 @@ def main():
                                                         description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.',
                                                         group='advanced')
         parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
+        parser_create_workspace.add_argument('--layerseries', help='Layer series the workspace should be set to be compatible with')
         parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
         parser_create_workspace.set_defaults(func=create_workspace, no_workspace=True)
 
-- 
2.34.1


