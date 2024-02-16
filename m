Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2596AC48BF3
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:52:40 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.16965.1708084357486768509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3nXU7Mf;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a34c5ca2537so237447966b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084356; x=1708689156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AAIpx4ZoXH5Wv9l0P4w+VN7HprSyavphaNRwcZuoAU=;
        b=X3nXU7MfvqeS5kPIfXgbrDZ/8gf2/dzw1zN/cvO9s9fHnxB0Zo9GjsYY3+363Hbw7W
         dyaJNh+/e3nd2cQ9MGlTlKeNhs7upz7wTuvPZ5jE/uF1LKHCEZ6etASHP0aXTzZ4mYpf
         dlYvEataw5QDasXKEO7QntNGJm9dDqdExywF1PBIpKRjFCaeMOxpDtclWa36CjMKRwy1
         xOy7KJDVi3MF7J0yX8RsaV6KIYTrFNQ72PUpPIynUS3Cm9UsnalbnUS++CMo58a/LOxV
         nFcke7QM6+Uymqe6xl7LTa8LieQeAlxv1lbDpEWiLW+2qk2iq0J/9Iodg3YCyG+/fmwr
         JkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084356; x=1708689156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AAIpx4ZoXH5Wv9l0P4w+VN7HprSyavphaNRwcZuoAU=;
        b=LLleLI//kk0HbbNU9y4MLV4xOzdfGBFLbWudksKKa5uIcn604f537b1P977B9Nn3ZV
         JdjNKDKh4hn25bTg8l6Q7xQD9/oK7LIXZ8Hjp33x4PfOzCqRNVIDEJBeK/WOIc82+5Kq
         l2Su5//KFAPCmhgq2VtMJysAmrFTE9tRkL5y8gaCuMSedTyQn8ybkKEa/S1ucRRe2M7b
         nREhrocHHvGP2FQqHu54fK4KUU+zT3+kkX6uDlErIhNVXhCNArkOAbrj5/tTJqh32rS0
         scBdgiCeLyILbtthAefDJBNeY3af9CdTOPLxIYBkdSauADZ9rARq80f+5nZoWR+90rLS
         3Y3Q==
X-Gm-Message-State: AOJu0Yzg0USNKCjE8zLghPWAKYbNI0u+UfBFs8CD+/5sZd1Uq1Ejq0uT
	TSefSgYprBeJm6garkPT0Jw9v+PxtMwf1r7Knwf3yUCLwG9MG3bm2v9Dg3U7
X-Google-Smtp-Source: AGHT+IFFirk9bnu7pNorQxM+n6HtnmG0Mh6uHNfkq80AtwPdTR2nX+842P0IMMi79eBTgamauMNEuQ==
X-Received: by 2002:a17:906:b09:b0:a3d:f701:16c0 with SMTP id u9-20020a1709060b0900b00a3df70116c0mr333719ejg.52.1708084355788;
        Fri, 16 Feb 2024 03:52:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906d11000b00a3dbd16d1b0sm845788ejz.54.2024.02.16.03.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:52:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] oe-setup-build: add a tool for discovering config templates and setting up builds
Date: Fri, 16 Feb 2024 12:52:22 +0100
Message-Id: <20240216115222.3545462-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216115222.3545462-1-alex@linutronix.de>
References: <20240216115222.3545462-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195762

This is another piece of the puzzle in setting up builds from nothing
without having to write custom scripts or use external tools.

After layers have been fetched and placed into their respective locations by
oe-setup-layers, one would surely want to proceed to the actual build, and here's how:

1. Without arguments the tool reads available layers
from .oe-layers.json file (written out by oe-setup-layers or a fallback under scripts/),
prints what templates it has found, and asks the user to select one, as seen below.
This will land the user in a shell ready to run bitbake:

=============================================
alex@Zen2:/srv/work/alex$ ./setup-build
Available build configurations:

1. alex-configuration-gadget
This configuration will set up a build for the purposes of supporting gadget.

2. alex-configuration-gizmo
This configuration allows building a gizmo.

3. poky-default
This is the default build configuration for the Poky reference distribution.

Re-run with 'list -v' to see additional information.
Please choose a configuration by its number: 1
Running: TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/configuration-gadget . /srv/work/alex/poky/oe-init-build-env /srv/work/alex/build-alex-configuration-gadget && /bin/bash
You had no conf/local.conf file. This configuration file has therefore been
created for you from /srv/work/alex/meta-alex/conf/templates/configuration-gadget/local.conf.sample
You may wish to edit it to, for example, select a different MACHINE (target
hardware).

