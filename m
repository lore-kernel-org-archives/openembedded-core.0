Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26F2ECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 18:21:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.28049.1662402109986245560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 11:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KYuVOF36;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id j26so5666649wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=v989vql5gwGIH+lGkMqWI3VHe4mq2B3rvdwgZgFRTQY=;
        b=KYuVOF36uR25vR0+BeJy4I3CFUFEtAIPjVmyi5UGA29E/o07aiCPh8F4m4eZlcHr0b
         2dcKyfmKN/PBGVE9EZWqsBrtf4F6LxdeothudPpcBSAb1i3oVPzjje0iO8X03qwYygpo
         Do0XAO9ZiQDIF/JVbwZ3Q4Am0L3ANIZSp5ooDMeO1YTYlurwI5PY3IK/IoWBdMqInn4Z
         lbkLGAYXIaBmgc862YJfxFZI07ED0rYFHcMEOdrwHu5750BIly+xaX/x0PBD8C/QxZNp
         aAPK51aIglcZKKq8JnwlAIUFvJ9DiFgV04/feQaifxMT6ILUqz5dmpqaC634flBo9BxU
         vbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=v989vql5gwGIH+lGkMqWI3VHe4mq2B3rvdwgZgFRTQY=;
        b=GYs808WQn1yzpD8MivjfbfvsozBnuJn2wo8h8kj9q8dFpiGxWQGVKLhEalDFJBXlMC
         hJvik/jrmV9ydZEeZokxEwWM/XK4ndXq8mg37sZqq+CroV2KQzIKYF+UJYZQOb3Nf6O0
         QxmxEGCB1hAbHOquVv+Wwd4rkvk4B6l+NK4S8G26gxUydjtvJG1TGhjESFlc6O17m/sN
         BrozPQ2KScalJSqvU1TU1CzSWxlNk4zTNv+9Zxv20C1dP4RwDFx8ArL7GPmgKpTMWYbP
         ly002QpoXf42pgo+o/TPGCP98tEANcvM4SDfJ7bp7emM+2Had00BGnDmtGYKyNC61+Jc
         qAfA==
X-Gm-Message-State: ACgBeo2J5LaZsc+hFQdFxmYMDkYaaNSM39gEqF6pgqzlTYRXHvIpHVrG
	LQHVj7t9YxypPOy0v4GdBG7KRfUaAzVRrQ==
X-Google-Smtp-Source: 
 AA6agR4OfPKugCLaOLVyzN6bQEXz8ACpvfLdUB7xu8VMyk5uE8OqgOF/GUa300TmRVCTq8sA3y1S1g==
X-Received: by 2002:a05:600c:2315:b0:3a5:c2cc:1bee with SMTP id
 21-20020a05600c231500b003a5c2cc1beemr11112583wmo.55.1662402107748;
        Mon, 05 Sep 2022 11:21:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b0021ef34124ebsm9686031wrv.11.2022.09.05.11.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 11:21:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] oe-setup-build: add a tool for discovering config
 templates and setting up builds
Date: Mon,  5 Sep 2022 20:21:40 +0200
Message-Id: <20220905182141.1091053-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 18:21:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170322

This is the last (I believe) piece of the puzzle in setting up builds from nothing
without having to write custom scripts or use external tools.

After layers have been fetched and placed into their respective locations, one would
surely want to proceed to the actual build, and here's how:

1. Without arguments, the tool simply walks the ../.. of its location (which is the parent dir
of poky/oe-core), and prints what templates has found. If the following is not enough information,
adding '-v' will also print conf-notes.txt for each of the templates:

$ oe-setup-build
Available build configuration templates (re-run with -v to see their descriptions):

/srv/work/alex/poky/scripts/oe-setup-build -c /srv/work/alex/poky/meta-poky/conf/templates/default
will create a build in /srv/work/alex/build-meta-poky-default

/srv/work/alex/poky/scripts/oe-setup-build -c /srv/work/alex/meta-alex/conf/templates/configuration-gizmo
will create a build in /srv/work/alex/build-meta-alex-configuration-gizmo

/srv/work/alex/poky/scripts/oe-setup-build -c /srv/work/alex/meta-alex/conf/templates/configuration-gadget
will create a build in /srv/work/alex/build-meta-alex-configuration-gadget

2. Then the users picks one of the above and runs it. This will land them in a shell ready to run bitbake:

$ oe-setup-build -c /srv/work/alex/meta-alex/conf/templates/configuration-gizmo
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
usage: oe-setup-build [-h] [--topdir TOPDIR] [-v] [-c template_path] [-b build_path] [--no-shell]

