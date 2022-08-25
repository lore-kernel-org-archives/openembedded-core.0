Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981F0ECAAA2
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 20:35:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.29368.1661459698848375842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qXTQfwD6;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id ay12so10770112wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3srNYb6ND/psxvsL6kW7dKFqi29bJH6UWdvY60fmw0A=;
        b=qXTQfwD6MBA3tXro3oxur3JvtFGgQUj8JEWyY+D+P5I0pWAxjsMm2RXP4vyKLpxGLD
         dXyn3289p+F6zI+8Ruw36HTSUImWU8ApHatgwYlDgQJzLNMUN5bsaDqvBI1mi6uNM6Wy
         ALcJmGru9ESmSqdDj6BEs1ie34XNYRyhC3jtsJ/dfcB/0lMEkbCnRk2W9ISeNa89vr/W
         GdFiap6BT9U48PrrkxIHQ1yZBTCOc0a2uPHfPcGxFB9yXuQauwxKvLKWnDqIcUESzKwk
         ly+moOqfVGH34W8xo2j8ib26pmtq5wL3JrkYrX5KkYXKM7b4WQLfde2pG+r/85oGRiFc
         p9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3srNYb6ND/psxvsL6kW7dKFqi29bJH6UWdvY60fmw0A=;
        b=EjeyFcy8Q97UAiBzZ8+wpC36xtPzrikQ9F/GMwPmaW6v3qjEHc4fY77Gxf9X0R0g9x
         btAi5GIuAA5xaqDeL5p1SErCTuIHYYDQ8AHuem15Vs67JD+8DE4GCxn/GiTG1XPZWM7y
         WN37AnvJh7qfY8cYZje43FB4TtC083+K1pm3VWSdJqV9RL8nydIv3l6LddSLQup7o2nM
         qtO9Br64fWahpuayexUBigolB86jNJyX7v2RPb5aZBd3u4Z7IvI6H8sEnm3pDsigZVIv
         qQogmdOimpmPgWsqHftLrWZUVLwP/GS8gMX3JWiwhBFKmuTG7gSlVRJVvQCYK866JREf
         TsOQ==
X-Gm-Message-State: ACgBeo04FxfqcJ/DmFEwSgwPWi/vfdupSky/7IGRlwZfHZiy/aWhwYGz
	3ei32GPIvDAxCaV+pPA3dY6nmA9rzx4=
X-Google-Smtp-Source: 
 AA6agR5CZek+pRsq2TPkImREkYTX3djZohrQI2BU1t1JlrAT265znVIrQwodWwqEA10uoyNmxfVgrA==
X-Received: by 2002:a05:600c:25d1:b0:3a5:371d:38f with SMTP id
 17-20020a05600c25d100b003a5371d038fmr3241015wml.75.1661459697268;
        Thu, 25 Aug 2022 13:34:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 m3-20020adfe0c3000000b002250fcfe2ddsm200006wri.14.2022.08.25.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:34:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] selftest/bblayers: add a test for creating a layer setup
 and using it to restore the layers
Date: Thu, 25 Aug 2022 22:34:51 +0200
Message-Id: <20220825203451.2074080-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825203451.2074080-1-alex@linutronix.de>
References: <20220825203451.2074080-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 20:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169892

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


