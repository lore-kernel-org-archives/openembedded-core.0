Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB9ECCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 11:57:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7767.1762343849863689993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 03:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BKTs7bQW;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso5612953f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 03:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762343848; x=1762948648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnyjWUSqcflNhAdN5apyy3+oZY1dSfdW/LdaTGateOI=;
        b=BKTs7bQWa8A3VDA0+ekSTqu/cbwa0ssPycmfd/vGJY+FPgwHquu2ZGfwZ3I8y6bMMA
         lS6A6rhtQMLL4nsryn2zRLfdmlx916Er0UHfLBOCNWVqaefMEq6lLXrcXycjxPB9stlt
         B0o0G0OVEf75YXPGnlFa1t6+qoPM4BLQ6fpzmBcZINHK2FA9LVQJcjzE0qY8F/FJBJUC
         UDrLM0/zbzYx30vPMjjlu4AfZr4jcjuDc+Nf8wDfJlBpmDo+zejCOuDAvtbbzanDJD9c
         qJ/wIm0d/F0iXj8qgM7Lc+BjzPgswMZACHsePKBbDo8RV2I6olycR88NDOSfgKLzIT1C
         RNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343848; x=1762948648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnyjWUSqcflNhAdN5apyy3+oZY1dSfdW/LdaTGateOI=;
        b=RABh1uhVoTx4MeVw/alj8aNOQVfymp341hUw8yaOkliZ8MOGxkF3vc6rZax0Zr4yvD
         v62MGL9cdfE/z46eIu10yOz+s7U3nQpf1DLrpgYC6kliFKVwrYiwozvhQSY9kTvYxGM3
         VNmTru+q1n+8moD42Gv7u04PQ9kjwu+DzUEKTz4WQE/p8VLepfPUlFIQ5fkPJC1X8GmP
         SFcz6zAJlsAu9NWeIO6kO7WRq27qa+m1dzvE9esNTQ4rsfdxfWZ2df/o+oOGqb65UlsH
         LeseBbwqnOJyhPydiQ+0RCOd8CECHvHQTBAJgsApK8AiOQKyMAUgnIIu71ZdgxnMDA1N
         BM9A==
X-Gm-Message-State: AOJu0Yzonh4Zl0o5kngf4a6FCt5C2Mg0NJt1v5G+KEGtmkzFJ4QwRp6D
	PoN9/74yDF67gvABeHturKsr0Ur5yDVwgbcOU13PIYfpkWLABDa6SKMBp3LkhQ==
X-Gm-Gg: ASbGncsaeAlyjcxZk3hVlbZF1aZctzUP03OLhM3Qsw+AgOBYgJJOSYNS3Ewt46vHSYo
	dvrPzLMqrvBw8Iw9+zkJMZSR1K0U17UOxMjhSYLJgojREdRHqXX6JrFar5Q0VUG+T7bD+i9DiQ5
	O+6SjuAfWuq9M+Inp/F7BhVjy2zsQ4Zr9Nfz5w38AAe581yS75UzloDg2Mi+PCJc09MgCUVHSo/
	900xQN6lqqj7L+NDcIZ0CFWswrpJ9DQNcxtjrT8yPpDKJSc/bORPovcA+SlQaZ7MX9L0Z8uqSAy
	vCfwvg23XEhh/4Ogz7KbrRqOaH2m9kFJn3sRIdjLfhBh5bZ4e1nls9NK8pYIM4iMWu7muUkyQRu
	UrIAQGyDYbVLSKgGMKZ6pnPgLNl53OYHFGQs7FLGCvbrg5OgfxjbpVlmXm+QrOx/5sNXcmo7/Vu
	3T1YQvaPp4k6zHCssQrtWV3j+wiMnJmUgcHLZIelmh2TDLJmM=
X-Google-Smtp-Source: AGHT+IEoXcMISYIPt9ycegoKdEG+9D0kGI62eW9TsR6T9kH4+FME9E4uYkTZnabjw83N64y2pmcU+A==
X-Received: by 2002:a05:6000:420b:b0:429:cd3f:f43b with SMTP id ffacd0b85a97d-429e32cc2e1mr2426082f8f.4.1762343848105;
        Wed, 05 Nov 2025 03:57:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efb3sm11100191f8f.3.2025.11.05.03.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:57:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python3-dbusmock: fix upstream version check
Date: Wed,  5 Nov 2025 12:57:23 +0100
Message-Id: <20251105115723.560713-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251105115723.560713-1-alex.kanavin@gmail.com>
References: <20251105115723.560713-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 11:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225752

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
index 9592c837276..50c46abc956 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI[sha256sum] = "38754c5ad2ad8f3936ff67d4b058bca416588a72bc094e91ded9f8f401b06310"
 
 PYPI_PACKAGE = "python_dbusmock"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.39.5