You had no conf/bblayers.conf file. This configuration file has therefore been
created for you from /srv/work/alex/meta-alex/conf/templates/configuration-gadget/bblayers.conf.sample
To add additional metadata layers into your configuration please add entries
to conf/bblayers.conf.

The Yocto Project has extensive documentation about OE including a reference
manual which can be found at:
    https://docs.yoctoproject.org

For more information about OpenEmbedded see the website:
    https://www.openembedded.org/

This configuration will set up a build for the purposes of supporting gadget.
Please refer to meta-alex/README for additional details and available bitbake targets.
==============================================

2. It is also possible to list available configurations without selecting one using
'setup-build list' or to select and setup one non-interactively with 'setup-build setup'.

3. The full set of command line options is:

$ ./setup-build --help
usage: setup-build [-h] [--layerlist LAYERLIST] {list,setup} ...

A script that discovers available build configurations and sets up a build environment based on one of them. Run without arguments to choose one interactively.

positional arguments:
  {list,setup}
    list                List available configurations
    setup               Set up a build environment and open a shell session with it, ready to run builds.

optional arguments:
  -h, --help            show this help message and exit
  --layerlist LAYERLIST
                        Where to look for available layers (as written out by setup-layers script) (default is /srv/work/alex/.oe-layers.json).

$ ./setup-build list --help
usage: setup-build list [-h] [-v]

optional arguments:
  -h, --help  show this help message and exit
  -v          Print detailed information and usage notes for each available build configuration.

$ ./setup-build setup --help
usage: setup-build setup [-h] [-c configuration_name] [-b build_path] [--no-shell]

optional arguments:
  -h, --help            show this help message and exit
  -c configuration_name
                        Use a build configuration configuration_name to set up a build environment (run this script with 'list' to see what is available)
  -b build_path         Set up a build directory in build_path (run this script with 'list -v' to see where it would be by default)
  --no-shell            Create a build directory but do not start a shell session with the build environment from it.

4. There's an an added hint in oe-setup-layers about how to proceed (as it is really not user-friendly
to fetch the layer repos successfully and then exit without a word), and a symlink to the script
from the top level layer checkout directory.

5. The selftest to check layer setup has been adjusted to run a basic check for template
discovery and build setup. The revision of poky to be cloned has been bumped to 4.1,
as that's the first version with a default template in a standard location.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py |  26 ++++-
 scripts/.oe-layers.json                  |   7 ++
 scripts/oe-setup-build                   | 122 +++++++++++++++++++++++
 scripts/oe-setup-layers                  |  10 ++
 4 files changed, 163 insertions(+), 2 deletions(-)
 create mode 100644 scripts/.oe-layers.json
 create mode 100755 scripts/oe-setup-build

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index f2460cb451b..e2009496adb 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -152,12 +152,12 @@ class BitbakeLayers(OESelftestTestCase):
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
 
