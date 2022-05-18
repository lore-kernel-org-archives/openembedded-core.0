Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13792C4167D
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.3493.1652871542424809652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F945BCzo;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id f9so3130684ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLW/xterQevpmLc5o2+SHjmzCmU5v8yCLkR8SrViyrg=;
        b=F945BCzoAAreA+o5s3UvS626msr342m8qeOGoqMUOq19c+YFEjhjFhy+jZcTLfIQ0t
         iWuOLEyekSn+WM95f0Oo2FDV/GI/p2iJntuMopFHG+BZ4Ousd6R+LuS3IJanLq796h9U
         W9o16xLMiQFoW1yJ/b8nQUTWG4WT5hM7f1GLVFZ6KZaz6vnPHBT63iRmjNraGPfecpis
         R/DnkQQF+QyGEtUn1Q4ebTEtCiHvm4kLKARuEs+Czp0Vjf11nKiJtGonFMp3KhLQycL9
         f3FKzx83sGBWlYHsmVnwt0/ZochtCS+Bq3b3jJCPTO4U7YfC/fFD1n5N3yWvA9mhmyfI
         oxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLW/xterQevpmLc5o2+SHjmzCmU5v8yCLkR8SrViyrg=;
        b=HQvksSmG0rUO/+aCyhHkrITcDAvQoNJOdx7WY7V5h6v9fDR44JJ7yoVkQhxH4+ee6h
         U/ZsT+0cX9Jl/2Ab21Sgowre+XH4kug3cSozk7QHUFYRLl7zn8Sjl6vYMP1YQM9/jCYo
         5JrcVTqDjGIcrk1uEA41oP/Ai3LK7Mc+CV0EoIu4gDkfS69SyVYntrvPWusV5N0ou2X9
         hynJ2Rob6RINoJIam5ZHHMZAszJ7EQmjkSU63nyySTaTPNqUlKj+F2NY8WYQ8sn1KHEZ
         cRWvjVpb0UH3HtRQE4i/IHVFdMu+J+8CKfRaebeCSBIPTSgklldQ15kYINCpmAFAEKUS
         nEYw==
X-Gm-Message-State: AOAM5302XCDpy+DLF7ZJxi4HMlr/Ju7YC9kN1DTRcK4uqk7f8NrjcaKf
	fXX3mkPkLxK7UpLlIG4/HFMk/rVuOiE=
X-Google-Smtp-Source: 
 ABdhPJxCa2bK/QCUiCGuVOpKbbe+H+ctRI8hVxpUxTYpFQNMgr50zInW198CJjw5ks6EH240fELpnw==
X-Received: by 2002:a17:907:8a24:b0:6f4:82c9:9adc with SMTP id
 sc36-20020a1709078a2400b006f482c99adcmr24228347ejc.223.1652871541044;
        Wed, 18 May 2022 03:59:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/49] diffoscope: upgrade 211 -> 212
Date: Wed, 18 May 2022 12:58:08 +0200
Message-Id: <20220518105843.3299331-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165811

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_211.bb => diffoscope_212.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_211.bb => diffoscope_212.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_211.bb b/meta/recipes-support/diffoscope/diffoscope_212.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_211.bb
rename to meta/recipes-support/diffoscope/diffoscope_212.bb
index c634ab44cb..41f896d74f 100644
--- a/meta/recipes-support/diffoscope/diffoscope_211.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_212.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8e75f3acb181096632e43935ba7a85304703ac54739810b4523919188367ec03"
+SRC_URI[sha256sum] = "744260ccf2bb869c58c50dfab68957dd494b12e446520993d0925b2394ea1db7"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


