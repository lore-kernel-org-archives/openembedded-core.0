Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FB0C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:02 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2914.1702391274849026648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EMK7GAFd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ce934e9d51so3551556b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391274; x=1702996074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9i/0V5dxJUgznxcAJoHDyFnUORlEP3+d78lBGrWx1U=;
        b=EMK7GAFdFtClnwA5brgiNRoGP6sOYNAbIv/lxpEpgfmBNdCyFw2/HxJ3osmIpi9KVG
         j+K8BJIDf8sxeewVc8fH1juoYrY8wGOpx0+p8iUsaJdlxdL9fC+IHCCF41yGKZO12BTW
         pUvVLJcRLNN9f15+f8EE0PV7V1uWUONgzUwhXbiWM+aX7fhEeegkvJtwIpg+ktNo5/jJ
         WjHeykOssn+kIfZqhutVhZGkt+fi6wWRk5/zc0xGdSwz1z9lOX30j2e7qFltYkMoxhxN
         0gLJVXpi3/8bHJD3OWmhw1mmH9lCjNnOnVLc5wGK9hVHDvLgPA0YTNHUGuO9RnFgN+3+
         ERCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391274; x=1702996074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9i/0V5dxJUgznxcAJoHDyFnUORlEP3+d78lBGrWx1U=;
        b=fUDFzmdUDNuk0e2zmLU23oPEO7306dsQ3Y9wxOWlAFR1pTESAeDn7ZyqEktpYEYrHE
         7AhXS4WoHH0fUZ8U+WQaODDhbG8SVH64wR/xS0OGdu3IZP/LCeUTISO54EdLPm/jVlKn
         RLd52BX1xoNoL5NA0z2Cjyd3RGiYcuOWgMXFtiXvwJeIn/jpjEFxXDKEJVWWNrixARgf
         hx8BYOpU0qh0FLsL15jXLWBLwz1/iBR2RLexjG5S6tv1qDVrEUKKjHq2TXWj27OPkKtn
         yI7Glk3SP/3eBEQ4GGMBfznwuJB+5eFmVLJFu+RbYb6Tlp5UHDkzjv30lg0tVxUg46fE
         FHsQ==
X-Gm-Message-State: AOJu0YzprftvbNkb3QmP92ZqNpVAqel5w+9SXqN6Ggvs2qu2cis4tSLJ
	R+LVieBzyySEAiDLbY3NDQOnKjpjk/iLujgxbtQ=
X-Google-Smtp-Source: AGHT+IEc+BrHZMnRUg5ILjPSP4MK4FFV5WW/VTKYkv4dvENmLemgO2B14cK0Md9cUunGe1GsaqGnQQ==
X-Received: by 2002:a05:6a21:789d:b0:18f:f81c:3aba with SMTP id bf29-20020a056a21789d00b0018ff81c3abamr3325565pzc.44.1702391273873;
        Tue, 12 Dec 2023 06:27:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/29] xserver-xorg: upgrade 21.1.8 -> 21.1.9
Date: Tue, 12 Dec 2023 04:27:12 -1000
Message-Id: <84236ab1d21b4df62d8ba074fe9f4ac4719a7333.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192210

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-present: Send a PresentConfigureNotify event for destroyed windows
-Switch to libbsd-overlay
-Xi/randr: fix handling of PropModeAppend/Prepend
-mi: reset the PointerWindows reference on screen switch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 82e87caedf84dcf5a933dbfc92718ac1cdd29734)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
index 19db7ea434..43c06181e3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
+SRC_URI[sha256sum] = "ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