@@ -165,3 +165,25 @@ class BitbakeLayers(OESelftestTestCase):
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
+        cmd = '{} --layerlist {} list -v'.format(oe_setup_build_l, layers_json)
+        result = runCmd(cmd)
+        cond = "conf/templates/default" in result.output
+        self.assertTrue(cond, "Incorrect output from {}: {}".format(cmd, result.output))
+
+        # rather than hardcode the build setup cmdline here, let's actually run what the tool suggests to the user
+        conf = None
+        if 'poky-default' in result.output:
+            conf = 'poky-default'
+        elif 'meta-default' in result.output:
+            conf = 'meta-default'
+        self.assertIsNotNone(conf, "Could not find the configuration to set up a build in the output: {}".format(result.output))
+
+        cmd = '{} --layerlist {} setup -c {} --no-shell'.format(oe_setup_build_l, layers_json, conf)
+        result = runCmd(cmd)
diff --git a/scripts/.oe-layers.json b/scripts/.oe-layers.json
new file mode 100644
index 00000000000..1b00a84b542
--- /dev/null
+++ b/scripts/.oe-layers.json
@@ -0,0 +1,7 @@
+{
+    "layers": [
+        "../meta-poky",
+        "../meta"
+    ],
+    "version": "1.0"
+}
diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
new file mode 100755
index 00000000000..5364f2b4812
--- /dev/null
+++ b/scripts/oe-setup-build
@@ -0,0 +1,122 @@
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
+def makebuildpath(topdir, template):
+    return os.path.join(topdir, "build-{}".format(template))
+
+def discover_templates(layers_file):
+    if not os.path.exists(layers_file):
+        print("List of layers {} does not exist; were the layers set up using the setup-layers script?".format(layers_file))
+        return None
+
+    templates = []
+    layers_list = json.load(open(layers_file))["layers"]
+    for layer in layers_list:
+        template_dir = os.path.join(os.path.dirname(layers_file), layer, 'conf','templates')
+        if os.path.exists(template_dir):
+            for d in sorted(os.listdir(template_dir)):
+                templatepath = os.path.join(template_dir,d)
+                if not os.path.isfile(os.path.join(templatepath,'local.conf.sample')):
+                    continue
+                layer_base = os.path.basename(layer)
+                templatename = "{}-{}".format(layer_base[5:] if layer_base.startswith("meta-") else layer_base, d)
+                buildpath = makebuildpath(os.getcwd(), templatename)
+                notespath = os.path.join(template_dir, d, 'conf-notes.txt')
+                try: notes = open(notespath).read()
+                except: notes = None
+                try: summary = open(os.path.join(template_dir, d, 'conf-summary.txt')).read()
+                except: summary = None
+                templates.append({"templatename":templatename,"templatepath":templatepath,"buildpath":buildpath,"notespath":notespath,"notes":notes,"summary":summary})
+
+    return templates
+
+def print_templates(templates, verbose):
+    print("Available build configurations:\n")
+
+    for i in range(len(templates)):
+        t = templates[i]
+        print("{}. {}".format(i+1, t["templatename"]))
+        print("{}".format(t["summary"].strip() if t["summary"] else "This configuration does not have a summary."))
+        if verbose:
+            print("Configuration template path:", t["templatepath"])
+            print("Build path:", t["buildpath"])
+            print("Usage notes:", t["notespath"] if t["notes"] else "This configuration does not have usage notes.")
+        print("")
+    if not verbose:
+        print("Re-run with 'list -v' to see additional information.")
+
+def list_templates(args):
+    templates = discover_templates(args.layerlist)
+    if not templates:
+        return
+
+    verbose = args.v
+    print_templates(templates, verbose)
+
+def find_template(template_name, templates):
+    print_templates(templates, False)
+    if not template_name:
+        n_s = input("Please choose a configuration by its number: ")
+        try: return templates[int(n_s) - 1]
+        except:
+            print("Invalid selection, please try again.")
+            return None
+    else:
+        for t in templates:
+            if t["templatename"] == template_name:
+                return t
+        print("Configuration {} is not one of {}, please try again.".format(tempalte_name, [t["templatename"] for t in templates]))
+        return None
+
+def setup_build_env(args):
+    templates = discover_templates(args.layerlist)
+    if not templates:
+        return
+
+    template = find_template(args.c, templates)
+    if not template:
+        return
+    builddir = args.b if args.b else template["buildpath"]
+    no_shell = args.no_shell
+    coredir = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
+    cmd = "TEMPLATECONF={} . {} {}".format(template["templatepath"], os.path.join(coredir, 'oe-init-build-env'), builddir)
+    if not no_shell:
+        cmd = cmd + " && {}".format(os.environ['SHELL'])
+    print("Running:", cmd)
+    subprocess.run(cmd, shell=True, executable=os.environ['SHELL'])
+
+parser = argparse.ArgumentParser(description="A script that discovers available build configurations and sets up a build environment based on one of them. Run without arguments to choose one interactively.")
+parser.add_argument("--layerlist", default=defaultlayers(), help='Where to look for available layers (as written out by setup-layers script) (default is {}).'.format(defaultlayers()))
+
+subparsers = parser.add_subparsers()
+parser_list_templates = subparsers.add_parser('list', help='List available configurations')
+parser_list_templates.add_argument('-v', action='store_true',
+        help='Print detailed information and usage notes for each available build configuration.')
+parser_list_templates.set_defaults(func=list_templates)
+
+parser_setup_env = subparsers.add_parser('setup', help='Set up a build environment and open a shell session with it, ready to run builds.')
+parser_setup_env.add_argument('-c', metavar='configuration_name', help="Use a build configuration configuration_name to set up a build environment (run this script with 'list' to see what is available)")
+parser_setup_env.add_argument('-b', metavar='build_path', help="Set up a build directory in build_path (run this script with 'list -v' to see where it would be by default)")
+parser_setup_env.add_argument('--no-shell', action='store_true',
+        help='Create a build directory but do not start a shell session with the build environment from it.')
+parser_setup_env.set_defaults(func=setup_build_env)
+
+args = parser.parse_args()
+
+if 'func' in args:
+    args.func(args)
+else:
+    from argparse import Namespace
+    setup_build_env(Namespace(layerlist=args.layerlist, c=None, b=None, no_shell=False))
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index bee4ef0fec8..6fbfefd656f 100755
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
2.39.2


