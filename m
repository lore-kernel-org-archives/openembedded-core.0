Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5D7C7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 09:57:38 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.12538.1683712652054667993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 02:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VuhtOsmB;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so2994148a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683712650; x=1686304650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlFIVQD06fvHOdDdeVK1c1eKtPZ6n9NyhmNM7EBlijw=;
        b=VuhtOsmBl9De3o2FfejaogOP3ceNZmXAloZJLNT7H81N/T6z3leMs4hiUlVmb7ia1C
         bVnqZD4LD111d6jzrpVH7Lx0qcANnFuvHaxGg60GVzwuZGzZJsRAoEJCYBh9hCXncEmj
         /4P2Vy+OhYOr2Ck1BWib2SPnUmW86le+i+JyJdvSOXeHgR6Bj2emknch8UHoYdzlQI8n
         seWrFR9ZolA8NoenxWMZ3++evCZBFPiEUc5U1XZL80srEhqHBNYJPBs/Rwp/0frS3elP
         rab9SPPHDHLiBK3tMR2M7eouGzKOxWLdSPOLGVQs5J8lWeBspxHKt8xyaWjEY7KLu1ye
         ElDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683712650; x=1686304650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlFIVQD06fvHOdDdeVK1c1eKtPZ6n9NyhmNM7EBlijw=;
        b=ftvCFXiDOvsDRshbKl1npQBnxGM2pWX24c0f8HXPfrbk9g+iyRi8gtETWE3O2TL9Mv
         a2TiBrqvsBmaIfvyLMvNAT8OAm8K4R6DHHZWIBubQObC7S9q3yjplhrlvvG83ptus/8H
         Im1wSwIk7vGXPNQTaFK+HpZaNuH2Zi9DZoe3O7e7itseqbDHkMbk72Qs6ZeDno6UvgTc
         uWDQoBonhOww03FjNQ1huqAprgeuXvFr3XdVUIgRwxcvwkHmeQmXV50HI7o+DEAyyPLf
         xcJ2kcpFa6v++HDHgoIknKgTxLarRUoFChRcvm4sZTPtZjp0kpWTIUk3rcML+NJueSlP
         SXNQ==
X-Gm-Message-State: AC+VfDxMLNw9Ims4a3xsmbUc6s72UKqHU2j4YTlYt1XrOrrcwk3CKWTw
	2t74RNR9+XVqP68br9mn5L0pcnGHLow=
X-Google-Smtp-Source: ACHHUZ4rUdGzBJjuq4xKSIEH1BJ3U/uX/capUuVhR4bxUgaevNbSZ1Hr3DqAYRjWPgPCWuIQYNLChA==
X-Received: by 2002:a17:907:ea9:b0:958:5474:a84a with SMTP id ho41-20020a1709070ea900b009585474a84amr17122815ejc.38.1683712650047;
        Wed, 10 May 2023 02:57:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id gz10-20020a170907a04a00b0096609d11c83sm2480851ejc.60.2023.05.10.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 02:57:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] scripts/oe-setup-layers: write a list of layer paths into the checkout's top dir
Date: Wed, 10 May 2023 11:57:25 +0200
Message-Id: <20230510095726.4090311-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181105

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
index b0489483869..65426a67829 100644
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
index c8012fa6705..cbf94ddb08b 100755
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


