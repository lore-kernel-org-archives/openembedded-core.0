Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B27BCCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 00:16:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.3002.1761265009055628454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 17:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nvpgVZ5C;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso13221395e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 17:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761265007; x=1761869807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFxIBG79xqoKLVI1LsAev227oyI/5vINSN9JE20MhGU=;
        b=nvpgVZ5CN7Ym5YnqVq1406uTfigqszub5gLaXSVeQAF4Gv8EZQ/D37km6yDZ4R+OBn
         BEo6B4B29Bh4ItHEK8XaeH2fv/qzmQSTx8jTNLTdo42vziqSXttCjaMzP6smYhelPGOS
         AQd4xjB7dSMq23BrC9FOghpK3TtxVm7QcO4WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265007; x=1761869807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFxIBG79xqoKLVI1LsAev227oyI/5vINSN9JE20MhGU=;
        b=uo6/r3wRQ+jYX1CR0d8krSrmQOtMAFLnOTYzq01ErdOU4k90FN++yyekuTO5JQkjDh
         ORSgRguvcxC+vMrOLQ1DfbiaVgNTxI42FTEjyNGqQIDb+xrwZKQJZCCM6vQvEkPL+LZY
         LlT/0OErhkPYHSJyHYz1odBG5PpSkgOYFrXnhQ7kQa35amTMExgG2XqD5RT0lEp+yzvW
         S8hgkzBT3IOZiVGuggRHd1jL37EMaVbSoHqHmaRxqrQ/vUPRPs1x3j1Ep4HprNDW40Lr
         Qo+I+78OhwNZwvXZgJB5l5UW/ctt+p0tJQ1ohJsUj78hbgb5LVY225h57PjSQh2U2Azh
         Jwrw==
X-Gm-Message-State: AOJu0Yxx4dQzH2WA2gap1o3aySexxkfXrd7KOxX4x93kxwAZq9Py4eFq
	n+++Qe1Xdg/K7bD2CflzHVVseulNtv22NrWOB32Vcd4Hcz2BKA4PtR2FesSDYJYSjNSWpdkVpI4
	E3N6EsSk=
X-Gm-Gg: ASbGncs+GR8MoYPVIimKcPqahQbqYLcPc7g6qKL2Te1dNY/WVA+7iBhKC3acbZ5rtiq
	Ig9g+V0cP/loPwC4EFZQt1o1axFXeHnxkVcR8ypz9/XwHNLPslZqyzfeWj/AeuStfLV5+rfNYEf
	A2fQUd+pSPtF924ZFy10xcbqBVanEMCPVRvS943GfGTmTxIZTzOBm/9uX4XBg+z616mLkMkANVC
	FUfEatZhWC7QIqJOudoyuzWH5dJtYB+SLtAFUS04CrSbPDngZYwBhxIVolTTFIbWBTh/UTjbshy
	sUC2LiNXAOkq8S1qXhwLnNZAk5fELuCiGt+3r3VGv4alEWWB2lYfQDGwhSSARoUOzpymTwcf8Ho
	UZMJXdaT5d/8eoXaR7svurvL7AWDQ38KyKBFfaksKK8atzOZGKsogQ9LXx+jyzMi9E2nF8Od+DU
	yL265D9vyKzIbb/3WNDwgEWUUQqWwMOLuAxS7qpW+0zY6BaXt1EM3rQ3DFqG9BpYZq//bdNJ5NE
	m/E1V0xP7DZ5hJBaK0FnA==
X-Google-Smtp-Source: AGHT+IG6Mcua+r8DT9Ikk2SlTMjEzfT/IO6/0+2I7rii1vGKhnR7ZDKwcvBaXbVSUQK0d8WJOB45Mw==
X-Received: by 2002:a05:6000:25ee:b0:427:62d:132c with SMTP id ffacd0b85a97d-427062d135emr14276352f8f.21.1761265007250;
        Thu, 23 Oct 2025 17:16:47 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e763csm6368166f8f.6.2025.10.23.17.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:16:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 3/3] selftest/bblayers: Add a test to validate bitbake-setup registry schema
Date: Fri, 24 Oct 2025 02:16:20 +0200
Message-Id: <20251024001620.644853-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251024001620.644853-1-yoann.congal@smile.fr>
References: <20251024001620.644853-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 00:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225274

From: Yoann Congal <yoann.congal@smile.fr>

This test validates bitbake/default-registry/configurations/*.conf.json
against bitbake-setup.schema.json:
INFO - test_validate_bitbake_setup_default_registry (bblayers.BitbakeLayers.test_validate_bitbake_setup_default_registry)
DEBUG - Validating .../poky/bitbake/bin/../default-registry/configurations/oe-nodistro.conf.json
DEBUG - Validating .../poky/bitbake/bin/../default-registry/configurations/poky-master.conf.json
INFO -  ... ok
INFO - test_validate_examplelayersjson (bblayers.BitbakeLayers.test_validate_examplelayersjson)
INFO -  ... ok
INFO - ----------------------------------------------------------------------
INFO - Ran 2 tests in 110.469s
INFO - OK
INFO - RESULTS:
INFO - RESULTS - bblayers.BitbakeLayers.test_validate_bitbake_setup_default_registry: PASSED (0.92s)
INFO - RESULTS - bblayers.BitbakeLayers.test_validate_examplelayersjson: PASSED (0.19s)
INFO - SUMMARY:
INFO - oe-selftest () - Ran 2 tests in 110.469s
INFO - oe-selftest - OK - All required tests passed (successes=2, skipped=0, failures=0, errors=0)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: By putting bb_vars reading in the class, time per validation
goes from 6s to 0.2s.
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 5b13c9dffe..6c710b2751 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -21,8 +21,9 @@ class BitbakeLayers(OESelftestTestCase):
         bitbake("-c addto_recipe_sysroot python3-jsonschema-native")
 
         # Fetch variables used in multiple test cases
-        bb_vars = get_bb_vars(['COREBASE'])
+        bb_vars = get_bb_vars(['COREBASE', 'BITBAKEPATH'])
         cls.corebase = bb_vars['COREBASE']
+        cls.bitbakepath = bb_vars['BITBAKEPATH']
         cls.jsonschema_staging_bindir = get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native')
 
     def test_bitbakelayers_layerindexshowdepends(self):
@@ -161,6 +162,19 @@ class BitbakeLayers(OESelftestTestCase):
         json = os.path.join(self.corebase, "meta/files/layers.example.json")
         self.validate_layersjson(json)
 
+    def test_validate_bitbake_setup_default_registry(self):
+        jsonschema = "bitbake-setup.schema.json"
+
+        default_registry_path = os.path.join(self.bitbakepath, "..", "default-registry", "configurations")
+
+        for root, _, files in os.walk(default_registry_path):
+            for f in files:
+                if not f.endswith(".conf.json"):
+                    continue
+                json = os.path.join(root, f)
+                self.logger.debug("Validating %s", json)
+                self.validate_json(json, jsonschema)
+
     def test_bitbakelayers_setup(self):
         result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))
         jsonfile = os.path.join(self.testlayer_path, "setup-layers.json")

