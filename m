Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF9EC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:11:04 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.8441.1659103863093712892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BUEOW2co;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id rq15so2746455ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Je+jwr6vCvljNDFaZne0LW229Np6Sy8Lj/nZt9Dq0I4=;
        b=BUEOW2coXK3UIoqlEbBFNeRYkVr2lowNaPhSFBOzn6Her0JhQ2AWE7wek/NVGftcmg
         GMsiZ/Au2RL4K8V8HWa/VfJo1UgjZMv0ta9WoGJgjNj3gfwA/nmTHy6LJ1P35hlLR7wv
         Ygs+vsi+/+pRvuuU/2h8sEewzX5eRzBmNFTnkvQPDbdOH/qpBFnylST6hHSdNhphVNLu
         OEMs4/zufptYBe9Dh5DX7Yl/rKAFZJoos/bN49Nwpo2NlG/vzJxqKAEhD2ZLZ7ObU+zM
         HzTBY2iCLvqd3lHtoR4tkKkheWACHcuwX04hYIaRV3bPuMFun2+qkg6oGszC+Hsv0Tga
         ySHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Je+jwr6vCvljNDFaZne0LW229Np6Sy8Lj/nZt9Dq0I4=;
        b=whxSLyhzHcDat9XRKhXAdlvoxY2aAJujG5YxL8LXVo4LdegkNIZqSIb9zokJs50dHV
         bxp9Scr2TrcRhw55XVr4j3f36NHxaeO+cuv+ZMq5P8zR9049OgUMjcLfjOGxYL5y/nTe
         HMTKP5OsvaWTQvX2l1IMVSGuEGJU55bTSwv1rxK0sTV0f+uKLAx+8nWlqicZQRE7JsqT
         kDEjJBL7GsvP0MSqIKEzermyifZ95eo5PI9PeiEBq6Zk2zKquNXWcepAEZK57KRcS1bO
         0/ixXgDUQ3OQtmmxNLLVWtGnRD8xmxrpDdK/cSifcQwAsxBz19Qw7dbuD7l5C4iuvpZP
         gdrA==
X-Gm-Message-State: AJIora+HLurYWbiSMDXz0PXyJK/eSiacJ71vSplor9/BBtdq84meZMWJ
	iv1zknTF9DIJDinizl/Tv9WGD5CQL6I=
X-Google-Smtp-Source: 
 AGRyM1v4puYUYNiPB13nOnng9ba9EeZouZzbFRgyOZmWz2qHl4aCEm1JxH/M4sE1N+e5AA81+mNhhA==
X-Received: by 2002:a17:906:730c:b0:72b:4f83:51c1 with SMTP id
 di12-20020a170906730c00b0072b4f8351c1mr3044945ejc.515.1659103861276;
        Fri, 29 Jul 2022 07:11:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fm15-20020a1709072acf00b0072b14836087sm1744227ejc.103.2022.07.29.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:11:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] scripts/oe-setup-layers: add a script that restores the
 layer configuration from a json file
Date: Fri, 29 Jul 2022 16:10:48 +0200
Message-Id: <20220729141049.835733-5-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/168632

This script can be used directly from poky, or can be copied directly into a
layer or any other repository - it is self-suffucient and requires only python3
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

Available build configurations:
/srv/work/alex/my-build/meta-alex/conf/templates/configuration-gadget
/srv/work/alex/my-build/meta-alex/conf/templates/configuration-gizmo
/srv/work/alex/my-build/poky/meta-poky/conf

You can set up a build with:
TEMPLATECONF=one/of/the/above . /srv/work/alex/my-build/poky/oe-init-build-env

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
 scripts/oe-setup-layers | 85 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100755 scripts/oe-setup-layers

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
new file mode 100755
index 0000000000..017c400ad6
--- /dev/null
+++ b/scripts/oe-setup-layers
@@ -0,0 +1,85 @@
+#!/usr/bin/env python3
+#
+# This file was copied from poky(or oe-core)/scripts/oe-setup-layers by running
+#
+# bitbake-layers create-layers-setup destdir
+#
+# It is recommended that you do not modify this file directly, but rather re-run the above command to get the freshest upstream copy.
+#
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
+        subprocess.check_output(cmd, text=True, shell=True)
+
+        for remote in remotes:
+            cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
+            print("Running '{}' in {}".format(cmd, layerdir))
+            subprocess.check_output(cmd, text=True, shell=True, cwd=layerdir)
+
+            cmd = "git fetch -q {} || true".format(remote)
+            print("Running '{}' in {}".format(cmd, layerdir))
+            subprocess.check_output(cmd, text=True, shell=True, cwd=layerdir)
+
+        cmd = 'git checkout -q {}'.format(rev)
+        print("Running '{}' in {}".format(cmd, layerdir))
+        subprocess.check_output(cmd, text=True, shell=True, cwd=layerdir)
+
+
+    print("\nAvailable build configurations:\n{}\n".format("\n".join(buildconfs)))
+    print("You can set up a build with:\nTEMPLATECONF=one/of/the/above . {}/oe-init-build-env".format(oecorepath))
+
+
+parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
+
+parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
+        help='Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).')
+
+try:
+    defaultdest = os.path.dirname(subprocess.check_output('git rev-parse --show-toplevel', text=True, shell=True, cwd=os.path.dirname(__file__)))
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
+_do_checkout(vars(args), json)
-- 
2.30.2


