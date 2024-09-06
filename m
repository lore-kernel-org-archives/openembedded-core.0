Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FCFE6FE32
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 16:58:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.4001.1725641926324176277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 09:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B2C1KGtA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bb72a5e0bso18591405e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725641924; x=1726246724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pRYKLclK1nKpM4U4gg2SPAdBZhcNrlU0uhT9P9Gp98Y=;
        b=B2C1KGtA4e7sOxkYR/uVwQXdP+vS3jvLttX99eZGwU7jpE8tkQwZnofE1nad4id2No
         t4xqE4jiI1q7EwlEU4jlMyggAbN+xuwaR6jJ2+lqqCCvkVvtzus4W9wl5CXIufjfUEb8
         VPpEiTSFZOb5JYIZOHntokzlfYkKInfkIeDcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725641924; x=1726246724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRYKLclK1nKpM4U4gg2SPAdBZhcNrlU0uhT9P9Gp98Y=;
        b=Xccq1ksg4mKYOifQYxxe6dGQc/wIWsyGc4zXeXpD5fPZFK7HcMOOg5toew4qqxmql4
         yCOU0F1oq6OTsXrHTtcm7T8apUvH6eElBnY8CKkFhAWoGV883IzXlG4+ndQ1E+kRpnfG
         J41zq+Up7eZ5xLvsyHtSMjuFZhQR2THIDJ1JO2eDkokP6VP8KOL7zhusdMLr28fL2zk3
         gXU3G3nP8Gfwf3J2TaDfLtaDyyQ0ldlmpLprU8JuCYf6klghqRci8wVSH/sBh/8EA2QQ
         f05c3k8PK+D2LrqjB8oDteosVqtEiSBSrnKw9WuUZz6JI63UjkDuAXshwL4IOOBAz/T7
         zn7Q==
X-Gm-Message-State: AOJu0YyJdpBEe/LxY/3WKnWA76A2k7mNvHwlIYrNHdTxJDuowSJVFH5e
	eBch/LhPy75f9GQkq2Vr7bbRhEEjP7iYTA6p+nwy2mCNlxFdddcrNwGE50csCmdyJy5C4Ckjz67
	Q
X-Google-Smtp-Source: AGHT+IGY4yq842iQlg7HvBWE0nZPWHLWeotJTdSy3DD5oiH81JaTLtYoasrIUUU/+p2k6b/tevoO8w==
X-Received: by 2002:adf:e5ce:0:b0:374:c712:507a with SMTP id ffacd0b85a97d-374c71250b6mr10604180f8f.32.1725641924294;
        Fri, 06 Sep 2024 09:58:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f86:8879:5d66:675c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789165066asm328911f8f.67.2024.09.06.09.58.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 09:58:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "python3-setuptools: upgrade 72.1.0 -> 72.2.0"
Date: Fri,  6 Sep 2024 17:58:42 +0100
Message-ID: <20240906165842.2327272-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 16:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204279

This reverts commit 8fccef7a731f44e5d27653e06becb54cf770e5e5.

The patch causes problems for systems using ccache. Revert until this is fixed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ython3-setuptools_72.2.0.bb => python3-setuptools_72.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_72.2.0.bb => python3-setuptools_72.1.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
index 63ea999960b..945d443affc 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e4042c13d3bcef91ac2ef9"
+SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
 
 DEPENDS += "python3"
 

