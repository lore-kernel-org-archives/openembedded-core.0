Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D39C10F07
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:36:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.85709.1701959772350562197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 06:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=lrTKigY3;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c2718a768so10599155e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 06:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701959771; x=1702564571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67zKYmsG/lnBx+spYtLneoN2o4qPjs2GIW29SUpfLKY=;
        b=lrTKigY3KXf8wmEvEgDcApkuwI4885Nnd/M+rjSJVJJOeKA0jusxCaVcH58jP0aixX
         Q5Hzvxm+HIGoWf+NTOos8kouXrb6J9WJUJiPv6V/bFxgJQ/0zyws8eUkm6ujcEv7FXDw
         vifRhkHyFT3bbb0bLHMbfy/aiTGSD7pV5emvBVdWkznoe8xCd/du79v3D6RrKo9P3hj3
         uXdTgjQc7/IO0f/QsFmVgg5kmG7s24esqRmTRfQmVh/zYv8sQuw2dfoTK5TTTFmIKFf6
         V0XPKdffPWz5d3bDqmuBp+2Zaj4zHl1+GyhPXuK/tEFDvR4uX/sBLed1F4qKVPWYWVC8
         fo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959771; x=1702564571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67zKYmsG/lnBx+spYtLneoN2o4qPjs2GIW29SUpfLKY=;
        b=WDxsnUMklBnAK3WsrN6/LNiUx/VRv9kAvo/uH3+HAykv+QUiatqKK73HQlh6KdCKS7
         mpnxxaNJ1VMMDVGsZXDMkYSnHVy432aGnq5Mo/q8PyQxrNfCE7qkEnw38DeXXj/Ek+dQ
         Zg6OG2m5pLtsovvyqPLPLYvd03/hUERgEq4CO8raYKwTzPUUEccjFQqZCE5bouimA7zq
         0cmqRkR2dZifastOhVmQVTv1btRcQcIfIGVidPc+XNTKnzbexHe3AApKXu5uvfRx8big
         yjyLMc1fEXHsoKlJmbVfv24ZFOJ+me1UqLgAGo8uEii3IPh3kfNxKHoOQr6ywSaLVdDa
         73CQ==
X-Gm-Message-State: AOJu0Yy1i4iKEC/+zCNnXEk338xnq18K27+4e2me9vRVnMoYPo+s+wrG
	R+4g2SIurfV7ximfWqLVNMiHqj1BiQ0+FwD9fkcuUQ==
X-Google-Smtp-Source: AGHT+IFqaB6WEnHfxWW7RpHIAgGwOCp6aoJOU/T9JymKHB8qKvOculo2KIRZBHcWpNWRg/OqOdKnnA==
X-Received: by 2002:a05:600c:502c:b0:40c:256a:489e with SMTP id n44-20020a05600c502c00b0040c256a489emr1153659wmr.124.1701959770841;
        Thu, 07 Dec 2023 06:36:10 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040b47c53610sm2072570wmn.14.2023.12.07.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:36:10 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 1/4] qemurunner: remove unused import
Date: Thu,  7 Dec 2023 14:36:04 +0000
Message-Id: <27bcb91d7b8a70d8ebe85b91d89d44d99d729846.1701959631.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701959631.git.pidge@baylibre.com>
References: <cover.1701959631.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191959

From: Ross Burton <ross.burton@arm.com>

Removes unused logging import

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 29fe2719762..ee367078000 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -19,7 +19,6 @@ import errno
 import string
 import threading
 import codecs
-import logging
 import tempfile
 from collections import defaultdict
 import importlib
-- 
2.34.1


