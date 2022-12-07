Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9BDC63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:29:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.29483.1670448574462798649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 13:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KvB0KTS5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so2098486wms.4
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 13:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9k42h6FvpZ2lIPk+JgQgnNsy4CWHXHnx0+wooe/BBmQ=;
        b=KvB0KTS5JgXTtiig3B15fuEjva+UJglUnK+O47xgNyeN9gRUj80EwvQ5OI0crWZDRC
         Nqxyq5y20BIPTQhGeNJgbnpm0MJP8TikrHm1FbH/8aaGzwZbOw8Js2U1JoSSKQCr1y+f
         foZAH3NKXVgRojmNaOYcGx/k7qsfe5R7dvFF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9k42h6FvpZ2lIPk+JgQgnNsy4CWHXHnx0+wooe/BBmQ=;
        b=PPTm7KVRNdI9WIfZY2sPrXN8EdHuYvU3J5F2K80/GzAGTbE45aQRkONhqmeWF41jtz
         oMd+wyhXNSL5ekoSrLHtW3OHU66YGtwSjYY3EyBObpJKWqVdBfr6sD+M0o0XbrW/WXXZ
         aiazD8mvJvryqiZAh/wiPKGDuq4bIheWoU9mOVJX6RsRqDNUHRFoMSUCpiD22q/QqsyR
         FCpNBesf0zixQKlav0XZwEpv5IjjunLGgCPQxRziEHMjUaNiXzg/5bsKXlBXFfzknwG/
         4o9976+/sSPPb86WLped2YbQ+p42WF1YjVysoiZab11RF0U+i0HxYhYUuk+o50NKknnX
         86iw==
X-Gm-Message-State: ANoB5pkIdjBTuK6GkcDP+lDYPOxiBeXvgwuz1b2aeAeskyqbtOLbLORz
	sLbl8RNS/ColajrMfPiA2A/b0Ma3mRm2lWKb
X-Google-Smtp-Source: AA0mqf7Dl8C3QOLI/3SWcC/dAVgcS3+iidbp3bd8t211zCZJtIgXsqtsOPjkD2zKcENGHrr/lZWjBg==
X-Received: by 2002:a05:600c:5109:b0:3d1:fb4f:f407 with SMTP id o9-20020a05600c510900b003d1fb4ff407mr2008763wms.184.1670448572445;
        Wed, 07 Dec 2022 13:29:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c4ec600b003cf57329221sm3533988wmq.14.2022.12.07.13.29.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 13:29:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Ensure libpng dependency is deterministic
Date: Wed,  7 Dec 2022 21:29:30 +0000
Message-Id: <20221207212930.2214600-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 21:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174367

If the host has libpng, because of the way we handle the GL dependency in qemu,
it can cause determinism issues. Add a specific PACKAGECONFIG entry for libpng
to avoid this (and the associated autobuilder/uninative glibc symbol mismatch
failures).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 55aced9f9a8..0b24540bf92 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -148,6 +148,7 @@ PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
 PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
+PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[uring] = "--enable-linux-io-uring,--disable-linux-io-uring,liburing"
-- 
2.34.1


