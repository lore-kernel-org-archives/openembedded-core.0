Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA87E95A77
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:26:02 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.27693.1696717555482992207
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xP7n7udz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c5db4925f9so25416345ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717554; x=1697322354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJFTOkYMvAhkpaRCxmADnrBj1QfB5ZPGiVTcnfaTOd8=;
        b=xP7n7udz200EndPv13dmvMN0NA9Pzx1ywe+RYn0fUxI3Lnp+wgJfat3V2q+LWS6ZQy
         SkcgoU3nY1dACFMWR0Wz9XASUnKJ25PORfTo1C2M2+ik7t6b3NNPMCKQN7dvZCKDo/ML
         iYhyzs6bQlQMcieFc49x3AZ8EbvQpxnSnxQGgKWPyhFAqfFQYvDIJygjtBx+6WceG2/h
         C11B3gJK8cI429WxU5P4Ev7PMBAvCOkQHkkV2gu+qp7hdyl938Y4U7o42+swuUo0VTYF
         uGPJxp0ABEnMzdKHwgHUt1IuhRPNz1tcFuX6a+EVFjgJWKDBejcop8s27OD9lKA2dMD9
         6q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717554; x=1697322354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJFTOkYMvAhkpaRCxmADnrBj1QfB5ZPGiVTcnfaTOd8=;
        b=vlHy0kuVRfdDSnHH+O96TmQeb4qABwXVmxtRbphxqiT/WJ9dT/CXACWyew9BiDSTcS
         ebcAzuMIs0ZZxjVGXTZVQZzNY5sTiGAQQpNsjQ8ytf87MhU0ZmyQ58vUSCrG/fpsNzmO
         vvR59HJnWKGAID20gvvSZdtX23NwzsSBubywMUnuGR3Lto2p1rdO3Y0lqRy+CfG/jjGy
         8OzPbsZCUemaluFc25i+rH2anZakZrY9FeNuuyDVPgJjhZtiBmj+SmE2IdIaCFeEsVry
         Kt+LnTXCZFreCOIuKDnWEVrSRpQ3WkAK6HlvC5fcV9nGehV9Wf7LpaIL/NQK8QVo6s85
         lgUQ==
X-Gm-Message-State: AOJu0YytRVH3G84UA0LAMpSLeFuNeOoctE0Y+8wNV8frKZuK2rex4aO5
	jy/wVINS3ZRftLGHNEmhwxUuvRw7LqHDTULH+Rc=
X-Google-Smtp-Source: AGHT+IEPFhxYOuesY3oubFp3sinQoRr1xojrZZkLOp/4LhOiwE2lnRIZDk03AQBdh6uPEtTDVS/wQw==
X-Received: by 2002:a17:902:e54a:b0:1b5:674d:2aa5 with SMTP id n10-20020a170902e54a00b001b5674d2aa5mr13814573plf.13.1696717554599;
        Sat, 07 Oct 2023 15:25:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/19] pixman: avoid neon on unsupported machines
Date: Sat,  7 Oct 2023 12:25:11 -1000
Message-Id: <dfc65be35a38bc84134aa7d9e3483b1e00b95729.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188816

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ea1a98bcfe30a46898765e41e0fc9ebb0086738)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index a580d73185..98df6dab21 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -37,4 +37,7 @@ EXTRA_OEMESON:append:class-target:powerpc = " ${@bb.utils.contains("TUNE_FEATURE
 EXTRA_OEMESON:append:class-target:powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
 EXTRA_OEMESON:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
 
+EXTRA_OEMESON:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
+EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


