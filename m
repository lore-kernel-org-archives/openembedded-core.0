Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5274BEB64D9
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 01:11:15 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.77.1689037872554663134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 18:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=J3X5u7UI;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-634ddd17647so35183726d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 18:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689037871; x=1691629871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlaCRbwJANI0wBuii2bdNft+vsH6WXiL9Jhhx+XTdsc=;
        b=J3X5u7UIezNokOjEX12cXuwg0kNakN8/doPTuTvwMbc2aLa/wXeRxq6ekAi43T/f+g
         wOo//zL+aTKeKMmHoURW+SItLazDliUMqh2mYDmc4/EFPzQIC04mnrgQHKkb50sSETZL
         tDdGPzITc8/vMA71+lRVKZCrb+uUcl2uXyBzUvCeK69oWUBe0lwsxz54OTaVPvTZjy2r
         U9veTi3iTKLtQkIIpmX7rrmhII4uUxhHaKB2HsVW2IHA8RzbIq5Cm6ekagvfOdSjWLET
         hWkdBQ9drvlYhrLRsDz9Z88USWBspuB4+xx00AIow3HVuPoTomz97UCeuxs/Vk/HeXzw
         qnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689037871; x=1691629871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlaCRbwJANI0wBuii2bdNft+vsH6WXiL9Jhhx+XTdsc=;
        b=ApRudX01TBautppmqHM4KeAwD/VRtF9ahdMQ9GqYe6kVUNt5s4/94J/yJsiwVCu6L+
         lh9M5k5ad9C0JxBGDuOQlJpCzOa6dupS0ckQ+MtvsiFUhJEWtSPZmyd3trXGsGlBRuhd
         ar/1Y7Ty36ONuKt84XMADuQZn0xgSpPhLc9r2toecZUQajVctqqx6v6hv5xdLk5CDkzE
         Lhm+bKehA4NVuyANdAIGmdjJJIaWEiHRHbmPqbLNeMuvP0p2O+XBEoTCDyP3OcOuym2o
         HuUt4CyqOwb4EYzz+Ts+8qpBb4rK7iFduJb9PUEHGDqr45K/ohkCu2SZ8p4ZrgM50ZB8
         +Liw==
X-Gm-Message-State: ABy/qLYP3QG2mphYuze5Wvf1sVrcqzLj+U9VOkwKykbnYNk3RfAcwr8n
	zTTeDDoipiOQVxhcS1zGmoUpVYIv9AB7v9hBtG4=
X-Google-Smtp-Source: APBJJlGXu5JZbEfviRjkFETmGwQp9ZEKR1VJsv4trfw8lOvRG67S+G51CJgxBtzgJ67XRTtQiPl88w==
X-Received: by 2002:a0c:e352:0:b0:62f:a95:4567 with SMTP id a18-20020a0ce352000000b0062f0a954567mr12600943qvm.11.1689037871540;
        Mon, 10 Jul 2023 18:11:11 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id h22-20020a05620a13f600b00767765561afsm427936qkl.106.2023.07.10.18.11.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 18:11:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] python3-dtschema: add python3-pylibfdt to RDEPENDS
Date: Mon, 10 Jul 2023 21:11:04 -0400
Message-ID: <20230711011104.2807078-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711011104.2807078-1-tgamblin@baylibre.com>
References: <20230711011104.2807078-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 01:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184111

Also reorder the RDEPENDS to be in alphabetical order.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
index 38ff2714f2..f9dd6b77c6 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
@@ -10,6 +10,12 @@ PYPI_PACKAGE = "dtschema"
 SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
 
 DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
+
+RDEPENDS:${PN} += "\
+        python3-jsonschema \
+        python3-pylibfdt \
+        python3-rfc3987 \
+        python3-ruamel-yaml \
+        "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


