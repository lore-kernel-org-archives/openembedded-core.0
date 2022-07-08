Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D88C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 19:17:50 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.3240.1657307864415063056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RQfu7tFz;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id u12so39186757eja.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CbsJaZVUhPVgC2f93ekdnunuF6zDeajZZDkrpuwxtKk=;
        b=RQfu7tFzDpDBsqkLQ2f36b0SDF3ZPj6EE+g72yQVipB8/OsD7jm5QO8RLh99P+7NTI
         8dVe3q69RVC0WpWItz2GsejKw2+40xv2n2rtCx9QElLRP90qodb/hK77W4hGWOBUea+e
         HJPDqkQnDowAc7LeleTSj0vivQNap4R4cfp0tlYGBxG3WxWkJiaynCpa+h9IqfUwiJvX
         rGs2SZSWILMJjqOALHsTUfjwOQrDa2fgLeyJPUyeL9mlTH7BEmUB0G+XN5RrXEqeDuwW
         CjAPSuUeFGU/q5B9HQg5PgVv78rFfw/aHLTV34YRPJSG0tq+Y0O4SrPx3Ox+NJ455Kjw
         X1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CbsJaZVUhPVgC2f93ekdnunuF6zDeajZZDkrpuwxtKk=;
        b=OJiuBmwVQTR9egdCDGjc8DnisPrSGE7BAExFqC9yoBgcx6Pv/WNYlh6IwJUD16hw1E
         sfihIKIqUA6rxSA+3jfqk/geafdFHEbk/d3oaWlINHbBOv7ghX12RYkyrot/PjMvdNxr
         g0yejNERqNzLFDXxGODddue9+6JeDWS4XctNxd82XtUEqflxmGoJ4y5jCxDF0EWG67aU
         1ElVNdUkjHHMMsnjpcjFziVRdCa1UUSBZ8LPm4KHiS/60+pmNNT/3qqV9dkYrVoraCz1
         HpjlAC6pqV39m5pFYCStEEjBYZsXyQLSkZs8Xj5QIwDWQ4R9opcGzOvETgKuoMEBUtlu
         MliA==
X-Gm-Message-State: AJIora/ZoHxgjm/df5MG8R7j5foENYHVPIHn1hGQI00jGW5MJrEPeAC6
	6PPMLolVPCSTEclZBT5cj/pDXl+bM8NEyg==
X-Google-Smtp-Source: 
 AGRyM1ucBLEkEqtzQmnbFh3H1WqPrXPKnb5BAKBVY0LOpSIyQID/FQ7fjmqE0uCBOehpgrJ3hhoC4Q==
X-Received: by 2002:a17:906:8a41:b0:72b:20fe:80ea with SMTP id
 gx1-20020a1709068a4100b0072b20fe80eamr5067436ejc.316.1657307862599;
        Fri, 08 Jul 2022 12:17:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bl24-20020a170906c25800b00704757b1debsm20465705ejb.9.2022.07.08.12.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 12:17:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 3/3] scripts/oe-setup-layers: add a script that restores
 the layer configuration from a json file
Date: Fri,  8 Jul 2022 21:17:30 +0200
Message-Id: <20220708191730.3413011-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708191730.3413011-1-alex@linutronix.de>
References: <20220708191730.3413011-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 19:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167830

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

FIXME:
- oe-selftest that replicates steps in 1a and checks that the outcome is usable.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-layers | 85 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100755 scripts/oe-setup-layers

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
new file mode 100755
index 0000000000..c94829214a
--- /dev/null
+++ b/scripts/oe-setup-layers
@@ -0,0 +1,85 @@
+#!/usr/bin/env python3
+#
+# This file was copied from poky/scripts/oe-setup-layers by running
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
+parser = argparse.ArgumentParser(description='A self contained python script that fetches all the needed layers and sets them to correct revisions')
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


