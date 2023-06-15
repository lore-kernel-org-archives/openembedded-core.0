Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BAFEB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 19:23:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.27508.1686856847054416028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 12:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=kNNtYeau;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f8d17639feso23345885e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686856845; x=1689448845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBYrgVeZmwBmN6riqB+Wj0fpcUracjwoAhnArmIvs9k=;
        b=kNNtYeauix/jTct3MsOfxMOlM7bdIyAuHeuWJBhmhbTPS9pClRPZIYWyTItHKLF9U/
         p680qF0CEXZRdojz4z6hV2D5N4uqXUmyZec/30wC6VT1HzdF4ycyNe2dRX2XfELFCeFT
         4k04bnA4KSYIeS1qIwAhCysWVINZHvFHirQEBBh0hLtQsAfdO3kHp7AdFbRYkvH+GFSr
         lu0jwCV36aCaVtGoyECs3PxZr2WbqUYLfCOSxkU0OC2ftBdeU0LvdeABDkPN3czE8lUY
         U2s0/sstx7iDqfGNiqa9nsnA6hz0W8GySfnlSN7i9i5m9XVaErIEazSAaK4oUQAlP7fv
         jkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686856845; x=1689448845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBYrgVeZmwBmN6riqB+Wj0fpcUracjwoAhnArmIvs9k=;
        b=DpP4WRP7tCQgW++Wo0QuMDm+x2Bs8GAHbS2rgwOc3RvWdNQ1+tBe1jwSuckWQ+uil3
         qrD+JIFfTO+JomwPc6vsuQQkWkRqui8mH/704blMO8RJGPKES3ceWJVQumVWkQXa4o6s
         qUwF/R0dU5M7ft6DlWhUw3cr1KbLmk0AXnUuF2+GIu0c1YMTqzbplkteenVymrrLhHJ0
         pA7ScfY0Hgu+cNnuPWZAa333DxFYb8oqgPJgQ5zxIt3lR2gUImekBj0t29kPLpU8uJtb
         94qaLBL4udKW+PqFMAP7LjXq/tj4Uwyalsu8mrp3ASRudfryd24zhzvm5ZibYsaV+R5o
         o1gA==
X-Gm-Message-State: AC+VfDyvRCm2cy8H7K1nUSc8rP0RZaAbI8DOMk1q9Gp2kZP8ivW9aVDQ
	SZBuAFacgG5mfrIBaRQyAsvf7QH/FCbF4tSWzjM=
X-Google-Smtp-Source: ACHHUZ5pH96puCAZjeeX5y4yCFeZlbkn9xuCPqQdHNkoWVCu/TKzcq4NFJVh1fiYasCiqxIaDydF4Q==
X-Received: by 2002:a5d:45d0:0:b0:30f:bb0a:fcbc with SMTP id b16-20020a5d45d0000000b0030fbb0afcbcmr12477917wrs.2.1686856844947;
        Thu, 15 Jun 2023 12:20:44 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.180])
        by smtp.gmail.com with ESMTPSA id e3-20020a056000194300b0030ae901bc54sm21788097wry.62.2023.06.15.12.20.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 12:20:44 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] wayland/weston upgrades
Date: Thu, 15 Jun 2023 20:20:37 +0100
Message-Id: <cover.1686856412.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 19:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182867

Nothing really surprising here, except we should note that launcher-logind is 
being depreciated so some thought on how that is dealt with will need to occur.

Eilís 'pidge' Ní Fhlannagáin (3):
  wayland-utils: upgrade 1.1.0 -> 1.2.0
  weston: Upgrade 11.0.1 -> 12.0.1
  xwayland: Upgrade 23.1.1 -> 23.1.2

 ...ayland-info-Fix-build-without-libdrm.patch | 42 -------------------
 ...-utils_1.1.0.bb => wayland-utils_1.2.0.bb} |  3 +-
 .../{weston_11.0.1.bb => weston_12.0.1.bb}    | 10 +++--
 ...{xwayland_23.1.1.bb => xwayland_23.1.2.bb} |  2 +-
 4 files changed, 9 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
 rename meta/recipes-graphics/wayland/{wayland-utils_1.1.0.bb => wayland-utils_1.2.0.bb} (82%)
 rename meta/recipes-graphics/wayland/{weston_11.0.1.bb => weston_12.0.1.bb} (92%)
 rename meta/recipes-graphics/xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb} (95%)

-- 
2.34.1


