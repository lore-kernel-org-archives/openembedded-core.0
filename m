Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DBAC77B6F
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 09:16:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8163.1681377375378316206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 02:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=liGS3NSs;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id g5so16887427wrb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681377374; x=1683969374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9k06+VfSpqfGkNMQfngh8+HwWzLk0mBUDU8ovHtWAo=;
        b=liGS3NSs1Fl24V8nNbyuOpmfhMdpF8lV+xY+nqAdEsK5baIYrpdanYsgxfbEI3G8+/
         WDRmOXjp0pJBhGOr31/lRCarxdYXDy9TAclLD7usO9KFDJQCY41LuUq+DReu8jlPaFo6
         afsfFfGbnc+Vtvweui4g12Ub67xOcz4ht1WcMS+Q31xhG3U5O7DrR6z+jf24H6PhIsIJ
         UYqJBneSKFg22aw6n8KuClpxnvyvCUuQ/UCrn5YPZzI1Ddy/osPGxAFfjPQjcW3GPrIF
         zSdetuG5X6/6ENY2a3m+OzfgwffU/TuLBydAIPR+QKSoHcHHiMv1yI5cGP+IR2oqvdiC
         QybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377374; x=1683969374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9k06+VfSpqfGkNMQfngh8+HwWzLk0mBUDU8ovHtWAo=;
        b=IIKlkfazr9J1cF06ttRKBOS7szLp74nxyvzZ7DdFPlItq2Z4FipW0de82IpAxQE9Dj
         zs0LSWpWye63cQWsXcC95aP1ojCD4UFwo61QTyrtvnfFS/6SeM+PhDyIfNYydEpDIyGP
         TTT4WxFouPeMzLoULl2/Fn1ViqXqxT6mUT0rI0bRqoAtEOMIIzUNT03r5jUIgaFgQde5
         etzdHJ1NSKXwr5CEgnOF7z98epQOD0jf2wKmZbJ+dlUl34hnxkvylgZ2qr/yd1Y6NppQ
         ZE+gsUstjNgMNhbbG4nc8uphijR6ntv05IlIvPyA1n0+0iKEBYnZ45EY170zSykMtZsZ
         bepw==
X-Gm-Message-State: AAQBX9e/kxzmFIpR9aOilRSuTlQu36IMq5z3k33H0eEtB+PJWCSf6IoU
	fbdQH/vyQAW6PX0O4dSrztxnDw==
X-Google-Smtp-Source: AKy350bDCGaLOIq9OQwtEEKwBIGl7E7MSTWx6/AmGNf5o2/F/dFHOBenwxelxS4XZnhkqbe1HR64EA==
X-Received: by 2002:a5d:55cf:0:b0:2f5:aadb:4642 with SMTP id i15-20020a5d55cf000000b002f5aadb4642mr901444wrw.41.1681377373908;
        Thu, 13 Apr 2023 02:16:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm851479wru.20.2023.04.13.02.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:16:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 5/5] python3-build: add missing run-time dependencies
Date: Thu, 13 Apr 2023 11:15:57 +0200
Message-Id: <20230413091557.10659-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413091557.10659-1-brgl@bgdev.pl>
References: <20230413091557.10659-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179966

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

python3-build has several run-time dependencies that are missing from
the recipe. This makes it impossible to use the module in self-hosted
images. Add missing RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-build_0.10.0.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-build_0.10.0.bb b/meta/recipes-devtools/python/python3-build_0.10.0.bb
index 770a32023d..b446fa391d 100644
--- a/meta/recipes-devtools/python/python3-build_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-build_0.10.0.bb
@@ -18,6 +18,15 @@ do_compile:prepend:class-native() {
     export PYTHONPATH="${S}/src"
 }
 
-RDEPENDS:${PN} += "python3-packaging python3-pyproject-hooks"
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-difflib \
+    python3-ensurepip \
+    python3-logging \
+    python3-packaging \
+    python3-pyproject-hooks \
+    python3-tomllib \
+    python3-venv \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.37.2


