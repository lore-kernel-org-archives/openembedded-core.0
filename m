Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBDAC19F2C
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:11:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.8439.1659103859431809447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d7A5+7x2;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id z23so8741157eju.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PedJ4+0l7BYB8YQgOqr6wuv3BK6lXGxzxnG0296TTu8=;
        b=d7A5+7x2eiw1ethaffVkrry0759ZlncpM7UrNwnrQzmkcpgYUWBLkeVj6EX6nE5Dsx
         DXp/j6gjsC0SU/H7ONy9p24h3gl5D9Ds+lGdjG6OdYLMY27K6wNfhYzcNKubQecTqPJa
         1C9A9WQR8Q+9LFmTEc4GKqRlphmcQvIC7spWVPnCUWe4sqUFBQQ6s4kkIrH0rg2aeGbF
         emnVaCu6Ot0gJlth3w5Gks4X9CulK4sPA8rM54ixwLl4rSVR2B0zSxV3LbKXO5/NCn0J
         n0RhPffkaBq7YT45mO1d7hpmV+SGvL833oXvnV55aw4nMePC3yvNul61xjayaCayA65A
         w3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PedJ4+0l7BYB8YQgOqr6wuv3BK6lXGxzxnG0296TTu8=;
        b=hfIlKQ0J1qNfiplq7ffi/7AT8d4gQHoQQQGymO7l+dtjzI78TZa1X0F4IK+EvBeGbX
         6Rv5PYMcf8pTcphIKwhQFCTEdy0+tlcKu8Bx5my91PnAkMuVz1SDXAXPo/oGGtDCjUMS
         37tds/sw0xtdXkT4O2OmHUrQRGy29REhSmivxENt3cG0ghTAIoOaHrFyl0P81GKjEiEq
         TWP1OzFO+SZBjG/II4rmUEWe3QgStrfNBaoOngP00o0MmCnfw+Jbzxl9jXkSxQQalWci
         ZUKZu0L/6VTGFMUK0NyIUNvBPetFe7wpCTxK8TgTjv1HwTY0tq7GDGxE1FIxSMiSlXOM
         WHjA==
X-Gm-Message-State: AJIora8BeAdDjErTUP6wWc/3ix6ECdMuuZZtgCs1jOVsr+Pm1Ozxce/j
	N2Vs8uEBdgVnlKaCMEok+i6KzVTFx34=
X-Google-Smtp-Source: 
 AGRyM1voDApITz1K+guLhADlD5MWL8B5lMs3p4m/w7giHcCvT8HMoSiORD4l1PZt52VCuSCTQoiYRQ==
X-Received: by 2002:a17:907:7fa2:b0:72b:60c4:a04e with SMTP id
 qk34-20020a1709077fa200b0072b60c4a04emr3055599ejc.290.1659103857866;
        Fri, 29 Jul 2022 07:10:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fm15-20020a1709072acf00b0072b14836087sm1744227ejc.103.2022.07.29.07.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:10:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] bitbake-layers: add a command to save the active build
 configuration as a template into a layer
Date: Fri, 29 Jul 2022 16:10:45 +0200
Message-Id: <20220729141049.835733-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729141049.835733-1-alex@linutronix.de>
References: <20220729141049.835733-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168629

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
 meta/lib/bblayers/buildconf.py           | 83 ++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py |  5 ++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/lib/bblayers/buildconf.py

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
new file mode 100644
index 0000000000..ece8836d5a
--- /dev/null
+++ b/meta/lib/bblayers/buildconf.py
@@ -0,0 +1,83 @@
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
index 7d74833f61..8aa45e432e 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -111,6 +111,11 @@ class BitbakeLayers(OESelftestTestCase):
 
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


