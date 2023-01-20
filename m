Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03618C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:50 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.82160.1674238289277330223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wiylqW87;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id d10so4721102pgm.13
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82/0DiTxSU1FLhRxGfPYsToGx79taFLAX7mybjUGXbk=;
        b=wiylqW87OoSyuHXzC4Cl5zUa8k8NK2mAmUaihpBv3GH5fWYgt9sLBjfGU1K1J0vMxU
         SdHiHQTt9iv9aAG/9rok1YpTIJBBqAd+zHmRrZjdLu9329dP8YeyPxMPD7SEZivuIVgb
         2rCWfJs7D8Wiq0AnhvM3B7vTCjdUUVctyFH3BesnkxshCtIQrRBLgk3afDFcjuz3Kzfq
         y3aLQ0DLFw1tRY42ELESx0RYrMCNJUD3eIVHZKx1R5AkO+21EuYti9B3kzsZ/NLRolb6
         9LPyCq3RXnsSCA/oU99JKeVAkyUF7wvhnD61bE8bjsrShCcVjS0S20D5upYA36WpOBL8
         6VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82/0DiTxSU1FLhRxGfPYsToGx79taFLAX7mybjUGXbk=;
        b=zSGewHXylsCySrBTfDDokE64bW/J27TfpIKaAlF/SFM5RpY5eSf5SefH/SFCiy/8Dg
         A4y+6ivVVeDEq10U1ZRVv+eSxF1V4PdM49FFg/VdcM/WOxqWZcfOB35iBmVKqvZ2Sriz
         pe9ADVFANujN9UkDvjD21F/CKIjcB6jiFMwT09ExlT4hw1S1tHE6eEplOVEH32Lbyckd
         Caw/yRkhSfSl4md4cx81paFfczLFHr7I2j3Ss1OjZx2XEtdFBTIFzkR2TXMKaqCHPjgw
         x8VGUi3+eFo6Zeq1ZeIQ/WF0cZ4DEb/dn3ZMczz/NAjlk6eDUbc9hUMxvXLoe3nqLDAs
         +OqA==
X-Gm-Message-State: AFqh2kqZwgTxhwV0vH36E7W0t8sXxnkO8IU7lu0LAEQ8mz0xeHqTGYoP
	5hKBsNRtTsbr3v96EOu3wqYCp28TZRpxOc7Q5ms=
X-Google-Smtp-Source: AMrXdXtupSmHeg1/SP6JuGJCY4rL7xxXDWphbdDqwMlQQ3Oam45khW6CSFrPCkh7aRE/5lD420WcTw==
X-Received: by 2002:aa7:9d92:0:b0:58a:aaa3:f72e with SMTP id f18-20020aa79d92000000b0058aaaa3f72emr38942158pfq.6.1674238302864;
        Fri, 20 Jan 2023 10:11:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/41] mesa-gl: gallium is required when enabling x11
Date: Fri, 20 Jan 2023 08:10:38 -1000
Message-Id: <62cd3870fd257484c3be584229c668d095395780.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176228

From: Carlos Alberto Lopez Perez <clopez@igalia.com>

Otherwise Meson will fail wit this error:
  - meson.build:555:6: ERROR: Problem encountered: xlib based GLX requires at least one gallium driver

Related: https://github.com/agherzan/meta-raspberrypi/pull/1119
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7ee2dd98148e5104c52735a9a43e519dc24abfd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
index f2bc8f6b5b..c7c7aa7ac3 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
@@ -8,6 +8,6 @@ S = "${WORKDIR}/mesa-${PV}"
 
 # At least one DRI rendering engine is required to build mesa.
 # When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??= "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
-PACKAGECONFIG:class-target = "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
+PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
+PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
 
-- 
2.25.1


