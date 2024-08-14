Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793B0C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 05:31:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.91198.1723613478890733466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 22:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQo80/xX;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso47753935e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 22:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723613477; x=1724218277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mV8V9GpN1Xk8jp5yOEE5dnOpWXhvIng7mNImWdmsJRc=;
        b=LQo80/xXmvVMLNDy0DGUX/WwMs1XuWZXnPxofioEtS7RJtUgg5Qg2lPofo7Lu01bhQ
         GsCCUuKxskKg0rQGyNx6D9HZ94axieCHHgPjhg7ORd6GTZet4HQHxv9wLddUUREIn7FP
         OqFgJa5vrv1fIv5ZcxC1M1uIH+l7nFtEWdAEQgxIWYdMHj/yMqUV2irdN3W2Hpo43ktJ
         NdyNrl56nWTNzmQ6WFjuA9iIV2faUPQLPSIZiNMXrJKK29qfzcrSHVGLdk74QnMT2wVF
         XL3neccr5ukF3bqMka8OtcTO118sI1/Bb58tqhBh9rlyw8WEXUqRy/1H4gI0tRfQhGIF
         ubQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723613477; x=1724218277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mV8V9GpN1Xk8jp5yOEE5dnOpWXhvIng7mNImWdmsJRc=;
        b=A4NOnPJ1mwFFFEUFMS76OX3DNHi/3gcvT9QbS+E1V23chZDM08XepYCI5qqp0X7cg+
         5aIREED/5dg5txcMB/8k/m96p7EUxGbCQF4dNM0IhlwX7bPlzW2FoYr98TBej6x/X/Pu
         wLrgFl4+7F67IGQu+VAB6A/bpnDBaiO9NpkfC7NtckGG277lnCbPuZSyORdAdy/Bz0ll
         2cu1FE/g8r0suTv8IURWblUnkP03PBae75LdV2BWJT6DVpqfiipFvafsmmCj1JtQ/GBV
         wRgmJwCrZxQi7T7oocHxLMrHBv0aU2GlqWJbplj0D0wEnmkZCtSyDC1J3EbvOcaBYqPs
         1zFg==
X-Gm-Message-State: AOJu0Yxh0vwhu3XPfdP7h0sTRnbFUFzhmxiMN+2sb1lzwW3dXENiczYj
	onBi2uMmQVU6k314K6gVPigt9U9RO82CNJmhSUgOgZkdIB7KjeAy7vH4Vg==
X-Google-Smtp-Source: AGHT+IHjRYtCzDaPcDZt5nfiIvgSHmPz79Gi1cTl/ivGEB2ChBLfiLimuxEWjdS1AhAEGr3upE28+w==
X-Received: by 2002:a05:600c:4e93:b0:426:6ee7:c05a with SMTP id 5b1f17b1804b1-429dd236620mr9996975e9.15.1723613476746;
        Tue, 13 Aug 2024 22:31:16 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:2311:d410:8c63:2ebf:4fe1:9568])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded4db0bsm8885525e9.32.2024.08.13.22.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:31:16 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v5][OE-core 7/7] selftest: add test_product_match
Date: Wed, 14 Aug 2024 07:30:41 +0200
Message-ID: <20240814053041.4991-7-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
References: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203308

CVECheck.test_product_match tests has_cve_product_match()

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index a40272c919..3dd3e89d3e 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -72,6 +72,54 @@ class CVECheck(OESelftestTestCase):
         self.assertEqual(convert_cve_version("6.2_rc8"), "6.2-rc8")
         self.assertEqual(convert_cve_version("6.2_rc31"), "6.2-rc31")
 
+    def test_product_match(self):
+        from oe.cve_check import has_cve_product_match
+
+        status = {}
+        status["detail"] = "ignored"
+        status["vendor"] = "*"
+        status["product"] = "*"
+        status["description"] = ""
+        status["mapping"] = ""
+
+        self.assertEqual(has_cve_product_match(status, "some_vendor:some_product"), True)
+        self.assertEqual(has_cve_product_match(status, "*:*"), True)
+        self.assertEqual(has_cve_product_match(status, "some_product"), True)
+        self.assertEqual(has_cve_product_match(status, "glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "glibca"), True)
+        self.assertEqual(has_cve_product_match(status, "aglibc"), True)
+        self.assertEqual(has_cve_product_match(status, "*"), True)
+        self.assertEqual(has_cve_product_match(status, "aglibc glibc test:test"), True)
+
+        status["product"] = "glibc"
+        self.assertEqual(has_cve_product_match(status, "some_vendor:some_product"), False)
+        # The CPE in the recipe must be defined, no * accepted
+        self.assertEqual(has_cve_product_match(status, "*:*"), False)
+        self.assertEqual(has_cve_product_match(status, "*"), False)
+        self.assertEqual(has_cve_product_match(status, "some_product"), False)
+        self.assertEqual(has_cve_product_match(status, "glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "glibca"), False)
+        self.assertEqual(has_cve_product_match(status, "aglibc"), False)
+        self.assertEqual(has_cve_product_match(status, "some_vendor:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "some_vendor:glibc test"), True)
+        self.assertEqual(has_cve_product_match(status, "test some_vendor:glibc"), True)
+
+        status["vendor"] = "glibca"
+        status["product"] = "glibc"
+        self.assertEqual(has_cve_product_match(status, "some_vendor:some_product"), False)
+        # The CPE in the recipe must be defined, no * accepted
+        self.assertEqual(has_cve_product_match(status, "*:*"), False)
+        self.assertEqual(has_cve_product_match(status, "*"), False)
+        self.assertEqual(has_cve_product_match(status, "some_product"), False)
+        self.assertEqual(has_cve_product_match(status, "glibc"), False)
+        self.assertEqual(has_cve_product_match(status, "glibca"), False)
+        self.assertEqual(has_cve_product_match(status, "aglibc"), False)
+        self.assertEqual(has_cve_product_match(status, "some_vendor:glibc"), False)
+        self.assertEqual(has_cve_product_match(status, "glibca:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "test:test glibca:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "test glibca:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "glibca:glibc test"), True)
+
 
     def test_recipe_report_json(self):
         config = """
-- 
2.43.0


