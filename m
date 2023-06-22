Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78D7C0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:09:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.13176.1687444944885894254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=1Sb79rHz;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fa7512e5efso6509745e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687444943; x=1690036943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYI37Ye5Q+SfaHAyPB6pIRZPSIDBYuN7b6dqMBbfGvM=;
        b=1Sb79rHzAfNHmHyNlu+CaSjjjBsUie2kL0/dAcI+xjZKV6CtXb1xN1JxEIPpzXttpC
         CHTXABT17Wa8smgApnYii5dRWNGMFv8fh+NgJac1gk1Vh/mHNi3OaLyHroWNDXdvHwVq
         LXFuDr0LA+sSu0qF6504pvySLSjeqvHfdVxUfNGuQLEhqFYkvXVfYGchB9SKSDLgYHZ8
         uYg7s9dG3I+Ye+tEWy5TlVdUJy0NhrGnHJfux5YWt0M8TEzd/AvZZ84ERhW0+9YxXaeV
         xBFIKIteoizeEImx7BTJjQu1TwY0nSpR1C+jwn7jQIBigTlIhhPAc4pi+wq0blgDiI+a
         /RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444943; x=1690036943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYI37Ye5Q+SfaHAyPB6pIRZPSIDBYuN7b6dqMBbfGvM=;
        b=TKdnHaF+J6fbtsO+yCwxNxGamErGqaUJBAUaEsxjlH3uh5wFjKQJGvuk4RTv/jpYVr
         vsggGT8HzS85oSFfsFX78QmQEPQGDuyhhwLu+ZCRcwuiifOpoDaviTc/ai0LX+S+6wBh
         zCm1c9x5MeKIhgZMl7NrYOnCORosghzOcCPQ0A2uG9I2aOji7IF0JAxsjtZcTpY09rOP
         Ji5qX36y+2ik2yRocvCsOz6o8pKaI6N6g3z6rmDqx7S+gD6TQdqTwDn4dpX989MalByW
         iJEbqAOqjlqfvN6FHLEOexE1LQwgVyD9bJ5O+FDU+DeW7gwSkBxzyQ4F27aXaFNY+aA/
         NTSw==
X-Gm-Message-State: AC+VfDx5grnTozhVQ264K7OwfsxatNAbIB2J0LozVZVhOB+nwrKql2d4
	r9beNMnC1eIbn5SOpwfgb8D7rC0Xm8uTQpFM9GU=
X-Google-Smtp-Source: ACHHUZ69DAGcwRdBOY3YlZfTg+Xm9XzIOu1Iho+BCChe+zadBNIv0PE3SQvzFQIfcbXmpiFSye7sJg==
X-Received: by 2002:a5d:44cf:0:b0:2d2:f3e3:115d with SMTP id z15-20020a5d44cf000000b002d2f3e3115dmr18481889wrr.59.1687444943299;
        Thu, 22 Jun 2023 07:42:23 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.167])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003f8f884ebe5sm7968951wmc.2.2023.06.22.07.42.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:42:22 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] xwayland: Upgrade 23.1.1 -> 23.1.2
Date: Thu, 22 Jun 2023 15:42:17 +0100
Message-Id: <89841bd1a686cc06eb8995b7bb12dd703f260bd2.1687444823.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687444823.git.pidge@baylibre.com>
References: <cover.1687444823.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183275

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
index a065e92f01..de516536d1 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15"
+SRC_URI[sha256sum] = "bd25d8498ee4d77874fda125127e2db37fc332531febc966231ea06fae8cf77f"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


