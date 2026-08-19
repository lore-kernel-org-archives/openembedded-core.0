Return-Path: <roosesweb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889BCC5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:22:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1344.1787120534380462951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o41+7uLD;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so3888485e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787120533; x=1787725333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmHmM17A6ct4O6HKxeCWKR58jonNh+kJvnKVY5DXZ58=;
        b=o41+7uLDCBe2wQs/4DzeC4aJspfROlu5kpzyatyxsEmMslI2dK2rnrc8jd74QIvAIn
         g3dGW/0twCmhHbJhO6bifVhkxLm/C4eNk/qXDFrlHXF3x+RXQPGmXLNEtqDklgJvl0l0
         1PyAI/JT/ww28ThC8y/Rw4S0N1Lh7p9InyXhCs85SOQVkRtjSBLqVdT2QZrAsNm77ZtO
         z0Y/wb2e14TL5iFhH/p+I8UXATkums7sReGsdWsi1P1clBRUi/OxuI4nt7OTd0zaWp+V
         ooD+BisHA0XvuLB0z4JAd4fwsufh0Pd7kNyoQ3JmWiaipIcfwWXsh91k2FblANI908er
         fqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120533; x=1787725333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmHmM17A6ct4O6HKxeCWKR58jonNh+kJvnKVY5DXZ58=;
        b=P1igO3kit3r7zsybkN0dBdAjPP282gWZTN/Ze2AATePBSMyJIf0p9yewM5woaSSimG
         sRc/7Z5PaYm97QwfbhLeTjhhWO+cvQnqMt1UgikUQlObZrPKIy8eIDZD3eI6+GDt4oEI
         clmdO/Lxxd+jB+ZAs9slHauMwQyyagK8LJLY2he0Edy/DqrOltr1TQJ8HhTt9GvvK4aj
         GewdpR/wJVlYDz5AyOg/prBqvzBI388p7XCXZL2m5TckomSVdHfM0UJ00sZJu+Dyz6mN
         V6ecNS/xeSGRPVisEvAe1h5YgIjYEQGn0f8IAVZVMN+yhFfDeTSVa3wkAgA1rDOvOx0x
         qddA==
X-Gm-Message-State: AOJu0YwraZ8Vp2GvMV7eLXzIkC1mGxkXjPSZwrLInGWT37IPEzbAe29C
	KweX68utKZ4JovklFXfolexOkg60T/74Ih4/SXOhObbh16Ya1VVuLLcOtWS9veSK
X-Gm-Gg: AR+sD13nrkZX3anmma+UdUjalBPFROXNN9qPUSEdTOaYxABjENBw2fss0uXNG5yWJOE
	pTLCy0mudmdSC3fZm1641X0TqSroLAiD9FmGoCBlTeyr4cu8eWs1npHqDIHqgRiLaS2AiksXCZk
	H2j3x6BCnnTBMFTo7YwsojvdCHCkGOqCkAnqsRARLsMMcoyZgOeXNcMmHNz6m8QPcfWpMB4DX2k
	zky4MKGqGeDdNmmIJO5A8BASOXA+q8coCrGyfHilM4+bgZWKXoMaXl9AvMiaJEXGwPJ/LNKjYIr
	0jO91QBmvYFydpgDaNl0vFOZV2JvQNIZaDlvbDCv9ejQvJ+7TljiCf9ihxhs1PctFDd4wMqSVuL
	2aI3lHwh5gELvKcmDJvQqc41wi/cgy601eVJuQXubMw5N7sed96jSnegz8RHdshacxj43F50lEM
	oiMYLwulS4AYU+LgR/PVgLiIJaC+IbY7D2+vlVZVtQIuF9eibh7s22VKDPFoLdoLFgQ3gWPBhME
	0YWms7xW2CMLOO/mEbRmWKrbun3n+NCLUq1ExdlO8vVEw==
X-Received: by 2002:a05:600c:8b32:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-499aa200efcmr36819595e9.14.1787120532552;
        Tue, 18 Aug 2026 23:22:12 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:810d:ae08:d00:a23e:1b00:ebf4:5b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm32900085e9.13.2026.08.18.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:22:11 -0700 (PDT)
From: Thomas Roos <roosesweb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 5/5] oeqa/selftest/imagefeatures: test an empty IMAGE_LINK_NAME
Date: Wed, 19 Aug 2026 08:22:08 +0200
Message-ID: <20260819062208.680468-6-roosesweb@gmail.com>
In-Reply-To: <20260819062208.680468-1-roosesweb@gmail.com>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
 <20260819062208.680468-1-roosesweb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243711

Nothing covered this configuration, which is why the vex, multiubi and
testexport sites went unnoticed. One core-image-minimal build with
IMAGE_LINK_NAME cleared covers all three; the test fails without them.

AI-Generated: Uses Claude Opus 5
Signed-off-by: Thomas Roos <roosesweb@gmail.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 87c3da2..fac1d47 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -332,3 +332,45 @@ CORE_IMAGE_EXTRA_INSTALL = "man-pages"
             status, output = qemu.run_serial("man --pager=cat intro")
             self.assertEqual(status, 1, 'Failed to run man: %s' % (output))
             self.assertIn("introduction to user commands", output)
+
+    def test_empty_image_link_name(self):
+        """
+        Test that an empty IMAGE_LINK_NAME suppresses the artifact symlinks
+        and that the classes reading an artifact back still locate it.
+        """
+        image = 'core-image-minimal'
+        vname = 'mtd_4_256'
+        config = """
+INHERIT += "vex"
+IMAGE_CLASSES += "testexport"
+IMAGE_LINK_NAME = ""
+IMAGE_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
+IMAGE_FSTYPES += "multiubi"
+MULTIUBI_BUILD = "%s"
+MKUBIFS_ARGS_%s ?= "-m 4096 -e 253952 -c 4096"
+UBINIZE_ARGS_%s ?= "-m 4096 -p 256KiB"
+TEST_TARGET_IP = "192.168.7.2"
+TEST_SERVER_IP = "192.168.7.1"
+""" % (vname, vname, vname)
+        self.write_config(config)
+
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_NAME', 'TEST_EXPORT_DIR'], image)
+        deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
+
+        # Artifacts are still named after IMAGE_NAME
+        for name in ("%s.vex.json" % bb_vars['IMAGE_NAME'],
+                     "%s_%s.ubifs" % (bb_vars['IMAGE_NAME'], vname)):
+            self.assertTrue(os.path.exists(os.path.join(deploy_dir, name)),
+                            "%s is missing from %s" % (name, deploy_dir))
+
+        # ...and nothing is linked from the suffix alone
+        for name in (".vex.json", "_%s.ubifs" % vname, "_%s.ubi" % vname):
+            self.assertFalse(os.path.lexists(os.path.join(deploy_dir, name)),
+                             "%s was created from an empty IMAGE_LINK_NAME" % name)
+
+        # testexport copies these back out of DEPLOY_DIR_IMAGE
+        bitbake("-c testexport %s" % image)
+        for name in ('manifest', 'testdata.json'):
+            path = os.path.join(bb_vars['TEST_EXPORT_DIR'], 'data', name)
+            self.assertTrue(os.path.exists(path), "%s was not exported" % path)
-- 
2.55.0


