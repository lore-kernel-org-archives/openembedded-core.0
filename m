Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AAAC48BF5
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:52:40 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.16963.1708084357321522010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ajA7YC5m;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51182ece518so2331748e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084355; x=1708689155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=751Itbck1egTL1dbNxM2i5lUEdCPwCMYZOLd8dGDclI=;
        b=ajA7YC5mxsHo5FWQZVjwSdLpxUy0Fh9fxSIuwaUTQhcViZ72yFz5K5eecS3jTdc6vm
         MHTlCqDUlHQIG+6UNE8OhG2BA3JS/2Z0LhDOHI0zz3xuXn/H7jxLeg+zQbQYFwUXr6t0
         c6eqwjfoKrZQlMbloXldIak01no23Pp9Se/Lt/0AQDv7bYtgZ1gtyKWwtZFAmVzqvutY
         3Gitz/+cJEHNRkFjfxclL/TOcUFVtjOIcRMI/B/KDBHErUQvLXMq7HQCSDsheesJJVA/
         QbmyNc4XPRJ+2//zI2Qa+PoewjWEFEdQ/HI2Grwf8gkzx+wjTIBWCu6g2gcyU97QBPKt
         vLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084355; x=1708689155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=751Itbck1egTL1dbNxM2i5lUEdCPwCMYZOLd8dGDclI=;
        b=rh+pySTo2WmixBYH0dfmkULMBLTpIEudJVLc/84Mtr1otqEze/1MLStBMWcnrb7Zg9
         52HaULRv11fWiWTJCX4GtvciCn4zbNqArjgG0h2k270lsIp6uOwT+tI+2PVT/64fjOXn
         z8cfRDXoLTOKDQlK5YXc0hGk+1yDHn9SN1+bowdwh6VQIJ9O6yYRb+p4a2VIytVcn13D
         97/FzC9ER2NWwKbwPvxiNn3hIvmH1C6O8AM6wi21LOA1TFc8GUgjxMUmJaNZ9ihidvJB
         e23TRA6lPO94HWU8LUAv5mvBvFMSFxESbInbRP5TNhrKcyIedrAawTfJkrLQECcmAXoA
         MYAA==
X-Gm-Message-State: AOJu0YzkUPJ5TaHMjeadaQV+CJPC60Gf5azkoAaa2xgrzr4qo4eoV7Ss
	rZS0A3KO3tHzKbdQatJigu/fF7JqLBoiYG6/HqKtVaS9KORAIExLIeOiR3Gs
X-Google-Smtp-Source: AGHT+IGkXl5wA6oWyhUqvTKYGlW+T0Lo8oiaufD360p0xcN87ZMBbvSsa5zewHjVLcKlgXMm8cTa+g==
X-Received: by 2002:a19:7008:0:b0:511:a4fd:fc1a with SMTP id h8-20020a197008000000b00511a4fdfc1amr3115483lfc.47.1708084355219;
        Fri, 16 Feb 2024 03:52:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906d11000b00a3dbd16d1b0sm845788ejz.54.2024.02.16.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:52:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] scripts/oe-setup-layers: write a list of layer paths into the checkout's top dir
Date: Fri, 16 Feb 2024 12:52:21 +0100
Message-Id: <20240216115222.3545462-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216115222.3545462-1-alex@linutronix.de>
References: <20240216115222.3545462-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195761

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
index ca1470ced0a..f2460cb451b 100644
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


