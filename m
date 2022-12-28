Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAC6C53210
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.177175.1672213053923962086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B8mqVYTE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id ay40so10746503wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fb5TbWGH3+V4zxT+G+Cm2IY41nKhmfYQHmnCrgwSId0=;
        b=B8mqVYTEI2rRixeXi9lanuP1YLk0JV9mS2El11F/3ag7IoG0kApTZAAYWC5CJ2XxWE
         QTwWUhm7T90BhTevnYqEtA6ZxmPjMrQSukrkis587wVBrF6oqX1chikAKS5SAEpcdZe6
         JukZxNMXS20kVy+qv3wWX4MpVIlnSwaZftdJqoK/GjruqYYUyHBy3ulgvnbWwMT0Y2qf
         5qALvEi3nS11Avmvg+ZkdAt52j5e9W58nshAysn3Zqep7Z0afuVjhZuVIaVgvrgJffps
         g6xKHp+YgUZ79f5br+cVqYjJJteA0FtpUzCNr40kl80cqus0MX47d4X06stjaLhjknDo
         YUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fb5TbWGH3+V4zxT+G+Cm2IY41nKhmfYQHmnCrgwSId0=;
        b=T857VC6E9z8R3sozsnJEljThKebluQVzdJx7M+fBQ32ZbjFKZakNvDPyiii+FQvh85
         x8l3CUA1VZYCi+bo0QcBYn42RtQ5wPtzZBE+2UlL5QSoHeiODlwMhF/fq+oUT//FW2Jw
         UBNokVoIax1rEPDSH7Apu2/YXq/mY8+nAJ25/LN1VgVMi9nftOtLEOn8WFwJG8pGY89N
         nVSEIDjjgWFrEKfjFAw5prXhze6MVH1PHpbTL3leHXnOLK1FXB1/Dc585rcCFBbHxK2O
         HEiBsv70ZXZFWZaYxiB+4cQm8jmaVv3I2nuVFyXX47lWtR5GCgk223EP+R8wEzhGYtO3
         A7Fg==
X-Gm-Message-State: AFqh2kpZdprxziKj1Fzo1l+PXar4Iw8OM3XCoc7WZ+bHAB6sTg/QP7x2
	egEbRyAOiMCaCSPeocMoeKjc51HGb5M=
X-Google-Smtp-Source: AMrXdXt1WlR+ezbD2sqIJulhoOl7MeRT4i9kUx5XIJQz/+dRl55y8+DVK7wMUJGjLKXQgIu45xnj9Q==
X-Received: by 2002:a05:600c:4191:b0:3d7:9ae7:e4f2 with SMTP id p17-20020a05600c419100b003d79ae7e4f2mr17444652wmh.35.1672213058169;
        Tue, 27 Dec 2022 23:37:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/25] libice: update 1.0.10 -> 1.1.1
Date: Wed, 28 Dec 2022 08:37:09 +0100
Message-Id: <20221228073721.3454255-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175052

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libice_1.0.10.bb => libice_1.1.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libice_1.0.10.bb => libice_1.1.1.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libice_1.0.10.bb
rename to meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
index 44339eb27a..5c8f732fa3 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
@@ -20,8 +20,8 @@ XORG_PN = "libICE"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "76d77499ee7120a56566891ca2c0dbcf"
-SRC_URI[sha256sum] = "6f86dce12cf4bcaf5c37dddd8b1b64ed2ddf1ef7b218f22b9942595fb747c348"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
-- 
2.30.2


