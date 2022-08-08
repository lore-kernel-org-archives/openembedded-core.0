Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74628C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.22580.1659940985208328378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jIgpPduB;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id qn6so2992305ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X3H8K0OFOjZo+9dn24o3kZk73j0hwjdXulsSk6INvos=;
        b=jIgpPduB6h58qJ9gKp2zTtXaXD3rfsCZq5dS8mhcA1cnZ7a6e0D+2+279g08yH9pYT
         Il3hClW8MNKDgyIz4zGzN3aswoiT5ppHwxMh5+ld/YlTBNajnUQo2UFqGukbJlDNReFh
         Kxybe1YsKMvHSXU9pWwgQr+YumONJMVW/PoHxV2fgmJJcp5nz0kXbkEwdiHzlFXdFWKW
         5zGkcSpBKH0NnPbCTkC8vq4tZ7ueaYOMBN+ohg7qrURHX5+ipU3X5juZJOHoU2dtL6/n
         16dZmIpZWrBGQ+7yQrr8d89LTS89f5B6QTBMf7YUJ2fFf8Mo+R/UjF1qW/l8ZCswN6da
         n+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X3H8K0OFOjZo+9dn24o3kZk73j0hwjdXulsSk6INvos=;
        b=3rneVGRYwRSj8bajmBCuUxQppDoOmZXBl3Thv0lXg30fYe/HS/Gm8jOI8Kke4Vi4lV
         08upaUbZ5Tso4NhRbez5pN9Tj993UlRTTALCPiB3L1vNSTC/6yuOJvtXj0y7FT2x1Iiw
         JLLp6Qr++DemXkVwDSDradc9jDYgfZ3EH7OXN49BFgdme8atpILvLHff5Y1NBlVfDuB7
         OBNBogQmPJuBEu/bpfTcJvE9FcC64iftZuoBrd5GX+vHyOekwHb1LRH7W4SxSYx7Hfkp
         nXDSQnTcQhN+1jdtgT0iKSrRKQ9o1BJ9mys+dik2W/BeEZhdvdMyMg877llbUdmYqRkF
         LQIQ==
X-Gm-Message-State: ACgBeo0WizLDz5LHtizYU4NiQWMftNzFjxm9AcZ5UIUd6tyuxoQcJrPI
	tMPC9ZxlCy4OmOk5tNy599K3RSjWkiE=
X-Google-Smtp-Source: 
 AA6agR6KboLQIXkPb1JU35RHL7biH2aKhwyCldhzR6tiH6QPioInYYyuqcbDmZ1u8a0iWUkIeow8Dw==
X-Received: by 2002:a17:907:724f:b0:731:9ec:10fc with SMTP id
 ds15-20020a170907724f00b0073109ec10fcmr8877846ejc.427.1659940983826;
        Sun, 07 Aug 2022 23:43:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 26/44] libxcvt: upgrade 0.1.1 -> 0.1.2
Date: Mon,  8 Aug 2022 08:42:19 +0200
Message-Id: <20220808064237.3975347-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169050

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxcvt_0.1.1.bb => libxcvt_0.1.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcvt_0.1.1.bb => libxcvt_0.1.2.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb
index 134c40acd1..e62fabdf58 100644
--- a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
 SECTION = "x11/libs"
 
 SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https;branch=master"
-SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
+SRCREV = "d9ca87eea9eecddaccc3a77227bcb3acf84e89df"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


