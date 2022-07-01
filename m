Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F309C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 19:25:21 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.42445.1656703515508068814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 12:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GjEhfRwl;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id c65so4107618edf.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/mICXxqKZTnAlAQF1CIcPVVxp6F3QyjYhPO4xFuYqM=;
        b=GjEhfRwlKdP3NcF2ITqpN5KCIbyY6274/IByGSP5H7ZAnWpYoCyV6IksDFm8nv8EQO
         gG4W9fdTkRm7wWHDiLTz/SN8XbkCsrHOEhLyGe2sFoa3mOKoQD1ep8ozDwBTNM+/DxhB
         732lQhOgUc6ZKon8kBP5o8qA5FEdxtNr3lfXIWXyxItCKgJ5kcO9jwf3XS+SSuGlI1gC
         WFq9YqjZfsVn8RXfJLK0cNJ3tV2S+qv/kv3XXgYsYWMavOWyKGTQR13wj/vbFhvUiM1O
         K+q0lG4OHa+udVFJhVqHqx0SAvusKs7OlyxW+8zTPrw6YiqyHHkidJToWiPRjfJIV7d6
         DKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/mICXxqKZTnAlAQF1CIcPVVxp6F3QyjYhPO4xFuYqM=;
        b=jem61d7edHocYvuc781nSw5YUJqLG03VPMbiUBdTCq+mqULv0hoMKVOOGHIUzAv/8d
         eAb0vj/Rvuid8oakCv9PBiB6nDmq93H5kqFNS0nn5vdPWFyKeqiLJgd8YODn4kPUWX+w
         Tr1kYr/BEoqAEs2xKNvJlthQ5Bx4uOXw4XOsU+RzD2ApPGC9RJlO7Z0BzUh0ZjAHHN78
         fUcuE75ff/zTik6EuJTafPs3XWck6pCDLl/puh4gpWtccVpTUxxRLZL5G+rtlG/kjVsB
         H3+Ga3/y1RdLTBIQwEk2diNxIQ6nF+D3ylkteqTKYHeXXg9lNab8b1zv2eq32mEMIckH
         9rEQ==
X-Gm-Message-State: AJIora/WLsqLjmItwvcLgZ+4KrEfS/Qh+pbkwAH0pMKU0blEQckVGtZE
	1gk4PAsbt2hg0QkjJbjmfPaxz+4aKo6Egm8p
X-Google-Smtp-Source: 
 AGRyM1u+l9WHBzq+xim2/2yotCCO/rGmpI0Y8yPXujCv93VHHYkpfFGx+8gTwAQw7iFmXEDEbO63sg==
X-Received: by 2002:a05:6402:501d:b0:437:e000:a898 with SMTP id
 p29-20020a056402501d00b00437e000a898mr17929517eda.265.1656703513610;
        Fri, 01 Jul 2022 12:25:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 h26-20020aa7c61a000000b00435cfa7c6f5sm15304606edq.46.2022.07.01.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 12:25:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH] bitbake-layers: add layer repositories/revisions save and
 restore tooling (aka 'layer configuration')
Date: Fri,  1 Jul 2022 21:24:49 +0200
Message-Id: <20220701192449.1358325-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 19:25:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167540

This addresses a long standing gap in the core offering:
there is no tooling to capture the currently configured layers
with their revisions, or restore the layers from a configuration
file (without using external tools, some of which aren't particularly
suitable for the task). This plugin addresses the gap.

How to use:

1. Saving a layer configuration:

a) Command line options:

alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-layers-setup -h
NOTE: Starting bitbake server...
usage: bitbake-layers create-layers-setup [-h] [--output OUTPUT] [--format {python,json,kas}] destdir

 Writes out a python script/kas config/json config that replicates the directory structure and revisions of the layers in a current build.

positional arguments:
  destdir               Directory where to write the output
                        (if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).

optional arguments:
  -h, --help            show this help message and exit
  --output OUTPUT, -o OUTPUT
                        File name where to write the output, if the default (setup-layers.py/.json/.yml) is undesirable.
  --format {python,json,kas}, -f {python,json,kas}
                        Format of the output. The options are:
                        	python - a self contained python script that fetches all the needed layers and sets them to correct revisions (default, recommended)
                        	kas - a configuration file for the kas tool that allows the tool to do the same
                        	json - a json formatted file containing all the needed metadata to do the same by any external or custom tool.

b) Running with default choices:

alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers create-layers-setup ../../meta-alex/
NOTE: Starting bitbake server...
NOTE: Created /srv/work/alex/meta-alex/setup-layers.py

2. Restoring the layers from the saved configuration:

a) Clone meta-alex separately, as a bootstrap layer/repository. It should already contain setup-layers.py created in the previous step.

b) Command line options:

alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py -h
usage: setup-layers.py [-h] [--force-meta-alex-checkout] [--choose-poky-remote {origin,poky-contrib}] [--destdir DESTDIR]

