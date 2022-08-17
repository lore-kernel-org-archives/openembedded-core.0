Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FBFC32774
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 13:10:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.28523.1660741838866373622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 06:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Um05/CU/;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r16so6939876wrm.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0dDqFtaP0FFfSqzIoXwx2hoyxMlP101mCMxyJc6rpBY=;
        b=Um05/CU/X+ziKs710656NFApqJfjI2KcOdePiaYKrsbWNy540JHPoktU/11SGwsYWS
         Ula9I34Djp+CZjBBqxZRNubRAdvd63MzNlHyCsrADui3Lr95SwML53kojYVLH+D+Zb9u
         uU+epT3YXrfMbLszoNWb6G/vTOUWmMkNpzvPZvAPzH69czYqVmp4FcYVA3WeREoi4WY/
         wks0FxyxBGfVqbhDP7yFTCL/p+u7wjpAwws1+oIP5KRYPXGPd8/XfSsoLtMnzOQV06NI
         L6siMzU4X4+fUGOkPPOl1i/zJt5Kq+ZTKViu33K9lC69DjuU8+IdDjRGgWmx+3/RYPl7
         1OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0dDqFtaP0FFfSqzIoXwx2hoyxMlP101mCMxyJc6rpBY=;
        b=Z3AB80V0ZrJB7r+FgqZ38xCFZdmk7I/311nY9x224frTg9fMkELzqCuF3h1zTYYc27
         vxxqXLihpi94yu/aEBozTn9qn7X8NSv8H/8yioMvb7sC7qBMro3QIryPu/ZpzCgRJtc9
         S/4WZ3bKtA0eK3LSQ9RdAE5JjI5jahzyG1fMIFD6slmhYFq4G10e+WCNwtDl3Y+KWlU4
         V7cm+EbCCJEfAyd6BZ/neFst/Cf5apnsevTfL108ot9N0q4r1l9G1ybVY/RJwLdsiSWS
         x71ATndDG7b857FHEcjOtxD9LKOo4pTA+lPB1z8Wp1O3OdUCB2Kigblc5u75N0jzV9dt
         n2Jw==
X-Gm-Message-State: ACgBeo25itPL4HrkYAjp4vVGM2zA2iCp6LD/C974Y2LSihYOdU3C1jCG
	35HDQS5qusmJNsmbEoodW0b/MtOzw50=
X-Google-Smtp-Source: 
 AA6agR5B3JhjPGZuoijG65S9IcDYwkfXSi70+wLZJVLNFOEDQsQhfrVxO1FVfMEiBH06rWVzZ9mQJA==
X-Received: by 2002:a05:6000:1541:b0:222:cf65:18d7 with SMTP id
 1-20020a056000154100b00222cf6518d7mr13916128wry.659.1660741837095;
        Wed, 17 Aug 2022 06:10:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0021d6dad334bsm1462004wrb.4.2022.08.17.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:10:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] bitbake-layers: add ability to save current layer
 repository configuration into a json file
Date: Wed, 17 Aug 2022 15:10:21 +0200
Message-Id: <20220817131023.4093773-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817131023.4093773-1-alex@linutronix.de>
References: <20220817131023.4093773-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 13:10:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169480

This addresses a long standing gap in the core offering:
there is no tooling to capture the currently configured layers
with their revisions, or restore the layers from a configuration
file (without using external tools, some of which aren't particularly
suitable for the task). This plugin addresses the 'capture' part.

How to save a layer configuration:

a) Running with default choices:

NOTE: Starting bitbake server...
NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
NOTE: Created /srv/work/alex/meta-alex/setup-layers

b) Command line options:

alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-layers-setup -h
NOTE: Starting bitbake server...
usage: bitbake-layers create-layers-setup [-h] [--output-prefix OUTPUT_PREFIX] [--json-only] destdir

 Writes out a python script and a json config that replicate the directory structure and revisions of the layers in a current build.

positional arguments:
  destdir               Directory where to write the output
                        (if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).

optional arguments:
  -h, --help            show this help message and exit
  --output-prefix OUTPUT_PREFIX, -o OUTPUT_PREFIX
                        File name prefix for the output files, if the default (setup-layers) is undesirable.
  --json-only           Write only the layer configuruation in json format. Otherwise, also a copy of poky/scripts/oe-setup-layers is provided, which is a self contained python script that fetches all the needed layers and sets them to correct revisions using the data from the json.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py | 139 +++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 meta/lib/bblayers/makesetup.py

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
new file mode 100644
index 0000000000..b7f62900f4
--- /dev/null
+++ b/meta/lib/bblayers/makesetup.py
@@ -0,0 +1,139 @@
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
+    return MakeSetupPlugin()
+
+class MakeSetupPlugin(LayerPlugin):
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
+    def _get_confs(self, conf_path):
+        try:
+           files = os.listdir(conf_path)
+        except:
+           return []
+        return {f.replace(".conf",""):{} for f in files if f.endswith(".conf")}
+
+    def _get_distros(self, layer_path):
+        return self._get_confs(os.path.join(layer_path, "conf/distro"))
+
+    def _get_machines(self, layer_path):
+        return self._get_confs(os.path.join(layer_path, "conf/machine"))
+
+    def _get_buildconfigs(self, layerpath):
+        return {os.path.relpath(dir, start=layerpath):{} for (dir, subdirs, files) in os.walk(layerpath) if 'local.conf.sample' in files and 'bblayers.conf.sample' in files}
+
+    def _make_repo_config(self, destdir):
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
+            distros = self._get_distros(l_path)
+            machines = self._get_machines(l_path)
+            buildconfigs = self._get_buildconfigs(l_path)
+            if distros:
+                repos[repo_path]['layers'][l_name]['distros'] = distros
+            if machines:
+                repos[repo_path]['layers'][l_name]['machines'] = machines
+            if buildconfigs:
+                repos[repo_path]['layers'][l_name]['buildconfigs'] = buildconfigs
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
+        """ Writes out a python script and a json config that replicate the directory structure and revisions of the layers in a current build. """
+        repos = self._make_repo_config(args.destdir)
+        json = {"version":"1.0","sources":repos}
+        if not repos:
+            raise Exception("Could not determine layer sources")
+        output = args.output_prefix or "setup-layers"
+        output = os.path.join(os.path.abspath(args.destdir),output)
+        self._write_json(json, output + ".json")
+        logger.info('Created {}.json'.format(output))
+        if not args.json_only:
+            self._write_python(os.path.join(os.path.dirname(__file__),'../../../scripts/oe-setup-layers'), output)
+        logger.info('Created {}'.format(output))
+
+    def register_commands(self, sp):
+        parser_setup_layers = self.add_command(sp, 'create-layers-setup', self.do_make_setup, parserecipes=False)
+        parser_setup_layers.add_argument('destdir',
+            help='Directory where to write the output\n(if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).')
+        parser_setup_layers.add_argument('--output-prefix', '-o',
+            help='File name prefix for the output files, if the default (setup-layers) is undesirable.')
+        parser_setup_layers.add_argument('--json-only', action='store_true',
+            help='Write only the layer configuruation in json format. Otherwise, also a copy of poky/scripts/oe-setup-layers is provided, which is a self contained python script that fetches all the needed layers and sets them to correct revisions using the data from the json.')
-- 
2.30.2


