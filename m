Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC2BEB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 21:48:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.14303.1687124907951842963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 14:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qNDu8Nuj;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b5465a79cdso6026465ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 14:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687124907; x=1689716907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYo2UJpl0RAJcYjOSlobER719x67rWp5x7HdnsjDZ2s=;
        b=qNDu8NujIByLemESa4SFHCBdc/uiQVImsq9x2n2AJO3TeOCGW4KwLeDtyi55nhEPrp
         0YGGJarBgXclB69wAD2U0lDRSvskGFJVKIBeq8K39rRMBTfVDlEVPEiY2ACjN6pI5KhY
         SR9qe66PnTbxNwiew2x+IddeCtAUlCCcigJ1/yus0hD64U2MId2IVmJLw5xZW30JgYVR
         RbenxEDYkX7BuNckeyr4jydX4z+qNaDXUUxHtaX4zz4OUuhiC3v+oOfYRziwEg7Eawe5
         AZsgNH+x9a+7FLgzvsVUndNdlcjoPEYq5OqPUemXyNhXLjbIK7s4o/y3QQPiFh/k3YqQ
         E3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687124907; x=1689716907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYo2UJpl0RAJcYjOSlobER719x67rWp5x7HdnsjDZ2s=;
        b=asadwi7JwkYdh/XuMN6HCWr3DY9LEWwYtZAQusywGY0dHhveTectBQteMaMStgK2aI
         sjreT3oKaZLRm33SEIpmnjxt4Av2uB8cU0jmUuRgYqh+9mu1wyBGtwd7HZ2KyAQ4TKK/
         YVckuXy3gO6c0u/7SHEkezSzQRAiFaZOqFL1ZihIsCd5+YMWFR8NVpM14ScP+Vh6XPp3
         Q761Ed2ovn/iR89G6H7XtCgNXVQeovHVgbdqMDWM0DSzW8aKpMlpqF3DXNS9j5uEt4V3
         xsxmkMN3+Ky5kOnRj/9/dv1uugKevS5O0Vqeq+b4aPijLb4dL8AA2pWJzWUlMkiqqfSl
         LcNQ==
X-Gm-Message-State: AC+VfDzFKByuvT5B9OYnmDq4ICPWMkl3eG9inw9cOEGWGxxd1l13tTKk
	LT+JepKrE+BMtre14lo9YUaCXQDfx7s=
X-Google-Smtp-Source: ACHHUZ4HVJyutwOYmiG17lxrGE/CHXpioZ7vSqLGZb4NzxwWRFE3ICJ9b1fVajUgKtjDpo/985WjHw==
X-Received: by 2002:a05:6a20:5497:b0:121:e574:977f with SMTP id i23-20020a056a20549700b00121e574977fmr288953pzk.8.1687124907070;
        Sun, 18 Jun 2023 14:48:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902b49400b001a980a23804sm19163414plr.4.2023.06.18.14.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 14:48:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-bcrypt: Use BFD linker when building tests
Date: Sun, 18 Jun 2023 14:48:24 -0700
Message-ID: <20230618214824.607605-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183065

Some of the tests use symbols from libpython3 e.g. PyBytes_FromStringAndSize
but does not add it to linker cmdline, its perhaps cargo which
should be fixed for that, this however is not something we can
fix in OE. So switch to using bfd linker explicitly when
building with ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
index b4f245530d4..d8377de96c1 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 HOMEPAGE = "https://pypi.org/project/bcrypt/"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
 SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
 
-- 
2.41.0


