Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD97BCDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 07:37:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.22102.1697701019462934948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 00:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=V4V1XfDT;
 spf=pass (domain: baylibre.com, ip: 209.85.221.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32d9effe314so4737267f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697701017; x=1698305817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9PNxJ66SNNVtTcXZiJVzuGxVXRCCq2DiIeRnr00m20=;
        b=V4V1XfDT2bpmLYu8I3iFZajJu+NqhGGiLq/yiCG0s2F3NWjoFhE5XNsfNYGIB8uUAB
         xrGOpeQPx+tfX0UBD39PpfiYRflCPQ5ZZX7s7zffMqbIJc120AXG1lSneyiBqQ8oCKdZ
         rym8cJz5OGaIwwdRMjQ32y+TbEQmLiaceBNSfjToZL2nU0gXrhsF5cWvAiVmqhFhJA+0
         pygyOxPg3WdNs7/SaU4TV/7wL+zfV748tz+rX4ntWE9sREzsjGaMhWqWFz/SQo20tTM3
         wzansmo4yHwooXM38UzjrDABkQ6dSSASQDv2bnF0yxfe0cOGmg0ZWz/NYrl5gAv963vS
         q0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701017; x=1698305817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9PNxJ66SNNVtTcXZiJVzuGxVXRCCq2DiIeRnr00m20=;
        b=EGB71TBsPGJkqHufJU00Uvp5KxElPnSEM5PAic1+qyfyraSRKlmhWeeh55VRmSz1VJ
         L9VYqkoDp8Z/jRUYFi8ArOATfxSxD8ueZCd19a1GyTP615HGSeJ6QPO9V8PprKnKxvfs
         cVnjbviM+smeboTAZjgYvkDEYNyNAuFR256KrmDl+FdqDw5SLP/5xHpaP3pGckJ9aVFP
         ypt6MSEBBQrUMDFch+1ZMB5HBEVTI6AYGEmfmbQ1zWVQF6Ph/wtntNFhAQQyZ/7dJPiD
         EsPQt10VJpKmkhIFvQwSNHDcWXZ8A8hQRBZ023FEh6RKtIHTa8jegMEa9MyUP9M9Lofd
         zWlg==
X-Gm-Message-State: AOJu0YwSK8lgvV4fINSXDDTG/FaEnhqjLC8tvJQQU7yHoyCG37WoHJ2i
	ut2yEjM6eSKD8GcD7d031gXJLNtOcEX5jP3qBEUGaA==
X-Google-Smtp-Source: AGHT+IGPlqeIOdEyUYc07zEfy/dorQxbkvPC9lqhFFnH+O8JjLARsN+gloHAUkWih6Z8N86363Vdtw==
X-Received: by 2002:adf:faca:0:b0:32d:b051:9a27 with SMTP id a10-20020adffaca000000b0032db0519a27mr779667wrs.20.1697701017454;
        Thu, 19 Oct 2023 00:36:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d6a41000000b0032d9efeccd8sm3809219wrw.51.2023.10.19.00.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:36:57 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 2/4] scripts:recipetool:create_buildsys_python: prefix created recipes with python3-
Date: Thu, 19 Oct 2023 09:36:51 +0200
Message-ID: <20231019073653.1280730-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019073653.1280730-1-jstephan@baylibre.com>
References: <20231019073653.1280730-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 07:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189428

By convention, all python recipes start with "python3-" so update
create_buildsys_python to do this

This rule doesn't apply for packages already starting with "python"

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 321d0ba257d..502e1dfbc3d 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -297,6 +297,11 @@ class PythonRecipeHandler(RecipeHandler):
                 value = ' '.join(str(v) for v in values if v)
 
             bbvar = self.bbvar_map[field]
+            if bbvar == "PN":
+                # by convention python recipes start with "python3-"
+                if not value.startswith('python'):
+                    value = 'python3-' + value
+
             if bbvar not in extravalues and value:
                 extravalues[bbvar] = value
 
-- 
2.42.0


