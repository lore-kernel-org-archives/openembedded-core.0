Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3AFC83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 12:39:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.12617.1693399155796768100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 05:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=KIr6EVMZ;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so48929895e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1693399154; x=1694003954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NoGfij0wr6QQ+TCDhq/2pkDEbAVbO1D6ONtC/BatuQ=;
        b=KIr6EVMZj2R6Q1gUpCMIgphgJstNhI0ikR28Df3D9mTeZ/VveSV/TtscfFiijWkLPk
         ZEVqwS2GSHqqzTkR7Qytj5H5U0CsuPTBKanqGVaIWin6NKCX3Ys4ORhW9LD+uWdnbdeC
         xyx2biQFSJwh8h48exs8/GnbCKENZlh4CGxqn+8wGmK8zJroyDGsQTRvrKa4cUbB88w3
         9+S1erE0EZlb2exrNJvTSjcfBQEnCPfrYbINTECBLuARXPeZejJumRNyY1oWhtsTDx+5
         85y8DcgAJq8CotY0hfV5uKt+8+ogC5xyql8S9VBXT2lIh6leecJ6GiGwY67SLrqQhrZl
         8VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693399154; x=1694003954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NoGfij0wr6QQ+TCDhq/2pkDEbAVbO1D6ONtC/BatuQ=;
        b=VZrqsLYpsd4eznMwn3zOP+cv1VJ5hSa83P/5yDfTyoPwVo/WtuDMBBgBg6fpHS7eAT
         xqRlEDm7/KI6y0IYCQmO7qGoRRxZdV+rprANhdrwqz7dOt8t61KSNI/9hRq0yrzmYlKk
         j/7LVLdrvaDpP85FOYPbLG63uGbwDCRlNSaV79Gmf97GN/4wTgvSVICNJSanSJU0oNQS
         7ZXOIHnM/KhmIgQLVFEAaZoxUzttiN8IxwKmTCZ4KyjElDQERe+j63incprcf5M1gPk+
         1H2FaY3nkgD2bx/NzBYOlnnoIL63oLiUVOnARq0Tz+fZ992RtLJ/Ib7xrQ5J9UCJTqtW
         NL5w==
X-Gm-Message-State: AOJu0Yz/Q2YmZxafh+dXYLaa5cl7i4N0n0CuWhKoYYKpzSjDMEPINJIf
	9+irk9IMpmnKjP8CtGm8Btu52GrclpXk90p7V2wswg==
X-Google-Smtp-Source: AGHT+IGJMl2qTvXvPpdOJcHAIFXHaiaxb+6hVjxhEFWuogbY4Uum6gv/FTTe2z+Vn+e4cEKTPyeVZQ==
X-Received: by 2002:adf:f283:0:b0:317:7081:9a6a with SMTP id k3-20020adff283000000b0031770819a6amr1471984wro.24.1693399153997;
        Wed, 30 Aug 2023 05:39:13 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600004ce00b00317f3fd21b7sm16478997wri.80.2023.08.30.05.39.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 05:39:13 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] update_mandb: Point to correct /etc/passwd with man
Date: Wed, 30 Aug 2023 12:39:12 +0000
Message-Id: <20230830123912.2052665-1-pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 12:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186886

[YOCTO #15023]

In this instance (do_populate_sdk with api-documentation turned on),
pseudo is going to end up finding the passwd/groups files in
recipe-sysroot-native which is incorrect and does not have man. The 
solution here should be to ensure that pseudo points to the passwd/groups 
files in recipe-sysroot (which does have man:man).

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 scripts/postinst-intercepts/update_mandb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-intercepts/update_mandb
index a061bb426a6..6bc073bfff5 100644
--- a/scripts/postinst-intercepts/update_mandb
+++ b/scripts/postinst-intercepts/update_mandb
@@ -13,4 +13,4 @@ PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --config-file $C
 
 rm -f $CONFIG
 
-chown -R man:man $D${localstatedir}/cache/man/
+PSEUDO_PASSWD=$D chown -R man:man $D${localstatedir}/cache/man/
-- 
2.34.1


