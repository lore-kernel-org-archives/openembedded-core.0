Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CD2C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 09:24:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.5322.1668072281748223047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 01:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JpJYRqBs;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso3897954wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 01:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NB6HTRAy1LlQsw/4xog8thbMExeVwBR6iVZhflH3ORs=;
        b=JpJYRqBsqvdkKv+GPTGs/Mm3EXvdp4qoTXCj8rQ6ptFaG3AmqY7VujyOkFgN4ThEEI
         0YnmNwkvI3l4y53kTiyVFVP8qwxUwA6vepEGXy7XAMk56I93pKhZ8GfU2URRxAPKffdZ
         LKX4mKom7JKN1OYlAzD+vZbTtGukK8ZgwC+kBWId0H0aPv8WYPF2aY2mGQHs0wbSRG/A
         hq/4/2kxmJUkfoFh28dRSm+aBX4AZdeW3A/FIctpJV01SFTbntvQhjcUGWzkf7AUF7YA
         5Av6xnZFRZsIRx20T8PYZ6IKXH5mpcIh9M4zCVhYoX5foDg05OprIbJjaBnRYetAKWNS
         Nzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB6HTRAy1LlQsw/4xog8thbMExeVwBR6iVZhflH3ORs=;
        b=XqGMDkfQwUI5l99FoYMylIh74He/nbSDO2CY2csqFTWg1AQ2nEq2ZtO45ZmwVK8qnY
         LoM8nVwhyS7Bmp7Z7kUDXJL75oXw0meqMCseWVoDdhjjrrRoNWIVO5AT6jrDwbEjrIzB
         /23F94178n1hBGlL/yNqoE3M+ifv1If2PHRxCsemU8bW2fa2Iq+lT+w6FOmGzo9FNTvO
         5Vq3Lc5k20cmh9nYYlgXQW+4YU0PkLqGdHt6jQono0jeWdAonsA53oo/0mdSn5YIIDMM
         YfSZ8JtXv4jUbfdO/6PvlYnquEppSTmWabxJcUy4/ieHL6AoToOtwB3x9k0jT4+HFr/b
         25og==
X-Gm-Message-State: ACrzQf1AZEP050H1HCZGx3UFwA0Zm5qUos35sjyRJLTTUVKUbbGYNEy0
	kAnAjK7ZMbRi4oKa60E4tIstsb+P/ms=
X-Google-Smtp-Source: AMsMyM596/5J/5LDHHwK+kGkd5K8CKuxiQjGtBh1d6x7ieH1JGTsPiE+Vy1YnFAEi0qwBdLnvohA9A==
X-Received: by 2002:a1c:3b54:0:b0:3a8:3e58:bb9b with SMTP id i81-20020a1c3b54000000b003a83e58bb9bmr1013989wma.168.1668072279933;
        Thu, 10 Nov 2022 01:24:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b003a2f2bb72d5sm5651150wmo.45.2022.11.10.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 01:24:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] oe-setup-build: add a tool for discovering config templates and setting up builds
Date: Thu, 10 Nov 2022 10:24:33 +0100
Message-Id: <20221110092433.2874130-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 09:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173072

This is the last (I believe) piece of the puzzle in setting up builds from nothing
without having to write custom scripts or use external tools.

After layers have been fetched and placed into their respective locations, one would
surely want to proceed to the actual build, and here's how:

1. Without arguments or with 'list-config-templates', the tool simply walks the ../..
of its location (which is the parent dir of poky/oe-core), and prints what templates it
has found, as seen below. If the following is not enough information,
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
You had no conf/local.conf file. This configuration file has therefore been
created for you from /srv/work/alex/meta-alex/conf/templates/configuration-gizmo/local.conf.sample
You may wish to edit it to, for example, select a different MACHINE (target
hardware). See conf/local.conf for more information as common configuration
options are commented.

You had no conf/bblayers.conf file. This configuration file has therefore been
created for you from /srv/work/alex/meta-alex/conf/templates/configuration-gizmo/bblayers.conf.sample
To add additional metadata layers into your configuration please add entries
to conf/bblayers.conf.

The Yocto Project has extensive documentation about OE including a reference
manual which can be found at:
    https://docs.yoctoproject.org

For more information about OpenEmbedded see the website:
    https://www.openembedded.org/

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
usage: oe-setup-build list-config-templates [-h] [--topdir TOPDIR] [-v]

optional arguments:
  -h, --help       show this help message and exit
  --topdir TOPDIR  Where to look for available build configuration templates (default is /srv/work/alex).
  -v               Print a description for each available build configuration template.

$ oe-setup-build setup-build-env -h
usage: oe-setup-build setup-build-env [-h] -c template_path [-b build_path] [--no-shell]

optional arguments:
  -h, --help        show this help message and exit
  -c template_path  Use a build configuration template in template_path to set up a build environment (run this script with 'list-config-templates' to see what is available)
  -b build_path     Set up a build directory in build_path (run this script with 'list-config-templates' to see where it would be by default)
  --no-shell        Create a build directory but do not start a shell session with the build environment from it.

