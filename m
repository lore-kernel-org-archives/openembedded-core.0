Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E110C76196
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.5078.1679003138533580294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dWzkdvwA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso6754659pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3Wg/YKrlBaq9JLEEUjcPIiy8neJ5NdIC1YdtsGCyTg=;
        b=dWzkdvwA9FUI15QOcJvDcpoTp8IR0o+8lNCEmVEJSPvJ74pNi6C4j1+l9wjpKec4aG
         tvXKPnAtTXvh74tliSVWT4eYyfrANNADwgZ4x5YPdlVpv5WCQNnaNZiA5BVV1/JA/bYR
         n1mPQAcM8INjRXVI8Siwhm8hxdFw4mME6oxxI/YfBJbtsq2LJSh4Nf74vk4+dBdEt+9Q
         8+t8/9K2czEH/tFKUpFiTkLkIIdKyMyydgyFsL0FToe3xRc8Xtq7mWcIRMjMYKOEYGP8
         ynxd2kEi8v+gvZjL+eqzzK2YVWVR9Qynkagt6FFMLnn4I1RSfsX0N6hYim0PYKtbJZsX
         Y0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3Wg/YKrlBaq9JLEEUjcPIiy8neJ5NdIC1YdtsGCyTg=;
        b=WRBm8n5w0ghqKN5egSQfVy9HCmo0uTO/M/Dd/9PN7qRb/ZvqzpbBZNNlwyZfZJv70+
         FaueLdUtphUwcfVirECNTNlJHv8nj3pQgZIjvxrm6fl7H3qfzy6oJIslsFhwpBusB3M8
         0AYDwNMj6ecleXivtVV23O7x4aNqPBt8IyZyWaWWFyuqH2hNeh/K6lL2ecTmPqgwJ7F8
         SCff4WhVbfnZm6c1DNafOXihVCrz6TRRyDoMlggVQd0Jj97Ja95PfVPmuBD0EvN2BmLG
         avVr9fOSu/WP3QTNHcmTvaE26rmpvoMi2uf8sRryscpl5J6dTM4ig6FfNTT8HJ4iR8w7
         uMHQ==
X-Gm-Message-State: AO0yUKWlyC1CD2i+0eCK9Z8Vd5ko4gLouACl5YZhFEfFMuCUSBdOxJmc
	kxUIMpA/VgWwLuiPYCKJwp5CLKOmNYfSpzbSaBw=
X-Google-Smtp-Source: AK7set90y/pM5a8AhWVwijwL9gkjs8KOW356pEF971E/6XATVuK8MXKqUTux/QjizVosKmkhI8rJKg==
X-Received: by 2002:a05:6a20:7b29:b0:cd:ed5c:4be with SMTP id s41-20020a056a207b2900b000cded5c04bemr4715274pzh.25.1679003137596;
        Thu, 16 Mar 2023 14:45:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/23] pango: upgrade 1.50.12 -> 1.50.13
Date: Thu, 16 Mar 2023 11:45:02 -1000
Message-Id: <81a0bb83605cc545d93be93b5a234f4d4882a633.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178716

From: Alexander Kanavin <alex.kanavin@gmail.com>

Overview of changes in 1.50.13, 20-02-2023
==========================================
- win32: Add back fallback for empty fontsets
- win32: Improve DirectWrite support
- Fix word segmentation for Japanese
- Don't set backspace-deletes-char for math symbols
- coretext: Fix a crash
- cairo: Apply metrics hinting to underlines too
- Treat COLRv1 fonts as color fonts

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9fcb353216a70b76584a47463d419464489c5a8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pango/{pango_1.50.12.bb => pango_1.50.13.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.12.bb => pango_1.50.13.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.12.bb b/meta/recipes-graphics/pango/pango_1.50.13.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.12.bb
rename to meta/recipes-graphics/pango/pango_1.50.13.bb
index 6779f39c4f..e673366dc7 100644
--- a/meta/recipes-graphics/pango/pango_1.50.12.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.13.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3"
+SRC_URI[archive.sha256sum] = "5cdcf6d761d26a3eb9412b6cb069b32bd1d9b07abf116321167d94c2189299fd"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


