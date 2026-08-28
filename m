Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF1DC61DD9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3070.1787945918191596181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0vxTdv7z;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15268155e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945916; x=1788550716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PHsmVo2PTVBGDma2roBotXz/gusFCT2ruFLTmCLbSLk=;
        b=0vxTdv7zOd1NZXCb9l3M5GQmbt1iPzesVaVVMFHxxeHLjoxo+yOwaX7whQ/XK2aC50
         SNvoRiAHZ9d2999u4xKpnFKKO89HU9UsIxl+V2r6KWYIb99AttBjsiqoKTlntr6QeaEd
         NroOzd5uny7njVm0N6wRZnnWYJB/GldBAwq6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945916; x=1788550716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PHsmVo2PTVBGDma2roBotXz/gusFCT2ruFLTmCLbSLk=;
        b=Vsjpz2hOasWtlgvYkyjlN2cgfxXr8h6onfqr6WBCyjE4BLpIahBQDAPvb6HFv1bBXV
         ijtoeuGtKzjN0MT40YuTEScWYiQ8gCAYtjsYgyN2p/D/gAgiFgBra0RHOc3obvk/N0nN
         S1tile2gMDVFgf9NOM6HcsshEYeCMVcXUehf3SXofTvazSMjQjoVvW4IPsrXkSoamR/Y
         Cg2ncEMbMj4M1Yjoj1xm6eS9alOOjNS1XJvoGHsvLdQTii85WHUMCOrWJOD4D6sx2yMk
         2SGZEg030DcdsOSi68z087oAaRdrWjzPA2qUSNHQ9AWAZ1gxXyJCZrX3BWHy/D27/bhT
         F9xQ==
X-Gm-Message-State: AFuF++m5K4J+fhkV0E2b11ii9BdZ6YgAw2Yvfcwfb14VNYKk1ItwR7Cw
	OuATRNvXXwCh5eaQ3NWjQBcNgdTQKH2nGeAYcBRoljn5cUxjXHcFsPprEf80UQEmxuOL4Zhs8BR
	5/j0ytt0=
X-Gm-Gg: AR+sD13FUEJcbkHvlmTPOMI0rE4XpOd17ERNcT4Kr4Hffq0kyXqFkb/m2tcA7Xehyxg
	agMngdFrRzJ6ldL8RvapOOgS+hUwWxWZtfOyNU5JjOYjqGGvV1dTPlCDeEWac3tuwU8y9aWSV+O
	qKcZo5K5tWL57LrbOsweAJxRp8b0WS7bQr/5W589vrf5O8czlLlWZYpIDec8UISCxZd+oYPvpj9
	fG0m/gEgi7Xv/fYPCLwvUsa4oaShoa4wItzR6sUH7Fka4+SDxfvgbl82xCHXVvMouk7Dramp5mC
	cNfwT48q709lD6fR8Xb3cMxh/FYcFB4rFauV9NvwvF2u8zAPZs8++L9KEMIoT7bYMgDiP+2Q6K3
	kunWh8dT8Tp7UlwfZt0o1A8aghQ0/siM9FLgs0QqjLrfDy4bsVNosk5vOxU9Zhp2aFe1O81Mg/g
	O254BT4IY9ONNFWcQWoDV0NNmvwZwY8+kHHdfbLhyrXRMLoEUNn83rREnJIYuoOcHz+NiCSGaWO
	TE+fGzZdusUXfSbbrxwcFKfYE1eFwyjbppKtv6//EPYVv1FBaRaNSjqUxmlGS11
X-Received: by 2002:a05:600c:3549:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b91c1e9d8mr133190315e9.4.1787945916435;
        Fri, 28 Aug 2026 12:38:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 54/56] pseudo: Add in openat2, exec and linkat fixes
Date: Fri, 28 Aug 2026 21:36:04 +0200
Message-ID: <50c8a38da95afae8160af835a27269cd2f2c1f64.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244615

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in:

 * linkat: Fix AT_EMPTY_PATH handling
 * makewrappers/openat2: Add noignore_path option
 * pseudo_util: Correctly free memory allocated by pseudo_setupenvp
 * exec*: Replace bash workaround to avoid memory corruption
 * pseudo_util: Clean up memory handling for setupenvp results
 * pseudo_util: Avoid a memory leak in pseudo_dropenv()
 * pseudo_util: Ensure pseudo_setupenvp handles memory consistently
 * pseudo_util: Avoid accidental free calls for without_libpseudo()
 * pseudo.h: Avoid accessing unallocated memory

[YOCTO #16316]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90f823defa32477c9dbd91d264f581fdf0ee4068)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 45407b532d2..9f02d905681 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;tag=pseudo-${PV} \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;branch=master \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
-PV = "1.9.8"
+SRCREV = "ca47829825f297d7bf83665c0541a9de4aa78009"
+PV = "1.9.8+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

