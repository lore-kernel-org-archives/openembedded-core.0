Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC76AC7EE24
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 09:57:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.12539.1683712652503410791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 02:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lWp7K8mj;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bceaf07b8so13045188a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683712651; x=1686304651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeU3DLYS8d+cyG7jTAbAH25IGZzeIhaHMzrAasD8GDU=;
        b=lWp7K8mjm3zWypy6KJjVoIregHX60B5c922qIT12ZxYQUvTG5T2787bilmQcIXjodq
         znA+Uz+pN0iCKq/SmSu3/xkvPM3c5TrGQhzjvkIbfN99zUDcnRyKDAmnu11B1aqM5GcL
         b6HNODf1QFnQC39rHT8bYog0ZLKXd4YsnWlXshHxSxKfHj/UYTeBAe0PLPFKJHsFy4eE
         mcXQ1parRfhqrFECy3Ww1VSAZQILBGOz2xoWWdbkId3XKhspxdase+5rZ/NFirCyxBgv
         NTBmkqyQL4kMIY2U30hNVGVyzTcTvaAG3RVmLD5XdpOW1Asnkdi8jE77tywgHI9g8KZp
         XJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683712651; x=1686304651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeU3DLYS8d+cyG7jTAbAH25IGZzeIhaHMzrAasD8GDU=;
        b=DK7IK/moQRqTz6eKRHpDoqmrJEOx7sywRwZlY/CW7ikxgTphMA7jlF1JSVSLFNDNla
         VkDArWpRKXwZVOD3snyh5TazGV66Mr2GUSTIkFT4It6lYEWeiSG+Zk5q+UNofTmLKUGs
         PTNwVCl6kLWDXKPs+jhWKdkq+7hMS5e4bn5H4qNpZGlCrlYCJfe3C2S0FBkZrVm2cwMp
         hRZbLLK2ivSUMkqbY+sOj2i+0Wnnu+8j4Z+0N/3IRrKUUVt1jeXfgBJcQ1/plskPjuuH
         wn4Byz79NH5VtgQlHgXGZoQs9I/W4obJ3cN3dX909MzED2b1msSjScQGrlrxONpd4y+1
         LHyw==
X-Gm-Message-State: AC+VfDwT1RGJRYegCfPSs+cp6noM4CdUO3ksWMiyy2xPGR/Aw3TocRgD
	Y5Uj5yxFjThSQtc03+m8hLusXHw2MN0=
X-Google-Smtp-Source: ACHHUZ7VSnfuQ5Y6cPYZmFOQ7BsLx5qfR1gQXBWQ5Y+HQ5Mta1sDFVyukqCsFzq9pQB8QkxO6Qt3Gw==
X-Received: by 2002:a17:907:62aa:b0:94f:62a2:d1ab with SMTP id nd42-20020a17090762aa00b0094f62a2d1abmr16016723ejc.63.1683712650570;
        Wed, 10 May 2023 02:57:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id gz10-20020a170907a04a00b0096609d11c83sm2480851ejc.60.2023.05.10.02.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 02:57:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] oe-setup-build: add a tool for discovering config templates and setting up builds
Date: Wed, 10 May 2023 11:57:26 +0200
Message-Id: <20230510095726.4090311-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230510095726.4090311-1-alex@linutronix.de>
References: <20230510095726.4090311-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181106

This is the last (I believe) piece of the puzzle in setting up builds from nothing
without having to write custom scripts or use external tools.

After layers have been fetched and placed into their respective locations by
oe-setup-layers, one would surely want to proceed to the actual build, and here's how:

1. Without arguments or with 'list-config-templates', the tool reads available layers
from .oe-layers.json file (written out by oe-setup-layers) and prints what
templates it has found, as seen below. If the following is not enough information,
adding '-v' will also print conf-notes.txt for each of the templates:

$ oe-setup-build
Available build configuration templates (re-run with -v to see their descriptions):

/srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/alex/poky/meta-poky/conf/templates/default
will create a build configuration in /srv/work/alex/build-meta-poky-default

/srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/alex/meta-alex/conf/templates/configuration-gizmo
will create a build configuration in /srv/work/alex/build-meta-alex-configuration-gizmo

/srv/work/alex/poky/scripts/oe-setup-build setup-build-env -c /srv/work/alex/meta-alex/conf/templates/configuration-gadget
will create a build configuration in /srv/work/alex/build-meta-alex-configuration-gadget

2. Then the user picks one command of the above and runs it. This will land them in a shell ready to run bitbake:

$ oe-setup-build setup-build-env -c /srv/work/alex/meta-alex/conf/templates/configuration-gizmo
Running: TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/configuration-gizmo . /srv/work/alex/poky/oe-init-build-env /srv/work/alex/build-meta-alex-configuration-gizmo && /bin/bash

(...standard Yocto banner omitted...)

