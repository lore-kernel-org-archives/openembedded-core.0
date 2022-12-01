Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67EDC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:23:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.52343.1669918998147202139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IPlQFkAn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso2292242wmp.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 10:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0XuCX0jH75ZbAF9wMC+vDlfRpCwBHCiUvAO/lAYITzw=;
        b=IPlQFkAn5bzZ8TMwGU19ulp9ew0/MTMiKwpFl2g0v5q1pToHycKCflEgjI6zCDGkSb
         2DCkGIBOxg3h6jRPc970Auxb6R/KUUWDckMaJ+CIpIHUKpqqIlEX7XmXzTPbAkb/oVEL
         kT3GHjV+28e/EPVLwHglVFVWB75eEyljPuGR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XuCX0jH75ZbAF9wMC+vDlfRpCwBHCiUvAO/lAYITzw=;
        b=IVhcFoCDpHwuyp0iYIw7d3bYaD+dirmY78tn72yiUVpCEXL/CEJ3WrmP4tqYwbVqpY
         CIhx0qqprEz/XTfkt/YBMjwta+JE7fWV0YY39Hi5aXW/s2xeCzqPJ2NaiP/2WFBjxIGY
         OJvuiQXAFErnKS5dXfn0FLVfQWWns7PIXmne8u7EWpxfIcot2V5rktOa+8q5B6HnHoU9
         blgu5Zpg5jceamjgSm8Wh4n6HfeCwCkNPS1nJvUEUu95WZD2jiwNv3M6euF+F59J+s5Y
         YFEB+MreY2/WCKkVXlifS7a0i2Mp6Do4UzTran0eYCDgZnZnJZCvN41RGIzzWVFfCi9w
         X/eA==
X-Gm-Message-State: ANoB5pklbdCkBIiDjWOFht9f65T1O/2L0mJTXSzs61GfImrp6P/POTAd
	kzWoB/XxlUmIrlKj93i8+oUydNvSX9AJTQ==
X-Google-Smtp-Source: AA0mqf7jzxsxcmjqLI0GE7W+ZmL/5DRsY8+3NsagUSo3RIAHynoV0xKU59E1PCFVxD4CUtSHBKFz9Q==
X-Received: by 2002:a05:600c:3647:b0:3b4:c00d:2329 with SMTP id y7-20020a05600c364700b003b4c00d2329mr38092434wmq.124.1669918996153;
        Thu, 01 Dec 2022 10:23:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f4c:de93:c029:9984])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b003cf87623c16sm11149226wmb.4.2022.12.01.10.23.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:23:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] devtool/friends: Use LAYERSERIES_CORENAMES when generating LAYERSERIES_COMPAT entries
Date: Thu,  1 Dec 2022 18:23:13 +0000
Message-Id: <20221201182313.1185848-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 18:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174201

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
 meta/lib/bblayers/create.py             | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py | 5 +++--
 meta/lib/oeqa/utils/commands.py         | 3 ++-
 scripts/devtool                         | 8 +++++++-
 4 files changed, 13 insertions(+), 5 deletions(-)

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
index 20d785c7f79..4410613f401 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -148,6 +148,12 @@ def _create_workspace(workspacedir, config, basepath):
     if os.path.exists(os.path.join(confdir, 'layer.conf')):
         logger.info('Specified workspace already set up, leaving as-is')
     else:
+        tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+        try:
+            corenames = tinfoil.config_data.getVar('LAYERSERIES_CORENAMES')
+        finally:
+            tinfoil.shutdown()
+
         # Add a config file
         bb.utils.mkdirhier(confdir)
         with open(os.path.join(confdir, 'layer.conf'), 'w') as f:
@@ -159,7 +165,7 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('BBFILE_PATTERN_workspacelayer = "^$' + '{LAYERDIR}/"\n')
             f.write('BBFILE_PATTERN_IGNORE_EMPTY_workspacelayer = "1"\n')
             f.write('BBFILE_PRIORITY_workspacelayer = "99"\n')
-            f.write('LAYERSERIES_COMPAT_workspacelayer = "${LAYERSERIES_COMPAT_core}"\n')
+            f.write('LAYERSERIES_COMPAT_workspacelayer = "%s"\n' % corenames)
         # Add a README file
         with open(os.path.join(workspacedir, 'README'), 'w') as f:
             f.write('This layer was created by the OpenEmbedded devtool utility in order to\n')
-- 
2.34.1


