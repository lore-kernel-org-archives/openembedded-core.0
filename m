Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512CBC77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 14:55:10 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.52235.1684335301026590057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 07:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=l9TGUGzv;
 spf=pass (domain: baylibre.com, ip: 209.85.219.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-61b71b7803bso3907606d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335300; x=1686927300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6nkhZ6qFoHfStV1tczyOyw+I2/MVec4NYF65LJ0x4U=;
        b=l9TGUGzvo2n2UssVDaYzMhKUi3H92sia1an6Ch0JJlYlszyeH58fLDi51/FIRbrJ+P
         wvJgU6eXtVTfUhKFx7KUhTE14MmkQqRxLrJxVwBOEwLUQoMBIQHsU29haauYL6qrpsyL
         hxn6/faIVCgkaX/P4YvNQY0sAU8M0UoocticRiSASe4F80J8Ral0tXDNfmce/OELcE9k
         ktfCCLQ7osnIvS0lwCv+JQ2+R3kn24OHQybU/ithgB4WANqcinlboUvbK1cDCkrEyD5H
         KB08gTBfp7ZSd3MtHDfBiH9a7scoqiMMLyDj6rGbu6HAsLto6BoVBT2W7cMpXZTdP/we
         goOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684335300; x=1686927300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6nkhZ6qFoHfStV1tczyOyw+I2/MVec4NYF65LJ0x4U=;
        b=CBS0TEDs+MSx6JwBzh0fOoJQFmtenG+Y0rdW21XZtxo9yI6qvZp1giHf+PUcWlD9aL
         +fKrSfB62DmT6pJ7S4lRtcR5LFi6QCRY8raHrQVtuGKKS2klqgXrO2vM2u7ZTTL0qoyG
         62rfeUYnP+evxvjH6Aq0eC8QzLQHkjXo5tzBgG72h2ofNWMLM7b4Nwj7FDQKtbls0fFv
         kpai60g+owxIJkV9pSqHHaAPwYLy9tYb+SUcv+ZMp20rOCuaMiDTJrN6eUxI636LZyxp
         RGajxGYgDQe0Urdy5wKqCh3mb/vkJgdiaFPT29e5droghKLgZSw6Ksi3oi8KMejXaFSX
         iK4w==
X-Gm-Message-State: AC+VfDzA1FTCwL1qdYtDtUNtqIbIti7fi6hUbnqikHA1C84ALP6eApwl
	KvmU2kYHxgsKCx7lgnJStnN8yVtxzyfAlYH3vMaRQw==
X-Google-Smtp-Source: ACHHUZ4IsshhZVJ6K4vgNjr8d6cEHtrGQe94Vuy4DwulbZUC8f3gexg9G9YjdesYkr1AnIDqOOwxEA==
X-Received: by 2002:a05:6214:1c48:b0:5ef:8c79:fe99 with SMTP id if8-20020a0562141c4800b005ef8c79fe99mr77139389qvb.7.1684335299871;
        Wed, 17 May 2023 07:54:59 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id m5-20020a0c9d05000000b0061b5d3a61aesm6367985qvf.9.2023.05.17.07.54.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:54:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-trove-classifiers: upgrade 2023.4.29 -> 2023.5.2
Date: Wed, 17 May 2023 10:54:58 -0400
Message-Id: <20230517145458.89387-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 14:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181492

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...fiers_2023.4.29.bb => python3-trove-classifiers_2023.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.4.29.bb => python3-trove-classifiers_2023.5.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.5.2.bb
index 4bbcea5489..78057feb52 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8adcc06f1eb7c495f0bdceb698bd9c044b3e57b0d5767d99ec4b6b17c9bbe957"
+SRC_URI[sha256sum] = "c46d6e40a9581599b16c712e0164fec3764872a4085c673c07559787caedb867"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.40.1


