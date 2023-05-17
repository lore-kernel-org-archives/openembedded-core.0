Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E77C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 13:36:00 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.49628.1684330557321040654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=QObuKdjp;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f38e1142d0so4970961cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684330556; x=1686922556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+SKmMj1BgUTGQ8OisDxy4aNkiPG2yONoh8vM2OLXvX8=;
        b=QObuKdjpKInJk2L2lx18PnLe42X7O0LkDrmmUAFvRQTWTqApcfXUW3krON94tiq0HL
         YcqZNmSLqls9s5SIvyVf7lfZ0/my4oNJ9bZBkXwlCb2MGtWAFuHfTDCFXMPjcOZ4xUK+
         2CN+fGelXCWkSyKRd87u4SY6T422/W1S5BvpkPd42ZdEHfyilgdv+IbqDnFlVrcj8/xh
         NGwSoGxuplCSBqeemVswcKTG/W3bCJ1QBVChPecz7t+4DZKLJk77M5m/lRcOQB1lmz+V
         ohfdstqDN53GQxqzBaY9lJHy0fju7OQ64roUl9QRna9bsYR94Wd5jAiXPz/umII8btIG
         jjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684330556; x=1686922556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SKmMj1BgUTGQ8OisDxy4aNkiPG2yONoh8vM2OLXvX8=;
        b=gy/Q0SMms22wuPXQfjrYPRGujXcfT3mn+E0kTeKd04kVldz3+1zPOB3jsslQcC2vbh
         dx65L+0qSeyRKfCrSg1vXTqklffosf//FmdsIiyRae9SbFwC85IYC1XZL1983ncqM/p9
         thIm2KHptOrqbAd8486DansKCSWmwUdschaTxs8O/pI4PYTwbNoZaygsnmqdidLmes/i
         IL8kJ2TaL2aErxipC4wT95KeDz/IJfYpEjKtmlMI8uaMzbUF1x7eur8qRdkuevhcRJ61
         pEP9JojPe3ac7+pLoCc21sNsCRa6e7EEfVvSAlmYVpTjbmqeVllguGvU/aq0SoVJCacL
         W9jw==
X-Gm-Message-State: AC+VfDxwn5/eUsQupHxJxMa+FrtO+FiRqet2GHGngnXivFEDLRzFktE9
	ykg3XBl+Eby5Zk9sG/39GKXF81rl22riyrImpf0zaA==
X-Google-Smtp-Source: ACHHUZ5dwL/IFAeC/QBMENA8wtkHTYUP3wx9x7vo5PTIsC6YTjrQAnGy9whatT8iQ9XhmhiLAinKog==
X-Received: by 2002:ac8:7d01:0:b0:3f3:9564:1148 with SMTP id g1-20020ac87d01000000b003f395641148mr45670809qtb.29.1684330556018;
        Wed, 17 May 2023 06:35:56 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id f13-20020ac87f0d000000b003f4a76d4981sm5497001qtk.66.2023.05.17.06.35.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 06:35:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-hatchling: upgrade 1.14.1 -> 1.17.0
Date: Wed, 17 May 2023 09:35:54 -0400
Message-Id: <20230517133554.38473-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 13:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181488

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-hatchling_1.14.1.bb => python3-hatchling_1.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.14.1.bb => python3-hatchling_1.17.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.17.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.14.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.17.0.bb
index a3d2b741b1..05a86f0efb 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.17.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "55fbc88cbd0d96c09c3e9392b51db513fd4cb4caf47615d65f935a5ef1756133"
+SRC_URI[sha256sum] = "b1244db3f45b4ef5a00106a46612da107cdfaf85f1580b8e1c059fefc98b0930"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.40.1


