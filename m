Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B08C54EE9
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:14:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.23995.1661944456950656563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C7apodfZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 i188-20020a1c3bc5000000b003a7b6ae4eb2so6526870wma.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5InC7AJyE5N/2stlUrTiDCUrOP/UQAc5XX5BDLbVdoE=;
        b=C7apodfZ/I3+/h6+nqCwtWlK3DZHNGgufno97muw9oDASHAHmTu87RPDsPBt9MqJ0x
         QfcHLN47R5Tj4kS4PbGUAcr3Tbkr5x+x+w0BrMsxYrXMsGhpgh605e3w4p+VJrfR1HIU
         QJdmvaMHS5gCf63jQx3cXBFaERk4FXqWga33DbVICaQ1zSvmHo9lcR6oypX1xp53f/LL
         DCo8kDNNjGJG1GZEn6VCHHtyeWGlJw0aG8+yqsBo90XZDC6HDXGfv2XwrJ4yzXLnNb0w
         fsF/SaWU20+E02uDYG/745JFykS+7Q7n99dLbgCZFriYYLcLHa8/iGlgx35oU62VCmIe
         q82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5InC7AJyE5N/2stlUrTiDCUrOP/UQAc5XX5BDLbVdoE=;
        b=0ugQ+BJ9ZHTYXd/qwWmYNvuFWRuZ9frapNrF20ilOPLDl6VgZOC3ERSr8zeK87VSVO
         2U064+ES9Z8JY6Y6eFr+dmhtSpCAGuE6yOnbMN8hNo5HQcvE+b8VoSU9i9KF8HC6o5CR
         JzivDShZZxezS67CbjIOEHgbi0C6xs1KyTkUIlIsrBflV61BX2k9F32ot3L0ugYhKaFR
         8Csz3rghT+DC+a7x4X8A60VxbEeFBWJ7w55FmD4UD0p/+jw2VGS+Bcihfuz1gVunoUY5
         xVBtWKIwzo0h4Cog/p49q7NmDwMM32FWA7vE9V8WyCoZ6ZyWUL/KzHjl9hORvaA//ITP
         6Ocw==
X-Gm-Message-State: ACgBeo2Kn6lsIeZPW+fIbeOC947w4QxJi85V+TCLMi2H0YVKZKqpKBwk
	y7Zek48/qL/uowER3YQagc/9Tf7glyk=
X-Google-Smtp-Source: 
 AA6agR4KQo0W2ovbUpYFnuAg0UpFCoW776xsYIld1yu7KOmKr4hgqLm5wsHhC2gkGOYweTnUHHeycw==
X-Received: by 2002:a7b:ce89:0:b0:3a5:cefe:80f6 with SMTP id
 q9-20020a7bce89000000b003a5cefe80f6mr1761328wmj.113.1661944455379;
        Wed, 31 Aug 2022 04:14:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003a60edc3a44sm2324753wmb.5.2022.08.31.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 04:14:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] scripts/oe-setup-layers: add a script that restores the
 layer configuration from a json file
Date: Wed, 31 Aug 2022 13:13:59 +0200
Message-Id: <20220831111401.3330342-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220831111401.3330342-1-alex@linutronix.de>
References: <20220831111401.3330342-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 11:14:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170105

This script can be used directly from poky or oe-core, or can be copied directly
into alayer or any other repository - it is self-suffucient and requires only python3
and git on the host where it will run. It is also copied by the bitbake-layers
layers-setup plugin together with the json, unless requested otherwise.

1. How to restore the layers from the saved configuration:

a) Clone the bootstrap layer or some other repository to obtain the json config and the setup script that can use it.
(use 'bitbake-layers create-layer-setup' from the previous commit to create them)

b) Running with default options:
(note: this will work to update an existing checkout as well)

alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.

Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
Running 'git init -q /srv/work/alex/my-build/meta-intel'
Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel

Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
Running 'git init -q /srv/work/alex/my-build/poky'
Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky

2. Command line options:

alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers -h
usage: setup-layers [-h] [--force-bootstraplayer-checkout] [--destdir DESTDIR] [--jsondata JSONDATA]

A self contained python script that fetches all the needed layers and sets them to correct revisions

optional arguments:
  -h, --help            show this help message and exit
  --force-bootstraplayer-checkout
                        Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).
  --destdir DESTDIR     Where to check out the layers (default is /srv/work/alex/my-build).
  --jsondata JSONDATA   File containing the layer data in json format (default is /srv/work/alex/my-build/meta-alex/setup-layers.json).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-layers | 88 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 scripts/oe-setup-layers

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
new file mode 100755
index 0000000000..cbd2efb5c7
--- /dev/null
+++ b/scripts/oe-setup-layers
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This file was copied from poky(or oe-core)/scripts/oe-setup-layers by running
+#
+# bitbake-layers create-layers-setup destdir
+#
+# It is recommended that you do not modify this file directly, but rather re-run the above command to get the freshest upstream copy.
+
+import argparse
+import json
+import os
+import subprocess
+
+def _do_checkout(args, json):
+    layers = json['sources']
+    buildconfs = []
+    oecorepath = ""
+    for l_name in layers:
+        l_data = layers[l_name]
+        layerdir = os.path.abspath(os.path.join(args['destdir'], l_data['path']))
+
+        for ll_name in l_data['layers']:
+            if ll_name == 'meta':
+                oecorepath = layerdir
+            ll_data = l_data['layers'][ll_name]
+            if 'buildconfigs' in ll_data:
+                for c in ll_data['buildconfigs']:
+                    buildconfs.append(os.path.join(layerdir, ll_data['subpath'], c))
+
+        if 'contains_this_file' in l_data.keys():
+            force_arg = 'force_bootstraplayer_checkout'
+            if not args[force_arg]:
+                print('Note: not checking out source {layer}, use {layerflag} to override.'.format(layer=l_name, layerflag='--force-bootstraplayer-checkout'))
+                continue
+        l_remote = l_data['git-remote']
+        rev = l_remote['rev']
+        desc = l_remote['describe']
+        if not desc:
+            desc = rev[:10]
+        branch = l_remote['branch']
+        remotes = l_remote['remotes']
+
+        print('\nSetting up source {}, revision {}, branch {}'.format(l_name, desc, branch))
+        cmd = 'git init -q {}'.format(layerdir)
+        print("Running '{}'".format(cmd))
+        subprocess.check_output(cmd, shell=True)
+
+        for remote in remotes:
+            cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
+            print("Running '{}' in {}".format(cmd, layerdir))
+            subprocess.check_output(cmd, shell=True, cwd=layerdir)
+
+            cmd = "git fetch -q {} || true".format(remote)
+            print("Running '{}' in {}".format(cmd, layerdir))
+            subprocess.check_output(cmd, shell=True, cwd=layerdir)
+
+        cmd = 'git checkout -q {}'.format(rev)
+        print("Running '{}' in {}".format(cmd, layerdir))
+        subprocess.check_output(cmd, shell=True, cwd=layerdir)
+
+parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
+
+parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
+        help='Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).')
+
+try:
+    defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', universal_newlines=True, shell=True, cwd=os.path.dirname(__file__)))
+except subprocess.CalledProcessError as e:
+    defaultdest = os.path.abspath(".")
+
+parser.add_argument('--destdir', default=defaultdest, help='Where to check out the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
+parser.add_argument('--jsondata', default=__file__+".json", help='File containing the layer data in json format (default is {defaultjson}).'.format(defaultjson=__file__+".json"))
+
+args = parser.parse_args()
+
+with open(args.jsondata) as f:
+    json = json.load(f)
+
+supported_versions = ["1.0"]
+if json["version"] not in supported_versions:
+    raise Exception("File {} has version {}, which is not in supported versions: {}".format(args.jsondata, json["version"], supported_versions))
+
+_do_checkout(vars(args), json)
-- 
2.30.2


