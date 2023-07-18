Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599F9EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:43:40 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.11111.1689695014244266245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=J7JjY17J;
 spf=pass (domain: baylibre.com, ip: 209.85.217.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-444c5209861so1590457137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689695013; x=1690299813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Up2kB08hgHNzhd+w+owo6zLN5ofI65up/EFKJ/XGTY=;
        b=J7JjY17JLhgTklrXW/Z55kgAGM9RLC6EcpPX5cr85m1Trt/Nb9AyceG4jjhWNTR3/I
         2u7l25MAAOmSD4Rb5Itn8tZMerIOtjB8gPRHFc2pY6ZUFb3rYShyP8IvmFVmsATWzLJi
         BINF7cApLLHh8k796Fe3ZC3f/Ur+8VbeX0qqUoCn5/xRxQO4yRcdYMh8VvknY9NR3px3
         2jhx0aQl9rDK+adM214PAtgh0Gc37c3cZmH0mUTLbEorqNJ0H6ycgRpesy9SzwIEvvnH
         AIN4jSStG45H9NIjyJnkPgqfhI4Zk7sc7/9ygBn41jsJyZZQR7LPuTLo8A0t6vA4yqIK
         iA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689695013; x=1690299813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Up2kB08hgHNzhd+w+owo6zLN5ofI65up/EFKJ/XGTY=;
        b=K2Yrt/RsDlQXxD1ZQDFnfzKt9UMX33XPjJs40uqdXwPX4r8JE8kmXBO7F9IPUJYrg5
         fFVouTK51jLJDsgQsRi7C9G0osySzH11eL3UsfisjC4klclFRmROFJ3qkm2gvlAyk2j1
         8zi8xsFY5a/EPhxVb4mxnl3bMeOUR2+DXzJJM59PSiZnfZp2BjwhiKteigzsHte1pOXG
         s3mMaKcUMWmI0lc8/gwZIBJqCsOlQOl+eb2dA5G2RQatw3EYXUeDE3y/SyAdLRFAgHo3
         jEJGPnxY9GVBoE/PizN/0UQ/LUGo+q8yo5S8JawMmmR187VVoEjoROL4AotVvPbGlJ2h
         8LBA==
X-Gm-Message-State: ABy/qLZhuRiNcuzjCF9zZUjp4EvYxYlF84xr23GzcIzYv8PPsCkuDgvB
	YF/oX6m3e5NUoi8mqm3E0cmy7d/BuF9BnAEPgWY=
X-Google-Smtp-Source: APBJJlG1KrzCNiBzQJkhrfLdHFzvvUIff8ki/a8TuXhk4BHZcp0WmuuBh7HrjCXOQ7wUa6jw2LsXXA==
X-Received: by 2002:a05:6102:14f:b0:440:a8c8:f34 with SMTP id a15-20020a056102014f00b00440a8c80f34mr1603419vsr.3.1689695013113;
        Tue, 18 Jul 2023 08:43:33 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id p5-20020a0ce185000000b00631ecb1052esm799481qvl.74.2023.07.18.08.43.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 08:43:32 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] diffoscope: upgrade 243 -> 244
Date: Tue, 18 Jul 2023 11:43:31 -0400
Message-ID: <20230718154331.2836360-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 15:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184536

Changelog: https://diffoscope.org/news/diffoscope-244-released/

* Address compatibility with python-libarchive-c version 5.
  (Closes: reproducible-builds/diffoscope#344)
* Testsuite changes:
  - Mark that test_dex::test_javap_14_differences requires procyon.
  - Fix "test skipped" textual reason generation in the case of a required
    version being outside of the required range.
  - Temporarily mark some Android-related as XFAIL due to Debian bugs
    #1040941 and #1040916.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../diffoscope/{diffoscope_243.bb => diffoscope_244.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_243.bb => diffoscope_244.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_243.bb b/meta/recipes-support/diffoscope/diffoscope_244.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_243.bb
rename to meta/recipes-support/diffoscope/diffoscope_244.bb
index a73ad6da9e..7500eae132 100644
--- a/meta/recipes-support/diffoscope/diffoscope_243.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_244.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3ce7ff00d72ffd9c904d1d93a4a147208878f56e8f0286073533615689d840b1"
+SRC_URI[sha256sum] = "8bee8bbb144cdb7ddfa21886d5ce1822220139241c9a53def09b4adc3340db93"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.41.0


