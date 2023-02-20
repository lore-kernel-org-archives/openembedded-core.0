Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01CDC27C7C
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 19:08:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.22654.1676920104249833559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 11:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zhev8UJ+;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id j2-20020a05600c1c0200b003e1e754657aso1879859wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 11:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIyRVRznpbpYM5pYg2Ki4MTa0Th48OoHhSPzN2FJrl0=;
        b=Zhev8UJ+5OeG53f8Z8k668iTC+8QfOXJlDqBUtpXGkQEwuQn6mQ9eJqdzYW5JmYkZz
         2jXKWqUBGEM7Fgohbpjke7ag0G2fNY87Ez67ZVBNJyLBTr4RwNZ8vEU4UaWE8RisuIs1
         zyTcro/JEvDsZcr4YuzPeCzfRdO9y1CrngzhrW/5cSD9nX6++2OrnFCNw9+CJ2EAxlH1
         iFJUwojt4VaubOVXpfNcwGVKRQKUoGGyZ+MtLSoxF7atGGC+fu85X3M7AU1WgY98O4Qj
         ZRBT5zW7S7LU518eS3h5w+4bYKYJCfbwNxv8KCIGk0heCdwZIz48CpSHZo2GpZc1hlWW
         Xksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIyRVRznpbpYM5pYg2Ki4MTa0Th48OoHhSPzN2FJrl0=;
        b=vRpN4CPFewaGK43TL5HM7vBs31bDZt+Msq7K8Rwgn0ThZWMvu91stYUec+XAXDhvHc
         0bQNEfVJc7P9zUbgJ1oOQPAVGK67XH9la7A+hJ2wWjBFhuHLflxrzMb9qlacExEh1PO2
         sNQq2jJOgw1hQ3XCa/nkzHStCKXbr8lAtBAwRHx3cKwj4sY/JMOQ+dqWmNgfxEY3sAPa
         dxwpAgibTD8y9t/ZZvKzc/t9LjB5mSZQb09L044XejqG1PzgRHW441jqYm4MDioaxUqS
         PzP7CIQObgoTFX1fAPi8tGg5ylfEEonhsGRX0ZtespI+xYK+uju6la8P47OuemwFO8WN
         TDmA==
X-Gm-Message-State: AO0yUKWUsJtQUNnwFaUr0J07qf327jwp4iGGv6InABVmnSgcMN8GyiOB
	rvfHjPT9TH/iTgh2VVwObYK6ch+jB3o=
X-Google-Smtp-Source: AK7set8uj/CfMK/CXh8e6OBQIjBkflBkYj9caL8+c6bGKj4VyilmuQ6FlLSIlFFPKG5t2zgG/7fzSQ==
X-Received: by 2002:a05:600c:2b0f:b0:3d3:513c:240b with SMTP id y15-20020a05600c2b0f00b003d3513c240bmr1326162wme.7.1676920102695;
        Mon, 20 Feb 2023 11:08:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b002be0b1e556esm3189256wrq.59.2023.02.20.11.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:08:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/2] scripts/oe-setup-layers: write a list of layer paths into the checkout's top dir
Date: Mon, 20 Feb 2023 20:08:11 +0100
Message-Id: <20230220190812.2785729-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 19:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177453

This is beneficial for setting up builds, as this list can be used
to determine reliably where the actual layers are, and discover
available configurations from them.

Also adjust the selftest to check the presence of that file rather
than any specific layer in a hardcoded location.

Sample output (paths are written relative to the file for relocatability
and ease of reading):

{
    "layers": [
        "meta-openembedded/meta-filesystems",
        "meta-openembedded/meta-gnome",
        "meta-openembedded/meta-initramfs",
        "meta-openembedded/meta-multimedia",
        "meta-openembedded/meta-networking",
        "meta-openembedded/meta-oe",
        "meta-openembedded/meta-perl",
        "meta-openembedded/meta-python",
        "meta-openembedded/meta-webserver",
        "meta-openembedded/meta-xfce",
        "poky/bitbake/lib/layerindexlib/tests/testdata/layer1",
        "poky/bitbake/lib/layerindexlib/tests/testdata/layer2",
        "poky/bitbake/lib/layerindexlib/tests/testdata/layer3",
        "poky/bitbake/lib/layerindexlib/tests/testdata/layer4",
        "poky/meta-poky",
        "poky/meta-selftest",
        "poky/meta-skeleton",
        "poky/meta-yocto-bsp",
        "poky/meta"
    ],
    "version": "1.0"
}

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py |  6 ++----
 scripts/oe-setup-layers                  | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index b048948386..65426a6782 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -162,7 +162,5 @@ class BitbakeLayers(OESelftestTestCase):
 
         testcheckoutdir = os.path.join(self.builddir, 'test-layer-checkout')
         result = runCmd('{}/setup-layers --destdir {}'.format(self.testlayer_path, testcheckoutdir))
-        # May not necessarily be named 'poky' or 'openembedded-core'
-        oecoredir = os.listdir(testcheckoutdir)[0]
-        testcheckoutfile = os.path.join(testcheckoutdir, oecoredir, "oe-init-build-env")
-        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
+        layers_json = os.path.join(testcheckoutdir, ".oe-layers.json")
+        self.assertTrue(os.path.exists(layers_json), "File {} not found in test layer checkout".format(layers_json))
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index c8012fa670..cbf94ddb08 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -49,11 +49,24 @@ def _is_repo_at_remote_uri(repodir, remote, uri):
 def _contains_submodules(repodir):
     return os.path.exists(os.path.join(repodir,".gitmodules"))
 
+def _write_layer_list(dest, repodirs):
+    layers = []
+    for r in repodirs:
+        for root, dirs, files in os.walk(r):
+            if os.path.basename(root) == 'conf' and 'layer.conf' in files:
+                layers.append(os.path.relpath(os.path.dirname(root), dest))
+    layers_f = os.path.join(dest, ".oe-layers.json")
+    print("Writing list of layers into {}".format(layers_f))
+    with open(layers_f, 'w') as f:
+        json.dump({"version":"1.0","layers":layers}, f, sort_keys=True, indent=4)
+
 def _do_checkout(args, json):
     repos = json['sources']
+    repodirs = []
     for r_name in repos:
         r_data = repos[r_name]
         repodir = os.path.abspath(os.path.join(args['destdir'], r_data['path']))
+        repodirs.append(repodir)
 
         if 'contains_this_file' in r_data.keys():
             force_arg = 'force_bootstraplayer_checkout'
@@ -96,6 +109,8 @@ def _do_checkout(args, json):
             if _contains_submodules(repodir):
                 print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(repodir))
 
+    _write_layer_list(args['destdir'], repodirs)
+
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
 
 parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
-- 
2.30.2


