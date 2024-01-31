Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49950C47DB3
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 12:39:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.12874.1706704769613215056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 04:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bdk7vhyL;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ae7681d03so2479676f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 04:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706704768; x=1707309568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeWnfP2noUuR+FR0QhynccQcXIrQl2AULlnsr4oCqJA=;
        b=Bdk7vhyL4n7wm3Wb43Zu+2HR1wWyCaQolcJqOBmuAyTyTd4gUzUc0tsJoYqOWt5DC6
         WZU+zAhGLIOXXZQD5iqtO7WDxfE985CDdJCOKTlR96O4smt0mDXngYeyB/kXtQNCojmm
         p8Yj/1qkKXEz9+UCo+gSQa31q71B6IEauZDz7vTpylkGfNZXOX0QY3lMMNU7M2SaT9fa
         igj14ieO79fvumDWG/cEOMYquV+8uGp29qHG7Qb7N+oAGJ4YvIad/FULwZOd35QQF9Ia
         ++lGoxJoV7XiXedOavMDcG4OnFg4a26h79RmAPMJ+7u0E6zD88+blXJyJ6/6n9IG9jwt
         ll3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704768; x=1707309568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeWnfP2noUuR+FR0QhynccQcXIrQl2AULlnsr4oCqJA=;
        b=bj+L7dMFBRKiWvzCj/ds0gRnFlsrt+NZZ0IvwZAKixNWFM6zZgHjdXpLtjWf0L3bhN
         HadYXMBOXR29BO2n0JWGR+KDiVA71kowbzOrGSs/3/2LdImBVd3i+ohojPFZvXCCr/R8
         r7dI0WLuMr7GlwcsjtpboG92dINz/79kU9adL19GYSnNqA7whgNGV0nuswzOG++VMcwr
         YKhPm4UtscifZsY8PcuK9/O9Cv29CscXGCosXs62e8iDFNXnhDOTjt8Cjwzy5Ajwr7+s
         AFn/BkXqYhH9i4PQqXMP2PdvawDWWScyDcQWF+ol3cdf3h71DMqCFNjEJ+K/m41Cf6ZO
         +ihg==
X-Gm-Message-State: AOJu0YyWf7HC/t678I3++b2VuGUpiIBKlLdNd7mSwlFXcEN+5O81DFkT
	wlRpaoaguBlORy8Q0ZZISzD88WV3KCp10i7CihfYSLmtseNKVlBTnKOu89V6
X-Google-Smtp-Source: AGHT+IF5MmrEC4BefKGCkCiMOTXzdavorbgW4bu5eU7Ms1EI3kocPiu/bPc4bpZs4bx5I6NoTHqN9A==
X-Received: by 2002:a5d:6851:0:b0:33a:e43a:4ba6 with SMTP id o17-20020a5d6851000000b0033ae43a4ba6mr1016858wrw.57.1706704768039;
        Wed, 31 Jan 2024 04:39:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ba1-20020a0560001c0100b0033ae593e830sm10898058wrb.23.2024.01.31.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:39:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] scripts/oe-setup-layers: write a list of layer paths into the checkout's top dir
Date: Wed, 31 Jan 2024 13:39:07 +0100
Message-Id: <20240131123908.1098544-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131123908.1098544-1-alex@linutronix.de>
References: <20240131123908.1098544-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 12:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194522

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
index 819ddf51bcd..01fe17842e4 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -163,7 +163,5 @@ class BitbakeLayers(OESelftestTestCase):
 
         testcheckoutdir = os.path.join(self.builddir, 'test-layer-checkout')
         result = runCmd('{}/setup-layers --destdir {}'.format(self.testlayer_path, testcheckoutdir))
-        # May not necessarily be named 'poky' or 'openembedded-core'
-        oecoredir = os.listdir(testcheckoutdir)[0]
-        testcheckoutfile = os.path.join(testcheckoutdir, oecoredir, "oe-init-build-env")
-        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
+        layers_json = os.path.join(testcheckoutdir, ".oe-layers.json")
+        self.assertTrue(os.path.exists(layers_json), "File {} not found in test layer checkout".format(layers_json))
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6d49688a32c..bee4ef0fec8 100755
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
2.39.2