This configuration template will set up a build for the purposes of supporting gizmo.
Please refer to meta-alex/README for additional details and available bitbake targets.

3. The full set of command line options is:

$ oe-setup-build -h
usage: oe-setup-build [-h] {list-config-templates,setup-build-env} ...

A script that discovers available build configuration templates and sets up a build environment based on one of them

positional arguments:
  {list-config-templates,setup-build-env}
    list-config-templates
                        List available configuration templates
    setup-build-env     Set up a build environment and open a shell session with it, ready to run builds.

optional arguments:
  -h, --help            show this help message and exit

$ oe-setup-build list-config-templates -h
usage: oe-setup-build list-config-templates [-h] [--layerlist LAYERLIST] [-v]

optional arguments:
  -h, --help       show this help message and exit
  --layerlist LAYERLIST
                        Where to look for available layers (as written out by setup-layers script) (default is /srv/storage/alex/yocto/build-64-alt/.oe-layers.json).
  -v               Print a description for each available build configuration template.

$ oe-setup-build setup-build-env -h
usage: oe-setup-build setup-build-env [-h] -c template_path [-b build_path] [--no-shell]

optional arguments:
  -h, --help        show this help message and exit
  -c template_path  Use a build configuration template in template_path to set up a build environment (run this script with 'list-config-templates' to see what is available)
  -b build_path     Set up a build directory in build_path (run this script with 'list-config-templates' to see where it would be by default)
  --no-shell        Create a build directory but do not start a shell session with the build environment from it.

4. There's an an added hint in oe-setup-layers about how to proceed (as it is really not user-friendly
to fetch the layer repos successfully and then exit without a word), and a symlink to the script
from the top level layer checkout directory.

5. The selftest to check layer setup has been adjusted to run a basic check for template
discovery and build setup. The revision of poky to be cloned has been bumped to 4.1,
as that's the first version with a default template in a standard location.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 23 ++++++-
 scripts/oe-setup-build                   | 77 ++++++++++++++++++++++++
 scripts/oe-setup-layers                  | 10 +++
 3 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100755 scripts/oe-setup-build

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 65426a67829..73fefb5d195 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -151,12 +151,12 @@ class BitbakeLayers(OESelftestTestCase):
         self.validate_layersjson(jsonfile)
 
         # The revision-under-test may not necessarily be available on the remote server,
-        # so replace it with a revision that has a yocto-4.0 tag.
+        # so replace it with a revision that has a yocto-4.1 tag.
         import json
         with open(jsonfile) as f:
             data = json.load(f)
         for s in data['sources']:
-            data['sources'][s]['git-remote']['rev'] = '00cfdde791a0176c134f31e5a09eff725e75b905'
+            data['sources'][s]['git-remote']['rev'] = '5200799866b92259e855051112520006e1aaaac0'
         with open(jsonfile, 'w') as f:
             json.dump(data, f)
 
@@ -164,3 +164,22 @@ class BitbakeLayers(OESelftestTestCase):
         result = runCmd('{}/setup-layers --destdir {}'.format(self.testlayer_path, testcheckoutdir))
         layers_json = os.path.join(testcheckoutdir, ".oe-layers.json")
         self.assertTrue(os.path.exists(layers_json), "File {} not found in test layer checkout".format(layers_json))