A self contained python script that fetches all the needed layers and sets them to correct revisions

optional arguments:
  -h, --help            show this help message and exit
  --force-meta-alex-checkout
                        Force the checkout of the bootstrap layer meta-alex (by default it is presumed that this script is in it, and so the layer is already in place).
  --choose-poky-remote {origin,poky-contrib}
                        Choose a remote server for layer poky (default: origin)
  --destdir DESTDIR     Where to check out the layers (default is /srv/work/alex/layers-test).

c) Running with default options:

alex@Zen2:/srv/work/alex/layers-test/meta-alex$ ./setup-layers.py
Note: not checking out layer meta-alex, use --force-meta-alex-checkout to override.
Checking out layer meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master from remote origin at git://git.yoctoproject.org/meta-intel
Running 'git clone -q git://git.yoctoproject.org/meta-intel meta-intel' in /srv/work/alex/layers-test
Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/layers-test/meta-intel
Note: multiple remotes defined for layer poky, using origin (run with -h to see others).
Checking out layer poky, revision 4.1_M1-295-g6850b29806, branch akanavin/setup-layers from remote origin at git://git.yoctoproject.org/poky
Running 'git clone -q git://git.yoctoproject.org/poky poky' in /srv/work/alex/layers-test
Running 'git checkout -q 4cc94de99230201c3c39b924219113157ff47006' in /srv/work/alex/layers-test/poky

And that's it!

