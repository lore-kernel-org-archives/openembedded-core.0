Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BF0CA0FFA
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 17:30:54 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.28128.1693935053450251367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 10:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=EL6STt/f;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4135d72c75bso18653581cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693935052; x=1694539852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Afw1CjcFA1BZ6L2jBI7eeym7gAore6BTMn+Y/NaFOs=;
        b=EL6STt/fZjnl3aCYQ+Ot26MU0cHuJJbVmvMNSXxGyOV8wjCLJv2bahMXMylUScKaBq
         50iK0bIFpr39H8qIGmgPLCOAl21D0GQzzkBSU8EWWrrYAVWGkQ6DPMFVU5n9Wa94XWHt
         VsjX/MC5JuB191/+QWXJeA2imSWbLtq0304ukgNqWqApsTR93klR4LrKzl5XgNwIMlEq
         bxsgi5Ma/Zh1OUoImzmaVOZ544EMeFdTJtGrWq46dtl46sFdTXM1+NV8Hn9Jtq4mWuSE
         T776g02fzD5BJHPsaXKrONJrO6PJE8LQSHf1Lr+Fb01ToUnVAT9e36cTjd1YeDRG/sSv
         dAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693935052; x=1694539852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Afw1CjcFA1BZ6L2jBI7eeym7gAore6BTMn+Y/NaFOs=;
        b=hca/QE8+/vp2wY/glJvDgOuUC+/B9V7b7iEM+TRQZUGoyWm1mKo9jgRzL+HKtnpBZe
         mC13Yt/oM9mUgJg/C9FQvRyAhcRahoVOi5C0ZKIDn460hKKEEiRa8k9HHefILrJf7Dxw
         QZ0Yl86nBkh3DEZdN4zwgbP3bhs8vgvSCTQcQ3wh541C5vLrILzgH1VupJl4LiqU7XVT
         kYjkYj46ZAO3UbKktjJP8tSntwgd8b9sX9vNpw2VwhST4D6XyiCZl9imReI/y8k81FuG
         5yYrsiJfS+0Ie7DbCDluFPNXQ4jXAU1PwbbksZ6q8KyJ4FUuLItps8ajFuaPRk81iFvy
         swnA==
X-Gm-Message-State: AOJu0YyCor5dkvQwmWEL4qyN0iMktxWBu0/kwGiUIGLfxziXewdVFc30
	hT7BAm153NNay45+Ub4Tul4TTocNh/uLvMu7wPA=
X-Google-Smtp-Source: AGHT+IHEIOvGMSpZXBnlBunTD9MAxT+ia0k0XiHsTzkowy7QJEhNXUkf/SUvSnXhTbrQ1mFxLbosoQ==
X-Received: by 2002:a05:622a:509:b0:406:94f8:ee14 with SMTP id l9-20020a05622a050900b0040694f8ee14mr17740665qtx.67.1693935052409;
        Tue, 05 Sep 2023 10:30:52 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id t15-20020ac8760f000000b00411fcc18cc1sm4479430qtq.64.2023.09.05.10.30.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 10:30:52 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] python3-hypothesis: upgrade 6.82.7 -> 6.84.0
Date: Tue,  5 Sep 2023 13:30:49 -0400
Message-ID: <20230905173049.2449088-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905173049.2449088-1-tgamblin@baylibre.com>
References: <20230905173049.2449088-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 17:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187249

Changelog: https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-hypothesis_6.82.7.bb => python3-hypothesis_6.84.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.82.7.bb => python3-hypothesis_6.84.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.84.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.84.0.bb
index 5df95eb67b..8e3f6c0bf4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.84.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "06069ff2f18b530a253c0b853b9fae299369cf8f025b3ad3b86ee7131ecd3207"
+SRC_URI[sha256sum] = "446ecc9665a23fc67a6d32bafbe4233d77fef10eb90d4ede8ab1e76474a63215"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.41.0


