Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BF2C54EBF
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.176133.1672213054614919195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eaq64oWa;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z10so14200512wrh.10
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj3FjQ7pjqiLmRPg6+pWHV7Y30gxsP88SbLHHUd0kHQ=;
        b=Eaq64oWai8ryQ7R9LNLtgxf54cls7nDB2qM0q7piK4fa3TWwTOsdhQaBdzulfMWgG/
         G67PHKZ4fOQnZm7M7QguApe4ZkLRh8aoEe3SB6WXQXAgD3ht2H8KPPzumIZoNcxGfnsR
         mEMCn/kkJ0rqsZpjpLjcI4E9ZcUs6TgCYOZEQkuYkPRa9Q223CMyexSapWPbyyRUfAc7
         GDq3OjmS2XgSPal3cLfdXxXQALIAG89/L/Y2pBxEXN6jpSl9f1DRkwwlI1CyCp2ipCGH
         wmskJKAh6+4+syKD8t6nhsih4R65qpF6b69dQnDraXwrMqbc1rfw+kqnZrKN3vbiL3NP
         FLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj3FjQ7pjqiLmRPg6+pWHV7Y30gxsP88SbLHHUd0kHQ=;
        b=pPvUeeM3igeJV9tUDV69OBjDIRgaRHB85dG4ia6/AzJy3Jv/c8cFPOm8CKaW4xGBfL
         JVe2OOCcCcotSLW4abjTO5XHN8EZkgshPpE8Nnq5kceGoH1TmwP2Qtoq87P/buCuHEI+
         RzjKBJVWBGMvd1RLgjQs+q9QALxiIQu/vWDyaXguOU5M+WfdRqBIAwD+8rt5czBuRSI2
         ZvA+dup63Ro/cnwjAIP7AoIUPj61Qx+sWLTXh85g0cLiMpMSuU55tRwrWDNDfzDTTBfy
         QCR9H8G8MoOdoeeYpvjifvFAr3oOHHWbbtaqxxPssyPKmhxXiTUvsJ9hpWkwINLJarPX
         0Otg==
X-Gm-Message-State: AFqh2kp5NXdlVPvwGcE48reenBl6kJyQKUu15lr5XcgLVM8FblAPyXVj
	GH/qT0YpKc0cArRBS7NGPGPb4mN7gRA=
X-Google-Smtp-Source: AMrXdXvArVqim1W721XYkG5e6FA4Ab0lJnCeeP8k8ui7eo+a9r5+PVrXgemrkJQZpG+UDAqYhgkpoA==
X-Received: by 2002:a5d:4849:0:b0:284:58c:b125 with SMTP id n9-20020a5d4849000000b00284058cb125mr3138957wrs.52.1672213052995;
        Tue, 27 Dec 2022 23:37:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/25] xhost: update 1.0.8 -> 1.0.9
Date: Wed, 28 Dec 2022 08:37:02 +0100
Message-Id: <20221228073721.3454255-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175045

gettext-native is needed for xgettext executable.

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xhost_1.0.8.bb => xhost_1.0.9.bb}          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.8.bb => xhost_1.0.9.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.8.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.9.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xhost_1.0.8.bb
rename to meta/recipes-graphics/xorg-app/xhost_1.0.9.bb
index 26bec3f0dd..d54e6cae65 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.9.bb
@@ -9,12 +9,13 @@ and security. Environments which require more sophisticated measures \
 should implement the user-based mechanism or use the hooks in the \
 protocol for passing other authentication data to the server."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=8fbed71dddf48541818cef8079124199"
-DEPENDS += "libxmu libxau"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b1f81049109f21bb3c365d9f42f79f3b"
+DEPENDS += "libxmu libxau gettext-native"
 PE = "1"
 
-SRC_URI[md5sum] = "a48c72954ae6665e0616f6653636da8c"
-SRC_URI[sha256sum] = "a2dc3c579e13674947395ef8ccc1b3763f89012a216c2cc6277096489aadc396"
+SRC_URI_EXT = "xz"
+
+SRC_URI[sha256sum] = "ea86b531462035b19a2e5e01ef3d9a35cca7d984086645e2fc844d8f0e346645"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.30.2


