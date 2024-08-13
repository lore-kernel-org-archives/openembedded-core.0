Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8573EC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 08:58:31 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.67656.1723539503011369616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 01:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJGXBnx8;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a9e25008aso63672966b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723539501; x=1724144301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ykKhV1TbLOvnbq2Y84IweElI5MMjcYHOr2mws5s0bc=;
        b=QJGXBnx8dL1D85lQaIYlcfFUZLRZk06niNNpO3+G3SSXfBoi6EWtMpkI/ARQAkAzRh
         YETiBV0OaCljCXabDViTO3tTHpeTA0CJf4anfLAnDJt64j6O+fmKUyGO1k6dmG4lfryx
         cvyYmEAaQ/Y1sjCtmGp0bci0tfE8IU6OoN3yzMGYoRm+xgBTxzF6nw4R8SfHRkK5biSz
         4TVvTz72AMpcsmwwYj6iFUB/HKgaOWtXyUasCSJpzjwYpVS0m2vPulPX+HSERaArwE9h
         iA5x5ycbsGcQBDvOcGvGI4Afxkwyk8azC3dMcFWO6sFn8g4KuSGDcZUqnOqwMxYNQCc4
         RzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723539501; x=1724144301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ykKhV1TbLOvnbq2Y84IweElI5MMjcYHOr2mws5s0bc=;
        b=T1vFkRdOeixzh+0jAOu3YSKYEGcQnuytZx2UCFjxByjsVQMCot0Q7kTZyMHAGJJqzC
         Fkr/TeKdfxMufafkYFc6XPYrEecJi/8aBpeClKKzUFHyuRc3DzuRjkBLCVPMNida3VIk
         6dtAlKjtO4y630zApyYARFJOgR6+AQvkYwEohjs4TxripkLcSwhVy5WfaH+mgj0JdpxQ
         FzdhMgnefHn5YncrJv91CdqCIiBSgI5f6F+LMZTpENQl/qoXFMnm5831bSFw2EnVx/Zs
         1BSh8oWmonds8nIgYAw8h8m65eonxcxXzdqErfcTC3LkPWz7EKTOE7O3OwQj8BXT2NxE
         o7Zw==
X-Gm-Message-State: AOJu0YwhA7WcnPKAgUFpT+1dm66VnsSBAVyEXPBtbIrF4y42LjgnkHO0
	pzWETjfJu+dIxL9TwrQSnr+d550Ngu40UUcjSVruFv1aMi+svEkHSROSVg==
X-Google-Smtp-Source: AGHT+IFqmYBOlzKjF34/PZabhNh5V/sGrinqCttDPikWTQZYhEbuge7ic00rAxhx2Wk4He+pCARCZQ==
X-Received: by 2002:a17:907:7d90:b0:a7a:b9dd:775f with SMTP id a640c23a62f3a-a80ed2ca736mr181231266b.55.1723539501023;
        Tue, 13 Aug 2024 01:58:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f4cfd9sm51145766b.24.2024.08.13.01.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:58:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3-cython: fix upstream check again
Date: Tue, 13 Aug 2024 10:58:17 +0200
Message-Id: <20240813085817.4163723-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 08:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203259

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-cython_3.0.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
index 29236646415..1a42cdcdd0d 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 SRC_URI[sha256sum] = "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff"
 
 inherit pypi setuptools3
+UPSTREAM_CHECK_PYPI_PACKAGE = "Cython"
 
 # running build_ext a second time during install fails, because Python
 # would then attempt to import cythonized modules built for the target
-- 
2.39.2