+
+        # As setup-layers checkout out an old revision of poky, there is no setup-build symlink,
+        # and we need to run oe-setup-build directly from the current poky tree under test
+        oe_setup_build = os.path.join(get_bb_var('COREBASE'), 'scripts/oe-setup-build')
+        oe_setup_build_l = os.path.join(testcheckoutdir, 'setup-build')
+        os.symlink(oe_setup_build,oe_setup_build_l)
+
+        cmd = '{} list-config-templates --layerlist {}'.format(oe_setup_build_l, layers_json)
+        result = runCmd(cmd)
+        cond = "setup-build setup-build-env -c " in result.output and "conf/templates/default" in result.output
+        self.assertTrue(cond, "Incorrect output from {}: {}".format(cmd, result.output))
+
+        # rather than hardcode the build setup cmdline here, let's actually run what the tool suggests to the user
+        cmd = None
+        for l in result.output.splitlines():
+            if "setup-build setup-build-env -c " in l:
+                cmd = l + " --no-shell"
+        self.assertIsNotNone(cmd, "Could not find the command to set up a build in the output: {}".format(result.output))
+        result = runCmd(cmd)
diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
new file mode 100755
index 00000000000..4cfc002de3f
--- /dev/null
+++ b/scripts/oe-setup-build
@@ -0,0 +1,77 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import argparse
+import json
+import os
+import subprocess
+
+def defaultlayers():
+    return os.path.abspath(os.path.join(os.path.dirname(__file__), '.oe-layers.json'))
+
+def makebuildpath(topdir, templatelocation, template):
+    return os.path.join(topdir, "build-{}-{}".format(os.path.basename(os.path.abspath(os.path.join(templatelocation,'..','..'))), template))
+
+def print_templates(args):
+    layers_file = args.layerlist
+    verbose = args.v
+    if not os.path.exists(layers_file):
+        print("List of layers {} does not exist; were they set up using the setup-layers script?".format(layers_file))
+        return
+    layers_list = json.load(open(layers_file))["layers"]
+    print("Available build configuration templates (re-run with 'list-config-templates -v' to see their descriptions):\n")
+    for layer in layers_list:
+        template_dir = os.path.join(os.path.dirname(layers_file), layer, 'conf','templates')
+        if os.path.exists(template_dir):
+            for d in os.listdir(template_dir):
+                if not os.path.isdir(os.path.join(template_dir,d)):
+                    continue
+                print("{} setup-build-env -c {}\nwill create a build configuration in {}\n".format(__file__, os.path.join(template_dir, d), makebuildpath(os.path.dirname(defaultlayers()), template_dir, d)))
+                if verbose:
+                    if os.path.join(template_dir, d).endswith('meta-poky/conf/templates/default'):
+                        print("Description: this is the reference configuration of the poky reference distribution (choose this if you are uncertain).")
+                    elif os.path.join(template_dir, d).endswith('meta/conf/templates/default'):
+                        print("Description: this is the reference configuration of the openembedded-core layer (choose this if you are uncertain).")
+                    else:
+                        print("Description:", open(os.path.join(template_dir, d, 'conf-notes.txt')).read())
+                    print("---")
+
+def setup_build_env(args):
+    template = args.c
+    builddir = args.b
+    no_shell = args.no_shell
+    if not builddir:
+        builddir = makebuildpath(os.path.dirname(defaultlayers()), os.path.dirname(template), os.path.basename(template))
+    coredir = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
+    cmd = "TEMPLATECONF={} . {} {}".format(template, os.path.join(coredir, 'oe-init-build-env'), builddir)
+    if not no_shell:
+        cmd = cmd + " && {}".format(os.environ['SHELL'])
+    print("Running:", cmd)
+    subprocess.run(cmd, shell=True, executable=os.environ['SHELL'])
+
+parser = argparse.ArgumentParser(description="A script that discovers available build configuration templates and sets up a build environment based on one of them")
+subparsers = parser.add_subparsers()
+parser_list_templates = subparsers.add_parser('list-config-templates', help='List available configuration templates')
+
+parser_list_templates.add_argument("--layerlist", default=defaultlayers(), help='Where to look for available layers (as written out by setup-layers script) (default is {}).'.format(defaultlayers()))
+parser_list_templates.add_argument('-v', action='store_true',
+        help='Print a description for each available build configuration template.')
+parser_list_templates.set_defaults(func=print_templates)
+
+parser_setup_env = subparsers.add_parser('setup-build-env', help='Set up a build environment and open a shell session with it, ready to run builds.')
+parser_setup_env.add_argument('-c', metavar='template_path', required=True, help="Use a build configuration template in template_path to set up a build environment (run this script with 'list-config-templates' to see what is available)")
+parser_setup_env.add_argument('-b', metavar='build_path', help="Set up a build directory in build_path (run this script with 'list-config-templates' to see where it would be by default)")
+parser_setup_env.add_argument('--no-shell', action='store_true',
+        help='Create a build directory but do not start a shell session with the build environment from it.')
+parser_setup_env.set_defaults(func=setup_build_env)
+
+args = parser.parse_args()
+if 'func' in args:
+    args.func(args)
+else:
+    from argparse import Namespace
+    print_templates(Namespace(layerlist=defaultlayers(), v=False))
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index cbf94ddb08b..97e13fc03be 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -63,6 +63,7 @@ def _write_layer_list(dest, repodirs):
 def _do_checkout(args, json):
     repos = json['sources']
     repodirs = []
+    oesetupbuild = None
     for r_name in repos:
         r_data = repos[r_name]
         repodir = os.path.abspath(os.path.join(args['destdir'], r_data['path']))
@@ -108,9 +109,18 @@ def _do_checkout(args, json):
 
             if _contains_submodules(repodir):
                 print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(repodir))
+        if os.path.exists(os.path.join(repodir, 'scripts/oe-setup-build')):
+            oesetupbuild = os.path.join(repodir, 'scripts/oe-setup-build')
 
     _write_layer_list(args['destdir'], repodirs)
 
+    if oesetupbuild:
+        oesetupbuild_symlink = os.path.join(args['destdir'], 'setup-build')
+        if os.path.exists(oesetupbuild_symlink):
+            os.remove(oesetupbuild_symlink)
+        os.symlink(os.path.relpath(oesetupbuild,args['destdir']),oesetupbuild_symlink)
+        print("\nRun '{}' to list available build configuration templates and set up a build from one of them.".format(oesetupbuild_symlink))
+
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
 
 parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
-- 
2.30.2


