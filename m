Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23928CCD193
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 00:16:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.3000.1761265008759489062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 17:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AMImmuLg;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4283be7df63so600680f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 17:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761265007; x=1761869807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra9JblUJkHvYLMgJYMAL108P9vbvtbgDe/SAJkaazHA=;
        b=AMImmuLg5of+oCA6+4whmUAS3ftUXH7mBeSeg72jeRFcV66UXeQegD/bmyO7ohc+A/
         M6BNUuRQsahN2L5BWrn9h3WjVka1MgLheIrC/UHyc313c6H+XUHCTEyuJuVHEd6FWf+l
         6YiteSgS0vvO17PmCgCsFh0ZoDSsR+8eBNqf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265007; x=1761869807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ra9JblUJkHvYLMgJYMAL108P9vbvtbgDe/SAJkaazHA=;
        b=G9eoGlADAq6+ORy5epX4blI8j8GeLOtTffkm7SjkhLnnfkzQcOJncl9hK5VkxNB344
         7+ugSgeCSNPdwsMPN72zntvOcy+GCP/Fjsbr+DnZOqsB1ETUYVyM8zJJQbm7L61ZUl1J
         mNtBZUHAs/nPhdw5gpZveQ8dXFuntZ7eresIRbTDhYVtt/+NC9B33kooUUhZU4H0GeT+
         WDt+SZR0IUW5Kzs1DGDqAkE8CmMYkYnh8jZvy3mjp+kv2weaopzPr5FkBceoIJ9xCdG9
         ncCnDZV0kJlUmjkekyBYYen2HRQusFjLqvr0C+HdrhPKtLyyVsPAzvMS/80AoKob+tsc
         MTWg==
X-Gm-Message-State: AOJu0Yxx8dUghAdrzJP71sqKEwzLD9l2yNuPOQe3zvC4DEwSqHcFgjEQ
	ojIsa2iEwFOyCaCJbDLL+3Jnl8V3RpSL8pusnLjclE/ynBNeU8iRpo7jYWHR+r9L6hF2ZCbYKsP
	233VBXoM=
X-Gm-Gg: ASbGncuycDYMjWnrwm63sStAahbLMDntFuQLstAwkIy2Sp5fsw/Qn/lBYxbmq3/pai9
	3fHChxO0XdwtXmcqVwp5krW3FHn8Rj3CeBgJHze0NkjL6nHgmRG8YfCU15Md8xKQYuEvGBENbdJ
	rJJ+sTVAvHo+ex6DXz4GW/9N/GKYtDYVI8/QnBb1pSznvgcAlR9S/+WMPG+OwlX6YEzbgEFurK7
	ZZ4vqEjN/iI3yzxXGuuT0rkeZs/m63sUA4p/TZ8vfM76WxIuPHFDbKJAegWhWWG/4VXM1WKTnfv
	yqFeewgIQDfRBGH4XrMN9UCpzhVEAdOAgjrZVubPq8sBromdrmxh34BcI1ZXo5VzPOMCy1dAkO4
	b5faykJ9si+fKo8h+rDuyBheqpbN70Nb6AW4N+RMFT+G+6B2UBYAFeV8VN5/1i2aLA1Ept3S9Rc
	07O286OIBWN57BcfWsjdCNEb3gxSRjZF1STWlrZEECr9QPbJoldKZGHJCaHIYpUr3K8Hzp1J+xo
	CN2LQzw+ztRTO0zc7lBVg==
X-Google-Smtp-Source: AGHT+IEn3Lmt3D0H0HLFmXKXBoIJHcvwhtpj/ch1Eb0nSdSIiJg9ljdHhLMKrsQbCXWygfz6MBJRVA==
X-Received: by 2002:a05:6000:2887:b0:3e7:68b2:c556 with SMTP id ffacd0b85a97d-42704d7ebd3mr17369777f8f.26.1761265006825;
        Thu, 23 Oct 2025 17:16:46 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e763csm6368166f8f.6.2025.10.23.17.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:16:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 2/3] selftest/bblayers: Refactor JSON schema validation
Date: Fri, 24 Oct 2025 02:16:19 +0200
Message-Id: <20251024001620.644853-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251024001620.644853-1-yoann.congal@smile.fr>
References: <20251024001620.644853-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 00:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225273

From: Yoann Congal <yoann.congal@smile.fr>

* Extract a function "validate_json"
* Read bitbake variables in setUpClass to avoid makeing repeated calls
  to bitbake
* Allow to specify the schema relative to $COREBASE/meta/files/
* Specify the Base URI to allow schema to reference each other

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: read bb vars in setUpClass and use values where needed.
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 29 ++++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 982287c9a5..5b13c9dffe 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -20,6 +20,11 @@ class BitbakeLayers(OESelftestTestCase):
         bitbake("python3-jsonschema-native")
         bitbake("-c addto_recipe_sysroot python3-jsonschema-native")
 
+        # Fetch variables used in multiple test cases
+        bb_vars = get_bb_vars(['COREBASE'])
+        cls.corebase = bb_vars['COREBASE']
+        cls.jsonschema_staging_bindir = get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native')
+
     def test_bitbakelayers_layerindexshowdepends(self):
         result = runCmd('bitbake-layers layerindex-show-depends meta-poky')
         find_in_contents = re.search("openembedded-core", result.output)
@@ -58,7 +63,7 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     def test_bitbakelayers_add_remove(self):
-        test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
+        test_layer = os.path.join(self.corebase, 'meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, "This test cannot run with meta-skeleton in bblayers.conf. bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
@@ -136,14 +141,24 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertTrue(os.path.isfile(recipe_file), msg = "Can't find recipe file for %s" % recipe)
         return os.path.basename(recipe_file)
 
+    def validate_json(self, json, jsonschema):
+        python = os.path.join(self.jsonschema_staging_bindir, 'nativepython3')
+        jsonvalidator = os.path.join(self.jsonschema_staging_bindir, 'jsonschema')
+        schemas_dir = os.path.join(self.corebase, "meta/files/")
+        if not os.path.isabs(jsonschema):
+            jsonschema = os.path.join(schemas_dir, jsonschema)
+
+        result = runCmd(
+            "{} {} -i {} --base-uri file://{}/ {}".format(
+                python, jsonvalidator, json, schemas_dir, jsonschema
+            )
+        )
+
     def validate_layersjson(self, json):
-        python = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native'), 'nativepython3')
-        jsonvalidator = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native'), 'jsonschema')
-        jsonschema = os.path.join(get_bb_var('COREBASE'), 'meta/files/layers.schema.json')
-        result = runCmd("{} {} -i {} {}".format(python, jsonvalidator, json, jsonschema))
+        self.validate_json(json, "layers.schema.json")
 
     def test_validate_examplelayersjson(self):
-        json = os.path.join(get_bb_var('COREBASE'), "meta/files/layers.example.json")
+        json = os.path.join(self.corebase, "meta/files/layers.example.json")
         self.validate_layersjson(json)
 
     def test_bitbakelayers_setup(self):
@@ -173,7 +188,7 @@ class BitbakeLayers(OESelftestTestCase):
 
         # As setup-layers checkout out an old revision of poky, there is no setup-build symlink,
         # and we need to run oe-setup-build directly from the current poky tree under test
-        oe_setup_build = os.path.join(get_bb_var('COREBASE'), 'scripts/oe-setup-build')
+        oe_setup_build = os.path.join(self.corebase, 'scripts/oe-setup-build')
         oe_setup_build_l = os.path.join(testcheckoutdir, 'setup-build')
         os.symlink(oe_setup_build,oe_setup_build_l)
 

