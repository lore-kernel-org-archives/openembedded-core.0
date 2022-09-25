Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FE5C54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.20283.1664133530171130041
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jemWxWV8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id c24so4459053plo.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=5e21PaDrN6EsqBI/Z5KixQKiV/rvHexCi2xFwqfxdXk=;
        b=jemWxWV8xCOQP8gC1ASbKExTzgilpdxcSLB2gyAp2fOqw0dwDEUggp7L7GNPspkzCq
         QIviZ8rWgA+/80BsrEG5+x4WG5ik5vmBLsMGAAuTgDdDYZQLa2u7cTgoey+FhSmi9ogU
         aeIwSZQCSNaDd8ZGvLMGqzSwNLG2FX7N6q2FdW2cP9/dLscbPonTwQhbZGrHgMVD4lHx
         Z7yu+m9152wsGNDWMgvRtAwaEab5FwPY0/D+UFHzQ3dYTPkdPqQ1raDBMl91olF1Ifs8
         6B+l235UNo6sB3yBCEB64c1KTnRR+Iogtz/ZsYTntO+Z3YdJl2l4AL/3sjkEsKzp04uN
         GMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5e21PaDrN6EsqBI/Z5KixQKiV/rvHexCi2xFwqfxdXk=;
        b=ltjwoyEHdJCjYe7Y+I60YLnBs7QBrTnYB6mIJXTAIXXO0aaITbBSEnqasQeMPNQE89
         pYfsLT6fdz3zcwBDdDO9psE2sTnabQ+zOldZFfL4SYj7x012BdMkBdtj87qssdhck7xn
         5Ou79+k25WvwWq/o/IlxHM7q6PMVkKiZk6g3KyW2kDn4HMTwlJqee/FvvBZG+79+gSIE
         iXRrd53C2zzprT3Vl4Of3zUMJ9J3Et+fyUAElgdpXydiofGDNbIoT42EdwvpesS1eONP
         KYT1EHHojr8lQl8S43uQr+Ngbu3bIPmyU49AQPgkGOd6CbcVD99yOvr3P7knyJLxYLOj
         SB7Q==
X-Gm-Message-State: ACrzQf3Yfmw+awbVe81n3xmTwQ+skBsuXzaQn9gh8z7gNlu9pGQoX7VB
	h2zQoeaOQfeQu2WQwpqBacN05bjNt7d05avf
X-Google-Smtp-Source: 
 AMsMyM69IJ0rlRu4E1gy56rI/boMjiyze72mB0yaQq5uPO+GSD6Fe4FXbS+A8xktHQDRoz+asocIuA==
X-Received: by 2002:a17:902:c410:b0:176:e093:1371 with SMTP id
 k16-20020a170902c41000b00176e0931371mr18986234plk.67.1664133529235;
        Sun, 25 Sep 2022 12:18:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/33] linux-libc-headers: switch from
 SRC_URI:append to SRC_URI +=
Date: Sun, 25 Sep 2022 09:17:37 -1000
Message-Id: 
 <e754bc0f2562a0fe83b89864a4a897233887d99d.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171040

From: Mikko Rapeli <mikko.rapeli@linaro.org>

The :append can not be removed via bbappends in custom layers so it's
better to use += appends when ever possible.

(From OE-Core rev: 6604795a3f7e53fd748d4103b521d8baf35cf7be)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab9f6d205f655cffa2c75d89ba0456fa0586480c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-libc-headers/linux-libc-headers_5.16.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
index c64629d094..d5039264c4 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
@@ -7,7 +7,7 @@ SRC_URI:append:libc-musl = "\
     file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
    "
 
-SRC_URI:append = "\
+SRC_URI += "\
     file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
 "
-- 
2.25.1


