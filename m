Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F194AEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.9106.1689690399127054709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5cBjMAls;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-668709767b1so4184158b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690398; x=1692282398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kt/XbxmG+DaKiq4QLpH7zUl/F8V/rDu/vF363Vfl95I=;
        b=5cBjMAls6MNPUjklApMguWvUBsgB+k3zh7y5N6MQzzuw+1QLRGlcVXofQWsQh6E9Iy
         5bgMz0SfMR+76Y8g5MtSE/6y6uM8Dqs/ErT0A2X8UKoOtAeh8/zunw5WgMfkLB3kOYHb
         tGydZhMhIgSMyxVKyk84netzqDD+dUFJ/BYuZu/TwR+G0S6cbuIpZdkABbF9HULSSfk9
         /9Zu1zej/3ROaqzmjWNebLp6PDnRTw6dzHC4rL2PB4SI71D6D17nacHIa7m35sq2Lt91
         IyIkCISwwuBCjcrI88kdZT/09tpszbaU2bZsXUGb9v91GuO0cTgw7ZtXx7XPtyBAcNOz
         1uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690398; x=1692282398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt/XbxmG+DaKiq4QLpH7zUl/F8V/rDu/vF363Vfl95I=;
        b=Uu7eNzHao293C0GxqmSHHgXqgwP3k94U6XHbz1oBt3Fd33D8AkauH43Dc7UXq9Twpc
         KnZ7VZ+3EQiEYVam5RVLCGa/kcNf0o4fN/M4W6UHY8h43rb6CivYHOdISXcwV/euDht7
         e2WKucB233C9r0Uee7JD31vfvPavzxSuLPq/M0/UZu2q9Zxzm1ZQ62rbag5XDxO+cBue
         O8xyIR9Hl9rtaV2qi0b4pVClhn/fPGNR9DIZNE8nTJlvql1Iw+onbf4sGtSw2OHps8MR
         s1g9N1glvFvIilHARTF4GGK3f/GL7o8zOAQlktUQYBtCAdEMdURORBVSCFA+3BmHheSM
         yAlQ==
X-Gm-Message-State: ABy/qLaNMiLKLz5GBxmbov+cHA9HixjF1YrpnlyKNI1X0cVolvLRWbF3
	rj/7JkO5ekHD+3omZZegFIcb/UG2P2NIS/ov6/U=
X-Google-Smtp-Source: APBJJlE+vW0J/2EcpG20YVw5HI5zDBeuhuYGzPDpEs4uo9XcV/8b36IrizcXUOS+E0Uw/TLu5Iwi2Q==
X-Received: by 2002:a05:6a00:ad1:b0:67d:22a6:2f54 with SMTP id c17-20020a056a000ad100b0067d22a62f54mr3165056pfl.31.1689690398293;
        Tue, 18 Jul 2023 07:26:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/27] wireless-regdb: upgrade 2023.02.13 -> 2023.05.03
Date: Tue, 18 Jul 2023 04:25:45 -1000
Message-Id: <1eebdfba70ceaa8d73ab46c3131d022e53245eaa.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184515

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47438402fa430499864a4b1f1a13eaac66aa21c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
index ce60154f1e..cd3f52fc76 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
+SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
 
 inherit bin_package allarch
 
-- 
2.34.1


