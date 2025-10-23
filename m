Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8EFCCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 07:25:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.14728.1761204339828097606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 00:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2BHl6BZC;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47106fc51faso6977335e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761204338; x=1761809138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/cAD6mCPKDSN05Q7NRzHXLsOfhZ0TYHKGoCneQ0X0g=;
        b=2BHl6BZCtOMU+JrE+vzRP3W1Uio167mjkwnnkS0+qSVwd8I9Mp6t2lyn7joDOmpy5R
         k5hnqsDX/ZJwB2MCZrsZ4mIaMFnsIdMgZTcsTrjceN+pjn1frMphEIvzXTKfQJkWZ0d2
         7FCMIPqJdYD2gPNzOjVdOc8fY2yADtmws9kf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204338; x=1761809138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/cAD6mCPKDSN05Q7NRzHXLsOfhZ0TYHKGoCneQ0X0g=;
        b=niIW12oJ4LGEdETdzrP4x+H2/VabmqWJwhp1f8zGZqbZMSNXhs5bZiOFwPwILKyuJx
         c1jMKFjKBORtj1LQqafRKEbfqI+qXOQAWnKNq8CbXOqyNsDtfZ5Nxtb5RPGhh40JEzcr
         s1rnH/BuY+22WocZJZTyV3OAyZEmpr9fvcJIQZGISA5WxMksJTr3yPaoY6fcgEax9xvN
         HLKURbURqbBOHyRVpWWID3c6r4qYuAr2mSql2TqBZeJxShBslgVhu+SFXOsuchbbIx/t
         JA6nesTOJ/Y1tMotrIJlG5oIUPLIiHd68ErB6/249/BKdwhdiy9gicu+8ZFuvv4+J3vE
         TodQ==
X-Gm-Message-State: AOJu0YwaXXy3rHCjTyTcozoO8U6JL9oPaJezP0m4IYoB5IjqUTOc0exO
	6C0BUA0nRpY6tZ3LfeHVRQ36WwlfbNofS2sOqZJH0aYXR7APRty3QFLLsvI0uPh6nZ9ohVRnd7a
	WC5owMkg=
X-Gm-Gg: ASbGncsGs+n3O/msru/5ibzyWG2kFe7Ztcx2Yxavij+KiFBoNDEqbk3GPT9/xygYvwN
	/JKNGeCG8wnzQ76TEZuVL8X6J8/fSdDBEotMbKFTsUbrUStS5fFljE6IYekN2A0YcQqny9IgNcq
	awn/2rUN20NpCEv8Evrf0HJ4vLPmc0GhN91RB3Og+wBee8bs8uUeU4n08IMcpHF6PDF9EFtRGJU
	R/iBHYQluTSpMqT8J752sPOCeTXRtovQQ8UtHmbX8zxu7ccEE37Bd38XqNTAoX/R5jCPmF8gZpo
	aP8zc0u3vdY1J21Fofw4+MCLbkUHelPyP/wKWagE4RWTekj1q7XqdzPk3GC74USSDs3KZ0irqhI
	o+TDEFsLDpbGt32XBbxHRZmSp530tLIUifyv5BXsGF2FBmtx4h1XFmdb9C/v/GVKJxab77LA45f
	Gp+CYyfxdhB0GiYfLnjjp9lml4Fn19AXGmQRsHK0UtklqivgnE1e9GFZqmxaadDnsA/vz8w8mP8
	RJe30apsThcaTTW
X-Google-Smtp-Source: AGHT+IGUW1t2o1OGgb1M4uh85T49EGdo5YllQw+jm5oG18iQIOys8pXojMw7VSoJAPVME7Rmvjghlw==
X-Received: by 2002:a05:6000:3107:b0:428:4354:aa26 with SMTP id ffacd0b85a97d-4284354ac40mr11027369f8f.47.1761204337898;
        Thu, 23 Oct 2025 00:25:37 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf78sm2608818f8f.32.2025.10.23.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:25:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/3] selftest/bblayers: Refactor JSON schema validation
Date: Thu, 23 Oct 2025 09:25:12 +0200
Message-Id: <20251023072513.280477-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251023072513.280477-1-yoann.congal@smile.fr>
References: <20251023072513.280477-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225221

From: Yoann Congal <yoann.congal@smile.fr>

* Extract a function "validate_json"
* Allow to specify the schema relative to $COREBASE/meta/files/
* Specify the Base URI to allow schema to reference each other

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
RFC: Maybe I should split this commit?
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 982287c9a5..43a158fcf2 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -136,15 +136,24 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertTrue(os.path.isfile(recipe_file), msg = "Can't find recipe file for %s" % recipe)
         return os.path.basename(recipe_file)
 
-    def validate_layersjson(self, json):
-        python = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native'), 'nativepython3')
-        jsonvalidator = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native'), 'jsonschema')
-        jsonschema = os.path.join(get_bb_var('COREBASE'), 'meta/files/layers.schema.json')
-        result = runCmd("{} {} -i {} {}".format(python, jsonvalidator, json, jsonschema))
+    def validate_json(self, json, jsonschema):
+        staging_bindir = get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native')
+        python = os.path.join(staging_bindir, 'nativepython3')
+        jsonvalidator = os.path.join(staging_bindir, 'jsonschema')
+        schemas_dir = os.path.join(get_bb_var('COREBASE'), "meta/files/")
+        if not os.path.isabs(jsonschema):
+            jsonschema = os.path.join(schemas_dir, jsonschema)
+
+        result = runCmd(
+            "{} {} -i {} --base-uri file://{}/ {}".format(
+                python, jsonvalidator, json, schemas_dir, jsonschema
+            )
+        )
 
     def test_validate_examplelayersjson(self):
         json = os.path.join(get_bb_var('COREBASE'), "meta/files/layers.example.json")
-        self.validate_layersjson(json)
+        jsonschema = "layers.schema.json"
+        self.validate_json(json, jsonschema)
 
     def test_bitbakelayers_setup(self):
         result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))

