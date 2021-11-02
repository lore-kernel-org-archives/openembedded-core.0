Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A35C433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.6593.1635842599826419864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KSiFtMjY;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id d24so1452134wra.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7q0VyZ6oZoWI6EvIZw++Eiy4WVTkmu7O58Bo4d5rEu0=;
        b=KSiFtMjY03oYC3Q/+wNJPtEpm9kBIJ1f4P87e6VfW6ylKnPyTyymT68l7PrNZlRUMn
         GESytLBwLgdxU53VZHJ+wgolk6oQcZjA6M7WVUTylHgEUY4xPsdrYZ0K6IYG/VrR2XXt
         zNdGxTh5pyXsGgIOwKsymlwuEtRCkdO5kQi1P4R+6il55vLdDQevFmGfybvgR6FkExE+
         LrgfdySGrvrX984v+rgQkd6S+8GQUhw5pa6VgDHYuYpM0YOIyVS+8Vy9CteAJ09uSCdT
         kUqp2aFb53Ch7GTf8onRLVzvdfKRke6VoCb1V418wgF/1RxZ5j8gI3kBfke8IUwKXAdA
         cDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7q0VyZ6oZoWI6EvIZw++Eiy4WVTkmu7O58Bo4d5rEu0=;
        b=ypQZoBqouFmSenxQINlgnfXtDMkd3O1ELKQUWUZlGABmsf/7rHOk/4+GBRckj4KYzl
         YozCah4CbjbRElgVObvQlF6iXmCY2WITqqVDC+uk9wOFurVE83m4CCDmDo/NTNulqLDa
         mqGXP/UY+/2quRAXqpJs4gEjMtiEk1bxjWuCwdhfFnXJ9RpIny/H0658ZmsdD0SdASYf
         SDO/VtNuszzpK7jYoAJxrcUPnB2sRPNaptzorBrea8GgdZvXmCOmpr+dPRo1+6YGnDzu
         KDhN3s/aNcVMmbxdFmIVbXsTQwppzgAnShS+huQ3XV5u09bxftCtWsikm5oJ3MOs36gu
         TONw==
X-Gm-Message-State: AOAM530u48xiA/ZHP95coZIgsr3IzM7Ecn1hgPkZki21+dR3tG6KXWUq
	ppYnDSSnSuXD7nSI5KRN9je3yK97VJ8=
X-Google-Smtp-Source: 
 ABdhPJxf4h00nnAiSkY3qziJCFOjG7F9T/9nx4nHg+2Y4DzRnQltRJxJ0r9duO5WXlrCvXGLBMaSYw==
X-Received: by 2002:a5d:4e0f:: with SMTP id p15mr4102164wrt.48.1635842598511;
        Tue, 02 Nov 2021 01:43:18 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/33] nghttp2: upgrade 1.45.1 -> 1.46.0
Date: Tue,  2 Nov 2021 09:42:51 +0100
Message-Id: <20211102084303.2974802-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157759

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../nghttp2/{nghttp2_1.45.1.bb => nghttp2_1.46.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.45.1.bb => nghttp2_1.46.0.bb} (93%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.45.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
similarity index 93%
rename from meta/recipes-support/nghttp2/nghttp2_1.45.1.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
index 3de509a27c..972ff2d60a 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.45.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "abdc4addccadbc7d89abe27c4d6427d78e57d139f69c1f45749227393c68bf79"
+SRC_URI[sha256sum] = "1a68cc4a5732afb735baf50aaac3cb3a6771e49f744bd5db6c49ab5042f12a43"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.20.1


