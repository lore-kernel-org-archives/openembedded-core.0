Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F410C5AE4A
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 19:49:16 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.4806.1700250554740140214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 11:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=VLkyB4/q;
 spf=pass (domain: baylibre.com, ip: 209.85.128.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5a7eef0b931so25971007b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700250554; x=1700855354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8XzRhh89sU4jDz9K1gi4xJYb22NHKC0FxDFSvRuF7k=;
        b=VLkyB4/qmf6KTQna2TA6LmEIiZaVbCgZ/4dGW0WpJmImZO2WhJZzFWcEb6ChX4DjVH
         sEJAN56orzD9twrZaqJdZjCptioPOcfmKbyHAVrNiw0Oltt6OsOZHb2xuZmVjM76lpxh
         XwZ6jdpQfJW+M11AwvE9iF0W9RU+0hXlkRqk47URH2VOVO8idkYhejwGzgVjAsYzuAAt
         daMaRH68JKeHrO1aQajWI5YVlozo8qHhvjL515FzAc0w6C66BZyDn1ZAjlaWWjmevaEK
         e/suWhj/6L+2Uj2+lf79x8oqvJ00hN1V+B46vX7HeD1AAXiJEPIEN2NSyINNcdARKhFD
         XgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700250554; x=1700855354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8XzRhh89sU4jDz9K1gi4xJYb22NHKC0FxDFSvRuF7k=;
        b=AIBnMADmOos8VBcTTDhBlnfqvUUg+71LSSbrwQSAdVTSkk9fM/Qxgsnhwur96lhMTU
         RAXWrPFsOhq4ZTVy3nbEqOb8JC8uAL80JLtO/L7KN5B+Jn5BKMHdmT91cbbUSlA1Jy0a
         XLK2VGow0YpQGovytS3yyajtU/Ph1WEAC2tZhbuC1f4lfXTzzAUpmlB2zeG5wTQegLA9
         aE2wRh1x45eBIJ0AKH1TjIw/Eka4aDS24xWbVPDNx8MDD/cx6QOI483PXt3BiAnYFjWO
         me5p3uM23GglfAQPW32Foc1IwEIbpHqm7S95OkMtuAWbp7vi6Xj6orAHbySdEvq4KCqb
         J1jA==
X-Gm-Message-State: AOJu0YwOI5lJxpKXcJM8Zuve1lW6BToMk/y/Xbg2MFGK+Sgnke9TQCf5
	ys/k3rVQEx1EnR1uZo/34PZmdPbt9X/SJNbV68dRdg==
X-Google-Smtp-Source: AGHT+IHnFX+bQqfGpC9FPNJ3uFDye4prpsV8s7KjAavY8uTF2ClpGs3kva3BSNsc+htLvxiw+GzU/g==
X-Received: by 2002:a0d:cf06:0:b0:5c7:47f:59e8 with SMTP id r6-20020a0dcf06000000b005c7047f59e8mr670437ywd.42.1700250553676;
        Fri, 17 Nov 2023 11:49:13 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cc34a000000b00677f8d80f76sm533481qvi.90.2023.11.17.11.49.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:49:13 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] python3-numpy: upgrade 1.26.0 -> 1.26.2
Date: Fri, 17 Nov 2023 14:49:04 -0500
Message-ID: <20231117194905.2080320-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117194905.2080320-1-tgamblin@baylibre.com>
References: <20231117194905.2080320-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190859

There were 45 pull requests in 1.26.1 and 1.26.2. See changelog:
https://github.com/numpy/numpy/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_1.26.0.bb => python3-numpy_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.0.bb => python3-numpy_1.26.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb b/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.26.0.bb
rename to meta/recipes-devtools/python/python3-numpy_1.26.2.bb
index 3ae40a33fb4..00c09b29954 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "f93fc78fe8bf15afe2b8d6b6499f1c73953169fad1e9a8dd086cdff3190e7fdf"
+SRC_URI[sha256sum] = "f65738447676ab5777f11e6bbbdb8ce11b785e105f690bc45966574816b6d3ea"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.42.0


