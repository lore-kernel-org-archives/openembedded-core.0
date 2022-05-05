Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC3DC43219
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.7215.1651727152275551165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eubkK3Gv;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id y3so6509065ejo.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OKYoxqN64JoGBztjUcjnPcjty/TTdaGpyoPM4Qp7mew=;
        b=eubkK3GvwIycsM8TqjL3AB8Nf02l7nIA63AMBR2vdggFdwTHTSYPf0kFljJxE1j8Cr
         VCazNLTt7jwNrWcpjvHsVaSChVG9U2eoAp5xBxnzhyJXkKx4sIPEzNPZWO/eedGlFIOq
         XZ4gcGreUe8A/0gz2WZtHgHsVnpcDw2oTmdHN7qRIvbU4EEdRU6OxllbzTg5d0AC6qAY
         vbG9P9hhecEOkbBUpEduSne2gmsNeGCZrIPRlbfV8PxNhDZMxESiqn8x8h26muxkngSg
         ESaBBeDjkJGnyy8wGCo4mqwDuBtV2vWxInC61Gxl7jg3YXFlAhp4zJxLtuU37gKAamkH
         DpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OKYoxqN64JoGBztjUcjnPcjty/TTdaGpyoPM4Qp7mew=;
        b=HN25mzPompGYVVl5bnUlYiBcKlLUHNvBzHkdrGath47UTr8KxPvxfPaxHihg93VUPp
         UqotKfTBwbdCyFGxYZZECVos73438Ad/k8b4IWx5UgppJtQtM+yUyNBB0IcduwMeJTts
         0Ajh8RgoGsp/xuAshj6FUt8NONsdGc9AqN0cPpXKgwmIthxB+gNdv8fsNFhMh1bfxqxM
         MKVkpKzSw6ESiGWRzMDBCbdjzgkEC3Gh+lcA/XMww2hJCm5lYD+qRcz6tOt9Qk21n11V
         Bimg5tEUTphvgMWxcoqZFq8ckPj9Oytzr6lq2q6i+Hm7yjr77TTyGXi5vsx5wgHrYXDd
         ddNg==
X-Gm-Message-State: AOAM533tqlbjWO8ftpKYBrGsGNrOLPMbNm8dY0LxfGVENn/F6fYYMrpf
	j6a7LZyhQ4Ym5NOlBINrdh1Ip8Z1ifc=
X-Google-Smtp-Source: 
 ABdhPJzFU5NR4PTB6bEKPaQTZU0soxXGktulf0RHcyW9xGeysbMbEhmH+O0CIvj3cC1ctFSE+4dPYg==
X-Received: by 2002:a17:907:6e2a:b0:6f4:69bb:7ef6 with SMTP id
 sd42-20020a1709076e2a00b006f469bb7ef6mr14922891ejc.0.1651727175657;
        Wed, 04 May 2022 22:06:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/61] python3-dtschema: upgrade 2022.1 -> 2022.4
Date: Thu,  5 May 2022 07:05:19 +0200
Message-Id: <20220505050544.651895-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165264

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dtschema_2022.1.bb => python3-dtschema_2022.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.1.bb => python3-dtschema_2022.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb b/meta/recipes-devtools/python/python3-dtschema_2022.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.4.bb
index d73e5810b8..7bc89c844c 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.4.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1b92b3b9a31b6e4b8b2be70dbf3065775530bc4c52e991955b67be19741114c5"
+SRC_URI[sha256sum] = "c70a644e0100b5bacd44839a2316291d8eee91f6535a8419459de59fd0fcf6ce"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.30.2


