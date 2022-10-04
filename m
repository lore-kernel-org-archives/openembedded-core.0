Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF48C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:18 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.12353.1664898676765256718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1cuBBQHt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so18994860pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=+NTL9LP1TzuAFicjOs9vuM+RHqmORNafw1nIc+DBOw4=;
        b=1cuBBQHtZTrS+v0fDBvGE0Sgz+djdntf82JrPSRAK5+C9vJVoz1sZ52bZ2s6s7QzsI
         zaoSSELgtc3oJ1mXOp4uMclhRj+w703js8V0qslIo+BvEtvskKDyou7Ql4NcSd2f6O4L
         m3V/XatNHs5EQZ5s6kpboIF8qTANWlLDNjDMavO0gqgqPeEQk+oGqNvt+0azT4vv19Sm
         2fHXU9p3iMTD0ITlq8Ybb0jcNkN9InAUYfU0hyZV/Yn2ID/YP3yndGT5ZRGmW4f25/K2
         FeW7t6I8Fc4NuDYEgnLVoau5o62tN8RyGEMlTuVtpY5mB4Ccydu+Xcqhsvdm2y6Vpwhn
         gO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+NTL9LP1TzuAFicjOs9vuM+RHqmORNafw1nIc+DBOw4=;
        b=simMSJhKcHMyPQ8ySbLsYDG87LlSMr2gLSTvTNTaalQqwwoHzReLuShn/Wua6XA03h
         xqRGlJ+cZOcCRNDylNt9kf1Ie6N8lbx6/nOpH6pGDXqJ7Bawg4TQE+o5FqjBeaMxyeUv
         UUDFDnJ8xSkD5th7YIjAStQ+iUg6qwIvCK07MY0ABhNKPAKeopWuyOFJupZTILsUEjUz
         woTld34ASrPGAOPRxYKYmhvWzMS5OMah2ZrpgZiYezZ4DiBnMjMBecpLkPoLcTs4+n2D
         suUlz0QEmZjvrdTsPDlD+DdFVSnw3AXNy3Hb/+0nOkHvWTyIePgMHdqJZK9RYXGf/7Pg
         Z4UA==
X-Gm-Message-State: ACrzQf15EPRmvuy+R7m5z2iRd0hs9IbiuefuCl78cQH8KDoduvalkjPL
	74zF+JFyxr2mzKXUcc/ePVWPzMojUTJazXNh
X-Google-Smtp-Source: 
 AMsMyM7w6XaE7w53IoyRJYDLnt9GXv2c2TUUYRqqMS7uIChQc5cR3bW52PxV9b3KXSvC6RayeJA8Gg==
X-Received: by 2002:a17:903:1211:b0:178:a692:b1e3 with SMTP id
 l17-20020a170903121100b00178a692b1e3mr28421520plh.48.1664898675828;
        Tue, 04 Oct 2022 08:51:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/18] webkitgtk: Update to 2.36.7
Date: Tue,  4 Oct 2022 05:50:33 -1000
Message-Id: 
 <d95303abef02f3f0e479c3b007f47fc72a9d2d49.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171411

From: Khem Raj <raj.khem@gmail.com>

including fixes for CVE-2022-32893
(From OE-Core rev: edbfd06927ef4a9bb1ea1ff80fbc901ede89ce42)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
index 37b977f9ba..026e24ae39 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
@@ -16,8 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
-
-SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
+SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1


