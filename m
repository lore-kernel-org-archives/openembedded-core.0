Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81408CD5BB1
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1001.1779233430093726319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NuWDVee5;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso34241545e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233428; x=1779838228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4XlJIzQ5ChvhcDMoRDlo67Z6JVWb63GAHO7Dr21kR8=;
        b=NuWDVee5GgzpXo2iaEt1zZMoM4wZdTMxr5siX3XKIWmlphwycBWEKUNOq0yO/mRmnD
         Wb46s4O4VZGTSQdh+PZCgEtNtz3Htj8TWIreTrFYERRgIgeI+8SsOfClmzZQeU1STJiW
         Vytot21dFE5Ky/l7W/iA//+bXNGRY4lDOx1zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233428; x=1779838228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4XlJIzQ5ChvhcDMoRDlo67Z6JVWb63GAHO7Dr21kR8=;
        b=kuYz5wDhQxpyDPw5tYc1A4/i9rGjIY1eL3AW2AAzA8kkmsXI3EQRAACqYprKspgo7L
         81YH0Lpv765olI3u6gJ4L2m29jLkbgUKBpfwBxIRer8xjMh/kTAsjFAoXHi6uOXDOR8l
         YGB3BMLw++CRI35+CkFgBuhrigN/j2CtIc6v9omz4OGtMwIHohFHPfY+Qj+HMTvlBfY3
         KJNL3IsgODy0KV8WttbqcDMQP61S83oe3eXffnLJ5atQdTqyL3nvuQERbwZjz1d9EeZD
         sTBVUxi42/Km/dP3BgnJ1Pos/e+bBGq6YAa0bc+feYs4hIJIJuBBPPzUELMxmm5vJ7Tq
         M3BA==
X-Gm-Message-State: AOJu0Yz7bhxAAQiBNktZJ0QHymJyA5KiLdTSP6L5t5wY7fVzXJdnToz4
	WC7rMQ6TVkUQYwp9xumknbYBQZx8YBE5XaVZ8y45IA5vky9jaxFUxDUi9DmLsOe1gIiH2/OSCKh
	+acVw
X-Gm-Gg: Acq92OGv+iT5To7xw2nPLp1qqi5dofcH4FiKaI0m+RCaFWsIEvkKp7HnOwO/IN0t0YB
	uE0vxuD3yEpYuZ6D++Ex7QpjYx6ubhIOfycKYlptUEIklp2cn5EbLgIGSuv8L+kqsCRh1welu9I
	lD5pt1pq5Aei/gO4r1hDh5j+PLYsg0V2G4fjuAr4Ea7TaWPntuNBDxO3kOj63p/IkEAQihvFg/r
	t150anyQrUlUdPzHiip338L3ETEEUQ6uYjPSB3cg5iLy+NpKKD8TtxnOQBXLnmfv/Ylg/QFejWs
	8AjcEaMLtEAJbZJV1OuG0s+FsP+rUUqniGWa7YiRQOSs3oTfhpgseDTuINNFRNRAMwmd72I3mRe
	uwaMsc4n7QtJA3tBxsKSe4k4+vkd55tDne3blM3Dm/5MjTKmIHg3gL5I2PLIfR6MM9zRlBFBs+Q
	yApgx5qw53fSmhSTuohGMXXdGc2ZO3YG6IrjteWgAIbsXdEVXcoQjuUmoD9CdFp6klgSuzBIzry
	AAMnw9OZNPn/YkebUdqWG7iKt4=
X-Received: by 2002:a05:600c:450e:b0:490:778:4fe3 with SMTP id 5b1f17b1804b1-49007785042mr193034205e9.32.1779233428257;
        Tue, 19 May 2026 16:30:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/28] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
Date: Wed, 20 May 2026 01:29:41 +0200
Message-ID: <b4f2d3c86e25f6eba91ecb3fb3a3ae5f9f7a452b.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237351

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 97a940bfdeaa3f9f4442a6fbb0fabe1ce5eaff69)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c8160434..a70e9dd0dae 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 

