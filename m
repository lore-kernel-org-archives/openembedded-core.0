Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A01C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:57:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.6423.1659448659529786642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UdM/ZM9x;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id p5so17677742edi.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PedJ4+0l7BYB8YQgOqr6wuv3BK6lXGxzxnG0296TTu8=;
        b=UdM/ZM9x+n1Fkgqys00M9U/aozrM3YVgaTv6Z2bVwJrIwkp85nvEshoR/cBMH1B745
         5gUTA4t1aYkfKU1m44alkeTEndT4D9q5UcydQ3TjfMIecmX7tmEtqvz1wubi6brZ1No/
         4eoE4DLGo6mH2bQLnuJLXPPDyBb7ddmfyZJqBVJwNywMN3rZLhu5bUvVSrEFoTlXaZrh
         ogCmNfVuTc3G+WDn/BA+/QUouu5l4SfHhRwKfudflfd0tyZsNoueNsO0N09QZnvWx9/r
         sb1xiqywmjCSDZ2sO7/M2+k8N2TTcze8tbedUgifTrfVprgBxWPTM67PonBBGnArmEJi
         gnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PedJ4+0l7BYB8YQgOqr6wuv3BK6lXGxzxnG0296TTu8=;
        b=72EFCmlzxNhNgt+j6Dey9M+Sr5IXA7GZOnxxfN4jQDWBfxiq1UsbO/SchYhVQpHV8e
         VVa7ML1dhICMm+QKOmxgCB50P8jg57RlgXz5TXoOIBYRC4rOkl8YUG25OM6fJxdSzV4t
         g29zz+mbyKosTXEcEtG/s56W5Iu6dfgQuDn5OonI4FEJkOn32Kx1sr+SM2XEC4psLmVW
         u8IKckF0vgBmvu9FcA01SR1TRyCU1oBo2aF6gSBrgTrGkwVmtyaP4fuE2l3PD3kMG7Bp
         SsT+/MgL4UDdOEYr8qT1FJANfGZqDrHsHWSCEPeX3XxeMyQJemAlRyghgIr36VS8s7vj
         Emwg==
X-Gm-Message-State: AJIora/DdHiIIIuvq6Fqep+9K/lfCjLtIeiykC+rQ/sECI7AZLt/1OVb
	9LnKs0oPd855uLt7cHdi6HAc4RziaYQ=
X-Google-Smtp-Source: 
 AGRyM1soJfXCDyIejgKDVPW0YCebGvV2YNLUX24x6XLfu1mlXqsr921uo5A7thS19HzvlQAo3qerRA==
X-Received: by 2002:a05:6402:4cc:b0:43c:cd5c:dcfb with SMTP id
 n12-20020a05640204cc00b0043ccd5cdcfbmr20092168edw.277.1659448657842;
        Tue, 02 Aug 2022 06:57:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b00722e50dab2csm6233731ejc.109.2022.08.02.06.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 06:57:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] bitbake-layers: add a command to save the active build
 configuration as a template into a layer
Date: Tue,  2 Aug 2022 15:57:10 +0200
Message-Id: <20220802135714.2785052-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 13:57:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168781

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


