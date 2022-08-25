Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07D2ECAAA6
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 20:35:01 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.29186.1661459697057983210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HBrNtozW;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so3338298wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=OYvYNmf/x4P7vSFlY+ls2p8t4uEh4HhTGMr1xOrMvUs=;
        b=HBrNtozWojv+7oaRZsLO0c6VtmVcPFw7d28Y8ug7JMKLnRsSl17O3h+rAzKBaDV1wy
         0vG/HOuo1YNprEx9bFxU88EmMD5kdv3Gt3yZNjALA9fIbD2NqWqOx8FbQB58MaJtp+iN
         U5yk2mVxdxixlwZDqzvUR66pPHh60uRWA0EEtE11aEBELMgxV1bB5SFlup7oKK6iTXKk
         PcW8bhux9FwT+55YrzC8vB/MrsSO41KH2aYBAJSL0n1FDBXcP1T4DGkwyeA6RIvVMlU0
         qLK1NlWsUkvjyv44eP9/DfaDSKhnMzJ41xUXoKsGZwUaxfCXu3ZUTvtwhT76X/Lz/Wau
         50Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=OYvYNmf/x4P7vSFlY+ls2p8t4uEh4HhTGMr1xOrMvUs=;
        b=MHAwet1OahOn7yroC0YwSRiY/qu3RYtVRTkV+iNBJsfoYIIGyJGmqX2GWL3/SnHWwh
         O7gGJzfTOjoPl3oA8RDfAfD34m18hF9dYv7G/bTBztuy1fxzvG6swWs/DuO79H+CMCM4
         z4Wyotr0Bej/9A+Y3ktbuQN9JoXz+JUAIx+iUZZHQ8QORXIfjd7pIxVfek1bFB3G+e2y
         nr8WiiHER4PU9Blnw3ICSsbR65vkGhPI1yQBEehCrI2yjCjarLoD54Rr+kKH/iNbzPYW
         RavjSrRav1P9B53kvcmj2+oW2shXOP6ba485jZj8QNpjD6sgmhC9+DZmoIJ1S/9Dpqfj
         8qUA==
X-Gm-Message-State: ACgBeo3Itqo7JdMwBOpVay3F1bpAOIWs1DsPi9bZa2gWGX2rrD6YWm+/
	aPrVmK/nNifSCUKzzlgXwxrEymlJGi0=
X-Google-Smtp-Source: 
 AA6agR5YyId612CWQFRx9Z6KLYgL97aDbU1xsQJcmtSpgI0hdCEPXC6Ag9mkAgEBmg8tSE/pNB6OYQ==
X-Received: by 2002:a1c:e917:0:b0:3a6:85b2:e8d with SMTP id
 q23-20020a1ce917000000b003a685b20e8dmr3392267wmc.154.1661459695376;
        Thu, 25 Aug 2022 13:34:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 m3-20020adfe0c3000000b002250fcfe2ddsm200006wri.14.2022.08.25.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:34:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] bitbake-layers: add ability to save current layer
 repository configuration into a file
Date: Thu, 25 Aug 2022 22:34:49 +0200
Message-Id: <20220825203451.2074080-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825203451.2074080-1-alex@linutronix.de>
References: <20220825203451.2074080-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 20:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169890

This addresses a long standing gap in the core offering:
there is no tooling to capture the currently configured layers
with their revisions, or restore the layers from a configuration
file (without using external tools, some of which aren't particularly
suitable for the task). This plugin addresses the 'capture' part.

Note that the actual writing is performed by a sub-plugin; one such
sub-plugin is provided (for the json + python script format), but
more can be added (e.g. kas, repo, etc.).

How to save a layer configuration:

a) Running with default choices:

$ bitbake-layers create-layers-setup /srv/work/alex/meta-alex/
NOTE: Starting bitbake server...
NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
NOTE: Created /srv/work/alex/meta-alex/setup-layers

b) Command line options:

NOTE: Starting bitbake server...
usage: bitbake-layers create-layers-setup [-h] [--output-prefix OUTPUT_PREFIX] [--writer {oe-setup-layers}] [--json-only] destdir

 Writes out a configuration file and/or a script that replicate the directory structure and revisions of the layers in a current build.

positional arguments:
  destdir               Directory where to write the output
                        (if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching).

