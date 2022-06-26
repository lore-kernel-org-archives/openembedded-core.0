Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147D9C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 11:43:11 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.29224.1656243785482287384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 04:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VaeP3BPS;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ay16so13528216ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cBbyXfDF11yi/ckU+wY6I+JcXktt9zOtRxdwcMdR1W8=;
        b=VaeP3BPSBB8Tr5yf1Jtkp0eRcnQZBgCl0GJ4qfUKqwMKSyVxaBL/TwaUKIFr1HSnxm
         FD/Z71hMox0m0UudxakaI7DFd5+Xms+pqac/+WKRQkLbyuxeGv3kx83+FzS9ks6ml6gK
         2Dg3Tr6SIKx55Pyqkue5inSEL8sQzatjLZX+ZIT9oP+l4ohERLnQ3JR3+qQB4hH7o0BA
         E06JFHjxfpzPBit41VDuirMosNv/l/PQ4B3z4TrH+a6iOf9wHKQdKuh2GXNxWW6vqnIn
         WTW702tfScmjdMx+KDWBZX3yv/uycof8MXdyRQ6XRjtjXw7vCkOGaX3u40cZPpcf2VY1
         GURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cBbyXfDF11yi/ckU+wY6I+JcXktt9zOtRxdwcMdR1W8=;
        b=v2cDaSUREpvI9f1q0WzdSvtvaQBwryMYwjLkzLBnCumSqBjCm+FoggmJGM6QahyFIu
         BwkdzqgjBWh4VZTaUGDumhAd9FwHRsqEEZyFEzdO1N0uD+MmR8Rjv9fSa1F7XerZorM4
         JW5ZhUYop7Zm4Mr3KrT6TEEJ5YGsQlyvY9DNZecXmKTvRwvYMtLCL07KWlXL+t5otCrt
         03WVTxTiC1U4Gl0PMPf8bhmhkbXM8Zt1e/YdMzNkQD0xa0G1/jyr9aScL1P5L8yzZkBg
         uJ5o8UNpK/OBm2cXArFs6FMzbfYKbJHq+KVcdfxozkYniNaCHCtNtc76rUP5Q+dX/x30
         73lw==
X-Gm-Message-State: AJIora8s6OlmL4UqOGAh0jRhvNSRg2ZEiDOUely28Fztn//t/RKQi/Nr
	+pNJquhAo5RMYN8vmbFOqoB41c7rbPo=
X-Google-Smtp-Source: 
 AGRyM1vQTl0RFFVlVXEI4frLKe5vWPLQAcfGOcPjM+tfZ7s9rPkH4QVMFqJz6kDdLxFcUdkqArTJBQ==
X-Received: by 2002:a17:907:72d2:b0:722:f9c8:c3fa with SMTP id
 du18-20020a17090772d200b00722f9c8c3famr7405880ejc.608.1656243783578;
        Sun, 26 Jun 2022 04:43:03 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 h18-20020a1709060f5200b006fe9e717143sm3698128ejj.94.2022.06.26.04.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 04:43:02 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH] python3-cryptography: Cleanup DEPENDS/RDEPENDS
Date: Sun, 26 Jun 2022 12:42:39 +0100
Message-Id: <20220626114238.6517-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 11:43:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167308

idna was removed in 3.1, asn1crypto in 2.8, six in 3.3.1; setuptools
never appears to have been a runtime requirement. With these removed the
recipe both builds and passes ptest:

  ===== 2824 passed, 52 skipped, 85319 subtests passed in 3932.89s (1:05:32) =====

Also drop redundant ${PYTHON_PN}-setuptools-rust-native DEPENDS as this
comes from python_setuptools3_rust.bbclass.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-devtools/python/python3-cryptography_37.0.2.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
index 470cf4388c2e..9ef3a61e9f2e 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
@@ -66,18 +66,11 @@ SRC_URI += "file://run-ptest \
 inherit pypi python_setuptools3_rust
 
 DEPENDS += " \
-    ${PYTHON_PN}-asn1crypto-native \
     ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-setuptools-rust-native \
-    ${PYTHON_PN}-six-native \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
 "
 
 RDEPENDS:${PN}:append:class-target = " \
-- 
2.35.1


