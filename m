Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B10EC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:11:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.8425.1659103861993777675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kmQ/h3hr;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id sz17so8733094ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0dDqFtaP0FFfSqzIoXwx2hoyxMlP101mCMxyJc6rpBY=;
        b=kmQ/h3hrrirAFjgBunTw1HUaLulf04SUtqZ14guloEtBi2NsxuR3FwTkz8OYwpKxZ9
         XLF7TFzladciWmwIVz3UA9f8lqLTWzhLZ0O6hYxPkYA1/akucJ0b9fDdYuKyXOaJFXmX
         wopLCM4PsQXEUoHmplyXKfYBiOY1NHepcWtm16Fi3fsj4yIDlgCBibSd4LRDrLlO4Y0z
         w00KjAnSluh7xeKqvhHMVpfYVlxoMFEcCkvO8oTNBt/NfPAHXQ4Svf3s1lo1WASFfxl6
         Kg0jvxe1liBX6C/Sx9ZYXf04/hO5E4p3W0Ja8ZY9U4dQXS4I0DQ63Z6cLb2LP0h598Mf
         B0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dDqFtaP0FFfSqzIoXwx2hoyxMlP101mCMxyJc6rpBY=;
        b=T6oaonwcVpZ7SvvzXXgHF16vDDu7x0zBiITRnX3a/QRxlELXwlpy6JyRPXLHDT69c0
         A25KfwfNetGK6lPOKiEzdSwGBRvMFTevOUrj3AQKEAESKfYXiA3rq/F8QVv01DJ9BE+O
         NAsN1NbgHrwaJL1CHPI8sl1MLupaRlO4efxccUebmX6OayaIiMnRxTxbCk3ac66TYEtb
         lEvAfp3LswoGDbCyjeXQp3cRaGAhgJuz9mCTJGSBKUuKtGMlgh5waZqpE7qaNdGNpcFu
         uekJd7GvZaDUkv3WklxvhjDWyn/qEzlvV+Mh7AYJEtA4Nie4OcNmqCoPoIW/gyxAx4LC
         jOvw==
X-Gm-Message-State: AJIora9us7o6ao6qftEqASDINQUXLaJ/jdiq6vNTlwl3hlWZO0yW24tq
	NVTe2upbUVuW16+gaL+cUSQEITF0yv4=
X-Google-Smtp-Source: 
 AGRyM1un+LOJk1rOtfhYBnuXpyci15SD+0aZoV27werBCXLCabzsmAoyNq5SePtZ/UzPoAsJUVhqHA==
X-Received: by 2002:a17:906:4598:b0:72f:643c:db45 with SMTP id
 qs24-20020a170906459800b0072f643cdb45mr3058735ejc.194.1659103860221;
        Fri, 29 Jul 2022 07:11:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fm15-20020a1709072acf00b0072b14836087sm1744227ejc.103.2022.07.29.07.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:10:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] bitbake-layers: add ability to save current layer
 repository configuration into a json file
Date: Fri, 29 Jul 2022 16:10:47 +0200
Message-Id: <20220729141049.835733-4-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/168631

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