optional arguments:
  -h, --help            show this help message and exit
  --output-prefix OUTPUT_PREFIX, -o OUTPUT_PREFIX
                        File name prefix for the output files, if the default (setup-layers) is undesirable.
  --writer {oe-setup-layers}, -w {oe-setup-layers}
                        Choose the output format (defaults to oe-setup-layers).

                        Currently supported options are:
                        oe-setup-layers - a self-contained python script and a json config for it.

  --json-only           When using the oe-setup-layers writer, write only the layer configuruation in json format. Otherwise, also a copy of scripts/oe-setup-layers (from oe-core or poky) is provided, which is a self contained python script that fetches all the needed layers and sets them to correct revisions using the data from the json.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py                | 108 ++++++++++++++++++
 .../bblayers/setupwriters/oe-setup-layers.py  |  50 ++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 meta/lib/bblayers/makesetup.py
 create mode 100644 meta/lib/bblayers/setupwriters/oe-setup-layers.py

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
new file mode 100644
index 0000000000..bef6da0ea8
--- /dev/null
+++ b/meta/lib/bblayers/makesetup.py
@@ -0,0 +1,108 @@
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
+    return MakeSetupPlugin()
+
+class MakeSetupPlugin(LayerPlugin):
+
+    def _get_repo_path(self, layer_path):
+        repo_path, _ = bb.process.run('git rev-parse --show-toplevel', cwd=layer_path)
+        return repo_path.strip()
+
+    def _get_remotes(self, repo_path):
+        remotes = {}
+        remotes_list,_ = bb.process.run('git remote', cwd=repo_path)
+        for r in remotes_list.split():
+            uri,_ = bb.process.run('git remote get-url {r}'.format(r=r), cwd=repo_path)
+            remotes[r] = {'uri':uri.strip()}
+        return remotes
+
+    def _get_describe(self, repo_path):
+        try:
+            describe,_ = bb.process.run('git describe --tags', cwd=repo_path)
+        except bb.process.ExecutionError:
+            return ""
+        return describe.strip()
+
+    def make_repo_config(self, destdir):
+        """ This is a helper function for the writer plugins that discovers currently confugured layers.
+        The writers do not have to use it, but it can save a bit of work and avoid duplicated code, hence it is
+        available here. """
+        repos = {}
+        layers = oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
+        try:
+            destdir_repo = self._get_repo_path(destdir)
+        except bb.process.ExecutionError:
+            destdir_repo = None
+
+        for (l_path, l_name, l_branch, l_rev, l_ismodified) in layers:
+            if l_name == 'workspace':
+                continue
+            if l_ismodified:
+                logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path))
+                return
+            repo_path = self._get_repo_path(l_path)
+            if repo_path not in repos.keys():
+                repos[repo_path] = {'path':os.path.basename(repo_path),'layers':{},'git-remote':{'rev':l_rev, 'branch':l_branch, 'remotes':self._get_remotes(repo_path), 'describe':self._get_describe(repo_path)}}
+                if repo_path == destdir_repo:
+                    repos[repo_path]['contains_this_file'] = True
+                if not repos[repo_path]['git-remote']['remotes'] and not repos[repo_path]['contains_this_file']:
+                    logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
+                    return
+            repos[repo_path]['layers'][l_name] = {'subpath':l_path.replace(repo_path,'')[1:]}
+
+        top_path = os.path.commonpath([os.path.dirname(r) for r in repos.keys()])
+
+        repos_nopaths = {}
+        for r in repos.keys():
+            r_nopath = os.path.basename(r)
+            repos_nopaths[r_nopath] = repos[r]
+            r_relpath = os.path.relpath(r, top_path)
+            repos_nopaths[r_nopath]['path'] = r_relpath
+        return repos_nopaths
+
+    def do_make_setup(self, args):
+        """ Writes out a configuration file and/or a script that replicate the directory structure and revisions of the layers in a current build. """
+        for p in self.plugins:
+            if str(p) == args.writer:
+                p.do_write(self, args)
+
+    def register_commands(self, sp):
+        parser_setup_layers = self.add_command(sp, 'create-layers-setup', self.do_make_setup, parserecipes=False)
+        parser_setup_layers.add_argument('destdir',
+            help='Directory where to write the output\n(if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching).')
+        parser_setup_layers.add_argument('--output-prefix', '-o',
+            help='File name prefix for the output files, if the default (setup-layers) is undesirable.')
+
+        self.plugins = []
+
+        for path in (self.tinfoil.config_data.getVar('BBPATH').split(':')):
+            pluginpath = os.path.join(path, 'lib', 'bblayers', 'setupwriters')
+            bb.utils.load_plugins(logger, self.plugins, pluginpath)
+
+        parser_setup_layers.add_argument('--writer', '-w', choices=[str(p) for p in self.plugins], help="Choose the output format (defaults to oe-setup-layers).\n\nCurrently supported options are:\noe-setup-layers - a self-contained python script and a json config for it.\n\n", default="oe-setup-layers")
+
+        for plugin in self.plugins:
+            if hasattr(plugin, 'register_arguments'):
+                plugin.register_arguments(parser_setup_layers)
diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
new file mode 100644
index 0000000000..f6a484b766
--- /dev/null
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -0,0 +1,50 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import logging
+import os
+import json
+import stat
+
+logger = logging.getLogger('bitbake-layers')
+
+def plugin_init(plugins):
+    return OeSetupLayersWriter()
+
+class OeSetupLayersWriter():
+
+    def __str__(self):
+        return "oe-setup-layers"
+
+    def _write_python(self, input, output):
+        with open(input) as f:
+            script = f.read()
+        with open(output, 'w') as f:
+            f.write(script)
+        st = os.stat(output)
+        os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)
+
+    def _write_json(self, repos, output):
+        with open(output, 'w') as f:
+            json.dump(repos, f, sort_keys=True, indent=4)
+
+    def do_write(self, parent, args):
+        """ Writes out a python script and a json config that replicate the directory structure and revisions of the layers in a current build. """
+        repos = parent.make_repo_config(args.destdir)
+        json = {"version":"1.0","sources":repos}
+        if not repos:
+            raise Exception("Could not determine layer sources")
+        output = args.output_prefix or "setup-layers"
+        output = os.path.join(os.path.abspath(args.destdir),output)
+        self._write_json(json, output + ".json")
+        logger.info('Created {}.json'.format(output))
+        if not args.json_only:
+            self._write_python(os.path.join(os.path.dirname(__file__),'../../../../scripts/oe-setup-layers'), output)
+        logger.info('Created {}'.format(output))
+
+    def register_arguments(self, parser):
+        parser.add_argument('--json-only', action='store_true',
+            help='When using the oe-setup-layers writer, write only the layer configuruation in json format. Otherwise, also a copy of scripts/oe-setup-layers (from oe-core or poky) is provided, which is a self contained python script that fetches all the needed layers and sets them to correct revisions using the data from the json.')
-- 
2.30.2


