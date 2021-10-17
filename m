Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A47C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 08:09:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.20433.1634458188049014089
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bkBG3cR1;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 d198-20020a1c1dcf000000b00322f53b9b89so2009835wmd.0
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQuoi8sQS/pcT0mr3sj9r9btfcwDDU8ugfsG/LACLG0=;
        b=bkBG3cR1o75Qpv7UBgYl1ZWK0LRaVq5ZvIZvkcyIfYC4aTfQow/FOl7ytqAhBB5WC8
         06fSwAVGVVmWFY9hHJbF4Xbvss6mOfmtXUr784jBeqnCIFODcTEMYEcLW1QHS9ZWZCgs
         Y8ZvuNhLivlUwHFImPP6wYzWm5DSEBuWqgximbuYNrG8Rkhjv/jneWxdIrerjo2u1Dv1
         FpM8n3H7ndG9eBq+saML432rS4ko/d0k7L7hNXnfC1/7dEe3JyO7OPLW/rpojjnKdJND
         gvFXL744aNCknShcoSyC12zxSqXk/tlH0PdMUYvelN4SwdvVlUgvmO5AhWisJnMxeoM0
         JXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQuoi8sQS/pcT0mr3sj9r9btfcwDDU8ugfsG/LACLG0=;
        b=LmPfHUSBfekX+ZqKb95gee+XEwdRI5gVnb3vdLYnQ4+6sLLqeIi8PH4+wHm7AP+Jed
         SYwgl+SKHoXC64AJAXobk+Ev4LOxEuAW1/SybI9ZRernLWK316QgstYpIUjJUyQtCd7l
         jN2aDQ/unEbnd5wgjODZMMTOqG43Ue3G7XfV7oy4onWuY5l2WUJnL0nTHaElNagd9vr1
         pZN6wYMekGiLSA/Idd6rBLH5mAyRqKNbXRC7C8EFlWRxoc6Mj1Ut8dmct0F1k4b5PnM8
         xFhreSY7AdwP2GKxufbyfc09cps6Tct2csD3RxLIOwIkYgrbEsPlpN1YKIrRMw4oGs9k
         9DxA==
X-Gm-Message-State: AOAM530FIbt5qcq6vA76s4t3L7a8lsxBJVeqL+ZJn874PeqUHoHCndFD
	DIJk2D4GL9vXuGBXnr3F8xRCBqE3YFJ7ON3y
X-Google-Smtp-Source: 
 ABdhPJwIL0/hFgGLbFPrlfTdEq4i85HS4IyrqrID9UQAszSPok8448rmZRnzZklnujG4vSaCy3y8pg==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr37205394wmb.140.1634458186431;
        Sun, 17 Oct 2021 01:09:46 -0700 (PDT)
Received: from slackware.local
 (dslb-002-205-236-074.002.205.pools.vodafone-ip.de. [2.205.236.74])
        by smtp.gmail.com with ESMTPSA id
 e15sm9266657wrv.74.2021.10.17.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 01:09:46 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 3/5] overlayfs: meta-selftest recipe fix
Date: Sun, 17 Oct 2021 10:08:57 +0200
Message-Id: <20211017080859.96939-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211017080859.96939-1-uvv.mail@gmail.com>
References: <20211017080859.96939-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 08:09:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157028

Avoid strict assignment in the recipe to allow overrides in .inc file

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
index 60405067de..913a4d1fdb 100644
--- a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
+++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
@@ -8,7 +8,7 @@ EXCLUDE_FROM_WORLD = "1"
 inherit ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs", "", d)}
 include test_recipe.inc
 
-OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/my-application"
+OVERLAYFS_WRITABLE_PATHS[mnt-overlay] += "/usr/share/my-application"
 
 do_install() {
     install -d ${D}/usr/share/my-application
-- 
2.28.0


