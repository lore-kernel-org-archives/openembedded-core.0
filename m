Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D26C28B2B
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 13:10:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.28588.1660741835590419536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 06:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F1D9ImxS;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id k17so6670943wmr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 06:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=e2DkQNIWkGrhS9t+vy0rkhfsOE39XQzG6v4S9Un1y7E=;
        b=F1D9ImxSwMtB4jovsZWqy6OI4Z5spubhWt+tLqz/K2KbKdxaO3QVGuOXnuZseVnZNt
         g/X+vsFMF9sFQs2SDydtpyCGabUO8uPMhLuAEoYWzPNpDikHf3tyckEVu6KGa6DUxmpU
         srZXeSqQCAcavyt/pT3SE/73RxWK8bE9VWpGJzlRK/sYRP2wgJpfgg9cEUklshU4lx4U
         Ng6zPi0Xdif2VECLAjBLJlTKcl7ZVAtvrvUHjkNsODxK7rV3SHmB60ER+rbh0gSY+VQw
         tINrtVrcMFIxg2Qv5dtMtL8FhDGFu/qbZeqvo4rAwVgYWmN3bBYzpSGsNkepdGswIvOu
         ORnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=e2DkQNIWkGrhS9t+vy0rkhfsOE39XQzG6v4S9Un1y7E=;
        b=I2FGJX5Gf3ye2utkd7+I00ga/xGJl/nniyQ2QT58GJPgF/6d4Fe5qnXrnMb6x7BdeY
         jmKiV6QBmAwbJjhbirEsUcwxHl7+/9jXJ8+zxR1TKVXBrobad6uWd/g5pswg3CKWJnXN
         qcyE/JW7FkZkwqeAHLZcXr+FkM6rvqLqdbH2+QU4Tc/GbAbL8Z+dN/1wAfIM2ftm5cH2
         nQpZHqhFaDKUDeSd6KYLrVKrWCY8lihPyFPk75lj29MuITQIgOE7dLlctAVeQLmPXUTs
         XyECNqVhUbP5iTi0jg6ksyN5QPQF6ryJogOEgfr5W4Iymy05kOjVHcLo7URczCY2FXYa
         gZ3g==
X-Gm-Message-State: ACgBeo14h5rVntuCOHypLN632GdUz3jp/KsypaJxoLh9KuDFrYNuC7wv
	JSMTX+0nebGMwdqqJ25m8Gu84HMiHpM=
X-Google-Smtp-Source: 
 AA6agR56hH7I+9ygRFF6pKqfbXpKCWAzrr3JSo2Azvz7Pko91Rh0ZK+aPy6lPkDj3zXy3Gd5/HUgjA==
X-Received: by 2002:a05:600c:4f8e:b0:3a5:e97c:9dea with SMTP id
 n14-20020a05600c4f8e00b003a5e97c9deamr2170313wmq.39.1660741833865;
        Wed, 17 Aug 2022 06:10:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0021d6dad334bsm1462004wrb.4.2022.08.17.06.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:10:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] bitbake-layers: add a command to save the active build
 configuration as a template into a layer
Date: Wed, 17 Aug 2022 15:10:19 +0200
Message-Id: <20220817131023.4093773-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 13:10:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169478

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


