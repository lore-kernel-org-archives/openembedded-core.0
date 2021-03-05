Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.12946.1614955745627270802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tyd92RAd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id g20so1536850plo.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M1x817hl2fforqikLloGwHcjvhkaON3SR4iJeqWgg3E=;
        b=tyd92RAd4sHxpAb6fS0KK2NRLI7pl1SCmrENfNRXypfzTnd+sR2drd+YY2d2/FOxsu
         dnTXZkqiFXuYWV4kQ3y2BO8L7BAvWzdKDrFrjxMPmqp1AO9jo/6tTfm6Yq+6UeRA4qoP
         FalY3YD75LQ/ZrNtuX/iwl5G6yROO2RvMVKhOlaXykwLyuh3eX902TI2a3KqcOSrG7pI
         B46fJoM9g7eGPfk2WD2Yk/f6EZlWkz4Mp4i8rXgKHpzEWJA3yEi7wP/lRqrqhprIIH5T
         LQ7SQw454vzgmVKkI/9sY3FbnHNHhiBt86L+crouJrIhMIXT8a4p7BtLYwDo/P2ju2kz
         3CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1x817hl2fforqikLloGwHcjvhkaON3SR4iJeqWgg3E=;
        b=OeJX1AUfR1DEu54jeO4EIC9vtv2tbMwtYM77zluDxbKpFQ5ask9hUsdeKdM67RZxbK
         zWaKDD16davynMtNaieoW2krVfCXUC5c3cYMPaUOPSwMXnCmp/j+uYmo0SpZ8qB05ps7
         +pOUfrSLEd/vLJflZtwQ5cICm3IVDayeKyZOSprm7ejyH9n3t8D9VrrIVDji1MPBvDwa
         VeMxZShhwZXZ9zumVyKapPDv5A0qdPXDbp00BUC+QmXbYB6CmpYcxazZq4HTHDOxQgn5
         d9ObAz3U8it2c2DN82uVeKrkAGCXkzQReWePPjaw3yP3E4bnREbFq8GVjmguVVp2uN9W
         hEuQ==
X-Gm-Message-State: AOAM530FOmy2WzYuFr/87Jh9MFNygOqESduV2usQ1n4mBt2MkqoI+Cfx
	Ka9/rIKV0LY0xmZMiLvigoSQFESokYItLLME
X-Google-Smtp-Source: ABdhPJy8JoOO2vnwG9idBSONkbVLsIUv8xVgrDqR/HJLvBuAD90l/OV46Xw51cJtJ/a7z1QAcEkvNA==
X-Received: by 2002:a17:90a:b007:: with SMTP id x7mr10210102pjq.27.1614955744707;
        Fri, 05 Mar 2021 06:49:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.49.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:49:04 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/27] cups: Fix reproducibility issues
Date: Fri,  5 Mar 2021 04:46:32 -1000
Message-Id: <66efd3fde270bf24f71a6aab1c4f8cf34a52c3d2.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

configure inspects the host's /etc/group for these configuration
options, fix this to the correct values by using configure options.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f16f9c727569414cd52862dcba18d8e423f4e961)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index f6d54c7cf2..12780cf702 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -52,6 +52,8 @@ EXTRA_OECONF = " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
+               --with-system-groups=lpadmin \
+               --with-cups-group=lp \
                DSOFLAGS='${LDFLAGS}' \
                "
 
-- 
2.25.1

