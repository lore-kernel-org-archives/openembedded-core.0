Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADE0ECAAD5
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:14:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.23996.1661944458598369324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KB6kcznC;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id c7so11134556wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3srNYb6ND/psxvsL6kW7dKFqi29bJH6UWdvY60fmw0A=;
        b=KB6kcznCW2OuBv0CPE2UquQL8YMJGrw5Pgh055pCj5txsCZZ4nrnzEQQMsiW5/3I0I
         cV3O9ynxBxvMD83w7+6nDRG5szFeK2m0F/v4JbvND3iiOvCn+eL3mmIWyRX5xo0fz8bX
         dQPFygADCsluuDdvN/v05w8GeXs2IWqsRL925osTB4Z/V7DTTJ1JBW2uBUj2/mw67Qfg
         QxXGW/XZK8+msER1vzbe03V+bveMxUMn+8h1gf9dywetqXHYtsHt+3YzSxd0gWhKWXqA
         usrAxw0k5xCyyaD+njckP3JJxGQyDZnK5zb8zshB2GjSo6dAWVvosaK8j87M9h9EaZ/m
         edPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3srNYb6ND/psxvsL6kW7dKFqi29bJH6UWdvY60fmw0A=;
        b=kRygNJP8++NICz6zW2fEIEkZVNczqaF+x4M9FXhSsybpFoCOj2++t5HjqOImfAc+mj
         JDD8GC8OISTKuDkHVOneatPqB9Z0DPIEZP3OwjWqChCL+uTob4WcAby9/NHIn1RRsbLb
         L3YQbO4G1hKtz7oXZ8nIpnw3ONm2QVW2dwFHJxbERp1NHDT+LAv5zMP+f6coMxSs6zqY
         W43d7I20o5L5XtbTn5KhslvQesa3HN7BGduNaj1zfLCUExYlGcI4Awq67SjPjJAVvGyl
         ZcPqbK5GZHMoQY3ZidhDMpgooMdgCLrc4FZQihGCJK83fAsEzdUsIUekahHaPF50IRgO
         U13Q==
X-Gm-Message-State: ACgBeo2xI9g6FV1YJiQYdlk57K9aw9NKbf/T4CHmiS3VFZuDIj93xjGE
	5qjP2jRN0JJkL5FQvIiaHMjQWKHYB18=
X-Google-Smtp-Source: 
 AA6agR7oNjbZTW9QNppy55GYfV392t8NqsjKgo1v0OTeXUF5yEkwXIfRIzkfbnWmPgRJbLdVzXDbbw==
X-Received: by 2002:adf:9cca:0:b0:226:dfa0:3fb7 with SMTP id
 h10-20020adf9cca000000b00226dfa03fb7mr6188600wre.412.1661944456999;
        Wed, 31 Aug 2022 04:14:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003a60edc3a44sm2324753wmb.5.2022.08.31.04.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 04:14:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] selftest/bblayers: add a test for creating a layer setup
 and using it to restore the layers
Date: Wed, 31 Aug 2022 13:14:00 +0200
Message-Id: <20220831111401.3330342-6-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/170106

This does a basic run-through of the bitbake-layers plugin, and the resulting json layer config
and the layer setup script that uses it. Only poky is actually fetched by the script.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index c753a7b795..18007764b3 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -142,3 +142,25 @@ class BitbakeLayers(OESelftestTestCase):
     def test_validate_examplelayersjson(self):
         json = os.path.join(get_bb_var('COREBASE'), "meta/files/layers.example.json")
         self.validate_layersjson(json)
+
+    def test_bitbakelayers_setup(self):
+        result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))
+        jsonfile = os.path.join(self.testlayer_path, "setup-layers.json")
+        self.validate_layersjson(jsonfile)
+
+        # The revision-under-test may not necessarily be available on the remote server,
+        # so replace it with a stable release tag.
+        import json
+        with open(jsonfile) as f:
+            data = json.load(f)
+        for s in data['sources']:
+            data['sources'][s]['git-remote']['rev'] = 'yocto-4.0'
+        with open(jsonfile, 'w') as f:
+            json.dump(data, f)
+
+        testcheckoutdir = os.path.join(self.builddir, 'test-layer-checkout')
+        result = runCmd('{}/setup-layers --destdir {}'.format(self.testlayer_path, testcheckoutdir))
+        # May not necessarily be named 'poky' or 'openembedded-core'
+        oecoredir = os.listdir(testcheckoutdir)[0]
+        testcheckoutfile = os.path.join(testcheckoutdir, oecoredir, "oe-init-build-env")
+        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
-- 
2.30.2