FIXMEs:
- kas config writer not yet implemented
- oe-selftest test cases not yet written

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py                | 117 ++++++++++++++++++
 .../templates/setup-layers.py.template        |  77 ++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 meta/lib/bblayers/makesetup.py
 create mode 100644 meta/lib/bblayers/templates/setup-layers.py.template

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
new file mode 100644
index 0000000000..3c86eea3c4
--- /dev/null
+++ b/meta/lib/bblayers/makesetup.py
@@ -0,0 +1,117 @@
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
+    def _write_python(self, repos, output):
+        with open(os.path.join(os.path.dirname(__file__), "templates", "setup-layers.py.template")) as f:
+            template = f.read()
+        args = sys.argv
+        args[0] = os.path.basename(args[0])
+        script = template.replace('{cmdline}', " ".join(args)).replace('{layerdata}', json.dumps(repos, sort_keys=True, indent=4))
+        with open(output, 'w') as f:
+            f.write(script)
+        st = os.stat(output)
+        os.chmod(output, st.st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)
+
+    def _write_json(self, repos, output):
+        with open(output, 'w') as f:
+            json.dump(repos, f, sort_keys=True, indent=4)
+
+    def _write_kas(self, repos, output):
+        raise NotImplementedError('Kas config writer not implemented yet')
+
+    _write_config = {"python":_write_python, "json":_write_json, "kas":_write_kas}
+    _output_filename = {"python":"setup-layers.py","json":"setup-layers.json","kas":"setup-layers.kas.yaml"}
+
+    def _get_repo_path(self, layer_path):
+        repo_path, _ = bb.process.run('git rev-parse --show-toplevel', cwd=layer_path)
+        return repo_path.strip()
+
+    def _get_remotes(self, repo_path):
+        remotes = []
+        remotes_list,_ = bb.process.run('git remote', cwd=repo_path)
+        for r in remotes_list.split():
+            uri,_ = bb.process.run('git remote get-url {r}'.format(r=r), cwd=repo_path)
+            remotes.append({'name':r,'uri':uri.strip()})
+        return remotes
+
+    def _get_describe(self, repo_path):
+        try:
+            describe,_ = bb.process.run('git describe --tags', cwd=repo_path)
+        except bb.process.ExecutionError:
+            return ""
+        return describe.strip()
+
+    def _make_repo_config(self, destdir):
+        repos = {}
+        layers = oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
+        for l in layers:
+            if l[1] == 'workspace':
+                continue
+            if l[4]:
+                logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l[1],path=l[0]))
+                return
+            repo_path = self._get_repo_path(l[0])
+            if repo_path not in repos.keys():
+                repos[repo_path] = {'rev':l[3], 'branch':l[2], 'remotes':self._get_remotes(repo_path), 'layers':[], 'describe':self._get_describe(repo_path)}
+                if not repos[repo_path]['remotes']:
+                    logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
+                    return
+                if repo_path in os.path.abspath(destdir):
+                    repos[repo_path]['is_bootstrap'] = True
+            repos[repo_path]['layers'].append({'name':l[1],'path':l[0].replace(repo_path,'')[1:]})
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
+        """ Writes out a python script/kas config/json config that replicates the directory structure and revisions of the layers in a current build. """
+        repos = self._make_repo_config(args.destdir)
+        if not repos:
+            return
+        output = args.output
+        if not output:
+            output = self._output_filename[args.format]
+        output = os.path.join(os.path.abspath(args.destdir),output)
+        self._write_config[args.format](self, repos, output)
+        logger.info('Created {}'.format(output))
+
+    def register_commands(self, sp):
+        parser_setup_layers = self.add_command(sp, 'create-layers-setup', self.do_make_setup, parserecipes=False)
+        parser_setup_layers.add_argument('destdir',
+            help='Directory where to write the output\n(if it is inside one of the layers, the layer becomes a bootstrap repository and thus will be excluded from fetching by the script).')
+        parser_setup_layers.add_argument('--output', '-o',
+            help='File name where to write the output, if the default (setup-layers.py/.json/.yml) is undesirable.')
+        parser_setup_layers.add_argument('--format', '-f', choices=['python', 'json', 'kas'], default='python',
+            help='Format of the output. The options are:\n\tpython - a self contained python script that fetches all the needed layers and sets them to correct revisions (default, recommended)\n\tkas - a configuration file for the kas tool that allows the tool to do the same\n\tjson - a json formatted file containing all the needed metadata to do the same by any external or custom tool.')
diff --git a/meta/lib/bblayers/templates/setup-layers.py.template b/meta/lib/bblayers/templates/setup-layers.py.template
new file mode 100644
index 0000000000..a704ad3d70
--- /dev/null
+++ b/meta/lib/bblayers/templates/setup-layers.py.template
@@ -0,0 +1,77 @@
+#!/usr/bin/env python3
+#
+# This file was generated by running
+#
+# {cmdline}
+#
+# It is recommended that you do not modify it directly, but rather re-run the above command.
+#
+
+layerdata = """
+{layerdata}
+"""
+
+import argparse
+import json
+import os
+import subprocess
+
+def _do_checkout(args):
+    for l_name in layers:
+        l_data = layers[l_name]
+        if 'is_bootstrap' in l_data.keys():
+            force_arg = 'force_{}_checkout'.format(l_name.replace('-','_'))
+            if not args[force_arg]:
+                print('Note: not checking out layer {layer}, use {layerflag} to override.'.format(layer=l_name, layerflag='--force-{}-checkout'.format(l_name)))
+                continue
+        rev = l_data['rev']
+        desc = l_data['describe']
+        if not desc:
+            desc = rev[:10]
+        branch = l_data['branch']
+        remotes = l_data['remotes']
+        remote = remotes[0]
+        if len(remotes) > 1:
+            remotechoice = args['choose_{}_remote'.format(l_name.replace('-','_'))]
+            for r in remotes:
+                if r['name'] == remotechoice:
+                    remote = r
+                    print('Note: multiple remotes defined for layer {}, using {} (run with -h to see others).'.format(l_name, r['name']))
+        print('Checking out layer {}, revision {}, branch {} from remote {} at {}'.format(l_name, desc, branch, remote['name'], remote['uri']))
+        cmd = 'git clone -q {} {}'.format(remote['uri'], l_name)
+        cwd = args['destdir']
+        print("Running '{}' in {}".format(cmd, cwd))
+        subprocess.check_output(cmd, text=True, shell=True, cwd=cwd)
+        cmd = 'git checkout -q {}'.format(rev)
+        cwd = os.path.join(args['destdir'], l_name)
+        print("Running '{}' in {}".format(cmd, cwd))
+        subprocess.check_output(cmd, text=True, shell=True, cwd=cwd)
+
+layers = json.loads(layerdata)
+parser = argparse.ArgumentParser(description='A self contained python script that fetches all the needed layers and sets them to correct revisions')
+
+bootstraplayer = None
+for l in layers:
+    if 'is_bootstrap' in layers[l]:
+        bootstraplayer = l
+
+if bootstraplayer:
+    parser.add_argument('--force-{bootstraplayer}-checkout'.format(bootstraplayer=bootstraplayer), action='store_true',
+        help='Force the checkout of the bootstrap layer {bootstraplayer} (by default it is presumed that this script is in it, and so the layer is already in place).'.format(bootstraplayer=bootstraplayer))
+
+for l in layers:
+    remotes = layers[l]['remotes']
+    if len(remotes) > 1:
+        parser.add_argument('--choose-{multipleremoteslayer}-remote'.format(multipleremoteslayer=l),choices=[r['name'] for r in remotes], default=remotes[0]['name'],
+            help='Choose a remote server for layer {multipleremoteslayer} (default: {defaultremote})'.format(multipleremoteslayer=l, defaultremote=remotes[0]['name']))
+
+try:
+    defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', text=True, shell=True, cwd=os.path.dirname(__file__)))
+except subprocess.CalledProcessError as e:
+    defaultdest = os.path.abspath(".")
+
+parser.add_argument('--destdir', default=defaultdest, help='Where to check out the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
+
+args = parser.parse_args()
+
+_do_checkout(vars(args))
-- 
2.30.2