4. There's also a selftest that runs a basic check for template discovery and build setup,
and an added hint in oe-setup-layers about how to proceed (as it is really not user-friendly
to fetch the layer repos successfully and then exit without a word).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 12 ++++
 scripts/oe-setup-build                   | 79 ++++++++++++++++++++++++
 scripts/oe-setup-layers                  |  7 +++
 3 files changed, 98 insertions(+)
 create mode 100755 scripts/oe-setup-build

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index b048948386..328af91532 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -124,6 +124,18 @@ class BitbakeLayers(OESelftestTestCase):
             fullpath = os.path.join(layerpath, "conf", "templates", "buildconf-1", f)
             self.assertTrue(os.path.exists(fullpath), "Template configuration file {} not found".format(fullpath))
 
+        cmd = 'oe-setup-build list-config-templates --topdir {}'.format(layerpath)
+        result = runCmd(cmd)
+        cond = "scripts/oe-setup-build setup-build-env -c " in result.output and "test-bitbakelayer-layercreate/conf/templates/buildconf-1" in result.output
+        self.assertTrue(cond, "Incorrect output from {}: {}".format(cmd, result.output))
+
+        # rather than hardcode the build setup cmdline here, let's actually run what the tool suggests to the user
+        cmd = None
+        for l in result.output.splitlines():
+            if "scripts/oe-setup-build setup-build-env -c " in l:
+                cmd = l + " --no-shell"
+        result = runCmd(cmd)
+
     def get_recipe_basename(self, recipe):
         recipe_file = ""
         result = runCmd("bitbake-layers show-recipes -f %s" % recipe)
diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
new file mode 100755
index 0000000000..7c125425ec
--- /dev/null
+++ b/scripts/oe-setup-build
@@ -0,0 +1,79 @@
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
+def defaulttop():
+    return os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
+
+def makebuildpath(topdir, templatelocation, template):
+    return os.path.join(topdir, "build-{}-{}".format(os.path.basename(os.path.abspath(os.path.join(templatelocation,'..','..'))), template))
+
+def print_templates(args):
+    topdir = args.topdir
+    verbose = args.v
+    print("Available build configuration templates (re-run with -v to see their descriptions):\n")
+    for (dir, dirs, files) in os.walk(topdir):
+        if dir.endswith('conf/templates'):
+            for d in dirs:
+                print("{} setup-build-env -c {}\nwill create a build configuration in {}\n".format(__file__, os.path.join(dir, d), makebuildpath(args.topdir, dir, d)))
+                if verbose:
+                    if os.path.join(dir, d).endswith('meta-poky/conf/templates/default'):
+                        print("Description: this is the reference configuration of the poky reference distribution (choose this if you are uncertain).")
+                    elif os.path.join(dir, d).endswith('meta/conf/templates/default'):
+                        print("Description: this is the reference configuration of the openembedded-core layer (choose this if you are uncertain).")
+                    else:
+                        print("Description:", open(os.path.join(dir, d, 'conf-notes.txt')).read())
+                    print("---")
+
+        # Do not recurse into build directories; they can be enormous
+        if 'conf' in dirs and 'bblayers.conf' in os.listdir(os.path.join(dir, 'conf')):
+            dirs.clear()
+        # Do not recurse into sstate-cache or downloads similarly
+        if 'universal' in dirs and '00' in dirs:
+            dirs.clear()
+        if 'uninative' in dirs and 'git2' in dirs:
+            dirs.clear()
+
+def setup_build_env(args):
+    template = args.c
+    builddir = args.b
+    no_shell = args.no_shell
+    if not builddir:
+        builddir = makebuildpath(defaulttop(), os.path.dirname(template), os.path.basename(template))
+    coredir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
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
+parser_list_templates.add_argument("--topdir", default=defaulttop(), help='Where to look for available build configuration templates (default is {}).'.format(defaulttop()))
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
+    print_templates(Namespace(topdir=defaulttop(), v=False))
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6ecaffed75..7fe250c557 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -17,6 +17,7 @@ import os
 import subprocess
 
 def _do_checkout(args, json):
+    oesetupbuild = None
     layers = json['sources']
     for l_name in layers:
         l_data = layers[l_name]
@@ -53,6 +54,12 @@ def _do_checkout(args, json):
         print("Running '{}' in {}".format(cmd, layerdir))
         subprocess.check_output(cmd, shell=True, cwd=layerdir)
 
+        if os.path.exists(os.path.join(layerdir, 'scripts/oe-setup-build')):
+            oesetupbuild = os.path.join(layerdir, 'scripts/oe-setup-build')
+
+    if oesetupbuild:
+        print("\nRun '{} list-config-templates' to list available build configuration templates and set up a build from one of them.".format(oesetupbuild))
+
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
 
 parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
-- 
2.30.2


