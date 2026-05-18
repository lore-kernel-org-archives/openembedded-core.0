Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5014CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:17:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6234.1779103025098775306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZEDi6vWt;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so25618395e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779103023; x=1779707823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+G0Ubsc11xrt8ByJzcyzJgOgtQ7k81UHjhdl1afUUs=;
        b=ZEDi6vWteLpgwUotvOk+6NoLQvO/5Bh/U1tjrh07E9TFYv1yf3Gr+FB+Oe92UhUdNI
         9Drruspegfh8Yuj7Z5IyYNdejB4lmFfMxgAgFBvRP7S+lw7V8hzq0UInxZUsMM+328P5
         FHDZuVVQGAOh8iibWXSoPUGFkbFz3drNjC6rYAIT75VBWIvaEgUWkO78w8J6ncU0UnuX
         Ji3BclC5XxxMo/X2qAiVm15uCDu/v4XwOzLMREUdASGCiS/XagukFooZeJ+rujgDSMjd
         osStvResQNEHyrA0S9czGVJ9O7VrayeV0cvFxnFEqwCLFs8SJNu6KdrCQe+rfGVLo8Ak
         2r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103023; x=1779707823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+G0Ubsc11xrt8ByJzcyzJgOgtQ7k81UHjhdl1afUUs=;
        b=XRL7VfeZAFq8g5O75jx7IrYFy9IsjRGsvnp/uiXsdfRsi2+5OREvjOs2EmAl1zgrmE
         Gr+BX6IlevuArGoyI2yrfP23T/D02AvmoNL/8ouGcywLaSKjaA/XK8cLit0ohsz306mb
         q9dqA19BgEY9Wl4QPxM4+Mu1fqVPVXnWQnd9ukBzAtjo4LlZtj383l2gILzcPX7o3YsJ
         bOMhlBbVVYrtRuJ7s0JZD5UTZ4q8+UUsi11D+PSdX6TbxRJusqMauTj3imYBRNJmyMEo
         zDBq3BDMQGSzUGv+sNuZf61xBHEK6PwuT0SiCQFGYFQgBDFzi2poe2cRA8mvcNUtbtN0
         y+Dw==
X-Gm-Message-State: AOJu0YxlVGXmkrFoVgzbr2hclEQsUVfqWSSVYxDZvaVrO1xsjGjfZQ0p
	Az0I6plYNqqLT03KczIKaJYmBPGIxmfK5CNIKC9GWosW7bRg+bBBJZdS8HTBUA==
X-Gm-Gg: Acq92OFP+Qg0xgZTuRVnUsuVm+Gk6S/Xd8SN/UJPjzGtXL3B1hUfOFpCltlAe94zngk
	DDf6FGQzOH/pWnKXS2+qFnPHcBh3YoGvFFS7DUauMnW2FdkgkqpGfXMDWlFqeTG++/ZIOwEZ/hB
	qgBzUlje83aWoMRRbuatlEiUnRp5oELcD+6hlutffrAlRjlW56splMpmQB32y5JqzwcUyP2FvRF
	vTOxT/jtyFWGlMNXKm5ly9XaWunNB85tfRI5mhiZYykHtmx+neoydwZ8g6HsmvtBC+QZhvU2jk+
	/xZJpqe4uqKQsR589VggnqxiRF3TtmzXIFClbA0Z1S+MFGRSX4bSxpeEx+aBypFbB23GFSUBi+/
	XUT3xNrfnGzm7yHvTnGT7f4mLXyrZJj2rnDDNnRAzwLZ9XEK1ZMImds6gYUlE/iQ2B99EG9fvw0
	+PQIdmLRqPQ75JgRU9LVZhq96luAlxzgIfSDKvcCBn1noug+23ZkjPMJz+5Q8=
X-Received: by 2002:a05:600c:3f1b:b0:489:1c5f:3a9e with SMTP id 5b1f17b1804b1-48fe60e7fa1mr228694725e9.13.1779103023251;
        Mon, 18 May 2026 04:17:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13b4sm37084231f8f.28.2026.05.18.04.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:17:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3targetconfig: pull in nativesdk python when building nativesdk recipes
Date: Mon, 18 May 2026 13:16:59 +0200
Message-ID: <20260518111659.282642-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237233

From: Alexander Kanavin <alex@linutronix.de>

For the class to work, target python needs to be present in the target
sysroot. This was done only for :target builds but not for :nativesdk
ones, and this patch addresses that.

The issue was reported in
https://lists.openembedded.org/g/openembedded-core/message/237188
(but the proposed fix there isn't right).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/python3targetconfig.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 2877665737..3b9333a4be 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -8,6 +8,7 @@ inherit python3native
 
 EXTRA_PYTHON_DEPENDS ?= ""
 EXTRA_PYTHON_DEPENDS:class-target = "python3"
+EXTRA_PYTHON_DEPENDS:class-nativesdk = "nativesdk-python3"
 DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
-- 
2.47.3


