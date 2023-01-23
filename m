Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C92C54EB4
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:06 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.34088.1674440525460959401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jguGpjea;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 36so7939768pgp.10
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tghfiAKJcmtzLTqC4FGGmF3p0tLgw61VGSkJgL7J0jA=;
        b=jguGpjea3z0Q66aY+bjkL1mI47wUTS2h0MBFDN4KqJndmdC4YevjL4JGGnKq3YuOjc
         ir7u/BAU5Newn/52y7nbcuZk8uuWUp0t0EJ3kj9lbVSf4rPkQBIPnTxYM4510LmaF2Hv
         07wTK/BBN3uI9u5FMX3MLuEQW4kZeDx+2EJkWFZgupUuwCcClinMZ6Qgz0+bvHUsI63+
         /qmmvDqSnBeIoG43aX3I84gnrhlGuWsCxNVoRQmLGd+x628bHqz44wrli6bvnDkKtH/W
         GRFxdW28b2C9EmADeZmrlb5uFGZ14f1wsNz8g89VnyTIBDnVBN7/fKg6+RqPrxLcUkPG
         /neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tghfiAKJcmtzLTqC4FGGmF3p0tLgw61VGSkJgL7J0jA=;
        b=dkMlOZQG4yajeyAxXxlSjECikzBvmJM0rbV8WrKhnM0wXtWv9PZw/1nX5O4Ik4yEV1
         nKKNjdkMSimdl7fJw7kW26ZdnLP9siIlMPprlQqO7PPDGmOQ1pAnqJgwUfycXl5Rae4s
         NnLxGD4EBfEQNG6jPRNKU29lCMlXlAsMqdvCO510cw5cMHYG/1IAW7Mdki7e6MinBOC4
         JbJpmhVyOGwF5uIh5Rkf5yRWHGemdroiqCwpZjztnTbx827WK3Ggorqi8j1LCsq4sRbT
         R3OqXRf6us9TmpnKq+cKpocQFuX3Pd4c6teW+JXai/tPI8ql/BMJkQ4bcoB3E5ftpMPm
         OO1g==
X-Gm-Message-State: AFqh2kr3RUnyDUrIgWj9gDOoHO32jLbvkXJLbEBfwlE1NBaGQHc2/LO1
	6dE2OnLheoNACx0XDGYLFJrebngXH6kHg9ahlzI=
X-Google-Smtp-Source: AMrXdXsQxXQQiHubkXXwYXg8dsgeOZRggEjXf0jyZwQS9B4+tjFKLbPo0L9n/o8Rscup8bkHK65QTg==
X-Received: by 2002:a05:6a00:4c91:b0:580:ea08:5277 with SMTP id eb17-20020a056a004c9100b00580ea085277mr24986771pfb.16.1674440524545;
        Sun, 22 Jan 2023 18:22:04 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/32] xwayland: upgrade 22.1.5 -> 22.1.7
Date: Sun, 22 Jan 2023 16:21:05 -1000
Message-Id: <32bdbd7ec920ccc8bcc1a21d57fcd4af40b81fe5.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176275

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c37ec8b2d91605d6eb5228f0a447fb83f111edc3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
index 51d847a093..dd32bd0111 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e317ac1f119f8321654921761420901e4abd95585a8c763ce26af3b045ac1672"
+SRC_URI[sha256sum] = "d53afac6c71953f5cf66d03d289dacd8961da5bd309c1dff125d5955d9db5f76"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


