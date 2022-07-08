Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075B2CCA47F
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 19:17:51 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.3126.1657307863336035779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b36OHO7C;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id y8so22212099eda.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X4+rf0hzLkg2pFXUUDn+nKCK8OEOMFIx18xUNHOTuio=;
        b=b36OHO7CXUCy/0+I5rDiP/1c/NdL3MkErYv5u3+W77R94nFT3EzMbsEd/9PmXsRra0
         0ML0JyQbZgcTXtrIspXxXVhShoqch0s+XhSq8KHvy1SPbJjJPYKKUYXP0LMxF/a6Io9w
         +KGrEF0+c5UX1c93dJZCIrMC+urKSL6whTQwNUpNmK0cd4x79D3No8z63IWaCfG2AuE9
         6NF48+ll0H5mfwe5+ZFUNDrwIOBUMZng5A7GBz8dyUJxBq3PlePbXojOZLC+wimO/wsj
         ozuk/WgJS1kBbEDvN3d2RCArzR1TzVUG/a2VjTDao2MAlknO27iu2hrrJv8psEXAXHGF
         94Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X4+rf0hzLkg2pFXUUDn+nKCK8OEOMFIx18xUNHOTuio=;
        b=Ea1SClUIIWAyQhNXorJ6b7DGBpi4w2pRGPRUsVnrMHrjQkgqTIA81JoyektDF+Mbtv
         p5uBnPhGzNr/eijnXXSSH/sDyYGcEZSdiUY1qDNjdazcjbedT5ajwDWJAXNptHbO6JVd
         uAs+avOwNDtHR1tsAAj8yQFxFxgdkKHLXd+jGCeONjdjCs0tAd44IeHoXHTipBB6WUv9
         Q1DOTJ262unWu33mhPYXv5CAut/f06AZaH0ErQhK6UiLqU+goAKB7KxCOROQlIj30lBr
         XvlLhEzcEBNWWA8mpcwvJeV5JZnmHrF6OD802QZNCVZiHzoO0FY5oKIBGJ0y9ruOi4Uo
         DbDw==
X-Gm-Message-State: AJIora+HtYLs4qWiVD81C/zy9rqIhvk0PbWLAQQpwz7Z/Kh5Jd5ubUKW
	9nJ4qOaWtyGLzHI8PzV8BhiO++G7qJKYsg==
X-Google-Smtp-Source: 
 AGRyM1vnDdFHd6+4O6NLF5hCL4AZ+cbt1E9arX5SK+d6CcNjKTmIylOao3yNeiB6RnNJ1ya59m4G4g==
X-Received: by 2002:a05:6402:3708:b0:433:2d3b:ed5 with SMTP id
 ek8-20020a056402370800b004332d3b0ed5mr6799865edb.246.1657307861769;
        Fri, 08 Jul 2022 12:17:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bl24-20020a170906c25800b00704757b1debsm20465705ejb.9.2022.07.08.12.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 12:17:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 2/3] bitbake-layers: add ability to save current layer
 repository configuration into a json file
Date: Fri,  8 Jul 2022 21:17:29 +0200
Message-Id: <20220708191730.3413011-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708191730.3413011-1-alex@linutronix.de>
References: <20220708191730.3413011-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 19:17:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167829

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

FIXME:
- oe-selftest that validates the generated json against the schema
- handling hierarchical layer repository trees

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py | 135 +++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 meta/lib/bblayers/makesetup.py

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
new file mode 100644
index 0000000000..36de32b6f9
--- /dev/null
+++ b/meta/lib/bblayers/makesetup.py
@@ -0,0 +1,135 @@
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
+        for (l_path, l_name, l_branch, l_rev, l_ismodified) in layers:
+            if l_name == 'workspace':
+                continue
+            if l_ismodified:
+                logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path))
+                return
+            repo_path = self._get_repo_path(l_path)
+            if repo_path not in repos.keys():
+                repos[repo_path] = {'path':os.path.basename(repo_path),'layers':{},'git-remote':{'rev':l_rev, 'branch':l_branch, 'remotes':self._get_remotes(repo_path), 'describe':self._get_describe(repo_path)}}
+                if not repos[repo_path]['git-remote']['remotes']:
+                    logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
+                    return
+                if repo_path in os.path.abspath(destdir):
+                    repos[repo_path]['contains_this_file'] = True
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
+        repo_dirs = set([os.path.dirname(p) for p in repos.keys()])
+        if len(repo_dirs) > 1:
+            logger.error("Layer repositories are not all in the same parent directory: {repo_dirs}. They need to be relocated into the same directory.".format(repo_dirs=repo_dirs))
+            return
+
+        repos_nopaths = {}
+        for r in repos.keys():
+            r_nopath = os.path.basename(r)
+            repos_nopaths[r_nopath] = repos[r]
+        return repos_nopaths
+
+    def do_make_setup(self, args):
+        """ Writes out a python script and a json config that replicate the directory structure and revisions of the layers in a current build. """
+        repos = self._make_repo_config(args.destdir)
+        json = {"version":"1.0","sources":repos}
+        if not repos:
+            return
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


