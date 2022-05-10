Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9030C433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:39:51 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.448.1652197185870079085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hZvWUInU;
 spf=pass (domain: linaro.org, ip: 209.85.167.41,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id p10so30025391lfa.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0qS/BSmvaBiwXz6fNVj44eRqFCiH/cWtbrBDdv51WM=;
        b=hZvWUInUZM2N5UhuKJHfaQXOXYA8mEjYPx5JA9aeXTbdHNAmDG4JsGiEENku4MGXDJ
         tgudYTCnDzrYuMZNsJ6t+J0D/HmZIYtsrZZn7AsVun1Zg9/A7w9sYGVg+DUgldZwQ948
         e81Z/i2F34iQ4zOy/ckQuopWUYdNHrmuCIzaEU2H2UUqkaqfzETjqaMir2V0zxfr1idI
         8jqt5Wn0BEBinvDGa6SIrRnBI+Rv9dES7JXJ/xiX1deHzJTsfU4r7KSkBBTECQMT6Bn/
         tKy/htKr9TOh9nfC1Mtib0zL02psU2/ofEt8VLgYiVQV/83nJIV5MMgkIJDKksmjjcS4
         AnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0qS/BSmvaBiwXz6fNVj44eRqFCiH/cWtbrBDdv51WM=;
        b=IoVY7sc8yUywwdJqogFW+eN2rAbRpUSBa1TAxxJg7TpQzmTLqQpFbL6zZ5Oln6xfMQ
         LfledRn9ttu4vPu7htNh5SMG9Xu9C2+kWKLkLJ4EtgAJUbwAea9AigYFBTp9uZx/cIX/
         YAZ/uOqg0jHsskdvfPoO3N/kXEDJUNIBwoWrBB1MujqQ/KpfTjbrThuRaaCqpRC4C8HC
         fa0s2JunYgNPi+X8S+87Q9FD49lIzPQ0LdkKG80RQK7qpd4Oin1MRE8FjrVyoNyMOfHJ
         ND+2QPUj6XYKZK/jE3/304FA5CMWFCAPl28dzi61EHX6Q00TlAjYZmNgBkzn495YkzLK
         XNVQ==
X-Gm-Message-State: AOAM530A5pG+j+3eAK8qknoiAp4m31gRhsvMW+gPf+Frn63bUMeA1Vft
	DmLgufXTWVWlrL9ykEFI+uTLRWsvGJykLA==
X-Google-Smtp-Source: 
 ABdhPJzKzCAJftQYAO8IsdzjUlROL/b8LIvetZW6GGKL9yWlJ4SJPvhBrB4JrC4g9LmDTQHntsxCyw==
X-Received: by 2002:a05:6512:2808:b0:473:9dc7:a7d2 with SMTP id
 cf8-20020a056512280800b004739dc7a7d2mr17273038lfb.112.1652197183608;
        Tue, 10 May 2022 08:39:43 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 x7-20020a2e9c87000000b0024f3d1daec5sm2183757lji.77.2022.05.10.08.39.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 08:39:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-firmware: upgrade 20220411 -> 20220509
Date: Tue, 10 May 2022 18:39:41 +0300
Message-Id: <20220510153942.2436401-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 15:39:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165460

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20220411.bb => linux-firmware_20220509.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 19b970c091ac..7d238e661899 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
+                    file://WHENCE;md5=d3eb82686904888f8bbbe8d865371404 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -208,7 +208,7 @@ SRC_URI = "\
   file://0001-Makefile-replace-mkdir-by-install.patch \
 "
 
-SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
+SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
 
 inherit allarch
 
-- 
2.30.2


