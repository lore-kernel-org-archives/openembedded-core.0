Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A25CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 18:57:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.30902.1693940256860798754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 11:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MUvoFFs8;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99bcf2de59cso427922266b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693940255; x=1694545055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh7/WI9oGpphcAvX6QyG6XLCPvZuPqFkAr+ckVIRthI=;
        b=MUvoFFs86h1E+21Fxihim+h7Xbi1RKMSVF0MC9wMBuZbLb9XJ39VM+vSJa6Ry8+MRa
         b6D07xQOXTqzle044xPYDQTYJo960Hzp7njWg2/kDD6n9+9khqblRJpx8lrShCfjgJrw
         Nkop336yi+i4yZcHiBiUB5X/RWMkqukTTmd9ljObVDXkppTGaCY0lWfZHckuKQ+dBPrT
         o/NEK1z6OWrbRlBDHmoVjz65nliLx6RML5HWBTeB3nhrrOeFpBnDjpT106TU0JQIRQix
         dQRHwU/qaeafiQ7mvi75Oj8yL05FlviwOjq8Q1msAYMpHl/Lxy3oG044IW1PXa7Vy9TA
         rPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940255; x=1694545055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lh7/WI9oGpphcAvX6QyG6XLCPvZuPqFkAr+ckVIRthI=;
        b=LhH69xgXdCYRzFukOkd9qU7psoTOHsQbyys0a8cF/XiAnGxnbDs/+ZLW4lGE9BUcct
         sDCIbCLaF8+gSGwbvV5mQhrszyXDKJNTzZ+kQ1FViMrCAw1bJ9FbZP5B9+Kz0oGVyNqU
         USo0fVYytYjOxmfB70g+aDBrStjQvxoY21Gqb63D+KdkyFuKugXvUZ4A+F/xnmY0VagZ
         QduVD6KfeOUl6w3RAXnHtddQPKaytWJOIfblWqU3wJj37P23mbnpPE2U3lDgLkOE2Z3p
         oreuYJQvhlxQDU3cWQlKx4PfeVF0WhBubMvvRduCd72yZ2D94WS/coXLoWay9oSTK355
         0RJw==
X-Gm-Message-State: AOJu0YzV1ClPQNlpMmRt/1Ah3y8VDfhGSX0jebJcaomErgzKITKVYS0O
	RvcnR9cm+aMRi3OprFJo00ZmMLlDaDA=
X-Google-Smtp-Source: AGHT+IFREd1ROoqPpsT7IWPXpBQMGVHwyFUXFbSNJzp2w4nAxCvS3eRKlOtZY3imb68DgxyW7g/+jA==
X-Received: by 2002:a17:906:7389:b0:9a1:e7a8:4191 with SMTP id f9-20020a170906738900b009a1e7a84191mr512512ejl.70.1693940254876;
        Tue, 05 Sep 2023 11:57:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906869700b0099cc1ffd8f5sm7865829ejx.53.2023.09.05.11.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:57:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] webkitgtk: explicitly disable JIT for armv7* with softfp
Date: Tue,  5 Sep 2023 20:57:31 +0200
Message-ID: <20230905185731.1414044-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 18:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187251

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.40.5.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
index 39bb6a476f..1d85b3f591 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
@@ -100,9 +100,21 @@ EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
 
 # ARM JIT code does not build on ARMv4/5/6 anymore
+EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
-EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
+
+# And for armv7* don't enable it for softfp, because after:
+# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e76168a918
+# https://bugs.webkit.org/show_bug.cgi?id=242172
+# softfp armv7* fails because WEBASSEMBLY is left enabled by default and JIT gets
+# explicitly disabled causing:
+# http://errors.yoctoproject.org/Errors/Details/734587/
+# PR was sent upstream, but the end result is the same both JIT and WEBASSEMBLY disabled
+# https://github.com/WebKit/WebKit/pull/17447
+EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
 
 EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
-- 
2.42.0


