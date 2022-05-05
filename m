Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8649CC43219
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.7216.1651727152914044293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PdOcXdEa;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id m20so6526859ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hB1N/i7qn44yRvHCSehUoXbK8FB49DDZow3sBdWO8PY=;
        b=PdOcXdEaQxrDZUg4YV9uR4CdCgyxIzXa3hEipoKNV63vk1bWx6JRIpellzMsazdR0O
         rG2NiogUDwDs1ECMHJ2rjriZWScEYixX7sMIMzah/ISESqVLPwvmlJo+Von5vvVMmryG
         CJWr1N8toFeuvDuQw/1BMMLyJUIx1xZzXErx9s0i9UcbC8nFYUadR9KwTp8yg8N7iHhb
         FK2zz2ljBS9qB+bl5lbXY+ZSW+juRfVjT8mAdzwFmAX5g0s1VgShMgnBHq5sTddvkbGQ
         JwFXudJSEKwbP4Z2AYj+POFuvrQZN6L48NpZfLMe3cCcWkfRU2FLhJsKCh80mcNiGxcg
         ZeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hB1N/i7qn44yRvHCSehUoXbK8FB49DDZow3sBdWO8PY=;
        b=ne80NaEgpIL4TEM+BirLDBi5xAqt0s+ba7eqkOTzdwPYeT7mQS2c8QJDRhZ7j2FMW0
         1ns15HHfjO2m5P4KejueCjFxSPNFNggP0xZkOUXOvJA1B4+eb3mkcct1oDLOfhCb+6I1
         JiK/rPgZNwIbWy4bch/HTmTuYoTOJKmgHvW04stdnmPhgaMamF2du3RHXiQcNb698yKI
         wr/TavO9Lvn+JLindWGq0TSuW81WxvlqRMNwe086MRydeodH+gVUpwxu/FYY7A+vpbb/
         ar0GcXX8rEwzfIIzBAbLnEI4+mUyd80yk4sXeqrtYYH4rX6FS/l4AEZqArICeNku6czg
         CSrQ==
X-Gm-Message-State: AOAM532KAtDa9ZD2q3fiXfnctVxNK1B5BzNO0i1ZlUd7zsgWW7ZH7LLr
	VjXa3vG6pjmjQgXWRTj0OBPCdGCptFs=
X-Google-Smtp-Source: 
 ABdhPJzN0rBroposVQyq9ZJyEhWuqd4/1XrZqyIBs988aXmJZS3gKuD6cVpL+/yurK/DKnpZ/xyxSg==
X-Received: by 2002:a17:907:6e19:b0:6f0:1e4c:b4d3 with SMTP id
 sd25-20020a1709076e1900b006f01e4cb4d3mr24374894ejc.583.1651727164283;
        Wed, 04 May 2022 22:06:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/61] harfbuzz: upgrade 4.2.0 -> 4.2.1
Date: Thu,  5 May 2022 07:05:05 +0200
Message-Id: <20220505050544.651895-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165250

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../harfbuzz/{harfbuzz_4.2.0.bb => harfbuzz_4.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.2.0.bb => harfbuzz_4.2.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb
index 44d42e6904..05d5aefd87 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f2200f177768bdc21445aa09703326f3bbe8114ac083d081fe1a79d305c7ae73"
+SRC_URI[sha256sum] = "bd17916513829aeff961359a5ccebba6de2f4bf37a91faee3ac29c120e3d7ee1"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.30.2


