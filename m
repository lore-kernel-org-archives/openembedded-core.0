Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8808FC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:57:52 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.6449.1659448664206996402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KFAgjE6U;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id j8so851052ejx.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59xiqpgRqVgv3tMsJy+XfRldpup4en7R50wAAmxyie8=;
        b=KFAgjE6UjtPMb8yVtZQlEyt5YkJ0oz/oGRuDmUfHaCiWI/Y/0jIijbYc/ueYfK1ztW
         gVoE4PsNcQeJKGfNPeI/njXLCyyLm3VfkQ25nbN6X/WR2DxuX83DZgqzKLhVtyxiMSUr
         7WGf7TK3+0ZQ6u227Xbnq8ZxNnrbtdKc3pM0PGsbQ1Ocggf4e2atKbdlIhAnLQkyYE4S
         cLLraqYen9jTJx6CNPwGw7YhtZnNeCQsbBkfOBMoFWUJzDpqVPt5Cb6VgMzhLk8XXMkK
         RVuTEsaNVEk9NarRksKpJ2w7m5YhnVReCi5ORn/DXqwvrW7JT4Z76Nnzhg7y1AhzMoXw
         Bcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59xiqpgRqVgv3tMsJy+XfRldpup4en7R50wAAmxyie8=;
        b=a2/8Wh4mivKwCX8ON/50IXiJQpfgk3nf6VoBluOTLONNmC8zIxtSnsK5oVBnBS8JBA
         4tlfndFUDLreHTqxVPWTHusf/rA7q8dhaqNkXpRskwg9nTgDYPtieBLl6bGybzbIxS+I
         lAlSIwSGzataIgg3anJQ6Hxz5p7VHFIjlc+NPGDG7aQps+stLtWMA/trVfkq/d09vVkq
         8/BrntZHqDFhl22vNtHoGmiVA6iQU67x0W3hfm/j5JASEONmQlU5xS5Jf7jk/N0g14wl
         WM07/RF+utl0v51l4ZpbLbfh3H/JTqcHQEvTTTpHkdVViKAa5zsghcQ23suzi4Q2UnKw
         gvyg==
X-Gm-Message-State: ACgBeo2yZCXeZfvKHIYfE02/BB5eVbK78ZNzNq3alFducoK1pLiw/nTh
	5Rem1BKNMZUkgHQcU2hkjmejHaVNMIk=
X-Google-Smtp-Source: 
 AA6agR6+VE2Y+TN7e47EsBswyqwFjbNeOebznVYBwM1qt3lsWmopEueR1wk6NabzBHgkKNYkdCGd9w==
X-Received: by 2002:a17:907:3d90:b0:730:9300:68aa with SMTP id
 he16-20020a1709073d9000b00730930068aamr6399529ejc.655.1659448662676;
        Tue, 02 Aug 2022 06:57:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b00722e50dab2csm6233731ejc.109.2022.08.02.06.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 06:57:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] scripts/oe-setup-layers: add a script that restores the
 layer configuration from a json file
Date: Tue,  2 Aug 2022 15:57:13 +0200
Message-Id: <20220802135714.2785052-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802135714.2785052-1-alex@linutronix.de>
References: <20220802135714.2785052-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 13:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168784

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
index 0000000000..39cc16a30d
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
+_do_checkout(vars(args), json)
-- 
2.30.2


