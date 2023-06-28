Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC35C001B1
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.17566.1687961593505481702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EQGM1iKV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b7e94912daso21614735ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961592; x=1690553592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTk4gRRa6hUPTnhQXnxmxgW9dEm5jgMWXprHt+KBi8E=;
        b=EQGM1iKVSRnhFqpCyWI2b2U8oaOmsv0tgzK7TmdGzEFPMOJOIZtP/wzY15GVk0nAF0
         XKCMQtAkFs4PXukB6bcVihyA6EGlpaEA93uQ1NyeQY3eIcxZwbjacBRcxWAeV7wMKGYM
         vfRaigLVYrdYXvqrtuhHFM6GNPwRViFmAnDip6qyFbeLO33xgp8W+MBJ1IiZpcRill4V
         PML9+ZHXaZJTqc0pk5/61P9QbOP1fxlK5PtJdAL+sQ3PUotrP9e4qBlvI/d8JgVOAOXC
         Hx0wmvurA8L86Qj5D3U+CCwYyTONjx+vh7GWXMlcFyyov4cbJ7qubO5rszTATaG055XA
         AD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961592; x=1690553592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTk4gRRa6hUPTnhQXnxmxgW9dEm5jgMWXprHt+KBi8E=;
        b=dCRoz8qkG3lYlP1n3hpMNciZUod9Eu57kZA3eBmUyaBqTt2Et39S2alBykXyyOjetq
         cPq7HuxfC9g/u/zA3qJnGXezK6e4SHkisO5LOh6CC943bAOIRHzrNvwc/K3eakqVaz4B
         4HknJUz5ZStk0IT+hqkBi8ReKX2kELoTM9WUkXC4lDcXKlvhYK88KpvR+U+9gpbgcAVH
         9/ovdpfhq3IGlwSyTh6+khzEyUvQgDEP3iMg+l9Q3lClyk9tDALyMyt5+Nn6Itd4B9y8
         bAbW1LZkDwXptDXoRN8agz0/ldqT+62W3inGD89keL/zHJ4aAqQR/fSRgwPErzkDgEnP
         Uthw==
X-Gm-Message-State: AC+VfDzv200syeujCYSsQGpS7ifENN79pPeEYkQD4YIgHC3IE4fufb/A
	Nn3huPYFSsVHH4KMRWVAdXIhF2t6QDiG1/GEaLzxdg==
X-Google-Smtp-Source: ACHHUZ7izzUzCLY0usMizAGexp+pW9VT7uLKi5wJ56jEEvu46cSFEn0VUwvnoHhIvxrDHGAtV8jQPg==
X-Received: by 2002:a17:902:8a90:b0:1b8:4199:edfb with SMTP id p16-20020a1709028a9000b001b84199edfbmr911410plo.25.1687961592633;
        Wed, 28 Jun 2023 07:13:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/29] fribidi: upgrade 1.0.12 -> 1.0.13
Date: Wed, 28 Jun 2023 04:12:32 -1000
Message-Id: <7e4915c4be7dca35a63a912a55bcfa525a532e22.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183562

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Adding missing man pages to the tar release file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0f6da8601fd4d992550e8afe7b09ba7c491250fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb} (90%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.12.bb b/meta/recipes-support/fribidi/fribidi_1.0.13.bb
similarity index 90%
rename from meta/recipes-support/fribidi/fribidi_1.0.12.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.13.bb
index b29c47822f..cdcac9315b 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.12.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495"
+SRC_URI[sha256sum] = "7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.34.1


