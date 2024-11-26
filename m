Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5882BD6553B
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 18:00:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.52802.1732644043705113083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 10:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=o67ienNl;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a044dce2so26287325e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732644042; x=1733248842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5/naeg0dBBusGpVzdgpGynpZlX14LfA7bFms+Z0c58=;
        b=o67ienNlOWOzO2FdSIlDwQWtRRgMRaCIkQPYp9aLJVa/CzM1taI6pw44jR6RA1Eruv
         1ImKNsSBmaEbJcQSCdSd176+rIzINiOpiuOokSQEa6ZMVJ+ZZSz2ZNgs1kHAufj5cpzi
         OfOQbQBiq5dc3xu7y2r6GCi+CP0WNVeYKU8+dzO6GLvA8p7HxO8BIlHecLkL5aBEykEA
         56VENiHplERLbhRrbaPl58gmZtTU1dT2cdxatGbh6TV76R6Ge/N4vRUPy6FxeBehbfrL
         2QK08UNH1lmQ8DDUzInqtZ72As6HizOQCxQlxqi/VSgD1baFbQ8RnP1a/fEIx4Jjl8jW
         GoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732644042; x=1733248842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5/naeg0dBBusGpVzdgpGynpZlX14LfA7bFms+Z0c58=;
        b=DYUKLLKrShtmB7yH8Rw+16x9KrEDUPyFZkQ5SX9+4ju56f37GfP7CeA+szzByVzoX7
         IlcohDw32c7vz9WChXC4xb19mez2CSqfU3R7VE+V7lcw7I18hAqkFB+T8uQQzm+ej5Xe
         pMn9raY2tLUaBlIWNba0b+uG8nK/AhuMkQEMxABZkwfpnvVa8RdekgUectKlrHbxGXM7
         2/9TwoCwFnnlRn1NcNmakiRgcmMyNEptiD+7PsBs61yWY4k/Kp/Hxh358gLqb5RzCypN
         lQfE7nV9ASd5FVH7C/PCpoQR6br1CUUfwxRff4EsaqZ0spd78y3cx9LI7rDD6OZCDIZ0
         ksUw==
X-Gm-Message-State: AOJu0YxTEenYrFAzHmG5AyvHOzmyod4mSaU76owip3or+wdkfgJicrVb
	9Z4G6wur6B6sfy+6ns7TYbeLToVejBQdVp/YZ67QGn7Gt1322osYaTPSdyUvpbLcBq0b1OS/xbo
	O
X-Gm-Gg: ASbGncudExFQygq/5BS02rot12xMw30UQl3JYV6BO4C8nBk2NwydoucBm5ZmqzBO2sl
	U9r/tDin+NW88X+KabGbWrxeR5Ic7fQA7SdoF056UZwQ3lX4O2YASbTaWni3Z8fLWs/qbMORT45
	9OYKmY9wo262BqF+z9sjqKFSvsrIY+JQ4+ghuDwo7Qt7zaZMjZeIMHJt+ZwvsIV4U6f1GWs/IEW
	OJAT/o+UY9dWazVGqWhJF6CvfnLdqWpzwH6pCt62YeN1TMrgYt29WPWxXsget8GXdlwSKfGfUsZ
	pzaRcS7NkVdji0i7t6lLjZfeLHH5ECw=
X-Google-Smtp-Source: AGHT+IH5asiocXUjqkjRuMfrU+xyn1KpDWilmJwbwnes7Fy6a89fflTnU+asGjTvkrM3CgALcug2+A==
X-Received: by 2002:a05:600c:3549:b0:434:a923:9321 with SMTP id 5b1f17b1804b1-434a9dbb626mr2253925e9.5.1732644041666;
        Tue, 26 Nov 2024 10:00:41 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad658esm14251104f8f.8.2024.11.26.10.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 10:00:41 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] python3-numpy: inherit pkgconfig
Date: Tue, 26 Nov 2024 13:00:36 -0500
Message-Id: <20241126180036.2500959-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 18:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207878

This was supposed to be added in oe-core commit fd656aaf7fbe
("python3-numpy: upgrade 1.26.4 -> 2.1.3"), but it somehow got missed in
the final version of that patch. Add it now to fix possible do_compile
errors.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-numpy_2.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
index da75dff1e0..0120bee439 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f492
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-inherit ptest python_mesonpy github-releases cython
+inherit pkgconfig ptest python_mesonpy github-releases cython
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
2.39.5


