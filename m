Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577F1C4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 12:33:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.14085.1670416386407590138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 04:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FNS94LSd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id h11so27820592wrw.13
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 04:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DG5u2+svlU/kXqLw/mSRxaM0ElZd4gEE9EAeUpLQ1z4=;
        b=FNS94LSdwROPWIaK0wMsA9NYXecfzOSKMvaghdkPImOyKh8/ArdZzbEBNogL+PCH97
         9N48adTyX9CWeeRgizM7731XccxTbqtoky2sIXaNbNdcwu6lIzMsFUY6Ut2AbfP3Gpk/
         Wj9atv6exyZpGgLlkP/eKvXHMmgotrVgU9PKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DG5u2+svlU/kXqLw/mSRxaM0ElZd4gEE9EAeUpLQ1z4=;
        b=ScOT9/K/yPt7PTpw+HEoO+LIBagf5Y7jl9IAXbib010hoIiXZw+F46rX9CFL52wgJB
         WlVzqxCemQvjMTESla9d1un8m9bCvSD9kRYoCTWsspLbrhlJ3rt7AuCUgJVtdpCD6P81
         DBUJExSJbrz8WDF8KNhGBaH0x+ffxOmjtNIx8yznTgCfGdpcL0vt4vDxvDIh55Sb+nAG
         XbSl6N5rN3IW8aVOOtivaEo9pEiatPFip1XL0LqiMn0sCoQb5NwEkxzvqbx2VGhw9bC7
         yD+ExyuI2vA3BhPhY5GvHH28eV2qVgu58pyyRm8B9BS1tW14zBim6Ty1b2R84tQ3dygs
         CnUQ==
X-Gm-Message-State: ANoB5pmh+Gsdl/NU+prmCJAMCI8lYQc0Sfbr2pEJ5Ly+pPN4JeXuW+1F
	SGynm+yUZmS8bcmEKKhrTJZxoR/YloX6SxlH
X-Google-Smtp-Source: AA0mqf4ER6kR8tL5iPkxI1BtPvPswK4XJyZuLXHrQ0ZHhn1vMNOuR1twZ7ZsrV/oXHuAXPOPrczXpA==
X-Received: by 2002:a5d:670c:0:b0:242:203c:9ed2 with SMTP id o12-20020a5d670c000000b00242203c9ed2mr23410535wru.526.1670416384392;
        Wed, 07 Dec 2022 04:33:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7cc:35cb:98f7:71b8])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d434c000000b00241bd177f89sm19151872wrr.14.2022.12.07.04.33.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 04:33:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] devtool/friends: Use LAYERSERIES_CORENAMES when generating LAYERSERIES_COMPAT entries
Date: Wed,  7 Dec 2022 12:33:03 +0000
Message-Id: <20221207123303.2106211-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 12:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174352

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
v3: unbreak the standalone devtool commands after fixing the esdk lockup

 meta/classes-recipe/populate_sdk_ext.bbclass |  3 +--
 meta/lib/bblayers/create.py                  |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py      |  5 +++--
 meta/lib/oeqa/utils/commands.py              |  3 ++-
 scripts/devtool                              | 17 ++++++++++++++---
 5 files changed, 21 insertions(+), 9 deletions(-)

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
index 20d785c7f79..3aae7b93b4b 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -137,17 +137,27 @@ def create_workspace(args, config, basepath, workspace):
         workspacedir = os.path.abspath(args.layerpath)
     else:
         workspacedir = os.path.abspath(os.path.join(basepath, 'workspace'))
-    _create_workspace(workspacedir, config, basepath)
+    layerseries = None
+    if args.layerseries:
+        layerseries = args.layerseries
+    _create_workspace(workspacedir, config, basepath, layerseries)
     if not args.create_only:
         _enable_workspace_layer(workspacedir, config, basepath)
 
-def _create_workspace(workspacedir, config, basepath):
+def _create_workspace(workspacedir, config, basepath, layerseries=None):
     import bb
 
     confdir = os.path.join(workspacedir, 'conf')
     if os.path.exists(os.path.join(confdir, 'layer.conf')):
         logger.info('Specified workspace already set up, leaving as-is')
     else:
+        if not layerseries:
+            tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+            try:
+                layerseries = tinfoil.config_data.getVar('LAYERSERIES_CORENAMES')
+            finally:
+                tinfoil.shutdown()
+
         # Add a config file
         bb.utils.mkdirhier(confdir)
         with open(os.path.join(confdir, 'layer.conf'), 'w') as f:
@@ -159,7 +169,7 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('BBFILE_PATTERN_workspacelayer = "^$' + '{LAYERDIR}/"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_workspacelayer = "1"\n')
             f.write('BBFILE_PRIORITY_workspacelayer = "99"\n')
-            f.write('LAYERSERIES_COMPAT_workspacelayer = "${LAYERSERIES_COMPAT_core}"\n')
+            f.write('LAYERSERIES_COMPAT_workspacelayer = "%s"\n' % layerseries)
         # Add a README file
         with open(os.path.join(workspacedir, 'README'), 'w') as f:
             f.write('This layer was created by the OpenEmbedded devtool utility in order to\n')
@@ -309,6 +319,7 @@ def main():
                                                         description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.',
                                                         group='advanced')
         parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
+        parser_create_workspace.add_argument('--layerseries', help='Layer series the workspace should be set to be compatible with')
         parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
         parser_create_workspace.set_defaults(func=create_workspace, no_workspace=True)
 
-- 
2.34.1


