Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34247C4829A
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.13375.1707380936630993524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WVn+gbs7;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51165a488baso2018372e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380934; x=1707985734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQRVH+Ey23BXzentbuJ7HBJ/PdHcjLU5edldLKQa5r0=;
        b=WVn+gbs7mvkJMkrK2ThcppVBoi1yo5yHD3rixl5jhk2yoBaJavpt7cT2hngZzdlb6L
         tyd2Dsi3xtsmKpYmWeL7nAEfm/b0Mf4Jea4oDP1AQZ1wfaglKxOhWG0tsOKAZ2hMU6S+
         PXS4timbATmoxsjRfWlwHKwvRC/WZY1olfLupWIWolO//6sY4WHBEscAubf1hrffaXGZ
         XxTRBGiTNNREcjsWpVl68ws0Pczu/IBDsfTPkIZ8m6MOTMfwYLC1ooOK1ZbFRI+0iZW8
         YArHfGZ6RgxUX71TO9Mo1BLbNzcUdnsZA7tHB7SXvwcwxPFqyWxRc8QM+TqVWPBjH768
         MmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380934; x=1707985734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQRVH+Ey23BXzentbuJ7HBJ/PdHcjLU5edldLKQa5r0=;
        b=NnRvaLaI0CyPyNkThf9huRS6wN6JCa9yr1BCNG1dJy8VAfuDFuJguUxHg/Q2DhWYDr
         YDb8OB+RV1Iif6lp0bKTVqUnvcX1nLEOcZryrdwThHi6JI4pd1pzBw/ho6ecYl37Wcpz
         fSUHPN1y1bI9rDUDZAYXVm4ywhqwJo7VkzljJ53C93uhiEguGTs6QNm0NEzdlZvmphzf
         oq0S90Bvfg5qlZHdQXdeQtiMFFVeqzJRxdbDrKkl+2SazwQAP2F26D072yMyVBe0Yzfr
         sSbQ+rCy8nZQCUjTfhVyZXSFPralFxdkezEo06x7ivZMzenp9c52EnfknmBGf7QB6mcL
         5hLQ==
X-Gm-Message-State: AOJu0Ywq3/2xqgiDJJGPeNl5eDqQsgNVUHQlTh9eV4MsEeGF332Cdcob
	rQ7ZiY1f1xA4vscR6aPXrcF2+ZxqezIQRRgxhnx1dWXTlYIw7ia8v7MV5E8Y
X-Google-Smtp-Source: AGHT+IE8vrTcJONg/OQ/sjv3b6KuD59muLL0JWErI/Xn1u34lCosgl7ehA9n3O7EyJJ7ktSGm5O9nw==
X-Received: by 2002:a19:6515:0:b0:511:4a1f:ea74 with SMTP id z21-20020a196515000000b005114a1fea74mr5135741lfb.0.1707380934501;
        Thu, 08 Feb 2024 00:28:54 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:54 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/7] recipetool: cleanup imports
Date: Thu,  8 Feb 2024 09:27:27 +0100
Message-ID: <20240208082821.430510-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195106

- os is missing
- glob is not used

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/recipetool/create_buildsys.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 5015634476a..d4b194f5679 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -5,9 +5,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
 import re
 import logging
-import glob
 from recipetool.create import RecipeHandler, validate_pv
 
 logger = logging.getLogger('recipetool')
-- 
2.43.0