A script that discovers available build configuration templates and sets up a build environment based on one of them

optional arguments:
  -h, --help        show this help message and exit
  --topdir TOPDIR   Where to look for available build configuration templates (default is /srv/work/alex).
  -v                Print a description for each available build configuration template.
  -c template_path  Use build configuration template in template_path to set up a build (run this script without arguments or with -v to see what is available)
  -b build_path     Set up a build in build_path (run this script without arguments or with -v to see where it would be by default)
  --no-shell        Create a build but do not start a shell session with it.

4. There's also a selftest that runs a basic check for template discovery and build setup,
and an added hint in oe-setup-layers about how to proceed (as it is really not user-friendly
to fetch the layer repos successfully and then exit without a word).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 12 +++++
 scripts/oe-setup-build                   | 68 ++++++++++++++++++++++++
 scripts/oe-setup-layers                  |  7 +++
 3 files changed, 87 insertions(+)
 create mode 100755 scripts/oe-setup-build

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index c6bd5a1f6a..1dd3046aa6 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -122,6 +122,18 @@ class BitbakeLayers(OESelftestTestCase):
             fullpath = os.path.join(layerpath, "conf", "templates", "buildconf-1", f)
             self.assertTrue(os.path.exists(fullpath), "Template configuration file {} not found".format(fullpath))
 
+        cmd = 'oe-setup-build --topdir {}'.format(layerpath)
+        result = runCmd(cmd)
+        cond = "scripts/oe-setup-build -c " in result.output and "test-bitbakelayer-layercreate/conf/templates/buildconf-1" in result.output
+        self.assertTrue(cond, "Incorrect output from {}: {}".format(cmd, result.output))
+
+        # rather than hardcode the build setup cmdline here, let's actually run what the tool suggests to the user
+        cmd = None
+        for l in result.output.splitlines():
+            if "scripts/oe-setup-build -c " in l:
+                cmd = l + " --no-shell"
+        result = runCmd(cmd)
+
     def get_recipe_basename(self, recipe):
         recipe_file = ""
         result = runCmd("bitbake-layers show-recipes -f %s" % recipe)
diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
new file mode 100755
index 0000000000..56bbd24b26
--- /dev/null
+++ b/scripts/oe-setup-build
@@ -0,0 +1,68 @@
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
+def makebuildpath(topdir, templatelocation, template):
+    return os.path.join(topdir, "build-{}-{}".format(os.path.basename(os.path.abspath(os.path.join(templatelocation,'..','..'))), template))
+
+def print_templates(topdir, verbose):
+    print("Available build configuration templates (re-run with -v to see their descriptions):\n")
+    for (dir, dirs, files) in os.walk(topdir):
+        if dir.endswith('conf/templates'):
+            for d in dirs:
+                print("{} -c {}\nwill create a build in {}\n".format(__file__, os.path.join(dir, d), makebuildpath(args.topdir, dir, d)))
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
+def setup_build(defaulttop, template, builddir, no_shell):
+    if not builddir:
+        builddir = makebuildpath(defaulttop, os.path.dirname(template), os.path.basename(template))
+    coredir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
+    cmd = "TEMPLATECONF={} . {} {}".format(template, os.path.join(coredir, 'oe-init-build-env'), builddir)
+    if not no_shell:
+        cmd = cmd + " && {}".format(os.environ['SHELL'])
+    print("Running:", cmd)
+    subprocess.run(cmd, shell=True, executable=os.environ['SHELL'])
+
+parser = argparse.ArgumentParser(description="A script that discovers available build configuration templates and sets up a build environment based on one of them")
+
+defaulttop = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
+parser.add_argument("--topdir", default=defaulttop, help='Where to look for available build configuration templates (default is {}).'.format(defaulttop))
+
+parser.add_argument('-v', action='store_true',
+        help='Print a description for each available build configuration template.')
+
+parser.add_argument('-c', metavar='template_path', help="Use build configuration template in template_path to set up a build (run this script without arguments or with -v to see what is available)")
+parser.add_argument('-b', metavar='build_path', help="Set up a build in build_path (run this script without arguments or with -v to see where it would be by default)")
+parser.add_argument('--no-shell', action='store_true',
+        help='Create a build but do not start a shell session with it.')
+
+args = parser.parse_args()
+
+if not args.c:
+    print_templates(args.topdir, args.v)
+else:
+    setup_build(defaulttop, args.c, args.b, args.no_shell)
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6ecaffed75..8336037630 100755
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
+        print("\nRun {} to list available build configuration templates and set up a build from one of them".format(oesetupbuild))
+
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
 
 parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
-- 
2.30.2


