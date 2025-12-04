Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2854DD2446D
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:10:08 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50366.1764871805925879240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=c4I7vLw+;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4eda26a04bfso12762331cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871804; x=1765476604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpO0MHJV9TmykGP4kODzWj86T5Q3YuGW/hZu3QoUQWg=;
        b=c4I7vLw+XOgGPwGdk9lDlJzE2CU6JnFVh3TIhsy+vJVqDhuTId9bb75Or411l41KXb
         7NtMkFs0ta8M2VSvg5CKz2eAXePcA8GVJBgg/rDWPi1UqV5qo2EElBgNwcJKBHuCXtuL
         6FmIwCwfo6rGOPnC/96agcv5dDm+RcwOcrxP3NaBSZQTuYl53/4I5f4rjZ2JeqF2IdN2
         0LRV6XRsDb9K/axg/213m6+xTgJqJQjOD/jsasAXXtS8yQsFQwYAAQaQuHEqJfdX6efA
         uf8RQCOduUfdC8FRJ2jB/a9t3nPXga5McpD+gEX5wZxCrfKlDU1txJnq8R2HbKhB2OK6
         3eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871804; x=1765476604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpO0MHJV9TmykGP4kODzWj86T5Q3YuGW/hZu3QoUQWg=;
        b=ldI2UNTwnhUn9NHRZiLtoVSHZFD/OTcxQkK2G0gs8f9xWS18oEz0+QRpv5Uv6P8Ae1
         LjPaZQB8G/eJbhryZF+MXRIjgEPM5IBxv956S7FcxkE66d1D589YS2I6k1vxN8c4+YSI
         EJj7zsLk0dk/xV1zK/VztP1/MYhbgERYCzCpqo+sGBQmQWylkc0fLbEaSrASuJGB3kjl
         d0w+iHiwKDwiPcSrvSWFraM7JFo2hSt5ABJBqEGDdwjnBWRq4/zTuKSpoxyEwKiR8Lmi
         6Ya2ynE1Qr3RUZjxftQo/UxZdNtf0awBUWbzZfSOjnQIBE/H5McUIxXNiAA4gSeUQXhU
         tI/A==
X-Gm-Message-State: AOJu0YzKyEuF+H0uqsGKv15dSE8goHnOGBbIFi+N3/4wzvZUA4iahIiZ
	Ohyb3py7LPqqJkL9P0mWYOrIbV2jZ56DXd/J2/4hqPeVwxlfr555ry6rd4pM2x3c6ozUVZ61U/o
	MFWqdl1k=
X-Gm-Gg: ASbGncv7GnRDZFKWlJJrRpWQuz2FCWRr0R7tTfhCrr0ao+qAgyWfgZG622xxCx4tI1d
	NyjLNV1f94t0X5kK6DJn6J//kWQ0lztQat0hT2IR/KxoslCn7st7h1fcHy2lmZ6JoqDo5JePp7+
	p0Ekcdt82h4RRGpo0PzK0lR9f/xcGeXeZCH0z/KwSCzbpDLO74BQQanCRJtEGlP3XGJWz7NLHfK
	vXRAfiqFiuZq0FLyVeSgrCJISu8F4EGO9j6qJ+AVVWiKe4a87YXP1MT2dJAEgbbXzqW3DFlSKt1
	dJM7VR1oRmx5z7e1v5s63WEYDyT26MxGqD+4MDme93DfksKpYiZt4NXKpiWs7KcoDxcvGHaq9LW
	QMQlp+ErsUAbptECBCG3X5MmBy/ECR47nukzAN6ASDBjH3vzuueXlzglidwbN6PGTcMc7QWbX6t
	Pixgg4np7AkyR/Y+Y=
X-Google-Smtp-Source: AGHT+IF83hirMmVmc7BXyao/rjk68NJGh5FvtDquenHoZcuuChFHmnvhp9mEVfjbbTOvRdI2dPNOLg==
X-Received: by 2002:a05:622a:283:b0:4eb:7574:65f6 with SMTP id d75a77b69052e-4f0175064cemr98890461cf.7.1764871804307;
        Thu, 04 Dec 2025 10:10:04 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027d58edbsm12317571cf.34.2025.12.04.10.10.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:10:03 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] python3-jsonpointer: add python3-misc to RDEPENDS
Date: Thu,  4 Dec 2025 13:09:45 -0500
Message-ID: <20251204180945.3112334-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204180945.3112334-1-tgamblin@baylibre.com>
References: <20251204180945.3112334-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227321

jsonpointer's ptest uses unittest, which depends on the internal
_py_warnings module. This is part of the python3-misc split. However,
there is also a warning displayed when simply trying to import
jsonpointer in an interpreter running on the target:

|warning: can't use pyrepl: No module named '_py_warnings'

Add python3-misc to the package RDEPENDS to deal with both issues.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
index 0a23dc3100..0fc2a6301d 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
@@ -17,6 +17,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN} += " \
     python3-json \
+    python3-misc \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.52.0


