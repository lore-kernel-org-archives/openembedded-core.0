Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AF8CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 07:25:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.14640.1761204340697464596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 00:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N0M0vUUN;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so317682f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761204339; x=1761809139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZtPNR0XDxsBt2YVL97EBujU1CarkxDwhY5SF+029YQ=;
        b=N0M0vUUNDG1FQMgad0G2wYqecramMs04HOqPXmV7fEUF7ovwYock6RTA6EULpaYJuY
         Hi7a5Lk6pm4m0GG+GVfDpl9vEvRyYVSIkzkn+F74kqTVxThGa5GZuhoeiXOfsPeiDh/Y
         G2ajykp1lLQg1fyvcQnvB9QX8b1E2BhYOL5hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204339; x=1761809139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZtPNR0XDxsBt2YVL97EBujU1CarkxDwhY5SF+029YQ=;
        b=q//v+llj/YK1q3/gElOIIrBTUC50e8hB81SQA58RE4bWkJYu1TX4kqOeG/fYaKXR+Q
         sVASQvtPKZM+by3PWgG5rcxeaSsaXwiv6l6DIodRK8RonlaKAFE/8uNP2ExWJz5hIYS5
         mHf264l2uBW1i8ciX9/gKmapC/2esBdG1qTIxpCfGQENbU0+h0UuUP3WtuTpm+953YxD
         wyAq12hmSe66nITptGkiDE8NZbKdmEn+YTI9gOvkgpGQbU2oI0ldgiraSosYCp7xtICz
         P8MwSTdHEAslSGWxClOaplU+DHzJwXq2d6HJGxsY6TIKC8qNfXo2Ck0fMdueCh3lduDs
         N8EQ==
X-Gm-Message-State: AOJu0YxfXhsa3htrrfMGZ83BOKVGyCNJPBfY2kYvmeU4fjzquwNLd00n
	ioN1TzUceGNJzNPkx67kwOZ9H0h9hPevK8yiQ+8T85vck6P6ux3mzn8iYGYdED3jJgVsDzYjD8N
	sHFz3yPs=
X-Gm-Gg: ASbGncs4+H8+m84D0BN1wMTvFmDuySNCQ+SM15M7fu3t61T89YIfZtdi1EIeD62ym4m
	Z2TePbwQuE8Dwx0RfTHpshzEXXOFB3j6P4fnhWzmSwF55UIu03c3/G6rc12jtF5BDtwIBKqF2JW
	8aOvm3atBvdTmQgmzb4yFO8OkfBVfTzNE3mgFXLeb3SqkrpGl7tybqvtBeuYozMVZ+hUlj+AZDw
	AnQYSFC2ByzUGQCAIWP6cFWOGgo+Xf/j4rAZLWzk/IUmZlWf7EW/gfMmqQ0j0LGDqrCcKCPob1F
	+27D6NoHMxnK0Cp9y6XQD/u+i+cC9zaDxALbHdEBO2nOtQpPpba8fU2cTcIPk8gdwziZbhBnBqJ
	EhJenA8lC0oN1VVyOMca/tDZOw6+PIOnO6h6f2Uql8BrGDM6Vb8Hg1SbkE4mwTxvuz4WS9IfR/G
	btOWYegFSaPf5Sa0jnNhj1y0y3lN1dmYrNwEyqA5qURCSiEcumodJwKXYrRSvMIoQTZm2Ivh8V6
	DBero6L77+56v5X
X-Google-Smtp-Source: AGHT+IH9HXOzM8I8U9VQDAgzFlBcMa3z4jCjv47c2/boulO0Jr2N+n5Btya6rEkeKy+e/p5A3kK1Yw==
X-Received: by 2002:a05:6000:26d1:b0:425:75c6:7125 with SMTP id ffacd0b85a97d-42704d5219emr16435822f8f.16.1761204338856;
        Thu, 23 Oct 2025 00:25:38 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf78sm2608818f8f.32.2025.10.23.00.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:25:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 3/3] selftest/bblayers: Add a test to validate bitbake-setup registry schema
Date: Thu, 23 Oct 2025 09:25:13 +0200
Message-Id: <20251023072513.280477-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251023072513.280477-1-yoann.congal@smile.fr>
References: <20251023072513.280477-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225222

From: Yoann Congal <yoann.congal@smile.fr>

This test validates bitbake/default-registry/configurations/*.conf.json
against bitbake-setup.schema.json:
  INFO - test_validate_bitbake_setup_default_registry (bblayers.BitbakeLayers.test_validate_bitbake_setup_default_registry)
  DEBUG - Validating [...]/poky/bitbake/bin/../default-registry/configurations/oe-nodistro.conf.json
  DEBUG - Validating [...]/poky/bitbake/bin/../default-registry/configurations/poky-master.conf.json
  INFO -  ... ok
  INFO - test_validate_examplelayersjson (bblayers.BitbakeLayers.test_validate_examplelayersjson)
  INFO -  ... ok
  INFO - ----------------------------------------------------------------------
  INFO - Ran 2 tests in 121.119s
  INFO - OK
  INFO - RESULTS:
  INFO - RESULTS - bblayers.BitbakeLayers.test_validate_bitbake_setup_default_registry: PASSED (15.86s)
  INFO - RESULTS - bblayers.BitbakeLayers.test_validate_examplelayersjson: PASSED (7.12s)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
RFC: This structure takes ~7s per schema validation. I guess because of
the multiple bb_get_var in each loop. I'll glady take suggestions on how
to improve this.
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 43a158fcf2..8397506f04 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -155,6 +155,20 @@ class BitbakeLayers(OESelftestTestCase):
         jsonschema = "layers.schema.json"
         self.validate_json(json, jsonschema)
 
+    def test_validate_bitbake_setup_default_registry(self):
+        jsonschema = "bitbake-setup.schema.json"
+
+        bitbake_path = get_bb_var("BITBAKEPATH")
+        default_registry_path = os.path.join(bitbake_path, "..", "default-registry", "configurations")
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

