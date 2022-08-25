Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AB1ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 20:35:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.28996.1661459695123750090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JFpEfqBo;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso3322051wmh.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oZSvd3uJQVS03oevdB0iJXaforqWH3cNpyDTcl0aEzQ=;
        b=JFpEfqBoGqGG74eBoCfftEyJi8aWsE5pObXS+K55QsSqPVQUMkPmYVdSbEiyXvmkHj
         6EzGIhab1gt5zDIgGhBZAjHtwkVPwhmcF3sslaz18O/7aUKFejF8B99jFxunS1bvQd9H
         kMG2pxuYOD0T3V+XO84X+HB5QI4std7z5g+iJ1D/e4fSNKoF/CSocvz5xhHCn78wHZcp
         ijS0pO8lSEqvog0CRniNnqYCsG2hnXOk/8pevVAsW8cUrLv5UyWe9yFfcpZ05tS1de4t
         BmZeYxild23E1o8A7rFR4K1pqli6ge4DO3aNS48XBdTLykJpz08svLMMiQ8Cm3UFBXlk
         JWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oZSvd3uJQVS03oevdB0iJXaforqWH3cNpyDTcl0aEzQ=;
        b=5EIddCYjfGH4pO0Tp+nk1BDfpWXQD0uxdWHq3nCB1vifM/3lYb8Bi2EVmQ5NEYbqN/
         Jd9pc2DYdiWmrW7QVyeaQZfEE/iHpO5gH8R8miHW2LnRINCk1sI1HoGfoqCZRZOgJeLp
         dHw+CAdixuBPTOvtDNjN1b6WkUgaMnh+rdG6fzi0AshQ6Cp+1s7puGWLc0LHtfZB6rjm
         EonGJVNNCsRgp9H7QUIbU+HVFyPNolC/bzjg7V6o+zt9fhR7Wi3mNOAFFaaUC9XQmPaz
         X2MJ0zMR0oJBu6urIhSWpabIvz/w4jIYhl+5DTcgxARGNSgs23gAli4UkNH/LL1pPlhI
         lC2Q==
X-Gm-Message-State: ACgBeo1nPOxg6JvPG2oA6L3EBRsiBr/0VTqyPrQRYGgfTOpJ/09ij+0C
	lwpsaTFZTNSW5GqWyKIQxURf27PL3I0=
X-Google-Smtp-Source: 
 AA6agR4W/Qh7U7OpOfEiBwbWLIplNomwe/BXl4Z3ysunrVZ8AnXtf+/0TxmbyQzPGcauFI4cjVx5Cg==
X-Received: by 2002:a05:600c:1c0f:b0:3a5:4d6b:a883 with SMTP id
 j15-20020a05600c1c0f00b003a54d6ba883mr9397921wms.45.1661459693440;
        Thu, 25 Aug 2022 13:34:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 m3-20020adfe0c3000000b002250fcfe2ddsm200006wri.14.2022.08.25.13.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:34:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] bitbake-layers: add a command to save the active build
 configuration as a template into a layer
Date: Thu, 25 Aug 2022 22:34:47 +0200
Message-Id: <20220825203451.2074080-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 20:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169888

This is the reverse of setting up a build by pointing TEMPLATECONF to a directory
with a template and running '. oe-init-build-env': this takes the config files from build/conf,
replaces site-specific paths in bblayers.conf with ##OECORE##-relative paths, and copies
the config files into a specified layer under a specified template name.

In many or perhaps most cases such static prefabricated configurations (that require no
further editing) are just enough, and I believe they should be offered by the
official configuration management. On the other hand, generating build configurations with a
sufficiently versatile tool is a far more complex problem, and one we should try to tackle
once we see where and how static configs fall short.

Tooling to discover and select these templates when setting up a build will be provided later on.

How to use:

alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers save-build-conf ../../meta-alex/ test-1
NOTE: Starting bitbake server...
NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
You can try out the configuration with
TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
alex@Zen2:/srv/work/alex/poky/build-layersetup$

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/buildconf.py           | 85 ++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py |  5 ++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/lib/bblayers/buildconf.py

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
new file mode 100644
index 0000000000..e07fc534e1
--- /dev/null
+++ b/meta/lib/bblayers/buildconf.py
@@ -0,0 +1,85 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import logging
+import os
+import stat
+import sys
+import shutil
+import json
+
+import bb.utils
+import bb.process
+
+from bblayers.common import LayerPlugin
+
+logger = logging.getLogger('bitbake-layers')
+
+sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
+
+import oe.buildcfg
+
+def plugin_init(plugins):
+    return BuildConfPlugin()
+
+class BuildConfPlugin(LayerPlugin):
+    notes_fixme = """FIXME: Please place here the description of this build configuration.
+It will be shown to the users when they set up their builds via TEMPLATECONF.
+"""
+
+    def _save_conf(self, templatename, templatepath, oecorepath, relpaths_to_oecore):
+        confdir = os.path.join(os.environ["BBPATH"], "conf")
+        destdir = os.path.join(templatepath, "conf", "templates", templatename)
+        os.makedirs(destdir, exist_ok=True)
+
+        with open(os.path.join(confdir, "local.conf")) as src:
+            with open(os.path.join(destdir, "local.conf.sample"), 'w') as dest:
+                dest.write(src.read())
+
+        with open(os.path.join(confdir, "bblayers.conf")) as src:
+            with open(os.path.join(destdir, "bblayers.conf.sample"), 'w') as dest:
+                bblayers_data = src.read()
+
+                for (abspath, relpath) in relpaths_to_oecore:
+                    bblayers_data = bblayers_data.replace(abspath, "##OEROOT##/" + relpath)
+                dest.write(bblayers_data)
+
+        with open(os.path.join(destdir, "conf-notes.txt"), 'w') as dest:
+            dest.write(self.notes_fixme)
+
+        logger.info("""Configuration template placed into {}
+Please review the files in there, and particularly provide a configuration description in {}
+You can try out the configuration with
+TEMPLATECONF={} . {}/oe-init-build-env build-try-{}"""
+.format(destdir, os.path.join(destdir, "conf-notes.txt"), destdir, oecorepath, templatename))
+
+    def do_save_build_conf(self, args):
+        """ Save the currently active build configuration (conf/local.conf, conf/bblayers.conf) as a template into a layer.\n This template can later be used for setting up builds via TEMPLATECONF. """
+        repos = {}
+        layers = oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
+        targetlayer = None
+        oecore = None
+
+        for l in layers:
+            if l[0] == os.path.abspath(args.layerpath):
+                targetlayer = l[0]
+            if l[1] == 'meta':
+                oecore = os.path.dirname(l[0])
+
+        if not targetlayer:
+            logger.error("Layer {} not in one of the currently enabled layers:\n{}".format(args.layerpath, "\n".join([l[0] for l in layers])))
+        elif not oecore:
+            logger.error("Openembedded-core not in one of the currently enabled layers:\n{}".format("\n".join([l[0] for l in layers])))
+        else:
+            relpaths_to_oecore = [(l[0], os.path.relpath(l[0], start=oecore)) for l in layers]
+            self._save_conf(args.templatename, targetlayer, oecore, relpaths_to_oecore)
+
+    def register_commands(self, sp):
+        parser_build_conf = self.add_command(sp, 'save-build-conf', self.do_save_build_conf, parserecipes=False)
+        parser_build_conf.add_argument('layerpath',
+            help='The path to the layer where the configuration template should be saved.')
+        parser_build_conf.add_argument('templatename',
+            help='The name of the configuration template.')
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 494fa892a3..549abe7d10 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -113,6 +113,11 @@ class BitbakeLayers(OESelftestTestCase):
 
         self.assertEqual(bb_vars['BBFILE_PRIORITY_%s' % layername], str(priority), 'BBFILE_PRIORITY_%s != %d' % (layername, priority))
 
+        result = runCmd('bitbake-layers save-build-conf {} {}'.format(layerpath, "buildconf-1"))
+        for f in ('local.conf.sample', 'bblayers.conf.sample', 'conf-notes.txt'):
+            fullpath = os.path.join(layerpath, "conf", "templates", "buildconf-1", f)
+            self.assertTrue(os.path.exists(fullpath), "Template configuration file {} not found".format(fullpath))
+
     def get_recipe_basename(self, recipe):
         recipe_file = ""
         result = runCmd("bitbake-layers show-recipes -f %s" % recipe)
-- 
2.30.2


